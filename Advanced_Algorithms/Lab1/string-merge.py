"""
Write a method that combines two strings, by taking one character from the first string, then one from
the second string and so on. Once one string has no characters left it should carry on with the other
string.

Example 1:
Input:  s1 = "day" s2 = "time" (one string is longer than the other)
Output: "dtaiyme"
Example 2:
Input: s1 = "spice" s2 = "girls" (both strings are the same length)
Output: "sgpiircles"
"""
from heapq import merge


def mergeString(s1, s2):
    
    total_length = 0
    if(len(s1) > len(s2)):
        total_length = len(s1)
    else:
        total_length = len(s2)

    result = ""

    for i in range(0, total_length):
       # print(i)
        if i < len(str1) and i < len(str2):
            result += str1[i]
            result += str2[i]
        elif i < len(str2):
            result += str2[i]
        elif i < len(str1):
            result += str1[i]
    return result

def mergeRecur(str1, str2):
    if not str1:
        return str2
    elif not str2:
        return str1
    else:
        return str1[0] + str2[0] + mergeRecur(str1[1:], str2[1:])

# string 2 is longer
str1 = "day"
str2 = "time"
print(mergeRecur(str1,str2))

# strings same length
str1 = "spice"
str2 = "girls"
print(mergeString(str1,str2))

# string1 is longer
str1 = "john"
str2 = "bre"
print(mergeString(str1,str2)) # jborhen

# string empty
str1 = "john"
str2 = ""
print(mergeString(str1,str2))

