
## Encrypting a Word**

We encrypted a word based on a given step/key:

- We traversed the word from end to start to avoid using variables upwards until the counter, `ecx`, becomes 0.
- We ensured that each letter is **uppercase**.
- If a letter is **lowercase**, we added **26** to convert it to uppercase.
- Encryption was applied by adding the encryption key to each letter.

## Finding the Distance Between Two Points**

The distance is calculated as follows:
- We take the first **x-coordinate** and the second. Essentially, the first x is at the beginning of the vector, and the second x is at the position of the first + the size of a point = 4.
- We compare them, and if `x1 < x2`, we find the difference `x2 - x1`; if `x1 > x2`, we find the difference `x1 - x2`. Finally, if they are equal, we compare `y1` with `y2` using the same method.

## Finding the Distance Between Multiple Points**

The procedure is similar to **TASK2.1**, but now we traverse the entire vector of points using a counter that stores the number of points. Traversal is from end to start to save additional registers.

## Checking for Perfect Square Distances**

- We need to determine if the distances found in **TASK2.2** are perfect squares.
- The `esi` register increments from `1` to `n` until `n*n` is <= the largest distance.
- We store the value of `esi` in `al` to apply multiplication.
- We compare `al` with the elements from the distance vector. If it's equal, we enter the `perfect_square` loop and set `ecx` to `1` in the final vector.
- If it's not found, we set it to `0`, entering the `not_perfect` loop.
- We continue this process until all distances are checked.

## Encrypting Text**

- All registers are stored in variables to utilize them in solving the task.
- The procedure functions as follows:
- We extract each letter alternately from `plain_text` and `key` and calculate `key - plain_text`. If the difference is >= `0`, we add `65` to find the encrypted letter. If it's < `0`, we add `26` first, then `65`.
- The key resets each time it reaches its length until it covers the entire length of the unencrypted word.
