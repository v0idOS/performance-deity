const { performance } = require('perf_hooks');

const args = process.argv.slice(2);
if (args.length === 0) {
    console.error("Usage: node benchmark.js <code> [iterations] [warmup]");
    process.exit(1);
}

const code = args[0];
const iterations = parseInt(args[1]) || 1000;
const warmup = parseInt(args[2]) || 100;

// BUG FIX: Use AsyncFunction so we can benchmark asynchronous database/network code!
const AsyncFunction = Object.getPrototypeOf(async function(){}).constructor;

let execute;
try {
    execute = new AsyncFunction(code);
} catch (e) {
    console.error("Failed to parse code:", e);
    process.exit(1);
}

(async () => {
    console.log(`Warming up (${warmup} iterations)...`);
    try {
        for (let i = 0; i < warmup; i++) {
            await execute();
        }
    } catch (e) {
        console.error("Error during execution:", e);
        process.exit(1);
    }

    console.log(`Benchmarking (${iterations} iterations)...`);

    const times = [];
    for (let i = 0; i < iterations; i++) {
        const start = performance.now();
        await execute();
        const end = performance.now();
        times.push(end - start);
    }

    times.sort((a, b) => a - b);
    const avg = times.reduce((a, b) => a + b, 0) / times.length;
    let p95Index = Math.floor(times.length * 0.95);
    if (p95Index >= times.length) p95Index = times.length - 1;
    const p95 = times[p95Index];
    const min = times[0];
    const max = times[times.length - 1];

    console.log("\n=== Performance Report ===");
    console.log(`Average : ${avg.toFixed(4)} ms`);
    console.log(`P95     : ${p95.toFixed(4)} ms`);
    console.log(`Min     : ${min.toFixed(4)} ms`);
    console.log(`Max     : ${max.toFixed(4)} ms`);
    console.log("==========================");
})();
