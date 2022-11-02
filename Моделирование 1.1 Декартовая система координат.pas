uses GraphWPF;

var
  Hu, Hv, rx, ry, Sx, Sy: real;

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
end;

procedure OutRes(x, y: real; c: Color);
begin
  var u := x * Sx + Hu;
  var v := -y * Sy + Hv;
  setpixel(u, v, c);
end;

procedure InitCoordinate();
begin
  var X := 0;
  var d := 1;
  while X < window.Width do
  begin
    setpixel(X, Hv, Colors.Black);
    X += d;
  end;
  
  var Y := 0;
  while Y < window.Height do
  begin
    setpixel(Hu, Y, Colors.Black);
    Y += d;
  end;
end;

begin
  //Задание 1 
  Init(1234, 4 * pi, 2);
  InitCoordinate();
  var dx := 10e-4;
  var x := -2 * pi;
  var y: real;
  while x < 2 * pi do
  begin
    y := sin(x);
    OutRes(x, y, colors.red);
    x += dx;
  end; 
    //Задание 2 
//    Init(1234);
  
  
end.