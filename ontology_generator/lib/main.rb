# frozen_string_literal: true
require 'rdf'
require 'rdf/rdfxml'
require_relative 'ontology_definitions'
require_relative 'ontology_instances'
include RDF

ontology_file = "carpedia.owl"
RDF::Writer.open(ontology_file) { |writer| writer << Graph }
