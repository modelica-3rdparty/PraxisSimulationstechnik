within PraxisSimulationstechnik.Examples;
model BondRCKreis
  BondLib.Junctions.J1 j11 annotation(Placement(transformation(origin = {3.42368,34.8074}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond2 annotation(Placement(transformation(origin = {27.3008,34.8123}, extent = {{-10,-1},{10,1}})));
  BondLib.Passive.C c1(C = 0.0001) annotation(Placement(transformation(origin = {51.2099,34.8099}, extent = {{-12,-12},{12,12}})));
  BondLib.Passive.R r1(R = 10000) annotation(Placement(transformation(origin = {4.27714,-15.955}, extent = {{-12,-12},{12,12}})));
  BondLib.Bonds.Bond bond3 annotation(Placement(transformation(origin = {3.13345,11.1516}, extent = {{-10,-1},{10,1}}, rotation = -90)));
  BondLib.Bonds.Bond bond1 annotation(Placement(transformation(origin = {-20.8115,34.7856}, extent = {{-10,-1},{10,1}})));
  BondLib.Sources.Se se1(e0 = 12) annotation(Placement(transformation(origin = {-44.4491,35.3764}, extent = {{-12,-12},{12,12}})));
equation
  connect(j11.BondCon1,bond1.BondCon2);
  connect(se1.BondCon1,bond1.BondCon1);
  connect(r1.BondCon1,bond3.BondCon2);
  connect(j11.BondCon4,bond3.BondCon1);
  connect(c1.BondCon1,bond2.BondCon2);
  connect(j11.BondCon3,bond2.BondCon1);
  annotation(experiment(StartTime = 0.0, StopTime = 10, Tolerance = 1e-06));
end BondRCKreis;

