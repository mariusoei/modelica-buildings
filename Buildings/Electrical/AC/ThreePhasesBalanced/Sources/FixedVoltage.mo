within Buildings.Electrical.AC.ThreePhasesBalanced.Sources;
model FixedVoltage "Fixed 3 phase balanced AC voltage source"
  extends Buildings.Electrical.AC.OnePhase.Sources.FixedVoltage(redeclare
      Interfaces.Terminal_p terminal, V = 480);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                   graphics={             Line(
          points={{-34,0},{-14,40},{6,0},{26,-40},{46,0}},
          color={120,120,120},
          smooth=Smooth.Bezier),          Line(
          points={{-24,0},{-4,40},{16,0},{36,-40},{56,0}},
          color={215,215,215},
          smooth=Smooth.Bezier)}),
      Documentation(info="<html>
<p>
This is a constant voltage source, specifying the complex voltage 
by the RMS voltage and the phase shift. See <a href=\"modelica://Buildings.Electrical.AC.OnePhase.Sources.FixedVoltage\">
Buildings.Electrical.AC.OnePhase.Sources.FixedVoltage</a> for
more information.
</p>
</html>", revisions="<html>
<ul>
<li>
August 24, 2014, by Marco Bonvini:<br/>
Revised documentation.
</li>
</ul>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
                    graphics));
end FixedVoltage;