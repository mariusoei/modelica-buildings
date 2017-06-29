within Buildings.Experimental.OpenBuildingControl.ASHRAE.G36.AtomicSequences.Validation;
model EconEnableDisableMultiZone_FreProSta_ZonSta
  "Model validates economizer disable at heating Zone State or at Freeze Protection Stages 1 through 3"
  extends Modelica.Icons.Example;

  parameter Real TOutCutoff(final unit="K", quantity="TermodynamicTemperature")=297
    "Outdoor temperature high limit cutoff";
  parameter Real hOutCutoff(final unit="J/kg", quantity="SpecificEnergy")=65100
    "Outdoor air enthalpy high limit cutoff";

  EconEnableDisableMultiZone econEnableDisableMultiZone
    annotation (Placement(transformation(extent={{82,40},{102,60}})));
  EconEnableDisableMultiZone econEnableDisableMultiZone1
    annotation (Placement(transformation(extent={{82,-40},{102,-20}})));


protected
  CDL.Continuous.Constant TOutBellowCutoff(k=TOutCutoff - 2)
    "Outdoor air temperature is slightly below the cutoff"
    annotation (Placement(transformation(extent={{-40,140},{-20,160}})));
  CDL.Continuous.Constant TOutCut(k=TOutCutoff)
    annotation (Placement(transformation(extent={{-40,100},{-20,120}})));
  CDL.Continuous.Constant hOutBelowCutoff(k=hOutCutoff - 1000)
    "Outdoor air enthalpy is slightly below the cufoff"
    annotation (Placement(transformation(extent={{-100,100},{-80,120}})));
  CDL.Continuous.Constant hOutCut(k=hOutCutoff) "Outdoor air enthalpy cutoff"
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
  CDL.Integers.Constant FreProSta(k=0) "Freeze Protection Status"
    annotation (Placement(transformation(extent={{-160,40},{-140,60}})));
  CDL.Integers.Constant ZoneState(k=1) "Zone State is not heating"
    annotation (Placement(transformation(extent={{-160,0},{-140,20}})));
  CDL.Continuous.Constant outDamPosMax(k=0.9) "Maximal allowed economizer damper position"
    annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  CDL.Continuous.Constant outDamPosMin(k=0.1) "Minimal allowed economizer damper position"
    annotation (Placement(transformation(extent={{-60,-160},{-40,-140}})));
  CDL.Continuous.Constant retDamPhyPosMax(k=1) "Maximal allowed economizer damper position"
    annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  CDL.Continuous.Constant retDamPosMax(k=0.8) "Maximal allowed economizer damper position"
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  CDL.Continuous.Constant retDamPosMin(k=0) "Minimal allowed economizer damper position"
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  CDL.Integers.Constant FreProSta1(k=2) "Freeze Protection Status"
    annotation (Placement(transformation(extent={{40,80},{60,100}})));
  CDL.Integers.Constant ZoneState1(k=0) "Zone State is not heating"
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  CDL.Logical.Constant SupFanSta(k=true)
    annotation (Placement(transformation(extent={{-160,-40},{-140,-20}})));

