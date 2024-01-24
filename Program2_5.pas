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
procedure PrintDown(T: tree);
begin
  if T <> nil then
  begin
    writeln(T^.inf);
    PrintDown(T^.left);
    PrintDown(T^.right);
  end;
end;
//������������ ������� �����������
procedure PrintLex(T: tree);
begin
  if T <> nil then
  begin
    PrintLex(T^.left);
    writeln(T^.inf);
    PrintLex(T^.right);
  end;
end;
//�������� ������� �����������
procedure PrintUp(T: tree);
begin
  if T <> nil then
  begin
    PrintUp(T^.left);
    PrintUp(T^.right);
    writeln(T^.inf);
  end;
end;
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


begin
  write('������� �������� ��������� ������: ');
  readln(n);
  randomize;
  for i := 1 to n do 
  begin
    r := random(51) - 25;
    Insert(t, r);
  end;
  Print(t, n);
end.