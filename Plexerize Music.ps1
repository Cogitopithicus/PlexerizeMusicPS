[System.Reflection.Assembly]::LoadFile("\taglib-sharp.dll" )

$files = Get-ChildItem C:\users\USER\Desktop\Music -include *.mp3 -recurse

Write-Output $files

foreach($iFile in $files) 
{
        $mediaFile=[TagLib.File]::Create($iFile.fullname)
        $album = $mediaFile.Tag.Album
        $title = $mediaFile.tag.title
        $artist = $mediaFile.Tag.Artists
        
    
        $mediaFile.Save()

        
        $($artist).Replace(":"," ")
        $album1 = $($album).Replace(":"," ")
        $album2 = $($album1).Replace("_"," ")
        $album3 = $($album2).Replace("|"," ")
        $album4 = $($album4).Replace("."," ")

        $dir = "C:\users\USER\Desktop\Music"
        $dir1 = "C:\users\USER\Desktop\Music\$($artist)\"
        $dir2 = "C:\users\USER\Desktop\Music\$($artist)\$($album4)"

        New-Item -Path $dir -Name "$($artist)" -ItemType "directory"
        New-Item -Path $dir1 -Name "$($album)" -ItemType "directory"
    

        Get-ChildItem -Path $iFile.FullName | Move-Item -Destination C:\users\USER\Desktop\Music\$($artist)\$($album4)
}


 