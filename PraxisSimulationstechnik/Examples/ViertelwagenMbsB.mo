within PraxisSimulationstechnik.Examples;


model ViertelwagenMbsB
  Modelica.Blocks.Sources.Sine sine1(amplitude = 0.05, freqHz = 100 / (2 * Modelica.Constants.pi), phase = Modelica.Constants.pi / 2) annotation(Placement(transformation(origin = {-79.8089,-24.7863}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {-42.5287,-25}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world(n = {0,0,-1}) annotation(Placement(transformation(origin = {5.12821,-59.2593}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true,
    n={0,0,1},
    boxWidth=0.2,
    boxHeight=0.2,
    boxColor={255,0,0})                                                          annotation(Placement(transformation(origin = {4.2735,-27.0655}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springdamperparallel1(c = 180000,
    s_unstretched=0.3,
    coilWidth=0.01,
    numberOfWindings=6,
    color={0,128,255},
    width=0.06)                                                                              annotation(Placement(transformation(origin = {4.5584,7.40741}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springdamperparallel2(c = 27000, d = 2000,
    s_unstretched=0.8,
    numberOfWindings=6,
    color={0,128,255},
    width=0.06,
    coilWidth=0.01)                                                                                   annotation(Placement(transformation(origin = {4.2735,45.2991}, extent = {{-12,12},{12,-12}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {0,0,0}, m = 30, I_11 = 1, I_22 = 1, I_33 = 1,
    r_0(fixed=true, start={0,0,0.23}),
    sphereDiameter=0.2,
    sphereColor={0,128,255},
    cylinderDiameter=0)                                                                               annotation(Placement(transformation(origin = {-30.1994,26.7806}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Modelica.Mechanics.MultiBody.Parts.Body body2(                m = 1200, I_11 = 1, I_22 = 1, I_33 = 1,
    r_CM={0,0,0},
    r_0(fixed=true, start={0,0,0.597}),
    sphereDiameter=0.2,
    sphereColor={0,128,255},
    cylinderDiameter=0)                                                                                 annotation(Placement(transformation(origin = {-29.3447,70.6553}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
equation
  connect(sine1.y,position1.s_ref) annotation(Line(points = {{-66.6089,-24.7863},{-58.046,-24.7863},{-58.046,-25},{-56.9287,-25}}));
  connect(position1.flange,prismatic1.axis) annotation(Line(points={{-30.5287,
          -25},{-19.5402,-25},{-19.5402,-17.5287},{-2.9265,-17.5287},{-2.9265,
          -17.4655}}));
  connect(position1.support,prismatic1.support) annotation(Line(points={{
          -42.5287,-37},{-2.87356,-37},{-2.87356,-31.8655},{-2.9265,-31.8655}}));
  connect(body2.frame_a,springdamperparallel2.frame_a) annotation(Line(points={{
          -17.3447,70.6553},{4.8433,70.6553},{4.8433,57.2991},{4.2735,57.2991}}));
  connect(body1.frame_a,springdamperparallel1.frame_a) annotation(Line(points={{
          -18.1994,26.7806},{5.12821,26.7806},{5.12821,19.4074},{4.5584,19.4074}}));
  connect(springdamperparallel2.frame_b,springdamperparallel1.frame_a) annotation(Line(points={{4.2735,
          33.2991},{5.12821,33.2991},{5.12821,19.4074},{4.5584,19.4074}}));
  connect(springdamperparallel1.frame_b,prismatic1.frame_b) annotation(Line(points={{4.5584,
          -4.59259},{4.8433,-4.59259},{4.8433,-15.0655},{4.2735,-15.0655}}));
  connect(world.frame_b,prismatic1.frame_a) annotation(Line(points={{5.12821,
          -47.2593},{3.9886,-47.2593},{3.9886,-39.0655},{4.2735,-39.0655}}));
  annotation(experiment(
      StopTime=0.5,
      __Dymola_NumberOfIntervals=800,
      Tolerance=1e-06),                                                         uses(
        Modelica(version="3.2.1")));
end ViertelwagenMbsB;
