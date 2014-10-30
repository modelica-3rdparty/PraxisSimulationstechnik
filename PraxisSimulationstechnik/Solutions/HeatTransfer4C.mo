within PraxisSimulationstechnik.Solutions;
model HeatTransfer4C
  parameter Integer N = 3;
  PJLoeslib.Kap18.HeatExchanger heatexchanger2(G = 20, N = N) annotation(Placement(transformation(origin = {-12.931,37.6437}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap18.HeatExchanger heatexchanger3(G = 20, N = N) annotation(Placement(transformation(origin = {22.1264,37.3563}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap18.HeatExchanger heatexchanger4(G = 20, N = N) annotation(Placement(transformation(origin = {56.8966,37.069}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap18.HeatExchanger heatexchanger1(G = 20, N = N) annotation(Placement(transformation(origin = {-46.5517,37.6437}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.FluidSourcePH fluidsourceph1(h = 100000.0) annotation(Placement(transformation(origin = {-83.4094,42.8677}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.FluidSink fluidsink1 annotation(Placement(transformation(origin = {91.4727,42.8726}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.FluidSink fluidsink2 annotation(Placement(transformation(origin = {-83.9081,26.7241}, extent = {{-12,12},{12,-12}}, rotation = -180)));
  Thermo.DryAirDevices.FluidSourcePH fluidsourceph2(h = 600000.0, m_flow = 0.01) annotation(Placement(transformation(origin = {91.6666,23.5632}, extent = {{-12,12},{12,-12}}, rotation = -180)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin={-68.1149,
            69.8046},                                                                                                    extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin={-30.1149,
            69.8046},                                                                                                    extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement3 annotation(Placement(transformation(origin={5.8851,
            69.8046},                                                                                                    extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement4 annotation(Placement(transformation(origin={39.8851,
            69.8046},                                                                                                    extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement5 annotation(Placement(transformation(origin={77.8851,
            69.8046},                                                                                                    extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement6 annotation(Placement(transformation(origin={-66.9655,
            8.3103},                                                                                                    extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement7 annotation(Placement(transformation(origin={-28.9655,
            8.3103},                                                                                                    extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement8 annotation(Placement(transformation(origin={5.0345,
            8.3103},                                                                                                    extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement9 annotation(Placement(transformation(origin={41.0345,
            8.3103},                                                                                                    extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement10
                                                          annotation(Placement(transformation(origin={75.0345,
            6.3103},                                                                                                    extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(heatexchanger4.airIn,fluidsourceph2.outflow) annotation(Line(points={{68.8966,
          31.429},{75.2874,31.429},{75.2874,23.2759},{85.6666,23.2759},{85.6666,
          23.5632}}));
  connect(fluidsink2.inflow,heatexchanger1.airOut) annotation(Line(points={{
          -77.9081,26.7241},{-70.4023,26.7241},{-70.4023,32.7586},{-58.5517,
          32.7586},{-58.5517,32.0037}}));
  connect(fluidsink1.inflow,heatexchanger4.waterOut) annotation(Line(points = {{85.4727,42.8726},{68.9655,42.8726},{68.9655,42.709},{68.8966,42.709}}));
  connect(fluidsourceph1.outflow,heatexchanger1.waterIn) annotation(Line(points = {{-77.4094,42.8677},{-58.908,42.8677},{-58.908,43.2837},{-58.5517,43.2837}}));
  connect(heatexchanger3.airIn,heatexchanger4.airOut) annotation(Line(points={{34.1264,
          31.7163},{44.5402,31.7163},{44.5402,31.429},{44.8966,31.429}}));
  connect(heatexchanger2.airIn,heatexchanger3.airOut) annotation(Line(points={{-0.931,
          32.0037},{9.77011,32.0037},{9.77011,31.7163},{10.1264,31.7163}}));
  connect(heatexchanger1.airIn,heatexchanger2.airOut) annotation(Line(points={{
          -34.5517,32.0037},{-25.2874,32.0037},{-24.931,32.0037}}));
  connect(heatexchanger3.waterOut,heatexchanger4.waterIn) annotation(Line(points = {{34.1264,42.9963},{44.8276,42.9963},{44.8276,42.709},{44.8966,42.709}}));
  connect(heatexchanger2.waterOut,heatexchanger3.waterIn) annotation(Line(points={{-0.931,
          43.2837},{10.0575,43.2837},{10.0575,42.9963},{10.1264,42.9963}}));
  connect(heatexchanger1.waterOut,heatexchanger2.waterIn) annotation(Line(points={{
          -34.5517,43.2837},{-25.5747,43.2837},{-24.931,43.2837}}));
  connect(statemeasurement1.inflow, heatexchanger1.waterIn) annotation (Line(
      points={{-68.1149,57.8046},{-68,42},{-58.908,42.8677},{-58.908,43.2837},{
          -58.5517,43.2837}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement2.inflow, heatexchanger2.waterIn) annotation (Line(
      points={{-30.1149,57.8046},{-30,44},{-25.5747,43.2837},{-24.931,43.2837}},

      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement3.inflow, heatexchanger3.waterIn) annotation (Line(
      points={{5.8851,57.8046},{6,44},{10.0575,43.2837},{10.0575,42.9963},{
          10.1264,42.9963}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement4.inflow, heatexchanger4.waterIn) annotation (Line(
      points={{39.8851,57.8046},{40,44},{40,42},{44.8276,42.9963},{44.8276,
          42.709},{44.8966,42.709}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement5.inflow, heatexchanger4.waterOut) annotation (Line(
      points={{77.8851,57.8046},{78,42},{68.9655,42.8726},{68.9655,42.709},{
          68.8966,42.709}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement10.inflow, fluidsourceph2.outflow) annotation (Line(
      points={{75.0345,18.3103},{75.0345,24},{76,24},{75.2874,23.2759},{85.6666,
          23.2759},{85.6666,23.5632}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement9.inflow, heatexchanger4.airOut) annotation (Line(
      points={{41.0345,20.3103},{42,32},{44.5402,31.7163},{44.5402,31.429},{
          44.8966,31.429}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement8.inflow, heatexchanger3.airOut) annotation (Line(
      points={{5.0345,20.3103},{6,32},{9.77011,32.0037},{9.77011,31.7163},{
          10.1264,31.7163}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement7.inflow, heatexchanger2.airOut) annotation (Line(
      points={{-28.9655,20.3103},{-28,32},{-25.2874,32.0037},{-24.931,32.0037}},

      color={0,0,0},
      smooth=Smooth.None));
  connect(statemeasurement6.inflow, heatexchanger1.airOut) annotation (Line(
      points={{-66.9655,20.3103},{-68,34},{-68,32},{-58.5517,32.7586},{-58.5517,
          32.0037}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end HeatTransfer4C;

