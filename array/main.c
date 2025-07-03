#include <stdio.h>
#include <stdint.h>

// External assembly functions
extern void* my_array_allocater(int count, int size_of_element);
extern void my_array_writer(void* array_ptr, int index, int size_of_element, void* data);
extern void* my_array_accesser(void* array_ptr, int index, int size_of_element);

int main() {
    int count = 10;
    int size_of_element = sizeof(uint32_t);

    printf("Allocating array of %d elements (each %d bytes)...\n", count, size_of_element);
    uint32_t* my_array_ptr = (uint32_t*) my_array_allocater(count, size_of_element);
    if (!my_array_ptr) {
        printf("Allocation failed!\n");
        return 1;
    }

    printf("\nWriting values into the array...\n");
    for (int i = 0; i < count; i++) {
        uint32_t value = (i + 1) * 10;
        my_array_writer(my_array_ptr, i, size_of_element, &value);
        printf("  Wrote %u at index %d\n", value, i);
    }

    printf("\nReading values back from the array...\n");
    for (int i = 0; i < count; i++) {
        uint32_t* p = (uint32_t*) my_array_accesser(my_array_ptr, i, size_of_element);
        uint32_t value = *p;
        printf("  Read %u from index %d\n", value, i);
    }

    printf("\n=== Debug Dump of Entire Array ===\n[ ");
    for (int i = 0; i < count; i++) {
        uint32_t* p = (uint32_t*) my_array_accesser(my_array_ptr, i, size_of_element);
        printf("%u", *p);
        if (i != count - 1) {
            printf(", ");
        }
    }
    printf(" ]\n");

    return 0;
}
