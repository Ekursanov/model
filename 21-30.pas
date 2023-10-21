uses graphWPF;
{21.	Построить в центре окна кривую по заданному параметрическому представлению (за 3600 итераций цикла):
а)	Формула кардиоиды:
x:=320+round(2*R*sin(t)+R*sin(2*t))
y:=240+round(2*R*cos(t)+R*cos(2*t))

}
procedure task21(x, y, r: real; n: integer);
begin
  if n = 1 then
    for var t := 1 to 3600 do
    begin
      x := 320 + round(2 * R * sin(t) + R * sin(2 * t));
      y := 240 + round(2 * R * cos(t) + R * cos(2 * t));
      SetPixel(x, y, Colors.red);
    end;
  
  if n = 2 then
    for var t := 1 to 3600 do
    begin
      x := 320 + round(R * sin(t) ** 3);
      y := 240 + round(R * cos(t) ** 3);
      SetPixel(x, y, Colors.red);
    end;
  
  if n = 3 then
    for var t := 1 to 3600 do
    begin
      x := 320 + round(6.2 * R * sin(t) + R * sin(6.2 * t));
      y := 240 + round(6.2 * R * cos(t) + R * cos(6.2 * t));
      SetPixel(x, y, Colors.red);
    end;  
  
  if n = 4 then
    for var t := 1 to 3600 do
    begin
      x := 320 + round(6 * R * cos(t) - 4 * R * cos(t) ** 3);
      y := 240 + round(4 * R * sin(t) ** 3);
      SetPixel(x, y, Colors.red);
    end; 
end;

procedure task22(x, y, r: real; c: color; n: integer);
begin
  circle(x, y, r);
  circle(x, y, r / 2);
  pen.Width += 1;
  var a := ArrGen(n, i -> (x + cos(pi * 2 / n * i) * r, y - sin(pi * 2 / n * i) * r));
  println(a);
  var b := ArrGen(n, i -> (x + cos((pi * 2 / n * i + pi * 2 / n * (i + 1)) / 2) * (r / 2),
  y - sin((pi * 2 / n * i + pi * 2 / n * (i + 1)) / 2) * (r / 2)));
  //  println(b);
  for var i := 0 to n - 1 do
  begin
    line(a[i].Item1, a[i].Item2, b[i].Item1, b[i].Item2, c);
    line(a[(i + 1) mod n].Item1, a[(i + 1) mod n].Item2, b[i].Item1, b[i].Item2, c);
  end;
end;

procedure otrezok(x1, y1, x2, y2: real; c: color);
begin
  var t := 0.0;
  var x, y: real;
  var dt := 10e-4;
  while t <= 1 do
  begin
    x := x1 + (x2 - x1) * t;
    y := y1 + (y2 - y1) * t;
    t += dt;
    SetPixel(x, y, c);  
  end;
end;


procedure task23(x1, y1, x2, y2, x3, y3, x4, y4: real; n: integer; c: color);
begin
  var t := 0.077;
  if n = 1 then
    exit;
  //рисуем квадрат
  line(x1, y1, x2, y2, c);
  line(x2, y2, x3, y3, c);
  line(x3, y3, x4, y4, c);
  line(x4, y4, x1, y1, c);
  //делаем рекурсию
  task23(
  x1 + (x2 - x1) * t,
  y1 + (y2 - y1) * t,
  x2 + (x3 - x2) * t,
  y2 + (y3 - y2) * t,
  x3 + (x4 - x3) * t,
  y3 + (y4 - y3) * t,
  x4 + (x1 - x4) * t,
  y4 + (y1 - y4) * t,
  n - 1, c)
end;

procedure task24_1(x1, y1, x2, y2, x3, y3: real; n: integer; c: color);
begin
  var t := 0.08;
  if n = 1 then
    exit;
  //рисует треугольник
  line(x1, y1, x2, y2, c);
  line(x2, y2, x3, y3, c);
  line(x3, y3, x1, y1, c);
  //делаем рекурсию
  task24_1(
  x1 + (x2 - x1) * t,
  y1 + (y2 - y1) * t,
  x2 + (x3 - x2) * t,
  y2 + (y3 - y2) * t,
  x3 + (x1 - x3) * t,
  y3 + (y1 - y3) * t,
  n - 1, c)
end;

procedure task24_2(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5: real; n: integer; c: color);
begin
  var t := 0.08;
  if n = 1 then
    exit;
  //рисуем
  line(x1, y1, x2, y2, c);
  line(x2, y2, x3, y3, c);
  line(x3, y3, x4, y4, c);
  line(x4, y4, x5, y5, c);
  line(x5, y5, x1, y1, c);
  //рекурсия
  task24_2(
  x1 + (x2 - x1) * t,
  y1 + (y2 - y1) * t,
  x2 + (x3 - x2) * t,
  y2 + (y3 - y2) * t,
  x3 + (x4 - x3) * t,
  y3 + (y4 - y3) * t,
  x4 + (x5 - x4) * t,
  y4 + (y5 - y4) * t,
  x5 + (x1 - x5) * t,
  y5 + (y1 - y5) * t,
  n - 1, c)
