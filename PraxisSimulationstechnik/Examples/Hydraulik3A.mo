within PraxisSimulationstechnik.Examples;
model Hydraulik3A
  model CompressibleCylinder
    import Modelica.SIunits.*;
    parameter Area A = 0.001 "Kolbenfläche";
    parameter BulkModulus K = 1150000000.0 "Kompressionsmodul";
    parameter Volume V0 = 0.002 "Volumen";
    parameter Pressure pa = 100000.0 "Außendruck";
    Pressure p(start = pa, fixed = true);
    Position s(start = 0);
    Velocity v;
    PJlib.Hydraulik.Interfaces.Port_a inflow annotation(Placement(transformation(extent = {{-60,90},{-40,110}})));
    Modelica.Mechanics.Translational.Interfaces.Flange_b piston annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
  equation
    inflow.p = p;
    piston.s = s;
    piston.f = -A * (p - pa);
    der(p) = K / V0 * (inflow.q - A * v);
    der(s) = v;
    annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points = {{60,60},{-90,60},{-90,-60},{60,-60}}),Line(points = {{20,60},{20,-60}}),Line(points = {{-50,100},{-50,60}}),Line(points = {{20,0},{100,0}}),Rectangle(extent = {{-100,-100},{100,100}}, lineColor = {0,0,0}),Rectangle(extent = {{-90,-60},{20,60}}, lineColor = {0,0,0}, fillColor = {83,233,255}, fillPattern = FillPattern.Solid)}));
  end CompressibleCylinder;
  PJlib.Hydraulik.Components.FlowSource flowsource1 annotation(Placement(transformation(origin = {-41.5954,59.8291}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.LaminarFlow laminarflow1(R = 80000000.0) annotation(Placement(transformation(origin = {-11.396,60.114}, extent = {{-12,-12},{12,12}})));
  CompressibleCylinder compressiblecylinder1 annotation(Placement(transformation(origin = {18.5185,38.4615}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 500) annotation(Placement(transformation(origin = {49.7971,38.3951}, extent = {{-12,-12},{12,12}})));
  PJlib.Hydraulik.Components.AmbientPressure ambientpressure1(p0 = 100000.0) annotation(Placement(transformation(origin = {-64.9573,25.9259}, extent = {{-12,-12},{12,12}}, rotation = 90)));
equation
  connect(ambientpressure1.outflow,flowsource1.inflow) annotation(Line(points = {{-64.9573,37.9259},{-64.9573,37.9259},{-64.9573,59.5442},{-53.5954,59.5442},{-53.5954,59.8291}}));
  connect(compressiblecylinder1.piston,mass1.flange_a) annotation(Line(points = {{30.5185,38.4615},{38.1766,38.4615},{38.1766,38.3951},{37.7971,38.3951}}));
  connect(laminarflow1.outflow,compressiblecylinder1.inflow) annotation(Line(points = {{0.604,60.114},{12.5356,60.114},{12.5356,50.4615},{12.5185,50.4615}}));
  connect(flowsource1.outflow,laminarflow1.inflow) annotation(Line(points = {{-29.5954,59.8291},{-23.0769,59.8291},{-23.0769,60.114},{-23.396,60.114}}));
  annotation(Diagram(), experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 1e-06));
end Hydraulik3A;

