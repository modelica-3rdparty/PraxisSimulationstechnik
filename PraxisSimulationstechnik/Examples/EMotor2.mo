within PraxisSimulationstechnik.Examples;
model EMotor2
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1) annotation(Placement(transformation(origin = {127.503,19.911}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = 1 / 0.3) annotation(Placement(transformation(origin = {95.3091,19.3412}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.EMF emf1(k = 1) annotation(Placement(transformation(origin = {-20.8563,19.4994}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantcurrent1(I = 1) annotation(Placement(transformation(origin = {-133.954,17.8244}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-133.365,-55.9349}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1) annotation(Placement(transformation(origin = {-105.205,45.5778}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 1) annotation(Placement(transformation(origin = {-104.699,-11.6477}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 1) annotation(Placement(transformation(origin = {-79.8846,70.3924}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 1) annotation(Placement(transformation(origin = {-45.9545,70.3924}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 1) annotation(Placement(transformation(origin = {15.8287,19.244}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Components.Spring spring1(c = 1) annotation(Placement(transformation(origin = {54.3167,19.244}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 1) annotation(Placement(transformation(origin = {35.5791,-7.5963}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(Placement(transformation(origin = {36.0855,-31.398}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {75.4445,-7.58055}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(speedsensor1.flange,idealgear1.flange_a) annotation(Line(points = {{75.4445,4.41945},{75.4445,4.41945},{75.4445,19.1319},{83.3091,19.1319},{83.3091,19.3412}}));
  connect(capacitor1.p,constantcurrent1.p) annotation(Line(points={{-104.699,
          -23.6477},{-104.699,-23.6477},{-104.699,-37.9815},{-133.926,-37.9815},
          {-133.926,5.8244},{-133.954,5.8244}}));
  connect(fixed1.flange,damper1.flange_a) annotation(Line(points={{36.0855,
          -31.398},{36.0855,-31.398},{36.0855,-19.5963},{35.5791,-19.5963}}));
  connect(damper1.flange_b,inertia2.flange_b) annotation(Line(points={{35.5791,
          4.4037},{36.0855,4.4037},{36.0855,19.244},{27.8287,19.244}}));
  connect(inertia2.flange_b,spring1.flange_a) annotation(Line(points = {{27.8287,19.244},{42.669,19.244},{42.669,19.244},{42.3167,19.244}}));
  connect(spring1.flange_b,idealgear1.flange_a) annotation(Line(points = {{66.3167,19.244},{83.689,19.244},{83.689,19.3412},{83.3091,19.3412}}));
  connect(emf1.flange,inertia2.flange_a) annotation(Line(points={{-8.8563,
          19.4994},{4.18105,19.4994},{4.18105,19.244},{3.8287,19.244}}));
  connect(resistor2.n,inductor1.p) annotation(Line(points = {{-67.8846,70.3924},{-58.1086,70.3924},{-58.1086,70.3924},{-57.9545,70.3924}}));
  connect(inductor1.n,emf1.p) annotation(Line(points = {{-33.9545,70.3924},{-20.6335,70.3924},{-20.6335,31.4994},{-20.8563,31.4994}}));
  connect(resistor2.p,constantcurrent1.n) annotation(Line(points={{-91.8846,
          70.3924},{-133.565,70.3924},{-133.565,29.3724},{-133.954,29.3724},{
          -133.954,29.8244}}));
  connect(resistor1.p,capacitor1.n) annotation(Line(points={{-105.205,33.5778},
          {-104.699,33.5778},{-104.699,0.3523}}));
  connect(resistor1.n,constantcurrent1.n) annotation(Line(points={{-105.205,
          57.5778},{-105.205,57.5778},{-105.205,70.3924},{-133.565,70.3924},{
          -133.565,29.8244},{-133.954,29.8244}}));
  connect(constantcurrent1.p,ground1.p) annotation(Line(points={{-133.954,
          5.8244},{-133.957,5.8244},{-133.957,-43.9349},{-133.365,-43.9349}}));
  connect(emf1.n,constantcurrent1.p) annotation(Line(points={{-20.8563,7.4994},
          {-20.8563,-37.7434},{-133.954,-37.7434},{-133.954,5.8244}}));
  connect(idealgear1.flange_b,inertia1.flange_a) annotation(Line(points={{107.309,
          19.3412},{115.252,19.3412},{115.252,19.911},{115.503,19.911}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001),
    uses(Modelica(version="3.2")));
end EMotor2;

