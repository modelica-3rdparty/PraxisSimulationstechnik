within PraxisSimulationstechnik.Examples;
model EMotor3B
  model Stromquelle
    import Modelica.SIunits.*;
    parameter Current I0 = 1;
    parameter Resistance R = 1;
    parameter Capacitance C = 1;
    Modelica.Electrical.Analog.Interfaces.PositivePin positivepin1 annotation(Placement(transformation(origin = {-1.99431,-86.6097}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-1.99431,-86.6097}, extent = {{-5.59809,-5.59809},{5.59809,5.59809}})));
    Modelica.Electrical.Analog.Interfaces.NegativePin negativepin1 annotation(Placement(transformation(origin = {-2.849,90.8832}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-2.849,90.8832}, extent = {{-5.08917,-5.08917},{5.08917,5.08917}})));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-90.3134,-71.7948}, extent = {{-12,-12},{12,12}})));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = C) annotation(Placement(transformation(origin = {-28.49,-28.2051}, extent = {{12,-12},{-12,12}}, rotation = 90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = R) annotation(Placement(transformation(origin = {-28.737,45.4289}, extent = {{12,-12},{-12,12}}, rotation = 90)));
    Modelica.Electrical.Analog.Sources.ConstantCurrent constantcurrent1(I = I0) annotation(Placement(transformation(origin = {-70.0527,19.6482}, extent = {{-12,-12},{12,12}}, rotation = 90)));
  equation
    connect(negativepin1,constantcurrent1.n) annotation(Line(points = {{-2.849,90.8832},{-2.88184,90.8832},{-2.88184,73.7752},{-70.0288,73.7752},{-70.0288,31.4121},{-70.0288,31.4121}}));
    connect(positivepin1,constantcurrent1.p) annotation(Line(points = {{-1.99431,-86.6097},{-2.30548,-86.6097},{-2.30548,-51.585},{-70.0288,-51.585},{-70.0288,7.78098},{-70.0288,7.78098}}));
    connect(ground1.p,constantcurrent1.p) annotation(Line(points = {{-90.3134,-59.7948},{-70.0288,-59.7948},{-70.0288,6.91643},{-70.0288,6.91643}}));
    connect(capacitor1.n,constantcurrent1.p) annotation(Line(points = {{-28.49,-40.2051},{-28.49,-51.585},{-70.0288,-51.585},{-70.0288,7.4928},{-70.0288,7.4928}}));
    connect(constantcurrent1.n,resistor1.p) annotation(Line(points = {{-70.0527,31.6482},{-70.0527,73.7752},{-28.5303,73.7752},{-28.5303,57.3487},{-28.5303,57.3487}}));
    connect(capacitor1.p,resistor1.n) annotation(Line(points = {{-28.49,-16.2051},{-28.49,34.2939},{-28.8184,34.2939},{-28.8184,34.2939}}));
    annotation(Diagram(), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Line(origin = {-5.4755,5.4755}, rotation = -180, points = {{-2.5641,62.3735},{-2.5641,86.911}}, smooth = Smooth.Bezier),Ellipse(origin = {-5.18732,6.05187}, rotation = -180, extent = {{37.6068,-54.7009},{-41.5954,19.3732}}, endAngle = 360),Ellipse(origin = {-5.18732,6.05187}, rotation = -180, extent = {{35.8974,-13.1054},{-40.4558,61.5385}}, endAngle = 360),Line(origin = {-0.288184,144.669}, points = {{-2.5641,-57.5499},{-2.5641,-82.6408}}, smooth = Smooth.Bezier)}));
  end Stromquelle;
  model Elektromotor
    import Modelica.SIunits.*;
    parameter Real k = 1 "Übertragungsfaktor";
    parameter Resistance R = 1 "Innenwiderstand";
    parameter Inductance L = 1 "Induktivität";
    parameter Inertia J = 1 "Trägheitsmoment";
    parameter RotationalDampingConstant b = 1 "Reibungswert";
    parameter RotationalSpringConstant c = 1 "Achsensteifheit";
    Modelica.Electrical.Analog.Basic.EMF emf1(k = k) annotation(Placement(transformation(origin = {-28.0759,19.4994}, extent = {{-12,-12},{12,12}})));
    Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = J) annotation(Placement(transformation(origin = {8.60914,19.244}, extent = {{-12,-12},{12,12}})));
    Modelica.Mechanics.Rotational.Components.Spring spring1(c = c) annotation(Placement(transformation(origin = {47.0971,19.244}, extent = {{-12,-12},{12,12}})));
    Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(Placement(transformation(origin = {28.8659,-31.398}, extent = {{-12,-12},{12,12}})));
    Modelica.Electrical.Analog.Interfaces.NegativePin negativepin1 annotation(Placement(transformation(origin = {3.1339,99.4302}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {3.1339,99.4302}, extent = {{-12,-12},{12,12}})));
    Modelica.Electrical.Analog.Interfaces.PositivePin positivepin1 annotation(Placement(transformation(origin = {3.4188,-97.7208}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {3.4188,-97.7208}, extent = {{-12,-12},{12,12}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1 annotation(Placement(transformation(origin = {100.57,3.98859}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100.57,3.98859}, extent = {{-12,-12},{12,12}})));
    Modelica.Mechanics.Rotational.Components.Damper damper1(d = b) annotation(Placement(transformation(origin = {28.3595,-7.5963}, extent = {{12,-12},{-12,12}}, rotation = 90)));
    Modelica.Electrical.Analog.Basic.Inductor inductor1(L = L) annotation(Placement(transformation(origin = {-28.3878,49.8796}, extent = {{-12,12},{12,-12}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = R) annotation(Placement(transformation(origin = {-28.4147,78.93940000000001}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  equation
    connect(spring1.flange_b,flange_b1) annotation(Line(points = {{59.0971,19.244},{78.9174,19.244},{78.9174,3.98859},{100.57,3.98859}}));
    connect(emf1.n,positivepin1) annotation(Line(points = {{-28.0759,7.4994},{-28.0759,-11.6809},{3.4188,-11.6809},{3.4188,-97.7208}}));
    connect(resistor2.n,inductor1.p) annotation(Line(points = {{-28.4147,66.93940000000001},{-28.2051,66.93940000000001},{-28.2051,61.8796},{-28.3878,61.8796}}));
    connect(negativepin1,resistor2.p) annotation(Line(points = {{3.1339,99.4302},{-27.9202,99.4302},{-27.9202,90.93940000000001},{-28.4147,90.93940000000001}}));
    connect(inductor1.n,emf1.p) annotation(Line(points = {{-28.3878,37.8796},{-27.8531,37.8796},{-27.8531,31.4994},{-28.0759,31.4994}}));
    connect(emf1.n,positivepin1) annotation(Line(points = {{-28.0759,7.4994},{-28.0759,-11.6809},{0.854701,-11.6809},{0.854701,-99.14530000000001}}));
    connect(spring1.flange_b,flange_b1) annotation(Line(points = {{59.0971,19.244},{78.9174,19.244},{78.9174,19.0883},{99.71510000000001,19.0883}}));
    connect(fixed1.flange,damper1.flange_a) annotation(Line(points = {{28.8659,-31.398},{28.8659,-31.398},{28.8659,-19.5963},{28.3595,-19.5963}}));
    connect(damper1.flange_b,inertia2.flange_b) annotation(Line(points = {{28.3595,4.4037},{28.8659,4.4037},{28.8659,19.244},{20.6091,19.244},{20.6091,19.244}}));
    connect(inertia2.flange_b,spring1.flange_a) annotation(Line(points = {{20.6091,19.244},{35.4494,19.244},{35.4494,19.244},{35.0971,19.244}}));
    connect(emf1.flange,inertia2.flange_a) annotation(Line(points = {{-16.0759,19.4994},{-3.03852,19.4994},{-3.03852,19.244},{-3.39086,19.244}}));
    connect(inductor1.n,emf1.p) annotation(Line(points = {{-41.1741,70.39239999999999},{-27.8531,70.39239999999999},{-27.8531,31.4994},{-28.0759,31.4994}}));
    annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-06), Diagram(), Icon(graphics = {Ellipse(lineColor = {0,0,0}, fillColor = {0,0,0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 1.25, extent = {{-47.8632,52.9915},{53.5613,-45.584}}),Line(points = {{2.849,54.9858},{2.849,87.4644},{2.849,87.4644}}, pattern = LinePattern.Solid, thickness = 0.25, smooth = Smooth.Bezier),Line(points = {{3.1339,-47.8632},{3.1339,-86.3248}}, pattern = LinePattern.Solid, thickness = 0.25, smooth = Smooth.Bezier),Line(points = {{56.4103,3.7037},{88.31910000000001,3.7037}}, pattern = LinePattern.Solid, thickness = 2.75, smooth = Smooth.Bezier)}));
  end Elektromotor;
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = 1 / 0.3) annotation(Placement(transformation(origin = {27.9755,16.7771}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1) annotation(Placement(transformation(origin = {59.3143,16.7771}, extent = {{-12,-12},{12,12}})));
  Elektromotor elektromotor1 annotation(Placement(transformation(origin = {-17.3789,16.2393}, extent = {{-12,-12},{12,12}})));
  Stromquelle stromquelle1 annotation(Placement(transformation(origin = {-60.0457,15.7327}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {6.73344,-5.60262}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(stromquelle1.positivepin1,elektromotor1.positivepin1) annotation(Line(points = {{-60.285,5.33954},{-60.114,5.33954},{-60.114,-7.69231},{-16.8091,-7.69231},{-16.8091,4.5128},{-16.9686,4.5128}}));
  connect(stromquelle1.negativepin1,elektromotor1.negativepin1) annotation(Line(points = {{-60.3876,26.6387},{-60.3989,26.6387},{-60.3989,37.8917},{-16.5242,37.8917},{-16.5242,28.1709},{-17.0028,28.1709}}));
  connect(speedsensor1.flange,idealgear1.flange_a) annotation(Line(points = {{6.73344,6.39738},{6.55271,6.39738},{6.55271,16.5242},{15.9755,16.5242},{15.9755,16.7771}}));
  connect(elektromotor1.flange_b1,idealgear1.flange_a) annotation(Line(points = {{-5.3105,16.7179},{16.2393,16.7179},{16.2393,16.7771},{15.9755,16.7771}}));
  connect(idealgear1.flange_b,inertia1.flange_a) annotation(Line(points = {{39.9755,16.7771},{48.433,16.7771},{48.433,16.7771},{47.3143,16.7771}}));
  annotation(Diagram(), experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-06));
end EMotor3B;

