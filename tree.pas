type
  tree = ^s;
  s = record
    inf: integer;
    Left, Right: tree;
  end;

var
  t: tree;
  c, i, a: Integer;

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
  if Root = nil Then CreateNode(Root, X) //создаем новый узел дерева
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
procedure PrintDown(T: tree);
begin
  if T <> nil then
  begin
    writeln(T^.inf);
    PrintDown(T^.left);
    PrintDown(T^.right);
  end;
end;
//Симметричный порядок прохождения
procedure PrintLex(T: tree);
begin
  if T <> nil then
  begin
    PrintLex(T^.left);
    writeln(T^.inf);
    PrintLex(T^.right);
  end;
end;
//Обратный порядок прохождения
procedure PrintUp(T: tree; h: integer);
var
  i1: integer;
begin
  if T <> nil then
  begin
    PrintUp(T^.left, h + 4);
    for i1 := 1 to h do write(' ');
    PrintUp(T^.right, h + 4);
    writeln(T^.inf);
  end;
end;
//Вывод дерева

procedure Print(var p: tree; h: integer);
var
  i: integer;
begin
  if p <> nil then
  begin
    Print(p^.right, h + 4);
    for i := 1 to h do Write(' ');
    writeln(p^.inf);
    Print(p^.left, h + 4);
  end;
end;


begin
  write('Введите значение бинарного дерева: ');
  readln(c);
  randomize;
  for i := 1 to c do 
  begin
    a := random(51) - 25;
    //write(a:7);
    Insert(t, a);
  end;
  //writeln('Прямой порядок прохождения');
  //PrintDown(t);
  //writeln('Симметричный порядок прохождения');
  //PrintLex(t);
  writeln('Обратный порядок прохождения');
  PrintUp(t, c);
  writeln('Вывод');
  Print(t, c);
end.