within PraxisSimulationstechnik.Examples;
model Joule5A
  Thermo.SimpleWaterDevices.Pump pump2(K = 0.001) annotation(Placement(transformation(origin = {-66.6436,-24.3793}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.Turbine turbine2(K = 0.001) annotation(Placement(transformation(origin = {25.7241,-24.3793}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap18.Efficiency efficiency1 annotation(Placement(transformation(origin = {-35.0575,85.0575}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.FluidSink fluidsink2 annotation(Placement(transformation(origin = {102.471,-24.3793}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.Heater heater3 annotation(Placement(transformation(origin = {-20.6207,-24.3793}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 106) annotation(Placement(transformation(origin = {24.5058,78.0046}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.Heater heater1 annotation(Placement(transformation(origin = {72.7011,-24.7126}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.EMF emf(k = 30) annotation(Placement(transformation(origin = {25.3678,39.2115}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-89.1724,-63.9655}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {-45.4023,-63.9655}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement3 annotation(Placement(transformation(origin = {2.87356,-63.6437}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement4 annotation(Placement(transformation(origin = {43.8391,-63.3908}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque1(tau_constant = 6) annotation(Placement(transformation(origin = {-66.3719,39.9853}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 319) annotation(Placement(transformation(origin = {72.4138,38.5057}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement5 annotation(Placement(transformation(origin = {91.3793,-64.3678}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {61.2772,77.7172}, extent = {{12,-12},{-12,12}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow1(Q_flow = 322520) annotation(Placement(transformation(origin = {-20.5411,39.3425}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleWaterDevices.FluidSource fluidsource1(T = 319) annotation(Placement(transformation(origin = {-106.034,-25}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powersensor1 annotation(Placement(transformation(origin = {-66.3347,8.13931}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatflowsensor1 annotation(Placement(transformation(origin = {-20.5563,7.41839}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powersensor2 annotation(Placement(transformation(origin = {25.5826,6.69747}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatflowsensor2 annotation(Placement(transformation(origin = {72.7011,7.18391}, extent = {{-12,-12},{12,12}}, rotation = -90)));
equation
  connect(fixedtemperature1.port,heatflowsensor2.port_a) annotation(Line(points={{72.4138,
          26.5057},{72.7011,26.5057},{72.7011,19.1839},{72.7011,19.1839}}));
  connect(heatflowsensor2.Q_flow,efficiency1.Qdot2) annotation(Line(points = {{60.7011,7.18391},{60.7011,7.47126},{50,7.47126},{50,60.9195},{-27.8736,60.9195},{-27.8736,72.4575},{-27.8575,72.4575}}));
  connect(heatflowsensor2.port_b,heater1.heat) annotation(Line(points = {{72.7011,-4.81609},{72.7011,-4.81609},{72.7011,-12.7126},{72.7011,-12.7126}}));
  connect(turbine2.shaft,powersensor2.flange_b) annotation(Line(points = {{25.7241,-12.3793},{25.7242,-12.3793},{25.5826,-5.30253},{25.5826,-5.30253}}));
  connect(powersensor2.flange_a,emf.flange) annotation(Line(points={{25.5826,
          18.6975},{25.5826,18.6975},{25.5826,27.2115},{25.3678,27.2115}}));
  connect(efficiency1.P2,powersensor2.power) annotation(Line(points={{-22.4575,
          85.0575},{-0.574713,85.0575},{-0.574713,16.092},{12.3826,16.092},{
          12.3826,16.2975}}));
  connect(efficiency1.Qdot1,heatflowsensor1.Q_flow) annotation(Line(points = {{-42.2575,72.4575},{-42.2575,7.47126},{-32.5563,7.47126},{-32.5563,7.41839}}));
  connect(heatflowsensor1.port_b,heater3.heat) annotation(Line(points = {{-20.5563,-4.58161},{-20.5563,-4.58161},{-20.6552,-12.3793},{-20.6207,-12.3793}}));
  connect(heatflowsensor1.port_a,fixedheatflow1.port) annotation(Line(points={{
          -20.5563,19.4184},{-20.5563,19.4184},{-20.5563,27.3425},{-20.5411,
          27.3425}}));
  connect(pump2.shaft,powersensor1.flange_b) annotation(Line(points = {{-66.6436,-12.3793},{-66.3218,-12.3793},{-66.3347,-3.86069},{-66.3347,-3.86069}}));
  connect(powersensor1.flange_a,constanttorque1.flange) annotation(Line(points={{
          -66.3347,20.1393},{-66.3347,20.1393},{-66.3347,27.9853},{-66.3719,
          27.9853}}));
  connect(efficiency1.P1,powersensor1.power) annotation(Line(points={{-47.6575,
          85.0575},{-85.6322,85.0575},{-85.6322,17.5287},{-79.5347,17.5287},{
          -79.5347,17.7393}}));
  connect(statemeasurement1.inflow,pump2.inflow) annotation(Line(points = {{-89.1724,-51.9655},{-89.1724,-51.9655},{-89.1724,-24.4137},{-78.6436,-24.4137},{-78.6436,-24.3793}}));
  connect(pump2.inflow,fluidsource1.outflow) annotation(Line(points = {{-78.6436,-24.3793},{-99.7126,-24.3793},{-99.7126,-25},{-100.034,-25}}));
  connect(heater1.outflow,fluidsink2.inflow) annotation(Line(points = {{84.7011,-24.7126},{96.8391,-24.7126},{96.8391,-24.3793},{96.471,-24.3793}}));
  connect(heater1.inflow,turbine2.outflow) annotation(Line(points = {{60.7011,-24.7126},{37.931,-24.7126},{37.931,-24.3793},{37.7241,-24.3793}}));
  connect(statemeasurement5.inflow,heater1.outflow) annotation(Line(points = {{91.3793,-52.3678},{91.092,-52.3678},{91.092,-24.7126},{84.7011,-24.7126},{84.7011,-24.7126}}));
  connect(ground1.p,resistor1.n) annotation(Line(points = {{49.2772,77.7172},{49.2772,77.8736},{36.5058,77.8736},{36.5058,78.0046}}));
  connect(resistor1.n,emf.p) annotation(Line(points={{36.5058,78.0046},{43.4713,
          78.0046},{43.4713,39.2115},{13.3678,39.2115},{13.3678,39.2115}}));
  connect(resistor1.p,emf.n) annotation(Line(points={{12.5058,78.0046},{7.55167,
          78.0046},{7.55167,39.2115},{37.3678,39.2115},{37.3678,39.2115}}));
  connect(heater3.inflow,pump2.outflow) annotation(Line(points = {{-32.6207,-24.3793},{-54.4138,-24.3793},{-54.4138,-24.3793},{-54.6436,-24.3793}}));
  connect(statemeasurement3.inflow,heater3.outflow) annotation(Line(points={{2.87356,
          -51.6437},{2.22989,-51.6437},{2.22989,-24.3793},{-8.6207,-24.3793},{
          -8.6207,-24.3793}}));
  connect(turbine2.inflow,heater3.outflow) annotation(Line(points={{13.7241,
          -24.3793},{-8.39084,-24.3793},{-8.39084,-24.3793},{-8.6207,-24.3793}}));
  connect(statemeasurement4.inflow,turbine2.outflow) annotation(Line(points = {{43.8391,-51.3908},{43.9655,-51.3908},{43.9655,-24.7126},{37.7241,-24.7126},{37.7241,-24.3793}}));
  connect(statemeasurement2.inflow,pump2.outflow) annotation(Line(points = {{-45.4023,-51.9655},{-45.7241,-51.9655},{-45.7241,-24.3793},{-54.6436,-24.3793},{-54.6436,-24.3793}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Joule5A;

