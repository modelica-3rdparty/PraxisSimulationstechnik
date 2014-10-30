within ;
package SystemDynamics

package Interfaces

  connector MassPort
    flow Real dm;
    Integer info; // signals special behaviour of a stock
                  //   0: standard, Flow defines arbitrary dm
                  //   1: stock takes/delivers fixed amount, Flow sets dm = data
                  //      includes the case of empty/full stock (data = 0)
                  //   2: stock is restricted, Flow sets dm = min(flow, data)
    Real data;    // additional data from the Stock for the Flow:
                  //   given flow (info = 1) or maximal flow (info = 2)
   annotation (
      Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-10,-10},{10,10}})),
      Icon(coordinateSystem(
           preserveAspectRatio=true,
           extent={{-10,-10},{10,10}}),
           graphics={
        Ellipse(extent={{-10,-10},{10,10}},
         lineColor={0,0,0},
         fillPattern=FillPattern.Solid,
         fillColor={255,255,255})}));
  end MassPort;

  partial model GenericStock
    Interfaces.MassPort inflow(info(start=0),data(start=0))
      annotation(Placement(transformation(
        extent = {{-95, -5},{-105, 5}}, rotation = 180)));
    Interfaces.MassPort outflow(info(start=0),data(start=0))
      annotation(Placement(transformation(
        extent = {{95, -5},{105, 5}})));
    Modelica.Blocks.Interfaces.RealOutput out1
      annotation(Placement(transformation(
        extent = {{-10, 70},{10, 80}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out2
      annotation(Placement(transformation(
        extent = {{-10, -70},{10, -80}}, rotation = 270)));
    annotation (
      Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-70},{100,70}})),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-70},{100,70}}),
         graphics={
           Rectangle(extent = {{-100,-70},{100,70}},
                     lineColor = {0,0,0})}));
  end GenericStock;

  function constrainedRate
    // combines proposed flow with constraints of the attached stocks
    // doesn't work in MapleSim !!
    input Real inRate;
    input Interfaces.MassPort flow1;
    input Interfaces.MassPort flow2;
    output Real outRate;
  algorithm
    if flow1.info == 1 then
      outRate := flow1.data;
    elseif flow1.info == 2 then
      outRate := if flow2.info == 2 then min(inRate, flow1.data, flow2.data)
                 else min(inRate, flow1.data);
    elseif flow2.info == 1 then
      outRate := flow2.data;
    elseif flow2.info == 2 then
      outRate := min(inRate, flow2.data);
    else
      outRate := inRate;
    end if;
  end constrainedRate;

  partial model GenericFlow
    Interfaces.MassPort inflow
      annotation(Placement(transformation(
        extent = {{-95, -5},{-105, 5}}, rotation = 180)));
    Interfaces.MassPort outflow
      annotation(Placement(transformation(
        extent = {{95, -5},{105, 5}})));
    protected
    Real inRate;    // proposed rate, computed by children
    Real rate;      // actual rate respecting constraints of the stocks
  equation
    // rate = constrainedRate(inRate, inflow, outflow); // doesn't work
    if inflow.info == 1 then
      rate = inflow.data;
    elseif inflow.info == 2 then
      rate = if outflow.info == 2
             then min(min(inRate, inflow.data), outflow.data)
          else min(inRate, inflow.data);
    elseif outflow.info == 1 then
      rate = outflow.data;
    elseif outflow.info == 2 then
      rate = min(inRate, outflow.data);
    else
      rate = inRate;
    end if;
    inflow.dm = rate;
    outflow.dm = -rate;
    annotation (
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
             Line(points={{-100,0},{100,0}}),
             Polygon(points={{-80,-100},{80,-100},{-40,50},{40,50},{-80,-100}})}));
  end GenericFlow;

  partial model GenericFlowD
    Interfaces.MassPort inflow
      annotation(Placement(transformation(
        extent = {{-95, -5},{-105, 5}}, rotation = 180)));
    Interfaces.MassPort outflow
      annotation(Placement(transformation(
        extent = {{95, -5},{105, 5}})));
    parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
    parameter Modelica.SIunits.Time startTime = 0.1 "First sample time";
    protected
    Real inRate;    // proposed rate, computed by children
    Real rate;      // actual rate respecting constraints of the stocks
  equation
    when sample(startTime, samplePeriod) then
      // rate = constrainedRate(inRate, inflow, outflow); // doesn't work
      if inflow.info == 1 then
          rate = inflow.data;
      elseif inflow.info == 2 then
          rate = if outflow.info == 2 then
        min(min(inRate, inflow.data), outflow.data) else
        min(inRate, inflow.data);
      elseif outflow.info == 1 then
          rate = outflow.data;
      elseif outflow.info == 2 then
          rate = min(inRate, outflow.data);
      else
          rate = inRate;
      end if;
      inflow.dm = rate;
      outflow.dm = -rate;
    end when;
    annotation (
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
             Line(points={{-100,0},{100,0}}),
             Polygon(points={{-80,-100},{80,-100},{-40,50},{40,50},{-80,-100}})}));
  end GenericFlowD;

  partial model Flow1
    extends GenericFlow;
    // Flow with one input
    // children define the equation inRate = f(in1)
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-10, -90},{10, -110}}, rotation = 90)));
  end Flow1;

  partial model Flow2
    extends GenericFlow;
    // Flow with two inputs
    // children define the equation inRate = f(in1, in2)
    Modelica.Blocks.Interfaces.RealInput in1
      annotation(Placement(transformation(
        extent = {{-60, -90},{-40, -110}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2
      annotation(Placement(transformation(
        extent = {{40, -90},{60, -110}}, rotation = 90)));
  end Flow2;

  partial model Flow3
    extends GenericFlow;
    // Flow with three inputs
    // children define the equation inRate = f(in1, in2, in3)
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

  partial model Flow4
    extends GenericFlow;
    // Flow with four inputs
    // children define the equation inRate = f(in1, in2, in3, in4)
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

  partial model Flow5
    extends GenericFlow;
    // Flow with five inputs
    // children define the equation inRate = f(in1, in2, in3, in4, in5)
    // order from left to right, below: 1, 2, 3, above: 4, 5
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
    annotation (
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
             Line(points={{-100,0},{100,0}}),
             Polygon(points={{-80,-100},{80,-100},{-40,50},{40,50}}),
       Line(points={{-30,50},{-60,90}}),
             Line(points={{30,50},{60,90}})}));
  end Flow5;

  partial model Flow6
    extends GenericFlow;
    // Flow with six inputs
    // children define the equation inRate = f(in1, in2, in3, in4, in5, in6)
    // order from left to right, below: 1, 2, 3, above: 4, 5, 6
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
    annotation (
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

  partial block GenericConverter0
    // Converter without input
    Modelica.Blocks.Interfaces.RealOutput out "Output variable"
    annotation (
      Placement(transformation(
        extent = {{-10, 90},{10, 110}}, rotation = 90)));
    annotation (
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}})}));
  end GenericConverter0;

  partial block GenericConverter1
    // Converter with one input
    Modelica.Blocks.Interfaces.RealInput in1 "Input variable"
      annotation(Placement(transformation(
        extent = {{-10, -110},{10, -90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out1 "Output variable"
      annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}}, rotation = 90)));
    annotation (
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}}),
           Line(points={{0,-50},{0,-100}})}));
  end GenericConverter1;

  partial block GenericConverter2
    // Converter with two inputs
    Modelica.Blocks.Interfaces.RealInput in1 "Input variable 1"
      annotation(Placement(transformation(
        extent = {{-70,-110},{-50,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealInput in2 "Input variable 2"
      annotation(Placement(transformation(
        extent = {{50,-110},{70,-90}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput out1 "Output variable"
      annotation(Placement(transformation(
        extent = {{-10,90},{10,110}}, rotation = 90)));
    annotation (
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Ellipse(extent={{-50,-50},{50,50}}),
           Line(points={{0,50},{0,100}}),
           Line(points={{-60,-90},{-60,-70},{-32.5,-38}}),
           Line(points={{60,-90},{60,-70},{32.5,-38}})}));
  end GenericConverter2;

  partial block GenericConverter3
    // Converter with three inputs
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
    annotation (
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

  partial block GenericConverter4
    // Converter with four inputs
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
    annotation (
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

  partial block GenericConverter5
    // Converter with four inputs
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
    annotation (
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
      out1 = m;
      out2 = m;
    end when;
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

  model CloudSource
    Interfaces.MassPort outflow
      annotation(Placement(transformation(
        extent = {{95, -5},{105, 5}})));
  equation
    outflow.info = 0;
    outflow.data = 0;
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}),
          graphics={
            Line(smooth=  Smooth.Bezier,
              points=  {{-82.1,7.1},{-87.8,34.1},{-67.4,69.9},
   {-36.1,73.9},{-22.4,56.4}}),
            Line(smooth=  Smooth.Bezier,
       points=  {{-28.5,48.0},{-9.3,66.8},{26.3,77.7},
   {56.8,68.6},{78.9,38.5},{84.3,20.2},
   {83.6,0.5}}),
            Line(smooth=  Smooth.Bezier,
       points=  {{-82.7,12.4},{-90.9,-8.6},{-89.5,-35.2},
   {-69.7,-53.5},{-34.8,-63.2},{17.1,-63.5},
   {31.6,-47.8},{38.9,-26.5}}),
            Line(smooth=  Smooth.Bezier,
       points=  {{84.3,11.1},{96.4,5.8},{100,-15.6},
   {90.3,-53.9},{58.8,-60.1},{30.2,-48.2}})}));
  end CloudSource;

  model CloudSink
    Interfaces.MassPort inflow
      annotation(Placement(transformation(
        extent = {{-95, -5},{-105, 5}}, rotation = 180)));
  equation
    inflow.info = 0;
    inflow.data = 0;
    annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}),
            graphics={
              Line(smooth=  Smooth.Bezier,
                points=  {{-82.1,7.1},{-87.8,34.1},{-67.4,69.9},
     {-36.1,73.9},{-22.4,56.4}}),
              Line(smooth=  Smooth.Bezier,
         points=  {{-28.5,48.0},{-9.3,66.8},{26.3,77.7},
     {56.8,68.6},{78.9,38.5},{84.3,20.2},
     {83.6,0.5}}),
              Line(smooth=  Smooth.Bezier,
         points=  {{-82.7,12.4},{-90.9,-8.6},{-89.5,-35.2},
     {-69.7,-53.5},{-34.8,-63.2},{17.1,-63.5},
     {31.6,-47.8},{38.9,-26.5}}),
              Line(smooth=  Smooth.Bezier,
         points=  {{84.3,11.1},{96.4,5.8},{100,-15.6},
     {90.3,-53.9},{58.8,-60.1},{30.2,-48.2}})}));
  end CloudSink;

  model Conveyor
    extends Interfaces.GenericStock;
    // conveyor with time delay given as number of sample steps
    parameter Integer nDelay = 5;
    parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
    parameter Modelica.SIunits.Time startTime = 0.1 "First sample time";
    protected
    Real store[nDelay];
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
    annotation (
      Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-70},{100,70}})),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-70},{100,70}}),
         graphics={
           Rectangle(extent=  {{-100,-70},{100,70}},
                     lineColor=  {0,0,0}),
    Line(points={{0,-70},{0,70}}),
    Line(points={{50,-70},{50,70}}),
    Line(points={{-50,-70},{-50,70}})}));
  end Conveyor;

  model Oven
    extends Interfaces.GenericStock;
    // oven with overlap: reload starts during unloading
    // mimics behaviour of Stella block
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
      load = if pre(stepsleft) == 0 then min(pre(load)+ pre(inflow.dm), capacity)
             elseif pre(stepsleft) == 1 then min(pre(inflow.dm), capacity)
             else capacity;
      amountCooked = if pre(stepsleft) == 1 then capacity else 0;
      stepsleft = if (pre(stepsleft) == 0) or (pre(stepsleft) == 1)
                  then if (load == capacity)
                         then integer(cookingTime/samplePeriod) else 0
                  else pre(stepsleft) -1;
      spaceleft = if stepsleft == 0 then capacity - load
                  elseif stepsleft == 1 then capacity
                  else 0;
      out1 = load;
      out2 = load;
      inflow.data = spaceleft;
      outflow.data = amountCooked;
    end when;
    inflow.info = 2;
    outflow.info = 1;
    annotation (
      Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-70},{100,70}})),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-70},{100,70}}),
         graphics={
           Rectangle(extent=  {{-100,-70},{100,70}},
                     lineColor=  {0,0,0}),
           Rectangle(extent=  {{-70,-50},{70,50}},
                     lineColor=  {0,0,0})}));
  end Oven;

