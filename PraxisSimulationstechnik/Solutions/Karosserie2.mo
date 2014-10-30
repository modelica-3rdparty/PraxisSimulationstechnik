within PraxisSimulationstechnik.Solutions;
model Karosserie2
  parameter Modelica.SIunits.Position sl = 0.68 "Abstand CM - linke Seite";
  parameter Modelica.SIunits.Position sr = 0.68 "Abstand CM - rechte Seite";
  parameter Modelica.SIunits.Position lv = 1.25 "Abstand CM - Vorderachse";
  parameter Modelica.SIunits.Position lh = 1.35 "Abstand CM - Hinterachse";
  PJlib.Kap17.Karosserie2 karosserie21(m = 1200, Jx = 480, Jy = 2100, sl = sl, sr = sr, lv = lv, lh = lh, z0 = 0.973) annotation(Placement(transformation(origin = {16.8091,31.9088}, extent = {{-28.2954,-28.2954},{28.2954,28.2954}})));
  PJlib.Kap17.TestStrasse teststrasse1(fl = 100 / (2 * Modelica.Constants.pi), fr = 100 / (2 * Modelica.Constants.pi), Al = 0.15, Ar = 0,          v = 10, sr = sr, sl = sl, lv = lv, lh = lh,
    phi=0)                                                                                                     annotation(Placement(transformation(origin = {-85.0575,-32.4713}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world(n = {0,0,-1}) annotation(Placement(transformation(origin = {-30.2928,-74.0569}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Federbein4 federbein41(m = 30, cr = 180000, ca = 27000, d = 2000, z0 = 0.282, x0 = lv, y0 = sl) annotation(Placement(transformation(origin = {-41.5954,49.8575}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Federbein4 federbein42(m = 30, cr = 180000, ca = 27000, d = 2000, z0 = 0.282, x0 = -lh, y0 = sl) annotation(Placement(transformation(origin = {-41.0256,13.9601}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Federbein4 federbein43(m = 30, cr = 180000, ca = 27000, d = 2000, z0 = 0.282, x0 = -lh, y0 = -sr) annotation(Placement(transformation(origin = {70.9402,13.9601}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  PJLoeslib.Kap17.Federbein4 federbein44(m = 30, cr = 180000, ca = 27000, d = 2000, z0 = 0.282, x0 = lv, y0 = -sr) annotation(Placement(transformation(origin = {71.51,50.4274}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
equation
  connect(federbein44.u,teststrasse1.y3) annotation(Line(points={{83.87,50.4274},
          {95.4416,50.4274},{95.4416,-35.3276},{-72.4575,-35.3276},{-72.4575,
          -34.967}}));
  connect(karosserie21.fvr,federbein44.frame_b) annotation(Line(points={{45.1045,
          50.3008},{59.5442,50.3008},{59.5442,50.4274},{59.51,50.4274}}));
  connect(teststrasse1.y4,federbein43.u) annotation(Line(points={{-72.4575,
          -41.1209},{89.7436,-41.1209},{89.7436,14.245},{83.3002,14.245},{
          83.3002,13.9601}}));
  connect(federbein43.frame_b,karosserie21.fhr) annotation(Line(points={{58.9402,
          13.9601},{45.2991,13.9601},{45.2991,13.5168},{45.1045,13.5168}}));
  connect(teststrasse1.y2,federbein42.u) annotation(Line(points={{-72.4575,
          -29.2234},{-60.114,-29.2234},{-60.114,13.6752},{-53.3856,13.6752},{
          -53.3856,13.9601}}));
  connect(federbein42.frame_b,karosserie21.fhl) annotation(Line(points={{
          -29.0256,13.9601},{-11.396,13.9601},{-11.396,13.5168},{-11.4863,
          13.5168}}));
  connect(teststrasse1.y1,federbein41.u) annotation(Line(points={{-72.4575,
          -23.3089},{-66.3818,-23.3089},{-66.3818,49.8575},{-53.9554,49.8575}}));
  connect(federbein41.frame_b,karosserie21.fvl) annotation(Line(points={{
          -29.5954,49.8575},{-10.5413,49.8575},{-10.5413,50.3008},{-11.4863,
          50.3008}}));
  annotation(experiment(StartTime = 0.0, StopTime = 0.6, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Karosserie2;

