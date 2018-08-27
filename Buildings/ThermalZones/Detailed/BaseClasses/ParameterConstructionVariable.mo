within Buildings.ThermalZones.Detailed.BaseClasses;
record ParameterConstructionVariable "Variable construction record"
  extends ParameterConstruction;

  // Extend by parameters for variable conduction layer
  parameter Integer varLayerIndex = 0 "Variable conduction layer index";

  parameter Boolean hasVarLayer = false "=true if variable conduction layer is present";

  // Extend by parameters for internal exposed heat port
  parameter Integer heatPortLayerIndex = 0 "Exposed heat port after layer index";

  parameter Boolean hasExposedHeatPort = false "=true if construction has exposed heat port";


end ParameterConstructionVariable;
