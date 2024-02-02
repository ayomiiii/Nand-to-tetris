// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

 //Project: Input two values to get Multiplication using Addition and subtraction
  // Pseudo codeset two values into two registers respectively
//set another Register to initialize the result to 0
//Create a loop to add result to the first value. 
//End the loop if and only if the second value is <=0
//Create another loop to subtract the second value by 1
//End the loop when the second value ==0

@RO  //address of the first register
@R1  //address of the second register

@R2
M=0      // Initialize result  to 0

(LOOP)
@R1   
D=M
@END      // If R1 <= 0, terminate
D;JLE

@R0
D=M 

@R2
M=M+D    // Add R0 to R2.
@R1
M=M-1    // Decrease R1 by 1
@LOOP
0;JMP
(END)

@END 
0;JMP
