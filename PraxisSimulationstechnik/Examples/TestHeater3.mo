within PraxisSimulationstechnik.Examples;
model TestHeater3
  Thermo.DryAirDevices.FluidSource fluidsource2 annotation(Placement(transformation(origin = {-57.4713,23.8506}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.Heater heater1 annotation(Placement(transformation(origin = {-20.4023,24.1379}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.FluidSink fluidsink1 annotation(Placement(transformation(origin = {14.0805,24.1379}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow1(Q_flow = 200000.0) annotation(Placement(transformation(origin = {-20.6897,63.5057}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-44.5402,-12.069}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {0.574713,-11.7816}, extent = {{-12,-12},{12,12}}, rotation = -90)));
equation
  connect(statemeasurement2.inflow,heater1.outflow) annotation(Line(points = {{0.574713,0.218391},{0.574713,0.218391},{0.574713,24.1379},{-8.4023,24.1379},{-8.4023,24.1379}}));
  connect(statemeasurement1.inflow,heater1.inflow) annotation(Line(points = {{-44.5402,-0.0689655},{-44.5402,-0.0689655},{-44.5402,23.8506},{-32.4023,23.8506},{-32.4023,24.1379}}));
  connect(fixedheatflow1.port,heater1.heat) annotation(Line(points = {{-20.6897,51.5057},{-20.4023,51.5057},{-20.4023,36.1379},{-20.4023,36.1379}}));
  connect(fluidsource2.outflow,heater1.inflow) annotation(Line(points = {{-51.4713,23.8506},{-32.7586,23.8506},{-32.7586,24.1379},{-32.4023,24.1379}}));
  connect(heater1.outflow,fluidsink1.inflow) annotation(Line(points = {{-8.4023,24.1379},{8.04598,24.1379},{8.04598,24.1379},{8.08046,24.1379}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001));
end TestHeater3;

