"""
Write the pseudocode and code for a function that determines whether an array is a palindrome (reads
the same in both directions).

Example input: L = [1,3,6,6,3,1]
Example output: True
Example input: L = [2,5,8,9,1]
Example output: False

"""
# method 1 with checking last element that matches
def palindrome(array):
    if(len(array) <= 1):
        return False
    for i in range(0, len(array)):
        if array[i] != array[len(array)-1-i]:
            return False
    return True

# method 2 with recursion
def palindromeTwo(array):
    if len(array) < 2: # base case
        return True
    elif array[0] == array[len(array)-1]:
        return palindromeTwo(array[1:len(array)-1]) # recursive case
    return False

# main
print(palindromeTwo([1,3,6,6,3,1])) # true
print(palindrome([2,5,8,9,1])) # false