end Reservoirs;

package Flows

  model ConstantFlow
    extends Interfaces.GenericFlow;
    // flow given by a parameter
    parameter Real constRate = 1.0;
  equation
    inRate = constRate;
  end ConstantFlow;

  model ConstantFlowD
    extends Interfaces.GenericFlowD;
    // flow given by a parameter
    parameter Real constRate = 1.0;
  equation
    inRate = constRate;
  end ConstantFlowD;

  model Flow
    extends Interfaces.Flow1;
    // flow given by input
  equation
    inRate = in1;
  end Flow;

  model SwitchedFlow
    extends Interfaces.Flow1;
    // out = onValue if in = switchValue, else offValue
    parameter Integer switchValue = 1;
    parameter Real onValue = 1.0;
    parameter Real offValue = 0.0;
  equation
    inRate = if in1 == switchValue then onValue else offValue;
  end SwitchedFlow;

  model Mult2Flow
    extends Interfaces.Flow2;
  equation
    inRate = in1*in2;
  end Mult2Flow;

  model Mult3Flow
    extends Interfaces.Flow3;
  equation
    inRate = in1*in2*in3;
  end Mult3Flow;

  model Mult4Flow
    extends Interfaces.Flow4;
  equation
    inRate = in1*in2*in3*in4;
  end Mult4Flow;

  model Mult5Flow
    extends Interfaces.Flow5;
  equation
    inRate = in1*in2*in3*in4*in5;
  end Mult5Flow;

  model Mult6Flow
    extends Interfaces.Flow6;
  equation
    inRate = in1*in2*in3*in4*in5*in6;
  end Mult6Flow;

  model Div2Flow
    extends Interfaces.Flow2;
  equation
    inRate = in1/in2;
  end Div2Flow;

  model Mult2AddFlow
    extends Interfaces.Flow3;
  equation
    inRate = in1*in2 + in3;
  end Mult2AddFlow;

  model Mult2DivFlow
    extends Interfaces.Flow3;
  equation
    inRate = in1*in2/in3;
  end Mult2DivFlow;

  model Mult2SubDiv2Flow
    extends Interfaces.Flow4;
  equation
    inRate = in1*in2 - in3/in4;
  end Mult2SubDiv2Flow;

  model Mult2IFlow
    extends Interfaces.Flow2;
  equation
    inRate = floor(in1*in2 + 0.5);
  end Mult2IFlow;

  model Mult3IFlow
    extends Interfaces.Flow3;
  equation
    inRate = floor(in1*in2*in3 + 0.5);
  end Mult3IFlow;

  model Mult2AddIFlow
    extends Interfaces.Flow3;
  equation
    inRate = floor(in1*in2 + in3 + 0.5);
  end Mult2AddIFlow;

  model Mult2SubDiv2IFlow
    extends Interfaces.Flow4;
  equation
    inRate = floor(in1*in2 - in3/in4 + 0.5);
  end Mult2SubDiv2IFlow;

