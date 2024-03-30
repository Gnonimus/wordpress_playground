$ImageName = "wordpress_playground"

if (docker images -q $ImageName 2> $null)
{
    if (docker ps -a --filter ancestor = $ImageName -q 2> $null)
    {
        Write-Host "Hay contenedores en ejecución basados en la imagen. Detén los contenedores antes de eliminar y reconstruir la imagen."
    }
    else
    {
        docker rmi $ImageName
        Write-Host "La imagen $ImageName ha sido eliminada."

        docker build -t $ImageName .
        Write-Host "La imagen $ImageName ha sido reconstruida."
    }
}
else
{
    Write-Host "La imagen $ImageName no existe."

    docker build -t $ImageName .
    Write-Host "La imagen $ImageName ha sido construida."
}
