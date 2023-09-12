# frozen_string_literal: true
require 'rdf'
require 'rdf/rdfxml'
require 'rdf/turtle'
require_relative 'graph_builder'
include RDF
include GraphBuilder

CarpediaGraph = GraphBuilder::Graph.create('http://www.semanticweb.org/filippo/ontologies/2023/8/carpedia')
