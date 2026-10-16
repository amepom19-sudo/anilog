' Start only the ANI:LOG local server with no window (used at Windows sign-in).
' If the port is already in use, the second python exits silently.
Set sh = CreateObject("WScript.Shell")
sh.CurrentDirectory = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
sh.Run "python -m http.server 8765 --bind 127.0.0.1", 0, False
