#!/bin/bash

# Simple shell benchmark script
COMMAND=$1
ITERATIONS=${2:-100}
WARMUP=${3:-10}

if [ -z "$COMMAND" ]; then
    echo "Usage: ./benchmark.sh 'command' [iterations] [warmup]"
    exit 1
fi

echo -e "\e[90mWarming up ($WARMUP iterations)...\e[0m"
for ((i=1; i<=WARMUP; i++)); do
    eval "$COMMAND" > /dev/null 2>&1
done

echo -e "\e[36mBenchmarking '$COMMAND' ($ITERATIONS iterations)...\e[0m"

times=()
for ((i=1; i<=ITERATIONS; i++)); do
    start_time=$(date +%s%N)
    eval "$COMMAND" > /dev/null 2>&1
    end_time=$(date +%s%N)
    
    elapsed=$((end_time - start_time))
    # Using awk for floating point math since bc is not always installed on windows bash
    elapsed_ms=$(awk "BEGIN {printf \"%.4f\", $elapsed / 1000000}")
    
    times+=("$elapsed_ms")
done

# Sort array
IFS=$'\n' sorted=($(sort -n <<<"${times[*]}"))
unset IFS

len=${#sorted[@]}
min=${sorted[0]}
max=${sorted[$((len-1))]}

# Calculate average
sum=0
for i in "${sorted[@]}"; do
    sum=$(awk "BEGIN {print $sum + $i}")
done
avg=$(awk "BEGIN {printf \"%.4f\", $sum / $len}")

# Calculate P95
p95_idx=$(awk "BEGIN {print int($len * 0.95)}")
if [ "$p95_idx" -ge "$len" ]; then p95_idx=$((len-1)); fi
p95=${sorted[$p95_idx]}

echo -e "\n\e[32m=== Performance Report ===\e[0m"
echo -e "\e[32mAverage : $avg ms\e[0m"
echo -e "\e[32mP95     : $p95 ms\e[0m"
echo -e "\e[32mMin     : $min ms\e[0m"
echo -e "\e[32mMax     : $max ms\e[0m"
echo -e "\e[32m==========================\e[0m"
