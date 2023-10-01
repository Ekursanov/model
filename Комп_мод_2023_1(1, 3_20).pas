

uses GraphWPF, Controls;
{1 Нарисовать N концентрических окружностей, то есть окружностей разного 
радиуса, но имеющих общий центр («круги на воде»). Значение N задаётся 
генератором случайных чисел (от 20 до 100).}
procedure CircleOnWater(n: integer) := 
for var i := 1 to n do drawcircle(Window.Center, random(17, 20) * i, clRandom);

{3 Изобразить N случайных разноцветных лучей, исходящих из центра экрана. 
Использовать массив для координат концов отрезков. Значение N задаётся 
генератором случайных чисел (от 20 до 50).}
procedure LineOnCenter;
begin
  var n := random(20, 50);
  var p := Window.Center;
  var massiv := arrgen(n, i -> (random(0, 800), random(0, 1000)));
  for var i := 0 to n - 1 do
    line(p.X, p.Y, massiv[i].item1, massiv[i].item2, RandomColor);
  
end;

{4 Нарисовать горизонтальный ряд окружностей радиусом 15 на расстоянии 100 от 
верхнего края экрана и с такими горизонтальными координатами центров: 50, 80, 
110, 140, …, 320. Раскрасить круги случайным цветом.}
procedure CircleOnLine := for var i := 0 to 9 do circle(50 + 30 * i, 115, 15, clRandom);
{5 Воспроизвести изображение (8 кругов вдоль диагонали экрана, выбор цвета — 
случайный). Дополнительно изобразить отрезком диагональ экрана.}
procedure CircleOnDiag;
begin
  for var i := 0 to 8 do
    circle(80 * i, 60 * i, 12 * i, clRandom);
  line(0, 0, Window.Width, Window.Height);
end;
{6 Расположить одинаковые перекрывающиеся прямоугольники вдоль диагонали 
экрана. Дополнительно изобразить отрезком диагональ экрана.}
procedure RectOnDiag;
begin
  for var i := 0 to 18 do
    Rectangle(40 * i, 30 * i, 80, 60, RandomColor);
  line(0, 0, Window.Width, Window.Height);
end;
{7. Нарисовать 15 вложенных друг в друга разноцветных квадратов. На каждом шаге 
цикла рисуется одинквадрат, причем цвет его заливки меняется в зависимости от 
номера шага. Вид полученной при этом композиции представлен на рисунке:}
procedure RectOnRect;
begin
  Rectangle(0, 0, Window.Width, Window.Height, ARGB(100, 0, 0, 255));
  for var i := 0 to 14 do
    Rectangle(250 + 10 * i, 150 + 10 * i, 300 - 20 * i, 300 - 20 * i, RandomColor);
end;
{8.Воспроизвести следующие изображения:}
procedure Izobr(n: integer);
begin
  var r := 100;
  if n = 1 then
  begin
    Rectangle(0, 0, 3000, 3000, Colors.Aqua);
    for var x := 0 to 10 do
      for var y := 0 to 10 do
        DrawCircle(83 * x, 83 * y, r, Colors.Blue);
  end;
  if n = 2 then
  begin
    Pen.Width := 0;
    for var x := 0 to 10 do
      for var y := 0 to 10 do
        Circle(83 * x, 83 * y, r, RandomColor);
  end;
  if n = 3 then
  begin
    Pen.Width := 0;
    for var x := 0 to 10 do
      for var y := 0 to 10 do
        Circle(83 * x, 83 * y, r, y mod 2 = 0 ? Colors.blue : colors.Aqua);
  end;
end;
  {Построить окружность, проходящую через определённую точку плоскости. 
Координаты этой точки и центра окружности задаются генератором случайных 
чисел.}
procedure RandCircle();
begin
  var (x, y) := (random(50, 400), random(50, 500));
  var r := random(50, 150);
  drawCircle(x, y, r, RandomColor);
