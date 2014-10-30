within PraxisSimulationstechnik.Examples;
model World2B
  PJlib.Kap12.Bevoelkerung bevoelkerung1 annotation(Placement(transformation(origin = {-62.4703,84.32299999999999}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.Investitionen investitionen1 annotation(Placement(transformation(origin = {-62.7078,53.9192}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.LebensmittelQuote lebensmittelquote1 annotation(Placement(transformation(origin = {54.6318,66.27079999999999}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.InvestAgrar investagrar1 annotation(Placement(transformation(origin = {0.23753,-40.9447}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.Verschmutzung verschmutzung1 annotation(Placement(transformation(origin = {55.8195,9.849270000000001}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.EffektiveInvestQuote effektiveinvestquote1 annotation(Placement(transformation(origin = {-23.4141,-8.403169999999999}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.NatRohstoffe natrohstoffe1 annotation(Placement(transformation(origin = {-66.1448,-7.06455}, extent = {{-12,-12},{12,12}})));
  PJlib.Kap12.Lebensqualitaet lebensqualitaet annotation(Placement(transformation(origin = {55.6628,-40.9654}, extent = {{-12.0605,-12.0605},{12.0605,12.0605}})));
equation
  connect(bevoelkerung1.y,investitionen1.u) annotation(Line(points = {{-75.19029999999999,88.283},{-95.8775,88.283},{-95.8775,62.4264},{-75.8539,62.4264},{-75.8539,62.4264}}));
  connect(lebensmittelquote1.y,lebensqualitaet.realinput2) annotation(Line(points = {{54.6318,78.99079999999999},{54.6525,78.99079999999999},{54.6525,92.3439},{88.5748,92.3439},{88.5748,-44.7585},{68.7868,-44.7585},{68.7868,-44.7585}}));
  connect(bevoelkerung1.realoutput1,lebensmittelquote1.u) annotation(Line(points = {{-49.7503,80.363},{20.0236,80.363},{20.0236,45.7008},{48.5277,45.7008},{48.5277,53.2391},{48.5277,53.2391}}));
  connect(bevoelkerung1.realoutput1,lebensqualitaet.realinput3) annotation(Line(points = {{-49.7503,80.363},{20.0236,80.363},{20.0236,-36.7491},{42.4028,-36.7491},{42.4028,-36.7491}}));
  connect(investitionen1.y,verschmutzung1.realinput1) annotation(Line(points = {{-50.5938,55.1164},{4.61095,55.1164},{4.61095,5.76369},{43.2277,5.76369},{43.2277,5.76369}}));
  connect(investitionen1.y,effektiveinvestquote1.u) annotation(Line(points = {{-50.5938,55.1164},{4.61095,55.1164},{4.61095,-4.32277},{-10.3746,-4.32277},{-10.3746,-4.32277}}));
  connect(lebensqualitaet.realoutput1,investagrar1.realinput1) annotation(Line(points = {{43.8804,-47.5692},{19.6228,-47.5692},{19.6228,-62.466},{4.41514,-62.466},{4.41514,-52.6546},{4.41514,-52.6546}}));
  connect(effektiveinvestquote1.realoutput1,lebensqualitaet.u) annotation(Line(points = {{-36.1341,-14.4032},{-43.5159,-14.4032},{-43.5159,-81.84439999999999},{55.6196,-81.84439999999999},{55.6628,-53.4614},{55.6628,-53.7496}}));
  connect(verschmutzung1.y,lebensqualitaet.realinput1) annotation(Line(points = {{67.81950000000001,10.4763},{78.67440000000001,10.4763},{78.67440000000001,-36.5994},{68.1588,-36.9507},{68.447,-36.9507}}));
  connect(verschmutzung1.y,lebensmittelquote1.realinput2) annotation(Line(points = {{67.81950000000001,10.4763},{78.67440000000001,10.4763},{78.67440000000001,44.3804},{60.8069,44.3804},{60.8069,54.1787},{60.8069,54.1787}}));
  connect(verschmutzung1.y,bevoelkerung1.realinput2) annotation(Line(points = {{67.81950000000001,10.4763},{78.67440000000001,10.4763},{78.67440000000001,88.4726},{-50.4323,88.4726},{-50.4323,88.4726}}));
  connect(lebensmittelquote1.realinput1,effektiveinvestquote1.y) annotation(Line(points = {{54.6318,53.5508},{54.755,53.5508},{54.755,33.4294},{-23.3429,33.4294},{-23.3429,4.89914},{-23.3429,4.89914}}));
  connect(effektiveinvestquote1.realoutput1,natrohstoffe1.realinput1) annotation(Line(points = {{-36.1341,-14.4032},{-43.5159,-14.4032},{-43.5159,-81.84439999999999},{-89.3372,-81.84439999999999},{-89.3372,-13.5447},{-78.3862,-13.5447},{-78.3862,-13.5447}}));
  connect(natrohstoffe1.y,effektiveinvestquote1.realinput2) annotation(Line(points = {{-53.4533,-7.06455},{-35.7349,-7.06455},{-35.7349,-6.82996},{-35.249,-6.82996}}));
  connect(natrohstoffe1.u,bevoelkerung1.y) annotation(Line(points = {{-78.00230000000001,-1.27833},{-95.9903,-1.27833},{-95.9903,88.4569},{-75.19029999999999,88.4569},{-75.19029999999999,88.283}}));
  connect(effektiveinvestquote1.realoutput1,investitionen1.realinput1) annotation(Line(points = {{-36.1341,-14.4032},{-43.5159,-14.4032},{-43.5159,-81.84439999999999},{-89.3372,-81.84439999999999},{-89.3372,55.9078},{-74.8218,55.9078},{-74.8218,55.6579}}));
  connect(investagrar1.y,effektiveinvestquote1.realinput1) annotation(Line(points = {{0.23753,-28.2247},{0.23753,-12.5786},{-10.6941,-12.5786},{-10.6941,-12.3632}}));
  connect(bevoelkerung1.u,effektiveinvestquote1.realoutput1) annotation(Line(points = {{-75.19029999999999,80.363},{-89.3082,80.363},{-89.3082,-81.8477},{-43.525,-81.8477},{-43.525,-14.4654},{-36.7105,-14.4032},{-36.1341,-14.4032}}));
  connect(lebensmittelquote1.y,investagrar1.u) annotation(Line(points = {{54.6318,78.99079999999999},{54.6318,92.4528},{88.67919999999999,92.4528},{88.67919999999999,-74.7255},{-3.77358,-74.7255},{-3.77358,-53.6647},{-3.72247,-53.6647}}));
  connect(lebensmittelquote1.y,bevoelkerung1.realinput1) annotation(Line(points = {{54.6318,78.99079999999999},{54.6318,92.4528},{-49.7503,92.4528},{-49.7503,92.24299999999999}}));
  connect(verschmutzung1.u,bevoelkerung1.y) annotation(Line(points = {{43.0995,13.8093},{-95.9119,13.8093},{-95.9119,88.3648},{-75.19029999999999,88.3648},{-75.19029999999999,88.283}}));
  annotation(experiment(StartTime = 0.0, StopTime = 200.0, Tolerance = 1e-06));
end World2B;

