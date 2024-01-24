var
  n, x, i, number: integer;

begin
  write('¬ведите n: ');
  readln(n);
  i := 0;
  number := 30;
  while (i < n) do 
  begin
    x := number;
    if (x mod 30 = 0) then 
    begin
      x := x div 30;
      while (x mod 5 = 0) and (x > 0) do
        x := x div 5;
      while (x mod 3 = 0) and (x > 0) do
        x := x div 3;
      while (x mod 2 = 0) and (x > 0) do
        x := x div 2;
      if (x = 1) then begin
        i := i + 1;
        write(number, ' ');
      end;
    end;
    number := number + 1;
  end;
end.