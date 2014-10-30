within PraxisSimulationstechnik.Solutions;
model HeatTransferFhf
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow(
    medium=Modelica.Thermal.FluidHeatFlow.Media.Water(),
    m=0.1,
    T0(displayUnit="K") = 360,
    constantVolumeFlow=0.0002)
    annotation (Placement(transformation(extent={{-154,124},{-134,144}})));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient(
    medium=Modelica.Thermal.FluidHeatFlow.Media.Water(),
    constantAmbientPressure=100000,
    constantAmbientTemperature(displayUnit="K") = 360)
    annotation (Placement(transformation(extent={{-170,124},{-190,144}})));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient1(
    medium=Modelica.Thermal.FluidHeatFlow.Media.Water(),
    constantAmbientPressure=0,
    constantAmbientTemperature(displayUnit="K") = 273.15)
    annotation (Placement(transformation(extent={{138,124},{158,144}})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorO1(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-124,158})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorO2(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-84,154})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorO7(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={124,156})));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient2(
    medium=Modelica.Thermal.FluidHeatFlow.Media.Water(),
    constantAmbientPressure=0,
    constantAmbientTemperature(displayUnit="K") = 273.15)
    annotation (Placement(transformation(extent={{-136,88},{-156,108}})));
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow1(
    medium=Modelica.Thermal.FluidHeatFlow.Media.Water(),
    m=0.1,
    T0(displayUnit="K") = 290,
    constantVolumeFlow=0.00035)
               annotation (Placement(transformation(extent={{162,90},{142,110}})));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient3(
    medium=Modelica.Thermal.FluidHeatFlow.Media.Water(),
    constantAmbientPressure=100000,
    constantAmbientTemperature(displayUnit="K") = 290)
    annotation (Placement(transformation(extent={{176,90},{196,110}})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorW1(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-122,78})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorW2(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-84,76})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorW7(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={126,76})));
  PJLoeslib.Kap14.WaermetauscherGliedFhf waermetauscherGliedFhf(
    mOel=0.2,
    mWasser=0.6,
    Toel0(displayUnit="K"),
    Twasser0(displayUnit="K"))
    annotation (Placement(transformation(extent={{-114,104},{-94,124}})));
  PJLoeslib.Kap14.WaermetauscherGliedFhf waermetauscherGliedFhf1(
    mOel=0.2,
    mWasser=0.6,
    Toel0(displayUnit="K"),
    Twasser0(displayUnit="K"))
    annotation (Placement(transformation(extent={{86,104},{106,124}})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorO3(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-42,154})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorW3(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-42,76})));
  PJLoeslib.Kap14.WaermetauscherGliedFhf waermetauscherGliedFhf2(
    mOel=0.2,
    mWasser=0.6,
    Toel0(displayUnit="K"),
    Twasser0(displayUnit="K"))
    annotation (Placement(transformation(extent={{-72,104},{-52,124}})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorO4(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,154})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorW4(medium=
        Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,76})));
  PJLoeslib.Kap14.WaermetauscherGliedFhf waermetauscherGliedFhf3(
    mOel=0.2,
    mWasser=0.6,
    Toel0(displayUnit="K"),
    Twasser0(displayUnit="K"))
    annotation (Placement(transformation(extent={{-30,104},{-10,124}})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorO5(
      medium=Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={38,154})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorW5(
      medium=Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={38,76})));
  PJLoeslib.Kap14.WaermetauscherGliedFhf waermetauscherGliedFhf4(
    mOel=0.2,
    mWasser=0.6,
    Toel0(displayUnit="K"),
    Twasser0(displayUnit="K"))
    annotation (Placement(transformation(extent={{8,104},{28,124}})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorO6(
      medium=Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={78,154})));
  Modelica.Thermal.FluidHeatFlow.Sensors.TemperatureSensor temperatureSensorW6(
      medium=Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={78,76})));
  PJLoeslib.Kap14.WaermetauscherGliedFhf waermetauscherGliedFhf5(
    mOel=0.2,
    mWasser=0.6,
    Toel0(displayUnit="K"),
    Twasser0(displayUnit="K"))
    annotation (Placement(transformation(extent={{48,104},{68,124}})));
