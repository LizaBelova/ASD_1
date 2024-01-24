const
  n = 5;

var
  i, j, start: integer;
  visited: array[1..n] of boolean;

const
  graph: array[1..n, 1..n] of byte =
  ((0, 1, 0, 0, 1),
  (1, 0, 1, 1, 0),
  (0, 1, 0, 0, 1),
  (0, 1, 0, 0, 1),
  (1, 0, 1, 1, 0));
//поиск в глубину
procedure DFS(st: integer);
var
  r: integer;
begin
  write(st:2);
  visited[st] := true;
  for r := 1 to n do
    if (graph[st, r] <> 0) and (not visited[r]) then
      DFS(r);
end;

begin
  write('Стартовая вершина: '); 
  read(start);
  writeln('Матрица смежности:');
  for i := 1 to n do
  begin
    visited[i] := false;
    for j := 1 to n do
      write(graph[i, j], ' ');
    writeln;
  end;
  write('Результат обхода: '); 
  DFS(start);
end.