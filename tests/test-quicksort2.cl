# This function takes last element as pivot, places 
# the pivot element at its correct position in sorted 
# array, and places all smaller (smaller than pivot) 
# to left of pivot and all greater elements to right 
# of pivot 
def partition(arr : list, low : int, high : int): 
    i = low - 1         # index of smaller element 
    pivot = arr[high]     # pivot 

    for j : int in range(high - low): 
        j = j + low

        # If current element is smaller than or 
        # equal to pivot 
        if arr[j] <= pivot: 
          
            # increment index of smaller element 
            i = i + 1 
            temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp

    temp = arr[i + 1]
    arr[i + 1] = arr[high]
    arr[high] = temp
    return i + 1
  
# The main function that implements QuickSort 
# arr[] --> Array to be sorted, 
# low  --> Starting index, 
# high  --> Ending index 
  
# Function to do Quick sort 
def quickSort(arr : list, low : int, high : int): 
    if low < high: 
  
        # pi is partitioning index, arr[p] is now 
        # at right place 
        pi = partition(arr, low, high) 

        # Separately sort elements before 
        # partition and after partition 
        quickSort(arr, low, pi - 1) 

        quickSort(arr, pi + 1, high) 

arr = [10, 7, 8, 9, 1, 5, 9, 2, 4] 
n = 9

quickSort(arr, 0, n - 1) 
print ("Sorted array is:") 
print(arr)
