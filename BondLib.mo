within ;
package BondLib "Modelica library for Bond Graph modeling"
// Minimalversion, aus Cellier's Bib herausgelöst

package Interfaces
  "Connectors and partial models for Modelica bond graph library"

  connector BondCon "Bi-directional bondgraphic connector"
    Real f "Bondgraphic flow variable";
    Real e "Bondgraphic effort variable";
    Real d "Directional variable";
  end BondCon;

  partial model PassiveOnePort
    "Partial model invoking one bondgraphic connector"
    Real e "Bondgraphic effort";
    Real f "Bondgraphic flow";
    BondCon BondCon1 "Bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
  equation
    e = BondCon1.e;
    f = BondCon1.d*BondCon1.f;
  end PassiveOnePort;

  partial model ActiveOnePort
    "Partial model invoking one bondgraphic connector"
    Real e "Bondgraphic effort";
    Real f "Bondgraphic flow";
    BondCon BondCon1 "Bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
  equation
    e = BondCon1.e;
    f = -BondCon1.d*BondCon1.f;
  end ActiveOnePort;

  partial model ModActiveOnePort
    Real e "Bondgraphic effort";
    Real f "Bondgraphic flow";
    BondCon BondCon1 "Bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
    Modelica.Blocks.Interfaces.RealInput s "Signal input"
      annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}}, rotation = 180)));
  equation
    e = BondCon1.e;
    f = -BondCon1.d*BondCon1.f;
  end ModActiveOnePort;

  partial model TwoPort "Partial model invoking two bondgraphic connectors"
    Real e1 "Bondgraphic primary effort";
    Real f1 "Bondgraphic primary flow";
    Real e2 "Bondgraphic secondary effort";
    Real f2 "Bondgraphic secondary flow";
    BondCon BondCon1 "Left bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}}, rotation = 180)));
    BondCon BondCon2 "Right bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
  equation
    e1 = BondCon1.e;
    f1 = BondCon1.d*BondCon1.f;
    e2 = BondCon2.e;
    f2 = -BondCon2.d*BondCon2.f;
  end TwoPort;

  partial model FourPortZero2
    "Partial model invoking up to four bondgraphic connectors"
    Real e[4] "Bondgraphic effort vector";
    Real f[4] "Bondgraphic flow vector";
    BondCon BondCon1 "First bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}}, rotation = 180)));
    BondCon BondCon2 "Second bond graph connector"
      annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}}, rotation = 90)));
    BondCon BondCon3 "Third bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
    BondCon BondCon4 "Fourth bond graph connector"
      annotation(Placement(transformation(
        extent = {{-10, -110},{10, -90}}, rotation = 90)));
  equation
    e[1] = BondCon1.e;
    f[1] = BondCon1.d*BondCon1.f;
    e[2] = BondCon2.e;
    f[2] = BondCon2.d*BondCon2.f;
    e[3] = BondCon3.e;
    f[3] = BondCon3.d*BondCon3.f;
    e[4] = BondCon4.e;
    f[4] = BondCon4.d*BondCon4.f;

    if cardinality(BondCon1) == 0 then
      BondCon1.d = 1;
      f[1] = 0;
    end if;
    if cardinality(BondCon2) == 0 then
      BondCon2.d = 1;
      f[2] = 0;
    end if;
    if cardinality(BondCon3) == 0 then
      BondCon3.d = 1;
      f[3] = 0;
    end if;
    if cardinality(BondCon4) == 0 then
      BondCon4.d = 1;
      f[4] = 0;
    end if;
  end FourPortZero2;

  partial model FourPortOne2
    "Partial model invoking up to four bondgraphic connectors"
    Real e[4] "Bondgraphic effort vector";
    Real f[4] "Bondgraphic flow vector";
    BondCon BondCon1 "First bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}}, rotation = 180)));
    BondCon BondCon2 "Second bond graph connector"
      annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}}, rotation = 90)));
    BondCon BondCon3 "Third bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
    BondCon BondCon4 "Fourth bond graph connector"
      annotation(Placement(transformation(
        extent = {{-10, -110},{10, -90}}, rotation = 90)));
  equation
    e[1] = BondCon1.d*BondCon1.e;
    f[1] = BondCon1.f;
    e[2] = BondCon2.d*BondCon2.e;
    f[2] = BondCon2.f;
    e[3] = BondCon3.d*BondCon3.e;
    f[3] = BondCon3.f;
    e[4] = BondCon4.d*BondCon4.e;
    f[4] = BondCon4.f;

    if cardinality(BondCon1) == 0 then
      BondCon1.d = 1;
      e[1] = 0;
    end if;
    if cardinality(BondCon2) == 0 then
      BondCon2.d = 1;
      e[2] = 0;
    end if;
    if cardinality(BondCon3) == 0 then
      BondCon3.d = 1;
      e[3] = 0;
    end if;
    if cardinality(BondCon4) == 0 then
      BondCon4.d = 1;
      e[4] = 0;
    end if;
  end FourPortOne2;

  partial model EightPortZero
    "Partial model invoking up to eight bondgraphic connectors"
    Real e[8] "Bondgraphic effort vector";
    Real f[8] "Bondgraphic flow vector";

    BondCon BondCon1 "First bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
    BondCon BondCon2 "Second bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, 90},{-90,110}})));
    BondCon BondCon3 "Third bond graph connector"
      annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}})));
    BondCon BondCon4 "Fourth bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, 90},{110,110}})));
    BondCon BondCon5 "Fifth bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
    BondCon BondCon6 "Sixth bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -110},{110, -90}})));
    BondCon BondCon7 "Seventh bond graph connector"
      annotation(Placement(transformation(
        extent = {{-10, -110},{10, -90}})));
    BondCon BondCon8 "Eighth bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -110},{-90, -90}})));
  equation
    e[1] = BondCon1.e;
    f[1] = BondCon1.d*BondCon1.f;
    e[2] = BondCon2.e;
    f[2] = BondCon2.d*BondCon2.f;
    e[3] = BondCon3.e;
    f[3] = BondCon3.d*BondCon3.f;
    e[4] = BondCon4.e;
    f[4] = BondCon4.d*BondCon4.f;
    e[5] = BondCon5.e;
    f[5] = BondCon5.d*BondCon5.f;
    e[6] = BondCon6.e;
    f[6] = BondCon6.d*BondCon6.f;
    e[7] = BondCon7.e;
    f[7] = BondCon7.d*BondCon7.f;
    e[8] = BondCon8.e;
    f[8] = BondCon8.d*BondCon8.f;

    if cardinality(BondCon1) == 0 then
      BondCon1.d = 1;
      f[1] = 0;
    end if;
    if cardinality(BondCon2) == 0 then
      BondCon2.d = 1;
      f[2] = 0;
    end if;
    if cardinality(BondCon3) == 0 then
      BondCon3.d = 1;
      f[3] = 0;
    end if;
    if cardinality(BondCon4) == 0 then
      BondCon4.d = 1;
      f[4] = 0;
    end if;
    if cardinality(BondCon5) == 0 then
      BondCon5.d = 1;
      f[5] = 0;
    end if;
    if cardinality(BondCon6) == 0 then
      BondCon6.d = 1;
      f[6] = 0;
    end if;
    if cardinality(BondCon7) == 0 then
      BondCon7.d = 1;
      f[7] = 0;
    end if;
    if cardinality(BondCon8) == 0 then
      BondCon8.d = 1;
      f[8] = 0;
    end if;
  end EightPortZero;

  partial model EightPortOne
    "Partial model invoking up to eight bondgraphic connectors"
    Real e[8] "Bondgraphic effort vector";
    Real f[8] "Bondgraphic flow vector";

    BondCon BondCon1 "First bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}})));
    BondCon BondCon2 "Second bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, 90},{-90,110}})));
    BondCon BondCon3 "Third bond graph connector"
      annotation(Placement(transformation(
        extent = {{-10, 90},{10, 110}})));
    BondCon BondCon4 "Fourth bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, 90},{110,110}})));
    BondCon BondCon5 "Fifth bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
    BondCon BondCon6 "Sixth bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -110},{110, -90}})));
    BondCon BondCon7 "Seventh bond graph connector"
      annotation(Placement(transformation(
        extent = {{-10, -110},{10, -90}})));
    BondCon BondCon8 "Eighth bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -110},{-90, -90}})));
  equation
    e[1] = BondCon1.d*BondCon1.e;
    f[1] = BondCon1.f;
    e[2] = BondCon2.d*BondCon2.e;
    f[2] = BondCon2.f;
    e[3] = BondCon3.d*BondCon3.e;
    f[3] = BondCon3.f;
    e[4] = BondCon4.d*BondCon4.e;
    f[4] = BondCon4.f;
    e[5] = BondCon5.d*BondCon5.e;
    f[5] = BondCon5.f;
    e[6] = BondCon6.d*BondCon6.e;
    f[6] = BondCon6.f;
    e[7] = BondCon7.d*BondCon7.e;
    f[7] = BondCon7.f;
    e[8] = BondCon8.d*BondCon8.e;
    f[8] = BondCon8.f;

    if cardinality(BondCon1) == 0 then
      BondCon1.d = 1;
      e[1] = 0;
    end if;
    if cardinality(BondCon2) == 0 then
      BondCon2.d = 1;
      e[2] = 0;
    end if;
    if cardinality(BondCon3) == 0 then
      BondCon3.d = 1;
      e[3] = 0;
    end if;
    if cardinality(BondCon4) == 0 then
      BondCon4.d = 1;
      e[4] = 0;
    end if;
    if cardinality(BondCon5) == 0 then
      BondCon5.d = 1;
      e[5] = 0;
    end if;
    if cardinality(BondCon6) == 0 then
      BondCon6.d = 1;
      e[6] = 0;
    end if;
    if cardinality(BondCon7) == 0 then
      BondCon7.d = 1;
      e[7] = 0;
    end if;
    if cardinality(BondCon8) == 0 then
      BondCon8.d = 1;
      e[8] = 0;
    end if;
  end EightPortOne;

