within PraxisSimulationstechnik.Examples;
model HeatTransfer2
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor oel3(C = 2000, T(
      start=360,
      fixed=true,
      displayUnit="K"))                                                                               annotation(Placement(transformation(origin = {28.3233,105.426}, extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor oel2(C = 2000, T(
      start=360,
      fixed=true,
      displayUnit="K"))                                                                               annotation(Placement(transformation(origin = {-54.3749,106.103}, extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor2(G = 1000) annotation(Placement(transformation(origin = {-13.3749,77.8892}, extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor8(G = 1000) annotation(Placement(transformation(origin={-95,
            77.8892},                                                                                                    extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor oel4(C = 2000, T(
      start=360,
      fixed=true,
      displayUnit="K"))                                                                               annotation(Placement(transformation(origin={116.5,
            102.5},                                                                                                    extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor4(G = 3000) annotation(Placement(transformation(origin = {-11.5,-75}, extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor5(G = 1000) annotation(Placement(transformation(origin={68,
            77.8892},                                                                                                    extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor7(G = 3000) annotation(Placement(transformation(origin = {70.5,-75.5}, extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor9(G = 3000) annotation(Placement(transformation(origin = {-92,-75.27200000000001}, extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor oel1(C = 2000, T(
      start=360,
      fixed=true,
      displayUnit="K"))                                                                               annotation(Placement(transformation(origin={-137.432,
            108.84},                                                                                                    extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = 5000) annotation(Placement(transformation(origin = {-54.8749,1.5662}, extent = {{-15,15},{15,-15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor6(G = 5000) annotation(Placement(transformation(origin={116.5,0},   extent = {{-15,15},{15,-15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor10(G = 5000) annotation(Placement(transformation(origin={-137.432,
            7},                                                                                                    extent = {{-15,15},{15,-15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor3(G = 5000) annotation(Placement(transformation(origin = {28,-1.5}, extent = {{-15,15},{15,-15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 360) annotation(Placement(transformation(origin={-170.471,
            77.8892},                                                                                                    extent = {{-15,-15},{15,15}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor wasser1(C = 4000, T(start = 290, fixed = true)) annotation(Placement(transformation(origin={-137.432,
            -101.5},                                                                                                    extent = {{15,-15},{-15,15}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor wasser2(C = 4000, T(start = 290, fixed = true)) annotation(Placement(transformation(origin = {-55.2959,-104.614}, extent = {{15,-15},{-15,15}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor wasser3(C = 4000, T(start = 290, fixed = true)) annotation(Placement(transformation(origin = {30.5,-102.5}, extent = {{15,-15},{-15,15}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor wasser4(C = 4000, T(start = 290, fixed = true)) annotation(Placement(transformation(origin = {116.5,-99}, extent = {{15,-15},{-15,15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant7(k = 400) annotation(Placement(transformation(origin = {-94.5,41.5}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant8(k = 2000) annotation(Placement(transformation(origin = {-93.5,-32}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant1(k = 400) annotation(Placement(transformation(origin = {-10.8749,38.5662}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant3(k = 2000) annotation(Placement(transformation(origin = {-12.3749,-34.4338}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant2(k = 400) annotation(Placement(transformation(origin = {71,37.5}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant4(k = 2000) annotation(Placement(transformation(origin = {71,-38}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant5(k = 400) annotation(Placement(transformation(origin = {158,38}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Blocks.Sources.Constant constant6(k = 2000) annotation(Placement(transformation(origin = {160.5,-37.5}, extent = {{-15,15},{15,-15}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection6 annotation(Placement(transformation(origin={116.5,
            -37.5},                                                                                                    extent = {{-15,-15},{15,15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection5 annotation(Placement(transformation(origin={116.5,
            38.4049},                                                                                                    extent = {{-15,-15},{15,15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(Placement(transformation(origin = {28.5,38}, extent = {{-15,-15},{15,15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection4 annotation(Placement(transformation(origin = {29,-39}, extent = {{-15,-15},{15,15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(Placement(transformation(origin = {-54.8749,38.0662}, extent = {{-15,-15},{15,15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(Placement(transformation(origin = {-55.3749,-34.4338}, extent = {{-15,-15},{15,15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection7 annotation(Placement(transformation(origin={-137.432,
            42.5},                                                                                                    extent = {{-15,-15},{15,15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection8 annotation(Placement(transformation(origin={-137.432,
            -29.864},                                                                                                    extent = {{-15,-15},{15,15}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature2(T = 290) annotation(Placement(transformation(origin = {196.071,-75.39109999999999}, extent = {{-15,15},{15,-15}}, rotation = -180)));
equation
  connect(fixedtemperature2.port,wasser4.port) annotation(Line(points={{181.071,
          -75.3911},{116.441,-75.3911},{116.5,-84}}));
  connect(constant8.y,convection8.Gc) annotation(Line(points={{-110,-32},{
          -115.5,-32},{-122.432,-32},{-122.432,-29.864}}));
  connect(convection8.fluid,wasser1.port) annotation(Line(points={{-137.432,
          -44.864},{-138,-44.864},{-138,-86.5},{-137.432,-86.5}}));
  connect(constant7.y,convection7.Gc) annotation(Line(points={{-111,41.5},{
          -122.432,41.5},{-122.432,42.5}}));
  connect(convection7.fluid,thermalconductor10.port_a) annotation(Line(points={{
          -137.432,27.5},{-137.432,25.5},{-137.432,22}}));
  connect(convection7.solid,oel1.port) annotation(Line(points={{-137.432,57.5},
          {-137.432,57.5},{-137.432,93.84}}));
  connect(constant3.y,convection2.Gc) annotation(Line(points = {{-28.8749,-34.4338},{-38.8749,-34.4338},{-40.3749,-34.4338},{-40.3749,-34.4338}}));
  connect(thermalconductor1.port_b,convection2.solid) annotation(Line(points = {{-54.8749,-13.4338},{-54.8749,-15.9338},{-55.3749,-19.4338},{-55.3749,-19.4338}}));
  connect(convection2.fluid,wasser2.port) annotation(Line(points = {{-55.3749,-49.4338},{-55.3749,-57.4338},{-55.2959,-89.614},{-55.2959,-89.614}}));
  connect(convection1.fluid,thermalconductor1.port_a) annotation(Line(points = {{-54.8749,23.0662},{-54.8749,23.0662},{-55.3749,16.5662},{-54.8749,16.5662}}));
  connect(oel2.port,convection1.solid) annotation(Line(points={{-54.3749,91.103},
          {-54.3749,59.8708},{-54.8749,59.8708},{-54.8749,53.0662}}));
  connect(constant1.y,convection1.Gc) annotation(Line(points = {{-27.3749,38.5662},{-37.3749,38.5662},{-39.8749,38.0662},{-39.8749,38.0662}}));
  connect(convection4.fluid,wasser3.port) annotation(Line(points = {{29,-54},{29,-54},{30,-87.5},{30.5,-87.5}}));
  connect(constant4.y,convection4.Gc) annotation(Line(points = {{54.5,-38},{46.5,-38},{44,-39},{44,-39}}));
  connect(convection4.solid,thermalconductor3.port_b) annotation(Line(points = {{29,-24},{29,-24},{30,-16.5},{28,-16.5}}));
  connect(constant2.y,convection3.Gc) annotation(Line(points = {{54.5,37.5},{46,37.5},{43.5,38},{43.5,38}}));
  connect(convection3.solid,oel3.port) annotation(Line(points={{28.5,53},{28.5,
          53},{28.5,90.426},{28.3233,90.426}}));
  connect(thermalconductor3.port_a,convection3.fluid) annotation(Line(points = {{28,13.5},{30.5,13.5},{30.5,23},{28.5,23}}));
  connect(constant5.y,convection5.Gc) annotation(Line(points={{141.5,38},{133.5,
          38},{131.5,38},{131.5,38.4049}}));
  connect(convection5.fluid,thermalconductor6.port_a) annotation(Line(points={{116.5,
          23.4049},{116.5,23.4049},{116.5,15}}));
  connect(oel4.port,convection5.solid) annotation(Line(points={{116.5,87.5},{
          116.5,53.4049}}));
  connect(constant6.y,convection6.Gc) annotation(Line(points={{144,-37.5},{
          131.5,-37.5}}));
  connect(convection6.fluid,wasser4.port) annotation(Line(points={{116.5,-52.5},
          {116.5,-52.5},{116.5,-84}}));
  connect(thermalconductor6.port_b,convection6.solid) annotation(Line(points={{116.5,
          -15},{117.5,-15},{117.5,-22.5},{116.5,-22.5}}));
  connect(thermalconductor7.port_b,wasser4.port) annotation(Line(points={{85.5,
          -75.5},{117.228,-75.5},{116.5,-84}}));
  connect(thermalconductor4.port_b,wasser3.port) annotation(Line(points = {{3.5,-75},{31,-75},{30.5,-87.5},{30.5,-87.5}}));
  connect(thermalconductor7.port_a,wasser3.port) annotation(Line(points = {{55.5,-75.5},{30.5,-75.5},{30.5,-87.5},{30.5,-87.5},{30.5,-87.5}}));
  connect(thermalconductor4.port_a,wasser2.port) annotation(Line(points = {{-26.5,-75},{-55.136,-75},{-55.2959,-89.614},{-55.2959,-89.614}}));
  connect(thermalconductor9.port_b,wasser2.port) annotation(Line(points = {{-77,-75.27200000000001},{-55.136,-75.27200000000001},{-55.2959,-89.614},{-55.2959,-89.614}}));
  connect(thermalconductor9.port_a,wasser1.port) annotation(Line(points={{-107,
          -75.272},{-137.364,-75.272},{-137.364,-86.5},{-137.432,-86.5}}));
  connect(fixedtemperature1.port,oel1.port) annotation(Line(points={{-155.471,
          77.8892},{-137.432,77.8892},{-137.432,93.84}}));
  connect(thermalconductor8.port_a,oel1.port) annotation(Line(points={{-110,
          77.8892},{-137.432,77.8892},{-137.432,93.84}}));
  connect(thermalconductor5.port_b,oel4.port) annotation(Line(points={{83,
          77.8892},{116.5,77.8892},{116.5,87.5}}));
  connect(thermalconductor5.port_a,oel3.port) annotation(Line(points={{53,
          77.8892},{28.5,77.8892},{28.5,90.426},{28.3233,90.426}}));
  connect(oel3.port,thermalconductor2.port_b) annotation(Line(points={{28.3233,
          90.426},{28.3233,77.1762},{1.6251,77.1762},{1.6251,77.8892}}));
  connect(oel2.port,thermalconductor2.port_a) annotation(Line(points={{-54.3749,
          91.103},{-54.3749,77.8892},{-28.3749,77.8892}}));
  connect(thermalconductor10.port_b, convection8.solid) annotation (Line(
      points={{-137.432,-8},{-137.432,-14.864}},
      color={191,0,0}));
  connect(thermalconductor8.port_b, convection1.solid) annotation (Line(
      points={{-80,77.8892},{-68,77.8892},{-68,78},{-54,78},{-54.3749,59.8708},
          {-54.8749,59.8708},{-54.8749,53.0662}},
      color={191,0,0}));
  annotation(                        experiment(StartTime = 0.0, StopTime = 30.0, Tolerance = 1e-06),
    uses(Modelica(version="3.2.1")));
end HeatTransfer2;

