within PraxisSimulationstechnik.Examples;
model Pendel2
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true) annotation(Placement(transformation(origin = {-12.4479,29.5749}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin = {-53.4736,29.5749}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 0.5) annotation(Placement(transformation(origin = {-12.1302,63.6095}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {1,0,0}, m = 1, I_11 = 1, I_22 = 1, I_33 = 1) annotation(Placement(transformation(origin = {31.4241,29.5823}, extent = {{-12,-12},{12,12}})));
equation
  connect(revolute1.frame_b,body1.frame_a) annotation(Line(points = {{-0.4479,29.5749},{20.0307,29.5749},{20.0307,29.5823},{19.4241,29.5823}}));
  connect(damper1.flange_a,revolute1.support) annotation(Line(points = {{-24.1302,63.6095},{-31.3609,63.6095},{-31.3609,49.4083},{-19.5266,49.4083},{-19.5266,41.5749},{-19.6479,41.5749}}));
  connect(damper1.flange_b,revolute1.axis) annotation(Line(points={{-0.1302,
          63.6095},{7.98817,63.6095},{7.98817,49.4083},{-12.1302,49.4083},{
          -12.1302,41.5749},{-12.4479,41.5749}}));
  connect(revolute1.frame_a,world.frame_b) annotation(Line(points={{-24.4479,
          29.5749},{-41.2229,29.5749},{-41.4736,29.5749}}));
  annotation(Diagram,   experiment(StartTime = 0.0, StopTime = 20, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end Pendel2;