end Interfaces;

package Bonds "Bonds of Modelica bond graph library"

  model Bond "The a-causal bond model of the bond graph library"
    Interfaces.BondCon BondCon1 "Left bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -10},{-90, 10}}, rotation = 180)));
    Interfaces.BondCon BondCon2 "Right bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-10},{100,10}}),
         graphics={
           Line(points={{-100,0},{100,0},{60,50}})
		   }));
  equation
    BondCon2.e = BondCon1.e;
    BondCon2.f = BondCon1.f;
    BondCon1.d = -1;
    BondCon2.d = +1;
  end Bond;

  model Bond45 "The a-causal bond model of the bond graph library"
    Interfaces.BondCon BondCon1 "Left bond graph connector"
      annotation(Placement(transformation(
        extent = {{-110, -110},{-90, -90}})));
    Interfaces.BondCon BondCon2 "Right bond graph connector"
      annotation(Placement(transformation(
        extent = {{90, 90},{110, 110}})));
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Line(points={{-100,-100},{100,100},{25,100}})
		   }));
  equation
    BondCon2.e = BondCon1.e;
    BondCon2.f = BondCon1.f;
    BondCon1.d = -1;
    BondCon2.d = +1;
  end Bond45;

end Bonds;

package Junctions "Junctions of Modelica bond graph library"

  model J0 "Model of a standard 0-junction with up to four ports"
    extends Interfaces.FourPortZero2;
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},
		textString="0")
		   }));
  equation
    e[2:4] = e[1:3];
    sum(f) = 0;
  end J0;

  model J0large "Model of a large 0-junction with up to eight ports"
    extends Interfaces.EightPortZero;
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="0")
		   }));
  equation
    e[2:8] = e[1:7];
    sum(f) = 0;
  end J0large;

  model J1 "Model of a standard 1-junction with up to four ports"
    extends Interfaces.FourPortOne2;
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="1")
		   }));
  equation
    f[2:4] = f[1:3];
    sum(e) = 0;
  end J1;

  model J1large "Model of a large 1-junction with up to eight ports"
    extends Interfaces.EightPortOne;
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="1")
		   }));
  equation
    f[2:8] = f[1:7];
    sum(e) = 0;
  end J1large;

