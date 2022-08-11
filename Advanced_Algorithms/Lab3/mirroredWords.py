"""
Task 1

Write a program that reads n words from the standard input, separated by spaces and prints them
mirrored (the mirroring function should be implemented recursively). Note that we are not simply
reversing the string. The words stay in the same order – but the letters in each word are reversed.

Example input: n = 4 day time you is
Example output: yad emit ouy si

"""

def mirrorWords(str):
    if str == "":
        return str
    else:
        rword, str = split_and_reverse(str)
        return rword + mirrorWords(str)
    
def split_and_reverse(s):
    word = ""
    while s != "":
        word = s[0] + word
        s = s[1:]
        if s == "":
            return word, s
        elif s[0] == " ":
            return word + " ", s[1:]
    """
    # Iterative method O(n)
    newWord = ""
    strList = list(str.split(" "))
    i = 0
    for word in strList:
        revWord = "".join(reversed(word))
        revWord += " "
        newWord += revWord
    print(newWord)
    """



# main

print(mirrorWords("day time you is"))