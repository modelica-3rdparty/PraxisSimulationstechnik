within PraxisSimulationstechnik.Examples;
model Karosserie1F
  parameter Modelica.SIunits.Position sl = 0.68 "Abstand CM - linke Seite";
  parameter Modelica.SIunits.Position sr = 0.68 "Abstand CM - rechte Seite";
  parameter Modelica.SIunits.Position lv = 1.25 "Abstand CM - Vorderachse";
  parameter Modelica.SIunits.Position lh = 1.35 "Abstand CM - Hinterachse";
  PJlib.Kap17.Federbein3 federbein12(m = 30, cr = 180000, ca = 27000, d = 2000, x0 = -lh, y0 = sl, z0 = 0.282) annotation(Placement(transformation(origin = {-40.7408,13.1054}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world(n = {0,0,-1}) annotation(Placement(transformation(origin = {-29.4307,-73.7695}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Karosserie2 karosserie21(m = 1200, Jx = 480, Jy = 2100, sl = sl, sr = sr, lv = lv, lh = lh, z0 = 0.973) annotation(Placement(transformation(origin = {16.8091,31.9088}, extent = {{-28.2954,-28.2954},{28.2954,28.2954}})));
  PJlib.Kap17.TestStrasse teststrasse1(fl = 100 / (2 * Modelica.Constants.pi), fr = 100 / (2 * Modelica.Constants.pi), Al = 0.15, Ar = 0,          v = 10, sr = sr, sl = sl, lv = lv, lh = lh,
    phi(displayUnit="rad") = 0)                                                                                              annotation(Placement(transformation(origin = {-85.0575,-32.4713}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.Federbein3 federbein13(m = 30, cr = 180000, ca = 27000, d = 2000, x0 = lv, y0 = -sr, z0 = 0.282) annotation(Placement(transformation(origin = {71.51,50.1425}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  PJlib.Kap17.Federbein3 federbein14(m = 30, cr = 180000, ca = 27000, d = 2000, x0 = -lh, y0 = -sr, z0 = 0.282) annotation(Placement(transformation(origin = {72.6496,13.9601}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  PJlib.Kap17.Federbein3 federbein11(m = 30, cr = 180000, ca = 27000, d = 2000, x0 = lv, y0 = sl, z0 = 0.282) annotation(Placement(transformation(origin = {-40.4436,50.1399}, extent = {{-12,-12},{12,12}})));
equation
  connect(teststrasse1.y1,federbein11.u) annotation(Line(points={{-72.4575,
          -23.3089},{-66.092,-23.3089},{-66.092,50.2874},{-52.8036,50.2874},{
          -52.8036,50.1399}}));
  connect(federbein11.frame_b,karosserie21.fvl) annotation(Line(points={{
          -28.4436,50.1399},{-11.1111,50.1399},{-11.1111,50.3008},{-11.4863,
          50.3008}}));
  connect(teststrasse1.y4,federbein14.u) annotation(Line(points={{-72.4575,
          -41.1209},{91.6667,-41.1209},{91.6667,14.0805},{85.0096,14.0805},{
          85.0096,13.9601}}));
  connect(teststrasse1.y3,federbein13.u) annotation(Line(points={{-72.4575,
          -34.967},{96.5517,-34.967},{96.5517,50.2874},{83.87,50.2874},{83.87,
          50.1425}}));
  connect(teststrasse1.y2,federbein12.u) annotation(Line(points={{-72.4575,
          -29.2234},{-59.1954,-29.2234},{-59.1954,13.2184},{-53.1008,13.2184},{
          -53.1008,13.1054}}));
  connect(federbein14.frame_b,karosserie21.fhr) annotation(Line(points={{60.6496,
          13.9601},{45.584,13.9601},{45.584,13.5168},{45.1045,13.5168}}));
  connect(federbein13.frame_b,karosserie21.fvr) annotation(Line(points={{59.51,
          50.1425},{45.2991,50.1425},{45.2991,50.3008},{45.1045,50.3008}}));
  connect(federbein12.frame_b,karosserie21.fhl) annotation(Line(points={{
          -28.7408,13.1054},{-11.396,13.1054},{-11.396,13.5168},{-11.4863,
          13.5168}}));
  annotation(experiment(
      StopTime=0.6,
      Intervals=800,
      Tolerance=1e-08),                                                         uses(
        Modelica(version="3.2.1")));
end Karosserie1F;
