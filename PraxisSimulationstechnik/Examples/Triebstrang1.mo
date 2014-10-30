within PraxisSimulationstechnik.Examples;
model Triebstrang1
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constanttorque1(tau_constant = 100) annotation(Placement(transformation(origin = {-81.5753,68.6292}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.6, w(start = 83.7758, fixed = true), phi(start = 0.0, fixed = true)) annotation(Placement(transformation(origin = {-59.1917,68.374}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Clutch clutch1(peak = 1.071428571, cgeo = 1, fn_max = 560) annotation(Placement(transformation(origin = {-39.3553,68.0867}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 0.2, w(start = 0.0, fixed = true), phi(start = 0.0, fixed = true)) annotation(Placement(transformation(origin = {-18.1219,67.5851}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = 2.5) annotation(Placement(transformation(origin = {2.4123,67.7993}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 10000, d = 1) annotation(Placement(transformation(origin = {-67.4192,31.383}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia3(J = 0.05, w(start = 0.0, fixed = true), phi(start = 0.0, fixed = true)) annotation(Placement(transformation(origin = {-47.8166,30.8814}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = 3.27) annotation(Placement(transformation(origin = {-25.8117,30.8814}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel1(radius = 0.3) annotation(Placement(transformation(origin = {14.1007,42.3022}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel2(radius = 0.3) annotation(Placement(transformation(origin = {14.1007,20.4317}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1200, s(start = 0, fixed = true), v(start = 0, fixed = true)) annotation(Placement(transformation(origin = {36.5617,31.5676}, extent = {{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(transformation(origin = {-39.5297,87.8284}, extent = {{-6,6},{6,-6}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper2(c = 7500, d = 1) annotation(Placement(transformation(origin = {-3.16545,42.3021}, extent = {{-6,-6},{6,6}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springdamper3(c = 7500, d = 1) annotation(Placement(transformation(origin = {-3.45327,20.4316}, extent = {{-6,-6},{6,6}})));
equation
  connect(springdamper3.flange_a,idealgear2.flange_b) annotation(Line(points = {{-9.45327,20.4316},{-13.5252,20.4316},{-13.5252,31.0791},{-19.8117,31.0791},{-19.8117,30.8814}}));
  connect(springdamper2.flange_a,idealgear2.flange_b) annotation(Line(points = {{-9.16545,42.3021},{-13.5252,42.3021},{-13.5252,31.0791},{-19.8117,31.0791},{-19.8117,30.8814}}));
  connect(springdamper3.flange_b,idealrollingwheel2.flangeR) annotation(Line(points = {{2.54673,20.4316},{8.34532,20.4316},{8.34532,20.4317},{8.1007,20.4317}}));
  connect(springdamper2.flange_b,idealrollingwheel1.flangeR) annotation(Line(points = {{2.83455,42.3021},{8.05755,42.3021},{8.05755,42.3022},{8.1007,42.3022},{8.1007,42.3022}}));
  connect(idealrollingwheel1.flangeT,mass1.flange_a) annotation(Line(points = {{20.1007,42.3022},{26.1871,42.3022},{26.1871,31.6547},{30.5617,31.6547},{30.5617,31.5676}}));
  connect(idealrollingwheel2.flangeT,mass1.flange_a) annotation(Line(points = {{20.1007,20.4317},{26.1871,20.4317},{26.1871,31.6547},{30.5617,31.6547},{30.5617,31.5676}}));
  connect(inertia3.flange_b,idealgear2.flange_a) annotation(Line(points = {{-41.8166,30.8814},{-31.3218,30.8814},{-31.3218,30.8814},{-31.8117,30.8814}}));
  connect(springdamper1.flange_b,inertia3.flange_a) annotation(Line(points = {{-61.4192,31.383},{-53.7356,31.383},{-53.7356,30.8814},{-53.8166,30.8814}}));
  connect(idealgear1.flange_b,springdamper1.flange_a) annotation(Line(points = {{8.4123,67.7993},{15.8046,67.7993},{15.8046,52.2989},{-77.0115,52.2989},{-77.0115,31.3218},{-73.4192,31.3218},{-73.4192,31.383}}));
  connect(inertia2.flange_b,idealgear1.flange_a) annotation(Line(points = {{-12.1219,67.5851},{-3.16092,67.5851},{-3.16092,67.7993},{-3.5877,67.7993}}));
  connect(clutch1.flange_b,inertia2.flange_a) annotation(Line(points = {{-33.3553,68.0867},{-23.8506,68.0867},{-23.8506,67.5851},{-24.1219,67.5851}}));
  connect(inertia1.flange_b,clutch1.flange_a) annotation(Line(points = {{-53.1917,68.374},{-45.1149,68.374},{-45.1149,68.0867},{-45.3553,68.0867}}));
  connect(constanttorque1.flange,inertia1.flange_a) annotation(Line(points = {{-75.5753,68.6292},{-64.9425,68.6292},{-64.9425,68.374},{-65.1917,68.374}}));
  connect(constant1.y,clutch1.f_normalized) annotation(Line(points = {{-39.5297,81.2284},{-38.7931,81.2284},{-38.7931,74.6867},{-39.3553,74.6867}}));
  annotation(experiment(StartTime = 0.0, StopTime = 25.0, Tolerance = 0.000001),
    uses(Modelica(version="3.2")));
end Triebstrang1;
