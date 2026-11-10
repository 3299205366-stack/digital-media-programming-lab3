CC := clang
CXX := clang++
IVERILOG := iverilog
VVP := vvp
BUILD := build

.PHONY: all c asm verilog cuda-fallback cuda clean

all: c asm verilog cuda-fallback

$(BUILD):
	mkdir -p $(BUILD)

c: | $(BUILD)
	$(CC) -std=c11 -Wall -Wextra -O0 matmul.c -o $(BUILD)/matmul_O0
	$(CC) -std=c11 -Wall -Wextra -O2 matmul.c -o $(BUILD)/matmul_O2
	$(BUILD)/matmul_O0 | tee $(BUILD)/c_O0.log
	$(BUILD)/matmul_O2 | tee $(BUILD)/c_O2.log

asm:
	$(CC) -std=c11 -target x86_64-apple-macos13 -O0 -S matmul.c -o matmul.s
	$(CC) -std=c11 -target x86_64-apple-macos13 -O2 -S matmul.c -o matmul_O2.s
	$(CC) -std=c11 -O2 -S matmul.c -o matmul_arm64.s

verilog: | $(BUILD)
	$(IVERILOG) -g2012 -Wall -s tb -o $(BUILD)/matmul_tb matmul.v
	$(VVP) $(BUILD)/matmul_tb | tee $(BUILD)/verilog.log

cuda-fallback: | $(BUILD)
	$(CXX) -x c++ -std=c++17 -Wall -Wextra -O2 -DCUDA_HOST_FALLBACK \
		matmul.cu -o $(BUILD)/matmul_cuda_fallback
	$(BUILD)/matmul_cuda_fallback | tee $(BUILD)/cuda_fallback.log

cuda: | $(BUILD)
	nvcc -O2 matmul.cu -o $(BUILD)/matmul_cuda
	$(BUILD)/matmul_cuda | tee $(BUILD)/cuda.log

clean:
	$(RM) -r $(BUILD) matmul.s matmul_O2.s matmul_arm64.s
