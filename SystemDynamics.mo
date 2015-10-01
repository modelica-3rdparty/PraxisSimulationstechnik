within ;
package SystemDynamics "Simple system dynamics library"

package Interfaces

  connector MassPortR "mass port of reservoirs"
    flow Real dm;
    Real data;   // additional data from the Stock for the Flow:
                 //   given flow (info = 1) or maximal flow (info = 2)
    output Integer info;
                 // signals special behaviour of a stock
                 //   0: standard, Flow defines arbitrary dm
                 //   1: stock takes/delivers fixed amount, Flow sets dm = data
                 //      includes the case of empty/full stock (data = 0)
                 //   2: stock is restricted, Flow sets dm = min(flow, data)
    annotation(
          Diagram(coordinateSystem(
                    preserveAspectRatio = true,
                    extent = {{-100,-100},{100,100}}),
                 graphics={
                    Polygon(points={{-100,-100},{100,0},{-100,100}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
                       fillColor = {0,63,127})}),
          Icon(coordinateSystem(
                 preserveAspectRatio = true,
                 extent = {{-100,-100},{100,100}}),
               graphics={
                  Polygon(points={{-100,-100},{100,0},{-100,100}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
                       fillColor = {0,63,127})}));
  end MassPortR;

  connector MassPortF "mass port of flows"
    flow Real dm;
    Real data;   // additional data from the Stock for the Flow:
                 //   given flow (info = 1) or maximal flow (info = 2)
    input Integer info;
                 // signals special behaviour of a stock
                 //   0: standard, Flow defines arbitrary dm
                 //   1: stock takes/delivers fixed amount, Flow sets dm = data
                 //      includes the case of empty/full stock (data = 0)
                 //   2: stock is restricted, Flow sets dm = min(flow, data)
    annotation(
          Diagram(coordinateSystem(
                    preserveAspectRatio = true,
                    extent = {{-100,-100},{100,100}}),
                 graphics={
                    Polygon(points={{-100,-100},{100,0},{-100,100}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
                       fillColor = {0,63,127})}),
          Icon(coordinateSystem(
                 preserveAspectRatio = true,
                 extent = {{-100,-100},{100,100}}),
               graphics={
                  Polygon(points={{-100,-100},{100,0},{-100,100}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
                       fillColor = {0,63,127})}));
  end MassPortF;

  partial model GenericStock "Generic stock providing two mass ports and two signal outputs
     for current value"
    Interfaces.MassPortR inflow(data(start=0))
      annotation(Placement(transformation(
        extent = {{-140, -20},{-100, 20}})));
    Interfaces.MassPortR outflow(data(start=0))
      annotation(Placement(transformation(
        extent = {{100, -20},{140, 20}})));
    Modelica.Blocks.Interfaces.RealOutput out1
      annotation(Placement(transformation(
        extent = {{-10, 70},{10, 90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out2
      annotation(Placement(transformation(
        extent = {{-10, -70},{10, -90}}, rotation = 270)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Rectangle(extent = {{-100,-70},{100,70}},
                     lineColor = {0,0,0})}));
  end GenericStock;

  function constrainedRate
    "combines proposed flow with constraints of the attached stocks"
    input Real inRate;
    input Integer inInfo;
    input Real inData;
    input Integer outInfo;
    input Real outData;
    output Real outRate;
  algorithm
    if inInfo == 1 then   // XXX implement problem with outInfo != 0
      outRate := inData;
    elseif inInfo == 2 then
      outRate := if outInfo == 2 then min(min(inRate, inData), outData)
                 else min(inRate, inData);
                 // XXX implement problem with outInfo = 1
    elseif outInfo == 1 then
      outRate := outData;
    elseif outInfo == 2 then
      outRate := min(inRate, outData);
    else
      outRate := inRate;
    end if;
  end constrainedRate;

  partial model GenericFlow "Generic flow providing two mass ports"
    Interfaces.MassPortF inflow
      annotation(Placement(transformation(
        extent = {{-140, -20},{-100, 20}})));
    Interfaces.MassPortF outflow
      annotation(Placement(transformation(
        extent = {{100, -20},{140, 20}})));
  protected
    Real inRate;    // proposed rate, computed by children
    Real rate;      // actual rate respecting constraints of the stocks
  equation
    rate = constrainedRate(inRate, inflow.info, inflow.data,
                           outflow.info, outflow.data);
    inflow.dm = rate;
    outflow.dm = -rate;
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
             Line(points={{-100,0},{100,0}}),
             Polygon(points={{-80,-100},{80,-100},{-40,50},{40,50}})}));
  end GenericFlow;

  partial model GenericFlowD "Discrete generic flow providing two mass ports"
    Interfaces.MassPortF inflow
      annotation(Placement(transformation(
        extent = {{-140, -20},{-100, 20}})));
    Interfaces.MassPortF outflow
      annotation(Placement(transformation(
        extent = {{100, -20},{140, 20}})));
    parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
    parameter Modelica.SIunits.Time startTime = 0.1 "First sample time";
  protected
    Real inRate;    // proposed rate, computed by children
    Real rate;      // actual rate respecting constraints of the stocks
  equation
    when sample(startTime, samplePeriod) then
      rate = constrainedRate(inRate, inflow.info, inflow.data,
        outflow.info, outflow.data);
      inflow.dm = rate;
      outflow.dm = -rate;
    end when;
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
             Line(points={{-100,0},{100,0}}),
             Polygon(points={{-80,-100},{80,-100},{-40,50},{40,50},{-80,-100}})}));
  end GenericFlowD;

  partial model Flow1
    "Flow with one input children define the equation inRate = f(in1)"
    extends GenericFlow;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-10, -90},{10, -110}}, rotation = 90)));
  end Flow1;

  partial model FlowD1
    "Discrete Flow with one input children define the equation inRate = f(in1)"
    extends GenericFlowD;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-10, -90},{10, -110}}, rotation = 90)));
  end FlowD1;

  partial model Flow2
    "Flow with two inputs children define the equation inRate = f(in1, in2)"
    extends GenericFlow;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-60, -90},{-40, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2
      annotation(Placement(transformation(
        extent = {{40, -90},{60, -110}}, rotation = 90)));
  end Flow2;

  partial model Flow3 "Flow with three inputs children define the equation
     inRate = f(in1, in2, in3)"
    extends GenericFlow;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-80, -90},{-60, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2
      annotation(Placement(transformation(
        extent = {{-10, -90},{10, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in3
      annotation(Placement(transformation(
        extent = {{60, -90},{80, -110}}, rotation = 90)));
  end Flow3;

  partial model Flow4 "Flow with four inputs children define the equation
      inRate = f(in1, in2, in3, in4)"
    extends GenericFlow;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-100, -90},{-80, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2
      annotation(Placement(transformation(
        extent = {{-40, -90},{-20, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in3
      annotation(Placement(transformation(
        extent = {{20, -90},{40, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in4
      annotation(Placement(transformation(
        extent = {{80, -90},{100, -110}}, rotation = 90)));
  end Flow4;

  partial model Flow5 "Flow with five inputs children define the equation
     inRate = f(in1, in2, in3, in4, in5)
     order from left to right, below: 1, 2, 3, above: 4, 5"
    extends GenericFlow;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-80, -90},{-60, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2
      annotation(Placement(transformation(
        extent = {{-10, -90},{10, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in3
      annotation(Placement(transformation(
        extent = {{60, -90},{80, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in4
      annotation(Placement(transformation(
        extent = {{-70, 90},{-50, 110}}, rotation = 270)));
    Modelica.Blocks.Interfaces.RealInput in5
      annotation(Placement(transformation(
        extent = {{50, 90},{70, 110}}, rotation = 270)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
             Line(points={{-100,0},{100,0}}),
             Polygon(points={{-80,-100},{80,-100},{-40,50},{40,50}}),
       Line(points={{-30,50},{-60,90}}),
             Line(points={{30,50},{60,90}})}));
  end Flow5;

  partial model Flow6 "Flow with six inputs children define the equation
     inRate = f(in1, in2, in3, in4, in5, in6)
     order from left to right, below: 1, 2, 3, above: 4, 5, 6"
    extends GenericFlow;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-80, -90},{-60, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2
      annotation(Placement(transformation(
        extent = {{-10, -90},{10, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in3
      annotation(Placement(transformation(
        extent = {{60, -90},{80, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in4
      annotation(Placement(transformation(
        extent = {{-80, 90},{-60, 110}}, rotation = 270)));
    Modelica.Blocks.Interfaces.RealInput in5
      annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}}, rotation = 270)));
    Modelica.Blocks.Interfaces.RealInput in6
      annotation(Placement(transformation(
        extent = {{60, 90},{80, 110}}, rotation = 270)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
             Line(points={{-100,0},{100,0}}),
             Polygon(points={{-80,-100},{80,-100},{-40,50},{40,50}}),
       Line(points={{-30,50},{-60,90}}),
             Line(points={{30,50},{60,90}}),
             Line(points={{0,50},{0,90}})}));
  end Flow6;

  partial block GenericConverter0 "Generic converter without input"
    Modelica.Blocks.Interfaces.RealOutput out "Output variable"
    annotation(
      Placement(transformation(
        extent = {{-10, 90},{10, 110}}, rotation = 90)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}})}));
  end GenericConverter0;

  partial block GenericConverter1 "Generic converter with one input"
    Modelica.Blocks.Interfaces.RealInput in1 "Input variable"
      annotation(Placement(transformation(
        extent = {{-10, -110},{10, -90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out1 "Output variable"
      annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}}, rotation = 90)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}}),
           Line(points={{0,-50},{0,-100}})}));
  end GenericConverter1;

  partial block GenericConverter2 "Generic converter with two inputs"
    Modelica.Blocks.Interfaces.RealInput in1 "Input variable 1"
      annotation(Placement(transformation(
        extent = {{-70,-110},{-50,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2 "Input variable 2"
      annotation(Placement(transformation(
        extent = {{50,-110},{70,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out1 "Output variable"
      annotation(Placement(transformation(
        extent = {{-10,90},{10,110}}, rotation = 90)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}}),
           Line(points={{-60,-90},{-60,-70},{-32.5,-38}}),
           Line(points={{60,-90},{60,-70},{32.5,-38}})}));
  end GenericConverter2;

  partial block GenericConverter3 "Generic converter with three inputs"
    Modelica.Blocks.Interfaces.RealInput in1 "Input variable 1"
      annotation(Placement(transformation(
        extent = {{-90,-110},{-70,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2 "Input variable 2"
      annotation(Placement(transformation(
        extent = {{-10,-110},{10,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in3 "Input variable 3"
      annotation(Placement(transformation(
        extent = {{70,-110},{90,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out1 "Output variable"
      annotation(Placement(transformation(
        extent = {{-10,90},{10,110}}, rotation = 90)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}}),
           Line(points={{-80,-90},{-80,-70},{-37.6,-32.9}}),
           Line(points={{0,-90},{0,-50}}),
           Line(points={{80,-90},{80,-70},{37.6,-32.9}})}));
  end GenericConverter3;

  partial block GenericConverter4 "Generic converter with four inputs"
    Modelica.Blocks.Interfaces.RealInput in1 "Input variable 1"
      annotation(Placement(transformation(
        extent = {{-100,-110},{-80,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2 "Input variable 2"
      annotation(Placement(transformation(
        extent = {{-40,-110},{-20,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in3 "Input variable 3"
      annotation(Placement(transformation(
        extent = {{20,-110},{40,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in4 "Input variable 4"
      annotation(Placement(transformation(
        extent = {{80,-110},{100,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out1 "Output variable"
      annotation(Placement(transformation(
        extent = {{-10,90},{10,110}}, rotation = 90)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}}),
           Line(points={{-90,-90},{-90,-70},{-39.5,-30.7}}),
           Line(points={{-30,-90},{-30,-70},{-19.7,-46}}),
           Line(points={{30,-90},{30,-70},{19.7,-46}}),
           Line(points={{90,-90},{90,-70},{39.5,-30.7}})}));
  end GenericConverter4;

  partial block GenericConverter5 "Generic converter with four inputs"
    Modelica.Blocks.Interfaces.RealInput in1 "Input variable 1"
      annotation(Placement(transformation(
        extent = {{-100,-110},{-80,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2 "Input variable 2"
      annotation(Placement(transformation(
        extent = {{-55,-110},{-35,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in3 "Input variable 3"
      annotation(Placement(transformation(
        extent = {{-10,-110},{10,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in4 "Input variable 4"
      annotation(Placement(transformation(
        extent = {{35,-110},{55,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in5 "Input variable 5"
      annotation(Placement(transformation(
        extent = {{80, -110},{100, -90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out1 "Output variable"
      annotation(Placement(transformation(
        extent = {{-10,90},{10,110}}, rotation = 90)));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}}),
           Line(points={{-90,-90},{-90,-70},{-39.5,-30.7}}),
           Line(points={{-45,-90},{-45,-70},{-27,-42.1}}),
           Line(points={{0,-90},{0,-50}}),
           Line(points={{45,-90},{45,-70},{27,-42.1}}),
           Line(points={{90,-90},{90,-70},{39.5,-30.7}})}));
  end GenericConverter5;

end Interfaces;

package Reservoirs

  model Stock "standard reservoir"
    extends Interfaces.GenericStock;
    parameter Real m0 = 0.0;
  protected
    Real m(start=m0, fixed=true);
  equation
    der(m) = inflow.dm + outflow.dm;
    inflow.info = 0;
    inflow.data = 0;
    outflow.info = 0;
    outflow.data = 0;
    out1 = m;
    out2 = m;
  end Stock;

  model StockD "discrete reservoir"
    extends Interfaces.GenericStock;
    parameter Real m0 = 0.0;
    parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
    parameter Modelica.SIunits.Time startTime = 0.1 "First sample time";
  protected
    Real m(start=m0, fixed=true);
  equation
    when sample(startTime, samplePeriod) then
      m = pre(m) + pre(inflow.dm) + pre(outflow.dm);
    end when;
    out1 = m;
    out2 = m;
    inflow.info = 0;
    inflow.data = 0;
    outflow.info = 0;
    outflow.data = 0;
  end StockD;

  model SaturatedStock "reservoir with maximal and minimal levels"
    extends Interfaces.GenericStock;
    parameter Real m0 = 1.0;
    parameter Real maxLevel = 1e306;
    parameter Real minLevel = -1e306;
  protected
    Real m(start=m0, fixed=true);
  equation
    outflow.info = if (m <= minLevel) then 1 else 0;
    outflow.data = 0;
    inflow.info = if (m >= maxLevel) then 1 else 0;
    inflow.data = 0;
    der(m) = inflow.dm + outflow.dm;
    out1 = m;
    out2 = m;
  end SaturatedStock;

  model SaturatedStockD "discrete reservoir with maximal and minimal levels"
    extends Interfaces.GenericStock;
    parameter Real m0 = 0.0;
    parameter Real maxLevel = 1e306;
    parameter Real minLevel = -1e306;
    parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
    parameter Modelica.SIunits.Time startTime = 0.1 "First sample time";
  protected
    Real m(start=m0, fixed=true);
  equation
    when sample(startTime, samplePeriod) then
      m = pre(m) + pre(inflow.dm) + pre(outflow.dm);
    end when;
    inflow.info = 2;
    inflow.data = maxLevel - m;
    outflow.info = 2;
    outflow.data = m - minLevel;
    out1 = m;
    out2 = m;
  end SaturatedStockD;

  model CloudSource "External input with infinite supply"
    Interfaces.MassPortR outflow
      annotation(Placement(transformation(
        extent = {{90, -20},{130, 20}})));
  equation
    outflow.info = 0;
    outflow.data = 0;
    annotation(
      Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}),
          graphics={
            Line(smooth = Smooth.Bezier,
              points={{-82.1,7.1},{-87.8,34.1},{-67.4,69.9},
   {-36.1,73.9},{-22.4,56.4}}),
            Line(smooth = Smooth.Bezier,
       points={{-28.5,48.0},{-9.3,66.8},{26.3,77.7},
   {56.8,68.6},{78.9,38.5},{84.3,20.2},
   {83.6,0.5}}),
            Line(smooth = Smooth.Bezier,
       points={{-82.7,12.4},{-90.9,-8.6},{-89.5,-35.2},
   {-69.7,-53.5},{-34.8,-63.2},{17.1,-63.5},
   {31.6,-47.8},{38.9,-26.5}}),
            Line(smooth = Smooth.Bezier,
       points={{84.3,11.1},{96.4,5.8},{100,-15.6},
   {90.3,-53.9},{58.8,-60.1},{30.2,-48.2}})}));
  end CloudSource;

  model CloudSink "External output"
    Interfaces.MassPortR inflow
      annotation(Placement(transformation(
        extent = {{-130, -20},{-90, 20}})));
  equation
    inflow.info = 0;
    inflow.data = 0;
    annotation(
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}),
            graphics={
              Line(smooth = Smooth.Bezier,
                points={{-82.1,7.1},{-87.8,34.1},{-67.4,69.9},
                          {-36.1,73.9},{-22.4,56.4}}),
              Line(smooth = Smooth.Bezier,
         points={{-28.5,48.0},{-9.3,66.8},{26.3,77.7},
     {56.8,68.6},{78.9,38.5},{84.3,20.2},
     {83.6,0.5}}),
              Line(smooth = Smooth.Bezier,
         points={{-82.7,12.4},{-90.9,-8.6},{-89.5,-35.2},
     {-69.7,-53.5},{-34.8,-63.2},{17.1,-63.5},
     {31.6,-47.8},{38.9,-26.5}}),
              Line(smooth = Smooth.Bezier,
         points={{84.3,11.1},{96.4,5.8},{100,-15.6},
     {90.3,-53.9},{58.8,-60.1},{30.2,-48.2}})}));
  end CloudSink;

  model Conveyor "Conveyor with time delay given as number of sample steps"
    extends Interfaces.GenericStock;
    parameter Integer nDelay = 5;
    parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
    parameter Modelica.SIunits.Time startTime = 0.1 "First sample time";
  protected
    Real store[nDelay](start=zeros(nDelay),each fixed=true);
    Real load, last;
  equation
    when sample(startTime, samplePeriod) then
      store[1] = inflow.dm;
      store[2:end] = pre(store[1:end-1]);
      last = store[end];
      load = sum(store);
      out1 = load;
      out2 = load;
      outflow.data = last;
    end when;
    inflow.info = 0;
    inflow.data = 0;
    outflow.info = 1;
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Rectangle(extent = {{-100,-70},{100,70}},
                     lineColor = {0,0,0}),
    Line(points={{0,-70},{0,70}}),
    Line(points={{50,-70},{50,70}}),
    Line(points={{-50,-70},{-50,70}})}));
  end Conveyor;

  model Oven "Simple plant model with overlap: reload starts during unloading
     mimics behaviour of Stella block"
    extends Interfaces.GenericStock;
    parameter Real capacity = 3;
    parameter Real cookingTime = 2;
    parameter Real initialLoad = 0;
    parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
    parameter Modelica.SIunits.Time startTime = 0.1 "First sample time";
  protected
    Real load(start=initialLoad, fixed=true);
    Real spaceleft(start=capacity - initialLoad, fixed=true);
    Real amountCooked(start=0, fixed=true);
    Integer stepsleft(start=0, fixed=true);
  equation
    when sample(startTime, samplePeriod) then
      // stepsleft = 0 -> oven is loaded
      // stepsleft = 1 -> oven gets ready, unload and start reloading
      // else         -> oven works
      load = if pre(stepsleft) == 0
             then min(pre(load) + pre(inflow.dm), capacity)
             elseif pre(stepsleft) == 1 then min(pre(inflow.dm), capacity)
             else capacity;
      amountCooked = if pre(stepsleft) == 1 then capacity else 0;
      stepsleft = if (pre(stepsleft) == 0) or (pre(stepsleft) == 1)
                  then if (load >= capacity)  // actually load == capacity
                         then integer(cookingTime/samplePeriod) else 0
                  else pre(stepsleft) - 1;
      spaceleft = if stepsleft == 0 then capacity - load
                  elseif stepsleft == 1 then capacity
                  else 0;
    end when;
    out1 = load;
    out2 = load;
    inflow.data = spaceleft;
    outflow.data = amountCooked;
    inflow.info = 2;
    outflow.info = 1;
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Rectangle(extent = {{-100,-70},{100,70}},
                     lineColor = {0,0,0}),
           Rectangle(extent = {{-70,-50},{70,50}},
                     lineColor = {0,0,0})}));
  end Oven;

end Reservoirs;

package Flows

  model ConstantFlow "Flow is given by parameter"
    extends Interfaces.GenericFlow;
    parameter Real constRate = 1.0;
  equation
    inRate = constRate;
  end ConstantFlow;

  model ConstantFlowD "Discrete flow is given by parameter"
    extends Interfaces.GenericFlowD;
    parameter Real constRate = 1.0;
  equation
    inRate = constRate;
  end ConstantFlowD;

  model Flow "Flow is given by in1"
    extends Interfaces.Flow1;
  equation
    inRate = in1;
  end Flow;

  model FlowD "Discrete flow is given by in1"
    extends Interfaces.FlowD1;
  equation
    inRate = in1;
  end FlowD;

  model SwitchedFlow
    "Flow is given as onValue if in = switchValue, else offValue"
    extends Interfaces.Flow1;
    parameter Integer switchValue = 1;
    parameter Real onValue = 1.0;
    parameter Real offValue = 0.0;
  equation
    inRate = if integer(in1+0.5) == switchValue then onValue else offValue;
  end SwitchedFlow;

  model SwitchedFlowD
    "Discrete flow is given as onValue if in = switchValue, else offValue"
    extends Interfaces.GenericFlowD;
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-10, -90},{10, -110}}, rotation = 90)));
    parameter Integer switchValue = 1;
    parameter Real onValue = 1.0;
    parameter Real offValue = 0.0;
  equation
    inRate = if integer(in1+0.5) == switchValue then onValue else offValue;
  end SwitchedFlowD;

  model Mult2Flow "Flow is given as the product of the two inputs"
    extends Interfaces.Flow2;
  equation
    inRate = in1*in2;
  end Mult2Flow;

  model Mult3Flow "Flow is given as the product of the three inputs"
    extends Interfaces.Flow3;
  equation
    inRate = in1*in2*in3;
  end Mult3Flow;

  model Mult4Flow "Flow is given as the product of the four inputs"
    extends Interfaces.Flow4;
  equation
    inRate = in1*in2*in3*in4;
  end Mult4Flow;

  model Mult5Flow "Flow is given as the product of the five inputs"
    extends Interfaces.Flow5;
  equation
    inRate = in1*in2*in3*in4*in5;
  end Mult5Flow;

  model Mult6Flow "Flow is given as the product of the six inputs"
    extends Interfaces.Flow6;
  equation
    inRate = in1*in2*in3*in4*in5*in6;
  end Mult6Flow;

  model Div2Flow "Flow is given as in1 / in2"
    extends Interfaces.Flow2;
  equation
    inRate = in1/in2;
  end Div2Flow;

  model Mult2AddFlow "Flow is given as in1 * in2 + in3"
    extends Interfaces.Flow3;
  equation
    inRate = in1*in2 + in3;
  end Mult2AddFlow;

  model Mult2DivFlow "Flow is given as in1 * in2 / in3"
    extends Interfaces.Flow3;
  equation
    inRate = in1*in2/in3;
  end Mult2DivFlow;

  model Mult2SubDiv2Flow "Flow is given as in1 * in2 - in3 * in4"
    extends Interfaces.Flow4;
  equation
    inRate = in1*in2 - in3/in4;
  end Mult2SubDiv2Flow;

  model Mult2IFlow "Flow is given as round(in1 * in2)"
    extends Interfaces.Flow2;
  equation
    inRate = floor(in1*in2 + 0.5);
  end Mult2IFlow;

  model Mult3IFlow "Flow is given as round(in1 * in2 * in3)"
    extends Interfaces.Flow3;
  equation
    inRate = floor(in1*in2*in3 + 0.5);
  end Mult3IFlow;

  model Mult2AddIFlow "Flow is given as round(in1 * in2 + in3)"
    extends Interfaces.Flow3;
  equation
    inRate = floor(in1*in2 + in3 + 0.5);
  end Mult2AddIFlow;

  model Mult2SubDiv2IFlow "Flow is given as round(in1 * in2 - in3 / in4)"
    extends Interfaces.Flow4;
  equation
    inRate = floor(in1*in2 - in3/in4 + 0.5);
  end Mult2SubDiv2IFlow;

end Flows;

package Converters

  block ConstantConverter "Output is given by parameter"
    extends Interfaces.GenericConverter0;
    parameter Real constValue = 1.0;
  equation
    out = constValue;
  end ConstantConverter;

  block TimeSwitchedConverter
    "Output is given as newValue if t >= switchTime, else oldValue"
    extends Interfaces.GenericConverter0;
    parameter Real switchTime = 1.0;
    parameter Real oldValue = 0.0;
    parameter Real newValue = 1.0;
  equation
    out = if time >= switchTime then newValue else oldValue;
  end TimeSwitchedConverter;

  block SwitchedConverter
    "Output is given as onValue if in = switchValue, else offValue"
    extends Interfaces.GenericConverter1;
    parameter Integer switchValue = 1;
    parameter Real onValue = 1.0;
    parameter Real offValue = 0.0;
  equation
    out1 = if integer(in1+0.5) == switchValue then onValue else offValue;
  end SwitchedConverter;

  block SwitchedConverterD
    "Discrete output is given as onValue if in = switchValue, else offValue"
    extends Interfaces.GenericConverter1;
    parameter Integer switchValue = 1;
    parameter Real onValue = 1.0;
    parameter Real offValue = 0.0;
    parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
    parameter Modelica.SIunits.Time startTime = 0.1 "First sample time";
  equation
    when sample(startTime, samplePeriod) then
      out1 = if integer(in1+0.5) == switchValue then onValue else offValue;
    end when;
  end SwitchedConverterD;

  block Mult2Converter "Output is given as the product of the two inputs"
    extends Interfaces.GenericConverter2;
  equation
    out1 = in1*in2;
  end Mult2Converter;

  block Mult3Converter "Output is given as the product of the three inputs"
    extends Interfaces.GenericConverter3;
  equation
    out1 = in1*in2*in3;
  end Mult3Converter;

  block Mult4Converter "Output is given as the product of the four inputs"
    extends Interfaces.GenericConverter4;
  equation
    out1 = in1*in2*in3*in4;
  end Mult4Converter;

  block Mult5Converter "Output is given as the product of the five inputs"
    extends Interfaces.GenericConverter5;
  equation
    out1 = in1*in2*in3*in4*in5;
  end Mult5Converter;

  block Div2Converter "Output is given as in1 / in2"
    extends Interfaces.GenericConverter2
      annotation(
        IconMap(extent={{-100,-100}, {100,100}},primitivesVisible=true),
        DiagramMap(extent={{-100,-100}, {100,100}},primitivesVisible=true));
  equation
    out1 = in1/in2;
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
            Text(extent={{60,-90},{100,-10}},
          textString="/",
                 lineColor={0,0,0})}));
  end Div2Converter;

  block MultPower2Converter "Output is given as in1^k1 * in2^k2"
    extends Interfaces.GenericConverter2;
    parameter Real k1 = 1.0;
    parameter Real k2 = 1.0;
  equation
    out1 = in1^k1 * in2^k2;
  end MultPower2Converter;

  block MultPower3Converter "Output is given as in1^k1 * in2^k2 * in3^k3"
    extends Interfaces.GenericConverter3;
    parameter Real k1 = 1.0;
    parameter Real k2 = 1.0;
    parameter Real k3 = 1.0;
  equation
    out1 = in1^k1 * in2^k2 * in3^k3;
  end MultPower3Converter;

  block MultPower4Converter
    "Output is given as in1^k1 * in2^k2 * in3^k3 * in4^k4"
    extends Interfaces.GenericConverter4;
    parameter Real k1 = 1.0;
    parameter Real k2 = 1.0;
    parameter Real k3 = 1.0;
    parameter Real k4 = 1.0;
  equation
    out1 = in1^k1 * in2^k2 * in3^k3 * in4^k4;
  end MultPower4Converter;

  block MultPower5Converter
    "Output is given as in1^k1 * in2^k2 * in3^k3 * in4^k4 * in5^k5"
    extends Interfaces.GenericConverter5;
    parameter Real k1 = 1.0;
    parameter Real k2 = 1.0;
    parameter Real k3 = 1.0;
    parameter Real k4 = 1.0;
    parameter Real k5 = 1.0;
  equation
    out1 = in1^k1 * in2^k2 * in3^k3 * in4^k4 * in5^k5;
  end MultPower5Converter;

  block Min2Converter "Output is given as min(in1, in2)"
    extends Interfaces.GenericConverter2;
  equation
    out1 = min(in1, in2);
  end Min2Converter;

  block GraphConverter
    "Output is given by interpolation using values from a table in a file"
    extends Interfaces.GenericConverter1
      annotation(
        IconMap(extent={{-100,-100}, {100,100}},primitivesVisible=true),
        DiagramMap(extent={{-100,-100}, {100,100}},primitivesVisible=true));
    parameter String table = "tableName";
    parameter String file = "fileName";
    Modelica.Blocks.Tables.CombiTable1Ds combitable1ds1(
      tableOnFile = true, tableName = table, fileName = file);
  equation
    combitable1ds1.u = in1;
    out1 = combitable1ds1.y[1];
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
            Rectangle(extent={{-25,-35},{0,35}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={255,204,0}),
            Rectangle(extent={{0,-35},{25,35}},
         lineColor={0,0,0}),
           Line(points={{-25,-21},{25,-21}}),
           Line(points={{-25,-7},{25,-7}}),
           Line(points={{-25,7},{25,7}}),
           Line(points={{-25,21},{25, 21}})}));
  end GraphConverter;

  model Mult2GraphConverter "Output is given by multiplying in1 and in2, then interpolating
    using values from a table in a file"
    extends Interfaces.GenericConverter2
    annotation(
        IconMap(extent={{-100,-100}, {100,100}},primitivesVisible=true),
        DiagramMap(extent={{-100,-100}, {100,100}},primitivesVisible=true));
    parameter String table = "tableName";
    parameter String file = "fileName";

    SystemDynamics.Converters.GraphConverter graphConverter(
      table = table, file = file) annotation(Placement(transformation(extent={{-28,32},{-8,52}})));
    SystemDynamics.Converters.Mult2Converter mult2Converter
      annotation(Placement(transformation(extent={{-28,4},{-8,24}})));
  equation
    connect(mult2Converter.in1, in1) annotation(Line(
      points={{-24,4},{-24,-7},{-58,-7},{-58,-66}},
      color={0,0,127}));
    connect(mult2Converter.in2, in2) annotation(Line(
      points={{-12,4},{-12,-8},{38,-8},{38,-66}},
      color={0,0,127}));
    connect(mult2Converter.out1, graphConverter.in1) annotation(Line(
      points={{-18,24},{-18,32}},
      color={0,0,127}));
    connect(graphConverter.out1, out1) annotation(Line(
      points={{-18,52},{-18,90}},
      color={0,0,127}));
    annotation(
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
            Rectangle(extent={{-25,-35},{0,35}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={255,204,0}),
            Rectangle(extent={{0,-35},{25,35}},
         lineColor={0,0,0}),
           Line(points={{-25,-21},{25,-21}}),
           Line(points={{-25,-7},{25,-7}}),
           Line(points={{-25,7},{25,7}}),
           Line(points={{-25,21},{25, 21}})}));
  end Mult2GraphConverter;

end Converters;

  annotation(Documentation(info="<html>
<p>This package contains a library to create system dynamics diagrams. It has
been created for the book: P. Junglas, Praxis der Simulationstechnik.</p>

<p>The SystemDynamics library is an open source project distributed under the
GPL license. This means that you can copy, modify and redistribute the library,
but you have to respect the copyright of the author. The software is provided
without any warranty of any kind.</p>

<p>&copy; Peter Junglas 2014</p>
</html>"), uses(Modelica(version="3.2.1")));
end SystemDynamics;
