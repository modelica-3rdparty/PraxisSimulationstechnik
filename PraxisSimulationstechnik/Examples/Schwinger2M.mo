within PraxisSimulationstechnik.Examples;
model Schwinger2M
  Modelica.Mechanics.Translational.Components.SpringDamper springdamper2(c = 1, d = 1, s_rel0 = 0) annotation(Placement(transformation(origin = {-2.46063,8.24881}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.Mass mass2(m = 1, stateSelect = StateSelect.default) annotation(Placement(transformation(origin = {-41.9606,8.24881}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(Placement(transformation(origin = {-83.4606,8.74881}, extent = {{-15,-15},{15,15}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 1, freqHz = 0.477465, phase = 0, offset = 0, startTime = 0) annotation(Placement(transformation(origin = {-127.461,9.24881}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, stateSelect = StateSelect.default) annotation(Placement(transformation(origin = {37.0394,7.74881}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springdamper1(c = 1, d = 1, s_rel0 = 0) annotation(Placement(transformation(origin = {79.0394,7.74881}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 0) annotation(Placement(transformation(origin = {114.039,7.74881}, extent = {{15,-15},{-15,15}}, rotation = 90)));
equation
  connect(springdamper1.flange_b,fixed1.flange) annotation(Line(points = {{94.0394,7.74881},{113.539,7.74881},{113.539,7.74881},{114.039,7.74881}}));
  connect(mass1.flange_b,springdamper1.flange_a) annotation(Line(points = {{52.0394,7.74881},{65.0394,7.74881},{65.0394,7.74881},{64.0394,7.74881}}));
  connect(springdamper2.flange_b,mass1.flange_a) annotation(Line(points={{12.5394,
          8.24881},{22.0394,8.24881},{22.0394,7.74881},{22.0394,7.74881}}));
  connect(sine1.y,force1.f) annotation(Line(points={{-110.961,9.24881},{
          -102.961,9.24881},{-102.961,8.74881},{-101.461,8.74881}}));
  connect(force1.flange,mass2.flange_a) annotation(Line(points = {{-68.4606,8.74881},{-56.4606,8.74881},{-56.4606,8.24881},{-56.9606,8.24881}}));
  connect(mass2.flange_b,springdamper2.flange_a) annotation(Line(points={{
          -26.9606,8.24881},{-16.9606,8.24881},{-16.9606,8.24881},{-17.4606,
          8.24881}}));
  annotation(experiment(StartTime = 0.0, StopTime = 25, Tolerance = 0.000001),
    uses(Modelica(version="3.2")));
end Schwinger2M;

