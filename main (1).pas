program gamecol;


Type
arraya=array [1..999,0..5] of integer;
strgtype=array [1..255] of char;


var                              
level:integer;
x: char;
win, exit: boolean;
gamenum: string;
{
procedure stringtochar(var output:char);}



procedure stringtochar(var output:char; msg:boolean);

var
i, head:integer;
error: boolean;
strg: strgtype;

    begin
    repeat
        for i:=1 to 255 do
        strg[i]:=' ';
        readln(strg);
        head:=0;
        error:=false;
        i:=1;
        Repeat
            If (strg[i]<>' ') then
                if (head<>0) or (ord(strg[i])=0) then
                    begin
                    error:=true;
                    If msg then
                    write('Please clarify your choice: ')
                    end
                    else
                    begin
                    head:=i;
                    output:=strg[i]
                    end;
            i:=i+1;
        until (i=256) or (error) or (ord(strg[i])=0);
    until not error;
    end;

procedure clarify;
    Begin 
    stringtochar(x, true);
    while not (x in ['n', 'y', 'N', 'Y']) do
        Begin
        write('Please clarify your choice: ');
        stringtochar(x, true);
        end
    End;
   
    


procedure stringtointc(var output:integer);

var
i:integer;
head, toe, negative, error: boolean;
strg: strgtype;
buffer:longint;

    begin
    repeat
        for i:=1 to 255 do
        strg[i]:=' ';
        readln(strg);
        head:=false;
        toe:=false;
        error:=false;
        buffer:=0;
        negative:=false;
        i:=1;
        Repeat
            If (strg[i]<>' ') then
                begin
                If toe or (not (strg[i] in ['0'..'9', '-'])) or (((strg[i]='-') or (buffer>32768)) and negative) or (buffer>32767) then
                    begin
                    error:=true;
                    write('Invalid input! Please input again:')
                    end
                    else
                    begin
                    If not head then
                        head:=true;
                    If strg[i]='-' then
                        negative:=true
                        else
                        begin
                        buffer:=buffer*10+(ord(strg[i])-48);
                        end
                    end
                end
                else
                If (head) and (not toe) then
                    toe:=true;
            i:=i+1;
        until (i=256) or error or (ord(strg[i])=0);
    until not error;
         output:=buffer;
         if negative then 
            output:=output*(-1);
    end;

procedure stringtoint(var output:integer; haverange: boolean; max, min: integer);

var
inrange: boolean;

    begin
    inrange:=true;
    repeat
        stringtointc(output);
        If ((output>max) or (output<min)) and haverange then
            begin
            write('Out of range! Please input again:');
            inrange:=false
            end
            else
            inrange:=true
    until (inrange);
    end;

procedure quit(var tryagain: boolean);
    Begin
    writeln('Do you want to quit? (Y/N)');
    clarify;
    writeln(x);
    If (x='Y') or (x='y') then
        tryagain:=false
    End;

Procedure levelup(var tryagain: boolean);
    Begin
    If level<>4 then
        Begin
        writeln ('Time to level up? (Y/N)');
        clarify;
        If (x='Y') or (x='y') then
            level:=level+1
            Else
            quit(tryagain);
        end
        Else
        tryagain:=false;
    End;


   
   
   
Procedure head;
   begin
   writeln('********************************************************************************');
   writeln('*                                                                              *');
   writeln('*                                                                              *');
   End;
   
Procedure middle;
   begin
   writeln('*                                                                              *');
   writeln('*                                                                              *');
   End;
   
Procedure base;
   begin
   writeln('*                                                                              *');
   writeln('*                                                                              *');
   writeln('********************************************************************************');
   End;
   



   
procedure choosed;
   Begin
   head;
   Case gamenum of 
      '1':writeln('*                    Game you choosed: Number Guessing Game                    *');
      '2':writeln('*                        Game you choosed: Mark Six Game                       *');
      '3':writeln('*                        Game you choosed: Magic Matrix                        *');
      End;
   writeln('*                                                                              *');
   End;


