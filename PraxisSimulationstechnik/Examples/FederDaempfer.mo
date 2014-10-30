within PraxisSimulationstechnik.Examples;
model FederDaempfer
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(Placement(transformation(origin = {-43.7484,11.051}, extent = {{-15,-15},{15,15}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 1, freqHz = 0.477465, phase = 0, offset = 0, startTime = 0) annotation(Placement(transformation(origin = {-87.7488,11.551}, extent = {{-15,-15},{15,15}})));
  Modelica.Mechanics.Translational.Components.Spring spring1(c = 1) annotation(Placement(transformation(origin = {-4.02878,10.9353}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Damper damper1(d = 1) annotation(Placement(transformation(origin = {32.2302,10.9353}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 0) annotation(Placement(transformation(origin = {57.0606,11.202}, extent = {{15,-15},{-15,15}}, rotation = 90)));
equation
  connect(fixed1.flange,damper1.flange_b) annotation(Line(points = {{57.0606,11.202},{44.6043,11.202},{44.6043,10.9353},{44.2302,10.9353}}));
  connect(spring1.flange_b,damper1.flange_a) annotation(Line(points = {{7.97122,10.9353},{20.7194,10.9353},{20.7194,10.9353},{20.2302,10.9353}}));
  connect(force1.flange,spring1.flange_a) annotation(Line(points={{-28.7484,
          11.051},{-16.1151,11.051},{-16.1151,10.9353},{-16.0288,10.9353}}));
  connect(sine1.y,force1.f) annotation(Line(points = {{-71.2488,11.551},{-63.2488,11.551},{-63.2488,11.051},{-61.7484,11.051}}));
  annotation(Diagram,   experiment(StartTime = 0.0, StopTime = 25, Tolerance = 0.000001),
    uses(Modelica(version="3.2")));
end FederDaempfer;

