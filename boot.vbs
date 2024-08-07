Dim fso, tempFileName, lockFile, tempPath
tempPath = "C:\ImageTools"
tempFileName = tempPath + "\temp_list.txt"
lockFile = tempPath + "\process.lock"

Set fso = CreateObject("Scripting.FileSystemObject")
Function DeleteFile(fileName)
  If fso.FileExists(fileName) Then
    fso.DeleteFile(fileName)
  End If
End Function
DeleteFile(tempFileName)
DeleteFile(lockFile)
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd.exe /c ""C:\ImageTools\boot_script.bat""", 0, False