procedure menu;
    Begin
    repeat
        Repeat
            Begin
            x:=' ';
            head;
            writeln('*                       SGSS TISA Mini Games Collection                        *');
            middle;
            writeln('*                                                                              *');
            writeln('*                   Please press 1 to start Guess a Number!                    *');
            writeln('*                                                                              *');
            writeln('*                       Please press 2 to start Mark Six                       *');
            writeln('*                                                                              *');
            writeln('*                     Please press 3 to start Magic Matrix                     *');
            writeln('*                                                                              *');
            writeln('*                          Press space bar for help                            *');
            writeln('*                                                                              *');
            writeln('*                              Press x to exit                                 *');
            base;
            Repeat 
                readln(gamenum);
            Until (gamenum='1') or (gamenum='2') or (gamenum='3') or (gamenum='x') or (gamenum=' ');
            If gamenum=' ' then
                Begin
                head;
                writeln('*      Game 1: Guess a Number!                                                 *');
                writeln('*                                                                              *');
                writeln('*    ->In each round, you will have 5 chances to guess the correct number.     *');
                writeln('*    ->The correct number will changes over rounds.                            *');
                writeln('*    ->There are 4 levels for you to play. The difficulty of each level        *');
                writeln('*      differs in the possible range of the correct number.                    *');
                middle;
                writeln('*      Game 2: Mark Six                                                        *');
                writeln('*                                                                              *');
                writeln('*    ->In each round, you will have to input 6 numbers (No extra number).      *');
                writeln('*    ->The winning numbers will changes over rounds.                           *');
                writeln('*    ->There are 4 levels for you to play. The difficulty of each level        *');
                writeln('*      differs in the possible range of the winning numbers.                   *');
                middle;
                writeln('*      Game 3: Magic Matrix                                                    *');
                writeln('*                                                                              *');
                writeln('*    ->This is a game for 2 or more players.                                   *');
                writeln('*                                                                              *');
                writeln('*    ->The game uses a table of size n × n (i.e. a table with n rows and       *');
                writeln('*      n columns) where n is an integer whose value is between 2 and 8         *');
                writeln('*      inclusively. Each cell in the table is referenced by a row number       *');
                writeln('*      and a column number.                                                    *');
                writeln('*                                                                              *');
                writeln('*    ->At the beginning of the game, you will be asked to input n, and         *');
                writeln('*      then it creates a table of size n × n. The value of each cell in        *');
                writeln('*      the table is an integer randomly generated between 0 and 9              *');
                writeln('*      inclusively.                                                            *');
                writeln('*                                                                              *');
                writeln('*    ->Each of the two players chooses any one of the cells in the table       *');
                writeln('*      in turn. After a player has chosen a cell, the content of the           *');
                writeln('*      table is updated according to the following rules.                      *');
                writeln('*                                                                              *');
                writeln('*          Rule A: In all cases, if the value in a cell is 0, it will          *');
                writeln('*                  remain 0.                                                   *');
                writeln('*          Rule B: The value in the chosen cell will decrease by 1             *');
                writeln('*          Rule C: The value(s) in the cell(s) of the same row will            *');
                writeln('*                  decrease by 1.                                              *');
                writeln('*          Rule D: The value(s) in the cell(s) of the same column will         *');
                writeln('*                  decrease by 1.                                              *');
                writeln('*                                                                              *');
                writeln('*    ->At the end of each turn, if ANY of the following 3 conditions is        *');
                writeln('*      satisfied, the player of that turn wins, and the game ends.             *');
                writeln('*                                                                              *');
                writeln('*          Condition 1: The sum of the values in any row is 0.                 *');
                writeln('*          Condition 2: The sum of the values in any column is 0.              *');
                writeln('*          Condition 3: The sum of the values in any diagonal is 0.            *');
                middle;
                writeln('*                                                                              *');
                writeln('*                                  Have fun!                                   *');
                writeln('*                                                                              *');
                writeln('*                Please press enter to go back to the main menu.               *');
                base;
                readln;
                end;
            End;
        Until (gamenum='1') or (gamenum='2') or (gamenum='3') or (gamenum='x');
        If (gamenum='1') or (gamenum='2') then
            Begin
            choosed;
            writeln('*                   Please choose a level to play (1/2/3/4):                   *');
            writeln('*                                                                              *');
            writeln('*                      Press x to go back to the main menu                     *');
            base;
            stringtochar(x, false);
            If (x<>'1') and (x<>'2') and (x<>'3') and (x<>'4') and (x<>'x') then 
                Begin
                choosed;
                writeln('*                          Please clarify your choice:                         *');
                base;
                Repeat 
                    stringtochar(x, false)
                Until (x='x') or (x='1') or (x='2') or (x='3') or (x='4') ;
                End;
            Case x of
                '1': level:=1;
                '2': level:=2;
                '3': level:=3;
                '4': level:=4;
                End;
            End
            else 
            if gamenum='x' then
                exit:=true;
    until x<>'x';
    End;
 
  

   
