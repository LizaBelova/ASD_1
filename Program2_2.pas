//Райана

function RSearch(const pat: string; const  text: string): integer;
const
  b = 131;
var
  hpat, htext, Bm, j, m, n: integer;
  found: boolean;
begin
  found := false;
  result := 0;
  m := length(pat);
  if m = 0 then
  begin
    result := 1;
    found := true
  end;
  
  Bm := 1;
  hpat := 0;
  htext := 0;
  n := length(text);
  if n >= m then
    //препроцессинг
    for j := 1 to m do
    begin
      Bm := Bm * b;
      hpat := hpat * b + ord(pat[j]);
      htext := htext * b + ord(text[j])
    end;
  
  j := m;
  //поиск
  while not found do
  begin
    if (hpat = htext) and (pat = copy(text, j - m + 1, m)) then
    begin
      result := j - m;
      found := true
    end;
    if j < n then
    begin
      j := j + 1;
      htext := htext * b - ord(text[j - m]) * Bm + ord(text[j])
    end
    else
      found := true;
  end
end;

begin
  writeln(RSearch('abcde', '01234506abcde'));   
  writeln(RSearch('abcde', '0123456789abcde'));
  writeln(RSearch('abc', '0123458798765'));
end.