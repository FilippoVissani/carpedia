import graph_builder.Graph

@main
def main(): Unit = {
  val graph = Graph("http://example.org/ontology")
  graph.withIndividual(
    "JohnDoe",
    "Person",
    Map("hasFriend" -> "Alice"),
    Map("hasAge" -> "30")
  )
  graph.dump("RDF/XML-ABBREV", "ontology")
}