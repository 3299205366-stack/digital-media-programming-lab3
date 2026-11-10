#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 3
#define BENCH_ITERS 2000000

#if defined(__clang__) || defined(__GNUC__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

static NOINLINE void matmul(const int a[N][N], const int b[N][N],
                            volatile int c[N][N]) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            int sum = 0;
            for (int k = 0; k < N; ++k) {
                sum += a[i][k] * b[k][j];
            }
            c[i][j] = sum;
        }
    }
}

static double elapsed_seconds(struct timespec start, struct timespec end) {
    return (double)(end.tv_sec - start.tv_sec) +
           (double)(end.tv_nsec - start.tv_nsec) / 1000000000.0;
}

static void print_matrix(const volatile int c[N][N]) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            printf("%d%s", c[i][j], j == N - 1 ? "\n" : " ");
        }
    }
}

int main(int argc, char **argv) {
    const int first = argc > 1 ? atoi(argv[1]) : 1;
    const int a[N][N] = {
        {first, 2, 3},
        {4, 5, 6},
        {7, 8, 9},
    };
    const int b[N][N] = {
        {9, 8, 7},
        {6, 5, 4},
        {3, 2, 1},
    };
    volatile int c[N][N] = {{0}};
    struct timespec start;
    struct timespec end;

    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int iteration = 0; iteration < BENCH_ITERS; ++iteration) {
        matmul(a, b, c);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);

    puts("C result (3x3):");
    print_matrix(c);
    printf("iterations=%d elapsed=%.6f s\n", BENCH_ITERS,
           elapsed_seconds(start, end));
    return 0;
}
