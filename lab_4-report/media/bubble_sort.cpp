void bubble_sort(int arr[], int size) {
    for(int i = 0; i < size - 1; i++)
        for(int j = 0; j < size - i - 1; j++)
            compare_and_swap(&(arr[j]), &(arr[j + 1]));
}
