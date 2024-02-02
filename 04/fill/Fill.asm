// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.
// Interactive pixel toggler in Hack assembly language
// Toggles pixels on the screen when the space bar is pressed

// Interactive pixel toggler in Hack assembly language
// Toggles the entire screen when the space bar is pressed

@SCREEN
D=A
@R0  // Use R0 instead of SP
M=D  // Initialize R0 to SCREEN

// Infinite loop
(LOOP)
  // Check if the space bar is pressed
  @KBD
  D=M
  @SPACE
  D=D-A
  @SPACE_PRESSED
  D;JEQ  // Jump to SPACE_PRESSED if D is zero (space bar pressed)

  // Space bar not pressed, turn off entire screen
  @SCREEN
  D=A
  @R0  // Use R0 instead of SP
  A=M
  M=0  // Set pixel value to 0 (off)

  @CONTINUE
  0;JMP  // Jump to CONTINUE

(SPACE_PRESSED)
  // Space bar pressed, turn on entire screen
  @SCREEN
  D=A
  @R0  // Use R0 instead of SP
  A=M
  M=-1  // Set pixel value to -1 (on)

  @CONTINUE
  0;JMP  // Jump to CONTINUE

(CONTINUE)
  // Continue the loop
  @LOOP
  0;JMP
