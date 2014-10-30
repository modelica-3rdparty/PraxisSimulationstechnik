within PraxisSimulationstechnik.Examples;
model Bevoelkerung2
  SystemDynamics.Flows.Mult2Flow mult2flow1 annotation(Placement(transformation(origin = {-43.9822,51.7088}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Mult2Flow mult2flow2 annotation(Placement(transformation(origin = {36.8499,51.4116}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Stock stock1(m0 = 10) annotation(Placement(transformation(origin = {-1.48588,51.7088}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.03) annotation(Placement(transformation(origin = {-49.9257,15.7504}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.MultPower3Converter multpower3converter1(k1 = 1.0, k3 = -1.0) annotation(Placement(transformation(origin = {42.5787,16.4918}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter2(constValue = 0.01) annotation(Placement(transformation(origin = {42.4936,-20.2397}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter3(constValue = 50) annotation(Placement(transformation(origin = {61.0769,-20.09}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.CloudSource cloudsource2 annotation(Placement(transformation(origin = {-72.3343,51.8732}, extent = {{-10,-10},{10,10}})));
  SystemDynamics.Reservoirs.CloudSink cloudsink2 annotation(Placement(transformation(origin = {68.2997,51.2968}, extent = {{-10,-10},{10,10}})));
equation
  connect(mult2flow2.outflow,cloudsink2.inflow) annotation(Line(points = {{48.8499,51.4116},{58.2133,51.4116},{58.2133,51.585},{58.2133,51.585}}));
  connect(cloudsource2.outflow,mult2flow1.inflow) annotation(Line(points = {{-62.3343,51.8732},{-56.4841,51.8732},{-56.4841,52.1614},{-56.4841,52.1614}}));
  connect(multpower3converter1.in1,stock1.out2) annotation(Line(points = {{32.9787,4.4918},{32.9787,-1.51286},{-1.51286,-1.51286},{-1.51286,42.7088},{-1.48588,42.7088}}));
  connect(multpower3converter1.in3,constantconverter3.out) annotation(Line(points = {{52.1787,4.4918},{52.1787,-0.907716},{60.8169,-0.907716},{60.8169,-8.09},{61.0769,-8.09}}));
  connect(constantconverter2.out,multpower3converter1.in2) annotation(Line(points = {{42.4936,-8.239660000000001},{42.4936,3.89805},{42.5787,3.89805},{42.5787,4.49175}}));
  connect(multpower3converter1.out1,mult2flow2.in2) annotation(Line(points = {{42.5787,28.4918},{42.5787,39.8801},{42.8499,39.8801},{42.8499,39.4116}}));
  connect(mult2flow2.in1,stock1.out2) annotation(Line(points = {{30.8499,39.4116},{30.8499,28.8262},{-1.48588,28.8262},{-1.48588,42.7088},{-1.48588,42.7088}}));
  connect(stock1.out2,mult2flow1.in2) annotation(Line(points = {{-1.48588,42.7088},{-1.48588,28.8262},{-37.4443,28.8262},{-37.4443,39.7088},{-37.9822,39.7088}}));
  connect(constantconverter1.out,mult2flow1.in1) annotation(Line(points = {{-49.9257,27.7504},{-49.9257,38.9302},{-49.9822,38.9302},{-49.9822,39.7088}}));
  connect(stock1.outflow,mult2flow2.inflow) annotation(Line(points = {{10.5141,51.7088},{25.26,51.7088},{25.26,51.4116},{24.8499,51.4116}}));
  connect(mult2flow1.outflow,stock1.inflow) annotation(Line(points = {{-31.9822,51.7088},{-12.7786,51.7088},{-12.7786,51.7088},{-13.4859,51.7088}}));
  annotation(experiment(StartTime = 0.0, StopTime = 300, Tolerance = 1e-06));
end Bevoelkerung2;

