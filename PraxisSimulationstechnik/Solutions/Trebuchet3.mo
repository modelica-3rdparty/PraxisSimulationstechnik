within PraxisSimulationstechnik.Solutions;
model Trebuchet3

  PJlib.Kap17.BodyCylinderWithPivot bodycylinderwithpivot1(L = 4, d = 0.3, rho = 700, Ld = 1.5) annotation(Placement(transformation(origin = {-33.3677,70.4956}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.RevoluteM revolutem2(theta0 = -40 * Modelica.Constants.pi / 180,
    radius=0.2,
    length=0.4)                                                                annotation(Placement(transformation(origin = {10.7918,70.4957}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Schlinge2 schlinge21(c = 10000, d = 600) annotation(Placement(transformation(origin = {44.8276,16.092}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Ausloeser ausloeser1(alphamin = 125, alphamax = 135) annotation(Placement(transformation(origin = {74.7126,48.5632}, extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Aufprall aufprall1 annotation(Placement(transformation(origin = {83.9081,-16.0919}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin = {-38.4959,-2.43889}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  PJlib.Kap17.RevoluteM revolutem1(theta0 = -140 * Modelica.Constants.pi / 180,
    radius=0.2,
    length=0.4)                                                                 annotation(Placement(transformation(origin = {-38.7808,33.1737}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodycylinder1(r = {1,0,0}, diameter = 0.03, density = 700) annotation(Placement(transformation(origin = {44.9799,48.5583}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -270)));
  PJlib.Kap17.BodySphere bodysphere2(r = 0.4, rho = 3500, direction = {0.9,0,0}) annotation(Placement(transformation(origin = {-74.6709,70.2108}, extent = {{-12,12},{12,-12}}, rotation = -180)));
  PJLoeslib.Kap17.BodySphereWithSensor bodyspherewithsensor1(r = 0.1, rho = 3500,
    x0=-1.5912,
    y0=-2.2498,
    z0=0,
    direction={0.9,0,0})                                                                                 annotation(Placement(transformation(origin = {45.115,-19.5403}, extent = {{-12,-12},{12,12}}, rotation = -90)));
equation
  connect(schlinge21.frame_b,bodyspherewithsensor1.frame_a1) annotation(Line(points = {{44.8276,4.092},{44.8276,-8.04598},{45.115,-8.04598},{45.115,-7.5403}}));
  connect(aufprall1.u,bodyspherewithsensor1.y) annotation(Line(points={{71.9081,
          -16.0919},{58.046,-16.0919},{57.115,-15.9403}}));
  connect(bodysphere2.frame_a1,bodycylinderwithpivot1.frame_a1) annotation(Line(points = {{-62.6709,70.2108},{-45.0486,70.2108},{-45.0486,70.4956},{-45.3677,70.4956}}));
  connect(ausloeser1.y,schlinge21.u) annotation(Line(points={{87.6014,48.9735},
          {93.1034,48.9735},{93.1034,16.092},{56.8276,16.092}}));
  connect(ausloeser1.frame_b,revolutem2.frame_b) annotation(Line(points={{74.7126,
          60.5632},{74.7126,70.4023},{22.7918,70.4023},{22.7918,70.4957}}));
  connect(ausloeser1.frame_a,bodycylinder1.frame_a) annotation(Line(points={{74.7126,
          36.5632},{74.7126,32.4713},{44.8276,32.4713},{44.8276,36.5583},{
          44.9799,36.5583}}));
  connect(bodycylinder1.frame_a,schlinge21.frame_a) annotation(Line(points={{44.9799,
          36.5583},{44.8276,36.5583},{44.8276,28.092}}));
  connect(revolutem2.frame_b,bodycylinder1.frame_b) annotation(Line(points={{22.7918,
          70.4957},{45.1149,70.4957},{45.1149,60.5583},{44.9799,60.5583}}));
  connect(revolutem1.frame_a,world.frame_b) annotation(Line(points={{-38.7808,
          21.1737},{-38.4959,21.1737},{-38.4959,9.56111}}));
  connect(bodycylinderwithpivot1.frame_a2,revolutem1.frame_b) annotation(Line(points={{
          -39.3677,65.6956},{-39.3677,45.4244},{-38.7808,45.4244},{-38.7808,
          45.1737}}));
  connect(bodycylinderwithpivot1.frame_b,revolutem2.frame_a) annotation(Line(points={{
          -21.3677,70.4956},{-1.17399,70.4956},{-1.17399,70.4957},{-1.2082,
          70.4957}}));
  annotation(experiment(StartTime = 0.0, StopTime = 6, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Trebuchet3;

