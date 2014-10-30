within PraxisSimulationstechnik.Examples;
model Fertigung
  SystemDynamics.Flows.Flow Weg1 annotation(Placement(transformation(origin = {-54.9777,75.4829}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Oven Maschine1(capacity = 4) annotation(Placement(transformation(origin = {38.0386,75.1857}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Conveyor Band12(nDelay = 2) annotation(Placement(transformation(origin = {98.0684,74.59139999999999}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Oven Maschine2(capacity = 2, cookingTime = 1) annotation(Placement(transformation(origin = {14.5643,3.57147}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.StockD Eingangslager(m0 = 7) annotation(Placement(transformation(origin = {-20.5749,75.0378}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.StockD Ausgangslager annotation(Placement(transformation(origin = {76.22190000000001,3.61813}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.SaturatedStockD Zwischenlager(minLevel = 0) annotation(Placement(transformation(origin = {-46.2935,3.93348}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 2) annotation(Placement(transformation(origin = {-80.5218,49.0609}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-81.2315,75.5309}, extent = {{-9.0998,-9.0998},{9.0998,9.0998}})));
  SystemDynamics.Flows.ConstantFlow Weg2(constRate = 2) annotation(Placement(transformation(origin = {8.10981,75.0598}, extent = {{-12.1622,-12.1622},{12.1622,12.1622}})));
  SystemDynamics.Flows.ConstantFlow Weg3 annotation(Placement(transformation(origin = {68.2393,74.79340000000001}, extent = {{-11.8959,-11.8959},{11.8959,11.8959}})));
  SystemDynamics.Flows.ConstantFlow Weg4 annotation(Placement(transformation(origin = {-76.5341,3.82729}, extent = {{-12.3079,-12.3079},{12.3079,12.3079}})));
  SystemDynamics.Flows.ConstantFlow Weg5(constRate = 2) annotation(Placement(transformation(origin = {-16.4104,3.94775}, extent = {{-12.6639,-12.6639},{12.6639,12.6639}})));
  SystemDynamics.Flows.ConstantFlow Weg6 annotation(Placement(transformation(origin = {45.777,3.44714}, extent = {{-12.1633,-12.1633},{12.1633,12.1633}})));
equation
  connect(Maschine2.outflow,Weg6.inflow) annotation(Line(points = {{26.5643,3.57147},{32.6837,3.57147},{33.6138,3.57414},{33.6138,3.44714}}));
  connect(Weg6.outflow,Ausgangslager.inflow) annotation(Line(points = {{57.9403,3.44714},{64.4027,3.44714},{64.4027,3.61813},{64.22190000000001,3.61813}}));
  connect(Weg5.outflow,Maschine2.inflow) annotation(Line(points = {{-3.74647,3.94775},{2.9985,3.94775},{2.9985,3.57147},{2.56435,3.57147}}));
  connect(Zwischenlager.outflow,Weg5.inflow) annotation(Line(points = {{-34.2935,3.93348},{-26.6263,3.93348},{-29.0742,3.86865},{-29.0742,3.94775}}));
  connect(Weg4.inflow,Band12.outflow) annotation(Line(points = {{-88.842,3.82729},{-96.5517,3.82729},{-96.5517,30.2849},{116.642,30.2849},{116.642,74.36279999999999},{110.068,74.36279999999999},{110.068,74.59139999999999}}));
  connect(Weg4.outflow,Zwischenlager.inflow) annotation(Line(points = {{-64.22629999999999,3.82729},{-57.7912,3.82729},{-57.7912,3.93348},{-58.2935,3.93348}}));
  connect(Maschine1.outflow,Weg3.inflow) annotation(Line(points = {{50.0386,75.1857},{53.3733,75.1857},{56.3434,74.8886},{56.3434,74.79340000000001}}));
  connect(Weg3.outflow,Band12.inflow) annotation(Line(points = {{80.1352,74.79340000000001},{86.057,74.79340000000001},{86.057,74.59139999999999},{86.0684,74.59139999999999}}));
  connect(Weg2.outflow,Maschine1.inflow) annotation(Line(points = {{20.272,75.0598},{26.3868,75.0598},{26.3868,75.1857},{26.0386,75.1857}}));
  connect(Eingangslager.outflow,Weg2.inflow) annotation(Line(points = {{-8.57489,75.0378},{-1.68846,75.0378},{-4.05242,75.1857},{-4.05242,75.0598}}));
  connect(cloudsource1.outflow,Weg1.inflow) annotation(Line(points = {{-72.1317,75.5309},{-66.5667,75.5309},{-66.5667,75.4829},{-66.9777,75.4829}}));
  connect(constantconverter1.out,Weg1.in1) annotation(Line(points = {{-68.5218,49.0609},{-68.5218,48.8756},{-54.8726,48.8756},{-54.8726,63.4829},{-54.9777,63.4829}}));
  connect(Weg1.outflow,Eingangslager.inflow) annotation(Line(points = {{-42.9777,75.4829},{-32.5631,75.4829},{-32.5631,75.0378},{-32.5749,75.0378}}));
  annotation(experiment(StartTime = 0.0, StopTime = 25.0, Tolerance = 1e-06));
end Fertigung;

