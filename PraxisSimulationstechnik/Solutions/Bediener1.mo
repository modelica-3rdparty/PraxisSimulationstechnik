within PraxisSimulationstechnik.Solutions;
model Bediener1
  SystemDynamics.Reservoirs.Oven Maschine1(capacity = 4) annotation(Placement(transformation(origin = {38.0386,75.1857}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Conveyor Band12(nDelay = 3) annotation(Placement(transformation(origin = {98.0684,74.59139999999999}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.Flow Weg1 annotation(Placement(transformation(origin = {-72.6797,75.7881}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.StockD Eingangslager(m0 = 7) annotation(Placement(transformation(origin = {-41.9394,75.343}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Oven Maschine2(capacity = 4, cookingTime = 2) annotation(Placement(transformation(origin = {22.8049,4.18188}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.StockD Ausgangslager annotation(Placement(transformation(origin = {84.46250000000001,4.22854}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.SaturatedStockD Zwischenlager(minLevel = 0) annotation(Placement(transformation(origin = {-38.0529,4.54389}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.SwitchedFlow switchedflow1(onValue = 4) annotation(Placement(transformation(origin = {-9.1562,75.6913}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.SwitchedFlow switchedflow2(switchValue = 2, onValue = 4) annotation(Placement(transformation(origin = {-8.54579,4.5781}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.SwitchedConverter switchedconverter1(switchValue = 0, onValue = 1, offValue = 2) annotation(Placement(transformation(origin = {19.5332,41.5081}, extent = {{12,-12},{-12,12}}, rotation = 90)));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 2) annotation(Placement(transformation(origin = {-98.2238,49.3661}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-99.488,76.39019999999999}, extent = {{-7.83897,-7.83897},{7.83897,7.83897}})));
  SystemDynamics.Flows.ConstantFlow Weg3 annotation(Placement(transformation(origin = {68.47490000000001,74.79340000000001}, extent = {{-11.4247,-11.4247},{11.4247,11.4247}})));
  SystemDynamics.Flows.ConstantFlow Weg4 annotation(Placement(transformation(origin = {-69.28400000000001,4.48585}, extent = {{-11.3174,-11.3174},{11.3174,11.3174}})));
  SystemDynamics.Flows.ConstantFlow Weg6 annotation(Placement(transformation(origin = {55.9718,4.45906}, extent = {{-12.2329,-12.2329},{12.2329,12.2329}})));
equation
  connect(Maschine2.outflow,Weg6.inflow) annotation(Line(points = {{34.8049,4.18188},{40.9243,4.18188},{43.7389,4.18455},{43.7389,4.45906}}));
  connect(Weg6.outflow,Ausgangslager.inflow) annotation(Line(points = {{68.20480000000001,4.45906},{72.6433,4.45906},{72.6433,4.22854},{72.46250000000001,4.22854}}));
  connect(Weg4.inflow,Band12.outflow) annotation(Line(points = {{-80.6014,4.48585},{-96.5517,4.48585},{-96.5517,18.3818},{116.642,18.3818},{116.642,74.36279999999999},{110.068,74.36279999999999},{110.068,74.59139999999999}}));
  connect(Weg4.outflow,Zwischenlager.inflow) annotation(Line(points = {{-57.9665,4.48585},{-49.5506,4.48585},{-49.5506,4.54389},{-50.0529,4.54389}}));
  connect(Maschine1.outflow,Weg3.inflow) annotation(Line(points = {{50.0386,75.1857},{53.3733,75.1857},{57.0501,74.8886},{57.0501,74.79340000000001}}));
  connect(Weg3.outflow,Band12.inflow) annotation(Line(points = {{79.89960000000001,74.79340000000001},{86.057,74.79340000000001},{86.057,74.59139999999999},{86.0684,74.59139999999999}}));
  connect(cloudsource1.outflow,Weg1.inflow) annotation(Line(points = {{-91.6491,76.39019999999999},{-84.2687,76.39019999999999},{-84.2687,75.7881},{-84.6797,75.7881}}));
  connect(constantconverter1.out,Weg1.in1) annotation(Line(points = {{-86.2238,49.3661},{-86.2238,49.1808},{-72.5746,49.1808},{-72.5746,63.7881},{-72.6797,63.7881}}));
  connect(switchedflow2.in1,switchedconverter1.out1) annotation(Line(points = {{-8.54579,-7.4219},{-8.54579,-16.4812},{1.52603,-16.4812},{1.52603,41.5081},{7.53324,41.5081},{7.53324,41.5081}}));
  connect(switchedflow2.outflow,Maschine2.inflow) annotation(Line(points = {{3.45421,4.5781},{11.2927,4.5781},{11.2927,4.18188},{10.8049,4.18188}}));
  connect(switchedflow2.inflow,Zwischenlager.outflow) annotation(Line(points = {{-20.5458,4.5781},{-25.6374,4.5781},{-25.6374,4.54389},{-26.0529,4.54389}}));
  connect(switchedconverter1.in1,Maschine1.out2) annotation(Line(points = {{31.5332,41.5081},{31.5332,41.5081},{38.1509,41.5081},{38.1509,66.1857},{38.0386,66.1857}}));
  connect(switchedconverter1.out1,switchedflow1.in1) annotation(Line(points = {{7.53324,41.5081},{7.53324,41.5081},{-9.1562,41.5081},{-9.1562,63.6913},{-9.1562,63.6913}}));
  connect(switchedflow1.outflow,Maschine1.inflow) annotation(Line(points = {{2.8438,75.6913},{26.2478,75.6913},{26.2478,75.1857},{26.0386,75.1857}}));
  connect(Eingangslager.outflow,switchedflow1.inflow) annotation(Line(points = {{-29.9394,75.343},{-21.0593,75.343},{-21.0593,75.6913},{-21.1562,75.6913}}));
  connect(Weg1.outflow,Eingangslager.inflow) annotation(Line(points = {{-60.6797,75.7881},{-53.7164,75.7881},{-53.7164,75.343},{-53.9394,75.343}}));
  annotation(experiment(StartTime = 0.0, StopTime = 25.0, Tolerance = 1e-06));
end Bediener1;

