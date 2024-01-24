const
  MAXn = 7000; //размерность таблицы
 
//формирование типа хеш-таблицы
type
  arr = record
    mas: string[7]; //элемент в таблице
    flag: boolean;  //флаг для пометки просмотров
  end;
 
var
  table: array [0..mAxN] of arr; //таблица представлена массивом записей
  str: string;
  q: char;
  j, c, n: integer;
 
procedure initArray;
//Процедура инициализации массива (хеш-таблицы). Массив типа string, '' - пустая ячейка
var
  j: integer;
begin
  for j := 0 to maxn do
  begin
    table[j].mas := '';
    table[j].flag := true;
  end;
end;

 function hash(str: string): integer; //хеш-функция
var i: byte;
    h, t: word;
begin
  h := 0;
  for i := 1 to length(str) do begin //в цикле обрабатываем все символы исходного стринга
    h := h shl 4 + ord(str[i]);      //сдвигаем предыдущее значение h на 4 бита влево и прибавляем код текущего символа
    t := h and $F0000000;            //получаем число, содержащее только 4 старших бита h
    if t <> 0 then begin             //если оно не 0
      h := (h xor (t shr 24)) and $FFFFFFF; //то в h пишем h xor (t shr 24) и отбрасываем 4 старших бита
    end
  end;
  hash := h mod mAxN + 1 //ставим в соответствие хеш-сумме натуральное число в отрезке [1, mAxN]
end;
 
function rhash(ii: integer; var c: integer; str: string): integer;
{ Разрешение коллизий. Подбирает новый адрес для элемента,
  если место, которое ему определила хеш-функция, занято.
  ii - ii-й элемент последовательности проб;
  c - фиксированный шаг;
  str - текущий элемент.
  Прим. Для того, чтобы все ячейки оказались просмотренными по одному разу,
  необходимо, чтобы "с" было взаимно-простым с размером хеш-таблицы (maxn). }
begin
  //например, такой метод - линейное пробирование
  rhash := (hash(str) + c * ii) mod maxn;
end;
 
procedure AddHash(var j, c, n: integer; var str: string);
{ Процедура добавления элемента в таблицу. Здесь с - шаг,
  j - cчетчик элементов, str - вводимая строка }
var
  i, ii: integer;
begin
  { В случае, если потребуется подбирать свободное
    место для элемента в таблице, начинать всегда
    нужно с начала. Поэтому i=0 }
  i := 1;       //переменная для rhash 
  if c = 0 then //шаг не введен, значит таблица пуста
  begin
    repeat
      write('Размерность таблицы (<=7000): ');
      readln(n);
    until n <= 7000;
    write('Введите шаг: ');
    readln(c);
  end;
  if n = 0 then
    writeln('Таблица заполнена')
  else
  begin
    inc(j); //счетчик для элементов
    writeln('Элемент # ', j);
    readln(str);
    ii := hash(str); //получения адреса для хранения элемента в хеш-таблице
    while true do
    begin
      //ячейка по определенному хеш-функцией адресу пуста
      if ii <= maxn then
      begin
        if (table[ii].mas = '') or (table[ii].flag = true) then
        begin
          table[ii].mas := str;    //добавляем элемент в ячейку
          table[ii].flag := false; //помечаем как занятую
          dec(n);
          break;                   //выходим для дальшейших операций
        end;
        //по указанному адресу лежит элемент-клон
        if ((table[ii].mas <> '') and (table[ii].mas = str)) or
             (table[ii].flag = true) then
        begin
          table[ii].mas := str;    //заменяем его (они ведь одинаковы)
          table[ii].flag := false; //помечаем ячейку как занятую
          dec(j);                  //элемент заменился, значит счетчик не увеличиваем
          break;                   //выходим для дальшейших операций
        end;
        //по указанному адресу уже есть элемент, отдичный от текущего
        if ((table[ii].mas <> '') and (table[ii].mas <> str)) or
             (table[ii].flag = true) then
          ii := rhash(i, c, str);  //меняем адрес элементу во избежание коллизии
        //проверяем таблицу на наличие свободного места
      end
      else
        ii := rhash(i, c, str);
      inc(i); //в случае, если адрес, выданный rhash, тоже занят, продолжаем поиск
    end;
  end;
end;
 
procedure DeleteHash(var j, n: integer; c: integer; var str: string);
//Процедура удаления элемента по адресу в таблице. Здесь j - номер вводимого элемента, c - шаг
var
  i, ii: integer;
begin
  i := 1; //переменная для rhash
  writeln('Введите элемент для удаления:');
  readln(str); //вводим элемент
  ii := hash(str); //вычисляем его адрес
  while true do
  begin
    if ii <= maxn then
    begin
      //ищем в таблице
      if (table[ii].mas = '') or ((table[ii].mas = str) and (table[ii].flag = true)) then
      begin
        writeln('Элемент не найден');
        break;
      end;
      //находим
      if (table[ii].mas = str) and (table[ii].flag = false) then
      begin
      //Помечаем ячейку как свободную. Элемент при этом не удаляем. Добавляемый в нее элемент просто перезапишет пред. значение
        table[ii].flag := true;
        writeln('Элемент удален');
        inc(n);
        dec(j); //элемент удален, уменьшаем счетчик
        break;
      end;
    end;
             { Поиск другого адреса. Это значит, что элемент был
               добавлен в таблицу с применением функции rhash, т.е. выдачей
               ему нового адреса из-за конфликта с другим элементом. }
    ii := rhash(i, c, str);
    inc(i); //переменная для rhash
  end;
end;
 
procedure SearchHash(c: integer; var str: string);
//Процедура для поиска элемента в таблице по хеш-адресу. Здесь c - шаг
var
  i, ii: integer;
begin
  i := 1; //переменная для rhash
  write('Введите элемент для поиска: ');
  readln(str);     //вводим элемент для поиска
  ii := hash(str); //вычисляем его адрес в таблице
  while true do
  begin
    if ii <= maxn then
    begin
      //ищем
      if (table[ii].mas = '') or (table[ii].flag = true) then
      begin
        writeln('Элемент не найден');
        break;
      end;
      //нашли
      if (table[ii].mas = str) and (table[ii].flag = false) then
      begin
        writeln('Адрес: ', ii, ' сравнений: ', i);
        break; //прекращаем поиск
      end;
    end;     { Поиск другого адреса. Это значит, что элемент был
               добавлен в таблицу с применением функции rhash, т.е. выдачей
               ему нового адреса из-за конфликта с другим элементом. }
    ii := rhash(i, c, str);
                { rhash присвоил недопустимый адрес
                  для ячейки или ячейка со стандартным адресом пуста }
    inc(i); //переменная для rhash
  end;
end;
//Пользовательский интерфейс и тело программы
begin
  initArray; //инициализируем хеш-таблицу
  while true do
  begin
    writeln('----------------------------------------');
    writeln('1-Добавить; 2-Удалить; 3-Найти; 4-Выход');
    writeln('----------------------------------------');
    readln(q);
    case q of
      '1': AddHash(j, c, n, str);
      '2': DeleteHash(j, n, c, str);
      '3': SearchHash(c, str);
      '4': break;
    end;
  end;
end.