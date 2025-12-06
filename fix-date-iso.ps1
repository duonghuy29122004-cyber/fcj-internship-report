# Fix date to ISO 8601 format (RFC3339)
$files = Get-ChildItem -Path "content" -Filter "*.md" -Recurse

$count = 0
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content
    
    # Replace "2024-01-01" with ISO format
    $content = $content -replace 'date:\s*"(\d{4})-(\d{2})-(\d{2})"', 'date: $1-$2-$3T00:00:00+07:00'
    
    # Replace 2024-01-01 (without quotes) with ISO format
    $content = $content -replace 'date:\s*(\d{4})-(\d{2})-(\d{2})(?!\d)', 'date: $1-$2-$3T00:00:00+07:00'
    
    # Replace "DD/MM/YYYY" format
    $content = $content -replace 'date:\s*"(\d{2})/(\d{2})/(\d{4})"', 'date: $3-$2-$1T00:00:00+07:00'
    
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -NoNewline
        Write-Host "Fixed: $($file.FullName)"
        $count++
    }
}

Write-Host "`nDone! Fixed $count files"