end;

procedure task24_3(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6: real; n: integer; c: color);
begin
  var t := 0.08;
  if n = 1 then
    exit;
  //рисуем
  line(x1, y1, x2, y2, c);
  line(x2, y2, x3, y3, c);
  line(x3, y3, x4, y4, c);
  line(x4, y4, x5, y5, c);
  line(x5, y5, x6, y6, c);
  line(x6, y6, x1, y1, c);
  //рекурсия
  task24_3(
  x1 + (x2 - x1) * t,
  y1 + (y2 - y1) * t,
  x2 + (x3 - x2) * t,
  y2 + (y3 - y2) * t,
  x3 + (x4 - x3) * t,
  y3 + (y4 - y3) * t,
  x4 + (x5 - x4) * t,
  y4 + (y5 - y4) * t,
  x5 + (x6 - x5) * t,
  y5 + (y6 - y5) * t,
  x6 + (x1 - x6) * t,
  y6 + (y1 - y6) * t,
  n - 1, c)
end;

{Воспроизвести движение круга по горизонтали. }
procedure task25(x1, y1, r: real);
begin
  var dt := 1;
  var t := 0.0;
  BeginFrameBasedAnimation( () ->
  begin
    t += dt;
    Circle(t  + x1, y1, r);
  end);

end;

{Изобразить движение круга по синусоиде.}
procedure task26(x1, y1, r: real);
begin
  var dt := 0.05;
  var t := 0.0;
  BeginFrameBasedAnimation( () ->
  begin
    t += dt;
    var y := sin(t) * r;
    Circle(t * r + x1, y + y1, r);
  end);
end;

{Изобразить отрезок, который вращается вокруг своей концевой точки. Вокруг своей середины.}
procedure task27_1(x1, y1, x2, y2: real);
begin
    //центр вращения
  var x0 := x2;
  var y0 := y2;
  //Формулы:
  //X' = (X - X0) * cos α - (Y - Y0) * sin α + X0
  //Y' = (X - X0) * sin α + (Y - Y0) * cos α + Y0
  var da := 0.05;
  var a := 0.0;
  BeginFrameBasedAnimation( () ->
  begin
    Circle(x0, y0, 2, colors.Red);
    a += da;
    var (ca, sa) := (cos(a), sin(a));
    var x11 := (x1 - x0) * ca - (y1 - y0) * sa + x0;
    var y11 := (x1 - x0) * sa + (y1 - y0) * ca + y0;
    
    var x22 := (x2 - x0) * ca - (y2 - y0) * sa + x0;
    var y22 := (x2 - x0) * sa + (y2 - y0) * ca + y0;
    
    line(x11, y11, x22, y22);
  end);
end;

procedure task27_2(x1, y1, x2, y2: real);
begin
    //центр вращения
  var x0 := (x1 + x2) / 2;
  var y0 := (y1 + y2) / 2;
  //Формулы:
  //X' = (X - X0) * cos α - (Y - Y0) * sin α + X0
  //Y' = (X - X0) * sin α + (Y - Y0) * cos α + Y0
  var da := 0.05;
  var a := 0.0;
  BeginFrameBasedAnimation( () ->
  begin
    Circle(x0, y0, 2, colors.Red);
    a += da;
    var (ca, sa) := (cos(a), sin(a));
    var x11 := (x1 - x0) * ca - (y1 - y0) * sa + x0;
    var y11 := (x1 - x0) * sa + (y1 - y0) * ca + y0;
    
    var x22 := (x2 - x0) * ca - (y2 - y0) * sa + x0;
    var y22 := (x2 - x0) * sa + (y2 - y0) * ca + y0;
    
    line(x11, y11, x22, y22);
  end);
end;

{Изобразить отрезок, который вращается вокруг произвольной точки плоскости.}
procedure task28(x1, y1, x2, y2, tx, ty: real);
begin
   //центр вращения
  var x0 := tx;
  var y0 := ty;
  //Формулы:
  //X' = (X - X0) * cos α - (Y - Y0) * sin α + X0
  //Y' = (X - X0) * sin α + (Y - Y0) * cos α + Y0
  var da := 0.05;
  var a := 0.0;
  BeginFrameBasedAnimation( () ->
  begin
    Circle(x0, y0, 2, colors.Red);
    a += da;
    var (ca, sa) := (cos(a), sin(a));
    var x11 := (x1 - x0) * ca - (y1 - y0) * sa + x0;
    var y11 := (x1 - x0) * sa + (y1 - y0) * ca + y0;
    
    var x22 := (x2 - x0) * ca - (y2 - y0) * sa + x0;
    var y22 := (x2 - x0) * sa + (y2 - y0) * ca + y0;
    
    line(x11, y11, x22, y22);
  end);
end;

