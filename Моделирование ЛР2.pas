uses GraphWPF;

var
  Hu, Hv, rx, ry, Sx, Sy: real;

const
  EPS = 10e-3;

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
    Pen.Color := k mod nx > 0 ? colors.Gold : colors.DarkOrange; 
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
    Pen.Color := k mod ny > 0 ? colors.Gold : colors.DarkOrange; 
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


procedure Init(coord: integer; rrx, rry: real);
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

function GetRes(x, y: real): (real, real);
begin
  var u := x * Sx + Hu;
  var v := -y * Sy + Hv;
  result := (u, v);
end;

var
  fi13 := 3 * pi / 2;

procedure Draw13();
begin
  pen.Width := 3;
  Pen.Color := colors.Black;
  Circle(Window.Width / 2, Window.Height / 2, 110);
  var xsec, ysec, xmin, ymin, dfi: real;
  dfi := 10e-2;
  xsec :=  100 * cos(fi13);
  ysec :=  100 * sin(fi13);
  Pen.Color := colors.blue;
  pen.Width := 2;
  var n := 3 * pi / 2;
  line(Window.Width / 2, Window.Height / 2, 
       Window.Width / 2 + xsec, Window.Height / 2 + ysec);
  xmin :=  80 * cos((fi13 - n) / 60 + n);
  ymin :=  80 * sin((fi13 - n) / 60 + n);
  Pen.Color := colors.red;
  pen.Width := 4;
  line(Window.Width / 2, Window.Height / 2, 
       Window.Width / 2 + xmin, Window.Height / 2 + ymin);
  fi13 += dfi;
  var sec := round(30 * (fi13 - n) / pi);
  var min := (sec div 60) mod 60;
  var s1 := 'секунды:' + (sec mod 60).ToString;
  var s2 := 'минуты:' + min.ToString;
  TextOut(100, 100, s1);
  TextOut(100, 120, s2);
  
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
    //            Init(1234, 20, 20);
    //            var x, y, p, fi, kfi, dfi, a, b, c, d, k:real;
    //            kfi := 2 * pi;
    //            dfi := 10e-5;
    //            (a,b,c,d,k) :=
    //            (4,2,6,2,10);
    //            while fi < kfi do
    //            begin
    //              p := a + b * cos(k*fi) + c * (cos(k*fi) ** 2) + d * (cos(k*fi) ** 4);
    //              x := p * cos(fi);
    //              y := p * sin(fi);
    //              OutRes(x, y, colors.Red);
    //              fi += dfi;
    //            end; 
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
  
              //Задание 12-13
      //  Init(1234, 3, 3);
      //  BeginFrameBasedAnimation(Draw13);
                //Задание 14
      //          Init(1234, 10, 10);
      //          var A := ArrGEn(10, i -> random(1,5));
      //          var cnt := A.Length;
      //          var sum := A.Sum;
      //          var B := ArrFill(cnt, 0.0);
      //          for var i := 1 to cnt - 1 do
//            B[i] := A[i-1] / sum * 360 + B[i-1];
//          var (u,v) := getres(0,0);
      //          for var i := 1 to cnt - 1 do
//            Sector(u,v,200, B[i], B[i-1], RandomColor);
//          Sector(u,v,200, 360, B[cnt - 1], RandomColor);
                //Задание 15
    //  Init(1234, 10, 10);
    //  var A := Arr(1, 3, 1, 1, 2, 6);
    //  var cnt := A.Length;
    //  var sum := A.Sum;
    //  var B := ArrFill(cnt, 0.0);
    //  for var i := 1 to cnt - 1 do
    //    B[i] := A[i - 1] / sum * 360 + B[i - 1];
    //  var (u, v) := getres(0, 0);
    //  var m := A.IndexMax;
    //  for var i := 1 to cnt - 1 do
    //    if m + 1 <> i then
    //      Sector(u, v, 200, B[i], B[i - 1], RandomColor)
    //            else
    //    begin
    //      var fi15 := ((B[i] + B[i - 1]) / 2) / 180 * pi;
    //      var (u1, v1) := GetRes(0 + cos(fi15), 0 + sin(fi15));
    //      Sector(u1, v1, 200, B[i], B[i - 1], RandomColor);
    //    end;
    //  if m <> cnt - 1 then  
    //    Sector(u, v, 200, 360, B[cnt - 1], RandomColor)
    //          else
    //  begin
    //    var fi15 := ((360 + B[cnt - 1]) / 2) / 180 * pi;
    //    var (u1, v1) := GetRes(0 + cos(fi15), 0 + sin(fi15));
    //    Sector(u1, v1, 200, 360, B[cnt - 1], RandomColor);
    //  end;
        //Задание 16
    //    var A := ArrGen(5,i -> random(1,10));
    //    Init(1, 2 * A.Length-1, 10);
    //    var sum := A.Sum;
    //    for var i := 0 to A.High do
