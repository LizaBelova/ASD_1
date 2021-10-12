//Сортировка пузырьком
const
  n = 10;

var
  arr: array[1..n] of integer;
             i, j, k: integer;

begin
  randomize;
  write('Исходный массив:        ');
  for i := 1 to n do 
  begin
    arr[i] := random(256) - 100;
    write(arr[i]:4);
  end;
  writeln;
  
  for i := 1 to n - 1 do
    for j := 1 to n - i do
      if arr[j] > arr[j + 1] then begin
        k := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := k
      end;
  
  write('Отсортированный массив: ');
  for i := 1 to n do
    write(arr[i]:4);
end.