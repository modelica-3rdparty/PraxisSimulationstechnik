within PraxisSimulationstechnik.Examples;
model Viertelwagen1d
  Modelica.Blocks.Sources.Sine sine1(amplitude = 0.05, freqHz = 100 / (2 * Modelica.Constants.pi), phase = Modelica.Constants.pi / 2) annotation(Placement(transformation(origin = {-54.416,-77.7778}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {-7.97721,-50.4274}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = 90)));
  Modelica.Mechanics.Translational.Components.SpringDamper springdamper2(c = 180000, d = 0) annotation(Placement(transformation(origin = {-7.40741,-17.3789}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -270)));
  Modelica.Mechanics.Translational.Components.Mass mass1(m=30, s(start=0, fixed
        =true)) annotation (Placement(transformation(
        origin={-7.12251,15.3846},
        extent={{-12,-12},{12,12}},
        rotation=-270)));
  Modelica.Mechanics.Translational.Components.SpringDamper springdamper1(c = 27000, d = 2000) annotation(Placement(transformation(origin = {-7.12251,47.0085}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -270)));
  Modelica.Mechanics.Translational.Components.Mass mass2(m = 1200, s(start = 0, fixed = true)) annotation(Placement(transformation(origin = {-7.12251,78.9174}, extent={{-12,-12},
            {12,12}},                                                                                                    rotation = -270)));
equation
  connect(springdamper1.flange_b,mass2.flange_a) annotation(Line(points={{
          -7.12251,59.0085},{-7.12251,66.9174}}));
  connect(mass1.flange_b, springdamper1.flange_a)
    annotation (Line(points={{-7.12251,27.3846},{-7.12251,35.0085}}));
  connect(springdamper2.flange_b, mass1.flange_a) annotation (Line(points={{
          -7.40741,-5.3789},{-7.12251,-5.3789},{-7.12251,3.3846}}));
  connect(position1.flange,springdamper2.flange_a) annotation(Line(points={{
          -7.97721,-38.4274},{-7.40741,-38.4274},{-7.40741,-29.3789}}));
  connect(sine1.y,position1.s_ref) annotation(Line(points={{-41.216,-77.7778},{
          -7.69231,-77.7778},{-7.69231,-64.8274},{-7.97721,-64.8274}}));
  annotation(experiment(StartTime = 0.0, StopTime = 0.5, Tolerance = 0.000001), uses(
        Modelica(version="3.2.1")));
end Viertelwagen1d;

