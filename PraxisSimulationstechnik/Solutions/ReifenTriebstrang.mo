within PraxisSimulationstechnik.Solutions;
model ReifenTriebstrang
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-68.2825,-7.17818}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Motor motor1 annotation(Placement(transformation(origin = {-65.3238,35.3956}, extent = {{-8,-8},{8,8}})));
  PJlib.Kap16.Kupplung kupplung1(Mh = 300) annotation(Placement(transformation(origin = {-40.8633,29.3526}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Differentialgetriebe differentialgetriebe1 annotation(Placement(transformation(origin = {-46.9065,-7.19425}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Spring spring1(c = 7500) annotation(Placement(transformation(origin = {-18.705,4.31653}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Spring spring2(c = 7500) annotation(Placement(transformation(origin = {-17.8417,-17.2663}, extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable1(tableOnFile = true, tableName = "gas4", fileName = "gaspedal.txt") annotation(Placement(transformation(origin = {-65.6116,75.1079}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable2(tableOnFile = true, tableName = "kupplung1", fileName = "kupplung.txt") annotation(Placement(transformation(origin = {-40.8633,75.1079}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  PJlib.Kap16.Reifen reifen1 annotation(Placement(transformation(origin = {13.2374,2.01435}, extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(origin = {36.8344,73.9569}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(transformation(origin = {0.863314,74.5324}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  PJlib.Kap16.Reifen reifen2 annotation(Placement(transformation(origin = {13.5252,-19.5683}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Karosserie karosserie1 annotation(Placement(transformation(origin = {37.1758,-8.64551}, extent = {{6,6},{-6,-6}}, rotation = 180)));
  PJlib.Kap16.Schaltgetriebe schaltgetriebe
    annotation (Placement(transformation(extent={{-24,22},{-10,36}})));
  Modelica.Blocks.Sources.Constant constant2(k = 1) annotation(Placement(transformation(origin={-17.1367,
            74.5324},                                                                                                    extent = {{-6,6},{6,-6}}, rotation = -90)));
equation
  connect(combitimetable2.y[1],kupplung1.u) annotation(Line(points={{-40.8633,
          68.5079},{-40.8633,35.7349},{-40.8633,35.7349},{-40.8633,35.5926}}));
  connect(combitimetable1.y[1],motor1.u) annotation(Line(points={{-65.6116,
          68.5079},{-65.6116,44.0922},{-65.3238,44.0922},{-65.3238,43.6356}}));
  connect(reifen2.flange_b,karosserie1.flange_a) annotation(Line(points={{19.5252,
          -21.9683},{24.4957,-21.9683},{24.4957,-8.35735},{31.2015,-8.35735},{
          31.2015,-8.32026}}));
  connect(reifen1.flange_b,karosserie1.flange_a) annotation(Line(points={{19.2374,
          -0.38565},{24.4957,-0.38565},{24.4957,-8.35735},{31.2015,-8.35735},{
          31.2015,-8.32026}}));
  connect(const.y,karosserie1.u) annotation(Line(points={{36.8344,67.3569},{
          36.8344,-2.81842},{36.9164,-2.81842},{36.9164,-2.81842}}));
  connect(spring1.flange_b,reifen1.flange_a) annotation(Line(points={{-12.705,
          4.31653},{7.48201,4.31653},{7.48201,4.41435},{7.2374,4.41435}}));
  connect(spring2.flange_b,reifen2.flange_a) annotation(Line(points={{-11.8417,
          -17.2663},{7.76978,-17.2663},{7.76978,-17.1683},{7.5252,-17.1683}}));
  connect(constant1.y,reifen2.u) annotation(Line(points = {{0.863314,67.9324},{0.863309,67.9324},{0.863309,-32.2302},{14.3885,-32.2302},{14.3885,-25.5683},{13.5252,-25.5683}}));
  connect(reifen1.u,constant1.y) annotation(Line(points = {{13.2374,-3.98565},{13.2374,-9.4964},{0.863309,-9.4964},{0.863309,67.9324},{0.863314,67.9324}}));
  connect(differentialgetriebe1.flange_b1,spring2.flange_a) annotation(Line(points={{
          -40.9065,-10.1943},{-35.3957,-10.1943},{-35.3957,-17.2662},{-23.8417,
          -17.2662},{-23.8417,-17.2663}}));
  connect(differentialgetriebe1.flange_b,spring1.flange_a) annotation(Line(points = {{-40.9065,-4.19425},{-35.3957,-4.19425},{-35.3957,4.31655},{-24.705,4.31655},{-24.705,4.31653}}));
  connect(springdamper1.flange_b,differentialgetriebe1.flange_a) annotation(Line(points = {{-62.2825,-7.17818},{-51.7986,-7.17818},{-51.7986,-7.19425},{-52.9065,-7.19425}}));
  connect(motor1.flange_b,kupplung1.flange_a) annotation(Line(points = {{-57.3238,29.3956},{-42.0144,29.3956},{-42.0144,29.3526},{-46.8633,29.3526}}));
  connect(kupplung1.flange_b, schaltgetriebe.flange_a) annotation (Line(
      points={{-34.8633,29.3526},{-29.4317,29.3526},{-29.4317,29},{-24,29}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constant2.y, schaltgetriebe.u) annotation (Line(
      points={{-17.1367,67.9324},{-17.1367,51.9662},{-17,51.9662},{-17,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(schaltgetriebe.flange_b, springdamper1.flange_a) annotation (Line(
      points={{-10,29},{-6,29},{-6,14},{-78,14},{-78,-7.17818},{-74.2825,
          -7.17818}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(                        experiment(StartTime = 0.0, StopTime = 7, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end ReifenTriebstrang;

