within PraxisSimulationstechnik.Solutions;
model Kupplung
  Modelica.Blocks.Sources.Ramp ramp1(height = 200, duration = 4, offset = 200, startTime = 9) annotation(Placement(transformation(origin = {-89.3993,5.53237}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Rotational.Components.Clutch clutch1(mue_pos = [0,0.5], peak = 1.315789474, cgeo = 0.38, fn_max = 1000) annotation(Placement(transformation(origin = {45.6007,6.03237}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 5, stateSelect = StateSelect.default, w(start = 0, fixed = true)) annotation(Placement(transformation(origin = {85.1007,6.53237}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1, stateSelect = StateSelect.default, w(start = 200, fixed = true)) annotation(Placement(transformation(origin = {4.10072,5.53237}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(Placement(transformation(origin = {-38.3993,5.03237}, extent = {{-15,-15},{15,15}})));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(transformation(origin = {45.6007,53.0324}, extent = {{-15,15},{15,-15}}, rotation = -90)));
equation
  connect(constant1.y,clutch1.f_normalized) annotation(Line(points={{45.6007,
          36.5324},{45.6007,36.5324},{45.6007,22.5324},{45.6007,22.5324}}));
  connect(torque1.flange,inertia1.flange_a) annotation(Line(points={{-23.3993,
          5.03237},{-10.3993,5.03237},{-10.3993,5.53237},{-10.8993,5.53237}}));
  connect(ramp1.y,torque1.tau) annotation(Line(points = {{-72.8993,5.53237},{-57.8993,5.53237},{-57.8993,5.03237},{-56.3993,5.03237}}));
  connect(inertia1.flange_b,clutch1.flange_a) annotation(Line(points={{19.1007,
          5.53237},{30.6007,5.53237},{30.6007,6.03237},{30.6007,6.03237}}));
  connect(clutch1.flange_b,inertia2.flange_a) annotation(Line(points = {{60.6007,6.03237},{70.6007,6.03237},{70.6007,6.53237},{70.1007,6.53237}}));
  annotation(experiment(StartTime = 0.0, StopTime = 15.0, Tolerance = 0.000001), uses(
        Modelica(version="3.2")));
end Kupplung;

