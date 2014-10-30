within PraxisSimulationstechnik.Examples;
model Pendel1
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1 annotation(Placement(transformation(origin = {-30.1994,54.1311}, extent = {{-12,-12},{12,12}})));
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin = {-71.2251,54.1311}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {1,0,0}, m = 1, I_11 = 1, I_22 = 1, I_33 = 1) annotation(Placement(transformation(origin = {14.2475,54.1385}, extent = {{-12,-12},{12,12}})));
equation
  connect(revolute1.frame_b,body1.frame_a) annotation(Line(points={{-18.1994,
          54.1311},{2.2792,54.1311},{2.2792,54.1385},{2.2475,54.1385}}));
  connect(revolute1.frame_a,world.frame_b) annotation(Line(points = {{-42.1994,54.1311},{-58.9744,54.1311},{-58.9744,54.1311},{-59.2251,54.1311}}));
  annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end Pendel1;

