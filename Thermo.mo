within ;
package Thermo "small library for thermodynamical processes"

  import Modelica.SIunits.*;

  package Interfaces

    connector StateCon "outputs thermodynamical state variables"
      output Pressure p;
      output SpecificVolume v;
      output Temperature T;
      output SpecificEnthalpy h;
      output SpecificEntropy s;
      output Real x;

      annotation (
      Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-10,-10},{10,10}})),
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-10,-10},{10,10}}),
           graphics={
        Ellipse(extent={{-10,-10},{10,10}},
         lineColor={0,0,0})}));
    end StateCon;

    connector StateConIn "inputs thermodynamical state variables"
      input Pressure p;
      input SpecificVolume v;
      input Temperature T;
      input SpecificEnthalpy h;
      input SpecificEntropy s;
      input Real x;

      annotation (
      Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-10,-10},{10,10}})),
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-10,-10},{10,10}}),
           graphics={
        Ellipse(extent={{-10,-10},{10,10}},
         lineColor={0,0,0})}));
    end StateConIn;

    connector FluidPort
      Pressure p;
      flow MassFlowRate m_flow;
      SpecificEnthalpy h;
      flow EnthalpyFlowRate H_flow;
    end FluidPort;

    connector FluidPort_a "flow port that is used for inflow"
      extends FluidPort;
      annotation (
        Diagram(coordinateSystem(
                  preserveAspectRatio = true,
                  extent = {{-100,-100},{100,100}}),
                graphics={
                  Ellipse(
                    extent = {{-40,-40},{40,40}},
                    lineColor = {0,0,0},
                    fillPattern = FillPattern.Solid,
                    fillColor = {0,127,255})}),
        Icon(coordinateSystem(
               preserveAspectRatio = true,
               extent = {{-100,-100},{100,100}}),
             graphics={
               Ellipse(
                 extent = {{-100,-100},{100,100}},
                 lineColor = {0,0,0},
                 fillPattern = FillPattern.Solid,
                 fillColor = {0,127,255})}));
    end FluidPort_a;

    connector FluidPort_b "flow port that is used for outflow"
      extends FluidPort;
        annotation (
          Diagram(coordinateSystem(
                    preserveAspectRatio = true,
                    extent = {{-100,-100},{100,100}}),
                  graphics={
                    Ellipse(
                      extent = {{-40,-40},{40,40}},
                      lineColor = {0,0,0},
                      fillPattern = FillPattern.Solid,
                      fillColor = {0,63,127})}),
          Icon(coordinateSystem(
                 preserveAspectRatio = true,
                 extent = {{-100,-100},{100,100}}),
               graphics={
                 Ellipse(
                   extent = {{-100,-100},{100,100}},
                   lineColor = {0,0,0},
                   fillPattern = FillPattern.Solid,
                   fillColor = {0,63,127})}));
    end FluidPort_b;

  end Interfaces;

