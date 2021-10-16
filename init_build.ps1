Invoke-WebRequest "https://www.python.org/ftp/python/3.9.7/python-3.9.7-embed-amd64.zip" -OutFile "python-3.9.7-embed-amd64.zip"
Expand-Archive python-3.9.7-embed-amd64.zip
Set-Location .\python-3.9.7-embed-amd64
$data = Get-Content python39._pth | foreach { $_ -replace '#import','import' }
$data | Out-String | % { [Text.Encoding]::UTF8.GetBytes($_) } | Set-Content -Path "python39._pth" -Encoding Byte
Invoke-WebRequest "https://bootstrap.pypa.io/get-pip.py" -OutFile "get-pip.py"
.\python.exe .\get-pip.py
.\python.exe -m pip install discord.py[voice]
Invoke-WebRequest "https://download.lfd.uci.edu/pythonlibs/y2rycu7g/PyAudio-0.2.11-cp39-cp39-win_amd64.whl" -OutFile "PyAudio-0.2.11-cp39-cp39-win_amd64.whl"
.\python.exe -m pip install PyAudio-0.2.11-cp39-cp39-win_amd64.whl
.\python.exe -m pip install python-voicetext
Invoke-WebRequest "https://github.com/GyanD/codexffmpeg/releases/download/4.4/ffmpeg-4.4-essentials_build.zip" -OutFile "ffmpeg-4.4-essentials_build.zip"
Expand-Archive ffmpeg-4.4-essentials_build.zip
move-item ffmpeg-4.4-essentials_build\ffmpeg-4.4-essentials_build\bin\ffmpeg.exe .\
remove-item -Recurse get-pip.py, PyAudio-0.2.11-cp39-cp39-win_amd64.whl, ffmpeg-4.4-essentials_build.zip, ffmpeg-4.4-essentials_build
Set-Location ..\
remove-item python-3.9.7-embed-amd64.zip
Write-Output "`nEnvironment installation compleated!"