within PraxisSimulationstechnik.Examples;
model BondRLCKreis
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin = {-81.9036,42.9462}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin = {-106.077,42.806}, extent = {{-10,-1},{10,1}})));
  BondLib.Sources.sinSe sinse1(freqHz = 0.15) annotation(Placement(transformation(origin = {-131.096,43.0863}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin = {-56.8066,42.8736}, extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J0 j01 annotation(Placement(transformation(origin = {-33.4215,43.4442}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin = {-9.258089999999999,43.7295}, extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J1 j12 annotation(Placement(transformation(origin = {14.5525,43.7971}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin = {38.652,44.0203}, extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J0 j02 annotation(Placement(transformation(origin = {61.5569,44.0203}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond5 annotation(Placement(transformation(origin = {86.9675,44.0203}, extent = {{-10,-1},{10,1}})));
  BondLib.Passive.I i1(I = 0.1) annotation(Placement(transformation(origin = {112.019,44.0203}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond6 annotation(Placement(transformation(origin = {-82.7475,17.6805}, extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond7 annotation(Placement(transformation(origin = {-32.8103,16.5478}, extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond8 annotation(Placement(transformation(origin = {14.5506,18.2596}, extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond9 annotation(Placement(transformation(origin = {62.1969,18.8302}, extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Passive.C c1(C = 10) annotation(Placement(transformation(origin = {-31.9772,-10.529}, extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r2(R = 10) annotation(Placement(transformation(origin = {16.0876,-10.6015}, extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r1 annotation(Placement(transformation(origin = {-81.3133,-10.2387}, extent = {{-12,-12},{12,12}})));
  BondLib.Passive.C c2 annotation(Placement(transformation(origin = {63.7745,-9.95834}, extent = {{-12,-12},{12,12}})));
equation
  connect(i1.BondCon1,bond5.BondCon2);
  connect(j02.BondCon3,bond5.BondCon1);
  connect(j02.BondCon4,bond9.BondCon1);
  connect(j02.BondCon1,bond4.BondCon2);
  connect(j12.BondCon3,bond4.BondCon1);
  connect(j12.BondCon4,bond8.BondCon1);
  connect(j12.BondCon1,bond3.BondCon2);
  connect(j01.BondCon3,bond3.BondCon1);
  connect(j01.BondCon4,bond7.BondCon1);
  connect(j01.BondCon1,bond2.BondCon2);
  connect(j11.BondCon3,bond2.BondCon1);
  connect(sinse1.BondCon1,bond1.BondCon1);
  connect(j11.BondCon1,bond1.BondCon2);
  connect(j11.BondCon4,bond6.BondCon1);
  connect(r1.BondCon1,bond6.BondCon2);
  connect(j01.BondCon4,bond7.BondCon1);
  connect(c1.BondCon1,bond7.BondCon2);
  connect(j12.BondCon4,bond8.BondCon1);
  connect(r2.BondCon1,bond8.BondCon2);
  connect(j02.BondCon4,bond9.BondCon1);
  connect(c2.BondCon1,bond9.BondCon2);
  annotation(experiment(StartTime = 0.0, StopTime = 50, Tolerance = 1e-06),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end BondRLCKreis;