equation
  connect(TOutBellowCutoff.y, econEnableDisableMultiZone.TOut) annotation (Line(
        points={{-19,150},{32,150},{32,60},{81,60}}, color={0,0,127}));
  connect(TOutCut.y, econEnableDisableMultiZone.TOutCut) annotation (Line(
        points={{-19,110},{31.5,110},{31.5,58},{81,58}}, color={0,0,127}));
  connect(TOutCut.y, econEnableDisableMultiZone1.TOutCut) annotation (Line(
        points={{-19,110},{32,110},{32,-22},{81,-22}}, color={0,0,127}));
  connect(TOutBellowCutoff.y, econEnableDisableMultiZone1.TOut) annotation (
      Line(points={{-19,150},{32,150},{32,-20},{81,-20}}, color={0,0,127}));
  connect(hOutBelowCutoff.y, econEnableDisableMultiZone.hOut) annotation (Line(
        points={{-79,110},{-60,110},{-60,56},{81,56}}, color={0,0,127}));
  connect(hOutCut.y, econEnableDisableMultiZone.hOutCut) annotation (Line(
        points={{-79,70},{-70,70},{-70,54},{81,54}}, color={0,0,127}));
  connect(hOutBelowCutoff.y, econEnableDisableMultiZone1.hOut) annotation (Line(
        points={{-79,110},{-60,110},{-60,56},{10,56},{10,-24},{81,-24}}, color={0,0,127}));
  connect(hOutCut.y, econEnableDisableMultiZone1.hOutCut) annotation (Line(
        points={{-79,70},{-70,70},{-70,54},{6,54},{6,-26},{81,-26}}, color={0,0,127}));
  connect(ZoneState.y, econEnableDisableMultiZone.uZoneState) annotation (Line(
        points={{-139,10},{-122,10},{-122,50},{81,50}}, color={255,127,0}));
  connect(FreProSta1.y, econEnableDisableMultiZone.uFreProSta) annotation (Line(
        points={{61,90},{70,90},{70,52},{81,52}}, color={255,127,0}));
  connect(FreProSta.y, econEnableDisableMultiZone1.uFreProSta) annotation (Line(
        points={{-139,50},{2,50},{2,-28},{81,-28}}, color={255,127,0}));
  connect(ZoneState1.y, econEnableDisableMultiZone1.uZoneState) annotation (
      Line(points={{61,-70},{72,-70},{72,-30},{81,-30}}, color={255,127,0}));
  connect(retDamPosMax.y, econEnableDisableMultiZone.uRetDamPosMax) annotation (
     Line(points={{-79,-50},{-68,-50},{-68,40},{81,40}}, color={0,0,127}));
  connect(retDamPhyPosMax.y, econEnableDisableMultiZone.uRetDamPhyPosMax)
    annotation (Line(points={{-79,-10},{-70,-10},{-70,42},{81,42}}, color={0,0,127}));
  connect(retDamPosMin.y, econEnableDisableMultiZone.uRetDamPosMin) annotation (
     Line(points={{-79,-90},{-66,-90},{-66,38},{8,38},{81,38}},        color={0,0,127}));
  connect(outDamPosMax.y, econEnableDisableMultiZone.uOutDamPosMax) annotation (
     Line(points={{-39,-110},{-30,-110},{-30,46},{81,46}}, color={0,0,127}));
  connect(outDamPosMin.y, econEnableDisableMultiZone.uOutDamPosMin) annotation (
     Line(points={{-39,-150},{-28,-150},{-28,44},{81,44}}, color={0,0,127}));
  connect(outDamPosMin.y, econEnableDisableMultiZone1.uOutDamPosMin)
    annotation (Line(points={{-39,-150},{22,-150},{22,-36},{81,-36}}, color={0,0,127}));
  connect(outDamPosMax.y, econEnableDisableMultiZone1.uOutDamPosMax)
    annotation (Line(points={{-39,-110},{20,-110},{20,-34},{81,-34}}, color={0,0,127}));
  connect(retDamPosMin.y, econEnableDisableMultiZone1.uRetDamPosMin)
    annotation (Line(points={{-79,-90},{30,-90},{30,-42},{81,-42}}, color={0,0,127}));
  connect(retDamPosMax.y, econEnableDisableMultiZone1.uRetDamPosMax)
    annotation (Line(points={{-79,-50},{0,-50},{0,-40},{81,-40}}, color={0,0,127}));
  connect(retDamPhyPosMax.y, econEnableDisableMultiZone1.uRetDamPhyPosMax)
    annotation (Line(points={{-79,-10},{0,-10},{0,-38},{81,-38}}, color={0,0,127}));
  connect(SupFanSta.y, econEnableDisableMultiZone.uSupFan) annotation (Line(
        points={{-139,-30},{-34,-30},{-34,48},{81,48}}, color={255,0,255}));
  connect(SupFanSta.y, econEnableDisableMultiZone1.uSupFan) annotation (Line(
        points={{-139,-30},{-34,-30},{-34,-32},{81,-32}}, color={255,0,255}));
  annotation (
    experiment(StopTime=1800.0, Tolerance=1e-06),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Experimental/OpenBuildingControl/ASHRAE/G36/AtomicSequences/Validation/EconEnableDisableMultiZone_FreProSta_ZonSta.mos"
    "Simulate and plot"),
  Icon(graphics={
        Ellipse(
          lineColor={75,138,73},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,58},{64,-2},{-36,-62},{-36,58}})}), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-180,-180},{180,180}})),
  experiment(StopTime=1800.0),
    Documentation(info="<html>
<p>
This example validates
<a href=\"modelica://Buildings.Experimental.OpenBuildingControl.ASHRAE.G36.AtomicSequences.EconEnableDisableMultiZone\">
Buildings.Experimental.OpenBuildingControl.ASHRAE.G36.AtomicSequences.EconEnableDisableMultiZone</a>
for different control signals.
</p>
</html>", revisions="<html>
<ul>
<li>
June 13, 2017, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"));
end EconEnableDisableMultiZone_FreProSta_ZonSta;