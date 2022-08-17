"""
The rules are:
 Only one disc can be moved at a time.
 No disc can be placed on top of a smaller disc.

The transformation with 3 discs takes 7 moves.

"""
# a is source, b is aux, c is dest
def TowerOfHanoi(n, a, b, c):
    if n > 0:
         # move tower of size n - 1 to helper:
        TowerOfHanoi(n-1, a, c, b)
        print("moving disc from " + str(a) + " to " + str(c))
        TowerOfHanoi(n-1, b, a, c)



  

#main
n = 4
TowerOfHanoi(n, 1, 2, 3)


# Solution
def towers_of_hanoi(n, Strut1, Strut2, Strut3):
    if n > 0:
        towers_of_hanoi(n - 1, Strut1, Strut3, Strut2)
        if Strut1[0]:
            disc = Strut1[0].pop()
            print ("moving " + str(disc) + " from " + Strut1[1] + " to " + Strut3[1])
            Strut3[0].append(disc)
        towers_of_hanoi(n - 1, Strut2, Strut1, Strut3)
        
Strut1 = (['large disc','middle disc','small disc'], "Strut 1")
Strut2 = ([], "Strut 2")
Strut3 = ([], "Strut 3")

towers_of_hanoi(len(Strut1[0]),Strut1,Strut2,Strut3)