within PraxisSimulationstechnik.Examples;
model Triebstrang3
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-68.2825,-7.17818}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = 3.27) annotation(Placement(transformation(origin = {-26.675,-7.67978}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1200, s(start = 0, fixed = true), v(start = 0, fixed = true)) annotation(Placement(transformation(origin = {34.8351,-6.99358}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel1(radius = 0.3) annotation(Placement(transformation(origin = {13.2374,3.74102}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel2(radius = 0.3) annotation(Placement(transformation(origin={13.2374,
            -16.1295},                                                                                                    extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Motor motor1 annotation(Placement(transformation(origin = {-65.32380000000001,35.3956}, extent = {{-8,-8},{8,8}})));
  PJlib.Kap16.Schaltgetriebe schaltgetriebe1 annotation(Placement(transformation(origin = {-17.8417,29.3525}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Kupplung kupplung1(Mh = 300) annotation(Placement(transformation(origin = {-40.8633,29.3526}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia3(J = 0.05, w(start = 0.0, fixed = true), phi(start = 0.0, fixed = true)) annotation(Placement(transformation(origin = {-48.3921,-7.39201}, extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable1(tableOnFile = true, tableName = "gas2", fileName = "gaspedal.txt") annotation(Placement(transformation(origin = {-65.6116,75.1079}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(transformation(origin = {-17.947,74.5909}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable2(tableOnFile = true, tableName = "kupplung1", fileName = "kupplung.txt") annotation(Placement(transformation(origin = {-40.8633,75.1079}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper2(c = 7500, d = 1) annotation(Placement(transformation(origin={-3.1654,
            3.741},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper3(c = 7500, d = 1) annotation(Placement(transformation(origin={-3.16545,
            -16.259},                                                                                                    extent = {{-6,-6},{6,6}})));
equation
  connect(combitimetable2.y[1],kupplung1.u) annotation(Line(points={{-40.8633,
          68.5079},{-40.8633,36.0231},{-40.8633,36.0231},{-40.8633,35.5926}}));
  connect(combitimetable1.y[1],motor1.u) annotation(Line(points={{-65.6116,
          68.5079},{-65.6116,44.3804},{-65.3238,44.3804},{-65.3238,43.6356}}));
  connect(springdamper1.flange_b,inertia3.flange_a) annotation(Line(points = {{-62.2825,-7.17818},{-54.5989,-7.17818},{-54.5989,-7.39201},{-54.3921,-7.39201}}));
  connect(inertia3.flange_b,idealgear2.flange_a) annotation(Line(points = {{-42.3921,-7.39201},{-32.1851,-7.39201},{-32.1851,-7.67978},{-32.675,-7.67978}}));
  connect(constant1.y,schaltgetriebe1.u) annotation(Line(points={{-17.947,
          67.9909},{-17.8417,67.9909},{-17.8417,35.3525}}));
  connect(schaltgetriebe1.flange_b,springdamper1.flange_a) annotation(Line(points = {{-11.8417,29.3525},{-3.74101,29.3525},{-3.74101,14.1007},{-83.4532,14.1007},{-83.4532,-7.19424},{-74.2825,-7.19424},{-74.2825,-7.17818}}));
  connect(kupplung1.flange_b,schaltgetriebe1.flange_a) annotation(Line(points = {{-34.8633,29.3526},{-23.8849,29.3526},{-23.8849,29.3525},{-23.8417,29.3525}}));
  connect(motor1.flange_b,kupplung1.flange_a) annotation(Line(points = {{-57.3238,29.3956},{-42.0144,29.3956},{-42.0144,29.3526},{-46.8633,29.3526}}));
  connect(idealrollingwheel2.flangeT,mass1.flange_a) annotation(Line(points={{19.2374,
          -16.1295},{25.3238,-16.1295},{25.3238,-6.90648},{28.8351,-6.90648},{
          28.8351,-6.99358}}));
  connect(idealrollingwheel1.flangeT,mass1.flange_a) annotation(Line(points = {{19.2374,3.74102},{25.3238,3.74102},{25.3238,-6.90648},{28.8351,-6.90648},{28.8351,-6.99358}}));
  connect(springdamper2.flange_b, idealrollingwheel1.flangeR) annotation (Line(
      points={{2.8346,3.741},{4.4173,3.741},{4.4173,3.74102},{7.2374,3.74102}},

      color={0,0,0},
      smooth=Smooth.None));
  connect(springdamper3.flange_b, idealrollingwheel2.flangeR) annotation (Line(
      points={{2.83455,-16.259},{4.41728,-16.259},{4.41728,-16.1295},{7.2374,
          -16.1295}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(springdamper3.flange_a, idealgear2.flange_b) annotation (Line(
      points={{-9.16545,-16.259},{-14.5827,-16.259},{-14.5827,-7.67978},{
          -20.675,-7.67978}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealgear2.flange_b, springdamper2.flange_a) annotation (Line(
      points={{-20.675,-7.67978},{-20.675,-7.83989},{-15.1654,-7.83989},{
          -15.1654,3.741},{-9.1654,3.741}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(                        experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-06),
    uses(Modelica(version="3.2.1")));
end Triebstrang3;
