' Start the ANI:LOG local server with no window, then open the browser.
' Keep port 8765 fixed: browser storage is tied to the origin (host+port).
Set sh = CreateObject("WScript.Shell")
sh.CurrentDirectory = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
sh.Run "python -m http.server 8765 --bind 127.0.0.1", 0, False
WScript.Sleep 1000
sh.Run "http://localhost:8765/"
