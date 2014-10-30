within PraxisSimulationstechnik.Examples;
model Joule2
  Thermo.SimpleVersion.FluidSource fluidsource1(m_flow = 0.1) annotation(Placement(transformation(origin = {-109.552,-25.5455}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Pump pump1(K = 0.001) annotation(Placement(transformation(origin = {-69.0957,-25.8304}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Heater heater1 annotation(Placement(transformation(origin = {-23.2267,-26.1153}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Turbine turbine1(K = 0.001) annotation(Placement(transformation(origin = {22.6422,-26.4002}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.FluidSink fluidsink1 annotation(Placement(transformation(origin = {108.214,-26.0398}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Heater heater2 annotation(Placement(transformation(origin = {79.7159,-26.3389}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 242.09) annotation(Placement(transformation(origin = {22.2069,67.3724}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap18.Efficiency efficiency1 annotation(Placement(transformation(origin = {-35.6855,87.2313}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-92.234,-68.2929}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {-46.5443,-68.0056}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement4 annotation(Placement(transformation(origin = {41.3867,-66.8561}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement3 annotation(Placement(transformation(origin = {2.01885,-69.155}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement5 annotation(Placement(transformation(origin = {97.6846,-69.2083}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powersensor1 annotation(Placement(transformation(origin = {-69.2083,6.12782}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque1(tau_constant = 201.58) annotation(Placement(transformation(origin = {-69.2455,38.5485}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powersensor2 annotation(Placement(transformation(origin = {22.709,4.68598}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  Modelica.Electrical.Analog.Basic.EMF emf(k = 30) annotation(Placement(transformation(origin = {22.4942,37.2}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {57.2542,36.9126}, extent = {{12,-12},{-12,12}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatflowsensor1 annotation(Placement(transformation(origin = {-23.4299,5.4069}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow1(Q_flow = 42481) annotation(Placement(transformation(origin = {-23.7021,37.331}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatflowsensor2 annotation(Placement(transformation(origin = {79.6616,6.12782}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 300) annotation(Placement(transformation(origin = {79.6616,38.2087}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(powersensor2.power,efficiency1.P2) annotation(Line(points={{9.509,
          14.286},{9.509,14.4184},{0.36046,14.4184},{0.36046,87.2313},{-23.0855,
          87.2313}}));
  connect(heatflowsensor2.Q_flow,efficiency1.Qdot2) annotation(Line(points={{67.6616,
          6.12782},{67.6616,6.12782},{49.383,6.12782},{49.383,-9.73241},{
          -5.76736,-9.73241},{-5.76736,65.6037},{-28.4763,65.6037},{-28.4763,
          74.6313},{-28.4855,74.6313}}));
  connect(heatflowsensor1.Q_flow,efficiency1.Qdot1) annotation(Line(points={{
          -35.4299,5.4069},{-35.4299,5.4069},{-42.8947,5.4069},{-42.8947,
          71.0106},{-42.8947,74.6313},{-42.8855,74.6313}}));
  connect(powersensor1.power,efficiency1.P1) annotation(Line(points={{-82.4083,
          15.7278},{-82.4083,15.8602},{-92.9986,15.8602},{-92.9986,87.2313},{
          -48.2855,87.2313}}));
  connect(fixedtemperature1.port,heatflowsensor2.port_a) annotation(Line(points={{79.6616,
          26.2087},{79.6616,18.1278}}));
  connect(heatflowsensor2.port_b,heater2.heat) annotation(Line(points = {{79.6616,-5.87218},{79.6616,-5.87218},{79.6616,-14.3389},{79.7159,-14.3389}}));
  connect(heatflowsensor1.port_a,fixedheatflow1.port) annotation(Line(points = {{-23.4299,17.4069},{-23.4299,17.4069},{-23.4299,25.331},{-23.7021,25.331}}));
  connect(heatflowsensor1.port_b,heater1.heat) annotation(Line(points = {{-23.4299,-6.5931},{-23.0694,-6.5931},{-23.0694,-14.1153},{-23.2267,-14.1153}}));
  connect(powersensor2.flange_a,emf.flange) annotation(Line(points={{22.709,
          16.686},{22.3485,16.686},{22.3485,25.2},{22.4942,25.2}}));
  connect(ground1.p,emf.p) annotation(Line(points={{45.2542,36.9126},{45.2542,
          37.2},{34.4942,37.2}}));
  connect(resistor1.p,emf.n) annotation(Line(points={{10.2069,67.3724},{4.67811,
          67.3724},{4.67811,37.2},{10.4942,37.2}}));
  connect(resistor1.n,emf.p) annotation(Line(points={{34.2069,67.3724},{40.5977,
          67.3724},{40.5977,37.2},{34.4942,37.2}}));
  connect(powersensor2.flange_b,turbine1.shaft) annotation(Line(points={{22.709,
          -7.31402},{22.709,-7.31402},{22.709,-14.4002},{22.6422,-14.4002}}));
  connect(powersensor1.flange_a,constanttorque1.flange) annotation(Line(points={{
          -69.2083,18.1278},{-69.2083,18.1278},{-69.2083,26.5485},{-69.2455,
          26.5485}}));
  connect(powersensor1.flange_b,pump1.shaft) annotation(Line(points = {{-69.2083,-5.87218},{-69.2083,-5.87218},{-69.2083,-13.8304},{-69.0957,-13.8304}}));
  connect(statemeasurement5.inflow,heater2.outflow) annotation(Line(points = {{97.6846,-57.2083},{97.6846,-57.2083},{97.6846,-26.3136},{91.7159,-26.3136},{91.7159,-26.3389}}));
  connect(heater2.outflow,fluidsink1.inflow) annotation(Line(points={{91.7159,
          -26.3389},{101.65,-26.3389},{101.65,-26.0398},{102.214,-26.0398}}));
  connect(heater2.inflow,turbine1.outflow) annotation(Line(points = {{67.7159,-26.3389},{35.3251,-26.3389},{35.3251,-26.4002},{34.6422,-26.4002}}));
  connect(statemeasurement3.inflow,heater1.outflow) annotation(Line(points = {{2.01885,-57.155},{2.01885,-57.155},{2.01885,-26.0515},{-11.2267,-26.0515},{-11.2267,-26.1153}}));
  connect(statemeasurement4.inflow,turbine1.outflow) annotation(Line(points = {{41.3867,-54.8561},{41.3867,-54.8561},{41.3867,-26.3388},{34.6422,-26.3388},{34.6422,-26.4002}}));
  connect(statemeasurement2.inflow,pump1.outflow) annotation(Line(points = {{-46.5443,-56.0056},{-46.4993,-56.0056},{-46.4993,-25.9531},{-57.0957,-25.9531},{-57.0957,-25.8304}}));
  connect(statemeasurement1.inflow,fluidsource1.outflow) annotation(Line(points = {{-92.234,-56.2929},{-92.234,-56.2929},{-92.234,-25.4768},{-103.552,-25.4768},{-103.552,-25.5455}}));
  connect(heater1.outflow,turbine1.inflow) annotation(Line(points = {{-11.2267,-26.1153},{10.3915,-26.1153},{10.3915,-26.4002},{10.6422,-26.4002}}));
  connect(pump1.outflow,heater1.inflow) annotation(Line(points = {{-57.0957,-25.8304},{-34.9076,-25.8304},{-34.9076,-26.1153},{-35.2267,-26.1153}}));
  connect(fluidsource1.outflow,pump1.inflow) annotation(Line(points = {{-103.552,-25.5455},{-80.4917,-25.5455},{-80.4917,-25.8304},{-81.0957,-25.8304}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,-150},{
            150,150}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-150,-150},{150,
            150}})),
    uses(Modelica(version="3.2.1")));
end Joule2;

