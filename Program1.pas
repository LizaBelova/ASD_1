//���������� ��������
type
  arr = array[1..100] of integer;

var
  n, i: integer;
     A: arr;

procedure Merge(var A: arr; first, last: integer);
var
  middle, start, final, j: integer;
  mas: arr;
begin
  middle := (first + last) div 2; //���������� �������� ��������
  start := first;                 //������ ����� �����
  final := middle + 1;            //������ ������ �����
  for j := first to last do
    if (start <= middle) and ((final > last) or (A[start] < A[final])) then
    begin
      mas[j] := A[start];
      inc(start);
    end
    else
    begin
      mas[j] := A[final];
      inc(final);
    end;
  for j := first to last do A[j] := mas[j];
end;

procedure MergeSort(var A: arr; first, last: integer);
begin
  if first < last then
  begin
    MergeSort(A, first, (first + last) div 2);    //���������� ����� �����
    MergeSort(A, (first + last) div 2 + 1, last); //���������� ������ �����
    Merge(A, first, last);                        //������� ���� ������
  end;
end;

begin
  write('����������� �������: ');
  readln(n);
  write('�������� ������:      ');
  for i := 1 to n do
  begin
    A[i] := random(256) - 100;
    write(A[i]:4);
  end;
  writeln;
  MergeSort(A, 1, n);
  write('��������������� ������: ');
  for i := 1 to n do write(A[i], ' ');
end.