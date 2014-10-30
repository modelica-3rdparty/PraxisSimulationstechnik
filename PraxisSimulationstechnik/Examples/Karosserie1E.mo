within PraxisSimulationstechnik.Examples;
model Karosserie1E
  parameter Modelica.SIunits.Position sl = 0.68 "Abstand CM - linke Seite";
  parameter Modelica.SIunits.Position sr = 0.68 "Abstand CM - rechte Seite";
  parameter Modelica.SIunits.Position lv = 1.25 "Abstand CM - Vorderachse";
  parameter Modelica.SIunits.Position lh = 1.35 "Abstand CM - Hinterachse";
  PJlib.Kap17.Federbein3 federbein12(m = 30, cr = 180000, ca = 27000, d = 2000, x0 = -lh, y0 = sl, z0 = 0.3) annotation(Placement(transformation(origin = {-40.7408,13.1054}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Federbein3 federbein11(m = 30, cr = 180000, ca = 27000, d = 2000, x0 = lv, y0 = sl, z0 = 0.3) annotation(Placement(transformation(origin = {-41.8804,50.4273}, extent = {{-12,-12},{12,12}})));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(origin = {-86.0399,-20.5128}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world(n = {0,0,-1}) annotation(Placement(transformation(origin = {-29.4307,-73.7695}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Karosserie2 karosserie21(m = 1200, Jx = 480, Jy = 2100, sl = sl, sr = sr, lv = lv, lh = lh) annotation(Placement(transformation(origin = {16.8091,31.9088}, extent = {{-28.2954,-28.2954},{28.2954,28.2954}})));
  PJlib.Kap17.Federbein3 federbein13(m = 30, cr = 180000, ca = 27000, d = 2000, x0 = lv, y0 = -sr, z0 = 0.3) annotation(Placement(transformation(origin = {71.51,50.1425}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  PJlib.Kap17.Federbein3 federbein14(m = 30, cr = 180000, ca = 27000, d = 2000, x0 = -lh, y0 = -sr, z0 = 0.3) annotation(Placement(transformation(origin = {72.6496,13.9601}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
equation
  connect(federbein14.frame_b,karosserie21.fhr) annotation(Line(points={{60.6496,
          13.9601},{45.584,13.9601},{45.584,13.5168},{45.1045,13.5168}}));
  connect(federbein13.frame_b,karosserie21.fvr) annotation(Line(points={{59.51,
          50.1425},{45.2991,50.1425},{45.2991,50.3008},{45.1045,50.3008}}));
  connect(federbein12.frame_b,karosserie21.fhl) annotation(Line(points={{
          -28.7408,13.1054},{-11.396,13.1054},{-11.396,13.5168},{-11.4863,
          13.5168}}));
  connect(federbein11.frame_b,karosserie21.fvl) annotation(Line(points={{
          -29.8804,50.4273},{-11.1111,50.4273},{-11.1111,50.3008},{-11.4863,
          50.3008}}));
  connect(const.y,federbein13.u) annotation(Line(points={{-72.8399,-20.5128},{
          95.7265,-20.5128},{95.7265,50.1425},{83.87,50.1425}}));
  connect(federbein14.u,const.y) annotation(Line(points={{85.0096,13.9601},{
          95.7265,13.9601},{95.7265,-20.5128},{-72.8399,-20.5128}}));
  connect(const.y,federbein11.u) annotation(Line(points = {{-72.8399,-20.5128},{-66.9516,-20.5128},{-66.9516,50.7123},{-54.2404,50.7123},{-54.2404,50.4273}}));
  connect(const.y,federbein12.u) annotation(Line(points = {{-72.8399,-20.5128},{-66.9516,-20.5128},{-66.9516,13.1054},{-53.1008,13.1054},{-53.1008,13.1054}}));
  annotation(experiment(StartTime = 0.0, StopTime = 2, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Karosserie1E;

