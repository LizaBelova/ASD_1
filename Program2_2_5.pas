//постфиксный обход
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

procedure PrintT(aT: pTree);
begin
  if aT = nil then exit;
  PrintT(aT^.Left);
  PrintT(aT^.Right);
  write(aT^.Inf:7);
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
  writeln('Постфиксный обход дерева:');
  PrintT(T);
end.