within Buildings.Electrical.Interfaces;
partial model PartialPvBase "Partial model with basic parameters for PVs"
  parameter Modelica.SIunits.Area A "Net surface area";
  parameter Real fAct(min=0, max=1, unit="1") = 0.9
    "Fraction of surface area with active solar cells";
  parameter Real eta(min=0, max=1, unit="1") = 0.12
    "Module conversion efficiency";
  Modelica.Blocks.Interfaces.RealOutput P(unit="W") "Generated power"
    annotation (Placement(transformation(extent={{100,60},{120,80}})));
  annotation (Documentation(info="<html>
<p>
This model contains the minimum set of parameters necessary to describe
a PV system.
The model defines also an output <code>P</code> for the power generated by the PVs.
</p>
</html>", revisions="<html>
<ul>
<li>
January 29, 2014, by Marco Bonvini:<br/>
First implementation.
</li>
</ul>
</html>"));
end PartialPvBase;