end;
  {Центр окружности совпадает с центром экрана, а радиус задан 
генератором случайных чисел. Провести хорду окружности, 
концы которой определяются углами наклона радиуса к 
горизонтали a и b (в градусах).}
procedure SectorCircle();
begin
    // 1 окружность
  Pen.Width += 1;
  var r := random(100, 150);
  var (x, y) := (Window.Center.X, Window.Center.Y);
  DrawCircle(x, y, r);
  
      // 2 кнопки
  
  TextOut(60, 50, 'a');
  TextOut(60, 78, 'b');
  
  var alfa := new TextBoxWPF(70, 50, '');
  alfa.Height := 20;
  alfa.Width := 60;
  alfa.Text := '';
  
  var beta := new TextBoxWPF(70, 75, '');
  beta.Height := 20;
  beta.Width := 60;
  beta.Text := ''; 
  var ans := Button(50, 100, 'Провести хорду');
  
  var left, right, lx, ly, rx, ry: real;
  
  ans.Click := procedure -> 
  begin
    Window.Clear;
    pen.Color := colors.Black;
    TextOut(60, 50, 'a');
    TextOut(60, 78, 'b');  
    DrawCircle(x, y, r); 
    drawCircle(x, y, 1, Colors.Red);
    left := DegToRad(alfa.Text.joinToString.ToInteger mod 360);
    right := DegToRad(beta.Text.ToString.ToInteger mod 360);
    lx := x + cos(left) * r;
    ly := y - sin(left) * r;
    line(x, y, lx, ly);
    rx := x + cos(right) * r;
    ry := y - sin(right) * r;
    line(x, y, rx, ry);
    Pen.Color := colors.Red;
    line(lx, ly, rx, ry);
  end;
end;
 {Построить прямоугольный треугольник по координатам вершины прямого угла, 
длинам катетов и углу наклона одного из катетов к горизонтали.}
procedure Triang(x, y, kat1, kat2, alf: integer);
begin
  var A := DegToRad(alf);
  var x1 := x + cos(A) * kat1;
  var y1 := y - sin(A) * kat1;
  var B := DegToRad(alf + 90);
  var x2 := x + cos(B) * kat2;
  var y2 := y - sin(B) * kat2;   
  Polygon(arr(new Point(x, y), new Point(x1, y1), new Point(x2, y2)));
end;
{Генератором случайных чисел заданы координаты концов отрезка. Через один из 
концов отрезка провести перпендикуляр определённой длины (например, l=100).}
procedure normal(l: integer);
begin
  var (x1, y1, x2, y2) := (random(100, 300), random(100, 300), random(300, 600), random(300, 600));
  line(x1, y1, x2, y2);
  var dy := abs(y2 - y1);
  var dx := abs(x2 - x1);
  var A := arctan(dx / dy);
  
  var x3 := x2 +  100 * cos(A);
  var y3 := y2 -  100 * sin(A);
  line(x2, y2, x3, y3);
end;
{Генератором случайных чисел заданы координаты трёх вершин параллелограмма. 
Построить этот параллелограмм.}
procedure Parall();
begin
  var (x1, y1, x2, y2, x3, y3) := (random(100, 300), random(300, 500), random(300, 400), random(100, 300), random(500, 700), random(100, 300));
  line(x1, y1, x2, y2);
  line(x2, y2, x3, y3);
  var dx := x3 - x2;
  var dy := y3 - y2;
  line(x1, y1, x1 + dx, y1 + dy);
  line(x3, y3, x1 + dx, y1 + dy);
end;

{Построить прямую (в границах экрана), проходящую через две точки плоскости. 
Координаты точек задаются генератором случайных чисел.}
procedure lin_ab(x1, y1, x2, y2: real; vis: integer := 1);
begin
  Circle(x1, y1, 2, colors.Red);
  if vis = 1 then
    Circle(x2, y2, 2, colors.Red);
  var a := x1 - x2;
  var b := y1 - y2;
  var y3 := y2 - b / a * x2;
  //  Circle(0,y3,2,colors.Red);
  Line(x2, y2, 0, y3);
  var x4 := x1 - a / b * y1;
  //  Circle(x4,0,2,colors.Red);
  line(x2, y2, x4, 0);