Procedure restart(var tryagain: boolean);
    Begin
    write('Do you want to restart the the game and try again? (Y/N)');
    clarify;
    If (x='Y') or (x='y') then
        Begin
        If (level<>1) and (win=false) then 
            Begin
            write('Do you to try an easier version of the game? (Y/N)');
            clarify;
            If (x='Y') or (x='y') then 
                Begin 
                level:=level-1;
                writeln('Difficulty downgraded. It is level ', level, 'now.');
                end;
            End;
        End
        Else
        quit(tryagain)
    End;











Procedure game1;
Type
arraya=array [1..999,0..5] of integer;

var                              
chance, ra, rb, rc, rd:integer;
data1: arraya;
tryagain: boolean;

    procedure compare;
    begin
    If data1[(ra+rb+rc+rd),chance]>data1[(ra+rb+rc+rd),0] then 
    writeln ('(Hint: Your number is too big.)') 
    else 
    writeln ('(Hint: Your number is too small.)');
    End;

    procedure congrat;
    Begin
    chance:=chance+1;
    win:=true;
    writeln('Congratulations! You are right!');
    levelup(tryagain);
    end;
   
    Procedure Summary1;
    var
    i, j: integer;
    Begin
    head;
    writeln('*  Summary:                                                                    *');
    writeln('*                                                                              *');
    if ra<>0 then
    writeln('*    No. of rounds used on level 1:', ra:2, '                                          *');
    if rb<>0 then
    writeln('*    No. of rounds used on level 2:', rb:2, '                                          *');
    if rc<>0 then
    writeln('*    No. of rounds used on level 3:', rc:2, '                                          *');
    if rd<>0 then
    writeln('*    No. of rounds used on level 4:', rd:2, '                                          *');
    writeln('*   Total no. of rounds played:', (ra+rb+rc+rd):3, '                                             *');
    middle;
    For i:=1 to (ra+rb+rc+rd) do
        Begin
        j:=1;
        Write('*   Correct answer of round ', i, ': ', data1[i,0]);
        If data1[i,0]<10 then write(' ');
        writeln('                                              *');
        Repeat
            Begin
            Case j of 
            1:Write('*    1st');
            2:Write('*    2nd');
            3:Write('*    3rd');
            4:Write('*    4th');
            5:Write('*    5th');
            end;
            write(' No. you guessed: ', data1[i,j]);
            case data1[i,j] of
            0..9: write('     ');
            10..99,-9..-1: write('    ');
            100..999,-99..-10:write('   '); 
            1000..9999,-999..-100:write('  '); 
            10000..32767,-9999..-1000: write(' ')
            end;
            writeln('                                               *');
            j:=j+1;
            end
        until (data1[i, (j-1)]=data1[i,0]) or (j=6);
        writeln('*                                                                              *');
        End;
    writeln('*                                                                              *');
    If win=false then
    writeln('*                             G A M E  O V E R !                               *')
    else
    If (level=4) and (data1[(ra+rb+rc+rd),chance]=data1[(ra+rb+rc+rd),0]) then
    If rd=1 then
    writeln('*  Congratulations! You used just 1 round to beat the game!                    *')
    else 
    If rd<10 then 
    writeln('*  Congratulations! You used ', rd, ' rounds to beat the game!                        *')
    else 
    writeln('*  Congratulations! You used ', rd, ' rounds to beat the game!                       *');
    middle;
    writeln('*                          Press enter to continue                             *');
    base;
    readln;
    end;




    Begin
    tryagain:=true;
    win:=true;
    Randomize;
    exit:=false;
    ra:=0;
    rb:=0;
    rc:=0;
    rd:=0;
    Repeat
        begin
        Case level of
        1: ra:=ra+1;
        2: rb:=rb+1;
        3: rc:=rc+1;
        4: rd:=rd+1
        End;
        data1[(ra+rb+rc+rd),0]:=random(level*20+1);
        {writeln(d[(ra+rb+rc+rd),0]);}
        {correct:=1; For testing}
        chance:= 1;
        write('Guess a number within 0-', level*20, ':');
        stringtoint(data1[(ra+rb+rc+rd),chance], false, level*20, 0);
        If data1[(ra+rb+rc+rd),chance] <> data1[(ra+rb+rc+rd),0] then 
            Begin 
            Repeat 
                Begin 
                writeln ('That is a wrong answer! Guess again!');
                If chance<4 then
                writeln ('You have ', (5-chance), ' chances left.  ')
                else 
                writeln ('This is your last chance.');
                compare;
                chance:= chance + 1;
                stringtoint(data1[(ra+rb+rc+rd),chance], false, level*20, 0);
                End
            until (chance=5) or (data1[(ra+rb+rc+rd),chance] = data1[(ra+rb+rc+rd),0]);
            If data1[(ra+rb+rc+rd),chance] <> data1[(ra+rb+rc+rd),0] then
                Begin
                writeln ('No more chance!');
                compare;
                restart(tryagain);
                End
            Else
            congrat;
            End
        Else
        congrat;
        writeln(tryagain);
        end
    Until not tryagain;
    Summary1;
    end;
    
    
    
    
    
    
    
    
    
    

    
    
