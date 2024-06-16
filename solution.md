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
Every number must be in the range of 1 to 6, and no number can be repeated.
In the memory there is a node list, with the value of each being like this:
0x14c -> 0xa8 -> 0x39c -> 0x2b3 -> 0x1dd -> 0x1bb
The input numbers will be used as the index to access the node list in order, but each number will not be used as an index directly, it will be used to subtract 7 from first.
The program will check whether the rearranged node list is in the descending order, if it is, this phase is defused.
Thus, the solution should be:
4 3 2 1 6 5
Which will be interpreted as:
3 4 5 6 1 2

# Secret Phase:
When defuse the phase 4, append the string "DrEvil" after the number 0, then the secret phase will be entered after the phase 6.

This phase requires a number as input.

There is a tree structure in the memory location 0x6030f0:
```
                                 36
                                /   \
                               /     \
                              8       50
                             / \      / \
                            /   \    /   \
                           6    22  45    107
                          / \  / \  / \    /  \
                         1  7 20 35 40 47  99 233

```         
The secret phase will call the fun7 to traverse the tree with a target value.
The target value is your input number. It's logic is like:
```c
int fun7(struct treeNode* p, int v)
{
    if (p == NULL)
        return -1;
    else if (v < p->data)
        return 2 * fun7(p->leftChild, v);
    else if (v == p->data)
        return 0;
    else 
        return 2 * fun7(p->rightChild, v) + 1;
}
```

Thus the solution is 22.