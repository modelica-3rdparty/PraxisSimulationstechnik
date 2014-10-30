within PraxisSimulationstechnik.Examples;
model Schwinger1M
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, stateSelect = StateSelect.default, s(start = 0.2, fixed = true)) annotation(Placement(transformation(origin = {-66.5,7.5}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.Spring spring1(c = 1) annotation(Placement(transformation(origin = {-26.1871,7.19424}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 0) annotation(Placement(transformation(origin = {1.60791,6.84892}, extent = {{15,-15},{-15,15}}, rotation = 90)));
equation
  connect(spring1.flange_b,fixed1.flange) annotation(Line(points = {{-14.1871,7.19424},{2.30216,7.19424},{2.30216,6.84892},{1.60791,6.84892}}));
  connect(mass1.flange_b,spring1.flange_a) annotation(Line(points = {{-51.5,7.5},{-37.6978,7.5},{-37.6978,7.19424},{-38.1871,7.19424}}));
  annotation(experiment(StartTime = 0.0, StopTime = 40.0, Tolerance = 0.000001), uses(
        Modelica(version="3.2")));
end Schwinger1M;