////////////////////////////////////////////////////////////////////////////////

  package SimpleVersion "simple thermo-fluid models without medium model"

    model Cylinder "cylinder containing ideal gas"
      parameter Mass m = 0.002 "mass of gas in the cylinder";
      parameter Area A = 0.01 "area of cylinder cross section";
      parameter Volume V0 = 1e-3 "cylinder volume at s = 0";
      parameter SpecificHeatCapacity Ri = 287.2 "specific gas constant";
      parameter SpecificHeatCapacity cV = 717.1 "heat capacity, V constant";
      parameter SpecificHeatCapacity cp = cV + Ri "heat capacity, p constant";
      parameter Temperature T0 = 273.15 "reference temperature";
      parameter Pressure p0 = 101325 "reference pressure";
      parameter InternalEnergy U0 = 0 "inner energy at reference point";

      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a in_th annotation (
          Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_b piston annotation (
          Placement(transformation(
        extent = {{90, -10},{110, 10}})));
      Interfaces.StateCon out_state annotation (Placement(transformation(
        extent = {{-35, 50},{-15, 70}})));

      Pressure p;
      Volume V;
      Temperature T;
      SpecificEntropy s;
      InternalEnergy U;
      SpecificEnthalpy h;
      HeatFlowRate Qdot;
      Force F;
      Position sP;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true,
             extent={{-100,-100},{100,100}}),
             graphics={
               Line(points={{60,60},{-90,60},{-90,-60},{60,-60}}),
               Line(points={{20,60},{20,-60}}),
               Line(points={{20,0},{100,0}}),
               Rectangle(extent={{-90,-60},{20,60}},
                 lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={83,233,255})}));
    equation
      Qdot = in_th.Q_flow;
      T = in_th.T;
      F = piston.f;
      sP = piston.s;
      p*V = m*Ri*T;
      s = cp*Modelica.Math.log(T/T0) - Ri*Modelica.Math.log(p/p0);
      U = U0 + m*cV*(T - T0);
      h = cp*(T - T0) + U0/m + Ri*T0;
      V = V0 + A*sP;
      F = p*A;
      der(U) = Qdot - p*der(V);
      out_state.p = p;
      out_state.T = T;
      out_state.v = V/m;
      out_state.s = s;
      out_state.h = h;
      out_state.x = 1;
    end Cylinder;

    model TurboMachine
      "machine that transfers energy between a rotor and a fluid"
      parameter Mass K = 1 "pump constant";
      parameter SpecificHeatCapacity Ri = 287.2;
      parameter SpecificHeatCapacity cp = 1005.45;
      parameter Temperature T0 = 298.15;
      parameter Pressure p0 = 101325;

      Interfaces.FluidPort_a inflow annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Interfaces.FluidPort_b outflow annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}})));

      AngularVelocity omega;
      Entropy s;
      Temperature Tin, Tout;
    equation
      inflow.m_flow + outflow.m_flow = 0;
      inflow.H_flow = inflow.m_flow*inflow.h;
      omega = der(shaft.phi);
      inflow.h = cp*(Tin - T0);
      outflow.h = inflow.h + omega*shaft.tau/inflow.m_flow;
      s = cp*Modelica.Math.log(Tin/T0) - Ri*Modelica.Math.log(inflow.p/p0);
      outflow.h = cp*(Tout - T0);
      s = cp*Modelica.Math.log(Tout/T0) - Ri*Modelica.Math.log(outflow.p/p0);
      inflow.m_flow = K*omega;
    end TurboMachine;

    model Pump
      extends TurboMachine;
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
      Ellipse(extent={{-100,100},{100,-100}},
       lineColor={0,0,0}),
             Line(points={{-77,64},{94,34}},
    thickness=1,
    color={0,0,0}),
             Line(points={{-77,-64},{94,-34}},
    thickness=1,
    color={0,0,0})}));
    end Pump;

    model Turbine
      extends TurboMachine;
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
             Line(points={{-100,40},{100,40},{60,-40},{-60,-40},{-100,40}},
    thickness=1,
    color={0,0,0}),
             Line(points={{0,40},{0,100}},
    thickness=2,
    color={0,0,0}),
             Line(points={{-100,0},{-80,0}},
    thickness=1,
    color={0,0,0}),
             Line(points={{80,0},{100,0}},
    thickness=1,
    color={0,0,0})}));
    end Turbine;

    model Heater "machine that transfers heat to a fluid"
      parameter SpecificHeatCapacity cp = 1005.45;
      parameter Temperature T0 = 298.15;

      Interfaces.FluidPort_a inflow annotation (Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Interfaces.FluidPort_b outflow annotation (Placement(transformation(
        extent = {{90, -10},{110, 10}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heat annotation (
          Placement(transformation(
        extent = {{-10, 90},{10, 110}})));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
             Line(points={{-100,0},{0,100},{0,-100},{100,0}},
    thickness=1,
    color={0,0,0}),
             Rectangle(extent={{-100,-100},{100,100}},
         lineColor={0,0,0},
         lineThickness=1)}));
    equation
      inflow.m_flow + outflow.m_flow = 0;
      inflow.H_flow = inflow.m_flow*inflow.h;
      outflow.p = inflow.p;
      outflow.h = inflow.h + heat.Q_flow/inflow.m_flow;
      outflow.h = cp*(heat.T - T0);
    end Heater;

    model FluidSource "creates a given mass flow of a fluid with given state"
      parameter MassFlowRate m_flow = 1.0 "mass flow out of the source";
      parameter Pressure p = 1e5;
      parameter Temperature T = 300;
      parameter SpecificHeatCapacity cp = 1005.45;
      parameter Temperature T0 = 298.15;

      Interfaces.FluidPort_b outflow annotation(Placement(transformation(
        extent = {{40, -10},{60, 10}})));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
        Ellipse(extent={{-50,-50},{50,50}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={0,127,255}),
               Polygon(points={{-30,10},{20,10},{20,20},{40,0},
          {20,-20},{20,-10},{-30,-10}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={180,0,0})}));
    equation
      outflow.m_flow = -m_flow;
      outflow.p = p;
      outflow.h = cp*(T - T0);
    end FluidSource;

    model FluidSink "end point of flow"
      Interfaces.FluidPort_a inflow annotation(Placement(transformation(
        extent = {{-60, -10},{-40, 10}})));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
        Ellipse(extent={{-50,-50},{50,50}},
         lineColor={0,0,0})}));
    equation
      inflow.H_flow = inflow.m_flow*inflow.h;
    end FluidSink;

    model StateMeasurement "returns state variables as signal output"
      parameter SpecificHeatCapacity Ri = 287.2;
      parameter SpecificHeatCapacity cp = 1005.45;
      parameter Temperature T0 = 298.15;
      parameter Pressure p0 = 101325;

      Interfaces.FluidPort_a inflow annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Interfaces.StateCon state annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));

      Pressure p;
      Temperature T;
      SpecificVolume v;
      SpecificEntropy s;
      SpecificEnthalpy h;
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
             Line(points={{-70,0},{-90,0}}, color={0,0,0}),
             Line(points={{70,0},{100,0}}, color={0,0,127}),
             Text(extent={{150,80},{-150,120}},
    textString="%name",
    lineColor={0,0,255}),
             Ellipse(extent={{-70,70},{70,-70}},
       lineColor={0,0,0},
       fillColor={255,255,255},
       fillPattern=FillPattern.Solid),
             Line(points={{0,70},{0,40}}, color={0,0,0}),
             Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),
             Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),
             Line(points={{37.6,13.7},{65.8,23.9}}, color={0,0,0}),
             Line(points={{-37.6,13.7},{-65.8,23.9}}, color={0,0,0}),
             Line(points={{0,0},{9.02,28.6}}, color={0,0,0}),
             Polygon(points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}},
       lineColor={0,0,0},
       fillColor={0,0,0},
       fillPattern=FillPattern.Solid),
             Ellipse(extent={{-5,5},{5,-5}},
       lineColor={0,0,0},
       fillColor={0,0,0},
       fillPattern=FillPattern.Solid)}));
    equation
      inflow.m_flow = 0;
      inflow.H_flow = 0;
      p = inflow.p;
      h = inflow.h;
      h = cp*(T - T0);
      p*v = Ri*T;
      s = cp*Modelica.Math.log(T/T0) - Ri*Modelica.Math.log(p/p0);
      state.p = p;
      state.T = T;
      state.v = v;
      state.s = s;
      state.h = h;
      state.x = 1;
    end StateMeasurement;

    model PressureSensor "extract the pressure as signal"
      Interfaces.StateConIn state annotation (Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Modelica.Blocks.Interfaces.RealOutput p annotation (Placement(
            transformation(
        extent = {{90, -10},{110, 10}})));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
             Line(points={{-70,0},{-90,0}}, color={0,0,0}),
             Line(points={{70,0},{100,0}}, color={0,0,127}),
             Text(extent={{150,80},{-150,120}},
    textString="%name",
    lineColor={0,0,255}),
             Ellipse(extent={{-70,70},{70,-70}},
       lineColor={0,0,0},
       fillColor={255,255,255},
       fillPattern=FillPattern.Solid),
             Line(points={{0,70},{0,40}}, color={0,0,0}),
             Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),
             Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),
             Line(points={{37.6,13.7},{65.8,23.9}}, color={0,0,0}),
             Line(points={{-37.6,13.7},{-65.8,23.9}}, color={0,0,0}),
             Line(points={{0,0},{9.02,28.6}}, color={0,0,0}),
             Polygon(points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}},
       lineColor={0,0,0},
       fillColor={0,0,0},
       fillPattern=FillPattern.Solid),
             Ellipse(extent={{-5,5},{5,-5}},
       lineColor={0,0,0},
       fillColor={0,0,0},
       fillPattern=FillPattern.Solid)}));
    equation
      p = state.p;
    end PressureSensor;

  end SimpleVersion;

