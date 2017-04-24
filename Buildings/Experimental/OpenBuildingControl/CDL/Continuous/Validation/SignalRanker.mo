within Buildings.Experimental.OpenBuildingControl.CDL.Continuous.Validation;
model SignalRanker "Validation model for the SignalRanker block"
extends Modelica.Icons.Example;

  Buildings.Experimental.OpenBuildingControl.CDL.Continuous.SignalRanker sigRan(
    nin = 5)
    "Block that outputs signals such that y[i] >= y[i+1]"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Buildings.Experimental.OpenBuildingControl.CDL.Sources.Ramp ramp1(
    duration=1,
    offset=-2,
    height=4)  "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-60,56},{-40,76}})));
  Buildings.Experimental.OpenBuildingControl.CDL.Sources.Ramp ramp2(
    duration=1,
    offset=-1,
    height=3) "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-60,22},{-40,42}})));

  Buildings.Experimental.OpenBuildingControl.CDL.Sources.Ramp ramp3(
    duration=1,
    offset=2,
    height=-4)  "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Buildings.Experimental.OpenBuildingControl.CDL.Sources.Ramp ramp4(
    duration=1,
    offset=3,
    height=-1) "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-60,-42},{-40,-22}})));

  Buildings.Experimental.OpenBuildingControl.CDL.Sources.Ramp ramp5(
    duration=1,
    offset=0,
    height=4)  "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-60,-74},{-40,-54}})));

equation
  connect(ramp1.y, sigRan.u[1]) annotation (Line(points={{-39,66},{-26,66},{-26,
          -1.6},{-12,-1.6}}, color={0,0,127}));
  connect(ramp2.y, sigRan.u[2]) annotation (Line(points={{-39,32},{-26,32},{-26,
          -0.8},{-12,-0.8}}, color={0,0,127}));
  connect(ramp3.y, sigRan.u[3])
    annotation (Line(points={{-39,0},{-12,0},{-12,0}}, color={0,0,127}));
  connect(ramp4.y, sigRan.u[4]) annotation (Line(points={{-39,-32},{-26,-32},{
          -26,0.8},{-12,0.8}}, color={0,0,127}));
  connect(ramp5.y, sigRan.u[5]) annotation (Line(points={{-39,-64},{-26,-64},{
          -26,1.6},{-12,1.6}}, color={0,0,127}));
  annotation (
experiment(StopTime=1.0, Tolerance=1e-06),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Experimental/OpenBuildingControl/CDL/Continuous/Validation/SignalRanker.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
Validation test for the block
<a href=\"modelica://Buildings.Experimental.OpenBuildingControl.CDL.Continuous.SignalRanker\">
Buildings.Experimental.OpenBuildingControl.CDL.Continuous.SignalRanker</a>.
</p>
<p>
The input <code>u1</code> varies from <i>-2</i> to <i>+2</i>, input <code>u2</code> varies from <i>-1</i> to <i>+2</i>,
input <code>u3</code> varies from <i>+2</i> to <i>-2</i>, input <code>u4</code> varies from <i>+3</i> to <i>+2</i>,
input <code>u5</code> varies from <i>0</i> to <i>+4</i>,
</p>
</html>", revisions="<html>
<ul>
<li>
March 22, 2017, by Jianjun Hu:<br/>
First implementation.
</li>
</ul>

</html>"));
end SignalRanker;
