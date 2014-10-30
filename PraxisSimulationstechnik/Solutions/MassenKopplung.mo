within PraxisSimulationstechnik.Solutions;
model MassenKopplung
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 0.3, stateSelect = StateSelect.default, s(start = 0.2, fixed = true)) annotation(Placement(transformation(origin = {-4.5,6.5}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 0) annotation(Placement(transformation(origin = {69.0755,6.71223}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.Spring spring1(c = 1) annotation(Placement(transformation(origin = {38.8489,6.33094}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Mass mass2(m = 0.7, stateSelect = StateSelect.default) annotation(Placement(transformation(origin = {-41.5,6.57554}, extent = {{-15,-15},{15,15}})));
equation
  connect(mass2.flange_b,mass1.flange_a) annotation(Line(points = {{-26.5,6.57554},{-19,6.57554},{-19,6.5},{-19.5,6.5}}));
  connect(spring1.flange_b,fixed1.flange) annotation(Line(points = {{50.8489,6.33094},{69.6403,6.33094},{69.6403,6.71223},{69.0755,6.71223}}));
  connect(mass1.flange_b,spring1.flange_a) annotation(Line(points = {{10.5,6.5},{26.7626,6.5},{26.7626,6.33094},{26.8489,6.33094}}));
  annotation(experiment(StartTime = 0.0, StopTime = 40.0, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end MassenKopplung;

