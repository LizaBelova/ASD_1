//Медиана
var
  arr: array[1..100] of integer;
  i, j, k, n, swap, t, max: integer;

begin
  randomize;
  write('Размерность массива: ');
  read(n);
  for i := 1 to n do arr[i] := random(5) + 1;
  write('Исходный массив:        ');
  for i := 1 to n do write(arr[i]:3);
  for i := 1 to n - 1 do
    for j := 1 to n - 1 do
      if(arr[j] > arr[j + 1]) then
      begin
        swap := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := swap;
      end;
  
  writeln;
  write('Отсортированный массив: ');
  for i := 1 to n do write(arr[i]:3);
  writeln;
  if(odd(n)) then write('Медиана: ', arr[(n div 2) + 1])
  else write('Медиана: ', (arr[n div 2] + arr[(n div 2) + 1]) / 2);
  t := 1;
  for i := 2 to n do
  begin
    if(arr[1] = arr[i]) then t := t + 1;
  end;
  max := t;
  t := 1;
  k := arr[1];
  for i := 2 to n do
  begin
    if(t > max) then
    begin
      max := t;
      k := arr[i];
    end;
    t := 1;
    for j := i + 1 to n do
      if(arr[i] = arr[j]) then t := t + 1;
  end;
  writeln;
  write('Часто встречающееся число: ', k);
end.