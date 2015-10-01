within PraxisSimulationstechnik.Solutions;
model ScaraB
  inner Modelica.Mechanics.MultiBody.World world(n = {0,0,-1}) annotation(Placement(transformation(origin = {46.2644,-77.0115}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.PD3Controller pd3controller1(P1 = 1000, D1 = 10, Umax1 = 100, P2 = 1000, D2 = 25, Umax2 = 75, P3 = 5000, D3 = 10, Umax3 = 90) annotation(Placement(transformation(origin = {-28.1609,-53.1609}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Constant3 constant31(k1 = 2, k2 = 2, k3 = 0.3) annotation(Placement(transformation(origin = {-70.115,-68.9655}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.RoboterScaraL roboterscara1(L1 = 0.4, L2 = 0.3, m1 = 8, m2 = 6, m3 = 2.5) annotation(Placement(transformation(origin = {-58.3776,22.7576}, extent = {{-14.52,-14.52},{14.52,14.52}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex31 annotation(Placement(transformation(origin = {-58.908,-21.8391}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Blocks.Routing.DeMultiplex3 demultiplex31 annotation(Placement(transformation(origin = {-58.9081,62.6437}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  PJlib.Kap17.BodyBox bodybox1(w = 0.1, h = 0.1, d = 0.1, m = 0.5,
    direction={-0.05,0,0})                                         annotation(Placement(transformation(origin = {-16.9762,22.4138}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
equation
  connect(roboterscara1.y2,multiplex31.u2[1]) annotation(Line(points = {{-58.3776,7.5116},{-58.3776,-6.6092},{-58.908,-6.6092},{-58.908,-7.4391}}));
  connect(roboterscara1.frame_b,bodybox1.frame_a) annotation(Line(points={{
          -43.9317,22.3814},{-31.0344,22.3814},{-31.0344,22.4138},{-28.9762,
          22.4138}}));
  connect(demultiplex31.y2[1],roboterscara1.u2) annotation(Line(points = {{-58.9081,49.4437},{-58.9081,47.1448},{-58.9081,38.0036},{-58.3776,38.0036}}));
  connect(roboterscara1.frame_b,bodybox1.frame_a) annotation(Line(points={{
          -43.9317,22.3814},{-31.0344,22.3814},{-31.0344,22.4138},{-28.9762,
          22.4138}}));
  connect(roboterscara1.y2,multiplex31.u2[1]) annotation(Line(points={{-58.3776,
          7.5116},{-58.3776,-6.6092},{-58.908,-6.6092},{-58.908,-7.4391}}));
  connect(multiplex31.y,pd3controller1.u1) annotation(Line(points = {{-58.908,-35.0391},{-58.908,-35.0391},{-58.908,-47.9885},{-40.6583,-47.9885},{-40.6583,-48.3609}}));
  connect(constant31.y,pd3controller1.u2) annotation(Line(points = {{-57.515,-68.9655},{-52.2989,-68.9655},{-52.2989,-58.046},{-40.7609,-58.046},{-40.7609,-57.9609}}));
  connect(pd3controller1.y,demultiplex31.u) annotation(Line(points = {{-15.5609,-53.1609},{12.3563,-53.1609},{12.3563,90.8046},{-59.1954,90.8046},{-59.1954,77.0437},{-58.9081,77.0437}}));
  connect(demultiplex31.y3[1], roboterscara1.u3) annotation (Line(
      points={{-50.5081,49.4437},{-50.5081,43.7219},{-49.6656,43.7219},{
          -49.6656,38.0036}},
      color={0,0,127}));
  connect(demultiplex31.y1[1], roboterscara1.u1) annotation (Line(
      points={{-67.3081,49.4437},{-67.3081,43.7219},{-67.0896,43.7219},{
          -67.0896,38.0036}},
      color={0,0,127}));
  connect(roboterscara1.y3, multiplex31.u3[1]) annotation (Line(
      points={{-49.6656,7.5116},{-49.6656,0.7558},{-50.508,0.7558},{-50.508,
          -7.4391}},
      color={0,0,127}));
  connect(roboterscara1.y1, multiplex31.u1[1]) annotation (Line(
      points={{-67.0896,7.5116},{-67.0896,0.7558},{-67.308,0.7558},{-67.308,
          -7.4391}},
      color={0,0,127}));
  annotation(experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end ScaraB;

