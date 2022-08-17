"""
Task 2
Write a recursive version of linear search on an array of integers.

Example input: L = [3,5,7,1,2,9] Target = 5
Example output: Found
Example input: L = [3,5,7,1,2,9] Target = 10
Example output: Not found

"""

def recurLinearSearch(numsList, idx, num):
    if idx == len(numsList):
        return "Not Found"
    else:
        if numsList[idx] == num:
            return "Found"
        else:
            return recurLinearSearch(numsList, idx+1, num)
    
def secondRecLinearSearch(numsList, target):
    if len(numsList) == 0:
        return "Not Found"
    elif numsList[0] == target:
        return "Found"
    else:
        return secondRecLinearSearch(numsList[1:], target)

# main


print(recurLinearSearch([3,5,7,1,2,9], 0, 5))
print(recurLinearSearch([3,5,7,1,2,9], 0, 10))

print(secondRecLinearSearch([3,5,7,1,2,9], 5))
