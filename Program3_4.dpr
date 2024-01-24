program Program3;
// алгоритм Эдмондса-Карпа
{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  maxn = 1000;
  infinity = maxlongint;

var
  n, m, vin, vout, i, u, v, w, head, tail, ans: longint;
  ne, p, flow: array[1..maxn] of longint;
  e, c, f: array[1..maxn, 1..maxn] of longint;
  q: array[0..maxn] of longint;

begin
  read(n, m, vin, vout);
  for i := 1 to m do
  begin
    read(u, v, w);
    if c[v, u] = 0 then
    begin
      inc(ne[u]);
      e[u, ne[u]] := v;
      inc(ne[v]);
      e[v, ne[v]] := u;
    end;
    c[u, v] := w;
  end;
  repeat
    p[vout] := -1;
    fillchar(flow, sizeof(flow), 0);
    flow[vin] := infinity;
    head := 0;
    tail := 1;
    Q[0] := vin;
    while head < tail do
    begin
      u := Q[head];
      inc(head);
      for i := 1 to ne[u] do
      begin
        v := e[u, i];
        if (c[u, v] - f[u, v] > 0) and (flow[v] = 0) then
        begin
          Q[tail] := v;
          inc(tail);
          p[v] := u;
          if c[u, v] - f[u, v] < flow[u] then flow[v] := c[u, v] - f[u, v]
          else flow[v] := flow[u];
          if v = vout then break;
        end;
      end;
    end;
    if p[vout] = -1 then break;
    u := vout;
    while u <> vin do
    begin
      f[p[u], u] := f[p[u], u] + flow[vout];
      u := p[u];
    end;
    ans := ans + flow[vout];
  until false;
  write(ans);
  Sleep(12000);
end.
