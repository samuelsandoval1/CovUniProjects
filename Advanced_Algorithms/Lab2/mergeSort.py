"""
MERGE-SORT(L)
    IF length(L) <= 1
        RETURN L
    a←L[0 .. length(L/2)]
    b←L[length(L)/2 .. length(L)]
    
    a←MERGE-SORT(a)
    b←MERGE-SORT(b)
    RETURN MERGE(a,b)

MERGE(a,b)
    out ← array of length (length(a)+length(b))
    i←0
    j←0
    k←0
    WHILE i < length(a) AND j < length(b)
        IF a[i] < b[j]
            out[k] ← a[i]; i++
        ELSE
            out[k] ← b[j]; j++
        k++
    WHILE i < length(a)
        out[k] ← a[i]; i++; k++
    WHILE j < length(b)
        out[k] ← b[j]; j++; k++
    RETURN out

"""

# mergeSort
def merge(a, b):
    out = [None] * (len(a) + len(b))
    i = j = k = 0
    while i < len(a) and j < len(b):
        if a[i] < b[j]:
            out[k] = a[i]
            i += 1
        else:
            out[k] = b[j]
            j += 1
        k += 1
        
    while i < len(a):
        out[k] = a[i]
        i += 1
        k += 1
    while j < len(b):
        out[k] = b[j]
        j += 1
        k += 1   

    return out


def mergeSort(L):
    if len(L) <= 1:
        return L
    a = L[:len(L)//2]
    b = L[len(L)//2:]
    a = mergeSort(a)
    b = mergeSort(b)
    return merge(a,b)


# main
print(mergeSort([5,2,1,3,4]))
print(mergeSort([100,78]))
print(mergeSort([9, 2, 4, 100, 23]))
print(mergeSort([54,26,93,17,77,31,44,55,20]))