{Изобразить треугольник, который вращается вокруг своей вершины. Вокруг своего центра.}
procedure task29_1(x1, y1, x2, y2, x3, y3: real);
begin
  //центр вращения
  var x0 := x1;
  var y0 := y1;
  //Формулы:
  //X' = (X - X0) * cos α - (Y - Y0) * sin α + X0
  //Y' = (X - X0) * sin α + (Y - Y0) * cos α + Y0
  var da := 0.05;
  var a := 0.0;
  BeginFrameBasedAnimation( () ->
  begin
    Circle(x0, y0, 2, colors.Red);
    a += da;
    var (ca, sa) := (cos(a), sin(a));
    var x11 := (x1 - x0) * ca - (y1 - y0) * sa + x0;
    var y11 := (x1 - x0) * sa + (y1 - y0) * ca + y0;
    
    var x22 := (x2 - x0) * ca - (y2 - y0) * sa + x0;
    var y22 := (x2 - x0) * sa + (y2 - y0) * ca + y0;
    
    var x33 := (x3 - x0) * ca - (y3 - y0) * sa + x0;
    var y33 := (x3 - x0) * sa + (y3 - y0) * ca + y0;
    
    Polygon(|new Point(x11, y11), new Point(x22, y22), new Point(x33, y33)|);
  end);
end;

procedure task29_2(x1, y1, x2, y2, x3, y3: real);
begin
  //центр вращения
  var x0 := (x1 + x2 + x3) / 3;
  var y0 := (y1 + y2 + y3) / 3;
  //Формулы:
  //X' = (X - X0) * cos α - (Y - Y0) * sin α + X0
  //Y' = (X - X0) * sin α + (Y - Y0) * cos α + Y0
  var da := 0.05;
  var a := 0.0;
  BeginFrameBasedAnimation( () ->
  begin
    a += da;
    var (ca, sa) := (cos(a), sin(a));
    var x11 := (x1 - x0) * ca - (y1 - y0) * sa + x0;
    var y11 := (x1 - x0) * sa + (y1 - y0) * ca + y0;
    
    var x22 := (x2 - x0) * ca - (y2 - y0) * sa + x0;
    var y22 := (x2 - x0) * sa + (y2 - y0) * ca + y0;
    
    var x33 := (x3 - x0) * ca - (y3 - y0) * sa + x0;
    var y33 := (x3 - x0) * sa + (y3 - y0) * ca + y0;
    
    Polygon(|new Point(x11, y11), new Point(x22, y22), new Point(x33, y33)|);
    Circle(x0, y0, 2, colors.Red);
  end);
end;

{Изобразить на экране прямоугольник, вращающийся вокруг своей середины.}
procedure task30(x_in, y_in, w, h: real);
begin
  var x1 := x_in;
  var y1 := y_in;
  var x2 := x1;
  var y2 := y1 + w;
  var x3 := x1 - h;
  var y3 := y1 + w;
  var x4 := x1 - h;
  var y4 := y1; 
  //центр прямоугольника
  var x0 := (x2 + x4) / 2;
  var y0 := (y2 + y4) / 2;
  //Формулы:
  //X' = (X - X0) * cos α - (Y - Y0) * sin α + X0
  //Y' = (X - X0) * sin α + (Y - Y0) * cos α + Y0
  var da := 0.1;
  var a := 0.0;
  BeginFrameBasedAnimation( () ->
  begin
    a += da;
    var (ca, sa) := (cos(a), sin(a));
    var x11 := (x1 - x0) * ca - (y1 - y0) * sa + x0;
    var y11 := (x1 - x0) * sa + (y1 - y0) * ca + y0;
    
    var x22 := (x2 - x0) * ca - (y2 - y0) * sa + x0;
    var y22 := (x2 - x0) * sa + (y2 - y0) * ca + y0;
    
    var x33 := (x3 - x0) * ca - (y3 - y0) * sa + x0;
    var y33 := (x3 - x0) * sa + (y3 - y0) * ca + y0;
    
    var x44 := (x4 - x0) * ca - (y4 - y0) * sa + x0;
    var y44 := (x4 - x0) * sa + (y4 - y0) * ca + y0; 
    
    Polygon(|new Point(x11, y11), new Point(x22, y22), new Point(x33, y33), new Point(x44, y44)|);
    Circle(x0, y0, 2, colors.Red);
  end);
end;


begin
//  task21(0, 0, 25, 4); //21
//  task22(300, 300, 200, colors.Red, 6); //22
//  otrezok(100, 100, 300, 400, colors.Red);
//  task23(100, 100, 100, 500, 500, 500, 500, 100, 40, colors.Blue);
//  task24_1(200, 500, 600, 500, 400, 153.5, 40, colors.Blue);
//  task24_2(500, 300, 362, 110, 138, 182, 138, 418, 362, 490, 40, colors.Red);
//  task24_3(500, 300, 400, 126, 200, 126, 100, 300, 200, 473, 400, 473, 40, colors.Blue);
//  task25(100, 300, 100);
//  task26(100, 300, 100);
//  task27_1(100, 100, 300, 300);
//  task27_2(100, 100, 300, 300);
//  task28(100, 600, 400, 500, 300, 500);
//  task29_1(300, 300, 400, 500, 100, 200);
//  task29_2(400, 300, 100, 200, 300, 400);
//  task30(300, 300, 200, 100);
  
  
end.