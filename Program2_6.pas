//������������ ������

const
  MAXCOUNT = 30;

type
  Matrix = array [1..MAXCOUNT, 1..MAXCOUNT] of real; //������������� �������

var
  matr1, matr2: Matrix; //�������� �������
  resmatr: Matrix;      //�������-���������
  n, m: integer;        //�������� ����������� ������
  min, max: real;       //������� ��������� ��������� �����
  ask: char;            //��� ����� ������

//���� ������������ �������
procedure EnterMatrixSize(var x, y: integer);
begin
  //������
  repeat
    write('������� ���������� ����� ������ (1..', MAXCOUNT, ') ');
    readln(x);
    if (x < 1) then
      writeln('������! ����������� ������ �� ����� ���� ������� �������. ��������� ����.');
    if (x > MAXCOUNT) then
      writeln('������! ����������� ������ �� ������ ���� ������� ', MAXCOUNT, '. ��������� ����.');
  until (x > 0) and (x <= MAXCOUNT);
  //�������
  repeat
    write('������� ���������� �������� ������ (1..', MAXCOUNT, ') ');
    readln(y);
    if (y < 1) then
      writeln('������! ����������� ������ �� ����� ���� ������� �������. ��������� ����.');
    if (y > MAXCOUNT) then
      writeln('������! ����������� ������ �� ������ ���� ������� ', MAXCOUNT, '. ��������� ����.');
  until (y > 0) and (y <= MAXCOUNT);
end;

//������������ ���� ������������� ������� � ����������
procedure EnterMatrix(x, y: integer; var M: Matrix);
var
  i, j: integer;
begin
  writeln('������� �������� ������������� �������:');
  for i := 1 to x do
    for j := 1 to y do 
    begin
      write('M[', i, ',', j, '] = ');
      readln(M[i, j]);
    end;
end;

//��������� ��������� ��������� ������� � �������� ���������
procedure GenerateMatrix(x, y: integer; var M: Matrix);
var
  i, j: integer;
begin
  for i := 1 to x do
    for j := 1 to y do
      M[i, j] := random * (max - min) + min;
end;

//������������ ����� ������� �� ����� �� �������
procedure PrintMatrix(x, y: integer; M: Matrix);
var
  i, j: integer;
begin
  for i := 1 to x do 
  begin
    for j := 1 to y do
      write(M[i, j]:6:2);
    writeln;
  end;
end;

{
��������� ����������� ��� ������������� ������� �� ������� �������� �������. 
��������� - ������ �������
����������� ������: m1(n,m), m2(m,n), res(n,n)
}
procedure MulOfMatrix(m1, m2: Matrix; var res: Matrix; n, m: integer);
var
  i, j, k: integer;
begin
  for i := 1 to m do
    for j := 1 to m do 
    begin
      res[i, j] := 0;
      for k := 1 to n do
        res[i, j] := res[i,j] + m1[i, k] * m2[k, j];
    end;
end;

begin
  EnterMatrixSize(n, m);
  writeln('�������� ������� ���������� ������:');
  writeln('1 - � ����������');
  writeln('2 - ���������� �������');
  repeat
    readln(ask);
    if (ask <> '1') and (ask <> '2') then
      writeln('�������� ����� 1 ��� 2, ����������');
  until (ask = '1') or (ask = '2');
  case (ask) of
    '1': 
      begin
        writeln('������� �������� ������ �������');
        EnterMatrix(n, m, matr1);
        writeln('������� �������� ������ �������');
        EnterMatrix(m, n, matr2);
      end;
    '2': 
      begin
        randomize;
        write('������� ������ ������� ��������� ��������� �����: ');
        readln(min);
        write('������� ������� ������� ��������� ��������� �����: ');
        readln(max);
        GenerateMatrix(n, m, matr1);
        GenerateMatrix(m, n, matr2);
      end;
  end;
  writeln('������ �������� �������:');
  PrintMatrix(n, m, matr1);
  writeln('������ �������� �������:');
  PrintMatrix(m, n, matr2);
  
  MulOfMatrix(matr1, matr2, resmatr, n, m);
  writeln('�������-��������� ������������� ���������:');
  PrintMatrix(n, n, resmatr);
end.