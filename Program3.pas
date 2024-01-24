//�������� �����
const
  n = 10;

var
  x: array[1..n] of integer;
  i: integer;

procedure Qsort(l, r: integer);
var
  i, j, x1, y1, m: integer;
begin
  i := l;
  j := r;
  m := round((l + r) / 2);   
  x1 := x[m];
  repeat
    while x[i] < x1 do inc(i);//���� ����� ������ ��������, ��������� ����� ���� ������
    while x[j] > x1 do dec(j);//���� ������ ������ ��������, ��������� ����� ������
    if i <= j then            //���� ����� � ������ ��������
    begin
      y1 := x[i];
      x[i] := x[j];           //������ ����� � ������ �����
      x[j] := y1;
      inc(i);                 //����� ������
      dec(j);                 //������ �����
    end;
  until i > j;                //����� ����� ������������
  if l < j then Qsort(l, j);  //���������� ���������
  if i < r then Qsort(i, r);  //��� ����� ��� ������ �����
end;

begin
  randomize;
  write('�������� ������:        ');
  for i := 1 to n do
  begin
    x[i] := random(256) - 100;
    write(x[i]:4);
  end;
  writeln;
  Qsort(1, n);
  write('��������������� ������: ');
  for i := 1 to n do
    write(x[i]:4);
end.