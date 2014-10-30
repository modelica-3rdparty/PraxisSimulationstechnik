within PraxisSimulationstechnik.Examples;
model EMotor3A
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = 1 / 0.3) annotation(Placement(transformation(origin = {10.8262,26.7806}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {-7.98008,4.82896}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  PJlib.Kap14.Stromquelle stromquelle1 annotation(Placement(transformation(origin = {-62.9597,26.797}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap14.Elektromotor elektromotor1 annotation(Placement(transformation(origin = {-26.2108,27.0754}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1) annotation(Placement(transformation(origin = {42.4698,26.4891}, extent = {{-12,-12},{12,12}})));
equation
  connect(idealgear1.flange_b,inertia1.flange_a) annotation(Line(points = {{22.8262,26.7806},{28.2051,26.7806},{30.4698,27.0655},{30.4698,26.4891}}));
  connect(stromquelle1.negativepin1,elektromotor1.negativepin1) annotation(Line(points = {{-63.3016,37.703},{-63.5328,37.703},{-63.5328,51.567},{-25.641,51.567},{-25.8347,38.1425},{-25.8347,39.007}}));
  connect(elektromotor1.flange_b1,idealgear1.flange_a) annotation(Line(points = {{-14.1424,27.554},{-1.4245,27.554},{-1.4245,26.7806},{-1.17379,26.7806}}));
  connect(stromquelle1.positivepin1,elektromotor1.positivepin1) annotation(Line(points = {{-63.199,16.4039},{-63.2508,16.4039},{-63.2508,2.849},{-25.9345,2.849},{-25.8005,14.4843},{-25.8005,15.3489}}));
  connect(speedsensor1.flange,idealgear1.flange_a) annotation(Line(points = {{-7.98008,16.829},{-7.97721,16.829},{-7.97721,26.4957},{-1.1738,26.4957},{-1.1738,26.7806}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 1e-06));
end EMotor3A;

