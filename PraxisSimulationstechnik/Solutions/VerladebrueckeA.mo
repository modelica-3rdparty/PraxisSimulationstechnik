within PraxisSimulationstechnik.Solutions;
model VerladebrueckeA
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin = {-57.152,28.9959}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1 annotation(Placement(transformation(origin={-15.2716,
            28.9959},                                                                                                    extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {0,0,0}, m = 100, I_11 = 1, I_22 = 1, I_33 = 1) annotation(Placement(transformation(origin={50.5402,
            28.9959},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJLoeslib.Kap17.Kraftstoss3d kraftstoss3d1(tA = 1.0, tE = 11) annotation(Placement(transformation(origin = {-27.5862,77.5862}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(start = Modelica.Constants.pi / 2, fixed = true)) annotation(Placement(transformation(origin = {11.7939,-1.48836}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.Body body2(r_CM = {0,0,0}, m = 10, I_11 = 0.0001, I_22 = 0.0001, I_33 = 0.0001) annotation(Placement(transformation(origin = {12.069,-69.2529}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = {1,0,0}) annotation(Placement(transformation(origin = {12.3637,-34.2519}, extent = {{12,-12},{-12,12}}, rotation = -270)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce worldforce1 annotation(Placement(transformation(origin = {12.1535,57.3398}, extent = {{-12,12},{12,-12}}, rotation = -90)));
equation
  connect(kraftstoss3d1.y,worldforce1.force) annotation(Line(points = {{-15.5862,77.5862},{12.3563,77.5862},{12.3563,71.7398},{12.1535,71.7398}}));
  connect(worldforce1.frame_b,body1.frame_a) annotation(Line(points={{12.1535,
          45.3398},{12,45.3398},{12,28.326},{38.5402,28.326},{38.5402,28.9959}}));
  connect(fixedtranslation1.frame_a,body2.frame_a) annotation(Line(points={{12.3637,
          -22.2519},{12.6437,-22.2519},{12.6437,-57.2529},{12.069,-57.2529}}));
  connect(revolute1.frame_b,fixedtranslation1.frame_b) annotation(Line(points={{11.7939,
          -13.4884},{12.069,-13.4884},{12.069,-46.2519},{12.3637,-46.2519}}));
  connect(world.frame_b,prismatic1.frame_a) annotation(Line(points={{-45.152,
          28.9959},{-27.0115,28.9959},{-27.2716,28.9959}}));
  connect(revolute1.frame_a, body1.frame_a) annotation (Line(
      points={{11.7939,10.5116},{11.7939,29.3723},{38.5402,29.3723},{38.5402,
          28.9959}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic1.frame_b, body1.frame_a) annotation (Line(
      points={{-3.2716,28.9959},{38.5402,28.9959}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  annotation(experiment(StartTime = 0.0, StopTime = 20.0, Tolerance = 0.000001),    uses(Modelica(version="3.2.1")));
end VerladebrueckeA;