end;

{Координаты трёх точек задаются генератором случайных чисел. Две точки 
определяют отрезок. Построить прямую, проходящую через третью точку и 
параллельную отрезку.}
procedure parallAB(x1, y1, x2, y2, px1, py1: real);
begin
  Circle(x1, y1, 2, colors.Red);
  Circle(x2, y2, 2, colors.Red);
  Circle(px1, py1, 2, colors.Red);
  var a := x1 - x2;
  var b := y1 - y2;
  var y3 := y2 - b / a * x2;
  var x4 := x1 - a / b * y1;
  line(0, y3, x4, 0);
  lin_ab(px1, py1, px1 - a, py1 - b, 0);
end;

{Координаты трёх точек задаются генератором случайных чисел. Построить 
прямую, проходящую через две точки, а так же прямую, проходящую через третью 
точку и перпендикулярную первой прямой.}
procedure normalline(x1, y1, x2, y2, px1, py1: real);
begin
  lin_ab(x1, y1, x2, y2);
  var dy := abs(y2 - y1);
  var dx := abs(x2 - x1);
  lin_ab(px1, py1, px1 + 3 * dy, py1 + 3 * dx, 0);
end;

procedure piramid(n: integer);
begin
  var m := 2 * n + 1;
  var size := Window.Width / m;
  for var j := 0 to n do
    for var i := 0 to m do
      if (abs(m - i) > j) and (i + 1 > j) then
        DrawRectangle(i * size, Window.Height - j * size, size, size);
end;

procedure spir();
begin
  var n := 100;
  var x, y, r: real;
  r := 0.01;
  while r < n do
  begin
    x := cos(r) * r;
    y := sin(r) * r;
    SetPixel(Window.Center.X + x, Window.Center.Y + y, colors.Black);
    r += 0.01;
  end;
end;

procedure zvezda(x, y, r: real; c: color; n: integer);
begin
//  circle(x,y,r);
  pen.Width += 1;
  var a := ArrGen(n, i -> (x + cos(pi * 2 / n * i) * r, y - sin(pi * 2 / n * i) * r));
  println(a);
  var b := ArrGen(n, i -> (x + cos((pi * 2 / n * i + pi * 2 / n * (i + 1)) / 2) * (r / 2),
  y - sin((pi * 2 / n * i + pi * 2 / n * (i + 1)) / 2)  * (r / 2)));
  println(b);
  for var i := 0 to n - 1 do
  begin
    line(a[i].Item1, a[i].Item2, b[i].Item1, b[i].Item2, c);
    line(a[(i + 1) mod n].Item1, a[(i + 1) mod n].Item2, b[i].Item1, b[i].Item2, c);
  end;
end;

