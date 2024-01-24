﻿type
  PTree = ^Tree;
  Tree = record
    Data: char;
    Left, Right: PTree;
  end;

procedure AddToTree(var aTree: PTree; s: string);
var
  i, j: integer;
begin
  if s = '' then exit else
  if Length(s) = 1 then begin
    New(aTree);
    aTree^.Data := s[1];
    aTree^.Left := nil; aTree^.Right := nil;
  end
  else begin
    j := 1;
    for i := 1 to length(s) do 
    begin
      if s[i] = '(' then inc(j);
      if s[i] = ')' then dec(j);
      if (s[i] = ',') and (j = 2) then begin
        j := i;
        break;
      end;
    end; 
    AddToTree(aTree, s[1]);
    AddToTree(aTree^.Left, copy(s, 3, j - 3));
    AddToTree(aTree^.Right, copy(s, j + 1, length(s) - j - 1));
  end;
end;

procedure Prefix(aTree: PTree);
begin
  if aTree = nil then exit;
  write(aTree^.Data:4);
  Prefix(aTree^.Left);
  Prefix(aTree^.Right);
end;

var
  t: text;
  s: string;
  BTree: PTree;

begin
  assign(t, 'bintree.txt');
  rewrite(t);
  //readln(s);
  s := 'a(u(r,d),p(z,x))';
  writeln('Скобочная запись бинарного дерева : ');
  writeln(t, s);
  reset(t);
  readln(t, s);
  writeln(s);
  BTree := nil;
  AddToTree(BTree, s);
  writeln('Дерево в префиксном порядке :');
  Prefix(BTree);
  close(t);
  readln;
end.