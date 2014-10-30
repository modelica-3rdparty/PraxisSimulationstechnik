within PraxisSimulationstechnik.Solutions;
model TestCurrentLimiter

  Modelica.Electrical.Analog.Sources.SineVoltage sinevoltage1(V = 1, freqHz = 1) annotation(Placement(transformation(origin = {-64.0805,20.977}, extent={{12,-12},
            {-12,12}},                                                                                                    rotation = 90)));
  PJLoeslib.Kap17.CurrentLimiter currentlimiter1(iMax = 0.8) annotation(Placement(transformation(origin = {-2.73357,18.9139}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-2.29885,-25.8621}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1) annotation(Placement(transformation(origin = {-30.1724,52.5862}, extent = {{-12,-12},{12,12}})));
equation
  connect(resistor1.n,currentlimiter1.p) annotation(Line(points = {{-18.1724,52.5862},{-2.87356,52.5862},{-2.87356,30.9139},{-2.73357,30.9139}}));
  connect(ground1.p,currentlimiter1.n) annotation(Line(points={{-2.29885,
          -13.8621},{-2.29885,6.89655},{-2.73357,6.89655},{-2.73357,6.9139}}));
  connect(sinevoltage1.n, currentlimiter1.n) annotation (Line(
      points={{-64.0805,8.977},{-64.0805,-6},{-2,-6},{-2.29885,6.89655},{
          -2.73357,6.89655},{-2.73357,6.9139}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sinevoltage1.p, resistor1.p) annotation (Line(
      points={{-64.0805,32.977},{-64.0805,52.5862},{-42.1724,52.5862}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation(experiment(StartTime = 0.0, StopTime = 2, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end TestCurrentLimiter;