////////////////////////////////////////////////////////////////////////////////

  package Auxiliary

    model ThermoSwitch "routes one of two thermal input ports to the output"
      parameter ThermalConductance G = 1
        "conductance of unused port to reference point";
      parameter Temperature Tref = 300
        "temperature of reference point for unused port";

      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thIn1 annotation (
          Placement(transformation(
      extent = {{-110, 50},{-90, 70}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thIn2 annotation (
          Placement(transformation(
      extent = {{-110, -70},{-90, -50}})));
      Modelica.Blocks.Interfaces.BooleanInput control annotation (Placement(
            transformation(
      extent = {{-10, -110},{10, -90}}, rotation = 90)));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b thOut annotation (
          Placement(transformation(
      extent = {{90, -10},{110, 10}})));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}),
          graphics={
             Rectangle(
               extent={{-90,100},{90,-100}},
               lineColor={0,0,0},
               fillColor={192,192,192},
               fillPattern=FillPattern.Forward,
               lineThickness=1),
             Line(points={{-100,60},{-38,60}},thickness=1,color={255,0,0}),
             Line(points={{-38,60},{-6,6}},thickness=1,color={255,0,0}),
             Line(points={{-100,-60},{-38,-60}},thickness=1,color={255,0,0}),
             Line(points={{-38,-60},{-6,-6}},thickness=1,color={255,0,0}),
             Line(points={{8,0},{100,0}},thickness=1,color={255,0,0}),
             Line(points={{0,-100},{0,-8}},thickness=1,color={255,0,255}),
             Ellipse(
               extent={{8,8},{-8,-8}},
               lineColor={255,0,0})}));
    equation
      if control then
        thOut.T = thIn1.T;
        thOut.Q_flow = -thIn1.Q_flow;
        thIn2.Q_flow = G*(thIn2.T - Tref);
      else
        thOut.T = thIn2.T;
        thOut.Q_flow = -thIn2.Q_flow;
        thIn1.Q_flow = G*(thIn1.T - Tref);
      end if;
    end ThermoSwitch;

    model EqualConstantI
      "output is true, if integer input is equal to parameter"
      parameter Integer k = 0;

      Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
            transformation(
      extent = {{-110, -10},{-90, 10}})));
      Modelica.Blocks.Interfaces.BooleanOutput y annotation (Placement(
            transformation(
      extent = {{90, -10},{110, 10}})));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}),
          graphics={
            Rectangle(
              extent={{-90,100},{90,-100}},
              lineColor={0,0,0},
              lineThickness=1),
            Text(
              extent={{-80,-50},{80,50}},
              lineColor={0,0,0},
              textString=" == k")}));
    equation
      y = (u == k);
    end EqualConstantI;

    model TimedModuloCounter
      parameter Modelica.SIunits.Time T = 1;
      parameter Integer N = 5;
      parameter Integer offset = 0;

      Modelica.Blocks.Interfaces.IntegerOutput n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
             Line(points={{-60,-60},{-20,-60},{-20,0},{20,0},{20,60},
     {60,60},{60,-60}},
    thickness=1,
    color={0,0,0}),
             Rectangle(extent={{-100,-100},{100,100}},
         lineColor={0,0,0},
         lineThickness=1)}));
    equation
      n = mod(integer(time/T), N) + offset;
    end TimedModuloCounter;

    block Rescale "linear rescaling from s to t"
      parameter Real smin = 0;
      parameter Real smax = 1;
      parameter Real tmin = -10;
      parameter Real tmax = 10;

      Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
            transformation(
      extent = {{-110, -10},{-90, 10}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(
            transformation(
      extent = {{90, -10},{110, 10}})));
      annotation (
    Icon(coordinateSystem(preserveAspectRatio=true,
                          extent={{-100,-100},{100,100}}),
         graphics={
              Rectangle(
                extent={{-90,100},{90,-100}},
                lineColor={0,0,0},
                lineThickness=1),
              Line(
                points={{-80,0},{80,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{0,-80},{0,80}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-80,-30},{80,60}},
                color={0,0,0},
                thickness=1),
             Ellipse(
                extent={{-58.3,-20},{-48.3,-10}},
                lineColor={0,0,255}),
              Ellipse(
                extent={{35,32.5},{45,42.5}},
                lineColor={0,0,255}),
              Text(
                extent={{-150,-100},{150,-160}},
                lineColor={0,0,255},
                textString="%name")}));
    equation
      y = (tmax - tmin)/(smax - smin)*(u - smin) + tmin;
    end Rescale;

  end Auxiliary;

////////////////////////////////////////////////////////////////////////////////

  package Media

    import Modelica.Math.log;

    partial model PartialMedium
      "base class for a simple medium with one component"
      parameter Pressure pStart = 1.0e5;
      parameter Temperature TStart = 300;

      Pressure p(start=pStart);  // iteration start values for inverse relations
      Temperature T(start=TStart);
      SpecificVolume v;
      SpecificEnthalpy h;
      SpecificInternalEnergy u;
      SpecificEntropy s;
      Real x "dryness fraction";
    end PartialMedium;

    model SimpleAir "Air as a perfect gas"
      extends PartialMedium;
      parameter MolarMass M = 0.0289651159 "molar mass";
      parameter SpecificHeatCapacity Ri = Modelica.Constants.R/M;
      parameter SpecificHeatCapacity cp = 1005.45
        "specific heat capacity for constant pressure";
      parameter Temperature T0 = 298.15 "reference temperature = 25°C";
      parameter Pressure p0 = 101325 "reference pressure";
    equation
      p*v = Ri*T;
      h = cp*(T - T0);
      u = h - Ri*T;
      s = cp*log(T/T0) - Ri*log(p/p0);
      x = 1;          // pure gas
    end SimpleAir;

    model DryAir "Air with cp(T) using NASA Glenn Coefficients"
      extends PartialMedium;
      constant MolarMass M = 0.0289651159 "molar mass";
      constant SpecificHeatCapacity Ri = Modelica.Constants.R/M;
      constant Pressure p0 = 101325;
      constant Temperature Tlimit = 1000;
      constant Real alow[:]={10099.5016,-196.827561,5.00915511,-0.00576101373,
          1.06685993e-005,-7.94029797e-009,2.18523191e-012};
      constant Real ahigh[:]={241521.443,-1257.8746,5.14455867,-0.000213854179,
          7.06522784e-008,-1.07148349e-011,6.57780015e-016};
      constant Real blow[:] =  {-176.796731,-3.921504225};
      constant Real bhigh[:] = {6462.26319,-8.147411905};
    equation
      p*v = Ri*T;
      u = h - Ri*T;
      x = 1;    // pure gas
      h = smooth(0, (if T < Tlimit then Ri*
      ((-alow[1] + T*(blow[1] + alow[2]*log(T) + T*(1.*alow[3]
      + T*(0.5*alow[4] + T*(1/3*alow[5] + T*(0.25*alow[6]
      + 0.2*alow[7]*T))))))/T) else Ri*
      ((-ahigh[1] + T*(bhigh[1] + ahigh[2]*log(T)
    + T*(1.*ahigh[3] + T*(0.5*ahigh[4] + T*(1/3*ahigh[5]
           + T*(0.25*ahigh[6] + 0.2*ahigh[7]*T))))))/T)));
      s = noEvent(
        if T < Tlimit then
          Ri*(blow[2] - 0.5*alow[1]/(T*T) - alow[2]/T + alow[3]*log(T)
       + T*(alow[4] + T*(0.5*alow[5]+ T*(1/3*alow[6] + 0.25*alow[7]*T)))) else
        Ri*
      (bhigh[2] - 0.5*ahigh[1]/(T*T) - ahigh[2]/T + ahigh[3]*log(T)
       + T*(ahigh[4] + T*(0.5*ahigh[5] + T*(1/3*ahigh[6]
              + 0.25*ahigh[7]*T))))) - Ri*log(p/p0);
    end DryAir;

    model SimpleWater "Water as ideal liquid or ideal gas. The saturation curve p(T) is
      computed using the Clausius-Clapeyron equation with a constant enthalpy
      of evaporation r and neglecting v'."
      extends PartialMedium;

      constant MolarMass M = 0.01801528 "molar mass";
      constant SpecificHeatCapacity Ri = Modelica.Constants.R/M
        "specific gas constant";
      constant SpecificEnthalpy r = 2.2564e6 "enthalpy of evaporation";
      constant SpecificHeatCapacity cW = 4180.6
        "specific heat capacity of liquid";
      constant SpecificHeatCapacity cD = 2079.8 "specific heat capacity of gas";
      constant Temperature Tt = 273.16 "temperature at triple point";
      constant SpecificVolume vW = 1.003e-3 "specific volume of liquid";
      constant Real a = -4.816592215068932e+03
        "coefficient of saturation curve";
      constant Real b = 24.418419255600753 "coefficient of saturation curve";

      Temperature TS(start = 300) "saturation temperature for given pressure";
      SpecificEnthalpy hp "specific enthalpy of fluid on the saturation curve";
    equation
      TS = a/(log(p) - b);
      hp = cW*(TS - Tt) + vW*p;
      u = h - p*v;
      x = noEvent(
        if h < hp then
          0 elseif h > hp + r then 1 else (
    h - hp)/r);
      T = noEvent(
        if h < hp then (
    h - vW*p)/cW + Tt elseif h > hp + r then (
    h - vW*p - r + cW*Tt - (cW - cD)*TS)/cD else TS);
      v = noEvent(
        if h < hp then vW elseif h > hp + r then Ri*T/p else vW + x*(Ri*TS/p -
        vW));
      s = noEvent(if h < hp then cW*log(T/Tt) elseif h > hp + r then
          cD*log(T) - cW*log(Tt) + (r/a)*(log(p)-b) + (cW - cD)*log(a/(log(p)-b)) else cW
        *log(TS/Tt) + x*r/TS);
    end SimpleWater;

    model SimpleWater2
      "Version of SimpleWater using functions for the state equations"
      extends PartialMedium;

      constant MolarMass M = 0.01801528 "molar mass";
      constant SpecificHeatCapacity Ri = Modelica.Constants.R/M
        "specific gas constant";
      constant SpecificEnthalpy r = 2.2564e6 "enthalpy of evaporation";
      constant SpecificHeatCapacity cW = 4180.6
        "specific heat capacity of liquid";
      constant SpecificHeatCapacity cD = 2079.8 "specific heat capacity of gas";
      constant Temperature Tt = 273.16 "temperature at triple point";
      constant SpecificVolume vW = 1.003e-3 "specific volume of liquid";
      constant Real a = -4.816592215068932e+03
        "coefficient of saturation curve";
      constant Real b = 24.418419255600753 "coefficient of saturation curve";

      function saturationTemperature
        "saturation temperature for given pressure"
        input Pressure p;
        output Temperature TS;
      algorithm
        TS := a/(log(p) - b);
      end saturationTemperature;

      function saturationEnthalpy
        "specific enthalpy of fluid on the saturation curve"
        input Pressure p;
        output SpecificEnthalpy hp;
      algorithm
        hp := cW*(saturationTemperature(p) - Tt) + vW*p;
      end saturationEnthalpy;

      function temperature_PH "temperature for given p and h"
        input Pressure p;
        input SpecificEnthalpy h;
        output Temperature T;
      protected
        Temperature TS;
        SpecificEnthalpy hp;
      algorithm
        TS := saturationTemperature(p);
        hp := saturationEnthalpy(p);
        if h < hp then
          T := (h - vW*p)/cW + Tt;
        elseif h > hp + r then
          T := (h - vW*p - r + cW*Tt - (cW - cD)*TS)/cD;
        else
          T := TS;
        end if;
      end temperature_PH;

      function drynessFraction_PH "dryness fraction for given p and h"
        input Pressure p;
        input SpecificEnthalpy h;
        output Real x;
      protected
        SpecificEnthalpy hp;
      algorithm
        hp := saturationEnthalpy(p);
        if h < hp then
          x := 0;
        elseif h > hp + r then
          x := 1;
        else
          x := (h - hp)/r;
        end if;
      end drynessFraction_PH;

      function specificVolume_PH "specific volume for given p and h"
        input Pressure p;
        input SpecificEnthalpy h;
        output SpecificVolume v;
      protected
        Temperature TS;
        SpecificEnthalpy hp;
      algorithm
        TS := saturationTemperature(p);
        hp := saturationEnthalpy(p);
        if h < hp then
          v := vW;
        elseif h > hp + r then
          v := Ri*temperature_PH(p, h)/p;
        else
          v := vW + (h - hp)/r*(Ri*TS/p - vW);
        end if;
      end specificVolume_PH;

      function specificEntropy_PH "specific entropy for given p and h"
        input Pressure p;
        input SpecificEnthalpy h;
        output SpecificEntropy s;
      protected
        Temperature TS;
        SpecificEnthalpy hp;
        Temperature T;
      algorithm
        TS := saturationTemperature(p);
        hp := saturationEnthalpy(p);
        T := temperature_PH(p, h);
        if h < hp then
          s := cW*log(T/Tt);
        elseif h > hp + r then
          s := cW*log(TS/Tt) + r/TS + cD*log(T/TS);
        else
          s := cW*log(TS/Tt) + (h - hp)/TS;
        end if;
      end specificEntropy_PH;

    equation
      T = temperature_PH(p,h);
      x = drynessFraction_PH(p,h);
      v = specificVolume_PH(p,h);
      s = specificEntropy_PH(p,h);
      u = h - p*v;
    end SimpleWater2;

  end Media;

////////////////////////////////////////////////////////////////////////////////

  package Devices

    model Cylinder "cylinder containing ideal gas"
      parameter Mass m = 0.002 "mass of gas in the cylinder";
      parameter Area A = 0.01 "area of cylinder cross section";
      parameter Volume V0 = 1e-3 "cylinder volume at s = 0";

      replaceable Media.SimpleAir medium constrainedby Media.PartialMedium;

      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a in_th annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_b piston annotation (
          Placement(transformation(
        extent = {{90, -10},{110, 10}})));
      Interfaces.StateCon out_state annotation(Placement(transformation(
        extent = {{-35, 50},{-15, 70}})));

      Pressure p;
      Volume V;
      Temperature T;
      InternalEnergy U;
      HeatFlowRate Qdot;
      Force F;
      Position sP;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true,
             extent={{-100,-100},{100,100}}),
             graphics={
               Line(points={{60,60},{-90,60},{-90,-60},{60,-60}}),
               Line(points={{20,60},{20,-60}}),
               Line(points={{20,0},{100,0}}),
               Rectangle(extent={{-90,-60},{20,60}},
     lineColor={0,0,0},
     fillPattern=FillPattern.Solid,fillColor={83,233,255})}));
    equation
      Qdot = in_th.Q_flow;
      T = in_th.T;
      F = piston.f;
      sP = piston.s;
      p = medium.p;
      T = medium.T;
      U = m*medium.u;
      V = m*medium.v;
      V = V0 + A*sP;
      F = p*A;
      der(U) = Qdot - p*der(V);
      out_state.p = p;
      out_state.T = T;
      out_state.v = V/m;
      out_state.s = medium.s;
      out_state.h = medium.h;
      out_state.x = 1;
    end Cylinder;

    model TurboMachine
      "machine that transfers energy between a rotor and a fluid"
      parameter Mass K = 0.001 "pump constant";

      Interfaces.FluidPort_a inflow annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Interfaces.FluidPort_b outflow annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}})));

      replaceable Media.SimpleAir mediumIn constrainedby Media.PartialMedium
        annotation (choices(
          choice(redeclare Media.DryAir medium "Luft mit cp(T)"),
          choice(redeclare Media.SimpleAir medium "Luft mit konstantem cp")));
      replaceable Media.SimpleAir mediumOut constrainedby Media.PartialMedium
        annotation (choices(
          choice(redeclare Media.DryAir medium "Luft mit cp(T)"),
          choice(redeclare Media.SimpleAir medium "Luft mit konstantem cp")));
      AngularVelocity omega;
    equation
      inflow.m_flow + outflow.m_flow = 0;
      inflow.H_flow = inflow.m_flow*inflow.h;
      omega = der(shaft.phi);
      inflow.m_flow = K*omega;
      mediumIn.p = inflow.p;
      mediumIn.h = inflow.h;
      mediumOut.h = inflow.h + omega*shaft.tau/inflow.m_flow;
      mediumOut.s = mediumIn.s;
      outflow.h = mediumOut.h;
      outflow.p = mediumOut.p;
    end TurboMachine;

    model Pump
      extends TurboMachine;
    annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
      Ellipse(extent={{-100,100},{100,-100}},
       lineColor={0,0,0}),
             Line(points={{-77,64},{94,34}},
    thickness=1,
    color={0,0,0}),
             Line(points={{-77,-64},{94,-34}},
    thickness=1,
    color={0,0,0})}));
    end Pump;

    model Turbine
      extends TurboMachine;
    annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
             Line(points={{-100,40},{100,40},{60,-40},{-60,-40},{-100,40}},
    thickness=1,
    color={0,0,0}),
             Line(points={{0,40},{0,100}},
    thickness=2,
    color={0,0,0}),
             Line(points={{-100,0},{-80,0}},
    thickness=1,
    color={0,0,0}),
             Line(points={{80,0},{100,0}},
    thickness=1,
    color={0,0,0})}));
    end Turbine;

    model Heater "machine that transfers heat to a fluid"
      Interfaces.FluidPort_a inflow annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Interfaces.FluidPort_b outflow annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heat annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}})));

      replaceable Media.SimpleAir mediumIn constrainedby Media.PartialMedium
        annotation (choices(
          choice(redeclare Media.SimpleAir mediumIn "Luft mit konstantem cp"),
          choice(redeclare Media.DryAir mediumIn "Luft mit cp(T)")));
      replaceable Media.SimpleAir mediumOut constrainedby Media.PartialMedium
        annotation (choices(
          choice(redeclare Media.SimpleAir mediumIn "Luft mit konstantem cp"),
          choice(redeclare Media.DryAir mediumIn "Luft mit cp(T)")));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
             Line(points={{-100,0},{0,100},{0,-100},{100,0}},
    thickness=1,
    color={0,0,0}),
             Rectangle(extent={{-100,-100},{100,100}},
         lineColor={0,0,0},
         lineThickness=1)}));
    equation
      inflow.m_flow + outflow.m_flow = 0;
      inflow.H_flow = inflow.m_flow*inflow.h;
      mediumIn.p = inflow.p;
      mediumIn.h = inflow.h;
      mediumOut.p = mediumIn.p;
      mediumOut.h = mediumIn.h + heat.Q_flow/inflow.m_flow;
      outflow.p = mediumOut.p;
      outflow.h = mediumOut.h;
      heat.T = mediumOut.T;
    end Heater;

    model FluidSource "creates a given mass flow of a fluid with given state"
      parameter MassFlowRate m_flow = 0.1 "mass flow out of the source";
      parameter Pressure p = 1e5;
      parameter Temperature T = 300;

      replaceable Media.SimpleAir medium constrainedby Media.PartialMedium;

      Interfaces.FluidPort_b outflow annotation(Placement(transformation(
        extent = {{40, -10},{60, 10}})));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
        Ellipse(extent={{-50,-50},{50,50}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={0,127,255}),
               Polygon(points={{-30,10},{20,10},{20,20},{40,0},
          {20,-20},{20,-10},{-30,-10}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={180,0,0})}));
    equation
      outflow.m_flow = -m_flow;
      medium.p = p;
      medium.T = T;
      outflow.p = medium.p;
      outflow.h = medium.h;
    end FluidSource;

    model FluidSourcePH
      "creates a given mass flow of a fluid with given p and h"
      parameter MassFlowRate m_flow = 0.1 "mass flow out of the source";
      parameter Pressure p = 1e5;
      parameter SpecificEnthalpy h = 1e6;

      Interfaces.FluidPort_b outflow annotation(Placement(transformation(
        extent = {{40, -10},{60, 10}})));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
        Ellipse(extent={{-50,-50},{50,50}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={0,127,255}),
               Polygon(points={{-30,10},{20,10},{20,20},{40,0},
          {20,-20},{20,-10},{-30,-10}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={180,0,0})}));
    equation
      outflow.m_flow = -m_flow;
      outflow.p = p;
      outflow.h = h;
    end FluidSourcePH;

    model FluidSink "end point of flow"
      Interfaces.FluidPort_a inflow annotation(Placement(transformation(
        extent = {{-60, -10},{-40, 10}})));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
        Ellipse(extent={{-50,-50},{50,50}},
         lineColor={0,0,0})}));
    equation
      inflow.H_flow = inflow.m_flow*inflow.h;
    end FluidSink;

    model StateMeasurement "returns state variables as signal output"
      Interfaces.FluidPort_a inflow annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
      Interfaces.StateCon state annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));

      replaceable Media.SimpleAir medium constrainedby Media.PartialMedium
        annotation (choices(
        choice(redeclare Media.DryAir medium "Luft mit cp(T)"), choice(
              redeclare Media.SimpleAir medium "Luft mit konstantem cp")));
      annotation (
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-100,-100},{100,100}}),
           graphics={
             Line(points={{-70,0},{-90,0}}, color={0,0,0}),
             Line(points={{70,0},{100,0}}, color={0,0,127}),
             Text(extent={{150,80},{-150,120}},
    textString="%name",
    lineColor={0,0,255}),
             Ellipse(extent={{-70,70},{70,-70}},
       lineColor={0,0,0},
       fillColor={255,255,255},
       fillPattern=FillPattern.Solid),
             Line(points={{0,70},{0,40}}, color={0,0,0}),
             Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),
             Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),
             Line(points={{37.6,13.7},{65.8,23.9}}, color={0,0,0}),
             Line(points={{-37.6,13.7},{-65.8,23.9}}, color={0,0,0}),
             Line(points={{0,0},{9.02,28.6}}, color={0,0,0}),
             Polygon(points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}},
       lineColor={0,0,0},
       fillColor={0,0,0},
       fillPattern=FillPattern.Solid),
             Ellipse(extent={{-5,5},{5,-5}},
       lineColor={0,0,0},
       fillColor={0,0,0},
       fillPattern=FillPattern.Solid)}));
    equation
      inflow.m_flow = 0;
      inflow.H_flow = 0;
      medium.p = inflow.p;
      medium.h = inflow.h;
      state.p = medium.p;
      state.T = medium.T;
      state.v = medium.v;
      state.h = medium.h;
      state.s = medium.s;
      state.x = medium.x;
    end StateMeasurement;

  end Devices;

