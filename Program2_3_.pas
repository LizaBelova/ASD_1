const nmax=10000;
var p: string; {���������}
s:string; {������}
d:array[char]of byte; {������ �������}
c:char;
m,i,j,k:integer;
begin
write('������: ');
  readln(s);
  write('���������: ');
  readln(p);{������� ������ � ���������}
m:=length(p);{����� ���������}
for c:=chr(0) to chr(255) do d[c]:=m;
for j:=1 to m-1 do d[p[j]]:=m-j;
{������ d ���������}
i:=m+1;
repeat {����� ��������� � ������}
j:=m+1; k:=i;
repeat {�������� ����������}
k:=k-1; j:=j-1
until (j<1)or(p[j]<>s[k]);
i:=i+d[s[i-1]];{�����}
until (j<1)or(i>nmax+1);
if j<1 then write(k+1) else write(0)
end.