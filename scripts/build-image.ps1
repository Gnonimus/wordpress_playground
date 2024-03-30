$IMAGE_NAME = "wordpress_playground"

Write-Host "Building the image $IMAGE_NAME"

$imageNames = docker images --format "{{.Repository}}:{{.Tag}}"
$imageExists = $imageNames -match $IMAGE_NAME

if ($imageExists) {
    if (docker ps -a --filter ancestor="$IMAGE_NAME" -q) {
        Write-Host "There are containers running based on the image. Stop containers before deleting and rebuilding the image."
    } else {
        if (docker rmi $IMAGE_NAME) {
            Write-Host "The image $IMAGE_NAME has been removed."
        }
        if (docker build --no-cache -t $IMAGE_NAME .) {
            Write-Host "The image $IMAGE_NAME has been re-created."
        }
    }
} else {
    Write-Host "The image $IMAGE_NAME doesn't exist."
    if (docker build --no-cache -t $IMAGE_NAME .) {
        Write-Host "The image $IMAGE_NAME has been created."
    }
}
