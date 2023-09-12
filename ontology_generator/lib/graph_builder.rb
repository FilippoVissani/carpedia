# frozen_string_literal: true
require 'rdf'
include RDF

module GraphBuilder
  class Graph
    attr_reader :graph

    def initialize(base_uri)
      @base_uri = base_uri
      @graph = RDF::Graph.new
    end

    # Create a new ontology graph.
    #
    # @param base_uri [String] The base URI for the ontology.
    # @return [Graph] The new ontology graph instance.
    def self.create(base_uri)
      new(base_uri)
    end

    # Generate a URI based on the base URI and an identifier.
    #
    # @param identifier [String] The identifier to append to the base URI.
    # @return [RDF::URI] The generated URI.
    def uri(identifier)
      RDF::URI.new("#{@base_uri}/#{identifier}")
    end

    # Define a class in the ontology.
    #
    # @param class_identifier [String] The identifier for the class.
    # @return [Graph] The updated ontology graph instance.
    def with_class(class_identifier)
      @graph << [uri(class_identifier), RDF.type, RDF::OWL.Class]
      self
    end

    # Define a subclass in the ontology.
    #
    # @param subclass_identifier [String] The identifier for the subclass.
    # @param superclass_identifier [String] The identifier for the superclass.
    # @return [Graph] The updated ontology graph instance.
    def with_subclass(subclass_identifier, superclass_identifier)
      @graph << [uri(subclass_identifier), RDF.type, RDF::OWL.Class]
      @graph << [uri(subclass_identifier), RDF::RDFS.subClassOf, uri(superclass_identifier)]
      self
    end

    # Define an object property in the ontology.
    #
    # @param property_identifier [String] The identifier for the object property.
    # @param domains [Array<String>] The list of domain class identifiers.
    # @param ranges [Array<String>] The list of range class identifiers.
    # @return [Graph] The updated ontology graph instance.
    def with_object_property(property_identifier, domains = {}, ranges = {})
      @graph << [uri(property_identifier), RDF.type, RDF::OWL.ObjectProperty]

      Array(domains).each do |domain|
        @graph << [uri(property_identifier), RDF::RDFS.domain, uri(domain)]
      end

      Array(ranges).each do |range|
        @graph << [uri(property_identifier), RDF::RDFS.range, uri(range)]
      end

      self
    end

    # Define a data property in the ontology.
    #
    # @param property_identifier [String] The identifier for the data property.
    # @param domains [Array<String>] The list of domain class identifiers.
    # @param datatypes [Array<Any>] The list of range data types.
    # @return [Graph] The updated ontology graph instance.
    def with_data_property(property_identifier, domains = {}, datatypes = {})
      @graph << [uri(property_identifier), RDF.type, RDF::OWL.DatatypeProperty]

      Array(domains).each do |domain|
        @graph << [uri(property_identifier), RDF::RDFS.domain, uri(domain)]
      end

      Array(datatypes).each do |datatype|
        @graph << [uri(property_identifier), RDF::RDFS.range, datatype]
      end

      self
    end

    # Define an individual in the ontology.
    #
    # @param individual_identifier [String] The identifier for the individual.
    # @param class_identifier [String] The identifier for the class to which the individual belongs.
    # @param obj_properties [Hash] The list of obj_properties for the individual.
    # @return [Graph] The updated ontology graph instance.
    def with_individual(individual_identifier, class_identifier, obj_properties = {}, data_properties = {})
      @graph << [uri(individual_identifier), RDF.type, uri(class_identifier)]

      obj_properties.each do |property, value|
        @graph << [uri(individual_identifier), uri(property), uri(value)]
      end

      data_properties.each do |property, value|
        @graph << [uri(individual_identifier), uri(property), value]
      end
      self
    end

    # Dump the ontology graph to a specified format and file.
    #
    # @param format [Symbol] The format to use (:owl, :ttl, :nt, :rdfxml).
    # @param filename [String] The name of the output file.
    def dump(format = :ttl, filename = 'ontology')
      raise 'Invalid format. Use :owl, :ttl, :nt, or :rdfxml.' unless [:owl, :ttl, :nt, :rdfxml].include?(format)

      File.open("#{filename}.#{format}", 'w') do |file|
        file.write(@graph.dump(format))
      end
    end
  end
end