end Junctions;

package Passive "Passive elements of Modelica bond graph library"

  model R "The bondgraphic linear resistor element"
    extends Interfaces.PassiveOnePort;
    parameter Real R=1 "Bondgraphic Resistance";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="R")
		   }));
  equation
    e = R*f;
  end R;

  model C "The bondgraphic linear capacitor element"
    extends Interfaces.PassiveOnePort;
    parameter Real C=1 "Bondgraphic Capacitance";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="C")
		   }));
  equation
    f = C*der(e);
  end C;

  model I "The bondgraphic linear inductor element"
    extends Interfaces.PassiveOnePort;
    parameter Real I=1 "Bondgraphic Inductance";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="I")
		   }));
  equation
    e = I*der(f);
  end I;

  model TF "The bondgraphic linear transformer element"
    extends Interfaces.TwoPort;
    parameter Real m=1 "Bondgraphic Transformation Constant";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="TF")
		   }));
  equation
    e1 = m*e2;
    f2 = m*f1;
  end TF;

  model GY "The bondgraphic linear gyrator element"
    extends Interfaces.TwoPort;
    parameter Real r=1 "Bondgraphic Gyration Constant";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="GY")
         }));
  equation
    e1 = r*f2;
    e2 = r*f1;
  end GY;

end Passive;

