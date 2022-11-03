uses GraphWPF;

var
  Hu, Hv, rx, ry, Sx, Sy: real;


procedure Grid(dx, dy: real);
begin
  var (du, dv) := (dx * Sx, dy * Sy); // Шаг сетки по осям
  var (nx, ny) := (round(1 / dx), round(1 / dy));
  Pen.Color := colors.Gold;
  Pen.Width := 1;
  //Вертикальные линии сетки
  var u := Hu; //Начинаем от оси OY...
  var k := 1;  //... и смещаемся влево и вправо на (k * du)
  while (u + k * du).InRange(0, Window.Width) or
        (u - k * du).InRange(0, Window.Width) do
  begin 
    Pen.Color := k mod nx > 0? colors.Gold: colors.DarkOrange ; 
    line(u + k * du, 0, u + k * du, Window.Height);
    line(u - k * du, 0, u - k * du, Window.Height);
    k += 1;
  end;
  //Горизонтальные линии сетки
  var v := Hv; //Начинаем от оси OX...
  k := 1;      //... и смещаемся вверх и вниз на (k * dv)
  while (v + k * dv).InRange(0, Window.Height) or 
        (v - k * dv).InRange(0, Window.Height) do
  begin
    Pen.Color := k mod ny > 0? colors.Gold: colors.DarkOrange ; 
    line(0, v + k * dv, Window.Width, v + k * dv);
    line(0, v - k * dv, Window.Width, v - k * dv);
    k += 1;
  end;
end;
  
procedure Axes;
begin
  Grid(0.1, 0.1); // Сетка с шагом 1 по осям
  Pen.Width := 2; // Толщина пера = 2 пиксела
  line(0, Hv, Window.Width, Hv, colors.Gray);  // OX
  line(Hu, 0, Hu, Window.Height, colors.Gray); // OY
end;


procedure Init(coord: integer; rrx, rry : real);
///четверти, rx, ry
begin
  rx := rrx;
  ry := rry;
  
  case coord of
    1: (Hu, Hv) := (1, Window.Height - 2);
    
    3: (Hu, Hv) := (Window.Width - 2, 2);
    
    4: (Hu, Hv) := (2, 2);
    
    14: (Hu, Hv) := (2, Window.Height / 2); 
    
    34: (Hu, Hv) := (Window.Width / 2, 2); 
     
    1234: (Hu, Hv) := (Window.Width / 2, Window.Height / 2); 
     
  end;
  
  Sx := Window.Width / rx;
  Sy := Window.Height / ry;
  
  Axes;
end;

procedure OutRes(x, y: real; c: Color);
begin
  var u := x * Sx + Hu;
  var v := -y * Sy + Hv;
  setpixel(u, v, c);
end;
var fi := 3 * pi / 2;
procedure Draw13 ();
begin
          
          var x, y, p, kfi, dfi:real;
          dfi := 10e-4;
//          fi := pi / 2;
          kfi := 4 * pi;
          
            x :=  100 * cos(fi);
            y :=  100 * sin(fi);
            line(100, 100, 100 + x, 100 +y);
//            OutRes(x, y, Colors.Red);
            fi += dfi;
            TextOut(100,100, fi.ToString);
           
end;

begin
  //Задание 1 
//  Init(1234, 4 * pi, 2);
//  var dx := 10e-4;
//  var x := -2 * pi;
//  var y: real;
//  while x < 2 * pi do
//  begin
//    y := sin(x);
//    OutRes(x, y, colors.red);
//    x += dx;
//  end; 
    //Задание 2 
//    Init(1234, 20, 20);
//    var dx := 10e-4;
//    var x :=  -10.0;
//    var y1, y2 : real;
//    while x < 10 do
//    begin
//      y1 := tan(x);
//      OutRes(x, y1, Colors.Red);
//      y2 := 1 / x;
//      OutRes(x, y2, Colors.Green);
//      x += dx;
//    end;
    //Задание 3
//    Init(1234, 20, 20);
    
    
    //1.2 Функции,заданнные параметрически
    //Задание 4
