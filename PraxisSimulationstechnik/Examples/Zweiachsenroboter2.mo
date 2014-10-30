within PraxisSimulationstechnik.Examples;
model Zweiachsenroboter2
  PJlib.Kap17.Roboter roboter1(rc1 = 0.5, r2 = 0.8, rc2 = 0.1, m1 = 2.5, J1 = 0.15, m2 = 1.8, J2 = 0.05, theta2 = -Modelica.Constants.pi / 2, b1 = 1, b2 = 1) annotation(Placement(transformation(origin = {-1.7094,21.3675}, extent = {{-25.7231,-25.7231},{25.7231,25.7231}})));
  Modelica.Blocks.Sources.Constant constant1(k = 49.5405) annotation(Placement(transformation(origin = {-75.2874,-8.04598}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin = {-69.5402,-57.1839}, extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(origin = {-75.862,31.3219}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.BodyBox bodybox1(d = 0.2, m = 2, w = 0.2, h = 0.2) annotation(Placement(transformation(origin = {57.4148,21.37}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
equation
  connect(roboter1.frame_b,bodybox1.frame_a) annotation(Line(points={{24.0137,
          21.3675},{45.6897,21.3675},{45.6897,21.37},{45.4148,21.37}}));
  connect(constant1.y,roboter1.u1) annotation(Line(points={{-62.0874,-8.04598},
          {-50.5747,-8.04598},{-50.5747,10.9196},{-28.4614,10.9196},{-28.4614,
          11.0783}}));
  connect(const.y,roboter1.u2) annotation(Line(points={{-62.662,31.3219},{
          -29.3103,31.3219},{-29.3103,31.6567},{-28.4614,31.6567}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Zweiachsenroboter2;

