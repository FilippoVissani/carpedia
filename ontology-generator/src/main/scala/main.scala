import graph_builder.GraphBuilder.Graph

@main
def main(): Unit = {
  val graph = new Graph("http://example.org/ontology")
  graph.withIndividual(
    "JohnDoe",
    "Person",
    Map("hasFriend" -> "Alice"),
    Map("hasAge" -> "30")
  )
  graph.dump("RDF/XML-ABBREV")
}