# Move Zeros
# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
# Example:
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Example Input: [0,0,11,2,3,4]					
# Example Output: [11,2,3,4,0,0]

def moveZero(li):
    zero_list = []
    i = 0
    while 0 in li:
        if li[i] == 0:
            li.remove(li[i])
            zero_list.append(0)
        else:
            i += 1
    li = li + zero_list
    print(li)


moveZero([0,1,0,3,12])



def moveZero2(li):

    i = 0
    j = len(li)
    while i < j:
        if li[i] == 0:
            li.remove(li[i])
            li.append(0)
            i += 1
        else:
            i += 1
    print(li)

moveZero2([0,1,0,3,12])


