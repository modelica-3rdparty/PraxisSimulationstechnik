within PraxisSimulationstechnik.Examples;
model BondHydraulik3
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin={6.6239,
            134.99},                                                                                       extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin={-41.6984,
            134.307},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin={-89.372,
            133.163},                                                                                       extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond5 annotation(Placement(transformation(origin={-142.863,
            133.827},                                                                                       extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin={-114.958,
            133.734},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r2(R = 80000000.0) annotation(Placement(transformation(origin={-113.799,
            83.468},                                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J0 j01 annotation(Placement(transformation(origin={-64.014,
            134.403},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Passive.C c1(C = 0.00000000000174) annotation(Placement(transformation(origin={-63.1511,
            83.18},                                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Passive.TF tf1(m = 1000) annotation(Placement(transformation(origin={-18.1334,
            135.165},                                                                                              extent = {{-12,-12},{12,12}})));
  BondLib.Passive.I i1(I = 500) annotation(Placement(transformation(origin={31.676,
            135.278},                                                                                         extent = {{-12,-12},{12,12}})));
  BondLib.Sensors.Dq dq1 annotation(Placement(transformation(origin={38.51,
            97.939},                                                                                     extent = {{-12,-12},{12,12}})));
  BondLib.Sources.Sf sf1(f0 = 0.001) annotation(Placement(transformation(origin={-166.505,
            134.597},                                                                                                extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin={-63.8803,
            108.149},                                                                                        extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond6 annotation(Placement(transformation(origin={-114.662,
            109.079},                                                                                        extent = {{-10,-1},{10,1}}, rotation = -90)));
equation
  connect(dq1.BondCon1,i1.BondCon1);
  connect(i1.BondCon1,bond3.BondCon2);
  connect(tf1.BondCon2,bond3.BondCon1);
  connect(tf1.BondCon1,bond2.BondCon2);
  connect(c1.BondCon1,bond4.BondCon2);
  connect(j01.BondCon2,bond4.BondCon1);
  connect(j01.BondCon3,bond2.BondCon1);
  connect(j01.BondCon1,bond1.BondCon2);
  connect(r2.BondCon1,bond6.BondCon2);
  connect(j11.BondCon3,bond1.BondCon1);
  connect(j11.BondCon2,bond6.BondCon1);
  connect(j11.BondCon1,bond5.BondCon2);
  connect(sf1.BondCon1,bond5.BondCon1);
  annotation(experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 0.000001),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end BondHydraulik3;

