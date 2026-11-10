#include <cstdio>
#include <cstdlib>
#include <musa_runtime.h>

#define N 3

__global__ void matmul_kernel(const int *a, const int *b, int *c) {
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N * N) {
        const int row = index / N;
        const int col = index % N;
        int sum = 0;
        for (int k = 0; k < N; ++k)
            sum += a[row * N + k] * b[k * N + col];
        c[index] = sum;
    }
}

static void check_musa(musaError_t status, const char *operation) {
    if (status != musaSuccess) {
        std::fprintf(stderr, "%s failed: %s\n", operation,
                     musaGetErrorString(status));
        std::exit(EXIT_FAILURE);
    }
}

int main() {
    const int a[N * N] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    const int b[N * N] = {9, 8, 7, 6, 5, 4, 3, 2, 1};
    int c[N * N] = {0};
    int *d_a = nullptr, *d_b = nullptr, *d_c = nullptr;
    const size_t bytes = N * N * sizeof(int);

    check_musa(musaMalloc(&d_a, bytes), "musaMalloc(a)");
    check_musa(musaMalloc(&d_b, bytes), "musaMalloc(b)");
    check_musa(musaMalloc(&d_c, bytes), "musaMalloc(c)");
    check_musa(musaMemcpy(d_a, a, bytes, musaMemcpyHostToDevice),
               "musaMemcpy(a)");
    check_musa(musaMemcpy(d_b, b, bytes, musaMemcpyHostToDevice),
               "musaMemcpy(b)");

    const dim3 block(32);
    const dim3 grid((N * N + block.x - 1) / block.x);
    matmul_kernel<<<grid, block>>>(d_a, d_b, d_c);
    check_musa(musaGetLastError(), "kernel launch");
    check_musa(musaDeviceSynchronize(), "musaDeviceSynchronize");
    check_musa(musaMemcpy(c, d_c, bytes, musaMemcpyDeviceToHost),
               "musaMemcpy(c)");

    std::puts("MUSA result (3x3):");
    for (int i = 0; i < N; ++i)
        std::printf("%d %d %d\n", c[i * N], c[i * N + 1], c[i * N + 2]);

    musaFree(d_a);
    musaFree(d_b);
    musaFree(d_c);
    return 0;
}