Procedure game2;
type
game2datatype=array [0..999,1..6] of integer;
var
pcdata, userdata: game2datatype;
i, j, round:integer;
mark: array [1..999] of integer;
luck: real;
tryagain: boolean;
pointer: array[0..6] of integer;

procedure sort;
var
j,back, fro: integer;
finish: boolean;
    begin
    back:=0;
    j:=1;
    finish:=false;
    while (j<>i) and (not finish) do
        begin
        If (pcdata[round,pointer[back]]>pcdata[round,i]) then
            begin
            pointer[i]:=pointer[back];
            pointer[back]:=i;
            If j<>(i-1) then
                finish:=true;
            end
            else
            If j=(i-1) then
                pointer[pointer[back]]:=i;
        back:=pointer[back];
        j:=j+1;
        end;
    end;
    

function datarepeat(var data: game2datatype; var range: integer):boolean;
var
k,l: integer;
   
   begin
   k:=1;
   datarepeat:=false;
   repeat
      l:=1;
      repeat
         if (data[round,k]=data[round,l]) and (k<>l) then
            datarepeat:=true;
         l:=l+1;
      until datarepeat or (l=range+1);
      k:=k+1;
   until datarepeat or (k=range+1)
   end;

procedure userdatarepeat;
    Begin
    stringtoint(userdata[round,i],true,(49-10*(4-level)),1);
    writeln(userdata[round,i]);
    while datarepeat(userdata,i) do
        begin
        writeln('Please do not repeat your choice!');
        stringtoint(userdata[round,i],true,(49-10*(4-level)),1);
        end;
    end;
    
procedure pcdatarepeat;
   Begin
   repeat
      pcdata[round,i]:=random(49-10*(4-level))+1;
   until not datarepeat(pcdata,i)   
   End;

    Begin
    randomize;
    tryagain:=true;
    round:=1;
    pointer[0]:=1;
    Repeat
        Begin
        mark[round]:=0;
        For i:=1 to 6 do
            Begin
            If i=1 
                then write('Please input a number from 1 to ', (49-10*(4-level)), ':')
                else
                Begin
                write('Please input the ');
                Case i of
                2:write('2nd');
                3:write('3rd');
                4:write('4th');
                5:write('5th');
                6:write('6th');
                End;
                write(' number:');
                End;
            userdatarepeat;
            End;
        pcdata[round,1]:=random(49-10*(4-level))+1;
        For i:=2 to 6 do
            Begin
            pcdatarepeat;
            sort;
            For j:=1 to 6 do
            If userdata[round,j]=pcdata[round,i] then 
            mark[round]:=mark[round]+1;
            End;
        writeln('Your mark: ', mark[round]);
        write('The 6 numbers are');
        j:=0;
        for i:=1 to 6 do
            begin
            write(' ',pcdata[round,pointer[j]]);
            j:=pointer[j];
            if i<>6 then write(',');
            end;
        writeln('.');
        If mark[round]>2 then 
        levelup(tryagain) 
        else 
        restart(tryagain);
        round:=round+1;
        End
    Until (tryagain=false);
    If round>3
        then
        Begin
        For i:=1 to (round-1) do
            begin
            luck:=mark[i]/6;
            end;
        luck:=luck/(round-1);
        head;
        writeln('*               Congratulations! You''ve activated an Easter Egg!               *');
        writeln('*                                                                              *');
        writeln('*                         Based on your in-game result,                        *');
        writeln('*                         Your luck is ', (luck*100):0:2,'/100 today.                         *');
        base;
        writeln;
        end;
    End;










