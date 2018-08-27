within Buildings.ThermalZones.Detailed.BaseClasses;
record ParameterConstructionVariable "Variable construction record"
  extends ParameterConstruction;

  // Extend by parameters for variable conduction layer
  parameter Integer varLayerIndex = 0 "Variable conduction layer index";

  parameter Boolean hasVarLayer = false "=true if variable conduction layer is present";


end ParameterConstructionVariable;
