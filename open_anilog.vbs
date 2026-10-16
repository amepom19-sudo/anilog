' Open ANI:LOG in the default browser. Starts the local server first if it is not running.
Const URL = "http://localhost:8765/"
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
sh.CurrentDirectory = fso.GetParentFolderName(WScript.ScriptFullName)

Function ServerUp()
  On Error Resume Next
  Set http = CreateObject("MSXML2.ServerXMLHTTP.6.0")
  http.setTimeouts 500, 500, 1000, 1000
  http.Open "GET", URL, False
  http.Send
  ServerUp = (Err.Number = 0 And http.Status = 200)
  On Error GoTo 0
End Function

If Not ServerUp() Then
  sh.Run "python -m http.server 8765 --bind 127.0.0.1", 0, False
  For i = 1 To 20
    WScript.Sleep 250
    If ServerUp() Then Exit For
  Next
End If

sh.Run URL
