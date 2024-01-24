program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Mmax = 100;
  Nmax = 10000;
  Esc = #27;

var
  I, J, K, L, M, N: integer;
  Ch: char;
  P: array [0..Mmax - 1] of char;
  S: array [0..Nmax - 1] of char;
  D: array [0..Mmax - 1] of integer;

begin
  write('Введите строку');
  N := 0; 
  Ch := ReadKey;
  while (Ch <> #13) and (N < Nmax - 1) do
  begin
    write(Ch);
    S[N] := Ch;    
    N := N + 1;     
    Ch := ReadKey;    
  end;
  writeln;
  write('Введите подстроку');
  M := 0;
  Ch := ReadKey;  
  while (Ch <> #13) and (M < Mmax - 1) do
  begin 
    write(Ch);     
    P[M] := Ch;  
    m := m + 1;
    Ch := ReadKey;
  end;  
  writeln;  
  write('Поиск подстроки : ');  
  if Ch = Esc then exit;  
  J := 0; K := -1; D[0] := -1;  
  while J < M - 1 do  
  begin    
    while (K >= 0) and (P[J] <> P[K]) do      
      K := D[K];    
    J := J + 1;    
    K := K + 1;    
    if P[J] = P[K] then D[J] := D[K]    
    else D[J] := K;    
  end;  
  J := 0;  
  I := 0;  
  K := 0;  
  while (J < M) and (I < N) do  
  begin    
    while K <= I do     
    begin      
      write(S[K]);      
      K := K + 1;      
    end;    
    while (J >= 0) and (S[I] <> P[J]) do       
      J := D[J];    
    I := I + 1; J := J + 1;    
  end;  
  writeln;  
  if J = M then writeln('Образец в строке присутствует')
  else writeln('Образец в строке отсутствует');
  Readln;
end.
 