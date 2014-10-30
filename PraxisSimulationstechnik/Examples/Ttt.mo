within PraxisSimulationstechnik.Examples;
model Ttt
  Thermo.Auxiliary.TimedModuloCounter timedModuloCounter(
    offset=3,
    T=3,
    N=5) annotation (Placement(transformation(extent={{-44,18},{-24,38}})));
  annotation (uses(Modelica(version="3.2.1")));
end Ttt;
