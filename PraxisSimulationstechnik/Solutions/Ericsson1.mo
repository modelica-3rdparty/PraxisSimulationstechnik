within PraxisSimulationstechnik.Solutions;
model Ericsson1
  Thermo.SimpleVersion.Heater heater1 annotation(Placement(transformation(origin = {-26.3876,11.8157}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Heater heater2 annotation(Placement(transformation(origin = {76.555,11.5921}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 242.09) annotation(Placement(transformation(origin = {13.8736,73.1195}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap18.PumpT pumpt1(K = 0.001, epsi = 6) annotation(Placement(transformation(origin = {-72.1265,12.3563}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.FluidSource fluidsource1(m_flow = 0.1) annotation(Placement(transformation(origin = {-112.713,12.3855}, extent = {{-10.7452,-10.7452},{10.7452,10.7452}})));
  Thermo.SimpleVersion.FluidSink fluidsink1 annotation(Placement(transformation(origin = {105.053,11.8912}, extent = {{-11.8197,-11.8197},{11.8197,11.8197}})));
  PJLoeslib.Kap18.TurbineT turbinet1(K = 0.001, epsi = 1 / 6) annotation(Placement(transformation(origin = {20.1149,11.7816}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-95.3949,-30.3619}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {-49.7052,-30.0746}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement4 annotation(Placement(transformation(origin = {46.5591,-30.3618}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement3 annotation(Placement(transformation(origin = {-1.14207,-31.224}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement5 annotation(Placement(transformation(origin = {94.5237,-31.2773}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque1(tau_constant = 201.58) annotation(Placement(transformation(origin = {-72.1191,50.0428}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.EMF emf(k = 30) annotation(Placement(transformation(origin = {14.1609,42.9471}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {48.9209,42.6597}, extent = {{12,-12},{-12,12}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow1(Q_flow = 42481) annotation(Placement(transformation(origin = {-26.2883,50.8367}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 300) annotation(Placement(transformation(origin = {76.788,47.6915}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(statemeasurement3.inflow,heater1.outflow) annotation(Line(points = {{-1.14207,-19.224},{-1.14207,-19.224},{-1.14207,11.5946},{-14.3876,11.5946},{-14.3876,11.8157}}));
  connect(statemeasurement1.inflow,fluidsource1.outflow) annotation(Line(points={{
          -95.3949,-18.3619},{-95.3949,-18.3619},{-95.3949,12.1693},{-107.34,
          12.1693},{-107.34,12.3855}}));
  connect(statemeasurement4.inflow,turbinet1.outflow) annotation(Line(points = {{46.5591,-18.3618},{46.5517,-18.3618},{46.5517,11.7816},{32.1149,11.7816},{32.1149,11.7816}}));
  connect(turbinet1.shaft,emf.flange) annotation(Line(points = {{20.1149,23.7816},{14.6552,23.7816},{14.6552,30.9471},{14.1609,30.9471}}));
  connect(turbinet1.outflow,heater2.inflow) annotation(Line(points = {{32.1149,11.7816},{64.9425,11.7816},{64.9425,11.5921},{64.555,11.5921}}));
  connect(turbinet1.inflow,heater1.outflow) annotation(Line(points={{8.1149,
          11.7816},{-14.0805,11.7816},{-14.0805,11.8157},{-14.3876,11.8157}}));
  connect(heater2.outflow,fluidsink1.inflow) annotation(Line(points={{88.555,
          11.5921},{98.4891,11.5921},{98.4891,11.8912},{99.1431,11.8912}}));
  connect(pumpt1.inflow,fluidsource1.outflow) annotation(Line(points={{-84.1265,
          12.3563},{-106.897,12.3563},{-106.897,12.3855},{-107.34,12.3855}}));
  connect(statemeasurement2.inflow,pumpt1.outflow) annotation(Line(points = {{-49.7052,-18.0746},{-49.7126,-18.0746},{-49.7126,12.3563},{-60.1265,12.3563},{-60.1265,12.3563}}));
  connect(pumpt1.shaft,constanttorque1.flange) annotation(Line(points = {{-72.1265,24.3563},{-72.1264,24.3563},{-72.1264,38.0428},{-72.1191,38.0428}}));
  connect(pumpt1.outflow,heater1.inflow) annotation(Line(points = {{-60.1265,12.3563},{-37.3563,12.3563},{-37.3563,11.8157},{-38.3876,11.8157}}));
  connect(fixedtemperature1.port,heater2.heat) annotation(Line(points = {{76.788,35.6915},{76.7241,35.6915},{76.7241,23.5921},{76.555,23.5921}}));
  connect(fixedheatflow1.port,heater1.heat) annotation(Line(points = {{-26.2883,38.8367},{-26.4368,38.8367},{-26.4368,23.8157},{-26.3876,23.8157}}));
  connect(ground1.p,emf.p) annotation(Line(points={{36.9209,42.6597},{36.9209,
          42.9471},{26.1609,42.9471}}));
  connect(resistor1.n,emf.p) annotation(Line(points={{25.8736,73.1195},{32.2644,
          73.1195},{32.2644,42.9471},{26.1609,42.9471}}));
  connect(resistor1.p,emf.n) annotation(Line(points={{1.8736,73.1195},{-3.65522,
          73.1195},{-3.65522,42.9471},{2.1609,42.9471}}));
  connect(statemeasurement5.inflow,heater2.outflow) annotation(Line(points = {{94.5237,-19.2773},{94.5237,-19.2773},{94.5237,11.6174},{88.555,11.6174},{88.555,11.5921}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Ericsson1;

