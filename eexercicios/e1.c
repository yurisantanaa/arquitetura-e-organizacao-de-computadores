int f(int *a, int b) {
    while (*a != 0) {
        b += *a;
        a++;
    }
    return b;
}