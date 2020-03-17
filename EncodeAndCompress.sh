#!/bin/bash

file=$1
gzip $file -c | base64 -w 0 > /tmp/gzippedB64
echo "\$Decoded = [System.Convert]::FromBase64String(\"" > /tmp/build
cat /tmp/gzippedB64 >> /tmp/build 
echo "\");\$ms = (New-Object System.IO.MemoryStream(\$Decoded,0,\$Decoded.Length)); iex(New-Object System.IO.StreamReader(New-Object System.IO.Compression.GZipStream(\$ms, [System.IO.Compression.CompressionMode]::Decompress))).readtoend()" >> /tmp/build
cat /tmp/build | base64 -w 0 > /tmp/EncodedPowerShellScript
echo "Done, enocded and compressed script available in /tmp/EncodedPowerShellScript"
