within PraxisSimulationstechnik.Examples;
model Zweiachsenroboter4
  Modelica.Blocks.Continuous.PID PID(k = 150, Ti = 5, Td = 0.4) annotation(Placement(transformation(origin={-15.6897,
            98.046},                                                                                                    extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(origin={-73.7356,
            97.7587},                                                                                                    extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(transformation(origin={-47.0115,
            58.9655},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.SetAngles setangles1(y = 0.5, r2 = 0.8) annotation(Placement(transformation(origin={-116.839,
            103.506},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Roboter2 roboter21(rc1 = 0.5, r2 = 0.8, rc2 = 0.1, m1 = 2.5, J1 = 0.15, m2 = 1.8, J2 = 0.05, theta2 = 0, b1 = 1, b2 = 1, theta1 = -Modelica.Constants.pi / 2) annotation(Placement(transformation(origin={74.3113,
            67.7274},                                                                                                    extent = {{-21.2587,-21.2587},{21.2587,21.2587}})));
  Modelica.Blocks.Continuous.PID pid1(k = 150, Ti = 5, Td = 0.4) annotation(Placement(transformation(origin={-14.9057,
            59.2529},                                                                                                    extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 500) annotation(Placement(transformation(origin={23.2552,
            97.3131},                                                                                                    extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = 500) annotation(Placement(transformation(origin={25.0575,
            58.3834},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.BodyBox bodybox1(d = 0.2, m = 2, w = 0.2, h = 0.2) annotation(Placement(transformation(origin={119.082,
            66.9709},                                                                                                    extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-90.1149,
            -13.7356},                                                                                                    extent = {{-12,-12},{12,12}})));
equation
  connect(limiter2.y,roboter21.u1) annotation(Line(points={{38.2575,58.3834},{
          51.371,58.3834},{51.371,59.2239},{52.2023,59.2239}}));
  connect(pid1.y,limiter2.u) annotation(Line(points={{-1.7057,59.2529},{9.5577,
          59.2529},{9.5577,58.3834},{10.6575,58.3834}}));
  connect(limiter1.y,roboter21.u2) annotation(Line(points={{36.4552,97.3131},{
          43.0805,97.3131},{43.0805,76.4064},{52.2023,76.4064},{52.2023,76.2309}}));
  connect(PID.y,limiter1.u) annotation(Line(points={{-2.4897,98.046},{8.1159,
          98.046},{8.1159,97.3131},{8.8552,97.3131}}));
  connect(feedback2.y,pid1.u) annotation(Line(points={{-36.2115,58.9655},{
          -28.3333,58.9655},{-28.3333,59.2529},{-29.3057,59.2529}}));
  connect(feedback2.u2,roboter21.y1) annotation(Line(points={{-47.0115,49.3655},
          {-47.0115,34.1067},{65.6175,34.1067},{65.6175,46.4687},{65.8078,
          46.4687}}));
  connect(roboter21.frame_b,bodybox1.frame_a) annotation(Line(points={{95.57,
          67.7274},{107.357,67.7274},{107.357,66.9709},{107.082,66.9709}}));
  connect(roboter21.y2,feedback1.u2) annotation(Line(points={{82.8148,46.4687},
          {82.8148,29.0805},{-73.4483,29.0805},{-73.4483,88.1587},{-73.7356,
          88.1587}}));
  connect(setangles1.theta1,feedback2.u1) annotation(Line(points={{-103.877,
          107.824},{-95.8621,107.824},{-95.8621,58.6782},{-56.6115,58.6782},{
          -56.6115,58.9655}}));
  connect(setangles1.theta2,feedback1.u1) annotation(Line(points={{-103.877,
          98.224},{-84.3678,98.224},{-84.3678,97.7587},{-83.3356,97.7587}}));
  connect(feedback1.y,PID.u) annotation(Line(points={{-62.9356,97.7587},{
          -30.9195,97.7587},{-30.9195,98.046},{-30.0897,98.046}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,-150},{
            150,150}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-150,-150},{150,
            150}})),
    uses(Modelica(version="3.2.1")));
end Zweiachsenroboter4;

