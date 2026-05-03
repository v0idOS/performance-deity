<#
.SYNOPSIS
A professional benchmarking tool for the Performance Deity plugin.

.DESCRIPTION
Runs a given command multiple times and calculates average, min, max, and P95 execution times to measure performance accurately. It includes a warmup phase to ensure caches/JIT are primed before measurement.

.EXAMPLE
.\Measure-Performance.ps1 -Command "Get-ChildItem -Recurse" -Iterations 50
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$Command,

    [int]$Iterations = 100,
    [int]$Warmup = 10
)

Write-Host "Warming up ($Warmup iterations)..." -ForegroundColor DarkGray
for ($i = 0; $i -lt $Warmup; $i++) {
    Invoke-Expression $Command | Out-Null
}

Write-Host "Benchmarking '$Command' ($Iterations iterations)..." -ForegroundColor Cyan

$times = @()
for ($i = 0; $i -lt $Iterations; $i++) {
    $sw = [Diagnostics.Stopwatch]::StartNew()
    Invoke-Expression $Command | Out-Null
    $sw.Stop()
    $times += $sw.Elapsed.TotalMilliseconds
}

$times = $times | Sort-Object
$min = $times[0]
$max = $times[-1]
$avg = ($times | Measure-Object -Average).Average

# Calculate P95 (95th percentile)
$p95Index = [math]::Floor($times.Count * 0.95)
if ($p95Index -ge $times.Count) { $p95Index = $times.Count - 1 }
$p95 = $times[$p95Index]

Write-Host "`n=== Performance Report ===" -ForegroundColor Green
Write-Host "Average : $([math]::Round($avg, 4)) ms"
Write-Host "P95     : $([math]::Round($p95, 4)) ms"
Write-Host "Min     : $([math]::Round($min, 4)) ms"
Write-Host "Max     : $([math]::Round($max, 4)) ms"
Write-Host "==========================" -ForegroundColor Green
