within PraxisSimulationstechnik.Examples;
model ClosedSystem
  Thermo.SimpleVersion.Cylinder cylinder1(p(start=1000000, fixed=true))       annotation(Placement(transformation(origin = {-5.41311,77.4929}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow1(Q_flow=-250)   annotation(Placement(transformation(origin = {-41.8803,77.4929}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Cylinder cylinder2(sP(start=-0.08, fixed=true), p(start=
          1000000, fixed=true))                                                                              annotation(Placement(transformation(origin = {-5.45977,42.8161}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Cylinder cylinder3 annotation(Placement(transformation(origin = {-4.88506,8.62069}, extent = {{-12,-12},{12,12}})));
  Thermo.SimpleVersion.Cylinder cylinder4(p(start = 1000000.0, fixed = true)) annotation(Placement(transformation(origin = {-3.73563,-27.8736}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow2(Q_flow=600)   annotation(Placement(transformation(origin = {-40.5172,43.1034}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 1736) annotation(Placement(transformation(origin = {-43.3908,8.62069}, extent = {{-12,-12},{12,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedheatflow3(Q_flow = 0) annotation(Placement(transformation(origin = {-42.5287,-27.5862}, extent = {{-12,-12},{12,12}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(Placement(transformation(origin = {21.9373,77.4929}, extent = {{12,-12},{-12,12}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(Placement(transformation(origin={35.0575,
            42.5287},                                                                                                    extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Modelica.Mechanics.Translational.Sources.Speed speed1(exact = true) annotation(Placement(transformation(origin = {37.069,8.33333}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Modelica.Mechanics.Translational.Sources.Speed speed2(exact = true) annotation(Placement(transformation(origin = {37.931,-27.5862}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Modelica.Blocks.Sources.Constant const(k = 10000) annotation(Placement(transformation(origin = {74.1379,42.5287}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Modelica.Blocks.Sources.Constant constant1(k = 0.09) annotation(Placement(transformation(origin = {75.2874,-27.5862}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
  Modelica.Blocks.Sources.Constant constant2(k = 0.09) annotation(Placement(transformation(origin = {74.4253,8.33333}, extent={{-12,12},
            {12,-12}},                                                                                                    rotation = -180)));
equation
  connect(speed1.v_ref,constant2.y) annotation(Line(points={{51.469,8.33333},{
          51.469,8.33333},{61.2253,8.33333}}));
  connect(speed2.v_ref,constant1.y) annotation(Line(points={{52.331,-27.5862},{
          52.331,-27.5862},{62.0874,-27.5862}}));
  connect(force1.f,const.y) annotation(Line(points={{49.4575,42.5287},{49.4575,
          42.5287},{60.9379,42.5287}}));
  connect(cylinder4.piston,speed2.flange) annotation(Line(points={{8.26437,
          -27.8736},{25.5747,-27.8736},{25.5747,-27.5862},{25.931,-27.5862}}));
  connect(cylinder3.piston,speed1.flange) annotation(Line(points={{7.11494,
          8.62069},{25,8.62069},{25,8.33333},{25.069,8.33333}}));
  connect(cylinder2.piston,force1.flange) annotation(Line(points={{6.54023,
          42.8161},{23.5632,42.8161},{23.5632,42.5287},{23.0575,42.5287}}));
  connect(fixedheatflow3.port,cylinder4.in_th) annotation(Line(points={{
          -30.5287,-27.5862},{-15.2299,-27.5862},{-15.2299,-27.8736},{-15.7356,
          -27.8736}}));
  connect(fixedtemperature1.port,cylinder3.in_th) annotation(Line(points={{
          -31.3908,8.62069},{-16.8851,8.62069}}));
  connect(fixedheatflow2.port,cylinder2.in_th) annotation(Line(points={{
          -28.5172,43.1034},{-17.5287,43.1034},{-17.5287,42.8161},{-17.4598,
          42.8161}}));
  connect(fixedheatflow1.port,cylinder1.in_th) annotation(Line(points={{
          -29.8803,77.4929},{-17.4131,77.4929}}));
  connect(cylinder1.piston,fixed1.flange) annotation(Line(points={{6.58689,
          77.4929},{21.9373,77.4929}}));
  annotation(experiment(StartTime = 0.0, StopTime = 9, Tolerance = 0.000001),
    uses(Modelica(version="3.2.1")));
end ClosedSystem;

