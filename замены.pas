const
  n = 10; 
  k1 = 10; 
  k2 = 2 * k1 + 1;

type
  vec = array[1..n] of integer;

var
  a, b, c: vec;
  k, i, j, f, m: integer;

begin
  randomize;
  write('Исходый массив:         ');
  for i := 1 to n do
  begin
    f := random(k2);
    a[i] := k1 - f;
    write(a[i]:3);
  end;
  writeln;
  b := a;
  for k := 1 to n do
  begin
    m := 100;
    for i := 1 to n do
      if m > b[i] then
      begin
        m := b[i];
        j := i;
      end;
    b[j] := 100; 
    c[k] := m;
  end;
  write('Отсортированный массив: ');
  for i := 1 to n do write(c[i]:3);
end.