//—ортировка сли€нием
type
  arr = array[1..100] of integer;

var
  n, i: integer;
     A: arr;

procedure Merge(var A: arr; first, last: integer);
var
  middle, start, final, j: integer;
  mas: arr;
begin
  middle := (first + last) div 2; //вычисление среднего элемента
  start := first;                 //начало левой части
  final := middle + 1;            //начало правой части
  for j := first to last do
    if (start <= middle) and ((final > last) or (A[start] < A[final])) then
    begin
      mas[j] := A[start];
      inc(start);
    end
    else
    begin
      mas[j] := A[final];
      inc(final);
    end;
  for j := first to last do A[j] := mas[j];
end;

procedure MergeSort(var A: arr; first, last: integer);
begin
  if first < last then
  begin
    MergeSort(A, first, (first + last) div 2);    //сортировка левой части
    MergeSort(A, (first + last) div 2 + 1, last); //сортировка правой части
    Merge(A, first, last);                        //сли€ние двух частей
  end;
end;

begin
  write('–азмерность массива: ');
  readln(n);
  write('»сходный массив:      ');
  for i := 1 to n do
  begin
    A[i] := random(256) - 100;
    write(A[i]:4);
  end;
  writeln;
  MergeSort(A, 1, n);
  write('ќтсортированный массив: ');
  for i := 1 to n do write(A[i], ' ');
end.