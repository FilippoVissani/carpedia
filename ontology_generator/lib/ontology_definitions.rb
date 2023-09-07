# frozen_string_literal: true
require 'rdf'

ex = RDF::Vocabulary.new("http://example.com/")
Graph = RDF::Graph.new

# Classes
Car = ex.Car
Graph << [Car, RDF.type, RDF::OWL['Class']]
Body = ex.Body
Graph << [Body, RDF.type, RDF::OWL['Class']]
# Subclasses of Body
Compact = ex.Compact
Graph << [Compact, RDF.type, RDF::OWL['Class']]
Graph << [Compact, RDF::RDFS.subClassOf, Body]
Convertible = ex.Convertible
Graph << [Convertible, RDF.type, RDF::OWL['Class']]
Graph << [Convertible, RDF::RDFS.subClassOf, Body]
Coupe = ex.Coupe
Graph << [Coupe, RDF.type, RDF::OWL['Class']]
Graph << [Coupe, RDF::RDFS.subClassOf, Body]
Offroad = ex.Offroad
Graph << [Offroad, RDF.type, RDF::OWL['Class']]
Graph << [Offroad, RDF::RDFS.subClassOf, Body]
Pickup = ex.Pickup
Graph << [Pickup, RDF.type, RDF::OWL['Class']]
Graph << [Pickup, RDF::RDFS.subClassOf, Body]
Sedans = ex.Sedans
Graph << [Sedans, RDF.type, RDF::OWL['Class']]
Graph << [Sedans, RDF::RDFS.subClassOf, Body]
StationWagon = ex.StationWagon
Graph << [StationWagon, RDF.type, RDF::OWL['Class']]
Graph << [StationWagon, RDF::RDFS.subClassOf, Body]
SUV = ex.SUV
Graph << [SUV, RDF.type, RDF::OWL['Class']]
Graph << [SUV, RDF::RDFS.subClassOf, Body]
Transporter = ex.Transporter
Graph << [Transporter, RDF.type, RDF::OWL['Class']]
Graph << [Transporter, RDF::RDFS.subClassOf, Body]
Van = ex.Van
Graph << [Van, RDF.type, RDF::OWL['Class']]
Graph << [Van, RDF::RDFS.subClassOf, Body]

EuroEmissionClass = ex.EuroEmissionClass
Graph << [EuroEmissionClass, RDF.type, RDF::OWL['Class']]
# Subclasses of EuroEmissionClass
Euro1 = ex.Euro1
Graph << [Euro1, RDF.type, RDF::OWL['Class']]
Graph << [Euro1, RDF::RDFS.subClassOf, EuroEmissionClass]
Euro2 = ex.Euro2
Graph << [Euro2, RDF.type, RDF::OWL['Class']]
Graph << [Euro2, RDF::RDFS.subClassOf, EuroEmissionClass]
Euro3 = ex.Euro3
Graph << [Euro3, RDF.type, RDF::OWL['Class']]
Graph << [Euro3, RDF::RDFS.subClassOf, EuroEmissionClass]
Euro4 = ex.Euro4
Graph << [Euro4, RDF.type, RDF::OWL['Class']]
Graph << [Euro4, RDF::RDFS.subClassOf, EuroEmissionClass]
Euro5 = ex.Euro5
Graph << [Euro5, RDF.type, RDF::OWL['Class']]
Graph << [Euro5, RDF::RDFS.subClassOf, EuroEmissionClass]
Euro6 = ex.Euro6
Graph << [Euro6, RDF.type, RDF::OWL['Class']]
Graph << [Euro6, RDF::RDFS.subClassOf, EuroEmissionClass]
Euro6c = ex.Euro6c
Graph << [Euro6c, RDF.type, RDF::OWL['Class']]
Graph << [Euro6c, RDF::RDFS.subClassOf, EuroEmissionClass]
Euro6d = ex.Euro6d
Graph << [Euro6d, RDF.type, RDF::OWL['Class']]
Graph << [Euro6d, RDF::RDFS.subClassOf, EuroEmissionClass]
Euro6dTEMP = ex.Euro6dTEMP
Graph << [Euro6dTEMP, RDF.type, RDF::OWL['Class']]
Graph << [Euro6dTEMP, RDF::RDFS.subClassOf, EuroEmissionClass]

