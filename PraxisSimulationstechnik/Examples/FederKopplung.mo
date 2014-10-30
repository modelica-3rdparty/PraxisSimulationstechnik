within PraxisSimulationstechnik.Examples;
model FederKopplung
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, stateSelect = StateSelect.default, s(start = 0.2, fixed = true)) annotation(Placement(transformation(origin = {-66.5,7.5}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.Spring spring1(c = 1) annotation(Placement(transformation(origin = {-26.1871,7.19424}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Spring spring2(c = 1) annotation(Placement(transformation(origin = {7.70328,7.13267}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 0) annotation(Placement(transformation(origin = {31.8237,7.42446}, extent = {{15,-15},{-15,15}}, rotation = 90)));
equation
  connect(spring2.flange_b,fixed1.flange) annotation(Line(points={{19.7033,
          7.13267},{31.669,7.13267},{31.669,7.42446},{31.8237,7.42446}}));
  connect(spring1.flange_b,spring2.flange_a) annotation(Line(points = {{-14.1871,7.19424},{-4.2796,7.19424},{-4.2796,7.13267},{-4.29672,7.13267}}));
  connect(mass1.flange_b,spring1.flange_a) annotation(Line(points = {{-51.5,7.5},{-37.6978,7.5},{-37.6978,7.19424},{-38.1871,7.19424}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end FederKopplung;

