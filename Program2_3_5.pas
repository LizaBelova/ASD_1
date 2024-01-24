//Симметричный
type
  TInf = integer;
  pTree = ^Tree;
  Tree = record
    Inf: TInf;
    Left, Right: pTree;
  end;

procedure AddToTree(var aT: pTree; const aInf: TInf);
begin
  if aT = nil then begin
    New(aT);
    aT^.Inf := aInf;
    aT^.Left := nil;
    aT^.Right := nil;
  end 
  else 
  if (aInf >= aT^.Inf) then 
    AddToTree(aT^.Right, aInf)
  else 
    AddToTree(aT^.Left, aInf);
end;

procedure PrintT(aT: pTree; h: integer);
var
  i: Integer;
begin
  if aT <> nil then
  begin
      PrintT(aT^.right, h + 4);
      for i := 1 to h do write(' ');
      writeln(aT^.inf);
      PrintT(aT^.left, h + 4);
  //  PrintT(aT^.Left);
  //  PrintT(aT^.Right);
  //  write(aT^.Inf:7);
  end;
end;

var
  T: pTree;
  i, n: integer;
  a: TInf;

begin
  T := nil;
  write('Количество узлов в дереве: '); 
  readln(n);
  randomize;
  for i := 1 to n do 
  begin
    a := random(51) - 25;
    write(a:7);
    AddToTree(T, a);
  end;
  writeln;
  writeln('Префиксный обход дерева:');
  PrintT(T, n);
end.