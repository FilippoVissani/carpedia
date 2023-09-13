# frozen_string_literal: true
require 'rdf'
require 'rdf/rdfxml'
require 'rdf/turtle'
require_relative 'graph_builder'
require_relative 'carpedia_graph'
include RDF
include GraphBuilder

CarpediaGraph
    .with_class('Car')
    .with_class('Body')
    .with_class('EuroEmissionClass')
    .with_class('Fuel')
    .with_class('Manufacturer')
    .with_class('Model')
    .with_class('Engine')
