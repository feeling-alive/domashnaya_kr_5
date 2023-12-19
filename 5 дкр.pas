var 
  choose, n, i, j, x : integer;
  M : array of integer;
  f : text;
  
procedure quick_sort(var A: array of integer; iLo, iHi: integer);
var
  Lo, Hi, Pivot, T: Integer;
begin
  Lo := iLo;
  Hi := iHi;
  Pivot := A[(Lo + Hi) div 2];
  repeat
    while A[Lo] < Pivot do Inc(Lo);
    while A[Hi] > Pivot do Dec(Hi);
    if Lo <= Hi then
    begin
      T := A[Lo];
      A[Lo] := A[Hi];
      A[Hi] := T;
      Inc(Lo);
      Dec(Hi);
    end;
  until Lo > Hi;
  if Hi > iLo then quick_sort(A, iLo, Hi);
  if Lo < iHi then quick_sort(A, Lo, iHi);
end;


procedure array_from_file(ff : text);
begin
  reset(ff);
  n := 0; // Инициализация переменной "n"
  while not Eof(ff) do begin
    n := n + 1;
    readln(ff,x);
    Setlength(M, n);
    M[n-1] := x;
  end;
  CloseFile(ff);
end;

procedure bubble_sort(var A: array of integer);
var
  i, j, temp : integer;
begin
  for i := 0 to High(A) do begin
    for j := 0 to High(A) - 1 do begin
      if A[j] > A[j+1] then begin
        temp := A[j];
        A[j] := A[j+1];
        A[j+1] := temp;
      end;
    end;
  end;
end;

begin
  Writeln('Какой массив использовать?');
  Writeln('1 – Первый массив');
  Writeln('2 – Второй массив');
  Writeln('3 – Третий массив');
  Writeln('4 – Задать массив самостоятельно');
  
  readln(choose);
  case choose of
    1 : begin Assign(f, 'array1.txt'); array_from_file(f); end;
    2 : begin Assign(f, 'array2.txt'); array_from_file(f); end;
    3 : begin Assign(f, 'array3.txt'); array_from_file(f); end;
    4 : begin 
      writeln('Задайте длину массива'); 
      readln(n); 
      setlength(M, n); 
      writeln('Впишите элементы массива'); 
      for i := 0 to n-1 do 
        readln(M[i]); 
    end;
    else
    begin
      writeln('Пожалуйста выберите пункт из предложенных заданий!');
      Halt;
    end;
  end;
  Writeln(M);
  writeln('Какой способ сортировки использовать?');
  writeln('1 – Алгоритм пузырьковым');
  writeln('2 – Быстрый алгоритм');
  
  readln(choose);
  case choose of 
    1 : begin bubble_sort(M); writeln('Массив после сортировки пузырьковым методом:'); writeln(M) end;
    2 : begin quick_sort(M, 0, High(M)); writeln('Массив после сортировки быстрым методом:'); Writeln(M) end;
       else
    begin
      writeln('Пожалуйста выберите пункт из предложенных заданий!');
      Halt;
    end;
  end;
   
end.