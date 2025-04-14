# Handling D-pad input

Holding down button should not cause repeated input

## Option 1: Drop all repeat inputs
Should check previous input checked from clock positive edge
-> Drop all inputs that equal to previous input

-> This could prevent user from repeatedly using same direction when it might actually progress game state

## Option 2: Have significant delay for repeated inputs
Use clock divider to have a significant amount of delay
-> Around the level of seconds, allows user to use same direction multiple times

-> Gameplay might feel sluggish or jarring, especially when we don't have animations

# Handling tile moving

Need to handle tiles moving through empty squares

Example of down input
```
+----+----+----+----+       +----+----+----+----+
|  0 |  0 |  2 |  4 |       |  0 |  0 |  0 |  0 |
+----+----+----+----+       +----+----+----+----+
|  0 |  0 |  0 |  0 |       |  0 |  0 |  0 |  0 |
+----+----+----+----+ -->   +----+----+----+----+
|  0 |  0 |  0 |  2 |       |  0 |  0 |  0 |  4 |
+----+----+----+----+       +----+----+----+----+
|  0 |  0 |  0 |  0 |       |  0 |  0 |  2 |  2 |
+----+----+----+----+       +----+----+----+----+
```
When we move d-pad in direction all tiles move through 0(Empty) slots and pile up in order

## Option 1: Put numbers into fifo queue while dropping 0s
Handle game state in 4 rows and 4 columns, when inputting left or right check in terms of rows when inputting up or down check in columns
```
+----+----+----+----+
|  0 |  1 |  2 |  3 |
+----+----+----+----+
|  4 |  5 |  6 |  7 |
+----+----+----+----+
|  8 |  9 | 10 | 11 |
+----+----+----+----+
| 12 | 13 | 14 | 15 |
+----+----+----+----+
```
Read the values in order from 15 -> 11 -> 7 -> 3 for down input on column 4
Save those values into a queue = [0, 2, 0, 4]
Drop the zeros = [2, 4] and place them in the same order of 15 -> 11 -> 7 -> 3

-> Need feedback on edge cases



# Handling tile combination

Need to handle same tiles combining to next power of 2

## Option 1: Continue on previous option 1 and check for neighboring same numbers
```
+----+----+----+----+
|  0 |  0 |  2 |  2 |
+----+----+----+----+
|  0 |  4 |  2 |  4 |
+----+----+----+----+
|  0 |  0 |  0 |  0 |
+----+----+----+----+
|  0 |  0 |  0 |  0 |
+----+----+----+----+
```
When we input left, we get [2, 2] for row 1 which would combine to [ 4 ], row 2 would be [4, 2, 4] as no neighboring equal values exist in array

-> Do not know if this is unfeasible
