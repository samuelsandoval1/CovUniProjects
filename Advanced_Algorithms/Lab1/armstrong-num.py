"""
Armstrong Numbers Standard:
Check if a 3 digit number is an Armstrong number. An Armstrong number of three digits is an integer
such that the sum of the cubes of its digits is equal to the number itself. For example, 371 is an
Armstrong number since 3**3 + 7**3 + 1**3 = 371.
Why? Because 3**3 is 33, i.e. 3 * 3 * 3, which is 27; then 73 is 7 * 7 * 7, which is 343; and 13 is 1 * 1 *
1, which is 1. So if we add up these results, 27 + 343 + 1 = 371.


"""

def armstrongNum(num):
    result = ""
    resultNum = 0
    originalNum = num
    print(originalNum)
    while (originalNum != 0):
        remainder = originalNum % 10
        resultNum += remainder ** 3
        originalNum //= 10
    if resultNum == num:
        return "Yes"
    return "No"

def classSolutionArmstrong(num):
    numStr = str(num)
    result = 0
    for i in range(len(numStr)):
        result = result + (int(numStr[i])**len(numStr))
    if num != result:
        return "No"
    return "Yes"

# main section
print(armstrongNum(371))  # Yes
print(armstrongNum(153)) # Yes
print(armstrongNum(200)) # No
print(armstrongNum(800)) # No
