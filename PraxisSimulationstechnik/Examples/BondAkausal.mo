within PraxisSimulationstechnik.Examples;
model BondAkausal
  BondLib.Sources.Sf sf1 annotation(Placement(transformation(origin={-163.994,
            138.743},                                                                                     extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin={-140.389,
            138.748},                                                                                       extent = {{-12,-1.2},{12,1.2}})));
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin={-118.935,
            138.734},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin={-94.4748,
            138.446},                                                                                       extent = {{-12,-1.2},{12,1.2}})));
  BondLib.Passive.GY gy1 annotation(Placement(transformation(origin={-69.4389,
            138.734},                                                                                     extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin={-45.8418,
            138.734},                                                                                      extent = {{-12,-1.2},{12,1.2}})));
  BondLib.Junctions.J1 j12 annotation(Placement(transformation(origin={-22.2446,
            138.446},                                                                                      extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin={1.6403,
            138.446},                                                                                      extent = {{-12,-1.2},{12,1.2}})));
  BondLib.Sources.Se se1 annotation(Placement(transformation(origin={26.1007,
            138.734},                                                                                    extent = {{-12,-12},{12,12}})));
equation
  connect(se1.BondCon1,bond4.BondCon2);
  connect(j12.BondCon3,bond4.BondCon1);
  connect(j12.BondCon1,bond3.BondCon2);
  connect(gy1.BondCon2,bond3.BondCon1);
  connect(gy1.BondCon1,bond2.BondCon2);
  connect(j11.BondCon3,bond2.BondCon1);
  connect(j11.BondCon1,bond1.BondCon2);
  connect(sf1.BondCon1,bond1.BondCon1);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end BondAkausal;