procedure game3;
type
rec=array[0..65, 1..8, 1..8] of integer;
aidatatype= array[1..64,1..2] of integer;
var
ppl, n, turn, airow, aicolumn,haveai: integer;                              {turn: Store player number of the current turn}               {n: Store table size}
rp:rec;
ch:array[1..65, 1..2] of integer;                   {Store row number}{Store column number}




function ENDG(square:rec):boolean; {true:row     false:column}

var a, c:integer;
    diag1, diag2:boolean;

procedure sumrc (c:boolean;a:integer);
var b:integer;
    flag:boolean;
    
    Begin 
    b:= 1;
    flag:= true;
    Repeat 
        Begin 
        If c then 
            Begin 
            If square[turn, a, b] <> 0 then
            flag:= false;
            End 
        Else 
        If square[turn, b, a] <> 0 then 
        flag:= false;
        b:= b + 1;
        End;
    Until (not flag) or (b = n + 1);
    If flag then 
    ENDG:= true;
    End;


    Begin 
    a:= 1;
    diag1:= true;
    diag2:= true;
    ENDG:= false;
    Repeat 
        Begin 
        c:= n+1-a;
        If diag1 then 
        If ((square[turn, a, a] <> 0) or (square[turn, n + 1 - a, n + 1 - a] <> 0)) 
        then diag1:= false;
        If diag2 then 
        If (square[turn, a, n + 1 - a] <> 0) or (square[turn, n + 1 - a, a] <> 0) then 
        diag2:= false;
        If (square[turn, a, a] = 0) and (square[turn, a, n + 1 - a] = 0) then 
        sumrc (true, a);
        IF (square[turn, n + 1 - a, n + 1 - a] = 0) and (square[turn, n + 1 - a, a] = 0) then
        sumrc (true, c);
        IF (square[turn, a, a] = 0) and (square[turn,n + 1 - a, a] = 0) then
        sumrc (false, a);
        IF (square[turn,n + 1 - a, n + 1 - a] = 0) and (square[turn,a, n + 1 - a] = 0) then
        sumrc (false, c);
        a:= a + 1;
        End 
    Until ENDG or (a = (n + (n mod 2)) / 2 + 1);
    If diag1 or diag2 then 
    ENDG:= true;
    {writeln(diag1,diag2);}
    End;




procedure show2(rp:rec);
	{
	Display the contents of the table}
	var r, c:integer;
	Begin
	for r:= 1 to n do
	    Begin
	    for c:= 1 to n do
	    write ((rp[turn, r, c]):2);
	    writeln;
	    End;
	end;

	procedure show;
	{
	Display the contents of the table}
	var r, c:integer;
	Begin
	for r:= 1 to n do
	    Begin
	    for c:= 1 to n do
	    write ((rp[turn, r, c]):2);
	    writeln;
	    End;
	end;
	      {
	      of procedure show}

	      function sqcheck (a:integer):boolean;
	      {
	      Check whether the inputted row or cloumn number is in range or
		  not}
	      Begin If (a < 1) or (a > n) then 
	      sqcheck:= false
	      else
	    sqcheck:= true 
	    End;



	      procedure get_data;
	      {
	      Get the row and column number entered by
		  the players with data validation}
	      begin 
	      write ('Please enter the row number: ');
	      stringtoint(ch[turn, 1],true, n, 1);
	      write ('Please enter the column number: ');
	      stringtoint(ch[turn, 2],true, n, 1)
	      end;
	      {
	      of procedure get_data}


procedure copy(rp:rec; var buffer: rec);
    var
    l,m: integer;
        begin
        for l:= 1 to n do
		      for m:= 1 to n do
		          buffer[turn, l, m]:= rp[turn, l, m];
        end;

