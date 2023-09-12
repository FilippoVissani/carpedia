# frozen_string_literal: true
require 'rdf'
require 'rdf/rdfxml'
require 'rdf/turtle'
require_relative 'graph_builder'
require_relative 'carpedia_graph'
require_relative 'classes'
require_relative 'object_properties'
require_relative 'data_properties'
require_relative 'individuals'
include RDF
include GraphBuilder

ontology_name = 'carpedia'
CarpediaGraph.dump(:rdfxml, ontology_name)
CarpediaGraph.dump(:owl, ontology_name)
CarpediaGraph.dump(:ttl, ontology_name)
