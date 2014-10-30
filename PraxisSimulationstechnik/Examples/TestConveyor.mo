within PraxisSimulationstechnik.Examples;
model TestConveyor
  SystemDynamics.Reservoirs.StockD stockd1(startTime = 0.1) annotation(Placement(transformation(origin = {63.2375,49.6218}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Flow flow1 annotation(Placement(transformation(origin = {-42.9652,49.9244}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.Mult2Converter mult2converter1 annotation(Placement(transformation(origin = {-42.9652,19.6672}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.TimeSwitchedConverter timeswitchedconverter1(switchTime = 13, oldValue = 5, newValue = 0) annotation(Placement(transformation(origin = {-30.2572,-12.708}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.TimeSwitchedConverter timeswitchedconverter2(switchTime = 2.5) annotation(Placement(transformation(origin = {-56.5809,-12.4054}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-70.9033,49.4809}, extent = {{-10.8641,-10.8641},{10.8641,10.8641}})));
  SystemDynamics.Flows.ConstantFlow constantflow1 annotation(Placement(transformation(origin = {29.6939,49.6164}, extent = {{-10.4233,-10.4233},{10.4233,10.4233}})));
  SystemDynamics.Reservoirs.Conveyor conveyor1(nDelay = 3, startTime = 0.1) annotation(Placement(transformation(origin = {-6.68877,49.7928}, extent = {{-12.7406,-12.7406},{12.7406,12.7406}})));
equation
  connect(conveyor1.outflow,constantflow1.inflow) annotation(Line(points = {{6.05187,49.7928},{18.5907,49.7928},{19.2706,49.6178},{19.2706,49.6164}}));
  connect(flow1.outflow,conveyor1.inflow) annotation(Line(points = {{-30.9652,49.9244},{-19.062,49.9244},{-19.4294,49.6285},{-19.4294,49.7928}}));
  connect(constantflow1.outflow,stockd1.inflow) annotation(Line(points = {{40.1172,49.6164},{51.7398,49.6164},{51.7398,49.6218},{51.2375,49.6218}}));
  connect(cloudsource1.outflow,flow1.inflow) annotation(Line(points = {{-60.0392,49.4809},{-54.7655,49.4809},{-54.7655,49.9244},{-54.9652,49.9244}}));
  connect(timeswitchedconverter1.out,mult2converter1.in2) annotation(Line(points = {{-30.2572,-0.708002},{-30.2572,1.81543},{-35.7652,1.81543},{-35.7652,7.66717}}));
  connect(timeswitchedconverter2.out,mult2converter1.in1) annotation(Line(points = {{-56.5809,-0.405446},{-56.5809,3.02572},{-50.1652,3.02572},{-50.1652,7.66717}}));
  connect(mult2converter1.out1,flow1.in1) annotation(Line(points = {{-42.9652,31.6672},{-42.9652,38.7292},{-42.9652,38.7292},{-42.9652,37.9244}}));
  annotation(experiment(StartTime = 0.0, StopTime = 20, Tolerance = 1e-06));
end TestConveyor;

