package graph_builder

import org.apache.jena.rdf.model.*
import org.apache.jena.vocabulary.{OWL, RDF, RDFS}
import java.io.*

trait Graph:
  def withClass(classIdentifier: String): Graph
  def withSubclass(subclassIdentifier: String, superclassIdentifier: String): Graph
  def withObjectProperty(propertyIdentifier: String, domains: List[String], ranges: List[String]): Graph

  def withDataProperty(propertyIdentifier: String, domains: List[String], datatypes: List[Resource]): Graph

  def withIndividual(individualIdentifier: String,
                     classIdentifier: String,
                     objProperties: Map[String, String],
                     dataProperties: Map[String, String]
                    ): Graph
  def dump(format: String, filename: String): Unit

object Graph:
  def apply(baseUri: String): Graph = GraphImpl(baseUri)
  private class GraphImpl(baseUri: String) extends Graph:
    private val model: Model = ModelFactory.createDefaultModel()
    private val baseResource: Resource = model.createResource(baseUri)

    override def withClass(classIdentifier: String): Graph =
      val classResource: Resource = model.createResource(s"$baseUri/$classIdentifier")
      classResource.addProperty(RDF.`type`, OWL.Class)
      this

    override def withSubclass(subclassIdentifier: String, superclassIdentifier: String): Graph =
      val subclassResource: Resource = model.createResource(s"$baseUri/$subclassIdentifier")
      val superclassResource: Resource = model.createResource(s"$baseUri/$superclassIdentifier")
      subclassResource.addProperty(RDF.`type`, OWL.Class)
      subclassResource.addProperty(RDFS.subClassOf, superclassResource)
      this

    override def withObjectProperty(propertyIdentifier: String, domains: List[String], ranges: List[String]): Graph =
      val propertyResource: Resource = model.createResource(s"$baseUri/$propertyIdentifier")
      propertyResource.addProperty(RDF.`type`, OWL.ObjectProperty)
      domains.foreach { domain =>
        val domainResource: Resource = model.createResource(s"$baseUri/$domain")
        propertyResource.addProperty(RDFS.domain, domainResource)
      }
      ranges.foreach { range =>
        val rangeResource: Resource = model.createResource(s"$baseUri/$range")
        propertyResource.addProperty(RDFS.range, rangeResource)
      }
      this

    override def withDataProperty(propertyIdentifier: String, domains: List[String], datatypes: List[Resource]): Graph =
      val propertyResource: Resource = model.createResource(s"$baseUri/$propertyIdentifier")
      propertyResource.addProperty(RDF.`type`, OWL.DatatypeProperty)
      domains.foreach { domain =>
        val domainResource: Resource = model.createResource(s"$baseUri/$domain")
        propertyResource.addProperty(RDFS.domain, domainResource)
      }
      datatypes.foreach { datatype =>
        propertyResource.addProperty(RDFS.range, datatype)
      }
      this

    override def withIndividual(individualIdentifier: String,
                       classIdentifier: String,
                       objProperties: Map[String, String],
                       dataProperties: Map[String, String]): Graph =
      val individualResource: Resource = model.createResource(s"$baseUri/$individualIdentifier")
      val classResource: Resource = model.createResource(s"$baseUri/$classIdentifier")
      individualResource.addProperty(RDF.`type`, classResource)
      objProperties.foreach { case (property, value) =>
        val propertyResource: Property = model.createProperty(s"$baseUri/$property")
        val valueResource: Resource = model.createResource(s"$baseUri/$value")
        individualResource.addProperty(propertyResource, valueResource)
      }
      dataProperties.foreach { case (property, value) =>
        val propertyResource: Property = model.createProperty(s"$baseUri/$property")
        individualResource.addProperty(propertyResource, value)
      }
      this

    override def dump(format: String, filename: String): Unit =
      val outputStream: OutputStream = new FileOutputStream(s"$filename")
      model.write(outputStream, format)
