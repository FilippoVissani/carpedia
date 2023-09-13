import graph_builder.Graph
import graph_builder.Utils.Individual

@main
def main(): Unit = {
  val graph = Graph("http://example.org/ontology")
  graph.withIndividual(Individual("JohnDoe", "Person", Map("hasFriend" -> "Alice"), Map("hasAge" -> "30")))
  graph.dump("RDF/XML-ABBREV", "ontology")
}