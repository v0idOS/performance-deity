import sys
import timeit
import statistics
import argparse

def main():
    parser = argparse.ArgumentParser(description="Performance Deity Python Benchmark")
    parser.add_argument("code", help="Python code to execute")
    parser.add_argument("--setup", default="pass", help="Setup code (runs once per iteration)")
    parser.add_argument("--iterations", type=int, default=1000, help="Number of iterations")
    parser.add_argument("--warmup", type=int, default=100, help="Warmup iterations")
    args = parser.parse_args()

    print(f"Warming up ({args.warmup} iterations)...")
    try:
        timeit.timeit(stmt=args.code, setup=args.setup, number=args.warmup)
    except Exception as e:
        print(f"Error during warmup: {e}")
        sys.exit(1)

    print(f"Benchmarking ({args.iterations} iterations)...")
    
    # Run iterations individually to get variance
    times = []
    for _ in range(args.iterations):
        t = timeit.timeit(stmt=args.code, setup=args.setup, number=1)
        times.append(t * 1000) # Convert to milliseconds
        
    times.sort()
    avg = statistics.mean(times)
    p95_index = int(len(times) * 0.95)
    if p95_index >= len(times): p95_index = len(times) - 1
    p95 = times[p95_index]
    min_t = times[0]
    max_t = times[-1]

    print("\n=== Performance Report ===")
    print(f"Average : {avg:.4f} ms")
    print(f"P95     : {p95:.4f} ms")
    print(f"Min     : {min_t:.4f} ms")
    print(f"Max     : {max_t:.4f} ms")
    print("==========================")

if __name__ == "__main__":
    main()
