within PraxisSimulationstechnik.Examples;
model TestHeater2
  model FluidSource2 = Thermo.Devices.FluidSource(redeclare Thermo.Media.DryAir medium);
  model Heater2 = Thermo.Devices.Heater(redeclare Thermo.Media.DryAir mediumIn, redeclare Thermo.Media.DryAir mediumOut);
  model StateMeasurement2 = Thermo.Devices.StateMeasurement(redeclare Thermo.Media.DryAir medium);
  FluidSource2 fluidsource1 annotation(Placement(transformation(origin = {-48.433,25.9259}, extent = {{-12,-12},{12,12}})));
  Heater2 heater1 annotation(Placement(transformation(origin = {-13.3903,25.9259}, extent = {{-12,-12},{12,12}})));
  Thermo.Devices.FluidSink fluidsink1 annotation(Placement(transformation(origin = {23.9316,25.9259}, extent = {{-12,-12},{12,12}})));
  StateMeasurement2 statemeasurement1 annotation(Placement(transformation(origin = {-35.6322,-9.1954}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  StateMeasurement2 statemeasurement2 annotation(Placement(transformation(origin = {10.6322,-8.04598}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow1(Q_flow = 200000.0) annotation(Placement(transformation(origin = {-13.2184,64.9426}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(fixedheatflow1.port,heater1.heat) annotation(Line(points = {{-13.2184,52.9426},{-13.2184,52.6552},{-13.2184,37.9259},{-13.3903,37.9259}}));
  connect(statemeasurement1.inflow,heater1.inflow) annotation(Line(points = {{-35.6322,2.8046},{-35.6322,2.8046},{-35.6322,25.8621},{-25.3903,25.8621},{-25.3903,25.9259}}));
  connect(statemeasurement2.inflow,heater1.outflow) annotation(Line(points = {{10.6322,3.95402},{10.6322,3.95402},{10.6322,25.8621},{-1.39031,25.8621},{-1.39031,25.9259}}));
  connect(heater1.outflow,fluidsink1.inflow) annotation(Line(points = {{-1.39031,25.9259},{17.9487,25.9259},{17.9487,25.9259},{17.9316,25.9259}}));
  connect(fluidsource1.outflow,heater1.inflow) annotation(Line(points = {{-42.433,25.9259},{-29.0598,25.9259},{-29.0598,25.9259},{-25.3903,25.9259}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001));
end TestHeater2;

