; General incbin/bin parser test
; Author: Jeremy Chadwick <jdc@koitsu.org>

; Quoted filename

incbin "data.bin"               ; entire file (512)     size: 512
incbin "data.bin",$100          ; bytes 256-512 (256)   size: 768
incbin "data.bin",$100,16       ; bytes 256-272 (16)    size: 784
incbin "data.bin",$100, 16      ; bytes 256-272 (16)    size: 800
incbin "data.bin", $100         ; bytes 256-512 (256)   size: 1056
incbin "data.bin", $100,16      ; bytes 256-272 (16)    size: 1072
incbin "data.bin", $100, 16     ; bytes 256-272 (16)    size: 1088

; Unquoted filename

incbin data.bin                 ; entire file (512)     size: 1600
incbin data.bin,$100            ; bytes 256-512 (256)   size: 1856
incbin data.bin,$100,16         ; bytes 256-272 (16)    size: 1872
incbin data.bin,$100, 16        ; bytes 256-272 (16)    size: 1888
incbin data.bin, $100           ; bytes 256-512 (256)   size: 2144
incbin data.bin, $100,16        ; bytes 256-272 (16)    size: 2160
incbin data.bin, $100, 16       ; bytes 256-272 (16)    size: 2176

; Equates and math expressions used as params or args

DATAFILE EQU "data.bin"
FOO = (256+184+40)-4+4/2*2      ; FOO = 480
incbin DATAFILE, FOO            ; bytes 480-512 (32)    size: 2208
incbin data.bin, FOO+1, $10     ; bytes 481-497 (16)    size: 2224

; Filenames with spaces (must be quoted)

incbin "data space.bin"             ; entire file (512)     size: 2736
incbin "data space.bin",$100,16     ; bytes 256-272 (16)    size: 2752
incbin "data space.bin", $100, 16   ; bytes 256-272 (16)    size: 2768

; Resulting file MD5: 47ecec73da1168b0c0f243d0773b1c76

