within PraxisSimulationstechnik.Examples;
model TestHeater4B
  Thermo.SimpleWaterDevices.Heater heater1 annotation(Placement(transformation(origin = {-17.8161,-6.89658}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.FluidSink fluidsink1 annotation(Placement(transformation(origin = {16.6667,-6.89658}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-41.954,-43.1035}, extent = {{-1.2,1.2},{1.2,-1.2}}, rotation = -90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {3.16092,-42.8161}, extent = {{-1.2,1.2},{1.2,-1.2}}, rotation = -90)));
  Thermo.SimpleWaterDevices.FluidSourcePH fluidsourceph1(h = 112300.0) annotation(Placement(transformation(origin = {-60.3448,-7.18388}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedheatflow1 annotation(Placement(transformation(origin = {-17.8161,24.7126}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(height = 300000, duration = 100) annotation(Placement(transformation(origin = {-18.1034,60.3448}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(ramp1.y,prescribedheatflow1.Q_flow) annotation(Line(points = {{-18.1034,47.1448},{-17.8161,47.1448},{-17.8161,36.7126},{-17.8161,36.7126}}));
  connect(prescribedheatflow1.port,heater1.heat) annotation(Line(points={{
          -17.8161,12.7126},{-17.8161,12.7126},{-17.8161,5.10342}}));
  connect(fluidsourceph1.outflow,heater1.inflow) annotation(Line(points = {{-54.3448,-7.18388},{-30.1724,-7.18388},{-30.1724,-6.89658},{-29.8161,-6.89658}}));
  connect(statemeasurement2.inflow,heater1.outflow) annotation(Line(points={{3.16092,
          -41.6161},{3.16092,-41.6161},{3.16092,-6.89658},{-5.8161,-6.89658}}));
  connect(statemeasurement1.inflow,heater1.inflow) annotation(Line(points={{-41.954,
          -41.9035},{-41.954,-41.9035},{-41.954,-7.18388},{-29.8161,-7.18388},{
          -29.8161,-6.89658}}));
  connect(heater1.outflow,fluidsink1.inflow) annotation(Line(points={{-5.8161,
          -6.89658},{10.6322,-6.89658},{10.6667,-6.89658}}));
  annotation(experiment(StartTime = 0.0, StopTime = 100, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end TestHeater4B;

