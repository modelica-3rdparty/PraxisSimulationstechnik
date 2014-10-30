within PraxisSimulationstechnik.Examples;
model Zufluss
  SystemDynamics.Reservoirs.Stock stock1(m0 = 2) annotation(Placement(transformation(origin = {25.26,54.0862}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.5) annotation(Placement(transformation(origin = {-12.1842,17.8306}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Flow flow1 annotation(Placement(transformation(origin = {-12.4814,54.0862}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-42.9395,54.1787}, extent = {{-10,-10},{10,10}})));
equation
  connect(cloudsource1.outflow,flow1.inflow) annotation(Line(points = {{-32.9395,54.1787},{-24.4957,54.1787},{-24.4957,54.0862},{-24.4814,54.0862}}));
  connect(constantconverter1.out,flow1.in1) annotation(Line(points = {{-12.1842,29.8306},{-12.1842,41.6048},{-12.4814,41.6048},{-12.4814,42.0862}}));
  connect(stock1.inflow,flow1.outflow) annotation(Line(points = {{13.26,54.0862},{0,54.0862},{0,54.0862},{-0.481426,54.0862}}));
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06));
end Zufluss;

