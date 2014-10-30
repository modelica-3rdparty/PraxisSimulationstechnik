within PraxisSimulationstechnik.Solutions;
model HeatTransfer3A
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied1 annotation(Placement(transformation(origin={-131.493,
            172.168},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied2 annotation(Placement(transformation(origin={-100.159,
            172.447},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied3 annotation(Placement(transformation(origin={-67.478,
            172.752},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied4 annotation(Placement(transformation(origin={-34.865,
            173.177},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied5 annotation(Placement(transformation(origin={-3.883,
            173.462},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap14.WaermetauscherGlied waermetauscherglied6 annotation(Placement(transformation(origin={27.2383,
            173.752},                                                                                                    extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 360) annotation(Placement(transformation(origin={-169.218,
            178.742},                                                                                                    extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature2(T = 290) annotation(Placement(transformation(origin={40.773,
            136.847},                                                                                                    extent = {{-12,12},{12,-12}}, rotation = -180)));
equation
  connect(fixedtemperature2.port,waermetauscherglied6.heatport_a2) annotation(Line(points={{28.773,
          136.847},{11.8561,136.847},{11.8561,168.647},{15.2041,168.647},{
          15.2041,168.726}}));
  connect(fixedtemperature1.port,waermetauscherglied1.heatport_a1) annotation(Line(points={{
          -157.218,178.742},{-144.02,178.742},{-144.02,178.048},{-143.561,
          178.048}}));
  connect(waermetauscherglied5.heatport_b2,waermetauscherglied6.heatport_a2) annotation(Line(points={{8.08281,
          168.744},{15.2561,168.744},{15.2561,168.726},{15.2041,168.726}}));
  connect(waermetauscherglied5.heatport_b1,waermetauscherglied6.heatport_a1) annotation(Line(points={{8.01444,
          179.274},{15.2561,179.274},{15.2561,179.632},{15.1699,179.632}}));
  connect(waermetauscherglied4.heatport_b2,waermetauscherglied5.heatport_a2) annotation(Line(points={{
          -22.8992,168.459},{-16.193,168.459},{-16.193,168.436},{-15.9172,
          168.436}}));
  connect(waermetauscherglied4.heatport_b1,waermetauscherglied5.heatport_a1) annotation(Line(points={{
          -22.9676,178.989},{-15.836,178.989},{-15.836,179.342},{-15.9514,
          179.342}}));
  connect(waermetauscherglied3.heatport_b2,waermetauscherglied4.heatport_a2) annotation(Line(points={{
          -55.5122,168.034},{-46.213,168.034},{-46.213,168.151},{-46.8992,
          168.151}}));
  connect(waermetauscherglied3.heatport_b1,waermetauscherglied4.heatport_a1) annotation(Line(points={{
          -55.5806,178.564},{-47.285,178.564},{-47.285,179.057},{-46.9334,
          179.057}}));
  connect(waermetauscherglied2.heatport_b2,waermetauscherglied3.heatport_a2) annotation(Line(points={{
          -88.1932,167.729},{-79.092,167.729},{-79.092,167.726},{-79.5122,
          167.726}}));
  connect(waermetauscherglied2.heatport_b1,waermetauscherglied3.heatport_a1) annotation(Line(points={{
          -88.2616,178.259},{-80.164,178.259},{-80.164,178.632},{-79.5464,
          178.632}}));
  connect(waermetauscherglied1.heatport_b2,waermetauscherglied2.heatport_a2) annotation(Line(points={{
          -119.527,167.45},{-111.613,167.45},{-111.613,167.421},{-112.193,
          167.421}}));
  connect(waermetauscherglied1.heatport_b1,waermetauscherglied2.heatport_a1) annotation(Line(points={{
          -119.596,177.98},{-111.971,177.98},{-111.971,178.327},{-112.227,
          178.327}}));
  annotation(experiment(StartTime = 0.0, StopTime = 30.0, Tolerance = 1e-06),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end HeatTransfer3A;

