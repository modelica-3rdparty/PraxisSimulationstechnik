within PraxisSimulationstechnik.Examples;
model Pendel3
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-71.2251,
            54.1311},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.BodySphere bodysphere1(r = 0.2, direction={-0.95,0,0})
                                              annotation(Placement(transformation(origin={42.8161,
            54.1311},                                                                                                    extent = {{-12,-12},{12,12}})));
  PJlib.Kap17.BodyCylinder bodyCylinder
    annotation (Placement(transformation(extent={{-4,44.1311},{16,64.1311}})));
  PJlib.Kap17.RevoluteM revoluteM(b=0, theta0=-0.78539816339745) annotation (
      Placement(transformation(extent={{-42,44.1311},{-22,64.1311}})));
equation
  connect(bodyCylinder.frame_b, bodysphere1.frame_a1) annotation (Line(
      points={{16.2,54.1311},{30.8161,54.1311}},
      color={95,95,95},
      thickness=0.5));
  connect(world.frame_b, revoluteM.frame_a) annotation (Line(
      points={{-59.2251,54.1311},{-42,54.1311}},
      color={95,95,95},
      thickness=0.5));
  connect(revoluteM.frame_b, bodyCylinder.frame_a) annotation (Line(
      points={{-22,54.1311},{-4.2,54.1311}},
      color={95,95,95},
      thickness=0.5));
  annotation(                        experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end Pendel3;

