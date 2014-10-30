within PraxisSimulationstechnik.Solutions;
model HeatTransfer4B
  PJLoeslib.Kap18.HeatExchanger3 heatexchanger31(G = 20) annotation(Placement(transformation(origin = {-50.9972,37.037}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap18.HeatExchanger3 heatexchanger34(G = 20) annotation(Placement(transformation(origin = {58.6895,36.7521}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap18.HeatExchanger3 heatexchanger32(G = 20) annotation(Placement(transformation(origin = {-13.9601,37.037}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap18.HeatExchanger3 heatexchanger33(G = 20) annotation(Placement(transformation(origin = {22.2222,37.037}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.FluidSink fluidsink1 annotation(Placement(transformation(origin = {92.6221,42.8726}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.FluidSourcePH fluidsourceph1(h = 100000.0) annotation(Placement(transformation(origin = {-82.26,42.8677}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement5 annotation(Placement(transformation(origin = {79.023,66.3793}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement4 annotation(Placement(transformation(origin = {40.2299,65.2299}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement3 annotation(Placement(transformation(origin = {4.02299,64.9425}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement2 annotation(Placement(transformation(origin = {-32.7586,65.2299}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.SimpleWaterDevices.StateMeasurement statemeasurement1 annotation(Placement(transformation(origin = {-70.1149,65.8046}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement6 annotation(Placement(transformation(origin = {-68.9655,4.31034}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement7 annotation(Placement(transformation(origin = {-32.4713,5.74713}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement8 annotation(Placement(transformation(origin = {4.02299,6.32184}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement9 annotation(Placement(transformation(origin = {40.2299,7.18391}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.StateMeasurement statemeasurement10 annotation(Placement(transformation(origin = {78.1609,4.88506}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.DryAirDevices.FluidSourcePH fluidsourceph2(h = 600000.0, m_flow = 0.01) annotation(Placement(transformation(origin = {91.6666,23.5632}, extent = {{-12,12},{12,-12}}, rotation = -180)));
  Thermo.DryAirDevices.FluidSink fluidsink2 annotation(Placement(transformation(origin = {-83.9081,26.7241}, extent = {{-12,12},{12,-12}}, rotation = -180)));
equation
  connect(fluidsink2.inflow,heatexchanger31.airIn) annotation(Line(points = {{-77.9081,26.7241},{-69.2529,26.7241},{-69.2529,32.1839},{-62.9972,32.1839},{-62.9972,32.237}}));
  connect(heatexchanger34.airOut,fluidsourceph2.outflow) annotation(Line(points = {{70.6895,31.9521},{78.1609,31.9521},{78.1609,23.2759},{85.6666,23.5632},{85.6666,23.5632}}));
  connect(statemeasurement10.inflow,heatexchanger34.airOut) annotation(Line(points={{78.1609,
          16.8851},{78.1609,16.8851},{78.1609,31.8966},{70.6895,31.8966},{
          70.6895,31.9521}}));
  connect(statemeasurement9.inflow,heatexchanger33.airOut) annotation(Line(points={{40.2299,
          19.1839},{40.5172,19.1839},{40.5172,32.1839},{34.2222,32.1839},{
          34.2222,32.237}}));
  connect(statemeasurement8.inflow,heatexchanger32.airOut) annotation(Line(points={{4.02299,
          18.3218},{4.02299,18.3218},{4.02299,32.1839},{-1.9601,32.1839},{
          -1.9601,32.237}}));
  connect(statemeasurement7.inflow,heatexchanger31.airOut) annotation(Line(points={{
          -32.4713,17.7471},{-32.7586,17.7471},{-32.7586,32.1839},{-38.9972,
          32.1839},{-38.9972,32.237}}));
  connect(statemeasurement6.inflow,heatexchanger31.airIn) annotation(Line(points={{
          -68.9655,16.3103},{-69.2529,16.3103},{-69.2529,32.1839},{-62.9972,
          32.1839},{-62.9972,32.237}}));
  connect(statemeasurement1.inflow,fluidsourceph1.outflow) annotation(Line(points={{
          -70.1149,53.8046},{-70.1149,53.8046},{-70.1149,42.8161},{-76.26,
          42.8161},{-76.26,42.8677}}));
  connect(statemeasurement2.inflow,heatexchanger31.waterIn) annotation(Line(points={{
          -32.7586,53.2299},{-32.7586,53.2299},{-32.7586,43.1034},{-38.9972,
          43.1034},{-38.9972,43.037}}));
  connect(statemeasurement3.inflow,heatexchanger32.waterIn) annotation(Line(points={{4.02299,
          52.9425},{4.02299,52.9425},{4.02299,43.1034},{-1.9601,43.1034},{
          -1.9601,43.037}}));
  connect(statemeasurement4.inflow,heatexchanger33.waterIn) annotation(Line(points={{40.2299,
          53.2299},{40.5172,53.2299},{40.5172,43.1034},{34.2222,43.1034},{
          34.2222,43.037}}));
  connect(statemeasurement5.inflow,heatexchanger34.waterIn) annotation(Line(points={{79.023,
          54.3793},{79.3103,54.3793},{79.3103,42.8161},{70.6895,42.8161},{
          70.6895,42.7521}}));
  connect(heatexchanger33.airOut,heatexchanger34.airIn) annotation(Line(points = {{34.2222,32.237},{47.1264,32.237},{47.1264,31.9521},{46.6895,31.9521}}));
  connect(heatexchanger32.airOut,heatexchanger33.airIn) annotation(Line(points = {{-1.9601,32.237},{10.0575,32.237},{10.0575,32.237},{10.2222,32.237}}));
  connect(heatexchanger31.airOut,heatexchanger32.airIn) annotation(Line(points = {{-38.9972,32.237},{-25.5747,32.237},{-25.5747,32.237},{-25.9601,32.237}}));
  connect(heatexchanger33.waterIn,heatexchanger34.waterOut) annotation(Line(points = {{34.2222,43.037},{46.8391,43.037},{46.8391,42.7521},{46.6895,42.7521}}));
  connect(heatexchanger32.waterIn,heatexchanger33.waterOut) annotation(Line(points = {{-1.9601,43.037},{10.0575,43.037},{10.0575,43.037},{10.2222,43.037}}));
  connect(heatexchanger31.waterIn,heatexchanger32.waterOut) annotation(Line(points = {{-38.9972,43.037},{-25.2874,43.037},{-25.2874,43.037},{-25.9601,43.037}}));
  connect(heatexchanger34.waterIn,fluidsink1.inflow) annotation(Line(points = {{70.6895,42.7521},{85.9195,42.7521},{85.9195,42.8726},{86.6221,42.8726}}));
  connect(fluidsourceph1.outflow,heatexchanger31.waterOut) annotation(Line(points = {{-76.26,42.8677},{-62.6437,42.8677},{-62.6437,43.037},{-62.9972,43.037}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end HeatTransfer4B;