procedure ravntreang();
begin
  var x, y, r: real;
  x := 600;
  y := 200;
  r := 50;
  var step := 1;
  foreach var cnt in |3, 4, 3, 2| do
  begin
    var a1 := ArrGen(cnt, i -> ((x + r * i - cnt * r / 2),  y + (step) * sqrt(3) / 2 * r));
    var a2 := ArrGen(cnt + 1, i -> ((x + r * i - (cnt + 1) * r / 2), y + (step + 1) * sqrt(3) / 2 * r));
    step += 1;
    //построение тут нужен cnt
    line(a1[0].Item1, a1[0].Item2, a1[cnt - 1].Item1, a1[cnt - 1].Item2);
    line(a2[0].Item1, a2[0].Item2, a2[cnt].Item1, a2[cnt].Item2);
    for var i := 0 to cnt - 1 do
    begin
      line(a1[i].Item1, a1[i].Item2, a2[i].Item1, a2[i].Item2);
      line(a1[i].Item1, a1[i].Item2, a2[i + 1].Item1, a2[i + 1].Item2);
    end;
    if step < 5 then
    begin
      line(x  - (cnt + 1)      * r / 2,  y + step       * sqrt(3) / 2 * r,
               x  - cnt     * r / 2, y + (step + 1) * sqrt(3) / 2 * r);
      line(x  - (step  + 2 * (4 - step) - 2 * cnt)      * r / 2,  y + step       * sqrt(3) / 2 * r,
           x  - (step  + 2 * (4 - step) + 1  - 2 * cnt)     * r / 2, y + (step + 1) * sqrt(3) / 2 * r);
    end;
  end; 
  x := 200;
  y := 200;
  step := 1;
  foreach var cnt in |1, 2, 3| do
  begin
    var a1 := ArrGen(cnt, i -> ((x + r * i - cnt * r / 2),  y + (step) * sqrt(3) / 2 * r));
    var a2 := ArrGen(cnt + 1, i -> ((x + r * i - (cnt + 1) * r / 2), y + (step + 1) * sqrt(3) / 2 * r));
    step += 1;
    //построение тут нужен cnt
    line(a1[0].Item1, a1[0].Item2, a1[cnt - 1].Item1, a1[cnt - 1].Item2);
    line(a2[0].Item1, a2[0].Item2, a2[cnt].Item1, a2[cnt].Item2);
    for var i := 0 to cnt - 1 do
    begin
      line(a1[i].Item1, a1[i].Item2, a2[i].Item1, a2[i].Item2);
      line(a1[i].Item1, a1[i].Item2, a2[i + 1].Item1, a2[i + 1].Item2);
    end;
    if step = 2 then
    begin
      line(x - (step + 2) * r / 2, y + (step + 0) * sqrt(3) / 2 * r,
           x - (step + 1) * r / 2, y + (step + 1) * sqrt(3) / 2 * r);
      line(x - (step + 2) * r / 2, y + (step + 0) * sqrt(3) / 2 * r,
           x - (step - 1) * r / 2, y + (step + 0) * sqrt(3) / 2 * r);
      line(x - (step + -4) * r / 2, y + (step + 0) * sqrt(3) / 2 * r,
           x - (step + -3) * r / 2, y + (step + 1) * sqrt(3) / 2 * r);
      line(x - (step + -4) * r / 2, y + (step + 0) * sqrt(3) / 2 * r,
           x - (step + -2) * r / 2, y + (step + 0) * sqrt(3) / 2 * r);
    end;
    if step = 3 then
  Polygon(arr(new Point(a2[0].Item1 + r/2, a2[0].Item2 + sqrt(3) / 2 * r), 
              new Point(a2[1].Item1 + r/2, a2[1].Item2 + sqrt(3) / 2 * r),
              new Point(a2[0].Item1 + 2 *r/2, a2[0].Item2 + 2 *sqrt(3) / 2 * r)));
    
  end;
end;





begin
      //CircleOnWater(random(5,12)); //1
      //  LineOnCenter; //3
      //CircleOnLine; //4
      //CircleOnDiag;//5
      //RectOnDiag; //6
      //RectOnRect; //7
      //  Izobr(3);  //8
      //  RandCircle(); //9
      //  SectorCircle();  //10
      //  Triang(300, 300, 150, 220, 30); //11
      //  normal(100); //12
      //  Parall(); //13
      //    lin_ab(random(100, 300), random(300, 500), random(300, 400), random(100, 300)); //14
      //  parallAB(random(100, 300), random(300, 500), random(300, 400), random(100, 300), random(250, 500), random(250, 500)); //15
      //  normalline(random(100, 300), random(300, 500), random(300, 400), random(100, 300), random(250, 500), random(250, 500)); // 16
      //  piramid(5); //17
    //  spir(); //18
  //  zvezda(window.Center.x, window.Center.y, 100, colors.Red, 8); //19
  ravntreang(); //20
end.
