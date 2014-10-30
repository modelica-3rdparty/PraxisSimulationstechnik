within PraxisSimulationstechnik.Solutions;
model Ericsson2
  Thermo.SimpleVersion.FluidSource fluidsource1(m_flow = 0.1) annotation(Placement(transformation(origin = {-132.982,74.6623}, extent = {{-13.0016,-13.0016},{13.0016,13.0016}})));
  Thermo.SimpleVersion.Pump pump1(K = 0.001) annotation(Placement(transformation(origin = {-92.5256,74.3774}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Heater heater3 annotation(Placement(transformation(origin = {-41.4529,74.2547}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Heater heater1 annotation(Placement(transformation(origin = {-11.3315,-54.5916}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Turbine turbine1(K = 0.001) annotation(Placement(transformation(origin = {34.5374,-54.8765}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.FluidSink fluidsink1 annotation(Placement(transformation(origin = {124.707,-54.8035}, extent = {{-11.8197,-11.8197},{11.8197,11.8197}})));
  Thermo.SimpleVersion.Heater heater2 annotation(Placement(transformation(origin = {91.6111,-54.8152}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 658) annotation(Placement(transformation(origin = {34.1021,11.0225}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Heater heater4 annotation(Placement(transformation(origin = {46.8598,73.8943}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Pump pump3(K = 0.001) annotation(Placement(transformation(origin = {89.7545,73.5338}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Turbine turbine2(K = 0.001) annotation(Placement(transformation(origin = {-58.7549,-54.4294}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Heater heater5 annotation(Placement(transformation(origin = {-101.289,-54.4294}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 658) annotation(Placement(transformation(origin = {-59.8363,11.1743}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Pump pump2(K = 0.001) annotation(Placement(transformation(origin = {3.24414,74.6152}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque1(tau_constant = 56) annotation(Placement(transformation(origin = {-92.6754,110.883}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-115.664,54.2634}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement4 annotation(Placement(transformation(origin = {53.2819,-80.914}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement5 annotation(Placement(transformation(origin = {109.58,-83.2662}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.EMF emf(k = 30) annotation(Placement(transformation(origin = {34.3894,-19.1499}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow1(Q_flow = 17000) annotation(Placement(transformation(origin = {-10.6575,-19.0189}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 300) annotation(Placement(transformation(origin = {91.5568,-18.1412}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature2(T = 300) annotation(Placement(transformation(origin = {-41.0924,109.219}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature3(T = 300) annotation(Placement(transformation(origin = {47.2202,109.58}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque3(tau_constant = 56) annotation(Placement(transformation(origin = {90.1149,109.219}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque2(tau_constant = 56) annotation(Placement(transformation(origin = {2.52322,108.498}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement1a annotation(Placement(transformation(origin = {-18.3834,49.7434}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow2(Q_flow = 25000) annotation(Placement(transformation(origin = {-101.289,-15.8602}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {64.1029,-19.0768}, extent = {{7.45106,-7.45106},{-7.45106,7.45106}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(Placement(transformation(origin = {-30.6391,-18.3834}, extent = {{6.77369,-6.77369},{-6.77369,6.77369}}, rotation = 90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement1b annotation(Placement(transformation(origin = {70.6501,46.1389}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {-123.683,-79.9008}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement3a annotation(Placement(transformation(origin = {13.914,-83.2129}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleVersion.StateMeasurement statemeasurement3 annotation(Placement(transformation(origin = {-78.2198,-78.9407}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.EMF emf1(k = 30) annotation(Placement(transformation(origin = {-59.4759,-18.023}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
equation
  connect(emf1.flange,turbine2.shaft) annotation(Line(points = {{-59.4759,-30.023},{-59.1154,-30.023},{-59.1154,-42.4294},{-58.7549,-42.4294}}));
  connect(resistor2.n,emf1.p) annotation(Line(points={{-47.8363,11.1743},{
          -43.2552,11.1743},{-43.2552,-18.023},{-47.4759,-18.023}}));
  connect(resistor2.p,emf1.n) annotation(Line(points={{-71.8363,11.1743},{
          -76.7779,11.1743},{-76.7779,-18.023},{-71.4759,-18.023}}));
  connect(ground2.p,emf1.p) annotation(Line(points={{-37.4128,-18.3834},{
          -37.4128,-18.023},{-47.4759,-18.023}}));
  connect(heater3.outflow,pump2.inflow) annotation(Line(points = {{-29.4529,74.2547},{-8.65103,74.2547},{-8.65103,74.6152},{-8.75586,74.6152}}));
  connect(pump2.outflow,heater4.inflow) annotation(Line(points={{15.2441,
          74.6152},{34.6041,74.6152},{34.6041,73.8943},{34.8598,73.8943}}));
  connect(constanttorque2.flange,pump2.shaft) annotation(Line(points = {{2.52322,96.498},{3.24414,96.498},{3.24414,86.6152},{3.24414,86.6152}}));
  connect(pump3.outflow,heater5.inflow) annotation(Line(points={{101.754,
          73.5338},{119.312,73.5338},{119.312,25.2322},{-124.359,25.2322},{
          -124.359,-53.7085},{-113.289,-53.7085},{-113.289,-54.4294}}));
  connect(statemeasurement3.inflow,heater5.outflow) annotation(Line(points={{
          -78.2198,-66.9407},{-78.2198,-66.9407},{-78.2198,-54.4294},{-89.289,
          -54.4294},{-89.289,-54.4294}}));
  connect(statemeasurement3a.inflow,heater1.outflow) annotation(Line(points={{13.914,
          -71.2129},{13.914,-85.6313},{13.914,-54.5278},{0.6685,-54.5278},{
          0.6685,-54.5916}}));
  connect(statemeasurement2.inflow,heater5.inflow) annotation(Line(points = {{-123.683,-67.9008},{-123.638,-67.9008},{-123.638,-53.7085},{-113.289,-53.7085},{-113.289,-54.4294}}));
  connect(statemeasurement1b.inflow,heater4.outflow) annotation(Line(points = {{70.6501,58.1389},{70.2897,58.1389},{70.2897,73.8943},{58.8598,73.8943},{58.8598,73.8943}}));
  connect(statemeasurement1a.inflow,heater3.outflow) annotation(Line(points = {{-18.3834,61.7434},{-18.023,61.7434},{-18.023,74.2547},{-29.4529,74.2547},{-29.4529,74.2547}}));
  connect(ground1.p,emf.p) annotation(Line(points={{56.6518,-19.0768},{56.6518,
          -19.1499},{46.3894,-19.1499}}));
  connect(fixedheatflow2.port,heater5.heat) annotation(Line(points = {{-101.289,-27.8602},{-101.289,-27.8602},{-101.289,-42.4294},{-101.289,-42.4294}}));
  connect(heater5.outflow,turbine2.inflow) annotation(Line(points={{-89.289,
          -54.4294},{-70.2897,-54.4294},{-70.2897,-54.4294},{-70.7549,-54.4294}}));
  connect(turbine2.outflow,heater1.inflow) annotation(Line(points = {{-46.7549,-54.4294},{-22.709,-54.4294},{-22.709,-54.5916},{-23.3315,-54.5916}}));
  connect(constanttorque3.flange,pump3.shaft) annotation(Line(points={{90.1149,
          97.219},{89.7545,97.219},{89.7545,85.5338},{89.7545,85.5338}}));
  connect(fixedtemperature3.port,heater4.heat) annotation(Line(points={{47.2202,
          97.58},{46.8598,97.58},{46.8598,85.8943},{46.8598,85.8943}}));
  connect(fixedtemperature2.port,heater3.heat) annotation(Line(points={{
          -41.0924,97.219},{-41.0924,97.219},{-41.0924,86.2547},{-41.4529,
          86.2547}}));
  connect(heater4.outflow,pump3.inflow) annotation(Line(points = {{58.8598,73.8943},{77.8593,73.8943},{77.8593,73.5338},{77.7545,73.5338}}));
  connect(heater3.inflow,pump1.outflow) annotation(Line(points = {{-53.4529,74.2547},{-80.3825,74.2547},{-80.3825,74.3774},{-80.5256,74.3774}}));
  connect(fixedtemperature1.port,heater2.heat) annotation(Line(points = {{91.5568,-30.1412},{91.2055,-30.1412},{91.2055,-42.8152},{91.6111,-42.8152}}));
  connect(fixedheatflow1.port,heater1.heat) annotation(Line(points = {{-10.6575,-31.0189},{-10.806,-31.0189},{-10.806,-42.5916},{-11.3315,-42.5916}}));
  connect(emf.flange,turbine1.shaft) annotation(Line(points = {{34.3894,-31.1499},{34.8837,-31.1499},{34.8837,-42.8765},{34.5374,-42.8765}}));
  connect(resistor1.p,emf.n) annotation(Line(points={{22.1021,11.0225},{16.5733,
          11.0225},{16.5733,-19.1499},{22.3894,-19.1499}}));
  connect(resistor1.n,emf.p) annotation(Line(points={{46.1021,11.0225},{52.4929,
          11.0225},{52.4929,-19.1499},{46.3894,-19.1499}}));
  connect(statemeasurement5.inflow,heater2.outflow) annotation(Line(points={{109.58,
          -71.2662},{109.58,-85.6846},{109.58,-54.7899},{103.611,-54.7899},{
          103.611,-54.8152}}));
  connect(statemeasurement4.inflow,turbine1.outflow) annotation(Line(points = {{53.2819,-68.914},{53.2819,-83.3324},{53.2819,-54.8151},{46.5374,-54.8151},{46.5374,-54.8765}}));
  connect(heater2.inflow,turbine1.outflow) annotation(Line(points = {{79.6111,-54.8152},{47.2203,-54.8152},{47.2203,-54.8765},{46.5374,-54.8765}}));
  connect(heater2.outflow,fluidsink1.inflow) annotation(Line(points={{103.611,
          -54.8152},{113.545,-54.8152},{113.545,-54.8035},{118.797,-54.8035}}));
  connect(heater1.outflow,turbine1.inflow) annotation(Line(points={{0.6685,
          -54.5916},{22.2867,-54.5916},{22.2867,-54.8765},{22.5374,-54.8765}}));
  connect(statemeasurement1.inflow,fluidsource1.outflow) annotation(Line(points={{
          -115.664,66.2634},{-115.664,43.9149},{-115.664,74.731},{-126.481,
          74.731},{-126.481,74.6623}}));
  connect(constanttorque1.flange,pump1.shaft) annotation(Line(points={{-92.6754,
          98.883},{-92.3954,98.883},{-92.3954,86.3774},{-92.5256,86.3774}}));
  connect(fluidsource1.outflow,pump1.inflow) annotation(Line(points={{-126.481,
          74.6623},{-103.922,74.6623},{-103.922,74.3774},{-104.526,74.3774}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end Ericsson2;

