within PraxisSimulationstechnik.Examples;
model Wheatstone
  BondLib.Junctions.J0 j01 annotation(Placement(transformation(origin = {-3.302,71.67059999999999}, extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin = {-45.8211,26.8355}, extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J1 j12 annotation(Placement(transformation(origin = {39.0574,28.7319}, extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J0 j02 annotation(Placement(transformation(origin = {-45.3425,-18.8553}, extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J0 j03 annotation(Placement(transformation(origin = {39.0574,-17.5085}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond45 bond454 annotation(Placement(transformation(origin = {21.9978,-42.1999}, extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J1 j13 annotation(Placement(transformation(origin = {-1.79574,-62.851}, extent = {{-12,-12},{12,12}})));
  BondLib.Sources.Se se1 annotation(Placement(transformation(origin = {-3.14255,119.866}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin = {60.6063,27.834}, extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond5 annotation(Placement(transformation(origin = {61.0552,-17.9574}, extent = {{-10,-1},{10,1}})));
  BondLib.Passive.R r1 annotation(Placement(transformation(origin = {-87.5424,24.6915}, extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r2(R = 10) annotation(Placement(transformation(origin = {-87.9914,-19.3042}, extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r3(R = 101) annotation(Placement(transformation(origin = {82.15519999999999,28.2829}, extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r4(R = 1000) annotation(Placement(transformation(origin = {82.60420000000001,-17.0596}, extent = {{-12,-12},{12,12}})));
  BondLib.Sources.Sf sf1(f0 = 0) annotation(Placement(transformation(origin = {-1.79574,-110.887}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond45 bond452 annotation(Placement(transformation(origin = {-22.7029,51.1286}, extent = {{12,12},{-12,-12}}, rotation = -180)));
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin = {-46.2404,3.14255}, extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin = {38.1595,4.04042}, extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin = {-3.14255,95.6233}, extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond6 annotation(Placement(transformation(origin = {-65.5446,25.1404}, extent = {{-10,-1},{10,1}}, rotation = -180)));
  BondLib.Bonds.Bond bond7 annotation(Placement(transformation(origin = {-66.4425,-19.7532}, extent = {{-10,-1},{10,1}}, rotation = -180)));
  BondLib.Bonds.Bond bond8 annotation(Placement(transformation(origin = {-1.34681,-87.09350000000001}, extent = {{-10,-1},{10,1}}, rotation = -270)));
  BondLib.Bonds.Bond45 bond451 annotation(Placement(transformation(origin = {18.096,49.9873}, extent = {{-12,-12},{12,12}}, rotation = -90)));
  BondLib.Bonds.Bond45 bond453 annotation(Placement(transformation(origin = {-25.1404,-41.751}, extent = {{12,12},{-12,-12}}, rotation = -90)));
equation
  connect(se1.BondCon1,bond3.BondCon1);
  connect(j01.BondCon1,bond3.BondCon2);
  connect(j01.BondCon2,bond452.BondCon1);
  connect(j11.BondCon1,bond452.BondCon2);
  connect(j11.BondCon3,bond1.BondCon1);
  connect(j02.BondCon1,bond1.BondCon2);
  connect(j02.BondCon3,bond453.BondCon1);
  connect(j13.BondCon1,bond453.BondCon2);
  connect(j13.BondCon3,bond454.BondCon1);
  connect(j03.BondCon1,bond454.BondCon2);
  connect(j12.BondCon1,bond2.BondCon1);
  connect(j03.BondCon3,bond2.BondCon2);
  connect(j01.BondCon3,bond451.BondCon1);
  connect(j12.BondCon3,bond451.BondCon2);
  connect(sf1.BondCon1,bond8.BondCon1);
  connect(j13.BondCon2,bond8.BondCon2);
  connect(j11.BondCon2,bond6.BondCon1);
  connect(r1.BondCon1,bond6.BondCon2);
  connect(j02.BondCon2,bond7.BondCon1);
  connect(r2.BondCon1,bond7.BondCon2);
  connect(j12.BondCon2,bond4.BondCon1);
  connect(r3.BondCon1,bond4.BondCon2);
  connect(j03.BondCon2,bond5.BondCon1);
  connect(r4.BondCon1,bond5.BondCon2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end Wheatstone;

