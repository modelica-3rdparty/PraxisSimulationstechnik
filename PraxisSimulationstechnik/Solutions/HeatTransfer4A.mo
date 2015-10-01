within PraxisSimulationstechnik.Solutions;
model HeatTransfer4A
  Thermo.DryAirDevices.Heater heater6 annotation(Placement(transformation(origin = {-20.1149,-22.4138}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.Heater heater5 annotation(Placement(transformation(origin = {-59.7701,-22.7011}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.FluidSink fluidsink2 annotation(Placement(transformation(origin = {93.3908,-22.4138}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.FluidSourcePH fluidsourceph2(h = 600000.0, m_flow = 0.01) annotation(Placement(transformation(origin = {-93.6782,-22.9885}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.Heater heater7 annotation(Placement(transformation(origin = {17.5287,-22.4138}, extent = {{-12,-12},{12,12}})));
  Thermo.DryAirDevices.Heater heater8 annotation(Placement(transformation(origin = {59.4828,-22.4138}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor2(G = 20) annotation(Placement(transformation(origin = {-20.4023,18.1034}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = 20) annotation(Placement(transformation(origin = {-59.7701,18.1034}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleWater2Devices.Heater heater4 annotation(Placement(transformation(origin = {58.9744,60.3989}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -180)));
  Thermo.SimpleWater2Devices.Heater heater3 annotation(Placement(transformation(origin = {17.9487,60.6838}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -180)));
  Thermo.SimpleWater2Devices.Heater heater2 annotation(Placement(transformation(origin = {-20.5128,60.3989}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -180)));
  Thermo.SimpleWater2Devices.Heater heater1 annotation(Placement(transformation(origin = {-59.8291,60.6838}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -180)));
  Thermo.SimpleWater2Devices.FluidSink fluidsink1 annotation(Placement(transformation(origin = {-93.5848,60.976}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Thermo.SimpleWater2Devices.FluidSourcePH fluidsourceph1(h = 100000.0) annotation(Placement(transformation(origin={91.3147,
            60.3964},                                                                                                    extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor4(G = 20) annotation(Placement(transformation(origin = {58.908,17.8161}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor3(G = 20) annotation(Placement(transformation(origin = {17.8161,17.5287}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Thermo.SimpleWater2Devices.StateMeasurement stateMeasurement annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={78,80})));
  Thermo.DryAirDevices.StateMeasurement stateMeasurement1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,-42})));
equation
  connect(heater8.outflow,fluidsink2.inflow) annotation(Line(points = {{71.4828,-22.4138},{86.7816,-22.4138},{86.7816,-22.4138},{87.3908,-22.4138}}));
  connect(heater7.outflow,heater8.inflow) annotation(Line(points = {{29.5287,-22.4138},{46.8391,-22.4138},{46.8391,-22.4138},{47.4828,-22.4138}}));
  connect(thermalconductor4.port_b,heater8.heat) annotation(Line(points={{58.908,
          5.8161},{58.908,5.8161},{58.908,-10.4138},{59.4828,-10.4138}}));
  connect(heater6.outflow,heater7.inflow) annotation(Line(points={{-8.1149,
          -22.4138},{5.74713,-22.4138},{5.74713,-22.4138},{5.5287,-22.4138}}));
  connect(thermalconductor3.port_b,heater7.heat) annotation(Line(points={{17.8161,
          5.5287},{17.8161,5.5287},{17.8161,-10.4138},{17.5287,-10.4138}}));
  connect(heater5.outflow,heater6.inflow) annotation(Line(points = {{-47.7701,-22.7011},{-32.1839,-22.7011},{-32.1839,-22.4138},{-32.1149,-22.4138}}));
  connect(fluidsourceph2.outflow,heater5.inflow) annotation(Line(points = {{-87.6782,-22.9885},{-72.1264,-22.9885},{-72.1264,-22.7011},{-71.7701,-22.7011}}));
  connect(thermalconductor1.port_b,heater5.heat) annotation(Line(points={{
          -59.7701,6.1034},{-59.7701,6.1034},{-59.7701,-10.7011}}));
  connect(thermalconductor2.port_b,heater6.heat) annotation(Line(points={{
          -20.4023,6.1034},{-20.1149,6.1034},{-20.1149,-10.4138},{-20.1149,
          -10.4138}}));
  connect(thermalconductor3.port_a,heater3.heat) annotation(Line(points={{17.8161,
          29.5287},{17.8161,29.5287},{17.8161,48.6838},{17.9487,48.6838}}));
  connect(thermalconductor4.port_a,heater4.heat) annotation(Line(points={{58.908,
          29.8161},{58.908,29.8161},{58.908,48.3989},{58.9744,48.3989}}));
  connect(thermalconductor2.port_a,heater2.heat) annotation(Line(points={{
          -20.4023,30.1034},{-20.4023,30.1034},{-20.4023,48.3989},{-20.5128,
          48.3989}}));
  connect(thermalconductor1.port_a,heater1.heat) annotation(Line(points={{
          -59.7701,30.1034},{-59.7701,30.1034},{-59.7701,48.6838},{-59.8291,
          48.6838}}));
  connect(fluidsink1.inflow,heater1.outflow) annotation(Line(points={{-87.5848,
          60.976},{-71.8391,60.976},{-71.8391,60.6838},{-71.8291,60.6838}}));
  connect(heater3.inflow,heater4.outflow) annotation(Line(points={{29.9487,
          60.6838},{47.1264,60.6838},{47.1264,60.3989},{46.9744,60.3989}}));
  connect(heater2.inflow,heater3.outflow) annotation(Line(points={{-8.5128,
          60.3989},{6.32184,60.3989},{6.32184,60.6838},{5.9487,60.6838}}));
  connect(heater1.inflow,heater2.outflow) annotation(Line(points={{-47.8291,
          60.6838},{-33.046,60.6838},{-33.046,60.3989},{-32.5128,60.3989}}));
  connect(heater4.inflow, fluidsourceph1.outflow) annotation (Line(
      points={{70.9744,60.3989},{78.4872,60.3989},{78.4872,60.3964},{85.3147,
          60.3964}}));
  connect(stateMeasurement.inflow, fluidsourceph1.outflow) annotation (Line(
      points={{78,70},{78,60},{78.4872,60.3989},{78.4872,60.3964},{85.3147,
          60.3964}}));
  connect(stateMeasurement1.inflow, heater5.inflow) annotation (Line(
      points={{-80,-32},{-80,-24},{-72.1264,-24},{-72.1264,-22.7011},{-71.7701,
          -22.7011}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end HeatTransfer4A;

