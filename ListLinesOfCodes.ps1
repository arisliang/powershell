# http://stackoverflow.com/questions/11561497/powershell-script-to-count-number-of-lines-ommitting-a-line-containing-a-specifi
dir c:\myfolder -include *.cs,*.xaml,*.txt -Recurse | % { $count = (gc $_ |  ? { $_ -notmatch '^\s*$|^''|/\*|\*/' }).count; if ($count -gt 900) {write-host "$_ `tcount: $count"} }

#http://www.limilabs.com/blog/source-lines-of-code-count-using-powershell
(dir -include *.cs -recurse | select-string "^(\s*)//" -notMatch | select-string "^(\s*)$" -notMatch | select-string "^\s*(?:\{|\})\s*$" -notMatch).Count