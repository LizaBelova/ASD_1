//Кнута-Морриса-Пратта
function PosCount(const Needle, HayStack: string ): integer;
var
  F: array of integer;
  k, i: integer;
begin
  result := 0;
  SetLength(F, 1 + Length(Needle));
  F[1] := 0;
  k := 0;
  for i := 2 to Length(Needle) do
  begin
    while (k > 0) and (Needle[k + 1] <> Needle[i]) do
      k := F[k];
    if Needle[k + 1] = Needle[i] then
      inc(k);
    F[i] := k;
  end;
  k := 0;
  for i := 1 to Length(HayStack) do
  begin
    while ((k > 0) and (Needle[k + 1] <> HayStack[i])) do
      k := F[k];
    if Needle[k + 1] = HayStack[i] then
      Inc(k);
    if k = Length(Needle) then
    begin
      result := result + 1;
    end;
  end;
end;

const
  s = 'tukldh';
  t = 'h';

begin
  writeln('Строка: ', s);
  writeln('Подстрока: ', t);
  writeln('Количество вхождений: ', PosCount(t, s));
end.