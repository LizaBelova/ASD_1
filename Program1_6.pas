//Вычисление числа Фибоначчи

var
  fib0, fib1, fib: integer;
             i, n: byte;

begin
  write('Номер числа: ');
  readln(n);
  fib0 := 0;
  fib1 := 1;
  for i := 2 to n do 
  begin
    fib := fib1 + fib0;
    fib0 := fib1;
    fib1 := fib;
  end;
  if n = 0 then fib1 := 0;
  writeln('Число Фибоначчи: ', fib1);
end.