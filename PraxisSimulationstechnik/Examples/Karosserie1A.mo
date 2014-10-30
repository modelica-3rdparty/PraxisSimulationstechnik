within PraxisSimulationstechnik.Examples;
model Karosserie1A
  PJlib.Kap17.Karosserie1 karosserie1(m = 1200, Jx = 480, Jy = 2100, sl = 0.68, sr = 0.68, lv = 1.25, lh = 1.35) annotation(Placement(transformation(origin = {12.5577,32.1618}, extent = {{-28.2954,-28.2954},{28.2954,28.2954}})));
  PJlib.Kap17.Federbein1 federbein12(m = 30, cr = 180000, ca = 27000, d = 2000) annotation(Placement(transformation(origin = {-40.7408,13.1054}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Federbein1 federbein11(m = 30, cr = 180000, ca = 27000, d = 2000) annotation(Placement(transformation(origin = {-41.8804,50.4273}, extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(origin = {-86.3248,-20.5128}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world(n = {0,0,-1}) annotation(Placement(transformation(origin = {13.9601,-76.0684}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Federbein1 federbein13(m = 30, cr = 180000, ca = 27000, d = 2000) annotation(Placement(transformation(origin = {71.51,50.1425}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  PJlib.Kap17.Federbein1 federbein14(m = 30, cr = 180000, ca = 27000, d = 2000) annotation(Placement(transformation(origin = {72.6496,13.9601}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
equation
  connect(const.y,federbein12.u) annotation(Line(points = {{-73.1248,-20.5128},{-66.9516,-20.5128},{-66.9516,13.1054},{-53.1008,13.1054},{-53.1008,13.1054}}));
  connect(const.y,federbein11.u) annotation(Line(points = {{-73.1248,-20.5128},{-66.9516,-20.5128},{-66.9516,50.7123},{-54.2404,50.7123},{-54.2404,50.4273}}));
  connect(federbein14.u,const.y) annotation(Line(points={{85.0096,13.9601},{
          95.7265,13.9601},{95.7265,-20.5128},{-73.1248,-20.5128}}));
  connect(const.y,federbein13.u) annotation(Line(points={{-73.1248,-20.5128},{
          95.7265,-20.5128},{95.7265,50.1425},{83.87,50.1425}}));
  connect(federbein14.frame_b,karosserie1.fhr) annotation(Line(points={{60.6496,
          13.9601},{41.0256,13.9601},{41.0256,13.7698},{40.8531,13.7698}}));
  connect(federbein13.frame_b,karosserie1.fvr) annotation(Line(points={{59.51,
          50.1425},{41.5954,50.1425},{41.5954,50.5538},{40.8531,50.5538}}));
  connect(federbein11.frame_b,karosserie1.fvl) annotation(Line(points={{
          -29.8804,50.4273},{-15.0997,50.4273},{-15.0997,50.5538},{-15.7377,
          50.5538}}));
  connect(federbein12.frame_b,karosserie1.fhl) annotation(Line(points={{
          -28.7408,13.1054},{-15.3846,13.1054},{-15.3846,13.7698},{-15.7377,
          13.7698}}));
  annotation (
    uses(Modelica(version="3.2.1")),
    experiment(Intervals=800, Tolerance=1e-06));
end Karosserie1A;
