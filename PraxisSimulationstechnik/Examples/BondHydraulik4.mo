within PraxisSimulationstechnik.Examples;
model BondHydraulik4
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin={56.2534,
            138.434},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin={7.9311,
            137.751},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin={-39.7424,
            136.607},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond5 annotation(Placement(transformation(origin={-93.234,
            137.271},                                                                                       extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin={-65.3283,
            137.178},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r2(R = 80000000.0) annotation(Placement(transformation(origin={-64.1691,
            86.912},                                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J0 j01 annotation(Placement(transformation(origin={-14.3849,
            137.847},                                                                                      extent = {{-12,-12},{12,12}})));
  BondLib.Passive.C c1(C = 0.00000000000174) annotation(Placement(transformation(origin={-13.5216,
            86.624},                                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Passive.TF tf1(m = 1000) annotation(Placement(transformation(origin={31.4961,
            138.609},                                                                                              extent = {{-12,-12},{12,12}})));
  BondLib.Passive.I i1(I = 500) annotation(Placement(transformation(origin={81.305,
            138.722},                                                                                           extent = {{-12,-12},{12,12}})));
  BondLib.Sensors.Dq dq1 annotation(Placement(transformation(origin={88.139,
            101.383},                                                                                     extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin={-14.2508,
            111.593},                                                                                       extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond6 annotation(Placement(transformation(origin={-65.0324,
            112.523},                                                                                        extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Junctions.J0 j02 annotation(Placement(transformation(origin={-117.054,
            137.327},                                                                                      extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond7 annotation(Placement(transformation(origin={-116.693,
            111.698},                                                                                       extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Passive.R r1(R = 1000000000.0) annotation(Placement(transformation(origin={-114.888,
            87.151},                                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond8 annotation(Placement(transformation(origin={-142.323,
            136.966},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Sources.Sf sf1(f0 = 0.001) annotation(Placement(transformation(origin={-165.969,
            136.958},                                                                                                extent = {{-12,-12},{12,12}})));
equation
  connect(sf1.BondCon1,bond8.BondCon1);
  connect(j02.BondCon1,bond8.BondCon2);
  connect(r1.BondCon1,bond7.BondCon2);
  connect(j02.BondCon4,bond7.BondCon1);
  connect(j02.BondCon3,bond5.BondCon1);
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
  annotation(experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 0.000001),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end BondHydraulik4;

