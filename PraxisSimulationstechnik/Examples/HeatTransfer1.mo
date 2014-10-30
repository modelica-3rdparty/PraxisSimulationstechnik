within PraxisSimulationstechnik.Examples;
model HeatTransfer1
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor1(C = 2000, T(start = 360, fixed = true)) annotation(Placement(transformation(origin = {-41,82.5}, extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(Placement(transformation(origin = {-41.2878,43.5}, extent={{-15,-15},
            {15,15}},                                                                                                    rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = 5000) annotation(Placement(transformation(origin = {-41.0755,3}, extent = {{-15,15},{15,-15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(Placement(transformation(origin = {-41.0755,-38.5}, extent={{-15,-15},
            {15,15}},                                                                                                    rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor2(C = 4000, T(start = 290, fixed = true)) annotation(Placement(transformation(origin = {-41.0755,-78.5}, extent={{-15,15},
            {15,-15}})));
  Modelica.Blocks.Math.Product product2 annotation(Placement(transformation(origin = {7.5,-38}, extent = {{-15,-15},{15,15}}, rotation = -180)));
  Modelica.Blocks.Math.Product product1 annotation(Placement(transformation(origin = {7,43.5}, extent = {{-15,-15},{15,15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(transformation(origin = {70.6511,80.92449999999999}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant2(k = 200) annotation(Placement(transformation(origin = {80.29859999999999,34.2122}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant3(k = 2000) annotation(Placement(transformation(origin = {70,-47.5}, extent = {{-15,15},{15,-15}}, rotation = -180)));
equation
  connect(constant1.y,product2.u2) annotation(Line(points={{54.1511,80.9245},{
          37.1758,80.9245},{37.1758,-28.8184},{25.5,-28.8184},{25.5,-29}}));
  connect(constant3.y,product2.u1) annotation(Line(points = {{53.5,-47.5},{27,-47.5},{25.5,-47},{25.5,-47}}));
  connect(constant2.y,product1.u1) annotation(Line(points = {{63.7986,34.2122},{26.5,34.2122},{25,34.5},{25,34.5}}));
  connect(product1.u2,constant1.y) annotation(Line(points = {{25,52.5},{37.3201,52.5},{37.3201,81},{54.1511,80.92449999999999},{54.1511,80.92449999999999}}));
  connect(product1.y,convection1.Gc) annotation(Line(points={{-9.5,43.5},{
          -26.2878,43.5},{-26.2878,43.5}}));
  connect(product2.y,convection2.Gc) annotation(Line(points={{-9,-38},{-24,-38},
          {-24,-38.5},{-26.0755,-38.5}}));
  connect(convection2.fluid,heatcapacitor2.port) annotation(Line(points={{
          -41.0755,-53.5},{-41.0755,-53.5},{-41.0755,-63.5},{-41.0755,-63.5}}));
  connect(thermalconductor1.port_b,convection2.solid) annotation(Line(points={{
          -41.0755,-12},{-41.0755,-12},{-41.0755,-23.5}}));
  connect(convection1.fluid,thermalconductor1.port_a) annotation(Line(points = {{-41.2878,28.5},{-41.1367,28.5},{-41.1367,18},{-41.0755,18}}));
  connect(heatcapacitor1.port,convection1.solid) annotation(Line(points = {{-41,67.5},{-41,58},{-41.2878,58},{-41.2878,58.5}}));
  annotation(experiment(StartTime = 0.0, StopTime = 20.0, Tolerance = 1e-06), uses(
        Modelica(version="3.2.1")));
end HeatTransfer1;

