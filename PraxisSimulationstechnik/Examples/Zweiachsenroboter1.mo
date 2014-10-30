within PraxisSimulationstechnik.Examples;
model Zweiachsenroboter1
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-84.6211,
            14.245},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Link link1(m = 2.5, J = 0.15) annotation(Placement(transformation(origin={-14.3678,
            14.245},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Link link2(m = 2.5, J = 0.15) annotation(Placement(transformation(origin={51.4368,
            14.245},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.BodyBox bodybox2(         m = 2,
    w=0.2,
    h=0.2,
    d=0.2)                                                       annotation(Placement(transformation(origin={83.046,
            14.245},                                                                                                    extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  PJlib.Kap17.RevoluteM revoluteM
    annotation (Placement(transformation(extent={{-58,4.245},{-38,24.245}})));
  PJlib.Kap17.RevoluteM revoluteM1(theta0=1.5707963267949)
    annotation (Placement(transformation(extent={{8,4.245},{28,24.245}})));
equation
  connect(bodybox2.frame_a,link2.frame_b) annotation(Line(points={{71.046,
          14.245},{71.046,14.245},{63.4368,14.245}}));
  connect(world.frame_b, revoluteM.frame_a) annotation (Line(
      points={{-72.6211,14.245},{-58,14.245}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteM.frame_b, link1.frame_a) annotation (Line(
      points={{-38,14.245},{-26.3678,14.245}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(link1.frame_b, revoluteM1.frame_a) annotation (Line(
      points={{-2.3678,14.245},{8,14.245}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteM1.frame_b, link2.frame_a) annotation (Line(
      points={{28,14.245},{39.4368,14.245}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end Zweiachsenroboter1;

