#include <stddef.h> // Required for size_t

/**
 * @brief Removes negative numbers from an array in-place.
 * * This function iterates through an array, keeping only the non-negative
 * elements. The original array is modified.
 *
 * @param arr The array of integers to process.
 * @param size The original number of elements in the array.
 * @return The new size of the array after removing negative numbers.
 */
size_t remove_negatives(int *arr, size_t size) {
    size_t new_size = 0;
    for (size_t i = 0; i < size; i++) {
        if (arr[i] >= 0) {
            arr[new_size] = arr[i]; // Corrected from 'a' to 'arr'
            new_size++;
        }
    }
    return new_size;
}