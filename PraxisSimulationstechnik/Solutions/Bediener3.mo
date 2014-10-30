within PraxisSimulationstechnik.Solutions;
model Bediener3
  SystemDynamics.Flows.Flow Weg1 annotation(Placement(transformation(origin = {-72.6797,75.7881}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.StockD Eingangslager(m0 = 7) annotation(Placement(transformation(origin = {-41.9394,75.343}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.SaturatedStockD Zwischenlager(minLevel = 0) annotation(Placement(transformation(origin = {-38.0529,4.54389}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.SwitchedFlow switchedflow2(switchValue = 2, onValue = 4) annotation(Placement(transformation(origin = {-8.54579,4.5781}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Oven Maschine2(capacity = 4, cookingTime = 2) annotation(Placement(transformation(origin = {41.4225,4.48709}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.StockD Ausgangslager annotation(Placement(transformation(origin = {103.08,4.53375}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Oven Maschine1(capacity = 4) annotation(Placement(transformation(origin = {42.6167,75.7961}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Reservoirs.Conveyor Band12(nDelay = 4) annotation(Placement(transformation(origin = {98.0684,75.20180000000001}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Flows.SwitchedFlow switchedflow1(onValue = 4) annotation(Placement(transformation(origin = {11.2927,75.6913}, extent = {{-12,-12},{12,12}})));
  SystemDynamics.Converters.SwitchedConverter switchedconverter1(switchValue = 0, onValue = 1, offValue = 2) annotation(Placement(transformation(origin = {-21.0593,41.5081}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -90)));
  SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 2) annotation(Placement(transformation(origin = {-98.2238,49.3661}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-101.608,75.9191}, extent = {{-8.545680000000001,-8.545680000000001},{8.545680000000001,8.545680000000001}})));
  SystemDynamics.Flows.ConstantFlow Weg3 annotation(Placement(transformation(origin = {71.827,75.452}, extent = {{-10.9054,-10.9054},{10.9054,10.9054}})));
  SystemDynamics.Flows.ConstantFlow Weg4 annotation(Placement(transformation(origin = {-69.51949999999999,5.19257}, extent = {{-10.6107,-10.6107},{10.6107,10.6107}})));
  SystemDynamics.Flows.ConstantFlow Weg6 annotation(Placement(transformation(origin = {72.9753,4.25831}, extent = {{-10.8543,-10.8543},{10.8543,10.8543}})));
equation
  connect(Maschine2.outflow,Weg6.inflow) annotation(Line(points = {{53.4225,4.48709},{59.5419,4.48709},{62.121,4.48976},{62.121,4.25831}}));
  connect(Weg6.outflow,Ausgangslager.inflow) annotation(Line(points={{83.8296,
          4.25831},{91.2609,4.25831},{91.2609,4.53375},{91.08,4.53375}}));
  connect(Weg4.outflow,Zwischenlager.inflow) annotation(Line(points = {{-58.9088,5.19257},{-49.5506,5.19257},{-49.5506,4.54389},{-50.0529,4.54389}}));
  connect(Weg4.inflow,Band12.outflow) annotation(Line(points={{-80.1302,5.19257},
          {-96.5517,5.19257},{-96.5517,18.3818},{116.642,18.3818},{116.642,
          74.668},{110.068,74.668},{110.068,75.2018}}));
  connect(Maschine1.outflow,Weg3.inflow) annotation(Line(points={{54.6167,
          75.7961},{57.9514,75.7961},{60.9216,75.7961},{60.9216,75.452}}));
  connect(Weg3.outflow,Band12.inflow) annotation(Line(points = {{82.7324,75.452},{86.057,75.452},{86.057,75.20180000000001},{86.0684,75.20180000000001}}));
  connect(cloudsource1.outflow,Weg1.inflow) annotation(Line(points={{-93.0623,
          75.9191},{-84.2687,75.9191},{-84.2687,75.7881},{-84.6797,75.7881}}));
  connect(constantconverter1.out,Weg1.in1) annotation(Line(points = {{-86.2238,49.3661},{-86.2238,49.1808},{-72.5746,49.1808},{-72.5746,63.7881},{-72.6797,63.7881}}));
  connect(Zwischenlager.out1,switchedconverter1.in1) annotation(Line(points={{
          -38.0529,17.401},{-38.0529,41.5081},{-33.0593,41.5081}}));
  connect(switchedflow2.in1,switchedconverter1.out1) annotation(Line(points={{
          -8.54579,-7.4219},{-8.54579,-16.4812},{10.9874,-16.4812},{10.9874,
          41.5081},{-9.0593,41.5081}}));
  connect(switchedconverter1.out1,switchedflow1.in1) annotation(Line(points={{-9.0593,
          41.5081},{-9.0593,41.5081},{10.9874,41.5081},{10.9874,63.6913},{
          11.2927,63.6913}}));
  connect(switchedflow1.outflow,Maschine1.inflow) annotation(Line(points = {{23.2927,75.6913},{26.2478,75.6913},{26.2478,75.7961},{30.6167,75.7961}}));
  connect(Eingangslager.outflow,switchedflow1.inflow) annotation(Line(points={{
          -29.9394,75.343},{-21.0593,75.343},{-21.0593,75.6913},{-0.7073,
          75.6913}}));
  connect(switchedflow2.outflow,Maschine2.inflow) annotation(Line(points = {{3.45421,4.5781},{11.2927,4.5781},{11.2927,4.48709},{29.4225,4.48709}}));
  connect(switchedflow2.inflow,Zwischenlager.outflow) annotation(Line(points={{
          -20.5458,4.5781},{-25.6374,4.5781},{-25.6374,4.54389},{-26.0529,
          4.54389}}));
  connect(Weg1.outflow,Eingangslager.inflow) annotation(Line(points = {{-60.6797,75.7881},{-53.7164,75.7881},{-53.7164,75.343},{-53.9394,75.343}}));
  annotation(experiment(StartTime = 0.0, StopTime = 25.0, Tolerance = 1e-06), uses(
        Modelica(version="3.2")));
end Bediener3;

