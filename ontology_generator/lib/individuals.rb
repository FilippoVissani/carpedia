# frozen_string_literal: true
require 'rdf'
require 'rdf/rdfxml'
require 'rdf/turtle'
require_relative 'graph_builder'
require_relative 'carpedia_graph'
include RDF
include GraphBuilder

CarpediaGraph
    # INDIVIDUALS
    # manufacturers
    .with_individual('Audi', 'Manufacturer')
    .with_individual('BMW', 'Manufacturer')
    .with_individual('Mercedes', 'Manufacturer')
    .with_individual('Volkswagen', 'Manufacturer')
    .with_individual('Volvo', 'Manufacturer')
    .with_individual('Renault', 'Manufacturer')
    .with_individual('Peugeot', 'Manufacturer')
    .with_individual('Citroen', 'Manufacturer')
    .with_individual('Fiat', 'Manufacturer')
    .with_individual('Opel', 'Manufacturer')
    .with_individual('Ford', 'Manufacturer')
    .with_individual('Toyota', 'Manufacturer')
    .with_individual('Nissan', 'Manufacturer')
    .with_individual('Mazda', 'Manufacturer')
    .with_individual('Honda', 'Manufacturer')
    .with_individual('Hyundai', 'Manufacturer')
    .with_individual('Kia', 'Manufacturer')
    # variants
    # Audi A3
    .with_individual('A3_8L', 'Variant')
    .with_individual('A3_8P', 'Variant')
    # BMW 3
    .with_individual('3_E36', 'Variant')
    .with_individual('3_E46', 'Variant')
    # Mercedes C
    .with_individual('C_W202', 'Variant')
    .with_individual('C_W203', 'Variant')
    # Volkswagen Golf
    .with_individual('Golf_III', 'Variant')
    .with_individual('Golf_IV', 'Variant')
    # Volvo S40
    .with_individual('S40_I', 'Variant')
    .with_individual('S40_II', 'Variant')
    # Renault Megane
    .with_individual('Megane_I', 'Variant')
    .with_individual('Megane_II', 'Variant')
    # Peugeot 307
    .with_individual('307_I', 'Variant')
    .with_individual('307_II', 'Variant')
    # Citroen C4
    .with_individual('C4_I', 'Variant')
    .with_individual('C4_II', 'Variant')
    # Fiat Bravo
    .with_individual('Bravo_I', 'Variant')
    .with_individual('Bravo_II', 'Variant')
    # Opel Astra
    .with_individual('Astra_G', 'Variant')
    .with_individual('Astra_H', 'Variant')
    # Ford Focus
    .with_individual('Focus_I', 'Variant')
    .with_individual('Focus_II', 'Variant')
    # Toyota Corolla
    .with_individual('Corolla_E11', 'Variant')
    .with_individual('Corolla_E12', 'Variant')
    # fuels
    .with_individual('XCL1', 'Diesel')
    .with_individual('XCL2', 'Gasoline')
    .with_individual('XCL3', 'LPG')
    .with_individual('XCL4', 'CNG')
    .with_individual('XCL5', 'Ethanol')
    .with_individual('XCL6', 'Electric')
    .with_individual('XCL7', 'ElectricDiesel')
    .with_individual('XCL8', 'ElectricGasoline')
    # bodies
    .with_individual('AudiSedans', 'Sedans')
    .with_individual('AudiStationWagon', 'StationWagon')
    .with_individual('AudiCoupe', 'Coupe')
    # models
    .with_individual('A3', 'Model', { 'hasVariant' => 'A3_8L', 'hasManufacturer' => 'Audi' })
    .with_individual('3', 'Model', { 'hasVariant' => '3_E36', 'hasManufacturer' => 'BMW' })
    .with_individual('C', 'Model', { 'hasVariant' => 'C_W202', 'hasManufacturer' => 'Mercedes' })
    .with_individual('Golf', 'Model', { 'hasVariant' => 'Golf_III', 'hasManufacturer' => 'Volkswagen' })
    .with_individual('S40', 'Model', { 'hasVariant' => 'S40_I', 'hasManufacturer' => 'Volvo' })
    .with_individual('Megane', 'Model', { 'hasVariant' => 'Megane_I', 'hasManufacturer' => 'Renault' })
    .with_individual('307', 'Model', { 'hasVariant' => '307_I', 'hasManufacturer' => 'Peugeot' })
    .with_individual('C4', 'Model', { 'hasVariant' => 'C4_I', 'hasManufacturer' => 'Citroen' })
    .with_individual('Bravo', 'Model', { 'hasVariant' => 'Bravo_I', 'hasManufacturer' => 'Fiat' })
    .with_individual('Astra', 'Model', { 'hasVariant' => 'Astra_G', 'hasManufacturer' => 'Opel' })
    .with_individual('Focus', 'Model', { 'hasVariant' => 'Focus_I', 'hasManufacturer' => 'Ford' })
    .with_individual('Corolla', 'Model', { 'hasVariant' => 'Corolla_E11', 'hasManufacturer' => 'Toyota' })
    # euro emissions
    .with_individual('Euro1', 'EuroEmissionClass')
    .with_individual('Euro2', 'EuroEmissionClass')
    .with_individual('Euro3', 'EuroEmissionClass')
    .with_individual('Euro4', 'EuroEmissionClass')
    .with_individual('Euro5', 'EuroEmissionClass')
    .with_individual('Euro6', 'EuroEmissionClass')
    .with_individual('Euro6c', 'EuroEmissionClass')
    .with_individual('Euro6d', 'EuroEmissionClass')
    .with_individual('Euro6dTemp', 'EuroEmissionClass')
    # optional equipments
    .with_individual('AirConditioning#EB950', 'AirConditioning')
    .with_individual('AlloyWheels#C2ZJ', 'AlloyWheels')
    .with_individual('AuxiliaryHeating#9M5', 'AuxiliaryHeating')
    .with_individual('CatalyticConverter#4K4', 'CatalyticConverter')
    .with_individual('CentralLocking#4E7', 'CentralLocking')
    .with_individual('CruiseControl#8T1', 'CruiseControl')
    .with_individual('ElectricSideMirror#6XK', 'ElectricSideMirror')
    .with_individual('ElectricWindows#4R4', 'ElectricWindows')
    .with_individual('HeatedSeats#4A3', 'HeatedSeats')
    .with_individual('HandsFreeEquipment#9ZX', 'HandsFreeEquipment')
    .with_individual('NavigationSystem#7UG', 'NavigationSystem')
    .with_individual('PanoramicRoof#3FU', 'PanoramicRoof')
    # cars
    .with_individual('car#1', 'Car', { 'hasModel' => 'A3', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL1', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#2', 'Car', { 'hasModel' => '3', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL2', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#3', 'Car', { 'hasModel' => 'C', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL3', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#4', 'Car', { 'hasModel' => 'Golf', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL4', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#5', 'Car', { 'hasModel' => 'S40', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL5', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#6', 'Car', { 'hasModel' => 'Megane', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL6', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#7', 'Car', { 'hasModel' => '307', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL7', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#8', 'Car', { 'hasModel' => 'C4', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL8', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#9', 'Car', { 'hasModel' => 'Bravo', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL1', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#10', 'Car', { 'hasModel' => 'Astra', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL2', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#11', 'Car', { 'hasModel' => 'Focus', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL3', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
    .with_individual('car#12', 'Car', { 'hasModel' => 'Corolla', 'hasEuroEmissionClass' => 'Euro6dTemp', 'hasFuel' => 'XCL4', 'hasBody' => 'AudiSedans', 'hasOptionalEquipment' => 'AirConditioning#EB950' })
