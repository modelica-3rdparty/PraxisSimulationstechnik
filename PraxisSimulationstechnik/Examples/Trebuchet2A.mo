within PraxisSimulationstechnik.Examples;
model Trebuchet2A
  PJlib.Kap17.BodyCylinderWithPivot bodycylinderwithpivot1(L = 4, d = 0.3, rho = 700, Ld = 1.5) annotation(Placement(transformation(origin = {-33.3677,70.4956}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.RevoluteM revolutem2(theta0 = -(40 * Modelica.Constants.pi) / 180,
    radius=0.2,
    length=0.4,
    b=1)                                                                         annotation(Placement(transformation(origin = {10.7918,70.4957}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin = {-38.4959,-2.43889}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  PJlib.Kap17.RevoluteM revolutem1(theta0 = -(140 * Modelica.Constants.pi) / 180,
    radius=0.2,
    length=0.4,
    b=1)                                                                          annotation(Placement(transformation(origin = {-38.7808,33.1737}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  PJlib.Kap17.BodySphere bodysphere2(r = 0.4, rho = 3500,
    direction={0.9,0,0})                                                         annotation(Placement(transformation(origin = {-75.533,70.2108}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodycylinder1(r = {1,0,0}, diameter = 0.03, density = 700) annotation(Placement(transformation(origin = {44.9799,48.5583}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -270)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springdamperparallel1(c = 10000, d = 600,                        r_rel_a(start = {0,-0.001,0}, each fixed = false),
    s_unstretched=0.00,
    animation=true,
    color={155,0,0})                                                                                                     annotation(Placement(transformation(origin = {45.2991,16.5242}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  PJlib.Kap17.BodySphereWithInitPosition bodySphereWithInitPosition(
    r=0.1,
    rho=3500,
    z0=0,
    x0=-1.5912,
    y0=-2.2498,
    direction={-0.9,0,0})
                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={45.2991,-14})));
equation
  connect(bodycylinder1.frame_a,springdamperparallel1.frame_a) annotation(Line(points={{44.9799,
          36.5583},{45.2991,36.5583},{45.2991,28.5242}}));
  connect(revolutem2.frame_b,bodycylinder1.frame_b) annotation(Line(points={{22.7918,
          70.4957},{45.1149,70.4957},{45.1149,60.5583},{44.9799,60.5583}}));
  connect(bodysphere2.frame_a1,bodycylinderwithpivot1.frame_a1) annotation(Line(points={{-63.533,
          70.2108},{-45.0486,70.2108},{-45.0486,70.4956},{-45.3677,70.4956}}));
  connect(revolutem1.frame_a,world.frame_b) annotation(Line(points={{-38.7808,
          21.1737},{-38.4959,21.1737},{-38.4959,9.56111}}));
  connect(bodycylinderwithpivot1.frame_a2,revolutem1.frame_b) annotation(Line(points={{
          -39.3677,65.6956},{-39.3677,45.4244},{-38.7808,45.4244},{-38.7808,
          45.1737}}));
  connect(bodycylinderwithpivot1.frame_b,revolutem2.frame_a) annotation(Line(points={{
          -21.3677,70.4956},{-1.17399,70.4956},{-1.17399,70.4957},{-1.2082,
          70.4957}}));
  connect(springdamperparallel1.frame_b, bodySphereWithInitPosition.frame_a1)
    annotation (Line(
      points={{45.2991,4.5242},{45.2991,-4}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end Trebuchet2A;

