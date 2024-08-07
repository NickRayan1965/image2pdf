Dim fso, file, imagePath, tempFileName, separator, oldValue, newValue, queryParamEncode, lockFile, wasGoodNoMainEx
Set fso = CreateObject("Scripting.FileSystemObject")
Function CreateTxtFile(name, content)
  Set file = fso.CreateTextFile(name)
  file.Write content
  file.Close
End Function
Function URLEncode(StringVal)
    Dim i, CharCode, Char
    Dim StringLen, result

    StringLen = Len(StringVal)
    result = ""

    For i = 1 To StringLen
        Char = Mid(StringVal, i, 1)
        CharCode = AscW(Char)

        Select Case True
            ' Caracteres alfanuméricos y algunos caracteres especiales
            Case (CharCode >= 48 And CharCode <= 57) Or _
                 (CharCode >= 65 And CharCode <= 90) Or _
                 (CharCode >= 97 And CharCode <= 122) Or _
                 CharCode = 45 Or CharCode = 46 Or _
                 CharCode = 95 Or CharCode = 126
                result = result & Char
            ' Espacios
            Case CharCode = 32
                result = result & "%20"
            ' Otros caracteres especiales
            Case Else
                result = result & "%" & Right("0" & Hex(CharCode), 2)
        End Select
    Next

    URLEncode = result
End Function

Function ReadTxtAndAddText(fileName, newContent)
  Set file = fso.OpenTextFile(fileName, 8, True)
  file.WriteLine newContent
  file.Close
End Function
Function ReadTxt(fileName)
  Set file = fso.OpenTextFile(fileName, 1)
  ReadTxt = file.ReadAll
  file.Close
End Function
Function OpenChrome(url)
    Dim shell, command
    Set shell = CreateObject("WScript.Shell")
    command = "powershell.exe -Command Start-Process 'chrome.exe' '" & url & "'"
    shell.Run command
End Function
Function DeleteFile(fileName)
  If fso.FileExists(fileName) Then
    fso.DeleteFile(fileName)
  End If
End Function
imagePath = WScript.Arguments(0)
tempPath = "C:\ImageTools"
tempFileName = tempPath + "\temp_list.txt"
lockFile = tempPath + "\process.lock"
separator = ">"
Function NoMainFileExecutor
  On Error Resume Next
  While fso.FileExists(lockFile)
    WScript.Sleep(100)
  Wend
  CreateTxtFile lockFile, ""
  If Err.Number <> 0 Then
    Err.Clear
    NoMainFileExecutor = False
    Exit Function
  End If
  ReadTxtAndAddText tempFileName, separator + imagePath
  If Err.Number <> 0 Then
    Err.Clear
    NoMainFileExecutor = False
    Exit Function
  End If
  ' DeleteFile(lockFile)
  fso.DeleteFile(lockFile)
  On Error GoTo 0
  NoMainFileExecutor = True
End Function

If Not fso.FileExists(tempFileName) Then
  CreateTxtFile tempFileName, imagePath
  oldValue = imagePath
  WScript.Sleep(500)
  newValue = ReadTxt(tempFileName)
  While oldValue <> newValue
    oldValue = newValue
    WScript.Sleep(500)
    newValue = ReadTxt(tempFileName)
  Wend
  DeleteFile(tempFileName)
  DeleteFile(lockFile)
  queryParamEncode = URLEncode(newValue)
  OpenChrome("http://localhost:8080?test=1&imagePaths="  + queryParamEncode)
Else
  wasGoodNoMainEx = false
  While Not (wasGoodNoMainEx)
    wasGoodNoMainEx = NoMainFileExecutor()
  Wend
End If