# frozen_string_literal: true
require 'rdf'
require 'rdf/rdfxml'
require 'rdf/turtle'
require_relative 'graph_builder'
include RDF
include GraphBuilder

graph = GraphBuilder::Graph.create('http://example.com/')

graph
  .with_class('Car')
  # BODY CLASS HIERARCHY
  .with_class('Body')
  .with_subclass('Compact', 'Body')
  .with_subclass('Convertible', 'Body')
  .with_subclass('Coupe', 'Body')
  .with_subclass('Offroad', 'Body')
  .with_subclass('Pickup', 'Body')
  .with_subclass('Sedans', 'Body')
  .with_subclass('StationWagon', 'Body')
  .with_subclass('SUV', 'Body')
  .with_subclass('Transporter', 'Body')
  .with_subclass('Van', 'Body')
  # EURO EMISSION CLASS HIERARCHY
  .with_class('EuroEmissionClass')
  .with_individual('Euro1', 'EuroEmissionClass')
  .with_individual('Euro2', 'EuroEmissionClass')
  .with_individual('Euro3', 'EuroEmissionClass')
  .with_individual('Euro4', 'EuroEmissionClass')
  .with_individual('Euro5', 'EuroEmissionClass')
  .with_individual('Euro6', 'EuroEmissionClass')
  .with_individual('Euro6c', 'EuroEmissionClass')
  .with_individual('Euro6d', 'EuroEmissionClass')
  .with_individual('Euro6dTemp', 'EuroEmissionClass')
  # FUEL CLASS HIERARCHY
  .with_class('Fuel')
  .with_subclass('Diesel', 'Fuel')
  .with_subclass('Gasoline', 'Fuel')
  .with_subclass('LPG', 'Fuel')
  .with_subclass('CNG', 'Fuel')
  .with_subclass('Ethanol', 'Fuel')
  .with_subclass('Electric', 'Fuel')
  .with_subclass('Hybrid', 'Fuel')
  .with_subclass('ElectricDiesel', 'Hybrid')
  .with_subclass('ElectricGasoline', 'Hybrid')
  # MANUFACTURER CLASS HIERARCHY
  .with_class('Manufacturer')
  # MODEL CLASS HIERARCHY
  .with_class('Model')
  # VARIANT CLASS HIERARCHY
  .with_class('Variant')
  # OPTIONAL EQUIPMENT CLASS HIERARCHY
  .with_class('OptionalEquipment')
  .with_subclass('AirConditioning', 'OptionalEquipment')
  .with_subclass('AlloyWheels', 'OptionalEquipment')
  .with_subclass('AuxiliaryHeating', 'OptionalEquipment')
  .with_subclass('CatalyticConverter', 'OptionalEquipment')
  .with_subclass('CentralLocking', 'OptionalEquipment')
  .with_subclass('CruiseControl', 'OptionalEquipment')
  .with_subclass('ElectricSideMirror', 'OptionalEquipment')
  .with_subclass('ElectricWindows', 'OptionalEquipment')
  .with_subclass('HeatedSeats', 'OptionalEquipment')
  .with_subclass('HandsFreeEquipment', 'OptionalEquipment')
  .with_subclass('NavigationSystem', 'OptionalEquipment')
  .with_subclass('PanoramicRoof', 'OptionalEquipment')
  .with_subclass('ParkingSensors', 'OptionalEquipment')
  .with_subclass('PowerAssistedSteering', 'OptionalEquipment')
  .with_subclass('TunerRadio', 'OptionalEquipment')
  # OBJECT PROPERTIES
  .with_object_property('hasBody', ['Car'], ['Body'])
  .with_object_property('hasEuroEmissionClass', ['Car'], ['EuroEmissionClass'])
  .with_object_property('hasFuel', ['Car'], ['Fuel'])
  .with_object_property('hasManufacturer', ['Model'], ['Manufacturer'])
  .with_object_property('hasModel', ['Car'], ['Model'])
  .with_object_property('hasOptionalEquipment', ['Car'], ['OptionalEquipment'])
  .with_object_property('hasVariant', ['Model'], ['Variant'])
  # INDIVIDUALS
  .with_individual('Audi', 'Manufacturer')
  .with_individual('A3_8L', 'Variant')
  .with_individual('XCL1', 'Diesel')
  .with_individual('AudiSedans', 'Sedans')
  .with_individual('A3', 'Model', { 'hasVariant' => 'A3_8L', 'hasManufacturer' => 'Audi' })
  .with_individual('car#1', 'Car', { 'hasModel' => 'A3', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL1', 'hasBody' => 'AudiSedans' })

graph.dump(:rdfxml, 'carpedia')
graph.dump(:owl, 'carpedia')
graph.dump(:ttl, 'carpedia')