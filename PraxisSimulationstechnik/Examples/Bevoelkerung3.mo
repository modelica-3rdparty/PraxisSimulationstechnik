within PraxisSimulationstechnik.Examples;
model Bevoelkerung3
  SystemDynamics.Flows.Mult2Flow mult2flow1 annotation(Placement(transformation(origin = {-43.9822,51.7088}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Stock stock1(m0 = 10) annotation(Placement(transformation(origin = {-1.48588,51.7088}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.03) annotation(Placement(transformation(origin = {-49.9257,15.7504}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter2(constValue = 0.01) annotation(Placement(transformation(origin = {43.088,-20.2397}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.CapacityConverter capacityconverter2 annotation(Placement(transformation(origin = {42.9652,15.4312}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter3(constValue = 225) annotation(Placement(transformation(origin = {61.6929,-20.0873}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {72.55589999999999,51.5901}, extent = {{-10,-10},{10,10}})));
  SystemDynamics.Reservoirs.CloudSource cloudsource2 annotation(Placement(transformation(origin = {-75.06780000000001,51.5674}, extent = {{-10,-10},{10,10}})));
  SystemDynamics.Flows.Mult2Flow mult2flow2 annotation(Placement(transformation(origin = {37.4263,51.1234}, extent = {{-12,-12},{12,12}})));
equation
  connect(stock1.out2,mult2flow2.in1) annotation(Line(points = {{-1.48588,42.7088},{-1.72911,42.7088},{-1.72911,28.8184},{31.7003,28.8184},{31.7003,39.4813},{31.7003,39.4813}}));
  connect(mult2flow2.outflow,cloudsink1.inflow) annotation(Line(points = {{49.4263,51.1234},{63.3687,51.1234},{62.5559,50.6478},{62.5559,51.5901}}));
  connect(stock1.outflow,mult2flow2.inflow) annotation(Line(points = {{10.5141,51.7088},{25.26,51.7088},{25.4263,51.4116},{25.4263,51.1234}}));
  connect(capacityconverter2.out1,mult2flow2.in2) annotation(Line(points = {{42.9652,27.4312},{42.9652,39.3343},{43.4263,39.3343},{43.4263,39.1234}}));
  connect(cloudsource2.outflow,mult2flow1.inflow) annotation(Line(points = {{-65.06780000000001,51.5674},{-56.066,51.5674},{-56.066,51.7088},{-55.9822,51.7088}}));
  connect(capacityconverter2.in1,stock1.out2) annotation(Line(points = {{33.3652,3.43116},{33.3652,-3.93343},{-1.51286,-3.93343},{-1.51286,42.7088},{-1.48588,42.7088}}));
  connect(capacityconverter2.in3,constantconverter3.out) annotation(Line(points = {{52.5652,3.43116},{52.5652,-2.72315},{61.7247,-2.72315},{61.7247,-8.77458},{61.6929,-8.77458},{61.6929,-8.08733}}));
  connect(capacityconverter2.in2,constantconverter2.out) annotation(Line(points = {{42.9652,3.43116},{42.9652,-8.77458},{43.088,-8.77458},{43.088,-8.239699999999999}}));
  connect(stock1.out2,mult2flow1.in2) annotation(Line(points = {{-1.48588,42.7088},{-1.48588,28.8262},{-37.4443,28.8262},{-37.4443,39.7088},{-37.9822,39.7088}}));
  connect(constantconverter1.out,mult2flow1.in1) annotation(Line(points = {{-49.9257,27.7504},{-49.9257,38.9302},{-49.9822,38.9302},{-49.9822,39.7088}}));
  connect(mult2flow1.outflow,stock1.inflow) annotation(Line(points = {{-31.9822,51.7088},{-12.7786,51.7088},{-12.7786,51.7088},{-13.4859,51.7088}}));
  annotation(experiment(StartTime = 0.0, StopTime = 300.0, Tolerance = 1e-06));
end Bevoelkerung3;

