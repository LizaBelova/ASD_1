//���������� �������
const
  n = 10;

var
  arr: array[1..n] of integer;
   i, j, max, id_max: integer;

begin
  randomize;
  write('�������� ������:        ');
  for i := 1 to n do 
  begin
    arr[i] := random(256) - 100;
    write(arr[i]:4);
  end;
  writeln;
  
  j := n;  
  while j > 1 do 
  begin
    max := arr[1];
    id_max := 1;
    for i := 2 to j do
      if arr[i] > max then begin
        max := arr[i];
        id_max := i
      end;
    arr[id_max] := arr[j];
    arr[j] := max;
    j := j - 1
  end;
  
  write('��������������� ������: ');
  for i := 1 to n do
    write(arr[i]:4);
end.