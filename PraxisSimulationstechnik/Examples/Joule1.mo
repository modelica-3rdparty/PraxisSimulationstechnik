within PraxisSimulationstechnik.Examples;
model Joule1
  Thermo.SimpleVersion.FluidSource fluidsource1(m_flow = 0.1) annotation(Placement(transformation(origin = {-91.1681,7.97721}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Pump pump1(K = 0.001) annotation(Placement(transformation(origin = {-50.7123,7.69231}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Heater heater1 annotation(Placement(transformation(origin = {-4.8433,7.40741}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Turbine turbine1(K = 0.001) annotation(Placement(transformation(origin = {41.0256,7.12251}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.FluidSink fluidsink1 annotation(Placement(transformation(origin = {72.9345,7.12251}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 242.09) annotation(Placement(transformation(origin = {40.2299,70.977}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque1(tau_constant = 201.58) annotation(Placement(transformation(origin = {-50.8621,46.8391}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.EMF emf(k = 30) annotation(Placement(transformation(origin = {40.5172,40.8046}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {78.1609,40.5172}, extent = {{12,-12},{-12,12}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow1(Q_flow = 42481) annotation(Placement(transformation(origin = {-4.5977,44.5402}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-73.8506,-34.7701}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {-28.1609,-34.4828}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement4 annotation(Placement(transformation(origin = {59.7701,-33.3333}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement3 annotation(Placement(transformation(origin = {20.4023,-35.6322}, extent = {{-12,-12},{12,12}}, rotation = -90)));
equation
  connect(statemeasurement3.inflow,heater1.outflow) annotation(Line(points = {{20.4023,-23.6322},{20.4023,-23.6322},{20.4023,7.47126},{7.1567,7.47126},{7.1567,7.40741}}));
  connect(statemeasurement4.inflow,turbine1.outflow) annotation(Line(points = {{59.7701,-21.3333},{59.7701,-21.3333},{59.7701,7.18391},{53.0256,7.18391},{53.0256,7.12251}}));
  connect(statemeasurement2.inflow,pump1.outflow) annotation(Line(points = {{-28.1609,-22.4828},{-28.1609,-22.4828},{-28.1609,7.75862},{-38.7123,7.75862},{-38.7123,7.69231}}));
  connect(statemeasurement1.inflow,fluidsource1.outflow) annotation(Line(points = {{-73.8506,-22.7701},{-73.8506,-22.7701},{-73.8506,8.04598},{-85.1681,8.04598},{-85.1681,7.97721}}));
  connect(fixedheatflow1.port,heater1.heat) annotation(Line(points={{-4.5977,
          32.5402},{-4.5977,32.5402},{-4.5977,19.4074},{-4.8433,19.4074}}));
  connect(ground1.p,emf.p) annotation(Line(points={{66.1609,40.5172},{66.1609,
          40.8046},{52.5172,40.8046}}));
  connect(resistor1.n,emf.p) annotation(Line(points={{52.2299,70.977},{58.6207,
          70.977},{58.6207,40.8046},{52.5172,40.8046}}));
  connect(resistor1.p,emf.n) annotation(Line(points={{28.2299,70.977},{22.7011,
          70.977},{22.7011,40.8046},{28.5172,40.8046}}));
  connect(emf.flange,turbine1.shaft) annotation(Line(points={{40.5172,28.8046},
          {41.092,28.8046},{41.092,19.1225},{41.0256,19.1225}}));
  connect(constanttorque1.flange,pump1.shaft) annotation(Line(points={{-50.8621,
          34.8391},{-50.5747,34.8391},{-50.5747,19.6923},{-50.7123,19.6923}}));
  connect(heater1.outflow,turbine1.inflow) annotation(Line(points = {{7.1567,7.40741},{28.7749,7.40741},{28.7749,7.12251},{29.0256,7.12251}}));
  connect(turbine1.outflow,fluidsink1.inflow) annotation(Line(points={{53.0256,
          7.12251},{66.0969,7.12251},{66.0969,7.12251},{66.9345,7.12251}}));
  connect(fluidsource1.outflow,pump1.inflow) annotation(Line(points = {{-85.1681,7.97721},{-62.1083,7.97721},{-62.1083,7.69231},{-62.7123,7.69231}}));
  connect(pump1.outflow,heater1.inflow) annotation(Line(points = {{-38.7123,7.69231},{-16.5242,7.69231},{-16.5242,7.40741},{-16.8433,7.40741}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Joule1;

