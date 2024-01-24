const
  MAXn = 7000; //����������� �������
 
//������������ ���� ���-�������
type
  arr = record
    mas: string[7]; //������� � �������
    flag: boolean;  //���� ��� ������� ����������
  end;
 
var
  table: array [0..mAxN] of arr; //������� ������������ �������� �������
  str: string;
  q: char;
  j, c, n: integer;
 
procedure initArray;
//��������� ������������� ������� (���-�������). ������ ���� string, '' - ������ ������
var
  j: integer;
begin
  for j := 0 to maxn do
  begin
    table[j].mas := '';
    table[j].flag := true;
  end;
end;

 function hash(str: string): integer; //���-�������
var i: byte;
    h, t: word;
begin
  h := 0;
  for i := 1 to length(str) do begin //� ����� ������������ ��� ������� ��������� �������
    h := h shl 4 + ord(str[i]);      //�������� ���������� �������� h �� 4 ���� ����� � ���������� ��� �������� �������
    t := h and $F0000000;            //�������� �����, ���������� ������ 4 ������� ���� h
    if t <> 0 then begin             //���� ��� �� 0
      h := (h xor (t shr 24)) and $FFFFFFF; //�� � h ����� h xor (t shr 24) � ����������� 4 ������� ����
    end
  end;
  hash := h mod mAxN + 1 //������ � ������������ ���-����� ����������� ����� � ������� [1, mAxN]
end;
 
function rhash(ii: integer; var c: integer; str: string): integer;
{ ���������� ��������. ��������� ����� ����� ��� ��������,
  ���� �����, ������� ��� ���������� ���-�������, ������.
  ii - ii-� ������� ������������������ ����;
  c - ������������� ���;
  str - ������� �������.
  ����. ��� ����, ����� ��� ������ ��������� �������������� �� ������ ����,
  ����������, ����� "�" ���� �������-������� � �������� ���-������� (maxn). }
begin
  //��������, ����� ����� - �������� ������������
  rhash := (hash(str) + c * ii) mod maxn;
end;
 
procedure AddHash(var j, c, n: integer; var str: string);
{ ��������� ���������� �������� � �������. ����� � - ���,
  j - c������ ���������, str - �������� ������ }
var
  i, ii: integer;
begin
  { � ������, ���� ����������� ��������� ���������
    ����� ��� �������� � �������, �������� ������
    ����� � ������. ������� i=0 }
  i := 1;       //���������� ��� rhash 
  if c = 0 then //��� �� ������, ������ ������� �����
  begin
    repeat
      write('����������� ������� (<=7000): ');
      readln(n);
    until n <= 7000;
    write('������� ���: ');
    readln(c);
  end;
  if n = 0 then
    writeln('������� ���������')
  else
  begin
    inc(j); //������� ��� ���������
    writeln('������� # ', j);
    readln(str);
    ii := hash(str); //��������� ������ ��� �������� �������� � ���-�������
    while true do
    begin
      //������ �� ������������� ���-�������� ������ �����
      if ii <= maxn then
      begin
        if (table[ii].mas = '') or (table[ii].flag = true) then
        begin
          table[ii].mas := str;    //��������� ������� � ������
          table[ii].flag := false; //�������� ��� �������
          dec(n);
          break;                   //������� ��� ���������� ��������
        end;
        //�� ���������� ������ ����� �������-����
        if ((table[ii].mas <> '') and (table[ii].mas = str)) or
             (table[ii].flag = true) then
        begin
          table[ii].mas := str;    //�������� ��� (��� ���� ���������)
          table[ii].flag := false; //�������� ������ ��� �������
          dec(j);                  //������� ���������, ������ ������� �� �����������
          break;                   //������� ��� ���������� ��������
        end;
        //�� ���������� ������ ��� ���� �������, �������� �� ��������
        if ((table[ii].mas <> '') and (table[ii].mas <> str)) or
             (table[ii].flag = true) then
          ii := rhash(i, c, str);  //������ ����� �������� �� ��������� ��������
        //��������� ������� �� ������� ���������� �����
      end
      else
        ii := rhash(i, c, str);
      inc(i); //� ������, ���� �����, �������� rhash, ���� �����, ���������� �����
    end;
  end;
end;
 
procedure DeleteHash(var j, n: integer; c: integer; var str: string);
//��������� �������� �������� �� ������ � �������. ����� j - ����� ��������� ��������, c - ���
var
  i, ii: integer;
begin
  i := 1; //���������� ��� rhash
  writeln('������� ������� ��� ��������:');
  readln(str); //������ �������
  ii := hash(str); //��������� ��� �����
  while true do
  begin
    if ii <= maxn then
    begin
      //���� � �������
      if (table[ii].mas = '') or ((table[ii].mas = str) and (table[ii].flag = true)) then
      begin
        writeln('������� �� ������');
        break;
      end;
      //�������
      if (table[ii].mas = str) and (table[ii].flag = false) then
      begin
      //�������� ������ ��� ���������. ������� ��� ���� �� �������. ����������� � ��� ������� ������ ����������� ����. ��������
        table[ii].flag := true;
        writeln('������� ������');
        inc(n);
        dec(j); //������� ������, ��������� �������
        break;
      end;
    end;
             { ����� ������� ������. ��� ������, ��� ������� ���
               �������� � ������� � ����������� ������� rhash, �.�. �������
               ��� ������ ������ ��-�� ��������� � ������ ���������. }
    ii := rhash(i, c, str);
    inc(i); //���������� ��� rhash
  end;
end;
 
procedure SearchHash(c: integer; var str: string);
//��������� ��� ������ �������� � ������� �� ���-������. ����� c - ���
var
  i, ii: integer;
begin
  i := 1; //���������� ��� rhash
  write('������� ������� ��� ������: ');
  readln(str);     //������ ������� ��� ������
  ii := hash(str); //��������� ��� ����� � �������
  while true do
  begin
    if ii <= maxn then
    begin
      //����
      if (table[ii].mas = '') or (table[ii].flag = true) then
      begin
        writeln('������� �� ������');
        break;
      end;
      //�����
      if (table[ii].mas = str) and (table[ii].flag = false) then
      begin
        writeln('�����: ', ii, ' ���������: ', i);
        break; //���������� �����
      end;
    end;     { ����� ������� ������. ��� ������, ��� ������� ���
               �������� � ������� � ����������� ������� rhash, �.�. �������
               ��� ������ ������ ��-�� ��������� � ������ ���������. }
    ii := rhash(i, c, str);
                { rhash �������� ������������ �����
                  ��� ������ ��� ������ �� ����������� ������� ����� }
    inc(i); //���������� ��� rhash
  end;
end;
//���������������� ��������� � ���� ���������
begin
  initArray; //�������������� ���-�������
  while true do
  begin
    writeln('----------------------------------------');
    writeln('1-��������; 2-�������; 3-�����; 4-�����');
    writeln('----------------------------------------');
    readln(q);
    case q of
      '1': AddHash(j, c, n, str);
      '2': DeleteHash(j, n, c, str);
      '3': SearchHash(c, str);
      '4': break;
    end;
  end;
end.