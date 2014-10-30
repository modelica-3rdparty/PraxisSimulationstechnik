within PraxisSimulationstechnik.Examples;
model BondSchwing2M
  BondLib.Sources.sinSe sinse1(freqHz = 0.4775) annotation(Placement(transformation(origin={-160.856,
            69.5478},                                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin={-138.814,
            70.1825},                                                                                                  extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin={-94.459,
            69.5908},                                                                                        extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J1 j12 annotation(Placement(transformation(origin={-25.9165,
            70.3925},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Passive.C c1 annotation(Placement(transformation(origin={16.9729,
            112.079},                                                                                  extent = {{-12,-12},{12,12}})));
  BondLib.Passive.I i2 annotation(Placement(transformation(origin={-25.5156,
            25.0981},                                                                                   extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r2 annotation(Placement(transformation(origin={-28.3215,
            164.589},                                                                                            extent = {{-12,-12},{12,12}})));
  BondLib.Sensors.Dq dq1 annotation(Placement(transformation(origin={-107.286,
            -3.3612},                                                                                     extent = {{-12,-12},{12,12}})));
  BondLib.Sensors.Dq dq2 annotation(Placement(transformation(origin={-16.2964,
            -2.9604},                                                                                               extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin={-115.704,
            70.2227},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Passive.I i1 annotation(Placement(transformation(origin={-115.357,
            25.5532},                                                                                   extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J0 j01 annotation(Placement(transformation(origin={-71.3264,
            69.6521},                                                                                        extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J1 j13 annotation(Placement(transformation(origin={-71.3264,
            120.667},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Passive.C c2 annotation(Placement(transformation(origin={-117.639,
            164.018},                                                                                             extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond45 bond453 annotation(Placement(transformation(origin={-46.998,
            141.517},                                                                                         extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin={-50.2991,
            70.3312},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond45 bond451 annotation(Placement(transformation(origin={-6.4996,
            91.1746},                                                                                          extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r1 annotation(Placement(transformation(origin={19.3237,
            24.9826},                                                                                   extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin={-115.704,
            45.1399},                                                                                        extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond6 annotation(Placement(transformation(origin={-70.9255,
            96.7321},                                                                                       extent = {{-10,-1},{10,1}}, rotation = -270)));
  BondLib.Bonds.Bond bond5 annotation(Placement(transformation(origin={-25.9165,
            44.2297},                                                                                       extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond45 bond452 annotation(Placement(transformation(origin={-3.8705,
            47.144},                                                                                           extent = {{-12,-12},{12,12}}, rotation = -90)));
  BondLib.Bonds.Bond45 bond454 annotation(Placement(transformation(origin={-95.254,
            141.857},                                                                                          extent = {{-12,-12},{12,12}}, rotation = -270)));
equation
  connect(r1.BondCon1,bond452.BondCon2);
  connect(bond451.BondCon2,c1.BondCon1);
  connect(j12.BondCon2,bond451.BondCon1);
  connect(j12.BondCon3,bond452.BondCon1);
  connect(bond5.BondCon2,i2.BondCon1);
  connect(j12.BondCon4,bond5.BondCon1);
  connect(j12.BondCon1,bond3.BondCon2);
  connect(j01.BondCon3,bond3.BondCon1);
  connect(j13.BondCon4,bond6.BondCon2);
  connect(j01.BondCon2,bond6.BondCon1);
  connect(bond453.BondCon2,r2.BondCon1);
  connect(j13.BondCon3,bond453.BondCon1);
  connect(c2.BondCon1,bond454.BondCon2);
  connect(j13.BondCon1,bond454.BondCon1);
  connect(j01.BondCon1,bond2.BondCon2);
  connect(bond4.BondCon2,i1.BondCon1);
  connect(i1.BondCon1,dq1.BondCon1);
  connect(j11.BondCon4,bond4.BondCon1);
  connect(j11.BondCon3,bond2.BondCon1);
  connect(j11.BondCon1,bond1.BondCon2);
  connect(sinse1.BondCon1,bond1.BondCon1);
  connect(i2.BondCon1,dq2.BondCon1);
  annotation(experiment(StartTime = 0.0, StopTime = 25, Tolerance = 1e-06),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end BondSchwing2M;

