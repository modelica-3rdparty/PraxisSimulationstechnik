within PraxisSimulationstechnik.Solutions;
model Jagd
  SystemDynamics.Flows.Mult2Flow mult2flow1 annotation(Placement(transformation(origin = {-43.9822,51.7088}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Stock stock1(m0 = 10) annotation(Placement(transformation(origin = {-1.48588,51.7088}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.03) annotation(Placement(transformation(origin = {-49.9257,15.7504}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter2(constValue = 0.01) annotation(Placement(transformation(origin = {43.088,-20.2397}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.CapacityConverter capacityconverter2 annotation(Placement(transformation(origin = {42.9652,15.4312}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter3(constValue = 225) annotation(Placement(transformation(origin = {61.6929,-20.0873}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Mult2AddFlow mult2addflow1 annotation(Placement(transformation(origin = {43.1784,51.8741}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter4(constValue = 0.1) annotation(Placement(transformation(origin = {72.86360000000001,11.6942}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-77.1915,51.8146}, extent = {{-10.3161,-10.3161},{10.3161,10.3161}})));
  SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {80.9559,51.8732}, extent = {{-9.51009,-9.51009},{9.51009,9.51009}})));
equation
  connect(mult2addflow1.outflow,cloudsink1.inflow) annotation(Line(points = {{55.1784,51.8741},{69.2654,51.8741},{71.44580000000001,51.4116},{71.44580000000001,51.8732}}));
  connect(cloudsource1.outflow,mult2flow1.inflow) annotation(Line(points = {{-66.8755,51.8146},{-55.2749,51.8146},{-55.2749,51.4116},{-55.9822,51.4116},{-55.9822,51.7088}}));
  connect(constantconverter4.out,mult2addflow1.in3) annotation(Line(points = {{72.86360000000001,23.6942},{72.86360000000001,28.7856},{52.1739,28.7856},{52.1739,39.8741},{51.5784,39.8741}}));
  connect(mult2addflow1.in1,stock1.out2) annotation(Line(points = {{34.7784,39.8741},{34.7784,28.7856},{-1.49925,28.7856},{-1.49925,42.7088},{-1.48588,42.7088}}));
  connect(capacityconverter2.out1,mult2addflow1.in2) annotation(Line(points = {{42.9652,27.4312},{42.9652,39.8801},{43.1784,39.8801},{43.1784,39.8741}}));
  connect(stock1.outflow,mult2addflow1.inflow) annotation(Line(points = {{10.5141,51.7088},{31.4843,51.7088},{31.4843,51.8741},{31.1784,51.8741}}));
  connect(capacityconverter2.in1,stock1.out2) annotation(Line(points = {{33.3652,3.43116},{33.3652,-3.93343},{-1.51286,-3.93343},{-1.51286,42.7088},{-1.48588,42.7088}}));
  connect(capacityconverter2.in3,constantconverter3.out) annotation(Line(points = {{52.5652,3.43116},{52.5652,-2.72315},{61.7247,-2.72315},{61.7247,-8.77458},{61.6929,-8.77458},{61.6929,-8.08733}}));
  connect(capacityconverter2.in2,constantconverter2.out) annotation(Line(points = {{42.9652,3.43116},{42.9652,-8.77458},{43.088,-8.77458},{43.088,-8.239699999999999}}));
  connect(stock1.out2,mult2flow1.in2) annotation(Line(points = {{-1.48588,42.7088},{-1.48588,28.8262},{-37.4443,28.8262},{-37.4443,39.7088},{-37.9822,39.7088}}));
  connect(constantconverter1.out,mult2flow1.in1) annotation(Line(points = {{-49.9257,27.7504},{-49.9257,38.9302},{-49.9822,38.9302},{-49.9822,39.7088}}));
  connect(mult2flow1.outflow,stock1.inflow) annotation(Line(points = {{-31.9822,51.7088},{-12.7786,51.7088},{-12.7786,51.7088},{-13.4859,51.7088}}));
  annotation(experiment(StartTime = 0.0, StopTime = 500, Tolerance = 1e-06));
end Jagd;

