var
  m, x, number_counter, verified_number: Integer;

begin
  readln(m);
  
  number_counter := 0;
  verified_number := 72;
  while (number_counter < m) do 
  begin
    x := verified_number;
    
    if (x mod 72 = 0) then begin
      x := x div 72;
      
      while (x mod 6 = 0) and (x > 0) do
        x := x div 6;
      
      while (x mod 4 = 0) and (x > 0) do
        x := x div 4;
      
      while (x mod 3 = 0) and (x > 0) do
        x := x div 3;
      
      if (x = 1) then begin
        number_counter := number_counter + 1;
        write(verified_number, ' ');
      end;
      
    end;
    
    verified_number := verified_number + 1;
  end;
end.