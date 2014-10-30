within PraxisSimulationstechnik.Examples;
model Otto2
  Thermo.Auxiliary.ThermoSwitch thermoswitch1 annotation(Placement(transformation(origin = {1.43678,63.7931}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = 10) annotation(Placement(transformation(origin = {-31.0345,70.6897}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedheatflow1 annotation(Placement(transformation(origin = {-33.6207,38.5057}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap18.OttoSteuerung ottosteuerung1(Qzu = 800, x1 = 0, x2 = -0.09, x3 = -0.09, x4 = 0) annotation(Placement(transformation(origin = {-74.7126,16.092}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 350) annotation(Placement(transformation(origin = {-70.115,70.6897}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {73.1703,64.105}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Thermo.Devices.Cylinder cylinder2(m = 0.001, T(start=350, fixed=true))     annotation(Placement(transformation(origin = {38.5058,63.7931}, extent = {{-12,-12},{12,12}})));
equation
  connect(cylinder2.piston,position1.flange) annotation(Line(points={{50.5058,
          63.7931},{61.7816,63.7931},{61.7816,64.105},{61.1703,64.105}}));
  connect(cylinder2.in_th,thermoswitch1.thOut) annotation(Line(points={{26.5058,
          63.7931},{13.4368,63.7931},{13.4368,63.7931}}));
  connect(fixedtemperature1.port,thermalconductor1.port_a) annotation(Line(points = {{-58.115,70.6897},{-43.3908,70.6897},{-43.3908,70.6897},{-43.0345,70.6897}}));
  connect(ottosteuerung1.x,position1.s_ref) annotation(Line(points={{-62.1126,
          10.092},{93.6782,10.092},{93.6782,64.0805},{87.5703,64.0805},{87.5703,
          64.105}}));
  connect(ottosteuerung1.Qdot,prescribedheatflow1.Q_flow) annotation(Line(points = {{-62.1126,22.092},{-54.8851,22.092},{-54.8851,38.5057},{-45.6207,38.5057},{-45.6207,38.5057}}));
  connect(ottosteuerung1.sw,thermoswitch1.control) annotation(Line(points = {{-62.1126,16.092},{1.72414,16.092},{1.72414,51.7931},{1.43678,51.7931}}));
  connect(prescribedheatflow1.port,thermoswitch1.thIn2) annotation(Line(points={{
          -21.6207,38.5057},{-15.8046,38.5057},{-15.8046,56.0345},{-10.5632,
          56.0345},{-10.5632,56.5931}}));
  connect(thermalconductor1.port_b,thermoswitch1.thIn1) annotation(Line(points={{
          -19.0345,70.6897},{-10.6322,70.6897},{-10.6322,70.9931},{-10.5632,
          70.9931}}));
  annotation(experiment(StartTime = 0.0, StopTime = 12.1, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Otto2;

