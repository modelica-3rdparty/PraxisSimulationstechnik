within PraxisSimulationstechnik.Solutions;
model Verbrauch
  parameter Modelica.SIunits.Time ts = 2;
  parameter Real ns = 6500;
  parameter Real pg = 1;
  parameter Real my = 1.4;

  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-68.2825,-7.17818}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Differentialgetriebe differentialgetriebe1 annotation(Placement(transformation(origin = {-46.9065,-7.19425}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Karosserie karosserie1 annotation(Placement(transformation(origin={37.0647,
            -13.482},                                                                                                 extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Motor motor1 annotation(Placement(transformation(origin = {-74.5324,35.3956}, extent = {{-8,-8},{8,8}})));
  PJlib.Kap16.Kupplung kupplung1(Mh = 300) annotation(Placement(transformation(origin = {-31.9424,29.3526}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {-57.2662,40}, extent={{-6,-6},
            {6,6}},                                                                                                    rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(origin={37.0647,
            64.1727},                                                                                                    extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper3(           d = 1, c=7500)
                                                                                        annotation(Placement(transformation(origin={-18.2825,
            0.8218},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper2(           d = 1, c=7500)
                                                                                        annotation(Placement(transformation(origin={-18.2825,
            -19.9856},                                                                                                    extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Schaltgetriebe5 schaltgetriebe5_1(
    TS=0.06,
    Jgi=0.02,
    Jgo=0.18) annotation (Placement(transformation(extent={{-14,22},{0,36}})));
  PJlib.Kap16.Reifen reifen1 annotation(Placement(transformation(origin={3.2374,
            -19.9856},                                                                                       extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Reifen reifen2 annotation(Placement(transformation(origin={3.2374,
            0.8218},                                                                                         extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.Constant const1(k=my) annotation(Placement(transformation(origin={13.0647,
            64.1727},                                                                                                    extent = {{-6,6},{6,-6}}, rotation = -90)));
  PJlib.Kap16.Fahrer2 fahrer2_1(ts=2, Ng=5)
    annotation (Placement(transformation(extent={{-50,54},{-38,66}})));
  PJlib.Kap16.Verbrauchsmesser verbrauchsmesser
    annotation (Placement(transformation(extent={{32,-50},{46,-30}})));

equation
  connect(const.y,karosserie1.u) annotation(Line(points={{37.0647,57.5727},{
          37.0647,66.7813},{37.0647,-7.65491},{36.8053,-7.65491}}));
  connect(motor1.flange_b,kupplung1.flange_a) annotation(Line(points = {{-66.5324,29.3956},{-42.0144,29.3956},{-42.0144,29.3526},{-37.9424,29.3526}}));
  connect(speedsensor1.flange,motor1.flange_b) annotation(Line(points={{
          -57.2662,34},{-57.2662,34},{-57.2662,29.3525},{-66.5324,29.3525},{
          -66.5324,29.3956}}));
  connect(springdamper1.flange_b,differentialgetriebe1.flange_a) annotation(Line(points = {{-62.2825,-7.17818},{-51.7986,-7.17818},{-51.7986,-7.19425},{-52.9065,-7.19425}}));
  connect(springdamper3.flange_a, differentialgetriebe1.flange_b) annotation (
      Line(
      points={{-24.2825,0.8218},{-32.1412,0.8218},{-32.1412,-4.19425},{-40.9065,
          -4.19425}}));
  connect(springdamper2.flange_a, differentialgetriebe1.flange_b1) annotation (
      Line(
      points={{-24.2825,-19.9856},{-32.1412,-19.9856},{-32.1412,-10.1943},{
          -40.9065,-10.1943}}));

  connect(kupplung1.flange_b, schaltgetriebe5_1.flange_a) annotation (Line(
      points={{-25.9424,29.3526},{-19.9712,29.3526},{-19.9712,29},{-14,29}}));
  connect(schaltgetriebe5_1.flange_b, springdamper1.flange_a) annotation (Line(
      points={{1.55431e-15,29},{8,29},{8,16},{-78,16},{-78,-7.17818},{-74.2825,
          -7.17818}}));
  connect(springdamper2.flange_b, reifen1.flange_a) annotation (Line(
      points={{-12.2825,-19.9856},{-7.14125,-19.9856},{-7.14125,-17.5856},{
          -2.7626,-17.5856}}));
  connect(springdamper3.flange_b, reifen2.flange_a) annotation (Line(
      points={{-12.2825,0.8218},{-7.14125,0.8218},{-7.14125,3.2218},{-2.7626,
          3.2218}}));
  connect(reifen2.flange_b, karosserie1.flange_a) annotation (Line(
      points={{9.2374,-1.5782},{16.6187,-1.5782},{16.6187,-13.1568},{31.0904,
          -13.1568}},
      color={0,127,0}));
  connect(reifen1.flange_b, karosserie1.flange_a) annotation (Line(
      points={{9.2374,-22.3856},{16.6187,-22.3856},{16.6187,-13.1568},{31.0904,
          -13.1568}},
      color={0,127,0}));
  connect(const1.y, reifen1.u) annotation (Line(
      points={{13.0647,57.5727},{13.0647,-30.2137},{3.2374,-30.2137},{3.2374,
          -25.9856}},
      color={0,0,127}));
  connect(reifen2.u, const1.y) annotation (Line(
      points={{3.2374,-5.1782},{3.2374,-9.5891},{13.0647,-9.5891},{13.0647,
          57.5727}},
      color={0,0,127}));
  connect(fahrer2_1.u, speedsensor1.w) annotation (Line(
      points={{-50,60},{-58,60},{-58,46.6},{-57.2662,46.6}},
      color={0,0,127}));
  connect(fahrer2_1.y, kupplung1.u) annotation (Line(
      points={{-38,60},{-32,60},{-32,35.5926},{-31.9424,35.5926}},
      color={0,0,127}));
  connect(fahrer2_1.realoutput2, schaltgetriebe5_1.u) annotation (Line(
      points={{-38,57},{-6,57},{-6,36},{-7,36}},
      color={0,0,127}));
  connect(fahrer2_1.realoutput1, motor1.u) annotation (Line(
      points={{-38,63},{-34,63},{-34,80},{-74.5324,80},{-74.5324,43.6356}},
      color={0,0,127}));
  connect(verbrauchsmesser.flange_a, karosserie1.flange_a) annotation (Line(
      points={{32,-35.4},{24,-35.4},{24,-22},{16.6187,-22},{16.6187,-13.1568},{
          31.0904,-13.1568}},
      color={0,127,0}));
  connect(verbrauchsmesser.u, motor1.u) annotation (Line(
      points={{31.2,-44},{-92,-44},{-92,80},{-74,80},{-74.5324,43.6356}},
      color={0,0,127}));
  annotation(                        experiment(StopTime=35, Tolerance=1e-06),
    uses(Modelica(version="3.2.1")));
end Verbrauch;
