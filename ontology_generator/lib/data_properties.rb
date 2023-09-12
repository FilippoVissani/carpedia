# frozen_string_literal: true
require 'rdf'
require 'rdf/rdfxml'
require 'rdf/turtle'
require_relative 'graph_builder'
require_relative 'carpedia_graph'
include RDF
include GraphBuilder

CarpediaGraph
  .with_data_property('hasKilometers', ['Car'], [XSD.integer])
  .with_data_property('hasPrice', ['Car'], [XSD.integer])
  .with_data_property('hasYearOfProduction', ['Car'], [XSD.date])
  .with_data_property('hasPowerCV', ['Engine'], [XSD.integer])
  .with_data_property('hasNumberOfDoors', ['Model'], [XSD.integer])
  .with_data_property('hasNumberOfSeats', ['Model'], [XSD.integer])
  .with_data_property('hasColor', ['Body'], [XSD.hexBinary])