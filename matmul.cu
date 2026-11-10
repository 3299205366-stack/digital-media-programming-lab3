#include <cstdio>
#include <cstdlib>

#define N 3

static const int kA[N * N] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
static const int kB[N * N] = {9, 8, 7, 6, 5, 4, 3, 2, 1};

static void print_matrix(const int *c) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            std::printf("%d%s", c[i * N + j], j == N - 1 ? "\n" : " ");
        }
    }
}

#ifdef CUDA_HOST_FALLBACK

static void host_reference(const int *a, const int *b, int *c) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            int sum = 0;
            for (int k = 0; k < N; ++k) {
                sum += a[i * N + k] * b[k * N + j];
            }
            c[i * N + j] = sum;
        }
    }
}

int main() {
    int c[N * N] = {0};
    host_reference(kA, kB, c);
    std::puts("CUDA host fallback result (GPU not executed):");
    print_matrix(c);
    std::puts("launch model: grid=1 block, blockDim=32, active threads=9");
    return 0;
}

#else

#include <cuda_runtime.h>

__global__ void matmul_kernel(const int *a, const int *b, int *c) {
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N * N) {
        const int row = index / N;
        const int col = index % N;
        int sum = 0;
        for (int k = 0; k < N; ++k) {
            sum += a[row * N + k] * b[k * N + col];
        }
        c[index] = sum;
    }
}

static void check_cuda(cudaError_t status, const char *operation) {
    if (status != cudaSuccess) {
        std::fprintf(stderr, "%s failed: %s\n", operation,
                     cudaGetErrorString(status));
        std::exit(EXIT_FAILURE);
    }
}

int main() {
    const size_t bytes = N * N * sizeof(int);
    int c[N * N] = {0};
    int *d_a = nullptr;
    int *d_b = nullptr;
    int *d_c = nullptr;

    check_cuda(cudaMalloc(&d_a, bytes), "cudaMalloc(a)");
    check_cuda(cudaMalloc(&d_b, bytes), "cudaMalloc(b)");
    check_cuda(cudaMalloc(&d_c, bytes), "cudaMalloc(c)");
    check_cuda(cudaMemcpy(d_a, kA, bytes, cudaMemcpyHostToDevice),
               "cudaMemcpy(a)");
    check_cuda(cudaMemcpy(d_b, kB, bytes, cudaMemcpyHostToDevice),
               "cudaMemcpy(b)");

    const dim3 block(32);
    const dim3 grid((N * N + block.x - 1) / block.x);
    matmul_kernel<<<grid, block>>>(d_a, d_b, d_c);
    check_cuda(cudaGetLastError(), "kernel launch");
    check_cuda(cudaDeviceSynchronize(), "cudaDeviceSynchronize");
    check_cuda(cudaMemcpy(c, d_c, bytes, cudaMemcpyDeviceToHost),
               "cudaMemcpy(c)");

    std::puts("CUDA result (3x3):");
    print_matrix(c);
    std::printf("launch: grid=%u block(s), blockDim=%u, active threads=9\n",
                grid.x, block.x);

    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);
    return 0;
}

#endif
