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
    # ENGINE
    .with_class('Engine')
