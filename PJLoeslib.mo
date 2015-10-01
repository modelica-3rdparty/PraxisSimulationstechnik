within ;
package PJLoeslib
  import Modelica.SIunits.*;
  package Kap14
    model WaermetauscherGlied
      parameter ThermalConductance Goel = 1000
        "Wärmewiderstand im Öltransport";
      parameter ThermalConductance Gwasser = 3000
        "Wärmewiderstand im Wassertransport";
      parameter Real koel = 400 "Wärmekonvektion Öl - Wand";
      parameter Real kwasser = 2000 "Wärmekonvektion Wasser - Wand";
      parameter ThermalConductance Gwand = 5000 "Wärmeleitung Wand";
      parameter Temperature Toel0 = 360 "Anfangstemperatur des Öls";
      parameter Temperature Twasser0 = 290 "Anfangstemperatur des Wassers";
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = Goel) annotation(Placement(transformation(origin = {2.5641,63.5328}, extent = {{-12,-12},{12,12}})));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor1(C = 2000, T(start = Toel0, fixed = true)) annotation(Placement(transformation(origin = {-31.0541,88.0342}, extent = {{-12,-12},{12,12}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatport_a1 annotation(Placement(transformation(origin = {-100.57,49.0028}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100.57,49.0028}, extent = {{-12,-12},{12,12}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b heatport_b1 annotation(Placement(transformation(origin = {99.14530000000001,48.433}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {99.14530000000001,48.433}, extent = {{-12,-12},{12,12}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatport_a2 annotation(Placement(transformation(origin = {-100.285,-41.8803}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100.285,-41.8803}, extent = {{-12,-12},{12,12}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b heatport_b2 annotation(Placement(transformation(origin = {99.71510000000001,-39.3162}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {99.71510000000001,-39.3162}, extent = {{-12,-12},{12,12}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor3(G = Gwasser) annotation(Placement(transformation(origin = {4.5584,-58.4046}, extent = {{-12,-12},{12,12}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor2(G = Gwand) annotation(Placement(transformation(origin = {-31.339,3.7037}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Sources.Constant constant1(k = koel) annotation(Placement(transformation(origin = {3.1339,31.9088}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(Placement(transformation(origin = {-31.339,31.9088}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      Modelica.Blocks.Sources.Constant constant2(k = kwasser) annotation(Placement(transformation(origin = {5.12821,-24.7863}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(Placement(transformation(origin = {-31.339,-24.7863}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor2(C = 4000, T(start = Twasser0, fixed = true)) annotation(Placement(transformation(origin = {-31.0541,-82.90600000000001}, extent = {{12,-12},{-12,12}}, rotation = -180)));
    equation
      connect(convection2.fluid,heatcapacitor2.port) annotation(Line(points = {{-31.339,-36.7863},{-31.339,-36.7863},{-31.0541,-70.90600000000001},{-31.0541,-70.90600000000001}}));
      connect(heatport_a2,heatcapacitor2.port) annotation(Line(points = {{-100.285,-41.8803},{-31.0541,-41.8803},{-31.0541,-70.90600000000001},{-31.0541,-70.90600000000001}}));
      connect(thermalconductor3.port_a,heatcapacitor2.port) annotation(Line(points = {{-7.4416,-58.4046},{-31.0541,-58.4046},{-31.0541,-70.90600000000001},{-31.0541,-70.90600000000001}}));
      connect(thermalconductor2.port_b,convection2.solid) annotation(Line(points = {{-31.339,-8.2963},{-31.0541,-8.2963},{-31.0541,-12.7863},{-31.339,-12.7863}}));
      connect(constant2.y,convection2.Gc) annotation(Line(points = {{-8.07179,-24.7863},{-18.8034,-24.7863},{-19.339,-24.7863},{-19.339,-24.7863}}));
      connect(heatcapacitor1.port,convection1.solid) annotation(Line(points = {{-31.0541,76.0342},{-31.0541,43.8746},{-31.339,43.8746},{-31.339,43.9088}}));
      connect(constant1.y,convection1.Gc) annotation(Line(points = {{-10.0661,31.9088},{-18.8034,31.9088},{-19.339,31.9088},{-19.339,31.9088}}));
      connect(convection1.fluid,thermalconductor2.port_a) annotation(Line(points={{-31.339,
              19.9088},{-31.339,19.9088},{-31.339,15.7037}}));
      connect(heatport_b2,thermalconductor3.port_b) annotation(Line(points = {{99.71510000000001,-39.3162},{76.6382,-39.3162},{76.6382,-58.4046},{16.5584,-58.4046}}));
      connect(heatport_b1,thermalconductor1.port_b) annotation(Line(points = {{99.14530000000001,48.433},{68.0912,48.433},{68.0912,63.5328},{14.5641,63.5328}}));
      connect(heatport_a1,heatcapacitor1.port) annotation(Line(points = {{-100.57,49.0028},{-31.0541,49.0028},{-31.0541,76.0342},{-31.0541,76.0342}}));
      connect(thermalconductor1.port_a,heatcapacitor1.port) annotation(Line(points = {{-9.4359,63.5328},{-31.0541,63.5328},{-31.0541,76.0342},{-31.0541,76.0342}}));
      annotation(Icon(graphics={  Rectangle(lineColor = {0,0,0}, fillColor = {255,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-100,70.0855},{-36.1823,25.9259}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,85,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-37.037,70.0855},{27.9202,25.9259}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{27.9202,70.0855},{100,25.9259}}),Rectangle(lineColor = {0,0,0}, fillColor = {0,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-100,-18.8034},{-35.8974,-63.2479}}),Rectangle(lineColor = {0,0,0}, fillColor = {0,170,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-35.8974,-18.8034},{26.4957,-63.2479}}),Rectangle(lineColor = {0,0,0}, fillColor = {0,0,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{26.4957,-18.8034},{100,-63.2479}}),Line(points = {{-56.9801,21.6524},{-56.9801,-11.1111}}, color = {255,0,0}, pattern = LinePattern.Solid, thickness = 5.25, smooth = Smooth.Bezier),Line(points = {{-5.41311,21.0826},{-5.41311,-10.8262}}, color = {255,0,0}, pattern = LinePattern.Solid, thickness = 5.25, smooth = Smooth.Bezier),Line(points = {{47.5783,20.5128},{47.5783,-11.396}}, color = {255,0,0}, pattern = LinePattern.Solid, thickness = 5.25, smooth = Smooth.Bezier)}));
    end WaermetauscherGlied;

    model WaermetauscherGliedFhf
      parameter Mass mOel = 1 "Masse Öl pro Element";
      parameter Mass mWasser = 2 "Masse Wasser pro Element";
      parameter Real koel = 400 "Wärmekonvektion Öl - Wand";
      parameter Real kwasser = 2000 "Wärmekonvektion Wasser - Wand";
      parameter ThermalConductance Gwand = 5000 "Wärmeleitung Wand";
      parameter Temperature Toel0 = 360 "Anfangstemperatur des Öls";
      parameter Temperature Twasser0 = 290 "Anfangstemperatur des Wassers";
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor2(G = Gwand) annotation(Placement(transformation(origin = {-31.339,3.7037}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Thermal.FluidHeatFlow.Components.HeatedPipe heatedpipe1(h_g = 0,                  m = mOel, T0 = Toel0, tapT = 0, V_flowLaminar = 0.1,                  V_flowNominal = 1,
        medium=Modelica.Thermal.FluidHeatFlow.Media.Water(),
        dpLaminar=0.1,
        dpNominal=1)                                                                                                     annotation(Placement(transformation(origin = {-31.5938,64.8801}, extent = {{-10,-10},{10,10}})));
      Modelica.Thermal.FluidHeatFlow.Components.HeatedPipe heatedpipe2(h_g = 0,                  m = mWasser, T0 = Twasser0, tapT = 0, V_flowLaminar = 0.1,                  V_flowNominal = 1,
        medium=Modelica.Thermal.FluidHeatFlow.Media.Water(),
        dpLaminar=0.1,
        dpNominal=1)                                                                                                     annotation(Placement(transformation(origin = {-31.3117,-59.2384}, extent = {{-10,10},{10,-10}})));
      Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowport_a1(medium=Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation(Placement(transformation(origin = {-99.57689999999999,45.4161}, extent = {{-10,-10},{10,10}}), iconTransformation(origin={-100.423,
                49.6953},                                                                                                    extent = {{-10,-10},{10,10}})));
      Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_a flowport_a2(medium=Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation(Placement(transformation(origin = {-100.423,-40.6206}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100.423,-40.6206}, extent = {{-10,-10},{10,10}})));
      Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowport_b1(medium=Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation(Placement(transformation(origin = {99.85899999999999,45.4161}, extent = {{-10,-10},{10,10}}), iconTransformation(origin={100.598,
                49.7518},                                                                                                    extent = {{-10,-10},{10,10}})));
      Modelica.Thermal.FluidHeatFlow.Interfaces.FlowPort_b flowport_b2(medium=Modelica.Thermal.FluidHeatFlow.Media.Water()) annotation(Placement(transformation(origin = {100.423,-40.3385}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100.423,-40.3385}, extent = {{-10,-10},{10,10}})));
      Modelica.Blocks.Sources.Constant constant2(k = kwasser) annotation(Placement(transformation(origin = {5.12821,-24.7863}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Sources.Constant constant1(k = koel) annotation(Placement(transformation(origin = {6.23686,32.1909}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(Placement(transformation(origin = {-31.339,31.9088}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(Placement(transformation(origin = {-31.339,-24.7863}, extent = {{-12,-12},{12,12}}, rotation = -90)));
    equation
      connect(thermalconductor2.port_b,convection2.solid) annotation(Line(points = {{-31.339,-8.2963},{-31.0541,-8.2963},{-31.0541,-12.7863},{-31.339,-12.7863}}));
      connect(convection2.fluid,heatedpipe2.heatPort) annotation(Line(points={{-31.339,
              -36.7863},{-31.339,-49.0832},{-31.3117,-49.0832},{-31.3117,
              -49.2384}}));
      connect(constant2.y,convection2.Gc) annotation(Line(points = {{-8.07179,-24.7863},{-18.8034,-24.7863},{-19.339,-24.7863},{-19.339,-24.7863}}));
      connect(convection1.fluid,thermalconductor2.port_a) annotation(Line(points={{-31.339,
              19.9088},{-31.339,19.9088},{-31.339,15.7037}}));
      connect(heatedpipe1.heatPort,convection1.solid) annotation(Line(points = {{-31.5938,54.8801},{-31.5938,54.8801},{-31.339,44.2877},{-31.339,43.9088}}));
      connect(constant1.y,convection1.Gc) annotation(Line(points={{-6.96314,32.1909},
              {-18.8034,32.1909},{-19.339,31.9088}}));
      connect(flowport_b2,heatedpipe2.flowPort_b) annotation(Line(points={{100.423,
              -40.3385},{40.6206,-40.3385},{40.6206,-59.5205},{-21.3117,
              -59.5205},{-21.3117,-59.2384}}));
      connect(flowport_a2,heatedpipe2.flowPort_a) annotation(Line(points={{-100.423,
              -40.6206},{-69.1114,-40.6206},{-69.1114,-59.2384},{-41.3117,-59.2384}}));
      connect(heatedpipe1.flowPort_b,flowport_b1) annotation(Line(points={{-21.5938,
              64.8801},{52.7504,64.8801},{52.7504,45.4161},{99.859,45.4161}}));
      connect(heatedpipe1.flowPort_a,flowport_a1) annotation(Line(points={{
              -41.5938,64.8801},{-68.8293,64.8801},{-68.8293,44.8519},{-99.5769,
              44.8519},{-99.5769,45.4161}}));
      annotation(Icon(graphics={  Rectangle(lineColor = {0,0,0}, fillColor = {255,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-100,70.0855},{-36.1823,25.9259}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,85,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-37.037,70.0855},{27.9202,25.9259}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{27.9202,70.0855},{100,25.9259}}),Rectangle(lineColor = {0,0,0}, fillColor = {0,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-100,-18.8034},{-35.8974,-63.2479}}),Rectangle(lineColor = {0,0,0}, fillColor = {0,170,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-35.8974,-18.8034},{26.4957,-63.2479}}),Rectangle(lineColor = {0,0,0}, fillColor = {0,0,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{26.4957,-18.8034},{100,-63.2479}}),Line(points = {{-56.9801,21.6524},{-56.9801,-11.1111}}, color = {255,0,0}, pattern = LinePattern.Solid, thickness = 5.25, smooth = Smooth.Bezier),Line(points = {{-5.41311,21.0826},{-5.41311,-10.8262}}, color = {255,0,0}, pattern = LinePattern.Solid, thickness = 5.25, smooth = Smooth.Bezier),Line(points = {{47.5783,20.5128},{47.5783,-11.396}}, color = {255,0,0}, pattern = LinePattern.Solid, thickness = 5.25, smooth = Smooth.Bezier)}));
    end WaermetauscherGliedFhf;
  end Kap14;

  package Kap17
    model Kraftstoss3d
      parameter Real tA = 0.0 "Startzeit";
      parameter Real tE = 1.0 "Endzeit";
      parameter Real[3] A = {1.0,0.0,0.0} "Amplitude";
      Modelica.Blocks.Interfaces.RealOutput y[3] annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Step step1(startTime = tA);
      Modelica.Blocks.Sources.Step step2(startTime = tE, height = -1);
    protected
      Real k;
    equation
      k = step1.y + step2.y;
      y = k * A;
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(lineColor=  {0,0,0},
                lineThickness=                                                                                                    0.25, extent=  {{-100,100},{100,-100}}),Line(thickness=  2.75, points=  {{-80,-80},{-60,-80},{-60,80},{60,80},{60,-80},{80,-80}})}));
    end Kraftstoss3d;

    model Servomotor
      parameter Resistance R = 1 "Resistance";
      parameter Inductance L = 1 "Inductance";
      parameter ElectricalTorqueConstant kT = 1 "Transformation coefficient";
      parameter Real i = 1 "Gear ratio";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {0,-99.71510000000001}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {0,-99.71510000000001}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {0,100}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {0,100}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.EMF emf(k = kT, useSupport = true) annotation(Placement(transformation(origin = {23.0769,2.2792}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = i) annotation(Placement(transformation(origin = {60.6838,2.2792}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R = R) annotation(Placement(transformation(origin = {-45.2991,57.265}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalvoltage1 annotation(Placement(transformation(origin = {-67.23650000000001,0.2849}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L = L) annotation(Placement(transformation(origin={-11.6809,
                57.265},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-66.9516,-50.4274}, extent = {{-12,-12},{12,12}})));
    equation
      connect(ground1.p,signalvoltage1.p) annotation(Line(points={{-66.9516,
              -38.4274},{-66.9516,-10.5413},{-67.2365,-10.5413},{-67.2365,
              -11.7151}}));
      connect(signalvoltage1.p,emf.n) annotation(Line(points={{-67.2365,
              -11.7151},{-66.9516,-11.7151},{-66.9516,-31.339},{23.0769,-31.339},
              {23.0769,-9.7208}}));
      connect(inductor1.n,emf.p) annotation(Line(points={{0.3191,57.265},{
              23.0769,57.265},{23.0769,14.2792}}));
      connect(signalvoltage1.n,resistor1.p) annotation(Line(points={{-67.2365,
              12.2849},{-67.2365,12.2849},{-67.2365,57.265},{-57.2991,57.265}}));
      connect(u,signalvoltage1.v) annotation(Line(points = {{-103,0},{-75.7835,0},{-75.7835,0.2849},{-75.6365,0.2849}}));
      connect(idealgear1.flange_b,flange_b) annotation(Line(points = {{72.68380000000001,2.2792},{82.0513,2.2792},{82.0513,87.1795},{0.569801,87.1795},{0.569801,100},{0,100}}));
      connect(emf.flange,idealgear1.flange_a) annotation(Line(points={{35.0769,
              2.2792},{49.5726,2.2792},{48.6838,2.2792}}));
      connect(emf.support,flange_a) annotation(Line(points = {{11.0769,2.2792},{-0.854701,2.2792},{-0.854701,-99.71510000000001},{0,-99.71510000000001}}));
      connect(resistor1.n, inductor1.p) annotation (Line(
          points={{-33.2991,57.265},{-23.6809,57.265}},
          color={0,0,255}));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(lineColor=  {100,100,100}, fillColor=  {100,100,100},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-10,-90},{10,90}}),Ellipse(extent=  {{-50,-50},{50,50}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {255,255,255}),Line(color=  {0,0,255}, points=  {{-95,0},{-53,0}})}));
    end Servomotor;

    model ServomotorVertical
      parameter Resistance R = 1 "Resistance";
      parameter Inductance L = 1 "Inductance";
      parameter ElectricalTorqueConstant kT = 1 "Transformation coefficient";
      parameter Real i = 1 "Gear ratio";
      parameter Inertia J = 1 "Motor inertia";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {0,-99.71510000000001}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {0,-99.71510000000001}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {0,100}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {0,100}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R = R) annotation(Placement(transformation(origin={-43.2991,
                57.265},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L = L) annotation(Placement(transformation(origin={-11.6809,
                57.265},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-66.9516,-50.4274}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.EMF emf(k = kT, useSupport = false) annotation(Placement(transformation(origin = {13.3903,1.7094}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalvoltage1 annotation(Placement(transformation(origin = {-67.23650000000001,0.2849}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = J) annotation(Placement(transformation(origin = {48.4331,1.9943}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.IdealGearR2T idealgearr2t1(ratio = i, useSupportR = false, useSupportT = true) annotation(Placement(transformation(origin = {81.7664,1.7094}, extent = {{-12,-12},{12,12}})));
    equation
      connect(idealgearr2t1.flangeT,flange_b) annotation(Line(points = {{93.7664,1.7094},{93.4473,1.7094},{93.4473,84.04559999999999},{0,84.04559999999999},{0,100},{0,100}}));
      connect(idealgearr2t1.supportT,flange_a) annotation(Line(points = {{93.7664,-10.2906},{93.4473,-10.2906},{93.4473,-76.92310000000001},{0.854701,-76.92310000000001},{0.854701,-99.71510000000001},{0,-99.71510000000001}}));
      connect(inertia1.flange_b,idealgearr2t1.flangeR) annotation(Line(points = {{60.4331,1.9943},{70.6553,1.9943},{70.6553,1.7094},{69.7664,1.7094}}));
      connect(emf.flange,inertia1.flange_a) annotation(Line(points = {{25.3903,1.7094},{36.4672,1.7094},{36.4672,1.9943},{36.4331,1.9943}}));
      connect(emf.n,signalvoltage1.p) annotation(Line(points={{13.3903,-10.2906},
              {13.3903,-29.9145},{-66.9516,-29.9145},{-66.9516,-11.7151},{
              -67.2365,-11.7151}}));
      connect(emf.p,inductor1.n) annotation(Line(points={{13.3903,13.7094},{
              13.3903,56.6952},{0.3191,56.6952},{0.3191,57.265}}));
      connect(ground1.p,signalvoltage1.p) annotation(Line(points={{-66.9516,
              -38.4274},{-66.9516,-10.5413},{-67.2365,-10.5413},{-67.2365,
              -11.7151}}));
      connect(signalvoltage1.n,resistor1.p) annotation(Line(points={{-67.2365,
              12.2849},{-67.2365,12.2849},{-67.2365,57.265},{-55.2991,57.265}}));
      connect(u,signalvoltage1.v) annotation(Line(points = {{-103,0},{-75.7835,0},{-75.7835,0.2849},{-75.6365,0.2849}}));
      connect(resistor1.n, inductor1.p) annotation (Line(
          points={{-31.2991,57.265},{-23.6809,57.265}},
          color={0,0,255}));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(lineColor=  {100,100,100}, fillColor=  {100,100,100},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-10,-90},{10,90}}),Ellipse(extent=  {{-50,-50},{50,50}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {255,255,255}),Line(points=  {{35,-50},{35,50}}),Line(color=  {0,0,255}, points=  {{-95,0},{-53,0}})}));
    end ServomotorVertical;

    model PrismaticM
      parameter Position plotRadius = 0.1;
      parameter Position z0 = 1;
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(             useAxisFlange = true,
        n={0,0,1},
        s(start=z0, fixed=true),
        animation=true,
        boxColor={0,128,255},
        boxWidth=2*plotRadius,
        v(fixed=true, start=0))                                                                                         annotation(Placement(transformation(origin={3.7835,
                -7.77156e-16},                                                                                                    extent={{-12,-12},
                {12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        annotation (Placement(transformation(extent={{-118,-16},{-86,16}}),
            iconTransformation(extent={{-118,-16},{-86,16}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
        annotation (Placement(transformation(extent={{-50,88},{-30,108}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
        annotation (Placement(transformation(extent={{30,90},{50,110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
        annotation (Placement(transformation(extent={{86,-16},{118,16}}),
            iconTransformation(extent={{86,-16},{118,16}})));
    equation
      connect(frame_a, prismatic1.frame_a) annotation (Line(
          points={{-102,0},{-8.2165,0}},
          color={95,95,95},
          thickness=0.5));
      connect(prismatic1.axis, flange_a) annotation (Line(
          points={{13.3835,7.2},{13.3835,80},{-40,80},{-40,98}},
          color={0,127,0}));
      connect(prismatic1.support, flange_b) annotation (Line(
          points={{-1.0165,7.2},{-1.0165,60},{40,60},{40,100}},
          color={0,127,0}));
      connect(frame_b, prismatic1.frame_b) annotation (Line(
          points={{102,0},{15.7835,0}},
          color={95,95,95},
          thickness=0.5));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-100,40},{100,-42}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={0,128,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={0,128,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-70,0},{72,0}},
              thickness=1,
              arrow={Arrow.Filled,Arrow.Filled})}));
    end PrismaticM;

    model RoboterScara
      parameter Position L1 = 1 "Length of link 1";
      parameter Position L2 = 1 "Length of link 2";
      parameter Mass m1 = 1 "Mass of link 1";
      parameter Mass m2 = 1 "Mass of link 2";
      parameter Mass m3 = 1 "Stator mass of vertical drive motor";
      parameter Angle phi1 = 0 "Initial angle of joint 1";
      parameter Angle phi2 = 0 "Initial angle of joint 2";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {99.48950000000001,-2.591}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {99.48950000000001,-2.591}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relanglesensor1 annotation(Placement(transformation(origin = {-53.4004,34.6165}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relanglesensor2 annotation(Placement(transformation(origin = {11.1219,35.6979}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sensors.RelPositionSensor relpositionsensor1 annotation(Placement(transformation(origin = {72.1905,36.0953}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(Placement(transformation(origin={-90.4188,
                -2.591},                                                                                                    extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Link link1(l = L1, lc = L1 / 2, m = m1, J = m1 * L1 * L1 / 12) annotation(Placement(transformation(origin={-22.0493,
                -2.591},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(start = phi2, fixed = true), useAxisFlange = true, n = {0,0,-1},
        cylinderLength=0.1,
        cylinderDiameter=0.1,
        cylinderColor={0,128,255})                                                                                                annotation(Placement(transformation(origin={9.7217,
                -2.591},                                                                                                    extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Link link2(l = L2, lc = L2 / 2, m = m2, J = m2 * L2 * L2 / 12) annotation(Placement(transformation(origin={42.1558,
                -2.591},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(transformation(origin = {-60,105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {-60,105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealInput u2 annotation(Placement(transformation(origin = {0,105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealInput u3 annotation(Placement(transformation(origin = {60,105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {60,105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealOutput y1 annotation(Placement(transformation(origin = {-60,-105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {-60,-105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealOutput y2 annotation(Placement(transformation(origin = {0,-105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,-105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealOutput y3 annotation(Placement(transformation(origin = {60,-105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {60,-105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PJLoeslib.Kap17.Servomotor servomotor1(R = 3.9, L = 0.0073, kT = 0.4, i = 130) annotation(Placement(transformation(origin = {-53.032,66.82989999999999}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      PJLoeslib.Kap17.Servomotor servomotor2(R = 50, L = 0.025, kT = 0.25, i = 100) annotation(Placement(transformation(origin = {10.1566,67.902}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      PJLoeslib.Kap17.ServomotorVertical servomotorvertical1(R = 40, L = 0.025, kT = 0.4, i = 1047, J = 9.099999999999999e-06) annotation(Placement(transformation(origin = {72.0356,67.61709999999999}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      PJlib.Kap17.BodyBox bodybox1(w = 0.1, h = 0.1, d = 0.1, m = m3,
        direction={-0.05,0,0})                                        annotation(Placement(transformation(origin={60.1078,
                -32.9126},                                                                                                    extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Blocks.Math.Gain gain3(k = -1) annotation(Placement(transformation(origin = {59.8291,-75.2137}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Math.Gain gain2(k = -1) annotation(Placement(transformation(origin = {-0.2849,-74.9288}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Math.Gain gain1(k = -1) annotation(Placement(transformation(origin = {-60.3989,-75.2137}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(                                 useAxisFlange = true, n = {0,0,-1},
        phi(start=phi1, fixed=true),
        cylinderLength=0.1,
        cylinderDiameter=0.1,
        cylinderColor={0,128,255})                                                                                                annotation(Placement(transformation(origin={-56.2783,
                -2.591},                                                                                                    extent = {{-12,-12},{12,12}})));
      PrismaticM prismaticM(z0=0, plotRadius=0.03) annotation (Placement(
            transformation(extent={{68,-12.591},{88,7.409}})));
    equation
      connect(gain3.u,relpositionsensor1.s_rel) annotation(Line(points = {{59.8291,-60.8137},{59.5442,-60.8137},{59.5442,-52.4217},{95.44159999999999,-52.4217},{95.44159999999999,17.9487},{72.3647,17.9487},{72.3647,22.8953},{72.1905,22.8953}}));
      connect(gain2.u,relanglesensor2.phi_rel) annotation(Line(points = {{-0.2849,-60.5288},{-0.2849,-60.5288},{-0.2849,-50.4274},{-4.8433,-50.4274},{-4.8433,17.6638},{11.396,17.6638},{11.396,22.4979},{11.1219,22.4979}}));
      connect(gain1.u,relanglesensor1.phi_rel) annotation(Line(points = {{-60.3989,-60.8137},{-60.3989,-60.8137},{-60.3989,-50.4274},{-74.35899999999999,-50.4274},{-74.35899999999999,17.6638},{-53.2764,17.6638},{-53.2764,21.4165},{-53.4004,21.4165}}));
      connect(gain3.y,y3) annotation(Line(points = {{59.8291,-88.41370000000001},{59.8291,-88.41370000000001},{59.8291,-105},{60,-105}}));
      connect(gain1.y,y1) annotation(Line(points = {{-60.3989,-88.41370000000001},{-60.114,-88.41370000000001},{-60.114,-105},{-60,-105}}));
      connect(gain2.y,y2) annotation(Line(points = {{-0.2849,-88.1288},{-0.2849,-88.1288},{-0.2849,-105},{0,-105}}));
      connect(revolute2.frame_b,link2.frame_a) annotation(Line(points={{21.7217,
              -2.591},{30.4843,-2.591},{30.1558,-2.591}}));
      connect(link1.frame_b,revolute2.frame_a) annotation(Line(points={{
              -10.0493,-2.591},{-1.9943,-2.591},{-2.2783,-2.591}}));
      connect(relanglesensor2.flange_b,revolute2.axis) annotation(Line(points={{23.1219,
              35.6979},{27.0656,35.6979},{27.0656,12.8205},{9.68656,12.8205},{
              9.68656,9.409},{9.7217,9.409}}));
      connect(relanglesensor2.flange_a,revolute2.support) annotation(Line(points={{-0.8781,
              35.6979},{-7.97723,35.6979},{-7.97723,13.6752},{2.27917,13.6752},
              {2.27917,9.409},{2.5217,9.409}}));
      connect(servomotor2.flange_b,revolute2.axis) annotation(Line(points={{22.1566,
              67.902},{27.0655,67.902},{27.0655,12.8205},{9.68657,12.8205},{
              9.68657,9.409},{9.7217,9.409}}));
      connect(servomotor2.flange_a,revolute2.support) annotation(Line(points={{
              -1.80921,67.902},{-7.97723,67.902},{-7.97723,13.6752},{2.27917,
              13.6752},{2.27917,9.409},{2.5217,9.409}}));
      connect(servomotor1.u,u1) annotation(Line(points={{-53.032,79.1899},{
              -52.9915,79.1899},{-52.9915,85.4701},{-59.8291,85.4701},{-59.8291,
              105},{-60,105}}));
      connect(servomotor2.u,u2) annotation(Line(points={{10.1566,80.262},{
              9.97146,80.262},{9.97146,85.4701},{-4.17334e-05,85.4701},{
              -4.17334e-05,105},{0,105}}));
      connect(servomotorvertical1.u,u3) annotation(Line(points={{72.0356,
              79.9771},{71.5099,79.9771},{71.5099,85.4701},{59.829,85.4701},{
              59.829,105},{60,105}}));
      connect(revolute1.frame_b, link1.frame_a) annotation (Line(
          points={{-44.2783,-2.591},{-34.0493,-2.591}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute1.frame_a, fixed1.frame_b) annotation (Line(
          points={{-68.2783,-2.591},{-78.4188,-2.591}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute1.axis, relanglesensor1.flange_b) annotation (Line(
          points={{-56.2783,9.409},{-56.2783,12},{-34,12},{-34,34.6165},{
              -41.4004,34.6165}}));
      connect(revolute1.support, relanglesensor1.flange_a) annotation (Line(
          points={{-63.4783,9.409},{-63.4783,12},{-78,12},{-78,34.6165},{
              -65.4004,34.6165}}));
      connect(servomotor1.flange_a, relanglesensor1.flange_a) annotation (Line(
          points={{-64.9978,66.8299},{-78,66.8299},{-78,34.6165},{-65.4004,
              34.6165}}));
      connect(servomotor1.flange_b, relanglesensor1.flange_b) annotation (Line(
          points={{-41.032,66.8299},{-34,66.8299},{-34,34.6165},{-41.4004,
              34.6165}}));
      connect(frame_b, prismaticM.frame_b) annotation (Line(
          points={{99.4895,-2.591},{88.2,-2.591}},
          color={95,95,95},
          thickness=0.5));
      connect(relpositionsensor1.flange_a, prismaticM.flange_a) annotation (
          Line(
          points={{60.1905,36.0953},{56,36.0953},{56,12},{74,12},{74,7.209}},
          color={0,127,0}));
      connect(relpositionsensor1.flange_b, prismaticM.flange_b) annotation (
          Line(
          points={{84.1905,36.0953},{88,36.0953},{88,12},{82,12},{82,7.409}},
          color={0,127,0}));
      connect(servomotorvertical1.flange_a, prismaticM.flange_a) annotation (
          Line(
          points={{60.0698,67.6171},{56,67.6171},{56,12},{74,12},{74,7.209}},
          color={0,127,0}));
      connect(servomotorvertical1.flange_b, prismaticM.flange_b) annotation (
          Line(
          points={{84.0356,67.6171},{88,67.6171},{88,12},{82,12},{82,7.409}},
          color={0,127,0}));
      connect(link2.frame_b, prismaticM.frame_a) annotation (Line(
          points={{54.1558,-2.591},{67.8,-2.591}},
          color={95,95,95},
          thickness=0.5));
      connect(bodybox1.frame_a, prismaticM.frame_a) annotation (Line(
          points={{60.1078,-20.9126},{60,-2},{61.0779,-2.591},{67.8,-2.591}},
          color={95,95,95},
          thickness=0.5));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-21,-18},{42,-11}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{39,-5},{46,44}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{30,41},{55,49}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{36,-23},{48,-1}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {33,33,255}),Polygon(points=  {{-72,-48},{-69,-53},{-21,-19},{-25,-13}},
                fillPattern=                                                                                                    FillPattern.Solid),Ellipse(extent=  {{-80,-59},{-64,-43}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {33,33,255}),Ellipse(extent=  {{-29,-24},{-13,-8}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {33,33,255})}));
    end RoboterScara;

    model PD3Controller
      parameter Real P1 = 1;
      parameter Real D1 = 1;
      parameter Real Umax1 = 1;
      parameter Real P2 = 1;
      parameter Real D2 = 1;
      parameter Real Umax2 = 1;
      parameter Real P3 = 1;
      parameter Real D3 = 1;
      parameter Real Umax3 = 1;
      Modelica.Blocks.Interfaces.RealInput u1[3] annotation(Placement(transformation(origin = {-104.145,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-104.145,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u2[3] annotation(Placement(transformation(origin = {-105,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-105,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y[3] annotation(Placement(transformation(origin = {105,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,0}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.AddVector addvector1(n = 3, k1 = -1) annotation(Placement(transformation(origin = {-68.94589999999999,-0.284902}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.DeMultiplex3 demultiplex31 annotation(Placement(transformation(origin = {-31.339,-0.569801}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.PID pid1(k = P1, Ti = 1e+100, Td = D1 / P1,
        initType=Modelica.Blocks.Types.InitPID.NoInit)                       annotation(Placement(transformation(origin = {7.12251,35.3276}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.PID pid2(k = P2, Ti = 1e+100, Td = D2 / P2,
        initType=Modelica.Blocks.Types.InitPID.NoInit)                       annotation(Placement(transformation(origin = {5.98291,-0.569801}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.PID pid3(k = P3, Ti = 1e+100, Td = D3 / P3,
        initType=Modelica.Blocks.Types.InitPID.NoInit)                       annotation(Placement(transformation(origin = {5.98291,-36.4672}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = Umax1, uMin = -Umax1) annotation(Placement(transformation(origin = {40.7407,35.3276}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = Umax2, uMin = -Umax2) annotation(Placement(transformation(origin = {40.7407,-0.569801}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Nonlinear.Limiter limiter3(uMax = Umax3, uMin = -Umax3) annotation(Placement(transformation(origin = {40.7407,-36.4672}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Multiplex3 multiplex31 annotation(Placement(transformation(origin = {75.7835,-0.569801}, extent = {{-12,-12},{12,12}})));
    equation
      connect(multiplex31.y,y) annotation(Line(points = {{88.98350000000001,-0.569801},{96.01139999999999,-0.569801},{96.01139999999999,0},{105,0}}));
      connect(limiter3.y,multiplex31.u3[1]) annotation(Line(points={{53.9407,
              -36.4672},{56.6952,-36.4672},{56.6952,-9.11681},{61.3835,-9.11681},
              {61.3835,-8.9698}}));
      connect(limiter1.y,multiplex31.u1[1]) annotation(Line(points={{53.9407,
              35.3276},{56.4103,35.3276},{56.4103,7.97721},{61.3835,7.97721},{
              61.3835,7.8302}}));
      connect(limiter2.y,multiplex31.u2[1]) annotation(Line(points={{53.9407,
              -0.569801},{59.2593,-0.569801},{61.3835,-0.569801}}));
      connect(pid3.y,limiter3.u) annotation(Line(points={{19.1829,-36.4672},{
              19.1829,-36.4672},{26.3407,-36.4672}}));
      connect(pid2.y,limiter2.u) annotation(Line(points={{19.1829,-0.569801},{
              19.1829,-0.569801},{26.3407,-0.569801}}));
      connect(pid1.y,limiter1.u) annotation(Line(points={{20.3225,35.3276},{
              20.3225,35.3276},{26.3407,35.3276}}));
      connect(demultiplex31.y3[1],pid3.u) annotation(Line(points={{-18.139,
              -8.9698},{-13.6752,-8.9698},{-13.6752,-36.4672},{-8.41709,
              -36.4672}}));
      connect(demultiplex31.y2[1],pid2.u) annotation(Line(points={{-18.139,
              -0.569801},{-8.54701,-0.569801},{-8.41709,-0.569801}}));
      connect(demultiplex31.y1[1],pid1.u) annotation(Line(points={{-18.139,
              7.8302},{-13.9601,7.8302},{-13.9601,35.6125},{-7.27749,35.6125},{
              -7.27749,35.3276}}));
      connect(addvector1.y,demultiplex31.u) annotation(Line(points = {{-56.2259,-0.284902},{-47.2934,-0.284902},{-47.2934,-0.569801},{-45.739,-0.569801}}));
      connect(u2,addvector1.v2) annotation(Line(points={{-105,-40},{-87.7493,
              -40},{-87.7493,-4.8433},{-81.3059,-4.8433},{-81.3059,-5.0849}}));
      connect(u1,addvector1.v1) annotation(Line(points={{-104.145,40},{-87.7493,
              40},{-87.7493,4.8433},{-81.3059,4.8433},{-81.3059,4.5151}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,-40},{90,40}}, textString=  "PD3", fontName=  "Times New Roman")}));
    end PD3Controller;

    model Constant3
      parameter Real k1 = 1;
      parameter Real k2 = 1;
      parameter Real k3 = 1;
      Modelica.Blocks.Interfaces.RealOutput y[3] annotation(Placement(transformation(origin = {105,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant2(k = k3) annotation(Placement(transformation(origin = {-21.6525,-38.1766}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant const(k = k1) annotation(Placement(transformation(origin = {-22.5072,42.1653}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant1(k = k2) annotation(Placement(transformation(origin = {-22.2223,1.1396}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Multiplex3 multiplex31 annotation(Placement(transformation(origin = {34.4729,0.284901}, extent = {{-12,-12},{12,12}})));
    equation
      connect(multiplex31.y,y) annotation(Line(points = {{47.6729,0.284901},{95.7265,0.284901},{95.7265,0},{105,0}}));
      connect(const.y,multiplex31.u1[1]) annotation(Line(points = {{-9.307169999999999,42.1653},{2.27923,42.1653},{2.27923,8.83189},{20.0729,8.83189},{20.0729,8.684900000000001}}));
      connect(constant1.y,multiplex31.u2[1]) annotation(Line(points = {{-9.022270000000001,1.1396},{19.3732,1.1396},{19.3732,0.284901},{20.0729,0.284901}}));
      connect(constant2.y,multiplex31.u3[1]) annotation(Line(points = {{-8.45247,-38.1766},{2.27923,-38.1766},{2.27923,-7.69231},{20.0729,-7.69231},{20.0729,-8.1151}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,-40},{90,40}}, textString=  "[a,b,c]", fontName=  "Times New Roman")}));
    end Constant3;

    model CurrentLimiter
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      parameter Current iMax = 1 "maximal current";
      Real s;
    equation
      if s < (-1) then
        v = s + 1;
        i = -iMax;
      elseif s > 1 then
        v = s - 1;
        i = iMax;
      else
        v = 0;
        i = iMax * s;
      end if;
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Line(points=  {{-85,-30},{-55,-30},{55,80},{85,80}}),Text(extent=  {{-17,-94},{16,-30}}, textString=  "I", fontName=  "Times New Roman")}));
    end CurrentLimiter;

    model ServomotorL
      parameter Resistance R = 1 "Resistance";
      parameter Inductance L = 1 "Inductance";
      parameter ElectricalTorqueConstant kT = 1 "Transformation coefficient";
      parameter Real i = 1 "Gear ratio";
      parameter Current Imax = 1 "Maximal current";
      parameter Current I0 = 0 "Initial current";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {0,-99.71510000000001}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {0,-99.71510000000001}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {0,100}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {0,100}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.EMF emf(k = kT, useSupport = true) annotation(Placement(transformation(origin = {23.0769,2.2792}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = i) annotation(Placement(transformation(origin = {60.6838,2.2792}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R = R) annotation(Placement(transformation(origin = {-45.2991,57.265}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L = L, i(fixed=true,
            start=I0))                                           annotation(Placement(transformation(origin={-5.6809,
                56.9801},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-66.9516,-50.4274}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalvoltage1 annotation(Placement(transformation(origin = {-67.23650000000001,0.2849}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      PJLoeslib.Kap17.CurrentLimiter currentlimiter1(iMax = Imax) annotation(Placement(transformation(origin = {-19.943,-25.3561}, extent = {{-12,-12},{12,12}})));
    equation
      connect(currentlimiter1.n,emf.n) annotation(Line(points={{-7.943,-25.3561},{23.0769,
              -25.3561},{23.0769,-9.7208}}));
      connect(currentlimiter1.p,signalvoltage1.p) annotation(Line(points={{-31.943,
              -25.3561},{-66.9516,-25.3561},{-66.9516,-11.7151},{-67.2365,
              -11.7151}}));
      connect(ground1.p,signalvoltage1.p) annotation(Line(points={{-66.9516,
              -38.4274},{-66.9516,-10.5413},{-67.2365,-10.5413},{-67.2365,
              -11.7151}}));
      connect(inductor1.n,emf.p) annotation(Line(points={{6.3191,56.9801},{
              23.0769,56.9801},{23.0769,14.2792}}));
      connect(resistor1.n,inductor1.p) annotation(Line(points={{-33.2991,57.265},
              {-16.8091,57.265},{-16.8091,56.9801},{-17.6809,56.9801}}));
      connect(signalvoltage1.n,resistor1.p) annotation(Line(points={{-67.2365,
              12.2849},{-67.2365,12.2849},{-67.2365,57.265},{-57.2991,57.265}}));
      connect(u,signalvoltage1.v) annotation(Line(points = {{-103,0},{-75.7835,0},{-75.7835,0.2849},{-75.6365,0.2849}}));
      connect(idealgear1.flange_b,flange_b) annotation(Line(points = {{72.68380000000001,2.2792},{82.0513,2.2792},{82.0513,87.1795},{0.569801,87.1795},{0.569801,100},{0,100}}));
      connect(emf.flange,idealgear1.flange_a) annotation(Line(points = {{35.0769,2.2792},{49.5726,2.2792},{49.5726,2.2792},{48.6838,2.2792}}));
      connect(emf.support,flange_a) annotation(Line(points = {{11.0769,2.2792},{-0.854701,2.2792},{-0.854701,-99.71510000000001},{0,-99.71510000000001}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(lineColor=  {100,100,100}, fillColor=  {100,100,100},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-10,-90},{10,90}}),Ellipse(extent=  {{-50,-50},{50,50}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {255,255,255}),Line(color=  {0,0,255}, points=  {{-95,0},{-53,0}})}));
    end ServomotorL;

    model ServomotorVerticalL
      parameter Resistance R = 1 "Resistance";
      parameter Inductance L = 1 "Inductance";
      parameter ElectricalTorqueConstant kT = 1 "Transformation coefficient";
      parameter Real i = 1 "Gear ratio";
      parameter Inertia J = 1 "Motor inertia";
      parameter Current Imax = 1 "Maximal current";
      parameter Current I0 = 0 "Initial current";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {0,-99.71510000000001}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {0,-99.71510000000001}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {0,100}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {0,100}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R = R) annotation(Placement(transformation(origin = {-45.2991,57.265}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L = L, i(fixed=true,
            start=I0))                                           annotation(Placement(transformation(origin={-5.6809,
                56.9801},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-66.9516,-50.4274}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.EMF emf(k = kT, useSupport = false) annotation(Placement(transformation(origin = {13.3903,1.7094}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = J) annotation(Placement(transformation(origin = {48.4331,1.9943}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.IdealGearR2T idealgearr2t1(ratio = i, useSupportR = false, useSupportT = true) annotation(Placement(transformation(origin = {81.7664,1.7094}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalvoltage1 annotation(Placement(transformation(origin = {-67.23650000000001,0.2849}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      PJLoeslib.Kap17.CurrentLimiter currentlimiter1(iMax = Imax) annotation(Placement(transformation(origin = {-35.0427,-26.4957}, extent = {{-12,-12},{12,12}})));
    equation
      connect(currentlimiter1.p,signalvoltage1.p) annotation(Line(points={{
              -47.0427,-26.4957},{-66.9516,-26.4957},{-66.9516,-11.7151},{
              -67.2365,-11.7151}}));
      connect(currentlimiter1.n,emf.n) annotation(Line(points={{-23.0427,-26.4957},{
              13.3903,-26.4957},{13.3903,-10.2906}}));
      connect(idealgearr2t1.flangeT,flange_b) annotation(Line(points = {{93.7664,1.7094},{93.4473,1.7094},{93.4473,84.04559999999999},{0,84.04559999999999},{0,100},{0,100}}));
      connect(idealgearr2t1.supportT,flange_a) annotation(Line(points = {{93.7664,-10.2906},{93.4473,-10.2906},{93.4473,-76.92310000000001},{0.854701,-76.92310000000001},{0.854701,-99.71510000000001},{0,-99.71510000000001}}));
      connect(inertia1.flange_b,idealgearr2t1.flangeR) annotation(Line(points = {{60.4331,1.9943},{70.6553,1.9943},{70.6553,1.7094},{69.7664,1.7094}}));
      connect(emf.flange,inertia1.flange_a) annotation(Line(points = {{25.3903,1.7094},{36.4672,1.7094},{36.4672,1.9943},{36.4331,1.9943}}));
      connect(emf.p,inductor1.n) annotation(Line(points={{13.3903,13.7094},{
              13.3903,56.6952},{6.3191,56.6952},{6.3191,56.9801}}));
      connect(ground1.p,signalvoltage1.p) annotation(Line(points={{-66.9516,
              -38.4274},{-66.9516,-10.5413},{-67.2365,-10.5413},{-67.2365,
              -11.7151}}));
      connect(resistor1.n,inductor1.p) annotation(Line(points={{-33.2991,57.265},
              {-16.8091,57.265},{-16.8091,56.9801},{-17.6809,56.9801}}));
      connect(signalvoltage1.n,resistor1.p) annotation(Line(points={{-67.2365,
              12.2849},{-67.2365,12.2849},{-67.2365,57.265},{-57.2991,57.265}}));
      connect(u,signalvoltage1.v) annotation(Line(points = {{-103,0},{-75.7835,0},{-75.7835,0.2849},{-75.6365,0.2849}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(lineColor=  {100,100,100}, fillColor=  {100,100,100},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-10,-90},{10,90}}),Ellipse(extent=  {{-50,-50},{50,50}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {255,255,255}),Line(points=  {{35,-50},{35,50}}),Line(color=  {0,0,255}, points=  {{-95,0},{-53,0}})}));
    end ServomotorVerticalL;

    model RoboterScaraL
      parameter Position L1 = 1 "Length of link 1";
      parameter Position L2 = 1 "Length of link 2";
      parameter Mass m1 = 1 "Mass of link 1";
      parameter Mass m2 = 1 "Mass of link 2";
      parameter Mass m3 = 1 "Stator mass of vertical drive motor";
      parameter Angle phi1 = 0 "Initial angle of joint 1";
      parameter Angle phi2 = 0 "Initial angle of joint 2";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {99.48950000000001,-2.591}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {99.48950000000001,-2.591}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relanglesensor1 annotation(Placement(transformation(origin = {-53.4004,34.6165}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relanglesensor2 annotation(Placement(transformation(origin = {11.1219,35.6979}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sensors.RelPositionSensor relpositionsensor1 annotation(Placement(transformation(origin = {72.1905,36.0953}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(Placement(transformation(origin = {-90.4188,-2.8663}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(start = phi1, fixed = true), useAxisFlange = true, n = {0,0,-1},
        cylinderLength=0.1,
        cylinderDiameter=0.1,
        cylinderColor={0,128,255},
        w(fixed=true, start=0))                                                                                                   annotation(Placement(transformation(origin = {-54.679,-2.85903}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Link link1(l = L1, lc = L1 / 2, m = m1, J = m1 * L1 * L1 / 12) annotation(Placement(transformation(origin = {-22.0493,-2.86879}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(start = phi2, fixed = true), useAxisFlange = true, n = {0,0,-1},
        cylinderLength=0.1,
        cylinderDiameter=0.1,
        cylinderColor={0,128,255},
        w(fixed=true, start=0))                                                                                                   annotation(Placement(transformation(origin = {9.7217,-3.21641}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Link link2(l = L2, lc = L2 / 2, m = m2, J = m2 * L2 * L2 / 12) annotation(Placement(transformation(origin = {42.1558,-3.6811}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(transformation(origin = {-60,105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {-60,105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealInput u2 annotation(Placement(transformation(origin = {0,105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealInput u3 annotation(Placement(transformation(origin = {60,105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {60,105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealOutput y1 annotation(Placement(transformation(origin = {-60,-105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {-60,-105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealOutput y2 annotation(Placement(transformation(origin = {0,-105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,-105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealOutput y3 annotation(Placement(transformation(origin = {60,-105}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {60,-105}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PJLoeslib.Kap17.ServomotorL servomotor1(R = 3.9, L = 0.0073, kT = 0.4, i = 130, Imax = 6.64,
        I0=0)                                                                                                     annotation(Placement(transformation(origin = {-53.032,66.82989999999999}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      PJLoeslib.Kap17.ServomotorL servomotor2(R = 50, L = 0.025, kT = 0.25, i = 100, Imax = 2.771,
        I0=0)                                                                                      annotation(Placement(transformation(origin = {10.1566,67.902}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      PJLoeslib.Kap17.ServomotorVerticalL servomotorvertical1(R = 40, L = 0.025, kT = 0.4, i = 1047, J = 9.099999999999999e-06, Imax = 1.732,
        I0=0)                                                                                                     annotation(Placement(transformation(origin = {72.0356,67.61709999999999}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PJlib.Kap17.BodyBox bodybox1(w = 0.1, h = 0.1, d = 0.1, m = m3) annotation(Placement(transformation(origin={60.1078,
                -32.9126},                                                                                                    extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Blocks.Math.Gain gain3(k = -1) annotation(Placement(transformation(origin = {59.8291,-75.2137}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Math.Gain gain2(k = -1) annotation(Placement(transformation(origin = {-0.2849,-74.9288}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Math.Gain gain1(k = -1) annotation(Placement(transformation(origin = {-60.3989,-75.2137}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PrismaticM prismaticM(z0=0, plotRadius=0.03) annotation (Placement(
            transformation(extent={{66,-12.591},{86,7.409}})));
    equation
      connect(gain3.u,relpositionsensor1.s_rel) annotation(Line(points = {{59.8291,-60.8137},{59.5442,-60.8137},{59.5442,-52.4217},{95.44159999999999,-52.4217},{95.44159999999999,17.9487},{72.3647,17.9487},{72.3647,22.8953},{72.1905,22.8953}}));
      connect(gain2.u,relanglesensor2.phi_rel) annotation(Line(points = {{-0.2849,-60.5288},{-0.2849,-60.5288},{-0.2849,-50.4274},{-4.8433,-50.4274},{-4.8433,17.6638},{11.396,17.6638},{11.396,22.4979},{11.1219,22.4979}}));
      connect(gain1.u,relanglesensor1.phi_rel) annotation(Line(points = {{-60.3989,-60.8137},{-60.3989,-60.8137},{-60.3989,-50.4274},{-74.35899999999999,-50.4274},{-74.35899999999999,17.6638},{-53.2764,17.6638},{-53.2764,21.4165},{-53.4004,21.4165}}));
      connect(gain3.y,y3) annotation(Line(points = {{59.8291,-88.41370000000001},{59.8291,-88.41370000000001},{59.8291,-105},{60,-105}}));
      connect(gain1.y,y1) annotation(Line(points = {{-60.3989,-88.41370000000001},{-60.114,-88.41370000000001},{-60.114,-105},{-60,-105}}));
      connect(gain2.y,y2) annotation(Line(points = {{-0.2849,-88.1288},{-0.2849,-88.1288},{-0.2849,-105},{0,-105}}));
      connect(revolute2.frame_b,link2.frame_a) annotation(Line(points = {{21.7217,-3.21641},{30.4843,-3.21641},{30.4843,-3.6811},{30.1558,-3.6811}}));
      connect(link1.frame_b,revolute2.frame_a) annotation(Line(points = {{-10.0493,-2.86879},{-1.9943,-2.86879},{-1.9943,-3.21641},{-2.2783,-3.21641}}));
      connect(revolute1.frame_b,link1.frame_a) annotation(Line(points = {{-42.679,-2.85903},{-33.6182,-2.85903},{-33.6182,-2.86879},{-34.0493,-2.86879}}));
      connect(fixed1.frame_b,revolute1.frame_a) annotation(Line(points = {{-78.4188,-2.8663},{-66.3818,-2.8663},{-66.3818,-2.85903},{-66.679,-2.85903}}));
      connect(relanglesensor1.flange_b,revolute1.axis) annotation(Line(points = {{-41.4004,34.6165},{-36.1823,34.6165},{-36.1823,12.8205},{-54.416,12.8205},{-54.416,9.140969999999999},{-54.679,9.140969999999999}}));
      connect(relanglesensor1.flange_a,revolute1.support) annotation(Line(points = {{-65.4004,34.6165},{-70.6553,34.6165},{-70.6553,13.6752},{-61.8234,13.6752},{-61.8234,9.140969999999999},{-61.879,9.140969999999999}}));
      connect(relanglesensor2.flange_b,revolute2.axis) annotation(Line(points={{23.1219,
              35.6979},{27.0656,35.6979},{27.0656,12.8205},{9.68656,12.8205},{
              9.68656,8.78359},{9.7217,8.78359}}));
      connect(relanglesensor2.flange_a,revolute2.support) annotation(Line(points={{-0.8781,
              35.6979},{-7.97723,35.6979},{-7.97723,13.6752},{2.27917,13.6752},
              {2.27917,8.78359},{2.5217,8.78359}}));
      connect(servomotor2.flange_b,revolute2.axis) annotation(Line(points={{22.1566,
              67.902},{27.0655,67.902},{27.0655,12.8205},{9.68657,12.8205},{
              9.68657,8.78359},{9.7217,8.78359}}));
      connect(servomotor2.flange_a,revolute2.support) annotation(Line(points={{
              -1.80921,67.902},{-7.97723,67.902},{-7.97723,13.6752},{2.27917,
              13.6752},{2.27917,8.78359},{2.5217,8.78359}}));
      connect(servomotor1.u,u1) annotation(Line(points={{-53.032,79.1899},{
              -52.9915,79.1899},{-52.9915,85.4701},{-59.8291,85.4701},{-59.8291,
              105},{-60,105}}));
      connect(servomotor2.u,u2) annotation(Line(points={{10.1566,80.262},{
              9.97146,80.262},{9.97146,85.4701},{-4.17334e-05,85.4701},{
              -4.17334e-05,105},{0,105}}));
      connect(servomotorvertical1.u,u3) annotation(Line(points={{72.0356,
              79.9771},{71.5099,79.9771},{71.5099,85.4701},{59.829,85.4701},{
              59.829,105},{60,105}}));
      connect(frame_b, prismaticM.frame_b) annotation (Line(
          points={{99.4895,-2.591},{86.2,-2.591}},
          color={95,95,95},
          thickness=0.5));
      connect(link2.frame_b, prismaticM.frame_a) annotation (Line(
          points={{54.1558,-3.6811},{60.0779,-3.6811},{60.0779,-2.591},{65.8,
              -2.591}},
          color={95,95,95},
          thickness=0.5));
      connect(bodybox1.frame_a, prismaticM.frame_a) annotation (Line(
          points={{60.1078,-20.9126},{60.1078,-2.591},{65.8,-2.591}},
          color={95,95,95},
          thickness=0.5));
      connect(relpositionsensor1.flange_b, prismaticM.flange_b) annotation (
          Line(
          points={{84.1905,36.0953},{88,36.0953},{88,12},{80,12},{80,7.409}},
          color={0,127,0}));
      connect(relpositionsensor1.flange_a, prismaticM.flange_a) annotation (
          Line(
          points={{60.1905,36.0953},{56,36.0953},{56,12},{72,12},{72,7.209}},
          color={0,127,0}));
      connect(servomotorvertical1.flange_b, prismaticM.flange_a) annotation (
          Line(
          points={{60.0356,67.6171},{56,67.6171},{56,12},{72,12},{72,7.209}},
          color={0,127,0}));
      connect(servomotorvertical1.flange_a, prismaticM.flange_b) annotation (
          Line(
          points={{84.0014,67.6171},{88,67.6171},{88,12},{80,12},{80,7.409}},
          color={0,127,0}));
      connect(servomotor1.flange_a, revolute1.support) annotation (Line(
          points={{-64.9978,66.8299},{-70,66.8299},{-70,34},{-70.6553,34},{
              -70.6553,13.6752},{-61.8234,13.6752},{-61.8234,9.14097},{-61.879,
              9.14097}}));
      connect(servomotor1.flange_b, revolute1.axis) annotation (Line(
          points={{-41.032,66.8299},{-36,66.8299},{-36,34},{-36.1823,34.6165},{
              -36.1823,12.8205},{-54.416,12.8205},{-54.416,9.14097},{-54.679,
              9.14097}}));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-21,-18},{42,-11}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{39,-5},{46,44}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{30,41},{55,49}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{36,-23},{48,-1}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {33,33,255}),Polygon(points=  {{-72,-48},{-69,-53},{-21,-19},{-25,-13}},
                fillPattern=                                                                                                    FillPattern.Solid),Ellipse(extent=  {{-80,-59},{-64,-43}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {33,33,255}),Ellipse(extent=  {{-29,-24},{-13,-8}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {33,33,255})}));
    end RoboterScaraL;

    model Reifen
      parameter Modelica.SIunits.TranslationalSpringConstant c = 1;
      parameter Modelica.SIunits.Position l0 = 1;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,12},{12,-12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,12},{12,-12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativeposition1 annotation(Placement(transformation(origin={-18.1425,
                59.6581},                                                                                                    extent = {{-12,12},{12,-12}}, rotation=180)));
      Modelica.Mechanics.MultiBody.Forces.Force force1(animation=false)
                                                       annotation(Placement(transformation(origin={-20.2621,
                -0.25641},                                                                                                   extent = {{-12,12},{12,-12}}, rotation=180)));
      Real l;
      Real F;
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(
        shapeType="spring",
        width=0.06,
        extra=6,
        widthDirection={0,1,0},
        lengthDirection={0,0,-1},
        height=0.02)
        annotation (Placement(transformation(extent={{14,-44},{-6,-24}})));
    equation
      l = min(0, Modelica.Math.Vectors.norm(relativeposition1.r_rel) - l0);
      F = c * l;
      force1.force[3] = F;
      force1.force[1] = 0;
      force1.force[2] = 0;
      fixedShape.length = l0 + l;
      connect(frame_a, force1.frame_b) annotation (Line(
          points={{-100,0},{-78,0},{-78,-0.25641},{-32.2621,-0.25641}},
          color={95,95,95},
          thickness=0.5));
      connect(frame_b, force1.frame_a) annotation (Line(
          points={{100,0},{34,0},{34,-0.25641},{-8.2621,-0.25641}},
          color={95,95,95},
          thickness=0.5));
      connect(relativeposition1.frame_b, frame_a) annotation (Line(
          points={{-30.1425,59.6581},{-65.0712,59.6581},{-65.0712,0},{-100,0}},
          color={95,95,95},
          thickness=0.5));
      connect(relativeposition1.frame_a, frame_b) annotation (Line(
          points={{-6.1425,59.6581},{45.9288,59.6581},{45.9288,0},{100,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedShape.frame_a, frame_b) annotation (Line(
          points={{14,-34},{58,-34},{58,0},{100,0}},
          color={95,95,95},
          thickness=0.5));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Line(points=  {{-60,0},{-38,0},{-28,-30},{-8,30},{12,-30},{32,30},{52,-30},{72,30},{82,0},{100,0}})}));
    end Reifen;

    model Federbein4
      parameter Mass m = 1 "Radmasse";
      parameter TranslationalSpringConstant cr = 1 "Reifenradialsteifigkeit";
      parameter TranslationalSpringConstant ca = 1
        "Steifigkeit des Stoßdämpfers";
      parameter TranslationalDampingConstant d = 1
        "Dämpfung des Stoßdämpfers";
      parameter Position x0 = 1 "Anfangsposition x";
      parameter Position y0 = 1 "Anfangsposition y";
      parameter Position z0 = 1 "Anfangsposition z";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Strasse strasse1(x0 = x0, y0 = y0) annotation(Placement(transformation(origin = {1.86895,-41.8803}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {0,0,0}, m = m, r_0(start = {x0,y0,z0}, each fixed = true), I_11 = 1, I_22 = 1, I_33 = 1) annotation(Placement(transformation(origin = {30.9288,11.1111}, extent = {{-12,-12},{12,12}})));
      Reifen feder1(c = cr, l0 = 0.3) annotation(Placement(transformation(origin = {2.15385,-5.12821}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = 90)));
      PJlib.Kap17.Feder feder2(c = ca, b = d, l0 = 0.8) annotation(Placement(transformation(origin = {1.86895,27.6353}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0,0,1},
          animation=false)                                                  annotation(Placement(transformation(origin = {-31.6092,-4.88506}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
    equation
      connect(prismatic1.frame_a,feder1.frame_a) annotation(Line(points={{
              -31.6092,-16.8851},{-31.3218,-16.8851},{-31.3218,-23.5632},{
              2.01149,-23.5632},{2.01149,-17.1282},{2.15385,-17.1282}}));
      connect(prismatic1.frame_b,feder1.frame_b) annotation(Line(points={{
              -31.6092,7.11494},{-31.6092,7.11494},{-31.6092,11.7816},{2.01149,
              11.7816},{2.01149,6.87179},{2.15385,6.87179}}));
      connect(u,strasse1.z) annotation(Line(points={{-103,0},{-74.4695,0},{
              -74.4695,-35.6125},{-11.1111,-35.6125},{-11.1111,-35.8803},{
              -10.491,-35.8803}}));
      connect(feder2.frame_b,frame_b) annotation(Line(points={{1.86895,39.6353},
              {1.91453,39.6353},{1.91453,59.0313},{70.8376,59.0313},{70.8376,
              0.319088},{100,0.319088},{100,0}}));
      connect(body1.frame_a,feder1.frame_b) annotation(Line(points={{18.9288,
              11.1111},{2.15385,11.1111},{2.15385,6.87179}}));
      connect(feder2.frame_a,feder1.frame_b) annotation(Line(points={{1.86895,
              15.6353},{2.15385,15.6353},{2.15385,6.87179}}));
      connect(feder1.frame_a,strasse1.frame_b) annotation(Line(points={{2.15385,
              -17.1282},{2.15385,-17.1282},{2.15385,-29.8803},{1.86895,-29.8803}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}})}));
    end Federbein4;

    model Ausloeser
      import Modelica.Constants.pi;
      Modelica.Blocks.Interfaces.BooleanOutput y annotation(Placement(transformation(origin = {107.407,3.4188}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {107.407,3.4188}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.And and1 annotation(Placement(transformation(origin = {78.6915,3.4188}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.GreaterThreshold greaterthreshold1(threshold = alphamin * pi / 180) annotation(Placement(transformation(origin = {41.6789,-5.98537}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.LessEqualThreshold lessequalthreshold1(threshold = alphamax * pi / 180) annotation(Placement(transformation(origin = {42.8185,28.2051}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.UnitConversions.To_deg to_deg1 annotation(Placement(transformation(origin = {41.9638,-47.5783}, extent = {{-12,-12},{12,12}})));
      parameter Modelica.SIunits.Angle alphamax = 1 annotation(Placement(transformation(origin = {-29.3103,-25.5747}, extent = {{-12,-12},{12,12}})));
      parameter Modelica.SIunits.Angle alphamin = 1 annotation(Placement(transformation(origin = {-39.6552,-28.4483}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Atan2 atan21 annotation(Placement(transformation(origin = {5.5482,11.1651}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.DeMultiplex3 demultiplex31 annotation(Placement(transformation(origin = {-32.8766,10.8778}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.MatrixGain matrixgain1(K = [-1,0,0;0,-1,0;0,0,-1]) annotation(Placement(transformation(origin = {-66.092,10.6322}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {2.2792,-99.71510000000001}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,-100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {-0.569801,99.14530000000001}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativeposition1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.world) annotation(Placement(transformation(origin = {-100.968,10.3006}, extent = {{12,-12},{-12,12}}, rotation = 90)));
    equation
      connect(relativeposition1.frame_a,frame_a) annotation(Line(points={{
              -100.968,22.3006},{-100.968,22.3006},{-100.968,-87.1795},{3.1339,
              -87.1795},{3.1339,-99.7151},{2.2792,-99.7151}}));
      connect(relativeposition1.frame_b,frame_b) annotation(Line(points={{
              -100.968,-1.6994},{-100.968,17.1282},{-100.968,83.7607},{0,
              83.7607},{0,99.1453},{-0.569801,99.1453}}));
      connect(demultiplex31.y2[1],atan21.u1) annotation(Line(points = {{-19.6766,10.8778},{-13.5327,10.8778},{-13.5327,18.2876},{-8.851800000000001,18.2876},{-8.851800000000001,18.3651}}));
      connect(demultiplex31.y1[1],atan21.u2) annotation(Line(points={{-19.6766,
              19.2778},{-15.5074,19.2778},{-15.5074,3.75774},{-8.8518,3.75774},
              {-8.8518,3.9651}}));
      connect(lessequalthreshold1.u,atan21.y) annotation(Line(points = {{28.4185,28.2051},{22.6324,28.2051},{22.6324,11.1676},{18.7482,11.1676},{18.7482,11.1651}}));
      connect(greaterthreshold1.u,atan21.y) annotation(Line(points = {{27.2789,-5.98537},{22.6324,-5.98537},{22.6324,11.1676},{18.7482,11.1676},{18.7482,11.1651}}));
      connect(to_deg1.u,atan21.y) annotation(Line(points = {{27.5638,-47.5783},{22.6324,-47.5783},{22.6324,11.1676},{18.7482,11.1676},{18.7482,11.1651}}));
      connect(lessequalthreshold1.y,and1.u1) annotation(Line(points = {{56.0185,28.2051},{59.6276,28.2051},{59.6276,3.1339},{64.2915,3.1339},{64.2915,3.4188}}));
      connect(greaterthreshold1.y,and1.u2) annotation(Line(points = {{54.8789,-5.98537},{62.931,-5.98537},{62.931,-6.1812},{64.2915,-6.1812}}));
      connect(and1.y,y) annotation(Line(points = {{91.89149999999999,3.4188},{98.0057,3.4188},{98.0057,3.4188},{107.407,3.4188}}));
      connect(relativeposition1.r_rel,matrixgain1.u) annotation(Line(points={{-87.768,
              10.3006},{-87.768,10.3006},{-80.492,10.3006},{-80.492,10.6322}}));
      connect(matrixgain1.y,demultiplex31.u) annotation(Line(points={{-52.892,
              10.6322},{-52.892,10.6322},{-47.2766,10.6322},{-47.2766,10.8778}}));
      connect(relativeposition1.frame_a,frame_a) annotation(Line(points={{
              -100.968,22.3006},{-100.968,22.3006},{-100.968,-87.1795},{3.1339,
              -87.1795},{3.1339,-99.7151},{2.2792,-99.7151}}));
      connect(relativeposition1.frame_b,frame_b) annotation(Line(points={{
              -100.968,-1.6994},{-100.968,-1.6994},{-100.968,83.7607},{0,
              83.7607},{0,99.1453},{-0.569801,99.1453}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points=  {{0,52},{0,82}}),Ellipse(extent=  {{-50,50},{50,-50}}),Rectangle(extent=  {{0,0},{53,53}}, lineColor=  {255,255,255}, fillColor=  {255,255,255},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-100,-100},{100,100}})}));
    end Ausloeser;

    model Schlinge2
      parameter Real c = 1 "Federkonstante";
      parameter Real d = 1 "Dämpfungskonstante";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {0,-100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,-100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Sensors.RelativeVelocity relativevelocity1 annotation(Placement(transformation(origin = {79.4872,13.3903}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativeposition1 annotation(Placement(transformation(origin = {57.5499,45.0142}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      PJlib.Kap17.AddVector addvector1(n = 3, k1 = -d, k2 = -c) annotation(Placement(transformation(origin = {5.98291,35.0427}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      PJlib.Kap17.MultScalarVector multscalarvector1(n = 3) annotation(Placement(transformation(origin = {-35.3276,17.094}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      Modelica.Mechanics.MultiBody.Forces.Force force1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
        forceDiameter=0,
        connectionLineDiameter=0.05,
        animation=false)                                                                                                     annotation(Placement(transformation(origin = {-76.0684,10.2564}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      Modelica.Blocks.Interfaces.BooleanInput u annotation(Placement(transformation(origin = {103,0}, extent = {{12,12},{-12,-12}}), iconTransformation(origin = {100,0}, extent = {{12,12},{-12,-12}})));
      Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(origin = {41.5954,-27.6353}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      Modelica.Blocks.Discrete.TriggeredSampler triggeredsampler1(y_start = 1) annotation(Placement(transformation(origin = {5.12821,-28.6353}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -180)));
    equation
      connect(u,triggeredsampler1.trigger) annotation(Line(points={{103,0},{
              5.41311,0},{5.41311,-14.4753},{5.12821,-14.4753}}));
      connect(triggeredsampler1.y,multscalarvector1.s) annotation(Line(points={{
              -8.07179,-28.6353},{-14.8148,-28.6353},{-14.8148,12.2507},{
              -22.9676,12.2507},{-22.9676,21.894}}));
      connect(const.y,triggeredsampler1.u) annotation(Line(points={{28.3954,
              -27.6353},{20.5128,-27.6353},{20.5128,-28.6353},{19.5282,-28.6353}}));
      connect(relativeposition1.frame_a,frame_a) annotation(Line(points = {{57.5499,57.0142},{57.5499,57.0142},{57.5499,86.0399},{-0.2849,86.0399},{-0.2849,100},{0,100}}));
      connect(relativeposition1.frame_b,frame_b) annotation(Line(points = {{57.5499,33.0142},{57.5499,33.0142},{57.5499,-76.6382},{0.2849,-76.6382},{0.2849,-100},{0,-100}}));
      connect(relativevelocity1.frame_a,frame_a) annotation(Line(points = {{79.4872,25.3903},{79.4872,25.3903},{79.4872,86.0399},{-0.2849,86.0399},{-0.2849,100},{0,100}}));
      connect(relativevelocity1.frame_b,frame_b) annotation(Line(points = {{79.4872,1.3903},{79.20229999999999,1.3903},{79.20229999999999,-76.6382},{0.2849,-76.6382},{0.2849,-100},{0,-100}}));
      connect(force1.frame_b,frame_b) annotation(Line(points = {{-76.0684,-1.7436},{-76.0684,-1.7436},{-76.0684,-76.6382},{0.2849,-76.6382},{0.2849,-100},{0,-100}}));
      connect(force1.frame_a,frame_a) annotation(Line(points = {{-76.0684,22.2564},{-76.3533,22.2564},{-76.3533,86.0399},{-0.2849,86.0399},{-0.2849,100},{0,100}}));
      connect(multscalarvector1.y,force1.force) annotation(Line(points={{
              -48.0476,17.094},{-59.8291,17.094},{-59.8291,17.4564},{-61.6684,
              17.4564}}));
      connect(addvector1.y,multscalarvector1.v) annotation(Line(points={{
              -6.73709,35.0427},{-14.8148,35.0427},{-14.8148,21.9373},{-22.9676,
              21.9373},{-22.9676,12.294}}));
      connect(addvector1.v2,relativeposition1.r_rel) annotation(Line(points={{18.3429,
              30.2427},{32.7635,30.2427},{32.7635,45.0142},{44.3499,45.0142}}));
      connect(addvector1.v1,relativevelocity1.v_rel) annotation(Line(points={{18.3429,
              39.8427},{33.3333,39.8427},{33.3333,13.3903},{66.2872,13.3903}}));
      annotation(Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Polygon(points=  {{0,97},{-11,66},{-45,34},{-51,7},{-55,-37},{-39,-78},{5,-89},{36,-89},{53,-78},{63,-58},{65,-17},{55,11},{35,42},{13,65},{6,75},{0,97}}, lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25)}), Diagram);
    end Schlinge2;

    model BodySphereWithSensor
      import Modelica.Constants.pi;
      parameter Length r = 1 "radius of the sphere";
      parameter Density rho = 7700 "density of the sphere";
      parameter Position[3] direction = {-0.95,0,0}
        "vector from CM to frame, scaled for r = 1";
      parameter Position x0 = 1 "Anfangsort, x";
      parameter Position y0 = 1 "Anfangsort, y";
      parameter Position z0 = 1 "Anfangsort, z";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {0,0,0}, m = 4 / 3 * rho * pi * r ^ 3, I_11 = 8 / 15 * rho * pi * r ^ 5, I_22 = 8 / 15 * rho * pi * r ^ 5, I_33 = 8 / 15 * rho * pi * r ^ 5,
        sphereDiameter=2*r,
        sphereColor={0,128,255},
        cylinderDiameter=0,
        r_0(fixed=true, start={x0,y0,z0}))                                                                                      annotation(Placement(transformation(origin = {-31.8034,-0.133903}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = r * direction) annotation(Placement(transformation(origin = {-68.661,-0.284901}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      Modelica.Blocks.Interfaces.RealOutput[3] y annotation(Placement(transformation(origin = {-30,100}, extent = {{12,-12},{-12,12}}, rotation = -90), iconTransformation(origin = {-30,100}, extent = {{12,-12},{-12,12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Sensors.AbsolutePosition absoluteposition1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(Placement(transformation(origin = {-49.8234,36.0342}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -270)));
    equation
      connect(absoluteposition1.frame_a,body1.frame_a) annotation(Line(points={{-49.8234,
              24.0342},{-50.1425,24.0342},{-50.1425,-0.2849},{-43.8034,-0.2849},{-43.8034,
              -0.133903}}));
      connect(fixedtranslation1.frame_a,body1.frame_a) annotation(Line(points={{-56.661,
              -0.284901},{-44.1595,-0.284901},{-44.1595,-0.133903},{-43.8034,-0.133903}}));
      connect(frame_a1,fixedtranslation1.frame_b) annotation(Line(points={{-100,0},{
              -80.9117,0},{-80.9117,-0.284901},{-80.661,-0.284901}}));
      connect(absoluteposition1.r,y);
      annotation(Icon(graphics={  Ellipse(lineColor=  {0,0,0}, fillColor=  {0,0,255}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.Sphere,
                lineThickness=                                                                                                    0.25, extent=  {{-93.78700000000001,67.4556},{34.6154,-62.7219}})}));
    end BodySphereWithSensor;

    model Aufprall
      Modelica.Blocks.Interfaces.RealInput[3] u annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Extractor extractor1(nin = 3) annotation(Placement(transformation(origin = {-54.416,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.LessEqualThreshold lessequalthreshold1 annotation(Placement(transformation(origin = {-11.9658,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.TerminateSimulation terminatesimulation1(condition = edge1.y, terminationText = "Aufprall") annotation(Placement(transformation(origin = {69.8005,-0.284921}, extent = {{-24,-2.4},{24,2.4}})));
      Modelica.Blocks.Logical.Edge edge1 annotation(Placement(transformation(origin = {23.9316,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.IntegerConstant integerconstant1(k = 2) annotation(Placement(transformation(origin = {-54.416,-45.0142}, extent = {{12,-12},{-12,12}}, rotation = 90)));
    equation
      connect(lessequalthreshold1.y,edge1.u) annotation(Line(points = {{1.2342,0},{9.116809999999999,0},{9.116809999999999,0},{9.53162,0}}));
      connect(integerconstant1.y,extractor1.index) annotation(Line(points = {{-54.416,-31.8142},{-54.416,-31.8142},{-54.416,-14.4},{-54.416,-14.4}}));
      connect(extractor1.y,lessequalthreshold1.u) annotation(Line(points = {{-41.216,0},{-27.3504,0},{-27.3504,0},{-26.3658,0}}));
      connect(u,extractor1.u) annotation(Line(points = {{-100,0},{-69.5157,0},{-69.5157,0},{-68.816,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points=  {{-90,-40},{90,-40}}),Ellipse(extent=  {{38,-39},{48,-29}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-100,-100},{100,100}})}));
    end Aufprall;
  end Kap17;

  package Kap18
    model TurboMachineT
      "machine that transfers energy between a rotor and a fluid"
      parameter SpecificHeatCapacity cp = 1005.45;
      parameter Temperature T0 = 298.15;
      parameter Mass K = 1 "pump constant";
      parameter Real epsi = 5 "compression";
      Thermo.Interfaces.FluidPort_a inflow annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
      Thermo.Interfaces.FluidPort_b outflow annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft annotation(Placement(transformation(extent = {{-10,90},{10,110}})));
      Modelica.Blocks.Interfaces.RealOutput Qdot annotation(Placement(transformation(extent = {{-10,-110},{10,-90}}, rotation = -90)));
      AngularVelocity omega;
    equation
      inflow.m_flow + outflow.m_flow = 0;
      inflow.H_flow = inflow.m_flow * inflow.h;
      omega = der(shaft.phi);
      outflow.h = inflow.h;
      inflow.m_flow = K * omega;
      outflow.p = epsi * inflow.p;
      Qdot = inflow.m_flow * (outflow.h - inflow.h) - omega * shaft.tau;
    end TurboMachineT;

    model PumpT
      extends TurboMachineT;
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Ellipse(extent=  {{-100,100},{100,-100}}, lineColor=  {0,0,0}),Line(points=  {{-77,64},{94,34}}, thickness=  1),Line(points=  {{-77,-64},{94,-34}}, thickness=  1)}));
    end PumpT;

    model TurbineT
      extends TurboMachineT;
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Line(points=  {{-100,40},{100,40},{60,-40},{-60,-40},{-100,40}}, thickness=  1),Line(points=  {{0,40},{0,100}}, thickness=  2),Line(points=  {{-100,0},{-80,0}}, thickness=  1),Line(points=  {{80,0},{100,0}}, thickness=  1)}));
    end TurbineT;

    model HeatExchanger3
      parameter Modelica.SIunits.ThermalConductance G = 1000 "Wärmeleitwert";
      Thermo.Interfaces.FluidPort_a waterOut annotation(Placement(transformation(origin = {-100,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,50}, extent = {{-12,-12},{12,12}})));
      Thermo.Interfaces.FluidPort_b waterIn annotation(Placement(transformation(origin = {100,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,50}, extent = {{-12,-12},{12,12}})));
      Thermo.Interfaces.FluidPort_a airOut annotation(Placement(transformation(origin = {100,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-40}, extent = {{-12,-12},{12,12}})));
      Thermo.Interfaces.FluidPort_b airIn annotation(Placement(transformation(origin = {-100,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,-40}, extent = {{-12,-12},{12,12}})));
      Thermo.SimpleWaterDevices.Heater heater1 annotation(Placement(transformation(origin = {-39.4268,60.1091}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Thermo.SimpleWaterDevices.Heater heater2 annotation(Placement(transformation(origin = {-0.110501,59.8242}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Thermo.SimpleWaterDevices.Heater heater3 annotation(Placement(transformation(origin = {38.351,60.3965}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Thermo.DryAirDevices.Heater heater5 annotation(Placement(transformation(origin = {-39.3678,-23.2758}, extent = {{-12,-12},{12,12}})));
      Thermo.DryAirDevices.Heater heater6 annotation(Placement(transformation(origin = {0.287399,-22.9885}, extent = {{-12,-12},{12,12}})));
      Thermo.DryAirDevices.Heater heater7 annotation(Placement(transformation(origin = {37.931,-22.9885}, extent = {{-12,-12},{12,12}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = G / 3) annotation(Placement(transformation(origin = {-39.3678,17.5287}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor2(G = G / 3) annotation(Placement(transformation(origin = {-1.3161e-06,17.5287}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor3(G = G / 3) annotation(Placement(transformation(origin = {38.2184,16.954}, extent = {{-12,12},{12,-12}}, rotation = -90)));
    equation
      connect(thermalconductor3.port_b,heater7.heat) annotation(Line(points = {{38.2184,4.95398},{38.2184,4.95403},{38.2184,-10.9885},{37.931,-10.9885}}));
      connect(heater3.heat,thermalconductor3.port_a) annotation(Line(points = {{38.351,48.3965},{38.5057,48.3965},{38.5057,28.954},{38.2184,28.954}}));
      connect(thermalconductor2.port_b,heater6.heat) annotation(Line(points = {{-1.3161e-06,5.52868},{0.287399,5.52868},{0.287399,-10.9885},{0.287399,-10.9885}}));
      connect(heater2.heat,thermalconductor2.port_a) annotation(Line(points = {{-0.110501,47.8242},{-3.32621e-07,47.8242},{-3.32621e-07,29.5287},{-1.3161e-06,29.5287}}));
      connect(thermalconductor1.port_b,heater5.heat) annotation(Line(points = {{-39.3678,5.52868},{-39.3678,5.52874},{-39.3678,-11.2758},{-39.3678,-11.2758}}));
      connect(heater1.heat,thermalconductor1.port_a) annotation(Line(points = {{-39.4268,48.1091},{-39.3679,48.1091},{-39.3679,29.5287},{-39.3678,29.5287}}));
      connect(airIn,heater7.outflow) annotation(Line(points = {{100,-60},{74.71259999999999,-60},{74.71259999999999,-23.2759},{49.931,-23.2759},{49.931,-22.9885}}));
      connect(heater6.outflow,heater7.inflow) annotation(Line(points = {{12.2874,-22.9885},{26.1494,-22.9885},{26.1494,-22.9885},{25.931,-22.9885}}));
      connect(heater5.outflow,heater6.inflow) annotation(Line(points = {{-27.3678,-23.2758},{-11.7816,-23.2758},{-11.7816,-22.9885},{-11.7126,-22.9885}}));
      connect(airOut,heater5.inflow) annotation(Line(points = {{-100,-60},{-73.8506,-60},{-73.8506,-23.2759},{-51.3678,-23.2759},{-51.3678,-23.2758}}));
      connect(heater2.inflow,heater3.outflow) annotation(Line(points = {{11.8895,59.8242},{26.7241,59.8242},{26.7241,60.3965},{26.351,60.3965}}));
      connect(heater3.inflow,waterOut) annotation(Line(points = {{50.351,60.3965},{76.3533,60.3965},{76.3533,50.4274},{100,50.4274},{100,50}}));
      connect(waterIn,heater1.outflow) annotation(Line(points = {{-100,50},{-75.2137,50},{-75.2137,60.114},{-51.4268,60.114},{-51.4268,60.1091}}));
      connect(heater1.inflow,heater2.outflow) annotation(Line(points = {{-27.4268,60.1091},{-12.6437,60.1091},{-12.6437,59.8242},{-12.1105,59.8242}}));
      annotation(Icon(graphics = {Rectangle(lineColor=  {0,0,0}, fillColor=  {255,0,0}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{-100,70.0855},{-36.1823,25.9259}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {255,85,0}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{-37.037,70.0855},{27.9202,25.9259}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {255,255,0}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{27.9202,70.0855},{100,25.9259}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {0,255,255}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{-100,-18.8034},{-35.8974,-63.2479}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {0,170,255}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{-35.8974,-18.8034},{26.4957,-63.2479}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,255}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{26.4957,-18.8034},{100,-63.2479}}),Line(points=  {{-56.9801,21.6524},{-56.9801,-11.1111}}, color=  {255,0,0}, pattern=  LinePattern.Solid, thickness=  5.25, smooth=  Smooth.Bezier),Line(points=  {{-5.41311,21.0826},{-5.41311,-10.8262}}, color=  {255,0,0}, pattern=  LinePattern.Solid, thickness=  5.25, smooth=  Smooth.Bezier),Line(points=  {{47.5783,20.5128},{47.5783,-11.396}}, color=  {255,0,0}, pattern=  LinePattern.Solid, thickness=  5.25, smooth=  Smooth.Bezier)}));
    end HeatExchanger3;

    model HeatExchanger
      parameter Modelica.SIunits.ThermalConductance G = 1000 "Wärmeleitwert";
      parameter Integer N = 5 "Zahl der Unterteilungen";
      Thermo.Interfaces.FluidPort_a waterIn annotation(Placement(transformation(origin = {-100,47}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,47}, extent = {{-12,-12},{12,12}})));
      Thermo.Interfaces.FluidPort_b waterOut annotation(Placement(transformation(origin = {100,47}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,47}, extent = {{-12,-12},{12,12}})));
      Thermo.Interfaces.FluidPort_a airIn annotation(Placement(transformation(origin = {100,-47}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-47}, extent = {{-12,-12},{12,12}})));
      Thermo.Interfaces.FluidPort_b airOut annotation(Placement(transformation(origin = {-100,-47}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,-47}, extent = {{-12,-12},{12,12}})));
      Modelica.SIunits.SpecificEnthalpy[N + 1] hW;
      Modelica.SIunits.SpecificEnthalpy[N + 1] hA;
      Modelica.SIunits.HeatFlowRate[N] Qdot;
      replaceable Thermo.Media.DryAir[N + 1] airMed constrainedby
        Thermo.Media.PartialMedium;
      replaceable Thermo.Media.SimpleWater[N + 1] waterMed constrainedby
        Thermo.Media.PartialMedium;
    equation
      waterIn.m_flow + waterOut.m_flow = 0;
      airIn.m_flow + airOut.m_flow = 0;
      waterIn.H_flow = waterIn.m_flow * waterIn.h;
      airIn.H_flow = airIn.m_flow * airIn.h;
      waterOut.p = waterIn.p;
      airOut.p = airIn.p;
      waterOut.h = waterMed[N + 1].h;
      waterIn.h = waterMed[1].h;
      airOut.h = airMed[1].h;
      airIn.h = airMed[N + 1].h;
      for i in 1:N loop
      hW[i + 1] = hW[i] - Qdot[i] / waterIn.m_flow;
      hA[i] = hA[i + 1] + Qdot[i] / airIn.m_flow;
      Qdot[i] = G / N * (waterMed[i + 1].T - airMed[i].T);

      end for;
      for i in 1:N + 1 loop
      waterMed[i].p = waterIn.p;
      airMed[i].p = airIn.p;
      waterMed[i].h = hW[i];
      airMed[i].h = hA[i];

      end for;
      annotation(Icon(graphics = {Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {255,0,0}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{-100,70},{-33,26}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {255,85,0}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{-33,70},{33,26}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {255,255,0}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{33,70},{100,26}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {0,255,255}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{-100,-26},{-33,-70}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {0,170,255}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{-33,-26},{33,-70}}),Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,255}, pattern=  LinePattern.Solid, fillPattern=  FillPattern.Solid, lineThickness=  0.25, extent=  {{33,-26},{100,-70}}),Line(points=  {{-66,16},{-66,-16}}, color=  {255,0,0}, thickness=  5.25),Line(points=  {{-61,-10},{-66,-16},{-71,-10}}, color=  {255,0,0}, thickness=  5.25),Line(points=  {{0,16},{0,-16}}, color=  {255,0,0}, thickness=  5.25),Line(points=  {{-5,-10},{0,-16},{5,-10}}, color=  {255,0,0}, thickness=  5.25),Line(points=  {{66,16},{66,-16}}, color=  {255,0,0}, thickness=  5.25),Line(points=  {{61,-10},{66,-16},{71,-10}}, color=  {255,0,0}, thickness=  5.25)}));
    end HeatExchanger;
  end Kap18;
  annotation (uses(Modelica(version="3.2.1"), Thermo));
end PJLoeslib;
