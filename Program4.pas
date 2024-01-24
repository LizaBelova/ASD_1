//Сортировка Шелла
type
  arr = array[1..100] of integer;

var
  i, j, n, d, count: integer;
  A: arr;

procedure Shell(A: arr; n, i: integer);
begin
  d := n;
  d := d div 2;
  while (d > 0) do
  begin
    for i := 1 to n - d do
    begin
      j := i;
      while ((j > 0) and (A[j] > A[j + d])) do
      begin
        count := A[j];
        A[j] := A[j + d];
        A[j + d] := count;
        j := j - 1;
      end;
    end;
    d := d div 2;
  end;
  writeln;
  for i := 1 to n do write(' ', A[i]);
end;

begin
  write('Размерность массива: '); 
  read(n);
  write('Исходный массива: ');
  for i := 1 to n do
  begin
    A[i] := random(256) - 100;
    write(A[i]:4); 
  end;
  writeln;
  write('Отсортированный массив: ');
  Shell(A, n, i);
end.