package Sources "Sources of Modelica bond graph library"

  model Se "Constant effort source of the Modelica bond graph library"
    extends Interfaces.ActiveOnePort;
    parameter Real e0=1 "Bondgraphic Effort Source";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="Se")
		   }));
  equation
    e = e0;
  end Se;

  model mSe "Modulated effort source of the Modelica bond graph library"
    extends Interfaces.ModActiveOnePort;
    Real e0 "Bondgraphic Effort Source";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-95,-80},{100,80}},textString="mSe")
		   }));
  equation
    e0 = s;
    e = e0;
  end mSe;

  model Sf "Constant flow source of the Modelica bond graph library"
    extends Interfaces.ActiveOnePort;
    parameter Real f0=1 "Bondgraphic Flow Source";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="Sf")
		   }));
  equation
    f = f0;
  end Sf;

  model mSf "Modulated flow source of the Modelica bond graph library"
    extends Interfaces.ModActiveOnePort;
    Real f0 "Bondgraphic Effort Source";
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-90,-80},{90,80}},textString="mSf")
		   }));
  equation
    f0 = s;
    f = f0;
  end mSf;

  model sinSe "Sinusoidal effort source of the Modelica bond graph library"
    extends Interfaces.ActiveOnePort;
    parameter Real e0=1 "Amplitude of sine wave";
    parameter Modelica.SIunits.Angle phase=0 "Phase of sine wave";
    parameter Modelica.SIunits.Frequency freqHz=1 "Frequency of sine wave";
    parameter Real offset=0 "Offset of sine wave";
    parameter Modelica.SIunits.Time startTime=0 "Start time of sine wave";
    Modelica.Blocks.Sources.Sine Sine1(
        amplitude=e0,
        freqHz=freqHz,
        offset=offset,
        phase=phase,
        startTime=startTime);
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-90,-80},{90,80}},textString="sSe")
		   }));
  equation
    e = Sine1.y;
  end sinSe;

  model sinSf "Sinusoidal flow source of the Modelica bond graph library"
    extends Interfaces.ActiveOnePort;
    parameter Real f0=1 "Amplitude of sine wave";
    parameter Modelica.SIunits.Angle phase=0 "Phase of sine wave";
    parameter Modelica.SIunits.Frequency freqHz=1 "Frequency of sine wave";
    parameter Real offset=0 "Offset of sine wave";
    parameter Modelica.SIunits.Time startTime=0 "Start time of sine wave";
    Modelica.Blocks.Sources.Sine Sine1(
        amplitude=f0,
        freqHz=freqHz,
        offset=offset,
        phase=phase,
        startTime=startTime);
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-90,-80},{90,80}},textString="sSf")
		   }));
  equation
    f = Sine1.y;
  end sinSf;

end Sources;

package Sensors "Sensors (detectors) of Modelica bond graph library"

  model Dp "Generalized momentum sensor of the Modelica bond graph library"
    extends Interfaces.PassiveOnePort;
    Modelica.Blocks.Interfaces.RealOutput out1
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
    parameter Real p0 = 0 "Initial momentum";
    Real p(start=p0);
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="Dp")
		   }));
  equation
    der(p) = e;
    out1 = p;
  end Dp;

  model Dq "Generalized position sensor of the Modelica bond graph library"
    extends Interfaces.PassiveOnePort;
    Modelica.Blocks.Interfaces.RealOutput out1
      annotation(Placement(transformation(
        extent = {{90, -10},{110, 10}})));
    parameter Real q0 = 0 "Initial position";
    Real q(start=q0);
    annotation(uses(Modelica(version="3.2.1")),
      Icon(coordinateSystem(
         preserveAspectRatio=true,
         extent={{-100,-100},{100,100}}),
         graphics={
           Text(extent = {{-80,-80},{80,80}},textString="Dq")
		   }));
  equation
    der(q) = f;
    out1 = q;
  end Dq;

end Sensors;

end BondLib;
