within PraxisSimulationstechnik.Examples;
model Bevoelkerung1
  SystemDynamics.Flows.Mult2Flow mult2flow1 annotation(Placement(transformation(origin = {-43.9822,51.7088}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Mult2Flow mult2flow2 annotation(Placement(transformation(origin = {36.8499,51.4116}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Stock stock1(m0 = 10) annotation(Placement(transformation(origin = {-1.48588,51.7088}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.03) annotation(Placement(transformation(origin = {-49.9257,15.7504}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter2(constValue = 0.01) annotation(Placement(transformation(origin = {42.7935,13.9433}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.CloudSource cloudsource2 annotation(Placement(transformation(origin = {-76.3689,51.8732}, extent = {{-10,-10},{10,10}})));
  SystemDynamics.Reservoirs.CloudSink cloudsink2 annotation(Placement(transformation(origin = {70.0288,51.2968}, extent = {{-10,-10},{10,10}})));
equation
  connect(mult2flow2.outflow,cloudsink2.inflow) annotation(Line(points = {{48.8499,51.4116},{59.9424,51.4116},{59.9424,51.585},{59.9424,51.585}}));
  connect(cloudsource2.outflow,mult2flow1.inflow) annotation(Line(points = {{-66.3689,51.8732},{-55.6196,51.8732},{-55.6196,51.585},{-55.6196,51.585}}));
  connect(constantconverter2.out,mult2flow2.in2) annotation(Line(points = {{42.7935,25.9433},{42.7935,38.9805},{42.8499,38.9805},{42.8499,39.4116}}));
  connect(mult2flow2.in1,stock1.out2) annotation(Line(points = {{30.8499,39.4116},{30.8499,28.8262},{-1.48588,28.8262},{-1.48588,42.7088},{-1.48588,42.7088}}));
  connect(stock1.out2,mult2flow1.in2) annotation(Line(points = {{-1.48588,42.7088},{-1.48588,28.8262},{-37.4443,28.8262},{-37.4443,39.7088},{-37.9822,39.7088}}));
  connect(constantconverter1.out,mult2flow1.in1) annotation(Line(points = {{-49.9257,27.7504},{-49.9257,38.9302},{-49.9822,38.9302},{-49.9822,39.7088}}));
  connect(stock1.outflow,mult2flow2.inflow) annotation(Line(points = {{10.5141,51.7088},{25.26,51.7088},{25.26,51.4116},{24.8499,51.4116}}));
  connect(mult2flow1.outflow,stock1.inflow) annotation(Line(points = {{-31.9822,51.7088},{-12.7786,51.7088},{-12.7786,51.7088},{-13.4859,51.7088}}));
  annotation(experiment(StartTime = 0.0, StopTime = 200, Tolerance = 1e-06));
end Bevoelkerung1;

