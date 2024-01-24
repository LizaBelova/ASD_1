//Алгоритм Хоара
const
  n = 10;

var
  x: array[1..n] of integer;
  i: integer;

procedure Qsort(l, r: integer);
var
  i, j, x1, y1, m: integer;
begin
  i := l;
  j := r;
  m := round((l + r) / 2);   
  x1 := x[m];
  repeat
    while x[i] < x1 do inc(i);//пока левый больше среднего, подвигоем левый край вправо
    while x[j] > x1 do dec(j);//пока правый меньше среднего, подвигаем левый вправо
    if i <= j then            //если левый и правый срослись
    begin
      y1 := x[i];
      x[i] := x[j];           //меняем левый и правый концы
      x[j] := y1;
      inc(i);                 //левый вправо
      dec(j);                 //правый влево
    end;
  until i > j;                //конец одной перестановки
  if l < j then Qsort(l, j);  //рекурсивно сортируем
  if i < r then Qsort(i, r);  //или левую или правую части
end;

begin
  randomize;
  write('Исходный массив:        ');
  for i := 1 to n do
  begin
    x[i] := random(256) - 100;
    write(x[i]:4);
  end;
  writeln;
  Qsort(1, n);
  write('Отсортированный массив: ');
  for i := 1 to n do
    write(x[i]:4);
end.