within PraxisSimulationstechnik.Examples;
model Hydraulik1
  PJlib.Hydraulik.Components.HydraulicCylinder hydrauliccylinder1(A = 0.001) annotation(Placement(transformation(origin = {15.5886,38.6829}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.FlowSource flowsource1 annotation(Placement(transformation(origin = {-41.5954,59.8291}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.LaminarFlow laminarflow1(R = 80000000.0) annotation(Placement(transformation(origin = {-11.396,60.114}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 500) annotation(Placement(transformation(origin = {49.2216,38.6829}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.AmbientPressure ambientpressure1(p0 = 0) annotation(Placement(transformation(origin = {-64.9573,25.9259}, extent = {{-12,-12},{12,12}}, rotation = 90)));
equation
  connect(ambientpressure1.outflow,flowsource1.inflow) annotation(Line(points = {{-64.9573,37.9259},{-64.9573,37.9259},{-64.9573,59.5442},{-53.5954,59.5442},{-53.5954,59.8291}}));
  connect(hydrauliccylinder1.flange,mass1.flange_a) annotation(Line(points = {{27.5886,38.6829},{37.8917,38.6829},{37.8917,38.6829},{37.2216,38.6829}}));
  connect(laminarflow1.outflow,hydrauliccylinder1.inflow) annotation(Line(points = {{0.604,60.114},{9.97151,60.114},{9.97151,50.6829},{9.5886,50.6829}}));
  connect(flowsource1.outflow,laminarflow1.inflow) annotation(Line(points = {{-29.5954,59.8291},{-23.0769,59.8291},{-23.0769,60.114},{-23.396,60.114}}));
  annotation(Diagram(), experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 1e-06));
end Hydraulik1;

