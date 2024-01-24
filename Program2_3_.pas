const nmax=10000;
var p: string; {подстрока}
s:string; {строка}
d:array[char]of byte; {массив сдвигов}
c:char;
m,i,j,k:integer;
begin
write('—трока: ');
  readln(s);
  write('ѕодстрока: ');
  readln(p);{задание строки и подстроки}
m:=length(p);{длина подстроки}
for c:=chr(0) to chr(255) do d[c]:=m;
for j:=1 to m-1 do d[p[j]]:=m-j;
{массив d определен}
i:=m+1;
repeat {выбор фрагмента в строке}
j:=m+1; k:=i;
repeat {проверка совпадени€}
k:=k-1; j:=j-1
until (j<1)or(p[j]<>s[k]);
i:=i+d[s[i-1]];{сдвиг}
until (j<1)or(i>nmax+1);
if j<1 then write(k+1) else write(0)
end.