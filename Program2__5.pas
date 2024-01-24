type
  tree = ^s;
  s = record
    inf: integer;
    Left, Right: tree;
  end;

var
  t: tree;
  n, i, r: integer;

//������������ ������
procedure Insert(var Root: tree; X: integer);
  //�������������� ���������, ��������� � ���������������� ����� ����
  procedure CreateNode(var p: tree; n: integer);
  begin
    New(p);
    p^.inf := n;
    p^.Left := nil;
    p^.Right := nil
  end;

begin
  if Root = nil then CreateNode(Root, X) //������� ����� ���� ������
  else
    with Root^ do 
    begin
      if inf < X then Insert(Right, X)
      else
      if inf > X Then Insert(Left, X)
    else
    end;
end;
//������ ������� �����������
procedure PrintDown(T: tree; h: integer);
var
  i: integer;
begin
  if T <> nil then
  begin
    for i := 1 to h do write(' ');
    writeln(T^.inf);
    PrintDown(T^.left, h + 4);
    PrintDown(T^.right, h + 4);
  end;
end;
//������������ ������� �����������
procedure PrintLex(T: tree; h: integer);
var
  i: integer;
begin
  if T <> nil then
  begin
    PrintLex(T^.left, h + 4);
    for i := 1 to h do write(' ');
    writeln(T^.inf);
    PrintLex(T^.right, h + 4);
  end;
end;
//�������� ������� �����������
procedure PrintUp(T: tree; h: integer);
var
  i: integer;
begin
  if T <> nil then
  begin
    PrintUp(T^.left, h + 4);
    PrintUp(T^.right, h + 4);
    for i := 1 to h do write(' ');
    writeln(T^.inf);
  end;
end;
{
//����� ������
procedure Print(var T: tree; h: integer);
var
  i: integer;
begin
  if T <> nil then
  begin
    Print(T^.right, h + 4);
    for i := 1 to h do write(' ');
    writeln(T^.inf);
    Print(T^.left, h + 4);
  end;
end;
}

begin
  write('������� ���������� ����� ��������� ������: ');
  readln(n);
  randomize;
  for i := 1 to n do 
  begin
    r := random(51) - 25;
    Insert(t, r);
  end;
  //Print(t, n);
  writeln('������ ������� �����������');
  PrintDown(t, n);
  writeln('������������ ������� �����������');
  PrintLex(t, n);
  writeln('�������� ������� �����������');
  PrintUp(t, n);
end.