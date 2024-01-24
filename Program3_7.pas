const
  V = 6; 
  inf = 100000;

type
  vektor = array[1..V] of integer;

var
  start: integer;

const
  GR: array[1..V, 1..V] of integer = (
 (0, 1, 4, 0, 2, 0),
 (0, 0, 0, 9, 0, 0),
 (4, 0, 0, 7, 0, 0),
 (0, 9, 7, 0, 0, 2),
 (0, 0, 0, 0, 0, 8),
 (0, 0, 0, 0, 0, 0));
//алгоритм Дейкстры
procedure Dijkstra(st: integer);
var
  count, index, i, u, m, min: integer;
  distance: vektor;
  visited: array[1..V] of boolean;
begin
  m := st;
  for i := 1 to V do
  begin
    distance[i] := inf; 
    visited[i] := false;
  end;
  distance[st] := 0;
  for count := 1 to V - 1 do
  begin
    min := inf;
    for i := 1 to V do
      if (not visited[i]) and (distance[i] <= min) then
      begin
        min := distance[i]; index := i;
      end;
    u := index;
    visited[u] := true;
    for i := 1 to V do
      if (not visited[i]) and (GR[u, i] <> 0) and (distance[u] <> inf) and
      (distance[u] + GR[u, i] < distance[i]) then
        distance[i] := distance[u] + GR[u, i];
  end;
  write('Стоимость пути из начальной вершины до остальных:'); writeln;
  for i := 1 to V do
    if distance[i] <> inf then
      writeln(m, ' -> ', i, ' = ', distance[i])
    else writeln(m, ' -> ', i, ' = ', 'маршрут недоступен');
end;
{основной блок программы}
begin
  write('Начальная вершина: '); 
  read(start);
  Dijkstra(start);
end.