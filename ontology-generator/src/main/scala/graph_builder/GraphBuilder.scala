package graph_builder

import org.apache.jena.rdf.model.*
import org.apache.jena.vocabulary.{OWL, RDF, RDFS}

import java.io.*

object GraphBuilder {
  class Graph(baseUri: String) {
    private val model: Model = ModelFactory.createDefaultModel()
    private val baseResource: Resource = model.createResource(baseUri)

    // Define a class in the ontology
    def withClass(classIdentifier: String): this.type = {
      val classResource: Resource = model.createResource(s"$baseUri/$classIdentifier")
      classResource.addProperty(RDF.`type`, OWL.Class)
      this
    }

    // Define a subclass in the ontology
    def withSubclass(subclassIdentifier: String, superclassIdentifier: String): this.type = {
      val subclassResource: Resource = model.createResource(s"$baseUri/$subclassIdentifier")
      val superclassResource: Resource = model.createResource(s"$baseUri/$superclassIdentifier")
      subclassResource.addProperty(RDF.`type`, OWL.Class)
      subclassResource.addProperty(RDFS.subClassOf, superclassResource)
      this
    }

    // Define an object property in the ontology
    def withObjectProperty(propertyIdentifier: String, domains: List[String], ranges: List[String]): this.type = {
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
    }

    // Define a data property in the ontology
    def withDataProperty(propertyIdentifier: String, domains: List[String], datatypes: List[Resource]): this.type = {
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
    }

    // Define an individual in the ontology
    def withIndividual(
                        individualIdentifier: String,
                        classIdentifier: String,
                        objProperties: Map[String, String],
                        dataProperties: Map[String, String]
                      ): this.type = {
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
    }

    // Dump the ontology graph to a specified format and file
    def dump(format: String, filename: String = "ontology"): Unit = {
      val outputStream: OutputStream = new FileOutputStream(s"$filename")
      model.write(outputStream, format)
    }
  }
}