within PraxisSimulationstechnik.Examples;
model Triebstrang4
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-68.2825,-7.17818}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Motor motor1(om0 = 720.3) annotation(Placement(transformation(origin = {-65.3238,35.3956}, extent = {{-8,-8},{8,8}})));
  PJlib.Kap16.Kupplung kupplung1(Mh = 300) annotation(Placement(transformation(origin = {-40.8633,29.3526}, extent = {{-6,-6},{6,6}})));
  PJlib.Kap16.Differentialgetriebe differentialgetriebe1(om0 = 173.6) annotation(Placement(transformation(origin = {-46.331,-7.19426}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1200, s(start = 0, fixed = true), v(start = 15.92, fixed = true)) annotation(Placement(transformation(origin = {18.72,-7.56912}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel1(radius = 0.32) annotation(Placement(transformation(origin={-2.87771,
            3.741},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel2(radius = 0.3) annotation(Placement(transformation(origin={-2.87771,
            -18.259},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(origin = {-65.3237,62.1583}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(transformation(origin = {-40.8633,62.1582}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  PJlib.Kap16.Schaltgetriebe schaltgetriebe1(om0 = 720.3) annotation(Placement(transformation(origin = {-17.8675,29.683}, extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.Constant constant2(k = 1) annotation(Placement(transformation(origin = {-17.8674,62.2478}, extent = {{-6,-6},{6,6}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper2(c = 7500, d=1)   annotation(Placement(transformation(origin={-21.1654,
            3.741},                                                                                                    extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper3(c = 7500, d=1)   annotation(Placement(transformation(origin={-21.1654,
            -18.259},                                                                                                    extent = {{-6,-6},{6,6}})));
equation
  connect(constant2.y,schaltgetriebe1.u) annotation(Line(points = {{-17.8674,55.6478},{-17.8674,36.0231},{-17.8675,36.0231},{-17.8675,35.683}}));
  connect(schaltgetriebe1.flange_b,springdamper1.flange_a) annotation(Line(points={{
          -11.8675,29.683},{-3.17003,29.683},{-3.17003,16.4265},{-83.8617,
          16.4265},{-83.8617,-7.4928},{-74.2825,-7.4928},{-74.2825,-7.17818}}));
  connect(kupplung1.flange_b,schaltgetriebe1.flange_a) annotation(Line(points={{
          -34.8633,29.3526},{-24.4957,29.3526},{-24.4957,29.683},{-23.8675,
          29.683}}));
  connect(idealrollingwheel2.flangeT,mass1.flange_a) annotation(Line(points={{3.12229,
          -18.259},{9.20869,-18.259},{9.20869,-7.48202},{12.72,-7.48202},{12.72,
          -7.56912}}));
  connect(idealrollingwheel1.flangeT,mass1.flange_a) annotation(Line(points={{3.12229,
          3.741},{9.20869,3.741},{9.20869,-7.48202},{12.72,-7.48202},{12.72,
          -7.56912}}));
  connect(springdamper1.flange_b,differentialgetriebe1.flange_a) annotation(Line(points = {{-62.2825,-7.17818},{-51.7986,-7.17818},{-51.7986,-7.19426},{-52.331,-7.19426}}));
  connect(constant1.y,kupplung1.u) annotation(Line(points = {{-40.8633,55.5582},{-40.8633,55.5582},{-40.8633,35.5926},{-40.8633,35.5926}}));
  connect(const.y,motor1.u) annotation(Line(points = {{-65.3237,55.5583},{-65.3237,55.5583},{-65.3237,43.6356},{-65.3238,43.6356}}));
  connect(motor1.flange_b,kupplung1.flange_a) annotation(Line(points = {{-57.3238,29.3956},{-42.0144,29.3956},{-42.0144,29.3526},{-46.8633,29.3526}}));
  connect(springdamper2.flange_b, idealrollingwheel1.flangeR) annotation (Line(
      points={{-15.1654,3.741},{-8.87771,3.741}}));
  connect(springdamper2.flange_a, differentialgetriebe1.flange_b) annotation (
      Line(
      points={{-27.1654,3.741},{-33.5827,3.741},{-33.5827,-4.19426},{-40.331,
          -4.19426}}));
  connect(springdamper3.flange_b, idealrollingwheel2.flangeR) annotation (Line(
      points={{-15.1654,-18.259},{-8.87771,-18.259}}));
  connect(springdamper3.flange_a, differentialgetriebe1.flange_b1) annotation (
      Line(
      points={{-27.1654,-18.259},{-33.5827,-18.259},{-33.5827,-10.1943},{
          -40.331,-10.1943}}));
  annotation(                        experiment(StartTime = 0.0, StopTime = 50.0, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end Triebstrang4;

