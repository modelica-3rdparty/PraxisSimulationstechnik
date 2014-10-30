within ;
package PJlib
  import Modelica.SIunits.*;
  package Kap12
    block CapacityConverter
      extends SystemDynamics.Interfaces.GenericConverter3;
    equation
      out1 = in2 / (1 - in1 / in3);
    end CapacityConverter;

    block ECIRConverter
      extends SystemDynamics.Interfaces.GenericConverter4;
    equation
      out1 = in2 * in3 * (1 - in4) / (1 - in1);
    end ECIRConverter;

    model InvestAgrar
      SystemDynamics.Flows.Mult2DivFlow mult2divflow1 annotation(Placement(transformation(origin = {-33.7862,9.5772}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Flows.Div2Flow div2flow1 annotation(Placement(transformation(origin = {31.1259,9.5772}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 15) annotation(Placement(transformation(origin = {-0.7981,-39.1069}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter CFIFR(table = "cfifr", file = "world2.txt") annotation(Placement(transformation(origin = {-33.2542,-75.0214}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Reservoirs.Stock stock1(m0 = 0.2) annotation(Placement(transformation(origin = {0.266033,9.31116}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-61.487,9.74667}, extent = {{-7.39096,-7.39096},{7.39096,7.39096}})));
      SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {59.5327,9.87968}, extent = {{-7.99511,-7.99511},{7.99511,7.99511}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-33,-106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {-33,-106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {33,-106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {33,-106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {0,106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {0,106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
    equation
      connect(stock1.out1,y) annotation(Line(points = {{0.266033,18.3112},{0.266033,97.9002},{0,97.9002},{0,106}}));
      connect(mult2divflow1.in2,realinput1) annotation(Line(points = {{-33.7862,-2.4228},{-33.7862,-52.6746},{32.9881,-52.6746},{32.9881,-106},{33,-106}}));
      connect(CFIFR.in1,u) annotation(Line(points = {{-33.2542,-87.0214},{-33.2542,-100.827},{-33,-100.827},{-33,-106}}));
      connect(div2flow1.outflow,cloudsink1.inflow) annotation(Line(points = {{43.1259,9.5772},{49.7482,9.5772},{51.5376,9.84323},{51.5376,9.87968}}));
      connect(cloudsource1.outflow,mult2divflow1.inflow) annotation(Line(points = {{-54.0961,9.74667},{-44.6936,9.74667},{-44.6936,9.5772},{-45.7862,9.5772}}));
      connect(stock1.out2,div2flow1.in1) annotation(Line(points = {{0.266033,0.311164},{0.266033,-10.6413},{25.2732,-10.6413},{25.2732,-2.4228},{25.1259,-2.4228}}));
      connect(stock1.outflow,div2flow1.inflow) annotation(Line(points = {{12.266,9.31116},{19.4204,9.31116},{19.4204,9.5772},{19.1259,9.5772}}));
      connect(mult2divflow1.outflow,stock1.inflow) annotation(Line(points = {{-21.7862,9.5772},{-12.7696,9.5772},{-12.7696,9.31116},{-11.734,9.31116}}));
      connect(CFIFR.out1,mult2divflow1.in1) annotation(Line(points = {{-33.2542,-63.0214},{-33.2542,-58.2613},{-42.2993,-58.2613},{-42.2993,-2.4228},{-42.1862,-2.4228}}));
      connect(mult2divflow1.in3,constantconverter1.out) annotation(Line(points = {{-25.3862,-2.4228},{-25.3862,-19.9525},{-0.7981,-19.9525},{-0.7981,-27.1069},{-0.7981,-27.1069}}));
      connect(constantconverter1.out,div2flow1.in2) annotation(Line(points = {{-0.7981,-27.1069},{-0.7981,-19.9525},{36.9786,-19.9525},{36.9786,-2.92637},{37.1259,-2.92637},{37.1259,-2.4228}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Invest. Agrar", fontName=  "Times New Roman")}));
    end InvestAgrar;

    model Verschmutzung
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-106,33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-98.3373,33.0166}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-106,-31}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-97.1496,-35.6295}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {106,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,5.22565}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter POLCM(table = "polcm", file = "world2.txt") annotation(Placement(transformation(origin = {-72.209,2.61283}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Reservoirs.Stock stock1(m0 = 200000000.0) annotation(Placement(transformation(origin = {-1.90024,13.5392}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter POLAT(table = "polat", file = "world2.txt") annotation(Placement(transformation(origin = {0.475059,-75.772}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-2.07497,69.814}, extent = {{-7.62322,7.62322},{7.62322,-7.62322}}, rotation = -90)));
      SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {-1.43136,-49.3804}, extent = {{-8.73406,8.73406},{8.73406,-8.73406}}, rotation = -90)));
      SystemDynamics.Flows.Mult3Flow mult3flow1 annotation(Placement(transformation(origin = {-1.90024,44.4181}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter constantconverter2 annotation(Placement(transformation(origin = {-35.3919,52.9691}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.Div2Converter div2converter1 annotation(Placement(transformation(origin = {63.8955,6.4133}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 3600000000.0) annotation(Placement(transformation(origin = {30.8789,-0.712589}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Flows.Div2Flow div2flow1 annotation(Placement(transformation(origin = {-1.90024,-16.6271}, extent = {{-12,-12},{12,12}}, rotation = -90)));
    equation
      connect(stock1.outflow,div2flow1.inflow) annotation(Line(points = {{-1.90024,1.53919},{-1.90024,1.53919},{-1.90024,-4.6271},{-1.90024,-4.6271}}));
      connect(div2flow1.outflow,cloudsink1.inflow) annotation(Line(points = {{-1.90024,-28.6271},{-1.90024,-28.6271},{-1.66271,-40.6463},{-1.43136,-40.6463}}));
      connect(POLAT.out1,div2flow1.in2) annotation(Line(points = {{-11.5249,-75.772},{-11.5249,-75.772},{-26.6033,-75.772},{-26.6033,-22.5653},{-13.9002,-22.6271},{-13.9002,-22.6271}}));
      connect(stock1.out2,div2flow1.in1) annotation(Line(points = {{-10.9002,13.5392},{-10.9002,13.5392},{-25.1781,13.5392},{-25.1781,-10.4513},{-13.9002,-10.6271},{-13.9002,-10.6271}}));
      connect(constantconverter1.out,div2converter1.in2) annotation(Line(points = {{42.8789,-0.712589},{42.8789,-0.712589},{51.8955,-0.7867},{51.8955,-0.7867}}));
      connect(stock1.out1,div2converter1.in1) annotation(Line(points = {{7.09976,13.5392},{7.09976,13.5392},{51.8955,13.6133},{51.8955,13.6133}}));
      connect(POLAT.in1,div2converter1.out1) annotation(Line(points = {{12.4751,-75.772},{12.4751,-75.5344},{76.0095,-75.5344},{75.8955,6.4133},{75.8955,6.4133}}));
      connect(div2converter1.out1,y) annotation(Line(points = {{75.8955,6.4133},{75.8955,-0.0855107},{106,-0.0855107},{106,0}}));
      connect(constantconverter2.out,mult3flow1.in1) annotation(Line(points = {{-23.3919,52.9691},{-23.3919,52.9691},{-13.9002,52.8181},{-13.9002,52.8181}}));
      connect(mult3flow1.inflow,cloudsource1.outflow) annotation(Line(points = {{-1.90024,56.4181},{-1.90024,56.4181},{-2.13777,62.1908},{-2.07497,62.1908}}));
      connect(mult3flow1.outflow,stock1.inflow) annotation(Line(points = {{-1.90024,32.4181},{-1.90024,32.4181},{-1.66271,25.5392},{-1.90024,25.5392}}));
      connect(u,mult3flow1.in2) annotation(Line(points = {{-106,33},{-87.1734,33},{-87.1734,44.4181},{-13.9002,44.4181},{-13.9002,44.4181}}));
      connect(POLCM.out1,mult3flow1.in3) annotation(Line(points = {{-72.209,14.6128},{-72.209,36.1045},{-13.9002,36.1045},{-13.9002,36.0181}}));
      connect(realinput1,POLCM.in1) annotation(Line(points = {{-106,-31},{-72.209,-31},{-72.209,-9.38717},{-72.209,-9.38717}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Verschmutzung", fontName=  "Times New Roman")}));
    end Verschmutzung;

    model LebensmittelQuote
      SystemDynamics.Converters.GraphConverter FPCI(table = "fpci", file = "world2.txt") annotation(Placement(transformation(origin = {-0.266033,-47.3539}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter FPM(table = "fpm", file = "world2.txt") annotation(Placement(transformation(origin = {49.2162,-47.3539}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter FCM(table = "fcm", file = "world2.txt") annotation(Placement(transformation(origin = {-52.1425,-46.8219}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.ConstantConverter constantconverter1 annotation(Placement(transformation(origin = {-20.7506,-17.0261}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.ConstantConverter constantconverter2 annotation(Placement(transformation(origin = {22.8789,-18.0903}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.Mult5Converter mult5converter1 annotation(Placement(transformation(origin = {-0.266033,32.19}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {0,106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {0,106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-50,-106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {-50,-106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {0,-106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {0,-106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput realinput2 annotation(Placement(transformation(origin = {50,-106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {50,-106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
    equation
      connect(FPM.in1,realinput2) annotation(Line(points = {{49.2162,-59.3539},{49.2162,-101.359},{50,-101.359},{50,-106}}));
      connect(FPCI.in1,realinput1) annotation(Line(points = {{-0.266033,-59.3539},{-0.266033,-101.625},{0,-101.625},{0,-106}}));
      connect(FCM.in1,u) annotation(Line(points = {{-52.1425,-58.8219},{-52.1425,-98.9644},{-50,-98.9644},{-50,-106}}));
      connect(mult5converter1.out1,y) annotation(Line(points = {{-0.266033,44.19},{-0.266033,97.6342},{0,97.6342},{0,106}}));
      connect(FPM.out1,mult5converter1.in5) annotation(Line(points = {{49.2162,-35.3539},{49.2162,9.31116},{10.9074,9.31116},{10.9074,20.19},{10.534,20.19}}));
      connect(FCM.out1,mult5converter1.in1) annotation(Line(points = {{-52.1425,-34.8219},{-52.1425,9.31116},{-10.9074,9.31116},{-10.9074,20.19},{-11.066,20.19}}));
      connect(constantconverter2.out,mult5converter1.in4) annotation(Line(points = {{22.8789,-6.09026},{22.8789,2.66033},{5.05463,2.66033},{5.05463,20.19},{5.13397,20.19}}));
      connect(constantconverter1.out,mult5converter1.in2) annotation(Line(points = {{-20.7506,-5.02613},{-20.7506,2.66033},{-5.5867,2.66033},{-5.5867,20.19},{-5.66603,20.19}}));
      connect(FPCI.out1,mult5converter1.in3) annotation(Line(points = {{-0.266033,-35.3539},{-0.266033,19.6865},{-0.266033,19.6865},{-0.266033,20.19}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Lebensm.Quote", fontName=  "Times New Roman")}));
    end LebensmittelQuote;

    model Lebensqualitaet
      Modelica.Blocks.Interfaces.RealInput realinput3 annotation(Placement(transformation(origin = {-106,33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-106,33}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.MultPower5Converter multpower5converter1 annotation(Placement(transformation(origin = {-0.266033,68.9026}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter QLM(table = "qlm", file = "world2.txt") annotation(Placement(transformation(origin = {-5.5867,-7.65083}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter QLC(table = "qlc", file = "world2.txt") annotation(Placement(transformation(origin = {-74.4893,32.7221}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter QLP(table = "qlp", file = "world2.txt") annotation(Placement(transformation(origin = {68.6366,32.9881}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.Mult2GraphConverter CIQR(table = "ciqr", file = "world2.txt") annotation(Placement(transformation(origin = {-69.4347,-32.9881}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter QLF(table = "qlf", file = "world2.txt") annotation(Placement(transformation(origin = {67.8385,-40.7031}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.ConstantConverter constantconverter1 annotation(Placement(transformation(origin = {55.601,13.5677}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {106,33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {106,33.2882}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput realinput2 annotation(Placement(transformation(origin = {106,-33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {106,-32.7118}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {0,-106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {0,-106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {0,106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {0,106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealOutput realoutput1 annotation(Placement(transformation(origin = {-106,-33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {-97.6945,-54.755}, extent = {{12,-12},{-12,12}})));
    equation
      connect(multpower5converter1.out1,y) annotation(Line(points = {{-0.266033,80.9026},{-0.266033,97.9002},{0,97.9002},{0,106}}));
      connect(QLM.in1,u) annotation(Line(points = {{-5.5867,-19.6508},{-5.5867,-81.1401},{0,-81.1401},{0,-106},{0,-106}}));
      connect(QLF.in1,realinput2) annotation(Line(points = {{79.8385,-40.7031},{79.8385,-40.7031},{86.1948,-40.7031},{86.1948,-32.9881},{106,-33},{106,-33}}));
      connect(QLP.in1,realinput1) annotation(Line(points = {{80.6366,32.9881},{80.6366,32.9881},{106,33},{106,33}}));
      connect(CIQR.out1,realoutput1) annotation(Line(points = {{-81.4347,-32.9881},{-81.4347,-32.9881},{-106,-33},{-106,-33}}));
      connect(constantconverter1.out,multpower5converter1.in4) annotation(Line(points = {{43.601,13.5677},{43.601,13.5677},{5.32067,13.5677},{5.32067,56.6651},{5.13397,56.6651},{5.13397,56.9026}}));
      connect(multpower5converter1.in3,QLF.out1) annotation(Line(points = {{-0.266033,56.9026},{-0.266033,3.72447},{35.6485,3.72447},{35.6485,-40.7031},{55.8385,-40.7031},{55.8385,-40.7031}}));
      connect(QLM.out1,CIQR.in2) annotation(Line(points = {{-5.5867,4.34917},{-5.5867,12.5036},{-47.0879,12.5036},{-47.0879,-25.8052},{-57.4347,-25.8052},{-57.4347,-25.7881}}));
      connect(multpower5converter1.in2,QLM.out1) annotation(Line(points = {{-5.66603,56.9026},{-5.66603,4.52257},{-5.5867,4.52257},{-5.5867,4.34917}}));
      connect(QLF.out1,CIQR.in1) annotation(Line(points = {{55.8385,-40.7031},{55.8385,-40.7031},{-57.4347,-40.7031},{-57.4347,-40.1881}}));
      connect(QLP.out1,multpower5converter1.in5) annotation(Line(points = {{56.6366,32.9881},{56.6366,32.9881},{10.6413,32.9881},{10.6413,56.9026},{10.534,56.9026}}));
      connect(QLC.out1,multpower5converter1.in1) annotation(Line(points = {{-62.4893,32.7221},{-62.4893,32.7221},{-10.9074,32.7221},{-10.9074,56.9026},{-11.066,56.9026}}));
      connect(realinput3,QLC.in1) annotation(Line(points = {{-106,33},{-86.9929,33},{-86.9929,32.7221},{-86.4893,32.7221}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-92.0857,27.4441},{87.9143,-12.5559}}, textString=  "Lebensqualität", fontName=  "Times New Roman")}));
    end Lebensqualitaet;

    model EffektiveInvestQuote
      Modelica.Blocks.Interfaces.RealInput realinput2 annotation(Placement(transformation(origin = {-106,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-98.6238,13.1101}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.MultPower3Converter multpower3converter1(k2 = -1.0) annotation(Placement(transformation(origin = {0.595914,70.9138}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.Div2Converter div2converter1 annotation(Placement(transformation(origin = {-69.1261,-49.4609}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.ConstantConverter constantconverter2 annotation(Placement(transformation(origin = {-31.8814,-42.3099}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      PJlib.Kap12.ECIRConverter ecirconverter1 annotation(Placement(transformation(origin = {18.4733,-14.5999}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.3) annotation(Placement(transformation(origin = {-28.3059,-3.87344}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealOutput realoutput1 annotation(Placement(transformation(origin = {-106,-50}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {-106,-50}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {106,33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {106,33}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {106,-33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {106,-33}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {0,106}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {0,106}, extent = {{-12,-12},{12,12}}, rotation = 90)));
    equation
      connect(constantconverter1.out,ecirconverter1.in1) annotation(Line(points = {{-16.3059,-3.87344},{-16.3059,-3.87344},{6.47335,-3.7999},{6.4733,-3.7999}}));
      connect(multpower3converter1.in2,constantconverter1.out) annotation(Line(points = {{0.595914,58.9138},{0.595914,-3.87344},{-16.3059,-3.87344},{-16.3059,-3.87344}}));
      connect(multpower3converter1.out1,y) annotation(Line(points = {{0.595914,82.9138},{0.595914,98.0279},{0,98.0279},{0,106}}));
      connect(u,multpower3converter1.in1) annotation(Line(points = {{106,33},{-8.64076,33},{-8.64076,58.9138},{-9.00409,58.9138}}));
      connect(ecirconverter1.in2,u) annotation(Line(points = {{6.4733,-10.9999},{6.4733,-11.0244},{-8.64076,-11.0244},{-8.64076,33.0733},{106,33},{106,33}}));
      connect(multpower3converter1.in3,realinput1) annotation(Line(points = {{10.1959,58.9138},{10.1959,47.9711},{65.5506,47.9711},{65.5506,-33.0733},{106,-33.0733},{106,-33}}));
      connect(ecirconverter1.in4,realinput1) annotation(Line(points = {{6.4733,-25.3999},{6.4733,-25.3264},{-4.76732,-25.3264},{-4.76732,-33.0733},{106,-33},{106,-33}}));
      connect(div2converter1.out1,realoutput1) annotation(Line(points = {{-81.1261,-49.4609},{-81.1261,-49.4609},{-106,-50},{-106,-50}}));
      connect(realinput2,ecirconverter1.in3) annotation(Line(points = {{-106,0},{-81.0444,0},{-81.0444,-18.1754},{6.47335,-18.1999},{6.4733,-18.1999}}));
      connect(div2converter1.in1,ecirconverter1.out1) annotation(Line(points = {{-57.1261,-56.6609},{-57.1261,-56.6119},{43.5018,-56.6119},{43.5018,-14.5999},{30.4733,-14.5999},{30.4733,-14.5999}}));
      connect(constantconverter2.out,div2converter1.in2) annotation(Line(points = {{-43.8814,-42.3099},{-43.8814,-42.3099},{-57.1261,-42.3099},{-57.1261,-42.2609}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-89.4041,82.2682},{90.5959,42.2682}}, textString=  "Effekt. InvestQuote", fontName=  "Times New Roman")}));
    end EffektiveInvestQuote;

    model Bevoelkerung
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-106,-33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-106,-33}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput realoutput1 annotation(Placement(transformation(origin = {106,-33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {106,-33}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.ConstantConverter PDN(constValue = 26.5) annotation(Placement(transformation(origin = {53.9729,-16.4917}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Flows.Mult6Flow DR annotation(Placement(transformation(origin = {-20.9895,-22.4888}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter DRFM(table = "drfm", file = "world2.txt") annotation(Placement(transformation(origin = {16.4917,-22.1889}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter DRPM(table = "drpm", file = "world2.txt") annotation(Placement(transformation(origin = {16.4918,-36.5817}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Flows.Mult6Flow BR annotation(Placement(transformation(origin = {-20.3898,38.6806}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      SystemDynamics.Reservoirs.Stock stock1(m0 = 1650000000.0) annotation(Placement(transformation(origin = {-20.3898,8.69565}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter BRPM(table = "brpm", file = "world2.txt") annotation(Placement(transformation(origin = {16.7916,38.6806}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter BRFM(table = "brfm", file = "world2.txt") annotation(Placement(transformation(origin = {16.4918,53.3733}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter BRCM(table = "brcm", file = "world2.txt") annotation(Placement(transformation(origin = {16.7916,24.2879}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter DRCM(table = "drcm", file = "world2.txt") annotation(Placement(transformation(origin = {16.7916,-5.39735}, extent = {{12,-12},{-12,12}}, rotation = -270)));
      SystemDynamics.Converters.ConstantConverter BRN(constValue = 0.04) annotation(Placement(transformation(origin = {-50.8375,65.0338}, extent = {{12,-12},{-12,12}}, rotation = -180)));
      SystemDynamics.Converters.ConstantConverter DRN(constValue = 0.028) annotation(Placement(transformation(origin = {-55.7721,-22.1889}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter DRMM(table = "drmm", file = "world2.txt") annotation(Placement(transformation(origin = {-55.7721,-38.9805}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter BRMM(table = "brmm", file = "world2.txt") annotation(Placement(transformation(origin = {-53.3733,38.3808}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {-20.7892,-48.5408}, extent = {{-8.703,8.703},{8.703,-8.703}}, rotation = -90)));
      SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-20.5579,62.0449}, extent = {{-7.39235,7.39235},{7.39235,-7.39235}}, rotation = -90)));
      SystemDynamics.Converters.MultPower3Converter CR(k1 = -1.0, k3 = -1.0) annotation(Placement(transformation(origin = {71.3643,8.3958}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter LA(constValue = 135000000.0) annotation(Placement(transformation(origin = {52.7736,31.1844}, extent = {{12,-12},{-12,12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {-106,33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {-106,33}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {106,66}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {106,66}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput realinput2 annotation(Placement(transformation(origin = {106,33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {106,33}, extent = {{-12,12},{12,-12}}, rotation = -180)));
    equation
      connect(LA.out,CR.in1) annotation(Line(points = {{52.7736,19.1844},{52.7736,19.1844},{59.3643,17.991},{59.3643,17.9958}}));
      connect(stock1.out1,CR.in2) annotation(Line(points = {{-11.3898,8.69565},{-11.3898,8.69565},{59.3643,8.3958},{59.3643,8.3958}}));
      connect(PDN.out,CR.in3) annotation(Line(points = {{53.9729,-4.49175},{53.9729,-1.49925},{59.3643,-1.49925},{59.3643,-1.2042}}));
      connect(CR.out1,realoutput1) annotation(Line(points = {{83.3643,8.3958},{83.3643,8.31174},{86.3568,8.31174},{86.3568,-33.1323},{106,-33.1323},{106,-33}}));
      connect(DRCM.in1,CR.out1) annotation(Line(points = {{28.7916,-5.39735},{28.7916,-5.09745},{42.2789,-5.09745},{42.2789,-33.1774},{86.3568,-33.1774},{86.3568,8.31174},{83.6582,8.31174},{83.3643,8.3958},{83.3643,8.3958}}));
      connect(BRCM.in1,CR.out1) annotation(Line(points = {{28.7916,24.2879},{28.7916,24.063},{42.2789,24.063},{42.2789,-33.1774},{86.3568,-33.1774},{86.3568,8.34255},{83.3643,8.3958},{83.3643,8.3958}}));
      connect(cloudsource1.outflow,BR.inflow) annotation(Line(points = {{-20.5579,54.6525},{-20.5579,55.7661},{-20.3898,50.6806},{-20.3898,50.6806}}));
      connect(DR.outflow,cloudsink1.inflow) annotation(Line(points = {{-20.9895,-34.4888},{-20.9895,-34.4888},{-20.9895,-39.8378},{-20.7892,-39.8378}}));
      connect(y,stock1.out2) annotation(Line(points = {{-106,33},{-86.9565,33},{-86.9565,8.69565},{-29.3898,8.69565},{-29.3898,8.69565}}));
      connect(BRPM.in1,realinput2) annotation(Line(points = {{28.7916,38.6806},{28.7916,38.5748},{79.0119,38.5748},{79.0119,32.9881},{106,33},{106,33}}));
      connect(DRPM.in1,realinput2) annotation(Line(points = {{28.4918,-36.5817},{28.4918,-36.7126},{42.0333,-36.7126},{42.0333,-47.0879},{113.33,-47.0879},{106,33},{106,33}}));
      connect(BRFM.in1,realinput1) annotation(Line(points = {{28.4918,53.3733},{28.4918,53.5447},{78.7106,53.5447},{78.7106,65.9038},{106,66},{106,66}}));
      connect(DRFM.in1,realinput1) annotation(Line(points = {{28.4917,-22.1889},{28.4917,-21.9533},{38.0167,-21.9533},{38.0167,-61.0409},{121.566,-61.0409},{121.566,65.1041},{106,66},{106,66}}));
      connect(BRMM.out1,BR.in2) annotation(Line(points = {{-41.3733,38.3808},{-41.3733,38.6806},{-32.3898,38.6806},{-32.3898,38.6806}}));
      connect(BRMM.in1,u) annotation(Line(points = {{-65.3733,38.3808},{-65.3733,38.3808},{-79.1604,38.3808},{-79.1604,-32.3635},{-106,-32.3635},{-106,-33}}));
      connect(DRMM.out1,DR.in3) annotation(Line(points = {{-43.7721,-38.9805},{-43.7721,-38.9805},{-37.4813,-38.9805},{-37.4813,-30.8846},{-32.9895,-30.8846},{-32.9895,-30.8888}}));
      connect(DRMM.in1,u) annotation(Line(points = {{-67.7721,-38.9805},{-67.7721,-39.1069},{-79.2779,-39.1069},{-79.2779,-32.4561},{-106,-32.4561},{-106,-33}}));
      connect(DRN.out,DR.in2) annotation(Line(points = {{-43.7721,-22.1889},{-43.7721,-22.4888},{-32.9895,-22.4888},{-32.9895,-22.4888}}));
      connect(BRN.out,BR.in1) annotation(Line(points = {{-50.8375,53.0338},{-50.8375,53.0338},{-32.3898,47.1821},{-32.3898,47.0806}}));
      connect(BRFM.out1,BR.in4) annotation(Line(points = {{4.4918,53.3733},{4.4918,53.3305},{-1.49925,53.3305},{-1.49925,47.0765},{-8.3898,47.0765},{-8.3898,47.0806}}));
      connect(DRCM.out1,DR.in4) annotation(Line(points = {{4.7916,-5.39735},{4.7916,-5.35446},{-1.7991,-5.35446},{-1.7991,-14.093},{-8.9895,-14.093},{-8.9895,-14.0888}}));
      connect(BRPM.out1,BR.in5) annotation(Line(points = {{4.7916,38.6806},{4.7916,38.6378},{-8.3898,38.6378},{-8.3898,38.6806}}));
      connect(DR.in1,stock1.out2) annotation(Line(points = {{-32.9895,-14.0888},{-32.9895,-14.093},{-37.4813,-14.093},{-37.4813,8.69565},{-29.3898,8.69565},{-29.3898,8.69565}}));
      connect(BRCM.out1,BR.in6) annotation(Line(points = {{4.7916,24.2879},{4.7916,23.988},{-1.49925,23.988},{-1.49925,30.2849},{-8.3898,30.2849},{-8.3898,30.2806}}));
      connect(BR.outflow,stock1.inflow) annotation(Line(points = {{-20.3898,26.6806},{-20.6897,26.6806},{-20.6897,20.6957},{-20.3898,20.6957}}));
      connect(stock1.outflow,DR.inflow) annotation(Line(points = {{-20.3898,-3.30435},{-20.3898,-5.4033},{-20.9895,-10.4888},{-20.9895,-10.4888}}));
      connect(BR.in3,stock1.out2) annotation(Line(points = {{-32.3898,30.2806},{-32.3898,29.9851},{-37.4813,29.9851},{-37.4813,8.69565},{-29.3898,8.69565},{-29.3898,8.69565}}));
      connect(DRPM.out1,DR.in6) annotation(Line(points = {{4.4918,-36.5817},{4.4918,-36.5817},{-1.7991,-36.5817},{-1.7991,-30.5847},{-8.9895,-30.5847},{-8.9895,-30.8888}}));
      connect(DRFM.out1,DR.in5) annotation(Line(points = {{4.49175,-22.1889},{4.49175,-22.4888},{-8.9895,-22.4888},{-8.9895,-22.4888}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Bevölkerung", fontName=  "Times New Roman")}));
    end Bevoelkerung;

    model Investitionen
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-104,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100.95,14.4893}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {106,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100.95,9.97625}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103.762,70}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103.762,70}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-2.54191,44.3805}, extent = {{-8.10249,8.10249},{8.10249,-8.10249}}, rotation = -90)));
      SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {-2.22899,-60.4727}, extent = {{-9.1182,9.1182},{9.1182,-9.1182}}, rotation = -90)));
      SystemDynamics.Flows.Mult3Flow mult3flow1 annotation(Placement(transformation(origin = {-2.61283,19.715}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 0.05) annotation(Placement(transformation(origin = {-35.6295,10.9264}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter constantconverter2(constValue = 0.025) annotation(Placement(transformation(origin = {-35.3919,-43.4679}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Flows.Mult2Flow mult2flow1 annotation(Placement(transformation(origin = {-2.13777,-37.7672}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.Div2Converter div2converter1 annotation(Placement(transformation(origin = {64.3705,0.950119}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Reservoirs.Stock stock1(m0 = 400000000.0) annotation(Placement(transformation(origin = {-2.61087,-9.02613}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter CIM(table = "cim", file = "world2.txt") annotation(Placement(transformation(origin = {-49.8812,28.0285}, extent = {{-12,-12},{12,12}}, rotation = -90)));
    equation
      connect(CIM.out1,mult3flow1.in2) annotation(Line(points = {{-37.8812,28.0285},{-37.8812,28.0285},{-29.2162,28.0285},{-29.2162,19.715},{-14.6128,19.715},{-14.6128,19.715}}));
      connect(realinput1,CIM.in1) annotation(Line(points = {{-104,0},{-80.285,0},{-80.285,28.266},{-61.8812,28.0285},{-61.8812,28.0285}}));
      connect(mult3flow1.outflow,stock1.inflow) annotation(Line(points = {{-2.61283,7.715},{-2.61283,7.71496},{-2.3753,2.97387},{-2.61087,2.97387}}));
      connect(stock1.outflow,mult2flow1.inflow) annotation(Line(points = {{-2.61087,-21.0261},{-2.61087,-21.0261},{-1.18765,-25.7672},{-2.13777,-25.7672}}));
      connect(stock1.out1,div2converter1.in1) annotation(Line(points = {{6.38913,-9.02613},{6.38913,-9.26366},{18.5273,-9.26366},{18.5273,8.07601},{52.3705,8.15012},{52.3705,8.15012}}));
      connect(stock1.out2,mult2flow1.in1) annotation(Line(points = {{-11.6109,-9.02613},{-11.6109,-9.02613},{-23.9905,-9.02613},{-23.9905,-31.5914},{-14.1378,-31.7672},{-14.1378,-31.7672}}));
      connect(div2converter1.out1,y) annotation(Line(points = {{76.3705,0.950119},{76.3705,0.950119},{106,0.950119},{106,0}}));
      connect(u,div2converter1.in2) annotation(Line(points = {{-103.762,70},{30.4038,70},{30.4038,-5.93824},{52.3705,-6.24988},{52.3705,-6.24988}}));
      connect(mult2flow1.outflow,cloudsink1.inflow) annotation(Line(points = {{-2.13777,-49.7672},{-2.13777,-49.7672},{-2.13777,-51.3545},{-2.22899,-51.3545}}));
      connect(constantconverter2.out,mult2flow1.in2) annotation(Line(points = {{-23.3919,-43.4679},{-23.3919,-43.4679},{-14.1378,-43.7672},{-14.1378,-43.7672}}));
      connect(constantconverter1.out,mult3flow1.in3) annotation(Line(points = {{-23.6295,10.9264},{-23.6295,11.1639},{-14.6128,11.315},{-14.6128,11.315}}));
      connect(cloudsource1.outflow,mult3flow1.inflow) annotation(Line(points = {{-2.54191,36.278},{-2.54191,36.4561},{-2.61283,31.715},{-2.61283,31.715}}));
      connect(mult3flow1.in1,u) annotation(Line(points = {{-14.6128,28.115},{-14.6128,27.791},{-25.1781,27.791},{-25.1781,70.0713},{-103.762,70.0713},{-103.762,70}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Investitionen", fontName=  "Times New Roman")}));
    end Investitionen;

    model NatRohstoffe
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-106,33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-98.8124,48.2185}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-106,-33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100.713,-52.7316}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {106,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105.762,0}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Flows.Mult3Flow mult3flow1 annotation(Placement(transformation(origin = {-0.712589,24.4656}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.ConstantConverter constantconverter1 annotation(Placement(transformation(origin = {38.2345,24.4656}, extent = {{12,-12},{-12,12}}, rotation = -270)));
      SystemDynamics.Converters.GraphConverter NRMM(table = "nrmm", file = "world2.txt") annotation(Placement(transformation(origin = {61.6238,33.0493}, extent = {{12,-12},{-12,12}}, rotation = -270)));
      SystemDynamics.Converters.Div2Converter div2converter1 annotation(Placement(transformation(origin = {34.6793,-11.639}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter NREM(table = "nrem", file = "world2.txt") annotation(Placement(transformation(origin = {65.3207,-11.639}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter constantconverter2(constValue = 900000000000.0) annotation(Placement(transformation(origin = {-9.73872,-36.8171}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Reservoirs.Stock stock1(m0 = 900000000000.0) annotation(Placement(transformation(origin = {-0.477018,-4.03996}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {-0.972263,54.1814}, extent = {{-8.48057,-8.48057},{8.48057,8.48057}}, rotation = 90)));
    equation
      connect(mult3flow1.outflow,cloudsink1.inflow) annotation(Line(points = {{-0.712589,36.4656},{-0.969897,36.4656},{-0.969897,41.7056},{-0.972263,41.7056},{-0.972263,45.7008}}));
      connect(stock1.out2,div2converter1.in1) annotation(Line(points = {{8.52298,-4.03996},{8.52298,-4.038},{22.6793,-4.439},{22.6793,-4.439}}));
      connect(mult3flow1.inflow,stock1.outflow) annotation(Line(points = {{-0.712589,12.4656},{-0.323299,12.4656},{-0.323299,7.96004},{-0.477018,7.96004}}));
      connect(constantconverter2.out,div2converter1.in2) annotation(Line(points = {{2.26128,-36.8171},{2.26128,-36.8171},{13.0641,-36.8171},{13.0641,-19.0024},{22.6793,-18.839},{22.6793,-18.839}}));
      connect(div2converter1.out1,NREM.in1) annotation(Line(points = {{46.6793,-11.639},{46.6793,-11.639},{53.3207,-11.639},{53.3207,-11.639}}));
      connect(NREM.out1,y) annotation(Line(points = {{77.3207,-11.639},{77.3207,-11.639},{81.7102,-11.639},{81.7102,0},{106,0},{106,0}}));
      connect(mult3flow1.in1,u) annotation(Line(points = {{11.2874,16.0656},{11.2874,15.5184},{21.0144,15.5184},{21.0144,75.0054},{-57.2239,75.0054},{-57.2239,33.2998},{-106,33.2998},{-106,33}}));
      connect(NRMM.in1,realinput1) annotation(Line(points = {{73.6238,33.0493},{73.6238,82.4412},{-73.7122,82.4412},{-73.7122,-32.9765},{-106,-32.9765},{-106,-33}}));
      connect(NRMM.out1,mult3flow1.in3) annotation(Line(points = {{49.6238,33.0493},{49.6238,32.9765},{11.2874,32.9765},{11.2874,32.8656}}));
      connect(constantconverter1.out,mult3flow1.in2) annotation(Line(points = {{26.2345,24.4656},{26.2345,24.4656},{11.2874,24.4656},{11.2874,24.4656}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Nat. Rohstoffe", fontName=  "Times New Roman")}));
    end NatRohstoffe;

    model NatRohstoffeA
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-106,33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-98.8124,48.2185}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-106,-33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100.713,-52.7316}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {106,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105.762,0}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Flows.Mult3Flow mult3flow1 annotation(Placement(transformation(origin = {-0.712589,24.4656}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter NRMM(table = "nrmm", file = "world2.txt") annotation(Placement(transformation(origin = {61.6238,33.0493}, extent = {{12,-12},{-12,12}}, rotation = -270)));
      SystemDynamics.Converters.TimeSwitchedConverter timeswitchedconverter1(switchTime = 70, oldValue = 1, newValue = 0.25) annotation(Placement(transformation(origin = {44.1065,24.3346}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.Div2Converter div2converter1 annotation(Placement(transformation(origin = {34.6793,-11.8746}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter constantconverter2(constValue = 900000000000.0) annotation(Placement(transformation(origin = {-9.73872,-36.8171}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter NREM(table = "nrem", file = "world2.txt") annotation(Placement(transformation(origin = {65.3207,-11.639}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Reservoirs.Stock stock1(m0 = 900000000000.0) annotation(Placement(transformation(origin = {-0.241447,-4.03996}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {-0.856714,51.2345}, extent = {{-8.12497,-8.12497},{8.12497,8.12497}}, rotation = 90)));
    equation
      connect(mult3flow1.outflow,cloudsink1.inflow) annotation(Line(points = {{-0.712589,36.4656},{-0.969897,36.4656},{-0.969897,41.7056},{-0.856714,41.7056},{-0.856714,43.1095}}));
      connect(stock1.out2,div2converter1.in1) annotation(Line(points = {{8.75855,-4.03996},{8.75855,-4.038},{22.6793,-4.67457},{22.6793,-4.67457}}));
      connect(mult3flow1.inflow,stock1.outflow) annotation(Line(points = {{-0.712589,12.4656},{-0.323299,12.4656},{-0.323299,7.96004},{-0.241447,7.96004}}));
      connect(div2converter1.out1,NREM.in1) annotation(Line(points = {{46.6793,-11.8746},{46.6793,-11.639},{53.3207,-11.639},{53.3207,-11.639}}));
      connect(NREM.out1,y) annotation(Line(points = {{77.3207,-11.639},{77.3207,-11.639},{81.7102,-11.639},{81.7102,0},{106,0},{106,0}}));
      connect(constantconverter2.out,div2converter1.in2) annotation(Line(points = {{2.26128,-36.8171},{2.26128,-36.8171},{13.0641,-36.8171},{13.0641,-19.0024},{22.6793,-19.0746},{22.6793,-19.0746}}));
      connect(timeswitchedconverter1.out,mult3flow1.in2) annotation(Line(points = {{32.1065,24.3346},{32.1065,24.5881},{11.2874,24.5881},{11.2874,24.4656}}));
      connect(mult3flow1.in1,u) annotation(Line(points = {{11.2874,16.0656},{11.2874,15.5184},{21.0144,15.5184},{21.0144,75.0054},{-57.2239,75.0054},{-57.2239,33.2998},{-106,33.2998},{-106,33}}));
      connect(NRMM.in1,realinput1) annotation(Line(points = {{73.6238,33.0493},{73.6238,82.4412},{-73.7122,82.4412},{-73.7122,-32.9765},{-106,-32.9765},{-106,-33}}));
      connect(NRMM.out1,mult3flow1.in3) annotation(Line(points = {{49.6238,33.0493},{49.6238,32.9765},{11.2874,32.9765},{11.2874,32.8656}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Nat. Rohstoffe (A)", fontName=  "Times New Roman")}));
    end NatRohstoffeA;

    model BevoelkerungA
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-106,-33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-106,-33}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput realoutput1 annotation(Placement(transformation(origin = {106,-33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {106,-33}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.ConstantConverter PDN(constValue = 26.5) annotation(Placement(transformation(origin = {53.9729,-16.4917}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter DRFM(table = "drfm", file = "world2.txt") annotation(Placement(transformation(origin = {16.4917,-22.1889}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter DRPM(table = "drpm", file = "world2.txt") annotation(Placement(transformation(origin = {16.4918,-36.5817}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter BRPM(table = "brpm", file = "world2.txt") annotation(Placement(transformation(origin = {16.7916,38.6806}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter BRFM(table = "brfm", file = "world2.txt") annotation(Placement(transformation(origin = {16.4918,53.3733}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter BRCM(table = "brcm", file = "world2.txt") annotation(Placement(transformation(origin = {16.7916,24.2879}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Converters.GraphConverter DRCM(table = "drcm", file = "world2.txt") annotation(Placement(transformation(origin = {16.7916,-5.39735}, extent = {{12,-12},{-12,12}}, rotation = -270)));
      SystemDynamics.Converters.MultPower3Converter CR(k1 = -1.0, k3 = -1.0) annotation(Placement(transformation(origin = {71.3643,8.3958}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter LA(constValue = 135000000.0) annotation(Placement(transformation(origin = {52.7736,31.1844}, extent = {{12,-12},{-12,12}}, rotation = -180)));
      SystemDynamics.Converters.ConstantConverter DRN(constValue = 0.028) annotation(Placement(transformation(origin = {-55.7721,-22.1889}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter DRMM(table = "drmm", file = "world2.txt") annotation(Placement(transformation(origin = {-55.7721,-38.9805}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.GraphConverter BRMM(table = "brmm", file = "world2.txt") annotation(Placement(transformation(origin = {-53.3733,38.3808}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.TimeSwitchedConverter timeswitchedconverter1(switchTime = 70, oldValue = 0.04, newValue = 0.028) annotation(Placement(transformation(origin = {-49.4062,64.6081}, extent = {{12,-12},{-12,12}}, rotation = -180)));
      SystemDynamics.Flows.Mult6Flow BR annotation(Placement(transformation(origin = {-20.3898,38.445}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Flows.Mult6Flow DR annotation(Placement(transformation(origin = {-20.7539,-22.2532}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Reservoirs.Stock stock1(m0 = 1650000000.0) annotation(Placement(transformation(origin = {-20.6254,8.69565}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {-20.8586,-44.9116}, extent = {{-8.63363,8.63363},{8.63363,-8.63363}}, rotation = -90)));
      SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-20.3223,62.9872}, extent = {{-9.04135,9.04135},{9.04135,-9.04135}}, rotation = -90)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {-106,33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {-106,33}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {106,66}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {106,66}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput realinput2 annotation(Placement(transformation(origin = {106,33}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {106,33}, extent = {{-12,12},{12,-12}}, rotation = -180)));
    equation
      connect(cloudsource1.outflow,BR.inflow) annotation(Line(points = {{-20.3223,53.9458},{-20.3223,55.7661},{-20.3898,50.445},{-20.3898,50.445}}));
      connect(DR.outflow,cloudsink1.inflow) annotation(Line(points = {{-20.7539,-34.2532},{-20.7539,-34.4888},{-20.9895,-36.278},{-20.8586,-36.278}}));
      connect(y,stock1.out2) annotation(Line(points = {{-106,33},{-86.9565,33},{-86.9565,8.69565},{-29.3898,8.69565},{-29.6254,8.69565}}));
      connect(BR.in3,stock1.out2) annotation(Line(points = {{-32.3898,30.045},{-32.3898,29.9851},{-37.4813,29.9851},{-37.4813,8.69565},{-29.3898,8.69565},{-29.6254,8.69565}}));
      connect(stock1.outflow,DR.inflow) annotation(Line(points = {{-20.6254,-3.30435},{-20.6254,-5.4033},{-20.9895,-10.2532},{-20.7539,-10.2532}}));
      connect(BR.outflow,stock1.inflow) annotation(Line(points = {{-20.3898,26.445},{-20.3898,26.6806},{-20.6897,20.6957},{-20.6254,20.6957}}));
      connect(DR.in1,stock1.out2) annotation(Line(points = {{-32.7539,-13.8532},{-32.7539,-14.093},{-37.4813,-14.093},{-37.4813,8.69565},{-29.3898,8.69565},{-29.6254,8.69565}}));
      connect(stock1.out1,CR.in2) annotation(Line(points = {{-11.6254,8.69565},{-11.6254,8.69565},{59.3643,8.3958},{59.3643,8.3958}}));
      connect(DRN.out,DR.in2) annotation(Line(points = {{-43.7721,-22.1889},{-43.7721,-22.4888},{-32.9895,-22.2532},{-32.7539,-22.2532}}));
      connect(DRMM.out1,DR.in3) annotation(Line(points = {{-43.7721,-38.9805},{-43.7721,-38.9805},{-37.4813,-38.9805},{-37.4813,-30.8846},{-32.9895,-30.6532},{-32.7539,-30.6532}}));
      connect(DRFM.out1,DR.in5) annotation(Line(points = {{4.49175,-22.1889},{4.49175,-22.4888},{-8.9895,-22.2532},{-8.75393,-22.2532}}));
      connect(DRPM.out1,DR.in6) annotation(Line(points = {{4.4918,-36.5817},{4.4918,-36.5817},{-1.7991,-36.5817},{-1.7991,-30.5847},{-8.9895,-30.6532},{-8.75393,-30.6532}}));
      connect(DRCM.out1,DR.in4) annotation(Line(points = {{4.7916,-5.39735},{4.7916,-5.35446},{-1.7991,-5.35446},{-1.7991,-14.093},{-8.9895,-13.8532},{-8.75393,-13.8532}}));
      connect(BRMM.out1,BR.in2) annotation(Line(points = {{-41.3733,38.3808},{-41.3733,38.6806},{-32.3898,38.445},{-32.3898,38.445}}));
      connect(BRCM.out1,BR.in6) annotation(Line(points = {{4.7916,24.2879},{4.7916,23.988},{-1.49925,23.988},{-1.49925,30.2849},{-8.3898,30.045},{-8.3898,30.045}}));
      connect(BRPM.out1,BR.in5) annotation(Line(points = {{4.7916,38.6806},{4.7916,38.6378},{-8.3898,38.445},{-8.3898,38.445}}));
      connect(BRFM.out1,BR.in4) annotation(Line(points = {{4.4918,53.3733},{4.4918,53.3305},{-1.49925,53.3305},{-1.49925,47.0765},{-8.3898,46.845},{-8.3898,46.845}}));
      connect(timeswitchedconverter1.out,BR.in1) annotation(Line(points = {{-49.4062,52.6081},{-49.4062,52.6081},{-32.3898,47.0309},{-32.3898,46.845}}));
      connect(BRMM.in1,u) annotation(Line(points = {{-65.3733,38.3808},{-65.3733,38.3808},{-79.1604,38.3808},{-79.1604,-32.3635},{-106,-32.3635},{-106,-33}}));
      connect(DRMM.in1,u) annotation(Line(points = {{-67.7721,-38.9805},{-67.7721,-39.1069},{-79.2779,-39.1069},{-79.2779,-32.4561},{-106,-32.4561},{-106,-33}}));
      connect(LA.out,CR.in1) annotation(Line(points = {{52.7736,19.1844},{52.7736,19.1844},{59.3643,17.991},{59.3643,17.9958}}));
      connect(PDN.out,CR.in3) annotation(Line(points = {{53.9729,-4.49175},{53.9729,-1.49925},{59.3643,-1.49925},{59.3643,-1.2042}}));
      connect(CR.out1,realoutput1) annotation(Line(points = {{83.3643,8.3958},{83.3643,8.31174},{86.3568,8.31174},{86.3568,-33.1323},{106,-33.1323},{106,-33}}));
      connect(DRCM.in1,CR.out1) annotation(Line(points = {{28.7916,-5.39735},{28.7916,-5.09745},{42.2789,-5.09745},{42.2789,-33.1774},{86.3568,-33.1774},{86.3568,8.31174},{83.6582,8.31174},{83.3643,8.3958},{83.3643,8.3958}}));
      connect(BRCM.in1,CR.out1) annotation(Line(points = {{28.7916,24.2879},{28.7916,24.063},{42.2789,24.063},{42.2789,-33.1774},{86.3568,-33.1774},{86.3568,8.34255},{83.3643,8.3958},{83.3643,8.3958}}));
      connect(BRPM.in1,realinput2) annotation(Line(points = {{28.7916,38.6806},{28.7916,38.5748},{79.0119,38.5748},{79.0119,32.9881},{106,33},{106,33}}));
      connect(DRPM.in1,realinput2) annotation(Line(points = {{28.4918,-36.5817},{28.4918,-36.7126},{42.0333,-36.7126},{42.0333,-47.0879},{113.33,-47.0879},{106,33},{106,33}}));
      connect(BRFM.in1,realinput1) annotation(Line(points = {{28.4918,53.3733},{28.4918,53.5447},{78.7106,53.5447},{78.7106,65.9038},{106,66},{106,66}}));
      connect(DRFM.in1,realinput1) annotation(Line(points = {{28.4917,-22.1889},{28.4917,-21.9533},{38.0167,-21.9533},{38.0167,-61.0409},{121.566,-61.0409},{121.566,65.1041},{106,66},{106,66}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Bevölkerung (A)", fontName=  "Times New Roman")}));
    end BevoelkerungA;

    model VerschmutzungA
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-106,33}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-98.3373,33.0166}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-106,-31}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-97.1496,-35.6295}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {106,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,5.22565}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter POLCM(table = "polcm", file = "world2.txt") annotation(Placement(transformation(origin = {-72.209,2.61283}, extent = {{-12,-12},{12,12}})));
      SystemDynamics.Converters.GraphConverter POLAT(table = "polat", file = "world2.txt") annotation(Placement(transformation(origin = {0.475059,-75.772}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      SystemDynamics.Flows.Mult3Flow mult3flow1 annotation(Placement(transformation(origin = {-1.90024,44.4181}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.TimeSwitchedConverter timeswitchedconverter1(switchTime = 70, oldValue = 1, newValue = 0.7) annotation(Placement(transformation(origin = {-41.3204,52.7379}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Flows.Div2Flow div2flow1 annotation(Placement(transformation(origin = {-1.90024,-16.6271}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Reservoirs.Stock stock1(m0 = 200000000.0) annotation(Placement(transformation(origin = {-1.90024,12.8325}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.Div2Converter div2converter1 annotation(Placement(transformation(origin = {63.8955,6.4133}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Converters.ConstantConverter constantconverter1(constValue = 3600000000.0) annotation(Placement(transformation(origin = {30.8789,-0.712589}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      SystemDynamics.Reservoirs.CloudSink cloudsink1 annotation(Placement(transformation(origin = {-1.95204,-39.5444}, extent = {{-9.15566,9.15566},{9.15566,-9.15566}}, rotation = -90)));
      SystemDynamics.Reservoirs.CloudSource cloudsource1 annotation(Placement(transformation(origin = {-1.8394,70.0496}, extent = {{-8.56551,8.56551},{8.56551,-8.56551}}, rotation = -90)));
    equation
      connect(mult3flow1.inflow,cloudsource1.outflow) annotation(Line(points = {{-1.90024,56.4181},{-1.90024,56.4181},{-2.13777,61.4841},{-1.8394,61.4841}}));
      connect(div2flow1.outflow,cloudsink1.inflow) annotation(Line(points = {{-1.90024,-28.6271},{-1.90024,-28.6271},{-1.66271,-30.3887},{-1.95204,-30.3887}}));
      connect(constantconverter1.out,div2converter1.in2) annotation(Line(points = {{42.8789,-0.712589},{42.8789,-0.712589},{51.8955,-0.7867},{51.8955,-0.7867}}));
      connect(stock1.out1,div2converter1.in1) annotation(Line(points = {{7.09976,12.8325},{7.09976,13.5392},{51.8955,13.6133},{51.8955,13.6133}}));
      connect(POLAT.in1,div2converter1.out1) annotation(Line(points = {{12.4751,-75.772},{12.4751,-75.5344},{76.0095,-75.5344},{75.8955,6.4133},{75.8955,6.4133}}));
      connect(div2converter1.out1,y) annotation(Line(points = {{75.8955,6.4133},{75.8955,-0.0855107},{106,-0.0855107},{106,0}}));
      connect(stock1.outflow,div2flow1.inflow) annotation(Line(points = {{-1.90024,0.832486},{-1.90024,1.53919},{-1.90024,-4.6271},{-1.90024,-4.6271}}));
      connect(stock1.out2,div2flow1.in1) annotation(Line(points = {{-10.9002,12.8325},{-10.9002,13.5392},{-25.1781,13.5392},{-25.1781,-10.4513},{-13.9002,-10.6271},{-13.9002,-10.6271}}));
      connect(mult3flow1.outflow,stock1.inflow) annotation(Line(points = {{-1.90024,32.4181},{-1.90024,32.4181},{-1.66271,24.8325},{-1.90024,24.8325}}));
      connect(POLAT.out1,div2flow1.in2) annotation(Line(points = {{-11.5249,-75.772},{-11.5249,-75.772},{-26.6033,-75.772},{-26.6033,-22.5653},{-13.9002,-22.6271},{-13.9002,-22.6271}}));
      connect(timeswitchedconverter1.out,mult3flow1.in1) annotation(Line(points = {{-29.3204,52.7379},{-29.3204,53.0097},{-13.9002,52.8181},{-13.9002,52.8181}}));
      connect(u,mult3flow1.in2) annotation(Line(points = {{-106,33},{-87.1734,33},{-87.1734,44.4181},{-13.9002,44.4181},{-13.9002,44.4181}}));
      connect(POLCM.out1,mult3flow1.in3) annotation(Line(points = {{-72.209,14.6128},{-72.209,36.1045},{-13.9002,36.1045},{-13.9002,36.0181}}));
      connect(realinput1,POLCM.in1) annotation(Line(points = {{-106,-31},{-72.209,-31},{-72.209,-9.38717},{-72.209,-9.38717}}));
      annotation(Diagram,   Icon(graphics={  Rectangle(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    0.25, extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,25},{90,-15}}, textString=  "Verschmutzung (A)", fontName=  "Times New Roman")}));
    end VerschmutzungA;
  end Kap12;

  package Kap14
    model Stromquelle
      parameter Current I0 = 1;
      parameter Resistance R = 1;
      parameter Capacitance C = 1;
      Modelica.Electrical.Analog.Interfaces.PositivePin positivepin1 annotation(Placement(transformation(origin = {-1.99431,-86.6097}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-1.99431,-86.6097}, extent = {{-5.59809,-5.59809},{5.59809,5.59809}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin negativepin1 annotation(Placement(transformation(origin = {-2.849,90.8832}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-2.849,90.8832}, extent = {{-5.08917,-5.08917},{5.08917,5.08917}})));
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(transformation(origin = {-90.3134,-71.7948}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = C) annotation(Placement(transformation(origin = {-28.49,-28.2051}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R = R) annotation(Placement(transformation(origin = {-28.737,45.4289}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Electrical.Analog.Sources.ConstantCurrent constantcurrent1(I = I0) annotation(Placement(transformation(origin = {-70.0527,19.6482}, extent = {{-12,-12},{12,12}}, rotation = 90)));
    equation
      connect(negativepin1,constantcurrent1.n) annotation(Line(points = {{-2.849,90.8832},{-2.88184,90.8832},{-2.88184,73.7752},{-70.0288,73.7752},{-70.0288,31.4121},{-70.0288,31.4121}}));
      connect(positivepin1,constantcurrent1.p) annotation(Line(points = {{-1.99431,-86.6097},{-2.30548,-86.6097},{-2.30548,-51.585},{-70.0288,-51.585},{-70.0288,7.78098},{-70.0288,7.78098}}));
      connect(ground1.p,constantcurrent1.p) annotation(Line(points = {{-90.3134,-59.7948},{-70.0288,-59.7948},{-70.0288,6.91643},{-70.0288,6.91643}}));
      connect(capacitor1.n,constantcurrent1.p) annotation(Line(points = {{-28.49,-40.2051},{-28.49,-51.585},{-70.0288,-51.585},{-70.0288,7.4928},{-70.0288,7.4928}}));
      connect(constantcurrent1.n,resistor1.p) annotation(Line(points = {{-70.0527,31.6482},{-70.0527,73.7752},{-28.5303,73.7752},{-28.5303,57.3487},{-28.5303,57.3487}}));
      connect(capacitor1.p,resistor1.n) annotation(Line(points = {{-28.49,-16.2051},{-28.49,34.2939},{-28.8184,34.2939},{-28.8184,34.2939}}));
      annotation(Diagram,   Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics={  Line(origin=  {-5.4755,5.4755}, rotation=  -180, points=  {{-2.5641,62.3735},{-2.5641,86.911}}, smooth=  Smooth.Bezier),Ellipse(origin=  {-5.18732,6.05187}, rotation=  -180, extent=  {{37.6068,-54.7009},{-41.5954,19.3732}}, endAngle=  360),Ellipse(origin=  {-5.18732,6.05187}, rotation=  -180, extent=  {{35.8974,-13.1054},{-40.4558,61.5385}}, endAngle=  360),Line(origin=  {-0.288184,144.669}, points=  {{-2.5641,-57.5499},{-2.5641,-82.6408}}, smooth=  Smooth.Bezier)}));
    end Stromquelle;

    model Elektromotor
      parameter Real k = 1 "Übertragungsfaktor";
      parameter Resistance R = 1 "Innenwiderstand";
      parameter Inductance L = 1 "Induktivität";
      parameter Inertia J = 1 "Trägheitsmoment";
      parameter RotationalDampingConstant b = 1 "Reibungswert";
      parameter RotationalSpringConstant c = 1 "Achsensteifheit";
      Modelica.Electrical.Analog.Basic.EMF emf1(k = k) annotation(Placement(transformation(origin = {-28.0759,19.4994}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = J) annotation(Placement(transformation(origin = {8.60914,19.244}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Spring spring1(c = c) annotation(Placement(transformation(origin = {47.0971,19.244}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(Placement(transformation(origin = {28.8659,-31.398}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin negativepin1 annotation(Placement(transformation(origin = {3.1339,99.4302}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {3.1339,99.4302}, extent = {{-12,-12},{12,12}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin positivepin1 annotation(Placement(transformation(origin = {3.4188,-97.7208}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {3.4188,-97.7208}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1 annotation(Placement(transformation(origin = {100.57,3.98859}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100.57,3.98859}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Damper damper1(d = b) annotation(Placement(transformation(origin = {28.3595,-7.5963}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L = L) annotation(Placement(transformation(origin = {-28.3878,49.8796}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Electrical.Analog.Basic.Resistor resistor2(R = R) annotation(Placement(transformation(origin = {-28.4147,78.9394}, extent = {{-12,12},{12,-12}}, rotation = -90)));
    equation
      connect(spring1.flange_b,flange_b1) annotation(Line(points = {{59.0971,19.244},{78.9174,19.244},{78.9174,3.98859},{100.57,3.98859}}));
      connect(emf1.n,positivepin1) annotation(Line(points = {{-28.0759,7.4994},{-28.0759,-11.6809},{3.4188,-11.6809},{3.4188,-97.7208}}));
      connect(resistor2.n,inductor1.p) annotation(Line(points = {{-28.4147,66.9394},{-28.2051,66.9394},{-28.2051,61.8796},{-28.3878,61.8796}}));
      connect(negativepin1,resistor2.p) annotation(Line(points = {{3.1339,99.4302},{-27.9202,99.4302},{-27.9202,90.9394},{-28.4147,90.9394}}));
      connect(inductor1.n,emf1.p) annotation(Line(points = {{-28.3878,37.8796},{-27.8531,37.8796},{-27.8531,31.4994},{-28.0759,31.4994}}));
      connect(emf1.n,positivepin1) annotation(Line(points = {{-28.0759,7.4994},{-28.0759,-11.6809},{0.854701,-11.6809},{0.854701,-99.1453}}));
      connect(spring1.flange_b,flange_b1) annotation(Line(points = {{59.0971,19.244},{78.9174,19.244},{78.9174,19.0883},{99.7151,19.0883}}));
      connect(fixed1.flange,damper1.flange_a) annotation(Line(points = {{28.8659,-31.398},{28.8659,-31.398},{28.8659,-19.5963},{28.3595,-19.5963}}));
      connect(damper1.flange_b,inertia2.flange_b) annotation(Line(points = {{28.3595,4.4037},{28.8659,4.4037},{28.8659,19.244},{20.6091,19.244},{20.6091,19.244}}));
      connect(inertia2.flange_b,spring1.flange_a) annotation(Line(points = {{20.6091,19.244},{35.4494,19.244},{35.4494,19.244},{35.0971,19.244}}));
      connect(emf1.flange,inertia2.flange_a) annotation(Line(points = {{-16.0759,19.4994},{-3.03852,19.4994},{-3.03852,19.244},{-3.39086,19.244}}));
      connect(inductor1.n,emf1.p) annotation(Line(points = {{-41.1741,70.3924},{-27.8531,70.3924},{-27.8531,31.4994},{-28.0759,31.4994}}));
      annotation(experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 0.000001), Diagram,   Icon(graphics={  Ellipse(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                fillPattern=                                                                                                    FillPattern.None,
                lineThickness=                                                                                                    1.25, extent=  {{-47.8632,52.9915},{53.5613,-45.584}}),Line(points=  {{2.849,54.9858},{2.849,87.4644},{2.849,87.4644}}, color=  {0,0,0}, pattern=  LinePattern.Solid, thickness=  0.25, smooth=  Smooth.Bezier),Line(points=  {{3.1339,-47.8632},{3.1339,-86.3248}}, color=  {0,0,0}, pattern=  LinePattern.Solid, thickness=  0.25, smooth=  Smooth.Bezier),Line(points=  {{56.4103,3.7037},{88.3191,3.7037}}, color=  {0,0,0}, pattern=  LinePattern.Solid, thickness=  2.75, smooth=  Smooth.Bezier)}));
    end Elektromotor;
  end Kap14;

  package Hydraulik "Einfache Hydraulik-Bibliothek"
    package Interfaces
      import Modelica.SIunits.*;
      connector Port
        Pressure p;
        flow VolumeFlowRate q;
      end Port;

      connector Port_a "flow port that is used for inflow"
        extends Port;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(extent=  {{-40,-40},{40,40}}, lineColor=  {0,0,0},
                  fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {0,127,255})}), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(extent=  {{-100,-100},{100,100}}, lineColor=  {0,0,0},
                  fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {0,127,255})}));
      end Port_a;

      connector Port_b "flow port that is used for outflow"
        extends Port;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(extent=  {{-40,-40},{40,40}}, lineColor=  {0,0,0},
                  fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {0,63,127})}), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(extent=  {{-100,-100},{100,100}}, lineColor=  {0,0,0},
                  fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {0,63,127})}));
      end Port_b;
    end Interfaces;

    package Components
      import Modelica.SIunits.*;
      model FlowSource "generates a constant flow"
        parameter VolumeFlowRate Q = 0.001 "flow from A to B";
        Interfaces.Port_a inflow annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
        Interfaces.Port_b outflow annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
      equation
        inflow.q + outflow.q = 0;
        inflow.q = Q;
        annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(extent=  {{-50,-50},{50,50}}, lineColor=  {0,0,0}),Polygon(points=  {{12,25},{50,0},{12,-25},{12,25}}, lineColor=  {0,0,0}, fillColor=  {0,0,128},
                  fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-100,0},{-50,0}}, color=  {0,0,0}),Line(points=  {{50,0},{100,0}}, color=  {0,0,0})}));
      end FlowSource;

      model AmbientPressure "constant athmospheric pressure"
        parameter Pressure p0 = 100000.0 "athmospheric pressure";
        Interfaces.Port_b outflow annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
      equation
        outflow.p = p0;
        annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points=  {{0,0},{100,0}}),Line(points=  {{20,-50},{-20,-50},{-20,50},{20,50}})}));
      end AmbientPressure;

      model LaminarFlow
        parameter Real R "flow resistance";
        Interfaces.Port_a inflow annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
        Interfaces.Port_b outflow annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
      equation
        inflow.q + outflow.q = 0;
        inflow.p - outflow.p = R * inflow.q;
        annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points=  {{-100,0},{100,0}}, color=  {0,0,0}),Line(points=  {{-80,40},{-50,20},{-20,10},{20,10},{50,20},{80,40}}, color=  {0,0,0}),Line(points=  {{-80,-40},{-50,-20},{-20,-10},{20,-10},{50,-20},{80,-40}}, color=  {0,0,0})}));
      end LaminarFlow;

      model HydraulicCylinder
        parameter Area A "cross section of the piston";
        Interfaces.Port_a inflow annotation(Placement(transformation(extent = {{-60,90},{-40,110}}, rotation = 90)));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flange annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
      protected
        Real v;
      equation
        flange.f = -A * inflow.p;
        v = der(flange.s);
        inflow.q = A * v;
        annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points=  {{60,60},{-90,60},{-90,-60},{60,-60}}, color=  {0,0,0}),Line(points=  {{20,60},{20,-60}}, color=  {0,0,0}),Line(points=  {{-50,100},{-50,60}}, color=  {0,0,0}),Line(points=  {{20,0},{100,0}}, color=  {0,0,0}),Rectangle(extent=  {{-90,-60},{20,60}}, lineColor=  {0,0,0}, fillColor=  {83,233,255},
                  fillPattern=                                                                                                    FillPattern.Solid)}));
      end HydraulicCylinder;

      model Pumpe
        parameter VolumeFlowRate Q = 0.001 "flow from A to B";
        parameter Real R = 1000000000.0 "flow resistance";
        PJlib.Hydraulik.Interfaces.Port_a porta1 annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
        PJlib.Hydraulik.Interfaces.Port_b portb1 annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
        PJlib.Hydraulik.Components.FlowSource flowsource1(Q = Q) annotation(Placement(transformation(origin = {-19.943,11.6809}, extent = {{-12,-12},{12,12}})));
        PJlib.Hydraulik.Components.LaminarFlow laminarflow1(R = R) annotation(Placement(transformation(origin = {38.1766,-19.3732}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      equation
        connect(laminarflow1.outflow,flowsource1.inflow) annotation(Line(points = {{38.1766,-31.3732},{38.4615,-31.3732},{38.4615,-38.7464},{-57.5499,-38.7464},{-57.5499,11.6809},{-31.943,11.6809},{-31.943,11.6809}}));
        connect(laminarflow1.inflow,flowsource1.outflow) annotation(Line(points = {{38.1766,-7.37322},{38.1766,-7.37322},{38.1766,11.6809},{-7.94302,11.6809},{-7.94302,11.6809}}));
        connect(flowsource1.outflow,portb1) annotation(Line(points = {{-7.94302,11.6809},{98.0057,11.6809},{98.0057,9.97151},{99.1453,9.97151}}));
        connect(flowsource1.inflow,porta1) annotation(Line(points = {{-31.943,11.6809},{-97.7208,11.6809},{-97.7208,10.5413},{-99.7151,10.5413}}));
        annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(lineColor=  {0,0,0}, fillColor=  {0,0,0}, pattern=  LinePattern.Solid,
                  fillPattern=                                                                                                    FillPattern.None,
                  lineThickness=                                                                                                    0.25, extent=  {{-50,-50},{50,50}}),Polygon(points=  {{12,25},{50,0},{12,-25},{12,25}}, lineColor=  {0,0,0}, fillColor=  {0,0,128}, pattern=  LinePattern.Solid,
                  fillPattern=                                                                                                    FillPattern.Solid,
                  lineThickness=                                                                                                    0.25),Rectangle(lineColor=  {0,0,0}, extent=  {{-100,-100},{100,100}}),Line(points=  {{-100,0},{-50,0}}, color=  {0,0,0}, pattern=  LinePattern.Solid, thickness=  0.25),Line(points=  {{50,0},{100,0}}, color=  {0,0,0}, pattern=  LinePattern.Solid, thickness=  0.25)}));
      end Pumpe;

      model CompressibleCylinder
        parameter Area A = 0.001 "Kolbenfläche";
        parameter BulkModulus K = 1150000000.0 "Kompressionsmodul";
        parameter Volume V0 = 0.000025 "Volumen bei s = 0";
        parameter Pressure pa = 100000.0 "Außendruck";
        Pressure p(start = pa, fixed = true);
        Position s(start = 0);
        Velocity v;
        Interfaces.Port_a inflow annotation(Placement(transformation(extent = {{-60,90},{-40,110}}, rotation = 90)));
        Modelica.Mechanics.Translational.Interfaces.Flange_a piston annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
      equation
        inflow.p = p;
        piston.s = s;
        piston.f = -A * (p - pa);
        der(p) = if p <= 0 then 0 else K / (V0 + A * s) * (inflow.q - A * v);
        der(s) = v;
        annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points=  {{60,60},{-90,60},{-90,-60},{60,-60}}, color=  {0,0,0}),Line(points=  {{20,60},{20,-60}}, color=  {0,0,0}),Line(points=  {{-50,100},{-50,60}}, color=  {0,0,0}),Line(points=  {{20,0},{100,0}}, color=  {0,0,0}),Rectangle(extent=  {{-100,-100},{100,100}}, lineColor=  {0,0,0}),Rectangle(extent=  {{-90,-60},{20,60}}, lineColor=  {0,0,0}, fillColor=  {83,233,255},
                  fillPattern=                                                                                                    FillPattern.Solid)}));
      end CompressibleCylinder;

      model Valve "Drosselventil mit variabler Querschnittsfläche"
        parameter Density rho = 873 "Dichte";
        parameter Real alpha = 0.61 "Durchflussziffer";
        Interfaces.Port_a inflow annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
        Interfaces.Port_b outflow annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
        Modelica.Blocks.Interfaces.RealInput A annotation(Placement(transformation(extent = {{-10,90},{10,110}}, rotation = 270)));
      equation
        outflow.q + inflow.q = 0;
        inflow.p = outflow.p + rho / 2 * (inflow.q / (alpha * A)) ^ 2 * sign(inflow.q);
        annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}, lineColor=  {0,0,0}),Line(points=  {{-100,0},{100,0}}, color=  {0,0,0}),Line(points=  {{-80,40},{-50,20},{-20,10},{20,10},{50,20},{80,40}}, color=  {0,0,0}),Line(points=  {{-80,-40},{-50,-20},{-20,-10},{20,-10},{50,-20},{80,-40}}, color=  {0,0,0})}));
      end Valve;
    end Components;
  end Hydraulik;

  package Kap16
    model Motor
      parameter Inertia Jm = 0.6 "Motorträgheit";
      parameter AngularVelocity om0 = 83.776 "Anfangsdrehzahl";
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,-75}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-75}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {0,103}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,103}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jm, w(start = om0, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {45.6947,-73.8146}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(Placement(transformation(origin = {-19.8117,-73.1755}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {13.7404,-46.3338}, extent = {{12,-12},{-12,12}}, rotation = -270)));
      Modelica.Blocks.Tables.CombiTable2D combitable2d1(tableOnFile = true, tableName = "motor", fileName = "motorkennfeld.txt") annotation(Placement(transformation(origin = {-33.2325,28.1198}, extent = {{12,12},{-12,-12}}, rotation = -180)));
    equation
      connect(u,combitable2d1.u2) annotation(Line(points = {{0,103},{0,103},{0,35.1194},{-18.8325,35.1194},{-18.8325,35.3198}}));
      connect(combitable2d1.y,torque1.tau) annotation(Line(points = {{-46.4325,28.1198},{-61.6719,28.1198},{-61.6719,-73.495},{-34.2117,-73.495},{-34.2117,-73.1755}}));
      connect(combitable2d1.u1,speedsensor1.w) annotation(Line(points = {{-18.8325,35.3198},{14.0599,35.3198},{14.0599,-33.1338},{13.7404,-33.1338}}));
      connect(speedsensor1.flange,inertia1.flange_a) annotation(Line(points = {{13.7404,-58.3338},{14.0599,-58.3338},{14.0599,-73.1755},{33.6947,-73.1755},{33.6947,-73.8146}}));
      connect(torque1.flange,inertia1.flange_a) annotation(Line(points = {{-7.8117,-73.1755},{34.1912,-73.1755},{34.1912,-73.8146},{33.6947,-73.8146}}));
      connect(inertia1.flange_b,flange_b) annotation(Line(points = {{57.6947,-73.8146},{98.4194,-73.8146},{98.4194,-75.7318},{99.378,-75.7318}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(lineColor=  {0,0,0}, extent=  {{-100,-100},{100,100}}),Rectangle(lineColor=  {0,0,0}, extent=  {{-68,-40},{-38,80}},
                lineThickness=                                                                                                    1),Rectangle(lineColor=  {0,0,0}, fillColor=  {160,160,160},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-68,10},{-38,80}},
                lineThickness=                                                                                                    1),Rectangle(lineColor=  {0,0,0}, extent=  {{-67,0},{-39,10}},
                lineThickness=                                                                                                    1),Line(points=  {{-53,0},{-53,-85}}, pattern=  LinePattern.Solid, thickness=  1),Rectangle(lineColor=  {0,0,0}, extent=  {{-33,-40},{-3,80}},
                lineThickness=                                                                                                    1),Rectangle(lineColor=  {0,0,0}, fillColor=  {160,160,160},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{-33,40},{-3,80}},
                lineThickness=                                                                                                    1),Rectangle(lineColor=  {0,0,0}, extent=  {{-32,30},{-4,40}},
                lineThickness=                                                                                                    1),Line(points=  {{-18,30},{-18,-65}}, pattern=  LinePattern.Solid, thickness=  1),Rectangle(lineColor=  {0,0,0}, extent=  {{3,-40},{33,80}},
                lineThickness=                                                                                                    1),Rectangle(lineColor=  {0,0,0}, fillColor=  {160,160,160},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{3,10},{33,80}},
                lineThickness=                                                                                                    1),Rectangle(lineColor=  {0,0,0}, extent=  {{4,0},{32,10}},
                lineThickness=                                                                                                    1),Line(points=  {{18,0},{18,-85}}, pattern=  LinePattern.Solid, thickness=  1),Rectangle(lineColor=  {0,0,0}, extent=  {{38,-40},{68,80}},
                lineThickness=                                                                                                    1),Rectangle(lineColor=  {0,0,0}, fillColor=  {160,160,160},
                fillPattern=                                                                                                    FillPattern.Solid, extent=  {{38,40},{68,80}},
                lineThickness=                                                                                                    1),Rectangle(lineColor=  {0,0,0}, extent=  {{39,30},{67,40}},
                lineThickness=                                                                                                    1),Line(points=  {{53,30},{53,-65}}, pattern=  LinePattern.Solid, thickness=  1),Line(points=  {{-90,-75},{-61,-75},{-61,-85},{-45,-85},{-45,-75},{-26,-75},{-26,-65},{-10,-65},{-10,-75},{10,-75},{10,-85},{26,-85},{26,-75},{45,-75},{45,-65},{61,-65},{61,-75},{100,-75}}, pattern=  LinePattern.Solid, thickness=  2)}));
    end Motor;

    model GearWithExternalRatio
      extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
      Modelica.Blocks.Interfaces.RealInput ratio annotation(Placement(transformation(origin = {0,100}, extent = {{-10,10},{10,-10}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-10,10},{10,-10}}, rotation = -90)));
    equation
      flange_a.tau = -flange_b.tau / ratio;
      flange_a.phi = ratio * flange_b.phi;
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points=  {{-52.06,0},{-90,0}}),Rectangle(extent=  {{-100,-100},{100,100}}),Ellipse(extent=  {{-15.34,-17.87},{-49.37,13.04}}),Ellipse(extent=  {{65.83,-38.43},{-10.53,36.21}}),Line(points=  {{68.51,0},{90,0}})}));
    end GearWithExternalRatio;

    model Schaltgetriebe
      parameter Inertia Jgi = 0.1 "Getriebeträgheit Antrieb";
      parameter Inertia Jgo = 0.1 "Getriebeträgheit Abtrieb";
      parameter AngularVelocity om0 = 0 "Anfangsdrehzahl";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = Jgo, w(start = 0)) annotation(Placement(transformation(origin = {48.2168,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jgi, w(start = om0, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {-53.3524,0.285307}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Tables.CombiTable1Ds combitable1ds1(tableOnFile = true, tableName = "schaltung", fileName = "schaltgetriebe.txt") annotation(Placement(transformation(origin = {-0.233585,66.7618}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PJlib.Kap16.GearWithExternalRatio gearwithexternalratio1 annotation(Placement(transformation(origin = {0.0517256,0.285307}, extent = {{-12,-12},{12,12}})));
    equation
      connect(combitable1ds1.y[1],gearwithexternalratio1.ratio) annotation(Line(points={{
              -0.233585,53.5618},{-0.233585,12.3919},{0.0517256,12.3919},{
              0.0517256,12.2853}}));
      connect(u,combitable1ds1.u) annotation(Line(points = {{0,100},{0,100},{0,81.1618},{-0.233585,81.1618}}));
      connect(gearwithexternalratio1.flange_b,inertia2.flange_a) annotation(Line(points={{12.0517,
              0.285307},{36.5193,0.285307},{36.5193,0},{36.2168,0}}));
      connect(gearwithexternalratio1.flange_a,inertia1.flange_b) annotation(Line(points={{
              -11.9483,0.285307},{-11.9483,0.285307},{-41.3524,0.285307}}));
      connect(inertia1.flange_a,flange_a) annotation(Line(points = {{-65.3524,0.285307},{-97.8602,0.285307},{-97.8602,0},{-100,0}}));
      connect(inertia2.flange_b,flange_b) annotation(Line(points = {{60.2168,0},{100,0},{100,0},{100,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-89,-5},{-51,5}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-43,0},{-21,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{-32,-11},{-32,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-48,-16},{-16,16}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{-38,-6},{-26,6}},
                lineThickness=                                                                                                    3),Line(points=  {{16,0},{38,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{27,-11},{27,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-11,-38},{65,38}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{21,-6},{33,6}},
                lineThickness=                                                                                                    3),Rectangle(extent=  {{68,-5},{89,5}},
                fillPattern=                                                                                                    FillPattern.Solid)}));
    end Schaltgetriebe;

    model Kupplung
      parameter Torque Mg = 280 "Gleitreibungsmoment";
      parameter Torque Mh = 280 "Haftreibungsmoment";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Clutch clutch1(peak = Mh / Mg, fn_max = 2 * Mg) annotation(Placement(transformation(origin = {7.19424,-0.28777}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {0,104}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,104}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(origin = {40.8633,79.7122}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(transformation(origin = {6.90647,38.8489}, extent = {{-12,12},{12,-12}}, rotation = -90)));
    equation
      connect(const.y,add1.u1) annotation(Line(points = {{40.8633,66.5122},{40.8633,66.5122},{40.8633,62.446},{13.5252,62.446},{13.5252,53.2489},{14.1065,53.2489}}));
      connect(add1.y,clutch1.f_normalized) annotation(Line(points = {{6.90647,25.6489},{6.90647,25.6489},{6.90647,12.9122},{7.19424,12.9122}}));
      connect(clutch1.flange_a,flange_a) annotation(Line(points = {{-4.80576,-0.28777},{-100.144,-0.28777},{-100.144,0},{-100,0}}));
      connect(clutch1.flange_b,flange_b) annotation(Line(points = {{19.1942,-0.28777},{100.144,-0.28777},{100.144,0},{100,0}}));
      connect(u,add1.u2) annotation(Line(points = {{0,104},{0,104},{0,53.2489},{-0.293525,53.2489}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-20,-80},{-10,80}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{10,-80},{20,80}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-89,-5},{-20,5}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{20,-5},{89,5}},
                fillPattern=                                                                                                    FillPattern.Solid)}));
    end Kupplung;

    model SignalSynchronring
      parameter Real minVal = 0.9 "Minimalwert";
      parameter Real maxVal = 1.1 "Maximalwert";
      parameter Real Tschalt = 0.5 "Schaltzeit";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-102.996,7.98859}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {105.563,7.98859}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {103,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Nand nand1 annotation(Placement(transformation(origin = {-8.05755,8.05755}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.GreaterEqualThreshold greaterequalthreshold1(threshold = minVal) annotation(Placement(transformation(origin = {-56.4029,32.518}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.LessThreshold lessthreshold1(threshold = maxVal) annotation(Placement(transformation(origin = {-55.2518,-12.3741}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.BooleanToReal booleantoreal1 annotation(Placement(transformation(origin = {30.7914,8.05755}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.FirstOrder firstorder1(T = Tschalt / (2 * Modelica.Constants.pi), initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 1) annotation(Placement(transformation(origin = {69.6403,8.63309}, extent = {{-12,-12},{12,12}})));
    equation
      connect(firstorder1.y,y) annotation(Line(points = {{82.8403,8.63309},{97.554,8.63309},{97.554,7.98859},{105.563,7.98859}}));
      connect(booleantoreal1.y,firstorder1.u) annotation(Line(points = {{43.9914,8.05755},{54.964,8.05755},{54.964,8.63309},{55.2403,8.63309}}));
      connect(nand1.y,booleantoreal1.u) annotation(Line(points = {{5.14245,8.05755},{15.8273,8.05755},{15.8273,8.05755},{16.3914,8.05755}}));
      connect(lessthreshold1.y,nand1.u2) annotation(Line(points = {{-42.0518,-12.3741},{-33.9568,-12.3741},{-33.9568,-1.43885},{-22.4576,-1.43885},{-22.4576,-1.54245}}));
      connect(greaterequalthreshold1.y,nand1.u1) annotation(Line(points = {{-43.2029,32.518},{-33.9568,32.518},{-33.9568,7.76978},{-22.4576,7.76978},{-22.4576,8.05755}}));
      connect(lessthreshold1.u,u) annotation(Line(points = {{-69.6518,-12.3741},{-80.5755,-12.3741},{-80.5755,8.05755},{-102.996,8.05755},{-102.996,7.98859}}));
      connect(greaterequalthreshold1.u,u) annotation(Line(points = {{-70.8029,32.518},{-80.5755,32.518},{-80.5755,8.05755},{-102.996,8.05755},{-102.996,7.98859}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}})}));
    end SignalSynchronring;

    model Schaltgetriebe1
      parameter Inertia Jgi = 0.1 "Getriebeträgheit Antrieb";
      parameter Inertia Jgo = 0.1 "Getriebeträgheit Abtrieb";
      parameter Real[5] ig = {4.15,2.52,1.69,1.24,1.0}
        "Übersetzungen Schaltgetriebe";
      parameter Integer gang = 1 "eingelegter Gang";
      parameter AngularVelocity om0 = 0 "Anfangsdrehzahl";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = Jgo, w(start = om0 / ig[gang])) annotation(Placement(transformation(origin = {48.2168,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jgi, w(start = om0, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {-53.3524,0.285307}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = ig[gang]) annotation(Placement(transformation(origin = {-0.28777,0}, extent = {{-12,-12},{12,12}})));
    equation
      connect(idealgear1.flange_b,inertia2.flange_a) annotation(Line(points={{11.7122,
              0},{36.259,0},{36.259,0},{36.2168,0}}));
      connect(inertia1.flange_b,idealgear1.flange_a) annotation(Line(points={{
              -41.3524,0.285307},{-12.0863,0.285307},{-12.0863,0},{-12.2878,0}}));
      connect(inertia1.flange_a,flange_a) annotation(Line(points = {{-65.3524,0.285307},{-97.8602,0.285307},{-97.8602,0},{-100,0}}));
      connect(inertia2.flange_b,flange_b) annotation(Line(points = {{60.2168,0},{100,0},{100,0},{100,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-89,-5},{-51,5}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-43,0},{-21,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{-32,-11},{-32,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-48,-16},{-16,16}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{-38,-6},{-26,6}},
                lineThickness=                                                                                                    3),Line(points=  {{16,0},{38,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{27,-11},{27,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-11,-38},{65,38}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{21,-6},{33,6}},
                lineThickness=                                                                                                    3),Rectangle(extent=  {{68,-5},{89,5}},
                fillPattern=                                                                                                    FillPattern.Solid)}));
    end Schaltgetriebe1;

    model Schaltgetriebe2
      parameter Real i2 = 2.52 "Uebersetzung 2. Gang";
      parameter Real i1 = 4.15 "Uebersetzung 1. Gang";
      parameter Inertia Jgo = 0.5 "Getriebeträgheit Abtrieb";
      parameter Inertia Jgi = 0.5 "Getriebeträgheit Antrieb";
      parameter Time TS = 0.5 "Synchronisierungszeit";
      parameter AngularVelocity om0 = 0 "Anfangsdrehzahl";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jgi, w(start = om0, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {-85.1804,-0.287721}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = Jgo, w(start = om0 / i1, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {84.8921,-0.287763}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung1(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-52.6619,35.3958}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung2(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-37.9856,18.705}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = i1) annotation(Placement(transformation(origin = {56.6907,35.3957}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = i2) annotation(Placement(transformation(origin = {56.6906,18.7051}, extent = {{-6,-6},{6,6}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring1(minVal = 0.9, maxVal = 1.1, Tschalt = TS) annotation(Placement(transformation(origin = {-53.2374,63.5971}, extent = {{-6,6},{6,-6}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring2(minVal = 1.9, maxVal = 2.1, Tschalt = TS) annotation(Placement(transformation(origin = {-38.5611,63.8849}, extent = {{-6,6},{6,-6}}, rotation = -90)));
    equation
      connect(signalsynchronring1.u,u) annotation(Line(points={{-53.2374,
              69.7771},{-52.6619,69.7771},{-52.6619,82.8777},{0,82.8777},{0,100},
              {0,100}}));
      connect(signalsynchronring2.u,u) annotation(Line(points={{-38.5611,
              70.0649},{-37.9856,70.0649},{-37.9856,82.8777},{0.28777,82.8777},
              {0.28777,100},{0,100}}));
      connect(signalsynchronring1.y,kupplung1.u) annotation(Line(points={{
              -53.2374,57.4171},{-52.9496,57.4171},{-52.9496,41.6358},{-52.6619,
              41.6358}}));
      connect(signalsynchronring2.y,kupplung2.u) annotation(Line(points={{
              -38.5611,57.7049},{-38.2734,57.7049},{-38.2734,24.945},{-37.9856,
              24.945}}));
      connect(flange_a,inertia1.flange_a) annotation(Line(points = {{-100,0},{-90.9353,0},{-90.9353,-0.287721},{-91.1804,-0.287721}}));
      connect(kupplung1.flange_a,inertia1.flange_b) annotation(Line(points = {{-58.6619,35.3958},{-67.9137,35.3958},{-67.9137,-0.28777},{-79.1804,-0.28777},{-79.1804,-0.287721}}));
      connect(kupplung2.flange_a,inertia1.flange_b) annotation(Line(points = {{-43.9856,18.705},{-67.9137,18.705},{-67.9137,-0.28777},{-79.1804,-0.28777},{-79.1804,-0.287721}}));
      connect(kupplung1.flange_b,idealgear1.flange_a) annotation(Line(points = {{-46.6619,35.3958},{51.223,35.3958},{51.223,35.3957},{50.6907,35.3957}}));
      connect(kupplung2.flange_b,idealgear2.flange_a) annotation(Line(points = {{-31.9856,18.705},{49.7842,18.705},{49.7842,18.7051},{50.6906,18.7051}}));
      connect(idealgear1.flange_b,inertia2.flange_a) annotation(Line(points = {{62.6907,35.3957},{70.5036,35.3957},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(idealgear2.flange_b,inertia2.flange_a) annotation(Line(points = {{62.6906,18.7051},{70.5036,18.7051},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(inertia2.flange_b,flange_b) annotation(Line(points = {{90.8921,-0.287763},{99.8561,-0.287763},{99.8561,0},{100,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-89,-5},{-51,5}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-43,0},{-21,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{-32,-11},{-32,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-48,-16},{-16,16}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{-38,-6},{-26,6}},
                lineThickness=                                                                                                    3),Line(points=  {{16,0},{38,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{27,-11},{27,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-11,-38},{65,38}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{21,-6},{33,6}},
                lineThickness=                                                                                                    3),Rectangle(extent=  {{68,-5},{89,5}},
                fillPattern=                                                                                                    FillPattern.Solid)}));
    end Schaltgetriebe2;

    model Schaltgetriebe3
      parameter Real i1 = 4.15 "Uebersetzung 1. Gang";
      parameter Real i2 = 2.52 "Uebersetzung 2. Gang";
      parameter Real i3 = 1.69 "Uebersetzung 3. Gang";
      parameter Inertia Jgo = 0.5 "Getriebeträgheit Abtrieb";
      parameter Inertia Jgi = 0.5 "Getriebeträgheit Antrieb";
      parameter Time TS = 0.5 "Synchronisierungszeit";
      parameter AngularVelocity om0 = 0 "Anfangsdrehzahl";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jgi, w(start = om0, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {-85.1804,-0.287721}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = Jgo, w(start = om0 / i1, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {84.8921,-0.287763}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung1(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-52.6619,35.3958}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung2(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-37.9856,18.705}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = i1) annotation(Placement(transformation(origin = {56.6907,35.3957}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = i2) annotation(Placement(transformation(origin = {56.6906,18.7051}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung3(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-21.295,-0.287806}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear3(ratio = i3) annotation(Placement(transformation(origin = {57.2661,-0.287707}, extent = {{-6,-6},{6,6}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring1(minVal = 0.9, maxVal = 1.1, Tschalt = TS) annotation(Placement(transformation(origin = {-53.2374,63.5971}, extent = {{-6,6},{6,-6}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring2(minVal = 1.9, maxVal = 2.1, Tschalt = TS) annotation(Placement(transformation(origin = {-38.5611,63.8849}, extent = {{-6,6},{6,-6}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring3(minVal = 2.9, maxVal = 3.1, Tschalt = TS) annotation(Placement(transformation(origin = {-22.446,63.8849}, extent = {{-6,6},{6,-6}}, rotation = -90)));
    equation
      connect(signalsynchronring3.u,u) annotation(Line(points = {{-21.9667,70.0647},{-22.1583,70.0647},{-22.1583,82.8777},{0.28777,82.8777},{0.28777,100},{0,100}}));
      connect(signalsynchronring3.y,kupplung3.u) annotation(Line(points = {{-21.9667,57.5511},{-21.5828,57.5511},{-21.5828,5.95219},{-21.295,5.95219}}));
      connect(idealgear3.flange_b,inertia2.flange_a) annotation(Line(points = {{63.2661,-0.287707},{70.5036,-0.287707},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(kupplung3.flange_b,idealgear3.flange_a) annotation(Line(points = {{-15.295,-0.287806},{49.7842,-0.287806},{49.7842,-0.287707},{51.2661,-0.287707}}));
      connect(kupplung3.flange_a,inertia1.flange_b) annotation(Line(points = {{-27.295,-0.287806},{-67.9137,-0.287806},{-67.9137,-0.28777},{-79.1804,-0.28777},{-79.1804,-0.287721}}));
      connect(signalsynchronring1.u,u) annotation(Line(points = {{-52.7581,69.7769},{-52.6619,69.7769},{-52.6619,82.8777},{0,82.8777},{0,103},{0,103}}));
      connect(signalsynchronring2.u,u) annotation(Line(points = {{-38.0818,70.0647},{-37.9856,70.0647},{-37.9856,82.8777},{0.28777,82.8777},{0.28777,103},{0,103}}));
      connect(signalsynchronring1.y,kupplung1.u) annotation(Line(points = {{-52.7581,57.2633},{-52.9496,57.2633},{-52.9496,41.6358},{-52.6619,41.6358}}));
      connect(signalsynchronring2.y,kupplung2.u) annotation(Line(points = {{-38.0818,57.5512},{-38.2734,57.5512},{-38.2734,24.945},{-37.9856,24.945}}));
      connect(flange_a,inertia1.flange_a) annotation(Line(points = {{-100,0},{-90.9353,0},{-90.9353,-0.287721},{-91.1804,-0.287721}}));
      connect(kupplung1.flange_a,inertia1.flange_b) annotation(Line(points = {{-58.6619,35.3958},{-67.9137,35.3958},{-67.9137,-0.28777},{-79.1804,-0.28777},{-79.1804,-0.287721}}));
      connect(kupplung2.flange_a,inertia1.flange_b) annotation(Line(points = {{-43.9856,18.705},{-67.9137,18.705},{-67.9137,-0.28777},{-79.1804,-0.28777},{-79.1804,-0.287721}}));
      connect(kupplung1.flange_b,idealgear1.flange_a) annotation(Line(points = {{-46.6619,35.3958},{51.223,35.3958},{51.223,35.3957},{50.6907,35.3957}}));
      connect(kupplung2.flange_b,idealgear2.flange_a) annotation(Line(points = {{-31.9856,18.705},{49.7842,18.705},{49.7842,18.7051},{50.6906,18.7051}}));
      connect(idealgear1.flange_b,inertia2.flange_a) annotation(Line(points = {{62.6907,35.3957},{70.5036,35.3957},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(idealgear2.flange_b,inertia2.flange_a) annotation(Line(points = {{62.6906,18.7051},{70.5036,18.7051},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(inertia2.flange_b,flange_b) annotation(Line(points = {{90.8921,-0.287763},{99.8561,-0.287763},{99.8561,0},{100,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-89,-5},{-51,5}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-43,0},{-21,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{-32,-11},{-32,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-48,-16},{-16,16}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{-38,-6},{-26,6}},
                lineThickness=                                                                                                    3),Line(points=  {{16,0},{38,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{27,-11},{27,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-11,-38},{65,38}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{21,-6},{33,6}},
                lineThickness=                                                                                                    3),Rectangle(extent=  {{68,-5},{89,5}},
                fillPattern=                                                                                                    FillPattern.Solid)}));
    end Schaltgetriebe3;

    model Schaltgetriebe5
      parameter Time TS = 0.5 "Synchronisierungszeit";
      parameter Inertia Jgi = 0.5 "Getriebeträgheit Antrieb";
      parameter Inertia Jgo = 0.5 "Getriebeträgheit Abtrieb";
      parameter Real i1 = 4.15 "Uebersetzung 1. Gang";
      parameter Real i2 = 2.52 "Uebersetzung 2. Gang";
      parameter Real i3 = 1.69 "Uebersetzung 3. Gang";
      parameter Real i4 = 1.24 "Uebersetzung 4. Gang";
      parameter Real i5 = 1.0 "Uebersetzung 5. Gang";
      parameter AngularVelocity om0 = 0 "Anfangsdrehzahl";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jgi, w(start = om0, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {-85.1804,-0.287721}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = Jgo, w(start = om0 / i1, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {84.8921,-0.287763}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung1(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-52.6619,35.3958}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung2(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-37.9856,18.705}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung3(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-21.0072,-0.287721}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung4(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {-3.16546,-16.4028}, extent = {{-6,-6},{6,6}})));
      PJlib.Kap16.Kupplung kupplung5(Mg = 1900, Mh = 2000) annotation(Placement(transformation(origin = {12.9497,-34.5324}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = i1) annotation(Placement(transformation(origin = {56.6907,35.3957}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = i2) annotation(Placement(transformation(origin = {56.6906,18.7051}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear3(ratio = i3) annotation(Placement(transformation(origin = {56.4029,-0.287788}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear4(ratio = i4) annotation(Placement(transformation(origin = {55.8273,-16.6906}, extent = {{-6,-6},{6,6}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear5(ratio = i5) annotation(Placement(transformation(origin = {56.1152,-34.5324}, extent = {{-6,-6},{6,6}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring1(minVal = 0.9, maxVal = 1.1, Tschalt = TS) annotation(Placement(transformation(origin = {-53.2374,63.5971}, extent = {{-6,6},{6,-6}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring2(minVal = 1.9, maxVal = 2.1, Tschalt = TS) annotation(Placement(transformation(origin = {-38.5611,63.8849}, extent = {{-6,6},{6,-6}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring3(minVal = 2.9, maxVal = 3.1, Tschalt = TS) annotation(Placement(transformation(origin = {-21.295,63.885}, extent = {{-6,6},{6,-6}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring4(minVal = 3.9, maxVal = 4.1, Tschalt = TS) annotation(Placement(transformation(origin = {-4.02878,63.8849}, extent = {{-6,6},{6,-6}}, rotation = -90)));
      PJlib.Kap16.SignalSynchronring signalsynchronring5(minVal = 4.9, maxVal = 5.1, Tschalt = TS) annotation(Placement(transformation(origin = {12.3741,63.8849}, extent = {{-6,6},{6,-6}}, rotation = -90)));
    equation
      connect(signalsynchronring2.u,u) annotation(Line(points={{-38.5611,70.0649},
              {-37.9856,70.0649},{-37.9856,82.8777},{0.28777,82.8777},{0.28777,100},
              {0,100}}));
      connect(signalsynchronring3.u,u) annotation(Line(points={{-21.295,70.065},{-20.7194,
              70.065},{-20.7194,82.8777},{0,82.8777},{0,100},{0,100}}));
      connect(signalsynchronring4.u,u) annotation(Line(points={{-4.02878,70.0649},
              {-3.45324,70.0649},{-3.45324,82.8777},{0,82.8777},{0,100},{0,100}}));
      connect(signalsynchronring5.u,u) annotation(Line(points={{12.3741,70.0649},{
              12.9496,70.0649},{12.9496,82.8777},{0,82.8777},{0,100},{0,100}}));
      connect(signalsynchronring1.u,u) annotation(Line(points={{-53.2374,69.7771},
              {-52.6619,69.7771},{-52.6619,82.8777},{0,82.8777},{0,100},{0,100}}));
      connect(idealgear5.flange_b,inertia2.flange_a) annotation(Line(points = {{62.1152,-34.5324},{70.5036,-34.5324},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(idealgear4.flange_b,inertia2.flange_a) annotation(Line(points = {{61.8273,-16.6906},{70.5036,-16.6906},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(idealgear2.flange_b,inertia2.flange_a) annotation(Line(points = {{62.6906,18.7051},{70.5036,18.7051},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(idealgear1.flange_b,inertia2.flange_a) annotation(Line(points = {{62.6907,35.3957},{70.5036,35.3957},{70.5036,-0.28777},{78.8921,-0.28777},{78.8921,-0.287763}}));
      connect(kupplung5.flange_a,inertia1.flange_b) annotation(Line(points={{6.9497,
              -34.5324},{-67.9137,-34.5324},{-67.9137,-0.28777},{-79.1804,-0.28777},
              {-79.1804,-0.287721}}));
      connect(kupplung4.flange_a,inertia1.flange_b) annotation(Line(points = {{-9.16546,-16.4028},{-67.9137,-16.4028},{-67.9137,-0.28777},{-79.1804,-0.28777},{-79.1804,-0.287721}}));
      connect(kupplung2.flange_a,inertia1.flange_b) annotation(Line(points = {{-43.9856,18.705},{-67.9137,18.705},{-67.9137,-0.28777},{-79.1804,-0.28777},{-79.1804,-0.287721}}));
      connect(kupplung1.flange_a,inertia1.flange_b) annotation(Line(points = {{-58.6619,35.3958},{-67.9137,35.3958},{-67.9137,-0.28777},{-79.1804,-0.28777},{-79.1804,-0.287721}}));
      connect(kupplung5.flange_b,idealgear5.flange_a) annotation(Line(points = {{18.9497,-34.5324},{50.0719,-34.5324},{50.0719,-34.5324},{50.1152,-34.5324}}));
      connect(kupplung4.flange_b,idealgear4.flange_a) annotation(Line(points = {{2.83454,-16.4028},{50.3597,-16.4028},{50.3597,-16.6906},{49.8273,-16.6906}}));
      connect(idealgear3.flange_b,inertia2.flange_a) annotation(Line(points = {{62.4029,-0.287788},{80.5755,-0.287788},{80.5755,-0.287763},{78.8921,-0.287763}}));
      connect(kupplung3.flange_b,idealgear3.flange_a) annotation(Line(points = {{-15.0072,-0.287721},{50.0719,-0.287721},{50.0719,-0.287788},{50.4029,-0.287788}}));
      connect(kupplung2.flange_b,idealgear2.flange_a) annotation(Line(points = {{-31.9856,18.705},{49.7842,18.705},{49.7842,18.7051},{50.6906,18.7051}}));
      connect(kupplung1.flange_b,idealgear1.flange_a) annotation(Line(points = {{-46.6619,35.3958},{51.223,35.3958},{51.223,35.3957},{50.6907,35.3957}}));
      connect(signalsynchronring5.y,kupplung5.u) annotation(Line(points={{12.3741,
              57.7049},{12.9496,57.7049},{12.9496,-28.2924},{12.9497,-28.2924}}));
      connect(signalsynchronring4.y,kupplung4.u) annotation(Line(points={{-4.02878,
              57.7049},{-3.45324,57.7049},{-3.45324,-10.1628},{-3.16546,-10.1628}}));
      connect(kupplung3.flange_a,inertia1.flange_b) annotation(Line(points = {{-27.0072,-0.287721},{-78.8489,-0.287721},{-78.8489,-0.287721},{-79.1804,-0.287721}}));
      connect(signalsynchronring3.y,kupplung3.u) annotation(Line(points={{-21.295,
              57.705},{-21.0072,57.705},{-21.0072,5.95228},{-21.0072,5.95228}}));
      connect(signalsynchronring2.y,kupplung2.u) annotation(Line(points={{-38.5611,
              57.7049},{-38.2734,57.7049},{-38.2734,24.945},{-37.9856,24.945}}));
      connect(signalsynchronring1.y,kupplung1.u) annotation(Line(points={{-53.2374,
              57.4171},{-52.9496,57.4171},{-52.9496,41.6358},{-52.6619,41.6358}}));
      connect(inertia2.flange_b,flange_b) annotation(Line(points = {{90.8921,-0.287763},{99.8561,-0.287763},{99.8561,0},{100,0}}));
      connect(flange_a,inertia1.flange_a) annotation(Line(points = {{-100,0},{-90.9353,0},{-90.9353,-0.287721},{-91.1804,-0.287721}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-89,-5},{-51,5}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-43,0},{-21,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{-32,-11},{-32,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-48,-16},{-16,16}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{-38,-6},{-26,6}},
                lineThickness=                                                                                                    3),Line(points=  {{16,0},{38,0}}, color=  {128,128,128}, thickness=  3),Line(points=  {{27,-11},{27,11}}, color=  {128,128,128}, thickness=  3),Ellipse(extent=  {{-11,-38},{65,38}},
                lineThickness=                                                                                                    3),Ellipse(extent=  {{21,-6},{33,6}},
                lineThickness=                                                                                                    3),Rectangle(extent=  {{68,-5},{89,5}},
                fillPattern=                                                                                                    FillPattern.Solid)}));
    end Schaltgetriebe5;

    model Differential

      Modelica.Mechanics.Rotational.Interfaces.Flange_a fli annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a fll annotation(Placement(transformation(extent = {{90,40},{110,60}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flr annotation(Placement(transformation(extent = {{90,-60},{110,-40}})));
    equation
      fli.tau = -2 * fll.tau;
      flr.tau = fll.tau;
      2 * fli.phi = fll.phi + flr.phi;
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-90,-5},{-50,5}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{50,45},{90,55}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{50,-55},{90,-45}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-50,-20},{-50,20},{50,65},{50,-65},{-50,-20}}, thickness=  3)}));
    end Differential;

    model Differentialgetriebe
      parameter Inertia Ji = 0.04 "Trägheit Antrieb";
      parameter Inertia Jo = 0.05 "Trägheit Abtrieb";
      parameter Real i = 3.27 "Übersetzung";
      parameter AngularVelocity om0 = 0 "Anfangsdrehzahl";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,50}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1 annotation(Placement(transformation(origin = {100,-50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-50}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.Differential differential1 annotation(Placement(transformation(origin = {10.8416,0.285303}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia3(J = Ji, w(start = om0, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {-65.9058,-0.000000389428}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = i) annotation(Placement(transformation(origin = {-29.3866,0.285303}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jo, w(start = om0 / i, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {65.6205,49.9287}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = Jo,
        phi(fixed=false),
        w(fixed=false))                                                                                                     annotation(Placement(transformation(origin = {65.05,-48.5021}, extent = {{-12,-12},{12,12}})));
    equation
      connect(differential1.flr,inertia2.flange_a) annotation(Line(points={{22.8416,
              -5.7147},{37.6605,-5.7147},{37.6605,-48.2168},{53.05,-48.2168},{
              53.05,-48.5021}}));
      connect(differential1.fll,inertia1.flange_a) annotation(Line(points={{22.8416,
              6.2853},{37.6605,6.2853},{37.6605,49.9287},{53.6205,49.9287}}));
      connect(idealgear1.flange_b,differential1.fli) annotation(Line(points={{
              -17.3866,0.285303},{-0.85592,0.285303},{-1.1584,0.285303}}));
      connect(inertia3.flange_b,idealgear1.flange_a) annotation(Line(points = {{-53.9058,-0.000000389428},{-41.0842,-0.000000389428},{-41.0842,0.285303},{-41.3866,0.285303}}));
      connect(inertia3.flange_a,flange_a) annotation(Line(points = {{-77.9058,-0.000000389428},{-99.8573,-0.000000389428},{-99.8573,0},{-100,0}}));
      connect(inertia2.flange_b,flange_b1) annotation(Line(points = {{77.05,-48.5021},{100.428,-48.5021},{100.428,-50},{100,-50}}));
      connect(inertia1.flange_b,flange_b) annotation(Line(points = {{77.6205,49.9287},{98.1455,49.9287},{98.1455,50},{100,50}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Rectangle(extent=  {{-90,-5},{-50,5}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{50,45},{90,55}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{50,-55},{90,-45}},
                fillPattern=                                                                                                    FillPattern.Solid),Polygon(points=  {{-50,-20},{-50,20},{50,65},{50,-65},{-50,-20}},
                fillPattern=                                                                                                    FillPattern.Solid)}));
    end Differentialgetriebe;

    model Karosserie
      parameter Mass m = 1200 "Fahrzeugmasse";
      parameter Real cW = 0.36 "Widerstandsbeiwert";
      parameter Area A = 2 "angeströmte Fläche";
      parameter Density rho = 1.293 "Dichte der Luft";
      parameter Acceleration g = 9.81 "Erdbeschleunigung";
      parameter Velocity v0 = 0 "Anfangsgeschwindigkeit";
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-99.572,5.42083}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-99.572,5.42083}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Components.Mass mass1(m = m, s(start = 0, fixed = true), v(start = v0, fixed = true)) annotation(Placement(transformation(origin = {-38.2311,-65.3352}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sources.Force force1 annotation(Placement(transformation(origin = {-64.7646,60.485}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Mechanics.Translational.Sources.Force force2 annotation(Placement(transformation(origin = {-64.7646,5.70613}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Blocks.Math.Gain gain2(k = -m * g) annotation(Placement(transformation(origin = {-27.6748,60.485}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Blocks.Math.Sin sin1 annotation(Placement(transformation(origin = {11.6976,60.1997}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Blocks.Math.Gain gain3(k = Modelica.Constants.pi / 180) annotation(Placement(transformation(origin = {49.3581,60.1997}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Blocks.Math.Gain gain1(k = -0.5 * rho * cW * A) annotation(Placement(transformation(origin = {-27.1041,5.70613}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Blocks.Math.Product product1 annotation(Placement(transformation(origin = {9.41512,5.42083}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(origin = {54.2083,12.5535}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Mechanics.Translational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {83.3096,-43.6519}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-1.71184,103.852}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {-4.32277,97.1182}, extent = {{-12,-12},{12,12}}, rotation = -90)));
    equation
      connect(force1.flange,flange_a) annotation(Line(points = {{-76.7646,60.485},{-85.3067,60.485},{-85.3067,5.42083},{-99.572,5.42083},{-99.572,5.42083}}));
      connect(mass1.flange_a,flange_a) annotation(Line(points = {{-50.2311,-65.3352},{-85.3067,-65.3352},{-85.3067,5.42083},{-99.572,5.42083},{-99.572,5.42083}}));
      connect(flange_a,force2.flange) annotation(Line(points = {{-99.572,5.42083},{-76.7475,5.42083},{-76.7475,5.70613},{-76.7646,5.70613}}));
      connect(mass1.flange_b,speedsensor1.flange) annotation(Line(points = {{-26.2311,-65.3352},{83.5949,-65.3352},{83.5949,-55.6519},{83.3096,-55.6519}}));
      connect(product1.u1,speedsensor1.v) annotation(Line(points = {{23.8151,-1.77917},{83.3096,-1.77917},{83.3096,-31.0984},{83.3096,-31.0984},{83.3096,-30.4519}}));
      connect(abs1.u,speedsensor1.v) annotation(Line(points = {{68.6083,12.5535},{83.3096,12.5535},{83.3096,-30.4519},{83.3096,-30.4519}}));
      connect(product1.u2,abs1.y) annotation(Line(points = {{23.8151,12.6208},{42.796,12.6208},{42.796,12.5535},{41.0083,12.5535}}));
      connect(gain1.u,product1.y) annotation(Line(points = {{-12.7041,5.70613},{-3.42368,5.70613},{-3.42368,5.42083},{-3.78488,5.42083}}));
      connect(force2.f,gain1.y) annotation(Line(points = {{-50.3646,5.70613},{-39.3723,5.70613},{-39.3723,5.70613},{-40.3041,5.70613}}));
      connect(gain3.u,u) annotation(Line(points = {{63.7581,60.1997},{78.174,60.1997},{78.174,82.1683},{-1.71184,82.1683},{-1.71184,103.852},{-1.71184,103.852}}));
      connect(sin1.u,gain3.y) annotation(Line(points = {{26.0976,60.1997},{36.234,60.1997},{36.234,60.1997},{36.1581,60.1997}}));
      connect(gain2.u,sin1.y) annotation(Line(points = {{-13.2748,60.485},{-1.14123,60.485},{-1.14123,60.1997},{-1.50243,60.1997}}));
      connect(force1.f,gain2.y) annotation(Line(points = {{-50.3646,60.485},{-39.087,60.485},{-39.087,60.485},{-40.8748,60.485}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Bitmap(extent=  {{-100,100},{100,-100}}, fileName=  "icon-karosserie.png")}));
    end Karosserie;

    block TriggeredSamplerPre "TriggeredSampler with pre"
      extends Modelica.Blocks.Interfaces.DiscreteBlockIcon;
      parameter Real y_start=0 "initial value of output signal";

      Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(
        transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.BooleanInput trigger annotation (Placement(
        transformation(
        origin={0,-118},
        extent={{-20,-20},{20,20}},
        rotation=90)));
    equation
      when trigger then
        y = pre(u);
      end when;
    initial equation
      y = y_start;
      annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Ellipse(
          extent={{-25,-10},{-45,10}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{45,-10},{25,10}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-100,0},{-45,0}}, color={0,0,127}),
        Line(points={{45,0},{100,0}}, color={0,0,127}),
        Line(points={{0,-100},{0,-26}}, color={255,0,255}),
        Line(points={{-35,0},{28,-48}}, color={0,0,127})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
        Ellipse(
          extent={{-25,-10},{-45,10}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{45,-10},{25,10}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-100,0},{-45,0}}, color={0,0,255}),
        Line(points={{45,0},{100,0}}, color={0,0,255}),
        Line(points={{-35,0},{28,-48}}, color={0,0,255}),
        Line(points={{0,-100},{0,-26}}, color={255,0,255})}));
    end TriggeredSamplerPre;

    model ToggleFF
      parameter Real yStart = 0 "Anfangswert";
      Modelica.Blocks.Interfaces.BooleanInput u annotation(Placement(transformation(origin = {-104,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-104,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.BooleanOutput y annotation(Placement(transformation(origin={108,50},   extent = {{-12,-12},{12,12}}), iconTransformation(origin={108,50},   extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Not not1 annotation(Placement(transformation(origin={-55.3409,
                31.0984},                                                                                               extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.BooleanToReal booleantoreal1 annotation(Placement(transformation(origin={-15.9686,
                31.0984},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.RealToBoolean realtoboolean1 annotation(Placement(transformation(origin={65.0585,
                31.0984},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Discrete.TriggeredSampler triggeredsampler1(y_start = yStart) annotation(Placement(transformation(origin={24.5449,
                31.0984},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Pre pre1 annotation(Placement(transformation(origin={-89.7689,
                31.0984},                                                                                              extent = {{-12,-12},{12,12}})));
    equation
      connect(u,triggeredsampler1.trigger) annotation(Line(points={{-104,
              -8.88178e-16},{24.8302,-8.88178e-16},{24.8302,16.9384},{24.5449,
              16.9384}}));
      connect(triggeredsampler1.y,realtoboolean1.u) annotation(Line(points={{37.7449,
              31.0984},{49.3666,31.0984},{50.6585,31.0984}}));
      connect(booleantoreal1.y,triggeredsampler1.u) annotation(Line(points={{-2.7686,
              31.0984},{9.42368,31.0984},{10.1449,31.0984}}));
      connect(not1.y,booleantoreal1.u) annotation(Line(points={{-42.1409,
              31.0984},{-31.3752,31.0984},{-30.3686,31.0984}}));
      connect(pre1.y, not1.u) annotation (Line(
          points={{-76.5689,31.0984},{-69.7409,31.0984}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(pre1.u, realtoboolean1.y) annotation (Line(
          points={{-104.169,31.0984},{-110,31.0984},{-110,64},{88,64},{88,31.0984},
              {78.2585,31.0984}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(realtoboolean1.y, y) annotation (Line(
          points={{78.2585,31.0984},{88,31.0984},{88,50},{108,50}},
          color={255,0,255},
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Text(extent=  {{50,35},{80,75}}, textString=  "Q", fontName=  "Times New Roman"),Line(points=  {{-100,-30},{-60,0},{-100,30}})}));
    end ToggleFF;

    model Monoflop
      parameter Real tHalt = 1 "Haltezeit";
      Modelica.Blocks.Interfaces.BooleanOutput y annotation(Placement(transformation(origin = {105,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.BooleanInput u annotation(Placement(transformation(origin = {-100,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Not not1 annotation(Placement(transformation(origin = {-67.6177,49.9287}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.And and1 annotation(Placement(transformation(origin = {-29.6719,73.3238}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Or or1 annotation(Placement(transformation(origin = {4.2796,72.4679}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Pre pre1 annotation(Placement(transformation(origin = {38.2311,72.1826}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.ToggleFF toggleff1 annotation(Placement(transformation(origin = {70.1854,71.612}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Timer timer1 annotation(Placement(transformation(origin = {51.9258,28.2454}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      Modelica.Blocks.Logical.GreaterEqualThreshold greaterequalthreshold1(threshold = tHalt) annotation(Placement(transformation(origin = {15.9772,28.2454}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
    equation
      connect(timer1.u,toggleff1.y) annotation(Line(points={{66.3258,28.2454},{86.4479,
              28.2454},{86.4479,77.6034},{83.1454,77.6034},{83.1454,77.612}}));
      connect(toggleff1.y,not1.u) annotation(Line(points={{83.1454,77.612},{86.4479,
              77.612},{86.4479,0.85592},{-87.5892,0.85592},{-87.5892,49.9287},{-82.0177,
              49.9287}}));
      connect(toggleff1.y,y) annotation(Line(points={{83.1454,77.612},{86.4479,77.612},
              {86.4479,49.9287},{105,49.9287},{105,50}}));
      connect(greaterequalthreshold1.y,or1.u2) annotation(Line(points={{2.7772,
              28.2454},{-14.8359,28.2454},{-14.8359,63.0528},{-11.4123,63.0528},
              {-11.4123,62.8679},{-10.1204,62.8679}}));
      connect(timer1.y,greaterequalthreshold1.u) annotation(Line(points={{38.7258,
              28.2454},{30.3772,28.2454}}));
      connect(not1.y,and1.u2) annotation(Line(points = {{-54.4177,49.9287},{-50.7846,49.9287},{-50.7846,63.3381},{-44.0719,63.3381},{-44.0719,63.7238}}));
      connect(u,and1.u1) annotation(Line(points={{-100,50},{-89.8716,50},{
              -89.8716,73.3238},{-44.0719,73.3238},{-44.0719,73.3238}}));
      connect(pre1.y,toggleff1.u) annotation(Line(points = {{51.4311,72.1826},{57.9173,72.1826},{57.9173,71.612},{57.7054,71.612}}));
      connect(or1.y,pre1.u) annotation(Line(points = {{17.4796,72.4679},{23.3951,72.4679},{23.3951,72.1826},{23.8311,72.1826}}));
      connect(and1.y,or1.u1) annotation(Line(points = {{-16.4719,73.3238},{-10.271,73.3238},{-10.271,72.4679},{-10.1204,72.4679}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Text(extent=  {{0,30},{30,70}}, textString=  "1", fontName=  "Times New Roman"),Line(points=  {{30,35},{40,35},{40,65},{60,65},{60,35},{70,35}}, thickness=  3),Line(points=  {{-100,20},{-60,50},{-100,80}})}));
    end Monoflop;

    model Schaltlogik
      parameter Real ts = 1 "Schaltzeit";
      parameter Real ns = 6500 "Schaltdrehzahl [Upm]";
      parameter Real Ng = 5 "Anzahl der Gänge";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-103,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {105.849,3.13837}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105.849,3.13837}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.GreaterEqualThreshold greaterequalthreshold1(threshold = ns * Modelica.Constants.pi / 30) annotation(Placement(transformation(origin = {-63.3381,39.9429}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.LessThreshold lessthreshold1(threshold = Ng - 0.5) annotation(Placement(transformation(origin = {-62.7675,-39.9429}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.And and1 annotation(Placement(transformation(origin = {-12.2682,1.99715}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.Monoflop monoflop1(tHalt = ts / 2) annotation(Placement(transformation(origin = {24.5364,-3.99429}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.BooleanToReal booleantoreal1 annotation(Placement(transformation(origin = {66.4765,2.28245}, extent = {{-12,-12},{12,12}})));
    equation
      connect(and1.y,monoflop1.u) annotation(Line(points={{0.9318,1.99715},{
              12.5535,1.99715},{12.5535,2.00571},{12.5364,2.00571}}));
      connect(booleantoreal1.y,y) annotation(Line(points = {{79.6765,2.28245},{97.8602,2.28245},{97.8602,3.13837},{105.849,3.13837}}));
      connect(monoflop1.y,booleantoreal1.u) annotation(Line(points = {{37.1364,2.00571},{55.3495,2.00571},{55.3495,2.28245},{52.0765,2.28245}}));
      connect(lessthreshold1.y,and1.u2) annotation(Line(points = {{-49.5675,-39.9429},{-37.0899,-39.9429},{-37.0899,-7.70328},{-26.6682,-7.70328},{-26.6682,-7.60285}}));
      connect(greaterequalthreshold1.y,and1.u1) annotation(Line(points = {{-50.1381,39.9429},{-37.0899,39.9429},{-37.0899,1.99715},{-26.6682,1.99715},{-26.6682,1.99715}}));
      connect(realinput1,lessthreshold1.u) annotation(Line(points = {{-103,-40},{-77.8887,-40},{-77.8887,-39.9429},{-77.1675,-39.9429}}));
      connect(u,greaterequalthreshold1.u) annotation(Line(points = {{-103,40},{-74.1797,40},{-74.1797,39.9429},{-77.7381,39.9429}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,-50},{90,50}}, textString=  "Schalten", fontName=  "Times New Roman")}));
    end Schaltlogik;

    model Fahrer1
      parameter Real ts = 1 "Schaltzeit";
      parameter Real ns = 6500 "Schaltdrehzahl [Upm]";
      parameter Real Ng = 5 "Anzahl der Gänge";
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput realoutput1 annotation(Placement(transformation(origin = {100,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput realoutput2 annotation(Placement(transformation(origin = {100,-50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.FirstOrder firstorder1(T = ts / (4 * Modelica.Constants.pi),
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1)                                                                            annotation(Placement(transformation(origin = {-24.5364,-0.285307}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.Schaltlogik schaltlogik1(ts = ts, ns = ns, Ng = Ng) annotation(Placement(transformation(origin = {-61.6262,0.000000000000000999201}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(transformation(origin = {49.6434,49.6434}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(origin = {1.14123,57.3466}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Discrete.UnitDelay unitdelay1(y_start = 1, samplePeriod = ts / 2) annotation(Placement(transformation(origin = {26.2482,-49.3581}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(origin = {-14.2653,-49.3581}, extent = {{-12,-12},{12,12}})));
    equation
      connect(schaltlogik1.realinput1,unitdelay1.y) annotation(Line(points = {{-73.9862,-4.8},{-79.6006,-4.8},{-79.6006,-71.3267},{50.7846,-71.3267},{50.7846,-49.3581},{39.4482,-49.3581},{39.4482,-49.3581}}));
      connect(add2.u2,unitdelay1.y) annotation(Line(points = {{-28.6653,-56.5581},{-44.2225,-56.5581},{-44.2225,-71.3267},{50.7846,-71.3267},{50.7846,-49.3581},{39.4482,-49.3581},{39.4482,-49.3581}}));
      connect(add2.y,unitdelay1.u) annotation(Line(points={{-1.0653,-49.3581},{
              11.127,-49.3581},{11.127,-49.3581},{11.8482,-49.3581}}));
      connect(add2.u1,schaltlogik1.y) annotation(Line(points={{-28.6653,-42.1581},
              {-44.5078,-42.1581},{-44.5078,0.285307},{-48.9243,0.285307},{-48.9243,
              0.376604}}));
      connect(unitdelay1.y,realoutput2) annotation(Line(points = {{39.4482,-49.3581},{91.5835,-49.3581},{91.5835,-50},{100,-50}}));
      connect(add1.u2,firstorder1.y) annotation(Line(points={{35.2434,42.4434},{22.8245,
              42.4434},{22.8245,-0.285307},{-11.3364,-0.285307}}));
      connect(const.y,add1.u1) annotation(Line(points={{14.3412,57.3466},{34.2368,
              57.3466},{34.2368,56.8434},{35.2434,56.8434}}));
      connect(add1.y,realoutput1) annotation(Line(points = {{62.8434,49.6434},{92.7247,49.6434},{92.7247,50},{100,50}}));
      connect(u,schaltlogik1.u) annotation(Line(points = {{-100,0},{-83.0243,0},{-83.0243,4.8},{-73.9862,4.8}}));
      connect(schaltlogik1.y,firstorder1.u) annotation(Line(points={{-48.9243,0.376604},
              {-40.5136,0.376604},{-40.5136,-0.285307},{-38.9364,-0.285307}}));
      connect(firstorder1.y,y) annotation(Line(points = {{-11.3364,-0.285307},{89.0157,-0.285307},{89.0157,0},{100,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-78,-90},{-56,-45}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-78,-45},{36,-22}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{0,-22},{36,48}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-75,13},{0,27}},
                fillPattern=                                                                                                    FillPattern.Solid),Ellipse(extent=  {{-13,49},{46,90}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-44,-55},{84,-55}}, thickness=  3),Line(points=  {{61,-55},{85,48}}, thickness=  3),Line(points=  {{-88,41},{-60,-3}}, thickness=  3),Line(points=  {{-96,6},{-75,20}}, thickness=  3),Rectangle(extent=  {{-100,-100},{100,100}})}));
    end Fahrer1;

    model TriggeredDelay
      parameter Real y0 = 1 "Initial value of output signal";
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Math.RealToBoolean realtoboolean1 annotation(Placement(transformation(origin={
                -2.22045e-16,66.7732},                                                                                                    extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Logical.FallingEdge fallingedge1 annotation(Placement(transformation(origin={0,31.395},                   extent = {{-12,12},{12,-12}}, rotation = -90)));
      TriggeredSamplerPre triggeredSamplerPre(y_start=y0)
        annotation (Placement(transformation(extent={{-10,10},{10,-10}})));
    equation
      connect(realtoboolean1.y,fallingedge1.u) annotation(Line(points={{
              -2.22045e-16,53.5732},{-1.11022e-16,53.5732},{-1.11022e-16,45.795},
              {2.22045e-16,45.795}}));
      connect(realinput1,realtoboolean1.u) annotation(Line(points={{0,100},{0,
              100},{0,81.1732},{-2.22045e-16,81.1732}}));
      connect(triggeredSamplerPre.trigger, fallingedge1.y) annotation (Line(
          points={{0,11.8},{0,18.195}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(u, triggeredSamplerPre.u) annotation (Line(
          points={{-100,0},{-12,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(triggeredSamplerPre.y, y) annotation (Line(
          points={{11,0},{100,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Polygon(points=  {{-20,100},{0,60},{20,100},{-20,100}},
                fillPattern=                                                                                                    FillPattern.Solid),Text(extent=  {{-80,-40},{80,40}}, textString=  "1 / z", fontName=  "Times New Roman")}));
    end TriggeredDelay;

    model Fahrer
      parameter Real ts = 1 "Schaltzeit";
      parameter Real ns = 6500 "Schaltdrehzahl [Upm]";
      parameter Real Ng = 5 "Anzahl der Gänge";
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput realoutput1 annotation(Placement(transformation(origin = {100,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput realoutput2 annotation(Placement(transformation(origin = {100,-50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.FirstOrder firstorder1(T = ts / (4 * Modelica.Constants.pi),
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1)                                                                            annotation(Placement(transformation(origin = {-24.5364,-0.285307}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.Schaltlogik schaltlogik1(ts = ts, ns = ns, Ng = Ng) annotation(Placement(transformation(origin = {-61.6262,0.000000000000000999201}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(transformation(origin = {49.6434,49.6434}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(origin = {1.14123,57.3466}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.TriggeredDelay triggereddelay1 annotation(Placement(transformation(origin = {40.7989,-50.214}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(origin = {1.71188,-50.214}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(transformation(origin = {-40.5136,-43.0813}, extent = {{-12,-12},{12,12}})));
    equation
      connect(schaltlogik1.realinput1,triggereddelay1.y) annotation(Line(points={{
              -73.9862,-4.8},{-80.1712,-4.8},{-80.1712,-75.6063},{65.0499,-75.6063},
              {65.0499,-50.214},{52.7989,-50.214}}));
      connect(add2.u2,triggereddelay1.y) annotation(Line(points={{-12.6881,
              -57.414},{-21.9686,-57.414},{-21.9686,-75.6063},{65.0499,-75.6063},
              {65.0499,-50.214},{52.7989,-50.214}}));
      connect(triggereddelay1.realinput1,schaltlogik1.y) annotation(Line(points={{40.7989,
              -38.214},{40.7989,-22.8245},{-44.5078,-22.8245},{-44.5078,
              0.285307},{-48.9243,0.285307},{-48.9243,0.376604}}));
      connect(constant1.y,add2.u1) annotation(Line(points={{-27.3136,-43.0813},
              {-14.8359,-43.0813},{-14.8359,-43.014},{-12.6881,-43.014}}));
      connect(add2.y,triggereddelay1.u) annotation(Line(points={{14.9119,
              -50.214},{14.9119,-50.214},{28.7989,-50.214}}));
      connect(triggereddelay1.y,realoutput2) annotation(Line(points = {{52.7989,-50.214},{90.7275,-50.214},{90.7275,-50},{100,-50}}));
      connect(add1.u2,firstorder1.y) annotation(Line(points={{35.2434,42.4434},{22.8245,
              42.4434},{22.8245,-0.285307},{-11.3364,-0.285307}}));
      connect(const.y,add1.u1) annotation(Line(points={{14.3412,57.3466},{
              34.2368,57.3466},{34.2368,56.8434},{35.2434,56.8434}}));
      connect(add1.y,realoutput1) annotation(Line(points = {{62.8434,49.6434},{92.7247,49.6434},{92.7247,50},{100,50}}));
      connect(u,schaltlogik1.u) annotation(Line(points = {{-100,0},{-83.0243,0},{-83.0243,4.8},{-73.9862,4.8}}));
      connect(schaltlogik1.y,firstorder1.u) annotation(Line(points={{-48.9243,
              0.376604},{-40.5136,0.376604},{-40.5136,-0.285307},{-38.9364,
              -0.285307}}));
      connect(firstorder1.y,y) annotation(Line(points = {{-11.3364,-0.285307},{89.0157,-0.285307},{89.0157,0},{100,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-78,-90},{-56,-45}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-78,-45},{36,-22}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{0,-22},{36,48}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-75,13},{0,27}},
                fillPattern=                                                                                                    FillPattern.Solid),Ellipse(extent=  {{-13,49},{46,90}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-44,-55},{84,-55}}, thickness=  3),Line(points=  {{61,-55},{85,48}}, thickness=  3),Line(points=  {{-88,41},{-60,-3}}, thickness=  3),Line(points=  {{-96,6},{-75,20}}, thickness=  3),Rectangle(extent=  {{-100,-100},{100,100}})}));
    end Fahrer;

    model Schlupf
      parameter Real vmin = 0.5 "Minimalgeschwindigkeit im Nenner";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-100,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-100,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant const(k = vmin) annotation(Placement(transformation(origin = {-44.5078,-64.194}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(transformation(origin = {-43.3666,53.6377}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Max max1 annotation(Placement(transformation(origin = {12.2682,-28.816}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Division division1 annotation(Placement(transformation(origin = {61.0556,-0.570613}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(origin = {-40.5136,0.285307}, extent = {{-12,-12},{12,12}})));
    equation
      connect(abs1.u,realinput1) annotation(Line(points = {{-54.9136,0.285307},{-69.6148,0.285307},{-69.6148,-39.9429},{-100,-39.9429},{-100,-40}}));
      connect(realinput1,add1.u2) annotation(Line(points = {{-100,-40},{-69.6148,-40},{-69.6148,46.2197},{-57.7666,46.2197},{-57.7666,46.4377}}));
      connect(u,add1.u1) annotation(Line(points = {{-100,40},{-77.3181,40},{-77.3181,60.7703},{-57.7666,60.7703},{-57.7666,60.8377}}));
      connect(max1.y,division1.u2) annotation(Line(points = {{25.4682,-28.816},{34.8074,-28.816},{34.8074,-7.41797},{46.6556,-7.41797},{46.6556,-7.77061}}));
      connect(add1.y,division1.u1) annotation(Line(points = {{-30.1666,53.6377},{35.378,53.6377},{35.378,6.84736},{46.6556,6.84736},{46.6556,6.62939}}));
      connect(const.y,max1.u2) annotation(Line(points = {{-31.3078,-64.194},{-18.2596,-64.194},{-18.2596,-36.234},{-2.13181,-36.234},{-2.13181,-36.016}}));
      connect(abs1.y,max1.u1) annotation(Line(points = {{-27.3136,0.285307},{-18.2596,0.285307},{-18.2596,-21.398},{-2.13181,-21.398},{-2.13181,-21.616}}));
      connect(division1.y,y) annotation(Line(points = {{74.2556,-0.570613},{91.5835,-0.570613},{91.5835,0},{100,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,-60},{-30,-20}}, textString=  "vr", fontName=  "Times New Roman"),Text(extent=  {{-90,20},{-40,60}}, textString=  "v", fontName=  "Times New Roman"),Text(extent=  {{40,-20},{90,20}}, textString=  "κ", fontName=  "Times New Roman")}));
    end Schlupf;

    model Pacejka
      parameter Real Fz = 3600 "Radlast";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-100,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-100,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Gain gain1(k = 17) annotation(Placement(transformation(origin = {-67.6177,40.2282}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Atan atan1 annotation(Placement(transformation(origin = {-31.9544,40.2282}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Gain gain2(k = 1.6) annotation(Placement(transformation(origin = {5.70613,40.2282}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Sin sin1 annotation(Placement(transformation(origin = {40.7989,40.2282}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Gain gain3(k = Fz) annotation(Placement(transformation(origin = {75.321,40.2282}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Product product1 annotation(Placement(transformation(origin = {62.1969,0.285307}, extent = {{-12,-12},{12,12}})));
    equation
      connect(realinput1,product1.u2) annotation(Line(points = {{-100,-40},{38.8017,-40},{38.8017,-6.56205},{47.7969,-6.56205},{47.7969,-6.91469}}));
      connect(gain3.y,product1.u1) annotation(Line(points = {{88.521,40.2282},{93.8659,40.2282},{93.8659,19.9715},{37.3752,19.9715},{37.3752,7.70328},{47.7969,7.70328},{47.7969,7.48531}}));
      connect(product1.y,y) annotation(Line(points = {{75.3969,0.285307},{92.7247,0.285307},{92.7247,0},{100,0}}));
      connect(sin1.y,gain3.u) annotation(Line(points = {{53.9989,40.2282},{59.0585,40.2282},{59.0585,40.2282},{60.921,40.2282}}));
      connect(gain2.y,sin1.u) annotation(Line(points = {{18.9061,40.2282},{24.8217,40.2282},{24.8217,40.2282},{26.3989,40.2282}}));
      connect(atan1.y,gain2.u) annotation(Line(points = {{-18.7544,40.2282},{-9.12981,40.2282},{-9.12981,40.2282},{-8.69387,40.2282}}));
      connect(gain1.y,atan1.u) annotation(Line(points = {{-54.4177,40.2282},{-47.6462,40.2282},{-47.6462,40.2282},{-46.3544,40.2282}}));
      connect(u,gain1.u) annotation(Line(points = {{-100,40},{-81.5977,40},{-81.5977,40.2282},{-82.0177,40.2282}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,-60},{-30,-20}}, textString=  "μ", fontName=  "Times New Roman"),Text(extent=  {{-90,20},{-40,60}}, textString=  "κ", fontName=  "Times New Roman"),Text(extent=  {{40,-20},{90,20}}, textString=  "Fs", fontName=  "Times New Roman")}));
    end Pacejka;

    model Relax
      parameter Real su = 0.01 "Verzögerungsweg";
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-100,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(transformation(origin = {-100,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.Integrator integrator1 annotation(Placement(transformation(origin = {66.4765,0.285307}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Product product1 annotation(Placement(transformation(origin = {30.5279,0.285307}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(transformation(origin = {-13.4094,8.5592}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(origin = {-54.4936,-40.2282}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Gain gain1(k = 1 / su) annotation(Placement(transformation(origin = {-16.8331,-39.943}, extent = {{-12,-12},{12,12}})));
    equation
      connect(add1.u1,integrator1.y) annotation(Line(points = {{-27.8094,15.7592},{-41.0842,15.7592},{-41.0842,35.378},{83.3096,35.378},{83.3096,0.285307},{79.6765,0.285307},{79.6765,0.285307}}));
      connect(u,add1.u2) annotation(Line(points = {{-100,40},{-71.8973,40},{-71.8973,1.14123},{-27.8094,1.14123},{-27.8094,1.3592}}));
      connect(realinput1,abs1.u) annotation(Line(points = {{-100,-40},{-70.4708,-40},{-70.4708,-40.2282},{-68.8936,-40.2282}}));
      connect(abs1.y,gain1.u) annotation(Line(points = {{-41.2936,-40.2282},{-32.2397,-40.2282},{-32.2397,-39.943},{-31.2331,-39.943}}));
      connect(gain1.y,product1.u2) annotation(Line(points = {{-3.63311,-39.943},{4.56491,-39.943},{4.56491,-6.84736},{16.1279,-6.84736},{16.1279,-6.91469}}));
      connect(add1.y,product1.u1) annotation(Line(points = {{-0.209415,8.5592},{15.4066,8.5592},{15.4066,7.48531},{16.1279,7.48531}}));
      connect(integrator1.y,y) annotation(Line(points = {{79.6765,0.285307},{91.2981,0.285307},{91.2981,0},{100,0}}));
      connect(product1.y,integrator1.u) annotation(Line(points = {{43.7279,0.285307},{51.9258,0.285307},{51.9258,0.285307},{52.0765,0.285307}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-100,-100},{100,100}}),Text(extent=  {{-90,-60},{-30,-20}}, textString=  "vr", fontName=  "Times New Roman"),Text(extent=  {{-90,20},{-40,60}}, textString=  "Fs", fontName=  "Times New Roman"),Text(extent=  {{40,-20},{90,20}}, textString=  "F", fontName=  "Times New Roman")}));
    end Relax;

    model Reifen
      parameter Inertia J = 0.9 "Drehträgheit";
      parameter Length r = 0.3 "Rollradius";
      parameter AngularVelocity om0 = 0 "Anfangsdrehzahl";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {0,-100}, extent = {{12,-12},{-12,12}}, rotation = 90), iconTransformation(origin = {0,-100}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = J, w(start = om0, fixed = true), phi(start = 0, fixed = true)) annotation(Placement(transformation(origin = {-75.0357,71.3267}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealrollingwheel1(radius = r) annotation(Placement(transformation(origin = {-45.3638,71.3267}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sources.Force force1(useSupport = true) annotation(Placement(transformation(origin = {69.6148,-39.6576}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {-29.1013,40.2282}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PJlib.Kap16.Relax relax1 annotation(Placement(transformation(origin = {32.8103,-39.3723}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.Pacejka pacejka1 annotation(Placement(transformation(origin = {0.570613,-34.8074}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sensors.SpeedSensor speedsensor2 annotation(Placement(transformation(origin = {-1.99715,41.9401}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      PJlib.Kap16.Schlupf schlupf1 annotation(Placement(transformation(origin = {-6.56205,3.70899}, extent = {{-12,12},{12,-12}}, rotation = -90)));
    equation
      connect(schlupf1.y,pacejka1.u) annotation(Line(points={{-6.56205,-8.29101},
              {-6.56205,-8.29101},{-6.56205,-16.2625},{-19.4009,-16.2625},{
              -19.4009,-30.2425},{-11.4294,-30.2425},{-11.4294,-30.0074}}));
      connect(speedsensor1.v,schlupf1.realinput1) annotation(Line(points={{
              -29.1013,27.0282},{-29.1013,27.0282},{-29.1013,22.2539},{-1.76205,
              22.2539},{-1.76205,15.709}}));
      connect(speedsensor2.flange,flange_b) annotation(Line(points = {{-1.99715,53.9401},{-2.28245,53.9401},{-2.28245,59.3438},{99.0014,59.3438},{99.0014,-40},{100,-40}}));
      connect(speedsensor1.v,relax1.realinput1) annotation(Line(points = {{-29.1013,27.0282},{-29.1013,27.0282},{-29.1013,-55.0642},{15.9772,-55.0642},{15.9772,-44.2225},{20.8103,-44.2225},{20.8103,-44.1723}}));
      connect(u,pacejka1.realinput1) annotation(Line(points={{0,-100},{0,-100},
              {0,-78.174},{-17.9743,-78.174},{-17.9743,-39.3723},{-11.4294,
              -39.3723},{-11.4294,-39.6074}}));
      connect(pacejka1.y,relax1.u) annotation(Line(points={{12.5706,-34.8074},{
              20.5421,-34.8074},{20.5421,-34.5723},{20.8103,-34.5723}}));
      connect(relax1.y,force1.f) annotation(Line(points = {{44.8103,-39.3723},{54.4936,-39.3723},{54.4936,-39.6576},{55.2148,-39.6576}}));
      connect(speedsensor1.flange,idealrollingwheel1.flangeT) annotation(Line(points = {{-29.1013,52.2282},{-29.1013,52.2282},{-29.1013,71.3267},{-33.3638,71.3267},{-33.3638,71.3267}}));
      connect(force1.flange,flange_b) annotation(Line(points = {{81.6148,-39.6576},{99.572,-39.6576},{99.572,-40},{100,-40}}));
      connect(idealrollingwheel1.flangeT,force1.support) annotation(Line(points = {{-33.3638,71.3267},{87.0185,71.3267},{87.0185,-59.0585},{69.9001,-59.0585},{69.9001,-51.6576},{69.6148,-51.6576}}));
      connect(inertia1.flange_b,idealrollingwheel1.flangeR) annotation(Line(points = {{-63.0357,71.3267},{-54.4936,71.3267},{-54.4936,71.3267},{-57.3638,71.3267}}));
      connect(flange_a,inertia1.flange_a) annotation(Line(points = {{-100,40},{-89.8716,40},{-89.8716,71.612},{-87.0357,71.612},{-87.0357,71.3267}}));
      connect(speedsensor2.v, schlupf1.u) annotation (Line(
          points={{-1.99715,28.7401},{-1.99715,26},{-11.362,26},{-11.362,15.709}},
          color={0,0,127},
          smooth=Smooth.None));

      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-68,-37},{100,-28}},
                fillPattern=                                                                                                    FillPattern.Solid),Ellipse(extent=  {{-58,-26},{72,93}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {96,96,96}),Ellipse(extent=  {{-33,-1},{49,68}},
                fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {255,255,255}),Ellipse(extent=  {{-4,20},{23,45}},
                lineThickness=                                                                                                    3),Line(points=  {{-5,32},{27,32}}, thickness=  3, color=  {160,160,160}),Line(points=  {{10,50},{10,16}}, thickness=  3, color=  {160,160,160}),Rectangle(extent=  {{-100,27},{15,38}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-100,-100},{100,100}})}));
    end Reifen;

    model Fahrer2
      parameter Real ts = 1 "Schaltzeit";
      parameter Real ns = 6500 "Schaltdrehzahl [Upm]";
      parameter Real Ng = 5 "Anzahl der G㭧e";
      parameter Real p = 1 "Dauergas-Wert";
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput realoutput1 annotation(Placement(transformation(origin={100,
                49.6434},                                                                                                    extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput realoutput2 annotation(Placement(transformation(origin = {100,-50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.FirstOrder firstorder1(T = ts / (4 * Modelica.Constants.pi),
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1)                                                                            annotation(Placement(transformation(origin = {-24.5364,-0.285307}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.Schaltlogik schaltlogik1(ts = ts, ns = ns, Ng = Ng) annotation(Placement(transformation(origin = {-61.6262,0.000000000000000999201}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(transformation(origin={23.6434,
                49.6434},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(origin={-24.8588,
                57.3466},                                                                                                    extent = {{-12,-12},{12,12}})));
      PJlib.Kap16.TriggeredDelay triggereddelay1 annotation(Placement(transformation(origin = {40.7989,-50.214}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(origin = {1.71188,-50.214}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(Placement(transformation(origin = {-40.5136,-43.0813}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Gain gain(k=p)
        annotation (Placement(transformation(extent={{54,39.6434},{74,59.6434}})));
    equation
      connect(schaltlogik1.realinput1,triggereddelay1.y) annotation(Line(points={{
              -73.9862,-4.8},{-80.1712,-4.8},{-80.1712,-75.6063},{65.0499,-75.6063},
              {65.0499,-50.214},{52.7989,-50.214}}));
      connect(add2.u2,triggereddelay1.y) annotation(Line(points={{-12.6881,
              -57.414},{-21.9686,-57.414},{-21.9686,-75.6063},{65.0499,-75.6063},
              {65.0499,-50.214},{52.7989,-50.214}}));
      connect(triggereddelay1.realinput1,schaltlogik1.y) annotation(Line(points={{40.7989,
              -38.214},{40.7989,-22.8245},{-44.5078,-22.8245},{-44.5078,
              0.285307},{-48.9243,0.285307},{-48.9243,0.376604}}));
      connect(constant1.y,add2.u1) annotation(Line(points={{-27.3136,-43.0813},
              {-14.8359,-43.0813},{-14.8359,-43.014},{-12.6881,-43.014}}));
      connect(add2.y,triggereddelay1.u) annotation(Line(points={{14.9119,
              -50.214},{14.9119,-50.214},{28.7989,-50.214}}));
      connect(triggereddelay1.y,realoutput2) annotation(Line(points = {{52.7989,-50.214},{90.7275,-50.214},{90.7275,-50},{100,-50}}));
      connect(add1.u2,firstorder1.y) annotation(Line(points={{9.2434,42.4434},{-3.1755,
              42.4434},{-3.1755,-0.285307},{-11.3364,-0.285307}}));
      connect(const.y,add1.u1) annotation(Line(points={{-11.6588,57.3466},{8.2368,57.3466},
              {8.2368,56.8434},{9.2434,56.8434}}));
      connect(u,schaltlogik1.u) annotation(Line(points = {{-100,0},{-83.0243,0},{-83.0243,4.8},{-73.9862,4.8}}));
      connect(schaltlogik1.y,firstorder1.u) annotation(Line(points={{-48.9243,
              0.376604},{-40.5136,0.376604},{-40.5136,-0.285307},{-38.9364,
              -0.285307}}));
      connect(firstorder1.y,y) annotation(Line(points = {{-11.3364,-0.285307},{89.0157,-0.285307},{89.0157,0},{100,0}}));
      connect(add1.y, gain.u) annotation (Line(
          points={{36.8434,49.6434},{52,49.6434}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.y, realoutput1) annotation (Line(
          points={{75,49.6434},{100,49.6434}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent=  {{-78,-90},{-56,-45}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-78,-45},{36,-22}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{0,-22},{36,48}},
                fillPattern=                                                                                                    FillPattern.Solid),Rectangle(extent=  {{-75,13},{0,27}},
                fillPattern=                                                                                                    FillPattern.Solid),Ellipse(extent=  {{-13,49},{46,90}},
                fillPattern=                                                                                                    FillPattern.Solid),Line(points=  {{-44,-55},{84,-55}}, thickness=  3),Line(points=  {{61,-55},{85,48}}, thickness=  3),Line(points=  {{-88,41},{-60,-3}}, thickness=  3),Line(points=  {{-96,6},{-75,20}}, thickness=  3),Rectangle(extent=  {{-100,-100},{100,100}})}));
    end Fahrer2;

    model Verbrauchsmesser
      parameter Real vEnd = 60 "Endgeschwindigkeit";
      Modelica.Blocks.Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-128,-60},{-88,-20}}),
            iconTransformation(extent={{-128,-60},{-88,-20}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
        annotation (Placement(transformation(extent={{-110,36},{-90,56}})));
      Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor
        annotation (Placement(transformation(extent={{-92,36},{-72,56}})));
      Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=
           vEnd)
        annotation (Placement(transformation(extent={{-58,36},{-38,56}})));
      Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(
          terminationText="v_end erreicht!", condition=pre1.y)
        annotation (Placement(transformation(extent={{16,44},{56,48}})));
      Modelica.Blocks.Logical.Pre pre1
        annotation (Placement(transformation(extent={{-14,36},{6,56}})));
      Modelica.Blocks.Continuous.Integrator integrator
        annotation (Placement(transformation(extent={{-68,-50},{-48,-30}})));
      Modelica.Blocks.Discrete.TriggeredSampler triggeredSampler
        annotation (Placement(transformation(extent={{-36,-30},{-16,-50}})));
    equation
      connect(flange_a, speedSensor.flange) annotation (Line(
          points={{-100,46},{-92,46}},
          color={0,127,0},
          smooth=Smooth.None));
      connect(speedSensor.v, greaterEqualThreshold.u) annotation (Line(
          points={{-71,46},{-60,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(greaterEqualThreshold.y, pre1.u) annotation (Line(
          points={{-37,46},{-16,46}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(u, integrator.u) annotation (Line(
          points={{-108,-40},{-70,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, triggeredSampler.u) annotation (Line(
          points={{-47,-40},{-38,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(greaterEqualThreshold.y, triggeredSampler.trigger) annotation (Line(
          points={{-37,46},{-26,46},{-26,-28.2}},
          color={255,0,255},
          smooth=Smooth.None));

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{40,100}}), graphics={Bitmap(
              extent={{-94,78},{56,-66}},
              imageSource=
                  "iVBORw0KGgoAAAANSUhEUgAAANUAAAFNCAIAAAAYYL1OAAAAA3NCSVQICAjb4U/gAAAACXBIWXMAAA0SAAANOgHo3ZneAAAgAElEQVR4nO29eXxU5dk+fp911oQkkEAIENnCDoqgVYuIRSqK1Vq1irauFXwr2trWbvZbl4+21FYF1/atitpWfUXtC1q04tJaRdn3RQw7hBBISDLL2c/vj+ud+3cIEJLJZCYJ5/qDzzA5c86ZmWvu57m36xZc1yUfPnIEMdc34OOkhs8/H7mEzz8fuYTPPx+5hM8/H7mEzz8fuYTPPx+5hM8/H7mEzz8fuYTPPx+5hM8/H7mEzz8fuYTPPx+5hM8/H7mEzz8fuYTPPx+5hM8/H7mEzz8fuYTPPx+5hM8/H7mEzz8fuYTPPx+5hM8/H7lEp+ef67qO4+Dx0Q/wV2+PMz/mB7ZtH/MA7zO2bTd50rKsZl7io4UQusZnZxgGHoiiKMsyaCeKoiAIeN5xHBBRURSQSZIkIjJNU1EUPo/ruvwSvMp1XRxp2zbOicNkWcaTuChexQf4aCG6Av90XQ8EAt5nmrDKC8uyRFEES5gujY2N4XBYEARmj/cwLynBY1mWvVQD3UFTH61Cp+cfyOG6bn19fUFBARHt27evd+/ebgpeVtm2LUmSZVmSJDmOY9u2qqpEtGPHjpqamq1bt1ZXV5eWlp5++ukDBw5k8tm2bdu2KIpHc9rLQhjI4/HexzHR6fnHYCt1zEXQcZx4PJ5MJnfs2LFhw4Y9e/bU1NRs2rSpsrLy4MGDjY2NIDEOVlW1b9++Y8eOHTly5EUXXTRo0CAwm82qruuCIMiy7K+2bUQX4Z+macFg0LIsy7KCweCePXvWrl1bW1u7a9eu7du379ixY9euXVVVVY2NjaqqYrMoyzJ8CEmSAoFA3759sY1LJBI1NTXxeJyIgsGgpmmBQGDIkCGTJk06//zzx4wZU1ZWhs0fEbmuq2maIAjBYDCHb7/zoivwb8+ePfPmzdu8ebNhGMuWLduxY4coipIkua7r9VKDwWAgEIhGoyUlJb169crPzy8sLOzdu3f37t0VRRFFEV6z67rxeHzv3r2VlZV79+7dunVrfX09HBfTNImof//+p59++qhRoyZMmHDOOedgBTdNU5IkQRC87ouPE6LT82/u3LkPPfRQdXW1oiiWZQmC4DhOfn5+QUFBUVFRr169iouLCwoKCgoKunfvnp+f7ziOIAiWZcGNAEexjLJTgi0j/iRJUm1t7Y4dO7744gtsE+PxOH9osiwPHz7829/+9jXXXNO/f/8m7rOPE6LD8Q8uAnm2cfwMbtW2bSx/a9asufnmm1esWEFEZWVl48aNGzhwYDgcLiws7NmzJxbQtoM/H9i2eDy+b9++6urq1atX79u37+DBg/jr+PHj33777eLiYty5bduKooCOyWQyFApl5Ga6Hjoc/yi1mTMMA0sbERmGYds2f4sNDQ333XffI488IopicXHxRRdddPbZZxORruvRaJSIamtrI5FIRm5GVVXbtk3ThL0URdE0TUR8XNetra3dunXriy++SERTpkxZuHChqqrspliWZZpmKBRqJh50kqMj8o/jeQh8OI7Du/v6+volS5bcfvvtu3fvNgzj/PPPv/TSS2VZhkXEe5EkSZIk7NUyArjGsMeyLOO/iUSiZ8+eDQ0Npmk2Njb+6le/EkXxwgsvfPHFF6PRqGVZWNwFQcDPKVM308XQ4fiH7wwUxLeI9dd13d27d997773PP/88EZWXl1911VXl5eXhcNiyLGQpBEEwTRM5CXZR2wg4FnCNwUIgEonU1tYqipKXl3fo0CHLsh566KFkMvnDH/7wd7/7nTck7hu/ZtDh+IdvLpFIBAIBSZJAPtM058+ff8sttyDwdskll0yaNAkHYJkGZR3HUVWVvYqM3A/8YrjGggfgIvYJkUikrq5u27ZtTz75pK7rv/nNb372s58hNBMKhfykXDPocPyjlMHA1+Y4zqZNm2bMmPHJJ58oijJ48ODp06eXlJSIoqjrejAYdBwnmUwSUSQSUVVV13VN04goUyYHvwHcjDcdB4ubSCRM08zLy7NtOxgMfvzxx3/96181TXvyySdvu+02+MK+/WsGHY5/bC2wef/lL3/5+OOPW5ZVUlJy9dVXjxgxgoiCweChQ4fC4bDruqIowi+JxWKWZQUCAXD36IqV9MBJPCzovL7btp2Xl4e0r2EYvPVcsmTJX//6V13X//a3v1199dXxeDwajXp9KR9edDj+UWrL9e67786aNauyslIUxQkTJkybNi0cDouiGAgE4vF4MBiUJAlrLpslDjsjXZuRm+G4tNcLQSw6GAzW19fDBiPz6ziOaZqLFy9esGCB67rvvffe+eef75cmNINc8o8D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",
              fileName="modelica://PJlib/../verbrauch.png"), Rectangle(
              extent={{-100,100},{40,-100}},
              lineColor={0,0,0},
              lineThickness=0.5)}), Diagram(coordinateSystem(extent={{-100,-100},
                {40,100}}, preserveAspectRatio=false), graphics));
    end Verbrauchsmesser;
  end Kap16;

  package Kap17

    model BodySphere
      import Modelica.Constants.pi;
      parameter Length r = 1 "radius of the sphere";
      parameter Density rho = 7700 "density of the sphere";
      parameter Real[3] direction = {-0.95,0,0}
        "vector from CM to frame, scaled for r = 1";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 annotation(Placement(transformation(origin={-100,
                -0.1339},                                                                                                    extent = {{-12,-12},{12,12}}), iconTransformation(origin={-100,0},   extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(                m = 4 / 3 * rho * pi * r ^ 3, I_11 = 8 / 15 * rho * pi * r ^ 5, I_22 = 8 / 15 * rho * pi * r ^ 5, I_33 = 8 / 15 * rho * pi * r ^ 5,
        animation=true,
        cylinderDiameter=0,
        sphereDiameter=2*r,
        sphereColor={0,128,255},
        r_CM=-r*direction)                                                                                                    annotation(Placement(transformation(origin={-71.8034,
                -0.1339},                                                                                                    extent = {{-12,-12},{12,12}})));
    equation
      connect(body1.frame_a, frame_a1) annotation (Line(
          points={{-83.8034,-0.1339},{-100,-0.1339}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(lineColor = {0,0,0}, fillColor = {0,0,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Sphere,
                lineThickness =                                                                                                   0.25, extent = {{-93.787,67.4556},{34.6154,-62.7219}})}));
    end BodySphere;

    model BodyCylinder
      parameter Modelica.SIunits.Position l = 1;
      parameter Modelica.SIunits.Position d = 0.1;
      parameter Modelica.SIunits.Density rho = 7700;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        annotation (Placement(transformation(extent={{-118,-16},{-86,16}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
        annotation (Placement(transformation(extent={{86,-16},{118,16}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(
        density=rho,
        color={0,128,255},
        r={l,0,0},
        diameter=d)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    equation
      connect(frame_a, bodyCylinder.frame_a) annotation (Line(
          points={{-102,0},{-10,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyCylinder.frame_b, frame_b) annotation (Line(
          points={{10,0},{102,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
              extent={{-100,40.5},{100,-40.5}},
              lineColor={0,0,0},
              lineThickness=1,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,128,255},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,255,255})}));
    end BodyCylinder;

    model RevoluteM

      parameter Position radius = 0.05 "Radius of animation cylinder";
      parameter Position length = 0.1 "Length of animation cylinder";
      parameter RotationalDampingConstant b = 1 "Rotational damping";
      parameter Angle theta0 = 0 "Initial angle of the revolute";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true, phi(start = theta0, fixed = true),
        cylinderLength=length,
        cylinderColor={0,128,255},
        cylinderDiameter=radius*2)                                                                                    annotation(Placement(transformation(origin = {1.13961,0.00000436625}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Components.Damper damper1(d = b) annotation(Placement(transformation(origin = {-1.1396,35.6125}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
        annotation (Placement(transformation(extent={{-70,90},{-50,110}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
        annotation (Placement(transformation(extent={{50,90},{70,110}})));
    equation
      connect(frame_a,revolute1.frame_a) annotation(Line(points={{-100,0},{
              -16.2393,0},{-16.2393,4.36625e-06},{-10.8604,4.36625e-06}}));
      connect(revolute1.frame_b,frame_b) annotation(Line(points={{13.1396,
              4.36625e-06},{99.4302,4.36625e-06},{99.4302,0},{100,0}}));
      connect(flange_a, revolute1.support) annotation (Line(
          points={{-60,100},{-24,100},{-24,12},{-6.06039,12}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(flange_b, revolute1.axis) annotation (Line(
          points={{60,100},{20,100},{20,12},{1.13961,12}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(damper1.flange_a, revolute1.support) annotation (Line(
          points={{-13.1396,35.6125},{-24,35.6125},{-24,12},{-6.06039,12}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(damper1.flange_b, revolute1.axis) annotation (Line(
          points={{10.8604,35.6125},{20,35.6125},{20,12},{1.13961,12}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics={  Line(points = {{3,77},{17,75},{30,70},{42,63},{50,56},{59,45},{66,34},{72,21}}),Polygon(
                fillPattern =                                                                                                   FillPattern.Solid, points = {{64,20},{79,22},{75,-2},{64,20}}),Polygon(fillColor = {40,118,192},
                fillPattern =                                                                                                   FillPattern.Solid, points = {{43,-20},{83,-52},{69,-73},{29,-41},{43,-20}}),Ellipse(fillColor = {40,118,192},
                fillPattern =                                                                                                   FillPattern.Solid, extent = {{-50,-50},{50,50}}, endAngle = 360),Ellipse(fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid, extent = {{-30,-30},{30,30}}, endAngle = 360),Rectangle(fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid, extent = {{-91,-14},{-20,12}}),Rectangle(lineColor = {255,255,255}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid, extent = {{-32,-14},{7,12}}),Rectangle(extent = {{-100,-100},{100,100}})}));
    end RevoluteM;

    model Link
      parameter Position l = 1 "Length of the link";
      parameter Position lc = 0.5 "Distance from link L to the center of mass";
      parameter Mass m = 1 "Mass of the link";
      parameter Inertia J = 1 "Inertia of the link";
      parameter Position d = 0.1 "Diameter of the link, only for visualisation";
      Modelica.Mechanics.MultiBody.Parts.Body body1(m = m, I_11 = 0, I_22 = J, I_33 = J, r_CM = {0,0,0},
        animation=false)                                                                                 annotation(Placement(transformation(origin = {-0.569801,-19.943}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation2(r = {-lc,0,0},
        width=d,
        color={0,128,255})                                                                 annotation(Placement(transformation(origin = {-41.8803,9.68657}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = {l - lc,0,0},
        width=d,
        color={0,128,255})                                                                    annotation(Placement(transformation(origin = {37.6068,9.68657}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
    equation
      connect(fixedtranslation1.frame_b,frame_b) annotation(Line(points={{49.6068,9.68657},
              {100.285,9.68657},{100.285,0},{100,0}}));
      connect(frame_a,fixedtranslation2.frame_b) annotation(Line(points={{-100,0},{-53.2764,
              0},{-53.2764,9.68657},{-29.8803,9.68657}}));
      connect(fixedtranslation1.frame_a,body1.frame_a) annotation(Line(points={{25.6068,
              9.68657},{-0.8547,9.68657},{-0.8547,-7.943},{-0.569801,-7.943}}));
      connect(body1.frame_a,fixedtranslation2.frame_a) annotation(Line(points={{-0.569801,
              -7.943},{-0.8547,-7.943},{-0.8547,9.68657},{-53.8803,9.68657}}));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-40},{100,40}},
                fillPattern =                                                                                                   FillPattern.Solid, fillColor = {68,162,255}),Ellipse(extent = {{-40,-10},{-20,10}},
                fillPattern =                                                                                                   FillPattern.Solid, fillColor = {33,74,203})}));
    end Link;

    model BodyBox
      parameter Position w = 1 "Width of the box";
      parameter Position h = 1 "Height of the box";
      parameter Position d = 1 "Depth of the box";
      parameter Mass m = 1 "Mass of the body";
      parameter Real[3] direction = {0,0,0} "vector from frame to attach point";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox(
        height=d,
        density=m/(h*w*d),
        r={h,0,0},
        length=w,
        width=h,
        color={0,128,255},
        r_shape=direction)
                 annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={50,-14})));
    equation
      connect(bodyBox.frame_a, frame_a) annotation (Line(
          points={{50,-4},{50,0},{100,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Rectangle(extent = {{-70,-70},{70,70}},
                fillPattern =                                                                                                   FillPattern.Solid, fillColor = {68,162,255})}));
    end BodyBox;

    model Roboter
      parameter Position r1 = 1 "Length of link 1";
      parameter Position rc1 = 1 "Position of CM in link 1";
      parameter Position r2 = 1 "Length of link 2";
      parameter Position rc2 = 1 "Position of CM in link 2";
      parameter Mass m1 = 1 "Mass of link 1";
      parameter Inertia J1 = 1 "Inertia of link 1";
      parameter Mass m2 = 1 "Mass of link 2";
      parameter Inertia J2 = 1 "Inertia of link 2";
      parameter Angle theta1 = 0 "Initial angle of joint 1";
      parameter Angle theta2 = 0 "Initial angle of joint 2";
      parameter RotationalDampingConstant b1 = 0 "Damping at joint 1";
      parameter RotationalDampingConstant b2 = 0 "Damping at joint 2";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u2 annotation(Placement(transformation(origin = {-104,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-104,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(transformation(origin = {-104,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-104,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(Placement(transformation(origin={-70.5919,
                -15.2873},                                                                                                    extent={{-7.4081,
                -8.7127},{7.4081,8.7127}})));
      PJlib.Kap17.Link link1(l = r1, lc = rc1, m = m1, J = J1) annotation(Placement(transformation(origin={-11.396,
                -15.2873},                                                                                                    extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Link link2(l = r2, lc = rc2, m = m2, J = J2) annotation(Placement(transformation(origin={51.8519,
                -15.2873},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sources.Torque2 torque21 annotation(Placement(transformation(origin={-45.584,
                18.4615},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sources.Torque2 torque22 annotation(Placement(transformation(origin={19.0883,
                18.4615},                                                                                                    extent = {{-12,-12},{12,12}})));
      RevoluteM revoluteM(theta0=theta1, b=b1) annotation (Placement(
            transformation(extent={{-54,-25.2873},{-34,-5.2873}})));
      RevoluteM revoluteM1(b=b2, theta0=theta2) annotation (Placement(
            transformation(extent={{12,-25.2873},{32,-5.2873}})));
    equation
      connect(link2.frame_b,frame_b) annotation(Line(points={{63.8519,-15.2873},
              {99.4253,-15.2873},{99.4253,0},{100,0}}));
      connect(fixed1.frame_b, revoluteM.frame_a) annotation (Line(
          points={{-63.1838,-15.2873},{-54,-15.2873}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(revoluteM.frame_b, link1.frame_a) annotation (Line(
          points={{-34,-15.2873},{-23.396,-15.2873}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(link1.frame_b, revoluteM1.frame_a) annotation (Line(
          points={{0.604,-15.2873},{12,-15.2873}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(revoluteM1.frame_b, link2.frame_a) annotation (Line(
          points={{32,-15.2873},{39.8519,-15.2873}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque22.flange_a, revoluteM1.flange_a) annotation (Line(
          points={{7.0883,18.4615},{7.0883,14.5185},{16,14.5185},{16,-5.2873}},
          color={0,0,0},
          smooth=Smooth.None));

      connect(torque22.flange_b, revoluteM1.flange_b) annotation (Line(
          points={{31.0883,18.4615},{31.0883,14.5185},{28,14.5185},{28,-5.2873}},
          color={0,0,0},
          smooth=Smooth.None));

      connect(u2, torque22.tau) annotation (Line(
          points={{-104,40},{19.0883,40},{19.0883,23.2615}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u1, torque21.tau) annotation (Line(
          points={{-104,-40},{-86,-40},{-86,32},{-45.584,32},{-45.584,23.2615}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(torque21.flange_a, revoluteM.flange_a) annotation (Line(
          points={{-57.584,18.4615},{-57.584,14},{-50,14},{-50,-5.2873}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torque21.flange_b, revoluteM.flange_b) annotation (Line(
          points={{-33.584,18.4615},{-33.584,14},{-38,14},{-38,-5.2873}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Rectangle(extent = {{-65,-85},{70,-80}},
                fillPattern =                                                                                                   FillPattern.Solid),Polygon(points = {{-50,-80},{-41,-83},{-13,15},{-21,20}},
                fillPattern =                                                                                                   FillPattern.Solid),Polygon(points = {{-20,23},{-12,17},{59,59},{54,67}},
                fillPattern =                                                                                                   FillPattern.Solid),Polygon(points = {{68,83},{50,72},{61,55},{79,65},{75,72},{66,65},{62,70},{72,76}},
                fillPattern =                                                                                                   FillPattern.Solid),Ellipse(extent = {{-53,-89},{-37,-73}},
                fillPattern =                                                                                                   FillPattern.Solid, fillColor = {33,33,255}),Ellipse(extent = {{-24,10},{-8,26}},
                fillPattern =                                                                                                   FillPattern.Solid, fillColor = {33,33,255})}));
    end Roboter;

    model Roboter2

      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin={100,
                -1.29432},                                                                                                    extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u2 annotation(Placement(transformation(origin = {-104,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-104,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(transformation(origin = {-104,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-104,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y2 annotation(Placement(transformation(origin = {40,-100}, extent = {{12,-12},{-12,12}}, rotation = 90), iconTransformation(origin = {40,-100}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealOutput y1 annotation(Placement(transformation(origin = {-40,-100}, extent = {{12,-12},{-12,12}}, rotation = 90), iconTransformation(origin = {-40,-100}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      parameter Position r1 = 1 "Length of link 1";
      parameter Position rc1 = 1 "Position of CM in link 1";
      parameter Position r2 = 1 "Length of link 2";
      parameter Position rc2 = 1 "Position of CM in link 2";
      parameter Mass m1 = 1 "Mass of link 1";
      parameter Inertia J1 = 1 "Inertia of link 1";
      parameter Mass m2 = 1 "Mass of link 2";
      parameter Inertia J2 = 1 "Inertia of link 2";
      parameter Angle theta1 = 0 "Initial angle of joint 1";
      parameter Angle theta2 = 0 "Initial angle of joint 2";
      parameter RotationalDampingConstant b1 = 0 "Damping at joint 1";
      parameter RotationalDampingConstant b2 = 0 "Damping at joint 2";
      PJlib.Kap17.Link link1(l = r1, lc = rc1, m = m1, J = J1) annotation(Placement(transformation(origin = {16.1902,-1.29432}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Link link2(l = r2, lc = rc2, m = m2, J = J2) annotation(Placement(transformation(origin={79.4381,
                -1.29432},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sources.Torque2 torque21 annotation(Placement(transformation(origin = {-18.6456,79.6445}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sources.Torque2 torque22 annotation(Placement(transformation(origin={50,78.22},       extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relanglesensor1 annotation(Placement(transformation(origin={-19.6625,
                54.046},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(Placement(transformation(origin={-54.3404,
                -1.29431},                                                                                                    extent={{-9.6596,
                -9.35281},{9.6595,9.35281}})));
      Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relanglesensor2 annotation(Placement(transformation(origin={50,
                51.1274},                                                                                                    extent = {{-12,-12},{12,12}})));
      RevoluteM revoluteM(b=b1, theta0=theta1)
        annotation (Placement(transformation(extent={{-28,-11.2943},{-8,8.70568}})));
      RevoluteM revoluteM1(b=b2, theta0=theta2)
        annotation (Placement(transformation(extent={{40,-11.2943},{60,8.70568}})));
    equation
      connect(relanglesensor1.phi_rel,y1) annotation(Line(points={{-19.6625,
              40.846},{-19.6625,27.8753},{-39.6506,27.8753},{-39.6506,-100},{
              -40,-100}}));
      connect(u1,torque21.tau) annotation(Line(points = {{-104,-40},{-83.9812,-40},{-83.9812,92.0501},{-18.6782,92.0501},{-18.6782,84.4445},{-18.6456,84.4445}}));
      connect(u2,torque22.tau) annotation(Line(points={{-104,40},{-87.4294,40},
              {-87.4294,96.4865},{50,96.4865},{50,83.02}}));
      connect(link2.frame_b,frame_b) annotation(Line(points={{91.4381,-1.29432},
              {100,-1.29432}}));
      connect(fixed1.frame_b, revoluteM.frame_a) annotation (Line(
          points={{-44.6809,-1.29431},{-28,-1.29431}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(revoluteM.frame_b, link1.frame_a) annotation (Line(
          points={{-8,-1.29431},{-2,-1.29431},{-2,-1.29432},{4.1902,-1.29432}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(torque21.flange_a, revoluteM.flange_a) annotation (Line(
          points={{-30.6456,79.6445},{-30.6456,70},{-36,70},{-36,16},{-24,16},{
              -24,8.70568}},
          color={0,0,0},
          smooth=Smooth.None));

      connect(torque21.flange_b, revoluteM.flange_b) annotation (Line(
          points={{-6.6456,79.6445},{-6.6456,70},{-2,70},{-2,16},{-12,16},{-12,
              8.70568}},
          color={0,0,0},
          smooth=Smooth.None));

      connect(relanglesensor1.flange_a, revoluteM.flange_a) annotation (Line(
          points={{-31.6625,54.046},{-36,54.046},{-36,16},{-24,16},{-24,8.70568}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relanglesensor1.flange_b, revoluteM.flange_b) annotation (Line(
          points={{-7.6625,54.046},{-2,54.046},{-2,16},{-12,16},{-12,8.70568}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(link1.frame_b, revoluteM1.frame_a) annotation (Line(
          points={{28.1902,-1.29432},{34.0951,-1.29432},{34.0951,-1.29431},{40,
              -1.29431}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(revoluteM1.frame_b, link2.frame_a) annotation (Line(
          points={{60,-1.29431},{64,-1.29431},{64,-1.29432},{67.4381,-1.29432}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(relanglesensor2.phi_rel, y2) annotation (Line(
          points={{50,37.9274},{50,28},{34,28},{34,-76},{40,-76},{40,-100}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(torque22.flange_a, revoluteM1.flange_a) annotation (Line(
          points={{38,78.22},{38,74},{30,74},{30,16},{44,16},{44,8.70568}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(torque22.flange_b, revoluteM1.flange_b) annotation (Line(
          points={{62,78.22},{62,72},{68,72},{68,16},{56,16},{56,8.70568}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relanglesensor2.flange_b, revoluteM1.flange_b) annotation (Line(
          points={{62,51.1274},{66,51.1274},{66,50},{68,50},{68,16},{56,16},{56,
              8.70568}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(relanglesensor2.flange_a, revoluteM1.flange_a) annotation (Line(
          points={{38,51.1274},{34,51.1274},{34,52},{30,52},{30,16},{44,16},{44,
              8.70568}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation(Icon(graphics={  Rectangle(lineColor = {0,0,0}, fillColor = {0,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.None,
                lineThickness =                                                                                                   0.25, extent = {{-100,-100},{100,100}}),Rectangle(lineColor = {0,0,0}, fillColor = {0,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-65,-85},{70,-80}}),Polygon(points = {{-50,-80},{-41,-83},{-13,15},{-21,20}}, lineColor = {0,0,0}, fillColor = {0,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25),Polygon(points = {{-20,23},{-12,17},{59,59},{54,67}}, lineColor = {0,0,0}, fillColor = {0,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25),Polygon(points = {{68,83},{50,72},{61,55},{79,65},{75,72},{66,65},{62,70},{72,76}}, lineColor = {0,0,0}, fillColor = {0,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25),Ellipse(lineColor = {0,0,0}, fillColor = {33,33,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-53,-89},{-37,-73}}),Ellipse(lineColor = {0,0,0}, fillColor = {33,33,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-24,10},{-8,26}})}));
    end Roboter2;

    model SetAngles
      parameter Real x = 1 "x-Koordinate der Zielposition";
      parameter Real y = 1 "y-Koordinate der Zielposition";
      parameter Real r1 = 1 "Länge von Link 1";
      parameter Real r2 = 1 "Länge von Link 2";
      Modelica.Blocks.Interfaces.RealOutput theta2 annotation(Placement(transformation(origin = {108.013,-44.0167}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {108.013,-44.0167}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput theta1 annotation(Placement(transformation(origin = {108.013,35.9833}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {108.013,35.9833}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(origin = {77.9413,36.1542}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add3 add31(k3 = -1, k2 = 1, k1 = 1) annotation(Placement(transformation(origin = {-40.0074,25.8978}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Gain gain1(k = 2) annotation(Placement(transformation(origin = {-36.0188,56.9519}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Product product1 annotation(Placement(transformation(origin = {-74.5102,56.6745}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.RectangularToPolar rectangulartopolar1 annotation(Placement(transformation(origin = {-152.756,72.4619}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Product product2 annotation(Placement(transformation(origin = {-108.894,2.73138}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Product product3 annotation(Placement(transformation(origin = {-109.456,-30.4468}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Product product4 annotation(Placement(transformation(origin = {-111.705,-64.7497}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant2(k = r2) annotation(Placement(transformation(origin = {-195.494,-64.1874}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(origin = {67.682,-106.363}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Acos acos2 annotation(Placement(transformation(origin = {34.5037,-105.801}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Division division2 annotation(Placement(transformation(origin = {-0.923849,-105.238}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Gain gain2(k = 2) annotation(Placement(transformation(origin = {-43.6619,-127.732}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Product product5 annotation(Placement(transformation(origin = {-79.0895,-127.732}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Add3 add32(k1 = -1) annotation(Placement(transformation(origin = {-44.2242,-97.3656}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant3(k = r1) annotation(Placement(transformation(origin = {-194.671,-29.8845}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant const(k = x) annotation(Placement(transformation(origin = {-194.851,94.4535}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Acos acos1 annotation(Placement(transformation(origin = {38.6879,29.4114}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Division division1 annotation(Placement(transformation(origin = {3.86663,29.4114}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant4(k = Modelica.Constants.pi) annotation(Placement(transformation(origin = {67.682,-146.852}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Blocks.Sources.Constant constant1(k = y) annotation(Placement(transformation(origin = {-194.972,58.3474}, extent = {{-12,-12},{12,12}})));
    equation
      connect(constant1.y,rectangulartopolar1.u_im) annotation(Line(points = {{-181.772,58.3474},{-174.688,58.3474},{-174.688,65.7138},{-162.316,65.7138},{-162.316,65.2619},{-167.156,65.2619}}));
      connect(division1.u1,add31.y) annotation(Line(points = {{-10.5334,36.6114},{-23.2953,36.6114},{-23.2953,25.8274},{-26.8403,25.8274},{-26.8403,25.8978},{-26.8074,25.8978}}));
      connect(gain1.y,division1.u2) annotation(Line(points = {{-22.8188,56.9519},{-19.7504,56.9519},{-19.7504,22.2825},{-10.5334,22.2825},{-10.5334,22.2114}}));
      connect(division1.y,acos1.u) annotation(Line(points = {{17.0666,29.4114},{19.2519,29.4114},{19.2519,29.4114},{24.2879,29.4114}}));
      connect(acos1.y,add1.u2) annotation(Line(points = {{51.8879,29.4114},{62.5567,29.4114},{62.5567,28.9542},{63.5413,28.9542}}));
      connect(rectangulartopolar1.y_abs,product1.u1) annotation(Line(points = {{-139.556,79.6619},{-104.415,79.6619},{-104.415,64.5891},{-88.9102,64.5891},{-88.9102,63.8745}}));
      connect(const.y,rectangulartopolar1.u_re) annotation(Line(points = {{-181.651,94.4535},{-176.375,94.4535},{-176.375,80.3347},{-162.316,80.3347},{-162.316,79.6619},{-167.156,79.6619}}));
      connect(constant3.y,product3.u2) annotation(Line(points = {{-181.471,-29.8845},{-134.199,-29.8845},{-134.199,-37.7573},{-123.856,-37.7573},{-123.856,-37.6468}}));
      connect(product3.u1,constant3.y) annotation(Line(points = {{-123.856,-23.2468},{-134.199,-23.2468},{-134.199,-29.8845},{-181.471,-29.8845},{-181.471,-29.8845}}));
      connect(product1.u2,constant3.y) annotation(Line(points = {{-88.9102,49.4745},{-156.13,49.4745},{-156.13,-29.8845},{-181.471,-29.8845},{-181.471,-29.8845}}));
      connect(product5.u1,constant3.y) annotation(Line(points = {{-93.4895,-120.532},{-156.13,-120.532},{-156.13,-29.8845},{-181.471,-29.8845},{-181.471,-29.8845}}));
      connect(add32.u3,product4.y) annotation(Line(points = {{-58.6242,-106.966},{-89.774,-106.966},{-89.774,-64.7497},{-98.5053,-64.7497},{-98.5053,-64.7497}}));
      connect(add32.u2,product3.y) annotation(Line(points = {{-58.6242,-97.3656},{-81.9012,-97.3656},{-81.9012,-30.4468},{-96.256,-30.4468},{-96.256,-30.4468}}));
      connect(add32.u1,product2.y) annotation(Line(points = {{-58.6242,-87.7656},{-89.774,-87.7656},{-89.774,2.73138},{-95.6936,2.73138},{-95.6936,2.73138}}));
      connect(add32.y,division2.u1) annotation(Line(points = {{-31.0242,-97.3656},{-16.1071,-97.3656},{-16.1071,-98.0384},{-15.3238,-98.0384}}));
      connect(product5.u2,constant2.y) annotation(Line(points = {{-93.4895,-134.932},{-173.001,-134.932},{-173.001,-64.1874},{-182.294,-64.1874},{-182.294,-64.1874}}));
      connect(product5.y,gain2.u) annotation(Line(points = {{-65.8895,-127.732},{-58.8451,-127.732},{-58.8451,-127.732},{-58.0619,-127.732}}));
      connect(gain2.y,division2.u2) annotation(Line(points = {{-30.4619,-127.732},{-25.6669,-127.732},{-25.6669,-112.549},{-15.3238,-112.549},{-15.3238,-112.438}}));
      connect(division2.y,acos2.u) annotation(Line(points = {{12.2762,-105.238},{19.3205,-105.238},{19.3205,-105.801},{20.1037,-105.801}}));
      connect(acos2.y,feedback1.u1) annotation(Line(points = {{47.7037,-105.801},{57.5598,-105.801},{57.5598,-106.363},{58.082,-106.363}}));
      connect(constant4.y,feedback1.u2) annotation(Line(points = {{67.682,-133.652},{68.2443,-133.652},{68.2443,-115.963},{67.682,-115.963}}));
      connect(feedback1.y,theta2) annotation(Line(points = {{78.482,-106.363},{87.3639,-106.363},{87.3639,-44.0167},{108.013,-44.0167}}));
      connect(product4.u1,constant2.y) annotation(Line(points = {{-126.105,-57.5497},{-137.573,-57.5497},{-137.573,-64.1874},{-182.294,-64.1874},{-182.294,-64.1874}}));
      connect(constant2.y,product4.u2) annotation(Line(points = {{-182.294,-64.1874},{-137.573,-64.1874},{-137.573,-71.4979},{-128.013,-71.4979},{-128.013,-71.9497},{-126.105,-71.9497}}));
      connect(product4.y,add31.u3) annotation(Line(points = {{-98.5053,-64.7497},{-70.092,-64.7497},{-70.092,16.2276},{-54.3464,16.2276},{-54.3464,16.2978},{-54.4074,16.2978}}));
      connect(product3.y,add31.u2) annotation(Line(points = {{-96.256,-30.4468},{-81.9012,-30.4468},{-81.9012,25.7874},{-54.9087,25.7874},{-54.9087,25.8978},{-54.4074,25.8978}}));
      connect(product2.y,add31.u1) annotation(Line(points = {{-95.6936,2.73138},{-89.774,2.73138},{-89.774,35.9096},{-54.4074,35.9096},{-54.4074,35.4978}}));
      connect(product2.u2,rectangulartopolar1.y_abs) annotation(Line(points = {{-123.294,-4.46862},{-130.825,-4.46862},{-130.825,79.7723},{-139.822,79.7723},{-139.822,79.6619},{-139.556,79.6619}}));
      connect(product2.u1,rectangulartopolar1.y_abs) annotation(Line(points = {{-123.294,9.93138},{-130.825,9.93138},{-130.825,79.7723},{-139.556,79.7723},{-139.556,79.6619}}));
      connect(rectangulartopolar1.y_arg,add1.u1) annotation(Line(points = {{-139.556,65.2619},{-118.453,65.2619},{-118.453,106.765},{53.061,106.765},{53.061,44.3447},{63.5413,44.3447},{63.5413,43.3542}}));
      connect(product1.y,gain1.u) annotation(Line(points = {{-61.3102,56.6745},{-51.1185,56.6745},{-51.1185,56.9519},{-50.4188,56.9519}}));
      connect(add1.y,theta1) annotation(Line(points = {{91.1413,36.1542},{99.3088,36.1542},{99.3088,35.9833},{108.013,35.9833}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Text(extent = {{-90,-40},{90,40}}, textString = "Sollwerte", fontName = "Times New Roman")}));
    end SetAngles;

    model Strasse1
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-104,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-104,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {0,-100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,-100}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,-12},{12,12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true, n = {0,0,1}) annotation(Placement(transformation(origin = {3.9886,9.11681}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {-50.1425,9.11681}, extent = {{-12,-12},{12,12}})));
    equation
      connect(position1.support,prismatic1.support) annotation(Line(points = {{-50.1425,-2.88319},{-49.8575,-2.88319},{-49.8575,-13.9601},{-15.0997,-13.9601},{-15.0997,4.2735},{-3.2114,4.2735},{-3.2114,4.31681}}));
      connect(position1.flange,prismatic1.axis) annotation(Line(points = {{-38.1425,9.11681},{-32.7635,9.11681},{-32.7635,19.0883},{-3.2114,19.0883},{-3.2114,18.7168}}));
      connect(prismatic1.frame_a,frame_a) annotation(Line(points = {{3.9886,-2.88319},{3.9886,-2.88319},{3.9886,-59.2593},{0.569801,-59.2593},{0.569801,-99.1453},{-0.000000000000000222045,-99.1453}}));
      connect(frame_b,prismatic1.frame_b) annotation(Line(points = {{-7.40741,99.4302},{-3.9886,99.4302},{-3.9886,56.9801},{3.9886,56.9801},{3.9886,21.1168},{3.9886,21.1168}}));
      connect(u,position1.s_ref) annotation(Line(points = {{-104.274,8.83191},{-65.5271,8.83191},{-65.5271,9.11681},{-64.5425,9.11681}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Line(points = {{0,20},{0,80}}),Line(points = {{-10,30},{0,20},{10,30}}),Line(points = {{-10,70},{0,80},{10,70}}),Line(points = {{-100,-100},{-90,-80},{-70,-50},{-30,-15},{0,-10},{30,-15},{70,-50},{90,-80},{100,-100}})}));
    end Strasse1;

    model Feder1
      parameter TranslationalSpringConstant c = 1;
      parameter TranslationalDampingConstant b = 1;
      parameter Position l0 = 1;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springdamper1(c = c, s_unstretched = l0, d = b) annotation(Placement(transformation(origin = {-0.2849,21.0826}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0,0,1}) annotation(Placement(transformation(origin = {-0.569801,-19.3732}, extent = {{-12,-12},{12,12}})));
    equation
      connect(prismatic1.frame_a,frame_a) annotation(Line(points = {{-12.5698,-19.3732},{-64.3875,-19.3732},{-64.3875,0.00000283385},{-100,0.00000283385},{-100,0}}));
      connect(prismatic1.frame_b,frame_b) annotation(Line(points = {{11.4302,-19.3732},{62.6781,-19.3732},{62.6781,1.7094},{100,1.7094},{100,0}}));
      connect(frame_a,springdamper1.frame_a) annotation(Line(points = {{-100,0},{-64.3875,0},{-64.3875,20.7977},{-12.2849,20.7977},{-12.2849,21.0826}}));
      connect(springdamper1.frame_b,frame_b) annotation(Line(points = {{11.7151,21.0826},{62.6781,21.0826},{62.6781,1.7094},{100,1.7094},{100,0}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points = {{-80,32},{-58,32},{-48,2},{-28,62},{-8,2},{12,62},{32,2},{52,62},{62,32},{80,32}}),Line(points = {{70,-28},{-50,-28},{-50,-72},{70,-72}}),Line(points = {{-30,-50},{80,-50}}, color = {0,0,0}),Line(points = {{-80,-50},{-50,-50}}, color = {0,0,0}),Line(points = {{-80,32},{-80,-50}}, color = {0,0,0}),Line(points = {{80,32},{80,-50}}, color = {0,0,0}),Line(points = {{-96,0},{-80,0}}, color = {0,0,0}),Line(points = {{96,0},{80,0}}, color = {0,0,0})}));
    end Feder1;

    model Karosserie1
      parameter Mass m = 1 "Fahrzeugmasse (ohne Räder)";
      parameter Inertia Jx = 1 "Wankträgheitsmoment";
      parameter Inertia Jy = 1 "Nickträgheitsmoment";
      parameter Position sl = 1 "Abstand CM - linke Seite";
      parameter Position sr = 1 "Abstand CM - rechte Seite";
      parameter Position lv = 1 "Abstand CM - Vorderachse";
      parameter Position lh = 1 "Abstand CM - Hinterachse";
      parameter Position z0 = 0.6 "Angangshöhe CM";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a fvl annotation(Placement(transformation(origin={-100,
                65.2422},                                                                                                    extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,65}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a fvr annotation(Placement(transformation(origin = {100,65}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,65}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b fhl annotation(Placement(transformation(origin={-100,
                -65.5271},                                                                                                    extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,-65}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b fhr annotation(Placement(transformation(origin = {100,-65}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-65}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(m = m, I_11 = Jx, I_22 = Jy, I_33 = 1, r_CM = {0,0,0}, r_0(start = {0,0,z0}, each fixed = true)) annotation(Placement(transformation(origin = {19.0883,9.97151}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = {lv,-sr,0}) annotation(Placement(transformation(origin = {65.2422,65.2422}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation2(r = {-lh,-sr,0}) annotation(Placement(transformation(origin = {72.6496,-65.5271}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation3(r={-lv,-
            sl,0})                                                                         annotation(Placement(transformation(origin = {-58.9744,65.2422}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation4(r={lh,-sl,
            0})                                                                             annotation(Placement(transformation(origin = {-65.812,-65.5271}, extent = {{12,12},{-12,-12}}, rotation = -180)));
    equation
      connect(fixedtranslation1.frame_b,fvr) annotation(Line(points = {{77.2422,65.2422},{99.4302,65.2422},{99.4302,65},{100,65}}));
      connect(fixedtranslation1.frame_a,body1.frame_a) annotation(Line(points={{53.2422,
              65.2422},{-19.0883,65.2422},{-19.0883,9.97151},{7.0883,9.97151}}));
      connect(fixedtranslation2.frame_b,fhr) annotation(Line(points = {{84.6496,-65.5271},{99.7151,-65.5271},{99.7151,-65},{100,-65}}));
      connect(fixedtranslation2.frame_a,body1.frame_a) annotation(Line(points={{60.6496,
              -65.5271},{-19.0883,-65.5271},{-19.0883,9.97151},{7.0883,9.97151}}));
      connect(fixedtranslation1.frame_a, fixedtranslation3.frame_b) annotation (
         Line(
          points={{53.2422,65.2422},{-46.9744,65.2422}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedtranslation3.frame_a, fvl) annotation (Line(
          points={{-70.9744,65.2422},{-100,65.2422}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedtranslation2.frame_a, fixedtranslation4.frame_b) annotation (
         Line(
          points={{60.6496,-65.5271},{-53.812,-65.5271}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedtranslation4.frame_a, fhl) annotation (Line(
          points={{-77.812,-65.5271},{-100,-65.5271}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Text(extent = {{-90,50},{-70,80}}, textString = "vl", fontName = "Times New Roman"),Text(extent = {{70,50},{90,80}}, textString = "vr", fontName = "Times New Roman"),Text(extent = {{-90,-80},{-70,-50}}, textString = "hl", fontName = "Times New Roman"),Text(extent = {{70,-80},{90,-50}}, textString = "hr", fontName = "Times New Roman")}));
    end Karosserie1;

    model Karosserie2
      parameter Mass m = 1 "Fahrzeugmasse (ohne Räder)";
      parameter Inertia Jx = 1 "Wankträgheitsmoment";
      parameter Inertia Jy = 1 "Nickträgheitsmoment";
      parameter Position sl = 1 "Abstand CM - linke Seite";
      parameter Position sr = 1 "Abstand CM - rechte Seite";
      parameter Position lv = 1 "Abstand CM - Vorderachse";
      parameter Position lh = 1 "Abstand CM - Hinterachse";
      parameter Position z0 = 0.6 "Angangshöhe CM";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a fvl annotation(Placement(transformation(origin={-100,
                65.2422},                                                                                                    extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,65}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a fvr annotation(Placement(transformation(origin = {100,65}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,65}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b fhl annotation(Placement(transformation(origin={-100,
                -65.5271},                                                                                                    extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,-65}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b fhr annotation(Placement(transformation(origin = {100,-65}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,-65}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(m = m, I_11 = Jx, I_22 = Jy, I_33 = 1, r_CM = {0,0,0}, r_0(start = {0,0,z0}, each fixed = true)) annotation(Placement(transformation(origin = {19.0883,9.97151}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = {lv,-sr,0}) annotation(Placement(transformation(origin = {65.2422,65.2422}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation2(r = {-lh,-sr,0}) annotation(Placement(transformation(origin = {72.6496,-65.5271}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0,0,1}, s(start = -z0, fixed = true),
        animation=false)                                                                                  annotation(Placement(transformation(origin = {51.8518,40.1709}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Joints.Universal universal1(animation=false)
                                                               annotation(Placement(transformation(origin = {16.8091,40.1709}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation3(r={-lv,-
            sl,0})                                                                         annotation(Placement(transformation(origin = {-58.9744,65.2422}, extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation4(r={lh,-sl,
            0})                                                                             annotation(Placement(transformation(origin={-61.812,
                -65.5271},                                                                                                    extent = {{12,12},{-12,-12}}, rotation = -180)));
      Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(Placement(transformation(origin={81.7379,
                40.1709},                                                                                                    extent={{-8.2621,
                8.0855},{8.2621,-8.0855}},                                                                                                    rotation = -180)));
    equation
      connect(universal1.frame_a,body1.frame_a) annotation(Line(points={{4.8091,
              40.1709},{0.2849,40.1709},{0.2849,9.97151},{7.0883,9.97151}}));
      connect(universal1.frame_b,prismatic1.frame_a) annotation(Line(points={{28.8091,
              40.1709},{40.1709,40.1709},{39.8518,40.1709}}));
      connect(prismatic1.frame_b,fixed1.frame_b) annotation(Line(points={{63.8518,
              40.1709},{68,40.1709},{73.4758,40.1709}}));
      connect(fixedtranslation1.frame_b,fvr) annotation(Line(points = {{77.2422,65.2422},{99.4302,65.2422},{99.4302,65},{100,65}}));
      connect(fixedtranslation1.frame_a,body1.frame_a) annotation(Line(points={{53.2422,
              65.2422},{-19.0883,65.2422},{-19.0883,9.97151},{7.0883,9.97151}}));
      connect(fixedtranslation2.frame_b,fhr) annotation(Line(points = {{84.6496,-65.5271},{99.7151,-65.5271},{99.7151,-65},{100,-65}}));
      connect(fixedtranslation2.frame_a,body1.frame_a) annotation(Line(points={{60.6496,
              -65.5271},{-19.0883,-65.5271},{-19.0883,9.97151},{7.0883,9.97151}}));
      connect(fixedtranslation4.frame_a, fhl) annotation (Line(
          points={{-73.812,-65.5271},{-100,-65.5271}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedtranslation2.frame_a, fixedtranslation4.frame_b) annotation (
         Line(
          points={{60.6496,-65.5271},{-49.812,-65.5271}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedtranslation1.frame_a, fixedtranslation3.frame_b) annotation (
         Line(
          points={{53.2422,65.2422},{-46.9744,65.2422}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedtranslation3.frame_a, fvl) annotation (Line(
          points={{-70.9744,65.2422},{-100,65.2422}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Text(extent = {{-90,50},{-70,80}}, textString = "vl", fontName = "Times New Roman"),Text(extent = {{70,50},{90,80}}, textString = "vr", fontName = "Times New Roman"),Text(extent = {{-90,-80},{-70,-50}}, textString = "hl", fontName = "Times New Roman"),Text(extent = {{70,-80},{90,-50}}, textString = "hr", fontName = "Times New Roman")}));
    end Karosserie2;

    model Strasse2
      Modelica.Blocks.Interfaces.RealInput x annotation(Placement(transformation(origin = {-103,-50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,-50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput y annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput z annotation(Placement(transformation(origin = {-103,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,50}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {-43.8747,49.8576}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sources.Position position2(exact = true) annotation(Placement(transformation(origin = {-48.1481,-0.284912}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sources.Position position3(exact = true) annotation(Placement(transformation(origin = {-44.7293,-50.1424}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true, n = {0,0,1},
        animation=false)                                                                          annotation(Placement(transformation(origin = {0.284896,40.171}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(useAxisFlange = true, n = {0,1,0},
        animation=false)                                                                          annotation(Placement(transformation(origin = {-0.000000000000000666134,-9.68661}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic3(useAxisFlange = true, n = {1,0,0},
        animation=false)                                                                          annotation(Placement(transformation(origin={0.5698,
                -59.5442},                                                                                                    extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(Placement(transformation(origin = {0.862069,-88.7931}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(
        shapeType="cylinder",
        lengthDirection={0,0,1},
        width=0.2,
        length=0.02,
        color={255,128,0},
        height=0.2)
        annotation (Placement(transformation(extent={{42,66},{62,86}})));
    equation
      connect(fixed1.frame_b,prismatic3.frame_a) annotation(Line(points={{
              0.862069,-76.7931},{0.287356,-76.7931},{0.287356,-71.5442},{
              0.5698,-71.5442}}));
      connect(position3.support,prismatic3.support) annotation(Line(points={{
              -44.7293,-62.1424},{-44.7293,-62.1424},{-44.7293,-71.51},{
              -11.6809,-71.51},{-11.6809,-64.6724},{-6.6302,-64.6724},{-6.6302,
              -64.3442}}));
      connect(position2.support,prismatic2.support) annotation(Line(points={{
              -48.1481,-12.2849},{-47.8632,-12.2849},{-47.8632,-19.6581},{
              -12.5356,-19.6581},{-12.5356,-14.5299},{-7.2,-14.5299},{-7.2,
              -14.4866}}));
      connect(position3.flange,prismatic3.axis) annotation(Line(points={{
              -32.7293,-50.1424},{-7.12251,-50.1424},{-7.12251,-49.9442},{
              -6.6302,-49.9442}}));
      connect(prismatic2.frame_a,prismatic3.frame_b) annotation(Line(points={{
              -6.66134e-16,-21.6866},{-4.44089e-16,-21.6866},{-4.44089e-16,
              -47.5442},{0.5698,-47.5442}}));
      connect(position2.flange,prismatic2.axis) annotation(Line(points={{
              -36.1481,-0.284912},{-6.55271,-0.284912},{-6.55271,-0.08661},{
              -7.2,-0.08661}}));
      connect(prismatic1.frame_a,prismatic2.frame_b) annotation(Line(points={{
              0.284896,28.171},{0.2849,28.171},{0.2849,2.31339},{-6.66134e-16,
              2.31339}}));
      connect(x,position3.s_ref) annotation(Line(points = {{-103,-50},{-58.4046,-50},{-58.4046,-50.1424},{-59.1293,-50.1424}}));
      connect(y,position2.s_ref) annotation(Line(points = {{-103,0},{-63.5328,0},{-63.5328,-0.284912},{-62.5481,-0.284912}}));
      connect(position1.support,prismatic1.support) annotation(Line(points={{
              -43.8747,37.8576},{-43.3048,37.8576},{-43.3048,30.1994},{-16.2393,
              30.1994},{-16.2393,35.3277},{-6.9151,35.3277},{-6.9151,35.371}}));
      connect(position1.flange,prismatic1.axis) annotation(Line(points={{
              -31.8747,49.8576},{-7.97721,49.8576},{-7.97721,49.771},{-6.9151,
              49.771}}));
      connect(prismatic1.frame_b,frame_b) annotation(Line(points={{0.284896,
              52.171},{0,52.171},{0,100}}));
      connect(z,position1.s_ref) annotation(Line(points = {{-103,50},{-65.5271,50},{-65.5271,49.8576},{-58.2747,49.8576}}));
      connect(fixedShape.frame_a, frame_b) annotation (Line(
          points={{42,76},{0,76},{0,100}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation(Icon(graphics={  Rectangle(lineColor = {0,0,0}, fillColor = {0,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.None,
                lineThickness =                                                                                                   0.25, extent = {{-100,-100},{100,100}}),Line(points = {{0,20},{0,80}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25),Line(points = {{-10,30},{0,20},{10,30}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25),Line(points = {{-10,70},{0,80},{10,70}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25),Line(points = {{-100,-100},{-90,-80},{-70,-50},{-30,-15},{0,-10},{30,-15},{70,-50},{90,-80},{100,-100}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25)}));
    end Strasse2;

    model Strasse
      parameter Position x0 = 1 "Anfangsposition x";
      parameter Position y0 = 1 "Anfangsposition y";
      Modelica.Blocks.Interfaces.RealInput z annotation(Placement(transformation(origin = {-103,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,50}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {-43.8747,49.8576}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true, n = {0,0,1},
        animation=false)                                                                          annotation(Placement(transformation(origin = {0.284896,40.171}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(r = {x0,y0,0}, animation=
            false)                                                   annotation(Placement(transformation(origin = {0.862069,2.29885}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(
        shapeType="cylinder",
        lengthDirection={0,0,1},
        length=0.02,
        width=0.2,
        height=0.2,
        color={0,128,255})
        annotation (Placement(transformation(extent={{30,66},{50,86}})));
    equation
      connect(prismatic1.frame_a,fixed1.frame_b) annotation(Line(points={{
              0.284896,28.171},{1.14943,28.171},{1.14943,14.2988},{0.862069,
              14.2988}}));
      connect(position1.support,prismatic1.support) annotation(Line(points={{
              -43.8747,37.8576},{-43.3048,37.8576},{-43.3048,30.1994},{-16.2393,
              30.1994},{-16.2393,35.3277},{-6.9151,35.3277},{-6.9151,35.371}}));
      connect(position1.flange,prismatic1.axis) annotation(Line(points={{
              -31.8747,49.8576},{-7.97721,49.8576},{-7.97721,49.771},{-6.9151,
              49.771}}));
      connect(prismatic1.frame_b,frame_b) annotation(Line(points={{0.284896,
              52.171},{0,52.171},{0,100}}));
      connect(z,position1.s_ref) annotation(Line(points = {{-103,50},{-65.5271,50},{-65.5271,49.8576},{-58.2747,49.8576}}));
      connect(fixedShape.frame_a, frame_b) annotation (Line(
          points={{30,76},{0,76},{0,100}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation(Icon(graphics={  Rectangle(lineColor = {0,0,0}, fillColor = {0,0,0}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.None,
                lineThickness =                                                                                                   0.25, extent = {{-100,-100},{100,100}}),Line(points = {{0,20},{0,80}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25),Line(points = {{-10,30},{0,20},{10,30}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25),Line(points = {{-10,70},{0,80},{10,70}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25),Line(points = {{-100,-100},{-90,-80},{-70,-50},{-30,-15},{0,-10},{30,-15},{70,-50},{90,-80},{100,-100}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25)}));
    end Strasse;

    model TestStrasse
      import Modelica.Constants.pi;
      parameter Modelica.SIunits.Frequency fl = 1;
      parameter Modelica.SIunits.Frequency fr = 1;
      parameter Modelica.SIunits.Position Al = 1;
      parameter Modelica.SIunits.Position Ar = 1;
      parameter Modelica.SIunits.Angle phi = 1;
      parameter Modelica.SIunits.Velocity v = 1;
      parameter Modelica.SIunits.Position sr = 1;
      parameter Modelica.SIunits.Position sl = 1;
      parameter Modelica.SIunits.Position lv = 1;
      parameter Modelica.SIunits.Position lh = 1;
      Modelica.Blocks.Sources.Sine sine1(amplitude = Al, freqHz = fl,
        phase(displayUnit="deg") = 0)                                                 annotation(Placement(transformation(origin = {-5.98291,75.7835}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Sine sine2(amplitude = Al, freqHz = fl,                                                           startTime = (lv + lh) / v,
        offset=0,
        phase(displayUnit="deg") = 0)                                                                                 annotation(Placement(transformation(origin={-6.83761,
                27.0655},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Sine sine3(amplitude = Ar, freqHz = fr,
        phase=1/2*Modelica.Constants.pi + phi)                                                  annotation(Placement(transformation(origin = {-5.69801,-20.7977}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Sine sine4(amplitude = Ar, freqHz = fr,                                                           startTime = (lv + lh) / v,
        offset=0,
        phase=1/2*Modelica.Constants.pi + phi)                                                                        annotation(Placement(transformation(origin = {-3.9886,-71.51}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y1 annotation(Placement(transformation(origin = {105,76.3533}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,76.3533}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y2 annotation(Placement(transformation(origin = {105,27.0655}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,27.0655}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y3 annotation(Placement(transformation(origin = {105,-20.7977}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,-20.7977}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y4 annotation(Placement(transformation(origin = {105,-72.0798}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,-72.0798}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.FirstOrder firstOrder(
        k=1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=0,
        T=0.0001) annotation (Placement(transformation(extent={{36,17.0655},{56,
                37.0655}})));
    equation
      connect(sine4.y,y4) annotation(Line(points = {{9.2114,-71.51},{97.151,-71.51},{97.151,-72.0798},{105,-72.0798}}));
      connect(sine3.y,y3) annotation(Line(points={{7.50199,-20.7977},{96.2963,
              -20.7977},{105,-20.7977}}));
      connect(sine1.y,y1) annotation(Line(points = {{7.21709,75.7835},{96.2963,75.7835},{96.2963,76.3533},{105,76.3533}}));
      connect(firstOrder.y, y2) annotation (Line(
          points={{57,27.0655},{105,27.0655}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(firstOrder.u, sine2.y) annotation (Line(
          points={{34,27.0655},{6.36239,27.0655}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}})}));
    end TestStrasse;

    model Feder
      parameter TranslationalSpringConstant c = 1;
      parameter TranslationalDampingConstant b = 1;
      parameter Position l0 = 1;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springdamper1(c = c, s_unstretched = l0, d = b,
        width=0.06,
        numberOfWindings=6,
        coilWidth=0.01,
        color={0,128,255})                                                                                     annotation(Placement(transformation(origin = {-39.6011,-0.284922}, extent = {{-12,-12},{12,12}})));
    equation
      connect(springdamper1.frame_b,frame_b) annotation(Line(points = {{-27.6011,-0.284922},{62.6781,-0.284922},{62.6781,-0.284902},{100,-0.284902},{100,0}}));
      connect(frame_a,springdamper1.frame_a) annotation(Line(points = {{-100,0},{-64.3875,0},{-64.3875,-0.0000199158},{-51.6011,-0.0000199158},{-51.6011,-0.284922}}));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Line(points = {{-80,32},{-58,32},{-48,2},{-28,62},{-8,2},{12,62},{32,2},{52,62},{62,32},{80,32}}),Line(points = {{70,-28},{-50,-28},{-50,-72},{70,-72}}),Line(points = {{-30,-50},{80,-50}}, color = {0,0,0}),Line(points = {{-80,-50},{-50,-50}}, color = {0,0,0}),Line(points = {{-80,32},{-80,-50}}, color = {0,0,0}),Line(points = {{80,32},{80,-50}}, color = {0,0,0}),Line(points = {{-96,0},{-80,0}}, color = {0,0,0}),Line(points = {{96,0},{80,0}}, color = {0,0,0})}));
    end Feder;

    model Federbein1
      parameter Mass m = 1 "Radmasse";
      parameter TranslationalSpringConstant cr = 1 "Reifenradialsteifigkeit";
      parameter TranslationalSpringConstant ca = 1
        "Steifigkeit des Stoßdämpfers";
      parameter TranslationalDampingConstant d = 1
        "Dämpfung des Stoßdämpfers";
      parameter Position x0 = 0 "Anfangsposition x";
      parameter Position y0 = 0 "Anfangsposition y";
      parameter Position z0 = 0.3 "Anfangsposition z";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Strasse2 strasse1 annotation(Placement(transformation(origin = {1.86895,-41.8803}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {0,0,0}, m = m, r_0(start = {x0,y0,z0}, each fixed = true), I_11 = 1, I_22 = 1, I_33 = 1,
        sphereDiameter=0.2,
        sphereColor={0,128,255},
        cylinderDiameter=0)                                                                                                     annotation(Placement(transformation(origin = {30.9288,11.1111}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Feder feder1(c = cr, b = 0, l0 = 0.3) annotation(Placement(transformation(origin = {2.15385,-5.12821}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      PJlib.Kap17.Feder feder2(c = ca, b = d, l0 = 0.8) annotation(Placement(transformation(origin = {1.86895,27.6353}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Sensors.AbsolutePosition absoluteposition1 annotation(Placement(transformation(origin = {-63.8177,35.0997}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Blocks.Routing.DeMultiplex3 demultiplex31 annotation(Placement(transformation(origin = {-62.6781,-20.5128}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
    equation
      connect(demultiplex31.u,absoluteposition1.r) annotation(Line(points={{
              -62.6781,-6.1128},{-63.5328,-6.1128},{-63.5328,21.8997},{-63.8177,
              21.8997}}));
      connect(demultiplex31.y2[1],strasse1.y) annotation(Line(points={{-62.6781,
              -33.7128},{-62.6781,-26.0205},{-62.6781,-41.8803},{-10.491,
              -41.8803}}));
      connect(u,strasse1.z) annotation(Line(points={{-103,0},{-28.2051,0},{
              -28.2051,-35.6125},{-11.1111,-35.6125},{-11.1111,-35.8803},{
              -10.491,-35.8803}}));
      connect(demultiplex31.u,absoluteposition1.r) annotation(Line(points={{
              -62.6781,-6.1128},{-63.5328,-6.1128},{-63.5328,21.8997},{-63.8177,
              21.8997}}));
      connect(absoluteposition1.frame_a,frame_b) annotation(Line(points = {{-63.8177,47.0997},{-63.8177,47.0997},{-63.8177,59.0313},{70.8376,59.0313},{70.8376,0.319088},{100,0.319088},{100,0}}));
      connect(feder2.frame_b,frame_b) annotation(Line(points={{1.86895,39.6353},
              {1.91453,39.6353},{1.91453,59.0313},{70.8376,59.0313},{70.8376,
              0.319088},{100,0.319088},{100,0}}));
      connect(body1.frame_a,feder1.frame_b) annotation(Line(points={{18.9288,
              11.1111},{2.15385,11.1111},{2.15385,6.87179}}));
      connect(feder2.frame_a,feder1.frame_b) annotation(Line(points={{1.86895,
              15.6353},{2.15385,15.6353},{2.15385,6.87179}}));
      connect(feder1.frame_a,strasse1.frame_b) annotation(Line(points={{2.15385,
              -17.1282},{2.15385,-17.1282},{2.15385,-29.8803},{1.86895,-29.8803}}));
      connect(demultiplex31.y1[1], strasse1.x) annotation (Line(
          points={{-54.2781,-33.7128},{-54.2781,-47.8803},{-10.491,-47.8803}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}})}));
    end Federbein1;

    model Federbein2
      parameter Mass m = 1 "Radmasse";
      parameter TranslationalSpringConstant cr = 1 "Reifenradialsteifigkeit";
      parameter TranslationalSpringConstant ca = 1
        "Steifigkeit des Stoßdämpfers";
      parameter TranslationalDampingConstant d = 1
        "Dämpfung des Stoßdämpfers";
      parameter Position x0 = 1 "Anfangsposition x";
      parameter Position y0 = 1 "Anfangsposition y";
      parameter Position z0 = 1 "Anfangsposition z";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Strasse strasse1(x0 = x0, y0 = y0) annotation(Placement(transformation(origin = {1.86895,-41.8803}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {0,0,0}, m = m, r_0(start = {x0,y0,z0}, each fixed = true), I_11 = 1, I_22 = 1, I_33 = 1,
        sphereDiameter=0.2,
        sphereColor={0,128,255},
        cylinderDiameter=0)                                                                                                     annotation(Placement(transformation(origin = {30.9288,11.1111}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Feder feder1(c = cr, b = 0, l0 = 0.3) annotation(Placement(transformation(origin = {2.15385,-5.12821}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      PJlib.Kap17.Feder feder2(c = ca, b = d, l0 = 0.8) annotation(Placement(transformation(origin = {1.86895,27.6353}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
    equation
      connect(u,strasse1.z) annotation(Line(points={{-103,0},{-28.2051,0},{
              -28.2051,-35.6125},{-11.1111,-35.6125},{-11.1111,-35.8803},{
              -10.491,-35.8803}}));
      connect(feder2.frame_b,frame_b) annotation(Line(points={{1.86895,39.6353},
              {1.91453,39.6353},{1.91453,59.0313},{70.8376,59.0313},{70.8376,
              0.319088},{100,0.319088},{100,0}}));
      connect(body1.frame_a,feder1.frame_b) annotation(Line(points={{18.9288,
              11.1111},{2.15385,11.1111},{2.15385,6.87179}}));
      connect(feder2.frame_a,feder1.frame_b) annotation(Line(points={{1.86895,
              15.6353},{2.15385,15.6353},{2.15385,6.87179}}));
      connect(feder1.frame_a,strasse1.frame_b) annotation(Line(points={{2.15385,
              -17.1282},{2.15385,-17.1282},{2.15385,-29.8803},{1.86895,-29.8803}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}})}));
    end Federbein2;

    model Federbein3
      parameter Mass m = 1 "Radmasse";
      parameter TranslationalSpringConstant cr = 1 "Reifenradialsteifigkeit";
      parameter TranslationalSpringConstant ca = 1
        "Steifigkeit des Stoßdämpfers";
      parameter TranslationalDampingConstant d = 1
        "Dämpfung des Stoßdämpfers";
      parameter Position x0 = 1 "Anfangsposition x";
      parameter Position y0 = 1 "Anfangsposition y";
      parameter Position z0 = 1 "Anfangsposition z";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-103,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,0}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Strasse strasse1(x0 = x0, y0 = y0) annotation(Placement(transformation(origin = {1.86895,-41.8803}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {0,0,0}, m = m, r_0(start = {x0,y0,z0}, each fixed = true), I_11 = 1, I_22 = 1, I_33 = 1) annotation(Placement(transformation(origin = {30.9288,11.1111}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap17.Feder feder1(c = cr, b = 0, l0 = 0.3) annotation(Placement(transformation(origin = {2.15385,-5.12821}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      PJlib.Kap17.Feder feder2(c = ca, b = d, l0 = 0.8) annotation(Placement(transformation(origin = {1.86895,27.6353}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0,0,1},
          animation=false)                                                  annotation(Placement(transformation(origin = {-31.6092,-4.88506}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = 90)));
    equation
      connect(prismatic1.frame_a,feder1.frame_a) annotation(Line(points={{
              -31.6092,-16.8851},{-31.3218,-16.8851},{-31.3218,-23.5632},{
              2.01149,-23.5632},{2.01149,-17.1282},{2.15385,-17.1282}}));
      connect(prismatic1.frame_b,feder1.frame_b) annotation(Line(points={{
              -31.6092,7.11494},{-31.6092,7.11494},{-31.6092,11.7816},{2.01149,
              11.7816},{2.01149,6.87179},{2.15385,6.87179}}));
      connect(u,strasse1.z) annotation(Line(points={{-103,0},{-74.4695,0},{
              -74.4695,-35.6125},{-11.1111,-35.6125},{-11.1111,-35.8803},{
              -10.491,-35.8803}}));
      connect(feder2.frame_b,frame_b) annotation(Line(points={{1.86895,39.6353},
              {1.91453,39.6353},{1.91453,59.0313},{70.8376,59.0313},{70.8376,
              0.319088},{100,0.319088},{100,0}}));
      connect(body1.frame_a,feder1.frame_b) annotation(Line(points={{18.9288,
              11.1111},{2.15385,11.1111},{2.15385,6.87179}}));
      connect(feder2.frame_a,feder1.frame_b) annotation(Line(points={{1.86895,
              15.6353},{2.15385,15.6353},{2.15385,6.87179}}));
      connect(feder1.frame_a,strasse1.frame_b) annotation(Line(points={{2.15385,
              -17.1282},{2.15385,-17.1282},{2.15385,-29.8803},{1.86895,-29.8803}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}})}));
    end Federbein3;

    model BodyCylinderWithPivot
      import Modelica.Constants.pi;
      parameter Position L = 1 "Länge des Zylinders";
      parameter Position d = 1 "Durchmesser des Zylinders";
      parameter Density rho = 7700 "Dichte des Zylinders";
      parameter Position Ld = 1 "Abstand Schwerpunkt - Drehpunkt";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 annotation(Placement(transformation(origin = {-100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2 annotation(Placement(transformation(origin = {-50,-40}, extent = {{12,-12},{-12,12}}, rotation = 90), iconTransformation(origin = {-50,-40}, extent = {{12,-12},{-12,12}}, rotation = 90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {100,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {100,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(r_CM = {0,0,0}, m = 1 / 4 * rho * pi * L * d ^ 2, I_11 = 0, I_22 = 1 / 48 * rho * pi * d ^ 2 * L ^ 3, I_33 = 1 / 48 * rho * pi * d ^ 2 * L ^ 3,
        animation=false)                                                                                                     annotation(Placement(transformation(origin = {31.7293,-34.3219}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation2(r = {-L / 2 + Ld,0,0},
        width=d,
        color={0,128,255})                                                                         annotation(Placement(transformation(origin = {-73.7892,-0.2849}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation3(r = {-Ld,0,0},
        width=d,
        color={0,128,255})                                                                 annotation(Placement(transformation(origin = {-24.7863,-0.854701}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = {L / 2,0,0},
        width=d,
        color={0,128,255})                                                                   annotation(Placement(transformation(origin = {65.2422,-1.1396}, extent = {{-12,-12},{12,12}})));
    equation
      connect(frame_a2,fixedtranslation3.frame_b) annotation(Line(points={{-50,-40},
              {-49.8575,-40},{-49.8575,-0.2849},{-36.7863,-0.2849},{-36.7863,
              -0.854701}}));
      connect(body1.frame_a,fixedtranslation1.frame_a) annotation(Line(points = {{31.7293,-22.3219},{31.6239,-22.3219},{31.6239,-0.854701},{53.2422,-0.854701},{53.2422,-1.1396}}));
      connect(fixedtranslation1.frame_b,frame_b) annotation(Line(points={{77.2422,
              -1.1396},{100,-1.1396},{100,0}}));
      connect(fixedtranslation3.frame_a,fixedtranslation1.frame_a) annotation(Line(points={{
              -12.7863,-0.854701},{53.2764,-0.854701},{53.2764,-1.1396},{
              53.2422,-1.1396}}));
      connect(fixedtranslation2.frame_a,fixedtranslation3.frame_b) annotation(Line(points={{
              -61.7892,-0.2849},{-36.4672,-0.2849},{-36.4672,-0.854701},{
              -36.7863,-0.854701}}));
      connect(frame_a1,fixedtranslation2.frame_b) annotation(Line(points={{-100,0},
              {-85.4701,0},{-85.4701,-0.2849},{-85.7892,-0.2849}}));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-40},{100,40}},
                fillPattern =                                                                                                   FillPattern.Solid, fillColor = {68,162,255}),Ellipse(extent = {{-40,-10},{-20,10}},
                fillPattern =                                                                                                   FillPattern.Solid, fillColor = {33,74,203})}));
    end BodyCylinderWithPivot;

    model BodySphereWithInitPosition
      import Modelica.Constants.pi;
      parameter Length r = 1 "radius of the sphere";
      parameter Density rho = 7700 "density of the sphere";
      parameter Real[3] direction = {-0.95,0,0}
        "vector from CM to frame, scaled for r = 1";
      parameter Position x0 = 1 "Anfangsort, x";
      parameter Position y0 = 1 "Anfangsort, y";
      parameter Position z0 = 1 "Anfangsort, z";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 annotation(Placement(transformation(origin={-100,
                -0.1339},                                                                                                    extent = {{-12,-12},{12,12}}), iconTransformation(origin={-100,0},   extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.Body body1(                m = 4 / 3 * rho * pi * r ^ 3, I_11 = 8 / 15 * rho * pi * r ^ 5, I_22 = 8 / 15 * rho * pi * r ^ 5, I_33 = 8 / 15 * rho * pi * r ^ 5,
        animation=true,
        sphereDiameter=2*r,
        sphereColor={0,128,255},
        r_0(fixed=true, start={x0,y0,z0}),
        cylinderDiameter=0,
        r_CM={0,0,0})                                                                                                     annotation(Placement(transformation(origin={-17.8034,
                -0.1339},                                                                                                    extent = {{-12,-12},{12,12}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation2(
        color={0,128,255},
        r=r*direction,
        shapeType="cylinder",
        height=0.1,
        width=0.0,
        animation=false)                                                                           annotation(Placement(transformation(origin={-61.7892,
                -0.2849},                                                                                                    extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
    equation
      connect(fixedtranslation2.frame_a, body1.frame_a) annotation (Line(
          points={{-49.7892,-0.2849},{-39.8946,-0.2849},{-39.8946,-0.1339},{
              -29.8034,-0.1339}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedtranslation2.frame_b, frame_a1) annotation (Line(
          points={{-73.7892,-0.2849},{-86.8946,-0.2849},{-86.8946,-0.1339},{
              -100,-0.1339}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Ellipse(lineColor = {0,0,0}, fillColor = {0,0,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Sphere,
                lineThickness =                                                                                                   0.25, extent = {{-93.787,67.4556},{34.6154,-62.7219}})}));
    end BodySphereWithInitPosition;

    model AddVector
      parameter Integer n = 2;
      parameter Real k1 = 1 "Faktor des ersten Summanden";
      parameter Real k2 = 1 "Faktor des zweiten Summanden";
      Modelica.Blocks.Interfaces.RealInput v1[n] annotation(Placement(transformation(origin = {-103,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput v2[n] annotation(Placement(transformation(origin = {-103,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y[n] annotation(Placement(transformation(origin = {106,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {106,0}, extent = {{-12,-12},{12,12}})));
    equation
      y = k1 * v1 + k2 * v2;
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Text(extent = {{-90,-40},{90,40}}, textString = "k1*v1 + k2*v2", fontName = "Times New Roman")}));
    end AddVector;

    model MultScalarVector
      parameter Integer n = 2;
      Modelica.Blocks.Interfaces.RealInput s annotation(Placement(transformation(origin = {-103,40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput v[n] annotation(Placement(transformation(origin = {-103,-40}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-103,-40}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput y[n] annotation(Placement(transformation(origin = {106,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {106,0}, extent = {{-12,-12},{12,12}})));
    equation
      y = s * v;
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Text(extent = {{-90,-40},{90,40}}, textString = "s*v", fontName = "Times New Roman")}));
    end MultScalarVector;

    model Schlinge
      parameter Real c = 1 "Federkonstante";
      parameter Real d = 1 "Dämpfungskonstante";
      parameter Time Ts = 1 "Umschaltzeit";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(Placement(transformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(Placement(transformation(origin = {0,-100}, extent = {{-12,12},{12,-12}}, rotation = -90), iconTransformation(origin = {0,-100}, extent = {{-12,12},{12,-12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Sensors.RelativeVelocity relativevelocity1 annotation(Placement(transformation(origin = {79.4872,13.3903}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativeposition1 annotation(Placement(transformation(origin = {57.5499,45.0142}, extent={{-12,-12},
                {12,12}},                                                                                                    rotation = -90)));
      PJlib.Kap17.AddVector addvector1(n = 3, k1 = -d, k2 = -c) annotation(Placement(transformation(origin = {5.98291,35.0427}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      PJlib.Kap17.MultScalarVector multscalarvector1(n = 3) annotation(Placement(transformation(origin = {-35.3276,17.094}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      Modelica.Blocks.Sources.Step step1(height = -1, offset = 1, startTime = Ts) annotation(Placement(transformation(origin = {9.9715,-7.97718}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -180)));
      Modelica.Mechanics.MultiBody.Forces.Force force1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
        connectionLineColor={0,128,0},
        animation=false)                                                                                                     annotation(Placement(transformation(origin = {-76.0684,10.2564}, extent={{-12,12},
                {12,-12}},                                                                                                    rotation = -90)));
    equation
      connect(relativeposition1.frame_a,frame_a) annotation(Line(points = {{57.5499,57.0142},{57.5499,57.0142},{57.5499,86.0399},{-0.2849,86.0399},{-0.2849,100},{0,100}}));
      connect(relativeposition1.frame_b,frame_b) annotation(Line(points = {{57.5499,33.0142},{57.5499,33.0142},{57.5499,-76.6382},{0.2849,-76.6382},{0.2849,-100},{0,-100}}));
      connect(relativevelocity1.frame_a,frame_a) annotation(Line(points = {{79.4872,25.3903},{79.4872,25.3903},{79.4872,86.0399},{-0.2849,86.0399},{-0.2849,100},{0,100}}));
      connect(relativevelocity1.frame_b,frame_b) annotation(Line(points = {{79.4872,1.3903},{79.2023,1.3903},{79.2023,-76.6382},{0.2849,-76.6382},{0.2849,-100},{0,-100}}));
      connect(force1.frame_b,frame_b) annotation(Line(points={{-76.0684,-1.7436},
              {-76.0684,-1.7436},{-76.0684,-76.6382},{0.2849,-76.6382},{0.2849,
              -100},{0,-100}}));
      connect(force1.frame_a,frame_a) annotation(Line(points={{-76.0684,22.2564},
              {-76.3533,22.2564},{-76.3533,86.0399},{-0.2849,86.0399},{-0.2849,
              100},{0,100}}));
      connect(multscalarvector1.y,force1.force) annotation(Line(points={{
              -48.0476,17.094},{-59.8291,17.094},{-59.8291,17.4564},{-90.4684,
              17.4564}}));
      connect(step1.y,multscalarvector1.s) annotation(Line(points={{-3.2285,
              -7.97718},{-11.1111,-7.97718},{-11.1111,11.9658},{-22.9676,
              11.9658},{-22.9676,21.894}}));
      connect(addvector1.y,multscalarvector1.v) annotation(Line(points={{
              -6.73709,35.0427},{-14.8148,35.0427},{-14.8148,21.9373},{-22.9676,
              21.9373},{-22.9676,12.294}}));
      connect(addvector1.v2,relativeposition1.r_rel) annotation(Line(points={{18.3429,
              30.2427},{32.7635,30.2427},{32.7635,45.0142},{44.3499,45.0142}}));
      connect(addvector1.v1,relativevelocity1.v_rel) annotation(Line(points={{18.3429,
              39.8427},{33.3333,39.8427},{33.3333,13.3903},{66.2872,13.3903}}));
      annotation(                                                             Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Polygon(points = {{0,97},{-11,66},{-45,34},{-51,7},{-55,-37},{-39,-78},{5,-89},{36,-89},{53,-78},{63,-58},{65,-17},{55,11},{35,42},{13,65},{6,75},{0,97}}, lineColor = {0,0,0})}));
    end Schlinge;

  end Kap17;

  package Kap18
    block Extractor "Replacement for broken Extractor"
      extends Modelica.Blocks.Interfaces.MISO;
      parameter Boolean allowOutOfRange = false "Index may be out of range";
      parameter Real outOfRangeValue = 10000000000.0
        "Output signal if index is out of range";
      Modelica.Blocks.Interfaces.IntegerInput index annotation(Placement(transformation(origin = {2.5641,-103.989}, extent = {{12,-12},{-12,12}}, rotation = 90), iconTransformation(origin = {2.5641,-103.989}, extent = {{12,-12},{-12,12}}, rotation = 90)));
    protected
      Real k[nin];
    equation
      for i in 1:nin loop
      k[i] = if index == i then 1 else 0;

      end for;
      y = if not allowOutOfRange or index > 0 and index <= nin then k * u else outOfRangeValue;
      annotation(Diagram,   Icon);
    end Extractor;

    model OttoSteuerung
      parameter InternalEnergy Qzu = 1000;
      parameter Time T = 4;
      parameter Position x1 = 1;
      parameter Position x2 = 1;
      parameter Position x3 = 1;
      parameter Position x4 = 1;
      Modelica.Blocks.Interfaces.BooleanOutput sw annotation(Placement(transformation(origin = {105,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput x annotation(Placement(transformation(origin = {105,-50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,-50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput Qdot annotation(Placement(transformation(origin = {105,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,50}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.EqualConstantI equalconstanti1(k = 4) annotation(Placement(transformation(origin = {74.3589,0.0000027374}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.TimedModuloCounter timedmodulocounter1(T = T / 4, N = 4, offset = 1) annotation(Placement(transformation(origin = {-79.7721,-81.7664}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale1(smin = -1, tmin = x2, tmax = x1) annotation(Placement(transformation(origin = {-11.396,29.3447}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale2(smin = -1, tmin = x2, tmax = x3) annotation(Placement(transformation(origin = {-10.5413,-3.9886}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale3(smin = -1, tmin = x4, tmax = x3) annotation(Placement(transformation(origin = {-9.97151,-33.0484}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale4(smin = -1, tmin = x4, tmax = x1) annotation(Placement(transformation(origin = {-9.68661,-61.8234}, extent = {{-12,-12},{12,12}})));
      Extractor extractor1(nin = 4) annotation(Placement(transformation(origin = {74.0741,-59.5442}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex41 annotation(Placement(transformation(origin = {37.3219,-59.5442}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant const(k = 4 * Qzu / T) annotation(Placement(transformation(origin = {-3.7037,86.8946}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(transformation(origin = {-2.849,57.8348}, extent = {{-12,-12},{12,12}})));
      Extractor extractor2(nin = 4) annotation(Placement(transformation(origin = {75.4986,82.6211}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex42 annotation(Placement(transformation(origin = {39.3162,83.1909}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Sine sine1(freqHz = 2 / T, phase = Modelica.Constants.pi / 2) annotation(Placement(transformation(origin = {-61.8234,27.3504}, extent = {{-12,-12},{12,12}})));
    equation
      connect(sine1.y,rescale1.u) annotation(Line(points={{-48.6234,27.3504},{
              -23.6467,27.3504},{-23.6467,29.3447},{-23.396,29.3447}}));
      connect(sine1.y,rescale2.u) annotation(Line(points={{-48.6234,27.3504},{
              -35.0427,27.3504},{-35.0427,-3.9886},{-22.5413,-3.9886},{-22.5413,
              -3.9886}}));
      connect(sine1.y,rescale3.u) annotation(Line(points={{-48.6234,27.3504},{
              -35.0427,27.3504},{-35.0427,-32.7635},{-21.9715,-32.7635},{
              -21.9715,-33.0484}}));
      connect(sine1.y,rescale4.u) annotation(Line(points={{-48.6234,27.3504},{
              -35.0427,27.3504},{-35.0427,-62.1083},{-21.6866,-62.1083},{
              -21.6866,-61.8234}}));
      connect(const.y,multiplex42.u2[1]) annotation(Line(points = {{9.4963,86.8946},{24.2165,86.8946},{24.2165,86.7909},{24.9162,86.7909}}));
      connect(constant1.y,multiplex42.u1[1]) annotation(Line(points = {{10.351,57.8348},{15.6695,57.8348},{15.6695,94.302},{24.9162,94.302},{24.9162,93.9909}}));
      connect(constant1.y,multiplex42.u3[1]) annotation(Line(points = {{10.351,57.8348},{15.6695,57.8348},{15.6695,79.4872},{24.9162,79.4872},{24.9162,79.5909}}));
      connect(constant1.y,multiplex42.u4[1]) annotation(Line(points = {{10.351,57.8348},{15.6695,57.8348},{15.6695,72.3647},{24.9162,72.3647},{24.9162,72.3909}}));
      connect(extractor2.y,Qdot) annotation(Line(points={{88.6986,82.6211},{
              89.7436,82.6211},{89.7436,50.4274},{105,50.4274},{105,50}}));
      connect(rescale1.y,multiplex41.u1[1]) annotation(Line(points={{0.604,
              29.3447},{9.68661,29.3447},{9.68661,-1.9943},{22.9219,-1.9943},{
              22.9219,-48.7442}}));
      connect(rescale2.y,multiplex41.u2[1]) annotation(Line(points={{1.4587,
              -3.9886},{16.2621,-3.9886},{16.2621,-56.547},{22.9219,-56.547},{
              22.9219,-55.9442}}));
      connect(rescale3.y,multiplex41.u3[1]) annotation(Line(points={{2.02849,
              -33.0484},{11.4074,-33.0484},{11.4074,-63.6695},{22.9219,-63.6695},
              {22.9219,-63.1442}}));
      connect(rescale4.y,multiplex41.u4[1]) annotation(Line(points={{2.31339,
              -61.8234},{9.1111,-61.8234},{9.1111,-71.6467},{22.9219,-71.6467},
              {22.9219,-70.3442}}));
      connect(multiplex41.y,extractor1.u) annotation(Line(points={{50.5219,
              -59.5442},{62,-59.5442},{62,-60},{62,-139.088},{62,-59.5442},{
              59.6741,-59.5442}}));
      connect(extractor1.y,x) annotation(Line(points={{87.2741,-59.5442},{
              96.0114,-59.5442},{96.0114,-50},{105,-50}}));
      connect(timedmodulocounter1.n,extractor1.index) annotation(Line(points={{
              -67.7721,-81.7664},{74.3533,-81.7664},{74.3533,-72.0229},{74.3818,
              -72.0229}}));
      connect(timedmodulocounter1.n,extractor2.index) annotation(Line(points={{
              -67.7721,-81.7664},{52,-81.7664},{52,62},{74.9345,62},{74.9345,
              70.1424},{75.8063,70.1424}}));
      connect(timedmodulocounter1.n,equalconstanti1.u) annotation(Line(points = {{-67.7721,-81.7664},{52.7066,-81.7664},{52.7066,0.0000000000000142109},{62.3589,0.0000000000000142109},{62.3589,0.0000027374}}));
      connect(equalconstanti1.y,sw) annotation(Line(points={{86.3589,2.7374e-06},
              {96.0114,2.7374e-06},{96.0114,0},{105,0}}));
      connect(multiplex42.y, extractor2.u) annotation (Line(
          points={{52.5162,83.1909},{56.2581,83.1909},{56.2581,82.6211},{
              61.0986,82.6211}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-80},{100,80}}, fillColor = {204,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{-85,-50},{-15,55}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{3,27},{19,49}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{31,27},{47,49}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{59,27},{75,49}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{3,-6},{19,16}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{31,-6},{47,16}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{59,-6},{75,16}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{3,-39},{19,-17}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{31,-39},{47,-17}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Rectangle(extent = {{59,-39},{75,-17}}, fillColor = {255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid),Line(points = {{-83,-20},{-79,19},{-69,32},{-62,32},{-47,-4},{-39,-4},{-20,17},{-17,19}})}));
    end OttoSteuerung;

    model DieselSteuerung1
      parameter Modelica.SIunits.InternalEnergy Qzu = 1000;
      parameter Modelica.SIunits.Time T = 4;
      parameter Modelica.SIunits.Position x1 = 1;
      parameter Modelica.SIunits.Position x2 = 1;
      parameter Modelica.SIunits.Position x3 = 1;
      parameter Modelica.SIunits.Position x4 = 1;
      Modelica.Blocks.Interfaces.BooleanOutput sw annotation(Placement(transformation(origin = {105,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput x annotation(Placement(transformation(origin = {105,-50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,-50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput Qdot annotation(Placement(transformation(origin = {105,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,50}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.EqualConstantI equalconstanti1(k = 4) annotation(Placement(transformation(origin = {74.3589,0.0000027374}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.TimedModuloCounter timedmodulocounter1(T = T / 4, N = 4, offset = 1) annotation(Placement(transformation(origin = {-79.7721,-81.7664}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale1(smin = -1, tmin = x2, tmax = x1) annotation(Placement(transformation(origin = {-11.396,29.3447}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale2(smin = -1, tmin = x2, tmax = x3) annotation(Placement(transformation(origin = {-10.5413,-3.9886}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale3(smin = -1, tmin = x4, tmax = x3) annotation(Placement(transformation(origin = {-9.97151,-33.0484}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale4(smin = -1, tmin = x4, tmax = x1) annotation(Placement(transformation(origin = {-9.68661,-61.8234}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap18.Extractor extractor1(nin = 4) annotation(Placement(transformation(origin = {74.0741,-59.5442}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex41 annotation(Placement(transformation(origin = {37.3219,-59.5442}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap18.Extractor extractor2(nin = 4) annotation(Placement(transformation(origin = {75.4986,82.6211}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex42 annotation(Placement(transformation(origin = {39.3162,83.1909}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Sine sine1(freqHz = 2 / T, phase = Modelica.Constants.pi / 2) annotation(Placement(transformation(origin = {-61.8234,27.3504}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-105,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-105,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.PID PID(Ti = 0.5, Td = 0.1) annotation(Placement(transformation(origin = {-6.07544,87.2005}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(origin = {-44.315,86.8431}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(transformation(origin = {-122.928,111.799}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant const(k = 2500000.0) annotation(Placement(transformation(origin = {-121.996,74.3863}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(origin = {-90.4169,73.6201}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.EqualConstantI equalconstanti2(k = 2) annotation(Placement(transformation(origin = {-43.2428,57.1806}, extent = {{12,12},{-12,-12}}, rotation = -180)));
    equation
      connect(constant1.y,switch1.u3) annotation(Line(points = {{-109.728,111.799},{-72.9053,111.799},{-72.9053,77.1938},{-58.715,77.1938},{-58.715,77.2431}}));
      connect(u,feedback1.u2) annotation(Line(points = {{-105,0},{-90.4169,0},{-90.4169,64.0201},{-90.4169,64.0201}}));
      connect(feedback1.y,switch1.u1) annotation(Line(points = {{-79.6169,73.6201},{-76.8365,73.6201},{-76.8365,96.1349},{-58.715,96.1349},{-58.715,96.4431}}));
      connect(const.y,feedback1.u1) annotation(Line(points = {{-108.796,74.3863},{-101.496,74.3863},{-101.496,73.6201},{-100.017,73.6201}}));
      connect(multiplex42.u1[1],constant1.y) annotation(Line(points = {{24.9162,93.9909},{14.2952,93.9909},{14.2952,111.86},{-109.728,111.86},{-109.728,111.799}}));
      connect(multiplex42.u3[1],constant1.y) annotation(Line(points = {{24.9162,79.5909},{14.2952,79.5909},{14.2952,111.86},{-109.728,111.86},{-109.728,111.799}}));
      connect(constant1.y,multiplex42.u4[1]) annotation(Line(points = {{-109.728,111.799},{14.2952,111.799},{14.2952,72.5479},{24.9162,72.5479},{24.9162,72.3909}}));
      connect(equalconstanti2.u,timedmodulocounter1.n) annotation(Line(points = {{-31.2428,57.1806},{52.5347,57.1806},{52.5347,-81.8398},{-67.7721,-81.8398},{-67.7721,-81.7664}}));
      connect(equalconstanti2.y,switch1.u2) annotation(Line(points = {{-55.2428,57.1806},{-68.2594,57.1806},{-68.2594,86.8431},{-58.715,86.8431},{-58.715,86.8431}}));
      connect(PID.y,multiplex42.u2[1]) annotation(Line(points = {{7.12456,87.2005},{23.9316,87.2005},{23.9316,86.7909},{24.9162,86.7909}}));
      connect(switch1.y,PID.u) annotation(Line(points = {{-31.115,86.8431},{-21.0826,86.8431},{-21.0826,87.2005},{-20.4754,87.2005}}));
      connect(sine1.y,rescale1.u) annotation(Line(points = {{-48.6234,29.3447},{-23.6467,29.3447},{-23.6467,29.3447},{-23.396,29.3447}}));
      connect(sine1.y,rescale2.u) annotation(Line(points = {{-48.6234,29.3447},{-35.0427,29.3447},{-35.0427,-3.9886},{-22.5413,-3.9886},{-22.5413,-3.9886}}));
      connect(sine1.y,rescale3.u) annotation(Line(points = {{-48.6234,29.3447},{-35.0427,29.3447},{-35.0427,-32.7635},{-21.9715,-32.7635},{-21.9715,-33.0484}}));
      connect(sine1.y,rescale4.u) annotation(Line(points = {{-48.6234,29.3447},{-35.0427,29.3447},{-35.0427,-62.1083},{-21.6866,-62.1083},{-21.6866,-61.8234}}));
      connect(multiplex42.y,extractor2.u) annotation(Line(points = {{30,80},{40,80}}));
      connect(extractor2.y,Qdot) annotation(Line(points = {{85.5647,82.906},{89.7436,82.906},{89.7436,50.4274},{105,50.4274},{105,50}}));
      connect(rescale1.y,multiplex41.u1[1]) annotation(Line(points = {{0.604,29.3447},{9.68661,29.3447},{9.68661,-1.9943},{16.6541,-1.9943},{16.6541,-1.73565}}));
      connect(rescale2.y,multiplex41.u2[1]) annotation(Line(points = {{1.4587,-3.9886},{8.26211,-3.9886},{8.26211,-8.54701},{16.6541,-8.54701},{16.6541,-8.93565}}));
      connect(rescale3.y,multiplex41.u3[1]) annotation(Line(points = {{2.02849,-33.0484},{7.40741,-33.0484},{7.40741,-15.6695},{16.6541,-15.6695},{16.6541,-16.1357}}));
      connect(rescale4.y,multiplex41.u4[1]) annotation(Line(points = {{2.31339,-61.8234},{11.1111,-61.8234},{11.1111,-23.6467},{16.6541,-23.6467},{16.6541,-23.3357}}));
      connect(multiplex41.y,extractor1.u) annotation(Line(points = {{16,20},{26,20}}));
      connect(extractor1.y,x) annotation(Line(points = {{88.9835,-50.1425},{96.0114,-50.1425},{96.0114,-50},{105,-50}}));
      connect(timedmodulocounter1.n,extractor1.index) annotation(Line(points = {{-67.7721,-81.7664},{76.3533,-81.7664},{76.3533,-62.6212},{76.0912,-62.6212}}));
      connect(timedmodulocounter1.n,extractor2.index) annotation(Line(points = {{-67.7721,-81.7664},{52.7066,-81.7664},{52.7066,60.9687},{72.9345,60.9687},{72.9345,70.4273},{72.6724,70.4273}}));
      connect(timedmodulocounter1.n,equalconstanti1.u) annotation(Line(points = {{-67.7721,-81.7664},{52.7066,-81.7664},{52.7066,0.0000000000000142109},{62.3589,0.0000000000000142109},{62.3589,0.0000027374}}));
      connect(equalconstanti1.y,sw) annotation(Line(points = {{86.3589,0.0000027374},{96.0114,0.0000027374},{96.0114,0.2849},{105.285,0.2849}}));
      annotation(Icon(graphics={  Rectangle(lineColor = {0,0,0}, fillColor = {204,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-100,-80},{100,80}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-85,-50},{-15,55}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{3,27},{19,49}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{31,27},{47,49}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{59,27},{75,49}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{3,-6},{19,16}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{31,-6},{47,16}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{59,-6},{75,16}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{3,-39},{19,-17}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{31,-39},{47,-17}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{59,-39},{75,-17}}),Line(points = {{-83,-20},{-79,19},{-69,32},{-62,32},{-47,-4},{-39,-4},{-20,17},{-17,19}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25)}), Diagram);
    end DieselSteuerung1;

    model DieselSteuerung2
      parameter Modelica.SIunits.InternalEnergy Qzu = 1000;
      parameter Modelica.SIunits.Time T = 4;
      parameter Modelica.SIunits.Position x1 = 1;
      parameter Modelica.SIunits.Position x2 = 1;
      parameter Modelica.SIunits.Position x3 = 1;
      parameter Modelica.SIunits.Position x4 = 1;
      Modelica.Blocks.Interfaces.BooleanOutput sw annotation(Placement(transformation(origin = {105,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput x annotation(Placement(transformation(origin = {105,-50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,-50}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealOutput Qdot annotation(Placement(transformation(origin = {105,50}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {105,50}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.EqualConstantI equalconstanti1(k = 4) annotation(Placement(transformation(origin = {74.3589,0.0000027374}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.TimedModuloCounter timedmodulocounter1(T = T / 4, N = 4, offset = 1) annotation(Placement(transformation(origin = {-79.7721,-81.7664}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale1(smin = -1, tmin = x2, tmax = x1) annotation(Placement(transformation(origin = {-11.396,29.3447}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale2(smin = -1, tmin = x2, tmax = x3) annotation(Placement(transformation(origin = {-10.5413,-3.9886}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale3(smin = -1, tmin = x4, tmax = x3) annotation(Placement(transformation(origin = {-9.97151,-33.0484}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.Rescale rescale4(smin = -1, tmin = x4, tmax = x1) annotation(Placement(transformation(origin = {-9.68661,-61.8234}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap18.Extractor extractor1(nin = 4) annotation(Placement(transformation(origin = {74.0741,-59.5442}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex41 annotation(Placement(transformation(origin = {37.3219,-59.5442}, extent = {{-12,-12},{12,12}})));
      PJlib.Kap18.Extractor extractor2(nin = 4) annotation(Placement(transformation(origin = {75.4986,82.6211}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex42 annotation(Placement(transformation(origin = {39.3162,83.1909}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Sine sine1(freqHz = 2 / T, phase = Modelica.Constants.pi / 2) annotation(Placement(transformation(origin = {-61.8234,27.3504}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-105,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-105,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Continuous.PID PID(Ti = 0.5, Td = 0.1) annotation(Placement(transformation(origin = {-6.07544,87.2005}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(origin = {-44.315,86.8431}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(transformation(origin = {-122.928,111.799}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(origin = {-90.4169,73.6201}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Discrete.TriggeredSampler triggeredsampler1 annotation(Placement(transformation(origin = {-123.653,73.6201}, extent = {{-12,-12},{12,12}})));
      Thermo.Auxiliary.EqualConstantI equalconstanti2(k = 2) annotation(Placement(transformation(origin = {-43.2428,55.3937}, extent = {{12,12},{-12,-12}}, rotation = -180)));
    equation
      connect(triggeredsampler1.u,u) annotation(Line(points = {{-138.053,73.6201},{-147.597,73.6201},{-147.597,27.1608},{-90.4169,27.1608},{-90.4169,0},{-105,0},{-105,0}}));
      connect(equalconstanti2.y,triggeredsampler1.trigger) annotation(Line(points = {{-55.2428,55.3937},{-123.296,55.3937},{-123.296,59.4601},{-123.653,59.4601}}));
      connect(triggeredsampler1.y,feedback1.u1) annotation(Line(points = {{-110.453,73.6201},{-101.138,73.6201},{-101.138,73.6201},{-100.017,73.6201}}));
      connect(constant1.y,switch1.u3) annotation(Line(points = {{-109.728,111.799},{-72.9053,111.799},{-72.9053,77.1938},{-58.715,77.1938},{-58.715,77.2431}}));
      connect(u,feedback1.u2) annotation(Line(points = {{-105,0},{-90.4169,0},{-90.4169,64.0201},{-90.4169,64.0201}}));
      connect(feedback1.y,switch1.u1) annotation(Line(points = {{-79.6169,73.6201},{-76.8365,73.6201},{-76.8365,96.1349},{-58.715,96.1349},{-58.715,96.4431}}));
      connect(multiplex42.u1[1],constant1.y) annotation(Line(points = {{24.9162,93.9909},{14.2952,93.9909},{14.2952,111.86},{-109.728,111.86},{-109.728,111.799}}));
      connect(multiplex42.u3[1],constant1.y) annotation(Line(points = {{24.9162,79.5909},{14.2952,79.5909},{14.2952,111.86},{-109.728,111.86},{-109.728,111.799}}));
      connect(constant1.y,multiplex42.u4[1]) annotation(Line(points = {{-109.728,111.799},{14.2952,111.799},{14.2952,72.5479},{24.9162,72.5479},{24.9162,72.3909}}));
      connect(equalconstanti2.u,timedmodulocounter1.n) annotation(Line(points = {{-31.2428,57.1806},{52.5347,57.1806},{52.5347,-81.8398},{-67.7721,-81.8398},{-67.7721,-81.7664}}));
      connect(equalconstanti2.y,switch1.u2) annotation(Line(points = {{-55.2428,57.1806},{-68.2594,57.1806},{-68.2594,86.8431},{-58.715,86.8431},{-58.715,86.8431}}));
      connect(PID.y,multiplex42.u2[1]) annotation(Line(points = {{7.12456,87.2005},{23.9316,87.2005},{23.9316,86.7909},{24.9162,86.7909}}));
      connect(switch1.y,PID.u) annotation(Line(points = {{-31.115,86.8431},{-21.0826,86.8431},{-21.0826,87.2005},{-20.4754,87.2005}}));
      connect(sine1.y,rescale1.u) annotation(Line(points = {{-48.6234,29.3447},{-23.6467,29.3447},{-23.6467,29.3447},{-23.396,29.3447}}));
      connect(sine1.y,rescale2.u) annotation(Line(points = {{-48.6234,29.3447},{-35.0427,29.3447},{-35.0427,-3.9886},{-22.5413,-3.9886},{-22.5413,-3.9886}}));
      connect(sine1.y,rescale3.u) annotation(Line(points = {{-48.6234,29.3447},{-35.0427,29.3447},{-35.0427,-32.7635},{-21.9715,-32.7635},{-21.9715,-33.0484}}));
      connect(sine1.y,rescale4.u) annotation(Line(points = {{-48.6234,29.3447},{-35.0427,29.3447},{-35.0427,-62.1083},{-21.6866,-62.1083},{-21.6866,-61.8234}}));
      connect(multiplex42.y,extractor2.u) annotation(Line(points = {{30,80},{40,80}}));
      connect(extractor2.y,Qdot) annotation(Line(points = {{85.5647,82.906},{89.7436,82.906},{89.7436,50.4274},{105,50.4274},{105,50}}));
      connect(rescale1.y,multiplex41.u1[1]) annotation(Line(points = {{0.604,29.3447},{9.68661,29.3447},{9.68661,-1.9943},{16.6541,-1.9943},{16.6541,-1.73565}}));
      connect(rescale2.y,multiplex41.u2[1]) annotation(Line(points = {{1.4587,-3.9886},{8.26211,-3.9886},{8.26211,-8.54701},{16.6541,-8.54701},{16.6541,-8.93565}}));
      connect(rescale3.y,multiplex41.u3[1]) annotation(Line(points = {{2.02849,-33.0484},{7.40741,-33.0484},{7.40741,-15.6695},{16.6541,-15.6695},{16.6541,-16.1357}}));
      connect(rescale4.y,multiplex41.u4[1]) annotation(Line(points = {{2.31339,-61.8234},{11.1111,-61.8234},{11.1111,-23.6467},{16.6541,-23.6467},{16.6541,-23.3357}}));
      connect(multiplex41.y,extractor1.u) annotation(Line(points = {{16,20},{26,20}}));
      connect(extractor1.y,x) annotation(Line(points = {{88.9835,-50.1425},{96.0114,-50.1425},{96.0114,-50},{105,-50}}));
      connect(timedmodulocounter1.n,extractor1.index) annotation(Line(points = {{-67.7721,-81.7664},{76.3533,-81.7664},{76.3533,-62.6212},{76.0912,-62.6212}}));
      connect(timedmodulocounter1.n,extractor2.index) annotation(Line(points = {{-67.7721,-81.7664},{52.7066,-81.7664},{52.7066,60.9687},{72.9345,60.9687},{72.9345,70.4273},{72.6724,70.4273}}));
      connect(timedmodulocounter1.n,equalconstanti1.u) annotation(Line(points = {{-67.7721,-81.7664},{52.7066,-81.7664},{52.7066,0.0000000000000142109},{62.3589,0.0000000000000142109},{62.3589,0.0000027374}}));
      connect(equalconstanti1.y,sw) annotation(Line(points = {{86.3589,0.0000027374},{96.0114,0.0000027374},{96.0114,0.2849},{105.285,0.2849}}));
      annotation(Icon(graphics={  Rectangle(lineColor = {0,0,0}, fillColor = {204,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-100,-80},{100,80}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{-85,-50},{-15,55}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{3,27},{19,49}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{31,27},{47,49}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{59,27},{75,49}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{3,-6},{19,16}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{31,-6},{47,16}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{59,-6},{75,16}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{3,-39},{19,-17}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{31,-39},{47,-17}}),Rectangle(lineColor = {0,0,0}, fillColor = {255,255,255}, pattern = LinePattern.Solid,
                fillPattern =                                                                                                   FillPattern.Solid,
                lineThickness =                                                                                                   0.25, extent = {{59,-39},{75,-17}}),Line(points = {{-83,-20},{-79,19},{-69,32},{-62,32},{-47,-4},{-39,-4},{-20,17},{-17,19}}, color = {0,0,0}, pattern = LinePattern.Solid, thickness = 0.25)}), Diagram);
    end DieselSteuerung2;

    model Efficiency
      Modelica.Blocks.Interfaces.RealInput P1 annotation(Placement(transformation(origin = {-105,0}, extent = {{-12,-12},{12,12}}), iconTransformation(origin = {-105,0}, extent = {{-12,-12},{12,12}})));
      Modelica.Blocks.Math.Division division1 annotation(Placement(transformation(origin = {0.319088,74.3476}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Math.Add add1(k1 = -1, k2 = -1) annotation(Placement(transformation(origin = {-55.8405,34.1425}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(origin = {50.416,32.8661}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Math.Max max1 annotation(Placement(transformation(origin = {5.74359,-23.2934}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Math.Max max2 annotation(Placement(transformation(origin = {67.0085,-22.6553}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(origin = {23.9316,-68.9231}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Sources.Constant constant1(k = 0) annotation(Placement(transformation(origin = {82.3248,-69.2422}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput P2 annotation(Placement(transformation(origin = {105,0}, extent = {{-12,12},{12,-12}}, rotation = -180), iconTransformation(origin = {105,0}, extent = {{-12,12},{12,-12}}, rotation = -180)));
      Modelica.Blocks.Interfaces.RealInput Qdot1 annotation(Placement(transformation(origin = {-60,-105}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {-60,-105}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput Qdot2 annotation(Placement(transformation(origin = {60,-105}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {60,-105}, extent = {{-12,-12},{12,12}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealOutput eta annotation(Placement(transformation(origin = {0,105}, extent = {{-12,-12},{12,12}}, rotation = 90), iconTransformation(origin = {0,105}, extent = {{-12,12},{12,-12}}, rotation = 90)));
    equation
      connect(Qdot1,max1.u1) annotation(Line(points = {{-60,-105},{-60,-105},{-59.9886,-49.1396},{-1.27635,-49.1396},{-1.27635,-37.6934},{-1.45641,-37.6934}}));
      connect(Qdot2,max2.u1) annotation(Line(points = {{60,-105},{60,-105},{59.9886,-37.0553},{59.8085,-37.0553}}));
      connect(P2,add1.u2) annotation(Line(points = {{105,0},{-48.5014,0},{-48.6405,19.7425},{-48.6405,19.7425}}));
      connect(division1.y,eta) annotation(Line(points = {{0.319088,87.5476},{0.319088,87.5476},{0.319088,105},{0,105}}));
      connect(constant1.y,max2.u2) annotation(Line(points = {{82.3248,-56.0422},{82.3248,-56.0422},{82.3248,-49.1396},{74.3476,-49.1396},{74.3476,-37.0553},{74.2085,-37.0553}}));
      connect(const.y,max1.u2) annotation(Line(points = {{23.9316,-55.7231},{23.9316,-55.7231},{23.9316,-49.1396},{13.4017,-49.1396},{13.4017,-37.6934},{12.9436,-37.6934}}));
      connect(max2.y,add2.u2) annotation(Line(points = {{67.0085,-9.4553},{67.0085,-9.45527},{67.0085,6.38177},{57.755,6.38177},{57.755,18.4661},{57.616,18.4661}}));
      connect(max1.y,add2.u1) annotation(Line(points = {{5.74359,-10.0934},{5.74359,-10.0934},{5.74359,6.38177},{43.396,6.38177},{43.396,18.4661},{43.216,18.4661}}));
      connect(add2.y,division1.u2) annotation(Line(points = {{50.416,46.0661},{50.416,46.0661},{50.416,52.6496},{7.97721,52.6496},{7.97721,59.9476},{7.51909,59.9476}}));
      connect(add1.y,division1.u1) annotation(Line(points = {{-55.8405,47.3425},{-55.8405,47.3425},{-55.8405,52.6496},{-6.70085,52.6496},{-6.70085,59.9476},{-6.88091,59.9476}}));
      connect(P1,add1.u1) annotation(Line(points = {{-105,0},{-62.8604,0},{-63.0405,19.7425},{-63.0405,19.7425}}));
      annotation( Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics={  Rectangle(extent = {{-100,-100},{100,100}}),Text(extent = {{-90,-40},{90,40}}, textString = "eta", fontName = "Times New Roman")}));
    end Efficiency;
  end Kap18;
  annotation (uses(Modelica(version="3.2.1"), SystemDynamics, Thermo));
end PJlib;

