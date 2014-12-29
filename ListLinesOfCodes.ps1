# http://stackoverflow.com/questions/11561497/powershell-script-to-count-number-of-lines-ommitting-a-line-containing-a-specifi
dir c:\myfolder -include *.cs,*.xaml,*.txt -Recurse | % { $count = (gc $_ |  ? { $_ -notmatch '^\s*$|^''|/\*|\*/' }).count; if ($count) {write-host "$_ `tcount: $count"} }