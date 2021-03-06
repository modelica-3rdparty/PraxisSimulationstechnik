within PraxisSimulationstechnik.Examples;
model Triebstrang6C
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-68.2825,-7.17818}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Differentialgetriebe differentialgetriebe1 annotation(Placement(transformation(origin = {-46.9065,-7.19425}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel1(radius = 0.3) annotation(Placement(transformation(origin = {0.28776,4.60433}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel2(radius = 0.3) annotation(Placement(transformation(origin = {0.28776,-17.2662}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Karosserie karosserie1 annotation(Placement(transformation(origin = {29.0647,-7.48201}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Motor motor1 annotation(Placement(transformation(origin = {-74.5324,35.3956}, extent = {{-8,-8},{8,8}})));
  PJlib.Kap16.Kupplung kupplung1(Mh = 300) annotation(Placement(transformation(origin = {-31.9424,29.3526}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Fahrer fahrer(ts=2, Ng=5) annotation (Placement(transformation(
        origin={-43.7411,71.367},
        extent={{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {-57.2662,40}, extent={{-6,-6},
            {6,6}},                                                                                                    rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(origin = {29.0647,64.1727}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper3(           d = 1, c=7500)
                                                                                        annotation(Placement(transformation(origin={-18.2825,
            4.8218},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper2(           d = 1, c=7500)
                                                                                        annotation(Placement(transformation(origin={-18.2825,
            -17.1782},                                                                                                    extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Schaltgetriebe5 schaltgetriebe5_1(
    TS=0.06,
    Jgi=0.02,
    Jgo=0.18) annotation (Placement(transformation(extent={{-14,22},{0,36}})));
equation
  connect(fahrer.realoutput1, motor1.u) annotation (Line(points={{-37.7411,
          74.367},{-35.1079,74.367},{-35.1079,81.4389},{-74.2446,81.4389},{-74.2446,
          43.6356},{-74.5324,43.6356}}));
  connect(fahrer.y, kupplung1.u) annotation (Line(points={{-37.7411,71.367},{
          -31.9424,71.367},{-31.9424,35.5926}}));
  connect(const.y,karosserie1.u) annotation(Line(points={{29.0647,57.5727},{
          29.0647,66.7813},{29.0647,-1.65492},{28.8053,-1.65492}}));
  connect(motor1.flange_b,kupplung1.flange_a) annotation(Line(points = {{-66.5324,29.3956},{-42.0144,29.3956},{-42.0144,29.3526},{-37.9424,29.3526}}));
  connect(speedsensor1.flange,motor1.flange_b) annotation(Line(points={{
          -57.2662,34},{-57.2662,34},{-57.2662,29.3525},{-66.5324,29.3525},{
          -66.5324,29.3956}}));
  connect(idealrollingwheel1.flangeT,karosserie1.flange_a) annotation(Line(points={{6.28776,
          4.60433},{12.3741,4.60433},{12.3741,-6.90647},{23.0904,-6.90647},{
          23.0904,-7.15676}}));
  connect(idealrollingwheel2.flangeT,karosserie1.flange_a) annotation(Line(points={{6.28776,
          -17.2662},{12.3741,-17.2662},{12.3741,-6.90647},{23.0904,-6.90647},{
          23.0904,-7.15676}}));
  connect(springdamper1.flange_b,differentialgetriebe1.flange_a) annotation(Line(points = {{-62.2825,-7.17818},{-51.7986,-7.17818},{-51.7986,-7.19425},{-52.9065,-7.19425}}));
  connect(springdamper3.flange_b, idealrollingwheel1.flangeR) annotation (Line(
      points={{-12.2825,4.8218},{-9.14125,4.8218},{-9.14125,4.60433},{-5.71224,
          4.60433}}));
  connect(springdamper3.flange_a, differentialgetriebe1.flange_b) annotation (
      Line(
      points={{-24.2825,4.8218},{-32.1412,4.8218},{-32.1412,-4.19425},{-40.9065,
          -4.19425}}));
  connect(springdamper2.flange_b, idealrollingwheel2.flangeR) annotation (Line(
      points={{-12.2825,-17.1782},{-9.14125,-17.1782},{-9.14125,-17.2662},{
          -5.71224,-17.2662}}));
  connect(springdamper2.flange_a, differentialgetriebe1.flange_b1) annotation (
      Line(
      points={{-24.2825,-17.1782},{-32.1412,-17.1782},{-32.1412,-10.1943},{
          -40.9065,-10.1943}}));
  connect(speedsensor1.w, fahrer.u) annotation (Line(
      points={{-57.2662,46.6},{-57.2662,71.3},{-49.7411,71.3},{-49.7411,71.367}},

      color={0,0,127}));
  connect(kupplung1.flange_b, schaltgetriebe5_1.flange_a) annotation (Line(
      points={{-25.9424,29.3526},{-19.9712,29.3526},{-19.9712,29},{-14,29}}));
  connect(schaltgetriebe5_1.flange_b, springdamper1.flange_a) annotation (Line(
      points={{1.55431e-15,29},{8,29},{8,16},{-78,16},{-78,-7.17818},{-74.2825,
          -7.17818}}));
  connect(fahrer.realoutput2, schaltgetriebe5_1.u) annotation (Line(
      points={{-37.7411,68.367},{-37.7411,68.1835},{-7,68.1835},{-7,36}},
      color={0,0,127}));
  annotation(                        experiment(StopTime=35, Tolerance=1e-06),
    uses(Modelica(version="3.2.1")));
end Triebstrang6C;

