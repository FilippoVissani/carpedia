package graph_builder

import graph_builder.Utils.{DataProperty, Hierarchy, Individual, ObjectProperty}
import org.apache.jena.rdf.model._
import org.apache.jena.vocabulary.{OWL, RDF, RDFS}
import java.io._

trait Graph:
  def withClass(classIdentifier: String): Graph

  def withHierarchy(hierarchy: Hierarchy): Graph

  def withObjectProperty(objectProperty: ObjectProperty): Graph

  def withDataProperty(dataProperty: DataProperty): Graph

  def withIndividual(individual: Individual): Graph

  def dump(format: String, filename: String): Unit

object Graph:
  def apply(baseUri: String): Graph = GraphImpl(baseUri)
  private class GraphImpl(baseUri: String) extends Graph:
    private val model: Model = ModelFactory.createDefaultModel()
    private val baseResource: Resource = model.createResource(baseUri)

    private def createResource(identifier: String): Resource =
      model.createResource(s"$baseUri/$identifier")

    private def createProperty(identifier: String): Property =
      model.createProperty(s"$baseUri/$identifier")

    override def withClass(classIdentifier: String): Graph =
      createResource(classIdentifier).addProperty(RDF.`type`, OWL.Class)
      this

    override def withHierarchy(hierarchy: Hierarchy): Graph =
      val subclassResource = createResource(hierarchy.subclass)
      val superclassResource = createResource(hierarchy.superclass)
      subclassResource.addProperty(RDF.`type`, OWL.Class)
      subclassResource.addProperty(RDFS.subClassOf, superclassResource)
      this

    override def withObjectProperty(objectProperty: ObjectProperty): Graph =
      val propertyResource = createResource(objectProperty.identifier)
      propertyResource.addProperty(RDF.`type`, OWL.ObjectProperty)
      objectProperty.domains.foreach(domain => propertyResource.addProperty(RDFS.domain, createResource(domain)))
      objectProperty.ranges.foreach(range => propertyResource.addProperty(RDFS.range, createResource(range)))
      this

    override def withDataProperty(dataProperty: DataProperty): Graph =
      val propertyResource = createResource(dataProperty.identifier)
      propertyResource.addProperty(RDF.`type`, OWL.DatatypeProperty)
      dataProperty.domains.foreach(domain => propertyResource.addProperty(RDFS.domain, createResource(domain)))
      dataProperty.dataTypes.foreach(datatype => propertyResource.addProperty(RDFS.range, datatype))
      this

    override def withIndividual(individual: Individual): Graph =
      val individualResource = createResource(individual.identifier)
      val classResource = createResource(individual.classIdentifier)
      individualResource.addProperty(RDF.`type`, classResource)
      individual.objProperties.foreach { case (property, value) =>
        individualResource.addProperty(createProperty(property), createResource(value))
      }
      individual.dataProperties.foreach { case (property, value) =>
        individualResource.addProperty(createProperty(property), value)
      }
      this

    override def dump(format: String, filename: String): Unit =
      val outputStream: OutputStream = new FileOutputStream(filename)
      model.write(outputStream, format)