Fuel = ex.Fuel
Graph << [Fuel, RDF.type, RDF::OWL['Class']]
# Subclasses of Fuel
Diesel = ex.Diesel
Graph << [Diesel, RDF.type, RDF::OWL['Class']]
Graph << [Diesel, RDF::RDFS.subClassOf, Fuel]
Electric = ex.Electric
Graph << [Electric, RDF.type, RDF::OWL['Class']]
Graph << [Electric, RDF::RDFS.subClassOf, Fuel]
Gasoline = ex.Gasoline
Graph << [Gasoline, RDF.type, RDF::OWL['Class']]
Graph << [Gasoline, RDF::RDFS.subClassOf, Fuel]
CNG = ex.CNG
Graph << [CNG, RDF.type, RDF::OWL['Class']]
Graph << [CNG, RDF::RDFS.subClassOf, Fuel]
Ethanol = ex.Ethanol
Graph << [Ethanol, RDF.type, RDF::OWL['Class']]
Graph << [Ethanol, RDF::RDFS.subClassOf, Fuel]
Hydrogen = ex.Hydrogen
Graph << [Hydrogen, RDF.type, RDF::OWL['Class']]
Graph << [Hydrogen, RDF::RDFS.subClassOf, Fuel]
LPG = ex.LPG
Graph << [LPG, RDF.type, RDF::OWL['Class']]
Graph << [LPG, RDF::RDFS.subClassOf, Fuel]
Hybrid = ex.Hybrid
Graph << [Hybrid, RDF.type, RDF::OWL['Class']]
Graph << [Hybrid, RDF::RDFS.subClassOf, Fuel]
# Subclasses of Hybrid
ElectricDiesel = ex.ElectricDiesel
Graph << [ElectricDiesel, RDF.type, RDF::OWL['Class']]
Graph << [ElectricDiesel, RDF::RDFS.subClassOf, Hybrid]
ElectricGasoline = ex.ElectricGasoline
Graph << [ElectricGasoline, RDF.type, RDF::OWL['Class']]
Graph << [ElectricGasoline, RDF::RDFS.subClassOf, Hybrid]

Gear = ex.Gear
Graph << [Gear, RDF.type, RDF::OWL['Class']]
# Subclasses of Gear
Automatic = ex.Automatic
Graph << [Automatic, RDF.type, RDF::OWL['Class']]
Graph << [Automatic, RDF::RDFS.subClassOf, Gear]
Manual = ex.Manual
Graph << [Manual, RDF.type, RDF::OWL['Class']]
Graph << [Manual, RDF::RDFS.subClassOf, Gear]
SemiAutomatic = ex.SemiAutomatic
Graph << [SemiAutomatic, RDF.type, RDF::OWL['Class']]
Graph << [SemiAutomatic, RDF::RDFS.subClassOf, Gear]

