"""
BUBBLE_SORT(A)
    swap ← TRUE
    WHILE swap is TRUE:
        swap ← FALSE
        FOR i ← 0 to length(A)-1
            IF A[i] > A[i+1]
                swap ← TRUE
                A ← SWAP(A, i, i+1)
    RETURN A

"""

# bubble sort section
def bubbleSort(nums):
    swap = True
    while swap is True:
        swap = False
        for i in range(0, len(nums)-1):
            if(nums[i] > nums[i+1]):
                swap = True
                nums[i], nums[i+1] = nums[i+1], nums[i]
    return nums

# main
print(bubbleSort([5,2,1,3,4]))
print(bubbleSort([100,78]))
print(bubbleSort([9, 2, 4, 100, 23]))