//    Init(1234, 5, 5);
//    var x, y, t :real;
//    t := 0;
//    var dt := 10e-4;
//    var kd := 2 * pi;
//    while t < kd do
//    begin
//      x := sin(t) ** 3;
//      y := cos(t) ** 3;
//      OutRes(x,y,Colors.Red);
//      t += dt;
//    end;
    //Задание 5
//      Init(1234, 5, 5);
//      var x, k, t, d, y, n :real;
//      (x, k, t, d, n) := 
//      (0, 11, 0, -1, 2);
//      
//      var kd := 100;
//      var dt := 10e-4;
//      while t < kd do
//      begin
//        x := cos(k*t) + d;
//        y := sin(n*t);
//        OutRes(x, y, colors.Red);
//        t += dt;
//      end;
    //Задание 6
//      Init(1234, 10, 10);
//      var x, t, y :real;
//      t := 0;
//      
//      var kt := 12*pi;
//      var dt := 10e-4;
//      while t < kt do
//      begin
//        x := sin(t)*(power(E,cos(t)) - 2*cos(4*t) + sin(t / 12) ** 5);
//        y := cos(t)*(power(E,cos(t)) - 2*cos(4*t) + sin(t / 12) ** 5);
//        OutRes(x, y, colors.Red);
//        t += dt;
//      end;    
      //1.3 Полярная система координат
        //Задание 7
//        Init(1234, 50, 50);
//        var x, y, p, fi, kfi, dfi:real;
//        kfi := 30;
//        dfi := 10e-4;
//        
//        while fi < kfi do
//        begin
//          p := fi;
//          x := p * cos(fi);
//          y := p * sin(fi);
//          OutRes(x, y, colors.Red);
//          fi += dfi;
//        end;

        //Задание 8
//        Init(1234, 5, 5);
//        var x, y, p, fi, kfi, dfi, k, n:real;
//        kfi := 30;
//        dfi := 10e-4;
//        k := 19; n := 2;
//        while fi < kfi do
//        begin
//          p := sin(k * fi / n);
//          x := p * cos(fi);
//          y := p * sin(fi);
//          OutRes(x, y, colors.Red);
//          fi += dfi;
//        end;    
           //Задание 9
//        Init(1234, 5, 5);
//        var x, y, p, fi, kfi, dfi, a, b, k:real;
//        kfi := 2 * pi;
//        dfi := 10e-4;
//        a := 0.5; b := 2; k := 7;
//        while fi < kfi do
//        begin
//          p := a + b * cos(k * fi);
//          x := p * cos(fi);
//          y := p * sin(fi);
//          OutRes(x, y, colors.Red);
//          fi += dfi;
//        end; 
            //Задание 10
//        Init(1234, 20, 20);
//        var x, y, p, fi, kfi, dfi, a, b, c, d, k:real;
//        kfi := 2 * pi;
//        dfi := 10e-5;
//        (a,b,c,d,k) :=
//        (4,2,6,2,10);
//        while fi < kfi do
//        begin
//          p := a + b * cos(k*fi) + c * (cos(k*fi) ** 2) + d * (cos(k*fi) ** 4);
//          x := p * cos(fi);
//          y := p * sin(fi);
//          OutRes(x, y, colors.Red);
//          fi += dfi;
//        end; 
            //Задание 11
//        Init(1234, 20, 20);
//        var x, y, p, fi, kfi, dfi, a, b, c, d, k:real;
//        kfi := 2 * pi;
//        dfi := 10e-5;
//        (a,b,c,d,k) :=
//        (2,5,5,3,7);
//        while fi < kfi do
//        begin
//          p := a + b * cos(k*fi) + c * (sin(k*fi) ** 2) + d * (sin(k*fi) ** 4);
//          x := p * cos(fi);
//          y := p * sin(fi);
//          OutRes(x, y, colors.Red);
//          fi += dfi;
//        end;    
            //Задание 12
           
//          Init(1234, 3, 3);
//          var x, y, p, fi, kfi, dfi:real;
//          dfi := 10e-5;
//          fi := pi / 2;
//          kfi := 4 * pi;
//          while fi < kfi do
//          begin
//            x := cos(fi);
//            y := sin(fi);
//            OutRes(x, y, Colors.Red);
//            fi -= dfi;
//           
//          end;
            Init(1234, 3, 3);
          BeginFrameBasedAnimation(Draw13);
          
          
end.