////////////////////////////////////////////////////////////////////////////////

  package DryAirDevices
    model Cylinder = Devices.Cylinder(redeclare Media.DryAir medium);
    model Pump = Devices.Pump(redeclare Media.DryAir mediumIn,
         redeclare Media.DryAir mediumOut);
    model Turbine = Devices.Turbine(redeclare Media.DryAir mediumIn,
        redeclare Media.DryAir mediumOut);
    model Heater = Devices.Heater(redeclare Media.DryAir mediumIn,
      redeclare Media.DryAir mediumOut);
    model FluidSource = Devices.FluidSource(redeclare Media.DryAir medium);
    model FluidSourcePH = Devices.FluidSourcePH;
    model FluidSink = Devices.FluidSink;
    model StateMeasurement = Devices.StateMeasurement (
                               redeclare Media.DryAir medium);
  end DryAirDevices;

  package SimpleWaterDevices
    model Cylinder = Devices.Cylinder(redeclare Media.SimpleWater medium);
    model Pump = Devices.Pump(redeclare Media.SimpleWater mediumIn,
         redeclare Media.SimpleWater mediumOut);
    model Turbine = Devices.Turbine(redeclare Media.SimpleWater mediumIn,
        redeclare Media.SimpleWater mediumOut);
    model Heater = Devices.Heater(redeclare Media.SimpleWater mediumIn,
      redeclare Media.SimpleWater mediumOut);
    model FluidSource = Devices.FluidSource(redeclare Media.SimpleWater medium);
    model FluidSourcePH = Devices.FluidSourcePH;
    model FluidSink = Devices.FluidSink;
    model StateMeasurement = Devices.StateMeasurement (
                               redeclare Media.SimpleWater medium);
  end SimpleWaterDevices;

  package SimpleWater2Devices
    model Cylinder = Devices.Cylinder(redeclare Media.SimpleWater2 medium);
    model Pump = Devices.Pump(redeclare Media.SimpleWater2 mediumIn,
         redeclare Media.SimpleWater2 mediumOut);
    model Turbine = Devices.Turbine(redeclare Media.SimpleWater2 mediumIn,
        redeclare Media.SimpleWater2 mediumOut);
    model Heater = Devices.Heater(redeclare Media.SimpleWater2 mediumIn,
      redeclare Media.SimpleWater2 mediumOut);
    model FluidSource = Devices.FluidSource (
                          redeclare Media.SimpleWater2 medium);
    model FluidSourcePH = Devices.FluidSourcePH;
    model FluidSink = Devices.FluidSink;
    model StateMeasurement = Devices.StateMeasurement (
                               redeclare Media.SimpleWater2 medium);
  end SimpleWater2Devices;

  annotation (uses(Modelica(version="3.2.1")));
end Thermo;
