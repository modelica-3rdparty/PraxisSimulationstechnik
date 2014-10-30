within PraxisSimulationstechnik.Examples;
model BondHydraulik1
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin={-144.767,
            160.271},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin={-51.9373,
            161.81},                                                                                       extent = {{-10,-1},{10,1}})));
  BondLib.Sensors.Dq dq1 annotation(Placement(transformation(origin={-12.5696,
            127.579},                                                                                     extent = {{-12,-12},{12,12}})));
  BondLib.Passive.I i1(I = 500) annotation(Placement(transformation(origin={-26.8851,
            161.81},                                                                                            extent = {{-12,-12},{12,12}})));
  BondLib.Passive.TF tf1(m = 1000) annotation(Placement(transformation(origin={-76.119,
            161.698},                                                                                              extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin={-100.26,
            161.127},                                                                                      extent = {{-10,-1},{10,1}})));
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin={-122.871,
            160.842},                                                                                       extent = {{-12,-12},{12,12}})));
  BondLib.Sources.Sf sf1(f0 = 0.001) annotation(Placement(transformation(origin={-167.8,
            160.266},                                                                                                extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r1(R = 80000000.0) annotation(Placement(transformation(origin={-120.652,
            110.274},                                                                                                   extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond4 annotation(Placement(transformation(origin={-122.441,
            134.969},                                                                                        extent = {{-10,-1},{10,1}}, rotation = -90)));
equation
  connect(r1.BondCon1,bond4.BondCon2);
  connect(sf1.BondCon1,bond1.BondCon1);
  connect(j11.BondCon4,bond4.BondCon1);
  connect(j11.BondCon1,bond1.BondCon2);
  connect(j11.BondCon3,bond2.BondCon1);
  connect(tf1.BondCon1,bond2.BondCon2);
  connect(tf1.BondCon2,bond3.BondCon1);
  connect(i1.BondCon1,bond3.BondCon2);
  connect(i1.BondCon1,dq1.BondCon1);
  annotation(experiment(StartTime = 0.0, StopTime = 2, Tolerance = 0.000001),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{
            200,200}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            200}})),
    uses(Modelica(version="3.2.1")));
end BondHydraulik1;