//    begin
//      var (x, y) := (2 * i,0);
//      var (u,v) := GetRes(x,y);
    //      FillRectangle(u,v,sx,-sy * (A[i] / sum) * 10,RandomColor);
    //    end;
  
          //ЛР2 
        //Задание 1 - решить аналитически уравнение Фурье
        //dT = -r(T(t) - Tc)*dt
  
        //Задание 2
    //    Init(1, 15, 10);
    //    var time, kt, dt, Tc, Tnow, r : real;
    //    time := 0;
    //    kt := 15;
    //    dt := 10e-5;
    //    Tc := 22;
    //    Tnow := 95;
    //    r := 1;
    //    while time < kt do
//    begin
//      Tnow := -r * (Tnow - Tc)* dt + Tnow;
    //      OutRes(time, Tnow /10, colors.Red);
    //      time += dt;
    //    end;
        //Задание 3
    //    Init(1, 10, 10);
    //    var time, kt, dt, Tc, Tnow, r : real;
    //    time := 0;
    //    kt := 10;
    //    dt := 10e-4;
    //    Tc := 22;
    //    Tnow := 95;
    //    r := 1;
    //    while time < kt do
//    begin
//      Tnow := -r * (Tnow - Tc)* dt + Tnow;
    //      OutRes(time, Tnow /10, colors.Red);
    //      OutRes(time, Tc / 10, colors.Blue);
    //      time += dt;
    //    end;
        //Задание 4
  //  Init(1, 15, 10);
  //  var A := Arr((0, 83.0), (1, 77.7), (2, 75.1), (3, 73.0), (4, 71.1), (5, 69.4), (6, 67.8),
  //    (7, 66.4), (8, 64.7), (9, 63.4), (10, 62.1), (11, 61.0), (12, 59.9), (13, 58.7), (14, 57.8), (15, 56.6));
  //  for var i := 0 to A.High do
  //  begin
  //    var (u1, v1) := getres(A[i].Item1, A[i].Item2/10 );
  //    Circle(u1, v1, 5);
  //  end;
  //  var time, kt, dt, Tc, Tnow, r: real;
  //  time := 0;
  //  kt := 15;
  //  dt := 10e-3;
  //  Tc := 22;
  //  Tnow := 83;
  //  
  //  r := 0.039;
  //
//  while time < kt do
  //  begin
  //    Tnow := -r * (Tnow - Tc) * dt + Tnow;
  //    OutRes(time, Tnow/10 , RandomColor);
  //    time += dt;
  //  end;
  //Задание 5
  Init(1, 10, 10);
  var time, kt, dt, Tc, Tnow1, Tnow2, r: real;
  time := 0;
  kt := 10;
  dt := 10e-3;
  Tc := 20;
  Tnow1 := 90;
  Tnow2 := 85;
  r := 0.039;
  var t1, t2: real;
  
  while time < kt do
  begin
    if Tnow1 > 69.95 then begin
      Tnow1 := -r * (Tnow1 - Tc) * dt + Tnow1; // долить на 75 и станет 70
      if Abs(Tnow1 - 75) < EPS then
      begin
        Tnow1 := 70; 
        var s1 := 'Время при первом варианте (в усл. ед.):' + time.ToString;
        TextOut(0, 0, s1);
      end;
      OutRes(time, Tnow1 / 10, Colors.Red);  end;
    if Tnow2 > 69.95 then begin
      Tnow2 := -r * (Tnow2 - Tc) * dt + Tnow2; // налили молока сразу
      OutRes(time, Tnow2 / 10, Colors.Blue);
      time += dt; end
    else begin
      var s2 := 'Время при втором варианте (в усл. ед.):' + time.ToString;
      TextOut(0, 20, s2); break; end;
  end;  


  
end.