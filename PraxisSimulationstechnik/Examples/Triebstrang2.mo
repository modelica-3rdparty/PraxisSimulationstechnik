within PraxisSimulationstechnik.Examples;
model Triebstrang2
  Modelica.Mechanics.Rotational.Components.Clutch clutch1(peak = 1.071428571, cgeo = 1, fn_max = 560) annotation(Placement(transformation(origin = {-40.2186,29.5255}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = 2.5) annotation(Placement(transformation(origin = {1.54899,29.2381}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-68.2825,-7.17818}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia3(J = 0.05, w(start = 0.0, fixed = true), phi(start = 0.0, fixed = true)) annotation(Placement(transformation(origin = {-48.6799,-7.67978}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = 3.27) annotation(Placement(transformation(origin = {-26.675,-7.67978}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1200, s(start = 0, fixed = true), v(start = 0, fixed = true)) annotation(Placement(transformation(origin = {34.8351,-6.99358}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel1(radius = 0.3) annotation(Placement(transformation(origin = {13.2374,3.74102}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel2(radius = 0.3) annotation(Placement(transformation(origin = {13.2374,-18.1295}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Motor motor1 annotation(Placement(transformation(origin = {-65.3238,35.3956}, extent = {{-8,-8},{8,8}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 0.2, w(start = 0.0, fixed = true), phi(start = 0.0, fixed = true)) annotation(Placement(transformation(origin = {-18.9852,29.5994}, extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(transformation(origin = {-40.393,49.2672}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable1(tableOnFile = true, tableName = "gas1", fileName = "gaspedal.txt") annotation(Placement(transformation(origin = {-65.3234,66.7506}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper2(c = 7500, d = 1) annotation(Placement(transformation(origin={-3.16545,
            3.74102},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper3(c = 7500, d = 1) annotation(Placement(transformation(origin={-3.1654,
            -18.259},                                                                                                    extent = {{-6,-6},{6,6}})));
equation
  connect(combitimetable1.y[1],motor1.u) annotation(Line(points={{-65.3234,
          60.1506},{-65.3234,43.804},{-65.3238,43.804},{-65.3238,43.6356}}));
  connect(clutch1.flange_b,inertia2.flange_a) annotation(Line(points = {{-34.2186,29.5255},{-24.7139,29.5255},{-24.7139,29.5994},{-24.9852,29.5994}}));
  connect(inertia2.flange_b,idealgear1.flange_a) annotation(Line(points = {{-12.9852,29.5994},{-4.02423,29.5994},{-4.02423,29.2381},{-4.45101,29.2381}}));
  connect(motor1.flange_b,clutch1.flange_a) annotation(Line(points = {{-57.3238,29.3956},{-46.0431,29.3956},{-46.0431,29.5255},{-46.2186,29.5255}}));
  connect(idealrollingwheel2.flangeT,mass1.flange_a) annotation(Line(points = {{19.2374,-18.1295},{25.3238,-18.1295},{25.3238,-6.90648},{28.8351,-6.90648},{28.8351,-6.99358}}));
  connect(constant1.y,clutch1.f_normalized) annotation(Line(points = {{-40.393,42.6672},{-40.232,42.6672},{-40.232,36.1255},{-40.2186,36.1255}}));
  connect(idealrollingwheel1.flangeT,mass1.flange_a) annotation(Line(points = {{19.2374,3.74102},{25.3238,3.74102},{25.3238,-6.90648},{28.8351,-6.90648},{28.8351,-6.99358}}));
  connect(inertia3.flange_b,idealgear2.flange_a) annotation(Line(points = {{-42.6799,-7.67978},{-32.1851,-7.67978},{-32.1851,-7.67978},{-32.675,-7.67978}}));
  connect(springdamper1.flange_b,inertia3.flange_a) annotation(Line(points = {{-62.2825,-7.17818},{-54.5989,-7.17818},{-54.5989,-7.67978},{-54.6799,-7.67978}}));
  connect(idealgear1.flange_b,springdamper1.flange_a) annotation(Line(points = {{7.54899,29.2381},{14.9413,29.2381},{14.9413,13.7377},{-77.8748,13.7377},{-77.8748,-7.23938},{-74.2825,-7.23938},{-74.2825,-7.17818}}));
  connect(springdamper2.flange_b, idealrollingwheel1.flangeR) annotation (Line(
      points={{2.83455,3.74102},{7.2374,3.74102}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(springdamper2.flange_a, idealgear2.flange_b) annotation (Line(
      points={{-9.16545,3.74102},{-9.99998,3.74102},{-9.99998,4},{-14,4},{-14,
          -8.12949},{-20.675,-8.12949},{-20.675,-7.67978}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(springdamper3.flange_b, idealrollingwheel2.flangeR) annotation (Line(
      points={{2.8346,-18.259},{4.4173,-18.259},{4.4173,-18.1295},{7.2374,
          -18.1295}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(springdamper3.flange_a, idealgear2.flange_b) annotation (Line(
      points={{-9.1654,-18.259},{-14.5827,-18.259},{-14.5827,-7.67978},{-20.675,
          -7.67978}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(                        experiment(StartTime = 0.0, StopTime = 25.0, Tolerance = 0.000001),
    uses(Modelica(version="3.2")));
end Triebstrang2;

