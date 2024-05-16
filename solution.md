# About the input text file

The last solution must be ended with a stray white space or enter, or
the bomb can not get the proper input

# Phase 1:

Enter: `Border relations with Canada have never been better.`

# Phase 2:

Enter six numbers, where the first number must be 1, and each subsequent number is twice the previous number.

# Phase 3:

2 or more numbers, the first number must be a natural number less than 8.

The second number should be a specific number depending on the first number entered:
- 207(0xcf), if the first number is 0.
- 311(0x137), if the first number is 1.
- 707(0x2c3), if the first number is 2.
- 256(0x100), if the first number is 3.
- 389(0x185), if the first number is 4.
- 206(0xce), if the first number is 5.
- 682(0x2aa), if the first number is 6.
- 327(0x147), if the first number is 7.

more numbers can come after the second number, but they does not affect the result.

# Phase 4：
2 numbers, 7 and 0.

# Phase 5:
A string of 6 characters, each character's low 4 bits will be used as an index,
accessing the string at addres 0x4024bc, whoes content is "maduiersnfotvbylSo you think you can stop the bomb with ctrl-c, do you?", composing another string.

Then the composed string will be compared with "flyers", if the two strings are the same, this phase is defused.

Thus a possible solution is `9onefg`

# Phase 6:
Six numbers.
The first number must be less than or equal to 6.
All the rest 5 numbers can not be as the same as the first number.
