require 'rdf'

module OntologyGraphBuilder
  class Graph
    attr_reader :graph

    def initialize(base_uri)
      @base_uri = base_uri
      @graph = RDF::Graph.new
    end

    def self.create(base_uri)
      new(base_uri)
    end

    def uri(identifier)
      RDF::URI.new("#{@base_uri}/#{identifier}")
    end

    def with_class(class_identifier)
      @graph << [uri(class_identifier), RDF.type, RDF::OWL.Class]
      self
    end

    def with_subclass(subclass_identifier, superclass_identifier)
      @graph << [uri(subclass_identifier), RDF.type, RDF::OWL.Class]
      @graph << [uri(subclass_identifier), RDF::RDFS.subClassOf, uri(superclass_identifier)]
      self
    end

    def with_object_property(property_identifier)
      @graph << [uri(property_identifier), RDF.type, RDF::OWL.ObjectProperty]
      self
    end

    def with_individual(individual_identifier, class_identifier)
      @graph << [uri(individual_identifier), RDF.type, uri(class_identifier)]
      self
    end

    def dump(format = :ttl, filename = 'ontology')
      raise 'Invalid format. Use :owl, :ttl, :nt, or :rdfxml.' unless [:owl, :ttl, :nt, :rdfxml].include?(format)

      File.open("#{filename}.#{format}", 'w') do |file|
        file.write(@graph.dump(format))
      end
    end
  end
end
