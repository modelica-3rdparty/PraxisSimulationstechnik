within PraxisSimulationstechnik.Examples;
model Hydraulik3C
  PJlib.Hydraulik.Components.FlowSource flowsource1 annotation(Placement(transformation(origin = {-41.5954,59.8291}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.LaminarFlow laminarflow1(R = 80000000.0) annotation(Placement(transformation(origin = {-11.396,60.114}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.CompressibleCylinder compressiblecylinder1 annotation(Placement(transformation(origin = {18.5185,38.4615}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 500) annotation(Placement(transformation(origin = {49.7971,38.3951}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.AmbientPressure ambientpressure1(p0 = 100000.0) annotation(Placement(transformation(origin = {-64.9573,25.9259}, extent = {{-12,-12},{12,12}}, rotation = 90)));
equation
  connect(ambientpressure1.outflow,flowsource1.inflow) annotation(Line(points = {{-64.9573,37.9259},{-64.9573,37.9259},{-64.9573,59.5442},{-53.5954,59.5442},{-53.5954,59.8291}}));
  connect(compressiblecylinder1.piston,mass1.flange_a) annotation(Line(points = {{30.5185,38.4615},{38.1766,38.4615},{38.1766,38.3951},{37.7971,38.3951}}));
  connect(laminarflow1.outflow,compressiblecylinder1.inflow) annotation(Line(points = {{0.604,60.114},{12.5356,60.114},{12.5356,50.4615},{12.5185,50.4615}}));
  connect(flowsource1.outflow,laminarflow1.inflow) annotation(Line(points = {{-29.5954,59.8291},{-23.0769,59.8291},{-23.0769,60.114},{-23.396,60.114}}));
  annotation(Diagram(), experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 1e-06));
end Hydraulik3C;

