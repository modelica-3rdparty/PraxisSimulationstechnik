within PraxisSimulationstechnik.Solutions;
model DieselC
  Thermo.SimpleVersion.Cylinder cylinder1(m = 0.001, T(start = 350, fixed = true)) annotation(Placement(transformation(origin = {36.9879,64.105}, extent = {{-12,-12},{12,12}})));
  Thermo.Auxiliary.ThermoSwitch thermoswitch1 annotation(Placement(transformation(origin = {1.43678,63.7931}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = 10) annotation(Placement(transformation(origin = {-31.0345,70.6897}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedheatflow1 annotation(Placement(transformation(origin = {-33.6207,38.5057}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {73.1703,64.105}, extent = {{12,12},{-12,-12}}, rotation = -180)));
  Thermo.SimpleVersion.PressureSensor pressuresensor1 annotation(Placement(transformation(origin = {-19.5402,-6.6092}, extent = {{12,12},{-12,-12}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 350) annotation(Placement(transformation(origin = {-69.5476,70.6897}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap18.DieselSteuerung2 dieselsteuerung21(Qzu = 875, x1 = 0, x2 = -0.09, x3 = -0.08, x4 = 0) annotation(Placement(transformation(origin = {-70.9402,20.2279}, extent = {{-12,-12},{12,12}})));
equation
  connect(pressuresensor1.p,dieselsteuerung21.u) annotation(Line(points = {{-31.5402,-6.6092},{-90.5983,-6.6092},{-90.5983,19.943},{-83.5402,19.943},{-83.5402,20.2279}}));
  connect(dieselsteuerung21.x,position1.s_ref) annotation(Line(points = {{-58.3402,14.2279},{96.2963,14.2279},{96.2963,64.3875},{87.5703,64.3875},{87.5703,64.105}}));
  connect(dieselsteuerung21.sw,thermoswitch1.control) annotation(Line(points = {{-58.3402,20.2279},{1.7094,20.2279},{1.7094,51.7931},{1.43678,51.7931}}));
  connect(dieselsteuerung21.Qdot,prescribedheatflow1.Q_flow) annotation(Line(points = {{-58.3402,26.2279},{-54.1311,26.2279},{-54.1311,38.4615},{-45.6207,38.4615},{-45.6207,38.5057}}));
  connect(fixedtemperature1.port,thermalconductor1.port_a) annotation(Line(points = {{-57.5476,70.6897},{-43.3908,70.6897},{-43.3908,70.6897},{-43.0345,70.6897}}));
  connect(cylinder1.out_state,pressuresensor1.state) annotation(Line(points = {{33.9879,71.305},{33.6207,71.305},{33.6207,79.023},{18.9655,79.023},{18.9655,-6.6092},{-7.54023,-6.6092},{-7.54023,-6.6092}}));
  connect(prescribedheatflow1.port,thermoswitch1.thIn2) annotation(Line(points = {{-21.6207,38.5057},{-15.8046,38.5057},{-15.8046,56.0345},{-10.5632,56.0345},{-10.5632,56.5931}}));
  connect(thermalconductor1.port_b,thermoswitch1.thIn1) annotation(Line(points = {{-19.0345,70.6897},{-10.6322,70.6897},{-10.6322,70.9931},{-10.5632,70.9931}}));
  connect(thermoswitch1.thOut,cylinder1.in_th) annotation(Line(points = {{13.4368,63.7931},{25.2874,63.7931},{25.2874,64.105},{24.9879,64.105}}));
  connect(position1.flange,cylinder1.piston) annotation(Line(points = {{61.1703,64.105},{49.2386,64.105},{49.2386,64.105},{48.9879,64.105}}));
  annotation(experiment(StartTime = 0.0, StopTime = 12.1, Tolerance = 0.000001));
end DieselC;

