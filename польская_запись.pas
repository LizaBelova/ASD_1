program lab1;
 
 
type
 ptr=^stack;
 stack=record
 val:char;
 pnt:ptr;
end;
 
function prioritet(b:char):byte;
  begin
    if (b='*') or (b='/') then
      prioritet:=1
    else
      prioritet:=0;
  end;
 
function empty(r:ptr):boolean;
begin
 empty:=r=nil;
end;
 
procedure push(x:char; var r:ptr);
var
 p:ptr;
begin
 new(p);
 p^.val:=x;
 p^.pnt:=r;
 r:=p;
end;
 
function pop(var r:ptr):char;
var
 p:ptr;
begin
 p:=r;
 pop:=p^.val;
 r:=p^.pnt;
 dispose(p);
end;
 
function pup(var r:ptr):char;
begin
 pup:=r^.val;
end;
 
var
s1,s2:ptr;
i:byte;
a:string;
 
begin
  writeln('Vvedite stroku');
  readln(a);
    for i:=length(a) downto 1 do
      begin
        if (i mod 2)<>0 then
          push(a[i],s1)
        else
          begin
            if not empty(s2) then
              if prioritet(a[i])<prioritet(pup(s2)) then
                  repeat
                    push(pop(s2),s1)
                  until not (prioritet(a[i])<prioritet(pup(s2))) or (empty(s2));
                push(a[i],s2);
          end;
      end;
  while not empty(s2) do
    push(pop(s2),s1);
  while not empty(s1) do
    write(pop(s1));
end.