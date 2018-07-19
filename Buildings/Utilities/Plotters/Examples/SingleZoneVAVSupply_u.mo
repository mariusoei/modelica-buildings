within Buildings.Utilities.Plotters.Examples;
model SingleZoneVAVSupply_u
  "Scatter plots for control signal of a single zone VAV controller from ASHRAE Guideline 36"
   extends Modelica.Icons.Example;

  inner Configuration plotConfiguration(samplePeriod=0.005) "Plot configuration"
    annotation (Placement(transformation(extent={{100,60},{120,80}})));

  Buildings.Controls.OBC.CDL.Continuous.Add heaCooConSig(k1=-1)
    "Add control signal for heating (with negative sign) and cooling"
    annotation (Placement(transformation(extent={{-32,40},{-12,60}})));
  Buildings.Utilities.Plotters.Scatter scaTem(
    title="Temperature setpoints",
    n=2,
    xlabel="Heating (negative) and cooling (positive) control loop signal",
    legend={"THea [degC]","TCoo [degC]"},
    introduction="Set point temperatures as a function of the heating loop signal (from -1 to 0) and
the cooling loop signal (from 0 to +1).")
    "Scatter plot for temperature setpoints"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.UnitConversions.To_degC THea_degC
    "Control signal for heating"
    annotation (Placement(transformation(extent={{40,10},{60,30}})));
  Modelica.Blocks.Math.UnitConversions.To_degC TCoo_degC
    "Control signal for cooling"
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  Buildings.Utilities.Plotters.Scatter scaYFan(
    n=1,
    title="Fan control signal",
    legend={"yFan"},
    xlabel="Heating (negative) and cooling (positive) control loop signal",
    introduction="Fan speed as a function of the heating loop signal (from -1 to 0) and
the cooling loop signal (from 0 to +1).")
    "Scatter plot for fan speed"
    annotation (Placement(transformation(extent={{100,-60},{120,-40}})));

  Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.SingleZone.SetPoints.VAVSupply setPoiVAV(
    yHeaMax=0.7,
    yMin=0.3,
    TMax=303.15,
    TMin=289.15)
    "Block that computes the setpoints for temperature and fan speed"
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));

  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant TZon(
    k = 273.15 + 28)
    "Zone air temperature"
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));

  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant TOut(k=273.15 + 22)
    "Outdoor temperature"
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));

  Buildings.Controls.OBC.CDL.Continuous.Sources.Ramp uHea(
    duration=0.25,
    height=-1,
    offset=1) "Heating control signal"
    annotation (Placement(transformation(extent={{-80,46},{-60,66}})));

  Buildings.Controls.OBC.CDL.Continuous.Sources.Ramp uCoo(
    duration=0.25,
    startTime=0.75)
    "Cooling control signal"
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));

  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant TSetZon(k=273.15 + 23)
    "Average zone set point"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));

equation
  connect(TOut.y, setPoiVAV.TOut) annotation (Line(points={{-59,-70},{-46,-70},{
          -46,-18},{-2,-18}},
                            color={0,0,127}));
  connect(uHea.y, setPoiVAV.uHea) annotation (Line(points={{-59,56},{-44,56},{-44,
          -2},{-2,-2}}, color={0,0,127}));
  connect(uCoo.y, setPoiVAV.uCoo) annotation (Line(points={{-59,20},{-50,20},{-50,
          -6},{-2,-6}}, color={0,0,127}));
  connect(TSetZon.y, setPoiVAV.TSetZon) annotation (Line(points={{-59,-10},{-2,-10}},
                             color={0,0,127}));

  connect(uHea.y, heaCooConSig.u1) annotation (Line(points={{-59,56},{-34,56}},
                          color={0,0,127}));
  connect(uCoo.y, heaCooConSig.u2) annotation (Line(points={{-59,20},{-50,20},{-50,
          44},{-34,44}},  color={0,0,127}));
  connect(scaTem.x, heaCooConSig.y) annotation (Line(points={{98,-8},{90,-8},{90,
          50},{-11,50}},      color={0,0,127}));
  connect(setPoiVAV.THeaEco, THea_degC.u)
    annotation (Line(points={{21,-4},{30,-4},{30,20},{38,20}},
                                                             color={0,0,127}));
  connect(setPoiVAV.TCoo, TCoo_degC.u)
    annotation (Line(points={{21,-10},{38,-10}}, color={0,0,127}));
  connect(THea_degC.y, scaTem.y[1]) annotation (Line(points={{61,20},{70,20},{70,
          1},{98,1}},   color={0,0,127}));
  connect(TCoo_degC.y, scaTem.y[2]) annotation (Line(points={{61,-10},{70,-10},{
          70,-1},{98,-1}}, color={0,0,127}));
  connect(setPoiVAV.y, scaYFan.y[1]) annotation (Line(points={{21,-16},{30,-16},
          {30,-50},{98,-50}},
                           color={0,0,127}));
  connect(heaCooConSig.y, scaYFan.x) annotation (Line(points={{-11,50},{90,50},{
          90,-58},{98,-58}},    color={0,0,127}));
  connect(setPoiVAV.TZon, TZon.y) annotation (Line(points={{-2,-14},{-50,-14},{-50,
          -40},{-59,-40}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{140,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})),
    experiment(Tolerance=1e-6, StopTime=1.0),
__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Utilities/Plotters/Examples/SingleZoneVAVSupply_u.mos"
        "Simulate and plot"),
    Documentation(
info="<html>
<p>
This example demonstrates how to create a scatter plot that shows
for a single zone VAV control logic
the heating and cooling set point temperatures, and the fan speed,
all as a function of the heating and cooling control signal.
The sequence that will be used to plot the sequence diagram is
<a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.SingleZone.SetPoints.VAVSupply\">
Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.SingleZone.SetPoints.VAVSupply</a>
and shown below.
The plot will be generated in the file <code>plots.html</code>.
</p>
<p align=\"center\">
<img alt=\"Image of set point reset\"
src=\"modelica://Buildings/Resources/Images/Controls/OBC/ASHRAE/G36_PR1/AHUs/VAVSingleZoneTSupSet.png\"/>
</p>
</html>", revisions="<html>
<ul>
<li>
March 23, 2018, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end SingleZoneVAVSupply_u;
