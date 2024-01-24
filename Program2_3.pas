//heap sort
type
  TArray = array [1..10] of integer;
//процедура для перессылки записей
procedure swap(var x, y: integer);
var
  temp: integer;
begin
  temp := x;
  x := y;
  y := temp;
end;

//процедура приведения массива к пирамидальному виду
procedure toPyr(var data: TArray; n: integer);
var
  i: integer;
begin
  for i := n div 2 downto 1 do 
  begin
    if 2 * i <= n then if data[i] < data[2 * i] then swap(data[i], data[2 * i]);
    if 2 * i + 1 <= n then if data[i] < data[2 * i + 1] then swap(data[i], data[2 * i + 1]);
  end;
end;

//процедура для сдвига массива влево
procedure left(var data: TArray; n: integer);
var
  i: integer;
  temp: integer;
begin
  temp := data[1];
  for i := 1 to n - 1 do
    data[i] := data[i + 1];
  data[n] := temp;
end;

//основная программа
var
  a: TArray;
  i, n: integer;

begin
  n := 10;
  randomize;
  for i := 1 to n do 
  begin
    a[i] := random(500);
    write(a[i]:4);
  end;
  for i := n downto 1 do 
  begin
    topyr(a, i);
    left(a, n);
  end;
  writeln();
  write('Отсортированный массив: ');
  for i := 1 to n do 
  begin
    write(a[i]:4);
  end;
end.