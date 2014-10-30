within PraxisSimulationstechnik.Solutions;
model Hydraulik5
  PJlib.Hydraulik.Components.Pumpe pumpe1 annotation(Placement(transformation(origin = {-54.9857,23.9317}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 500) annotation(Placement(transformation(origin = {77.71729999999999,2.50056}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.LaminarFlow laminarflow1(R = 80000000.0) annotation(Placement(transformation(origin = {15.9544,24.2166}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.CompressibleCylinder compressiblecylinder1 annotation(Placement(transformation(origin = {46.7236,2.27917}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.Valve valve1 annotation(Placement(transformation(origin = {-17.9487,23.9292}, extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Sources.Ramp ramp1(height = 7.854e-05, duration = 1, offset = 1e-08, startTime = 0.1) annotation(Placement(transformation(origin = {-17.6589,61.5385}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  PJlib.Hydraulik.Components.AmbientPressure ambientpressure1(p0 = 100000.0) annotation(Placement(transformation(origin = {-75.78019999999999,-10.5479}, extent = {{-12,-12},{12,12}}, rotation = 90)));
equation
  connect(ambientpressure1.outflow,pumpe1.porta1) annotation(Line(points = {{-75.78019999999999,1.45209},{-75.78019999999999,2.02846},{-75.7835,23.9316},{-66.98569999999999,23.9316},{-66.98569999999999,23.9317}}));
  connect(ramp1.y,valve1.A) annotation(Line(points = {{-18.2336,48.3385},{-17.6638,48.3385},{-17.6638,35.9292},{-17.9487,35.9292}}));
  connect(compressiblecylinder1.piston,mass1.flange_a) annotation(Line(points = {{58.7236,2.27917},{66.3818,2.27917},{66.3818,2.50056},{65.71729999999999,2.50056}}));
  connect(laminarflow1.outflow,compressiblecylinder1.inflow) annotation(Line(points = {{27.9544,24.2166},{41.0256,24.2166},{41.0256,14.2792},{40.7236,14.2792}}));
  connect(valve1.outflow,laminarflow1.inflow) annotation(Line(points = {{-5.9487,23.9292},{3.9886,23.9292},{3.9886,24.2166},{3.9544,24.2166}}));
  connect(pumpe1.portb1,valve1.inflow) annotation(Line(points = {{-42.9857,23.9317},{-30.1994,23.9317},{-30.1994,23.9292},{-29.9487,23.9292}}));
  annotation(Diagram(), experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 1e-06));
end Hydraulik5;

