within PraxisSimulationstechnik.Solutions;
model VerladebrueckeB
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin = {-57.152,28.9959}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(animation=false)
                                                           annotation(Placement(transformation(origin={-15.2716,
            28.9959},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Kraftstoss3d kraftstoss3d1(tA = 1.0, tE = 11) annotation(Placement(transformation(origin = {-27.5862,77.5862}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = {1,0,0}) annotation(Placement(transformation(origin={12,
            -34.2519},                                                                                                    extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -270)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce worldforce1 annotation(Placement(transformation(origin = {12.1535,57.3398}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  PJlib.Kap17.RevoluteM revoluteM(theta0(displayUnit="deg") = 1.221730476396, b
      =0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={12,6})));
  PJlib.Kap17.BodyBox bodyBox(
    m=100,
    w=0.2,
    h=0.2,
    d=0.2,
    direction={-0.1,0,0})
    annotation (Placement(transformation(extent={{56,18.9959},{36,38.9959}})));
  PJlib.Kap17.BodyBox bodyBox1(
    w=0.2,
    h=0.2,
    d=0.2,
    direction={-0.1,0,0},
    m=10) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={12,-65.0041})));
equation
  connect(kraftstoss3d1.y,worldforce1.force) annotation(Line(points = {{-15.5862,77.5862},{12.3563,77.5862},{12.3563,71.7398},{12.1535,71.7398}}));
  connect(world.frame_b,prismatic1.frame_a) annotation(Line(points={{-45.152,
          28.9959},{-27.0115,28.9959},{-27.2716,28.9959}}));
  connect(fixedtranslation1.frame_b, revoluteM.frame_b) annotation (Line(
      points={{12,-22.2519},{12,-4}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic1.frame_b, bodyBox.frame_a) annotation (Line(
      points={{-3.2716,28.9959},{36,28.9959}},
      color={95,95,95},
      thickness=0.5));
  connect(worldforce1.frame_b, bodyBox.frame_a) annotation (Line(
      points={{12.1535,45.3398},{12.1535,28.9959},{36,28.9959}},
      color={95,95,95},
      thickness=0.5));
  connect(revoluteM.frame_a, bodyBox.frame_a) annotation (Line(
      points={{12,16},{12,28.9959},{36,28.9959}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyBox1.frame_a, fixedtranslation1.frame_a) annotation (Line(
      points={{12,-55.0041},{12,-46.2519}},
      color={95,95,95},
      thickness=0.5));
  annotation(experiment(StartTime = 0.0, StopTime = 20.0, Tolerance = 0.000001),    uses(Modelica(version="3.2.1")));
end VerladebrueckeB;
