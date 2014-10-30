within PraxisSimulationstechnik.Examples;
model Raeuberbeute1
  SystemDynamics.Reservoirs.Stock stock1(m0 = 50) annotation(Placement(transformation(origin = {-3.26895,73.10550000000001}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Mult2Flow mult2flow1 annotation(Placement(transformation(origin = {-43.0906,73.997}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Mult2AddFlow mult2addflow1 annotation(Placement(transformation(origin = {33.581,73.6999}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Mult2SubDiv2Flow mult2subdiv2flow1 annotation(Placement(transformation(origin = {36.8816,-41.3793}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Stock stock2(m0 = 20) annotation(Placement(transformation(origin = {-3.29835,-41.6792}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Mult2Flow mult2flow2 annotation(Placement(transformation(origin = {-42.5787,-41.979}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.2) annotation(Placement(transformation(origin = {-48.8756,44.3778}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter5(constValue = 0.2) annotation(Placement(transformation(origin = {33.2834,-76.4618}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter4(constValue = 0.1) annotation(Placement(transformation(origin = {-48.8756,-78.26090000000001}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter6(constValue = 2) annotation(Placement(transformation(origin = {48.2759,-76.4618}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter2(constValue = 0.1) annotation(Placement(transformation(origin = {33.5832,41.6792}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter3(constValue = 0.01) annotation(Placement(transformation(origin = {-25.1874,15.8921}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  SystemDynamics.Converters.Mult3Converter mult3converter1 annotation(Placement(transformation(origin = {22.1889,15.8921}, extent = {{12,-12},{-12,12}}, rotation = -90)));
  SystemDynamics.Reservoirs.CloudSource cloudsource2 annotation(Placement(transformation(origin = {-73.19880000000001,-42.0749}, extent = {{-10,-10},{10,10}})));
  SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-76.08069999999999,74.0634}, extent = {{-10,-10},{10,10}})));
  SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {63.9769,73.7752}, extent = {{-10,-10},{10,10}})));
  SystemDynamics.Reservoirs.CloudSink cloudsink2 annotation(Placement(transformation(origin = {74.0634,-41.4986}, extent = {{-10,-10},{10,10}})));
equation
  connect(mult2subdiv2flow1.outflow,cloudsink2.inflow) annotation(Line(points = {{48.8816,-41.3793},{63.9769,-41.3793},{64.0634,-41.7867},{64.0634,-41.4986}}));
  connect(mult2addflow1.outflow,cloudsink1.inflow) annotation(Line(points = {{45.581,73.6999},{53.8905,73.6999},{53.8905,73.48699999999999},{53.8905,73.48699999999999}}));
  connect(cloudsource1.outflow,mult2flow1.inflow) annotation(Line(points = {{-66.08069999999999,74.0634},{-55.6196,74.0634},{-55.6196,73.997},{-55.0906,73.997}}));
  connect(cloudsource2.outflow,mult2flow2.inflow) annotation(Line(points = {{-63.1988,-42.0749},{-54.755,-42.0749},{-54.755,-41.979},{-54.5787,-41.979}}));
  connect(mult3converter1.in3,stock1.out2) annotation(Line(points = {{10.1889,25.4921},{10.1889,25.1874},{-2.69865,25.1874},{-2.69865,64.10550000000001},{-3.26895,64.10550000000001}}));
  connect(mult3converter1.in1,stock2.out1) annotation(Line(points = {{10.1889,6.2921},{10.1889,5.997},{-2.9985,5.997},{-2.9985,-32.6792},{-3.29835,-32.6792}}));
  connect(constantconverter3.out,mult3converter1.in2) annotation(Line(points = {{-13.1874,15.8921},{-13.1874,15.8921},{10.1889,15.8921},{10.1889,15.8921}}));
  connect(mult2addflow1.in3,mult3converter1.out1) annotation(Line(points = {{41.981,61.6999},{41.981,52.7736},{56.3718,52.7736},{56.3718,15.8921},{34.1889,15.8921},{34.1889,15.8921}}));
  connect(mult2subdiv2flow1.in3,mult3converter1.out1) annotation(Line(points = {{40.4816,-53.3793},{40.4816,-59.6702},{56.3718,-59.6702},{56.3718,15.8921},{34.4828,15.8921},{34.4828,15.8921},{34.1889,15.8921}}));
  connect(constantconverter2.out,mult2addflow1.in2) annotation(Line(points = {{33.5832,53.6792},{33.5832,61.7691},{33.581,61.7691},{33.581,61.6999}}));
  connect(constantconverter6.out,mult2subdiv2flow1.in4) annotation(Line(points = {{48.2759,-64.4618},{48.2759,-53.973},{47.6816,-53.973},{47.6816,-53.3793}}));
  connect(stock2.out2,mult2flow2.in2) annotation(Line(points = {{-3.29835,-50.6792},{-3.29835,-62.9685},{-36.5817,-62.9685},{-36.5817,-53.979},{-36.5787,-53.979}}));
  connect(mult2subdiv2flow1.in1,stock2.out2) annotation(Line(points = {{26.0816,-53.3793},{26.0816,-62.6687},{-3.29835,-62.6687},{-3.29835,-50.6792},{-3.29835,-50.6792}}));
  connect(constantconverter5.out,mult2subdiv2flow1.in2) annotation(Line(points = {{33.2834,-64.4618},{33.2834,-53.3733},{33.2816,-53.3733},{33.2816,-53.3793}}));
  connect(constantconverter4.out,mult2flow2.in1) annotation(Line(points = {{-48.8756,-66.26090000000001},{-48.8756,-54.2729},{-48.5787,-54.2729},{-48.5787,-53.979}}));
  connect(mult2addflow1.in1,stock1.out2) annotation(Line(points = {{25.181,61.6999},{25.181,55.7721},{-2.69865,55.7721},{-2.69865,64.10550000000001},{-3.26895,64.10550000000001}}));
  connect(stock1.out2,mult2flow1.in2) annotation(Line(points = {{-3.26895,64.10550000000001},{-3.26895,55.7721},{-36.8816,55.7721},{-36.8816,61.997},{-37.0906,61.997}}));
  connect(constantconverter1.out,mult2flow1.in1) annotation(Line(points = {{-48.8756,56.3778},{-48.8756,62.069},{-49.0906,62.069},{-49.0906,61.997}}));
  connect(stock2.inflow,mult2flow2.outflow) annotation(Line(points = {{-15.2984,-41.6792},{-29.985,-41.6792},{-29.985,-41.979},{-30.5787,-41.979}}));
  connect(mult2subdiv2flow1.inflow,stock2.outflow) annotation(Line(points = {{24.8816,-41.3793},{8.9955,-41.3793},{8.9955,-41.6792},{8.701650000000001,-41.6792}}));
  connect(mult2addflow1.inflow,stock1.outflow) annotation(Line(points = {{21.581,73.6999},{9.295349999999999,73.6999},{9.295349999999999,73.10550000000001},{8.73105,73.10550000000001}}));
  connect(mult2flow1.outflow,stock1.inflow) annotation(Line(points = {{-31.0906,73.997},{-14.6927,73.997},{-14.6927,73.10550000000001},{-15.2689,73.10550000000001}}));
  annotation(experiment(StartTime = 0.0, StopTime = 250, Tolerance = 1e-06));
end Raeuberbeute1;

