within PraxisSimulationstechnik.Examples;
model Joule4
  Thermo.DryAirDevices.Pump pump2(K = 0.001) annotation(Placement(transformation(origin = {-69.5172,-26.3908}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.Heater heater3 annotation(Placement(transformation(origin = {-23.4943,-26.3908}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.Turbine turbine2(K = 0.001) annotation(Placement(transformation(origin = {22.8505,-26.3908}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.Heater heater1 annotation(Placement(transformation(origin = {79.4943,-26.3908}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.FluidSink fluidsink2 annotation(Placement(transformation(origin = {114.253,-26.3908}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap18.Efficiency efficiency1 annotation(Placement(transformation(origin = {-35.6855,86.6615}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.FluidSource fluidsource2 annotation(Placement(transformation(origin = {-108.034,-26.6667}, extent = {{-12,-12},{12,12}})));
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
  Thermo.DryAirDevices.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-92.046,-65.977}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {-48.2759,-65.977}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement3 annotation(Placement(transformation(origin = {0,-65.6552}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement4 annotation(Placement(transformation(origin = {52.4598,-65.977}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement5 annotation(Placement(transformation(origin = {98.8947,-67.2257}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 242.09) annotation(Placement(transformation(origin = {22.2069,67.085}, extent = {{-12,-12},{12,12}})));
equation
  connect(resistor1.n,emf.p) annotation(Line(points={{34.2069,67.085},{40.5977,
          67.085},{40.5977,37.2},{34.4942,37.2}}));
  connect(resistor1.p,emf.n) annotation(Line(points={{10.2069,67.085},{4.67811,
          67.085},{4.67811,37.2},{10.4942,37.2}}));
  connect(fluidsource2.outflow,pump2.inflow) annotation(Line(points={{-102.034,
          -26.6667},{-81.4253,-26.6667},{-81.4253,-26.3908},{-81.5172,-26.3908}}));
  connect(statemeasurement1.inflow,fluidsource2.outflow) annotation(Line(points={{-92.046,
          -53.977},{-92.3678,-53.977},{-92.3678,-26.7126},{-102.034,-26.7126},{
          -102.034,-26.6667}}));
  connect(powersensor1.power,efficiency1.P1) annotation(Line(points={{-82.4083,
          15.7278},{-82.4083,15.8602},{-92.9986,15.8602},{-92.9986,87.2313},{
          -48.2855,87.2313},{-48.2855,86.6615}}));
  connect(heatflowsensor1.Q_flow,efficiency1.Qdot1) annotation(Line(points={{
          -35.4299,5.4069},{-35.4299,5.4069},{-42.8947,5.4069},{-42.8947,
          71.0106},{-42.8947,74.0615},{-42.8855,74.0615}}));
  connect(heatflowsensor2.Q_flow,efficiency1.Qdot2) annotation(Line(points={{67.6616,
          6.12782},{67.6616,6.12782},{49.383,6.12782},{49.383,-9.73241},{
          -5.76736,-9.73241},{-5.76736,65.6037},{-28.4763,65.6037},{-28.4763,
          74.0615},{-28.4855,74.0615}}));
  connect(powersensor2.power,efficiency1.P2) annotation(Line(points={{9.509,
          14.286},{9.509,14.4184},{0.36046,14.4184},{0.36046,87.2313},{-23.0855,
          87.2313},{-23.0855,86.6615}}));
  connect(statemeasurement5.inflow,heater1.outflow) annotation(Line(points = {{98.8947,-55.2257},{98.8046,-55.2257},{98.8046,-26.3908},{91.4943,-26.3908},{91.4943,-26.3908}}));
  connect(heater1.outflow,fluidsink2.inflow) annotation(Line(points = {{91.4943,-26.3908},{108.782,-26.3908},{108.782,-26.3908},{108.253,-26.3908}}));
  connect(heater1.heat,heatflowsensor2.port_b) annotation(Line(points = {{79.4943,-14.3908},{79.8161,-14.3908},{79.8161,-5.87218},{79.6616,-5.87218}}));
  connect(heater1.inflow,turbine2.outflow) annotation(Line(points = {{67.4943,-26.3908},{34.4368,-26.3908},{34.4368,-26.3908},{34.8505,-26.3908}}));
  connect(statemeasurement4.inflow,turbine2.outflow) annotation(Line(points = {{52.4598,-53.977},{52.4598,-53.977},{52.4598,-26.3908},{34.8505,-26.3908},{34.8505,-26.3908}}));
  connect(turbine2.shaft,powersensor2.flange_b) annotation(Line(points = {{22.8505,-14.3908},{22.8506,-14.3908},{22.8506,-7.31402},{22.709,-7.31402}}));
  connect(turbine2.inflow,heater3.outflow) annotation(Line(points = {{10.8505,-26.3908},{-11.2644,-26.3908},{-11.2644,-26.3908},{-11.4943,-26.3908}}));
  connect(statemeasurement3.inflow,heater3.outflow) annotation(Line(points = {{0,-53.6552},{-0.643678,-53.6552},{-0.643678,-26.3908},{-11.4943,-26.3908},{-11.4943,-26.3908}}));
  connect(heatflowsensor1.port_b,heater3.heat) annotation(Line(points = {{-23.4299,-6.5931},{-23.8161,-6.5931},{-23.8161,-14.3908},{-23.4943,-14.3908}}));
  connect(heater3.inflow,pump2.outflow) annotation(Line(points = {{-35.4943,-26.3908},{-57.2874,-26.3908},{-57.2874,-26.3908},{-57.5172,-26.3908}}));
  connect(statemeasurement2.inflow,pump2.outflow) annotation(Line(points = {{-48.2759,-53.977},{-48.5977,-53.977},{-48.5977,-26.3908},{-57.5172,-26.3908},{-57.5172,-26.3908}}));
  connect(pump2.shaft,powersensor1.flange_b) annotation(Line(points = {{-69.5172,-14.3908},{-69.1954,-14.3908},{-69.1954,-5.87218},{-69.2083,-5.87218}}));
  connect(fixedtemperature1.port,heatflowsensor2.port_a) annotation(Line(points={{79.6616,
          26.2087},{79.6616,18.1278},{79.6616,18.1278}}));
  connect(heatflowsensor1.port_a,fixedheatflow1.port) annotation(Line(points = {{-23.4299,17.4069},{-23.4299,17.4069},{-23.4299,25.331},{-23.7021,25.331}}));
  connect(powersensor2.flange_a,emf.flange) annotation(Line(points={{22.709,
          16.686},{22.3485,16.686},{22.3485,25.2},{22.4942,25.2}}));
  connect(ground1.p,emf.p) annotation(Line(points={{45.2542,36.9126},{45.2542,
          37.2},{34.4942,37.2}}));
  connect(powersensor1.flange_a,constanttorque1.flange) annotation(Line(points={{
          -69.2083,18.1278},{-69.2083,18.1278},{-69.2083,26.5485},{-69.2455,
          26.5485}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,-150},{
            150,150}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-150,-150},{150,
            150}})),
    uses(Modelica(version="3.2.1")));
end Joule4;

