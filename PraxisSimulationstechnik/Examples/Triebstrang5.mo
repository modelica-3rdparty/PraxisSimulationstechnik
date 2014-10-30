within PraxisSimulationstechnik.Examples;
model Triebstrang5
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-68.2825,-7.17818}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Motor motor1 annotation(Placement(transformation(origin = {-65.3238,35.3956}, extent = {{-8,-8},{8,8}})));
  PJlib.Kap16.Kupplung kupplung1(Mh = 300) annotation(Placement(transformation(origin = {-40.8633,29.3526}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Differentialgetriebe differentialgetriebe1 annotation(Placement(transformation(origin = {-46.9065,-7.19425}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel1(radius = 0.3) annotation(Placement(transformation(origin={0.28776,
            5.741},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel2(radius = 0.3) annotation(Placement(transformation(origin={0.28776,
            -18.259},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable1(tableOnFile = true, tableName = "gas2", fileName = "gaspedal.txt") annotation(Placement(transformation(origin = {-65.6116,75.1079}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = 4.3) annotation(Placement(transformation(origin = {29.0647,73.3813}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable combitimetable2(tableOnFile = true, tableName = "kupplung1", fileName = "kupplung.txt") annotation(Placement(transformation(origin = {-40.5751,75.1079}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  PJlib.Kap16.Karosserie karosserie2 annotation(Placement(transformation(origin = {29.683,-6.05192}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper2(c = 7500, d=1)   annotation(Placement(transformation(origin={-19.1654,
            5.741},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper3(c = 7500, d=1)   annotation(Placement(transformation(origin={-19.1654,
            -18.259},                                                                                                    extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Schaltgetriebe schaltgetriebe1(om0 = 720.3) annotation(Placement(transformation(origin={-11.8675,
            29.3526},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.Constant constant2(k=2)   annotation(Placement(transformation(origin={-11.8674,
            76.2478},                                                                                                    extent = {{-6,-6},{6,6}}, rotation = -90)));
equation
  connect(idealrollingwheel2.flangeT,karosserie2.flange_a) annotation(Line(points={{6.28776,
          -18.259},{14.4092,-18.259},{14.4092,-5.76369},{23.7087,-5.76369},{
          23.7087,-5.72667}}));
  connect(idealrollingwheel1.flangeT,karosserie2.flange_a) annotation(Line(points={{6.28776,
          5.741},{14.4092,5.741},{14.4092,-5.76369},{23.7087,-5.76369},{23.7087,
          -5.72667}}));
  connect(const.y,karosserie2.u) annotation(Line(points={{29.0647,66.7813},{
          29.0647,-2.88184},{29.0647,-0.224828},{29.4236,-0.224828}}));
  connect(combitimetable2.y[1],kupplung1.u) annotation(Line(points = {{-40.5751,68.5079},{-40.5751,35.7349},{-40.8633,35.7349},{-40.8633,35.5926}}));
  connect(combitimetable1.y[1],motor1.u) annotation(Line(points={{-65.6116,
          68.5079},{-65.6116,43.804},{-65.3238,43.804},{-65.3238,43.6356}}));
  connect(springdamper1.flange_b,differentialgetriebe1.flange_a) annotation(Line(points = {{-62.2825,-7.17818},{-51.7986,-7.17818},{-51.7986,-7.19425},{-52.9065,-7.19425}}));
  connect(motor1.flange_b,kupplung1.flange_a) annotation(Line(points = {{-57.3238,29.3956},{-42.0144,29.3956},{-42.0144,29.3526},{-46.8633,29.3526}}));
  connect(springdamper2.flange_b, idealrollingwheel1.flangeR) annotation (Line(
      points={{-13.1654,5.741},{-5.71224,5.741}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(springdamper2.flange_a, differentialgetriebe1.flange_b) annotation (
      Line(
      points={{-25.1654,5.741},{-32.5827,5.741},{-32.5827,-4.19425},{-40.9065,
          -4.19425}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(springdamper3.flange_b, idealrollingwheel2.flangeR) annotation (Line(
      points={{-13.1654,-18.259},{-5.71224,-18.259}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(springdamper3.flange_a, differentialgetriebe1.flange_b1) annotation (
      Line(
      points={{-25.1654,-18.259},{-32.5827,-18.259},{-32.5827,-10.1943},{
          -40.9065,-10.1943}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(kupplung1.flange_b, schaltgetriebe1.flange_a) annotation (Line(
      points={{-34.8633,29.3526},{-17.8675,29.3526}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(schaltgetriebe1.flange_b, springdamper1.flange_a) annotation (Line(
      points={{-5.8675,29.3526},{0,29.3526},{0,18},{-80.2825,18},{-80.2825,
          -7.17818},{-74.2825,-7.17818}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constant2.y, schaltgetriebe1.u) annotation (Line(
      points={{-11.8674,69.6478},{-11.8674,47.8239},{-11.8675,47.8239},{
          -11.8675,35.3526}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(                        experiment(StartTime = 0.0, StopTime = 30, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end Triebstrang5;

