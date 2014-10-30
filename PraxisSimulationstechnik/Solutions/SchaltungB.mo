within PraxisSimulationstechnik.Solutions;
model SchaltungB
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-68.2825,-7.17818}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = 3.27) annotation(Placement(transformation(origin = {-26.675,-7.67978}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1200, s(start = 0, fixed = true), v(start = 0, fixed = true)) annotation(Placement(transformation(origin = {34.8351,-6.99358}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel1(radius = 0.3) annotation(Placement(transformation(origin = {13.2374,3.74102}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel2(radius = 0.3) annotation(Placement(transformation(origin = {13.2374,-18.1295}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Spring spring1(c = 7500) annotation(Placement(transformation(origin = {-5.75535,3.45322}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Spring spring2(c = 7500) annotation(Placement(transformation(origin = {-4.8921,-18.1296}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Motor motor1 annotation(Placement(transformation(origin = {-65.3238,35.3956}, extent = {{-8,-8},{8,8}})));
  PJlib.Kap16.Kupplung kupplung1(Mh = 300) annotation(Placement(transformation(origin = {-40.8633,29.3526}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia3(J = 0.05, w(start = 0.0, fixed = true), phi(start = 0.0, fixed = true)) annotation(Placement(transformation(origin = {-48.3921,-7.39201}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Schaltgetriebe5 schaltgetriebe51(TS = 0.06, Jgi = 0.02, Jgo = 0.18) annotation(Placement(transformation(origin = {-17.8161,29.3103}, extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable1(tableOnFile = true, tableName = "gas3", fileName = "gaspedal.txt") annotation(Placement(transformation(origin = {-65.6116,75.97}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable2(tableOnFile = true, tableName = "kupplung3", fileName = "kupplung.txt") annotation(Placement(transformation(origin = {-40.8633,75.97}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable3(tableOnFile = true, tableName = "schalten1", fileName = "schaltung.txt") annotation(Placement(transformation(origin = {-17.8417,75.97}, extent = {{-6,6},{6,-6}}, rotation = -90)));
equation
  connect(combitimetable3.y[1],schaltgetriebe51.u) annotation(Line(points = {{-17.8417,69.37},{-17.8417,35.4467},{-18.1556,35.4467},{-18.1556,35.4467}}));
  connect(combitimetable2.y[1],kupplung1.u) annotation(Line(points = {{-40.8633,69.37},{-40.8633,35.7349},{-41.2104,35.7349},{-41.2104,35.7349}}));
  connect(combitimetable1.y[1],motor1.u) annotation(Line(points = {{-65.6116,69.37},{-65.6116,44.3804},{-65.7061,44.3804},{-65.7061,44.3804}}));
  connect(schaltgetriebe51.flange_b,springdamper1.flange_a) annotation(Line(points = {{-11.8161,29.3103},{-4.02299,29.3103},{-4.02299,15.8046},{-79.023,15.8046},{-79.023,-7.18391},{-74.2825,-7.18391},{-74.2825,-7.17818}}));
  connect(kupplung1.flange_b,schaltgetriebe51.flange_a) annotation(Line(points = {{-34.8633,29.3526},{-23.8506,29.3526},{-23.8506,29.3103},{-23.8161,29.3103}}));
  connect(springdamper1.flange_b,inertia3.flange_a) annotation(Line(points = {{-62.2825,-7.17818},{-54.5989,-7.17818},{-54.5989,-7.39201},{-54.3921,-7.39201}}));
  connect(inertia3.flange_b,idealgear2.flange_a) annotation(Line(points = {{-42.3921,-7.39201},{-32.1851,-7.39201},{-32.1851,-7.67978},{-32.675,-7.67978}}));
  connect(motor1.flange_b,kupplung1.flange_a) annotation(Line(points = {{-57.3238,29.3956},{-42.0144,29.3956},{-42.0144,29.3526},{-46.8633,29.3526}}));
  connect(spring2.flange_a,idealgear2.flange_b) annotation(Line(points = {{-10.8921,-18.1296},{-14.3885,-18.1296},{-14.3885,-8.05758},{-20.675,-8.05758},{-20.675,-7.67978}}));
  connect(spring2.flange_b,idealrollingwheel2.flangeR) annotation(Line(points = {{1.1079,-18.1296},{7.76978,-18.1296},{7.76978,-18.1295},{7.23736,-18.1295}}));
  connect(spring1.flange_a,idealgear2.flange_b) annotation(Line(points = {{-11.7553,3.45322},{-14.3885,3.45322},{-14.3885,-8.05758},{-20.675,-8.05758},{-20.675,-7.67978}}));
  connect(spring1.flange_b,idealrollingwheel1.flangeR) annotation(Line(points = {{0.24465,3.45322},{7.48201,3.45322},{7.48201,3.74102},{7.23736,3.74102}}));
  connect(idealrollingwheel2.flangeT,mass1.flange_a) annotation(Line(points = {{19.2374,-18.1295},{25.3238,-18.1295},{25.3238,-6.90648},{28.8351,-6.90648},{28.8351,-6.99358}}));
  connect(idealrollingwheel1.flangeT,mass1.flange_a) annotation(Line(points = {{19.2374,3.74102},{25.3238,3.74102},{25.3238,-6.90648},{28.8351,-6.90648},{28.8351,-6.99358}}));
  annotation(Diagram(), experiment(StartTime = 0.0, StopTime = 12, Tolerance = 0.000001));
end SchaltungB;

