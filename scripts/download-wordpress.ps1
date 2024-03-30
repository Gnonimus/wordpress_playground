mkdir temp -ErrorAction SilentlyContinue
Invoke-WebRequest -Uri https://es.wordpress.org/latest-es_ES.zip -OutFile temp/latest-es_ES.zip
Expand-Archive -Path temp/latest-es_ES.zip -DestinationPath temp -Force
Copy-Item -Path temp\wordpress\* -Destination html\ -Recurse -Force
Remove-Item temp/latest-es_ES.zip -ErrorAction SilentlyContinue
Remove-Item temp -Recurse -ErrorAction SilentlyContinue