Manufacturer = ex.Manufacturer
Graph << [Manufacturer, RDF.type, RDF::OWL['Class']]
Model = ex.Model
Graph << [Model, RDF.type, RDF::OWL['Class']]
OptionalEquipment = ex.OptionalEquipment
Graph << [OptionalEquipment, RDF.type, RDF::OWL['Class']]
# Subclasses of OptionalEquipment
AirConditioning = ex.AirConditioning
Graph << [AirConditioning, RDF.type, RDF::OWL['Class']]
Graph << [AirConditioning, RDF::RDFS.subClassOf, OptionalEquipment]
AlloyWheels = ex.AlloyWheels
Graph << [AlloyWheels, RDF.type, RDF::OWL['Class']]
Graph << [AlloyWheels, RDF::RDFS.subClassOf, OptionalEquipment]
AuxiliaryHeating = ex.AuxiliaryHeating
Graph << [AuxiliaryHeating, RDF.type, RDF::OWL['Class']]
Graph << [AuxiliaryHeating, RDF::RDFS.subClassOf, OptionalEquipment]
CatalyticConverter = ex.CatalyticConverter
Graph << [CatalyticConverter, RDF.type, RDF::OWL['Class']]
Graph << [CatalyticConverter, RDF::RDFS.subClassOf, OptionalEquipment]
CentralLocking = ex.CentralLocking
Graph << [CentralLocking, RDF.type, RDF::OWL['Class']]
Graph << [CentralLocking, RDF::RDFS.subClassOf, OptionalEquipment]
CruiseControl = ex.CruiseControl
Graph << [CruiseControl, RDF.type, RDF::OWL['Class']]
Graph << [CruiseControl, RDF::RDFS.subClassOf, OptionalEquipment]
ElectricSideMirror = ex.ElectricSideMirror
Graph << [ElectricSideMirror, RDF.type, RDF::OWL['Class']]
Graph << [ElectricSideMirror, RDF::RDFS.subClassOf, OptionalEquipment]
ElectricWindows = ex.ElectricWindows
Graph << [ElectricWindows, RDF.type, RDF::OWL['Class']]
Graph << [ElectricWindows, RDF::RDFS.subClassOf, OptionalEquipment]
HandsFreeEquipment = ex.HandsFreeEquipment
Graph << [HandsFreeEquipment, RDF.type, RDF::OWL['Class']]
Graph << [HandsFreeEquipment, RDF::RDFS.subClassOf, OptionalEquipment]
NavigationSystem = ex.NavigationSystem
Graph << [NavigationSystem, RDF.type, RDF::OWL['Class']]
Graph << [NavigationSystem, RDF::RDFS.subClassOf, OptionalEquipment]
PanoramicRoof = ex.PanoramicRoof
Graph << [PanoramicRoof, RDF.type, RDF::OWL['Class']]
Graph << [PanoramicRoof, RDF::RDFS.subClassOf, OptionalEquipment]
ParkingAssistSystemCamera = ex.ParkingAssistSystemCamera
Graph << [ParkingAssistSystemCamera, RDF.type, RDF::OWL['Class']]
Graph << [ParkingAssistSystemCamera, RDF::RDFS.subClassOf, OptionalEquipment]
ParkingAssistSystemRear = ex.ParkingAssistSystemRear
Graph << [ParkingAssistSystemRear, RDF.type, RDF::OWL['Class']]
Graph << [ParkingAssistSystemRear, RDF::RDFS.subClassOf, OptionalEquipment]
ParkingAssistSystemSelfSteering = ex.ParkingAssistSystemSelfSteering
Graph << [ParkingAssistSystemSelfSteering, RDF.type, RDF::OWL['Class']]
Graph << [ParkingAssistSystemSelfSteering, RDF::RDFS.subClassOf, OptionalEquipment]
ParkingAssistSystemSensorsFront = ex.ParkingAssistSystemSensorsFront
Graph << [ParkingAssistSystemSensorsFront, RDF.type, RDF::OWL['Class']]
Graph << [ParkingAssistSystemSensorsFront, RDF::RDFS.subClassOf, OptionalEquipment]
ParkingAssistSystemSensorsRear = ex.ParkingAssistSystemSensorsRear
Graph << [ParkingAssistSystemSensorsRear, RDF.type, RDF::OWL['Class']]
Graph << [ParkingAssistSystemSensorsRear, RDF::RDFS.subClassOf, OptionalEquipment]
PowerAssistedSteering = ex.PowerAssistedSteering
Graph << [PowerAssistedSteering, RDF.type, RDF::OWL['Class']]
Graph << [PowerAssistedSteering, RDF::RDFS.subClassOf, OptionalEquipment]
RainSensor = ex.RainSensor
Graph << [RainSensor, RDF.type, RDF::OWL['Class']]
Graph << [RainSensor, RDF::RDFS.subClassOf, OptionalEquipment]
SeatHeating = ex.SeatHeating
Graph << [SeatHeating, RDF.type, RDF::OWL['Class']]
Graph << [SeatHeating, RDF::RDFS.subClassOf, OptionalEquipment]
SeatVentilation = ex.SeatVentilation
Graph << [SeatVentilation, RDF.type, RDF::OWL['Class']]
Graph << [SeatVentilation, RDF::RDFS.subClassOf, OptionalEquipment]
SportPackage = ex.SportPackage
Graph << [SportPackage, RDF.type, RDF::OWL['Class']]
Graph << [SportPackage, RDF::RDFS.subClassOf, OptionalEquipment]
SportSeats = ex.SportSeats
Graph << [SportSeats, RDF.type, RDF::OWL['Class']]
Graph << [SportSeats, RDF::RDFS.subClassOf, OptionalEquipment]
SportSuspension = ex.SportSuspension
Graph << [SportSuspension, RDF.type, RDF::OWL['Class']]
Graph << [SportSuspension, RDF::RDFS.subClassOf, OptionalEquipment]
StartStopSystem = ex.StartStopSystem
Graph << [StartStopSystem, RDF.type, RDF::OWL['Class']]
Graph << [StartStopSystem, RDF::RDFS.subClassOf, OptionalEquipment]
Sunroof = ex.Sunroof
Graph << [Sunroof, RDF.type, RDF::OWL['Class']]
Graph << [Sunroof, RDF::RDFS.subClassOf, OptionalEquipment]
TowBar = ex.TowBar
Graph << [TowBar, RDF.type, RDF::OWL['Class']]
Graph << [TowBar, RDF::RDFS.subClassOf, OptionalEquipment]
TrailerCoupling = ex.TrailerCoupling
Graph << [TrailerCoupling, RDF.type, RDF::OWL['Class']]
Graph << [TrailerCoupling, RDF::RDFS.subClassOf, OptionalEquipment]
TunerRadio = ex.TunerRadio
Graph << [TunerRadio, RDF.type, RDF::OWL['Class']]
Graph << [TunerRadio, RDF::RDFS.subClassOf, OptionalEquipment]
WinterTyres = ex.WinterTyres
Graph << [WinterTyres, RDF.type, RDF::OWL['Class']]
Graph << [WinterTyres, RDF::RDFS.subClassOf, OptionalEquipment]

Variant = ex.Variant
Graph << [Variant, RDF.type, RDF::OWL['Class']]

# Object Properties
hasManufacturer = ex.hasManufacturer
Graph << [hasManufacturer, RDF.type, RDF::OWL['ObjectProperty']]
