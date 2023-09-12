# frozen_string_literal: true
require 'rdf'
require 'rdf/rdfxml'
require 'rdf/turtle'
require_relative 'graph_builder'
require_relative 'carpedia_graph'
include RDF
include GraphBuilder

CarpediaGraph
    # OBJECT PROPERTIES
    .with_object_property('hasBody', ['Car'], ['Body'])
    .with_object_property('hasEuroEmissionClass', ['Car'], ['EuroEmissionClass'])
    .with_object_property('hasFuel', ['Car'], ['Fuel'])
    .with_object_property('hasManufacturer', ['Model'], ['Manufacturer'])
    .with_object_property('hasModel', ['Car'], ['Model'])
    .with_object_property('hasOptionalEquipment', ['Car'], ['OptionalEquipment'])
    .with_object_property('hasVariant', ['Model'], ['Variant'])
    .with_object_property('hasEngine', ['Car'], ['Engine'])
    