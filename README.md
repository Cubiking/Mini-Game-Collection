# Mini-Game-Collection
This game collection consists of 3 games: Guess a Number!, Mark Six and Magic Matrix

Please go to the 'help' page of the program for the tutorial of the games.

Link for quick looks (may not be the most updated version): https://onlinegdb.com/_-ZEuxLg_

## Documentation for Global Procedures

### stringtochar
 
Convert the input data of string type into a character (Y/N/y/n) while rejecting invalid input to prevent the program from crashing.  

### stringtointc ('c' stands for core)

Convert the input data of string type into an integer while rejecting invalid input to prevent the program from crashing. The optima of the 'valid' inputs are 32767
and -32768 to ensure the completemess of the UI of game 1 summary.

### stringtoint

Check the range of the returned integral value of procedure stringtoint.

### head, middle, base

UI procedures for reducing the number of lines of the code.

## Documentation for Local Procedures of Guess a number!

## Documentation for Local Procedures of Mark Six

### userdatarepeat

Check whether the user has input repeated data with function datarepeat.

### pcdatarepeat

Check whether drawn numbers are generated repeatedly with function datarepeat.

## Documentation for Local Procedures and Functions of Magic Matrix

### copy

Copy the n x n array of the same 'turn' from an array of rec type to another.

### luck

Determine whether the current state of the magic matrix can be ended with one player's victory.

### ai

Win rate: {killrow/killcolumn=100%}>aidata2(prevent player wins)>aidata3(no end game tendancy)>aidata4(player can win with the right choice)

### (replay)

In development...

# Credit

Cubiking's Professional Supervisor: [emailechiu](https://github.com/emailechiu)

Invaluable bug reports are welcomed.