end Flows;

package Converters

  block ConstantConverter
    extends Interfaces.GenericConverter0;
    // out = constant
    parameter Real constValue = 1.0;
  equation
    out = constValue;
  end ConstantConverter;

  block TimeSwitchedConverter
    extends Interfaces.GenericConverter0;
    // out = newValue if t >= switchTime, else oldValue
    parameter Real switchTime = 1.0;
    parameter Real oldValue = 0.0;
    parameter Real newValue = 1.0;
  equation
    out = if time >= switchTime then newValue else oldValue;
  end TimeSwitchedConverter;

  block SwitchedConverter
    extends Interfaces.GenericConverter1;
    // out = onValue if in = switchValue, else offValue
    parameter Integer switchValue = 1;
    parameter Real onValue = 1.0;
    parameter Real offValue = 0.0;
  equation
    out1 = if in1 == switchValue then onValue else offValue;
  end SwitchedConverter;

  block Mult2Converter
    extends Interfaces.GenericConverter2;
  equation
    out1 = in1*in2;
  end Mult2Converter;

  block Mult3Converter
    extends Interfaces.GenericConverter3;
  equation
    out1 = in1*in2*in3;
  end Mult3Converter;

  block Mult4Converter
    extends Interfaces.GenericConverter4;
  equation
    out1 = in1*in2*in3*in4;
  end Mult4Converter;

  block Mult5Converter
    extends Interfaces.GenericConverter5;
  equation
    out1 = in1*in2*in3*in4*in5;
  end Mult5Converter;

  block Div2Converter
    extends Interfaces.GenericConverter2
      annotation (
        IconMap(extent={{-100,-100}, {100,100}},primitivesVisible=true),
        DiagramMap(extent={{-100,-100}, {100,100}},primitivesVisible=true));
  equation
    out1 = in1/in2;
    annotation (
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
            Text(extent={{60,-90},{100,-10}},
          textString="/",
                 lineColor={0,0,0})}));
  end Div2Converter;

  block MultPower2Converter
    extends Interfaces.GenericConverter2;
    parameter Real k1 = 1.0;
    parameter Real k2 = 1.0;
  equation
    out1 = in1^k1 * in2^k2;
  end MultPower2Converter;

  block MultPower3Converter
    extends Interfaces.GenericConverter3;
    parameter Real k1 = 1.0;
    parameter Real k2 = 1.0;
    parameter Real k3 = 1.0;
  equation
    out1 = in1^k1 * in2^k2 * in3^k3;
  end MultPower3Converter;

  block MultPower4Converter
    extends Interfaces.GenericConverter4;
    parameter Real k1 = 1.0;
    parameter Real k2 = 1.0;
    parameter Real k3 = 1.0;
    parameter Real k4 = 1.0;
  equation
    out1 = in1^k1 * in2^k2 * in3^k3 * in4^k4;
  end MultPower4Converter;

  block MultPower5Converter
    extends Interfaces.GenericConverter5;
    parameter Real k1 = 1.0;
    parameter Real k2 = 1.0;
    parameter Real k3 = 1.0;
    parameter Real k4 = 1.0;
    parameter Real k5 = 1.0;
  equation
    out1 = in1^k1 * in2^k2 * in3^k3 * in4^k4 * in5^k5;
  end MultPower5Converter;

  block Min2Converter
    extends Interfaces.GenericConverter2;
  equation
    out1 = min(in1, in2);
  end Min2Converter;

  block GraphConverter
    extends Interfaces.GenericConverter1
      annotation (
        IconMap(extent={{-100,-100}, {100,100}},primitivesVisible=true),
        DiagramMap(extent={{-100,-100}, {100,100}},primitivesVisible=true));
    parameter String table = "tableName";
    parameter String file = "fileName";
    Modelica.Blocks.Tables.CombiTable1Ds combitable1ds1(
      tableOnFile = true, tableName = table, fileName = file);
  equation
    combitable1ds1.u = in1;
    out1 = combitable1ds1.y[1];
    annotation (
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

  block Mult2GraphConverter
    extends Interfaces.GenericConverter2
      annotation (
        IconMap(extent={{-100,-100}, {100,100}},primitivesVisible=true),
        DiagramMap(extent={{-100,-100}, {100,100}},primitivesVisible=true));
    parameter String table = "tableName";
    parameter String file = "fileName";
    Modelica.Blocks.Tables.CombiTable1Ds combitable1ds1(
      tableOnFile = true, tableName = table, fileName = file);
  equation
    combitable1ds1.u = in1*in2;
    out1 = combitable1ds1.y[1];
    annotation (
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

  annotation (uses(Modelica(version="3.2.1")));
end SystemDynamics;
