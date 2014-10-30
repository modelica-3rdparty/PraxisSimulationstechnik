within PraxisSimulationstechnik.Solutions;
model World2D
  PJlib.Kap12.Investitionen investitionen1 annotation(Placement(transformation(origin = {-62.7078,53.9192}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.LebensmittelQuote lebensmittelquote1 annotation(Placement(transformation(origin = {54.6318,66.27079999999999}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.NatRohstoffe natrohstoffe1 annotation(Placement(transformation(origin = {-65.5582,-8.640700000000001}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.EffektiveInvestQuote effektiveinvestquote1 annotation(Placement(transformation(origin = {-23.9905,-8.403169999999999}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.InvestAgrar investagrar1 annotation(Placement(transformation(origin = {0.23753,-40.9447}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.Verschmutzung verschmutzung1 annotation(Placement(transformation(origin = {55.8195,9.849270000000001}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.Lebensqualitaet lebensqualitaet1 annotation(Placement(transformation(origin = {52.4941,-55.3369}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.BevoelkerungA bevoelkerunga1 annotation(Placement(transformation(origin = {-61.0451,84.32299999999999}, extent = {{-12,-12},{12,12}})));
equation
  connect(investitionen1.y,verschmutzung1.realinput1) annotation(Line(points = {{-50.5938,55.1164},{4.61095,55.1164},{4.61095,5.4755},{43.5159,5.4755},{43.5159,5.4755}}));
  connect(investitionen1.y,effektiveinvestquote1.u) annotation(Line(points = {{-50.5938,55.1164},{4.61095,55.1164},{4.61095,-4.32277},{-10.3746,-4.32277},{-10.3746,-4.32277}}));
  connect(effektiveinvestquote1.realoutput1,investitionen1.realinput1) annotation(Line(points = {{-36.7105,-14.4032},{-41.7867,-14.4032},{-41.7867,-81.84439999999999},{-89.3372,-81.84439999999999},{-89.3372,55.6196},{-75.5043,55.6196},{-75.5043,55.6196}}));
  connect(bevoelkerunga1.y,natrohstoffe1.u) annotation(Line(points = {{-73.7651,88.283},{-95.9654,88.283},{-95.9654,-2.88184},{-77.2334,-2.88184},{-77.2334,-2.88184}}));
  connect(effektiveinvestquote1.realoutput1,natrohstoffe1.realinput1) annotation(Line(points = {{-36.7105,-14.4032},{-41.7867,-14.4032},{-41.7867,-81.84439999999999},{-89.3372,-81.84439999999999},{-89.3372,-14.9856},{-78.67440000000001,-14.9856},{-78.67440000000001,-14.9856}}));
  connect(lebensqualitaet1.realoutput1,investagrar1.realinput1) annotation(Line(points = {{40.7708,-61.9075},{4.61095,-61.9075},{4.61095,-53.6023},{4.61095,-53.6023}}));
  connect(bevoelkerunga1.realoutput1,lebensmittelquote1.u) annotation(Line(points = {{-48.3251,80.363},{20.19,80.363},{20.19,42.5178},{48.9311,42.5178},{48.9311,53.5508},{48.6318,53.5508}}));
  connect(bevoelkerunga1.realoutput1,lebensqualitaet1.realinput3) annotation(Line(points = {{-48.3251,80.363},{20.19,80.363},{20.19,-51.3064},{39.7741,-51.3064},{39.7741,-51.3769}}));
  connect(bevoelkerunga1.realinput2,verschmutzung1.y) annotation(Line(points = {{-48.3251,88.283},{78.6223,88.283},{78.6223,9.738720000000001},{68.5395,9.738720000000001},{68.5395,9.849270000000001}}));
  connect(bevoelkerunga1.realinput1,lebensmittelquote1.y) annotation(Line(points = {{-48.3251,92.24299999999999},{54.6318,92.24299999999999},{54.6318,78.99079999999999},{54.6318,78.99079999999999}}));
  connect(verschmutzung1.u,bevoelkerunga1.y) annotation(Line(points = {{43.0995,13.8093},{-95.962,13.8093},{-95.962,88.361},{-73.7651,88.361},{-73.7651,88.283}}));
  connect(bevoelkerunga1.y,investitionen1.u) annotation(Line(points = {{-73.7651,88.283},{-95.962,88.283},{-95.962,62.4703},{-75.1592,62.4703},{-75.1592,62.3192}}));
  connect(bevoelkerunga1.u,effektiveinvestquote1.realoutput1) annotation(Line(points = {{-73.7651,80.363},{-89.3112,80.363},{-89.3112,-81.9477},{-41.8052,-81.9477},{-41.8052,-14.4893},{-36.7105,-14.4893},{-36.7105,-14.4032}}));
  connect(effektiveinvestquote1.realoutput1,lebensqualitaet1.u) annotation(Line(points = {{-36.7105,-14.4032},{-41.8239,-14.4032},{-41.8239,-81.8477},{52.5157,-81.8477},{52.5157,-68.0569},{52.4941,-68.0569}}));
  connect(lebensmittelquote1.y,investagrar1.u) annotation(Line(points = {{54.6318,78.99079999999999},{54.6318,92.4528},{88.67919999999999,92.4528},{88.67919999999999,-74.7255},{-3.77358,-74.7255},{-3.77358,-53.6647},{-3.72247,-53.6647}}));
  connect(lebensmittelquote1.realinput2,verschmutzung1.y) annotation(Line(points = {{60.6318,53.5508},{60.6318,45.5975},{78.6164,45.5975},{78.6164,9.748430000000001},{68.5395,9.748430000000001},{68.5395,9.849270000000001}}));
  connect(verschmutzung1.y,lebensqualitaet1.realinput1) annotation(Line(points = {{68.5395,9.849270000000001},{78.6164,9.849270000000001},{78.6164,-51.5723},{65.2141,-51.5723},{65.2141,-51.3769}}));
  connect(lebensmittelquote1.y,lebensqualitaet1.realinput2) annotation(Line(points = {{54.6318,78.99079999999999},{54.6318,92.4528},{88.67919999999999,92.4528},{88.67919999999999,-59.1195},{65.2141,-59.1195},{65.2141,-59.2969}}));
  connect(investagrar1.y,effektiveinvestquote1.realinput1) annotation(Line(points = {{0.23753,-28.2247},{0.23753,-12.5786},{-11.2705,-12.5786},{-11.2705,-12.3632}}));
  connect(effektiveinvestquote1.y,lebensmittelquote1.realinput1) annotation(Line(points = {{-23.9905,4.31683},{-23.9905,35.2201},{54.4025,35.2201},{54.4025,53.5508},{54.6318,53.5508}}));
  connect(natrohstoffe1.y,effektiveinvestquote1.realinput2) annotation(Line(points = {{-52.8382,-8.640700000000001},{-36.7925,-8.640700000000001},{-36.7925,-8.403169999999999},{-36.7105,-8.403169999999999}}));
  annotation(experiment(StartTime = 0.0, StopTime = 200.0, Tolerance = 1e-06));
end World2D;