procedure process(var rp:rec);              {Implement all the rules mentioned}
var 
a, b:integer;
    begin 
	for a:= 1 to n do
	for b:= 1 to n do
	If ((a=ch[turn, 1]) or (b=ch[turn, 2])) and (rp[turn, a, b]<>0) then
	rp[turn+1, a, b]:= rp[turn, a, b]-1
	else
	rp[turn+1, a, b]:= rp[turn, a, b];
    end;
	      {
	      of procedure process}
	
	function winning(rp:rec):boolean;
    var temturn: integer;
    begin
    winning:=false;
    temturn:=turn;
    process(rp);
    turn:=turn+1;
    If ENDG(rp) then
        winning:=true
        else
        winning:=false;
    turn:=temturn;
    end;
	      
    function luck (square:rec):boolean;
        var 
        sq:rec;
        a, b, c, d, buffer: integer;
        Begin
        buffer:=turn;
        luck:= false;
	    c:= 1;
	    Repeat 
	        Begin 
	        d:= 1;
	        Repeat 
	            Begin 
                copy(square,sq);
		        ch[turn,1]:= c;
		        ch[turn,2]:= d;
		        luck:=winning(sq);
		        d:= d + 1;
		        end;
		    until luck or (d = n + 1);
		    c:= c + 1;
		    end;
         Until luck or (c = n + 1);
         End;
         
   procedure init;                         {Assign random integers to the n x n table}

   var r, c:integer;

      
    


	begin 
	randomize;    {A procedure that initializes a built-in random generator with a random value}
    Repeat 
    for r:= 1 to n do
    for c:= 1 to n do
	     rp[0, r, c]:= random(10);

	Until not (ENDG(rp) or luck(rp));
    end;
			  {
			  of procedure init}
			  

   

    

    



procedure ai;
var
i,j, buffer, killrow,killcolumn, aidataflag2,aidataflag3,aidataflag4, aidataflag1: integer;
killboo: boolean;
aidata2,aidata3,aidata4: aidatatype;

    procedure copypro(origin: rec; var new: rec; i,j: integer);
        begin
        ch[turn,1]:=i;
        ch[turn,2]:=j;
        copy(origin,new);
        process(new);
        turn:=turn+1;
        end;
    procedure getaidata;
    
    var
    i,j,k,l,m, buffer: integer;
    sq:rec;
    
        function kill(sq:rec): integer;
            var
            i,j: integer;
            temturn: integer;
            bufarray:rec;
                
            begin
            temturn:=turn;
            kill:=0;
            for i:=1 to n do
                for j:=1 to n do
                    begin
                    copypro(sq,bufarray,i,j);
                    If not luck(bufarray) then
                        kill:=kill+1;
                    turn:=temturn;
                    end;
            end;
    
        function getkilled: integer;
            var
            i,j, temturn: integer;
            bufarray:rec;
            begin
            temturn:=turn;
            getkilled:=sqr(n);
            i:=1;
            repeat
                j:=1;
                repeat
                    copypro(sq,bufarray,i,j);
                    If kill(bufarray)<getkilled then
                        getkilled:=kill(bufarray);
                    j:=j+1;
                    turn:=temturn;
                until (j=n+1) or (getkilled=0);
                i:=i+1;
            until (i=n+1) or (getkilled=0);
            end;
    
        procedure getdataassign(var aidataflag: integer;var aidata: aidatatype);
            begin
            aidataflag:=aidataflag+1;
            aidata[aidataflag,1]:=i;
            aidata[aidataflag,2]:=j;
            end;
    
        begin
        buffer:=turn;
        aidataflag2:=0;
        aidataflag3:=0;
        aidataflag4:=0;
        killboo:=false;
        i:=1;
        repeat
            j:=1;
            repeat
                begin
                copypro(rp,sq,i,j);
                If not luck(sq) then
                    begin
                    If (kill(sq)=0) then
                        begin
                        killrow:=i;
                        killcolumn:=j;
                        end
                        else
                        begin
                        If (kill(sq)<>1) then
                            begin
                            If getkilled<>0 then
                                getdataassign(aidataflag2,aidata2)
                                else
                                getdataassign(aidataflag3,aidata3);
                            end
                            else
                            getdataassign(aidataflag4,aidata4);
                        end
                    end;
                turn:=buffer;
                j:=j+1
                end
            until (j=n+1) or (killrow<>0);
            i:=i+1
        until (i=n+1) or (killrow<>0);
		end;

    procedure aiassign(aidataflag: integer; aidata:aidatatype);
    
        begin
        aidataflag:=random(aidataflag)+1;
        ch[turn,1]:=aidata[aidataflag,1];
        ch[turn,2]:=aidata[aidataflag,2];
        end;
    
    begin
    i:=1;
    killrow:=0;
    killcolumn:=0;
    Repeat
        j:=1;
        repeat
        ch[turn,1]:=i;
        ch[turn,2]:=j;
        j:=j+1 
        until winning(rp) or (j=(n+1));
        i:=i+1;
    until winning(rp) or (i=(n+1));
    If (not winning(rp)) then
        begin
        getaidata;
        If killrow=0 then
            begin
            If (aidataflag2<>0) then
                begin
                writeln('Second choice');
                aiassign(aidataflag2,aidata2);
                end
                else
                begin
                If (aidataflag3<>0) then
                    begin
                    writeln('Third choice');
                    aiassign(aidataflag3,aidata3);
                    end
                    else
                    begin
                    If (aidataflag4<>0) then
                        begin
                        writeln('Fourth choice');
                        aiassign(aidataflag4,aidata4);
                        end
                        else
                        begin
                        writeln('random');
                        ch[turn,1]:=random(n)+1;
                        ch[turn,2]:=random(n)+1;
                        end;
                    end;
                end;
            end
            else
            begin
            ch[turn,1]:=killrow;
            ch[turn,2]:=killcolumn;
            end
        end;
    end;
    
