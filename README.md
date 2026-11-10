# 第 03 讲矩阵乘法四层实现

王杰（2025311293，数字媒体艺术 3 班）的第 03 讲实验代码。固定测试数据为：

```text
A = 1 2 3    B = 9 8 7    C = 30  24 18
    4 5 6        6 5 4        84  69 54
    7 8 9        3 2 1       138 114 90
```

## 文件

- `matmul.c`：三重循环 C 实现，含 O0/O2 基准循环。
- `matmul.s`：由 Apple Clang 交叉生成的 x86-64 O0 汇编，可定位 `imull` 与 `addl`。
- `matmul_O2.s`：同一源文件的 x86-64 O2 汇编。
- `matmul_arm64.s`：本机 Apple M3 原生 ARM64 O2 汇编。
- `matmul.v`：参数化 Verilog 组合逻辑与 testbench；`generate + genvar` 例化 9 个点积单元。
- `matmul.cu`：一个 CUDA 线程计算一个输出元素，32 线程/块；本机无 CUDA 时可运行明确标注的 CPU 回退校验。
- `matmul_musa.cu`：将 CUDA 运行时 API 前缀迁移为 MUSA 的静态对照版。

## 构建与验证

```bash
make all
```

单独运行：

```bash
make c
make asm
make verilog
make cuda-fallback
```

有 NVIDIA CUDA 环境时执行：

```bash
make cuda
```

本仓库在 Apple M3 / macOS 26.7.1 上完成 C、汇编生成、Icarus Verilog 仿真与 CUDA host fallback 校验。该机器没有 NVIDIA GPU 与 CUDA Toolkit，所以仓库不声称完成 GPU 实机运行；真实 CUDA 路径保留在 `matmul.cu` 中，可在 CUDA 主机上直接用 `nvcc` 验证。
