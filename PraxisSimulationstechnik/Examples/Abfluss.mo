within PraxisSimulationstechnik.Examples;
model Abfluss
  SystemDynamics.Flows.Flow flow1 annotation(Placement(transformation(origin = {-12.4814,54.0862}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.SaturatedStock saturatedstock1(m0 = 4, minLevel = 0) annotation(Placement(transformation(origin = {-47.8064,53.8578}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.5) annotation(Placement(transformation(origin = {-12.4868,18.1332}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.CloudSink cloudsink2 annotation(Placement(transformation(origin = {21.902,54.1787}, extent = {{-10,-10},{10,10}})));
equation
  connect(flow1.outflow,cloudsink2.inflow) annotation(Line(points = {{-0.4814,54.0862},{12.1037,54.0862},{12.1037,54.1787},{12.1037,54.1787}}));
  connect(constantconverter1.out,flow1.in1) annotation(Line(points = {{-12.4868,30.1332},{-12.4868,41.6048},{-12.4814,41.6048},{-12.4814,42.0862}}));
  connect(flow1.inflow,saturatedstock1.outflow) annotation(Line(points = {{-24.4814,54.0862},{-35.4009,54.0862},{-35.4009,53.8578},{-35.8064,53.8578}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 1e-06));
end Abfluss;