procedure replay;
var 
a, b:integer;
x:char;
			  
	begin
	writeln('Do you want to watch the instant replay before quitting the game?(Y/N)');
	readln (x);
	If (x = 'y') or (x = 'Y') then
	    begin 
	    writeln('Replay') 
	    end 
    end;

        
        
        begin
        haveai:=0;
        write('Enter the number of players (1-9): ');
        stringtoint(ppl, true, 9, 1);
        If ppl=1 then 
            begin
            writeln('A bot has been assigned to play with you.');
            haveai:=2;
            ppl:=ppl+1;
            end;
      write('Enter the size of table (2-8): ');
      stringtoint(n, true, 8, 2);
      turn:=0;
      init;
      writeln ('A ', n:1, ' X ', n:1, ' table is generated and the values of the cells are > ');
      turn:=0;
      show;
      Repeat 
         begin 
         writeln;
         If ((turn mod ppl)+1)<>haveai then
            begin
            writeln ('Turn > Player ', (turn mod ppl) + 1:2);
            get_data;
            end
            else
            begin
            writeln ('Turn > Bot ');
	        ai;
	        writeln('row choosed: ',ch[turn,1]);
	        writeln('column choosed: ',ch[turn,2]);
	        end;
	        process(rp);
            writeln;
         turn := turn + 1;
	      writeln('The values of the cells in the table are >');
	      show;
	      end;
      Until ENDG (rp);
      writeln;
      If (((turn-1) mod ppl)+1)<>haveai then
        writeln ('Player ', ((turn-1) mod ppl)+1,  ' wins the game.')
        else
        writeln('Bot wins the game.');
      writeln('Please press enter to continue.');
    {replay
    writeln('Press Enter to go back to the main menu');}
      readln;
      end;
  
Begin 
Repeat
    Begin
    menu;
    Case gamenum of
    '1':game1;
    '2':game2;
    '3':game3;
    end;
    end
Until exit;
head;
writeln('*                                  Bye!                                        *');
writeln('*                                                                              *');
writeln('*                                 Credit:                                      *');
writeln('*                                                                              *');
writeln('*                               Programmers:                                   *');
writeln('*                                Tommy Wong                                    *');
writeln('*                                Issac Fung                                    *');
writeln('*                                Samuel Kwok                                   *');
writeln('*                               Antonio Chiu                                   *');
middle;
writeln('*                                 Testers:                                     *');
writeln('*                           Elaine Zhu''s Family                                *');
writeln('*                                  YUNG                                        *');
base;
end.
