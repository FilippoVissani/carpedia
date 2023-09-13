package graph_builder

import org.apache.jena.rdf.model.Resource

object Utils:
  case class Hierarchy(subclass: String, superclass: String)
  case class ObjectProperty(identifier: String, domains: List[String], ranges: List[String])
  case class DataProperty(identifier: String, domains: List[String], dataTypes: List[Resource])
  case class Individual(identifier: String,
                        classIdentifier: String,
                        objProperties: Map[String, String],
                        dataProperties: Map[String, String])
