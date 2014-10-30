within PraxisSimulationstechnik.Examples;
model TestOven
  SystemDynamics.Reservoirs.Oven oven1(startTime = 0.1) annotation(Placement(transformation(origin = {-5.34918,50.2229}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Flow flow1 annotation(Placement(transformation(origin = {-39.3343,50.2269}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.TimeSwitchedConverter timeswitchedconverter1(switchTime = 0.5, newValue = 2.0) annotation(Placement(transformation(origin = {-39.3343,15.1286}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-72.92059999999999,50.3454}, extent = {{-9.99959,-9.99959},{9.99959,9.99959}})));
  SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {68.2739,49.9176}, extent = {{-9.28359,-9.28359},{9.28359,9.28359}})));
  SystemDynamics.Flows.ConstantFlow constantflow1 annotation(Placement(transformation(origin = {31.3364,50.063}, extent = {{-12.0227,-12.0227},{12.0227,12.0227}})));
equation
  connect(oven1.outflow,constantflow1.inflow) annotation(Line(points = {{6.65082,50.2229},{18.7221,50.2229},{19.3137,50.2229},{19.3137,50.063}}));
  connect(cloudsink1.inflow,constantflow1.outflow) annotation(Line(points = {{58.9903,49.9176},{42.7935,49.9176},{43.3591,50.2229},{43.3591,50.063}}));
  connect(flow1.inflow,cloudsource1.outflow) annotation(Line(points = {{-51.3343,50.2269},{-61.7247,50.2269},{-62.921,49.9231},{-62.921,50.3454}}));
  connect(timeswitchedconverter1.out,flow1.in1) annotation(Line(points = {{-39.3343,27.1286},{-39.3343,38.1241},{-39.3343,38.1241},{-39.3343,38.2269}}));
  connect(flow1.outflow,oven1.inflow) annotation(Line(points = {{-27.3343,50.2269},{-16.944,50.2269},{-16.944,50.2269},{-17.3492,50.2269},{-17.3492,50.2229}}));
  annotation(experiment(StartTime = 0.0, StopTime = 8.0, Tolerance = 1e-06));
end TestOven;

