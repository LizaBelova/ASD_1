type
  tree = ^s;
  s = record
    inf: integer;
    Left, Right: tree;
  end;

var
  t: tree;
  n, i, r: integer;

//Формирование дерева
procedure Insert(var Root: tree; X: integer);
  //Дополнительная процедура, создающая и инициализирующая новый узел
  procedure CreateNode(var p: tree; n: integer);
  begin
    New(p);
    p^.inf := n;
    p^.Left := nil;
    p^.Right := nil
  end;

begin
  if Root = nil then CreateNode(Root, X) //создаем новый узел дерева
  else
    with Root^ do 
    begin
      if inf < X then Insert(Right, X)
      else
      if inf > X Then Insert(Left, X)
    else
    end;
end;
//Прямой порядок прохождения
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
//Симметричный порядок прохождения
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
//Обратный порядок прохождения
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
//Вывод дерева
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
  write('Введите количество узлов бинарного дерева: ');
  readln(n);
  randomize;
  for i := 1 to n do 
  begin
    r := random(51) - 25;
    Insert(t, r);
  end;
  //Print(t, n);
  writeln('Прямой порядок прохождения');
  PrintDown(t, n);
  writeln('Симметричный порядок прохождения');
  PrintLex(t, n);
  writeln('Обратный порядок прохождения');
  PrintUp(t, n);
end.