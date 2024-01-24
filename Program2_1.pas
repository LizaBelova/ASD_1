//Бойера-Мура
function BMSearch(StartPos: Integer; const S, P: String): Integer;
type
  TBMTable = array[0..255] of Integer;
var
  Pos, lp, i, kol: Integer;
  BMT: TBMTable;
begin
  
  kol := 0;
  for i := 0 to 255 do BMT[i] := Length(P);
  for i := Length(P) downto 1 do 
    if BMT[Byte(P[i])] = Length(P) then
      BMT[Byte(P[i])] := Length(P) - i;
  
  lp := Length(P);
  Pos := StartPos + lp - 1;
  while Pos <= Length(S) do
    if P[lp] <> S[Pos] then Pos := Pos + BMT[Byte(S[Pos])] else
    if lp = 1 then
    begin
      inc(kol);
      inc(Pos);
    end else
      for i := lp - 1 downto 1 do
        if P[i] <> S[Pos - lp + i] then
        begin
          Inc(Pos);
        end
        else if i = 1 then
        begin
          inc(kol);
          inc(Pos);
        end;
  bmsearch := kol;
end;

var
  i: integer;
  s, p: string[30];

begin
  write('Введите строку: ');
  readln(s);
  write('Введите подстроку: ');
  readln(p);
  i := BMSearch(1, s, p);
  writeln('Количество вхождений: ', i);
end.