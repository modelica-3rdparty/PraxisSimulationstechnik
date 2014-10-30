within PraxisSimulationstechnik.Examples;
model Zweiachsenroboter3
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin = {-69.5402,-57.1839}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Roboter2 roboter21(rc1 = 0.5, r2 = 0.8, rc2 = 0.1, m1 = 2.5, J1 = 0.15, m2 = 1.8, J2 = 0.05, theta2 = 0, b1 = 1, b2 = 1, theta1 = -Modelica.Constants.pi / 2) annotation(Placement(transformation(origin = {57.1839,28.4483}, extent = {{-21.2587,-21.2587},{21.2587,21.2587}})));
  Modelica.Blocks.Continuous.PID PID(k = 150, Ti = 5, Td = 0.4) annotation(Placement(transformation(origin = {4.31035,58.046}, extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(origin = {-53.7356,57.7587}, extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Continuous.PID pid1(k = 150, Ti = 5, Td = 0.4) annotation(Placement(transformation(origin = {6.89655,19.2529}, extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(transformation(origin = {-27.0115,18.9655}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.SetAngles setangles1(y = 0.5, r2 = 0.8) annotation(Placement(transformation(origin = {-96.8391,63.5057}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.BodyBox bodybox1(d = 0.2, m = 2, w = 0.2, h = 0.2) annotation(Placement(transformation(origin={98.242,
            28.2665},                                                                                                    extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
equation
  connect(setangles1.theta1,feedback2.u1) annotation(Line(points={{-83.8775,
          67.8237},{-75.8621,67.8237},{-75.8621,18.6782},{-36.6115,18.6782},{
          -36.6115,18.9655}}));
  connect(setangles1.theta2,feedback1.u1) annotation(Line(points={{-83.8775,
          58.2237},{-64.3678,58.2237},{-64.3678,57.7587},{-63.3356,57.7587}}));
  connect(roboter21.y2,feedback1.u2) annotation(Line(points={{65.6874,7.1896},{
          65.6874,-10.9195},{-53.4483,-10.9195},{-53.4483,48.1587},{-53.7356,
          48.1587}}));
  connect(feedback2.u2,roboter21.y1) annotation(Line(points={{-27.0115,9.3655},
          {-27.0115,-5.17241},{48.8506,-5.17241},{48.8506,7.1896},{48.6804,
          7.1896}}));
  connect(PID.y,roboter21.u2) annotation(Line(points={{17.5103,58.046},{27.2989,
          58.046},{27.2989,37.069},{35.0749,37.069},{35.0749,36.9518}}));
  connect(pid1.y,roboter21.u1) annotation(Line(points={{20.0966,19.2529},{
          34.1954,19.2529},{34.1954,19.9448},{35.0749,19.9448}}));
  connect(feedback2.y,pid1.u) annotation(Line(points = {{-16.2115,18.9655},{-8.33332,18.9655},{-8.33332,19.2529},{-7.50345,19.2529}}));
  connect(feedback1.y,PID.u) annotation(Line(points={{-42.9356,57.7587},{
          -10.9195,57.7587},{-10.9195,58.046},{-10.0896,58.046}}));
  connect(roboter21.frame_b, bodybox1.frame_a) annotation (Line(
      points={{78.4426,28.4483},{82.2213,28.4483},{82.2213,28.2665},{86.242,
          28.2665}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  annotation(experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-06),
    uses(Modelica(version="3.2.1")));
end Zweiachsenroboter3;

