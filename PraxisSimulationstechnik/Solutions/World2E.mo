within PraxisSimulationstechnik.Solutions;
model World2E
  PJlib.Kap12.Bevoelkerung bevoelkerung1 annotation(Placement(transformation(origin = {-62.4703,84.32299999999999}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.Investitionen investitionen1 annotation(Placement(transformation(origin = {-62.7078,53.9192}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.LebensmittelQuote lebensmittelquote1 annotation(Placement(transformation(origin = {54.6318,66.27079999999999}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.EffektiveInvestQuote effektiveinvestquote1 annotation(Placement(transformation(origin = {-23.9905,-8.403169999999999}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.InvestAgrar investagrar1 annotation(Placement(transformation(origin = {0.23753,-40.9447}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.VerschmutzungA verschmutzung1 annotation(Placement(transformation(origin = {55.8195,9.849270000000001}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.Lebensqualitaet lebensqualitaet1 annotation(Placement(transformation(origin = {52.4941,-55.3369}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.NatRohstoffeA natrohstoffea1 annotation(Placement(transformation(origin = {-65.8566,-8.505470000000001}, extent = {{-12,-12},{12,12}})));
equation
  connect(bevoelkerung1.y,natrohstoffea1.u) annotation(Line(points = {{-75.19029999999999,88.283},{-96.25360000000001,88.283},{-96.25360000000001,-2.59366},{-78.098,-2.59366},{-78.098,-2.59366}}));
  connect(effektiveinvestquote1.realoutput1,investitionen1.realinput1) annotation(Line(points = {{-36.7105,-14.4032},{-43.5159,-14.4032},{-43.5159,-81.84439999999999},{-89.3372,-81.84439999999999},{-89.3372,55.6196},{-75.2161,55.6196},{-75.2161,55.6196}}));
  connect(natrohstoffea1.realinput1,effektiveinvestquote1.realoutput1) annotation(Line(points = {{-77.9422,-14.8333},{-89.3372,-14.8333},{-89.3372,-81.84439999999999},{-43.5159,-81.84439999999999},{-43.5159,-14.4092},{-35.7349,-14.4092},{-35.7349,-14.4092}}));
  connect(lebensqualitaet1.realoutput1,investagrar1.realinput1) annotation(Line(points = {{40.7708,-61.9075},{3.7464,-61.9075},{3.7464,-53.0259},{3.7464,-53.0259}}));
  connect(investitionen1.y,verschmutzung1.realinput1) annotation(Line(points = {{-50.5938,55.1164},{4.03458,55.1164},{4.03458,5.76369},{43.2277,5.76369},{43.2277,5.76369}}));
  connect(investitionen1.y,effektiveinvestquote1.u) annotation(Line(points = {{-50.5938,55.1164},{4.03458,55.1164},{4.03458,-4.03458},{-10.951,-4.03458},{-10.951,-4.03458}}));
  connect(investitionen1.u,bevoelkerung1.y) annotation(Line(points = {{-75.1592,62.3192},{-96.15519999999999,62.3192},{-96.15519999999999,88.60809999999999},{-75.19029999999999,88.60809999999999},{-75.19029999999999,88.283}}));
  connect(verschmutzung1.u,bevoelkerung1.y) annotation(Line(points = {{43.0995,13.8093},{-96.15519999999999,13.8093},{-96.15519999999999,88.3648},{-75.19029999999999,88.3648},{-75.19029999999999,88.283}}));
  connect(lebensmittelquote1.u,bevoelkerung1.realoutput1) annotation(Line(points = {{48.6318,53.5508},{48.6318,44.0252},{20.1258,44.0252},{20.1258,80.2659},{-49.7503,80.2659},{-49.7503,80.363}}));
  connect(bevoelkerung1.u,effektiveinvestquote1.realoutput1) annotation(Line(points = {{-75.19029999999999,80.363},{-89.3082,80.363},{-89.3082,-81.8477},{-43.525,-81.8477},{-43.525,-14.4654},{-36.7105,-14.4654},{-36.7105,-14.4032}}));
  connect(effektiveinvestquote1.realoutput1,lebensqualitaet1.u) annotation(Line(points = {{-36.7105,-14.4032},{-43.525,-14.4032},{-43.525,-81.8477},{52.5157,-81.8477},{52.5157,-68.0569},{52.4941,-68.0569}}));
  connect(bevoelkerung1.realoutput1,lebensqualitaet1.realinput3) annotation(Line(points = {{-49.7503,80.363},{20.1258,80.363},{20.1258,-51.2579},{39.7741,-51.2579},{39.7741,-51.3769}}));
  connect(natrohstoffea1.y,effektiveinvestquote1.realinput2) annotation(Line(points = {{-53.1366,-8.505470000000001},{-48.1166,-8.505470000000001},{-48.1166,-8.505470000000001},{-36.7105,-8.505470000000001},{-36.7105,-8.403169999999999}}));
  connect(lebensmittelquote1.y,investagrar1.u) annotation(Line(points = {{54.6318,78.99079999999999},{54.6318,92.4528},{88.67919999999999,92.4528},{88.67919999999999,-74.7255},{-3.77358,-74.7255},{-3.77358,-53.6647},{-3.72247,-53.6647}}));
  connect(lebensmittelquote1.realinput2,verschmutzung1.y) annotation(Line(points = {{60.6318,53.5508},{60.6318,45.5975},{78.6164,45.5975},{78.6164,9.748430000000001},{68.5395,9.748430000000001},{68.5395,9.849270000000001}}));
  connect(verschmutzung1.y,bevoelkerung1.realinput2) annotation(Line(points = {{68.5395,9.849270000000001},{78.6164,9.849270000000001},{78.6164,88.05029999999999},{-49.7503,88.05029999999999},{-49.7503,88.283}}));
  connect(verschmutzung1.y,lebensqualitaet1.realinput1) annotation(Line(points = {{68.5395,9.849270000000001},{78.6164,9.849270000000001},{78.6164,-51.5723},{65.2141,-51.5723},{65.2141,-51.3769}}));
  connect(lebensmittelquote1.y,lebensqualitaet1.realinput2) annotation(Line(points = {{54.6318,78.99079999999999},{54.6318,92.4528},{88.67919999999999,92.4528},{88.67919999999999,-59.1195},{65.2141,-59.1195},{65.2141,-59.2969}}));
  connect(investagrar1.y,effektiveinvestquote1.realinput1) annotation(Line(points = {{0.23753,-28.2247},{0.23753,-12.5786},{-11.2705,-12.5786},{-11.2705,-12.3632}}));
  connect(effektiveinvestquote1.y,lebensmittelquote1.realinput1) annotation(Line(points = {{-23.9905,4.31683},{-23.9905,35.2201},{54.4025,35.2201},{54.4025,53.5508},{54.6318,53.5508}}));
  connect(lebensmittelquote1.y,bevoelkerung1.realinput1) annotation(Line(points = {{54.6318,78.99079999999999},{54.6318,92.4528},{-49.7503,92.4528},{-49.7503,92.24299999999999}}));
  annotation(experiment(StartTime = 0.0, StopTime = 200.0, Tolerance = 1e-06));
end World2E;

