type
  
  pnode = ^node;
  
  node = record
    
    p: pnode;
    
    data: char;
  
  end;

var
  top, temp: pnode;
  
  post, inf: string;
  
  symb, outdata: char;
  
  i: integer;

function push(top: pnode; data: char): pnode;

var
  
  p: pnode;

begin
  
  new(p);
  
  p^.data := data;
  
  p^.p := top;
  
  push := p;
  
end;

function pop(top: pnode; var data: char): pnode;

begin
  
  data := top^.data;
  
  pop := top^.p;
  
  dispose(top);
  
end;

function empty(top: pnode): boolean;

begin
  
  if top = nil then empty := true
  
  else empty := false;
  
end;

function pred(oper1: char; oper2: char): boolean;

begin
  
  pred := true;
  
  if (oper1 = '(') or (oper2 = '(') then pred := false;
  
  if oper2 = '^' then pred := false;
  
  if ((oper1 = '-') or (oper1 = '+'))
  
  and ((oper2 = '*') or (oper2 = '/')) then 
    pred := false;
  
end;

begin  
  write('Stroka v infiksnoi forme: '); readln(inf);
  inf := inf + ' ';
  
  post := '';
  
  top := nil;
  
  i := 1;
  
  repeat
    
    symb := inf[i];
    
    if (symb >= 'A') and (symb <= 'Z') then begin
      
      post := post + symb;
      
      inc(i);
      
    end
    
    else begin
      
      while (empty(top) = false) and
      
      (pred(top^.data, symb) = true) do 
      begin
        
        top := pop(top, outdata);
        
        post := post + outdata;
        
      end;
      
      if (empty(top) = true) or (symb <> ')')
        
        then top := push(top, symb)
      
      else top := pop(top, outdata);
      
      inc(i);
      
    end;
    
  until symb = ' ';
  
  while empty(top) = false do 
  begin
    
    top := pop(top, outdata);
    
    post := post + outdata;
    
  end;
  
  writeln('Stroka v postfiksnoi forme: ', post);
  
  readln;
  
end.