within PraxisSimulationstechnik.Examples;
model Hydraulik2
  PJlib.Hydraulik.Components.HydraulicCylinder hydrauliccylinder1(A = 0.001) annotation(Placement(transformation(origin = {15.5886,38.6829}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.LaminarFlow laminarflow1(R = 80000000.0) annotation(Placement(transformation(origin = {-11.396,60.114}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.Pumpe pumpe1 annotation(Placement(transformation(origin = {-45.1149,60.0575}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 500) annotation(Placement(transformation(origin = {49.5093,38.3951}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.AmbientPressure ambientpressure1(p0 = 0) annotation(Placement(transformation(origin = {-64.9573,25.9259}, extent = {{-12,-12},{12,12}}, rotation = 90)));
equation
  connect(pumpe1.porta1,ambientpressure1.outflow) annotation(Line(points = {{-57.1149,60.0575},{-64.65519999999999,60.0575},{-64.9573,37.9259},{-64.9573,37.9259}}));
  connect(hydrauliccylinder1.flange,mass1.flange_a) annotation(Line(points = {{27.5886,38.6829},{37.8917,38.6829},{37.8917,38.3951},{37.5093,38.3951}}));
  connect(pumpe1.portb1,laminarflow1.inflow) annotation(Line(points = {{-33.1149,60.0575},{-22.4138,60.0575},{-22.4138,60.114},{-23.396,60.114}}));
  connect(laminarflow1.outflow,hydrauliccylinder1.inflow) annotation(Line(points = {{0.604,60.114},{9.97151,60.114},{9.97151,50.6829},{9.5886,50.6829}}));
  annotation(Diagram(), experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 1e-06));
end Hydraulik2;

