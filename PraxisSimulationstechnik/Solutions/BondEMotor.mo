within PraxisSimulationstechnik.Solutions;
model BondEMotor
  BondLib.Sources.Sf sf1 annotation(Placement(transformation(origin={-172.134,
            116.492},                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin={-148.389,
            116.501},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J0 j01 annotation(Placement(transformation(origin={-124.338,
            116.501},                                                                                      extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin={-100.689,
            116.902},                                                                                                 extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin={-75.8373,
            116.902},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin={-52.1881,
            116.902},                                                                                       extent = {{-10,-1},{10,1}})));
  BondLib.Passive.GY gy1 annotation(Placement(transformation(origin={-28.9396,
            117.303},                                                                                     extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin={-4.8895,
            117.303},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J1 j12 annotation(Placement(transformation(origin={19.5615,
            117.704},                                                                                      extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond5 annotation(Placement(transformation(origin={42.4091,
            117.303},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J0 j02 annotation(Placement(transformation(origin={67.2609,
            117.303},                                                                                                extent = {{-12,-12},{12,12}})));
  BondLib.Passive.TF tf1(m = 0.3) annotation(Placement(transformation(origin={116.652,
            117.398},                                                                                             extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond6 annotation(Placement(transformation(origin={92.2089,
            117.426},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond7 annotation(Placement(transformation(origin={139.473,
            117.426},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Passive.I i1 annotation(Placement(transformation(origin={163.608,
            117.426},                                                                                  extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond8 annotation(Placement(transformation(origin={-125.004,
            92.788},                                                                                         extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Junctions.J1 j13 annotation(Placement(transformation(origin={-125.004,
            68.6534},                                                                                        extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond45 bond451 annotation(Placement(transformation(origin={-148.636,
            45.0215},                                                                                            extent = {{12,12},{-12,-12}}, rotation = -180)));
  BondLib.Passive.R r1 annotation(Placement(transformation(origin={-171.262,
            21.3895},                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Passive.C c1 annotation(Placement(transformation(origin={-79.2486,
            18.3726},                                                                                              extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond9 annotation(Placement(transformation(origin={-75.729,
            94.297},                                                                                        extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Passive.R r2 annotation(Placement(transformation(origin={-75.2262,
            70.1618},                                                                                              extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond10 annotation(Placement(transformation(origin={-75.729,
            141.058},                                                                                       extent = {{-10,-1},{10,1}}, rotation = 90)));
  BondLib.Passive.I i2 annotation(Placement(transformation(origin={-75.729,
            163.684},                                                                                  extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond11 annotation(Placement(transformation(origin={19.8046,
            93.794},                                                                                         extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Passive.R r3 annotation(Placement(transformation(origin={21.313,
            69.1562},                                                                                  extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond12 annotation(Placement(transformation(origin={19.8046,
            142.566},                                                                                       extent = {{-10,-1},{10,1}}, rotation = 90)));
  BondLib.Passive.I i3 annotation(Placement(transformation(origin={19.8046,
            166.701},                                                                                 extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond13 annotation(Placement(transformation(origin={67.0685,
            141.058},                                                                                       extent = {{-10,-1},{10,1}}, rotation = 90)));
  BondLib.Passive.C c2 annotation(Placement(transformation(origin={67.5713,
            163.684},                                                                                            extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond45 bond452 annotation(Placement(transformation(origin={-102.881,
            43.513},                                                                                           extent = {{-12,-12},{12,12}}, rotation = -90)));
equation
  connect(c2.BondCon1,bond13.BondCon2);
  connect(j02.BondCon2,bond13.BondCon1);
  connect(i3.BondCon1,bond12.BondCon2);
  connect(j12.BondCon2,bond12.BondCon1);
  connect(r3.BondCon1,bond11.BondCon2);
  connect(j12.BondCon4,bond11.BondCon1);
  connect(i2.BondCon1,bond10.BondCon2);
  connect(j11.BondCon2,bond10.BondCon1);
  connect(r2.BondCon1,bond9.BondCon2);
  connect(j11.BondCon4,bond9.BondCon1);
  connect(c1.BondCon1,bond452.BondCon2);
  connect(bond451.BondCon2,r1.BondCon1);
  connect(j13.BondCon3,bond452.BondCon1);
  connect(bond451.BondCon1,j13.BondCon1);
  connect(j13.BondCon2,bond8.BondCon2);
  connect(j01.BondCon4,bond8.BondCon1);
  connect(i1.BondCon1,bond7.BondCon2);
  connect(tf1.BondCon2,bond7.BondCon1);
  connect(tf1.BondCon1,bond6.BondCon2);
  connect(j02.BondCon3,bond6.BondCon1);
  connect(j02.BondCon1,bond5.BondCon2);
  connect(j12.BondCon3,bond5.BondCon1);
  connect(j12.BondCon1,bond4.BondCon2);
  connect(gy1.BondCon2,bond4.BondCon1);
  connect(gy1.BondCon1,bond3.BondCon2);
  connect(j11.BondCon3,bond3.BondCon1);
  connect(j11.BondCon1,bond2.BondCon2);
  connect(j01.BondCon3,bond2.BondCon1);
  connect(j01.BondCon1,bond1.BondCon2);
  connect(sf1.BondCon1,bond1.BondCon1);
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 1e-06),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end BondEMotor;

