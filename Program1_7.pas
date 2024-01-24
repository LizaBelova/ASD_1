const
  n = 4;

type
  MassivInt = array[1..n, 1..n] of integer;
  MassivBool = array[1..n] of boolean;

var
  i, j, start: integer;
      visited: MassivBool;
//матрица смежности графа
const
  GM: MassivInt = (
 (0, 1, 1, 0),
 (0, 0, 1, 1),
 (1, 0, 0, 1),
 (0, 1, 0, 0));
//поиск в ширину
procedure BFS(visited: MassivBool; _unit: integer);
var
  queue: array[1..n] of integer;
  count, head, k: integer;
begin
  for k := 1 to n do 
  queue[k] := 0;
  count := 0; 
  head := 0;
  count := count + 1;
  queue[count] := _unit;
  visited[_unit] := true;
  while head < count do
  begin
    head := head + 1;
    _unit := queue[head];
    write(_unit, ' ');
    for k := 1 to n do
    begin
      if (GM[_unit, k] <> 0) and (not visited[k]) then
      begin
        count := count + 1;
        queue[count] := k;
        visited[k] := true;
      end;
    end;
  end;
end;

begin
  write('Стартовая вершина: '); 
  read(start);
  writeln('Матрица смежности: ');
  for i := 1 to n do
  begin
    visited[i] := false;
    for j := 1 to n do
      write(' ', GM[i, j]);
    writeln;
  end;
  write('Результат обхода: ');
  BFS(visited, start);
end.