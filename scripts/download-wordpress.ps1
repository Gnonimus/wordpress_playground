$temp_dir = New-Item -ItemType Directory -Name (Get-Date).ToString("yyyyMMddHHmmss")
$wordpress_url = "https://wordpress.org/latest.zip"
$wordpress_file = "$temp_dir\latest.zip"

Write-Host "Downloading the latest version of WordPress from $wordpress_url ..."
Invoke-WebRequest -Uri $wordpress_url -OutFile $wordpress_file

Write-Host "Extracting WordPress archive..."
Expand-Archive -Path $wordpress_file -DestinationPath $temp_dir

$html_dir = "html"

if (Test-Path $html_dir -PathType Container) {
    Write-Host "Deleting the content of $html_dir ..."
    Remove-Item "$html_dir\*" -Force -Recurse
} else {
    Write-Host "Creating directory $html_dir ..."
    New-Item -Path $html_dir -ItemType Directory | Out-Null
}

Write-Host "Moving WordPress content to $html_dir ..."
Move-Item "$temp_dir\wordpress\*" $html_dir -Force

Write-Host "Deleting the temporary directory $temp_dir ..."
Remove-Item $temp_dir -Force -Recurse