equation
  connect(ambient.flowPort, volumeFlow.flowPort_a) annotation (Line(
      points={{-170,134},{-154,134}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorO7.flowPort, ambient1.flowPort) annotation (Line(
      points={{124,146},{124,134},{138,134}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(volumeFlow1.flowPort_a, ambient3.flowPort) annotation (Line(
      points={{162,100},{176,100}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(volumeFlow.flowPort_b, waermetauscherGliedFhf.flowport_a1)
    annotation (Line(
      points={{-134,134},{-124,134},{-124,118.97},{-114.042,118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf1.flowport_b1, ambient1.flowPort) annotation (
      Line(
      points={{106.06,118.975},{124,118.975},{124,134},{138,134}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorO1.flowPort, waermetauscherGliedFhf.flowport_a1)
    annotation (Line(
      points={{-124,148},{-124,118.97},{-114.042,118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf1.flowport_b2, temperatureSensorW7.flowPort)
    annotation (Line(
      points={{106.042,109.966},{126,109.966},{126,86}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(volumeFlow1.flowPort_b, temperatureSensorW7.flowPort) annotation (
      Line(
      points={{142,100},{126,100},{126,86}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf.flowport_a2, temperatureSensorW1.flowPort)
    annotation (Line(
      points={{-114.042,109.938},{-122,109.938},{-122,88}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(ambient2.flowPort, temperatureSensorW1.flowPort) annotation (Line(
      points={{-136,98},{-122,98},{-122,88}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf.flowport_b1, waermetauscherGliedFhf2.flowport_a1)
    annotation (Line(
      points={{-93.9402,118.975},{-82.9701,118.975},{-82.9701,118.97},{-72.0423,
          118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf2.flowport_b1, waermetauscherGliedFhf3.flowport_a1)
    annotation (Line(
      points={{-51.9402,118.975},{-40.9701,118.975},{-40.9701,118.97},{-30.0423,
          118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf3.flowport_b1, waermetauscherGliedFhf4.flowport_a1)
    annotation (Line(
      points={{-9.9402,118.975},{-0.9701,118.975},{-0.9701,118.97},{7.9577,
          118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf4.flowport_b1, waermetauscherGliedFhf5.flowport_a1)
    annotation (Line(
      points={{28.0598,118.975},{39.0299,118.975},{39.0299,118.97},{47.9577,
          118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf5.flowport_b1, waermetauscherGliedFhf1.flowport_a1)
    annotation (Line(
      points={{68.0598,118.975},{77.0299,118.975},{77.0299,118.97},{85.9577,
          118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf.flowport_b2, waermetauscherGliedFhf2.flowport_a2)
    annotation (Line(
      points={{-93.9577,109.966},{-82.9788,109.966},{-82.9788,109.938},{
          -72.0423,109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf2.flowport_b2, waermetauscherGliedFhf3.flowport_a2)
    annotation (Line(
      points={{-51.9577,109.966},{-40.9789,109.966},{-40.9789,109.938},{
          -30.0423,109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf3.flowport_b2, waermetauscherGliedFhf4.flowport_a2)
    annotation (Line(
      points={{-9.9577,109.966},{-0.97885,109.966},{-0.97885,109.938},{7.9577,
          109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf4.flowport_b2, waermetauscherGliedFhf5.flowport_a2)
    annotation (Line(
      points={{28.0423,109.966},{38.0211,109.966},{38.0211,109.938},{47.9577,
          109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(waermetauscherGliedFhf5.flowport_b2, waermetauscherGliedFhf1.flowport_a2)
    annotation (Line(
      points={{68.0423,109.966},{77.0212,109.966},{77.0212,109.938},{85.9577,
          109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorO2.flowPort, waermetauscherGliedFhf2.flowport_a1)
    annotation (Line(
      points={{-84,144},{-84,118},{-82.9701,118},{-82.9701,118.97},{-72.0423,
          118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorO3.flowPort, waermetauscherGliedFhf3.flowport_a1)
    annotation (Line(
      points={{-42,144},{-42,118},{-40.9701,118},{-40.9701,118.97},{-30.0423,
          118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorO4.flowPort, waermetauscherGliedFhf4.flowport_a1)
    annotation (Line(
      points={{0,144},{0,118.97},{7.9577,118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorO5.flowPort, waermetauscherGliedFhf5.flowport_a1)
    annotation (Line(
      points={{38,144},{38,118},{39.0299,118},{39.0299,118.97},{47.9577,118.97}},

      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorO6.flowPort, waermetauscherGliedFhf1.flowport_a1)
    annotation (Line(
      points={{78,144},{78,118.97},{85.9577,118.97}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorW2.flowPort, waermetauscherGliedFhf2.flowport_a2)
    annotation (Line(
      points={{-84,86},{-84,110},{-82.9788,110},{-82.9788,109.938},{-72.0423,
          109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorW3.flowPort, waermetauscherGliedFhf3.flowport_a2)
    annotation (Line(
      points={{-42,86},{-42,110},{-40.9789,110},{-40.9789,109.938},{-30.0423,
          109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorW4.flowPort, waermetauscherGliedFhf4.flowport_a2)
    annotation (Line(
      points={{0,86},{0,109.938},{7.9577,109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorW5.flowPort, waermetauscherGliedFhf5.flowport_a2)
    annotation (Line(
      points={{38,86},{38,109.938},{47.9577,109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(temperatureSensorW6.flowPort, waermetauscherGliedFhf1.flowport_a2)
    annotation (Line(
      points={{78,86},{78,109.938},{85.9577,109.938}},
      color={255,0,0},
      smooth=Smooth.None));
  annotation (
    uses(Modelica(version="3.2.1")),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})));
end HeatTransferFhf;
