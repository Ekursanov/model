//2.	Установить начало координат в центре экрана, изобразить оси и подписать их.
//Провести отрезок от начала координат до точки с координатами (300,100). 
//Для построения отрезка использовать алгоритм Брезенхема и метод ЦДА.
uses GraphABC;

procedure LineBR(x1, y1, x2, y2: integer);
var dx, dy, d, d1, d2, x, y, stp: integer;

begin
  dx:=x2-x1;
  dy:=y2-y1;
  if ((Abs(dx)>Abs(dy)) and (x2<x1)) or ((Abs(dx)<=Abs(dy)) and (y2<y1)) then
    begin
      x:=x1; 
      x1:=x2;
      x2:=x;
      y:=y1;
      y1:=y2;
      y2:=y;
    end;
    
    dx:=x2-x1;
    dy:=y2-y1;
    stp:=1;
    
    PutPixel(x1, y1, clBlack);
    
    if (Abs(dx)>Abs(dy)) then
    begin
      if (dy<0) then
      begin
        stp:=-1;
        dy:= -dy;
      end;
      
      d:=2*dy-dx;
      d1:=2*dy;
      d2:=2*dy-dx;
      y:=y1;
      
      for x:=(x1+1) to x2 do
      begin
        if (d>0) then
        begin
          y:=y+stp;
          d:=d+d2;
        end
        else
          d:=d+d1;
          PutPixel(x, y, clRed);
        end;
      end else
        begin
          if (dx<0) then
          begin
            stp:=-1;
            dx:=-dx;
          end;
          
          d:=2*dx-dy;
          d1:=2*dx;
          d2:=2*(dx-dy);
          x:=x1;
          
          for y:=y1+1 to y2 do 
          begin
            if (d>0) then
            begin
               x:=x+stp;
               d:=d+d2
            end else
              d:=d+d1;
          end;
    end;
end;


procedure ZDA(x1,y1, x2, y2: integer);
var dx, dy, x, y: real;
begin
  var dlina:=Max(Abs(x2-x1), Abs(y2-y1));
  dy:=(y2-y1)/dlina;
  dx:=(x2-x1)/dlina;
  
  x:=x1+0.5*Sign(dx);
  y:=y1+0.5*Sign(dy);
  

  
  setpixel(Round(x).ToString.ToInteger,Round(y).ToString.ToInteger, Color.Green);
  
  var i:=0;
  while (i<=dlina) do
  begin
    x:=x+dx;
    y:=y+dy;
    setpixel(Round(x).ToString.ToInteger,Round(y).ToString.ToInteger, Color.Green);
    i:=i+1;
  end;
end;



begin
        
        SetCoordinateAngle(-60);
        SetCoordinateOrigin(Window.Center.X,Window.Center.Y); 
        LineBR(0, 0, 300, 100);
        //Line(0,0,300,100);
        SetCoordinateAngle(0);
        Line(0,-Window.Height,0,Window.Height);
        Line(-Window.Width, 0,Window.Width, 0);
        TextOut(6,-200, 'y');
        TextOut(300,2, 'x');
      
SetCoordinateAngle(-60);
  ZDA(0, 0, 300, 100);
  
  
end.