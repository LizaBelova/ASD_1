// Ñîğòèğîâêà âñòàâêàìè
const
  n = 10;

var
  arr: array[1..n] of integer;
             i, j, k: integer;

begin
  randomize;
  write('Èñõîäíûé ìàññèâ:        ');  
  for i := 1 to n do
  begin
    arr[i] := random(256) - 100;
    write(arr[i]:4);
  end;
  writeln;	
  
  for i := 2 to n do
  begin
    k := arr[i];
    j := i - 1;
    while (j > 0) and (k < arr[j]) do
    begin
      arr[j + 1] := arr[j];
      j := j - 1;
    end;
    arr[j + 1] := k;
  end;
  
  write('Îòñîğòèğîâàííûé ìàññèâ: ');
  for i := 1 to n do
    write(arr[i]:4);
end.