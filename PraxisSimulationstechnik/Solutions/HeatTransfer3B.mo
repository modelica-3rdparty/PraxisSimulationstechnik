within PraxisSimulationstechnik.Solutions;
model HeatTransfer3B
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied1 annotation(Placement(transformation(origin = {-83.4935,14.1675}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied2 annotation(Placement(transformation(origin = {-52.1595,14.4474}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied3 annotation(Placement(transformation(origin = {-19.4785,14.7524}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied4 annotation(Placement(transformation(origin = {13.135,15.1772}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied5 annotation(Placement(transformation(origin = {44.1167,15.4621}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied6 annotation(Placement(transformation(origin = {75.2383,15.752}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 360) annotation(Placement(transformation(origin = {-121.218,20.7424}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature2(T = 290) annotation(Placement(transformation(origin = {-120.594,-20.4309}, extent = {{-12,-12},{12,12}})));
equation
  connect(fixedtemperature2.port,waermetauscherglied1.heatport_a2) annotation(Line(points={{
          -108.594,-20.4309},{-101.074,-20.4309},{-101.074,8.66348},{-95.2983,
          8.66348},{-95.2983,9.14186},{-95.5277,9.14186}}));
  connect(fixedtemperature1.port,waermetauscherglied1.heatport_a1) annotation(Line(points={{
          -109.218,20.7424},{-96.0203,20.7424},{-96.0203,20.0478},{-95.5619,
          20.0478}}));
  connect(waermetauscherglied5.heatport_b2,waermetauscherglied6.heatport_a2) annotation(Line(points={{56.0825,
          10.7442},{63.2561,10.7442},{63.2561,10.7264},{63.2041,10.7264}}));
  connect(waermetauscherglied5.heatport_b1,waermetauscherglied6.heatport_a1) annotation(Line(points={{56.0141,
          21.2741},{63.2561,21.2741},{63.2561,21.6323},{63.1699,21.6323}}));
  connect(waermetauscherglied4.heatport_b2,waermetauscherglied5.heatport_a2) annotation(Line(points={{25.1008,
          10.4593},{31.8067,10.4593},{31.8067,10.4365},{32.0825,10.4365}}));
  connect(waermetauscherglied4.heatport_b1,waermetauscherglied5.heatport_a1) annotation(Line(points={{25.0324,
          20.9892},{32.1641,20.9892},{32.1641,21.3424},{32.0483,21.3424}}));
  connect(waermetauscherglied3.heatport_b2,waermetauscherglied4.heatport_a2) annotation(Line(points={{
          -7.51269,10.0345},{1.78689,10.0345},{1.78689,10.1516},{1.1008,10.1516}}));
  connect(waermetauscherglied3.heatport_b1,waermetauscherglied4.heatport_a1) annotation(Line(points={{
          -7.58106,20.5644},{0.714758,20.5644},{0.714758,21.0575},{1.0666,
          21.0575}}));
  connect(waermetauscherglied2.heatport_b2,waermetauscherglied3.heatport_a2) annotation(Line(points={{
          -40.1937,9.72946},{-31.092,9.72946},{-31.092,9.72676},{-31.5127,
          9.72676}}));
  connect(waermetauscherglied2.heatport_b1,waermetauscherglied3.heatport_a1) annotation(Line(points={{
          -40.2621,20.2594},{-32.1641,20.2594},{-32.1641,20.6327},{-31.5469,
          20.6327}}));
  connect(waermetauscherglied1.heatport_b2,waermetauscherglied2.heatport_a2) annotation(Line(points={{
          -71.5277,9.44956},{-63.6134,9.44956},{-63.6134,9.42176},{-64.1937,
          9.42176}}));
  connect(waermetauscherglied1.heatport_b1,waermetauscherglied2.heatport_a1) annotation(Line(points={{
          -71.5961,19.9795},{-63.9708,19.9795},{-63.9708,20.3277},{-64.2279,
          20.3277}}));
  annotation(experiment(StartTime = 0.0, StopTime = 30.0, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end HeatTransfer3B;

