within PraxisSimulationstechnik.Examples;
model BondHydraulik2
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin={-88.2064,
            153.451},                                                                                       extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin={4.6239,
            154.99},                                                                                       extent = {{-10,-1},{10,1}})));
  BondLib.Sensors.Dq dq1 annotation(Placement(transformation(origin={43.992,
            112.759},                                                                                     extent = {{-12,-12},{12,12}})));
  BondLib.Passive.I i1(I = 500) annotation(Placement(transformation(origin={29.676,
            154.99},                                                                                           extent = {{-12,-12},{12,12}})));
  BondLib.Passive.TF tf1(m = 1000) annotation(Placement(transformation(origin={-19.5579,
            154.877},                                                                                              extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin={-43.6984,
            154.307},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin={-66.3102,
            154.022},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r1(R = 80000000.0) annotation(Placement(transformation(origin={-64.0908,
            103.454},                                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Junctions.J0 j01 annotation(Placement(transformation(origin={-116.662,
            153.54},                                                                                        extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond5 annotation(Placement(transformation(origin={-141.41,
            153.54},                                                                                        extent = {{-10,-1},{10,1}})));
  BondLib.Sources.Sf sf1(f0 = 0.001) annotation(Placement(transformation(origin={-168.792,
            153.446},                                                                                                 extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r2(R = 1000000000.0) annotation(Placement(transformation(origin={-115.511,
            104.619},                                                                                                    extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin={-65.8803,
            128.149},                                                                                        extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond6 annotation(Placement(transformation(origin={-116.662,
            129.079},                                                                                        extent = {{-10,-1},{10,1}}, rotation = -90)));
equation
  connect(r2.BondCon1,bond6.BondCon2);
  connect(j01.BondCon4,bond6.BondCon1);
  connect(sf1.BondCon1,bond5.BondCon1);
  connect(j01.BondCon1,bond5.BondCon2);
  connect(j01.BondCon3,bond1.BondCon1);
  connect(r1.BondCon1,bond4.BondCon2);
  connect(j11.BondCon4,bond4.BondCon1);
  connect(j11.BondCon1,bond1.BondCon2);
  connect(j11.BondCon3,bond2.BondCon1);
  connect(tf1.BondCon1,bond2.BondCon2);
  connect(tf1.BondCon2,bond3.BondCon1);
  connect(i1.BondCon1,bond3.BondCon2);
  connect(i1.BondCon1,dq1.BondCon1);
  annotation(experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 0.000001),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end BondHydraulik2;

