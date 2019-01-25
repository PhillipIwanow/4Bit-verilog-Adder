# 4Bit-verilog-Adder

##Overview
###Purpose 
This circuit takes two 4-bit binary numbers from a user using 4 push buttons, then adds then adds the two binary numbers resulting in 8-bit binary number, which is then converted to BCD(Binary Coded Decimal)

###State Transitions 
This is a FSM(Finite State Machine) the state are load1, load2, and add. The circuit is initialized into load1, which takes in a 4-bit binary number and sets a teporary value equal to the user input. when the user sets sw[0] equal to one then the circuit transitions to load2. load2 like in load2 takes a value from the user and set a temporary value equal to that value, when sw[0] and sw[1] is equal to one the circuit transitions to add.In add the two temporary values are added to together, conversion is done is seperate verilog file, and then sets the display equal to BCD value. When both switches are equal to zero the programs then to state load1 and clears the total.

##Program Structure
###Adder
Adder is the top level module, Adder takes a 4 bit binary inputs from the user. The way user inputs a binary number is throught 4 push buttons which are toggled(see Toggle for detail) then adds the two number, once converted into BCD, this module then outputs the results the outputs being 2 RBG LEd(Red, Green, Blue) and 4 green Led. The first RBG led represents the tens value, the second RBG led tells you what state you are in. and the 4 green Leds display the Current Binary Number the user is inputing and after the total is calculated it then display BCD numbers 0-9.
###bin2bcd
bin2bcd is responsable for converting the binary total to BCD output, both the input and output are both 8 bit in length and conversion is done using the Double Dabble method
###Toggle
Toggle module is how the the user input and corresponding led is remain lit, the way it works is by a FSM with two states off and on. at every posedge of the clock the circuit is checking if user pressed the button if they did then the move to next state and the only to transition states is by button press. 
###FourbitToggle
FourbitToggle is made up four toggle modules and can accept a four bit input and it outputs in four bits.
