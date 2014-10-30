within PraxisSimulationstechnik.Examples;
model EMotor1
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = 1 / 0.3) annotation(Placement(transformation(origin = {29.3447,16.8091}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.EMF emf1(k = 1) annotation(Placement(transformation(origin = {-8.83191,15.9544}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-59.2593,-20.5128}, extent = {{-12,-12},{12,12}})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantcurrent1(I = 1) annotation(Placement(transformation(origin={-58.9744,
            18.5242},                                                                                                    extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1) annotation(Placement(transformation(origin = {62.114,16.8034}, extent = {{-12,-12},{12,12}})));
equation
  connect(idealgear1.flange_b,inertia1.flange_a) annotation(Line(points = {{41.3447,16.8091},{49.2877,16.8091},{49.2877,16.8034},{50.114,16.8034}}));
  connect(emf1.flange,idealgear1.flange_a) annotation(Line(points = {{3.16809,15.9544},{17.094,15.9544},{17.094,16.8091},{17.3447,16.8091}}));
  connect(emf1.p,constantcurrent1.n) annotation(Line(points={{-8.83191,27.9544},
          {-8.83191,40.7407},{-58.4046,40.7407},{-58.4046,30.5242},{-58.9744,
          30.5242}}));
  connect(emf1.n,constantcurrent1.p) annotation(Line(points={{-8.83191,3.9544},
          {-8.83191,-4.2735},{-58.9744,-4.2735},{-58.9744,6.5242}}));
  connect(constantcurrent1.p,ground1.p) annotation(Line(points={{-58.9744,
          6.5242},{-58.6895,6.5242},{-58.6895,-8.5128},{-59.2593,-8.5128}}));
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end EMotor1;

