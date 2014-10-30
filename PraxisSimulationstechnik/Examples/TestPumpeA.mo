within PraxisSimulationstechnik.Examples;
model TestPumpeA
  Thermo.SimpleWaterDevices.FluidSink fluidsink1 annotation(Placement(transformation(origin = {14.0805,24.1379}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.FluidSourcePH fluidsourceph1(h = 112300.0) annotation(Placement(transformation(origin = {-62.3563,23.8506}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.Pump pump1 annotation(Placement(transformation(origin = {-21.5517,23.8506}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-44.5402,-12.069}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {0.574713,-11.7816}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque1(tau_constant = 6) annotation(Placement(transformation(origin = {-21.2644,61.4943}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(statemeasurement2.inflow,pump1.outflow) annotation(Line(points={{
          0.574713,0.2184},{0.574713,0.2184},{0.574713,23.8506},{-9.5517,
          23.8506}}));
  connect(statemeasurement1.inflow,fluidsourceph1.outflow) annotation(Line(points={{
          -44.5402,-0.069},{-44.5402,-0.069},{-44.5402,23.8506},{-56.3563,
          23.8506},{-56.3563,23.8506}}));
  connect(constanttorque1.flange,pump1.shaft) annotation(Line(points = {{-21.2644,49.4943},{-21.2644,49.4943},{-21.2644,35.8506},{-21.5517,35.8506}}));
  connect(pump1.outflow,fluidsink1.inflow) annotation(Line(points={{-9.5517,
          23.8506},{8.33333,23.8506},{8.33333,24.1379},{8.0805,24.1379}}));
  connect(fluidsourceph1.outflow,pump1.inflow) annotation(Line(points={{
          -56.3563,23.8506},{-33.046,23.8506},{-33.5517,23.8506}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end TestPumpeA;

