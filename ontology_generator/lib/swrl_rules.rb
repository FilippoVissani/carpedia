# frozen_string_literal: true
require 'rdf'
require_relative 'ontology_definitions'

swrlRule = RDF::URI.new('http://example.org/swrlRule')

graph << [swrlRule, RDF.type, RDF::OWL['Annotation']]
graph << [swrlRule, RDF.value, "Car(?x) ∧ hasManufacturer(?x, ?y) → Manufacturer(?y)"]
