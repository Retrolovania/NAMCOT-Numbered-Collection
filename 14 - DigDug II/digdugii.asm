;-------------------------------------------------------------------------------
; Dig Dug II (Japan).nes disasembled by DISASM6 v1.5
; Revised, commented, and generally being turned into something decent by Retrolovania

; Still very much a work in progress!

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 2              ; 2 x 16k PRG banks
            .db 1              ; 1 x 8k CHR banks
            .db %00000001      ; Mirroring: Vertical
                               ; SRAM: Not used
                               ; 512k Trainer: Not used
                               ; 4 Screen VRAM: Not used
                               ; Mapper: 8
            .db %00001000      ; RomType: NES
            .hex 00 00 00 00   ; iNES Tail 
            .hex 00 00 00 01    

;-------------------------------------------------------------------------------
; Program Origin
;-------------------------------------------------------------------------------
            .org $8000         ; Set program counter

;-------------------------------------------------------------------------------
; ROM Start
;-------------------------------------------------------------------------------
__8000:     .hex 90            ; $8000: 90            Data
__8001:     .hex 80 fa 80 64   ; $8001: 80 fa 80 64   Data
            .hex 81 ce 81 38   ; $8005: 81 ce 81 38   Data
            .hex 82 a2 82 0c   ; $8009: 82 a2 82 0c   Data
            .hex 83 76 83 e0   ; $800d: 83 76 83 e0   Data
            .hex 83 4a 84 b4   ; $8011: 83 4a 84 b4   Data
            .hex 84 1e 85 88   ; $8015: 84 1e 85 88   Data
            .hex 85 f2 85 5c   ; $8019: 85 f2 85 5c   Data
            .hex 86 c6 86 30   ; $801d: 86 c6 86 30   Data
            .hex 87 9a 87 04   ; $8021: 87 9a 87 04   Data
            .hex 88 6e 88 d8   ; $8025: 88 6e 88 d8   Data
            .hex 88 42 89 ac   ; $8029: 88 42 89 ac   Data
            .hex 89 16 8a 80   ; $802d: 89 16 8a 80   Data
            .hex 8a ea 8a 54   ; $8031: 8a ea 8a 54   Data
            .hex 8b be 8b 28   ; $8035: 8b be 8b 28   Data
            .hex 8c 92 8c fc   ; $8039: 8c 92 8c fc   Data
            .hex 8c 66 8d d0   ; $803d: 8c 66 8d d0   Data
            .hex 8d 3a 8e a4   ; $8041: 8d 3a 8e a4   Data
            .hex 8e 0e 8f 78   ; $8045: 8e 0e 8f 78   Data
            .hex 8f e2 8f 4c   ; $8049: 8f e2 8f 4c   Data
            .hex 90 b6 90 20   ; $804d: 90 b6 90 20   Data
            .hex 91 8a 91 f4   ; $8051: 91 8a 91 f4   Data
            .hex 91 5e 92 c8   ; $8055: 91 5e 92 c8   Data
            .hex 92 32 93 9c   ; $8059: 92 32 93 9c   Data
            .hex 93 06 94 70   ; $805d: 93 06 94 70   Data
            .hex 94 da 94 44   ; $8061: 94 da 94 44   Data
            .hex 95 ae 95 18   ; $8065: 95 ae 95 18   Data
            .hex 96 82 96 ec   ; $8069: 96 82 96 ec   Data
            .hex 96 56 97 c0   ; $806d: 96 56 97 c0   Data
            .hex 97 2a 98 94   ; $8071: 97 2a 98 94   Data
            .hex 98 fe 98 68   ; $8075: 98 fe 98 68   Data
            .hex 99 d2 99 3c   ; $8079: 99 d2 99 3c   Data
            .hex 9a a6 9a 10   ; $807d: 9a a6 9a 10   Data
            .hex 9b 7a 9b e4   ; $8081: 9b 7a 9b e4   Data
            .hex 9b 4e 9c b8   ; $8085: 9b 4e 9c b8   Data
            .hex 9c 22 9d 8c   ; $8089: 9c 22 9d 8c   Data
            .hex 9d f6 9d 81   ; $808d: 9d f6 9d 81   Data
            .hex 81 81 81 81   ; $8091: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8095: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8099: 81 81 81 81   Data
            .hex 81 81 81 81   ; $809d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $80a1: 81 81 81 81   Data
            .hex 30 18 12 14   ; $80a5: 30 18 12 14   Data
            .hex 14 18 80 28   ; $80a9: 14 18 80 28   Data
            .hex 0a 0a 03 05   ; $80ad: 0a 0a 03 05   Data
            .hex 0c 80 2c 06   ; $80b1: 0c 80 2c 06   Data
            .hex 0c 06 05 09   ; $80b5: 0c 06 05 09   Data
            .hex 80 21 01 01   ; $80b9: 80 21 01 01   Data
            .hex 05 05 0c 80   ; $80bd: 05 05 0c 80   Data
            .hex 20 00 00 01   ; $80c1: 20 00 00 01   Data
            .hex 01 09 80 20   ; $80c5: 01 09 80 20   Data
            .hex 00 00 00 00   ; $80c9: 00 00 00 00   Data
            .hex 08 80 e0 40   ; $80cd: 08 80 e0 40   Data
            .hex 40 40 40 c0   ; $80d1: 40 40 40 c0   Data
            .hex 86 81 81 81   ; $80d5: 86 81 81 81   Data
            .hex 81 81 81 81   ; $80d9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $80dd: 81 81 81 81   Data
            .hex 81 81 81 81   ; $80e1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $80e5: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $80e9: 81 81 ff ff   Data
            .hex ff fd 55 55   ; $80ed: ff fd 55 55   Data
            .hex 40 05 54 44   ; $80f1: 40 05 54 44   Data
            .hex 44 7f ff ff   ; $80f5: 44 7f ff ff   Data
            .hex ff 81 81 81   ; $80f9: ff 81 81 81   Data
            .hex 81 81 81 81   ; $80fd: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8101: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8105: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8109: 81 81 81 81   Data
            .hex 81 81 34 18   ; $810d: 81 81 34 18   Data
            .hex 80 30 18 80   ; $8111: 80 30 18 80   Data
            .hex 81 21 0c 80   ; $8115: 81 21 0c 80   Data
            .hex 2c 0a 80 81   ; $8119: 2c 0a 80 81   Data
            .hex 60 09 12 05   ; $811d: 60 09 12 05   Data
            .hex 48 80 81 81   ; $8121: 48 80 81 81   Data
            .hex 24 00 09 80   ; $8125: 24 00 09 80   Data
            .hex 81 81 38 03   ; $8129: 81 81 38 03   Data
            .hex 48 06 18 80   ; $812d: 48 06 18 80   Data
            .hex 81 28 0a 80   ; $8131: 81 28 0a 80   Data
            .hex 21 0c 80 81   ; $8135: 21 0c 80 81   Data
            .hex 60 48 80 60   ; $8139: 60 48 80 60   Data
            .hex 49 80 81 81   ; $813d: 49 80 81 81   Data
            .hex 81 81 81 81   ; $8141: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8145: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8149: 81 81 81 81   Data
            .hex 81 81 81 81   ; $814d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8151: 81 81 81 81   Data
            .hex ff ff ff fc   ; $8155: ff ff ff fc   Data
            .hex f3 3c f0 fc   ; $8159: f3 3c f0 fc   Data
            .hex 3d f3 3d ff   ; $815d: 3d f3 3d ff   Data
            .hex ff ff ff 81   ; $8161: ff ff ff 81   Data
            .hex 81 81 81 81   ; $8165: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8169: 81 81 81 81   Data
            .hex 81 81 81 81   ; $816d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8171: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8175: 81 81 81 81   Data
            .hex 30 18 12 14   ; $8179: 30 18 12 14   Data
            .hex 14 18 80 28   ; $817d: 14 18 80 28   Data
            .hex 0a 0a 03 05   ; $8181: 0a 0a 03 05   Data
            .hex 0c 80 2c 06   ; $8185: 0c 80 2c 06   Data
            .hex 0c 06 05 09   ; $8189: 0c 06 05 09   Data
            .hex 80 21 01 01   ; $818d: 80 21 01 01   Data
            .hex 05 05 0c 80   ; $8191: 05 05 0c 80   Data
            .hex 60 00 00 01   ; $8195: 60 00 00 01   Data
            .hex 01 09 80 81   ; $8199: 01 09 80 81   Data
            .hex 60 40 40 40   ; $819d: 60 40 40 40   Data
            .hex c0 86 81 81   ; $81a1: c0 86 81 81   Data
            .hex 81 81 81 81   ; $81a5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $81a9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $81ad: 81 81 81 81   Data
            .hex 81 81 81 81   ; $81b1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $81b5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $81b9: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $81bd: 81 81 ff ff   Data
            .hex ff fc 00 40   ; $81c1: ff fc 00 40   Data
            .hex 00 10 57 01   ; $81c5: 00 10 57 01   Data
            .hex ff ff ff ff   ; $81c9: ff ff ff ff   Data
            .hex ff 81 81 81   ; $81cd: ff 81 81 81   Data
            .hex 81 81 81 81   ; $81d1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $81d5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $81d9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $81dd: 81 81 81 81   Data
            .hex 81 81 30 14   ; $81e1: 81 81 30 14   Data
            .hex 18 12 14 18   ; $81e5: 18 12 14 18   Data
            .hex 80 28 07 0c   ; $81e9: 80 28 07 0c   Data
            .hex 0a 0b 0a 80   ; $81ed: 0a 0b 0a 80   Data
            .hex 60 05 01 08   ; $81f1: 60 05 01 08   Data
            .hex 06 48 80 81   ; $81f5: 06 48 80 81   Data
            .hex 25 00 00 0d   ; $81f9: 25 00 00 0d   Data
            .hex 80 81 30 05   ; $81fd: 80 81 30 05   Data
            .hex 04 00 05 18   ; $8201: 04 00 05 18   Data
            .hex 80 20 01 09   ; $8205: 80 20 01 09   Data
            .hex 0a 03 08 80   ; $8209: 0a 03 08 80   Data
            .hex 60 40 48 4a   ; $820d: 60 40 48 4a   Data
            .hex 4a 4a 80 81   ; $8211: 4a 4a 80 81   Data
            .hex 81 81 81 81   ; $8215: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8219: 81 81 81 81   Data
            .hex 81 81 81 81   ; $821d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8221: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8225: 81 81 81 81   Data
            .hex ff ff ff fc   ; $8229: ff ff ff fc   Data
            .hex 51 55 70 3c   ; $822d: 51 55 70 3c   Data
            .hex 0c 54 55 7f   ; $8231: 0c 54 55 7f   Data
            .hex ff ff ff 81   ; $8235: ff ff ff 81   Data
            .hex 81 81 81 81   ; $8239: 81 81 81 81   Data
            .hex 81 81 81 81   ; $823d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8241: 81 81 81 81   Data
            .hex 81 b0 10 50   ; $8245: 81 b0 10 50   Data
            .hex 50 10 90 85   ; $8249: 50 10 90 85   Data
            .hex 20 c0 86 81   ; $824d: 20 c0 86 81   Data
            .hex e0 08 80 28   ; $8251: e0 08 80 28   Data
            .hex 80 30 18 80   ; $8255: 80 30 18 80   Data
            .hex 28 80 28 80   ; $8259: 28 80 28 80   Data
            .hex 20 48 80 28   ; $825d: 20 48 80 28   Data
            .hex 80 60 50 08   ; $8261: 80 60 50 08   Data
            .hex 80 81 28 80   ; $8265: 80 81 28 80   Data
            .hex 81 81 20 14   ; $8269: 81 81 20 14   Data
            .hex 14 0c 80 81   ; $826d: 14 0c 80 81   Data
            .hex 34 04 05 05   ; $8271: 34 04 05 05   Data
            .hex 09 80 81 21   ; $8275: 09 80 81 21   Data
            .hex 05 05 05 0c   ; $8279: 05 05 05 0c   Data
            .hex 80 81 e0 41   ; $827d: 80 81 e0 41   Data
            .hex 41 41 49 80   ; $8281: 41 41 49 80   Data
            .hex 81 81 81 81   ; $8285: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8289: 81 81 81 81   Data
            .hex 81 81 81 81   ; $828d: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $8291: 81 81 ff ff   Data
            .hex f6 a6 aa a2   ; $8295: f6 a6 aa a2   Data
            .hex aa af ab c5   ; $8299: aa af ab c5   Data
            .hex d5 31 5f ff   ; $829d: d5 31 5f ff   Data
            .hex ff 81 81 81   ; $82a1: ff 81 81 81   Data
            .hex 81 81 b8 80   ; $82a5: 81 81 b8 80   Data
            .hex 81 81 81 81   ; $82a9: 81 81 81 81   Data
            .hex b0 08 80 81   ; $82ad: b0 08 80 81   Data
            .hex 81 81 b0 00   ; $82b1: 81 81 b0 00   Data
            .hex 0c 80 81 81   ; $82b5: 0c 80 81 81   Data
            .hex b0 00 0c 0b   ; $82b9: b0 00 0c 0b   Data
            .hex 80 81 b0 00   ; $82bd: 80 81 b0 00   Data
            .hex 40 01 c0 86   ; $82c1: 40 01 c0 86   Data
            .hex b0 00 c0 86   ; $82c5: b0 00 c0 86   Data
            .hex 28 80 81 20   ; $82c9: 28 80 81 20   Data
            .hex 08 80 81 28   ; $82cd: 08 80 81 28   Data
            .hex 80 81 e0 00   ; $82d1: 80 81 e0 00   Data
            .hex 90 85 28 80   ; $82d5: 90 85 28 80   Data
            .hex 81 81 e0 00   ; $82d9: 81 81 e0 00   Data
            .hex 10 04 90 85   ; $82dd: 10 04 90 85   Data
            .hex 81 81 e0 08   ; $82e1: 81 81 e0 08   Data
            .hex 03 0c 80 81   ; $82e5: 03 0c 80 81   Data
            .hex 81 81 e8 02   ; $82e9: 81 81 e8 02   Data
            .hex 09 80 81 81   ; $82ed: 09 80 81 81   Data
            .hex 81 81 e0 08   ; $82f1: 81 81 e0 08   Data
            .hex 80 81 81 81   ; $82f5: 80 81 81 81   Data
            .hex 81 81 e8 80   ; $82f9: 81 81 e8 80   Data
            .hex ff ff cf c3   ; $82fd: ff ff cf c3   Data
            .hex c0 ca ca b2   ; $8301: c0 ca ca b2   Data
            .hex af 2b f0 3f   ; $8305: af 2b f0 3f   Data
            .hex 0f f7 ff 30   ; $8309: 0f f7 ff 30   Data
            .hex 10 10 10 10   ; $830d: 10 10 10 10   Data
            .hex 18 80 20 00   ; $8311: 18 80 20 00   Data
            .hex 00 00 00 08   ; $8315: 00 00 00 08   Data
            .hex 80 20 00 00   ; $8319: 80 20 00 00   Data
            .hex 00 00 08 80   ; $831d: 00 00 08 80   Data
            .hex 20 00 00 40   ; $8321: 20 00 00 40   Data
            .hex 40 48 80 20   ; $8325: 40 48 80 20   Data
            .hex 00 40 90 85   ; $8329: 00 40 90 85   Data
            .hex 81 81 20 08   ; $832d: 81 81 20 08   Data
            .hex 80 20 90 85   ; $8331: 80 20 90 85   Data
            .hex 81 e0 00 18   ; $8335: 81 e0 00 18   Data
            .hex 42 00 90 85   ; $8339: 42 00 90 85   Data
            .hex 81 e0 08 80   ; $833d: 81 e0 08 80   Data
            .hex 20 08 80 81   ; $8341: 20 08 80 81   Data
            .hex 81 e0 10 00   ; $8345: 81 e0 10 00   Data
            .hex 08 80 30 10   ; $8349: 08 80 30 10   Data
            .hex 10 00 00 08   ; $834d: 10 00 00 08   Data
            .hex 80 20 00 00   ; $8351: 80 20 00 00   Data
            .hex 00 00 08 80   ; $8355: 00 00 08 80   Data
            .hex 20 00 00 00   ; $8359: 20 00 00 00   Data
            .hex 00 08 80 60   ; $835d: 00 08 80 60   Data
            .hex 40 40 40 40   ; $8361: 40 40 40 40   Data
            .hex 48 80 00 00   ; $8365: 48 80 00 00   Data
            .hex 00 01 7f 6b   ; $8369: 00 01 7f 6b   Data
            .hex da 7d a7 e9   ; $836d: da 7d a7 e9   Data
            .hex fd 40 00 00   ; $8371: fd 40 00 00   Data
            .hex 00 30 18 80   ; $8375: 00 30 18 80   Data
            .hex 30 10 90 85   ; $8379: 30 10 90 85   Data
            .hex 20 08 80 28   ; $837d: 20 08 80 28   Data
            .hex 06 0c 80 20   ; $8381: 06 0c 80 20   Data
            .hex 08 80 20 01   ; $8385: 08 80 20 01   Data
            .hex 09 80 20 04   ; $8389: 09 80 20 04   Data
            .hex 10 00 40 c0   ; $838d: 10 00 40 c0   Data
            .hex 86 e0 01 04   ; $8391: 86 e0 01 04   Data
            .hex 08 80 81 81   ; $8395: 08 80 81 81   Data
            .hex 81 20 01 00   ; $8399: 81 20 01 00   Data
            .hex 10 90 85 b0   ; $839d: 10 90 85 b0   Data
            .hex 00 00 00 04   ; $83a1: 00 00 00 04   Data
            .hex 08 80 20 00   ; $83a5: 08 80 20 00   Data
            .hex 40 00 01 08   ; $83a9: 40 00 01 08   Data
            .hex 80 20 08 80   ; $83ad: 80 20 08 80   Data
            .hex e0 00 08 80   ; $83b1: e0 00 08 80   Data
            .hex 20 00 90 85   ; $83b5: 20 00 90 85   Data
            .hex e0 c0 86 24   ; $83b9: e0 c0 86 24   Data
            .hex 04 00 90 85   ; $83bd: 04 00 90 85   Data
            .hex 81 81 21 01   ; $83c1: 81 81 21 01   Data
            .hex 00 08 12 18   ; $83c5: 00 08 12 18   Data
            .hex 80 e0 40 40   ; $83c9: 80 e0 40 40   Data
            .hex 40 40 48 80   ; $83cd: 40 40 48 80   Data
            .hex 3c 0f 03 c0   ; $83d1: 3c 0f 03 c0   Data
            .hex 1f c7 f1 51   ; $83d5: 1f c7 f1 51   Data
            .hex 41 f0 7f 03   ; $83d9: 41 f0 7f 03   Data
            .hex f0 3c 00 81   ; $83dd: f0 3c 00 81   Data
            .hex 81 81 81 81   ; $83e1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $83e5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $83e9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $83ed: 81 81 81 81   Data
            .hex 81 81 81 81   ; $83f1: 81 81 81 81   Data
            .hex 81 30 50 50   ; $83f5: 81 30 50 50   Data
            .hex 18 80 81 38   ; $83f9: 18 80 81 38   Data
            .hex 0a 80 81 28   ; $83fd: 0a 80 81 28   Data
            .hex 1a 80 28 06   ; $8401: 1a 80 28 06   Data
            .hex 10 10 0c 0a   ; $8405: 10 10 0c 0a   Data
            .hex 80 20 05 00   ; $8409: 80 20 05 00   Data
            .hex 00 05 08 80   ; $840d: 00 05 08 80   Data
            .hex 28 03 40 40   ; $8411: 28 03 40 40   Data
            .hex 09 0a 80 68   ; $8415: 09 0a 80 68   Data
            .hex 0a 80 81 28   ; $8419: 0a 80 81 28   Data
            .hex 4a 80 81 60   ; $841d: 4a 80 81 60   Data
            .hex 50 50 48 80   ; $8421: 50 50 48 80   Data
            .hex 81 81 81 81   ; $8425: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8429: 81 81 81 81   Data
            .hex 81 81 81 81   ; $842d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8431: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8435: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $8439: 81 81 ff ff   Data
            .hex ff ff ab 6a   ; $843d: ff ff ab 6a   Data
            .hex 54 55 15 a9   ; $8441: 54 55 15 a9   Data
            .hex ea ff ff ff   ; $8445: ea ff ff ff   Data
            .hex ff 81 81 81   ; $8449: ff 81 81 81   Data
            .hex 81 81 81 81   ; $844d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8451: 81 81 81 81   Data
            .hex 81 81 81 b0   ; $8455: 81 81 81 b0   Data
            .hex 10 10 10 90   ; $8459: 10 10 10 90   Data
            .hex 85 81 20 00   ; $845d: 85 81 20 00   Data
            .hex 00 00 08 80   ; $8461: 00 00 08 80   Data
            .hex 81 20 00 00   ; $8465: 81 20 00 00   Data
            .hex 00 08 80 81   ; $8469: 00 08 80 81   Data
            .hex e0 40 00 40   ; $846d: e0 40 00 40   Data
            .hex c0 86 81 81   ; $8471: c0 86 81 81   Data
            .hex 81 28 80 81   ; $8475: 81 28 80 81   Data
            .hex 81 81 81 81   ; $8479: 81 81 81 81   Data
            .hex 28 80 81 81   ; $847d: 28 80 81 81   Data
            .hex 81 81 b0 00   ; $8481: 81 81 b0 00   Data
            .hex 90 85 81 81   ; $8485: 90 85 81 81   Data
            .hex 81 20 00 08   ; $8489: 81 20 00 08   Data
            .hex 80 81 81 81   ; $848d: 80 81 81 81   Data
            .hex e0 40 c0 86   ; $8491: e0 40 c0 86   Data
            .hex 81 81 81 81   ; $8495: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8499: 81 81 81 81   Data
            .hex 81 81 81 81   ; $849d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $84a1: 81 81 81 81   Data
            .hex ff ff f0 0c   ; $84a5: ff ff f0 0c   Data
            .hex 03 00 ff ff   ; $84a9: 03 00 ff ff   Data
            .hex ff ff d7 f5   ; $84ad: ff ff d7 f5   Data
            .hex ff ff ff 81   ; $84b1: ff ff ff 81   Data
            .hex 81 81 81 81   ; $84b5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $84b9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $84bd: 81 81 81 81   Data
            .hex 81 34 10 10   ; $84c1: 81 34 10 10   Data
            .hex 14 14 18 80   ; $84c5: 14 14 18 80   Data
            .hex 21 0c 06 09   ; $84c9: 21 0c 06 09   Data
            .hex 03 08 80 24   ; $84cd: 03 08 80 24   Data
            .hex 01 09 0a 0a   ; $84d1: 01 09 0a 0a   Data
            .hex 0e 80 21 08   ; $84d5: 0e 80 21 08   Data
            .hex 02 0c 06 09   ; $84d9: 02 0c 06 09   Data
            .hex 80 28 06 04   ; $84dd: 80 28 06 04   Data
            .hex 01 05 0c 80   ; $84e1: 01 05 0c 80   Data
            .hex 28 03 01 0c   ; $84e5: 28 03 01 0c   Data
            .hex 07 09 80 28   ; $84e9: 07 09 80 28   Data
            .hex 0a 02 05 05   ; $84ed: 0a 02 05 05   Data
            .hex 08 80 24 04   ; $84f1: 08 80 24 04   Data
            .hex 04 01 01 0c   ; $84f5: 04 01 01 0c   Data
            .hex 80 61 41 41   ; $84f9: 80 61 41 41   Data
            .hex 48 42 49 80   ; $84fd: 48 42 49 80   Data
            .hex 81 81 81 81   ; $8501: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8505: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8509: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $850d: 81 81 ff ff   Data
            .hex f4 51 55 45   ; $8511: f4 51 55 45   Data
            .hex 15 55 15 55   ; $8515: 15 55 15 55   Data
            .hex 45 11 1f ff   ; $8519: 45 11 1f ff   Data
            .hex ff 81 81 81   ; $851d: ff 81 81 81   Data
            .hex 81 81 81 81   ; $8521: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8525: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8529: 81 81 81 81   Data
            .hex 81 81 81 81   ; $852d: 81 81 81 81   Data
            .hex 81 81 30 90   ; $8531: 81 81 30 90   Data
            .hex 85 81 b8 1a   ; $8535: 85 81 b8 1a   Data
            .hex 80 20 0c 80   ; $8539: 80 20 0c 80   Data
            .hex 81 28 0a 80   ; $853d: 81 28 0a 80   Data
            .hex 24 01 50 50   ; $8541: 24 01 50 50   Data
            .hex 00 0c 80 21   ; $8545: 00 0c 80 21   Data
            .hex 08 80 81 20   ; $8549: 08 80 81 20   Data
            .hex 0d 80 20 00   ; $854d: 0d 80 20 00   Data
            .hex 50 50 04 09   ; $8551: 50 50 04 09   Data
            .hex 80 20 08 80   ; $8555: 80 20 08 80   Data
            .hex 81 21 08 80   ; $8559: 81 21 08 80   Data
            .hex 60 c0 86 81   ; $855d: 60 c0 86 81   Data
            .hex e0 48 80 81   ; $8561: e0 48 80 81   Data
            .hex 81 81 81 81   ; $8565: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8569: 81 81 81 81   Data
            .hex 81 81 81 81   ; $856d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8571: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8575: 81 81 81 81   Data
            .hex ff ff ff fd   ; $8579: ff ff ff fd   Data
            .hex fd 3f 0a 82   ; $857d: fd 3f 0a 82   Data
            .hex a0 fc 7f 7f   ; $8581: a0 fc 7f 7f   Data
            .hex ff ff ff b0   ; $8585: ff ff ff b0   Data
            .hex 10 50 10 10   ; $8589: 10 50 10 10   Data
            .hex 90 85 20 08   ; $858d: 90 85 20 08   Data
            .hex 80 e0 04 08   ; $8591: 80 e0 04 08   Data
            .hex 80 20 c0 86   ; $8595: 80 20 c0 86   Data
            .hex 81 21 0c 80   ; $8599: 81 21 0c 80   Data
            .hex 20 90 85 81   ; $859d: 20 90 85 81   Data
            .hex 20 09 80 20   ; $85a1: 20 09 80 20   Data
            .hex 08 80 b0 00   ; $85a5: 08 80 b0 00   Data
            .hex c0 86 e0 00   ; $85a9: c0 86 e0 00   Data
            .hex 18 02 08 80   ; $85ad: 18 02 08 80   Data
            .hex 81 81 28 02   ; $85b1: 81 81 28 02   Data
            .hex 04 0c 80 81   ; $85b5: 04 0c 80 81   Data
            .hex b0 08 42 01   ; $85b9: b0 08 42 01   Data
            .hex 09 80 81 20   ; $85bd: 09 80 81 20   Data
            .hex 08 80 e0 00   ; $85c1: 08 80 e0 00   Data
            .hex 90 85 20 c0   ; $85c5: 90 85 20 c0   Data
            .hex 86 81 20 08   ; $85c9: 86 81 20 08   Data
            .hex 80 20 90 85   ; $85cd: 80 20 90 85   Data
            .hex 81 20 08 80   ; $85d1: 81 20 08 80   Data
            .hex 20 08 80 b0   ; $85d5: 20 08 80 b0   Data
            .hex 00 08 80 e0   ; $85d9: 00 08 80 e0   Data
            .hex 40 50 40 40   ; $85dd: 40 50 40 40   Data
            .hex c0 86 28 0a   ; $85e1: c0 86 28 0a   Data
            .hex 8a a1 a9 29   ; $85e5: 8a a1 a9 29   Data
            .hex f5 7d 5c a7   ; $85e9: f5 7d 5c a7   Data
            .hex 6a 6a 82 a0   ; $85ed: 6a 6a 82 a0   Data
            .hex a0 81 b0 18   ; $85f1: a0 81 b0 18   Data
            .hex 12 90 85 81   ; $85f5: 12 90 85 81   Data
            .hex b0 04 0c 06   ; $85f9: b0 04 0c 06   Data
            .hex 04 90 85 28   ; $85fd: 04 90 85 28   Data
            .hex 07 09 03 0d   ; $8601: 07 09 03 0d   Data
            .hex 0a 80 20 01   ; $8605: 0a 80 20 01   Data
            .hex 08 02 01 08   ; $8609: 08 02 01 08   Data
            .hex 80 28 02 40   ; $860d: 80 28 02 40   Data
            .hex 40 00 08 80   ; $8611: 40 00 08 80   Data
            .hex 28 0a 80 81   ; $8615: 28 0a 80 81   Data
            .hex 20 08 80 20   ; $8619: 20 08 80 20   Data
            .hex 08 80 81 20   ; $861d: 08 80 81 20   Data
            .hex 08 80 28 0a   ; $8621: 08 80 28 0a   Data
            .hex 80 81 20 08   ; $8625: 80 81 20 08   Data
            .hex 80 28 02 10   ; $8629: 80 28 02 10   Data
            .hex 10 00 08 80   ; $862d: 10 00 08 80   Data
            .hex 20 04 08 02   ; $8631: 20 04 08 02   Data
            .hex 04 08 80 28   ; $8635: 04 08 80 28   Data
            .hex 07 0c 06 0d   ; $8639: 07 0c 06 0d   Data
            .hex 0a 80 e0 01   ; $863d: 0a 80 e0 01   Data
            .hex 09 03 01 c0   ; $8641: 09 03 01 c0   Data
            .hex 86 81 e0 48   ; $8645: 86 81 e0 48   Data
            .hex 42 c0 86 81   ; $8649: 42 c0 86 81   Data
            .hex d5 d1 15 14   ; $864d: d5 d1 15 14   Data
            .hex 54 6a 1a 86   ; $8651: 54 6a 1a 86   Data
            .hex a1 a8 15 14   ; $8655: a1 a8 15 14   Data
            .hex 54 47 57 30   ; $8659: 54 47 57 30   Data
            .hex 10 10 10 10   ; $865d: 10 10 10 10   Data
            .hex 18 80 20 00   ; $8661: 18 80 20 00   Data
            .hex 00 00 00 08   ; $8665: 00 00 00 08   Data
            .hex 80 20 00 00   ; $8669: 80 20 00 00   Data
            .hex 00 00 08 80   ; $866d: 00 00 08 80   Data
            .hex 60 04 00 00   ; $8671: 60 04 00 00   Data
            .hex 04 48 80 81   ; $8675: 04 48 80 81   Data
            .hex 21 04 04 09   ; $8679: 21 04 04 09   Data
            .hex 80 81 81 20   ; $867d: 80 81 81 20   Data
            .hex 01 01 08 80   ; $8681: 01 01 08 80   Data
            .hex 81 81 20 00   ; $8685: 81 81 20 00   Data
            .hex 00 08 80 81   ; $8689: 00 08 80 81   Data
            .hex 81 20 04 04   ; $868d: 81 20 04 04   Data
            .hex 08 80 81 81   ; $8691: 08 80 81 81   Data
            .hex 24 01 01 0c   ; $8695: 24 01 01 0c   Data
            .hex 80 81 30 01   ; $8699: 80 81 30 01   Data
            .hex 00 00 01 18   ; $869d: 00 00 01 18   Data
            .hex 80 20 00 00   ; $86a1: 80 20 00 00   Data
            .hex 00 00 08 80   ; $86a5: 00 00 08 80   Data
            .hex 20 00 00 00   ; $86a9: 20 00 00 00   Data
            .hex 00 08 80 60   ; $86ad: 00 08 80 60   Data
            .hex 40 40 40 40   ; $86b1: 40 40 40 40   Data
            .hex 48 80 11 15   ; $86b5: 48 80 11 15   Data
            .hex 51 13 57 d5   ; $86b9: 51 13 57 d5   Data
            .hex f5 7d 5f 57   ; $86bd: f5 7d 5f 57   Data
            .hex d5 c4 45 54   ; $86c1: d5 c4 45 54   Data
            .hex 44 30 10 14   ; $86c5: 44 30 10 14   Data
            .hex 14 10 18 80   ; $86c9: 14 10 18 80   Data
            .hex 20 00 09 03   ; $86cd: 20 00 09 03   Data
            .hex 08 0a 80 20   ; $86d1: 08 0a 80 20   Data
            .hex 04 04 00 48   ; $86d5: 04 04 00 48   Data
            .hex 4a 80 20 01   ; $86d9: 4a 80 20 01   Data
            .hex 01 00 90 85   ; $86dd: 01 00 90 85   Data
            .hex 81 e0 00 08   ; $86e1: 81 e0 00 08   Data
            .hex 06 00 90 85   ; $86e5: 06 00 90 85   Data
            .hex 81 e0 04 09   ; $86e9: 81 e0 04 09   Data
            .hex 02 0c 80 81   ; $86ed: 02 0c 80 81   Data
            .hex 81 21 04 04   ; $86f1: 81 21 04 04   Data
            .hex 09 80 81 b0   ; $86f5: 09 80 81 b0   Data
            .hex 00 05 01 08   ; $86f9: 00 05 01 08   Data
            .hex 80 b0 04 04   ; $86fd: 80 b0 04 04   Data
            .hex 09 02 c0 86   ; $8701: 09 02 c0 86   Data
            .hex 20 09 03 00   ; $8705: 20 09 03 00   Data
            .hex c0 86 81 20   ; $8709: c0 86 81 20   Data
            .hex 00 00 00 18   ; $870d: 00 00 00 18   Data
            .hex 1a 80 20 00   ; $8711: 1a 80 20 00   Data
            .hex 00 00 08 0a   ; $8715: 00 00 08 0a   Data
            .hex 80 60 40 40   ; $8719: 80 60 40 40   Data
            .hex 40 40 48 80   ; $871d: 40 40 48 80   Data
            .hex 04 01 15 7d   ; $8721: 04 01 15 7d   Data
            .hex 47 d4 7d 5f   ; $8725: 47 d4 7d 5f   Data
            .hex 53 55 55 d4   ; $8729: 53 55 55 d4   Data
            .hex f0 00 00 30   ; $872d: f0 00 00 30   Data
            .hex 10 10 10 10   ; $8731: 10 10 10 10   Data
            .hex 90 85 20 00   ; $8735: 90 85 20 00   Data
            .hex 40 00 04 08   ; $8739: 40 00 04 08   Data
            .hex 80 20 0c 80   ; $873d: 80 20 0c 80   Data
            .hex 28 03 0c 80   ; $8741: 28 03 0c 80   Data
            .hex 20 01 14 04   ; $8745: 20 01 14 04   Data
            .hex 00 09 80 20   ; $8749: 00 09 80 20   Data
            .hex 00 01 01 00   ; $874d: 00 01 01 00   Data
            .hex 08 80 20 00   ; $8751: 08 80 20 00   Data
            .hex 00 00 40 08   ; $8755: 00 00 40 08   Data
            .hex 80 28 02 00   ; $8759: 80 28 02 00   Data
            .hex 08 80 28 80   ; $875d: 08 80 28 80   Data
            .hex 28 02 04 00   ; $8761: 28 02 04 00   Data
            .hex 10 08 80 20   ; $8765: 10 08 80 20   Data
            .hex 04 01 00 04   ; $8769: 04 01 00 04   Data
            .hex c0 86 20 01   ; $876d: c0 86 20 01   Data
            .hex 40 08 0b 80   ; $8771: 40 08 0b 80   Data
            .hex 81 20 08 80   ; $8775: 81 20 08 80   Data
            .hex 20 00 90 85   ; $8779: 20 00 90 85   Data
            .hex 20 00 10 00   ; $877d: 20 00 10 00   Data
            .hex 00 48 80 60   ; $8781: 00 48 80 60   Data
            .hex 40 40 40 c0   ; $8785: 40 40 40 c0   Data
            .hex 86 81 01 4a   ; $8789: 86 81 01 4a   Data
            .hex 16 95 55 40   ; $878d: 16 95 55 40   Data
            .hex 10 a4 29 40   ; $8791: 10 a4 29 40   Data
            .hex 55 ca 72 84   ; $8795: 55 ca 72 84   Data
            .hex 47 30 10 18   ; $8799: 47 30 10 18   Data
            .hex 80 30 90 85   ; $879d: 80 30 90 85   Data
            .hex 20 00 00 18   ; $87a1: 20 00 00 18   Data
            .hex 06 08 80 20   ; $87a5: 06 08 80 20   Data
            .hex 00 00 00 01   ; $87a9: 00 00 00 01   Data
            .hex 08 80 20 00   ; $87ad: 08 80 20 00   Data
            .hex 08 02 00 08   ; $87b1: 08 02 00 08   Data
            .hex 80 20 00 0c   ; $87b5: 80 20 00 0c   Data
            .hex 06 00 08 80   ; $87b9: 06 00 08 80   Data
            .hex 20 0c 03 01   ; $87bd: 20 0c 03 01   Data
            .hex 40 c0 86 20   ; $87c1: 40 c0 86 20   Data
            .hex 01 00 00 90   ; $87c5: 01 00 00 90   Data
            .hex 85 81 20 0c   ; $87c9: 85 81 20 0c   Data
            .hex 0a 06 08 80   ; $87cd: 0a 06 08 80   Data
            .hex 81 20 0d 0a   ; $87d1: 81 20 0d 0a   Data
            .hex 07 00 90 85   ; $87d5: 07 00 90 85   Data
            .hex 20 09 0a 03   ; $87d9: 20 09 0a 03   Data
            .hex 00 08 80 20   ; $87dd: 00 08 80 20   Data
            .hex 00 00 00 04   ; $87e1: 00 00 00 04   Data
            .hex 0c 80 20 00   ; $87e5: 0c 80 20 00   Data
            .hex 00 08 03 09   ; $87e9: 00 08 03 09   Data
            .hex 80 e0 40 40   ; $87ed: 80 e0 40 40   Data
            .hex 40 40 c0 86   ; $87f1: 40 40 c0 86   Data
            .hex 4f 00 04 40   ; $87f5: 4f 00 04 40   Data
            .hex 51 55 15 f5   ; $87f9: 51 55 15 f5   Data
            .hex 5c 57 15 01   ; $87fd: 5c 57 15 01   Data
            .hex 10 14 00 81   ; $8801: 10 14 00 81   Data
            .hex b0 10 10 90   ; $8805: b0 10 10 90   Data
            .hex 85 81 b0 00   ; $8809: 85 81 b0 00   Data
            .hex 00 00 00 90   ; $880d: 00 00 00 90   Data
            .hex 85 20 08 02   ; $8811: 85 20 08 02   Data
            .hex 00 00 0c 80   ; $8815: 00 00 0c 80   Data
            .hex 20 08 0e 02   ; $8819: 20 08 0e 02   Data
            .hex 08 0b 80 20   ; $881d: 08 0b 80 20   Data
            .hex 00 01 00 0c   ; $8821: 00 01 00 0c   Data
            .hex 0a 80 20 00   ; $8825: 0a 80 20 00   Data
            .hex 40 40 01 08   ; $8829: 40 40 01 08   Data
            .hex 80 28 0a 80   ; $882d: 80 28 0a 80   Data
            .hex 81 20 0c 80   ; $8831: 81 20 0c 80   Data
            .hex 20 08 80 81   ; $8835: 20 08 80 81   Data
            .hex 20 09 80 20   ; $8839: 20 09 80 20   Data
            .hex 08 80 81 2c   ; $883d: 08 80 81 2c   Data
            .hex 0a 80 20 08   ; $8841: 0a 80 20 08   Data
            .hex 80 81 21 0c   ; $8845: 80 81 21 0c   Data
            .hex 80 20 08 80   ; $8849: 80 20 08 80   Data
            .hex 81 20 09 80   ; $884d: 81 20 09 80   Data
            .hex 20 08 80 81   ; $8851: 20 08 80 81   Data
            .hex 20 08 80 e0   ; $8855: 20 08 80 e0   Data
            .hex c0 86 81 e0   ; $8859: c0 86 81 e0   Data
            .hex c0 86 d0 d1   ; $885d: c0 86 d0 d1   Data
            .hex 01 44 51 55   ; $8861: 01 44 51 55   Data
            .hex 1f d3 f1 fc   ; $8865: 1f d3 f1 fc   Data
            .hex 3f 5f c3 f4   ; $8869: 3f 5f c3 f4   Data
            .hex fd 38 16 10   ; $886d: fd 38 16 10   Data
            .hex 14 10 18 80   ; $8871: 14 10 18 80   Data
            .hex 24 09 02 01   ; $8875: 24 09 02 01   Data
            .hex 0c 0a 80 21   ; $8879: 0c 0a 80 21   Data
            .hex 00 0c 02 01   ; $887d: 00 0c 02 01   Data
            .hex 0c 80 20 04   ; $8881: 0c 80 20 04   Data
            .hex 01 0c 06 09   ; $8885: 01 0c 06 09   Data
            .hex 80 2c 03 00   ; $8889: 80 2c 03 00   Data
            .hex 01 01 0c 80   ; $888d: 01 01 0c 80   Data
            .hex 21 0c 02 0c   ; $8891: 21 0c 02 0c   Data
            .hex 02 09 80 24   ; $8895: 02 09 80 24   Data
            .hex 09 02 01 04   ; $8899: 09 02 01 04   Data
            .hex 08 80 21 00   ; $889d: 08 80 21 00   Data
            .hex 0c 02 09 0a   ; $88a1: 0c 02 09 0a   Data
            .hex 80 28 06 01   ; $88a5: 80 28 06 01   Data
            .hex 08 06 08 80   ; $88a9: 08 06 08 80   Data
            .hex 20 01 0c 02   ; $88ad: 20 01 0c 02   Data
            .hex 01 0c 80 24   ; $88b1: 01 0c 80 24   Data
            .hex 00 01 04 08   ; $88b5: 00 01 04 08   Data
            .hex 0b 80 29 02   ; $88b9: 0b 80 29 02   Data
            .hex 08 03 04 0c   ; $88bd: 08 03 04 0c   Data
            .hex 80 60 48 42   ; $88c1: 80 60 48 42   Data
            .hex 40 41 49 80   ; $88c5: 40 41 49 80   Data
            .hex 55 55 11 55   ; $88c9: 55 55 11 55   Data
            .hex 55 45 15 55   ; $88cd: 55 45 15 55   Data
            .hex 45 55 45 15   ; $88d1: 45 55 45 15   Data
            .hex 55 14 50 81   ; $88d5: 55 14 50 81   Data
            .hex 81 81 81 81   ; $88d9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $88dd: 81 81 81 81   Data
            .hex 81 81 81 81   ; $88e1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $88e5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $88e9: 81 81 81 81   Data
            .hex 81 81 b0 18   ; $88ed: 81 81 b0 18   Data
            .hex 12 90 85 b0   ; $88f1: 12 90 85 b0   Data
            .hex 10 0c 06 00   ; $88f5: 10 0c 06 00   Data
            .hex 08 80 24 00   ; $88f9: 08 80 24 00   Data
            .hex 09 03 0c 0e   ; $88fd: 09 03 0c 0e   Data
            .hex 80 21 0c 06   ; $8901: 80 21 0c 06   Data
            .hex 00 09 0b 80   ; $8905: 00 09 0b 80   Data
            .hex 20 09 03 0c   ; $8909: 20 09 03 0c   Data
            .hex 06 08 80 e0   ; $890d: 06 08 80 e0   Data
            .hex 40 00 09 03   ; $8911: 40 00 09 03   Data
            .hex 08 80 81 81   ; $8915: 08 80 81 81   Data
            .hex e0 40 40 c0   ; $8919: e0 40 40 c0   Data
            .hex 86 81 81 81   ; $891d: 86 81 81 81   Data
            .hex 81 81 81 81   ; $8921: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8925: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8929: 81 81 81 81   Data
            .hex 81 81 81 81   ; $892d: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $8931: 81 81 ff ff   Data
            .hex ff ff d0 51   ; $8935: ff ff d0 51   Data
            .hex 44 44 55 10   ; $8939: 44 44 55 10   Data
            .hex f4 7f ff ff   ; $893d: f4 7f ff ff   Data
            .hex ff b8 80 81   ; $8941: ff b8 80 81   Data
            .hex 30 10 18 80   ; $8945: 30 10 18 80   Data
            .hex 20 18 80 20   ; $8949: 20 18 80 20   Data
            .hex 00 08 80 60   ; $894d: 00 08 80 60   Data
            .hex 00 10 00 00   ; $8951: 00 10 00 00   Data
            .hex 08 80 81 20   ; $8955: 08 80 81 20   Data
            .hex 00 00 00 c0   ; $8959: 00 00 00 c0   Data
            .hex 86 81 20 00   ; $895d: 86 81 20 00   Data
            .hex 00 c0 86 81   ; $8961: 00 c0 86 81   Data
            .hex b0 00 00 00   ; $8965: b0 00 00 00   Data
            .hex 10 90 85 20   ; $8969: 10 90 85 20   Data
            .hex 00 08 02 04   ; $896d: 00 08 02 04   Data
            .hex 08 80 20 08   ; $8971: 08 80 20 08   Data
            .hex 06 00 09 0a   ; $8975: 06 00 09 0a   Data
            .hex 80 60 40 01   ; $8979: 80 60 40 01   Data
            .hex 00 40 48 80   ; $897d: 00 40 48 80   Data
            .hex 81 81 20 08   ; $8981: 81 81 20 08   Data
            .hex 80 81 81 30   ; $8985: 80 81 81 30   Data
            .hex 10 00 00 10   ; $8989: 10 00 00 10   Data
            .hex 18 80 20 00   ; $898d: 18 80 20 00   Data
            .hex 40 00 00 08   ; $8991: 40 00 00 08   Data
            .hex 80 60 48 80   ; $8995: 80 60 48 80   Data
            .hex 60 40 c0 86   ; $8999: 60 40 c0 86   Data
            .hex fc 0f 0c 43   ; $899d: fc 0f 0c 43   Data
            .hex 47 c7 d5 14   ; $89a1: 47 c7 d5 14   Data
            .hex 45 45 f7 fd   ; $89a5: 45 45 f7 fd   Data
            .hex f1 10 f1 30   ; $89a9: f1 10 f1 30   Data
            .hex 90 85 81 b0   ; $89ad: 90 85 81 b0   Data
            .hex 90 85 20 04   ; $89b1: 90 85 20 04   Data
            .hex 90 85 20 08   ; $89b5: 90 85 20 08   Data
            .hex 80 e0 01 00   ; $89b9: 80 e0 01 00   Data
            .hex 14 04 08 80   ; $89bd: 14 04 08 80   Data
            .hex 81 e0 08 03   ; $89c1: 81 e0 08 03   Data
            .hex 01 08 80 81   ; $89c5: 01 08 80 81   Data
            .hex b0 08 4a 02   ; $89c9: b0 08 4a 02   Data
            .hex c0 86 b0 00   ; $89cd: c0 86 b0 00   Data
            .hex c0 86 20 18   ; $89d1: c0 86 20 18   Data
            .hex 80 20 08 80   ; $89d5: 80 20 08 80   Data
            .hex 81 20 08 80   ; $89d9: 81 20 08 80   Data
            .hex e0 00 90 85   ; $89dd: e0 00 90 85   Data
            .hex 20 48 80 81   ; $89e1: 20 48 80 81   Data
            .hex e0 00 18 02   ; $89e5: e0 00 18 02   Data
            .hex 90 85 81 b0   ; $89e9: 90 85 81 b0   Data
            .hex 00 00 00 0c   ; $89ed: 00 00 00 0c   Data
            .hex 80 b0 00 08   ; $89f1: 80 b0 00 08   Data
            .hex 42 00 09 80   ; $89f5: 42 00 09 80   Data
            .hex 20 00 c0 86   ; $89f9: 20 00 c0 86   Data
            .hex 20 08 80 60   ; $89fd: 20 08 80 60   Data
            .hex c0 86 81 e0   ; $8a01: c0 86 81 e0   Data
            .hex c0 86 3f 03   ; $8a05: c0 86 3f 03   Data
            .hex cd 53 d5 da   ; $8a09: cd 53 d5 da   Data
            .hex da 96 a7 6b   ; $8a0d: da 96 a7 6b   Data
            .hex f4 71 40 f0   ; $8a11: f4 71 40 f0   Data
            .hex fc 81 81 81   ; $8a15: fc 81 81 81   Data
            .hex 81 81 81 81   ; $8a19: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8a1d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8a21: 81 81 81 81   Data
            .hex 81 81 81 b0   ; $8a25: 81 81 81 b0   Data
            .hex 18 80 81 b0   ; $8a29: 18 80 81 b0   Data
            .hex 10 10 00 08   ; $8a2d: 10 10 00 08   Data
            .hex 80 b0 00 40   ; $8a31: 80 b0 00 40   Data
            .hex 00 00 08 80   ; $8a35: 00 00 08 80   Data
            .hex 20 08 80 20   ; $8a39: 20 08 80 20   Data
            .hex 04 c0 86 20   ; $8a3d: 04 c0 86 20   Data
            .hex 00 50 00 0d   ; $8a41: 00 50 00 0d   Data
            .hex 80 81 20 08   ; $8a45: 80 81 20 08   Data
            .hex 80 20 01 90   ; $8a49: 80 20 01 90   Data
            .hex 85 e0 00 10   ; $8a4d: 85 e0 00 10   Data
            .hex 00 00 08 80   ; $8a51: 00 00 08 80   Data
            .hex 81 e0 40 40   ; $8a55: 81 e0 40 40   Data
            .hex 00 08 80 81   ; $8a59: 00 08 80 81   Data
            .hex 81 81 81 e0   ; $8a5d: 81 81 81 e0   Data
            .hex 48 80 81 81   ; $8a61: 48 80 81 81   Data
            .hex 81 81 81 81   ; $8a65: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8a69: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8a6d: 81 81 81 81   Data
            .hex ff ff ff f3   ; $8a71: ff ff ff f3   Data
            .hex 50 68 0a 72   ; $8a75: 50 68 0a 72   Data
            .hex 9d a0 d4 3f   ; $8a79: 9d a0 d4 3f   Data
            .hex cf ff ff 81   ; $8a7d: cf ff ff 81   Data
            .hex 81 38 80 b2   ; $8a81: 81 38 80 b2   Data
            .hex 85 81 81 30   ; $8a85: 85 81 81 30   Data
            .hex 40 10 08 80   ; $8a89: 40 10 08 80   Data
            .hex 81 30 08 80   ; $8a8d: 81 30 08 80   Data
            .hex 20 08 80 81   ; $8a91: 20 08 80 81   Data
            .hex 20 00 10 40   ; $8a95: 20 00 10 40   Data
            .hex 40 90 85 20   ; $8a99: 40 90 85 20   Data
            .hex 00 08 80 81   ; $8a9d: 00 08 80 81   Data
            .hex 2c 80 e0 00   ; $8aa1: 2c 80 e0 00   Data
            .hex 08 12 10 49   ; $8aa5: 08 12 10 49   Data
            .hex 80 81 60 00   ; $8aa9: 80 81 60 00   Data
            .hex 00 08 80 81   ; $8aad: 00 08 80 81   Data
            .hex 81 81 60 00   ; $8ab1: 81 81 60 00   Data
            .hex 48 80 81 81   ; $8ab5: 48 80 81 81   Data
            .hex 81 b0 00 90   ; $8ab9: 81 b0 00 90   Data
            .hex 85 81 81 b0   ; $8abd: 85 81 81 b0   Data
            .hex 00 00 00 90   ; $8ac1: 00 00 00 90   Data
            .hex 85 b0 00 00   ; $8ac5: 85 b0 00 00   Data
            .hex 00 00 08 80   ; $8ac9: 00 00 08 80   Data
            .hex 20 40 00 00   ; $8acd: 20 40 00 00   Data
            .hex 40 08 80 68   ; $8ad1: 40 08 80 68   Data
            .hex 80 68 4a 80   ; $8ad5: 80 68 4a 80   Data
            .hex 68 80 ff fa   ; $8ad9: 68 80 ff fa   Data
            .hex 32 8d 2a 1a   ; $8add: 32 8d 2a 1a   Data
            .hex b5 7f 4f ff   ; $8ae1: b5 7f 4f ff   Data
            .hex f1 f0 00 03   ; $8ae5: f1 f0 00 03   Data
            .hex df 81 81 81   ; $8ae9: df 81 81 81   Data
            .hex 81 81 81 81   ; $8aed: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8af1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8af5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8af9: 81 81 81 81   Data
            .hex 81 81 b0 18   ; $8afd: 81 81 b0 18   Data
            .hex 80 30 10 90   ; $8b01: 80 30 10 90   Data
            .hex 85 24 08 12   ; $8b05: 85 24 08 12   Data
            .hex 04 00 08 80   ; $8b09: 04 00 08 80   Data
            .hex 21 0c 06 01   ; $8b0d: 21 0c 06 01   Data
            .hex 48 0a 80 24   ; $8b11: 48 0a 80 24   Data
            .hex 01 01 08 80   ; $8b15: 01 01 08 80   Data
            .hex 2c 80 21 00   ; $8b19: 2c 80 21 00   Data
            .hex 00 0c 16 09   ; $8b1d: 00 0c 16 09   Data
            .hex 80 e0 00 08   ; $8b21: 80 e0 00 08   Data
            .hex 03 05 0c 80   ; $8b25: 03 05 0c 80   Data
            .hex 81 60 40 08   ; $8b29: 81 60 40 08   Data
            .hex 03 09 80 81   ; $8b2d: 03 09 80 81   Data
            .hex 81 81 60 40   ; $8b31: 81 81 60 40   Data
            .hex c0 86 81 81   ; $8b35: c0 86 81 81   Data
            .hex 81 81 81 81   ; $8b39: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8b3d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8b41: 81 81 81 81   Data
            .hex ff ff ff fd   ; $8b45: ff ff ff fd   Data
            .hex f1 10 05 a5   ; $8b49: f1 10 05 a5   Data
            .hex 28 54 d1 7f   ; $8b4d: 28 54 d1 7f   Data
            .hex 1f ff ff 81   ; $8b51: 1f ff ff 81   Data
            .hex 81 30 18 80   ; $8b55: 81 30 18 80   Data
            .hex 81 81 81 81   ; $8b59: 81 81 81 81   Data
            .hex 20 08 80 81   ; $8b5d: 20 08 80 81   Data
            .hex 81 81 81 20   ; $8b61: 81 81 81 20   Data
            .hex 08 80 81 81   ; $8b65: 08 80 81 81   Data
            .hex 30 10 00 00   ; $8b69: 30 10 00 00   Data
            .hex 10 18 80 20   ; $8b6d: 10 18 80 20   Data
            .hex 00 00 00 00   ; $8b71: 00 00 00 00   Data
            .hex 08 80 20 00   ; $8b75: 08 80 20 00   Data
            .hex 00 00 00 08   ; $8b79: 00 00 00 08   Data
            .hex 80 20 00 00   ; $8b7d: 80 20 00 00   Data
            .hex 00 00 08 80   ; $8b81: 00 00 08 80   Data
            .hex 20 00 00 00   ; $8b85: 20 00 00 00   Data
            .hex 00 08 80 20   ; $8b89: 00 08 80 20   Data
            .hex 00 00 00 00   ; $8b8d: 00 00 00 00   Data
            .hex 08 80 60 40   ; $8b91: 08 80 60 40   Data
            .hex 00 00 40 48   ; $8b95: 00 00 40 48   Data
            .hex 80 81 81 20   ; $8b99: 80 81 81 20   Data
            .hex 08 80 81 81   ; $8b9d: 08 80 81 81   Data
            .hex 81 81 20 08   ; $8ba1: 81 81 20 08   Data
            .hex 80 81 81 81   ; $8ba5: 80 81 81 81   Data
            .hex 81 60 48 80   ; $8ba9: 81 60 48 80   Data
            .hex 81 81 f3 fd   ; $8bad: 81 81 f3 fd   Data
            .hex ff 7c 45 40   ; $8bb1: ff 7c 45 40   Data
            .hex 50 14 05 01   ; $8bb5: 50 14 05 01   Data
            .hex 11 7d ff 7f   ; $8bb9: 11 7d ff 7f   Data
            .hex cf 81 b8 12   ; $8bbd: cf 81 b8 12   Data
            .hex 18 1a 80 81   ; $8bc1: 18 1a 80 81   Data
            .hex 30 08 02 00   ; $8bc5: 30 08 02 00   Data
            .hex 00 90 85 20   ; $8bc9: 00 90 85 20   Data
            .hex 00 08 0a 02   ; $8bcd: 00 08 0a 02   Data
            .hex 08 80 e0 00   ; $8bd1: 08 80 e0 00   Data
            .hex 08 02 00 08   ; $8bd5: 08 02 00 08   Data
            .hex 80 81 20 00   ; $8bd9: 80 81 20 00   Data
            .hex 00 00 08 80   ; $8bdd: 00 00 08 80   Data
            .hex 81 e0 00 00   ; $8be1: 81 e0 00 00   Data
            .hex 00 c0 86 81   ; $8be5: 00 c0 86 81   Data
            .hex 81 20 00 00   ; $8be9: 81 20 00 00   Data
            .hex 90 85 30 10   ; $8bed: 90 85 30 10   Data
            .hex 00 00 00 08   ; $8bf1: 00 00 00 08   Data
            .hex 80 20 00 0c   ; $8bf5: 80 20 00 0c   Data
            .hex 06 08 0a 80   ; $8bf9: 06 08 0a 80   Data
            .hex e0 40 09 03   ; $8bfd: e0 40 09 03   Data
            .hex 00 08 80 81   ; $8c01: 00 08 80 81   Data
            .hex 81 24 00 00   ; $8c05: 81 24 00 00   Data
            .hex 08 80 81 81   ; $8c09: 08 80 81 81   Data
            .hex 61 40 40 c0   ; $8c0d: 61 40 40 c0   Data
            .hex 86 81 81 81   ; $8c11: 86 81 81 81   Data
            .hex 81 81 81 81   ; $8c15: 81 81 81 81   Data
            .hex d5 d1 11 53   ; $8c19: d5 d1 11 53   Data
            .hex 50 d5 7d 7f   ; $8c1d: 50 d5 7d 7f   Data
            .hex 55 14 54 7d   ; $8c21: 55 14 54 7d   Data
            .hex 5f 53 ff 30   ; $8c25: 5f 53 ff 30   Data
            .hex 10 10 10 10   ; $8c29: 10 10 10 10   Data
            .hex 18 80 60 00   ; $8c2d: 18 80 60 00   Data
            .hex 00 00 00 08   ; $8c31: 00 00 00 08   Data
            .hex 80 81 20 00   ; $8c35: 80 81 20 00   Data
            .hex 00 40 48 80   ; $8c39: 00 40 48 80   Data
            .hex 81 20 04 08   ; $8c3d: 81 20 04 08   Data
            .hex 80 81 81 81   ; $8c41: 80 81 81 81   Data
            .hex 60 01 00 18   ; $8c45: 60 01 00 18   Data
            .hex 80 81 81 81   ; $8c49: 80 81 81 81   Data
            .hex 20 00 08 80   ; $8c4d: 20 00 08 80   Data
            .hex 81 30 14 00   ; $8c51: 81 30 14 00   Data
            .hex 40 48 80 81   ; $8c55: 40 48 80 81   Data
            .hex 20 01 0c 80   ; $8c59: 20 01 0c 80   Data
            .hex 81 81 81 60   ; $8c5d: 81 81 81 60   Data
            .hex 04 01 1c 80   ; $8c61: 04 01 1c 80   Data
            .hex 81 81 81 21   ; $8c65: 81 81 81 21   Data
            .hex 00 09 80 81   ; $8c69: 00 09 80 81   Data
            .hex 81 30 08 42   ; $8c6d: 81 30 08 42   Data
            .hex 00 10 18 80   ; $8c71: 00 10 18 80   Data
            .hex 20 08 80 20   ; $8c75: 20 08 80 20   Data
            .hex 00 08 80 60   ; $8c79: 00 08 80 60   Data
            .hex 48 80 60 40   ; $8c7d: 48 80 60 40   Data
            .hex 48 80 04 34   ; $8c81: 48 80 04 34   Data
            .hex 0c 7f 5f f1   ; $8c85: 0c 7f 5f f1   Data
            .hex fd 75 fd 7f   ; $8c89: fd 75 fd 7f   Data
            .hex d7 f4 f3 c0   ; $8c8d: d7 f4 f3 c0   Data
            .hex f0 81 81 81   ; $8c91: f0 81 81 81   Data
            .hex 81 81 81 81   ; $8c95: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8c99: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8c9d: 81 81 81 81   Data
            .hex 81 81 b0 10   ; $8ca1: 81 81 b0 10   Data
            .hex 94 85 b0 10   ; $8ca5: 94 85 b0 10   Data
            .hex 10 00 04 09   ; $8ca9: 10 00 04 09   Data
            .hex 80 20 0c 06   ; $8cad: 80 20 0c 06   Data
            .hex 00 09 0a 80   ; $8cb1: 00 09 0a 80   Data
            .hex 20 09 03 04   ; $8cb5: 20 09 03 04   Data
            .hex 00 08 80 e0   ; $8cb9: 00 08 80 e0   Data
            .hex 00 04 09 02   ; $8cbd: 00 04 09 02   Data
            .hex c0 86 81 20   ; $8cc1: c0 86 81 20   Data
            .hex 0d 0a 06 90   ; $8cc5: 0d 0a 06 90   Data
            .hex 85 81 e0 41   ; $8cc9: 85 81 e0 41   Data
            .hex 00 01 08 80   ; $8ccd: 00 01 08 80   Data
            .hex 81 81 81 e0   ; $8cd1: 81 81 81 e0   Data
            .hex 40 c0 86 81   ; $8cd5: 40 c0 86 81   Data
            .hex 81 81 81 81   ; $8cd9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8cdd: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8ce1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8ce5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8ce9: 81 81 81 81   Data
            .hex ff ff ff d1   ; $8ced: ff ff ff d1   Data
            .hex 15 54 55 5c   ; $8cf1: 15 54 55 5c   Data
            .hex 5f 50 fd 7f   ; $8cf5: 5f 50 fd 7f   Data
            .hex ff ff ff 81   ; $8cf9: ff ff ff 81   Data
            .hex 81 81 81 81   ; $8cfd: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8d01: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8d05: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8d09: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8d0d: 81 81 81 81   Data
            .hex 81 30 10 18   ; $8d11: 81 30 10 18   Data
            .hex 80 81 81 81   ; $8d15: 80 81 81 81   Data
            .hex 20 00 08 80   ; $8d19: 20 00 08 80   Data
            .hex 81 81 81 20   ; $8d1d: 81 81 81 20   Data
            .hex 04 08 80 81   ; $8d21: 04 08 80 81   Data
            .hex 81 81 20 05   ; $8d25: 81 81 20 05   Data
            .hex 08 80 81 81   ; $8d29: 08 80 81 81   Data
            .hex 81 20 01 08   ; $8d2d: 81 20 01 08   Data
            .hex 80 81 81 81   ; $8d31: 80 81 81 81   Data
            .hex 20 00 08 80   ; $8d35: 20 00 08 80   Data
            .hex 81 81 81 60   ; $8d39: 81 81 81 60   Data
            .hex 40 48 80 81   ; $8d3d: 40 48 80 81   Data
            .hex 81 81 81 81   ; $8d41: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8d45: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8d49: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8d4d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8d51: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $8d55: 81 81 ff ff   Data
            .hex ff ff 0f c3   ; $8d59: ff ff 0f c3   Data
            .hex f5 fd 7f 0f   ; $8d5d: f5 fd 7f 0f   Data
            .hex c3 ff ff ff   ; $8d61: c3 ff ff ff   Data
            .hex ff 30 10 10   ; $8d65: ff 30 10 10   Data
            .hex 10 10 18 80   ; $8d69: 10 10 18 80   Data
            .hex e0 00 08 02   ; $8d6d: e0 00 08 02   Data
            .hex 04 48 80 b0   ; $8d71: 04 48 80 b0   Data
            .hex 00 08 02 09   ; $8d75: 00 08 02 09   Data
            .hex 80 81 60 40   ; $8d79: 80 81 60 40   Data
            .hex 00 04 00 58   ; $8d7d: 00 04 00 58   Data
            .hex 80 81 81 20   ; $8d81: 80 81 81 20   Data
            .hex 01 08 80 81   ; $8d85: 01 08 80 81   Data
            .hex b0 10 00 00   ; $8d89: b0 10 00 00   Data
            .hex 00 18 80 60   ; $8d8d: 00 18 80 60   Data
            .hex 08 02 00 00   ; $8d91: 08 02 00 00   Data
            .hex 48 80 81 20   ; $8d95: 48 80 81 20   Data
            .hex 00 00 08 80   ; $8d99: 00 00 08 80   Data
            .hex 81 81 24 00   ; $8d9d: 81 81 24 00   Data
            .hex 00 00 90 85   ; $8da1: 00 00 90 85   Data
            .hex 30 01 00 00   ; $8da5: 30 01 00 00   Data
            .hex 04 0c 80 20   ; $8da9: 04 0c 80 20   Data
            .hex 40 00 08 03   ; $8dad: 40 00 08 03   Data
            .hex 09 80 28 80   ; $8db1: 09 80 28 80   Data
            .hex 20 00 40 08   ; $8db5: 20 00 40 08   Data
            .hex 80 68 80 e0   ; $8db9: 80 68 80 e0   Data
            .hex 48 80 68 80   ; $8dbd: 48 80 68 80   Data
            .hex 44 71 71 0f   ; $8dc1: 44 71 71 0f   Data
            .hex d7 f4 c1 4d   ; $8dc5: d7 f4 c1 4d   Data
            .hex 4f 47 d5 11   ; $8dc9: 4f 47 d5 11   Data
            .hex 1f 13 cf 81   ; $8dcd: 1f 13 cf 81   Data
            .hex 81 81 81 81   ; $8dd1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8dd5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8dd9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8ddd: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8de1: 81 81 81 81   Data
            .hex b0 50 14 10   ; $8de5: b0 50 14 10   Data
            .hex 18 80 81 28   ; $8de9: 18 80 81 28   Data
            .hex 80 25 00 00   ; $8ded: 80 25 00 00   Data
            .hex 18 80 28 80   ; $8df1: 18 80 28 80   Data
            .hex 21 00 00 48   ; $8df5: 21 00 00 48   Data
            .hex 80 24 10 00   ; $8df9: 80 24 10 00   Data
            .hex 04 08 80 81   ; $8dfd: 04 08 80 81   Data
            .hex 21 00 00 01   ; $8e01: 21 00 00 01   Data
            .hex 04 18 80 60   ; $8e05: 04 18 80 60   Data
            .hex 00 04 0c 43   ; $8e09: 00 04 0c 43   Data
            .hex 08 80 81 20   ; $8e0d: 08 80 81 20   Data
            .hex 01 09 80 28   ; $8e11: 01 09 80 28   Data
            .hex 80 81 60 40   ; $8e15: 80 81 60 40   Data
            .hex 40 50 48 80   ; $8e19: 40 50 48 80   Data
            .hex 81 81 81 81   ; $8e1d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8e21: 81 81 81 81   Data
            .hex 81 81 81 81   ; $8e25: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $8e29: 81 81 ff ff   Data
            .hex ff fe 83 a0   ; $8e2d: ff fe 83 a0   Data
            .hex 69 71 0d 54   ; $8e31: 69 71 0d 54   Data
            .hex c6 b0 af ff   ; $8e35: c6 b0 af ff   Data
            .hex ff 81 30 10   ; $8e39: ff 81 30 10   Data
            .hex 10 90 85 81   ; $8e3d: 10 90 85 81   Data
            .hex 81 60 40 00   ; $8e41: 81 60 40 00   Data
            .hex 00 90 85 81   ; $8e45: 00 90 85 81   Data
            .hex 81 81 28 06   ; $8e49: 81 81 28 06   Data
            .hex 08 80 b0 18   ; $8e4d: 08 80 b0 18   Data
            .hex 80 20 01 08   ; $8e51: 80 20 01 08   Data
            .hex 80 20 00 14   ; $8e55: 80 20 00 14   Data
            .hex 00 00 08 80   ; $8e59: 00 00 08 80   Data
            .hex 28 0e 07 00   ; $8e5d: 28 0e 07 00   Data
            .hex 0c 0a 80 20   ; $8e61: 0c 0a 80 20   Data
            .hex 0d 0b 0a 03   ; $8e65: 0d 0b 0a 03   Data
            .hex 08 80 20 01   ; $8e69: 08 80 20 01   Data
            .hex 00 00 04 08   ; $8e6d: 00 00 04 08   Data
            .hex 80 20 00 08   ; $8e71: 80 20 00 08   Data
            .hex 0e 03 08 80   ; $8e75: 0e 03 08 80   Data
            .hex 20 00 00 0d   ; $8e79: 20 00 00 0d   Data
            .hex 02 08 80 e0   ; $8e7d: 02 08 80 e0   Data
            .hex 40 40 01 00   ; $8e81: 40 40 01 00   Data
            .hex 08 80 81 81   ; $8e85: 08 80 81 81   Data
            .hex 81 20 00 c0   ; $8e89: 81 20 00 c0   Data
            .hex 86 81 81 70   ; $8e8d: 86 81 81 70   Data
            .hex 40 c0 86 81   ; $8e91: 40 c0 86 81   Data
            .hex c1 ff 1f d4   ; $8e95: c1 ff 1f d4   Data
            .hex f4 51 15 41   ; $8e99: f4 51 15 41   Data
            .hex 15 44 14 54   ; $8e9d: 15 44 14 54   Data
            .hex 5f d3 f3 b0   ; $8ea1: 5f d3 f3 b0   Data
            .hex 10 50 50 10   ; $8ea5: 10 50 50 10   Data
            .hex 90 85 20 48   ; $8ea9: 90 85 20 48   Data
            .hex 80 81 20 08   ; $8ead: 80 81 20 08   Data
            .hex 80 28 80 30   ; $8eb1: 80 28 80 30   Data
            .hex 50 08 0a 80   ; $8eb5: 50 08 0a 80   Data
            .hex 28 80 28 80   ; $8eb9: 28 80 28 80   Data
            .hex e0 48 80 28   ; $8ebd: e0 48 80 28   Data
            .hex 80 20 18 80   ; $8ec1: 80 20 18 80   Data
            .hex 81 81 20 10   ; $8ec5: 81 81 20 10   Data
            .hex 00 00 90 85   ; $8ec9: 00 00 90 85   Data
            .hex 81 e0 08 02   ; $8ecd: 81 e0 08 02   Data
            .hex 40 00 90 85   ; $8ed1: 40 00 90 85   Data
            .hex 81 e8 0a 80   ; $8ed5: 81 e8 0a 80   Data
            .hex 60 08 80 81   ; $8ed9: 60 08 80 81   Data
            .hex b0 00 58 80   ; $8edd: b0 00 58 80   Data
            .hex 28 80 81 20   ; $8ee1: 28 80 81 20   Data
            .hex 08 80 30 0c   ; $8ee5: 08 80 30 0c   Data
            .hex 80 38 06 04   ; $8ee9: 80 38 06 04   Data
            .hex 10 00 09 80   ; $8eed: 10 00 09 80   Data
            .hex 20 01 01 00   ; $8ef1: 20 01 01 00   Data
            .hex 40 c0 86 60   ; $8ef5: 40 c0 86 60   Data
            .hex 40 40 c0 86   ; $8ef9: 40 40 c0 86   Data
            .hex 81 81 2a 2a   ; $8efd: 81 81 2a 2a   Data
            .hex 8a f6 bf a7   ; $8f01: 8a f6 bf a7   Data
            .hex c1 7d a7 ea   ; $8f05: c1 7d a7 ea   Data
            .hex ca b2 80 00   ; $8f09: ca b2 80 00   Data
            .hex 0f 30 10 10   ; $8f0d: 0f 30 10 10   Data
            .hex 10 10 90 85   ; $8f11: 10 10 90 85   Data
            .hex 60 40 40 00   ; $8f15: 60 40 40 00   Data
            .hex 00 08 80 81   ; $8f19: 00 08 80 81   Data
            .hex 81 b0 00 00   ; $8f1d: 81 b0 00 00   Data
            .hex c0 86 30 18   ; $8f21: c0 86 30 18   Data
            .hex 06 00 c0 86   ; $8f25: 06 00 c0 86   Data
            .hex 81 60 40 01   ; $8f29: 81 60 40 01   Data
            .hex 00 90 85 81   ; $8f2d: 00 90 85 81   Data
            .hex 81 81 e0 00   ; $8f31: 81 81 e0 00   Data
            .hex 04 90 85 30   ; $8f35: 04 90 85 30   Data
            .hex 10 10 08 03   ; $8f39: 10 10 08 03   Data
            .hex 0c 80 60 00   ; $8f3d: 0c 80 60 00   Data
            .hex 00 08 02 c1   ; $8f41: 00 08 02 c1   Data
            .hex 86 b0 40 00   ; $8f45: 86 b0 40 00   Data
            .hex 00 04 90 85   ; $8f49: 00 04 90 85   Data
            .hex 28 80 20 40   ; $8f4d: 28 80 20 40   Data
            .hex 01 0c 80 28   ; $8f51: 01 0c 80 28   Data
            .hex 80 28 80 24   ; $8f55: 80 28 80 24   Data
            .hex 09 80 20 10   ; $8f59: 09 80 20 10   Data
            .hex 08 80 21 0c   ; $8f5d: 08 80 21 0c   Data
            .hex 80 e0 40 48   ; $8f61: 80 e0 40 48   Data
            .hex 80 60 c1 86   ; $8f65: 80 60 c1 86   Data
            .hex 10 7f 1f 1c   ; $8f69: 10 7f 1f 1c   Data
            .hex 5f f4 ff 50   ; $8f6d: 5f f4 ff 50   Data
            .hex 53 07 a4 6b   ; $8f71: 53 07 a4 6b   Data
            .hex da f0 7d 81   ; $8f75: da f0 7d 81   Data
            .hex b0 10 10 94   ; $8f79: b0 10 10 94   Data
            .hex 85 81 b0 00   ; $8f7d: 85 81 b0 00   Data
            .hex 00 00 01 90   ; $8f81: 00 00 01 90   Data
            .hex 85 20 40 00   ; $8f85: 85 20 40 00   Data
            .hex 00 00 08 80   ; $8f89: 00 00 08 80   Data
            .hex 28 80 20 40   ; $8f8d: 28 80 20 40   Data
            .hex 00 c0 86 28   ; $8f91: 00 c0 86 28   Data
            .hex 80 28 80 28   ; $8f95: 80 28 80 28   Data
            .hex 80 81 e0 18   ; $8f99: 80 81 e0 18   Data
            .hex 0a 80 28 80   ; $8f9d: 0a 80 28 80   Data
            .hex 81 81 20 40   ; $8fa1: 81 81 20 40   Data
            .hex 10 08 80 81   ; $8fa5: 10 08 80 81   Data
            .hex b0 08 80 20   ; $8fa9: b0 08 80 20   Data
            .hex 04 94 85 20   ; $8fad: 04 94 85 20   Data
            .hex 08 80 20 01   ; $8fb1: 08 80 20 01   Data
            .hex 49 80 20 04   ; $8fb5: 49 80 20 04   Data
            .hex 10 00 08 80   ; $8fb9: 10 00 08 80   Data
            .hex 81 20 09 02   ; $8fbd: 81 20 09 02   Data
            .hex 00 00 18 80   ; $8fc1: 00 00 18 80   Data
            .hex e0 40 00 00   ; $8fc5: e0 40 00 00   Data
            .hex 04 0c 80 81   ; $8fc9: 04 0c 80 81   Data
            .hex 81 e0 40 41   ; $8fcd: 81 e0 40 41   Data
            .hex c1 86 c5 c4   ; $8fd1: c1 86 c5 c4   Data
            .hex 1a 06 ab aa   ; $8fd5: 1a 06 ab aa   Data
            .hex f2 be 9d a5   ; $8fd9: f2 be 9d a5   Data
            .hex 29 d4 31 07   ; $8fdd: 29 d4 31 07   Data
            .hex d5 b0 14 10   ; $8fe1: d5 b0 14 10   Data
            .hex 10 10 18 80   ; $8fe5: 10 10 18 80   Data
            .hex 24 01 00 08   ; $8fe9: 24 01 00 08   Data
            .hex 42 48 80 e1   ; $8fed: 42 48 80 e1   Data
            .hex 00 00 00 90   ; $8ff1: 00 00 00 90   Data
            .hex 85 81 81 20   ; $8ff5: 85 81 81 20   Data
            .hex 00 00 08 80   ; $8ff9: 00 00 08 80   Data
            .hex 81 b0 00 00   ; $8ffd: 81 b0 00 00   Data
            .hex 00 c0 86 81   ; $9001: 00 c0 86 81   Data
            .hex 20 00 04 00   ; $9005: 20 00 04 00   Data
            .hex 10 18 80 e0   ; $9009: 10 18 80 e0   Data
            .hex 00 09 02 40   ; $900d: 00 09 02 40   Data
            .hex 48 80 30 00   ; $9011: 48 80 30 00   Data
            .hex 00 0c 80 81   ; $9015: 00 0c 80 81   Data
            .hex 81 68 42 00   ; $9019: 81 68 42 00   Data
            .hex 09 80 81 81   ; $901d: 09 80 81 81   Data
            .hex 81 81 20 08   ; $9021: 81 81 20 08   Data
            .hex 16 18 80 81   ; $9025: 16 18 80 81   Data
            .hex 81 20 00 41   ; $9029: 81 20 00 41   Data
            .hex 48 80 30 14   ; $902d: 48 80 30 14   Data
            .hex 00 08 80 81   ; $9031: 00 08 80 81   Data
            .hex 81 60 49 42   ; $9035: 81 60 49 42   Data
            .hex 48 80 81 81   ; $9039: 48 80 81 81   Data
            .hex 44 05 fd 0f   ; $903d: 44 05 fd 0f   Data
            .hex 43 07 d1 4c   ; $9041: 43 07 d1 4c   Data
            .hex 7c 5f f7 fc   ; $9045: 7c 5f f7 fc   Data
            .hex 4f 3c 4f b0   ; $9049: 4f 3c 4f b0   Data
            .hex 10 90 85 b0   ; $904d: 10 90 85 b0   Data
            .hex 18 80 20 04   ; $9051: 18 80 20 04   Data
            .hex c0 86 20 0c   ; $9055: c0 86 20 0c   Data
            .hex 80 20 09 80   ; $9059: 80 20 09 80   Data
            .hex b0 04 09 80   ; $905d: b0 04 09 80   Data
            .hex e0 00 14 00   ; $9061: e0 00 14 00   Data
            .hex 01 c0 86 81   ; $9065: 01 c0 86 81   Data
            .hex 20 01 00 00   ; $9069: 20 01 00 00   Data
            .hex 90 85 b0 00   ; $906d: 90 85 b0 00   Data
            .hex 40 00 00 0c   ; $9071: 40 00 00 0c   Data
            .hex 80 20 0c 80   ; $9075: 80 20 0c 80   Data
            .hex e0 00 09 80   ; $9079: e0 00 09 80   Data
            .hex 20 09 80 81   ; $907d: 20 09 80 81   Data
            .hex 20 08 80 20   ; $9081: 20 08 80 20   Data
            .hex 00 90 85 60   ; $9085: 00 90 85 60   Data
            .hex c0 86 e0 00   ; $9089: c0 86 e0 00   Data
            .hex 00 90 85 81   ; $908d: 00 90 85 81   Data
            .hex 81 30 00 00   ; $9091: 81 30 00 00   Data
            .hex 00 10 18 80   ; $9095: 00 10 18 80   Data
            .hex 20 00 40 08   ; $9099: 20 00 40 08   Data
            .hex 0a 0a 80 60   ; $909d: 0a 0a 80 60   Data
            .hex 48 80 60 40   ; $90a1: 48 80 60 40   Data
            .hex c0 86 0f 0f   ; $90a5: c0 86 0f 0f   Data
            .hex c3 c7 53 d5   ; $90a9: c3 c7 53 d5   Data
            .hex 1f 07 f1 fc   ; $90ad: 1f 07 f1 fc   Data
            .hex 1f f4 f0 00   ; $90b1: 1f f4 f0 00   Data
            .hex f0 b0 50 50   ; $90b5: f0 b0 50 50   Data
            .hex 18 12 18 80   ; $90b9: 18 12 18 80   Data
            .hex 28 80 81 20   ; $90bd: 28 80 81 20   Data
            .hex 00 08 80 20   ; $90c1: 00 08 80 20   Data
            .hex 90 85 20 40   ; $90c5: 90 85 20 40   Data
            .hex 08 80 e0 00   ; $90c9: 08 80 e0 00   Data
            .hex 10 08 80 28   ; $90cd: 10 08 80 28   Data
            .hex 80 b0 00 00   ; $90d1: 80 b0 00 00   Data
            .hex c0 86 28 80   ; $90d5: c0 86 28 80   Data
            .hex 20 40 00 14   ; $90d9: 20 40 00 14   Data
            .hex 14 c0 86 28   ; $90dd: 14 c0 86 28   Data
            .hex 80 20 05 09   ; $90e1: 80 20 05 09   Data
            .hex 80 81 20 10   ; $90e5: 80 81 20 10   Data
            .hex 00 49 42 90   ; $90e9: 00 49 42 90   Data
            .hex 85 e0 00 40   ; $90ed: 85 e0 00 40   Data
            .hex d4 85 28 80   ; $90f1: d4 85 28 80   Data
            .hex 34 08 80 81   ; $90f5: 34 08 80 81   Data
            .hex 81 28 80 21   ; $90f9: 81 28 80 21   Data
            .hex 00 10 10 10   ; $90fd: 00 10 10 10   Data
            .hex 08 80 20 00   ; $9101: 08 80 20 00   Data
            .hex 40 40 40 c0   ; $9105: 40 40 40 c0   Data
            .hex 86 68 4a 80   ; $9109: 86 68 4a 80   Data
            .hex 81 81 81 81   ; $910d: 81 81 81 81   Data
            .hex a8 2a 02 ab   ; $9111: a8 2a 02 ab   Data
            .hex 4a 1a a8 7a   ; $9115: 4a 1a a8 7a   Data
            .hex 4c 6a ea 9a   ; $9119: 4c 6a ea 9a   Data
            .hex a0 04 ff 81   ; $911d: a0 04 ff 81   Data
            .hex 81 81 81 81   ; $9121: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9125: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9129: 81 81 81 81   Data
            .hex 81 81 81 81   ; $912d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9131: 81 81 81 81   Data
            .hex b0 10 14 10   ; $9135: b0 10 14 10   Data
            .hex 14 1c 80 28   ; $9139: 14 1c 80 28   Data
            .hex 0e 0b 06 01   ; $913d: 0e 0b 06 01   Data
            .hex 09 80 20 05   ; $9141: 09 80 20 05   Data
            .hex 00 0d 0a 0a   ; $9145: 00 0d 0a 0a   Data
            .hex 80 28 0b 02   ; $9149: 80 28 0b 02   Data
            .hex 01 0c 0a 80   ; $914d: 01 0c 0a 80   Data
            .hex 28 02 08 06   ; $9151: 28 02 08 06   Data
            .hex 01 0c 80 20   ; $9155: 01 0c 80 20   Data
            .hex 0c 02 0d 0a   ; $9159: 0c 02 0d 0a   Data
            .hex 0b 80 68 43   ; $915d: 0b 80 68 43   Data
            .hex 40 41 40 c0   ; $9161: 40 41 40 c0   Data
            .hex 86 81 81 81   ; $9165: 86 81 81 81   Data
            .hex 81 81 81 81   ; $9169: 81 81 81 81   Data
            .hex 81 81 81 81   ; $916d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9171: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9175: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $9179: 81 81 ff ff   Data
            .hex ff fc 51 55   ; $917d: ff fc 51 55   Data
            .hex 15 11 15 15   ; $9181: 15 11 15 15   Data
            .hex 41 7f ff ff   ; $9185: 41 7f ff ff   Data
            .hex ff b0 10 10   ; $9189: ff b0 10 10   Data
            .hex 14 10 18 80   ; $918d: 14 10 18 80   Data
            .hex 20 00 40 01   ; $9191: 20 00 40 01   Data
            .hex 00 08 80 e0   ; $9195: 00 08 80 e0   Data
            .hex 48 80 20 00   ; $9199: 48 80 20 00   Data
            .hex 08 80 81 81   ; $919d: 08 80 81 81   Data
            .hex 81 20 00 48   ; $91a1: 81 20 00 48   Data
            .hex 80 81 30 10   ; $91a5: 80 81 30 10   Data
            .hex 00 08 80 81   ; $91a9: 00 08 80 81   Data
            .hex 30 00 00 00   ; $91ad: 30 00 00 00   Data
            .hex 00 1c 80 2c   ; $91b1: 00 1c 80 2c   Data
            .hex 02 00 04 00   ; $91b5: 02 00 04 00   Data
            .hex 09 80 61 00   ; $91b9: 09 80 61 00   Data
            .hex 00 09 02 48   ; $91bd: 00 09 02 48   Data
            .hex 80 81 20 00   ; $91c1: 80 81 20 00   Data
            .hex 40 48 80 81   ; $91c5: 40 48 80 81   Data
            .hex 81 20 08 80   ; $91c9: 81 20 08 80   Data
            .hex 81 81 81 81   ; $91cd: 81 81 81 81   Data
            .hex 20 08 80 38   ; $91d1: 20 08 80 38   Data
            .hex 92 85 81 20   ; $91d5: 92 85 81 20   Data
            .hex 00 10 00 08   ; $91d9: 00 10 00 08   Data
            .hex 80 81 60 40   ; $91dd: 80 81 60 40   Data
            .hex 48 42 c0 86   ; $91e1: 48 42 c0 86   Data
            .hex 14 0f 0f d3   ; $91e5: 14 0f 0f d3   Data
            .hex f7 d4 c1 45   ; $91e9: f7 d4 c1 45   Data
            .hex 03 17 df f7   ; $91ed: 03 17 df f7   Data
            .hex fd f3 10 f1   ; $91f1: fd f3 10 f1   Data
            .hex 14 18 80 34   ; $91f5: 14 18 80 34   Data
            .hex 18 80 f4 41   ; $91f9: 18 80 f4 41   Data
            .hex 08 80 21 48   ; $91fd: 08 80 21 48   Data
            .hex 80 81 81 28   ; $9201: 80 81 81 28   Data
            .hex 80 28 80 81   ; $9205: 80 28 80 81   Data
            .hex 38 80 20 10   ; $9209: 38 80 20 10   Data
            .hex 04 90 85 20   ; $920d: 04 90 85 20   Data
            .hex 50 08 02 01   ; $9211: 50 08 02 01   Data
            .hex 08 80 68 80   ; $9215: 08 80 68 80   Data
            .hex 24 00 0c 0a   ; $9219: 24 00 0c 0a   Data
            .hex 80 81 81 21   ; $921d: 80 81 81 21   Data
            .hex 00 05 0c 80   ; $9221: 00 05 0c 80   Data
            .hex 38 80 24 00   ; $9225: 38 80 24 00   Data
            .hex 01 09 80 20   ; $9229: 01 09 80 20   Data
            .hex 50 01 04 08   ; $922d: 50 01 04 08   Data
            .hex 0a 80 68 80   ; $9231: 0a 80 68 80   Data
            .hex 20 41 00 c0   ; $9235: 20 41 00 c0   Data
            .hex 86 81 81 28   ; $9239: 86 81 81 28   Data
            .hex 80 28 80 81   ; $923d: 80 28 80 81   Data
            .hex f1 14 08 80   ; $9241: f1 14 08 80   Data
            .hex 20 18 80 f4   ; $9245: 20 18 80 f4   Data
            .hex 41 48 80 60   ; $9249: 41 48 80 60   Data
            .hex 48 80 cf 3f   ; $924d: 48 80 cf 3f   Data
            .hex ff ff c4 f0   ; $9251: ff ff c4 f0   Data
            .hex 7d 4f 43 c1   ; $9255: 7d 4f 43 c1   Data
            .hex f1 3f ff ff   ; $9259: f1 3f ff ff   Data
            .hex 3c 30 18 80   ; $925d: 3c 30 18 80   Data
            .hex 81 81 81 81   ; $9261: 81 81 81 81   Data
            .hex 20 04 10 14   ; $9265: 20 04 10 14   Data
            .hex 10 18 80 20   ; $9269: 10 18 80 20   Data
            .hex 01 40 49 42   ; $926d: 01 40 49 42   Data
            .hex 48 80 28 0a   ; $9271: 48 80 28 0a   Data
            .hex 80 81 81 81   ; $9275: 80 81 81 81   Data
            .hex 81 28 42 10   ; $9279: 81 28 42 10   Data
            .hex 10 10 18 80   ; $927d: 10 10 18 80   Data
            .hex 28 80 20 00   ; $9281: 28 80 20 00   Data
            .hex 40 48 80 28   ; $9285: 40 48 80 28   Data
            .hex 80 20 00 90   ; $9289: 80 20 00 90   Data
            .hex 85 81 e0 18   ; $928d: 85 81 e0 18   Data
            .hex 02 40 00 90   ; $9291: 02 40 00 90   Data
            .hex 85 30 00 08   ; $9295: 85 30 00 08   Data
            .hex 80 e0 08 80   ; $9299: 80 e0 08 80   Data
            .hex 60 40 08 12   ; $929d: 60 40 08 12   Data
            .hex 10 08 80 81   ; $92a1: 10 08 80 81   Data
            .hex 81 20 00 08   ; $92a5: 81 20 00 08   Data
            .hex 0a 80 30 10   ; $92a9: 0a 80 30 10   Data
            .hex 00 40 40 48   ; $92ad: 00 40 40 48   Data
            .hex 80 60 40 48   ; $92b1: 80 60 40 48   Data
            .hex 80 81 81 81   ; $92b5: 80 81 81 81   Data
            .hex 7f c1 47 fd   ; $92b9: 7f c1 47 fd   Data
            .hex ff a0 29 fa   ; $92bd: ff a0 29 fa   Data
            .hex 0f 68 4a bd   ; $92c1: 0f 68 4a bd   Data
            .hex 0f 40 3f 81   ; $92c5: 0f 40 3f 81   Data
            .hex 81 81 81 81   ; $92c9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $92cd: 81 81 81 81   Data
            .hex 81 81 38 80   ; $92d1: 81 81 38 80   Data
            .hex 81 81 81 81   ; $92d5: 81 81 81 81   Data
            .hex 30 08 80 81   ; $92d9: 30 08 80 81   Data
            .hex 81 81 38 0a   ; $92dd: 81 81 38 0a   Data
            .hex 02 18 80 b0   ; $92e1: 02 18 80 b0   Data
            .hex 10 00 0c 0a   ; $92e5: 10 00 0c 0a   Data
            .hex 0a 80 20 0c   ; $92e9: 0a 80 20 0c   Data
            .hex 0a 03 0c 0a   ; $92ed: 0a 03 0c 0a   Data
            .hex 80 28 0b 0e   ; $92f1: 80 28 0b 0e   Data
            .hex 0a 07 08 80   ; $92f5: 0a 07 08 80   Data
            .hex 20 00 05 00   ; $92f9: 20 00 05 00   Data
            .hex 01 08 80 e0   ; $92fd: 01 08 80 e0   Data
            .hex 40 09 0e 0a   ; $9301: 40 09 0e 0a   Data
            .hex 0a 80 81 81   ; $9305: 0a 80 81 81   Data
            .hex 60 05 08 4a   ; $9309: 60 05 08 4a   Data
            .hex 80 81 81 81   ; $930d: 80 81 81 81   Data
            .hex 61 08 80 81   ; $9311: 61 08 80 81   Data
            .hex 81 81 81 81   ; $9315: 81 81 81 81   Data
            .hex 68 80 81 81   ; $9319: 68 80 81 81   Data
            .hex 81 81 81 81   ; $931d: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $9321: 81 81 ff ff   Data
            .hex ff df c5 55   ; $9325: ff df c5 55   Data
            .hex 15 51 15 51   ; $9329: 15 51 15 51   Data
            .hex f5 3f 7f ff   ; $932d: f5 3f 7f ff   Data
            .hex ff 30 10 18   ; $9331: ff 30 10 18   Data
            .hex 80 34 18 80   ; $9335: 80 34 18 80   Data
            .hex 2c 02 00 50   ; $9339: 2c 02 00 50   Data
            .hex 01 08 80 21   ; $933d: 01 08 80 21   Data
            .hex 00 08 80 28   ; $9341: 00 08 80 28   Data
            .hex 0a 80 60 00   ; $9345: 0a 80 60 00   Data
            .hex 40 50 00 48   ; $9349: 40 50 00 48   Data
            .hex 80 81 28 80   ; $934d: 80 81 28 80   Data
            .hex 81 28 80 81   ; $9351: 81 28 80 81   Data
            .hex 30 00 10 10   ; $9355: 30 00 10 10   Data
            .hex 00 1c 80 20   ; $9359: 00 1c 80 20   Data
            .hex 00 00 40 08   ; $935d: 00 00 40 08   Data
            .hex 0b 80 60 00   ; $9361: 0b 80 60 00   Data
            .hex 48 80 20 48   ; $9365: 48 80 20 48   Data
            .hex 80 81 20 90   ; $9369: 80 81 20 90   Data
            .hex 85 28 80 81   ; $936d: 85 28 80 81   Data
            .hex 30 04 40 10   ; $9371: 30 04 40 10   Data
            .hex 00 18 80 60   ; $9375: 00 18 80 60   Data
            .hex 09 80 24 00   ; $9379: 09 80 24 00   Data
            .hex 08 80 81 20   ; $937d: 08 80 81 20   Data
            .hex 10 41 00 48   ; $9381: 10 41 00 48   Data
            .hex 80 70 40 48   ; $9385: 80 70 40 48   Data
            .hex 80 68 80 81   ; $9389: 80 68 80 81   Data
            .hex 4f 12 81 a3   ; $938d: 4f 12 81 a3   Data
            .hex ab ea c0 50   ; $9391: ab ea c0 50   Data
            .hex a3 ab ca ca   ; $9395: a3 ab ca ca   Data
            .hex 4e 87 3f 81   ; $9399: 4e 87 3f 81   Data
            .hex 81 81 81 81   ; $939d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $93a1: 81 81 81 81   Data
            .hex 81 81 81 81   ; $93a5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $93a9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $93ad: 81 81 81 81   Data
            .hex b0 10 10 1c   ; $93b1: b0 10 10 1c   Data
            .hex 12 90 85 20   ; $93b5: 12 90 85 20   Data
            .hex 04 00 41 08   ; $93b9: 04 00 41 08   Data
            .hex 0e 80 28 03   ; $93bd: 0e 80 28 03   Data
            .hex 08 80 20 0d   ; $93c1: 08 80 20 0d   Data
            .hex 80 28 02 40   ; $93c5: 80 28 02 40   Data
            .hex 10 00 09 80   ; $93c9: 10 00 09 80   Data
            .hex 28 0a 80 20   ; $93cd: 28 0a 80 20   Data
            .hex 00 08 80 20   ; $93d1: 00 08 80 20   Data
            .hex 00 10 0c 02   ; $93d5: 00 10 0c 02   Data
            .hex 08 80 e0 40   ; $93d9: 08 80 e0 40   Data
            .hex 40 41 40 c0   ; $93dd: 40 41 40 c0   Data
            .hex 86 81 81 81   ; $93e1: 86 81 81 81   Data
            .hex 81 81 81 81   ; $93e5: 81 81 81 81   Data
            .hex 81 81 81 81   ; $93e9: 81 81 81 81   Data
            .hex 81 81 81 81   ; $93ed: 81 81 81 81   Data
            .hex 81 81 81 81   ; $93f1: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $93f5: 81 81 ff ff   Data
            .hex ff fd 54 4a   ; $93f9: ff fd 54 4a   Data
            .hex 52 96 85 a1   ; $93fd: 52 96 85 a1   Data
            .hex 05 7f ff ff   ; $9401: 05 7f ff ff   Data
            .hex ff 81 81 b0   ; $9405: ff 81 81 b0   Data
            .hex 90 85 81 81   ; $9409: 90 85 81 81   Data
            .hex 81 b0 00 00   ; $940d: 81 b0 00 00   Data
            .hex 90 85 81 b8   ; $9411: 90 85 81 b8   Data
            .hex 02 00 00 08   ; $9415: 02 00 00 08   Data
            .hex 92 85 28 06   ; $9419: 92 85 28 06   Data
            .hex 00 00 0c 0a   ; $941d: 00 00 0c 0a   Data
            .hex 80 20 01 00   ; $9421: 80 20 01 00   Data
            .hex 04 05 08 80   ; $9425: 04 05 08 80   Data
            .hex 28 02 08 07   ; $9429: 28 02 08 07   Data
            .hex 09 0a 80 28   ; $942d: 09 0a 80 28   Data
            .hex 0a 06 09 0a   ; $9431: 0a 06 09 0a   Data
            .hex 0a 80 28 06   ; $9435: 0a 80 28 06   Data
            .hex 0d 0a 0a 0a   ; $9439: 0d 0a 0a 0a   Data
            .hex 80 60 01 01   ; $943d: 80 60 01 01   Data
            .hex 00 00 48 80   ; $9441: 00 00 48 80   Data
            .hex 81 28 06 0c   ; $9445: 81 28 06 0c   Data
            .hex 0a 80 81 81   ; $9449: 0a 80 81 81   Data
            .hex 28 03 09 0a   ; $944d: 28 03 09 0a   Data
            .hex 80 81 30 04   ; $9451: 80 81 30 04   Data
            .hex 00 00 00 18   ; $9455: 00 00 00 18   Data
            .hex 80 e8 43 40   ; $9459: 80 e8 43 40   Data
            .hex 40 40 c0 86   ; $945d: 40 40 c0 86   Data
            .hex f7 f4 34 15   ; $9461: f7 f4 34 15   Data
            .hex 01 55 50 14   ; $9465: 01 55 50 14   Data
            .hex 45 55 c5 f5   ; $9469: 45 55 c5 f5   Data
            .hex 7d 5c 04 b0   ; $946d: 7d 5c 04 b0   Data
            .hex 1c 12 1c 80   ; $9471: 1c 12 1c 80   Data
            .hex 81 81 24 01   ; $9475: 81 81 24 01   Data
            .hex 08 03 14 18   ; $9479: 08 03 14 18   Data
            .hex 80 29 02 04   ; $947d: 80 29 02 04   Data
            .hex 0c 43 48 80   ; $9481: 0c 43 48 80   Data
            .hex 20 00 01 09   ; $9485: 20 00 01 09   Data
            .hex 80 81 81 20   ; $9489: 80 81 81 20   Data
            .hex 00 00 00 10   ; $948d: 00 00 00 10   Data
            .hex 1c 80 20 00   ; $9491: 1c 80 20 00   Data
            .hex 00 00 40 49   ; $9495: 00 00 40 49   Data
            .hex 80 20 00 00   ; $9499: 80 20 00 00   Data
            .hex 08 80 81 81   ; $949d: 08 80 81 81   Data
            .hex 20 00 00 04   ; $94a1: 20 00 00 04   Data
            .hex 14 1c 80 20   ; $94a5: 14 1c 80 20   Data
            .hex 00 00 01 41   ; $94a9: 00 00 01 41   Data
            .hex 49 80 20 00   ; $94ad: 49 80 20 00   Data
            .hex 04 08 80 81   ; $94b1: 04 08 80 81   Data
            .hex 81 20 00 01   ; $94b5: 81 20 00 01   Data
            .hex 00 14 18 80   ; $94b9: 00 14 18 80   Data
            .hex 28 0a 0a 02   ; $94bd: 28 0a 0a 02   Data
            .hex 41 48 80 e0   ; $94c1: 41 48 80 e0   Data
            .hex 40 40 48 80   ; $94c5: 40 40 48 80   Data
            .hex 81 81 47 c4   ; $94c9: 81 81 47 c4   Data
            .hex 45 7d 5f 01   ; $94cd: 45 7d 5f 01   Data
            .hex 41 f0 7c 55   ; $94d1: 41 f0 7c 55   Data
            .hex 53 d1 f1 11   ; $94d5: 53 d1 f1 11   Data
            .hex 1f b0 10 90   ; $94d9: 1f b0 10 90   Data
            .hex 85 81 81 81   ; $94dd: 85 81 81 81   Data
            .hex 20 00 08 80   ; $94e1: 20 00 08 80   Data
            .hex 81 81 81 20   ; $94e5: 81 81 81 20   Data
            .hex 40 40 50 10   ; $94e9: 40 40 50 10   Data
            .hex 18 80 28 80   ; $94ed: 18 80 28 80   Data
            .hex 81 81 20 08   ; $94f1: 81 81 20 08   Data
            .hex 80 28 80 81   ; $94f5: 80 28 80 81   Data
            .hex 81 20 08 80   ; $94f9: 81 20 08 80   Data
            .hex 28 80 81 81   ; $94fd: 28 80 81 81   Data
            .hex 20 08 80 e0   ; $9501: 20 08 80 e0   Data
            .hex 10 10 10 00   ; $9505: 10 10 10 00   Data
            .hex 48 80 81 e0   ; $9509: 48 80 81 e0   Data
            .hex 00 00 00 90   ; $950d: 00 00 00 90   Data
            .hex 85 81 b0 00   ; $9511: 85 81 b0 00   Data
            .hex 00 00 08 80   ; $9515: 00 00 08 80   Data
            .hex 81 20 40 00   ; $9519: 81 20 40 00   Data
            .hex 40 08 80 81   ; $951d: 40 08 80 81   Data
            .hex 28 80 28 80   ; $9521: 28 80 28 80   Data
            .hex 28 80 81 20   ; $9525: 28 80 81 20   Data
            .hex 10 00 10 08   ; $9529: 10 00 10 08   Data
            .hex 80 81 60 40   ; $952d: 80 81 60 40   Data
            .hex 40 40 48 80   ; $9531: 40 40 48 80   Data
            .hex 5f d7 fa a2   ; $9535: 5f d7 fa a2   Data
            .hex a9 aa 6a 9d   ; $9539: a9 aa 6a 9d   Data
            .hex 5f c0 c5 7a   ; $953d: 5f c0 c5 7a   Data
            .hex ae ab 00 81   ; $9541: ae ab 00 81   Data
            .hex 81 81 81 81   ; $9545: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9549: 81 81 81 81   Data
            .hex 81 81 81 81   ; $954d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9551: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9555: 81 81 81 81   Data
            .hex 38 12 10 10   ; $9559: 38 12 10 10   Data
            .hex 50 18 80 28   ; $955d: 50 18 80 28   Data
            .hex 06 08 0a 80   ; $9561: 06 08 0a 80   Data
            .hex 2c 80 20 01   ; $9565: 2c 80 20 01   Data
            .hex 0c 06 14 09   ; $9569: 0c 06 14 09   Data
            .hex 80 20 00 01   ; $956d: 80 20 00 01   Data
            .hex 01 09 0e 80   ; $9571: 01 09 0e 80   Data
            .hex 28 4a 02 00   ; $9575: 28 4a 02 00   Data
            .hex 04 0d 80 28   ; $9579: 04 0d 80 28   Data
            .hex 80 28 02 01   ; $957d: 80 28 02 01   Data
            .hex 09 80 60 58   ; $9581: 09 80 60 58   Data
            .hex 4a 42 48 4a   ; $9585: 4a 42 48 4a   Data
            .hex 80 81 81 81   ; $9589: 80 81 81 81   Data
            .hex 81 81 81 81   ; $958d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9591: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9595: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9599: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $959d: 81 81 ff ff   Data
            .hex ff fd 4a 16   ; $95a1: ff fd 4a 16   Data
            .hex 95 51 56 81   ; $95a5: 95 51 56 81   Data
            .hex a5 7f ff ff   ; $95a9: a5 7f ff ff   Data
            .hex ff 81 81 81   ; $95ad: ff 81 81 81   Data
            .hex 30 10 18 80   ; $95b1: 30 10 18 80   Data
            .hex 81 81 b0 08   ; $95b5: 81 81 b0 08   Data
            .hex 06 08 80 81   ; $95b9: 06 08 80 81   Data
            .hex b0 00 04 05   ; $95bd: b0 00 04 05   Data
            .hex 08 80 70 00   ; $95c1: 08 80 70 00   Data
            .hex 08 03 01 08   ; $95c5: 08 03 01 08   Data
            .hex 80 81 e0 00   ; $95c9: 80 81 e0 00   Data
            .hex 04 00 08 80   ; $95cd: 04 00 08 80   Data
            .hex 81 81 e0 01   ; $95d1: 81 81 e0 01   Data
            .hex 00 0c 80 81   ; $95d5: 00 0c 80 81   Data
            .hex 81 81 20 00   ; $95d9: 81 81 20 00   Data
            .hex 0d 80 81 81   ; $95dd: 0d 80 81 81   Data
            .hex b0 00 04 09   ; $95e1: b0 00 04 09   Data
            .hex 80 81 b0 00   ; $95e5: 80 81 b0 00   Data
            .hex 00 01 08 80   ; $95e9: 00 01 08 80   Data
            .hex 70 00 08 06   ; $95ed: 70 00 08 06   Data
            .hex 00 0c 80 81   ; $95f1: 00 0c 80 81   Data
            .hex e0 04 09 06   ; $95f5: e0 04 09 06   Data
            .hex 09 80 81 81   ; $95f9: 09 80 81 81   Data
            .hex e1 00 01 08   ; $95fd: e1 00 01 08   Data
            .hex 80 81 81 81   ; $9601: 80 81 81 81   Data
            .hex 60 40 48 80   ; $9605: 60 40 48 80   Data
            .hex fc 7d 4c 57   ; $9609: fc 7d 4c 57   Data
            .hex 51 f4 3f 4f   ; $960d: 51 f4 3f 4f   Data
            .hex d3 d1 c4 75   ; $9611: d3 d1 c4 75   Data
            .hex 5f 47 f4 30   ; $9615: 5f 47 f4 30   Data
            .hex 10 10 10 10   ; $9619: 10 10 10 10   Data
            .hex 18 80 60 40   ; $961d: 18 80 60 40   Data
            .hex 00 00 40 48   ; $9621: 00 00 40 48   Data
            .hex 80 81 b0 40   ; $9625: 80 81 b0 40   Data
            .hex 00 90 85 81   ; $9629: 00 90 85 81   Data
            .hex b0 08 80 e0   ; $962d: b0 08 80 e0   Data
            .hex 00 90 85 60   ; $9631: 00 90 85 60   Data
            .hex 04 10 14 00   ; $9635: 04 10 14 00   Data
            .hex 0c 80 b0 01   ; $9639: 0c 80 b0 01   Data
            .hex 40 01 00 49   ; $963d: 40 01 00 49   Data
            .hex 80 20 08 80   ; $9641: 80 20 08 80   Data
            .hex 20 0c 80 81   ; $9645: 20 0c 80 81   Data
            .hex 20 08 80 20   ; $9649: 20 08 80 20   Data
            .hex 09 80 81 e0   ; $964d: 09 80 81 e0   Data
            .hex 00 50 40 00   ; $9651: 00 50 40 00   Data
            .hex 18 80 30 08   ; $9655: 18 80 30 08   Data
            .hex 80 81 20 08   ; $9659: 80 81 20 08   Data
            .hex 80 20 08 80   ; $965d: 80 20 08 80   Data
            .hex b0 00 08 80   ; $9661: b0 00 08 80   Data
            .hex 20 00 10 40   ; $9665: 20 00 10 40   Data
            .hex 00 08 80 60   ; $9669: 00 08 80 60   Data
            .hex 40 c0 86 60   ; $966d: 40 c0 86 60   Data
            .hex 48 80 00 3d   ; $9671: 48 80 00 3d   Data
            .hex fe 9d a9 d1   ; $9675: fe 9d a9 d1   Data
            .hex 4a 76 9c a7   ; $9679: 4a 76 9c a7   Data
            .hex ea 1a 82 80   ; $967d: ea 1a 82 80   Data
            .hex 3c 81 81 38   ; $9681: 3c 81 81 38   Data
            .hex 1a 80 81 81   ; $9685: 1a 80 81 81   Data
            .hex 81 34 00 04   ; $9689: 81 34 00 04   Data
            .hex 18 80 81 34   ; $968d: 18 80 81 34   Data
            .hex 05 08 03 04   ; $9691: 05 08 03 04   Data
            .hex 1c 80 21 09   ; $9695: 1c 80 21 09   Data
            .hex 02 08 03 09   ; $9699: 02 08 03 09   Data
            .hex 80 28 02 00   ; $969d: 80 28 02 00   Data
            .hex 04 00 0c 80   ; $96a1: 04 00 0c 80   Data
            .hex 2c 02 00 09   ; $96a5: 2c 02 00 09   Data
            .hex 02 0d 80 21   ; $96a9: 02 0d 80 21   Data
            .hex 00 08 06 08   ; $96ad: 00 08 06 08   Data
            .hex 0b 80 24 04   ; $96b1: 0b 80 24 04   Data
            .hex 00 01 08 0a   ; $96b5: 00 01 08 0a   Data
            .hex 80 21 09 02   ; $96b9: 80 21 09 02   Data
            .hex 08 06 0c 80   ; $96bd: 08 06 0c 80   Data
            .hex 24 00 04 00   ; $96c1: 24 00 04 00   Data
            .hex 01 0d 80 61   ; $96c5: 01 0d 80 61   Data
            .hex 08 03 00 04   ; $96c9: 08 03 00 04   Data
            .hex 49 80 81 60   ; $96cd: 49 80 81 60   Data
            .hex 00 00 49 80   ; $96d1: 00 00 49 80   Data
            .hex 81 81 81 60   ; $96d5: 81 81 81 60   Data
            .hex 48 80 81 81   ; $96d9: 48 80 81 81   Data
            .hex f3 f1 35 51   ; $96dd: f3 f1 35 51   Data
            .hex 15 50 45 44   ; $96e1: 15 50 45 44   Data
            .hex 15 15 15 14   ; $96e5: 15 15 15 14   Data
            .hex 5c 4f cf 30   ; $96e9: 5c 4f cf 30   Data
            .hex 18 80 30 10   ; $96ed: 18 80 30 10   Data
            .hex 90 85 20 00   ; $96f1: 90 85 20 00   Data
            .hex 50 08 02 08   ; $96f5: 50 08 02 08   Data
            .hex 80 20 48 80   ; $96f9: 80 20 48 80   Data
            .hex 20 40 08 80   ; $96fd: 20 40 08 80   Data
            .hex 28 80 81 28   ; $9701: 28 80 81 28   Data
            .hex 80 28 80 28   ; $9705: 80 28 80 28   Data
            .hex 80 30 00 14   ; $9709: 80 30 00 14   Data
            .hex 08 80 20 50   ; $970d: 08 80 20 50   Data
            .hex 00 40 41 08   ; $9711: 00 40 41 08   Data
            .hex 80 28 80 28   ; $9715: 80 28 80 28   Data
            .hex 80 81 28 80   ; $9719: 80 81 28 80   Data
            .hex 28 80 28 80   ; $971d: 28 80 28 80   Data
            .hex 30 08 80 20   ; $9721: 30 08 80 20   Data
            .hex 10 40 10 40   ; $9725: 10 40 10 40   Data
            .hex 08 80 60 08   ; $9729: 08 80 60 08   Data
            .hex 80 28 80 28   ; $972d: 80 28 80 28   Data
            .hex 80 81 28 80   ; $9731: 80 81 28 80   Data
            .hex 28 80 28 80   ; $9735: 28 80 28 80   Data
            .hex 30 08 80 20   ; $9739: 30 08 80 20   Data
            .hex 14 08 80 60   ; $973d: 14 08 80 60   Data
            .hex 40 50 40 41   ; $9741: 40 50 40 41   Data
            .hex c0 86 3d 0a   ; $9745: c0 86 3d 0a   Data
            .hex 1a aa aa a0   ; $9749: 1a aa aa a0   Data
            .hex 2a aa aa a8   ; $974d: 2a aa aa a8   Data
            .hex 2a ba ae a8   ; $9751: 2a ba ae a8   Data
            .hex a0 30 10 18   ; $9755: a0 30 10 18   Data
            .hex 80 81 81 81   ; $9759: 80 81 81 81   Data
            .hex 20 00 08 80   ; $975d: 20 00 08 80   Data
            .hex 81 81 81 20   ; $9761: 81 81 81 20   Data
            .hex 00 00 10 10   ; $9765: 00 00 10 10   Data
            .hex 18 80 20 00   ; $9769: 18 80 20 00   Data
            .hex 00 40 00 08   ; $976d: 00 40 00 08   Data
            .hex 80 20 00 08   ; $9771: 80 20 00 08   Data
            .hex 80 60 08 80   ; $9775: 80 60 08 80   Data
            .hex 60 48 0a 80   ; $9779: 60 48 0a 80   Data
            .hex 81 28 80 81   ; $977d: 81 28 80 81   Data
            .hex 81 28 80 30   ; $9781: 81 28 80 30   Data
            .hex 08 80 b0 10   ; $9785: 08 80 b0 10   Data
            .hex 00 50 00 0c   ; $9789: 00 50 00 0c   Data
            .hex 80 20 00 08   ; $978d: 80 20 00 08   Data
            .hex 80 e0 09 80   ; $9791: 80 e0 09 80   Data
            .hex 20 40 00 90   ; $9795: 20 40 00 90   Data
            .hex 85 28 80 28   ; $9799: 85 28 80 28   Data
            .hex 80 e0 08 80   ; $979d: 80 e0 08 80   Data
            .hex 28 80 20 90   ; $97a1: 28 80 20 90   Data
            .hex 85 20 10 08   ; $97a5: 85 20 10 08   Data
            .hex 80 e0 48 80   ; $97a9: 80 e0 48 80   Data
            .hex e0 40 c0 86   ; $97ad: e0 40 c0 86   Data
            .hex 0f c3 f1 10   ; $97b1: 0f c3 f1 10   Data
            .hex 68 1a be af   ; $97b5: 68 1a be af   Data
            .hex a5 29 1a bc   ; $97b9: a5 29 1a bc   Data
            .hex af e9 f0 81   ; $97bd: af e9 f0 81   Data
            .hex 30 10 10 18   ; $97c1: 30 10 10 18   Data
            .hex 80 81 81 20   ; $97c5: 80 81 81 20   Data
            .hex 00 00 08 80   ; $97c9: 00 00 08 80   Data
            .hex 81 b8 02 40   ; $97cd: 81 b8 02 40   Data
            .hex 40 00 94 85   ; $97d1: 40 00 94 85   Data
            .hex 20 c0 86 81   ; $97d5: 20 c0 86 81   Data
            .hex e0 09 80 28   ; $97d9: e0 09 80 28   Data
            .hex 80 30 90 85   ; $97dd: 80 30 90 85   Data
            .hex 28 80 28 80   ; $97e1: 28 80 28 80   Data
            .hex 28 06 50 08   ; $97e5: 28 06 50 08   Data
            .hex 80 28 80 24   ; $97e9: 80 28 80 24   Data
            .hex 09 80 28 80   ; $97ed: 09 80 28 80   Data
            .hex 20 50 09 0a   ; $97f1: 20 50 09 0a   Data
            .hex 80 28 80 28   ; $97f5: 80 28 80 28   Data
            .hex 80 e0 48 80   ; $97f9: 80 e0 48 80   Data
            .hex 28 80 20 90   ; $97fd: 28 80 20 90   Data
            .hex 85 81 b0 0c   ; $9801: 85 81 b0 0c   Data
            .hex 80 e8 02 10   ; $9805: 80 e8 02 10   Data
            .hex 10 00 c1 86   ; $9809: 10 00 c1 86   Data
            .hex 81 20 00 00   ; $980d: 81 20 00 00   Data
            .hex 08 80 81 81   ; $9811: 08 80 81 81   Data
            .hex 60 40 40 48   ; $9815: 60 40 40 48   Data
            .hex 80 81 c0 f0   ; $9819: 80 81 c0 f0   Data
            .hex 36 a6 aa a6   ; $981d: 36 a6 aa a6   Data
            .hex a9 aa 6a 9a   ; $9821: a9 aa 6a 9a   Data
            .hex aa 9a 9c 0f   ; $9825: aa 9a 9c 0f   Data
            .hex 03 70 10 14   ; $9829: 03 70 10 14   Data
            .hex 10 14 1c 80   ; $982d: 10 14 1c 80   Data
            .hex 81 60 09 06   ; $9831: 81 60 09 06   Data
            .hex 01 09 80 38   ; $9835: 01 09 80 38   Data
            .hex 80 60 01 00   ; $9839: 80 60 01 00   Data
            .hex 08 80 24 18   ; $983d: 08 80 24 18   Data
            .hex 80 68 02 08   ; $9841: 80 68 02 08   Data
            .hex 80 21 00 1c   ; $9845: 80 21 00 1c   Data
            .hex 80 60 08 80   ; $9849: 80 60 08 80   Data
            .hex 20 00 01 1c   ; $984d: 20 00 01 1c   Data
            .hex 80 28 80 20   ; $9851: 80 28 80 20   Data
            .hex 00 00 01 10   ; $9855: 00 00 01 10   Data
            .hex 08 80 28 02   ; $9859: 08 80 28 02   Data
            .hex 40 00 00 08   ; $985d: 40 00 00 08   Data
            .hex 80 28 0a 80   ; $9861: 80 28 0a 80   Data
            .hex 60 00 08 80   ; $9865: 60 00 08 80   Data
            .hex 20 00 18 80   ; $9869: 20 00 18 80   Data
            .hex 60 08 80 20   ; $986d: 60 08 80 20   Data
            .hex 04 00 18 80   ; $9871: 04 00 18 80   Data
            .hex 68 80 20 09   ; $9875: 68 80 20 09   Data
            .hex 02 04 18 80   ; $9879: 02 04 18 80   Data
            .hex 81 60 40 40   ; $987d: 81 60 40 40   Data
            .hex 49 42 58 80   ; $9881: 49 42 58 80   Data
            .hex c5 7c 5f c4   ; $9885: c5 7c 5f c4   Data
            .hex fd 4f c4 f4   ; $9889: fd 4f c4 f4   Data
            .hex 41 f1 7f 47   ; $988d: 41 f1 7f 47   Data
            .hex f5 3d 57 38   ; $9891: f5 3d 57 38   Data
            .hex 12 14 1c 12   ; $9895: 12 14 1c 12   Data
            .hex 1c 80 28 0a   ; $9899: 1c 80 28 0a   Data
            .hex 03 09 0a 0b   ; $989d: 03 09 0a 0b   Data
            .hex 80 28 0a 0a   ; $98a1: 80 28 0a 0a   Data
            .hex 06 0c 0a 80   ; $98a5: 06 0c 0a 80   Data
            .hex 28 0a 02 05   ; $98a9: 28 0a 02 05   Data
            .hex 0d 0a 80 28   ; $98ad: 0d 0a 80 28   Data
            .hex 0a 0a 03 05   ; $98b1: 0a 0a 03 05   Data
            .hex 0c 80 24 08   ; $98b5: 0c 80 24 08   Data
            .hex 0a 06 05 09   ; $98b9: 0a 06 05 09   Data
            .hex 80 21 04 04   ; $98bd: 80 21 04 04   Data
            .hex 01 09 0a 80   ; $98c1: 01 09 0a 80   Data
            .hex 28 03 05 04   ; $98c5: 28 03 05 04   Data
            .hex 04 0c 80 28   ; $98c9: 04 0c 80 28   Data
            .hex 06 05 01 01   ; $98cd: 06 05 01 01   Data
            .hex 0d 80 24 05   ; $98d1: 0d 80 24 05   Data
            .hex 0d 0a 06 09   ; $98d5: 0d 0a 06 09   Data
            .hex 80 21 05 05   ; $98d9: 80 21 05 05   Data
            .hex 0c 03 08 80   ; $98dd: 0c 03 08 80   Data
            .hex 24 0d 03 05   ; $98e1: 24 0d 03 05   Data
            .hex 0c 0a 80 61   ; $98e5: 0c 0a 80 61   Data
            .hex 41 48 43 41   ; $98e9: 41 48 43 41   Data
            .hex 48 80 01 04   ; $98ed: 48 80 01 04   Data
            .hex 11 50 54 14   ; $98f1: 11 50 54 14   Data
            .hex 55 01 55 55   ; $98f5: 55 01 55 55   Data
            .hex 15 54 01 05   ; $98f9: 15 54 01 05   Data
            .hex 00 30 50 10   ; $98fd: 00 30 50 10   Data
            .hex 50 10 18 80   ; $9901: 50 10 18 80   Data
            .hex 28 80 28 80   ; $9905: 28 80 28 80   Data
            .hex 60 08 80 28   ; $9909: 60 08 80 28   Data
            .hex 80 20 90 85   ; $990d: 80 20 90 85   Data
            .hex 28 80 28 80   ; $9911: 28 80 28 80   Data
            .hex e0 08 80 28   ; $9915: e0 08 80 28   Data
            .hex 80 20 18 80   ; $9919: 80 20 18 80   Data
            .hex 20 10 08 80   ; $991d: 20 10 08 80   Data
            .hex 20 48 80 20   ; $9921: 20 48 80 20   Data
            .hex 40 08 80 28   ; $9925: 40 08 80 28   Data
            .hex 80 81 28 80   ; $9929: 80 81 28 80   Data
            .hex 28 80 28 80   ; $992d: 28 80 28 80   Data
            .hex 30 48 80 28   ; $9931: 30 48 80 28   Data
            .hex 80 28 80 28   ; $9935: 80 28 80 28   Data
            .hex 80 30 0c 80   ; $9939: 80 30 0c 80   Data
            .hex 28 80 28 80   ; $993d: 28 80 28 80   Data
            .hex 60 09 80 28   ; $9941: 60 09 80 28   Data
            .hex 80 60 18 80   ; $9945: 80 60 18 80   Data
            .hex 28 80 28 1a   ; $9949: 28 80 28 1a   Data
            .hex 80 28 80 28   ; $994d: 80 28 80 28   Data
            .hex 80 60 40 50   ; $9951: 80 60 40 50   Data
            .hex 40 50 48 80   ; $9955: 40 50 48 80   Data
            .hex aa 2a aa 2a   ; $9959: aa 2a aa 2a   Data
            .hex aa 28 2a aa   ; $995d: aa 28 2a aa   Data
            .hex aa aa aa 2a   ; $9961: aa aa aa 2a   Data
            .hex aa a8 aa 30   ; $9965: aa a8 aa 30   Data
            .hex 1c 80 81 30   ; $9969: 1c 80 81 30   Data
            .hex 18 80 20 41   ; $996d: 18 80 20 41   Data
            .hex 50 50 08 0a   ; $9971: 50 50 08 0a   Data
            .hex 80 28 80 81   ; $9975: 80 28 80 81   Data
            .hex 81 20 08 80   ; $9979: 81 20 08 80   Data
            .hex 28 80 38 80   ; $997d: 28 80 38 80   Data
            .hex 20 48 80 20   ; $9981: 20 48 80 20   Data
            .hex 50 08 12 08   ; $9985: 50 08 12 08   Data
            .hex 80 81 28 80   ; $9989: 80 81 28 80   Data
            .hex 20 48 0a 80   ; $998d: 20 48 0a 80   Data
            .hex 81 60 50 08   ; $9991: 81 60 50 08   Data
            .hex 80 20 18 80   ; $9995: 80 20 18 80   Data
            .hex 81 81 28 80   ; $9999: 81 81 28 80   Data
            .hex 20 08 80 81   ; $999d: 20 08 80 81   Data
            .hex b0 00 10 00   ; $99a1: b0 00 10 00   Data
            .hex 48 80 30 00   ; $99a5: 48 80 30 00   Data
            .hex 40 00 00 90   ; $99a9: 40 00 00 90   Data
            .hex 85 20 08 80   ; $99ad: 85 20 08 80   Data
            .hex 20 40 08 80   ; $99b1: 20 40 08 80   Data
            .hex 60 40 10 08   ; $99b5: 60 40 10 08   Data
            .hex 80 28 80 81   ; $99b9: 80 28 80 81   Data
            .hex 81 60 40 50   ; $99bd: 81 60 40 50   Data
            .hex 48 80 3f 2a   ; $99c1: 48 80 3f 2a   Data
            .hex 8a a2 ab a5   ; $99c5: 8a a2 ab a5   Data
            .hex ea bf a3 e8   ; $99c9: ea bf a3 e8   Data
            .hex c0 ca 02 ab   ; $99cd: c0 ca 02 ab   Data
            .hex ca 30 10 10   ; $99d1: ca 30 10 10   Data
            .hex d1 86 b8 80   ; $99d5: d1 86 b8 80   Data
            .hex 28 06 08 80   ; $99d9: 28 06 08 80   Data
            .hex b0 08 80 20   ; $99dd: b0 08 80 20   Data
            .hex 09 02 14 04   ; $99e1: 09 02 14 04   Data
            .hex 0c 80 e0 08   ; $99e5: 0c 80 e0 08   Data
            .hex 02 01 01 09   ; $99e9: 02 01 01 09   Data
            .hex 80 81 28 02   ; $99ed: 80 81 28 02   Data
            .hex 00 00 08 80   ; $99f1: 00 00 08 80   Data
            .hex b0 08 02 00   ; $99f5: b0 08 02 00   Data
            .hex 00 08 80 e0   ; $99f9: 00 08 80 e0   Data
            .hex 08 02 00 00   ; $99fd: 08 02 00 00   Data
            .hex 08 80 81 28   ; $9a01: 08 80 81 28   Data
            .hex 02 00 00 08   ; $9a05: 02 00 00 08   Data
            .hex 80 b0 08 02   ; $9a09: 80 b0 08 02   Data
            .hex 00 04 0c 80   ; $9a0d: 00 04 0c 80   Data
            .hex 20 00 00 40   ; $9a11: 20 00 00 40   Data
            .hex 01 09 80 20   ; $9a15: 01 09 80 20   Data
            .hex 0c 0a 80 e0   ; $9a19: 0c 0a 80 e0   Data
            .hex 08 80 60 41   ; $9a1d: 08 80 60 41   Data
            .hex 40 d4 85 e8   ; $9a21: 40 d4 85 e8   Data
            .hex 80 81 81 81   ; $9a25: 80 81 81 81   Data
            .hex 81 81 81 81   ; $9a29: 81 81 81 81   Data
            .hex 1f d7 dd 57   ; $9a2d: 1f d7 dd 57   Data
            .hex 55 d4 14 0d   ; $9a31: 55 d4 14 0d   Data
            .hex 03 50 d5 53   ; $9a35: 03 50 d5 53   Data
            .hex d1 ff ff 81   ; $9a39: d1 ff ff 81   Data
            .hex 81 81 81 81   ; $9a3d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9a41: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9a45: 81 81 81 81   Data
            .hex 81 30 10 14   ; $9a49: 81 30 10 14   Data
            .hex 10 18 80 81   ; $9a4d: 10 18 80 81   Data
            .hex 20 00 01 00   ; $9a51: 20 00 01 00   Data
            .hex 08 80 81 20   ; $9a55: 08 80 81 20   Data
            .hex 00 00 00 08   ; $9a59: 00 00 00 08   Data
            .hex 80 81 e0 00   ; $9a5d: 80 81 e0 00   Data
            .hex 04 00 c0 86   ; $9a61: 04 00 c0 86   Data
            .hex 81 81 20 05   ; $9a65: 81 81 20 05   Data
            .hex 08 80 81 81   ; $9a69: 08 80 81 81   Data
            .hex b0 00 01 00   ; $9a6d: b0 00 01 00   Data
            .hex 90 85 81 20   ; $9a71: 90 85 81 20   Data
            .hex 00 04 00 08   ; $9a75: 00 04 00 08   Data
            .hex 80 81 20 00   ; $9a79: 80 81 20 00   Data
            .hex 01 00 08 80   ; $9a7d: 01 00 08 80   Data
            .hex 81 60 40 40   ; $9a81: 81 60 40 40   Data
            .hex 40 48 80 81   ; $9a85: 40 48 80 81   Data
            .hex 81 81 81 81   ; $9a89: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9a8d: 81 81 81 81   Data
            .hex 81 81 81 81   ; $9a91: 81 81 81 81   Data
            .hex 81 81 ff ff   ; $9a95: 81 81 ff ff   Data
            .hex f1 4c 13 55   ; $9a99: f1 4c 13 55   Data
            .hex f5 fd 7d 57   ; $9a9d: f5 fd 7d 57   Data
            .hex 14 c4 3f ff   ; $9aa1: 14 c4 3f ff   Data
            .hex ff 81 b0 10   ; $9aa5: ff 81 b0 10   Data
            .hex 10 10 90 85   ; $9aa9: 10 10 90 85   Data
            .hex b0 00 00 00   ; $9aad: b0 00 00 00   Data
            .hex 00 08 80 20   ; $9ab1: 00 08 80 20   Data
            .hex 00 08 42 00   ; $9ab5: 00 08 42 00   Data
            .hex 08 80 20 40   ; $9ab9: 08 80 20 40   Data
            .hex 08 80 e0 48   ; $9abd: 08 80 e0 48   Data
            .hex 80 28 80 20   ; $9ac1: 80 28 80 20   Data
            .hex 90 85 81 81   ; $9ac5: 90 85 81 81   Data
            .hex 20 10 00 00   ; $9ac9: 20 10 00 00   Data
            .hex 90 85 81 20   ; $9acd: 90 85 81 20   Data
            .hex 00 00 00 04   ; $9ad1: 00 00 00 04   Data
            .hex 1c 80 20 00   ; $9ad5: 1c 80 20 00   Data
            .hex 00 00 01 49   ; $9ad9: 00 00 01 49   Data
            .hex 80 20 00 00   ; $9add: 80 20 00 00   Data
            .hex 00 08 80 81   ; $9ae1: 00 08 80 81   Data
            .hex 20 00 00 00   ; $9ae5: 20 00 00 00   Data
            .hex 0c 80 81 20   ; $9ae9: 0c 80 81 20   Data
            .hex 00 00 00 05   ; $9aed: 00 00 00 05   Data
            .hex 1c 80 20 00   ; $9af1: 1c 80 20 00   Data
            .hex 00 00 05 0d   ; $9af5: 00 00 05 0d   Data
            .hex 80 e0 40 40   ; $9af9: 80 e0 40 40   Data
            .hex 40 41 49 80   ; $9afd: 40 41 49 80   Data
            .hex d5 55 55 f6   ; $9b01: d5 55 55 f6   Data
            .hex bf a7 d5 75   ; $9b05: bf a7 d5 75   Data
            .hex 54 07 01 c0   ; $9b09: 54 07 01 c0   Data
            .hex 70 15 55 b0   ; $9b0d: 70 15 55 b0   Data
            .hex 10 50 50 50   ; $9b11: 10 50 50 50   Data
            .hex 18 80 20 c0   ; $9b15: 18 80 20 c0   Data
            .hex 86 81 81 28   ; $9b19: 86 81 81 28   Data
            .hex 80 e2 86 81   ; $9b1d: 80 e2 86 81   Data
            .hex 81 b0 0c 80   ; $9b21: 81 b0 0c 80   Data
            .hex b0 50 50 50   ; $9b25: b0 50 50 50   Data
            .hex 40 49 80 24   ; $9b29: 40 49 80 24   Data
            .hex 90 85 81 81   ; $9b2d: 90 85 81 81   Data
            .hex 81 81 e1 40   ; $9b31: 81 81 e1 40   Data
            .hex 50 50 50 18   ; $9b35: 50 50 50 18   Data
            .hex 80 81 81 81   ; $9b39: 80 81 81 81   Data
            .hex 81 81 28 80   ; $9b3d: 81 81 28 80   Data
            .hex 30 50 50 50   ; $9b41: 30 50 50 50   Data
            .hex 18 0a 80 28   ; $9b45: 18 0a 80 28   Data
            .hex 80 81 81 e0   ; $9b49: 80 81 81 e0   Data
            .hex 48 80 20 10   ; $9b4d: 48 80 20 10   Data
            .hex 10 10 10 90   ; $9b51: 10 10 10 90   Data
            .hex 85 20 00 00   ; $9b55: 85 20 00 00   Data
            .hex 00 00 08 80   ; $9b59: 00 00 08 80   Data
            .hex 20 00 00 00   ; $9b5d: 20 00 00 00   Data
            .hex 00 08 80 e0   ; $9b61: 00 08 80 e0   Data
            .hex 40 40 40 40   ; $9b65: 40 40 40 40   Data
            .hex c0 86 3f ff   ; $9b69: c0 86 3f ff   Data
            .hex ff f7 ff 7f   ; $9b6d: ff f7 ff 7f   Data
            .hex ff ff ff ff   ; $9b71: ff ff ff ff   Data
            .hex ff c0 00 00   ; $9b75: ff c0 00 00   Data
            .hex 00 b8 12 18   ; $9b79: 00 b8 12 18   Data
            .hex 12 18 92 85   ; $9b7d: 12 18 92 85   Data
            .hex 20 48 42 48   ; $9b81: 20 48 42 48   Data
            .hex 02 08 80 28   ; $9b85: 02 08 80 28   Data
            .hex 80 81 81 20   ; $9b89: 80 81 81 20   Data
            .hex 08 80 20 18   ; $9b8d: 08 80 20 18   Data
            .hex 80 b0 04 08   ; $9b91: 80 b0 04 08   Data
            .hex 80 e0 40 50   ; $9b95: 80 e0 40 50   Data
            .hex 40 01 c0 86   ; $9b99: 40 01 c0 86   Data
            .hex 81 81 81 81   ; $9b9d: 81 81 81 81   Data
            .hex 28 80 81 b0   ; $9ba1: 28 80 81 b0   Data
            .hex 10 10 14 00   ; $9ba5: 10 10 14 00   Data
            .hex 90 85 2c 0a   ; $9ba9: 90 85 2c 0a   Data
            .hex 06 09 0a 0e   ; $9bad: 06 09 0a 0e   Data
            .hex 80 21 00 05   ; $9bb1: 80 21 00 05   Data
            .hex 00 04 09 80   ; $9bb5: 00 04 09 80   Data
            .hex 2c 0a 03 04   ; $9bb9: 2c 0a 03 04   Data
            .hex 09 0a 80 21   ; $9bbd: 09 0a 80 21   Data
            .hex 04 00 09 02   ; $9bc1: 04 00 09 02   Data
            .hex 0c 80 28 03   ; $9bc5: 0c 80 28 03   Data
            .hex 08 06 08 0b   ; $9bc9: 08 06 08 0b   Data
            .hex 80 e0 48 42   ; $9bcd: 80 e0 48 42   Data
            .hex 41 40 c0 86   ; $9bd1: 41 40 c0 86   Data
            .hex 55 6a 8a a0   ; $9bd5: 55 6a 8a a0   Data
            .hex a1 ff ff f1   ; $9bd9: a1 ff ff f1   Data
            .hex 45 44 44 54   ; $9bdd: 45 44 44 54   Data
            .hex 41 45 14 34   ; $9be1: 41 45 14 34   Data
            .hex 10 50 50 50   ; $9be5: 10 50 50 50   Data
            .hex 18 80 21 0c   ; $9be9: 18 80 21 0c   Data
            .hex 80 81 b0 0c   ; $9bed: 80 81 b0 0c   Data
            .hex 80 e0 c1 86   ; $9bf1: 80 e0 c1 86   Data
            .hex 81 60 09 80   ; $9bf5: 81 60 09 80   Data
            .hex 30 50 18 80   ; $9bf9: 30 50 18 80   Data
            .hex 81 28 80 28   ; $9bfd: 81 28 80 28   Data
            .hex 80 60 50 50   ; $9c01: 80 60 50 50   Data
            .hex 48 80 20 1c   ; $9c05: 48 80 20 1c   Data
            .hex 80 b8 80 b8   ; $9c09: 80 b8 80 b8   Data
            .hex 80 24 09 80   ; $9c0d: 80 24 09 80   Data
            .hex e8 80 e8 80   ; $9c11: e8 80 e8 80   Data
            .hex 61 40 50 50   ; $9c15: 61 40 50 50   Data
            .hex 50 18 80 b8   ; $9c19: 50 18 80 b8   Data
            .hex 80 b8 80 81   ; $9c1d: 80 b8 80 81   Data
            .hex 28 80 e8 80   ; $9c21: 28 80 e8 80   Data
            .hex e8 80 81 28   ; $9c25: e8 80 81 28   Data
            .hex 80 30 10 10   ; $9c29: 80 30 10 10   Data
            .hex 14 14 48 80   ; $9c2d: 14 14 48 80   Data
            .hex 20 04 04 05   ; $9c31: 20 04 04 05   Data
            .hex 0d 80 81 60   ; $9c35: 0d 80 81 60   Data
            .hex 41 41 41 49   ; $9c39: 41 41 41 49   Data
            .hex 80 81 7f df   ; $9c3d: 80 81 7f df   Data
            .hex df ff ff ff   ; $9c41: df ff ff ff   Data
            .hex df f7 ff ff   ; $9c45: df f7 ff ff   Data
            .hex ff ff f5 5c   ; $9c49: ff ff f5 5c   Data
            .hex 57 b0 18 80   ; $9c4d: 57 b0 18 80   Data
            .hex 81 b0 18 80   ; $9c51: 81 b0 18 80   Data
            .hex 20 48 80 b0   ; $9c55: 20 48 80 b0   Data
            .hex 00 08 80 28   ; $9c59: 00 08 80 28   Data
            .hex 80 b0 00 40   ; $9c5d: 80 b0 00 40   Data
            .hex 08 80 20 10   ; $9c61: 08 80 20 10   Data
            .hex 00 c0 86 28   ; $9c65: 00 c0 86 28   Data
            .hex 80 e0 00 c0   ; $9c69: 80 e0 00 c0   Data
            .hex 86 81 2c 80   ; $9c6d: 86 81 2c 80   Data
            .hex b0 08 80 81   ; $9c71: b0 08 80 81   Data
            .hex 34 09 80 20   ; $9c75: 34 09 80 20   Data
            .hex 00 14 14 01   ; $9c79: 00 14 14 01   Data
            .hex 08 80 24 04   ; $9c7d: 08 80 24 04   Data
            .hex 05 41 00 08   ; $9c81: 05 41 00 08   Data
            .hex 80 21 09 0b   ; $9c85: 80 21 09 0b   Data
            .hex 80 20 08 80   ; $9c89: 80 20 08 80   Data
            .hex 20 40 08 80   ; $9c8d: 20 40 08 80   Data
            .hex 60 08 80 28   ; $9c91: 60 08 80 28   Data
            .hex 80 28 80 81   ; $9c95: 80 28 80 81   Data
            .hex 28 80 28 80   ; $9c99: 28 80 28 80   Data
            .hex 20 14 14 08   ; $9c9d: 20 14 14 08   Data
            .hex 80 68 80 e0   ; $9ca1: 80 68 80 e0   Data
            .hex 41 41 c0 86   ; $9ca5: 41 41 c0 86   Data
            .hex ff 3f 1f 28   ; $9ca9: ff 3f 1f 28   Data
            .hex 2a ea 9a 84   ; $9cad: 2a ea 9a 84   Data
            .hex 45 68 4a 7e   ; $9cb1: 45 68 4a 7e   Data
            .hex af ab c1 b0   ; $9cb5: af ab c1 b0   Data
            .hex 1c 1a 12 10   ; $9cb9: 1c 1a 12 10   Data
            .hex 90 85 20 05   ; $9cbd: 90 85 20 05   Data
            .hex 00 04 40 08   ; $9cc1: 00 04 40 08   Data
            .hex 80 e8 43 40   ; $9cc5: 80 e8 43 40   Data
            .hex 49 80 28 80   ; $9cc9: 49 80 28 80   Data
            .hex 81 81 81 81   ; $9ccd: 81 81 81 81   Data
            .hex 81 28 80 81   ; $9cd1: 81 28 80 81   Data
            .hex 30 50 50 50   ; $9cd5: 30 50 50 50   Data
            .hex 08 80 81 28   ; $9cd9: 08 80 81 28   Data
            .hex 80 b8 80 28   ; $9cdd: 80 b8 80 28   Data
            .hex 80 81 28 80   ; $9ce1: 80 81 28 80   Data
            .hex e8 80 28 80   ; $9ce5: e8 80 28 80   Data
            .hex 30 40 50 50   ; $9ce9: 30 40 50 50   Data
            .hex 50 48 80 28   ; $9ced: 50 48 80 28   Data
            .hex 80 81 81 81   ; $9cf1: 80 81 81 81   Data
            .hex 81 81 28 80   ; $9cf5: 81 81 28 80   Data
            .hex 30 10 10 90   ; $9cf9: 30 10 10 90   Data
            .hex 85 28 80 20   ; $9cfd: 85 28 80 20   Data
            .hex 00 00 08 80   ; $9d01: 00 00 08 80   Data
            .hex 24 14 00 00   ; $9d05: 24 14 00 00   Data
            .hex 40 c0 86 e1   ; $9d09: 40 c0 86 e1   Data
            .hex 41 40 48 80   ; $9d0d: 41 40 48 80   Data
            .hex 81 81 50 11   ; $9d11: 81 81 50 11   Data
            .hex ff ff ff ea   ; $9d15: ff ff ff ea   Data
            .hex ba ae ab ff   ; $9d19: ba ae ab ff   Data
            .hex ff fc 0f 01   ; $9d1d: ff fc 0f 01   Data
            .hex 5f 38 12 18   ; $9d21: 5f 38 12 18   Data
            .hex 80 30 18 80   ; $9d25: 80 30 18 80   Data
            .hex 20 40 08 80   ; $9d29: 20 40 08 80   Data
            .hex 60 08 80 28   ; $9d2d: 60 08 80 28   Data
            .hex 80 28 80 81   ; $9d31: 80 28 80 81   Data
            .hex 28 80 28 80   ; $9d35: 28 80 28 80   Data
            .hex 28 12 10 08   ; $9d39: 28 12 10 08   Data
            .hex 80 68 80 e0   ; $9d3d: 80 68 80 e0   Data
            .hex 04 00 c0 86   ; $9d41: 04 00 c0 86   Data
            .hex 81 30 10 01   ; $9d45: 81 30 10 01   Data
            .hex 00 18 80 81   ; $9d49: 00 18 80 81   Data
            .hex 28 42 00 40   ; $9d4d: 28 42 00 40   Data
            .hex 48 80 81 68   ; $9d51: 48 80 81 68   Data
            .hex 80 28 80 81   ; $9d55: 80 28 80 81   Data
            .hex 81 81 b0 10   ; $9d59: 81 81 b0 10   Data
            .hex 04 10 90 85   ; $9d5d: 04 10 90 85   Data
            .hex 81 20 40 41   ; $9d61: 81 20 40 41   Data
            .hex 40 08 80 81   ; $9d65: 40 08 80 81   Data
            .hex 28 80 81 81   ; $9d69: 28 80 81 81   Data
            .hex 28 80 81 20   ; $9d6d: 28 80 81 20   Data
            .hex 1c 80 30 08   ; $9d71: 1c 80 30 08   Data
            .hex 80 81 e0 49   ; $9d75: 80 81 e0 49   Data
            .hex 80 60 c0 86   ; $9d79: 80 60 c0 86   Data
            .hex 0f 3f ff ff   ; $9d7d: 0f 3f ff ff   Data
            .hex c1 fc f4 1f   ; $9d81: c1 fc f4 1f   Data
            .hex ff ff c1 3f   ; $9d85: ff ff c1 3f   Data
            .hex ff ff 3c b0   ; $9d89: ff ff 3c b0   Data
            .hex 14 14 14 14   ; $9d8d: 14 14 14 14   Data
            .hex 90 85 24 01   ; $9d91: 90 85 24 01   Data
            .hex 41 41 01 0c   ; $9d95: 41 41 01 0c   Data
            .hex 80 21 c0 86   ; $9d99: 80 21 c0 86   Data
            .hex 81 e0 09 80   ; $9d9d: 81 e0 09 80   Data
            .hex e0 50 10 58   ; $9da1: e0 50 10 58   Data
            .hex 52 08 80 81   ; $9da5: 52 08 80 81   Data
            .hex b0 c0 86 b0   ; $9da9: b0 c0 86 b0   Data
            .hex c0 86 b0 c0   ; $9dad: c0 86 b0 c0   Data
            .hex 86 b0 c0 86   ; $9db1: 86 b0 c0 86   Data
            .hex 81 20 58 52   ; $9db5: 81 20 58 52   Data
            .hex 08 80 81 81   ; $9db9: 08 80 81 81   Data
            .hex e0 90 85 e0   ; $9dbd: e0 90 85 e0   Data
            .hex 90 85 81 81   ; $9dc1: 90 85 81 81   Data
            .hex e0 90 85 e0   ; $9dc5: e0 90 85 e0   Data
            .hex 90 85 b0 50   ; $9dc9: 90 85 b0 50   Data
            .hex 40 58 52 08   ; $9dcd: 40 58 52 08   Data
            .hex 80 24 90 85   ; $9dd1: 80 24 90 85   Data
            .hex 81 b0 0c 80   ; $9dd5: 81 b0 0c 80   Data
            .hex 21 04 14 14   ; $9dd9: 21 04 14 14   Data
            .hex 04 09 80 e0   ; $9ddd: 04 09 80 e0   Data
            .hex 41 41 41 41   ; $9de1: 41 41 41 41   Data
            .hex c0 86 00 0a   ; $9de5: c0 86 00 0a   Data
            .hex 8a ab ea ea   ; $9de9: 8a ab ea ea   Data
            .hex ea fa bf ab   ; $9ded: ea fa bf ab   Data
            .hex fa aa a6 a4   ; $9df1: fa aa a6 a4   Data
            .hex 00 81 30 10   ; $9df5: 00 81 30 10   Data
            .hex 10 10 90 85   ; $9df9: 10 10 90 85   Data
            .hex 81 e0 40 00   ; $9dfd: 81 e0 40 00   Data
            .hex 00 08 80 38   ; $9e01: 00 08 80 38   Data
            .hex 80 81 20 00   ; $9e05: 80 81 20 00   Data
            .hex 48 80 28 80   ; $9e09: 48 80 28 80   Data
            .hex 30 08 0a 80   ; $9e0d: 30 08 0a 80   Data
            .hex 81 28 80 60   ; $9e11: 81 28 80 60   Data
            .hex 40 08 80 81   ; $9e15: 40 08 80 81   Data
            .hex 20 90 85 81   ; $9e19: 20 90 85 81   Data
            .hex 28 80 81 20   ; $9e1d: 28 80 81 20   Data
            .hex 08 80 30 04   ; $9e21: 08 80 30 04   Data
            .hex 1c 80 20 48   ; $9e25: 1c 80 20 48   Data
            .hex 80 24 05 09   ; $9e29: 80 24 05 09   Data
            .hex 80 28 80 81   ; $9e2d: 80 28 80 81   Data
            .hex 61 41 08 80   ; $9e31: 61 41 08 80   Data
            .hex 28 80 81 81   ; $9e35: 28 80 81 81   Data
            .hex 81 28 80 20   ; $9e39: 81 28 80 20   Data
            .hex 1c 80 81 81   ; $9e3d: 1c 80 81 81   Data
            .hex 28 80 24 09   ; $9e41: 28 80 24 09   Data
            .hex 80 30 10 08   ; $9e45: 80 30 10 08   Data
            .hex 80 61 40 50   ; $9e49: 80 61 40 50   Data
            .hex 40 40 c0 86   ; $9e4d: 40 40 c0 86   Data
            .hex c0 3f 0f df   ; $9e51: c0 3f 0f df   Data
            .hex d7 ff cf f3   ; $9e55: d7 ff cf f3   Data
            .hex d7 f5 ff ff   ; $9e59: d7 f5 ff ff   Data
            .hex f7 fd f0      ; $9e5d: f7 fd f0      Data
__9e60:     .hex f0            ; $9e60: f0            Data
__9e61:     .hex 9e 02 9f 13   ; $9e61: 9e 02 9f 13   Data
            .hex 9f 24 9f 37   ; $9e65: 9f 24 9f 37   Data
            .hex 9f 49 9f 59   ; $9e69: 9f 49 9f 59   Data
            .hex 9f 6d 9f 80   ; $9e6d: 9f 6d 9f 80   Data
            .hex 9f 95 9f ab   ; $9e71: 9f 95 9f ab   Data
            .hex 9f c0 9f d3   ; $9e75: 9f c0 9f d3   Data
            .hex 9f e8 9f fe   ; $9e79: 9f e8 9f fe   Data
            .hex 9f 15 a0 2a   ; $9e7d: 9f 15 a0 2a   Data
            .hex a0 41 a0 57   ; $9e81: a0 41 a0 57   Data
            .hex a0 6c a0 83   ; $9e85: a0 6c a0 83   Data
            .hex a0 96 a0 ac   ; $9e89: a0 96 a0 ac   Data
            .hex a0 c1 a0 d6   ; $9e8d: a0 c1 a0 d6   Data
            .hex a0 ed a0 04   ; $9e91: a0 ed a0 04   Data
            .hex a1 1b a1 32   ; $9e95: a1 1b a1 32   Data
            .hex a1 49 a1 60   ; $9e99: a1 49 a1 60   Data
            .hex a1 77 a1 8e   ; $9e9d: a1 77 a1 8e   Data
            .hex a1 a0 a1 b4   ; $9ea1: a1 a0 a1 b4   Data
            .hex a1 c5 a1 d8   ; $9ea5: a1 c5 a1 d8   Data
            .hex a1 ec a1 00   ; $9ea9: a1 ec a1 00   Data
            .hex a2 13 a2 27   ; $9ead: a2 13 a2 27   Data
            .hex a2 39 a2 4c   ; $9eb1: a2 39 a2 4c   Data
            .hex a2 61 a2 75   ; $9eb5: a2 61 a2 75   Data
            .hex a2 87 a2 9d   ; $9eb9: a2 87 a2 9d   Data
            .hex a2 ae a2 c4   ; $9ebd: a2 ae a2 c4   Data
            .hex a2 d9 a2 ee   ; $9ec1: a2 d9 a2 ee   Data
            .hex a2 02 a3 16   ; $9ec5: a2 02 a3 16   Data
            .hex a3 2d a3 43   ; $9ec9: a3 2d a3 43   Data
            .hex a3 57 a3 6e   ; $9ecd: a3 57 a3 6e   Data
            .hex a3 85 a3 9c   ; $9ed1: a3 85 a3 9c   Data
            .hex a3 b3 a3 c9   ; $9ed5: a3 b3 a3 c9   Data
            .hex a3 df a3 f6   ; $9ed9: a3 df a3 f6   Data
            .hex a3 0d a4 24   ; $9edd: a3 0d a4 24   Data
            .hex a4 3b a4 51   ; $9ee1: a4 3b a4 51   Data
            .hex a4 68 a4 7d   ; $9ee5: a4 68 a4 7d   Data
            .hex a4 94 a4 ab   ; $9ee9: a4 94 a4 ab   Data
            .hex a4 c1 a4 03   ; $9eed: a4 c1 a4 03   Data
            .hex 02 40 1c 20   ; $9ef1: 02 40 1c 20   Data
            .hex 28 20 24 01   ; $9ef5: 28 20 24 01   Data
            .hex 04 01 5a 3b   ; $9ef9: 04 01 5a 3b   Data
            .hex 21 3e 25 31   ; $9efd: 21 3e 25 31   Data
            .hex 33 02 02 44   ; $9f01: 33 02 02 44   Data
            .hex 1c 20 14 24   ; $9f05: 1c 20 14 24   Data
            .hex 28 01 02 03   ; $9f09: 28 01 02 03   Data
            .hex 3c 3b 21 55   ; $9f0d: 3c 3b 21 55   Data
            .hex 2c 41 03 01   ; $9f11: 2c 41 03 01   Data
            .hex 44 1c 20 14   ; $9f15: 44 1c 20 14   Data
            .hex 24 28 02 04   ; $9f19: 24 28 02 04   Data
            .hex 02 3c 3b 34   ; $9f1d: 02 3c 3b 34   Data
            .hex 25 3e 4d 03   ; $9f21: 25 3e 4d 03   Data
            .hex 03 44 20 24   ; $9f25: 03 44 20 24   Data
            .hex 28 28 2c 02   ; $9f29: 28 28 2c 02   Data
            .hex 04 02 5a 3c   ; $9f2d: 04 02 5a 3c   Data
            .hex 2a 4d 56 2d   ; $9f31: 2a 4d 56 2d   Data
            .hex 4a 51 03 02   ; $9f35: 4a 51 03 02   Data
            .hex 44 24 28 14   ; $9f39: 44 24 28 14   Data
            .hex 28 2c 02 04   ; $9f3d: 28 2c 02 04   Data
            .hex 01 3c 2c 1a   ; $9f41: 01 3c 2c 1a   Data
            .hex 1d 1b 21 2e   ; $9f45: 1d 1b 21 2e   Data
            .hex 03 00 48 28   ; $9f49: 03 00 48 28   Data
            .hex 2c 1e 2c 34   ; $9f4d: 2c 1e 2c 34   Data
            .hex 01 04 01 5a   ; $9f51: 01 04 01 5a   Data
            .hex 3d 16 39 66   ; $9f55: 3d 16 39 66   Data
            .hex 04 03 48 28   ; $9f59: 04 03 48 28   Data
            .hex 2c 14 2c 34   ; $9f5d: 2c 14 2c 34   Data
            .hex 02 04 01 5a   ; $9f61: 02 04 01 5a   Data
            .hex 3c 0e 11 2e   ; $9f65: 3c 0e 11 2e   Data
            .hex 26 2a 51 69   ; $9f69: 26 2a 51 69   Data
            .hex 04 02 44 24   ; $9f6d: 04 02 44 24   Data
            .hex 28 1e 2c 34   ; $9f71: 28 1e 2c 34   Data
            .hex 02 04 01 5a   ; $9f75: 02 04 01 5a   Data
            .hex 33 0a 4e 16   ; $9f79: 33 0a 4e 16   Data
            .hex 22 61 6e 04   ; $9f7d: 22 61 6e 04   Data
            .hex 04 48 2c 30   ; $9f81: 04 48 2c 30   Data
            .hex 14 30 34 02   ; $9f85: 14 30 34 02   Data
            .hex 04 01 3c 3c   ; $9f89: 04 01 3c 3c   Data
            .hex 23 25 53 55   ; $9f8d: 23 25 53 55   Data
            .hex 22 24 52 54   ; $9f91: 22 24 52 54   Data
            .hex 04 05 48 00   ; $9f95: 04 05 48 00   Data
            .hex 00 02 30 34   ; $9f99: 00 02 30 34   Data
            .hex 03 04 01 5a   ; $9f9d: 03 04 01 5a   Data
            .hex 43 4a 4c 53   ; $9fa1: 43 4a 4c 53   Data
            .hex 5a 5c 4b 52   ; $9fa5: 5a 5c 4b 52   Data
            .hex 54 5b 04 04   ; $9fa9: 54 5b 04 04   Data
            .hex 48 30 34 14   ; $9fad: 48 30 34 14   Data
            .hex 38 3c 06 04   ; $9fb1: 38 3c 06 04   Data
            .hex 02 3c 3c 19   ; $9fb5: 02 3c 3c 19   Data
            .hex 24 45 59 1e   ; $9fb9: 24 45 59 1e   Data
            .hex 2e 51 5e 03   ; $9fbd: 2e 51 5e 03   Data
            .hex 03 4c 2c 30   ; $9fc1: 03 4c 2c 30   Data
            .hex 14 34 38 02   ; $9fc5: 14 34 38 02   Data
            .hex 04 01 5a 3d   ; $9fc9: 04 01 5a 3d   Data
            .hex 21 39 51 26   ; $9fcd: 21 39 51 26   Data
            .hex 3a 56 04 04   ; $9fd1: 3a 56 04 04   Data
            .hex 44 2c 30 14   ; $9fd5: 44 2c 30 14   Data
            .hex 34 38 02 04   ; $9fd9: 34 38 02 04   Data
            .hex 01 5a 3c 0b   ; $9fdd: 01 5a 3c 0b   Data
            .hex 61 66 6b 11   ; $9fe1: 61 66 6b 11   Data
            .hex 16 29 49 04   ; $9fe5: 16 29 49 04   Data
            .hex 05 44 2c 30   ; $9fe9: 05 44 2c 30   Data
            .hex 1e 34 38 02   ; $9fed: 1e 34 38 02   Data
            .hex 04 01 5a 3d   ; $9ff1: 04 01 5a 3d   Data
            .hex 1a 29 49 5d   ; $9ff5: 1a 29 49 5d   Data
            .hex 6a 0b 1d 3a   ; $9ff9: 6a 0b 1d 3a   Data
            .hex 5a 06 04 48   ; $9ffd: 5a 06 04 48   Data
            .hex 2c 30 0c 3c   ; $a001: 2c 30 0c 3c   Data
            .hex 3c 08 04 01   ; $a005: 3c 08 04 01   Data
            .hex 5a 3d 09 1e   ; $a009: 5a 3d 09 1e   Data
            .hex 5e 69 16 21   ; $a00d: 5e 69 16 21   Data
            .hex 29 49 51 66   ; $a011: 29 49 51 66   Data
            .hex 03 05 4c 30   ; $a015: 03 05 4c 30   Data
            .hex 34 10 3c 3c   ; $a019: 34 10 3c 3c   Data
            .hex 02 04 01 5a   ; $a01d: 02 04 01 5a   Data
            .hex 3d 0e 1e 2a   ; $a021: 3d 0e 1e 2a   Data
            .hex 59 5e 12 4c   ; $a025: 59 5e 12 4c   Data
            .hex 6a 06 04 4c   ; $a029: 6a 06 04 4c   Data
            .hex 30 34 10 38   ; $a02d: 30 34 10 38   Data
            .hex 3c 02 04 01   ; $a031: 3c 02 04 01   Data
            .hex 5a 3c 13 3e   ; $a035: 5a 3c 13 3e   Data
            .hex 55 69 11 1a   ; $a039: 55 69 11 1a   Data
            .hex 1e 39 63 6c   ; $a03d: 1e 39 63 6c   Data
            .hex 06 03 48 34   ; $a041: 06 03 48 34   Data
            .hex 38 10 3c 40   ; $a045: 38 10 3c 40   Data
            .hex 02 04 01 5a   ; $a049: 02 04 01 5a   Data
            .hex 4b 0b 2c 4a   ; $a04d: 4b 0b 2c 4a   Data
            .hex 09 0d 2a 4c   ; $a051: 09 0d 2a 4c   Data
            .hex 5b 66 04 04   ; $a055: 5b 66 04 04   Data
            .hex 44 34 38 10   ; $a059: 44 34 38 10   Data
            .hex 3c 40 02 04   ; $a05d: 3c 40 02 04   Data
            .hex 01 5a 23 2b   ; $a061: 01 5a 23 2b   Data
            .hex 4a 4d 5e 26   ; $a065: 4a 4d 5e 26   Data
            .hex 34 61 65 05   ; $a069: 34 61 65 05   Data
            .hex 05 4c 30 34   ; $a06d: 05 4c 30 34   Data
            .hex 18 3c 3c 02   ; $a071: 18 3c 3c 02   Data
            .hex 02 01 5a 34   ; $a075: 02 01 5a 34   Data
            .hex 14 29 51 61   ; $a079: 14 29 51 61   Data
            .hex 6e 09 0e 25   ; $a07d: 6e 09 0e 25   Data
            .hex 43 56 04 02   ; $a081: 43 56 04 02   Data
            .hex 4c 30 34 10   ; $a085: 4c 30 34 10   Data
            .hex 38 38 03 02   ; $a089: 38 38 03 02   Data
            .hex 02 5a 3c 2b   ; $a08d: 02 5a 3c 2b   Data
            .hex 4e 18 2e 3a   ; $a091: 4e 18 2e 3a   Data
            .hex 59 05 04 48   ; $a095: 59 05 04 48   Data
            .hex 30 34 10 3c   ; $a099: 30 34 10 3c   Data
            .hex 40 05 04 01   ; $a09d: 40 05 04 01   Data
            .hex 5a 44 1e 23   ; $a0a1: 5a 44 1e 23   Data
            .hex 3d 59 0c 11   ; $a0a5: 3d 59 0c 11   Data
            .hex 42 54 66 04   ; $a0a9: 42 54 66 04   Data
            .hex 04 44 30 34   ; $a0ad: 04 44 30 34   Data
            .hex 10 38 3c 05   ; $a0b1: 10 38 3c 05   Data
            .hex 04 01 5a 3a   ; $a0b5: 04 01 5a 3a   Data
            .hex 09 16 2c 46   ; $a0b9: 09 16 2c 46   Data
            .hex 36 4c 65 69   ; $a0bd: 36 4c 65 69   Data
            .hex 04 04 48 34   ; $a0c1: 04 04 48 34   Data
            .hex 38 0c 3c 40   ; $a0c5: 38 0c 3c 40   Data
            .hex 05 04 01 5a   ; $a0c9: 05 04 01 5a   Data
            .hex 3c 1e 32 42   ; $a0cd: 3c 1e 32 42   Data
            .hex 5e 2e 35 45   ; $a0d1: 5e 2e 35 45   Data
            .hex 4e 05 05 50   ; $a0d5: 4e 05 05 50   Data
            .hex 34 38 0c 40   ; $a0d9: 34 38 0c 40   Data
            .hex 40 06 02 01   ; $a0dd: 40 06 02 01   Data
            .hex 5a 3c 12 2b   ; $a0e1: 5a 3c 12 2b   Data
            .hex 2e 69 6e 15   ; $a0e5: 2e 69 6e 15   Data
            .hex 3a 5b 5d 6c   ; $a0e9: 3a 5b 5d 6c   Data
            .hex 05 05 50 30   ; $a0ed: 05 05 50 30   Data
            .hex 34 14 38 3c   ; $a0f1: 34 14 38 3c   Data
            .hex 04 02 02 5a   ; $a0f5: 04 02 02 5a   Data
            .hex 3c 20 24 32   ; $a0f9: 3c 20 24 32   Data
            .hex 46 4c 3e 45   ; $a0fd: 46 4c 3e 45   Data
            .hex 50 52 56 05   ; $a101: 50 52 56 05   Data
            .hex 05 50 30 34   ; $a105: 05 50 30 34   Data
            .hex 0c 40 40 07   ; $a109: 0c 40 40 07   Data
            .hex 04 01 5a 3c   ; $a10d: 04 01 5a 3c   Data
            .hex 0c 13 56 64   ; $a111: 0c 13 56 64   Data
            .hex 6b 0b 14 26   ; $a115: 6b 0b 14 26   Data
            .hex 63 6c 06 04   ; $a119: 63 6c 06 04   Data
            .hex 50 30 34 14   ; $a11d: 50 30 34 14   Data
            .hex 3c 40 05 04   ; $a121: 3c 40 05 04   Data
            .hex 01 5a 3c 0c   ; $a125: 01 5a 3c 0c   Data
            .hex 19 3b 67 09   ; $a129: 19 3b 67 09   Data
            .hex 1e 4c 59 60   ; $a12d: 1e 4c 59 60   Data
            .hex 64 05 05 50   ; $a131: 64 05 05 50   Data
            .hex 30 34 10 40   ; $a135: 30 34 10 40   Data
            .hex 40 07 02 01   ; $a139: 40 07 02 01   Data
            .hex 5a 34 0c 1e   ; $a13d: 5a 34 0c 1e   Data
            .hex 4a 6c 6e 0e   ; $a141: 4a 6c 6e 0e   Data
            .hex 15 4c 5e 69   ; $a145: 15 4c 5e 69   Data
            .hex 04 06 50 30   ; $a149: 04 06 50 30   Data
            .hex 34 0c 40 40   ; $a14d: 34 0c 40 40   Data
            .hex 06 02 02 5a   ; $a151: 06 02 02 5a   Data
            .hex 3c 0d 1c 1d   ; $a155: 3c 0d 1c 1d   Data
            .hex 29 35 53 19   ; $a159: 29 35 53 19   Data
            .hex 41 43 53 05   ; $a15d: 41 43 53 05   Data
            .hex 05 50 30 34   ; $a161: 05 50 30 34   Data
            .hex 0c 3c 40 08   ; $a165: 0c 3c 40 08   Data
            .hex 02 02 3c 3b   ; $a169: 02 02 3c 3b   Data
            .hex 10 24 39 52   ; $a16d: 10 24 39 52   Data
            .hex 58 19 21 22   ; $a171: 58 19 21 22   Data
            .hex 3f 54 05 05   ; $a175: 3f 54 05 05   Data
            .hex 50 38 3c 0c   ; $a179: 50 38 3c 0c   Data
            .hex 48 48 08 01   ; $a17d: 48 48 08 01   Data
            .hex 02 5a 3d 0a   ; $a181: 02 5a 3d 0a   Data
            .hex 15 24 51 5e   ; $a185: 15 24 51 5e   Data
            .hex 0e 21 3a 54   ; $a189: 0e 21 3a 54   Data
            .hex 69 03 02 40   ; $a18d: 69 03 02 40   Data
            .hex 2c 2c 10 30   ; $a191: 2c 2c 10 30   Data
            .hex 34 02 02 01   ; $a195: 34 02 02 01   Data
            .hex 5a 3b 2c 3d   ; $a199: 5a 3b 2c 3d   Data
            .hex 31 4b 52 04   ; $a19d: 31 4b 52 04   Data
            .hex 03 44 2c 30   ; $a1a1: 03 44 2c 30   Data
            .hex 14 30 34 02   ; $a1a5: 14 30 34 02   Data
            .hex 02 03 5a 43   ; $a1a9: 02 03 5a 43   Data
            .hex 0c 14 56 0b   ; $a1ad: 0c 14 56 0b   Data
            .hex 1e 51 5b 03   ; $a1b1: 1e 51 5b 03   Data
            .hex 01 44 28 2c   ; $a1b5: 01 44 28 2c   Data
            .hex 0a 30 34 02   ; $a1b9: 0a 30 34 02   Data
            .hex 04 02 5a 53   ; $a1bd: 04 02 5a 53   Data
            .hex 18 1d 4e 59   ; $a1c1: 18 1d 4e 59   Data
            .hex 03 03 44 30   ; $a1c5: 03 03 44 30   Data
            .hex 34 10 34 38   ; $a1c9: 34 10 34 38   Data
            .hex 02 04 01 5a   ; $a1cd: 02 04 01 5a   Data
            .hex 3c 22 51 5e   ; $a1d1: 3c 22 51 5e   Data
            .hex 1c 45 63 04   ; $a1d5: 1c 45 63 04   Data
            .hex 03 48 30 34   ; $a1d9: 03 48 30 34   Data
            .hex 14 38 3c 02   ; $a1dd: 14 38 3c 02   Data
            .hex 04 01 5a 44   ; $a1e1: 04 01 5a 44   Data
            .hex 1c 5a 65 18   ; $a1e5: 1c 5a 65 18   Data
            .hex 38 4e 53 04   ; $a1e9: 38 4e 53 04   Data
            .hex 03 48 30 34   ; $a1ed: 03 48 30 34   Data
            .hex 10 3c 44 03   ; $a1f1: 10 3c 44 03   Data
            .hex 04 01 5a 43   ; $a1f5: 04 01 5a 43   Data
            .hex 0a 5e 6c 33   ; $a1f9: 0a 5e 6c 33   Data
            .hex 36 49 5b 03   ; $a1fd: 36 49 5b 03   Data
            .hex 03 44 28 2c   ; $a201: 03 44 28 2c   Data
            .hex 10 30 38 03   ; $a205: 10 30 38 03   Data
            .hex 04 01 5a 2c   ; $a209: 04 01 5a 2c   Data
            .hex 42 4d 66 0a   ; $a20d: 42 4d 66 0a   Data
            .hex 0e 68 04 03   ; $a211: 0e 68 04 03   Data
            .hex 44 30 34 10   ; $a215: 44 30 34 10   Data
            .hex 38 3c 03 04   ; $a219: 38 3c 03 04   Data
            .hex 01 5a 3b 15   ; $a21d: 01 5a 3b 15   Data
            .hex 31 5b 18 2e   ; $a221: 31 5b 18 2e   Data
            .hex 45 65 02 03   ; $a225: 45 65 02 03   Data
            .hex 48 34 38 08   ; $a229: 48 34 38 08   Data
            .hex 38 3c 03 04   ; $a22d: 38 3c 03 04   Data
            .hex 01 5a 3b 29   ; $a231: 01 5a 3b 29   Data
            .hex 2d 4d 3a 3e   ; $a235: 2d 4d 3a 3e   Data
            .hex 03 03 48 00   ; $a239: 03 03 48 00   Data
            .hex 00 04 30 34   ; $a23d: 00 04 30 34   Data
            .hex 03 04 01 5a   ; $a241: 03 04 01 5a   Data
            .hex 3b 15 24 36   ; $a245: 3b 15 24 36   Data
            .hex 13 26 39 04   ; $a249: 13 26 39 04   Data
            .hex 04 50 30 34   ; $a24d: 04 50 30 34   Data
            .hex 10 34 38 04   ; $a251: 10 34 38 04   Data
            .hex 04 02 5a 3c   ; $a255: 04 02 5a 3c   Data
            .hex 0b 0d 6b 6e   ; $a259: 0b 0d 6b 6e   Data
            .hex 16 29 49 65   ; $a25d: 16 29 49 65   Data
            .hex 04 03 4c 34   ; $a261: 04 03 4c 34   Data
            .hex 38 10 3c 40   ; $a265: 38 10 3c 40   Data
            .hex 03 04 01 5a   ; $a269: 03 04 01 5a   Data
            .hex 3b 16 1b 53   ; $a26d: 3b 16 1b 53   Data
            .hex 11 36 55 61   ; $a271: 11 36 55 61   Data
            .hex 02 03 44 34   ; $a275: 02 03 44 34   Data
            .hex 38 08 3c 40   ; $a279: 38 08 3c 40   Data
            .hex 03 04 01 5a   ; $a27d: 03 04 01 5a   Data
            .hex 3a 24 3c 5d   ; $a281: 3a 24 3c 5d   Data
            .hex 3e 53 05 04   ; $a285: 3e 53 05 04   Data
            .hex 44 30 34 18   ; $a289: 44 30 34 18   Data
            .hex 3c 3c 03 04   ; $a28d: 3c 3c 03 04   Data
            .hex 01 5a 34 21   ; $a291: 01 5a 34 21   Data
            .hex 24 5a 6d 0d   ; $a295: 24 5a 6d 0d   Data
            .hex 11 3a 3e 53   ; $a299: 11 3a 3e 53   Data
            .hex 02 02 48 34   ; $a29d: 02 02 48 34   Data
            .hex 34 10 3c 40   ; $a2a1: 34 10 3c 40   Data
            .hex 01 04 01 5a   ; $a2a5: 01 04 01 5a   Data
            .hex 3b 2d 4a 2e   ; $a2a9: 3b 2d 4a 2e   Data
            .hex 31 05 04 4c   ; $a2ad: 31 05 04 4c   Data
            .hex 34 38 18 3c   ; $a2b1: 34 38 18 3c   Data
            .hex 40 03 04 01   ; $a2b5: 40 03 04 01   Data
            .hex 5a 33 13 1d   ; $a2b9: 5a 33 13 1d   Data
            .hex 4e 54 14 1a   ; $a2bd: 4e 54 14 1a   Data
            .hex 35 42 53 03   ; $a2c1: 35 42 53 03   Data
            .hex 05 44 34 38   ; $a2c5: 05 44 34 38   Data
            .hex 0c 38 3c 03   ; $a2c9: 0c 38 3c 03   Data
            .hex 04 01 5a 3a   ; $a2cd: 04 01 5a 3a   Data
            .hex 0b 34 45 66   ; $a2d1: 0b 34 45 66   Data
            .hex 6a 19 51 5c   ; $a2d5: 6a 19 51 5c   Data
            .hex 04 04 48 34   ; $a2d9: 04 04 48 34   Data
            .hex 38 0c 40 44   ; $a2dd: 38 0c 40 44   Data
            .hex 03 04 01 5a   ; $a2e1: 03 04 01 5a   Data
            .hex 2d 12 1b 1e   ; $a2e5: 2d 12 1b 1e   Data
            .hex 4c 0a 11 29   ; $a2e9: 4c 0a 11 29   Data
            .hex 2b 04 03 44   ; $a2ed: 2b 04 03 44   Data
            .hex 38 3c 08 40   ; $a2f1: 38 3c 08 40   Data
            .hex 44 03 04 01   ; $a2f5: 44 03 04 01   Data
            .hex 5a 3c 22 34   ; $a2f9: 5a 3c 22 34   Data
            .hex 56 2e 39 46   ; $a2fd: 56 2e 39 46   Data
            .hex 53 04 03 4c   ; $a301: 53 04 03 4c   Data
            .hex 34 34 10 40   ; $a305: 34 34 10 40   Data
            .hex 40 03 02 01   ; $a309: 40 03 02 01   Data
            .hex 5a 3e 1c 3b   ; $a30d: 5a 3e 1c 3b   Data
            .hex 65 21 23 51   ; $a311: 65 21 23 51   Data
            .hex 5c 05 05 4a   ; $a315: 5c 05 05 4a   Data
            .hex 34 38 10 40   ; $a319: 34 38 10 40   Data
            .hex 44 03 02 02   ; $a31d: 44 03 02 02   Data
            .hex 5a 34 0e 11   ; $a321: 5a 34 0e 11   Data
            .hex 29 61 6e 4e   ; $a325: 29 61 6e 4e   Data
            .hex 51 63 69 6d   ; $a329: 51 63 69 6d   Data
            .hex 05 04 48 38   ; $a32d: 05 04 48 38   Data
            .hex 3c 14 40 44   ; $a331: 3c 14 40 44   Data
            .hex 05 02 01 5a   ; $a335: 05 02 01 5a   Data
            .hex 43 12 21 4d   ; $a339: 43 12 21 4d   Data
            .hex 5d 1d 2c 35   ; $a33d: 5d 1d 2c 35   Data
            .hex 3f 52 03 04   ; $a341: 3f 52 03 04   Data
            .hex 4c 38 3c 10   ; $a345: 4c 38 3c 10   Data
            .hex 40 44 05 04   ; $a349: 40 44 05 04   Data
            .hex 01 5a 33 12   ; $a34d: 01 5a 33 12   Data
            .hex 4c 62 15 2e   ; $a351: 4c 62 15 2e   Data
            .hex 41 66 06 04   ; $a355: 41 66 06 04   Data
            .hex 48 34 38 10   ; $a359: 48 34 38 10   Data
            .hex 3c 40 05 04   ; $a35d: 3c 40 05 04   Data
            .hex 01 5a 3e 53   ; $a361: 01 5a 3e 53   Data
            .hex 56 59 5c 09   ; $a365: 56 59 5c 09   Data
            .hex 1e 31 49 66   ; $a369: 1e 31 49 66   Data
            .hex 6a 06 04 48   ; $a36d: 6a 06 04 48   Data
            .hex 38 3c 10 44   ; $a371: 38 3c 10 44   Data
            .hex 44 06 02 01   ; $a375: 44 06 02 01   Data
            .hex 5a 3e 1d 2b   ; $a379: 5a 3e 1d 2b   Data
            .hex 31 4c 0a 26   ; $a37d: 31 4c 0a 26   Data
            .hex 51 56 5b 6d   ; $a381: 51 56 5b 6d   Data
            .hex 05 05 50 38   ; $a385: 05 05 50 38   Data
            .hex 3c 10 40 44   ; $a389: 3c 10 40 44   Data
            .hex 04 02 02 5a   ; $a38d: 04 02 02 5a   Data
            .hex 3c 16 3e 41   ; $a391: 3c 16 3e 41   Data
            .hex 5b 68 0c 15   ; $a395: 5b 68 0c 15   Data
            .hex 49 4e 63 05   ; $a399: 49 4e 63 05   Data
            .hex 05 48 3c 40   ; $a39d: 05 48 3c 40   Data
            .hex 14 40 44 05   ; $a3a1: 14 40 44 05   Data
            .hex 04 01 5a 3c   ; $a3a5: 04 01 5a 3c   Data
            .hex 09 34 4e 53   ; $a3a9: 09 34 4e 53   Data
            .hex 69 0c 16 31   ; $a3ad: 69 0c 16 31   Data
            .hex 62 6c 05 04   ; $a3b1: 62 6c 05 04   Data
            .hex 50 38 38 18   ; $a3b5: 50 38 38 18   Data
            .hex 3c 3c 04 04   ; $a3b9: 3c 3c 04 04   Data
            .hex 01 5a 44 0e   ; $a3bd: 01 5a 44 0e   Data
            .hex 13 2a 4e 15   ; $a3c1: 13 2a 4e 15   Data
            .hex 31 49 56 62   ; $a3c5: 31 49 56 62   Data
            .hex 05 04 50 38   ; $a3c9: 05 04 50 38   Data
            .hex 3c 10 44 48   ; $a3cd: 3c 10 44 48   Data
            .hex 07 02 01 5a   ; $a3d1: 07 02 01 5a   Data
            .hex 2c 23 4e 5c   ; $a3d5: 2c 23 4e 5c   Data
            .hex 61 0a 26 39   ; $a3d9: 61 0a 26 39   Data
            .hex 43 6e 05 05   ; $a3dd: 43 6e 05 05   Data
            .hex 50 40 44 0a   ; $a3e1: 50 40 44 0a   Data
            .hex 48 46 06 02   ; $a3e5: 48 46 06 02   Data
            .hex 02 5a 3a 1a   ; $a3e9: 02 5a 3a 1a   Data
            .hex 23 2d 36 61   ; $a3ed: 23 2d 36 61   Data
            .hex 11 2e 35 55   ; $a3f1: 11 2e 35 55   Data
            .hex 5a 07 03 50   ; $a3f5: 5a 07 03 50   Data
            .hex 3c 40 0a 4c   ; $a3f9: 3c 40 0a 4c   Data
            .hex 4c 08 08 02   ; $a3fd: 4c 08 08 02   Data
            .hex 5a 3b 22 23   ; $a401: 5a 3b 22 23   Data
            .hex 54 1d 2c 39   ; $a405: 54 1d 2c 39   Data
            .hex 3e 4a 53 5d   ; $a409: 3e 4a 53 5d   Data
            .hex 05 05 50 40   ; $a40d: 05 05 50 40   Data
            .hex 44 0a 4c 54   ; $a411: 44 0a 4c 54   Data
            .hex 08 04 02 5a   ; $a415: 08 04 02 5a   Data
            .hex 2b 45 4a 51   ; $a419: 2b 45 4a 51   Data
            .hex 53 5a 49 4b   ; $a41d: 53 5a 49 4b   Data
            .hex 52 59 5b 05   ; $a421: 52 59 5b 05   Data
            .hex 05 48 30 34   ; $a425: 05 48 30 34   Data
            .hex 1e 34 38 04   ; $a429: 1e 34 38 04   Data
            .hex 02 01 5a 19   ; $a42d: 02 01 5a 19   Data
            .hex 16 32 49 66   ; $a431: 16 32 49 66   Data
            .hex 6a 0b 24 36   ; $a435: 6a 0b 24 36   Data
            .hex 54 6d 05 04   ; $a439: 54 6d 05 04   Data
            .hex 4c 30 34 1e   ; $a43d: 4c 30 34 1e   Data
            .hex 34 38 04 02   ; $a441: 34 38 04 02   Data
            .hex 01 5a 19 22   ; $a445: 01 5a 19 22   Data
            .hex 43 53 66 29   ; $a449: 43 53 66 29   Data
            .hex 2d 49 4e 6a   ; $a44d: 2d 49 4e 6a   Data
            .hex 05 05 48 30   ; $a451: 05 05 48 30   Data
            .hex 34 1e 34 38   ; $a455: 34 1e 34 38   Data
            .hex 02 02 01 5a   ; $a459: 02 02 01 5a   Data
            .hex 1a 2e 34 3e   ; $a45d: 1a 2e 34 3e   Data
            .hex 49 53 62 0d   ; $a461: 49 53 62 0d   Data
            .hex 21 43 5e 05   ; $a465: 21 43 5e 05   Data
            .hex 03 48 34 38   ; $a469: 03 48 34 38   Data
            .hex 14 38 3c 01   ; $a46d: 14 38 3c 01   Data
            .hex 0f 02 3c 35   ; $a471: 0f 02 3c 35   Data
            .hex 2a 51 63 1d   ; $a475: 2a 51 63 1d   Data
            .hex 22 3c 41 66   ; $a479: 22 3c 41 66   Data
            .hex 05 05 4c 34   ; $a47d: 05 05 4c 34   Data
            .hex 38 14 3c 40   ; $a481: 38 14 3c 40   Data
            .hex 02 04 01 5a   ; $a485: 02 04 01 5a   Data
            .hex 36 0d 34 45   ; $a489: 36 0d 34 45   Data
            .hex 5e 61 13 26   ; $a48d: 5e 61 13 26   Data
            .hex 2c 49 53 07   ; $a491: 2c 49 53 07   Data
            .hex 03 44 3c 40   ; $a495: 03 44 3c 40   Data
            .hex 14 40 44 02   ; $a499: 14 40 44 02   Data
            .hex 0f 01 3c 3c   ; $a49d: 0f 01 3c 3c   Data
            .hex 0b 52 56 0e   ; $a4a1: 0b 52 56 0e   Data
            .hex 41 49 51 59   ; $a4a5: 41 49 51 59   Data
            .hex 62 66 05 04   ; $a4a9: 62 66 05 04   Data
            .hex 4c 40 44 14   ; $a4ad: 4c 40 44 14   Data
            .hex 48 4c 02 08   ; $a4b1: 48 4c 02 08   Data
            .hex 01 3c 3c 14   ; $a4b5: 01 3c 3c 14   Data
            .hex 23 53 64 13   ; $a4b9: 23 53 64 13   Data
            .hex 26 39 56 63   ; $a4bd: 26 39 56 63   Data
            .hex 06 04 4c 3c   ; $a4c1: 06 04 4c 3c   Data
            .hex 40 14 44 48   ; $a4c5: 40 14 44 48   Data
            .hex 05 02 01 5a   ; $a4c9: 05 02 01 5a   Data
            .hex 19 0a 13 1e   ; $a4cd: 19 0a 13 1e   Data
            .hex 69 0b 12 2c   ; $a4d1: 69 0b 12 2c   Data
            .hex 42 45 6d 43   ; $a4d5: 42 45 6d 43   Data
            .hex 4f 50 59 52   ; $a4d9: 4f 50 59 52   Data
            .hex 49 47 48 54   ; $a4dd: 49 47 48 54   Data
            .hex 20 31 39 38   ; $a4e1: 20 31 39 38   Data
            .hex 32 20 31 39   ; $a4e5: 32 20 31 39   Data
            .hex 38 36 20 4e   ; $a4e9: 38 36 20 4e   Data
            .hex 41 4d 43 4f   ; $a4ed: 41 4d 43 4f   Data
            .hex 20 4c 54 44   ; $a4f1: 20 4c 54 44   Data
            .hex 2e 41 4c 4c   ; $a4f5: 2e 41 4c 4c   Data
            .hex 20 52 49 47   ; $a4f9: 20 52 49 47   Data
            .hex 48 54 53 20   ; $a4fd: 48 54 53 20   Data
            .hex 52 45 53 45   ; $a501: 52 45 53 45   Data
            .hex 52 56 45 44   ; $a505: 52 56 45 44   Data
__a509:     .hex 0f 30 0f 16   ; $a509: 0f 30 0f 16   Data
            .hex 0f 07 17 29   ; $a50d: 0f 07 17 29   Data
            .hex 0f 0f 21 0f   ; $a511: 0f 0f 21 0f   Data
            .hex 0f 21 0f 0f   ; $a515: 0f 21 0f 0f   Data
            .hex 0f 30 16 21   ; $a519: 0f 30 16 21   Data
            .hex 0f 28 30 16   ; $a51d: 0f 28 30 16   Data
            .hex 0f 16 09 30   ; $a521: 0f 16 09 30   Data
            .hex 0f 0f 0f 0f   ; $a525: 0f 0f 0f 0f   Data
__a529:     .hex 4b 2e 4e 2e   ; $a529: 4b 2e 4e 2e   Data

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      ; irq/brk vector
;-------------------------------------------------------------------------------
irq:        sei                ; $a52d: 78        
            cld                ; $a52e: d8        
            ldx #$11           ; $a52f: a2 11     
            stx $2000          ; $a531: 8e 00 20  
__a534:     lda $2002          ; $a534: ad 02 20  
            bpl __a534         ; $a537: 10 fb     
__a539:     lda $2002          ; $a539: ad 02 20  
            bpl __a539         ; $a53c: 10 fb     
            ldx #$ff           ; $a53e: a2 ff     
            txs                ; $a540: 9a        
            lda #$06           ; $a541: a9 06     
            sta $2001          ; $a543: 8d 01 20  
            jsr __e702         ; $a546: 20 02 e7  
            jsr __f7a6         ; $a549: 20 a6 f7  
            ldx #$00           ; $a54c: a2 00     
__a54e:     lda __a529,x       ; $a54e: bd 29 a5  
            cmp $00,x          ; $a551: d5 00     
            bne __a55c         ; $a553: d0 07     
            inx                ; $a555: e8        
            cpx #$04           ; $a556: e0 04     
            bne __a54e         ; $a558: d0 f4     
            beq __a575         ; $a55a: f0 19     
__a55c:     ldx #$00           ; $a55c: a2 00     
__a55e:     lda __a529,x       ; $a55e: bd 29 a5  
            sta $00,x          ; $a561: 95 00     
            inx                ; $a563: e8        
            cpx #$04           ; $a564: e0 04     
            bne __a55e         ; $a566: d0 f6     
__a568:     lda #$00           ; $a568: a9 00     
            sta $00,x          ; $a56a: 95 00     
            inx                ; $a56c: e8        
            cpx #$17           ; $a56d: e0 17     
            bne __a568         ; $a56f: d0 f7     
            lda #$03           ; $a571: a9 03     
            sta $12            ; $a573: 85 12     
__a575:     lda #$00           ; $a575: a9 00     
            sta $17            ; $a577: 85 17     
            sta $18            ; $a579: 85 18     
            ldy #$19           ; $a57b: a0 19     
__a57d:     sta ($17),y        ; $a57d: 91 17     
            iny                ; $a57f: c8        
            bne __a57d         ; $a580: d0 fb     
            inc $18            ; $a582: e6 18     
            ldx $18            ; $a584: a6 18     
            cpx #$08           ; $a586: e0 08     
            beq __a592         ; $a588: f0 08     
            cpx #$07           ; $a58a: e0 07     
            bne __a57d         ; $a58c: d0 ef     
            lda #$ef           ; $a58e: a9 ef     
            bne __a57d         ; $a590: d0 eb     
__a592:     ldx #$00           ; $a592: a2 00     
__a594:     lda __a509,x       ; $a594: bd 09 a5  
            sta $0200,x        ; $a597: 9d 00 02  
            inx                ; $a59a: e8        
            cpx #$20           ; $a59b: e0 20     
            bne __a594         ; $a59d: d0 f5     
            lda #$b5           ; $a59f: a9 b5     
            sta $28            ; $a5a1: 85 28     
            lda #$51           ; $a5a3: a9 51     
            sta $022d          ; $a5a5: 8d 2d 02  
            lda #$fe           ; $a5a8: a9 fe     
            sta $f7            ; $a5aa: 85 f7     
            ldx #$01           ; $a5ac: a2 01     
            stx $f8            ; $a5ae: 86 f8     
            inx                ; $a5b0: e8        
            stx $022e          ; $a5b1: 8e 2e 02  
            jsr __ac8b         ; $a5b4: 20 8b ac  
            ldx #$00           ; $a5b7: a2 00     
            stx $0700          ; $a5b9: 8e 00 07  
            stx $0703          ; $a5bc: 8e 03 07  
            lda #$fe           ; $a5bf: a9 fe     
            sta $0701          ; $a5c1: 8d 01 07  
            lda #$20           ; $a5c4: a9 20     
            sta $0702          ; $a5c6: 8d 02 07  
            inx                ; $a5c9: e8        
            stx $0611          ; $a5ca: 8e 11 06  
            stx $0612          ; $a5cd: 8e 12 06  
            stx $0613          ; $a5d0: 8e 13 06  
            stx $0229          ; $a5d3: 8e 29 02  
            stx $91            ; $a5d6: 86 91     
            lda #$ef           ; $a5d8: a9 ef     
            sta $0292          ; $a5da: 8d 92 02  
__a5dd:     lda #$01           ; $a5dd: a9 01     
            sta $023f          ; $a5df: 8d 3f 02  
__a5e2:     inc $022b          ; $a5e2: ee 2b 02  
            lda $023f          ; $a5e5: ad 3f 02  
            bne __a5e2         ; $a5e8: d0 f8     
            jsr __a7b3         ; $a5ea: 20 b3 a7  
            jsr __e841         ; $a5ed: 20 41 e8  
            jsr __a91b         ; $a5f0: 20 1b a9  
            lda $0243          ; $a5f3: ad 43 02  
            beq __a5dd         ; $a5f6: f0 e5     
            cmp #$01           ; $a5f8: c9 01     
            beq __a632         ; $a5fa: f0 36     
            lda $03e2          ; $a5fc: ad e2 03  
            ora $022c          ; $a5ff: 0d 2c 02  
            ora $0295          ; $a602: 0d 95 02  
            ora $0296          ; $a605: 0d 96 02  
            ora $02de          ; $a608: 0d de 02  
            ora $02ce          ; $a60b: 0d ce 02  
            bne __a632         ; $a60e: d0 22     
            lda $022f          ; $a610: ad 2f 02  
            beq __a61c         ; $a613: f0 07     
            lda $0291          ; $a615: ad 91 02  
            cmp #$01           ; $a618: c9 01     
            bne __a632         ; $a61a: d0 16     
__a61c:     lda #$00           ; $a61c: a9 00     
            sta $02db          ; $a61e: 8d db 02  
            jsr __c8ac         ; $a621: 20 ac c8  
            jsr __cac9         ; $a624: 20 c9 ca  
            jsr __f260         ; $a627: 20 60 f2  
            lda $022d          ; $a62a: ad 2d 02  
            ora $022e          ; $a62d: 0d 2e 02  
            bne __a5dd         ; $a630: d0 ab     
__a632:     jsr __ae28         ; $a632: 20 28 ae  
            jsr __aedb         ; $a635: 20 db ae  
            jsr __f18c         ; $a638: 20 8c f1  
            jsr __f330         ; $a63b: 20 30 f3  
            jsr __bbac         ; $a63e: 20 ac bb  
            jsr __c4b2         ; $a641: 20 b2 c4  
            jsr __bd59         ; $a644: 20 59 bd  
            jsr __c2f7         ; $a647: 20 f7 c2  
            jsr __d998         ; $a64a: 20 98 d9  
            jsr __c586         ; $a64d: 20 86 c5  
            jsr __e15c         ; $a650: 20 5c e1  
            jsr __e1c8         ; $a653: 20 c8 e1  
            jsr __e2ca         ; $a656: 20 ca e2  
            jsr __c73e         ; $a659: 20 3e c7  
            jsr __eb7f         ; $a65c: 20 7f eb  
            jsr __ed46         ; $a65f: 20 46 ed  
            jsr __ee46         ; $a662: 20 46 ee  
            jsr __ef0e         ; $a665: 20 0e ef  
            lda $f9            ; $a668: a5 f9     
            bne __a681         ; $a66a: d0 15     
            jsr __d182         ; $a66c: 20 82 d1  
            jsr __d2c2         ; $a66f: 20 c2 d2  
            jsr __b947         ; $a672: 20 47 b9  
            jsr __d41d         ; $a675: 20 1d d4  
            jsr __d490         ; $a678: 20 90 d4  
            jsr __d685         ; $a67b: 20 85 d6  
            jsr __d773         ; $a67e: 20 73 d7  
__a681:     jsr __efbd         ; $a681: 20 bd ef  
            jsr __f019         ; $a684: 20 19 f0  
            lda $022c          ; $a687: ad 2c 02  
            ora $0295          ; $a68a: 0d 95 02  
            ora $0296          ; $a68d: 0d 96 02  
            ora $025a          ; $a690: 0d 5a 02  
            ora $02de          ; $a693: 0d de 02  
            ora $02ce          ; $a696: 0d ce 02  
            beq __a69e         ; $a699: f0 03     
__a69b:     jmp __a743         ; $a69b: 4c 43 a7  

;-------------------------------------------------------------------------------
__a69e:     lda $03e2          ; $a69e: ad e2 03  
            cmp #$02           ; $a6a1: c9 02     
            bcs __a69b         ; $a6a3: b0 f6     
            lda $0244          ; $a6a5: ad 44 02  
            cmp #$02           ; $a6a8: c9 02     
            bcs __a69b         ; $a6aa: b0 ef     
            lda $0291          ; $a6ac: ad 91 02  
            cmp #$03           ; $a6af: c9 03     
            bcs __a69b         ; $a6b1: b0 e8     
            ldx $0229          ; $a6b3: ae 29 02  
            ldy $0229          ; $a6b6: ac 29 02  
__a6b9:     lda $0244,x        ; $a6b9: bd 44 02  
            beq __a6bf         ; $a6bc: f0 01     
            dey                ; $a6be: 88        
__a6bf:     dex                ; $a6bf: ca        
            bne __a6b9         ; $a6c0: d0 f7     
            sty $022f          ; $a6c2: 8c 2f 02  
            cpy #$00           ; $a6c5: c0 00     
            beq __a6ef         ; $a6c7: f0 26     
            cpy #$01           ; $a6c9: c0 01     
            bne __a6de         ; $a6cb: d0 11     
            lda $0227          ; $a6cd: ad 27 02  
            cmp #$02           ; $a6d0: c9 02     
            bcc __a6de         ; $a6d2: 90 0a     
            lda #$02           ; $a6d4: a9 02     
            sta $0227          ; $a6d6: 8d 27 02  
            lda #$00           ; $a6d9: a9 00     
            sta $0226          ; $a6db: 8d 26 02  
__a6de:     lda $0291          ; $a6de: ad 91 02  
            beq __a743         ; $a6e1: f0 60     
            lda #$64           ; $a6e3: a9 64     
            sta $022c          ; $a6e5: 8d 2c 02  
            lda #$01           ; $a6e8: a9 01     
            sta $025b          ; $a6ea: 8d 5b 02  
            bne __a722         ; $a6ed: d0 33     
__a6ef:     lda $0291          ; $a6ef: ad 91 02  
            bne __a706         ; $a6f2: d0 12     
            lda #$f0           ; $a6f4: a9 f0     
            sta $022c          ; $a6f6: 8d 2c 02  
            lda #$01           ; $a6f9: a9 01     
            sta $062a          ; $a6fb: 8d 2a 06  
            sta $062b          ; $a6fe: 8d 2b 06  
            sta $062c          ; $a701: 8d 2c 06  
            bne __a70d         ; $a704: d0 07     

;-------------------------------------------------------------------------------
__a706:     lda #$64           ; $a706: a9 64     
            sta $022c          ; $a708: 8d 2c 02  
            lda #$01           ; $a70b: a9 01     

;-------------------------------------------------------------------------------
__a70d:     sta $025b          ; $a70d: 8d 5b 02  
            lda $0259          ; $a710: ad 59 02  
            cmp #$47           ; $a713: c9 47     
            beq __a71d         ; $a715: f0 06     
            and #$0f           ; $a717: 29 0f     
            cmp #$0f           ; $a719: c9 0f     
            bne __a722         ; $a71b: d0 05     

;-------------------------------------------------------------------------------
__a71d:     lda #$03           ; $a71d: a9 03     
            sta $025b          ; $a71f: 8d 5b 02  

;-------------------------------------------------------------------------------
__a722:     lda #$00           ; $a722: a9 00     
            sta $061f          ; $a724: 8d 1f 06  
            tax                ; $a727: aa        
__a728:     sta $0625,x        ; $a728: 9d 25 06  
            inx                ; $a72b: e8        
            cpx #$05           ; $a72c: e0 05     
            bne __a728         ; $a72e: d0 f8     
            sta $0632          ; $a730: 8d 32 06  
            sta $0633          ; $a733: 8d 33 06  
            sta $0634          ; $a736: 8d 34 06  
            lda $02c9          ; $a739: ad c9 02  
            bne __a743         ; $a73c: d0 05     
            lda #$02           ; $a73e: a9 02     
            sta $025b          ; $a740: 8d 5b 02  
__a743:     jsr __a9ec         ; $a743: 20 ec a9  
            jmp __a5dd         ; $a746: 4c dd a5  

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        pha                ; $a749: 48        
            txa                ; $a74a: 8a        
            pha                ; $a74b: 48        
            tya                ; $a74c: 98        
            pha                ; $a74d: 48        
            lda #$00           ; $a74e: a9 00     
            sta $2003          ; $a750: 8d 03 20  
            lda #$07           ; $a753: a9 07     
            sta $4014          ; $a755: 8d 14 40  
            lda $2002          ; $a758: ad 02 20  
            lda $023f          ; $a75b: ad 3f 02  
            bne __a7a8         ; $a75e: d0 48     
            lda #$00           ; $a760: a9 00     
            sta $0700          ; $a762: 8d 00 07  
__a765:     lda $2002          ; $a765: ad 02 20  
            and #$40           ; $a768: 29 40     
            bne __a765         ; $a76a: d0 f9     
            lda #$b0           ; $a76c: a9 b0     
            sta $2000          ; $a76e: 8d 00 20  
            lda #$00           ; $a771: a9 00     
            sta $2005          ; $a773: 8d 05 20  
            sta $2005          ; $a776: 8d 05 20  
            lda #$10           ; $a779: a9 10     
            sta $0700          ; $a77b: 8d 00 07  
__a77e:     lda $2002          ; $a77e: ad 02 20  
            and #$40           ; $a781: 29 40     
            beq __a77e         ; $a783: f0 f9     
            lda $28            ; $a785: a5 28     
            sta $2000          ; $a787: 8d 00 20  
            lda $29            ; $a78a: a5 29     
            sta $2a            ; $a78c: 85 2a     
            sta $2005          ; $a78e: 8d 05 20  
            lda #$00           ; $a791: a9 00     
            sta $2005          ; $a793: 8d 05 20  
            ldy $0243          ; $a796: ac 43 02  
            cpy #$03           ; $a799: c0 03     
            bcs __a7a5         ; $a79b: b0 08     
            ldx #$24           ; $a79d: a2 24     
__a79f:     dex                ; $a79f: ca        
            sta $0614,x        ; $a7a0: 9d 14 06  
            bne __a79f         ; $a7a3: d0 fa     
__a7a5:     jsr __f7c7         ; $a7a5: 20 c7 f7  
__a7a8:     lda #$00           ; $a7a8: a9 00     
            sta $023f          ; $a7aa: 8d 3f 02  
            pla                ; $a7ad: 68        
            tay                ; $a7ae: a8        
            pla                ; $a7af: 68        
            tax                ; $a7b0: aa        
            pla                ; $a7b1: 68        
            rti                ; $a7b2: 40        

;-------------------------------------------------------------------------------
__a7b3:     jsr __f4ed         ; $a7b3: 20 ed f4  
            lda #$1e           ; $a7b6: a9 1e     
            sta $2001          ; $a7b8: 8d 01 20  
            lda $0243          ; $a7bb: ad 43 02  
            beq __a7f0         ; $a7be: f0 30     
            lda #$00           ; $a7c0: a9 00     
            sta $0700          ; $a7c2: 8d 00 07  
__a7c5:     lda $2002          ; $a7c5: ad 02 20  
            and #$40           ; $a7c8: 29 40     
            bne __a7c5         ; $a7ca: d0 f9     
            lda #$b0           ; $a7cc: a9 b0     
            sta $2000          ; $a7ce: 8d 00 20  
            lda #$00           ; $a7d1: a9 00     
            sta $2005          ; $a7d3: 8d 05 20  
            sta $2005          ; $a7d6: 8d 05 20  
            lda $f9            ; $a7d9: a5 f9     
            beq __a7e0         ; $a7db: f0 03     
            jmp __a87c         ; $a7dd: 4c 7c a8  

;-------------------------------------------------------------------------------
__a7e0:     lda $04fa          ; $a7e0: ad fa 04  
            beq __a7e8         ; $a7e3: f0 03     
            dec $04fa          ; $a7e5: ce fa 04  
__a7e8:     lda $03e2          ; $a7e8: ad e2 03  
            beq __a7f0         ; $a7eb: f0 03     
            dec $03e2          ; $a7ed: ce e2 03  
__a7f0:     lda $022d          ; $a7f0: ad 2d 02  
            bne __a7fd         ; $a7f3: d0 08     
            lda $022e          ; $a7f5: ad 2e 02  
            beq __a800         ; $a7f8: f0 06     
            dec $022e          ; $a7fa: ce 2e 02  
__a7fd:     dec $022d          ; $a7fd: ce 2d 02  
__a800:     lda $022c          ; $a800: ad 2c 02  
            beq __a80b         ; $a803: f0 06     
            dec $022c          ; $a805: ce 2c 02  
            jmp __a841         ; $a808: 4c 41 a8  

;-------------------------------------------------------------------------------
__a80b:     lda $0220          ; $a80b: ad 20 02  
            bne __a818         ; $a80e: d0 08     
            lda $0221          ; $a810: ad 21 02  
            beq __a81b         ; $a813: f0 06     
            dec $0221          ; $a815: ce 21 02  
__a818:     dec $0220          ; $a818: ce 20 02  
__a81b:     lda $0225          ; $a81b: ad 25 02  
            bne __a82e         ; $a81e: d0 0e     
            lda $04f1          ; $a820: ad f1 04  
            cmp $0222          ; $a823: cd 22 02  
            bcs __a831         ; $a826: b0 09     
            lda $0224          ; $a828: ad 24 02  
            sta $0225          ; $a82b: 8d 25 02  
__a82e:     dec $0225          ; $a82e: ce 25 02  
__a831:     lda $0226          ; $a831: ad 26 02  
            bne __a83e         ; $a834: d0 08     
            lda $0227          ; $a836: ad 27 02  
            beq __a841         ; $a839: f0 06     
            dec $0227          ; $a83b: ce 27 02  
__a83e:     dec $0226          ; $a83e: ce 26 02  
__a841:     lda $025d          ; $a841: ad 5d 02  
            bne __a84e         ; $a844: d0 08     
            lda $025e          ; $a846: ad 5e 02  
            beq __a851         ; $a849: f0 06     
            dec $025e          ; $a84b: ce 5e 02  
__a84e:     dec $025d          ; $a84e: ce 5d 02  
__a851:     ldx #$0c           ; $a851: a2 0c     
__a853:     dex                ; $a853: ca        
            lda $0244,x        ; $a854: bd 44 02  
            cmp #$02           ; $a857: c9 02     
            bcc __a85e         ; $a859: 90 03     
            dec $0244,x        ; $a85b: de 44 02  
__a85e:     cpx #$00           ; $a85e: e0 00     
            bne __a853         ; $a860: d0 f1     
            lda $0291          ; $a862: ad 91 02  
            cmp #$02           ; $a865: c9 02     
            bcc __a86c         ; $a867: 90 03     
            dec $0291          ; $a869: ce 91 02  
__a86c:     lda $02de          ; $a86c: ad de 02  
            beq __a874         ; $a86f: f0 03     
            dec $02de          ; $a871: ce de 02  
__a874:     inc $04f1          ; $a874: ee f1 04  
            bne __a87c         ; $a877: d0 03     
            inc $04f2          ; $a879: ee f2 04  
__a87c:     inc $26            ; $a87c: e6 26     
            bne __a882         ; $a87e: d0 02     
            inc $27            ; $a880: e6 27     
__a882:     ldx $0243          ; $a882: ae 43 02  
            beq __a893         ; $a885: f0 0c     
            lda #$10           ; $a887: a9 10     
            sta $0700          ; $a889: 8d 00 07  
__a88c:     lda $2002          ; $a88c: ad 02 20  
            and #$40           ; $a88f: 29 40     
            beq __a88c         ; $a891: f0 f9     
__a893:     lda $28            ; $a893: a5 28     
            sta $2000          ; $a895: 8d 00 20  
            lda $29            ; $a898: a5 29     
            sta $2a            ; $a89a: 85 2a     
            sta $2005          ; $a89c: 8d 05 20  
            lda #$00           ; $a89f: a9 00     
            sta $2005          ; $a8a1: 8d 05 20  
            cpx #$03           ; $a8a4: e0 03     
            bcs __a8b0         ; $a8a6: b0 08     
            ldx #$24           ; $a8a8: a2 24     
__a8aa:     dex                ; $a8aa: ca        
            sta $0614,x        ; $a8ab: 9d 14 06  
            bne __a8aa         ; $a8ae: d0 fa     
__a8b0:     jsr __f7c7         ; $a8b0: 20 c7 f7  
            lda $2d            ; $a8b3: a5 2d     
            sta $2c            ; $a8b5: 85 2c     
            lda $2e            ; $a8b7: a5 2e     
            sta $04fe          ; $a8b9: 8d fe 04  
            lda $2f            ; $a8bc: a5 2f     
            sta $05ff          ; $a8be: 8d ff 05  
            ldx #$01           ; $a8c1: a2 01     
            stx $4016          ; $a8c3: 8e 16 40  
            dex                ; $a8c6: ca        
            stx $4016          ; $a8c7: 8e 16 40  
            ldx #$08           ; $a8ca: a2 08     
__a8cc:     lda $4016          ; $a8cc: ad 16 40  
            and #$03           ; $a8cf: 29 03     
            cmp #$01           ; $a8d1: c9 01     
            ror $2e            ; $a8d3: 66 2e     
            lda $4017          ; $a8d5: ad 17 40  
            and #$03           ; $a8d8: 29 03     
            cmp #$01           ; $a8da: c9 01     
            ror $2f            ; $a8dc: 66 2f     
            dex                ; $a8de: ca        
            bne __a8cc         ; $a8df: d0 eb     
            ldx $2e            ; $a8e1: a6 2e     
            lda $25            ; $a8e3: a5 25     
            beq __a8e9         ; $a8e5: f0 02     
            ldx $2f            ; $a8e7: a6 2f     
__a8e9:     lda $f9            ; $a8e9: a5 f9     
            beq __a8ef         ; $a8eb: f0 02     
            ldx #$00           ; $a8ed: a2 00     
__a8ef:     stx $2d            ; $a8ef: 86 2d     
            jsr __f4a9         ; $a8f1: 20 a9 f4  
            lda $0240          ; $a8f4: ad 40 02  
            eor #$80           ; $a8f7: 49 80     
            sta $0240          ; $a8f9: 8d 40 02  
            lda #$07           ; $a8fc: a9 07     
            sta $f6            ; $a8fe: 85 f6     
            lda #$00           ; $a900: a9 00     
            sta $f5            ; $a902: 85 f5     
            ldy #$04           ; $a904: a0 04     
            lda #$ef           ; $a906: a9 ef     
__a908:     sta ($f5),y        ; $a908: 91 f5     
            iny                ; $a90a: c8        
            iny                ; $a90b: c8        
            iny                ; $a90c: c8        
            iny                ; $a90d: c8        
            bne __a908         ; $a90e: d0 f8     
            rts                ; $a910: 60        

;-------------------------------------------------------------------------------
__a911:     .hex 00 00 01 03   ; $a911: 00 00 01 03   Data
            .hex 05            ; $a915: 05            Data
__a916:     .hex 03 08 05 00   ; $a916: 03 08 05 00   Data
            .hex 00            ; $a91a: 00            Data

;-------------------------------------------------------------------------------
__a91b:     lda $0243          ; $a91b: ad 43 02  
            cmp #$02           ; $a91e: c9 02     
            bcs __a923         ; $a920: b0 01     
            rts                ; $a922: 60        

;-------------------------------------------------------------------------------
__a923:     lda $022d          ; $a923: ad 2d 02  
            ora $022e          ; $a926: 0d 2e 02  
            beq __a947         ; $a929: f0 1c     
            ldx $0259          ; $a92b: ae 59 02  
            inx                ; $a92e: e8        
            txa                ; $a92f: 8a        
            ldx #$00           ; $a930: a2 00     
__a932:     sec                ; $a932: 38        
            sbc #$0a           ; $a933: e9 0a     
            bcc __a93a         ; $a935: 90 03     
            inx                ; $a937: e8        
            bne __a932         ; $a938: d0 f8     
__a93a:     cpx #$00           ; $a93a: e0 00     
            bne __a940         ; $a93c: d0 02     
            ldx #$fe           ; $a93e: a2 fe     
__a940:     stx $f7            ; $a940: 86 f7     
            clc                ; $a942: 18        
            adc #$0a           ; $a943: 69 0a     
            sta $f8            ; $a945: 85 f8     
__a947:     ldy #$00           ; $a947: a0 00     
            sty $17            ; $a949: 84 17     
            lda $02c7          ; $a94b: ad c7 02  
            beq __a957         ; $a94e: f0 07     
            lda $04f7          ; $a950: ad f7 04  
            ldx #$06           ; $a953: a2 06     
            bne __a95c         ; $a955: d0 05     
__a957:     lda $04f6          ; $a957: ad f6 04  
            ldx #$00           ; $a95a: a2 00     
__a95c:     sta $18            ; $a95c: 85 18     
            stx $19            ; $a95e: 86 19     
__a960:     lda $04,x          ; $a960: b5 04     
            lsr $17            ; $a962: 46 17     
            adc $001f,y        ; $a964: 79 1f 00  
            cmp #$0a           ; $a967: c9 0a     
            bcc __a96e         ; $a969: 90 03     
            sec                ; $a96b: 38        
            sbc #$0a           ; $a96c: e9 0a     
__a96e:     sta $04,x          ; $a96e: 95 04     
            rol $17            ; $a970: 26 17     
            inx                ; $a972: e8        
            iny                ; $a973: c8        
            cpy #$06           ; $a974: c0 06     
            bne __a960         ; $a976: d0 e8     
__a978:     lda $03,x          ; $a978: b5 03     
            cmp $000f,y        ; $a97a: d9 0f 00  
            beq __a983         ; $a97d: f0 04     
            bcs __a989         ; $a97f: b0 08     
            bcc __a992         ; $a981: 90 0f     
__a983:     dex                ; $a983: ca        
            dey                ; $a984: 88        
            bne __a978         ; $a985: d0 f1     
            beq __a992         ; $a987: f0 09     
__a989:     lda $03,x          ; $a989: b5 03     
            sta $000f,y        ; $a98b: 99 0f 00  
            dex                ; $a98e: ca        
            dey                ; $a98f: 88        
            bne __a989         ; $a990: d0 f7     
__a992:     ldx #$06           ; $a992: a2 06     
            lda #$00           ; $a994: a9 00     
__a996:     dex                ; $a996: ca        
            sta $1f,x          ; $a997: 95 1f     
            bne __a996         ; $a999: d0 fb     
            ldx $19            ; $a99b: a6 19     
            ldy $18            ; $a99d: a4 18     
            cpy #$05           ; $a99f: c0 05     
            bcs __a9d1         ; $a9a1: b0 2e     
            lda $07,x          ; $a9a3: b5 07     
            ora $06,x          ; $a9a5: 15 06     
            beq __a9d1         ; $a9a7: f0 28     
            lda $07,x          ; $a9a9: b5 07     
            cmp __a911,y       ; $a9ab: d9 11 a9  
            beq __a9b4         ; $a9ae: f0 04     
            bcs __a9bd         ; $a9b0: b0 0b     
            bcc __a9d1         ; $a9b2: 90 1d     
__a9b4:     lda $06,x          ; $a9b4: b5 06     
            cmp __a916,y       ; $a9b6: d9 16 a9  
            bcs __a9bd         ; $a9b9: b0 02     
            bcc __a9d1         ; $a9bb: 90 14     
__a9bd:     cpx #$00           ; $a9bd: e0 00     
            bne __a9c6         ; $a9bf: d0 05     
            inc $04f6          ; $a9c1: ee f6 04  
            bne __a9c9         ; $a9c4: d0 03     

;-------------------------------------------------------------------------------
__a9c6:     inc $04f7          ; $a9c6: ee f7 04  
__a9c9:     inc $02c9          ; $a9c9: ee c9 02  
            lda #$01           ; $a9cc: a9 01     
            sta $0614          ; $a9ce: 8d 14 06  
__a9d1:     lda $08,x          ; $a9d1: b5 08     
            beq __a9eb         ; $a9d3: f0 16     
            ldx $02c7          ; $a9d5: ae c7 02  
            lda $04f8,x        ; $a9d8: bd f8 04  
            bne __a9eb         ; $a9db: d0 0e     
            inc $04f8,x        ; $a9dd: fe f8 04  
            lda #$01           ; $a9e0: a9 01     
            sta $0611          ; $a9e2: 8d 11 06  
            sta $0612          ; $a9e5: 8d 12 06  
            sta $0613          ; $a9e8: 8d 13 06  
__a9eb:     rts                ; $a9eb: 60        

;-------------------------------------------------------------------------------
__a9ec:     lda $2e            ; $a9ec: a5 2e     
            eor $04fe          ; $a9ee: 4d fe 04  
            and $2e            ; $a9f1: 25 2e     
            and #$08           ; $a9f3: 29 08     
            beq __aa2f         ; $a9f5: f0 38     
            lda $f9            ; $a9f7: a5 f9     
            bne __aa29         ; $a9f9: d0 2e     
            lda $0243          ; $a9fb: ad 43 02  
            cmp #$03           ; $a9fe: c9 03     
            bne __aa2f         ; $aa00: d0 2d     
            lda $022d          ; $aa02: ad 2d 02  
            ora $022e          ; $aa05: 0d 2e 02  
            ora $0291          ; $aa08: 0d 91 02  
            ora $025b          ; $aa0b: 0d 5b 02  
            bne __aa2f         ; $aa0e: d0 1f     
            lda $03e2          ; $aa10: ad e2 03  
            cmp #$de           ; $aa13: c9 de     
            bcs __aa2f         ; $aa15: b0 18     
            lda $0244          ; $aa17: ad 44 02  
            cmp #$19           ; $aa1a: c9 19     
            bcs __aa22         ; $aa1c: b0 04     
            cmp #$02           ; $aa1e: c9 02     
            bcs __aa2f         ; $aa20: b0 0d     
__aa22:     ldx #$01           ; $aa22: a2 01     
            stx $0610          ; $aa24: 8e 10 06  
            bne __aa2b         ; $aa27: d0 02     
__aa29:     ldx #$00           ; $aa29: a2 00     
__aa2b:     stx $f9            ; $aa2b: 86 f9     
            stx $30            ; $aa2d: 86 30     
__aa2f:     rts                ; $aa2f: 60        

;-------------------------------------------------------------------------------
__aa30:     .hex 0f 30 0f 16   ; $aa30: 0f 30 0f 16   Data
            .hex 0f 29 0f 0f   ; $aa34: 0f 29 0f 0f   Data
            .hex 0f 16 0f 0f   ; $aa38: 0f 16 0f 0f   Data
            .hex 0f 28 0f 0f   ; $aa3c: 0f 28 0f 0f   Data
__aa40:     .hex 0f 30 0f 16   ; $aa40: 0f 30 0f 16   Data
            .hex 0f 27 0f 0f   ; $aa44: 0f 27 0f 0f   Data
            .hex 0f 37 0f 0f   ; $aa48: 0f 37 0f 0f   Data
            .hex 0f 16 0f 0f   ; $aa4c: 0f 16 0f 0f   Data
__aa50:     .hex 0f 30 0f 16   ; $aa50: 0f 30 0f 16   Data
            .hex 0f 07 17 0f   ; $aa54: 0f 07 17 0f   Data
            .hex 0f 29 0f 0f   ; $aa58: 0f 29 0f 0f   Data
            .hex 0f 16 0f 0f   ; $aa5c: 0f 16 0f 0f   Data
__aa60:     .hex 68            ; $aa60: 68            Data
__aa61:     .hex aa b8 ab 08   ; $aa61: aa b8 ab 08   Data
            .hex ac 53 ac 20   ; $aa65: ac 53 ac 20   Data
            .hex 00 fe 47 ff   ; $aa69: 00 fe 47 ff   Data
            .hex 01 1e 19 fe   ; $aa6d: 01 1e 19 fe   Data
            .hex fe 11 12 25   ; $aa71: fe 11 12 25   Data
            .hex 1c 0c 18 1b   ; $aa75: 1c 0c 18 1b   Data
            .hex 0e ff fe 05   ; $aa79: 0e ff fe 05   Data
            .hex ff 02 1e 19   ; $aa7d: ff 02 1e 19   Data
            .hex ff fe 0d 00   ; $aa81: ff fe 0d 00   Data
            .hex 02 fe 07 00   ; $aa85: 02 fe 07 00   Data
            .hex 02 fe 07 00   ; $aa89: 02 fe 07 00   Data
            .hex 02 fe 5b ff   ; $aa8d: 02 fe 5b ff   Data
            .hex 1a a7 a7 a7   ; $aa91: 1a a7 a7 a7   Data
            .hex a7 14 ff fe   ; $aa95: a7 14 ff fe   Data
            .hex 1b ff a7 14   ; $aa99: 1b ff a7 14   Data
            .hex 1a a7 ff fe   ; $aa9d: 1a a7 ff fe   Data
            .hex 06 ff a7 a7   ; $aaa1: 06 ff a7 a7   Data
            .hex af 21 20 f4   ; $aaa5: af 21 20 f4   Data
            .hex f5 a7 14 fe   ; $aaa9: f5 a7 14 fe   Data
            .hex a7 a7 af fe   ; $aaad: a7 a7 af fe   Data
            .hex fe fe fe f6   ; $aab1: fe fe fe f6   Data
            .hex a7 a7 fe fe   ; $aab5: a7 a7 fe fe   Data
            .hex a7 14 1a a7   ; $aab9: a7 14 1a a7   Data
            .hex ff fe 06 ff   ; $aabd: ff fe 06 ff   Data
            .hex a7 a7 a7 f9   ; $aac1: a7 a7 a7 f9   Data
            .hex fa 1a a7 a7   ; $aac5: fa 1a a7 a7   Data
            .hex 14 fe a7 a7   ; $aac9: 14 fe a7 a7   Data
            .hex a7 fe fe fe   ; $aacd: a7 fe fe fe   Data
            .hex fe a7 a7 a7   ; $aad1: fe a7 a7 a7   Data
            .hex fe fe a7 14   ; $aad5: fe fe a7 14   Data
            .hex 1a a7 ff fe   ; $aad9: 1a a7 ff fe   Data
            .hex 06 ff a7 14   ; $aadd: 06 ff a7 14   Data
            .hex a7 1a a7 1a   ; $aae1: a7 1a a7 1a   Data
            .hex a7 21 23 fe   ; $aae5: a7 21 23 fe   Data
            .hex a7 14 a7 1a   ; $aae9: a7 14 a7 1a   Data
            .hex a7 1a 14 a7   ; $aaed: a7 1a 14 a7   Data
            .hex 14 20 fe fe   ; $aaf1: 14 20 fe fe   Data
            .hex a7 14 1a a7   ; $aaf5: a7 14 1a a7   Data
            .hex ff fe 06 ff   ; $aaf9: ff fe 06 ff   Data
            .hex a7 a7 a7 1a   ; $aafd: a7 a7 a7 1a   Data
            .hex a7 1a a7 a7   ; $ab01: a7 1a a7 a7   Data
            .hex 14 fe a7 a7   ; $ab05: 14 fe a7 a7   Data
            .hex a7 1a a7 a7   ; $ab09: a7 1a a7 a7   Data
            .hex 14 a7 a7 a7   ; $ab0d: 14 a7 a7 a7   Data
            .hex fe fe a7 14   ; $ab11: fe fe a7 14   Data
            .hex 1a a7 ff fe   ; $ab15: 1a a7 ff fe   Data
            .hex 06 ff a7 a7   ; $ab19: 06 ff a7 a7   Data
            .hex e7 1a a7 f7   ; $ab1d: e7 1a a7 f7   Data
            .hex f8 a7 14 fe   ; $ab21: f8 a7 14 fe   Data
            .hex a7 a7 e7 f7   ; $ab25: a7 a7 e7 f7   Data
            .hex f8 a7 14 13   ; $ab29: f8 a7 14 13   Data
            .hex a7 a7 fe 1a   ; $ab2d: a7 a7 fe 1a   Data
            .hex a7 a7 a7 a7   ; $ab31: a7 a7 a7 a7   Data
            .hex 14 ff fe 6d   ; $ab35: 14 ff fe 6d   Data
            .hex ff 01 fe 19   ; $ab39: ff 01 fe 19   Data
            .hex 15 0a 22 0e   ; $ab3d: 15 0a 22 0e   Data
            .hex 1b ff fe 38   ; $ab41: 1b ff fe 38   Data
            .hex ff 02 fe 19   ; $ab45: ff 02 fe 19   Data
            .hex 15 0a 22 0e   ; $ab49: 15 0a 22 0e   Data
            .hex 1b 1c ff fe   ; $ab4d: 1b 1c ff fe   Data
            .hex 4c ff ff 22   ; $ab51: 4c ff ff 22   Data
            .hex a0 fe 0b ff   ; $ab55: a0 fe 0b ff   Data
            .hex 27 28 29 2a   ; $ab59: 27 28 29 2a   Data
            .hex 2b 2c 2d 2e   ; $ab5d: 2b 2c 2d 2e   Data
            .hex 2f ff fe 51   ; $ab61: 2f ff fe 51   Data
            .hex ff 26 fe 01   ; $ab65: ff 26 fe 01   Data
            .hex 09 08 02 fe   ; $ab69: 09 08 02 fe   Data
            .hex 01 09 08 06   ; $ab6d: 01 09 08 06   Data
            .hex fe 17 0a 16   ; $ab71: fe 17 0a 16   Data
            .hex 0c 18 fe 15   ; $ab75: 0c 18 fe 15   Data
            .hex 1d 0d 24 ff   ; $ab79: 1d 0d 24 ff   Data
            .hex fe 2c ff 0a   ; $ab7d: fe 2c ff 0a   Data
            .hex 15 15 fe 1b   ; $ab81: 15 15 fe 1b   Data
            .hex 12 10 11 1d   ; $ab85: 12 10 11 1d   Data
            .hex 1c fe 1b 0e   ; $ab89: 1c fe 1b 0e   Data
            .hex 1c 0e 1b 1f   ; $ab8d: 1c 0e 1b 1f   Data
            .hex 0e 0d ff fe   ; $ab91: 0e 0d ff fe   Data
            .hex 66 00 0e a0   ; $ab95: 66 00 0e a0   Data
            .hex 02 55 06 aa   ; $ab99: 02 55 06 aa   Data
            .hex 02 0f 06 0a   ; $ab9d: 02 0f 06 0a   Data
            .hex 02 00 20 ff   ; $aba1: 02 00 20 ff   Data
            .hex ff 24 00 fe   ; $aba5: ff 24 00 fe   Data
            .hex f0 fe f0 fe   ; $aba9: f0 fe f0 fe   Data
            .hex f0 fe f0 ff   ; $abad: f0 fe f0 ff   Data
            .hex ff 27 c0 00   ; $abb1: ff 27 c0 00   Data
            .hex 40 ff ff 20   ; $abb5: 40 ff ff 20   Data
            .hex 57 ff 1b 0d   ; $abb9: 57 ff 1b 0d   Data
            .hex ff fe 10 00   ; $abbd: ff fe 10 00   Data
            .hex 02 fe 07 00   ; $abc1: 02 fe 07 00   Data
            .hex 02 fe f9 ff   ; $abc5: 02 fe f9 ff   Data
            .hex 1b 0e 0a 0d   ; $abc9: 1b 0e 0a 0d   Data
            .hex 22 ff fe 3a   ; $abcd: 22 ff fe 3a   Data
            .hex ff 19 15 0a   ; $abd1: ff 19 15 0a   Data
            .hex 22 0e 1b ff   ; $abd5: 22 0e 1b ff   Data
            .hex fe 3a ff 1b   ; $abd9: fe 3a ff 1b   Data
            .hex 18 1e 17 0d   ; $abdd: 18 1e 17 0d   Data
            .hex ff fe e0 fe   ; $abe1: ff fe e0 fe   Data
            .hex ef ff ff 23   ; $abe5: ef ff ff 23   Data
            .hex c0 00 10 f0   ; $abe9: c0 00 10 f0   Data
            .hex 08 55 08 aa   ; $abed: 08 55 08 aa   Data
            .hex 08 00 18 ff   ; $abf1: 08 00 18 ff   Data
            .hex ff 24 00 fe   ; $abf5: ff 24 00 fe   Data
            .hex f0 fe f0 fe   ; $abf9: f0 fe f0 fe   Data
            .hex f0 fe f0 ff   ; $abfd: f0 fe f0 ff   Data
            .hex ff 27 c0 00   ; $ac01: ff 27 c0 00   Data
            .hex 40 ff ff 20   ; $ac05: 40 ff ff 20   Data
            .hex 80 fe f0 fe   ; $ac09: 80 fe f0 fe   Data
            .hex 3c ff 19 15   ; $ac0d: 3c ff 19 15   Data
            .hex 0a 22 0e 1b   ; $ac11: 0a 22 0e 1b   Data
            .hex ff fe 3a ff   ; $ac15: ff fe 3a ff   Data
            .hex 1b 18 1e 17   ; $ac19: 1b 18 1e 17   Data
            .hex 0d ff fe 5a   ; $ac1d: 0d ff fe 5a   Data
            .hex ff 10 0a 16   ; $ac21: ff 10 0a 16   Data
            .hex 0e fe fe 18   ; $ac25: 0e fe fe 18   Data
            .hex 1f 0e 1b ff   ; $ac29: 1f 0e 1b ff   Data
            .hex fe f0 fe 7b   ; $ac2d: fe f0 fe 7b   Data
            .hex ff ff 23 c0   ; $ac31: ff ff 23 c0   Data
            .hex 00 10 f0 08   ; $ac35: 00 10 f0 08   Data
            .hex 55 08 aa 08   ; $ac39: 55 08 aa 08   Data
            .hex 00 18 ff ff   ; $ac3d: 00 18 ff ff   Data
            .hex 24 00 fe f0   ; $ac41: 24 00 fe f0   Data
            .hex fe f0 fe f0   ; $ac45: fe f0 fe f0   Data
            .hex fe f0 ff ff   ; $ac49: fe f0 ff ff   Data
            .hex 27 c0 00 40   ; $ac4d: 27 c0 00 40   Data
            .hex ff ff 20 80   ; $ac51: ff ff 20 80   Data
            .hex fe c9 ff 0d   ; $ac55: fe c9 ff 0d   Data
            .hex 12 10 0d 1e   ; $ac59: 12 10 0d 1e   Data
            .hex 10 fe 1d 11   ; $ac5d: 10 fe 1d 11   Data
            .hex 0e 0a 1d 0e   ; $ac61: 0e 0a 1d 0e   Data
            .hex 1b ff fe 89   ; $ac65: 1b ff fe 89   Data
            .hex fe f0 fe f0   ; $ac69: fe f0 fe f0   Data
            .hex ff ff 23 c0   ; $ac6d: ff ff 23 c0   Data
            .hex 00 12 a0 04   ; $ac71: 00 12 a0 04   Data
            .hex 00 2a ff ff   ; $ac75: 00 2a ff ff   Data
            .hex 24 00 fe f0   ; $ac79: 24 00 fe f0   Data
            .hex fe f0 fe f0   ; $ac7d: fe f0 fe f0   Data
            .hex fe f0 ff ff   ; $ac81: fe f0 ff ff   Data
            .hex 27 c0 00 40   ; $ac85: 27 c0 00 40   Data
            .hex ff ff         ; $ac89: ff ff         Data

;-------------------------------------------------------------------------------
__ac8b:     ldx $02db          ; $ac8b: ae db 02  
            beq __ac91         ; $ac8e: f0 01     
            rts                ; $ac90: 60        

;-------------------------------------------------------------------------------
__ac91:     lda $28            ; $ac91: a5 28     
            and #$7b           ; $ac93: 29 7b     
            sta $2000          ; $ac95: 8d 00 20  
__ac98:     lda $2002          ; $ac98: ad 02 20  
            bpl __ac98         ; $ac9b: 10 fb     
            ldy #$00           ; $ac9d: a0 00     
            sty $2001          ; $ac9f: 8c 01 20  
            lda #$3f           ; $aca2: a9 3f     
            sta $2006          ; $aca4: 8d 06 20  
            lda #$00           ; $aca7: a9 00     
            sta $2006          ; $aca9: 8d 06 20  
__acac:     cpx #$10           ; $acac: e0 10     
            bcs __acc8         ; $acae: b0 18     
            lda $025b          ; $acb0: ad 5b 02  
            beq __acbe         ; $acb3: f0 09     
            cmp #$03           ; $acb5: c9 03     
            beq __acc3         ; $acb7: f0 0a     
            lda __aa30,x       ; $acb9: bd 30 aa  
            bne __accb         ; $acbc: d0 0d     
__acbe:     lda __aa40,x       ; $acbe: bd 40 aa  
            bne __accb         ; $acc1: d0 08     

;-------------------------------------------------------------------------------
__acc3:     lda __aa50,x       ; $acc3: bd 50 aa  
            bne __accb         ; $acc6: d0 03     

;-------------------------------------------------------------------------------
__acc8:     lda $0200,x        ; $acc8: bd 00 02  
__accb:     sta $2007          ; $accb: 8d 07 20  
            inx                ; $acce: e8        
            cpx #$20           ; $accf: e0 20     
            bne __acac         ; $acd1: d0 d9     
            jsr __b981         ; $acd3: 20 81 b9  
            lda $025b          ; $acd6: ad 5b 02  
            asl                ; $acd9: 0a        
            tay                ; $acda: a8        
            lda __aa60,y       ; $acdb: b9 60 aa  
            sta $1b            ; $acde: 85 1b     
            lda __aa61,y       ; $ace0: b9 61 aa  
            sta $1c            ; $ace3: 85 1c     
            ldx #$04           ; $ace5: a2 04     
__ace7:     ldy #$00           ; $ace7: a0 00     
            lda #$00           ; $ace9: a9 00     
            sta $17            ; $aceb: 85 17     
            lda ($1b),y        ; $aced: b1 1b     
            sta $2006          ; $acef: 8d 06 20  
            iny                ; $acf2: c8        
            lda ($1b),y        ; $acf3: b1 1b     
            sta $2006          ; $acf5: 8d 06 20  
__acf8:     lda #$00           ; $acf8: a9 00     
            sta $18            ; $acfa: 85 18     
__acfc:     iny                ; $acfc: c8        
            lda ($1b),y        ; $acfd: b1 1b     
            eor #$ff           ; $acff: 49 ff     
            bne __ad0c         ; $ad01: d0 09     
            iny                ; $ad03: c8        
            lda ($1b),y        ; $ad04: b1 1b     
            eor #$ff           ; $ad06: 49 ff     
            beq __ad2c         ; $ad08: f0 22     
            inc $17            ; $ad0a: e6 17     
__ad0c:     lda $17            ; $ad0c: a5 17     
            and #$01           ; $ad0e: 29 01     
            beq __ad1a         ; $ad10: f0 08     
            lda ($1b),y        ; $ad12: b1 1b     
            sta $2007          ; $ad14: 8d 07 20  
            jmp __acfc         ; $ad17: 4c fc ac  

;-------------------------------------------------------------------------------
__ad1a:     iny                ; $ad1a: c8        
            lda ($1b),y        ; $ad1b: b1 1b     
            cmp $18            ; $ad1d: c5 18     
            beq __acf8         ; $ad1f: f0 d7     
            inc $18            ; $ad21: e6 18     
            dey                ; $ad23: 88        
            lda ($1b),y        ; $ad24: b1 1b     
            sta $2007          ; $ad26: 8d 07 20  
            jmp __ad1a         ; $ad29: 4c 1a ad  

;-------------------------------------------------------------------------------
__ad2c:     iny                ; $ad2c: c8        
            tya                ; $ad2d: 98        
            clc                ; $ad2e: 18        
            adc $1b            ; $ad2f: 65 1b     
            sta $1b            ; $ad31: 85 1b     
            bcc __ad37         ; $ad33: 90 02     
            inc $1c            ; $ad35: e6 1c     
__ad37:     dex                ; $ad37: ca        
            bne __ace7         ; $ad38: d0 ad     
            lda $025b          ; $ad3a: ad 5b 02  
            bne __ad42         ; $ad3d: d0 03     
            jmp __addf         ; $ad3f: 4c df ad  

;-------------------------------------------------------------------------------
__ad42:     lda #$20           ; $ad42: a9 20     
            sta $2006          ; $ad44: 8d 06 20  
            lda #$47           ; $ad47: a9 47     
            sta $2006          ; $ad49: 8d 06 20  
            ldx $02c7          ; $ad4c: ae c7 02  
            inx                ; $ad4f: e8        
            stx $2007          ; $ad50: 8e 07 20  
            lda $025b          ; $ad53: ad 5b 02  
            cmp #$03           ; $ad56: c9 03     
            beq __ad67         ; $ad58: f0 0d     
            lda #$21           ; $ad5a: a9 21     
            sta $2006          ; $ad5c: 8d 06 20  
            lda #$b3           ; $ad5f: a9 b3     
            sta $2006          ; $ad61: 8d 06 20  
            stx $2007          ; $ad64: 8e 07 20  
__ad67:     ldy #$20           ; $ad67: a0 20     
            sty $2006          ; $ad69: 8c 06 20  
            ldy #$5a           ; $ad6c: a0 5a     
            sty $2006          ; $ad6e: 8c 06 20  
            lda $0243          ; $ad71: ad 43 02  
            cmp #$02           ; $ad74: c9 02     
            bcc __ad94         ; $ad76: 90 1c     
            ldx $0259          ; $ad78: ae 59 02  
            inx                ; $ad7b: e8        
            txa                ; $ad7c: 8a        
            ldx #$00           ; $ad7d: a2 00     
__ad7f:     sec                ; $ad7f: 38        
            sbc #$0a           ; $ad80: e9 0a     
            bcc __ad87         ; $ad82: 90 03     
            inx                ; $ad84: e8        
            bne __ad7f         ; $ad85: d0 f8     
__ad87:     cpx #$00           ; $ad87: e0 00     
            bne __ad8d         ; $ad89: d0 02     
            ldx #$fe           ; $ad8b: a2 fe     
__ad8d:     stx $f7            ; $ad8d: 86 f7     
            clc                ; $ad8f: 18        
            adc #$0a           ; $ad90: 69 0a     
            sta $f8            ; $ad92: 85 f8     
__ad94:     ldx $f7            ; $ad94: a6 f7     
            stx $2007          ; $ad96: 8e 07 20  
            lda $f8            ; $ad99: a5 f8     
            sta $2007          ; $ad9b: 8d 07 20  
            ldy $025b          ; $ad9e: ac 5b 02  
            beq __adb7         ; $ada1: f0 14     
            cpy #$03           ; $ada3: c0 03     
            beq __adb7         ; $ada5: f0 10     
            ldy #$21           ; $ada7: a0 21     
            sty $2006          ; $ada9: 8c 06 20  
            ldy #$f2           ; $adac: a0 f2     
            sty $2006          ; $adae: 8c 06 20  
            stx $2007          ; $adb1: 8e 07 20  
            sta $2007          ; $adb4: 8d 07 20  
__adb7:     lda $0243          ; $adb7: ad 43 02  
            cmp #$02           ; $adba: c9 02     
            bcc __ae12         ; $adbc: 90 54     
            ldy #$20           ; $adbe: a0 20     
            sty $2006          ; $adc0: 8c 06 20  
            ldy #$74           ; $adc3: a0 74     
            sty $2006          ; $adc5: 8c 06 20  
            ldx #$08           ; $adc8: a2 08     
__adca:     dex                ; $adca: ca        
            cpx $02c9          ; $adcb: ec c9 02  
            bcs __add4         ; $adce: b0 04     
            lda #$0f           ; $add0: a9 0f     
            bne __add6         ; $add2: d0 02     
__add4:     lda #$fe           ; $add4: a9 fe     
__add6:     sta $2007          ; $add6: 8d 07 20  
            cpx #$00           ; $add9: e0 00     
            bne __adca         ; $addb: d0 ed     
            beq __ae12         ; $addd: f0 33     
__addf:     lda #$20           ; $addf: a9 20     
            sta $2006          ; $ade1: 8d 06 20  
            lda #$63           ; $ade4: a9 63     
            sta $2006          ; $ade6: 8d 06 20  
            lda #$00           ; $ade9: a9 00     
            sta $18            ; $adeb: 85 18     
            jsr __f656         ; $aded: 20 56 f6  
            lda #$20           ; $adf0: a9 20     
            sta $2006          ; $adf2: 8d 06 20  
            lda #$6c           ; $adf5: a9 6c     
            sta $2006          ; $adf7: 8d 06 20  
            lda #$0c           ; $adfa: a9 0c     
            sta $18            ; $adfc: 85 18     
            jsr __f656         ; $adfe: 20 56 f6  
            lda #$20           ; $ae01: a9 20     
            sta $2006          ; $ae03: 8d 06 20  
            lda #$75           ; $ae06: a9 75     
            sta $2006          ; $ae08: 8d 06 20  
            lda #$06           ; $ae0b: a9 06     
            sta $18            ; $ae0d: 85 18     
            jsr __f656         ; $ae0f: 20 56 f6  
__ae12:     inc $02db          ; $ae12: ee db 02  
__ae15:     lda $2002          ; $ae15: ad 02 20  
            bpl __ae15         ; $ae18: 10 fb     
            lda #$00           ; $ae1a: a9 00     
            sta $29            ; $ae1c: 85 29     
            lda $28            ; $ae1e: a5 28     
            sta $2000          ; $ae20: 8d 00 20  
            rts                ; $ae23: 60        

;-------------------------------------------------------------------------------
__ae24:     .hex c0 30 0c 03   ; $ae24: c0 30 0c 03   Data

;-------------------------------------------------------------------------------
__ae28:     lda $022f          ; $ae28: ad 2f 02  
            ora $02db          ; $ae2b: 0d db 02  
            beq __ae31         ; $ae2e: f0 01     
            rts                ; $ae30: 60        

;-------------------------------------------------------------------------------
__ae31:     lda $0259          ; $ae31: ad 59 02  
            asl                ; $ae34: 0a        
            tay                ; $ae35: a8        
            lda __8000,y       ; $ae36: b9 00 80  
            sta $19            ; $ae39: 85 19     
            lda __8001,y       ; $ae3b: b9 01 80  
            sta $1a            ; $ae3e: 85 1a     
            ldx #$00           ; $ae40: a2 00     
            ldy #$00           ; $ae42: a0 00     
            sty $f4            ; $ae44: 84 f4     
__ae46:     cpx #$09           ; $ae46: e0 09     
            bcc __ae53         ; $ae48: 90 09     
            cpx #$70           ; $ae4a: e0 70     
            bcs __ae53         ; $ae4c: b0 05     
            txa                ; $ae4e: 8a        
            and #$07           ; $ae4f: 29 07     
            bne __ae5a         ; $ae51: d0 07     
__ae53:     lda #$81           ; $ae53: a9 81     
            sta $0400,x        ; $ae55: 9d 00 04  
            bne __ae60         ; $ae58: d0 06     
__ae5a:     lda ($19),y        ; $ae5a: b1 19     
            sta $0400,x        ; $ae5c: 9d 00 04  
            iny                ; $ae5f: c8        
__ae60:     inx                ; $ae60: e8        
            cpx #$80           ; $ae61: e0 80     
            bne __ae46         ; $ae63: d0 e1     
            ldx #$00           ; $ae65: a2 00     
            stx $17            ; $ae67: 86 17     
__ae69:     cpx #$09           ; $ae69: e0 09     
            bcc __aeac         ; $ae6b: 90 3f     
            cpx #$66           ; $ae6d: e0 66     
            bcs __aeac         ; $ae6f: b0 3b     
            txa                ; $ae71: 8a        
            and #$07           ; $ae72: 29 07     
            beq __aeac         ; $ae74: f0 36     
            and #$06           ; $ae76: 29 06     
            cmp #$06           ; $ae78: c9 06     
            beq __aeac         ; $ae7a: f0 30     
            lda ($19),y        ; $ae7c: b1 19     
            sty $18            ; $ae7e: 84 18     
            ldy $17            ; $ae80: a4 17     
            and __ae24,y       ; $ae82: 39 24 ae  
            cpy #$00           ; $ae85: c0 00     
            beq __ae97         ; $ae87: f0 0e     
            cpy #$01           ; $ae89: c0 01     
            beq __ae99         ; $ae8b: f0 0c     
            cpy #$02           ; $ae8d: c0 02     
            beq __ae93         ; $ae8f: f0 02     
            asl                ; $ae91: 0a        
            asl                ; $ae92: 0a        
__ae93:     asl                ; $ae93: 0a        
            asl                ; $ae94: 0a        
            bpl __ae99         ; $ae95: 10 02     
__ae97:     lsr                ; $ae97: 4a        
            lsr                ; $ae98: 4a        
__ae99:     sta $0480,x        ; $ae99: 9d 80 04  
            inc $17            ; $ae9c: e6 17     
            cpy #$03           ; $ae9e: c0 03     
            bne __aea8         ; $aea0: d0 06     
            lda #$00           ; $aea2: a9 00     
            sta $17            ; $aea4: 85 17     
            inc $18            ; $aea6: e6 18     
__aea8:     ldy $18            ; $aea8: a4 18     
            bne __aeb1         ; $aeaa: d0 05     
__aeac:     lda #$30           ; $aeac: a9 30     
            sta $0480,x        ; $aeae: 9d 80 04  
__aeb1:     inx                ; $aeb1: e8        
            cpx #$6f           ; $aeb2: e0 6f     
            bne __ae69         ; $aeb4: d0 b3     
            jsr __af39         ; $aeb6: 20 39 af  
            jsr __b8cc         ; $aeb9: 20 cc b8  
            jsr __b992         ; $aebc: 20 92 b9  
            ldx #$0b           ; $aebf: a2 0b     
            lda #$00           ; $aec1: a9 00     
            sta $025c          ; $aec3: 8d 5c 02  
            sta $04fd          ; $aec6: 8d fd 04  
__aec9:     dex                ; $aec9: ca        
            sta $0245,x        ; $aeca: 9d 45 02  
            sta $02b1,x        ; $aecd: 9d b1 02  
            bne __aec9         ; $aed0: d0 f7     
            jsr __d7af         ; $aed2: 20 af d7  
            lda #$04           ; $aed5: a9 04     
            sta $029a          ; $aed7: 8d 9a 02  
            rts                ; $aeda: 60        

;-------------------------------------------------------------------------------
__aedb:     lda $022f          ; $aedb: ad 2f 02  
            beq __aef0         ; $aede: f0 10     
            lda $02db          ; $aee0: ad db 02  
            bne __aef0         ; $aee3: d0 0b     
            sta $f4            ; $aee5: 85 f4     
            jsr __af39         ; $aee7: 20 39 af  
            jsr __b992         ; $aeea: 20 92 b9  
            jsr __d7af         ; $aeed: 20 af d7  
__aef0:     rts                ; $aef0: 60        

;-------------------------------------------------------------------------------
__aef1:     .hex 29 29 29 29   ; $aef1: 29 29 29 29   Data
            .hex 10 10 10 10   ; $aef5: 10 10 10 10   Data
__aef9:     .hex 10 10 10 10   ; $aef9: 10 10 10 10   Data
            .hex 29 29 29 29   ; $aefd: 29 29 29 29   Data
__af01:     .hex 12 12 02 0f   ; $af01: 12 12 02 0f   Data
            .hex 12 12 02 0f   ; $af05: 12 12 02 0f   Data
__af09:     .hex 20 30 30 30   ; $af09: 20 30 30 30   Data
            .hex 30 30 30 30   ; $af0d: 30 30 30 30   Data
            .hex 30 28 28 28   ; $af11: 30 28 28 28   Data
            .hex 28 26 26 28   ; $af15: 28 26 26 28   Data
__af19:     .hex 23 16 13 16   ; $af19: 23 16 13 16   Data
            .hex 16 16 16 14   ; $af1d: 16 16 16 14   Data
            .hex 14 26 26 26   ; $af21: 14 26 26 26   Data
            .hex 26 07 07 16   ; $af25: 26 07 07 16   Data
__af29:     .hex 19 36 0c 19   ; $af29: 19 36 0c 19   Data
            .hex 19 19 19 07   ; $af2d: 19 19 19 07   Data
            .hex 07 17 17 19   ; $af31: 07 17 17 19   Data
            .hex 19 19 19 3c   ; $af35: 19 19 19 3c   Data

;-------------------------------------------------------------------------------
__af39:     lda #$30           ; $af39: a9 30     
            sta $2000          ; $af3b: 8d 00 20  
__af3e:     lda $2002          ; $af3e: ad 02 20  
            bpl __af3e         ; $af41: 10 fb     
            ldx #$00           ; $af43: a2 00     
            stx $2001          ; $af45: 8e 01 20  
            lda $0259          ; $af48: ad 59 02  
            and #$1f           ; $af4b: 29 1f     
            lsr                ; $af4d: 4a        
            lsr                ; $af4e: 4a        
            tay                ; $af4f: a8        
            lda #$3f           ; $af50: a9 3f     
            sta $2006          ; $af52: 8d 06 20  
            lda #$00           ; $af55: a9 00     
            sta $2006          ; $af57: 8d 06 20  
__af5a:     stx $17            ; $af5a: 86 17     
            lda $0200,x        ; $af5c: bd 00 02  
            cpx #$07           ; $af5f: e0 07     
            bne __af75         ; $af61: d0 12     
            ldx $02c7          ; $af63: ae c7 02  
            lda $05f5,x        ; $af66: bd f5 05  
            bne __af70         ; $af69: d0 05     
            lda __aef1,y       ; $af6b: b9 f1 ae  
            bne __af7c         ; $af6e: d0 0c     

;-------------------------------------------------------------------------------
__af70:     lda __aef9,y       ; $af70: b9 f9 ae  
            bne __af7c         ; $af73: d0 07     

;-------------------------------------------------------------------------------
__af75:     cmp #$0f           ; $af75: c9 0f     
            bne __af7c         ; $af77: d0 03     
            lda __af01,y       ; $af79: b9 01 af  
__af7c:     sta $2007          ; $af7c: 8d 07 20  
            ldx $17            ; $af7f: a6 17     
            inx                ; $af81: e8        
            cpx #$1d           ; $af82: e0 1d     
            bne __af5a         ; $af84: d0 d4     
            lda $0259          ; $af86: ad 59 02  
            and #$1f           ; $af89: 29 1f     
            tay                ; $af8b: a8        
            cpy #$10           ; $af8c: c0 10     
            bcc __af92         ; $af8e: 90 02     
            ldy #$0f           ; $af90: a0 0f     
__af92:     lda __af09,y       ; $af92: b9 09 af  
            sta $2007          ; $af95: 8d 07 20  
            lda __af19,y       ; $af98: b9 19 af  
            sta $2007          ; $af9b: 8d 07 20  
            lda __af29,y       ; $af9e: b9 29 af  
            sta $2007          ; $afa1: 8d 07 20  
            jsr __b981         ; $afa4: 20 81 b9  
            lda #$34           ; $afa7: a9 34     
            sta $2000          ; $afa9: 8d 00 20  
            ldx #$01           ; $afac: a2 01     
__afae:     stx $f1            ; $afae: 86 f1     
            jsr __affc         ; $afb0: 20 fc af  
            jsr __b87d         ; $afb3: 20 7d b8  
            jsr __f3a3         ; $afb6: 20 a3 f3  
__afb9:     inx                ; $afb9: e8        
            cpx #$80           ; $afba: e0 80     
            beq __afc5         ; $afbc: f0 07     
            txa                ; $afbe: 8a        
            and #$07           ; $afbf: 29 07     
            beq __afb9         ; $afc1: f0 f6     
            bne __afae         ; $afc3: d0 e9     
__afc5:     lda #$30           ; $afc5: a9 30     
            sta $2000          ; $afc7: 8d 00 20  
            ldy #$00           ; $afca: a0 00     
            ldx #$00           ; $afcc: a2 00     
            stx $f4            ; $afce: 86 f4     
__afd0:     stx $f1            ; $afd0: 86 f1     
            jsr __d6ef         ; $afd2: 20 ef d6  
            lda $0260          ; $afd5: ad 60 02  
            sta $2006          ; $afd8: 8d 06 20  
            lda $0270          ; $afdb: ad 70 02  
            sta $2006          ; $afde: 8d 06 20  
            txa                ; $afe1: 8a        
            and #$07           ; $afe2: 29 07     
            bne __afeb         ; $afe4: d0 05     
            sta $2007          ; $afe6: 8d 07 20  
            beq __aff1         ; $afe9: f0 06     
__afeb:     lda $0280          ; $afeb: ad 80 02  
            sta $2007          ; $afee: 8d 07 20  
__aff1:     inx                ; $aff1: e8        
            cpx #$80           ; $aff2: e0 80     
            bne __afd0         ; $aff4: d0 da     
            lda #$00           ; $aff6: a9 00     
            sta $0260          ; $aff8: 8d 60 02  
            rts                ; $affb: 60        

;-------------------------------------------------------------------------------
__affc:     txa                ; $affc: 8a        
            pha                ; $affd: 48        
            tya                ; $affe: 98        
            pha                ; $afff: 48        
            ldx $f4            ; $b000: a6 f4     
            lda #$00           ; $b002: a9 00     
            sta $fa,x          ; $b004: 95 fa     
            lda $f1,x          ; $b006: b5 f1     
            and #$38           ; $b008: 29 38     
            sta $18            ; $b00a: 85 18     
            lda $f1,x          ; $b00c: b5 f1     
            and #$07           ; $b00e: 29 07     
            lsr                ; $b010: 4a        
            ror $18            ; $b011: 66 18     
            ldy $f1,x          ; $b013: b4 f1     
            cpy #$40           ; $b015: c0 40     
            bcc __b01c         ; $b017: 90 03     
            clc                ; $b019: 18        
            adc #$04           ; $b01a: 69 04     
__b01c:     clc                ; $b01c: 18        
            adc #$20           ; $b01d: 69 20     
            sta $9d,x          ; $b01f: 95 9d     
            lda $18            ; $b021: a5 18     
            clc                ; $b023: 18        
            adc #$02           ; $b024: 69 02     
            sta $a7,x          ; $b026: 95 a7     
            lda $9d,x          ; $b028: b5 9d     
            and #$03           ; $b02a: 29 03     
            cmp #$03           ; $b02c: c9 03     
            bne __b038         ; $b02e: d0 08     
            lda $a7,x          ; $b030: b5 a7     
            cmp #$80           ; $b032: c9 80     
            bcc __b038         ; $b034: 90 02     
            inc $fa,x          ; $b036: f6 fa     
__b038:     pla                ; $b038: 68        
            tay                ; $b039: a8        
            pla                ; $b03a: 68        
            tax                ; $b03b: aa        
            rts                ; $b03c: 60        

;-------------------------------------------------------------------------------
__b03d:     .hex 3d            ; $b03d: 3d            Data
__b03e:     .hex b2 4d b2 5d   ; $b03e: b2 4d b2 5d   Data
            .hex b2 6d b2 7d   ; $b042: b2 6d b2 7d   Data
            .hex b2 8d b2 9d   ; $b046: b2 8d b2 9d   Data
            .hex b2 ad b2 bd   ; $b04a: b2 ad b2 bd   Data
            .hex b2 cd b2 dd   ; $b04e: b2 cd b2 dd   Data
            .hex b2 ed b2 fd   ; $b052: b2 ed b2 fd   Data
            .hex b2 0d b3 1d   ; $b056: b2 0d b3 1d   Data
            .hex b3 2d b3 3d   ; $b05a: b3 2d b3 3d   Data
            .hex b3 3d b3 4d   ; $b05e: b3 3d b3 4d   Data
            .hex b3 4d b3 5d   ; $b062: b3 4d b3 5d   Data
            .hex b3 5d b3 6d   ; $b066: b3 5d b3 6d   Data
            .hex b3 6d b3 7d   ; $b06a: b3 6d b3 7d   Data
            .hex b3 7d b3 8d   ; $b06e: b3 7d b3 8d   Data
            .hex b3 8d b3 9d   ; $b072: b3 8d b3 9d   Data
            .hex b3 9d b3 ad   ; $b076: b3 9d b3 ad   Data
            .hex b3 ad b3 bd   ; $b07a: b3 ad b3 bd   Data
            .hex b3 cd b3 bd   ; $b07e: b3 cd b3 bd   Data
            .hex b3 cd b3 dd   ; $b082: b3 cd b3 dd   Data
            .hex b3 ed b3 dd   ; $b086: b3 ed b3 dd   Data
            .hex b3 ed b3 fd   ; $b08a: b3 ed b3 fd   Data
            .hex b3 0d b4 fd   ; $b08e: b3 0d b4 fd   Data
            .hex b3 0d b4 1d   ; $b092: b3 0d b4 1d   Data
            .hex b4 2d b4 1d   ; $b096: b4 2d b4 1d   Data
            .hex b4 2d b4 3d   ; $b09a: b4 2d b4 3d   Data
            .hex b4 3d b4 3d   ; $b09e: b4 3d b4 3d   Data
            .hex b4 3d b4 4d   ; $b0a2: b4 3d b4 4d   Data
            .hex b4 4d b4 4d   ; $b0a6: b4 4d b4 4d   Data
            .hex b4 4d b4 5d   ; $b0aa: b4 4d b4 5d   Data
            .hex b4 5d b4 5d   ; $b0ae: b4 5d b4 5d   Data
            .hex b4 5d b4 6d   ; $b0b2: b4 5d b4 6d   Data
            .hex b4 6d b4 6d   ; $b0b6: b4 6d b4 6d   Data
            .hex b4 6d b4 7d   ; $b0ba: b4 6d b4 7d   Data
            .hex b4 8d b4 9d   ; $b0be: b4 8d b4 9d   Data
            .hex b4 ad b4 7d   ; $b0c2: b4 ad b4 7d   Data
            .hex b4 8d b4 9d   ; $b0c6: b4 8d b4 9d   Data
            .hex b4 ad b4 bd   ; $b0ca: b4 ad b4 bd   Data
            .hex b4 cd b4 dd   ; $b0ce: b4 cd b4 dd   Data
            .hex b4 ed b4 bd   ; $b0d2: b4 ed b4 bd   Data
            .hex b4 cd b4 dd   ; $b0d6: b4 cd b4 dd   Data
            .hex b4 ed b4 fd   ; $b0da: b4 ed b4 fd   Data
            .hex b4 fd b4 0d   ; $b0de: b4 fd b4 0d   Data
            .hex b5 0d b5 fd   ; $b0e2: b5 0d b5 fd   Data
            .hex b4 fd b4 0d   ; $b0e6: b4 fd b4 0d   Data
            .hex b5 0d b5 1d   ; $b0ea: b5 0d b5 1d   Data
            .hex b5 1d b5 2d   ; $b0ee: b5 1d b5 2d   Data
            .hex b5 2d b5 1d   ; $b0f2: b5 2d b5 1d   Data
            .hex b5 1d b5 2d   ; $b0f6: b5 1d b5 2d   Data
            .hex b5 2d b5 3d   ; $b0fa: b5 2d b5 3d   Data
            .hex b5 4d b5 3d   ; $b0fe: b5 4d b5 3d   Data
            .hex b5 4d b5 3d   ; $b102: b5 4d b5 3d   Data
            .hex b5 4d b5 3d   ; $b106: b5 4d b5 3d   Data
            .hex b5 4d b5 5d   ; $b10a: b5 4d b5 5d   Data
            .hex b5 6d b5 5d   ; $b10e: b5 6d b5 5d   Data
            .hex b5 6d b5 5d   ; $b112: b5 6d b5 5d   Data
            .hex b5 6d b5 5d   ; $b116: b5 6d b5 5d   Data
            .hex b5 6d b5 7d   ; $b11a: b5 6d b5 7d   Data
            .hex b5 7d b5 7d   ; $b11e: b5 7d b5 7d   Data
            .hex b5 7d b5 7d   ; $b122: b5 7d b5 7d   Data
            .hex b5 7d b5 7d   ; $b126: b5 7d b5 7d   Data
            .hex b5 7d b5 8d   ; $b12a: b5 7d b5 8d   Data
            .hex b5 8d b5 8d   ; $b12e: b5 8d b5 8d   Data
            .hex b5 8d b5 8d   ; $b132: b5 8d b5 8d   Data
            .hex b5 8d b5 8d   ; $b136: b5 8d b5 8d   Data
            .hex b5 8d b5      ; $b13a: b5 8d b5      Data
__b13d:     .hex 9d            ; $b13d: 9d            Data
__b13e:     .hex b5 ad b5 ad   ; $b13e: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b142: b5 ad b5 ad   Data
            .hex b5 bd b5 cd   ; $b146: b5 bd b5 cd   Data
            .hex b5 ad b5 ad   ; $b14a: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b14e: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b152: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b156: b5 ad b5 ad   Data
            .hex b5 ad b5 dd   ; $b15a: b5 ad b5 dd   Data
            .hex b5 ad b5 ed   ; $b15e: b5 ad b5 ed   Data
            .hex b5 ad b5 fd   ; $b162: b5 ad b5 fd   Data
            .hex b5 ad b5 0d   ; $b166: b5 ad b5 0d   Data
            .hex b6 ad b5 ad   ; $b16a: b6 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b16e: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b172: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b176: b5 ad b5 ad   Data
            .hex b5 ad b5 1d   ; $b17a: b5 ad b5 1d   Data
            .hex b6 2d b6 3d   ; $b17e: b6 2d b6 3d   Data
            .hex b6 4d b6 5d   ; $b182: b6 4d b6 5d   Data
            .hex b6 6d b6 7d   ; $b186: b6 6d b6 7d   Data
            .hex b6 ad b5 8d   ; $b18a: b6 ad b5 8d   Data
            .hex b6 9d b6 ad   ; $b18e: b6 9d b6 ad   Data
            .hex b6 ad b5 ad   ; $b192: b6 ad b5 ad   Data
            .hex b5 bd b6 cd   ; $b196: b5 bd b6 cd   Data
            .hex b6 ad b5 dd   ; $b19a: b6 ad b5 dd   Data
            .hex b6 ad b5 ed   ; $b19e: b6 ad b5 ed   Data
            .hex b6 ad b5 fd   ; $b1a2: b6 ad b5 fd   Data
            .hex b6 ad b5 0d   ; $b1a6: b6 ad b5 0d   Data
            .hex b7 ad b5 1d   ; $b1aa: b7 ad b5 1d   Data
            .hex b7 ad b5 ad   ; $b1ae: b7 ad b5 ad   Data
            .hex b5 ad b5 2d   ; $b1b2: b5 ad b5 2d   Data
            .hex b7 ad b5 ad   ; $b1b6: b7 ad b5 ad   Data
            .hex b5 ad b5 3d   ; $b1ba: b5 ad b5 3d   Data
            .hex b7 4d b7 5d   ; $b1be: b7 4d b7 5d   Data
            .hex b7 6d b7 ad   ; $b1c2: b7 6d b7 ad   Data
            .hex b5 ad b5 ad   ; $b1c6: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b1ca: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b1ce: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b1d2: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b1d6: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b1da: b5 ad b5 ad   Data
            .hex b5 7d b7 ad   ; $b1de: b5 7d b7 ad   Data
            .hex b5 8d b7 9d   ; $b1e2: b5 8d b7 9d   Data
            .hex b7 ad b5 ad   ; $b1e6: b7 ad b5 ad   Data
            .hex b7 ad b5 ad   ; $b1ea: b7 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b1ee: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b1f2: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b1f6: b5 ad b5 ad   Data
            .hex b5 ad b5 bd   ; $b1fa: b5 ad b5 bd   Data
            .hex b7 cd b7 dd   ; $b1fe: b7 cd b7 dd   Data
            .hex b7 ed b7 ad   ; $b202: b7 ed b7 ad   Data
            .hex b5 ad b5 ad   ; $b206: b5 ad b5 ad   Data
            .hex b5 ad b5 fd   ; $b20a: b5 ad b5 fd   Data
            .hex b7 0d b8 ad   ; $b20e: b7 0d b8 ad   Data
            .hex b5 ad b5 ad   ; $b212: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b216: b5 ad b5 ad   Data
            .hex b5 ad b5 ad   ; $b21a: b5 ad b5 ad   Data
            .hex b5 1d b8 ad   ; $b21e: b5 1d b8 ad   Data
            .hex b5 2d b8 3d   ; $b222: b5 2d b8 3d   Data
            .hex b8 ad b5 4d   ; $b226: b8 ad b5 4d   Data
            .hex b8 ad b5 ad   ; $b22a: b8 ad b5 ad   Data
            .hex b5 5d b8 ad   ; $b22e: b5 5d b8 ad   Data
            .hex b5 ad b5 6d   ; $b232: b5 ad b5 6d   Data
            .hex b8 ad b5 ad   ; $b236: b8 ad b5 ad   Data
            .hex b5 ad b5 45   ; $b23a: b5 ad b5 45   Data
            .hex 45 45 45 45   ; $b23e: 45 45 45 45   Data
            .hex 45 45 45 45   ; $b242: 45 45 45 45   Data
            .hex 45 45 45 45   ; $b246: 45 45 45 45   Data
            .hex 45 45 45 41   ; $b24a: 45 45 45 41   Data
            .hex 41 41 41 45   ; $b24e: 41 41 41 45   Data
            .hex 45 45 45 45   ; $b252: 45 45 45 45   Data
            .hex 45 45 45 45   ; $b256: 45 45 45 45   Data
            .hex 45 45 45 46   ; $b25a: 45 45 45 46   Data
            .hex 45 45 45 46   ; $b25e: 45 45 45 46   Data
            .hex 45 45 45 46   ; $b262: 45 45 45 46   Data
            .hex 45 45 45 46   ; $b266: 45 45 45 46   Data
            .hex 45 45 45 47   ; $b26a: 45 45 45 47   Data
            .hex 41 41 41 46   ; $b26e: 41 41 41 46   Data
            .hex 45 45 45 46   ; $b272: 45 45 45 46   Data
            .hex 45 45 45 46   ; $b276: 45 45 45 46   Data
            .hex 45 45 45 45   ; $b27a: 45 45 45 45   Data
            .hex 45 45 45 45   ; $b27e: 45 45 45 45   Data
            .hex 45 45 45 45   ; $b282: 45 45 45 45   Data
            .hex 45 45 45 49   ; $b286: 45 45 45 49   Data
            .hex 49 49 49 41   ; $b28a: 49 49 49 41   Data
            .hex 41 41 41 45   ; $b28e: 41 41 41 45   Data
            .hex 45 45 45 45   ; $b292: 45 45 45 45   Data
            .hex 45 45 45 49   ; $b296: 45 45 45 49   Data
            .hex 49 49 49 46   ; $b29a: 49 49 49 46   Data
            .hex 45 45 45 46   ; $b29e: 45 45 45 46   Data
            .hex 45 45 45 46   ; $b2a2: 45 45 45 46   Data
            .hex 45 45 45 4b   ; $b2a6: 45 45 45 4b   Data
            .hex 49 49 49 47   ; $b2aa: 49 49 49 47   Data
            .hex 41 41 41 46   ; $b2ae: 41 41 41 46   Data
            .hex 45 45 45 46   ; $b2b2: 45 45 45 46   Data
            .hex 45 45 45 4b   ; $b2b6: 45 45 45 4b   Data
            .hex 49 49 49 45   ; $b2ba: 49 49 49 45   Data
            .hex 45 45 42 45   ; $b2be: 45 45 42 45   Data
            .hex 45 45 42 45   ; $b2c2: 45 45 42 45   Data
            .hex 45 45 42 45   ; $b2c6: 45 45 42 45   Data
            .hex 45 45 42 41   ; $b2ca: 45 45 42 41   Data
            .hex 41 41 43 45   ; $b2ce: 41 41 43 45   Data
            .hex 45 45 42 45   ; $b2d2: 45 45 42 45   Data
            .hex 45 45 42 45   ; $b2d6: 45 45 42 45   Data
            .hex 45 45 42 46   ; $b2da: 45 45 42 46   Data
            .hex 45 45 42 46   ; $b2de: 45 45 42 46   Data
            .hex 45 45 42 46   ; $b2e2: 45 45 42 46   Data
            .hex 45 45 42 46   ; $b2e6: 45 45 42 46   Data
            .hex 45 45 42 47   ; $b2ea: 45 45 42 47   Data
            .hex 41 41 43 46   ; $b2ee: 41 41 43 46   Data
            .hex 45 45 42 46   ; $b2f2: 45 45 42 46   Data
            .hex 45 45 42 46   ; $b2f6: 45 45 42 46   Data
            .hex 45 45 42 45   ; $b2fa: 45 45 42 45   Data
            .hex 45 45 42 45   ; $b2fe: 45 45 42 45   Data
            .hex 45 45 42 45   ; $b302: 45 45 42 45   Data
            .hex 45 45 42 49   ; $b306: 45 45 42 49   Data
            .hex 49 49 4f 41   ; $b30a: 49 49 4f 41   Data
            .hex 41 41 43 45   ; $b30e: 41 41 43 45   Data
            .hex 45 45 42 45   ; $b312: 45 45 42 45   Data
            .hex 45 45 42 49   ; $b316: 45 45 42 49   Data
            .hex 49 49 4f 46   ; $b31a: 49 49 4f 46   Data
            .hex 45 45 42 46   ; $b31e: 45 45 42 46   Data
            .hex 45 45 42 46   ; $b322: 45 45 42 46   Data
            .hex 45 45 42 4b   ; $b326: 45 45 42 4b   Data
            .hex 49 49 4f 47   ; $b32a: 49 49 4f 47   Data
            .hex 41 41 43 46   ; $b32e: 41 41 43 46   Data
            .hex 45 45 42 46   ; $b332: 45 45 42 46   Data
            .hex 45 45 42 4b   ; $b336: 45 45 42 4b   Data
            .hex 49 49 4f 41   ; $b33a: 49 49 4f 41   Data
            .hex 41 32 32 45   ; $b33e: 41 32 32 45   Data
            .hex 45 45 45 45   ; $b342: 45 45 45 45   Data
            .hex 45 45 45 45   ; $b346: 45 45 45 45   Data
            .hex 45 45 45 47   ; $b34a: 45 45 45 47   Data
            .hex 41 32 32 46   ; $b34e: 41 32 32 46   Data
            .hex 45 45 45 46   ; $b352: 45 45 45 46   Data
            .hex 45 45 45 46   ; $b356: 45 45 45 46   Data
            .hex 45 45 45 41   ; $b35a: 45 45 45 41   Data
            .hex 41 32 32 45   ; $b35e: 41 32 32 45   Data
            .hex 45 45 45 45   ; $b362: 45 45 45 45   Data
            .hex 45 45 45 49   ; $b366: 45 45 45 49   Data
            .hex 49 49 49 47   ; $b36a: 49 49 49 47   Data
            .hex 41 32 32 46   ; $b36e: 41 32 32 46   Data
            .hex 45 45 45 46   ; $b372: 45 45 45 46   Data
            .hex 45 45 45 4b   ; $b376: 45 45 45 4b   Data
            .hex 49 49 49 41   ; $b37a: 49 49 49 41   Data
            .hex 41 32 33 45   ; $b37e: 41 32 33 45   Data
            .hex 45 45 42 45   ; $b382: 45 45 42 45   Data
            .hex 45 45 42 45   ; $b386: 45 45 42 45   Data
            .hex 45 45 42 47   ; $b38a: 45 45 42 47   Data
            .hex 41 32 33 46   ; $b38e: 41 32 33 46   Data
            .hex 45 45 42 46   ; $b392: 45 45 42 46   Data
            .hex 45 45 42 46   ; $b396: 45 45 42 46   Data
            .hex 45 45 42 41   ; $b39a: 45 45 42 41   Data
            .hex 41 32 33 45   ; $b39e: 41 32 33 45   Data
            .hex 45 45 42 45   ; $b3a2: 45 45 42 45   Data
            .hex 45 45 42 49   ; $b3a6: 45 45 42 49   Data
            .hex 49 49 4f 47   ; $b3aa: 49 49 4f 47   Data
            .hex 41 32 33 46   ; $b3ae: 41 32 33 46   Data
            .hex 45 45 42 46   ; $b3b2: 45 45 42 46   Data
            .hex 45 45 42 4b   ; $b3b6: 45 45 42 4b   Data
            .hex 49 49 4f 3e   ; $b3ba: 49 49 4f 3e   Data
            .hex 45 45 45 3e   ; $b3be: 45 45 45 3e   Data
            .hex 45 45 45 3e   ; $b3c2: 45 45 45 3e   Data
            .hex 45 45 45 3e   ; $b3c6: 45 45 45 3e   Data
            .hex 45 45 45 95   ; $b3ca: 45 45 45 95   Data
            .hex 41 41 41 3e   ; $b3ce: 41 41 41 3e   Data
            .hex 45 45 45 3e   ; $b3d2: 45 45 45 3e   Data
            .hex 45 45 45 3e   ; $b3d6: 45 45 45 3e   Data
            .hex 45 45 45 3e   ; $b3da: 45 45 45 3e   Data
            .hex 45 45 45 3e   ; $b3de: 45 45 45 3e   Data
            .hex 45 45 45 3e   ; $b3e2: 45 45 45 3e   Data
            .hex 45 45 45 96   ; $b3e6: 45 45 45 96   Data
            .hex 49 49 49 95   ; $b3ea: 49 49 49 95   Data
            .hex 41 41 41 3e   ; $b3ee: 41 41 41 3e   Data
            .hex 45 45 45 3e   ; $b3f2: 45 45 45 3e   Data
            .hex 45 45 45 96   ; $b3f6: 45 45 45 96   Data
            .hex 49 49 49 3e   ; $b3fa: 49 49 49 3e   Data
            .hex 45 45 42 3e   ; $b3fe: 45 45 42 3e   Data
            .hex 45 45 42 3e   ; $b402: 45 45 42 3e   Data
            .hex 45 45 42 3e   ; $b406: 45 45 42 3e   Data
            .hex 45 45 42 95   ; $b40a: 45 45 42 95   Data
            .hex 41 41 43 3e   ; $b40e: 41 41 43 3e   Data
            .hex 45 45 42 3e   ; $b412: 45 45 42 3e   Data
            .hex 45 45 42 3e   ; $b416: 45 45 42 3e   Data
            .hex 45 45 42 3e   ; $b41a: 45 45 42 3e   Data
            .hex 45 45 42 3e   ; $b41e: 45 45 42 3e   Data
            .hex 45 45 42 3e   ; $b422: 45 45 42 3e   Data
            .hex 45 45 42 96   ; $b426: 45 45 42 96   Data
            .hex 49 49 4f 95   ; $b42a: 49 49 4f 95   Data
            .hex 41 41 43 3e   ; $b42e: 41 41 43 3e   Data
            .hex 45 45 42 3e   ; $b432: 45 45 42 3e   Data
            .hex 45 45 42 96   ; $b436: 45 45 42 96   Data
            .hex 49 49 4f 3f   ; $b43a: 49 49 4f 3f   Data
            .hex 32 32 32 3e   ; $b43e: 32 32 32 3e   Data
            .hex 45 45 45 3e   ; $b442: 45 45 45 3e   Data
            .hex 45 45 45 3e   ; $b446: 45 45 45 3e   Data
            .hex 45 45 45 3f   ; $b44a: 45 45 45 3f   Data
            .hex 32 32 32 3e   ; $b44e: 32 32 32 3e   Data
            .hex 45 45 45 3e   ; $b452: 45 45 45 3e   Data
            .hex 45 45 45 96   ; $b456: 45 45 45 96   Data
            .hex 49 49 49 3f   ; $b45a: 49 49 49 3f   Data
            .hex 32 32 33 3e   ; $b45e: 32 32 33 3e   Data
            .hex 45 45 42 3e   ; $b462: 45 45 42 3e   Data
            .hex 45 45 42 3e   ; $b466: 45 45 42 3e   Data
            .hex 45 45 42 3f   ; $b46a: 45 45 42 3f   Data
            .hex 32 32 33 3e   ; $b46e: 32 32 33 3e   Data
            .hex 45 45 42 3e   ; $b472: 45 45 42 3e   Data
            .hex 45 45 42 96   ; $b476: 45 45 42 96   Data
            .hex 49 49 4f 45   ; $b47a: 49 49 4f 45   Data
            .hex 45 45 45 45   ; $b47e: 45 45 45 45   Data
            .hex 45 45 45 45   ; $b482: 45 45 45 45   Data
            .hex 45 45 45 49   ; $b486: 45 45 45 49   Data
            .hex 49 40 40 41   ; $b48a: 49 40 40 41   Data
            .hex 41 41 41 45   ; $b48e: 41 41 41 45   Data
            .hex 45 45 45 45   ; $b492: 45 45 45 45   Data
            .hex 45 45 45 49   ; $b496: 45 45 45 49   Data
            .hex 49 40 40 46   ; $b49a: 49 40 40 46   Data
            .hex 45 45 45 46   ; $b49e: 45 45 45 46   Data
            .hex 45 45 45 46   ; $b4a2: 45 45 45 46   Data
            .hex 45 45 45 4b   ; $b4a6: 45 45 45 4b   Data
            .hex 49 40 40 47   ; $b4aa: 49 40 40 47   Data
            .hex 41 41 41 46   ; $b4ae: 41 41 41 46   Data
            .hex 45 45 45 46   ; $b4b2: 45 45 45 46   Data
            .hex 45 45 45 4b   ; $b4b6: 45 45 45 4b   Data
            .hex 49 40 40 45   ; $b4ba: 49 40 40 45   Data
            .hex 45 45 42 45   ; $b4be: 45 45 42 45   Data
            .hex 45 45 42 45   ; $b4c2: 45 45 42 45   Data
            .hex 45 45 42 49   ; $b4c6: 45 45 42 49   Data
            .hex 49 40 4a 41   ; $b4ca: 49 40 4a 41   Data
            .hex 41 41 43 45   ; $b4ce: 41 41 43 45   Data
            .hex 45 45 42 45   ; $b4d2: 45 45 42 45   Data
            .hex 45 45 42 49   ; $b4d6: 45 45 42 49   Data
            .hex 49 40 4a 46   ; $b4da: 49 40 4a 46   Data
            .hex 45 45 42 46   ; $b4de: 45 45 42 46   Data
            .hex 45 45 42 46   ; $b4e2: 45 45 42 46   Data
            .hex 45 45 42 4b   ; $b4e6: 45 45 42 4b   Data
            .hex 49 40 4a 47   ; $b4ea: 49 40 4a 47   Data
            .hex 41 41 43 46   ; $b4ee: 41 41 43 46   Data
            .hex 45 45 42 46   ; $b4f2: 45 45 42 46   Data
            .hex 45 45 42 4b   ; $b4f6: 45 45 42 4b   Data
            .hex 49 40 4a 41   ; $b4fa: 49 40 4a 41   Data
            .hex 41 32 32 45   ; $b4fe: 41 32 32 45   Data
            .hex 45 45 45 45   ; $b502: 45 45 45 45   Data
            .hex 45 45 45 49   ; $b506: 45 45 45 49   Data
            .hex 49 40 40 47   ; $b50a: 49 40 40 47   Data
            .hex 41 32 32 46   ; $b50e: 41 32 32 46   Data
            .hex 45 45 45 46   ; $b512: 45 45 45 46   Data
            .hex 45 45 45 4b   ; $b516: 45 45 45 4b   Data
            .hex 49 40 40 41   ; $b51a: 49 40 40 41   Data
            .hex 41 32 33 45   ; $b51e: 41 32 33 45   Data
            .hex 45 45 42 45   ; $b522: 45 45 42 45   Data
            .hex 45 45 42 49   ; $b526: 45 45 42 49   Data
            .hex 49 40 4a 47   ; $b52a: 49 40 4a 47   Data
            .hex 41 32 33 46   ; $b52e: 41 32 33 46   Data
            .hex 45 45 42 46   ; $b532: 45 45 42 46   Data
            .hex 45 45 42 4b   ; $b536: 45 45 42 4b   Data
            .hex 49 40 4a 3e   ; $b53a: 49 40 4a 3e   Data
            .hex 45 45 45 3e   ; $b53e: 45 45 45 3e   Data
            .hex 45 45 45 3e   ; $b542: 45 45 45 3e   Data
            .hex 45 45 45 44   ; $b546: 45 45 45 44   Data
            .hex 40 40 40 95   ; $b54a: 40 40 40 95   Data
            .hex 41 41 41 3e   ; $b54e: 41 41 41 3e   Data
            .hex 45 45 45 3e   ; $b552: 45 45 45 3e   Data
            .hex 45 45 45 44   ; $b556: 45 45 45 44   Data
            .hex 40 40 40 3e   ; $b55a: 40 40 40 3e   Data
            .hex 45 45 42 3e   ; $b55e: 45 45 42 3e   Data
            .hex 45 45 42 3e   ; $b562: 45 45 42 3e   Data
            .hex 45 45 42 44   ; $b566: 45 45 42 44   Data
            .hex 40 40 4a 95   ; $b56a: 40 40 4a 95   Data
            .hex 41 41 43 3e   ; $b56e: 41 41 43 3e   Data
            .hex 45 45 42 3e   ; $b572: 45 45 42 3e   Data
            .hex 45 45 42 44   ; $b576: 45 45 42 44   Data
            .hex 40 40 4a 3f   ; $b57a: 40 40 4a 3f   Data
            .hex 32 32 32 3e   ; $b57e: 32 32 32 3e   Data
            .hex 45 45 45 3e   ; $b582: 45 45 45 3e   Data
            .hex 45 45 45 44   ; $b586: 45 45 45 44   Data
            .hex 40 40 40 3f   ; $b58a: 40 40 40 3f   Data
            .hex 32 32 33 3e   ; $b58e: 32 32 33 3e   Data
            .hex 45 45 42 3e   ; $b592: 45 45 42 3e   Data
            .hex 45 45 42 44   ; $b596: 45 45 42 44   Data
            .hex 40 40 4a 50   ; $b59a: 40 40 4a 50   Data
            .hex 54 fc ff 51   ; $b59e: 54 fc ff 51   Data
            .hex 55 ff fd 52   ; $b5a2: 55 ff fd 52   Data
            .hex 56 fb ff 53   ; $b5a6: 56 fb ff 53   Data
            .hex 57 ff ff ff   ; $b5aa: 57 ff ff ff   Data
            .hex fb ff ff ff   ; $b5ae: fb ff ff ff   Data
            .hex ff ff fc ff   ; $b5b2: ff ff fc ff   Data
            .hex ff fd ff fd   ; $b5b6: ff fd ff fd   Data
            .hex ff ff ff ff   ; $b5ba: ff ff ff ff   Data
            .hex ff ff ff a9   ; $b5be: ff ff ff a9   Data
            .hex ff ff ff aa   ; $b5c2: ff ff ff aa   Data
            .hex ac ff ff ab   ; $b5c6: ac ff ff ab   Data
            .hex ad ae ff b9   ; $b5ca: ad ae ff b9   Data
            .hex bd ff ff ba   ; $b5ce: bd ff ff ba   Data
            .hex be 9a ff bb   ; $b5d2: be 9a ff bb   Data
            .hex bf 9b ff bc   ; $b5d6: bf 9b ff bc   Data
            .hex ff ff ff a0   ; $b5da: ff ff ff a0   Data
            .hex a3 a4 a6 45   ; $b5de: a3 a4 a6 45   Data
            .hex 45 a5 a7 45   ; $b5e2: 45 a5 a7 45   Data
            .hex 45 45 a8 45   ; $b5e6: 45 45 a8 45   Data
            .hex 45 45 45 a1   ; $b5ea: 45 45 45 a1   Data
            .hex a3 a4 a6 46   ; $b5ee: a3 a4 a6 46   Data
            .hex 45 a5 a7 46   ; $b5f2: 45 a5 a7 46   Data
            .hex 45 45 a8 46   ; $b5f6: 45 45 a8 46   Data
            .hex 45 45 45 a0   ; $b5fa: 45 45 45 a0   Data
            .hex a3 a4 a6 45   ; $b5fe: a3 a4 a6 45   Data
            .hex 45 a5 a7 45   ; $b602: 45 a5 a7 45   Data
            .hex 45 45 a8 49   ; $b606: 45 45 a8 49   Data
            .hex 49 49 49 a1   ; $b60a: 49 49 49 a1   Data
            .hex a3 a4 a6 46   ; $b60e: a3 a4 a6 46   Data
            .hex 45 a5 a7 46   ; $b612: 45 a5 a7 46   Data
            .hex 45 45 a8 44   ; $b616: 45 45 a8 44   Data
            .hex 49 49 49 45   ; $b61a: 49 49 49 45   Data
            .hex c1 45 e0 c0   ; $b61e: c1 45 e0 c0   Data
            .hex c2 c0 c2 45   ; $b622: c2 c0 c2 45   Data
            .hex c3 c5 c4 45   ; $b626: c3 c5 c4 45   Data
            .hex c4 45 c4 45   ; $b62a: c4 45 c4 45   Data
            .hex c1 45 c1 c0   ; $b62e: c1 45 c1 c0   Data
            .hex c2 c0 c2 45   ; $b632: c2 c0 c2 45   Data
            .hex c3 c5 c3 45   ; $b636: c3 c5 c3 45   Data
            .hex c4 45 c4 45   ; $b63a: c4 45 c4 45   Data
            .hex c1 45 c1 c0   ; $b63e: c1 45 c1 c0   Data
            .hex c2 c0 c2 45   ; $b642: c2 c0 c2 45   Data
            .hex c3 c5 c3 45   ; $b646: c3 c5 c3 45   Data
            .hex c4 45 c4 50   ; $b64a: c4 45 c4 50   Data
            .hex 54 d0 d4 51   ; $b64e: 54 d0 d4 51   Data
            .hex ce d1 d5 52   ; $b652: ce d1 d5 52   Data
            .hex cf d2 ff 53   ; $b656: cf d2 ff 53   Data
            .hex 57 d3 d7 ff   ; $b65a: 57 d3 d7 ff   Data
            .hex ff d0 d4 ff   ; $b65e: ff d0 d4 ff   Data
            .hex cc d1 d5 ff   ; $b662: cc d1 d5 ff   Data
            .hex cd d2 ff ff   ; $b666: cd d2 ff ff   Data
            .hex ff d3 d7 ff   ; $b66a: ff d3 d7 ff   Data
            .hex fb ff 93 fd   ; $b66e: fb ff 93 fd   Data
            .hex fc ff d9 fb   ; $b672: fc ff d9 fb   Data
            .hex ff d7 da fc   ; $b676: ff d7 da fc   Data
            .hex fd d8 45 fc   ; $b67a: fd d8 45 fc   Data
            .hex fd db dc fb   ; $b67e: fd db dc fb   Data
            .hex ff 9c dd fd   ; $b682: ff 9c dd fd   Data
            .hex fc ff de ff   ; $b686: fc ff de ff   Data
            .hex fb ff df e1   ; $b68a: fb ff df e1   Data
            .hex e2 fb fc 45   ; $b68e: e2 fb fc 45   Data
            .hex e3 fd ff c7   ; $b692: e3 fd ff c7   Data
            .hex ca fc fb c8   ; $b696: ca fc fb c8   Data
            .hex cb ff fd c6   ; $b69a: cb ff fd c6   Data
            .hex c9 ff fd 45   ; $b69e: c9 ff fd 45   Data
            .hex 56 fc fb e5   ; $b6a2: 56 fc fb e5   Data
            .hex e6 fd ff ff   ; $b6a6: e6 fd ff ff   Data
            .hex ff fb fc c6   ; $b6aa: ff fb fc c6   Data
            .hex c9 ff fc 45   ; $b6ae: c9 ff fc 45   Data
            .hex 56 fb fd c7   ; $b6b2: 56 fb fd c7   Data
            .hex ca fc ff c8   ; $b6b6: ca fc ff c8   Data
            .hex cb fd fb ff   ; $b6ba: cb fd fb ff   Data
            .hex ff ff d3 fb   ; $b6be: ff ff d3 fb   Data
            .hex fd ff d3 ff   ; $b6c2: fd ff d3 ff   Data
            .hex fc ff d4 fd   ; $b6c6: fc ff d4 fd   Data
            .hex fb d7 d5 fd   ; $b6ca: fb d7 d5 fd   Data
            .hex fb d3 d0 ff   ; $b6ce: fb d3 d0 ff   Data
            .hex fc d7 ff fb   ; $b6d2: fc d7 ff fb   Data
            .hex fd ff d3 ff   ; $b6d6: fd ff d3 ff   Data
            .hex ff ff ff ff   ; $b6da: ff ff ff ff   Data
            .hex ff 94 93 ff   ; $b6de: ff 94 93 ff   Data
            .hex 91 45 45 90   ; $b6e2: 91 45 45 90   Data
            .hex 92 45 45 3e   ; $b6e6: 92 45 45 3e   Data
            .hex 45 45 45 a2   ; $b6ea: 45 45 45 a2   Data
            .hex a3 a4 a6 3e   ; $b6ee: a3 a4 a6 3e   Data
            .hex 45 a5 a7 3e   ; $b6f2: 45 a5 a7 3e   Data
            .hex 45 45 a8 3e   ; $b6f6: 45 45 a8 3e   Data
            .hex 45 45 45 ff   ; $b6fa: 45 45 45 ff   Data
            .hex ff 94 93 ff   ; $b6fe: ff 94 93 ff   Data
            .hex 91 45 45 90   ; $b702: 91 45 45 90   Data
            .hex 92 45 45 96   ; $b706: 92 45 45 96   Data
            .hex 49 49 49 a2   ; $b70a: 49 49 49 a2   Data
            .hex a3 a4 a6 3e   ; $b70e: a3 a4 a6 3e   Data
            .hex 45 45 a7 3e   ; $b712: 45 45 a7 3e   Data
            .hex 45 45 a8 96   ; $b716: 45 45 a8 96   Data
            .hex 49 49 49 ff   ; $b71a: 49 49 49 ff   Data
            .hex ff 94 4e ff   ; $b71e: ff 94 4e ff   Data
            .hex 91 45 42 90   ; $b722: 91 45 42 90   Data
            .hex 92 45 42 3e   ; $b726: 92 45 42 3e   Data
            .hex 45 45 42 ff   ; $b72a: 45 45 42 ff   Data
            .hex ff 94 4e ff   ; $b72e: ff 94 4e ff   Data
            .hex 91 45 42 90   ; $b732: 91 45 42 90   Data
            .hex 92 45 42 96   ; $b736: 92 45 42 96   Data
            .hex 49 49 4f 45   ; $b73a: 49 49 4f 45   Data
            .hex 45 45 45 45   ; $b73e: 45 45 45 45   Data
            .hex 45 45 b6 45   ; $b742: 45 45 b6 45   Data
            .hex 45 b4 b7 b0   ; $b746: 45 b4 b7 b0   Data
            .hex b3 b5 b8 41   ; $b74a: b3 b5 b8 41   Data
            .hex 41 41 41 45   ; $b74e: 41 41 41 45   Data
            .hex 45 45 b6 45   ; $b752: 45 45 b6 45   Data
            .hex 45 b4 b7 b0   ; $b756: 45 b4 b7 b0   Data
            .hex b3 b5 b8 46   ; $b75a: b3 b5 b8 46   Data
            .hex 45 45 45 46   ; $b75e: 45 45 45 46   Data
            .hex 45 45 b6 46   ; $b762: 45 45 b6 46   Data
            .hex 45 b4 b7 b1   ; $b766: 45 b4 b7 b1   Data
            .hex b3 b5 b8 47   ; $b76a: b3 b5 b8 47   Data
            .hex 41 41 41 46   ; $b76e: 41 41 41 46   Data
            .hex 45 45 b6 46   ; $b772: 45 45 b6 46   Data
            .hex 45 b4 b7 b1   ; $b776: 45 b4 b7 b1   Data
            .hex b3 b5 b8 41   ; $b77a: b3 b5 b8 41   Data
            .hex 41 32 32 45   ; $b77e: 41 32 32 45   Data
            .hex 45 45 b6 45   ; $b782: 45 45 b6 45   Data
            .hex 45 b4 b7 b0   ; $b786: 45 b4 b7 b0   Data
            .hex b3 b5 b8 47   ; $b78a: b3 b5 b8 47   Data
            .hex 41 32 32 46   ; $b78e: 41 32 32 46   Data
            .hex 45 45 b6 46   ; $b792: 45 45 b6 46   Data
            .hex 45 b4 b7 b1   ; $b796: 45 b4 b7 b1   Data
            .hex b3 b5 b8 a0   ; $b79a: b3 b5 b8 a0   Data
            .hex a3 a4 a6 45   ; $b79e: a3 a4 a6 45   Data
            .hex 45 a5 a7 45   ; $b7a2: 45 a5 a7 45   Data
            .hex 45 45 a8 49   ; $b7a6: 45 45 a8 49   Data
            .hex 49 40 40 a1   ; $b7aa: 49 40 40 a1   Data
            .hex a3 a4 a6 46   ; $b7ae: a3 a4 a6 46   Data
            .hex 45 a5 a7 46   ; $b7b2: 45 a5 a7 46   Data
            .hex 45 45 a8 44   ; $b7b6: 45 45 a8 44   Data
            .hex 49 40 40 3e   ; $b7ba: 49 40 40 3e   Data
            .hex 45 45 45 9c   ; $b7be: 45 45 45 9c   Data
            .hex 45 45 45 ff   ; $b7c2: 45 45 45 ff   Data
            .hex 9d 45 45 ff   ; $b7c6: 9d 45 45 ff   Data
            .hex ff 9e 9f 95   ; $b7ca: ff 9e 9f 95   Data
            .hex 41 41 41 9c   ; $b7ce: 41 41 41 9c   Data
            .hex 45 45 45 ff   ; $b7d2: 45 45 45 ff   Data
            .hex 9d 45 45 ff   ; $b7d6: 9d 45 45 ff   Data
            .hex ff 9e 9f 3e   ; $b7da: ff 9e 9f 3e   Data
            .hex 45 45 45 3e   ; $b7de: 45 45 45 3e   Data
            .hex 45 45 b6 3e   ; $b7e2: 45 45 b6 3e   Data
            .hex 45 b4 b7 b2   ; $b7e6: 45 b4 b7 b2   Data
            .hex b3 b5 b8 95   ; $b7ea: b3 b5 b8 95   Data
            .hex 41 41 41 3e   ; $b7ee: 41 41 41 3e   Data
            .hex 45 45 b6 3e   ; $b7f2: 45 45 b6 3e   Data
            .hex 45 b4 b7 b2   ; $b7f6: 45 b4 b7 b2   Data
            .hex b3 b5 b8 3e   ; $b7fa: b3 b5 b8 3e   Data
            .hex 45 45 42 9c   ; $b7fe: 45 45 42 9c   Data
            .hex 45 45 42 ff   ; $b802: 45 45 42 ff   Data
            .hex 9d 45 42 ff   ; $b806: 9d 45 42 ff   Data
            .hex ff 9e 97 95   ; $b80a: ff 9e 97 95   Data
            .hex 41 41 43 9c   ; $b80e: 41 41 43 9c   Data
            .hex 45 45 42 ff   ; $b812: 45 45 42 ff   Data
            .hex 9d 45 42 ff   ; $b816: 9d 45 42 ff   Data
            .hex ff 9e 97 3f   ; $b81a: ff 9e 97 3f   Data
            .hex 32 32 32 9c   ; $b81e: 32 32 32 9c   Data
            .hex 45 45 45 ff   ; $b822: 45 45 45 ff   Data
            .hex 9d 45 45 ff   ; $b826: 9d 45 45 ff   Data
            .hex ff 9e 9f 3f   ; $b82a: ff 9e 9f 3f   Data
            .hex 32 32 32 3e   ; $b82e: 32 32 32 3e   Data
            .hex 45 45 b6 3e   ; $b832: 45 45 b6 3e   Data
            .hex 45 b4 b7 b2   ; $b836: 45 b4 b7 b2   Data
            .hex b3 b5 b8 ff   ; $b83a: b3 b5 b8 ff   Data
            .hex ff 94 93 ff   ; $b83e: ff 94 93 ff   Data
            .hex 91 45 45 90   ; $b842: 91 45 45 90   Data
            .hex 92 45 45 44   ; $b846: 92 45 45 44   Data
            .hex 40 40 40 a2   ; $b84a: 40 40 40 a2   Data
            .hex a3 a4 a6 3e   ; $b84e: a3 a4 a6 3e   Data
            .hex 45 a5 a7 3e   ; $b852: 45 a5 a7 3e   Data
            .hex 45 45 a8 44   ; $b856: 45 45 a8 44   Data
            .hex 40 40 40 3f   ; $b85a: 40 40 40 3f   Data
            .hex 32 32 33 9c   ; $b85e: 32 32 33 9c   Data
            .hex 45 45 42 ff   ; $b862: 45 45 42 ff   Data
            .hex 9d 45 42 fe   ; $b866: 9d 45 42 fe   Data
            .hex ff 9e 97 ff   ; $b86a: ff 9e 97 ff   Data
            .hex ff 94 4e ff   ; $b86e: ff 94 4e ff   Data
            .hex 91 45 42 90   ; $b872: 91 45 42 90   Data
            .hex 92 45 42 44   ; $b876: 92 45 42 44   Data
            .hex 40 40 4a      ; $b87a: 40 40 4a      Data

;-------------------------------------------------------------------------------
__b87d:     txa                ; $b87d: 8a        
            pha                ; $b87e: 48        
            tya                ; $b87f: 98        
            pha                ; $b880: 48        
            ldy $f4            ; $b881: a4 f4     
            ldx $f1,y          ; $b883: b6 f1     
            lda $0400,x        ; $b885: bd 00 04  
            cmp #$80           ; $b888: c9 80     
            bcc __b89a         ; $b88a: 90 0e     
            asl                ; $b88c: 0a        
            tay                ; $b88d: a8        
            lda __b13d,y       ; $b88e: b9 3d b1  
            sta $19            ; $b891: 85 19     
            lda __b13e,y       ; $b893: b9 3e b1  
            sta $1a            ; $b896: 85 1a     
            bne __b8b5         ; $b898: d0 1b     
__b89a:     and #$f0           ; $b89a: 29 f0     
            lsr                ; $b89c: 4a        
            lsr                ; $b89d: 4a        
            lsr                ; $b89e: 4a        
            lsr                ; $b89f: 4a        
            eor $0400,x        ; $b8a0: 5d 00 04  
            and $0400,x        ; $b8a3: 3d 00 04  
            sta $0400,x        ; $b8a6: 9d 00 04  
            asl                ; $b8a9: 0a        
            tay                ; $b8aa: a8        
            lda __b03d,y       ; $b8ab: b9 3d b0  
            sta $19            ; $b8ae: 85 19     
            lda __b03e,y       ; $b8b0: b9 3e b0  
            sta $1a            ; $b8b3: 85 1a     
__b8b5:     ldy #$00           ; $b8b5: a0 00     
            ldx $f4            ; $b8b7: a6 f4     
            beq __b8bd         ; $b8b9: f0 02     
            ldx #$10           ; $b8bb: a2 10     
__b8bd:     lda ($19),y        ; $b8bd: b1 19     
            sta $b1,x          ; $b8bf: 95 b1     
            inx                ; $b8c1: e8        
            iny                ; $b8c2: c8        
            cpy #$10           ; $b8c3: c0 10     
            bne __b8bd         ; $b8c5: d0 f6     
            pla                ; $b8c7: 68        
            tay                ; $b8c8: a8        
            pla                ; $b8c9: 68        
            tax                ; $b8ca: aa        
            rts                ; $b8cb: 60        

;-------------------------------------------------------------------------------
__b8cc:     ldx #$09           ; $b8cc: a2 09     
__b8ce:     lda $0400,x        ; $b8ce: bd 00 04  
            and #$f0           ; $b8d1: 29 f0     
            cmp #$80           ; $b8d3: c9 80     
            beq __b93d         ; $b8d5: f0 66     
            lda $0400,x        ; $b8d7: bd 00 04  
            and #$11           ; $b8da: 29 11     
            beq __b8ee         ; $b8dc: f0 10     
            lda $0477,x        ; $b8de: bd 77 04  
            ora #$08           ; $b8e1: 09 08     
            sta $0477,x        ; $b8e3: 9d 77 04  
            lda $0478,x        ; $b8e6: bd 78 04  
            ora #$02           ; $b8e9: 09 02     
            sta $0478,x        ; $b8eb: 9d 78 04  
__b8ee:     lda $0400,x        ; $b8ee: bd 00 04  
            and #$22           ; $b8f1: 29 22     
            beq __b905         ; $b8f3: f0 10     
            lda $0477,x        ; $b8f5: bd 77 04  
            ora #$04           ; $b8f8: 09 04     
            sta $0477,x        ; $b8fa: 9d 77 04  
            lda $047f,x        ; $b8fd: bd 7f 04  
            ora #$01           ; $b900: 09 01     
            sta $047f,x        ; $b902: 9d 7f 04  
__b905:     lda $0400,x        ; $b905: bd 00 04  
            and #$44           ; $b908: 29 44     
            beq __b91c         ; $b90a: f0 10     
            lda $047f,x        ; $b90c: bd 7f 04  
            ora #$08           ; $b90f: 09 08     
            sta $047f,x        ; $b911: 9d 7f 04  
            lda $0480,x        ; $b914: bd 80 04  
            ora #$02           ; $b917: 09 02     
            sta $0480,x        ; $b919: 9d 80 04  
__b91c:     lda $0400,x        ; $b91c: bd 00 04  
            bpl __b929         ; $b91f: 10 08     
            and #$aa           ; $b921: 29 aa     
            cmp #$a0           ; $b923: c9 a0     
            beq __b93d         ; $b925: f0 16     
            bne __b92d         ; $b927: d0 04     
__b929:     and #$08           ; $b929: 29 08     
            beq __b93d         ; $b92b: f0 10     
__b92d:     lda $0478,x        ; $b92d: bd 78 04  
            ora #$04           ; $b930: 09 04     
            sta $0478,x        ; $b932: 9d 78 04  
            lda $0480,x        ; $b935: bd 80 04  
            ora #$01           ; $b938: 09 01     
            sta $0480,x        ; $b93a: 9d 80 04  
__b93d:     inx                ; $b93d: e8        
            cpx #$6f           ; $b93e: e0 6f     
            bne __b8ce         ; $b940: d0 8c     
            rts                ; $b942: 60        

;-------------------------------------------------------------------------------
__b943:     .hex 00 01 08 09   ; $b943: 00 01 08 09   Data

;-------------------------------------------------------------------------------
__b947:     lda $03e2          ; $b947: ad e2 03  
            cmp #$ee           ; $b94a: c9 ee     
            bne __b980         ; $b94c: d0 32     
            ldy #$08           ; $b94e: a0 08     
__b950:     iny                ; $b950: c8        
            cpy #$66           ; $b951: c0 66     
            beq __b980         ; $b953: f0 2b     
            tya                ; $b955: 98        
            and #$07           ; $b956: 29 07     
            beq __b950         ; $b958: f0 f6     
            cmp #$06           ; $b95a: c9 06     
            bcs __b950         ; $b95c: b0 f2     
            sty $18            ; $b95e: 84 18     
            ldx #$00           ; $b960: a2 00     
__b962:     lda $18            ; $b962: a5 18     
            clc                ; $b964: 18        
            adc __b943,x       ; $b965: 7d 43 b9  
            tay                ; $b968: a8        
            lda $0370,y        ; $b969: b9 70 03  
            bne __b972         ; $b96c: d0 04     
            ldy $18            ; $b96e: a4 18     
            bne __b950         ; $b970: d0 de     
__b972:     inx                ; $b972: e8        
            cpx #$04           ; $b973: e0 04     
            bne __b962         ; $b975: d0 eb     
            ldy $18            ; $b977: a4 18     
            lda #$30           ; $b979: a9 30     
            sta $0480,y        ; $b97b: 99 80 04  
            bne __b950         ; $b97e: d0 d0     
__b980:     rts                ; $b980: 60        

;-------------------------------------------------------------------------------
__b981:     lda #$3f           ; $b981: a9 3f     
            sta $2006          ; $b983: 8d 06 20  
            lda #$00           ; $b986: a9 00     
            sta $2006          ; $b988: 8d 06 20  
            sta $2006          ; $b98b: 8d 06 20  
            sta $2006          ; $b98e: 8d 06 20  
            rts                ; $b991: 60        

;-------------------------------------------------------------------------------
__b992:     lda #$34           ; $b992: a9 34     
            sta $2000          ; $b994: 8d 00 20  
            ldx #$09           ; $b997: a2 09     
__b999:     lda $0480,x        ; $b999: bd 80 04  
            cmp #$20           ; $b99c: c9 20     
            bcs __b9ab         ; $b99e: b0 0b     
            stx $f3            ; $b9a0: 86 f3     
            jsr __b9be         ; $b9a2: 20 be b9  
            jsr __ba6d         ; $b9a5: 20 6d ba  
            jsr __f43f         ; $b9a8: 20 3f f4  
__b9ab:     inx                ; $b9ab: e8        
            cpx #$68           ; $b9ac: e0 68     
            beq __b9bd         ; $b9ae: f0 0d     
            txa                ; $b9b0: 8a        
            and #$07           ; $b9b1: 29 07     
            beq __b9ab         ; $b9b3: f0 f6     
            and #$06           ; $b9b5: 29 06     
            cmp #$06           ; $b9b7: c9 06     
            beq __b9ab         ; $b9b9: f0 f0     
            bne __b999         ; $b9bb: d0 dc     
__b9bd:     rts                ; $b9bd: 60        

;-------------------------------------------------------------------------------
__b9be:     txa                ; $b9be: 8a        
            pha                ; $b9bf: 48        
            tya                ; $b9c0: 98        
            pha                ; $b9c1: 48        
            ldx $f4            ; $b9c2: a6 f4     
            lda $f3            ; $b9c4: a5 f3     
            and #$38           ; $b9c6: 29 38     
            sta $17            ; $b9c8: 85 17     
            lda $f3            ; $b9ca: a5 f3     
            and #$07           ; $b9cc: 29 07     
            lsr                ; $b9ce: 4a        
            ror $17            ; $b9cf: 66 17     
            ldy $f3            ; $b9d1: a4 f3     
            cpy #$38           ; $b9d3: c0 38     
            bcc __b9da         ; $b9d5: 90 03     
            clc                ; $b9d7: 18        
            adc #$04           ; $b9d8: 69 04     
__b9da:     clc                ; $b9da: 18        
            adc #$20           ; $b9db: 69 20     
            sta $9f,x          ; $b9dd: 95 9f     
            lda $17            ; $b9df: a5 17     
            clc                ; $b9e1: 18        
            adc #$05           ; $b9e2: 69 05     
            ora #$60           ; $b9e4: 09 60     
            sta $a9,x          ; $b9e6: 95 a9     
            pla                ; $b9e8: 68        
            tay                ; $b9e9: a8        
            pla                ; $b9ea: 68        
            tax                ; $b9eb: aa        
            rts                ; $b9ec: 60        

;-------------------------------------------------------------------------------
__b9ed:     .hex 3c 38 30 34   ; $b9ed: 3c 38 30 34   Data
            .hex 3c 3a 30 34   ; $b9f1: 3c 3a 30 34   Data
            .hex 3d 38 31 34   ; $b9f5: 3d 38 31 34   Data
            .hex 3d 3a 31 34   ; $b9f9: 3d 3a 31 34   Data
            .hex 3c 38 30 36   ; $b9fd: 3c 38 30 36   Data
            .hex 3c 3a 30 36   ; $ba01: 3c 3a 30 36   Data
            .hex 3d 38 31 36   ; $ba05: 3d 38 31 36   Data
            .hex 3d 3a 31 36   ; $ba09: 3d 3a 31 36   Data
            .hex 3c 39 30 35   ; $ba0d: 3c 39 30 35   Data
            .hex 3c 3b 30 35   ; $ba11: 3c 3b 30 35   Data
            .hex 3d 39 31 35   ; $ba15: 3d 39 31 35   Data
            .hex 3d 3b 31 35   ; $ba19: 3d 3b 31 35   Data
            .hex 3c 39 30 37   ; $ba1d: 3c 39 30 37   Data
            .hex 3c 3b 30 37   ; $ba21: 3c 3b 30 37   Data
            .hex 3d 39 31 37   ; $ba25: 3d 39 31 37   Data
            .hex 3d 3b 31 37   ; $ba29: 3d 3b 31 37   Data
            .hex 45 45 45 45   ; $ba2d: 45 45 45 45   Data
            .hex 42 46 45 45   ; $ba31: 42 46 45 45   Data
            .hex 49 45 41 45   ; $ba35: 49 45 41 45   Data
            .hex 4f 46 41 45   ; $ba39: 4f 46 41 45   Data
            .hex 45 45 42 46   ; $ba3d: 45 45 42 46   Data
            .hex 42 46 42 46   ; $ba41: 42 46 42 46   Data
            .hex 49 45 43 46   ; $ba45: 49 45 43 46   Data
            .hex 4f 46 43 46   ; $ba49: 4f 46 43 46   Data
            .hex 45 49 45 41   ; $ba4d: 45 49 45 41   Data
            .hex 42 4b 45 41   ; $ba51: 42 4b 45 41   Data
            .hex 49 49 41 41   ; $ba55: 49 49 41 41   Data
            .hex 4f 4b 41 41   ; $ba59: 4f 4b 41 41   Data
            .hex 45 49 42 47   ; $ba5d: 45 49 42 47   Data
            .hex 42 4b 42 47   ; $ba61: 42 4b 42 47   Data
            .hex 49 49 43 47   ; $ba65: 49 49 43 47   Data
            .hex 4f 4b 43 47   ; $ba69: 4f 4b 43 47   Data

;-------------------------------------------------------------------------------
__ba6d:     txa                ; $ba6d: 8a        
            pha                ; $ba6e: 48        
            tya                ; $ba6f: 98        
            pha                ; $ba70: 48        
            ldx $f3            ; $ba71: a6 f3     
            lda $0480,x        ; $ba73: bd 80 04  
            asl                ; $ba76: 0a        
            asl                ; $ba77: 0a        
            tay                ; $ba78: a8        
            lda $f4            ; $ba79: a5 f4     
            asl                ; $ba7b: 0a        
            asl                ; $ba7c: 0a        
            tax                ; $ba7d: aa        
__ba7e:     lda __b9ed,y       ; $ba7e: b9 ed b9  
            sta $d1,x          ; $ba81: 95 d1     
            iny                ; $ba83: c8        
            inx                ; $ba84: e8        
            txa                ; $ba85: 8a        
            and #$03           ; $ba86: 29 03     
            bne __ba7e         ; $ba88: d0 f4     
            pla                ; $ba8a: 68        
            tay                ; $ba8b: a8        
            pla                ; $ba8c: 68        
            tax                ; $ba8d: aa        
            rts                ; $ba8e: 60        

;-------------------------------------------------------------------------------
__ba8f:     tya                ; $ba8f: 98        
            pha                ; $ba90: 48        
            lda $79            ; $ba91: a5 79     
            clc                ; $ba93: 18        
            adc $29            ; $ba94: 65 29     
            sta $17            ; $ba96: 85 17     
            lda $28            ; $ba98: a5 28     
            and #$01           ; $ba9a: 29 01     
            beq __ba9f         ; $ba9c: f0 01     
            sec                ; $ba9e: 38        
__ba9f:     lda $17            ; $ba9f: a5 17     
            and #$e0           ; $baa1: 29 e0     
            ror                ; $baa3: 6a        
            ror                ; $baa4: 6a        
            sec                ; $baa5: 38        
            sbc #$08           ; $baa6: e9 08     
            sta $17            ; $baa8: 85 17     
            clc                ; $baaa: 18        
            lda $40            ; $baab: a5 40     
            and #$e0           ; $baad: 29 e0     
            rol                ; $baaf: 2a        
            rol                ; $bab0: 2a        
            rol                ; $bab1: 2a        
            rol                ; $bab2: 2a        
            ora $17            ; $bab3: 05 17     
            sta $f3            ; $bab5: 85 f3     
            pla                ; $bab7: 68        
            tay                ; $bab8: a8        
            rts                ; $bab9: 60        

;-------------------------------------------------------------------------------
__baba:     .hex 08 01 04 08   ; $baba: 08 01 04 08   Data
            .hex 01 08 01 02   ; $babe: 01 08 01 02   Data
            .hex f8 00 ff 00   ; $bac2: f8 00 ff 00   Data
            .hex 10 00 01 00   ; $bac6: 10 00 01 00   Data
            .hex 02 00 04 08   ; $baca: 02 00 04 08   Data
            .hex 01 02 ff 08   ; $bace: 01 02 ff 08   Data
            .hex f8 00 01 00   ; $bad2: f8 00 01 00   Data
            .hex 10 00 ff 00   ; $bad6: 10 00 ff 00   Data
            .hex 04 08 08 01   ; $bada: 04 08 08 01   Data
            .hex 02 04 08 01   ; $bade: 02 04 08 01   Data
            .hex ff 00 f8 00   ; $bae2: ff 00 f8 00   Data
            .hex 02 00 08 00   ; $bae6: 02 00 08 00   Data
            .hex 01 00 08 01   ; $baea: 01 00 08 01   Data
            .hex 02 01 f8 04   ; $baee: 02 01 f8 04   Data
            .hex ff 00 08 00   ; $baf2: ff 00 08 00   Data
            .hex 02 00 f8 00   ; $baf6: 02 00 f8 00   Data

;-------------------------------------------------------------------------------
__bafa:     tya                ; $bafa: 98        
            pha                ; $bafb: 48        
            lda $03e2          ; $bafc: ad e2 03  
            beq __bb04         ; $baff: f0 03     
            jmp __bba1         ; $bb01: 4c a1 bb  

;-------------------------------------------------------------------------------
__bb04:     lda #$00           ; $bb04: a9 00     
            ldx #$06           ; $bb06: a2 06     
__bb08:     dex                ; $bb08: ca        
            sta $9f,x          ; $bb09: 95 9f     
            bne __bb08         ; $bb0b: d0 fb     
            lda $86            ; $bb0d: a5 86     
            sta $03e0          ; $bb0f: 8d e0 03  
            asl                ; $bb12: 0a        
            asl                ; $bb13: 0a        
            asl                ; $bb14: 0a        
            asl                ; $bb15: 0a        
            tay                ; $bb16: a8        
            ldx $f3            ; $bb17: a6 f3     
            stx $1b            ; $bb19: 86 1b     
            lda $0480,x        ; $bb1b: bd 80 04  
            and __baba,y       ; $bb1e: 39 ba ba  
            bne __bba1         ; $bb21: d0 7e     
            iny                ; $bb23: c8        
            txa                ; $bb24: 8a        
            clc                ; $bb25: 18        
            adc __baba,y       ; $bb26: 79 ba ba  
            sta $f1            ; $bb29: 85 f1     
            tax                ; $bb2b: aa        
            iny                ; $bb2c: c8        
            lda $0400,x        ; $bb2d: bd 00 04  
            ora __baba,y       ; $bb30: 19 ba ba  
            sta $0400,x        ; $bb33: 9d 00 04  
            lda #$00           ; $bb36: a9 00     
            sta $f4            ; $bb38: 85 f4     
            jsr __affc         ; $bb3a: 20 fc af  
            jsr __b87d         ; $bb3d: 20 7d b8  
            iny                ; $bb40: c8        
            txa                ; $bb41: 8a        
            clc                ; $bb42: 18        
            adc __baba,y       ; $bb43: 79 ba ba  
            sta $f2            ; $bb46: 85 f2     
            tax                ; $bb48: aa        
            iny                ; $bb49: c8        
            lda $0400,x        ; $bb4a: bd 00 04  
            ora __baba,y       ; $bb4d: 19 ba ba  
            sta $0400,x        ; $bb50: 9d 00 04  
            inc $f4            ; $bb53: e6 f4     
            jsr __affc         ; $bb55: 20 fc af  
            jsr __b87d         ; $bb58: 20 7d b8  
            iny                ; $bb5b: c8        
            ldx $f3            ; $bb5c: a6 f3     
            lda $0480,x        ; $bb5e: bd 80 04  
            ora __baba,y       ; $bb61: 19 ba ba  
            sta $0480,x        ; $bb64: 9d 80 04  
            dec $f4            ; $bb67: c6 f4     
            jsr __b9be         ; $bb69: 20 be b9  
            jsr __ba6d         ; $bb6c: 20 6d ba  
__bb6f:     iny                ; $bb6f: c8        
            txa                ; $bb70: 8a        
            clc                ; $bb71: 18        
            adc __baba,y       ; $bb72: 79 ba ba  
            sta $f3            ; $bb75: 85 f3     
            tax                ; $bb77: aa        
            iny                ; $bb78: c8        
            inc $f4            ; $bb79: e6 f4     
            lda $0480,x        ; $bb7b: bd 80 04  
            ora __baba,y       ; $bb7e: 19 ba ba  
            sta $0480,x        ; $bb81: 9d 80 04  
            lda $0480,x        ; $bb84: bd 80 04  
            cmp #$20           ; $bb87: c9 20     
            bcs __bb91         ; $bb89: b0 06     
            jsr __b9be         ; $bb8b: 20 be b9  
            jsr __ba6d         ; $bb8e: 20 6d ba  
__bb91:     tya                ; $bb91: 98        
            and #$0f           ; $bb92: 29 0f     
            cmp #$0f           ; $bb94: c9 0f     
            bne __bb6f         ; $bb96: d0 d7     
            lda $1b            ; $bb98: a5 1b     
            sta $f3            ; $bb9a: 85 f3     
            lda #$f0           ; $bb9c: a9 f0     
            sta $03e2          ; $bb9e: 8d e2 03  
__bba1:     pla                ; $bba1: 68        
            tay                ; $bba2: a8        
            rts                ; $bba3: 60        

;-------------------------------------------------------------------------------
__bba4:     .hex 00 00 04 fc   ; $bba4: 00 00 04 fc   Data
__bba8:     .hex 04 fc 00 00   ; $bba8: 04 fc 00 00   Data

;-------------------------------------------------------------------------------
__bbac:     lda $f9            ; $bbac: a5 f9     
            beq __bbb1         ; $bbae: f0 01     
            rts                ; $bbb0: 60        

;-------------------------------------------------------------------------------
__bbb1:     lda $022c          ; $bbb1: ad 2c 02  
            ora $0291          ; $bbb4: 0d 91 02  
            ora $0244          ; $bbb7: 0d 44 02  
            bne __bbcf         ; $bbba: d0 13     
            lda $029b          ; $bbbc: ad 9b 02  
            beq __bbdd         ; $bbbf: f0 1c     
            lda $2d            ; $bbc1: a5 2d     
            and #$02           ; $bbc3: 29 02     
            beq __bbc8         ; $bbc5: f0 01     
            rts                ; $bbc7: 60        

;-------------------------------------------------------------------------------
__bbc8:     lda $2d            ; $bbc8: a5 2d     
            and #$f1           ; $bbca: 29 f1     
            bne __bbcf         ; $bbcc: d0 01     
            rts                ; $bbce: 60        

;-------------------------------------------------------------------------------
__bbcf:     lda #$00           ; $bbcf: a9 00     
            sta $029b          ; $bbd1: 8d 9b 02  
            sta $02a6          ; $bbd4: 8d a6 02  
            sta $025a          ; $bbd7: 8d 5a 02  
__bbda:     jmp __bd4e         ; $bbda: 4c 4e bd  

;-------------------------------------------------------------------------------
__bbdd:     lda $025a          ; $bbdd: ad 5a 02  
            bne __bc11         ; $bbe0: d0 2f     
            lda $2d            ; $bbe2: a5 2d     
            eor $2c            ; $bbe4: 45 2c     
            and $2d            ; $bbe6: 25 2d     
            and #$02           ; $bbe8: 29 02     
            beq __bbda         ; $bbea: f0 ee     
            lda #$01           ; $bbec: a9 01     
            sta $0620          ; $bbee: 8d 20 06  
            lda #$0c           ; $bbf1: a9 0c     
            sta $025a          ; $bbf3: 8d 5a 02  
            lda $79            ; $bbf6: a5 79     
            ldx $86            ; $bbf8: a6 86     
            cpx #$02           ; $bbfa: e0 02     
            bcs __bc03         ; $bbfc: b0 05     
            sec                ; $bbfe: 38        
            sbc #$04           ; $bbff: e9 04     
            bne __bc08         ; $bc01: d0 05     
__bc03:     sta $0258          ; $bc03: 8d 58 02  
            sbc #$08           ; $bc06: e9 08     
__bc08:     sta $0255          ; $bc08: 8d 55 02  
            ldx $40            ; $bc0b: a6 40     
            dex                ; $bc0d: ca        
            stx $0252          ; $bc0e: 8e 52 02  
__bc11:     ldx #$02           ; $bc11: a2 02     
            ldy $86            ; $bc13: a4 86     
__bc15:     cpy #$02           ; $bc15: c0 02     
            bcc __bc2b         ; $bc17: 90 12     
            lda $0253,x        ; $bc19: bd 53 02  
            clc                ; $bc1c: 18        
            adc __bba4,y       ; $bc1d: 79 a4 bb  
            sta $0253,x        ; $bc20: 9d 53 02  
            clc                ; $bc23: 18        
            adc #$08           ; $bc24: 69 08     
            sta $0256,x        ; $bc26: 9d 56 02  
            bne __bc35         ; $bc29: d0 0a     
__bc2b:     lda $0250,x        ; $bc2b: bd 50 02  
            clc                ; $bc2e: 18        
            adc __bba8,y       ; $bc2f: 79 a8 bb  
            sta $0250,x        ; $bc32: 9d 50 02  
__bc35:     cpx #$00           ; $bc35: e0 00     
            beq __bc41         ; $bc37: f0 08     
            dex                ; $bc39: ca        
            lda $0250,x        ; $bc3a: bd 50 02  
            cmp #$ef           ; $bc3d: c9 ef     
            bne __bc15         ; $bc3f: d0 d4     
__bc41:     stx $1b            ; $bc41: 86 1b     
            ldx $0229          ; $bc43: ae 29 02  
            ldy #$00           ; $bc46: a0 00     
            lda $86            ; $bc48: a5 86     
            cmp #$02           ; $bc4a: c9 02     
            bne __bc50         ; $bc4c: d0 02     
            ldy #$03           ; $bc4e: a0 03     
__bc50:     cpx #$0c           ; $bc50: e0 0c     
            bne __bc5d         ; $bc52: d0 09     
            lda $02ce          ; $bc54: ad ce 02  
            cmp #$80           ; $bc57: c9 80     
            beq __bc7a         ; $bc59: f0 1f     
            bne __bc70         ; $bc5b: d0 13     
__bc5d:     cpx $02dd          ; $bc5d: ec dd 02  
            bne __bc69         ; $bc60: d0 07     
            lda $02de          ; $bc62: ad de 02  
            cmp #$18           ; $bc65: c9 18     
            bcc __bc70         ; $bc67: 90 07     
__bc69:     lda $029b,x        ; $bc69: bd 9b 02  
            cmp #$04           ; $bc6c: c9 04     
            bcc __bc73         ; $bc6e: 90 03     
__bc70:     jmp __bd16         ; $bc70: 4c 16 bd  

;-------------------------------------------------------------------------------
__bc73:     lda $0244,x        ; $bc73: bd 44 02  
            ora $90,x          ; $bc76: 15 90     
            bne __bc70         ; $bc78: d0 f6     
__bc7a:     lda $79,x          ; $bc7a: b5 79     
            sec                ; $bc7c: 38        
            sbc $0255,y        ; $bc7d: f9 55 02  
            cmp #$09           ; $bc80: c9 09     
            bcs __bc70         ; $bc82: b0 ec     
            lda $86            ; $bc84: a5 86     
            beq __bcad         ; $bc86: f0 25     
            cmp #$01           ; $bc88: c9 01     
            beq __bca1         ; $bc8a: f0 15     
            lda $0252          ; $bc8c: ad 52 02  
            sec                ; $bc8f: 38        
            sbc $40,x          ; $bc90: f5 40     
            bcs __bc9b         ; $bc92: b0 07     
            sta $17            ; $bc94: 85 17     
            lda #$00           ; $bc96: a9 00     
            sec                ; $bc98: 38        
            sbc $17            ; $bc99: e5 17     
__bc9b:     cmp #$05           ; $bc9b: c9 05     
            bcs __bd16         ; $bc9d: b0 77     
            bcc __bcb7         ; $bc9f: 90 16     
__bca1:     lda $0252          ; $bca1: ad 52 02  
            sec                ; $bca4: 38        
            sbc $40,x          ; $bca5: f5 40     
            cmp #$09           ; $bca7: c9 09     
            bcs __bd16         ; $bca9: b0 6b     
            bcc __bcb7         ; $bcab: 90 0a     
__bcad:     lda $40,x          ; $bcad: b5 40     
            sec                ; $bcaf: 38        
            sbc $0252          ; $bcb0: ed 52 02  
            cmp #$09           ; $bcb3: c9 09     
            bcs __bd16         ; $bcb5: b0 5f     
__bcb7:     cpx #$0c           ; $bcb7: e0 0c     
            bne __bcdc         ; $bcb9: d0 21     
            lda #$7f           ; $bcbb: a9 7f     
            sta $02ce          ; $bcbd: 8d ce 02  
            lda $0259          ; $bcc0: ad 59 02  
            and #$1f           ; $bcc3: 29 1f     
            cmp #$07           ; $bcc5: c9 07     
            bne __bcd6         ; $bcc7: d0 0d     
            lda $04fd          ; $bcc9: ad fd 04  
            cmp #$0a           ; $bccc: c9 0a     
            bne __bcd6         ; $bcce: d0 06     
            lda #$05           ; $bcd0: a9 05     
            sta $20            ; $bcd2: 85 20     
            bne __bd22         ; $bcd4: d0 4c     
__bcd6:     lda #$05           ; $bcd6: a9 05     
            sta $1f            ; $bcd8: 85 1f     
            bne __bd22         ; $bcda: d0 46     
__bcdc:     stx $029b          ; $bcdc: 8e 9b 02  
            inc $029b,x        ; $bcdf: fe 9b 02  
            lda $029b,x        ; $bce2: bd 9b 02  
            cmp #$04           ; $bce5: c9 04     
            bne __bcf6         ; $bce7: d0 0d     
            lda #$01           ; $bce9: a9 01     
            sta $061d          ; $bceb: 8d 1d 06  
            lda $86            ; $bcee: a5 86     
            sta $4d,x          ; $bcf0: 95 4d     
            lda #$6e           ; $bcf2: a9 6e     
            bne __bcf8         ; $bcf4: d0 02     
__bcf6:     lda #$3c           ; $bcf6: a9 3c     
__bcf8:     sta $02a6,x        ; $bcf8: 9d a6 02  
            lda #$18           ; $bcfb: a9 18     
            sta $02a6          ; $bcfd: 8d a6 02  
            lda #$00           ; $bd00: a9 00     
            sta $025a          ; $bd02: 8d 5a 02  
            cpx $02dd          ; $bd05: ec dd 02  
            bne __bd58         ; $bd08: d0 4e     
            lda #$00           ; $bd0a: a9 00     
            sta $02dd          ; $bd0c: 8d dd 02  
            lda #$02           ; $bd0f: a9 02     
            sta $0227          ; $bd11: 8d 27 02  
            bne __bd58         ; $bd14: d0 42     
__bd16:     cpx #$0c           ; $bd16: e0 0c     
            beq __bd22         ; $bd18: f0 08     
            dex                ; $bd1a: ca        
            bne __bd1f         ; $bd1b: d0 02     
            ldx #$0c           ; $bd1d: a2 0c     
__bd1f:     jmp __bc50         ; $bd1f: 4c 50 bc  

;-------------------------------------------------------------------------------
__bd22:     dec $025a          ; $bd22: ce 5a 02  
            lda $025a          ; $bd25: ad 5a 02  
            and #$03           ; $bd28: 29 03     
            bne __bd58         ; $bd2a: d0 2c     
            lda $025a          ; $bd2c: ad 5a 02  
            beq __bd4e         ; $bd2f: f0 1d     
            ldx $1b            ; $bd31: a6 1b     
            lda $86            ; $bd33: a5 86     
            cmp #$02           ; $bd35: c9 02     
            bcc __bd44         ; $bd37: 90 0b     
            lda $79            ; $bd39: a5 79     
            sta $0256,x        ; $bd3b: 9d 56 02  
            sec                ; $bd3e: 38        
            sbc #$08           ; $bd3f: e9 08     
            sta $0253,x        ; $bd41: 9d 53 02  
__bd44:     lda $40            ; $bd44: a5 40     
            sec                ; $bd46: 38        
            sbc #$01           ; $bd47: e9 01     
            sta $0250,x        ; $bd49: 9d 50 02  
            bne __bd58         ; $bd4c: d0 0a     
__bd4e:     ldx #$03           ; $bd4e: a2 03     
            lda #$ef           ; $bd50: a9 ef     
__bd52:     dex                ; $bd52: ca        
            sta $0250,x        ; $bd53: 9d 50 02  
            bne __bd52         ; $bd56: d0 fa     
__bd58:     rts                ; $bd58: 60        

;-------------------------------------------------------------------------------
__bd59:     lda $029b          ; $bd59: ad 9b 02  
            ora $025a          ; $bd5c: 0d 5a 02  
            ora $022c          ; $bd5f: 0d 2c 02  
            ora $0291          ; $bd62: 0d 91 02  
            ora $029a          ; $bd65: 0d 9a 02  
            ora $f9            ; $bd68: 05 f9     
            beq __bd6d         ; $bd6a: f0 01     
            rts                ; $bd6c: 60        

;-------------------------------------------------------------------------------
__bd6d:     lda $0228          ; $bd6d: ad 28 02  
            cmp $022f          ; $bd70: cd 2f 02  
            bcs __bd7d         ; $bd73: b0 08     
            lda $0220          ; $bd75: ad 20 02  
            ora $0221          ; $bd78: 0d 21 02  
            bne __bd94         ; $bd7b: d0 17     
__bd7d:     lda $0625          ; $bd7d: ad 25 06  
            bne __bdb3         ; $bd80: d0 31     
            lda #$01           ; $bd82: a9 01     
            sta $0625          ; $bd84: 8d 25 06  
            sta $0626          ; $bd87: 8d 26 06  
            lda #$00           ; $bd8a: a9 00     
            sta $0629          ; $bd8c: 8d 29 06  
            sta $0634          ; $bd8f: 8d 34 06  
            beq __bdb3         ; $bd92: f0 1f     
__bd94:     lda $0259          ; $bd94: ad 59 02  
            and #$03           ; $bd97: 29 03     
            cmp #$03           ; $bd99: c9 03     
            beq __bda1         ; $bd9b: f0 04     
            ldx #$00           ; $bd9d: a2 00     
            beq __bda3         ; $bd9f: f0 02     
__bda1:     ldx #$0b           ; $bda1: a2 0b     
__bda3:     lda $0627,x        ; $bda3: bd 27 06  
            bne __bdb3         ; $bda6: d0 0b     
            lda #$01           ; $bda8: a9 01     
            sta $0627,x        ; $bdaa: 9d 27 06  
            sta $0628,x        ; $bdad: 9d 28 06  
            sta $0629,x        ; $bdb0: 9d 29 06  
__bdb3:     lda #$00           ; $bdb3: a9 00     
            sta $0241          ; $bdb5: 8d 41 02  
            lda $0244          ; $bdb8: ad 44 02  
            beq __be1d         ; $bdbb: f0 60     
            cmp #$19           ; $bdbd: c9 19     
            bcs __be19         ; $bdbf: b0 58     
            lda $0290          ; $bdc1: ad 90 02  
            beq __bdd6         ; $bdc4: f0 10     
            lda $0244          ; $bdc6: ad 44 02  
            cmp #$01           ; $bdc9: c9 01     
            bne __be26         ; $bdcb: d0 59     
            lda #$00           ; $bdcd: a9 00     
            sta $0244          ; $bdcf: 8d 44 02  
            sta $0290          ; $bdd2: 8d 90 02  
            rts                ; $bdd5: 60        

;-------------------------------------------------------------------------------
__bdd6:     lda $0244          ; $bdd6: ad 44 02  
            cmp #$18           ; $bdd9: c9 18     
            beq __bde2         ; $bddb: f0 05     
            cmp #$01           ; $bddd: c9 01     
            beq __bdef         ; $bddf: f0 0e     
            rts                ; $bde1: 60        

;-------------------------------------------------------------------------------
__bde2:     lda $40            ; $bde2: a5 40     
            clc                ; $bde4: 18        
            adc #$15           ; $bde5: 69 15     
            sta $40            ; $bde7: 85 40     
            lda #$01           ; $bde9: a9 01     
            sta $061b          ; $bdeb: 8d 1b 06  
            rts                ; $bdee: 60        

;-------------------------------------------------------------------------------
__bdef:     lda #$01           ; $bdef: a9 01     
            sta $0615          ; $bdf1: 8d 15 06  
            sta $0616          ; $bdf4: 8d 16 06  
            sta $0617          ; $bdf7: 8d 17 06  
            sta $0291          ; $bdfa: 8d 91 02  
            lda $05f4          ; $bdfd: ad f4 05  
            bne __be05         ; $be00: d0 03     
            dec $02c9          ; $be02: ce c9 02  
__be05:     lda $16            ; $be05: a5 16     
            beq __be18         ; $be07: f0 0f     
            lda $02ca          ; $be09: ad ca 02  
            beq __be18         ; $be0c: f0 0a     
            lda $25            ; $be0e: a5 25     
            beq __be16         ; $be10: f0 04     
            dec $25            ; $be12: c6 25     
            beq __be18         ; $be14: f0 02     
__be16:     inc $25            ; $be16: e6 25     
__be18:     rts                ; $be18: 60        

;-------------------------------------------------------------------------------
__be19:     jsr __cee4         ; $be19: 20 e4 ce  
            rts                ; $be1c: 60        

;-------------------------------------------------------------------------------
__be1d:     jsr __cfbc         ; $be1d: 20 bc cf  
            lda $0244          ; $be20: ad 44 02  
            beq __be26         ; $be23: f0 01     
            rts                ; $be25: 60        

;-------------------------------------------------------------------------------
__be26:     ldy #$00           ; $be26: a0 00     
            sty $fc            ; $be28: 84 fc     
            sty $fd            ; $be2a: 84 fd     
            sty $fe            ; $be2c: 84 fe     
            sty $ff            ; $be2e: 84 ff     
            lda $29            ; $be30: a5 29     
            clc                ; $be32: 18        
            adc $79            ; $be33: 65 79     
            and #$0f           ; $be35: 29 0f     
            bne __be45         ; $be37: d0 0c     
            lda $40            ; $be39: a5 40     
            and #$0f           ; $be3b: 29 0f     
            bne __be46         ; $be3d: d0 07     
            jsr __c05f         ; $be3f: 20 5f c0  
            ldy #$00           ; $be42: a0 00     
            iny                ; $be44: c8        
__be45:     iny                ; $be45: c8        
__be46:     lda #$00           ; $be46: a9 00     
            sta $17            ; $be48: 85 17     
            lda $0290          ; $be4a: ad 90 02  
            beq __be52         ; $be4d: f0 03     
            jmp __bed7         ; $be4f: 4c d7 be  

;-------------------------------------------------------------------------------
__be52:     lda $2d            ; $be52: a5 2d     
            and #$01           ; $be54: 29 01     
            sta $17            ; $be56: 85 17     
            beq __bed3         ; $be58: f0 79     
            lda $40            ; $be5a: a5 40     
            and #$1f           ; $be5c: 29 1f     
            sec                ; $be5e: 38        
            sbc #$10           ; $be5f: e9 10     
            sta $1b            ; $be61: 85 1b     
            beq __be72         ; $be63: f0 0d     
            bcs __be6e         ; $be65: b0 07     
            sta $18            ; $be67: 85 18     
            lda #$00           ; $be69: a9 00     
            sec                ; $be6b: 38        
            sbc $18            ; $be6c: e5 18     
__be6e:     cmp #$08           ; $be6e: c9 08     
            bcs __bebd         ; $be70: b0 4b     
__be72:     lda $29            ; $be72: a5 29     
            clc                ; $be74: 18        
            adc $79            ; $be75: 65 79     
            and #$1f           ; $be77: 29 1f     
            sec                ; $be79: 38        
            sbc #$10           ; $be7a: e9 10     
            sta $1c            ; $be7c: 85 1c     
            beq __be8d         ; $be7e: f0 0d     
            bcs __be89         ; $be80: b0 07     
            sta $18            ; $be82: 85 18     
            lda #$00           ; $be84: a9 00     
            sec                ; $be86: 38        
            sbc $18            ; $be87: e5 18     
__be89:     cmp #$06           ; $be89: c9 06     
            bcs __bebd         ; $be8b: b0 30     
__be8d:     jsr __ba8f         ; $be8d: 20 8f ba  
            ldx $f3            ; $be90: a6 f3     
            lda $0480,x        ; $be92: bd 80 04  
            and #$f0           ; $be95: 29 f0     
            bne __bebd         ; $be97: d0 24     
            lda $40            ; $be99: a5 40     
            sec                ; $be9b: 38        
            sbc $1b            ; $be9c: e5 1b     
            sta $40            ; $be9e: 85 40     
            lda $79            ; $bea0: a5 79     
            cmp #$80           ; $bea2: c9 80     
            beq __bead         ; $bea4: f0 07     
            sec                ; $bea6: 38        
            sbc $1c            ; $bea7: e5 1c     
            sta $79            ; $bea9: 85 79     
            bne __beb4         ; $beab: d0 07     
__bead:     lda $29            ; $bead: a5 29     
            sec                ; $beaf: 38        
            sbc $1c            ; $beb0: e5 1c     
            sta $29            ; $beb2: 85 29     
__beb4:     jsr __bafa         ; $beb4: 20 fa ba  
            lda #$01           ; $beb7: a9 01     
            sta $17            ; $beb9: 85 17     
            bne __bece         ; $bebb: d0 11     
__bebd:     lda #$01           ; $bebd: a9 01     
            sta $17            ; $bebf: 85 17     
            lda $2d            ; $bec1: a5 2d     
            and #$f0           ; $bec3: 29 f0     
            bne __bed3         ; $bec5: d0 0c     
            cpy #$02           ; $bec7: c0 02     
            beq __bece         ; $bec9: f0 03     
            jmp __bf3e         ; $becb: 4c 3e bf  

;-------------------------------------------------------------------------------
__bece:     lda #$00           ; $bece: a9 00     
            sta $023b          ; $bed0: 8d 3b 02  
__bed3:     lda $2d            ; $bed3: a5 2d     
            and #$f0           ; $bed5: 29 f0     
__bed7:     lsr                ; $bed7: 4a        
            lsr                ; $bed8: 4a        
            lsr                ; $bed9: 4a        
            tax                ; $beda: aa        
            lda __bee8,x       ; $bedb: bd e8 be  
            sta $1c            ; $bede: 85 1c     
            lda __bee9,x       ; $bee0: bd e9 be  
            sta $1d            ; $bee3: 85 1d     
            jmp ($001c)        ; $bee5: 6c 1c 00  

;-------------------------------------------------------------------------------
__bee8:     .hex 5e            ; $bee8: 5e            Data
__bee9:     .hex c0 24 bf 2a   ; $bee9: c0 24 bf 2a   Data
            .hex bf 3e bf 30   ; $beed: bf 3e bf 30   Data
            .hex bf 08 bf 0f   ; $bef1: bf 08 bf 0f   Data
            .hex bf 3e bf 37   ; $bef5: bf 3e bf 37   Data
            .hex bf 16 bf 1d   ; $bef9: bf 16 bf 1d   Data
            .hex bf 3e bf 3e   ; $befd: bf 3e bf 3e   Data
            .hex bf 3e bf 3e   ; $bf01: bf 3e bf 3e   Data
            .hex bf 3e bf      ; $bf05: bf 3e bf      Data

;-------------------------------------------------------------------------------
            cpy #$00           ; $bf08: c0 00     
            beq __bf6a         ; $bf0a: f0 5e     
__bf0c:     jmp __bfc4         ; $bf0c: 4c c4 bf  

;-------------------------------------------------------------------------------
            cpy #$01           ; $bf0f: c0 01     
            beq __bf0c         ; $bf11: f0 f9     
            jmp __bf97         ; $bf13: 4c 97 bf  

;-------------------------------------------------------------------------------
            cpy #$01           ; $bf16: c0 01     
            bne __bf6a         ; $bf18: d0 50     
            jmp __c011         ; $bf1a: 4c 11 c0  

;-------------------------------------------------------------------------------
            cpy #$00           ; $bf1d: c0 00     
            beq __bf97         ; $bf1f: f0 76     
            jmp __c011         ; $bf21: 4c 11 c0  

;-------------------------------------------------------------------------------
            cpy #$01           ; $bf24: c0 01     
            bne __bf6a         ; $bf26: d0 42     
            beq __bf3e         ; $bf28: f0 14     
            cpy #$01           ; $bf2a: c0 01     
            bne __bf97         ; $bf2c: d0 69     
            beq __bf3e         ; $bf2e: f0 0e     
            cpy #$00           ; $bf30: c0 00     
            beq __bf3e         ; $bf32: f0 0a     
            jmp __bfc4         ; $bf34: 4c c4 bf  

;-------------------------------------------------------------------------------
            cpy #$00           ; $bf37: c0 00     
            beq __bf3e         ; $bf39: f0 03     
            jmp __c011         ; $bf3b: 4c 11 c0  

;-------------------------------------------------------------------------------
__bf3e:     lda $29            ; $bf3e: a5 29     
            clc                ; $bf40: 18        
            adc $79            ; $bf41: 65 79     
            and #$0f           ; $bf43: 29 0f     
            beq __bf52         ; $bf45: f0 0b     
            cmp #$05           ; $bf47: c9 05     
            bcc __bfc4         ; $bf49: 90 79     
            cmp #$0c           ; $bf4b: c9 0c     
            bcc __bf60         ; $bf4d: 90 11     
__bf4f:     jmp __c011         ; $bf4f: 4c 11 c0  

;-------------------------------------------------------------------------------
__bf52:     lda $40            ; $bf52: a5 40     
            and #$0f           ; $bf54: 29 0f     
            beq __bf60         ; $bf56: f0 08     
            cmp #$05           ; $bf58: c9 05     
            bcc __bf6a         ; $bf5a: 90 0e     
            cmp #$0c           ; $bf5c: c9 0c     
            bcs __bf97         ; $bf5e: b0 37     
__bf60:     lda $86            ; $bf60: a5 86     
            beq __bf97         ; $bf62: f0 33     
            cmp #$02           ; $bf64: c9 02     
            beq __bf4f         ; $bf66: f0 e7     
            bcs __bfc4         ; $bf68: b0 5a     
__bf6a:     ldx $17            ; $bf6a: a6 17     
            lda $023a,x        ; $bf6c: bd 3a 02  
            beq __bf92         ; $bf6f: f0 21     
            cmp #$01           ; $bf71: c9 01     
            beq __bf86         ; $bf73: f0 11     
            lda $40            ; $bf75: a5 40     
            and #$0f           ; $bf77: 29 0f     
            cmp #$01           ; $bf79: c9 01     
            bne __bf86         ; $bf7b: d0 09     
            lda #$01           ; $bf7d: a9 01     
            sta $023a,x        ; $bf7f: 9d 3a 02  
            lda $40            ; $bf82: a5 40     
            bne __bf8c         ; $bf84: d0 06     
__bf86:     lda $40            ; $bf86: a5 40     
            cmp $fc            ; $bf88: c5 fc     
            beq __bf92         ; $bf8a: f0 06     
__bf8c:     sec                ; $bf8c: 38        
            sbc $023a,x        ; $bf8d: fd 3a 02  
            sta $40            ; $bf90: 85 40     
__bf92:     lda #$01           ; $bf92: a9 01     
            sta $86            ; $bf94: 85 86     
            rts                ; $bf96: 60        

;-------------------------------------------------------------------------------
__bf97:     ldx $17            ; $bf97: a6 17     
            lda $023a,x        ; $bf99: bd 3a 02  
            beq __bfbf         ; $bf9c: f0 21     
            cmp #$01           ; $bf9e: c9 01     
            beq __bfb3         ; $bfa0: f0 11     
            lda $40            ; $bfa2: a5 40     
            and #$0f           ; $bfa4: 29 0f     
            cmp #$0f           ; $bfa6: c9 0f     
            bne __bfb3         ; $bfa8: d0 09     
            lda #$01           ; $bfaa: a9 01     
            sta $023a,x        ; $bfac: 9d 3a 02  
            lda $40            ; $bfaf: a5 40     
            bne __bfb9         ; $bfb1: d0 06     
__bfb3:     lda $40            ; $bfb3: a5 40     
            cmp $fd            ; $bfb5: c5 fd     
            beq __bfbf         ; $bfb7: f0 06     
__bfb9:     clc                ; $bfb9: 18        
            adc $023a,x        ; $bfba: 7d 3a 02  
            sta $40            ; $bfbd: 85 40     
__bfbf:     lda #$00           ; $bfbf: a9 00     
            sta $86            ; $bfc1: 85 86     
            rts                ; $bfc3: 60        

;-------------------------------------------------------------------------------
__bfc4:     ldx $17            ; $bfc4: a6 17     
            lda $023a,x        ; $bfc6: bd 3a 02  
            beq __c00c         ; $bfc9: f0 41     
            cmp #$01           ; $bfcb: c9 01     
            beq __bfe3         ; $bfcd: f0 14     
            lda $79            ; $bfcf: a5 79     
            clc                ; $bfd1: 18        
            adc $29            ; $bfd2: 65 29     
            and #$0f           ; $bfd4: 29 0f     
            cmp #$01           ; $bfd6: c9 01     
            bne __bfe3         ; $bfd8: d0 09     
            lda #$01           ; $bfda: a9 01     
            sta $023a,x        ; $bfdc: 9d 3a 02  
            lda $79            ; $bfdf: a5 79     
            bne __bfe9         ; $bfe1: d0 06     
__bfe3:     lda $79            ; $bfe3: a5 79     
            cmp $fe            ; $bfe5: c5 fe     
            beq __c00c         ; $bfe7: f0 23     
__bfe9:     cmp #$80           ; $bfe9: c9 80     
            bne __c004         ; $bfeb: d0 17     
            lda $29            ; $bfed: a5 29     
            bne __bff9         ; $bfef: d0 08     
            lda $28            ; $bff1: a5 28     
            and #$01           ; $bff3: 29 01     
            beq __c004         ; $bff5: f0 0d     
            dec $28            ; $bff7: c6 28     
__bff9:     lda $29            ; $bff9: a5 29     
            sec                ; $bffb: 38        
            sbc $023a,x        ; $bffc: fd 3a 02  
            sta $29            ; $bfff: 85 29     
            jmp __c00c         ; $c001: 4c 0c c0  

;-------------------------------------------------------------------------------
__c004:     lda $79            ; $c004: a5 79     
            sec                ; $c006: 38        
            sbc $023a,x        ; $c007: fd 3a 02  
            sta $79            ; $c00a: 85 79     
__c00c:     lda #$03           ; $c00c: a9 03     
            sta $86            ; $c00e: 85 86     
            rts                ; $c010: 60        

;-------------------------------------------------------------------------------
__c011:     ldx $17            ; $c011: a6 17     
            lda $023a,x        ; $c013: bd 3a 02  
            beq __c05a         ; $c016: f0 42     
            cmp #$01           ; $c018: c9 01     
            beq __c030         ; $c01a: f0 14     
            lda $79            ; $c01c: a5 79     
            clc                ; $c01e: 18        
            adc $29            ; $c01f: 65 29     
            and #$0f           ; $c021: 29 0f     
            cmp #$0f           ; $c023: c9 0f     
            bne __c030         ; $c025: d0 09     
            lda #$01           ; $c027: a9 01     
            sta $023a,x        ; $c029: 9d 3a 02  
            lda $79            ; $c02c: a5 79     
            bne __c036         ; $c02e: d0 06     
__c030:     lda $79            ; $c030: a5 79     
            cmp $ff            ; $c032: c5 ff     
            beq __c05a         ; $c034: f0 24     
__c036:     cmp #$80           ; $c036: c9 80     
            bne __c052         ; $c038: d0 18     
            lda $29            ; $c03a: a5 29     
            bne __c044         ; $c03c: d0 06     
            lda $28            ; $c03e: a5 28     
            and #$01           ; $c040: 29 01     
            bne __c052         ; $c042: d0 0e     
__c044:     lda $29            ; $c044: a5 29     
            clc                ; $c046: 18        
            adc $023a,x        ; $c047: 7d 3a 02  
            sta $29            ; $c04a: 85 29     
            bne __c05a         ; $c04c: d0 0c     
            inc $28            ; $c04e: e6 28     
            bne __c05a         ; $c050: d0 08     
__c052:     lda $79            ; $c052: a5 79     
            clc                ; $c054: 18        
            adc $023a,x        ; $c055: 7d 3a 02  
            sta $79            ; $c058: 85 79     
__c05a:     lda #$02           ; $c05a: a9 02     
            sta $86            ; $c05c: 85 86     
            rts                ; $c05e: 60        

;-------------------------------------------------------------------------------
__c05f:     ldx $0241          ; $c05f: ae 41 02  
            beq __c070         ; $c062: f0 0c     
            cpx $02dd          ; $c064: ec dd 02  
            bne __c070         ; $c067: d0 07     
            lda $02de          ; $c069: ad de 02  
            cmp #$18           ; $c06c: c9 18     
            bcc __c097         ; $c06e: 90 27     
__c070:     jsr __d102         ; $c070: 20 02 d1  
            lda $29            ; $c073: a5 29     
            clc                ; $c075: 18        
            adc $79,x          ; $c076: 75 79     
            and #$1f           ; $c078: 29 1f     
            beq __c086         ; $c07a: f0 0a     
            lda $40,x          ; $c07c: b5 40     
            and #$1f           ; $c07e: 29 1f     
            beq __c094         ; $c080: f0 12     
            jsr __c23d         ; $c082: 20 3d c2  
            rts                ; $c085: 60        

;-------------------------------------------------------------------------------
__c086:     lda $40,x          ; $c086: b5 40     
            and #$1f           ; $c088: 29 1f     
            beq __c090         ; $c08a: f0 04     
            jsr __c10e         ; $c08c: 20 0e c1  
            rts                ; $c08f: 60        

;-------------------------------------------------------------------------------
__c090:     jsr __c098         ; $c090: 20 98 c0  
            rts                ; $c093: 60        

;-------------------------------------------------------------------------------
__c094:     jsr __c193         ; $c094: 20 93 c1  
__c097:     rts                ; $c097: 60        

;-------------------------------------------------------------------------------
__c098:     lda #$10           ; $c098: a9 10     
            sta $17            ; $c09a: 85 17     
            ldx $0241          ; $c09c: ae 41 02  
            beq __c0a3         ; $c09f: f0 02     
            inc $17            ; $c0a1: e6 17     
__c0a3:     ldy $04f0          ; $c0a3: ac f0 04  
            lda $0400,y        ; $c0a6: b9 00 04  
            and $17            ; $c0a9: 25 17     
            beq __c0c0         ; $c0ab: f0 13     
            lda $79,x          ; $c0ad: b5 79     
            sta $fe            ; $c0af: 85 fe     
            lda $0400,y        ; $c0b1: b9 00 04  
            and #$10           ; $c0b4: 29 10     
            beq __c0c0         ; $c0b6: f0 08     
            lda $02df,x        ; $c0b8: bd df 02  
            ora #$10           ; $c0bb: 09 10     
            sta $02df,x        ; $c0bd: 9d df 02  
__c0c0:     asl $17            ; $c0c0: 06 17     
            lda $0400,y        ; $c0c2: b9 00 04  
            and $17            ; $c0c5: 25 17     
            beq __c0dc         ; $c0c7: f0 13     
            lda $40,x          ; $c0c9: b5 40     
            sta $fc            ; $c0cb: 85 fc     
            lda $0400,y        ; $c0cd: b9 00 04  
            and #$20           ; $c0d0: 29 20     
            beq __c0dc         ; $c0d2: f0 08     
            lda $02df,x        ; $c0d4: bd df 02  
            ora #$20           ; $c0d7: 09 20     
            sta $02df,x        ; $c0d9: 9d df 02  
__c0dc:     asl $17            ; $c0dc: 06 17     
            lda $0400,y        ; $c0de: b9 00 04  
            and $17            ; $c0e1: 25 17     
            beq __c0f8         ; $c0e3: f0 13     
            lda $79,x          ; $c0e5: b5 79     
            sta $ff            ; $c0e7: 85 ff     
            lda $0400,y        ; $c0e9: b9 00 04  
            and #$40           ; $c0ec: 29 40     
            beq __c0f8         ; $c0ee: f0 08     
            lda $02df,x        ; $c0f0: bd df 02  
            ora #$40           ; $c0f3: 09 40     
            sta $02df,x        ; $c0f5: 9d df 02  
__c0f8:     lda $0400,y        ; $c0f8: b9 00 04  
            and #$88           ; $c0fb: 29 88     
            cmp #$80           ; $c0fd: c9 80     
            bne __c10d         ; $c0ff: d0 0c     
            lda $40,x          ; $c101: b5 40     
            sta $fd            ; $c103: 85 fd     
            lda $02df,x        ; $c105: bd df 02  
            ora #$80           ; $c108: 09 80     
            sta $02df,x        ; $c10a: 9d df 02  
__c10d:     rts                ; $c10d: 60        

;-------------------------------------------------------------------------------
__c10e:     lda #$10           ; $c10e: a9 10     
            sta $17            ; $c110: 85 17     
            ldx $0241          ; $c112: ae 41 02  
            beq __c119         ; $c115: f0 02     
            inc $17            ; $c117: e6 17     
__c119:     ldy $04f0          ; $c119: ac f0 04  
            lda $0400,y        ; $c11c: b9 00 04  
            and $17            ; $c11f: 25 17     
            beq __c136         ; $c121: f0 13     
            lda $79,x          ; $c123: b5 79     
            sta $fe            ; $c125: 85 fe     
            lda $0400,y        ; $c127: b9 00 04  
            and #$10           ; $c12a: 29 10     
            beq __c136         ; $c12c: f0 08     
            lda $02df,x        ; $c12e: bd df 02  
            ora #$10           ; $c131: 09 10     
            sta $02df,x        ; $c133: 9d df 02  
__c136:     lda $0400,y        ; $c136: b9 00 04  
            and #$a2           ; $c139: 29 a2     
            cmp #$a0           ; $c13b: c9 a0     
            bne __c14b         ; $c13d: d0 0c     
            lda $40,x          ; $c13f: b5 40     
            sta $fc            ; $c141: 85 fc     
            lda $02df,x        ; $c143: bd df 02  
            ora #$20           ; $c146: 09 20     
            sta $02df,x        ; $c148: 9d df 02  
__c14b:     asl $17            ; $c14b: 06 17     
            asl $17            ; $c14d: 06 17     
            lda $0400,y        ; $c14f: b9 00 04  
            and $17            ; $c152: 25 17     
            beq __c169         ; $c154: f0 13     
            lda $79,x          ; $c156: b5 79     
            sta $ff            ; $c158: 85 ff     
            lda $0400,y        ; $c15a: b9 00 04  
            and #$40           ; $c15d: 29 40     
            beq __c169         ; $c15f: f0 08     
            lda $02df,x        ; $c161: bd df 02  
            ora #$40           ; $c164: 09 40     
            sta $02df,x        ; $c166: 9d df 02  
__c169:     asl $17            ; $c169: 06 17     
            lda $0400,y        ; $c16b: b9 00 04  
            and $17            ; $c16e: 25 17     
            and #$08           ; $c170: 29 08     
            bne __c17d         ; $c172: d0 09     
            lda $0401,y        ; $c174: b9 01 04  
            and #$f0           ; $c177: 29 f0     
            cmp #$80           ; $c179: c9 80     
            bne __c192         ; $c17b: d0 15     
__c17d:     lda $40,x          ; $c17d: b5 40     
            sta $fd            ; $c17f: 85 fd     
            lda $0401,y        ; $c181: b9 01 04  
            and #$f0           ; $c184: 29 f0     
            cmp #$80           ; $c186: c9 80     
            bne __c192         ; $c188: d0 08     
            lda $02df,x        ; $c18a: bd df 02  
            ora #$80           ; $c18d: 09 80     
            sta $02df,x        ; $c18f: 9d df 02  
__c192:     rts                ; $c192: 60        

;-------------------------------------------------------------------------------
__c193:     lda #$10           ; $c193: a9 10     
            sta $17            ; $c195: 85 17     
            ldx $0241          ; $c197: ae 41 02  
            beq __c19e         ; $c19a: f0 02     
            inc $17            ; $c19c: e6 17     
__c19e:     ldy $04f0          ; $c19e: ac f0 04  
            lda $0400,y        ; $c1a1: b9 00 04  
            and #$b3           ; $c1a4: 29 b3     
            cmp #$b0           ; $c1a6: c9 b0     
            bne __c1c3         ; $c1a8: d0 19     
            lda $79,x          ; $c1aa: b5 79     
            sta $fe            ; $c1ac: 85 fe     
            cpx #$00           ; $c1ae: e0 00     
            beq __c1c3         ; $c1b0: f0 11     
            lda $02df,x        ; $c1b2: bd df 02  
            bne __c1be         ; $c1b5: d0 07     
            ora #$10           ; $c1b7: 09 10     
            sta $02df,x        ; $c1b9: 9d df 02  
            bne __c1c3         ; $c1bc: d0 05     

;-------------------------------------------------------------------------------
__c1be:     lda #$02           ; $c1be: a9 02     
            sta $86,x          ; $c1c0: 95 86     
            rts                ; $c1c2: 60        

;-------------------------------------------------------------------------------
__c1c3:     asl $17            ; $c1c3: 06 17     
            lda $0400,y        ; $c1c5: b9 00 04  
            and $17            ; $c1c8: 25 17     
            bne __c1eb         ; $c1ca: d0 1f     
            lda $0408,y        ; $c1cc: b9 08 04  
            and $17            ; $c1cf: 25 17     
            bne __c1eb         ; $c1d1: d0 18     
            lsr $17            ; $c1d3: 46 17     
            lda $0407,y        ; $c1d5: b9 07 04  
            and $17            ; $c1d8: 25 17     
            and #$11           ; $c1da: 29 11     
            bne __c1eb         ; $c1dc: d0 0d     
            asl $17            ; $c1de: 06 17     
            asl $17            ; $c1e0: 06 17     
            lda $03ff,y        ; $c1e2: b9 ff 03  
            and $17            ; $c1e5: 25 17     
            and #$44           ; $c1e7: 29 44     
            beq __c217         ; $c1e9: f0 2c     
__c1eb:     cpx #$00           ; $c1eb: e0 00     
            beq __c213         ; $c1ed: f0 24     
            lda $0400,y        ; $c1ef: b9 00 04  
            and #$20           ; $c1f2: 29 20     
            bne __c20b         ; $c1f4: d0 15     
            lda $0408,y        ; $c1f6: b9 08 04  
            and #$20           ; $c1f9: 29 20     
            bne __c20b         ; $c1fb: d0 0e     
            lda $03ff,y        ; $c1fd: b9 ff 03  
            and #$44           ; $c200: 29 44     
            bne __c20b         ; $c202: d0 07     
            lda $0407,y        ; $c204: b9 07 04  
            and #$11           ; $c207: 29 11     
            beq __c213         ; $c209: f0 08     
__c20b:     lda $02df,x        ; $c20b: bd df 02  
            ora #$20           ; $c20e: 09 20     
            sta $02df,x        ; $c210: 9d df 02  
__c213:     lda $40,x          ; $c213: b5 40     
            sta $fc            ; $c215: 85 fc     
__c217:     lda $0408,y        ; $c217: b9 08 04  
            and #$e6           ; $c21a: 29 e6     
            cmp #$e0           ; $c21c: c9 e0     
            bne __c23c         ; $c21e: d0 1c     
            lda $79,x          ; $c220: b5 79     
            sta $ff            ; $c222: 85 ff     
            cpx #$00           ; $c224: e0 00     
            beq __c23c         ; $c226: f0 14     
            lda $02df,x        ; $c228: bd df 02  
            and #$0f           ; $c22b: 29 0f     
            bne __c238         ; $c22d: d0 09     
            lda $02df,x        ; $c22f: bd df 02  
            ora #$40           ; $c232: 09 40     
            sta $02df,x        ; $c234: 9d df 02  
            rts                ; $c237: 60        

;-------------------------------------------------------------------------------
__c238:     lda #$03           ; $c238: a9 03     
            sta $86,x          ; $c23a: 95 86     

;-------------------------------------------------------------------------------
__c23c:     rts                ; $c23c: 60        

;-------------------------------------------------------------------------------
__c23d:     lda #$50           ; $c23d: a9 50     
            ldx $0241          ; $c23f: ae 41 02  
            beq __c246         ; $c242: f0 02     
            lda #$57           ; $c244: a9 57     
__c246:     sta $17            ; $c246: 85 17     
            ldy $04f0          ; $c248: ac f0 04  
            lda $0400,y        ; $c24b: b9 00 04  
            and #$99           ; $c24e: 29 99     
            cmp #$90           ; $c250: c9 90     
            bne __c276         ; $c252: d0 22     
            lda $0400,y        ; $c254: b9 00 04  
            and #$bb           ; $c257: 29 bb     
            cmp #$b0           ; $c259: c9 b0     
            beq __c276         ; $c25b: f0 19     
            lda $79,x          ; $c25d: b5 79     
            sta $fe            ; $c25f: 85 fe     
            cpx #$00           ; $c261: e0 00     
            beq __c276         ; $c263: f0 11     
            lda $02df,x        ; $c265: bd df 02  
            bne __c271         ; $c268: d0 07     
            ora #$10           ; $c26a: 09 10     
            sta $02df,x        ; $c26c: 9d df 02  
            bne __c276         ; $c26f: d0 05     

;-------------------------------------------------------------------------------
__c271:     lda #$02           ; $c271: a9 02     
            sta $86,x          ; $c273: 95 86     
            rts                ; $c275: 60        

;-------------------------------------------------------------------------------
__c276:     lda $0408,y        ; $c276: b9 08 04  
            and #$cc           ; $c279: 29 cc     
            cmp #$c0           ; $c27b: c9 c0     
            bne __c2a6         ; $c27d: d0 27     
            lda $0408,y        ; $c27f: b9 08 04  
            and #$ee           ; $c282: 29 ee     
            cmp #$e0           ; $c284: c9 e0     
            beq __c2a6         ; $c286: f0 1e     
            lda $79,x          ; $c288: b5 79     
            sta $ff            ; $c28a: 85 ff     
            cpx #$00           ; $c28c: e0 00     
            beq __c2a6         ; $c28e: f0 16     
            lda $02df,x        ; $c290: bd df 02  
            and #$0f           ; $c293: 29 0f     
            bne __c2a1         ; $c295: d0 0a     
            lda $02df,x        ; $c297: bd df 02  
            ora #$40           ; $c29a: 09 40     
            sta $02df,x        ; $c29c: 9d df 02  
            bne __c2a6         ; $c29f: d0 05     

;-------------------------------------------------------------------------------
__c2a1:     lda #$03           ; $c2a1: a9 03     
            sta $86,x          ; $c2a3: 95 86     
            rts                ; $c2a5: 60        

;-------------------------------------------------------------------------------
__c2a6:     lda $0401,y        ; $c2a6: b9 01 04  
            and $17            ; $c2a9: 25 17     
            and #$46           ; $c2ab: 29 46     
            bne __c2ca         ; $c2ad: d0 1b     
            lda $0401,y        ; $c2af: b9 01 04  
            and #$f0           ; $c2b2: 29 f0     
            cmp #$80           ; $c2b4: c9 80     
            beq __c2ca         ; $c2b6: f0 12     
            lda $0409,y        ; $c2b8: b9 09 04  
            and $17            ; $c2bb: 25 17     
            and #$13           ; $c2bd: 29 13     
            bne __c2ca         ; $c2bf: d0 09     
            lda $0409,y        ; $c2c1: b9 09 04  
            and #$f0           ; $c2c4: 29 f0     
            cmp #$80           ; $c2c6: c9 80     
            bne __c2f6         ; $c2c8: d0 2c     
__c2ca:     lda $40,x          ; $c2ca: b5 40     
            sta $fd            ; $c2cc: 85 fd     
            lda $0401,y        ; $c2ce: b9 01 04  
            and #$f0           ; $c2d1: 29 f0     
            cmp #$80           ; $c2d3: c9 80     
            beq __c2ee         ; $c2d5: f0 17     
            lda $0409,y        ; $c2d7: b9 09 04  
            and #$f0           ; $c2da: 29 f0     
            cmp #$80           ; $c2dc: c9 80     
            beq __c2ee         ; $c2de: f0 0e     
            lda $0401,y        ; $c2e0: b9 01 04  
            and #$44           ; $c2e3: 29 44     
            bne __c2ee         ; $c2e5: d0 07     
            lda $0409,y        ; $c2e7: b9 09 04  
            and #$11           ; $c2ea: 29 11     
            beq __c2f6         ; $c2ec: f0 08     
__c2ee:     lda $02df,x        ; $c2ee: bd df 02  
            ora #$80           ; $c2f1: 09 80     
            sta $02df,x        ; $c2f3: 9d df 02  
__c2f6:     rts                ; $c2f6: 60        

;-------------------------------------------------------------------------------
__c2f7:     ldx #$06           ; $c2f7: a2 06     
            lda #$00           ; $c2f9: a9 00     
__c2fb:     dex                ; $c2fb: ca        
            sta $17,x          ; $c2fc: 95 17     
            bne __c2fb         ; $c2fe: d0 fb     
            lda $0291          ; $c300: ad 91 02  
            beq __c34c         ; $c303: f0 47     
            cmp #$20           ; $c305: c9 20     
            beq __c322         ; $c307: f0 19     
            cmp #$10           ; $c309: c9 10     
            bcs __c32d         ; $c30b: b0 20     
            cmp #$01           ; $c30d: c9 01     
            beq __c370         ; $c30f: f0 5f     
            lda #$fc           ; $c311: a9 fc     
            sta $4d            ; $c313: 85 4d     
            sta $58            ; $c315: 85 58     
            lda #$00           ; $c317: a9 00     
            sta $63            ; $c319: 85 63     
            ora #$40           ; $c31b: 09 40     
            sta $6e            ; $c31d: 85 6e     
            jmp __c45e         ; $c31f: 4c 5e c4  

;-------------------------------------------------------------------------------
__c322:     lda #$01           ; $c322: a9 01     
            sta $0615          ; $c324: 8d 15 06  
            sta $0616          ; $c327: 8d 16 06  
            sta $0617          ; $c32a: 8d 17 06  
__c32d:     ldy #$00           ; $c32d: a0 00     
            lda $86            ; $c32f: a5 86     
            cmp #$03           ; $c331: c9 03     
            bne __c337         ; $c333: d0 02     
            ldy #$40           ; $c335: a0 40     
__c337:     sty $63            ; $c337: 84 63     
            sty $6e            ; $c339: 84 6e     
            lda $0291          ; $c33b: ad 91 02  
            cmp #$21           ; $c33e: c9 21     
            bcc __c347         ; $c340: 90 05     
            lda #$f4           ; $c342: a9 f4     
            jmp __c446         ; $c344: 4c 46 c4  

;-------------------------------------------------------------------------------
__c347:     lda #$f8           ; $c347: a9 f8     
            jmp __c446         ; $c349: 4c 46 c4  

;-------------------------------------------------------------------------------
__c34c:     lda $022c          ; $c34c: ad 2c 02  
            ora $029a          ; $c34f: 0d 9a 02  
            beq __c363         ; $c352: f0 0f     
            lda $022f          ; $c354: ad 2f 02  
            bne __c3ba         ; $c357: d0 61     
            lda $86            ; $c359: a5 86     
            beq __c360         ; $c35b: f0 03     
            jmp __c42a         ; $c35d: 4c 2a c4  

;-------------------------------------------------------------------------------
__c360:     jmp __c426         ; $c360: 4c 26 c4  

;-------------------------------------------------------------------------------
__c363:     lda $0244          ; $c363: ad 44 02  
            beq __c3ba         ; $c366: f0 52     
            cmp #$19           ; $c368: c9 19     
            bcs __c377         ; $c36a: b0 0b     
            cmp #$01           ; $c36c: c9 01     
            bne __c399         ; $c36e: d0 29     
__c370:     lda #$f0           ; $c370: a9 f0     
            sta $40            ; $c372: 85 40     
            jmp __c4b1         ; $c374: 4c b1 c4  

;-------------------------------------------------------------------------------
__c377:     ldy #$00           ; $c377: a0 00     
            lda $86            ; $c379: a5 86     
            cmp #$03           ; $c37b: c9 03     
            bne __c381         ; $c37d: d0 02     
            ldy #$40           ; $c37f: a0 40     
__c381:     sty $63            ; $c381: 84 63     
            sty $6e            ; $c383: 84 6e     
            lda $04f1          ; $c385: ad f1 04  
            and #$04           ; $c388: 29 04     
            beq __c390         ; $c38a: f0 04     
            lda #$ff           ; $c38c: a9 ff     
            bne __c392         ; $c38e: d0 02     
__c390:     lda #$01           ; $c390: a9 01     
__c392:     sta $1a            ; $c392: 85 1a     
            lda #$a4           ; $c394: a9 a4     
            jmp __c446         ; $c396: 4c 46 c4  

;-------------------------------------------------------------------------------
__c399:     lda $0290          ; $c399: ad 90 02  
            bne __c3ba         ; $c39c: d0 1c     
            lda $0244          ; $c39e: ad 44 02  
            cmp #$0c           ; $c3a1: c9 0c     
            bcc __c3a9         ; $c3a3: 90 04     
            lda #$a8           ; $c3a5: a9 a8     
            bne __c3ab         ; $c3a7: d0 02     
__c3a9:     lda #$aa           ; $c3a9: a9 aa     
__c3ab:     sta $4d            ; $c3ab: 85 4d     
            sta $58            ; $c3ad: 85 58     
            lda #$20           ; $c3af: a9 20     
            sta $63            ; $c3b1: 85 63     
            ora #$40           ; $c3b3: 09 40     
            sta $6e            ; $c3b5: 85 6e     
            jmp __c45e         ; $c3b7: 4c 5e c4  

;-------------------------------------------------------------------------------
__c3ba:     lda $025a          ; $c3ba: ad 5a 02  
            ora $029b          ; $c3bd: 0d 9b 02  
            sta $1b            ; $c3c0: 85 1b     
            beq __c3ca         ; $c3c2: f0 06     
            lda #$70           ; $c3c4: a9 70     
            sta $17            ; $c3c6: 85 17     
            bne __c42a         ; $c3c8: d0 60     
__c3ca:     lda $2d            ; $c3ca: a5 2d     
            and #$01           ; $c3cc: 29 01     
            beq __c3ee         ; $c3ce: f0 1e     
            lda $061f          ; $c3d0: ad 1f 06  
            bne __c3da         ; $c3d3: d0 05     
            lda #$01           ; $c3d5: a9 01     
            sta $061f          ; $c3d7: 8d 1f 06  
__c3da:     lda #$18           ; $c3da: a9 18     
            sta $17            ; $c3dc: 85 17     
            lda #$02           ; $c3de: a9 02     
            sta $19            ; $c3e0: 85 19     
            inc $0242          ; $c3e2: ee 42 02  
            lda $0242          ; $c3e5: ad 42 02  
            and #$04           ; $c3e8: 29 04     
            beq __c42a         ; $c3ea: f0 3e     
            bne __c413         ; $c3ec: d0 25     
__c3ee:     lda $061f          ; $c3ee: ad 1f 06  
            beq __c3f8         ; $c3f1: f0 05     
            lda #$00           ; $c3f3: a9 00     
            sta $061f          ; $c3f5: 8d 1f 06  
__c3f8:     lda $0290          ; $c3f8: ad 90 02  
            bne __c403         ; $c3fb: d0 06     
            lda $2d            ; $c3fd: a5 2d     
            and #$f0           ; $c3ff: 29 f0     
            beq __c406         ; $c401: f0 03     
__c403:     inc $0242          ; $c403: ee 42 02  
__c406:     lda $86            ; $c406: a5 86     
            cmp #$02           ; $c408: c9 02     
            bcc __c419         ; $c40a: 90 0d     
            lda $0242          ; $c40c: ad 42 02  
            and #$08           ; $c40f: 29 08     
            beq __c42a         ; $c411: f0 17     
__c413:     lda #$04           ; $c413: a9 04     
            sta $18            ; $c415: 85 18     
            bne __c42a         ; $c417: d0 11     
__c419:     lda $0242          ; $c419: ad 42 02  
            and #$0c           ; $c41c: 29 0c     
            cmp #$0c           ; $c41e: c9 0c     
            beq __c42a         ; $c420: f0 08     
            cmp #$04           ; $c422: c9 04     
            beq __c413         ; $c424: f0 ed     
__c426:     lda #$04           ; $c426: a9 04     
            sta $1c            ; $c428: 85 1c     
__c42a:     ldy #$00           ; $c42a: a0 00     
            ldx $86            ; $c42c: a6 86     
            cpx #$03           ; $c42e: e0 03     
            bne __c435         ; $c430: d0 03     
            dex                ; $c432: ca        
            ldy #$40           ; $c433: a0 40     
__c435:     sty $63            ; $c435: 84 63     
            sty $6e            ; $c437: 84 6e     
            txa                ; $c439: 8a        
            ldx $1b            ; $c43a: a6 1b     
            bne __c43f         ; $c43c: d0 01     
            asl                ; $c43e: 0a        
__c43f:     asl                ; $c43f: 0a        
            asl                ; $c440: 0a        
            clc                ; $c441: 18        
            adc $17            ; $c442: 65 17     
            adc $18            ; $c444: 65 18     
__c446:     ldx $86            ; $c446: a6 86     
            cpx #$03           ; $c448: e0 03     
            bne __c455         ; $c44a: d0 09     
            sta $58            ; $c44c: 85 58     
            clc                ; $c44e: 18        
            adc #$02           ; $c44f: 69 02     
            sta $4d            ; $c451: 85 4d     
            bne __c45e         ; $c453: d0 09     
__c455:     sta $4d            ; $c455: 85 4d     
            clc                ; $c457: 18        
            adc #$02           ; $c458: 69 02     
            adc $1c            ; $c45a: 65 1c     
            sta $58            ; $c45c: 85 58     
__c45e:     lda #$10           ; $c45e: a9 10     
            tax                ; $c460: aa        
            lda $4d            ; $c461: a5 4d     
            sta $0701,x        ; $c463: 9d 01 07  
            lda $58            ; $c466: a5 58     
            sta $0705,x        ; $c468: 9d 05 07  
            lda $63            ; $c46b: a5 63     
            sta $0702,x        ; $c46d: 9d 02 07  
            lda $6e            ; $c470: a5 6e     
            sta $0706,x        ; $c472: 9d 06 07  
            lda $40            ; $c475: a5 40     
            sec                ; $c477: 38        
            sbc #$01           ; $c478: e9 01     
            clc                ; $c47a: 18        
            adc $1a            ; $c47b: 65 1a     
            sta $0700,x        ; $c47d: 9d 00 07  
            sta $0704,x        ; $c480: 9d 04 07  
            lda $79            ; $c483: a5 79     
            ldy $86            ; $c485: a4 86     
            cpy #$02           ; $c487: c0 02     
            beq __c491         ; $c489: f0 06     
            bcs __c496         ; $c48b: b0 09     
            ldy #$00           ; $c48d: a0 00     
            sty $19            ; $c48f: 84 19     
__c491:     sec                ; $c491: 38        
            sbc $19            ; $c492: e5 19     
            bne __c499         ; $c494: d0 03     
__c496:     clc                ; $c496: 18        
            adc $19            ; $c497: 65 19     
__c499:     sta $0707,x        ; $c499: 9d 07 07  
            ldy $0291          ; $c49c: ac 91 02  
            beq __c4ab         ; $c49f: f0 0a     
            cpy #$10           ; $c4a1: c0 10     
            bcs __c4ab         ; $c4a3: b0 06     
            sec                ; $c4a5: 38        
            sbc #$07           ; $c4a6: e9 07     
            jmp __c4ae         ; $c4a8: 4c ae c4  

;-------------------------------------------------------------------------------
__c4ab:     sec                ; $c4ab: 38        
            sbc #$08           ; $c4ac: e9 08     
__c4ae:     sta $0703,x        ; $c4ae: 9d 03 07  
__c4b1:     rts                ; $c4b1: 60        

;-------------------------------------------------------------------------------
__c4b2:     lda #$c0           ; $c4b2: a9 c0     
            clc                ; $c4b4: 18        
            adc $0240          ; $c4b5: 6d 40 02  
            tax                ; $c4b8: aa        
            ldy #$02           ; $c4b9: a0 02     
            lda #$00           ; $c4bb: a9 00     
            sta $18            ; $c4bd: 85 18     
            lda $029b          ; $c4bf: ad 9b 02  
            beq __c4e4         ; $c4c2: f0 20     
            lda $2d            ; $c4c4: a5 2d     
            and #$02           ; $c4c6: 29 02     
            beq __c4e4         ; $c4c8: f0 1a     
            lda $061e          ; $c4ca: ad 1e 06  
            bne __c4d4         ; $c4cd: d0 05     
            lda #$01           ; $c4cf: a9 01     
            sta $061e          ; $c4d1: 8d 1e 06  
__c4d4:     lda $26            ; $c4d4: a5 26     
            and #$02           ; $c4d6: 29 02     
            beq __c4de         ; $c4d8: f0 04     
            lda #$01           ; $c4da: a9 01     
            bne __c4e0         ; $c4dc: d0 02     
__c4de:     lda #$ff           ; $c4de: a9 ff     
__c4e0:     sta $18            ; $c4e0: 85 18     
            bne __c4ee         ; $c4e2: d0 0a     
__c4e4:     lda $061e          ; $c4e4: ad 1e 06  
            beq __c4ee         ; $c4e7: f0 05     
            lda #$00           ; $c4e9: a9 00     
            sta $061e          ; $c4eb: 8d 1e 06  
__c4ee:     lda $86            ; $c4ee: a5 86     
            beq __c4fc         ; $c4f0: f0 0a     
            cmp #$02           ; $c4f2: c9 02     
            beq __c53d         ; $c4f4: f0 47     
            bcs __c52c         ; $c4f6: b0 34     
            lda #$00           ; $c4f8: a9 00     
            beq __c4fe         ; $c4fa: f0 02     
__c4fc:     lda #$80           ; $c4fc: a9 80     
__c4fe:     sta $0706,x        ; $c4fe: 9d 06 07  
            lda #$68           ; $c501: a9 68     
            sta $0705,x        ; $c503: 9d 05 07  
__c506:     lda #$6a           ; $c506: a9 6a     
            sta $0701,x        ; $c508: 9d 01 07  
            lda #$00           ; $c50b: a9 00     
            sta $0702,x        ; $c50d: 9d 02 07  
__c510:     lda $0250,y        ; $c510: b9 50 02  
            sta $0704,x        ; $c513: 9d 04 07  
            lda $0255          ; $c516: ad 55 02  
            clc                ; $c519: 18        
            adc $18            ; $c51a: 65 18     
            sta $0707,x        ; $c51c: 9d 07 07  
            cpy #$00           ; $c51f: c0 00     
            beq __c585         ; $c521: f0 62     
            dex                ; $c523: ca        
            dex                ; $c524: ca        
            dex                ; $c525: ca        
            dex                ; $c526: ca        
            dey                ; $c527: 88        
            beq __c510         ; $c528: f0 e6     
            bne __c506         ; $c52a: d0 da     
__c52c:     lda #$40           ; $c52c: a9 40     
            sta $070e,x        ; $c52e: 9d 0e 07  
            sta $070a,x        ; $c531: 9d 0a 07  
            lda #$6c           ; $c534: a9 6c     
            sta $070d,x        ; $c536: 9d 0d 07  
            lda #$6e           ; $c539: a9 6e     
            bne __c54c         ; $c53b: d0 0f     
__c53d:     lda #$00           ; $c53d: a9 00     
            sta $070e,x        ; $c53f: 9d 0e 07  
            sta $070a,x        ; $c542: 9d 0a 07  
            lda #$6e           ; $c545: a9 6e     
            sta $070d,x        ; $c547: 9d 0d 07  
            lda #$6c           ; $c54a: a9 6c     
__c54c:     sta $0709,x        ; $c54c: 9d 09 07  
__c54f:     lda #$00           ; $c54f: a9 00     
            sta $0706,x        ; $c551: 9d 06 07  
            sta $0702,x        ; $c554: 9d 02 07  
            lda #$6e           ; $c557: a9 6e     
            sta $0705,x        ; $c559: 9d 05 07  
            sta $0701,x        ; $c55c: 9d 01 07  
__c55f:     lda $0250,y        ; $c55f: b9 50 02  
            clc                ; $c562: 18        
            adc $18            ; $c563: 65 18     
            sta $070c,x        ; $c565: 9d 0c 07  
            sta $0708,x        ; $c568: 9d 08 07  
            lda $0253,y        ; $c56b: b9 53 02  
            sta $070f,x        ; $c56e: 9d 0f 07  
            lda $0256,y        ; $c571: b9 56 02  
            sta $070b,x        ; $c574: 9d 0b 07  
            txa                ; $c577: 8a        
            sec                ; $c578: 38        
            sbc #$08           ; $c579: e9 08     
            tax                ; $c57b: aa        
            cpy #$00           ; $c57c: c0 00     
            beq __c585         ; $c57e: f0 05     
            dey                ; $c580: 88        
            beq __c55f         ; $c581: f0 dc     
            bne __c54f         ; $c583: d0 ca     
__c585:     rts                ; $c585: 60        

;-------------------------------------------------------------------------------
__c586:     ldx $022a          ; $c586: ae 2a 02  
            bne __c58c         ; $c589: d0 01     
            rts                ; $c58b: 60        

;-------------------------------------------------------------------------------
__c58c:     stx $0241          ; $c58c: 8e 41 02  
            lda $0244,x        ; $c58f: bd 44 02  
            beq __c596         ; $c592: f0 02     
            bne __c5b0         ; $c594: d0 1a     
__c596:     lda $0291          ; $c596: ad 91 02  
            ora $f9            ; $c599: 05 f9     
            bne __c5a5         ; $c59b: d0 08     
            lda $02e9,x        ; $c59d: bd e9 02  
            beq __c5b0         ; $c5a0: f0 0e     
            dec $02e9,x        ; $c5a2: de e9 02  
__c5a5:     lda $02e9,x        ; $c5a5: bd e9 02  
            beq __c5b0         ; $c5a8: f0 06     
            cmp #$20           ; $c5aa: c9 20     
            beq __c5bd         ; $c5ac: f0 0f     
            bcc __c5b3         ; $c5ae: 90 03     
__c5b0:     jmp __c6fd         ; $c5b0: 4c fd c6  

;-------------------------------------------------------------------------------
__c5b3:     cmp #$1c           ; $c5b3: c9 1c     
            bcs __c5c8         ; $c5b5: b0 11     
            cmp #$18           ; $c5b7: c9 18     
            bcs __c5ce         ; $c5b9: b0 13     
            bcc __c5d4         ; $c5bb: 90 17     
__c5bd:     dec $02e9,x        ; $c5bd: de e9 02  
            lda #$01           ; $c5c0: a9 01     
            sta $0622          ; $c5c2: 8d 22 06  
            jmp __c6fd         ; $c5c5: 4c fd c6  

;-------------------------------------------------------------------------------
__c5c8:     ldx #$02           ; $c5c8: a2 02     
            lda #$d0           ; $c5ca: a9 d0     
            bne __c5e0         ; $c5cc: d0 12     
__c5ce:     ldx #$04           ; $c5ce: a2 04     
            lda #$d4           ; $c5d0: a9 d4     
            bne __c5e0         ; $c5d2: d0 0c     
__c5d4:     ldx #$06           ; $c5d4: a2 06     
            and #$04           ; $c5d6: 29 04     
            beq __c5de         ; $c5d8: f0 04     
            lda #$dc           ; $c5da: a9 dc     
            bne __c5e0         ; $c5dc: d0 02     
__c5de:     lda #$e8           ; $c5de: a9 e8     
__c5e0:     sta $17            ; $c5e0: 85 17     
            stx $18            ; $c5e2: 86 18     
            ldx $0241          ; $c5e4: ae 41 02  
            lda $86,x          ; $c5e7: b5 86     
            cmp #$02           ; $c5e9: c9 02     
            bne __c5fc         ; $c5eb: d0 0f     
            lda #$01           ; $c5ed: a9 01     
            sta $19            ; $c5ef: 85 19     
            lda #$08           ; $c5f1: a9 08     
            sta $1a            ; $c5f3: 85 1a     
            lda $79,x          ; $c5f5: b5 79     
            sta $1b            ; $c5f7: 85 1b     
            jmp __c60b         ; $c5f9: 4c 0b c6  

;-------------------------------------------------------------------------------
__c5fc:     lda #$41           ; $c5fc: a9 41     
            sta $19            ; $c5fe: 85 19     
            lda #$f8           ; $c600: a9 f8     
            sta $1a            ; $c602: 85 1a     
            lda $79,x          ; $c604: b5 79     
            sec                ; $c606: 38        
            sbc #$08           ; $c607: e9 08     
            sta $1b            ; $c609: 85 1b     
__c60b:     lda #$d0           ; $c60b: a9 d0     
            clc                ; $c60d: 18        
            adc $0240          ; $c60e: 6d 40 02  
            tay                ; $c611: a8        
            ldx #$00           ; $c612: a2 00     
__c614:     inx                ; $c614: e8        
            cpx $0241          ; $c615: ec 41 02  
            beq __c62f         ; $c618: f0 15     
            bmi __c623         ; $c61a: 30 07     
            lda $02e9,x        ; $c61c: bd e9 02  
            beq __c62f         ; $c61f: f0 0e     
            bne __c634         ; $c621: d0 11     
__c623:     lda $02e9,x        ; $c623: bd e9 02  
            beq __c62f         ; $c626: f0 07     
            tya                ; $c628: 98        
            clc                ; $c629: 18        
            adc #$18           ; $c62a: 69 18     
            tay                ; $c62c: a8        
            bne __c634         ; $c62d: d0 05     
__c62f:     cpx $022a          ; $c62f: ec 2a 02  
            bne __c614         ; $c632: d0 e0     
__c634:     ldx $0241          ; $c634: ae 41 02  
            lda #$00           ; $c637: a9 00     
            sta $1d            ; $c639: 85 1d     
__c63b:     lda $1b            ; $c63b: a5 1b     
            clc                ; $c63d: 18        
            adc $1a            ; $c63e: 65 1a     
            sta $1b            ; $c640: 85 1b     
            sta $0703,y        ; $c642: 99 03 07  
            lda $90,x          ; $c645: b5 90     
            beq __c659         ; $c647: f0 10     
            bpl __c651         ; $c649: 10 06     
            lda $1b            ; $c64b: a5 1b     
            bmi __c655         ; $c64d: 30 06     
            bpl __c659         ; $c64f: 10 08     
__c651:     lda $1b            ; $c651: a5 1b     
            bmi __c659         ; $c653: 30 04     
__c655:     lda #$f0           ; $c655: a9 f0     
            bne __c65b         ; $c657: d0 02     
__c659:     lda $40,x          ; $c659: b5 40     
__c65b:     sta $0700,y        ; $c65b: 99 00 07  
            lda $19            ; $c65e: a5 19     
            sta $0702,y        ; $c660: 99 02 07  
            lda $17            ; $c663: a5 17     
            sta $0701,y        ; $c665: 99 01 07  
            clc                ; $c668: 18        
            adc #$02           ; $c669: 69 02     
            sta $17            ; $c66b: 85 17     
            iny                ; $c66d: c8        
            iny                ; $c66e: c8        
            iny                ; $c66f: c8        
            iny                ; $c670: c8        
            inc $1d            ; $c671: e6 1d     
            lda $1d            ; $c673: a5 1d     
            cmp $18            ; $c675: c5 18     
            bne __c63b         ; $c677: d0 c2     
            lda $0244          ; $c679: ad 44 02  
            beq __c682         ; $c67c: f0 04     
            cmp #$19           ; $c67e: c9 19     
            bcc __c6fd         ; $c680: 90 7b     
__c682:     lda $0291          ; $c682: ad 91 02  
            bne __c6fd         ; $c685: d0 76     
            lda $40,x          ; $c687: b5 40     
            sec                ; $c689: 38        
            sbc $40            ; $c68a: e5 40     
            bcs __c695         ; $c68c: b0 07     
            sta $1c            ; $c68e: 85 1c     
            lda #$00           ; $c690: a9 00     
            sec                ; $c692: 38        
            sbc $1c            ; $c693: e5 1c     
__c695:     cmp #$09           ; $c695: c9 09     
            bcs __c6fd         ; $c697: b0 64     
            lda $86,x          ; $c699: b5 86     
            cmp #$03           ; $c69b: c9 03     
            beq __c6b4         ; $c69d: f0 15     
            lda #$08           ; $c69f: a9 08     
            clc                ; $c6a1: 18        
            adc $1b            ; $c6a2: 65 1b     
            sta $1b            ; $c6a4: 85 1b     
            lda $79            ; $c6a6: a5 79     
            cmp $1b            ; $c6a8: c5 1b     
            beq __c6be         ; $c6aa: f0 12     
            bcs __c6fd         ; $c6ac: b0 4f     
            cmp $79,x          ; $c6ae: d5 79     
            bcs __c6be         ; $c6b0: b0 0c     
            bcc __c6fd         ; $c6b2: 90 49     
__c6b4:     lda $79            ; $c6b4: a5 79     
            cmp $79,x          ; $c6b6: d5 79     
            bcs __c6fd         ; $c6b8: b0 43     
            cmp $1b            ; $c6ba: c5 1b     
            bcc __c6fd         ; $c6bc: 90 3f     
__c6be:     lda #$80           ; $c6be: a9 80     
            sta $0291          ; $c6c0: 8d 91 02  
            lda $05f4          ; $c6c3: ad f4 05  
            bne __c6cb         ; $c6c6: d0 03     
            dec $02c9          ; $c6c8: ce c9 02  
__c6cb:     lda #$01           ; $c6cb: a9 01     
            sta $0618          ; $c6cd: 8d 18 06  
            sta $0619          ; $c6d0: 8d 19 06  
            lda #$00           ; $c6d3: a9 00     
            sta $061f          ; $c6d5: 8d 1f 06  
            tax                ; $c6d8: aa        
__c6d9:     sta $0625,x        ; $c6d9: 9d 25 06  
            inx                ; $c6dc: e8        
            cpx #$05           ; $c6dd: e0 05     
            bne __c6d9         ; $c6df: d0 f8     
            sta $0632          ; $c6e1: 8d 32 06  
            sta $0633          ; $c6e4: 8d 33 06  
            sta $0634          ; $c6e7: 8d 34 06  
            lda $16            ; $c6ea: a5 16     
            beq __c6fd         ; $c6ec: f0 0f     
            lda $02ca          ; $c6ee: ad ca 02  
            beq __c6fd         ; $c6f1: f0 0a     
            lda $25            ; $c6f3: a5 25     
            beq __c6fb         ; $c6f5: f0 04     
            dec $25            ; $c6f7: c6 25     
            beq __c6fd         ; $c6f9: f0 02     
__c6fb:     inc $25            ; $c6fb: e6 25     
__c6fd:     dex                ; $c6fd: ca        
            beq __c703         ; $c6fe: f0 03     
            jmp __c58c         ; $c700: 4c 8c c5  

;-------------------------------------------------------------------------------
__c703:     rts                ; $c703: 60        

;-------------------------------------------------------------------------------
__c704:     lda $79,x          ; $c704: b5 79     
            beq __c71a         ; $c706: f0 12     
            bmi __c720         ; $c708: 30 16     
            lda $17            ; $c70a: a5 17     
            beq __c712         ; $c70c: f0 04     
            bmi __c71e         ; $c70e: 30 0e     
            bpl __c720         ; $c710: 10 0e     
__c712:     lda $90,x          ; $c712: b5 90     
            cmp #$ff           ; $c714: c9 ff     
            bne __c720         ; $c716: d0 08     
            beq __c71e         ; $c718: f0 04     
__c71a:     lda $90,x          ; $c71a: b5 90     
            bne __c720         ; $c71c: d0 02     
__c71e:     inc $90,x          ; $c71e: f6 90     
__c720:     rts                ; $c720: 60        

;-------------------------------------------------------------------------------
__c721:     lda $79,x          ; $c721: b5 79     
            beq __c737         ; $c723: f0 12     
            bpl __c73d         ; $c725: 10 16     
            lda $17            ; $c727: a5 17     
            beq __c72f         ; $c729: f0 04     
            bpl __c73b         ; $c72b: 10 0e     
            bmi __c73d         ; $c72d: 30 0e     
__c72f:     lda $90,x          ; $c72f: b5 90     
            cmp #$01           ; $c731: c9 01     
            bne __c73d         ; $c733: d0 08     
            beq __c73b         ; $c735: f0 04     
__c737:     lda $90,x          ; $c737: b5 90     
            bne __c73d         ; $c739: d0 02     
__c73b:     dec $90,x          ; $c73b: d6 90     
__c73d:     rts                ; $c73d: 60        

;-------------------------------------------------------------------------------
__c73e:     ldx $0229          ; $c73e: ae 29 02  
__c741:     lda $02df,x        ; $c741: bd df 02  
            and #$0f           ; $c744: 29 0f     
            sta $02df,x        ; $c746: 9d df 02  
            lda $0244,x        ; $c749: bd 44 02  
            beq __c771         ; $c74c: f0 23     
            cmp #$19           ; $c74e: c9 19     
            bcs __c771         ; $c750: b0 1f     
            cmp #$01           ; $c752: c9 01     
            bne __c759         ; $c754: d0 03     
__c756:     jmp __c8a1         ; $c756: 4c a1 c8  

;-------------------------------------------------------------------------------
__c759:     lda $0244,x        ; $c759: bd 44 02  
            cmp #$0c           ; $c75c: c9 0c     
            bcc __c764         ; $c75e: 90 04     
            lda #$a8           ; $c760: a9 a8     
            bne __c766         ; $c762: d0 02     
__c764:     lda #$aa           ; $c764: a9 aa     
__c766:     sta $17            ; $c766: 85 17     
            lda #$00           ; $c768: a9 00     
            sta $18            ; $c76a: 85 18     
            lda #$20           ; $c76c: a9 20     
            jmp __c7f5         ; $c76e: 4c f5 c7  

;-------------------------------------------------------------------------------
__c771:     lda $029b,x        ; $c771: bd 9b 02  
            bne __c756         ; $c774: d0 e0     
            cpx $022a          ; $c776: ec 2a 02  
            beq __c78a         ; $c779: f0 0f     
            bcc __c78a         ; $c77b: 90 0d     
            ldy $02df,x        ; $c77d: bc df 02  
            beq __c786         ; $c780: f0 04     
            lda #$48           ; $c782: a9 48     
            bne __c7a4         ; $c784: d0 1e     
__c786:     lda #$30           ; $c786: a9 30     
            bne __c7a4         ; $c788: d0 1a     
__c78a:     ldy $02df,x        ; $c78a: bc df 02  
            beq __c793         ; $c78d: f0 04     
            lda #$4c           ; $c78f: a9 4c     
            bne __c7a4         ; $c791: d0 11     
__c793:     lda $02e9,x        ; $c793: bd e9 02  
            cmp #$20           ; $c796: c9 20     
            bcc __c7a2         ; $c798: 90 08     
            and #$04           ; $c79a: 29 04     
            bne __c7a2         ; $c79c: d0 04     
            lda #$90           ; $c79e: a9 90     
            bne __c7a4         ; $c7a0: d0 02     
__c7a2:     lda #$50           ; $c7a2: a9 50     
__c7a4:     sta $17            ; $c7a4: 85 17     
            lda #$00           ; $c7a6: a9 00     
            sta $18            ; $c7a8: 85 18     
            lda $02e9,x        ; $c7aa: bd e9 02  
            bne __c7e5         ; $c7ad: d0 36     
            lda $0244,x        ; $c7af: bd 44 02  
            bne __c7c2         ; $c7b2: d0 0e     
            lda $022c          ; $c7b4: ad 2c 02  
            ora $f9            ; $c7b7: 05 f9     
            ora $0291          ; $c7b9: 0d 91 02  
            beq __c7c2         ; $c7bc: f0 04     
            lda #$00           ; $c7be: a9 00     
            beq __c7c5         ; $c7c0: f0 03     
__c7c2:     lda $04f1          ; $c7c2: ad f1 04  
__c7c5:     ldy $02df,x        ; $c7c5: bc df 02  
            beq __c7d2         ; $c7c8: f0 08     
            and #$20           ; $c7ca: 29 20     
            beq __c7e5         ; $c7cc: f0 17     
            lda #$02           ; $c7ce: a9 02     
            bne __c7e3         ; $c7d0: d0 11     
__c7d2:     ldy $0244,x        ; $c7d2: bc 44 02  
            beq __c7dd         ; $c7d5: f0 06     
            and #$02           ; $c7d7: 29 02     
            beq __c7e5         ; $c7d9: f0 0a     
            bne __c7e1         ; $c7db: d0 04     
__c7dd:     and #$08           ; $c7dd: 29 08     
            beq __c7e5         ; $c7df: f0 04     
__c7e1:     lda #$04           ; $c7e1: a9 04     
__c7e3:     sta $18            ; $c7e3: 85 18     
__c7e5:     lda #$02           ; $c7e5: a9 02     
            cpx $022a          ; $c7e7: ec 2a 02  
            beq __c7f0         ; $c7ea: f0 04     
            bcc __c7f0         ; $c7ec: 90 02     
            lda #$01           ; $c7ee: a9 01     
__c7f0:     ldy $02df,x        ; $c7f0: bc df 02  
            beq __c806         ; $c7f3: f0 11     
__c7f5:     sta $63,x          ; $c7f5: 95 63     
            ora #$40           ; $c7f7: 09 40     
            sta $6e,x          ; $c7f9: 95 6e     
            lda $17            ; $c7fb: a5 17     
            clc                ; $c7fd: 18        
            adc $18            ; $c7fe: 65 18     
            sta $4d,x          ; $c800: 95 4d     
            sta $58,x          ; $c802: 95 58     
            bne __c83c         ; $c804: d0 36     
__c806:     ldy $86,x          ; $c806: b4 86     
            sty $19            ; $c808: 84 19     
            cpy #$03           ; $c80a: c0 03     
            bne __c812         ; $c80c: d0 04     
            dec $19            ; $c80e: c6 19     
            ora #$40           ; $c810: 09 40     
__c812:     sta $63,x          ; $c812: 95 63     
            sta $6e,x          ; $c814: 95 6e     
            lda $19            ; $c816: a5 19     
            asl                ; $c818: 0a        
            asl                ; $c819: 0a        
            asl                ; $c81a: 0a        
            clc                ; $c81b: 18        
            adc $17            ; $c81c: 65 17     
            adc $18            ; $c81e: 65 18     
            sta $19            ; $c820: 85 19     
            lda $86,x          ; $c822: b5 86     
            cmp #$03           ; $c824: c9 03     
            bne __c833         ; $c826: d0 0b     
            lda $19            ; $c828: a5 19     
            sta $58,x          ; $c82a: 95 58     
            clc                ; $c82c: 18        
            adc #$02           ; $c82d: 69 02     
            sta $4d,x          ; $c82f: 95 4d     
            bne __c83c         ; $c831: d0 09     
__c833:     lda $19            ; $c833: a5 19     
            sta $4d,x          ; $c835: 95 4d     
            clc                ; $c837: 18        
            adc #$02           ; $c838: 69 02     
            sta $58,x          ; $c83a: 95 58     
__c83c:     ldy #$01           ; $c83c: a0 01     
            sty $17            ; $c83e: 84 17     
__c840:     stx $18            ; $c840: 86 18     
            cpy $18            ; $c842: c4 18     
            beq __c857         ; $c844: f0 11     
            lda $40,x          ; $c846: b5 40     
            cmp $0040,y        ; $c848: d9 40 00  
            beq __c851         ; $c84b: f0 04     
            bcs __c857         ; $c84d: b0 08     
            bcc __c855         ; $c84f: 90 04     
__c851:     cpy $18            ; $c851: c4 18     
            bcs __c857         ; $c853: b0 02     
__c855:     inc $17            ; $c855: e6 17     
__c857:     iny                ; $c857: c8        
            cpy $0229          ; $c858: cc 29 02  
            beq __c840         ; $c85b: f0 e3     
            bcc __c840         ; $c85d: 90 e1     
            lda $17            ; $c85f: a5 17     
            asl                ; $c861: 0a        
            asl                ; $c862: 0a        
            asl                ; $c863: 0a        
            clc                ; $c864: 18        
            adc #$10           ; $c865: 69 10     
            clc                ; $c867: 18        
            adc $0240          ; $c868: 6d 40 02  
            tay                ; $c86b: a8        
            lda $4d,x          ; $c86c: b5 4d     
            sta $0701,y        ; $c86e: 99 01 07  
            lda $58,x          ; $c871: b5 58     
            sta $0705,y        ; $c873: 99 05 07  
            lda $63,x          ; $c876: b5 63     
            sta $0702,y        ; $c878: 99 02 07  
            lda $6e,x          ; $c87b: b5 6e     
            sta $0706,y        ; $c87d: 99 06 07  
            lda $90,x          ; $c880: b5 90     
            bne __c88a         ; $c882: d0 06     
            lda $79,x          ; $c884: b5 79     
            cmp #$06           ; $c886: c9 06     
            bcs __c88e         ; $c888: b0 04     
__c88a:     lda #$ef           ; $c88a: a9 ef     
            bne __c890         ; $c88c: d0 02     
__c88e:     lda $40,x          ; $c88e: b5 40     
__c890:     sta $0700,y        ; $c890: 99 00 07  
            sta $0704,y        ; $c893: 99 04 07  
            lda $79,x          ; $c896: b5 79     
            sta $0707,y        ; $c898: 99 07 07  
            sec                ; $c89b: 38        
            sbc #$08           ; $c89c: e9 08     
            sta $0703,y        ; $c89e: 99 03 07  
__c8a1:     dex                ; $c8a1: ca        
            beq __c8a7         ; $c8a2: f0 03     
            jmp __c741         ; $c8a4: 4c 41 c7  

;-------------------------------------------------------------------------------
__c8a7:     rts                ; $c8a7: 60        

;-------------------------------------------------------------------------------
__c8a8:     .hex d3 d4 db dc   ; $c8a8: d3 d4 db dc   Data

;-------------------------------------------------------------------------------
__c8ac:     lda $025b          ; $c8ac: ad 5b 02  
            cmp #$01           ; $c8af: c9 01     
            beq __c8ba         ; $c8b1: f0 07     
            cmp #$02           ; $c8b3: c9 02     
            bcs __c8e3         ; $c8b5: b0 2c     
            jmp __c979         ; $c8b7: 4c 79 c9  

;-------------------------------------------------------------------------------
__c8ba:     lda $022f          ; $c8ba: ad 2f 02  
            bne __c8e0         ; $c8bd: d0 21     
            ldx #$0a           ; $c8bf: a2 0a     
__c8c1:     sta $0244,x        ; $c8c1: 9d 44 02  
            dex                ; $c8c4: ca        
            bne __c8c1         ; $c8c5: d0 fa     
            inc $0259          ; $c8c7: ee 59 02  
            lda $0259          ; $c8ca: ad 59 02  
            cmp #$48           ; $c8cd: c9 48     
            bcc __c8e0         ; $c8cf: 90 0f     
            ldx $25            ; $c8d1: a6 25     
            lda #$00           ; $c8d3: a9 00     
            sta $0259          ; $c8d5: 8d 59 02  
            sta $05f2,x        ; $c8d8: 9d f2 05  
            lda #$10           ; $c8db: a9 10     
            sta $05f5,x        ; $c8dd: 9d f5 05  
__c8e0:     jsr __f0f0         ; $c8e0: 20 f0 f0  
__c8e3:     jsr __ac8b         ; $c8e3: 20 8b ac  
            lda $28            ; $c8e6: a5 28     
            and #$fc           ; $c8e8: 29 fc     
            sta $28            ; $c8ea: 85 28     
            lda $025b          ; $c8ec: ad 5b 02  
            cmp #$02           ; $c8ef: c9 02     
            bcc __c911         ; $c8f1: 90 1e     
            cmp #$03           ; $c8f3: c9 03     
            beq __c8fa         ; $c8f5: f0 03     
            jmp __c99d         ; $c8f7: 4c 9d c9  

;-------------------------------------------------------------------------------
__c8fa:     ldx #$04           ; $c8fa: a2 04     
            stx $0243          ; $c8fc: 8e 43 02  
            dex                ; $c8ff: ca        
            stx $022e          ; $c900: 8e 2e 02  
            lda #$28           ; $c903: a9 28     
            sta $022d          ; $c905: 8d 2d 02  
            lda #$00           ; $c908: a9 00     
            sta $025b          ; $c90a: 8d 5b 02  
            jsr __ca3c         ; $c90d: 20 3c ca  
            rts                ; $c910: 60        

;-------------------------------------------------------------------------------
__c911:     lda $0243          ; $c911: ad 43 02  
            cmp #$02           ; $c914: c9 02     
            beq __c946         ; $c916: f0 2e     
            cmp #$03           ; $c918: c9 03     
            beq __c91f         ; $c91a: f0 03     
            jmp __c974         ; $c91c: 4c 74 c9  

;-------------------------------------------------------------------------------
__c91f:     lda $02c7          ; $c91f: ad c7 02  
            beq __c95f         ; $c922: f0 3b     
            lda $02c9          ; $c924: ad c9 02  
            cmp #$03           ; $c927: c9 03     
            bne __c95f         ; $c929: d0 34     
            ldx $04fb          ; $c92b: ae fb 04  
            beq __c95f         ; $c92e: f0 2f     
            dec $04fb          ; $c930: ce fb 04  
            ldx #$00           ; $c933: a2 00     
            stx $022c          ; $c935: 8e 2c 02  
            inx                ; $c938: e8        
            stx $f8            ; $c939: 86 f8     
            inx                ; $c93b: e8        
            stx $0243          ; $c93c: 8e 43 02  
            stx $022d          ; $c93f: 8e 2d 02  
            ldx #$fe           ; $c942: a2 fe     
            stx $f7            ; $c944: 86 f7     
__c946:     ldx #$00           ; $c946: a2 00     
__c948:     lda #$23           ; $c948: a9 23     
            sta $0260,x        ; $c94a: 9d 60 02  
            lda __c8a8,x       ; $c94d: bd a8 c8  
            sta $0270,x        ; $c950: 9d 70 02  
            lda #$00           ; $c953: a9 00     
            sta $0280,x        ; $c955: 9d 80 02  
            inx                ; $c958: e8        
            cpx #$04           ; $c959: e0 04     
            bne __c948         ; $c95b: d0 eb     
            beq __c974         ; $c95d: f0 15     
__c95f:     lda #$f0           ; $c95f: a9 f0     
            sta $022d          ; $c961: 8d 2d 02  
            lda #$00           ; $c964: a9 00     
            sta $022e          ; $c966: 8d 2e 02  
            jsr __e7dc         ; $c969: 20 dc e7  
            ldx #$01           ; $c96c: a2 01     
            stx $062d          ; $c96e: 8e 2d 06  
            stx $062e          ; $c971: 8e 2e 06  
__c974:     ldx #$00           ; $c974: a2 00     
            stx $025b          ; $c976: 8e 5b 02  
__c979:     lda $022d          ; $c979: ad 2d 02  
            ora $022e          ; $c97c: 0d 2e 02  
            beq __c99c         ; $c97f: f0 1b     
            lda $0243          ; $c981: ad 43 02  
            cmp #$03           ; $c984: c9 03     
            bne __c99c         ; $c986: d0 14     
            lda $0291          ; $c988: ad 91 02  
            sta $06e0          ; $c98b: 8d e0 06  
            ldx #$00           ; $c98e: a2 00     
            stx $0291          ; $c990: 8e 91 02  
            jsr __c73e         ; $c993: 20 3e c7  
            lda $06e0          ; $c996: ad e0 06  
            sta $0291          ; $c999: 8d 91 02  
__c99c:     rts                ; $c99c: 60        

;-------------------------------------------------------------------------------
__c99d:     lda #$05           ; $c99d: a9 05     
            sta $0243          ; $c99f: 8d 43 02  
            lda #$00           ; $c9a2: a9 00     
            sta $025b          ; $c9a4: 8d 5b 02  
            sta $022d          ; $c9a7: 8d 2d 02  
            ldx #$0a           ; $c9aa: a2 0a     
__c9ac:     sta $0244,x        ; $c9ac: 9d 44 02  
            sta $02df,x        ; $c9af: 9d df 02  
            sta $90,x          ; $c9b2: 95 90     
            dex                ; $c9b4: ca        
            bne __c9ac         ; $c9b5: d0 f5     
            ldx $0229          ; $c9b7: ae 29 02  
__c9ba:     lda $40,x          ; $c9ba: b5 40     
            cmp #$20           ; $c9bc: c9 20     
            bcc __c9c4         ; $c9be: 90 04     
            cmp #$d0           ; $c9c0: c9 d0     
            bcc __c9c9         ; $c9c2: 90 05     

;-------------------------------------------------------------------------------
__c9c4:     clc                ; $c9c4: 18        
            adc #$50           ; $c9c5: 69 50     
            sta $40,x          ; $c9c7: 95 40     

;-------------------------------------------------------------------------------
__c9c9:     lda $79,x          ; $c9c9: b5 79     
            cmp #$10           ; $c9cb: c9 10     
            bcc __c9d3         ; $c9cd: 90 04     
            cmp #$f0           ; $c9cf: c9 f0     
            bcc __c9d8         ; $c9d1: 90 05     
__c9d3:     clc                ; $c9d3: 18        
            adc #$20           ; $c9d4: 69 20     
            sta $79,x          ; $c9d6: 95 79     
__c9d8:     dex                ; $c9d8: ca        
            bne __c9ba         ; $c9d9: d0 df     
            ldx #$0a           ; $c9db: a2 0a     
            lda #$01           ; $c9dd: a9 01     
__c9df:     sta $029b,x        ; $c9df: 9d 9b 02  
            dex                ; $c9e2: ca        
            bne __c9df         ; $c9e3: d0 fa     
            sta $022e          ; $c9e5: 8d 2e 02  
            sta $062f          ; $c9e8: 8d 2f 06  
            sta $0630          ; $c9eb: 8d 30 06  
            sta $0631          ; $c9ee: 8d 31 06  
            rts                ; $c9f1: 60        

;-------------------------------------------------------------------------------
__c9f2:     .hex f8            ; $c9f2: f8            Data
__c9f3:     .hex c9 00 ca 18   ; $c9f3: c9 00 ca 18   Data
            .hex ca 02 01 ef   ; $c9f7: ca 02 01 ef   Data
            .hex ef 78 f8 08   ; $c9fb: ef 78 f8 08   Data
            .hex 08 0a 05 a0   ; $c9ff: 08 0a 05 a0   Data
            .hex 70 70 40 40   ; $ca03: 70 70 40 40   Data
            .hex a0 a0 70 70   ; $ca07: a0 a0 70 70   Data
            .hex 40 ef 80 c8   ; $ca0b: 40 ef 80 c8   Data
            .hex 68 b0 50 b0   ; $ca0f: 68 b0 50 b0   Data
            .hex 50 98 38 80   ; $ca13: 50 98 38 80   Data
            .hex 00 01 00 88   ; $ca17: 00 01 00 88   Data
            .hex f0 08 08      ; $ca1b: f0 08 08      Data
__ca1e:     .hex 22 22 22 22   ; $ca1e: 22 22 22 22   Data
            .hex 22 22 22 22   ; $ca22: 22 22 22 22   Data
            .hex 23 23         ; $ca26: 23 23         Data
__ca28:     .hex 0e 0f 10 11   ; $ca28: 0e 0f 10 11   Data
            .hex 2e 2f 30 31   ; $ca2c: 2e 2f 30 31   Data
            .hex e3 e4         ; $ca30: e3 e4         Data
__ca32:     .hex ff 3c 30 ff   ; $ca32: ff 3c 30 ff   Data
            .hex ff 38 34 ff   ; $ca36: ff 38 34 ff   Data
            .hex 04 01         ; $ca3a: 04 01         Data
__ca3c:     ldx #$0a           ; $ca3c: a2 0a     
            lda #$00           ; $ca3e: a9 00     
            sta $0291          ; $ca40: 8d 91 02  
            sta $0244          ; $ca43: 8d 44 02  
            sta $02cc          ; $ca46: 8d cc 02  
            sta $02cb          ; $ca49: 8d cb 02  
__ca4c:     sta $0244,x        ; $ca4c: 9d 44 02  
            sta $02df,x        ; $ca4f: 9d df 02  
            sta $90,x          ; $ca52: 95 90     
            dex                ; $ca54: ca        
            bne __ca4c         ; $ca55: d0 f5     
            tay                ; $ca57: a8        
            lda $0259          ; $ca58: ad 59 02  
            cmp #$47           ; $ca5b: c9 47     
            beq __ca65         ; $ca5d: f0 06     
            and #$10           ; $ca5f: 29 10     
            bne __ca67         ; $ca61: d0 04     
            iny                ; $ca63: c8        
            iny                ; $ca64: c8        
__ca65:     iny                ; $ca65: c8        
            iny                ; $ca66: c8        
__ca67:     lda __c9f2,y       ; $ca67: b9 f2 c9  
            sta $1d            ; $ca6a: 85 1d     
            lda __c9f3,y       ; $ca6c: b9 f3 c9  
            sta $1e            ; $ca6f: 85 1e     
            ldy #$00           ; $ca71: a0 00     
            lda ($1d),y        ; $ca73: b1 1d     
            sta $0229          ; $ca75: 8d 29 02  
            iny                ; $ca78: c8        
            lda ($1d),y        ; $ca79: b1 1d     
            sta $022a          ; $ca7b: 8d 2a 02  
            iny                ; $ca7e: c8        
            ldx $0229          ; $ca7f: ae 29 02  
__ca82:     lda ($1d),y        ; $ca82: b1 1d     
            sta $40,x          ; $ca84: 95 40     
            iny                ; $ca86: c8        
            dex                ; $ca87: ca        
            bpl __ca82         ; $ca88: 10 f8     
            ldx $0229          ; $ca8a: ae 29 02  
__ca8d:     lda ($1d),y        ; $ca8d: b1 1d     
            sta $79,x          ; $ca8f: 95 79     
            iny                ; $ca91: c8        
            dex                ; $ca92: ca        
            bpl __ca8d         ; $ca93: 10 f8     
            lda $0259          ; $ca95: ad 59 02  
            and #$10           ; $ca98: 29 10     
            beq __cabd         ; $ca9a: f0 21     
            ldx #$00           ; $ca9c: a2 00     
__ca9e:     lda __ca1e,x       ; $ca9e: bd 1e ca  
            sta $0260,x        ; $caa1: 9d 60 02  
            lda __ca28,x       ; $caa4: bd 28 ca  
            sta $0270,x        ; $caa7: 9d 70 02  
            lda __ca32,x       ; $caaa: bd 32 ca  
            sta $0280,x        ; $caad: 9d 80 02  
            inx                ; $cab0: e8        
            cpx #$0a           ; $cab1: e0 0a     
            bne __ca9e         ; $cab3: d0 e9     
            lda #$08           ; $cab5: a9 08     
            sta $04f5          ; $cab7: 8d f5 04  
            sta $04f4          ; $caba: 8d f4 04  
__cabd:     lda #$01           ; $cabd: a9 01     
            sta $0635          ; $cabf: 8d 35 06  
            sta $0636          ; $cac2: 8d 36 06  
            sta $0637          ; $cac5: 8d 37 06  
            rts                ; $cac8: 60        

;-------------------------------------------------------------------------------
__cac9:     lda $0243          ; $cac9: ad 43 02  
            cmp #$04           ; $cacc: c9 04     
            beq __cad1         ; $cace: f0 01     
            rts                ; $cad0: 60        

;-------------------------------------------------------------------------------
__cad1:     lda $022d          ; $cad1: ad 2d 02  
            ora $022e          ; $cad4: 0d 2e 02  
            bne __caf1         ; $cad7: d0 18     
            ldx #$03           ; $cad9: a2 03     
            stx $0243          ; $cadb: 8e 43 02  
            dex                ; $cade: ca        
            stx $022d          ; $cadf: 8e 2d 02  
            inc $025b          ; $cae2: ee 5b 02  
            lda #$00           ; $cae5: a9 00     
            sta $0635          ; $cae7: 8d 35 06  
            sta $0636          ; $caea: 8d 36 06  
            sta $0637          ; $caed: 8d 37 06  
            rts                ; $caf0: 60        

;-------------------------------------------------------------------------------
__caf1:     lda $0259          ; $caf1: ad 59 02  
            cmp #$47           ; $caf4: c9 47     
            beq __cb00         ; $caf6: f0 08     
            and #$10           ; $caf8: 29 10     
            beq __cb04         ; $cafa: f0 08     
            jsr __cb2c         ; $cafc: 20 2c cb  
            rts                ; $caff: 60        

;-------------------------------------------------------------------------------
__cb00:     jsr __cccf         ; $cb00: 20 cf cc  
            rts                ; $cb03: 60        

;-------------------------------------------------------------------------------
__cb04:     jsr __cd94         ; $cb04: 20 94 cd  
            rts                ; $cb07: 60        

;-------------------------------------------------------------------------------
__cb08:     .hex 00 00 02 00   ; $cb08: 00 00 02 00   Data
            .hex 00 00 03 02   ; $cb0c: 00 00 03 02   Data
            .hex 00 01 01 00   ; $cb10: 00 01 01 00   Data
            .hex 01 01 00 00   ; $cb14: 01 01 00 00   Data
            .hex 00 00         ; $cb18: 00 00         Data
__cb1a:     .hex 02 03 01 00   ; $cb1a: 02 03 01 00   Data
__cb1e:     .hex 79 20 68 f0   ; $cb1e: 79 20 68 f0   Data
            .hex 70 e0         ; $cb22: 70 e0         Data
__cb24:     .hex 01 ff 00 00   ; $cb24: 01 ff 00 00   Data
__cb28:     .hex 00 00 01 ff   ; $cb28: 00 00 01 ff   Data
__cb2c:     ldx $0229          ; $cb2c: ae 29 02  
            inc $02cc          ; $cb2f: ee cc 02  
            ldy $02cb          ; $cb32: ac cb 02  
            lda __cb1e,y       ; $cb35: b9 1e cb  
            cmp $02cc          ; $cb38: cd cc 02  
            bne __cb52         ; $cb3b: d0 15     
            lda #$00           ; $cb3d: a9 00     
            sta $02cc          ; $cb3f: 8d cc 02  
            inc $02cb          ; $cb42: ee cb 02  
            lda $02cb          ; $cb45: ad cb 02  
            cmp #$02           ; $cb48: c9 02     
            bne __cb52         ; $cb4a: d0 06     
            lda #$b0           ; $cb4c: a9 b0     
            sta $41            ; $cb4e: 85 41     
            sta $42            ; $cb50: 85 42     
__cb52:     cpy #$00           ; $cb52: c0 00     
            beq __cb60         ; $cb54: f0 0a     
            lda #$00           ; $cb56: a9 00     
__cb58:     sec                ; $cb58: 38        
            adc $0229          ; $cb59: 6d 29 02  
            dey                ; $cb5c: 88        
            bne __cb58         ; $cb5d: d0 f9     
            tay                ; $cb5f: a8        
__cb60:     cpx #$00           ; $cb60: e0 00     
            bne __cb6b         ; $cb62: d0 07     
            lda $02cb          ; $cb64: ad cb 02  
            cmp #$02           ; $cb67: c9 02     
            bcs __cb73         ; $cb69: b0 08     
__cb6b:     lda __cb08,y       ; $cb6b: b9 08 cb  
            sty $19            ; $cb6e: 84 19     
            sta $86,x          ; $cb70: 95 86     
            tay                ; $cb72: a8        
__cb73:     lda $02cb          ; $cb73: ad cb 02  
            beq __cb9b         ; $cb76: f0 23     
            cmp #$01           ; $cb78: c9 01     
            beq __cb8a         ; $cb7a: f0 0e     
            cmp #$04           ; $cb7c: c9 04     
            bcs __cbb3         ; $cb7e: b0 33     
            cmp #$03           ; $cb80: c9 03     
            beq __cb91         ; $cb82: f0 0d     
            cpx #$00           ; $cb84: e0 00     
            beq __cbb9         ; $cb86: f0 31     
            bne __cb9b         ; $cb88: d0 11     
__cb8a:     lda #$01           ; $cb8a: a9 01     
            sta $022c          ; $cb8c: 8d 2c 02  
            bne __cbb3         ; $cb8f: d0 22     
__cb91:     cpx #$00           ; $cb91: e0 00     
            beq __cbb9         ; $cb93: f0 24     
            lda #$01           ; $cb95: a9 01     
            sta $f9            ; $cb97: 85 f9     
            bne __cbb3         ; $cb99: d0 18     
__cb9b:     lda #$f0           ; $cb9b: a9 f0     
            sta $2d            ; $cb9d: 85 2d     
            lda $40,x          ; $cb9f: b5 40     
            cmp #$ef           ; $cba1: c9 ef     
            beq __cbb3         ; $cba3: f0 0e     
            clc                ; $cba5: 18        
            adc __cb24,y       ; $cba6: 79 24 cb  
            sta $40,x          ; $cba9: 95 40     
            lda $79,x          ; $cbab: b5 79     
            clc                ; $cbad: 18        
            adc __cb28,y       ; $cbae: 79 28 cb  
            sta $79,x          ; $cbb1: 95 79     
__cbb3:     ldy $19            ; $cbb3: a4 19     
            iny                ; $cbb5: c8        
            dex                ; $cbb6: ca        
            bpl __cb60         ; $cbb7: 10 a7     
__cbb9:     lda $0291          ; $cbb9: ad 91 02  
            bne __cc0c         ; $cbbc: d0 4e     
            lda $02cb          ; $cbbe: ad cb 02  
            cmp #$02           ; $cbc1: c9 02     
            bcc __cc0c         ; $cbc3: 90 47     
            cmp #$05           ; $cbc5: c9 05     
            bne __cbce         ; $cbc7: d0 05     
            lda $02cc          ; $cbc9: ad cc 02  
            beq __cc07         ; $cbcc: f0 39     
__cbce:     lda #$01           ; $cbce: a9 01     
            sta $2d            ; $cbd0: 85 2d     
            lda $022d          ; $cbd2: ad 2d 02  
            and #$01           ; $cbd5: 29 01     
            bne __cc0c         ; $cbd7: d0 33     
            dec $04f5          ; $cbd9: ce f5 04  
            lda $04f5          ; $cbdc: ad f5 04  
            bne __cc0c         ; $cbdf: d0 2b     
            lda $04f4          ; $cbe1: ad f4 04  
            sta $04f5          ; $cbe4: 8d f5 04  
            ldy $86            ; $cbe7: a4 86     
            lda __cb1a,y       ; $cbe9: b9 1a cb  
            sta $86            ; $cbec: 85 86     
            lda $02cb          ; $cbee: ad cb 02  
            cmp #$02           ; $cbf1: c9 02     
            beq __cc0c         ; $cbf3: f0 17     
            lda $86            ; $cbf5: a5 86     
            cmp #$03           ; $cbf7: c9 03     
            bne __cc0c         ; $cbf9: d0 11     
            lda $04f4          ; $cbfb: ad f4 04  
            cmp #$01           ; $cbfe: c9 01     
            beq __cc0c         ; $cc00: f0 0a     
            dec $04f4          ; $cc02: ce f4 04  
            bne __cc0c         ; $cc05: d0 05     
__cc07:     lda #$40           ; $cc07: a9 40     
            sta $0291          ; $cc09: 8d 91 02  
__cc0c:     jsr __c2f7         ; $cc0c: 20 f7 c2  
            jsr __c73e         ; $cc0f: 20 3e c7  
            lda $0291          ; $cc12: ad 91 02  
            cmp #$01           ; $cc15: c9 01     
            bne __cc1e         ; $cc17: d0 05     
            lda #$00           ; $cc19: a9 00     
            sta $0291          ; $cc1b: 8d 91 02  
__cc1e:     lda #$00           ; $cc1e: a9 00     
            sta $f9            ; $cc20: 85 f9     
            sta $0615          ; $cc22: 8d 15 06  
            sta $0616          ; $cc25: 8d 16 06  
            sta $0617          ; $cc28: 8d 17 06  
            sta $061f          ; $cc2b: 8d 1f 06  
            rts                ; $cc2e: 60        

;-------------------------------------------------------------------------------
__cc2f:     .hex 00 00 00 00   ; $cc2f: 00 00 00 00   Data
            .hex 00 00 00 00   ; $cc33: 00 00 00 00   Data
            .hex 00 00 00 02   ; $cc37: 00 00 00 02   Data
            .hex 03 03 02 02   ; $cc3b: 03 03 02 02   Data
            .hex 02 02 03 03   ; $cc3f: 02 02 03 03   Data
            .hex 02 00 01 01   ; $cc43: 02 00 01 01   Data
            .hex 01 01 01 01   ; $cc47: 01 01 01 01   Data
            .hex 01 01 01 01   ; $cc4b: 01 01 01 01   Data
            .hex 00 03 02 02   ; $cc4f: 00 03 02 02   Data
            .hex 03 03 03 03   ; $cc53: 03 03 03 03   Data
            .hex 02 02 03 00   ; $cc57: 02 02 03 00   Data
            .hex 00 00 00 00   ; $cc5b: 00 00 00 00   Data
            .hex 00 00 00 00   ; $cc5f: 00 00 00 00   Data
            .hex 00 00 00 03   ; $cc63: 00 00 00 03   Data
            .hex 02 02 03 03   ; $cc67: 02 02 03 03   Data
            .hex 03 03 02 02   ; $cc6b: 03 03 02 02   Data
            .hex 03 00 01 01   ; $cc6f: 03 00 01 01   Data
            .hex 01 01 01 01   ; $cc73: 01 01 01 01   Data
            .hex 01 01 01 01   ; $cc77: 01 01 01 01   Data
            .hex 00 02 03 03   ; $cc7b: 00 02 03 03   Data
            .hex 02 02 02 02   ; $cc7f: 02 02 02 02   Data
            .hex 03 03 02 00   ; $cc83: 03 03 02 00   Data
            .hex 01 01 01 01   ; $cc87: 01 01 01 01   Data
            .hex 01 01 01 01   ; $cc8b: 01 01 01 01   Data
            .hex 01 01 00      ; $cc8f: 01 01 00      Data
__cc92:     .hex 02 03 00 00   ; $cc92: 02 03 00 00   Data
            .hex 00 00 00 00   ; $cc96: 00 00 00 00   Data
            .hex 00 03 03 03   ; $cc9a: 00 03 03 03   Data
            .hex 00 00 00 02   ; $cc9e: 00 00 00 02   Data
            .hex 02 02 00 00   ; $cca2: 02 02 00 00   Data
            .hex 00 01 01 01   ; $cca6: 00 01 01 01   Data
            .hex 00 00 00 00   ; $ccaa: 00 00 00 00   Data
            .hex 00 00 03 02   ; $ccae: 00 00 03 02   Data
            .hex 00            ; $ccb2: 00            Data
__ccb3:     .hex 14 17 17 17   ; $ccb3: 14 17 17 17   Data
            .hex 17 17 17 17   ; $ccb7: 17 17 17 17   Data
            .hex c0 69 20 18   ; $ccbb: c0 69 20 18   Data
            .hex 18 18 18 18   ; $ccbf: 18 18 18 18   Data
            .hex 18 18 20 e0   ; $ccc3: 18 18 20 e0   Data
__ccc7:     .hex 01 ff 00 00   ; $ccc7: 01 ff 00 00   Data
__cccb:     .hex 00 00 01 ff   ; $cccb: 00 00 01 ff   Data
__cccf:     lda #$00           ; $cccf: a9 00     
            sta $18            ; $ccd1: 85 18     
            lda #$f0           ; $ccd3: a9 f0     
            sta $2d            ; $ccd5: 85 2d     
            inc $02cc          ; $ccd7: ee cc 02  
            ldy $02cb          ; $ccda: ac cb 02  
            lda __ccb3,y       ; $ccdd: b9 b3 cc  
            cmp $02cc          ; $cce0: cd cc 02  
            bne __cd14         ; $cce3: d0 2f     
            lda #$00           ; $cce5: a9 00     
            sta $02cc          ; $cce7: 8d cc 02  
            inc $02cb          ; $ccea: ee cb 02  
            lda $02cb          ; $cced: ad cb 02  
            cmp #$09           ; $ccf0: c9 09     
            bne __cd14         ; $ccf2: d0 20     
            lda #$02           ; $ccf4: a9 02     
            sta $0229          ; $ccf6: 8d 29 02  
            lda #$01           ; $ccf9: a9 01     
            sta $022a          ; $ccfb: 8d 2a 02  
            lda #$80           ; $ccfe: a9 80     
            sta $79            ; $cd00: 85 79     
            lda #$f8           ; $cd02: a9 f8     
            sta $7a            ; $cd04: 85 7a     
            lda #$08           ; $cd06: a9 08     
            sta $7b            ; $cd08: 85 7b     
            lda #$6a           ; $cd0a: a9 6a     
            sta $41            ; $cd0c: 85 41     
            sta $42            ; $cd0e: 85 42     
            lda #$00           ; $cd10: a9 00     
            sta $40            ; $cd12: 85 40     
__cd14:     ldx $0229          ; $cd14: ae 29 02  
            lda $02cb          ; $cd17: ad cb 02  
            cmp #$09           ; $cd1a: c9 09     
            bcc __cd22         ; $cd1c: 90 04     
            sec                ; $cd1e: 38        
            sbc #$09           ; $cd1f: e9 09     
            tay                ; $cd21: a8        
__cd22:     cpy #$00           ; $cd22: c0 00     
            beq __cd30         ; $cd24: f0 0a     
            lda #$00           ; $cd26: a9 00     
__cd28:     sec                ; $cd28: 38        
            adc $0229          ; $cd29: 6d 29 02  
            dey                ; $cd2c: 88        
            bne __cd28         ; $cd2d: d0 f9     
            tay                ; $cd2f: a8        
__cd30:     lda $02cb          ; $cd30: ad cb 02  
            cmp #$09           ; $cd33: c9 09     
            bcs __cd40         ; $cd35: b0 09     
            cpx #$00           ; $cd37: e0 00     
            beq __cd76         ; $cd39: f0 3b     
            lda __cc2f,y       ; $cd3b: b9 2f cc  
            bpl __cd43         ; $cd3e: 10 03     
__cd40:     lda __cc92,y       ; $cd40: b9 92 cc  
__cd43:     sty $19            ; $cd43: 84 19     
            sta $86,x          ; $cd45: 95 86     
            tay                ; $cd47: a8        
            lda $02cb          ; $cd48: ad cb 02  
            cmp #$0b           ; $cd4b: c9 0b     
            bcc __cd5b         ; $cd4d: 90 0c     
            cmp #$12           ; $cd4f: c9 12     
            bcc __cd76         ; $cd51: 90 23     
            cmp #$13           ; $cd53: c9 13     
            bne __cd5b         ; $cd55: d0 04     
            lda #$01           ; $cd57: a9 01     
            sta $18            ; $cd59: 85 18     
__cd5b:     lda $40,x          ; $cd5b: b5 40     
            cmp #$f0           ; $cd5d: c9 f0     
            beq __cd76         ; $cd5f: f0 15     
            clc                ; $cd61: 18        
            adc __ccc7,y       ; $cd62: 79 c7 cc  
            cpx #$00           ; $cd65: e0 00     
            beq __cd6c         ; $cd67: f0 03     
            clc                ; $cd69: 18        
            adc $18            ; $cd6a: 65 18     
__cd6c:     sta $40,x          ; $cd6c: 95 40     
            lda $79,x          ; $cd6e: b5 79     
            clc                ; $cd70: 18        
            adc __cccb,y       ; $cd71: 79 cb cc  
            sta $79,x          ; $cd74: 95 79     
__cd76:     ldy $19            ; $cd76: a4 19     
            iny                ; $cd78: c8        
            dex                ; $cd79: ca        
            bpl __cd30         ; $cd7a: 10 b4     
            jsr __c2f7         ; $cd7c: 20 f7 c2  
            jsr __c73e         ; $cd7f: 20 3e c7  
            rts                ; $cd82: 60        

;-------------------------------------------------------------------------------
__cd83:     .hex 40 10 20 20   ; $cd83: 40 10 20 20   Data
            .hex 20 20 40 60   ; $cd87: 20 20 40 60   Data
            .hex 90 10 60 85   ; $cd8b: 90 10 60 85   Data
            .hex 50            ; $cd8f: 50            Data
__cd90:     .hex 00 00 01 ff   ; $cd90: 00 00 01 ff   Data
__cd94:     ldx $0229          ; $cd94: ae 29 02  
            inc $02cc          ; $cd97: ee cc 02  
            ldy $02cb          ; $cd9a: ac cb 02  
            lda __cd83,y       ; $cd9d: b9 83 cd  
            cmp $02cc          ; $cda0: cd cc 02  
            bne __cde6         ; $cda3: d0 41     
            lda #$00           ; $cda5: a9 00     
            sta $02cc          ; $cda7: 8d cc 02  
            inc $02cb          ; $cdaa: ee cb 02  
            lda $02cb          ; $cdad: ad cb 02  
            cmp #$01           ; $cdb0: c9 01     
            beq __cde2         ; $cdb2: f0 2e     
            cmp #$08           ; $cdb4: c9 08     
            beq __cdd4         ; $cdb6: f0 1c     
            cmp #$09           ; $cdb8: c9 09     
            beq __cdde         ; $cdba: f0 22     
            cmp #$0b           ; $cdbc: c9 0b     
            beq __cdc2         ; $cdbe: f0 02     
            bne __cde6         ; $cdc0: d0 24     
__cdc2:     lda $40            ; $cdc2: a5 40     
            sta $0252          ; $cdc4: 8d 52 02  
            lda $79            ; $cdc7: a5 79     
            sta $0258          ; $cdc9: 8d 58 02  
            sec                ; $cdcc: 38        
            sbc #$08           ; $cdcd: e9 08     
            sta $0255          ; $cdcf: 8d 55 02  
            bne __cde6         ; $cdd2: d0 12     
__cdd4:     lda #$f8           ; $cdd4: a9 f8     
            sta $7a            ; $cdd6: 85 7a     
            lda #$88           ; $cdd8: a9 88     
            sta $41            ; $cdda: 85 41     
            bne __cde6         ; $cddc: d0 08     
__cdde:     lda #$f8           ; $cdde: a9 f8     
            sta $79            ; $cde0: 85 79     
__cde2:     lda #$88           ; $cde2: a9 88     
            sta $40            ; $cde4: 85 40     
__cde6:     lda $02cb          ; $cde6: ad cb 02  
            cmp #$08           ; $cde9: c9 08     
            bcc __cdfe         ; $cdeb: 90 11     
            cmp #$0a           ; $cded: c9 0a     
            beq __ce39         ; $cdef: f0 48     
            cmp #$0c           ; $cdf1: c9 0c     
            bne __ce02         ; $cdf3: d0 0d     
            lda #$01           ; $cdf5: a9 01     
            sta $022c          ; $cdf7: 8d 2c 02  
            lda #$00           ; $cdfa: a9 00     
            beq __ce04         ; $cdfc: f0 06     
__cdfe:     lda #$02           ; $cdfe: a9 02     
            bne __ce04         ; $ce00: d0 02     
__ce02:     lda #$03           ; $ce02: a9 03     
__ce04:     sta $86,x          ; $ce04: 95 86     
            beq __ce57         ; $ce06: f0 4f     
            tay                ; $ce08: a8        
            cpx #$00           ; $ce09: e0 00     
            beq __ce12         ; $ce0b: f0 05     
            lda $029c          ; $ce0d: ad 9c 02  
            bne __ce57         ; $ce10: d0 45     
__ce12:     lda $40,x          ; $ce12: b5 40     
            cmp #$f0           ; $ce14: c9 f0     
            beq __ce57         ; $ce16: f0 3f     
            lda $79,x          ; $ce18: b5 79     
            cpx #$00           ; $ce1a: e0 00     
            bne __ce41         ; $ce1c: d0 23     
            clc                ; $ce1e: 18        
            adc __cd90,y       ; $ce1f: 79 90 cd  
            sta $18            ; $ce22: 85 18     
            lda $02cb          ; $ce24: ad cb 02  
            cmp #$02           ; $ce27: c9 02     
            beq __ce39         ; $ce29: f0 0e     
            cmp #$04           ; $ce2b: c9 04     
            beq __ce39         ; $ce2d: f0 0a     
            cmp #$06           ; $ce2f: c9 06     
            beq __ce39         ; $ce31: f0 06     
            cmp #$0b           ; $ce33: c9 0b     
            beq __ce39         ; $ce35: f0 02     
            bne __ce3f         ; $ce37: d0 06     
__ce39:     lda #$02           ; $ce39: a9 02     
            sta $2d            ; $ce3b: 85 2d     
            bne __ce57         ; $ce3d: d0 18     
__ce3f:     lda $18            ; $ce3f: a5 18     
__ce41:     clc                ; $ce41: 18        
            adc __cd90,y       ; $ce42: 79 90 cd  
            sta $79,x          ; $ce45: 95 79     
            cmp #$08           ; $ce47: c9 08     
            bcc __ce4f         ; $ce49: 90 04     
            cmp #$f9           ; $ce4b: c9 f9     
            bcc __ce53         ; $ce4d: 90 04     
__ce4f:     lda #$f0           ; $ce4f: a9 f0     
            sta $40,x          ; $ce51: 95 40     
__ce53:     lda #$f0           ; $ce53: a9 f0     
            sta $2d            ; $ce55: 85 2d     
__ce57:     dex                ; $ce57: ca        
            bpl __cde6         ; $ce58: 10 8c     
            lda $02cb          ; $ce5a: ad cb 02  
            cmp #$0b           ; $ce5d: c9 0b     
            bne __ce9a         ; $ce5f: d0 39     
            lda #$01           ; $ce61: a9 01     
            sta $025a          ; $ce63: 8d 5a 02  
            lda $029b          ; $ce66: ad 9b 02  
            bne __ce9d         ; $ce69: d0 32     
            lda $0255          ; $ce6b: ad 55 02  
            sec                ; $ce6e: 38        
            sbc #$04           ; $ce6f: e9 04     
            sta $0255          ; $ce71: 8d 55 02  
            clc                ; $ce74: 18        
            adc #$08           ; $ce75: 69 08     
            sta $0258          ; $ce77: 8d 58 02  
            sec                ; $ce7a: 38        
            sbc $7a            ; $ce7b: e5 7a     
            cmp #$09           ; $ce7d: c9 09     
            bcs __ce9d         ; $ce7f: b0 1c     
            lda #$00           ; $ce81: a9 00     
            sta $025a          ; $ce83: 8d 5a 02  
            lda #$01           ; $ce86: a9 01     
            sta $029b          ; $ce88: 8d 9b 02  
            inc $029c          ; $ce8b: ee 9c 02  
            lda #$3c           ; $ce8e: a9 3c     
            sta $02a7          ; $ce90: 8d a7 02  
            lda #$18           ; $ce93: a9 18     
            sta $02a6          ; $ce95: 8d a6 02  
            bne __ce9d         ; $ce98: d0 03     
__ce9a:     jsr __bbac         ; $ce9a: 20 ac bb  
__ce9d:     jsr __c4b2         ; $ce9d: 20 b2 c4  
            jsr __c2f7         ; $cea0: 20 f7 c2  
            jsr __c73e         ; $cea3: 20 3e c7  
            lda $0245          ; $cea6: ad 45 02  
            bne __cec7         ; $cea9: d0 1c     
            jsr __e1c8         ; $ceab: 20 c8 e1  
            lda $029c          ; $ceae: ad 9c 02  
            cmp #$05           ; $ceb1: c9 05     
            bne __cec4         ; $ceb3: d0 0f     
            lda #$00           ; $ceb5: a9 00     
            sta $029c          ; $ceb7: 8d 9c 02  
            sta $029b          ; $ceba: 8d 9b 02  
            sta $1f            ; $cebd: 85 1f     
            lda #$01           ; $cebf: a9 01     
            sta $0245          ; $cec1: 8d 45 02  
__cec4:     jsr __e2ca         ; $cec4: 20 ca e2  
__cec7:     lda #$00           ; $cec7: a9 00     
            sta $061d          ; $cec9: 8d 1d 06  
            sta $061e          ; $cecc: 8d 1e 06  
            sta $061f          ; $cecf: 8d 1f 06  
            sta $0620          ; $ced2: 8d 20 06  
            rts                ; $ced5: 60        

;-------------------------------------------------------------------------------
__ced6:     .hex f8 ff 08 01   ; $ced6: f8 ff 08 01   Data
__ceda:     .hex f7 ff 07 f9   ; $ceda: f7 ff 07 f9   Data
            .hex 01 09         ; $cede: 01 09         Data
__cee0:     .hex 40 10 80 20   ; $cee0: 40 10 80 20   Data

;-------------------------------------------------------------------------------
__cee4:     lda #$00           ; $cee4: a9 00     
            sta $0241          ; $cee6: 8d 41 02  
            jsr __d102         ; $cee9: 20 02 d1  
            lda $29            ; $ceec: a5 29     
            clc                ; $ceee: 18        
            adc $79            ; $ceef: 65 79     
            and #$1f           ; $cef1: 29 1f     
            sec                ; $cef3: 38        
            sbc #$10           ; $cef4: e9 10     
            beq __cf11         ; $cef6: f0 19     
            bcs __cf09         ; $cef8: b0 0f     
            sta $17            ; $cefa: 85 17     
            lda #$00           ; $cefc: a9 00     
            sec                ; $cefe: 38        
            sbc $17            ; $ceff: e5 17     
            cmp #$08           ; $cf01: c9 08     
            bcs __cf5d         ; $cf03: b0 58     
            ldy #$02           ; $cf05: a0 02     
            bne __cf45         ; $cf07: d0 3c     
__cf09:     cmp #$08           ; $cf09: c9 08     
            bcs __cf5d         ; $cf0b: b0 50     
            ldy #$00           ; $cf0d: a0 00     
            beq __cf45         ; $cf0f: f0 34     
__cf11:     ldx $04f0          ; $cf11: ae f0 04  
            lda $0400,x        ; $cf14: bd 00 04  
            and #$d0           ; $cf17: 29 d0     
            cmp #$80           ; $cf19: c9 80     
            bne __cf37         ; $cf1b: d0 1a     
            lda $0408,x        ; $cf1d: bd 08 04  
            and #$d0           ; $cf20: 29 d0     
            cmp #$80           ; $cf22: c9 80     
            beq __cf5d         ; $cf24: f0 37     
            cmp #$d0           ; $cf26: c9 d0     
            bne __cf33         ; $cf28: d0 09     
            lda $40            ; $cf2a: a5 40     
            and #$1f           ; $cf2c: 29 1f     
            bne __cf33         ; $cf2e: d0 03     
            jmp __cfb6         ; $cf30: 4c b6 cf  

;-------------------------------------------------------------------------------
__cf33:     ldy #$02           ; $cf33: a0 02     
            bne __cf56         ; $cf35: d0 1f     
__cf37:     cmp #$d0           ; $cf37: c9 d0     
            bne __cf41         ; $cf39: d0 06     
            lda $40            ; $cf3b: a5 40     
            and #$1f           ; $cf3d: 29 1f     
            beq __cfb6         ; $cf3f: f0 75     
__cf41:     ldy #$00           ; $cf41: a0 00     
            beq __cf56         ; $cf43: f0 11     
__cf45:     lda $04f0          ; $cf45: ad f0 04  
            clc                ; $cf48: 18        
            adc __ced6,y       ; $cf49: 79 d6 ce  
            tax                ; $cf4c: aa        
            lda $0400,x        ; $cf4d: bd 00 04  
            and #$d0           ; $cf50: 29 d0     
            cmp #$80           ; $cf52: c9 80     
            beq __cf5d         ; $cf54: f0 07     
__cf56:     lda $2d            ; $cf56: a5 2d     
            and __cee0,y       ; $cf58: 39 e0 ce  
            bne __cfb8         ; $cf5b: d0 5b     
__cf5d:     lda $40            ; $cf5d: a5 40     
            clc                ; $cf5f: 18        
            adc #$03           ; $cf60: 69 03     
            and #$1f           ; $cf62: 29 1f     
            cmp #$18           ; $cf64: c9 18     
            bcs __cf70         ; $cf66: b0 08     
            cmp #$10           ; $cf68: c9 10     
            bcc __cfb6         ; $cf6a: 90 4a     
            ldy #$03           ; $cf6c: a0 03     
            bne __cf72         ; $cf6e: d0 02     
__cf70:     ldy #$00           ; $cf70: a0 00     
__cf72:     lda $29            ; $cf72: a5 29     
            clc                ; $cf74: 18        
            adc $79            ; $cf75: 65 79     
            and #$1f           ; $cf77: 29 1f     
            beq __cf93         ; $cf79: f0 18     
            cmp #$10           ; $cf7b: c9 10     
            beq __cf81         ; $cf7d: f0 02     
            bcs __cf82         ; $cf7f: b0 01     
__cf81:     iny                ; $cf81: c8        
__cf82:     lda $04f0          ; $cf82: ad f0 04  
            clc                ; $cf85: 18        
            adc __ceda,y       ; $cf86: 79 da ce  
            tax                ; $cf89: aa        
            lda $0400,x        ; $cf8a: bd 00 04  
            and #$d0           ; $cf8d: 29 d0     
            cmp #$80           ; $cf8f: c9 80     
            beq __cfb6         ; $cf91: f0 23     
__cf93:     iny                ; $cf93: c8        
            lda $04f0          ; $cf94: ad f0 04  
            clc                ; $cf97: 18        
            adc __ceda,y       ; $cf98: 79 da ce  
            tax                ; $cf9b: aa        
            lda $0400,x        ; $cf9c: bd 00 04  
            and #$d0           ; $cf9f: 29 d0     
            cmp #$80           ; $cfa1: c9 80     
            beq __cfb6         ; $cfa3: f0 11     
            cpy #$03           ; $cfa5: c0 03     
            bcs __cfad         ; $cfa7: b0 04     
            ldy #$01           ; $cfa9: a0 01     
            bne __cfaf         ; $cfab: d0 02     
__cfad:     ldy #$03           ; $cfad: a0 03     
__cfaf:     lda $2d            ; $cfaf: a5 2d     
            and __cee0,y       ; $cfb1: 39 e0 ce  
            bne __cfb8         ; $cfb4: d0 02     
__cfb6:     lda #$00           ; $cfb6: a9 00     
__cfb8:     sta $0290          ; $cfb8: 8d 90 02  
            rts                ; $cfbb: 60        

;-------------------------------------------------------------------------------
__cfbc:     ldx $0241          ; $cfbc: ae 41 02  
            beq __cfd9         ; $cfbf: f0 18     
            cpx $02dd          ; $cfc1: ec dd 02  
            bne __cfcd         ; $cfc4: d0 07     
            lda $02de          ; $cfc6: ad de 02  
            cmp #$18           ; $cfc9: c9 18     
            bcc __d046         ; $cfcb: 90 79     
__cfcd:     lda $0244,x        ; $cfcd: bd 44 02  
            bne __d046         ; $cfd0: d0 74     
            lda $029b,x        ; $cfd2: bd 9b 02  
            cmp #$04           ; $cfd5: c9 04     
            bcs __d046         ; $cfd7: b0 6d     
__cfd9:     jsr __d102         ; $cfd9: 20 02 d1  
            lda $29            ; $cfdc: a5 29     
            clc                ; $cfde: 18        
            adc $79,x          ; $cfdf: 75 79     
            and #$1f           ; $cfe1: 29 1f     
            cmp #$10           ; $cfe3: c9 10     
            beq __d00c         ; $cfe5: f0 25     
            ldy $04f0          ; $cfe7: ac f0 04  
            lda $0400,y        ; $cfea: b9 00 04  
            and #$d0           ; $cfed: 29 d0     
            cmp #$80           ; $cfef: c9 80     
            bne __d046         ; $cff1: d0 53     
            cpx #$00           ; $cff3: e0 00     
            bne __d001         ; $cff5: d0 0a     
            stx $061f          ; $cff7: 8e 1f 06  
            lda #$01           ; $cffa: a9 01     
            sta $061c          ; $cffc: 8d 1c 06  
            bne __d041         ; $cfff: d0 40     
__d001:     lda $0400,y        ; $d001: b9 00 04  
            and #$fe           ; $d004: 29 fe     
            cmp #$80           ; $d006: c9 80     
            beq __d047         ; $d008: f0 3d     
            bne __d041         ; $d00a: d0 35     
__d00c:     ldy $04f0          ; $d00c: ac f0 04  
            lda $0400,y        ; $d00f: b9 00 04  
            and #$d0           ; $d012: 29 d0     
            cmp #$80           ; $d014: c9 80     
            beq __d021         ; $d016: f0 09     
            lda $0408,y        ; $d018: b9 08 04  
            and #$d0           ; $d01b: 29 d0     
            cmp #$80           ; $d01d: c9 80     
            bne __d046         ; $d01f: d0 25     
__d021:     cpx #$00           ; $d021: e0 00     
            bne __d02f         ; $d023: d0 0a     
            stx $061f          ; $d025: 8e 1f 06  
            lda #$01           ; $d028: a9 01     
            sta $061c          ; $d02a: 8d 1c 06  
            bne __d041         ; $d02d: d0 12     
__d02f:     lda $0400,y        ; $d02f: b9 00 04  
            and #$fe           ; $d032: 29 fe     
            cmp #$80           ; $d034: c9 80     
            beq __d047         ; $d036: f0 0f     
            lda $0408,y        ; $d038: b9 08 04  
            and #$fe           ; $d03b: 29 fe     
            cmp #$80           ; $d03d: c9 80     
            beq __d047         ; $d03f: f0 06     
__d041:     lda #$48           ; $d041: a9 48     
            sta $0244,x        ; $d043: 9d 44 02  
__d046:     rts                ; $d046: 60        

;-------------------------------------------------------------------------------
__d047:     lda $029b,x        ; $d047: bd 9b 02  
            bne __d073         ; $d04a: d0 27     
            ldy #$00           ; $d04c: a0 00     
            lda $02df,x        ; $d04e: bd df 02  
            bne __d05c         ; $d051: d0 09     
            cpx $022a          ; $d053: ec 2a 02  
            beq __d05e         ; $d056: f0 06     
            bcc __d05e         ; $d058: 90 04     
            bcs __d05d         ; $d05a: b0 01     
__d05c:     iny                ; $d05c: c8        
__d05d:     iny                ; $d05d: c8        
__d05e:     lda $023c,y        ; $d05e: b9 3c 02  
            beq __d073         ; $d061: f0 10     
            lda $86,x          ; $d063: b5 86     
            eor #$01           ; $d065: 49 01     
            sta $86,x          ; $d067: 95 86     
            lda #$00           ; $d069: a9 00     
            sta $02e9,x        ; $d06b: 9d e9 02  
            lda #$01           ; $d06e: a9 01     
            sta $05f8          ; $d070: 8d f8 05  
__d073:     rts                ; $d073: 60        

;-------------------------------------------------------------------------------
__d074:     lda $0244          ; $d074: ad 44 02  
            beq __d082         ; $d077: f0 09     
            cmp #$19           ; $d079: c9 19     
            bcs __d082         ; $d07b: b0 05     
            lda $0290          ; $d07d: ad 90 02  
            beq __d0fe         ; $d080: f0 7c     
__d082:     ldx $0241          ; $d082: ae 41 02  
            cpx $02dd          ; $d085: ec dd 02  
            bne __d093         ; $d088: d0 09     
            lda $02de          ; $d08a: ad de 02  
            beq __d093         ; $d08d: f0 04     
            cmp #$18           ; $d08f: c9 18     
            bcc __d0fe         ; $d091: 90 6b     
__d093:     lda $0291          ; $d093: ad 91 02  
            ora $029a          ; $d096: 0d 9a 02  
            ora $029b,x        ; $d099: 1d 9b 02  
            ora $90,x          ; $d09c: 15 90     
            bne __d0fe         ; $d09e: d0 5e     
            lda $79,x          ; $d0a0: b5 79     
            sec                ; $d0a2: 38        
            sbc $79            ; $d0a3: e5 79     
            bcs __d0ae         ; $d0a5: b0 07     
            sta $17            ; $d0a7: 85 17     
            lda #$00           ; $d0a9: a9 00     
            sec                ; $d0ab: 38        
            sbc $17            ; $d0ac: e5 17     
__d0ae:     cmp #$06           ; $d0ae: c9 06     
            bcs __d0fe         ; $d0b0: b0 4c     
            lda $40,x          ; $d0b2: b5 40     
            sec                ; $d0b4: 38        
            sbc $40            ; $d0b5: e5 40     
            bcs __d0c0         ; $d0b7: b0 07     
            sta $17            ; $d0b9: 85 17     
            lda #$00           ; $d0bb: a9 00     
            sec                ; $d0bd: 38        
            sbc $17            ; $d0be: e5 17     
__d0c0:     cmp #$09           ; $d0c0: c9 09     
            bcs __d0fe         ; $d0c2: b0 3a     
            lda #$80           ; $d0c4: a9 80     
            sta $0291          ; $d0c6: 8d 91 02  
            lda $05f4          ; $d0c9: ad f4 05  
            bne __d0d1         ; $d0cc: d0 03     
            dec $02c9          ; $d0ce: ce c9 02  
__d0d1:     ldx #$01           ; $d0d1: a2 01     
            stx $0618          ; $d0d3: 8e 18 06  
            stx $0619          ; $d0d6: 8e 19 06  
            dex                ; $d0d9: ca        
            stx $061f          ; $d0da: 8e 1f 06  
            txa                ; $d0dd: 8a        
__d0de:     sta $0625,x        ; $d0de: 9d 25 06  
            inx                ; $d0e1: e8        
            cpx #$05           ; $d0e2: e0 05     
            bne __d0de         ; $d0e4: d0 f8     
            sta $0632          ; $d0e6: 8d 32 06  
            sta $0633          ; $d0e9: 8d 33 06  
            sta $0634          ; $d0ec: 8d 34 06  
            lda $16            ; $d0ef: a5 16     
            beq __d0fe         ; $d0f1: f0 0b     
            lda $02ca          ; $d0f3: ad ca 02  
            beq __d0fe         ; $d0f6: f0 06     
            lda $25            ; $d0f8: a5 25     
            beq __d0ff         ; $d0fa: f0 03     
            dec $25            ; $d0fc: c6 25     
__d0fe:     rts                ; $d0fe: 60        

;-------------------------------------------------------------------------------
__d0ff:     inc $25            ; $d0ff: e6 25     
            rts                ; $d101: 60        

;-------------------------------------------------------------------------------
__d102:     ldx $0241          ; $d102: ae 41 02  
            ldy $90,x          ; $d105: b4 90     
            cpx #$00           ; $d107: e0 00     
            bne __d10d         ; $d109: d0 02     
            ldy #$00           ; $d10b: a0 00     
__d10d:     lda $79,x          ; $d10d: b5 79     
            clc                ; $d10f: 18        
            adc #$0f           ; $d110: 69 0f     
            sta $1b            ; $d112: 85 1b     
            bcs __d11e         ; $d114: b0 08     
            cpy #$ff           ; $d116: c0 ff     
            bne __d11f         ; $d118: d0 05     
            cmp #$0f           ; $d11a: c9 0f     
            bne __d11f         ; $d11c: d0 01     
__d11e:     iny                ; $d11e: c8        
__d11f:     sty $1c            ; $d11f: 84 1c     
            lda $40,x          ; $d121: b5 40     
            clc                ; $d123: 18        
            adc #$0b           ; $d124: 69 0b     
            sta $1d            ; $d126: 85 1d     
            lda $1b            ; $d128: a5 1b     
            clc                ; $d12a: 18        
            adc $29            ; $d12b: 65 29     
            sta $17            ; $d12d: 85 17     
            bcs __d13a         ; $d12f: b0 09     
            lda $28            ; $d131: a5 28     
            and #$01           ; $d133: 29 01     
            beq __d138         ; $d135: f0 01     
            sec                ; $d137: 38        
__d138:     lda $17            ; $d138: a5 17     
__d13a:     and #$e0           ; $d13a: 29 e0     
            ror                ; $d13c: 6a        
            ror                ; $d13d: 6a        
            sta $18            ; $d13e: 85 18     
            lda $1c            ; $d140: a5 1c     
            bmi __d148         ; $d142: 30 04     
            beq __d15c         ; $d144: f0 16     
            bpl __d154         ; $d146: 10 0c     
__d148:     lda $1b            ; $d148: a5 1b     
            beq __d15c         ; $d14a: f0 10     
            lda $18            ; $d14c: a5 18     
            sec                ; $d14e: 38        
            sbc #$40           ; $d14f: e9 40     
            jmp __d15e         ; $d151: 4c 5e d1  

;-------------------------------------------------------------------------------
__d154:     lda $18            ; $d154: a5 18     
            clc                ; $d156: 18        
            adc #$40           ; $d157: 69 40     
            jmp __d15e         ; $d159: 4c 5e d1  

;-------------------------------------------------------------------------------
__d15c:     lda $18            ; $d15c: a5 18     
__d15e:     sec                ; $d15e: 38        
            sbc #$08           ; $d15f: e9 08     
            sta $18            ; $d161: 85 18     
            clc                ; $d163: 18        
            lda $1d            ; $d164: a5 1d     
            and #$e0           ; $d166: 29 e0     
            rol                ; $d168: 2a        
            rol                ; $d169: 2a        
            rol                ; $d16a: 2a        
            rol                ; $d16b: 2a        
            adc $18            ; $d16c: 65 18     
            sta $04f0          ; $d16e: 8d f0 04  
            rts                ; $d171: 60        

;-------------------------------------------------------------------------------
__d172:     .hex 01 ff 08 f8   ; $d172: 01 ff 08 f8   Data
__d176:     .hex 03 01 02 00   ; $d176: 03 01 02 00   Data
__d17a:     .hex 07 0d 0b 0e   ; $d17a: 07 0d 0b 0e   Data
__d17e:     .hex 0d 07 0e 0b   ; $d17e: 0d 07 0e 0b   Data

;-------------------------------------------------------------------------------
__d182:     lda $03e2          ; $d182: ad e2 03  
            cmp #$ef           ; $d185: c9 ef     
            beq __d18a         ; $d187: f0 01     
            rts                ; $d189: 60        

;-------------------------------------------------------------------------------
__d18a:     lda #$00           ; $d18a: a9 00     
            sta $17            ; $d18c: 85 17     
            sta $18            ; $d18e: 85 18     
            sta $19            ; $d190: 85 19     
            sta $03e4          ; $d192: 8d e4 03  
            ldx #$e0           ; $d195: a2 e0     
__d197:     dex                ; $d197: ca        
            sta $0300,x        ; $d198: 9d 00 03  
            bne __d197         ; $d19b: d0 fa     
            ldy $03e0          ; $d19d: ac e0 03  
            ldx $f3            ; $d1a0: a6 f3     
            stx $0300          ; $d1a2: 8e 00 03  
            lda $0480,x        ; $d1a5: bd 80 04  
            and __d17a,y       ; $d1a8: 39 7a d1  
            bne __d1b0         ; $d1ab: d0 03     
            jmp __d2be         ; $d1ad: 4c be d2  

;-------------------------------------------------------------------------------
__d1b0:     sta $0370          ; $d1b0: 8d 70 03  
            ldx #$00           ; $d1b3: a2 00     
__d1b5:     ldy $03e0          ; $d1b5: ac e0 03  
            lda $0300,x        ; $d1b8: bd 00 03  
            clc                ; $d1bb: 18        
            adc __d172,y       ; $d1bc: 79 72 d1  
            inx                ; $d1bf: e8        
            sta $0300,x        ; $d1c0: 9d 00 03  
            ldy $19            ; $d1c3: a4 19     
            beq __d1fb         ; $d1c5: f0 34     
            cpy #$01           ; $d1c7: c0 01     
            beq __d1e9         ; $d1c9: f0 1e     
            ldy $17            ; $d1cb: a4 17     
            cmp $0300,y        ; $d1cd: d9 00 03  
            bne __d1d5         ; $d1d0: d0 03     
            jmp __d2ad         ; $d1d2: 4c ad d2  

;-------------------------------------------------------------------------------
__d1d5:     ldy $0300,x        ; $d1d5: bc 00 03  
            lda $0480,y        ; $d1d8: b9 80 04  
            cmp #$20           ; $d1db: c9 20     
            bcc __d1e2         ; $d1dd: 90 03     
            jmp __d274         ; $d1df: 4c 74 d2  

;-------------------------------------------------------------------------------
__d1e2:     dex                ; $d1e2: ca        
            lda $0370,x        ; $d1e3: bd 70 03  
            jmp __d227         ; $d1e6: 4c 27 d2  

;-------------------------------------------------------------------------------
__d1e9:     ldy $17            ; $d1e9: a4 17     
            dey                ; $d1eb: 88        
            beq __d208         ; $d1ec: f0 1a     
            lda $0300,x        ; $d1ee: bd 00 03  
__d1f1:     cmp $0300,y        ; $d1f1: d9 00 03  
            beq __d202         ; $d1f4: f0 0c     
            dey                ; $d1f6: 88        
            bne __d1f1         ; $d1f7: d0 f8     
            beq __d208         ; $d1f9: f0 0d     
__d1fb:     ldy $17            ; $d1fb: a4 17     
            cmp $0300,y        ; $d1fd: d9 00 03  
            bne __d208         ; $d200: d0 06     

;-------------------------------------------------------------------------------
__d202:     inc $03e4          ; $d202: ee e4 03  
            jmp __d2ad         ; $d205: 4c ad d2  

;-------------------------------------------------------------------------------
__d208:     ldy $0300,x        ; $d208: bc 00 03  
            lda $0480,y        ; $d20b: b9 80 04  
            cmp #$30           ; $d20e: c9 30     
            bcs __d245         ; $d210: b0 33     
            cmp #$20           ; $d212: c9 20     
            bcs __d274         ; $d214: b0 5e     
__d216:     ldy $0300,x        ; $d216: bc 00 03  
            lda $0480,y        ; $d219: b9 80 04  
            ldy $03e0          ; $d21c: ac e0 03  
            and __d17e,y       ; $d21f: 39 7e d1  
            sta $0370,x        ; $d222: 9d 70 03  
            beq __d295         ; $d225: f0 6e     
__d227:     ldy #$00           ; $d227: a0 00     
            clc                ; $d229: 18        
__d22a:     ror                ; $d22a: 6a        
            bcs __d232         ; $d22b: b0 05     
            iny                ; $d22d: c8        
            cpy #$04           ; $d22e: c0 04     
            bne __d22a         ; $d230: d0 f8     
__d232:     lda __d176,y       ; $d232: b9 76 d1  
            sta $03e0          ; $d235: 8d e0 03  
            tay                ; $d238: a8        
            lda $0370,x        ; $d239: bd 70 03  
            and __d17a,y       ; $d23c: 39 7a d1  
            sta $0370,x        ; $d23f: 9d 70 03  
            jmp __d1b5         ; $d242: 4c b5 d1  

;-------------------------------------------------------------------------------
__d245:     lda $19            ; $d245: a5 19     
            beq __d25d         ; $d247: f0 14     
            cmp #$02           ; $d249: c9 02     
            beq __d216         ; $d24b: f0 c9     
            inc $19            ; $d24d: e6 19     
            stx $18            ; $d24f: 86 18     
            lda $0300,x        ; $d251: bd 00 03  
            ldy $17            ; $d254: a4 17     
            cmp $0300,y        ; $d256: d9 00 03  
            beq __d2ad         ; $d259: f0 52     
            bne __d216         ; $d25b: d0 b9     
__d25d:     inc $19            ; $d25d: e6 19     
            stx $17            ; $d25f: 86 17     
            inx                ; $d261: e8        
            stx $18            ; $d262: 86 18     
            lda $0300          ; $d264: ad 00 03  
            sta $0300,x        ; $d267: 9d 00 03  
            lda $0370          ; $d26a: ad 70 03  
            sta $0370,x        ; $d26d: 9d 70 03  
            bne __d227         ; $d270: d0 b5     
            beq __d2be         ; $d272: f0 4a     
__d274:     txa                ; $d274: 8a        
            tay                ; $d275: a8        
            lda $0300,x        ; $d276: bd 00 03  
__d279:     dey                ; $d279: 88        
            cmp $0300,y        ; $d27a: d9 00 03  
            beq __d285         ; $d27d: f0 06     
            cpy $18            ; $d27f: c4 18     
            bne __d279         ; $d281: d0 f6     
            beq __d216         ; $d283: f0 91     
__d285:     lda $0370,y        ; $d285: b9 70 03  
            sty $1c            ; $d288: 84 1c     
            ldy $03e0          ; $d28a: ac e0 03  
            and __d17e,y       ; $d28d: 39 7e d1  
            ldy $1c            ; $d290: a4 1c     
            sta $0370,y        ; $d292: 99 70 03  
__d295:     dex                ; $d295: ca        
            lda $0300,x        ; $d296: bd 00 03  
            cmp $0300          ; $d299: cd 00 03  
            beq __d2a5         ; $d29c: f0 07     
            lda $0370,x        ; $d29e: bd 70 03  
            beq __d295         ; $d2a1: f0 f2     
            bne __d227         ; $d2a3: d0 82     
__d2a5:     lda $0370,x        ; $d2a5: bd 70 03  
            beq __d2be         ; $d2a8: f0 14     
            jmp __d227         ; $d2aa: 4c 27 d2  

;-------------------------------------------------------------------------------
__d2ad:     lda #$01           ; $d2ad: a9 01     
            sta $0623          ; $d2af: 8d 23 06  
            sta $0624          ; $d2b2: 8d 24 06  
            lda #$00           ; $d2b5: a9 00     
            sta $0301,x        ; $d2b7: 9d 01 03  
            sta $0302,x        ; $d2ba: 9d 02 03  
            rts                ; $d2bd: 60        

;-------------------------------------------------------------------------------
__d2be:     sta $03e2          ; $d2be: 8d e2 03  
            rts                ; $d2c1: 60        

;-------------------------------------------------------------------------------
__d2c2:     lda $03e2          ; $d2c2: ad e2 03  
            cmp #$ee           ; $d2c5: c9 ee     
            beq __d2ca         ; $d2c7: f0 01     
            rts                ; $d2c9: 60        

;-------------------------------------------------------------------------------
__d2ca:     ldx #$00           ; $d2ca: a2 00     
__d2cc:     inx                ; $d2cc: e8        
            lda $0300,x        ; $d2cd: bd 00 03  
            cmp $0300          ; $d2d0: cd 00 03  
            bne __d2cc         ; $d2d3: d0 f7     
            lda $0301,x        ; $d2d5: bd 01 03  
            bne __d2df         ; $d2d8: d0 05     
            lda $0302,x        ; $d2da: bd 02 03  
            beq __d350         ; $d2dd: f0 71     
__d2df:     stx $18            ; $d2df: 86 18     
            dex                ; $d2e1: ca        
            ldy #$00           ; $d2e2: a0 00     
__d2e4:     lda $0300,x        ; $d2e4: bd 00 03  
            sta $17            ; $d2e7: 85 17     
            lda $0300,y        ; $d2e9: b9 00 03  
            sta $0300,x        ; $d2ec: 9d 00 03  
            lda $17            ; $d2ef: a5 17     
            sta $0300,y        ; $d2f1: 99 00 03  
            dex                ; $d2f4: ca        
            iny                ; $d2f5: c8        
            sty $17            ; $d2f6: 84 17     
            cpx $17            ; $d2f8: e4 17     
            bcs __d2e4         ; $d2fa: b0 e8     
            ldx $18            ; $d2fc: a6 18     
__d2fe:     lda $0301,x        ; $d2fe: bd 01 03  
            sta $0300,x        ; $d301: 9d 00 03  
            bne __d30b         ; $d304: d0 05     
            lda $0302,x        ; $d306: bd 02 03  
            beq __d30e         ; $d309: f0 03     
__d30b:     inx                ; $d30b: e8        
            bne __d2fe         ; $d30c: d0 f0     
__d30e:     ldy #$00           ; $d30e: a0 00     
            dex                ; $d310: ca        
            lda $0300,x        ; $d311: bd 00 03  
            cmp $0300,y        ; $d314: d9 00 03  
            bne __d334         ; $d317: d0 1b     
__d319:     lda $02ff,x        ; $d319: bd ff 02  
            cmp $0301,y        ; $d31c: d9 01 03  
            bne __d325         ; $d31f: d0 04     
            dex                ; $d321: ca        
            iny                ; $d322: c8        
            bne __d319         ; $d323: d0 f4     
__d325:     cpy #$00           ; $d325: c0 00     
            beq __d350         ; $d327: f0 27     
            lda #$00           ; $d329: a9 00     
            sta $0301,x        ; $d32b: 9d 01 03  
            sta $0302,x        ; $d32e: 9d 02 03  
            tax                ; $d331: aa        
            beq __d33c         ; $d332: f0 08     

;-------------------------------------------------------------------------------
__d334:     iny                ; $d334: c8        
            cmp $0300,y        ; $d335: d9 00 03  
            bne __d334         ; $d338: d0 fa     
            ldx #$00           ; $d33a: a2 00     
__d33c:     lda $0300,y        ; $d33c: b9 00 03  
            sta $0300,x        ; $d33f: 9d 00 03  
            bne __d349         ; $d342: d0 05     
            lda $0301,y        ; $d344: b9 01 03  
            beq __d34d         ; $d347: f0 04     
__d349:     inx                ; $d349: e8        
            iny                ; $d34a: c8        
            bne __d33c         ; $d34b: d0 ef     
__d34d:     sta $0301,x        ; $d34d: 9d 01 03  
__d350:     lda #$00           ; $d350: a9 00     
            sta $03e1          ; $d352: 8d e1 03  
            sta $03e3          ; $d355: 8d e3 03  
            ldx #$09           ; $d358: a2 09     
__d35a:     lda $0400,x        ; $d35a: bd 00 04  
            and #$f0           ; $d35d: 29 f0     
            cmp #$80           ; $d35f: c9 80     
            beq __d366         ; $d361: f0 03     
            inc $03e1          ; $d363: ee e1 03  
__d366:     inx                ; $d366: e8        
            cpx #$6f           ; $d367: e0 6f     
            beq __d376         ; $d369: f0 0b     
            txa                ; $d36b: 8a        
            and #$07           ; $d36c: 29 07     
            beq __d366         ; $d36e: f0 f6     
            cmp #$07           ; $d370: c9 07     
            beq __d366         ; $d372: f0 f2     
            bne __d35a         ; $d374: d0 e4     
__d376:     lda #$00           ; $d376: a9 00     
            inx                ; $d378: e8        
__d379:     dex                ; $d379: ca        
            sta $0370,x        ; $d37a: 9d 70 03  
            bne __d379         ; $d37d: d0 fa     
            ldy #$00           ; $d37f: a0 00     
__d381:     lda $0301,x        ; $d381: bd 01 03  
            bne __d38b         ; $d384: d0 05     
            lda $0302,x        ; $d386: bd 02 03  
            beq __d3af         ; $d389: f0 24     
__d38b:     lda $0301,x        ; $d38b: bd 01 03  
            sec                ; $d38e: 38        
            sbc $0300,x        ; $d38f: fd 00 03  
            cmp #$08           ; $d392: c9 08     
            bne __d3a0         ; $d394: d0 0a     
            ldy $0301,x        ; $d396: bc 01 03  
            iny                ; $d399: c8        
            tya                ; $d39a: 98        
            sta $0370,y        ; $d39b: 99 70 03  
            bne __d3ac         ; $d39e: d0 0c     
__d3a0:     cmp #$f8           ; $d3a0: c9 f8     
            bne __d3ac         ; $d3a2: d0 08     
            ldy $0300,x        ; $d3a4: bc 00 03  
            iny                ; $d3a7: c8        
            tya                ; $d3a8: 98        
            sta $0370,y        ; $d3a9: 99 70 03  
__d3ac:     inx                ; $d3ac: e8        
            bne __d381         ; $d3ad: d0 d2     
__d3af:     ldy #$00           ; $d3af: a0 00     
            sty $17            ; $d3b1: 84 17     
            sty $18            ; $d3b3: 84 18     
__d3b5:     lda $0370,y        ; $d3b5: b9 70 03  
            beq __d3bc         ; $d3b8: f0 02     
            inc $17            ; $d3ba: e6 17     
__d3bc:     lda $17            ; $d3bc: a5 17     
            and #$01           ; $d3be: 29 01     
            beq __d3d3         ; $d3c0: f0 11     
            lda $0400,y        ; $d3c2: b9 00 04  
            and #$f0           ; $d3c5: 29 f0     
            cmp #$80           ; $d3c7: c9 80     
            beq __d3d3         ; $d3c9: f0 08     
            tya                ; $d3cb: 98        
            sta $0370,y        ; $d3cc: 99 70 03  
            inc $18            ; $d3cf: e6 18     
            bne __d3d8         ; $d3d1: d0 05     
__d3d3:     lda #$00           ; $d3d3: a9 00     
            sta $0370,y        ; $d3d5: 99 70 03  
__d3d8:     iny                ; $d3d8: c8        
            cpy #$70           ; $d3d9: c0 70     
            beq __d3df         ; $d3db: f0 02     
            bne __d3b5         ; $d3dd: d0 d6     
__d3df:     lda $03e1          ; $d3df: ad e1 03  
            sec                ; $d3e2: 38        
            sbc $18            ; $d3e3: e5 18     
            cmp $18            ; $d3e5: c5 18     
            bcs __d40d         ; $d3e7: b0 24     
            sta $18            ; $d3e9: 85 18     
            ldy #$09           ; $d3eb: a0 09     
__d3ed:     lda $0400,y        ; $d3ed: b9 00 04  
            and #$f0           ; $d3f0: 29 f0     
            cmp #$80           ; $d3f2: c9 80     
            beq __d406         ; $d3f4: f0 10     
            lda $0370,y        ; $d3f6: b9 70 03  
            beq __d402         ; $d3f9: f0 07     
            lda #$00           ; $d3fb: a9 00     
            sta $0370,y        ; $d3fd: 99 70 03  
            beq __d406         ; $d400: f0 04     
__d402:     tya                ; $d402: 98        
            sta $0370,y        ; $d403: 99 70 03  
__d406:     iny                ; $d406: c8        
            cpy #$70           ; $d407: c0 70     
            beq __d40d         ; $d409: f0 02     
            bne __d3ed         ; $d40b: d0 e0     
__d40d:     lda $18            ; $d40d: a5 18     
            cmp #$01           ; $d40f: c9 01     
            beq __d415         ; $d411: f0 02     
            lda #$00           ; $d413: a9 00     
__d415:     sta $02cf          ; $d415: 8d cf 02  
            lda #$01           ; $d418: a9 01     
            sta $1f            ; $d41a: 85 1f     
            rts                ; $d41c: 60        

;-------------------------------------------------------------------------------
__d41d:     lda $03e2          ; $d41d: ad e2 03  
            cmp #$de           ; $d420: c9 de     
            bcc __d477         ; $d422: 90 53     
            cmp #$ef           ; $d424: c9 ef     
            bcs __d477         ; $d426: b0 4f     
            lda #$00           ; $d428: a9 00     
            sta $f4            ; $d42a: 85 f4     
            ldx #$08           ; $d42c: a2 08     
__d42e:     dex                ; $d42e: ca        
            sta $9f,x          ; $d42f: 95 9f     
            bne __d42e         ; $d431: d0 fb     
            ldx $03e3          ; $d433: ae e3 03  
__d436:     ldy $0300,x        ; $d436: bc 00 03  
            bne __d440         ; $d439: d0 05     
            lda $0301,x        ; $d43b: bd 01 03  
            beq __d46f         ; $d43e: f0 2f     
__d440:     lda $0480,y        ; $d440: b9 80 04  
            cmp #$10           ; $d443: c9 10     
            bcs __d456         ; $d445: b0 0f     
            ora #$10           ; $d447: 09 10     
            sta $0480,y        ; $d449: 99 80 04  
            sty $f3            ; $d44c: 84 f3     
            jsr __b9be         ; $d44e: 20 be b9  
            jsr __ba6d         ; $d451: 20 6d ba  
            inc $f4            ; $d454: e6 f4     
__d456:     lda $03e4          ; $d456: ad e4 03  
            beq __d45f         ; $d459: f0 04     
            lda #$20           ; $d45b: a9 20     
            bne __d461         ; $d45d: d0 02     
__d45f:     lda #$30           ; $d45f: a9 30     
__d461:     sta $0480,y        ; $d461: 99 80 04  
            inx                ; $d464: e8        
            stx $03e3          ; $d465: 8e e3 03  
            lda $f4            ; $d468: a5 f4     
            cmp #$08           ; $d46a: c9 08     
            bcc __d436         ; $d46c: 90 c8     
            rts                ; $d46e: 60        

;-------------------------------------------------------------------------------
__d46f:     sta $03e3          ; $d46f: 8d e3 03  
            lda #$de           ; $d472: a9 de     
            sta $03e2          ; $d474: 8d e2 03  
__d477:     rts                ; $d477: 60        

;-------------------------------------------------------------------------------
__d478:     .hex 00 f8 ff f7   ; $d478: 00 f8 ff f7   Data
__d47c:     .hex a5 aa ad 81   ; $d47c: a5 aa ad 81   Data
            .hex a6 aa ae 81   ; $d480: a6 aa ae 81   Data
            .hex a0 a8 a3 81   ; $d484: a0 a8 a3 81   Data
            .hex a1 a9 a3 81   ; $d488: a1 a9 a3 81   Data
            .hex a2 aa a3 81   ; $d48c: a2 aa a3 81   Data

;-------------------------------------------------------------------------------
__d490:     lda $03e2          ; $d490: ad e2 03  
            cmp #$0b           ; $d493: c9 0b     
            bcc __d49f         ; $d495: 90 08     
            cmp #$de           ; $d497: c9 de     
            bcs __d49f         ; $d499: b0 04     
            and #$0f           ; $d49b: 29 0f     
            bne __d4a0         ; $d49d: d0 01     
__d49f:     rts                ; $d49f: 60        

;-------------------------------------------------------------------------------
__d4a0:     lda #$00           ; $d4a0: a9 00     
            ldx #$0a           ; $d4a2: a2 0a     
__d4a4:     dex                ; $d4a4: ca        
            sta $9d,x          ; $d4a5: 95 9d     
            bne __d4a4         ; $d4a7: d0 fb     
            lda $03e2          ; $d4a9: ad e2 03  
            and #$1f           ; $d4ac: 29 1f     
            cmp #$1d           ; $d4ae: c9 1d     
            bne __d4f2         ; $d4b0: d0 40     
__d4b2:     jsr __d670         ; $d4b2: 20 70 d6  
            ldy #$00           ; $d4b5: a0 00     
            tax                ; $d4b7: aa        
__d4b8:     lda $0370,x        ; $d4b8: bd 70 03  
            bne __d4f2         ; $d4bb: d0 35     
            iny                ; $d4bd: c8        
            txa                ; $d4be: 8a        
            sec                ; $d4bf: 38        
            sbc #$08           ; $d4c0: e9 08     
            tax                ; $d4c2: aa        
            cpx #$08           ; $d4c3: e0 08     
            bcs __d4b8         ; $d4c5: b0 f1     
            cpy #$1a           ; $d4c7: c0 1a     
            beq __d4d2         ; $d4c9: f0 07     
            txa                ; $d4cb: 8a        
            clc                ; $d4cc: 18        
            adc #$69           ; $d4cd: 69 69     
            tax                ; $d4cf: aa        
            bne __d4b8         ; $d4d0: d0 e6     
__d4d2:     lda $03e2          ; $d4d2: ad e2 03  
            cmp #$1d           ; $d4d5: c9 1d     
            bne __d4ea         ; $d4d7: d0 11     
            jsr __b8cc         ; $d4d9: 20 cc b8  
            lda #$02           ; $d4dc: a9 02     
            sta $03e2          ; $d4de: 8d e2 03  
            lda #$00           ; $d4e1: a9 00     
            sta $0623          ; $d4e3: 8d 23 06  
            sta $0624          ; $d4e6: 8d 24 06  
            rts                ; $d4e9: 60        

;-------------------------------------------------------------------------------
__d4ea:     sec                ; $d4ea: 38        
            sbc #$20           ; $d4eb: e9 20     
            sta $03e2          ; $d4ed: 8d e2 03  
            bne __d4b2         ; $d4f0: d0 c0     
__d4f2:     jsr __d670         ; $d4f2: 20 70 d6  
            sta $f1            ; $d4f5: 85 f1     
            tax                ; $d4f7: aa        
            lda $0370,x        ; $d4f8: bd 70 03  
            beq __d500         ; $d4fb: f0 03     
            jmp __d58e         ; $d4fd: 4c 8e d5  

;-------------------------------------------------------------------------------
__d500:     lda $0400,x        ; $d500: bd 00 04  
            and #$f0           ; $d503: 29 f0     
            cmp #$80           ; $d505: c9 80     
            bne __d51d         ; $d507: d0 14     
            inx                ; $d509: e8        
            lda $0400,x        ; $d50a: bd 00 04  
            cmp #$ad           ; $d50d: c9 ad     
            beq __d519         ; $d50f: f0 08     
            cmp #$ae           ; $d511: c9 ae     
            beq __d519         ; $d513: f0 04     
            cmp #$a4           ; $d515: c9 a4     
            bne __d53a         ; $d517: d0 21     
__d519:     lda #$81           ; $d519: a9 81     
            bne __d52b         ; $d51b: d0 0e     
__d51d:     inx                ; $d51d: e8        
            lda $0400,x        ; $d51e: bd 00 04  
            cmp #$a3           ; $d521: c9 a3     
            beq __d529         ; $d523: f0 04     
            cmp #$a4           ; $d525: c9 a4     
            bne __d53d         ; $d527: d0 14     
__d529:     lda #$80           ; $d529: a9 80     
__d52b:     sta $0400,x        ; $d52b: 9d 00 04  
            stx $f2            ; $d52e: 86 f2     
            lda #$01           ; $d530: a9 01     
            sta $f4            ; $d532: 85 f4     
            jsr __affc         ; $d534: 20 fc af  
            jsr __b87d         ; $d537: 20 7d b8  
__d53a:     jmp __d663         ; $d53a: 4c 63 d6  

;-------------------------------------------------------------------------------
__d53d:     ldy #$00           ; $d53d: a0 00     
            ldx $f1            ; $d53f: a6 f1     
            lda $0368,x        ; $d541: bd 68 03  
            beq __d54f         ; $d544: f0 09     
            lda $0400,x        ; $d546: bd 00 04  
            ora #$10           ; $d549: 09 10     
            sta $0400,x        ; $d54b: 9d 00 04  
            iny                ; $d54e: c8        
__d54f:     lda $0378,x        ; $d54f: bd 78 03  
            beq __d55d         ; $d552: f0 09     
            lda $0400,x        ; $d554: bd 00 04  
            ora #$40           ; $d557: 09 40     
            sta $0400,x        ; $d559: 9d 00 04  
            iny                ; $d55c: c8        
__d55d:     cpy #$00           ; $d55d: c0 00     
            bne __d564         ; $d55f: d0 03     
            jmp __d663         ; $d561: 4c 63 d6  

;-------------------------------------------------------------------------------
__d564:     ldy #$00           ; $d564: a0 00     
            sty $f4            ; $d566: 84 f4     
            jsr __affc         ; $d568: 20 fc af  
            jsr __b87d         ; $d56b: 20 7d b8  
__d56e:     lda $f1            ; $d56e: a5 f1     
            clc                ; $d570: 18        
            adc __d478,y       ; $d571: 79 78 d4  
            sta $f3            ; $d574: 85 f3     
            tax                ; $d576: aa        
            lda $0480,x        ; $d577: bd 80 04  
            cmp #$10           ; $d57a: c9 10     
            bcs __d584         ; $d57c: b0 06     
            jsr __b9be         ; $d57e: 20 be b9  
            jsr __ba6d         ; $d581: 20 6d ba  
__d584:     inc $f4            ; $d584: e6 f4     
            iny                ; $d586: c8        
            cpy #$04           ; $d587: c0 04     
            bne __d56e         ; $d589: d0 e3     
            jmp __d663         ; $d58b: 4c 63 d6  

;-------------------------------------------------------------------------------
__d58e:     ldy #$00           ; $d58e: a0 00     
            sty $f4            ; $d590: 84 f4     
            ldx $f1            ; $d592: a6 f1     
            lda $0400,x        ; $d594: bd 00 04  
            and #$b3           ; $d597: 29 b3     
            cmp #$b0           ; $d599: c9 b0     
            beq __d5bc         ; $d59b: f0 1f     
            iny                ; $d59d: c8        
            lda $0400,x        ; $d59e: bd 00 04  
            and #$e6           ; $d5a1: 29 e6     
            cmp #$e0           ; $d5a3: c9 e0     
            beq __d5bc         ; $d5a5: f0 15     
            iny                ; $d5a7: c8        
            lda $0400,x        ; $d5a8: bd 00 04  
            and #$99           ; $d5ab: 29 99     
            cmp #$90           ; $d5ad: c9 90     
            beq __d5bc         ; $d5af: f0 0b     
            iny                ; $d5b1: c8        
            lda $0400,x        ; $d5b2: bd 00 04  
            and #$cc           ; $d5b5: 29 cc     
            cmp #$c0           ; $d5b7: c9 c0     
            beq __d5bc         ; $d5b9: f0 01     
            iny                ; $d5bb: c8        
__d5bc:     tya                ; $d5bc: 98        
            asl                ; $d5bd: 0a        
            asl                ; $d5be: 0a        
            tay                ; $d5bf: a8        
            lda $03e2          ; $d5c0: ad e2 03  
            and #$10           ; $d5c3: 29 10     
            beq __d5f1         ; $d5c5: f0 2a     
            lda __d47c,y       ; $d5c7: b9 7c d4  
            sta $0400,x        ; $d5ca: 9d 00 04  
            jsr __affc         ; $d5cd: 20 fc af  
            jsr __b87d         ; $d5d0: 20 7d b8  
            inx                ; $d5d3: e8        
            lda $0400,x        ; $d5d4: bd 00 04  
            and #$d0           ; $d5d7: 29 d0     
            cmp #$80           ; $d5d9: c9 80     
            bne __d630         ; $d5db: d0 53     
            iny                ; $d5dd: c8        
            lda __d47c,y       ; $d5de: b9 7c d4  
            sta $0400,x        ; $d5e1: 9d 00 04  
            stx $f2            ; $d5e4: 86 f2     
            inc $f4            ; $d5e6: e6 f4     
            jsr __affc         ; $d5e8: 20 fc af  
            jsr __b87d         ; $d5eb: 20 7d b8  
            jmp __d663         ; $d5ee: 4c 63 d6  

;-------------------------------------------------------------------------------
__d5f1:     iny                ; $d5f1: c8        
            iny                ; $d5f2: c8        
            lda $03ff,x        ; $d5f3: bd ff 03  
            and #$d0           ; $d5f6: 29 d0     
            cmp #$80           ; $d5f8: c9 80     
            beq __d601         ; $d5fa: f0 05     
            lda __d47c,y       ; $d5fc: b9 7c d4  
            bne __d603         ; $d5ff: d0 02     
__d601:     lda #$a4           ; $d601: a9 a4     
__d603:     sta $0400,x        ; $d603: 9d 00 04  
            stx $f1            ; $d606: 86 f1     
            jsr __affc         ; $d608: 20 fc af  
            jsr __b87d         ; $d60b: 20 7d b8  
            inx                ; $d60e: e8        
            lda $0400,x        ; $d60f: bd 00 04  
            cmp #$a8           ; $d612: c9 a8     
            beq __d61e         ; $d614: f0 08     
            cmp #$a9           ; $d616: c9 a9     
            beq __d61e         ; $d618: f0 04     
            cmp #$aa           ; $d61a: c9 aa     
            bne __d663         ; $d61c: d0 45     
__d61e:     lda #$81           ; $d61e: a9 81     
            sta $0400,x        ; $d620: 9d 00 04  
            stx $f2            ; $d623: 86 f2     
            inc $f4            ; $d625: e6 f4     
            jsr __affc         ; $d627: 20 fc af  
            jsr __b87d         ; $d62a: 20 7d b8  
            jmp __d663         ; $d62d: 4c 63 d6  

;-------------------------------------------------------------------------------
__d630:     stx $f2            ; $d630: 86 f2     
            lda $0400,x        ; $d632: bd 00 04  
            ora #$20           ; $d635: 09 20     
            sta $0400,x        ; $d637: 9d 00 04  
            inc $f4            ; $d63a: e6 f4     
            jsr __affc         ; $d63c: 20 fc af  
            jsr __b87d         ; $d63f: 20 7d b8  
            ldy #$00           ; $d642: a0 00     
            sty $f4            ; $d644: 84 f4     
__d646:     lda $f2            ; $d646: a5 f2     
            clc                ; $d648: 18        
            adc __d478,y       ; $d649: 79 78 d4  
            sta $f3            ; $d64c: 85 f3     
            tax                ; $d64e: aa        
            lda $0480,x        ; $d64f: bd 80 04  
            cmp #$10           ; $d652: c9 10     
            bcs __d65c         ; $d654: b0 06     
            jsr __b9be         ; $d656: 20 be b9  
            jsr __ba6d         ; $d659: 20 6d ba  
__d65c:     inc $f4            ; $d65c: e6 f4     
            iny                ; $d65e: c8        
            cpy #$04           ; $d65f: c0 04     
            bne __d646         ; $d661: d0 e3     
__d663:     lda $03e2          ; $d663: ad e2 03  
            cmp #$d1           ; $d666: c9 d1     
            bne __d66f         ; $d668: d0 05     
            lda #$ce           ; $d66a: a9 ce     
            sta $03e2          ; $d66c: 8d e2 03  
__d66f:     rts                ; $d66f: 60        

;-------------------------------------------------------------------------------
__d670:     lda $03e2          ; $d670: ad e2 03  
            rol                ; $d673: 2a        
            rol                ; $d674: 2a        
            rol                ; $d675: 2a        
            rol                ; $d676: 2a        
            sta $17            ; $d677: 85 17     
            and #$f0           ; $d679: 29 f0     
            lsr                ; $d67b: 4a        
            sta $18            ; $d67c: 85 18     
            lda $17            ; $d67e: a5 17     
            and #$07           ; $d680: 29 07     
            ora $18            ; $d682: 05 18     
            rts                ; $d684: 60        

;-------------------------------------------------------------------------------
__d685:     lda $03e2          ; $d685: ad e2 03  
            beq __d6de         ; $d688: f0 54     
            cmp #$d0           ; $d68a: c9 d0     
            bcs __d6de         ; $d68c: b0 50     
            and #$0f           ; $d68e: 29 0f     
            bne __d6de         ; $d690: d0 4c     
            ldx #$00           ; $d692: a2 00     
            stx $9d            ; $d694: 86 9d     
            stx $9e            ; $d696: 86 9e     
            txa                ; $d698: 8a        
__d699:     sta $9f,x          ; $d699: 95 9f     
            inx                ; $d69b: e8        
            cpx #$04           ; $d69c: e0 04     
            bne __d699         ; $d69e: d0 f9     
            lda $03e2          ; $d6a0: ad e2 03  
            rol                ; $d6a3: 2a        
            rol                ; $d6a4: 2a        
            rol                ; $d6a5: 2a        
            rol                ; $d6a6: 2a        
            clc                ; $d6a7: 18        
            adc #$01           ; $d6a8: 69 01     
            ora #$08           ; $d6aa: 09 08     
            sta $18            ; $d6ac: 85 18     
            ldx #$00           ; $d6ae: a2 00     
__d6b0:     stx $f4            ; $d6b0: 86 f4     
            txa                ; $d6b2: 8a        
            asl                ; $d6b3: 0a        
            asl                ; $d6b4: 0a        
            asl                ; $d6b5: 0a        
            clc                ; $d6b6: 18        
            adc $18            ; $d6b7: 65 18     
            sta $f1            ; $d6b9: 85 f1     
            jsr __d6ef         ; $d6bb: 20 ef d6  
            inx                ; $d6be: e8        
            cpx #$0e           ; $d6bf: e0 0e     
            bne __d6b0         ; $d6c1: d0 ed     
            ldx $03e2          ; $d6c3: ae e2 03  
            cpx #$10           ; $d6c6: e0 10     
            beq __d6ce         ; $d6c8: f0 04     
            dex                ; $d6ca: ca        
            dex                ; $d6cb: ca        
            bne __d6db         ; $d6cc: d0 0d     
__d6ce:     jsr __b8cc         ; $d6ce: 20 cc b8  
            lda #$00           ; $d6d1: a9 00     
            sta $0623          ; $d6d3: 8d 23 06  
            sta $0624          ; $d6d6: 8d 24 06  
            ldx #$02           ; $d6d9: a2 02     
__d6db:     stx $03e2          ; $d6db: 8e e2 03  
__d6de:     rts                ; $d6de: 60        

;-------------------------------------------------------------------------------
__d6df:     .hex cc c4 4c 44   ; $d6df: cc c4 4c 44   Data
            .hex 88 84 48 44   ; $d6e3: 88 84 48 44   Data
__d6e7:     .hex 33 31 13 11   ; $d6e7: 33 31 13 11   Data
            .hex 22 21 12 11   ; $d6eb: 22 21 12 11   Data

;-------------------------------------------------------------------------------
__d6ef:     txa                ; $d6ef: 8a        
            pha                ; $d6f0: 48        
            tya                ; $d6f1: 98        
            pha                ; $d6f2: 48        
            ldx #$00           ; $d6f3: a2 00     
            lda $26            ; $d6f5: a5 26     
            and #$10           ; $d6f7: 29 10     
            bne __d6fd         ; $d6f9: d0 02     
            ldx #$04           ; $d6fb: a2 04     
__d6fd:     stx $1b            ; $d6fd: 86 1b     
            stx $1c            ; $d6ff: 86 1c     
            ldx #$00           ; $d701: a2 00     
            lda $f1            ; $d703: a5 f1     
            sec                ; $d705: 38        
            sbc #$08           ; $d706: e9 08     
            bpl __d70c         ; $d708: 10 02     
            and #$7f           ; $d70a: 29 7f     
__d70c:     sta $f2            ; $d70c: 85 f2     
__d70e:     ldy $f1,x          ; $d70e: b4 f1     
            lda $0400,y        ; $d710: b9 00 04  
            cmp #$81           ; $d713: c9 81     
            beq __d734         ; $d715: f0 1d     
            inc $1b,x          ; $d717: f6 1b     
            cmp #$80           ; $d719: c9 80     
            beq __d734         ; $d71b: f0 17     
            and #$fc           ; $d71d: 29 fc     
            cmp #$a8           ; $d71f: c9 a8     
            beq __d734         ; $d721: f0 11     
            inc $1b,x          ; $d723: f6 1b     
            lda $0400,y        ; $d725: b9 00 04  
            and #$f7           ; $d728: 29 f7     
            cmp #$a5           ; $d72a: c9 a5     
            beq __d734         ; $d72c: f0 06     
            cmp #$a6           ; $d72e: c9 a6     
            beq __d734         ; $d730: f0 02     
            inc $1b,x          ; $d732: f6 1b     
__d734:     inx                ; $d734: e8        
            cpx #$02           ; $d735: e0 02     
            bne __d70e         ; $d737: d0 d5     
            ldx $f4            ; $d739: a6 f4     
            ldy $1b            ; $d73b: a4 1b     
            lda __d6df,y       ; $d73d: b9 df d6  
            ldy $1c            ; $d740: a4 1c     
            ora __d6e7,y       ; $d742: 19 e7 d6  
            sta $0280,x        ; $d745: 9d 80 02  
            lda $f1            ; $d748: a5 f1     
            cmp #$40           ; $d74a: c9 40     
            bcc __d752         ; $d74c: 90 04     
            lda #$27           ; $d74e: a9 27     
            bne __d754         ; $d750: d0 02     
__d752:     lda #$23           ; $d752: a9 23     
__d754:     sta $0260,x        ; $d754: 9d 60 02  
            lda $f1            ; $d757: a5 f1     
            and #$38           ; $d759: 29 38     
            lsr                ; $d75b: 4a        
            lsr                ; $d75c: 4a        
            lsr                ; $d75d: 4a        
            sta $17            ; $d75e: 85 17     
            lda $f1            ; $d760: a5 f1     
            and #$07           ; $d762: 29 07     
            asl                ; $d764: 0a        
            asl                ; $d765: 0a        
            asl                ; $d766: 0a        
            ora $17            ; $d767: 05 17     
            ora #$c0           ; $d769: 09 c0     
            sta $0270,x        ; $d76b: 9d 70 02  
            pla                ; $d76e: 68        
            tay                ; $d76f: a8        
            pla                ; $d770: 68        
            tax                ; $d771: aa        
            rts                ; $d772: 60        

;-------------------------------------------------------------------------------
__d773:     lda $03e2          ; $d773: ad e2 03  
            bne __d7ae         ; $d776: d0 36     
            lda $26            ; $d778: a5 26     
            and #$0f           ; $d77a: 29 0f     
            bne __d7ae         ; $d77c: d0 30     
            ldy #$00           ; $d77e: a0 00     
__d780:     lda $022b          ; $d780: ad 2b 02  
            sta $19            ; $d783: 85 19     
__d785:     lda $19            ; $d785: a5 19     
            and #$07           ; $d787: 29 07     
            bne __d78d         ; $d789: d0 02     
            ora #$06           ; $d78b: 09 06     
__d78d:     sta $18            ; $d78d: 85 18     
            tya                ; $d78f: 98        
            asl                ; $d790: 0a        
            asl                ; $d791: 0a        
            asl                ; $d792: 0a        
            clc                ; $d793: 18        
            adc $18            ; $d794: 65 18     
            sta $f1            ; $d796: 85 f1     
            sty $f4            ; $d798: 84 f4     
            jsr __d6ef         ; $d79a: 20 ef d6  
            iny                ; $d79d: c8        
            cpy #$10           ; $d79e: c0 10     
            beq __d7ae         ; $d7a0: f0 0c     
            ror $19            ; $d7a2: 66 19     
            cpy #$06           ; $d7a4: c0 06     
            beq __d780         ; $d7a6: f0 d8     
            cpy #$0c           ; $d7a8: c0 0c     
            beq __d780         ; $d7aa: f0 d4     
            bne __d785         ; $d7ac: d0 d7     
__d7ae:     rts                ; $d7ae: 60        

;-------------------------------------------------------------------------------
__d7af:     ldx #$05           ; $d7af: a2 05     
            lda #$00           ; $d7b1: a9 00     
            sta $025a          ; $d7b3: 8d 5a 02  
            sta $0290          ; $d7b6: 8d 90 02  
            sta $0291          ; $d7b9: 8d 91 02  
            sta $0244          ; $d7bc: 8d 44 02  
            sta $025e          ; $d7bf: 8d 5e 02  
            sta $025d          ; $d7c2: 8d 5d 02  
            sta $02ce          ; $d7c5: 8d ce 02  
            sta $02cf          ; $d7c8: 8d cf 02  
            sta $02dd          ; $d7cb: 8d dd 02  
            sta $02de          ; $d7ce: 8d de 02  
            sta $04f2          ; $d7d1: 8d f2 04  
            sta $04f1          ; $d7d4: 8d f1 04  
            sta $0295          ; $d7d7: 8d 95 02  
            sta $0296          ; $d7da: 8d 96 02  
            sta $02ef          ; $d7dd: 8d ef 02  
__d7e0:     sta $02e9,x        ; $d7e0: 9d e9 02  
            dex                ; $d7e3: ca        
            sta $0235,x        ; $d7e4: 9d 35 02  
            bne __d7e0         ; $d7e7: d0 f7     
            ldx #$0b           ; $d7e9: a2 0b     
__d7eb:     dex                ; $d7eb: ca        
            sta $86,x          ; $d7ec: 95 86     
            sta $029b,x        ; $d7ee: 9d 9b 02  
            sta $02a6,x        ; $d7f1: 9d a6 02  
            sta $02df,x        ; $d7f4: 9d df 02  
            bne __d7eb         ; $d7f7: d0 f2     
            ldx #$03           ; $d7f9: a2 03     
            lda #$ef           ; $d7fb: a9 ef     
__d7fd:     dex                ; $d7fd: ca        
            sta $0250,x        ; $d7fe: 9d 50 02  
            bne __d7fd         ; $d801: d0 fa     
            lda #$b4           ; $d803: a9 b4     
            sta $28            ; $d805: 85 28     
            lda $0259          ; $d807: ad 59 02  
            asl                ; $d80a: 0a        
            tay                ; $d80b: a8        
            lda __9e60,y       ; $d80c: b9 60 9e  
            sta $1b            ; $d80f: 85 1b     
            lda __9e61,y       ; $d811: b9 61 9e  
            sta $1c            ; $d814: 85 1c     
            ldy #$00           ; $d816: a0 00     
            lda ($1b),y        ; $d818: b1 1b     
            iny                ; $d81a: c8        
            clc                ; $d81b: 18        
            adc ($1b),y        ; $d81c: 71 1b     
            sta $0229          ; $d81e: 8d 29 02  
            sta $022f          ; $d821: 8d 2f 02  
            lda ($1b),y        ; $d824: b1 1b     
            sta $022a          ; $d826: 8d 2a 02  
            ldx $25            ; $d829: a6 25     
            iny                ; $d82b: c8        
            lda $05f5,x        ; $d82c: bd f5 05  
            lsr                ; $d82f: 4a        
            adc ($1b),y        ; $d830: 71 1b     
            sta $0230          ; $d832: 8d 30 02  
            iny                ; $d835: c8        
            lda ($1b),y        ; $d836: b1 1b     
            adc $05f5,x        ; $d838: 7d f5 05  
            sta $0232          ; $d83b: 8d 32 02  
            iny                ; $d83e: c8        
            lda ($1b),y        ; $d83f: b1 1b     
            adc $05f5,x        ; $d841: 7d f5 05  
            sta $0231          ; $d844: 8d 31 02  
            iny                ; $d847: c8        
            jsr __d97a         ; $d848: 20 7a d9  
            lda $19            ; $d84b: a5 19     
            sta $0220          ; $d84d: 8d 20 02  
            lda $1a            ; $d850: a5 1a     
            sta $0221          ; $d852: 8d 21 02  
            ldx $25            ; $d855: a6 25     
            iny                ; $d857: c8        
            lda ($1b),y        ; $d858: b1 1b     
            adc $05f5,x        ; $d85a: 7d f5 05  
            sta $0234          ; $d85d: 8d 34 02  
            iny                ; $d860: c8        
            lda ($1b),y        ; $d861: b1 1b     
            adc $05f5,x        ; $d863: 7d f5 05  
            sta $0233          ; $d866: 8d 33 02  
            iny                ; $d869: c8        
            lda ($1b),y        ; $d86a: b1 1b     
            sta $0228          ; $d86c: 8d 28 02  
            iny                ; $d86f: c8        
            lda ($1b),y        ; $d870: b1 1b     
            sta $0222          ; $d872: 8d 22 02  
            iny                ; $d875: c8        
            jsr __d97a         ; $d876: 20 7a d9  
            lda $19            ; $d879: a5 19     
            sta $0224          ; $d87b: 8d 24 02  
            iny                ; $d87e: c8        
            jsr __d97a         ; $d87f: 20 7a d9  
            lda $19            ; $d882: a5 19     
            sta $0226          ; $d884: 8d 26 02  
            lda $1a            ; $d887: a5 1a     
            sta $0227          ; $d889: 8d 27 02  
            jsr __ea8a         ; $d88c: 20 8a ea  
            lda #$00           ; $d88f: a9 00     
            sta $18            ; $d891: 85 18     
            lda $02b1          ; $d893: ad b1 02  
            and #$78           ; $d896: 29 78     
            sec                ; $d898: 38        
            sbc #$18           ; $d899: e9 18     
            bcs __d8a1         ; $d89b: b0 04     
            sta $18            ; $d89d: 85 18     
            lda #$00           ; $d89f: a9 00     
__d8a1:     asl                ; $d8a1: 0a        
            asl                ; $d8a2: 0a        
            bcc __d8ab         ; $d8a3: 90 06     
            sta $18            ; $d8a5: 85 18     
            inc $28            ; $d8a7: e6 28     
            lda #$00           ; $d8a9: a9 00     
__d8ab:     sta $29            ; $d8ab: 85 29     
            sta $2a            ; $d8ad: 85 2a     
            sta $02c8          ; $d8af: 8d c8 02  
            lda $18            ; $d8b2: a5 18     
            bmi __d8bb         ; $d8b4: 30 05     
            clc                ; $d8b6: 18        
            adc #$80           ; $d8b7: 69 80     
            bne __d8bf         ; $d8b9: d0 04     

;-------------------------------------------------------------------------------
__d8bb:     asl                ; $d8bb: 0a        
            asl                ; $d8bc: 0a        
            and #$60           ; $d8bd: 29 60     

;-------------------------------------------------------------------------------
__d8bf:     sta $79            ; $d8bf: 85 79     
            lda #$00           ; $d8c1: a9 00     
            sta $18            ; $d8c3: 85 18     
            ldy $02b1          ; $d8c5: ac b1 02  
            lda $0400,y        ; $d8c8: b9 00 04  
            cmp #$80           ; $d8cb: c9 80     
            bcc __d8db         ; $d8cd: 90 0c     
            and #$a2           ; $d8cf: 29 a2     
            cmp #$a0           ; $d8d1: c9 a0     
            bne __d8df         ; $d8d3: d0 0a     
            lda #$10           ; $d8d5: a9 10     
            sta $18            ; $d8d7: 85 18     
            bne __d8df         ; $d8d9: d0 04     
__d8db:     lda #$08           ; $d8db: a9 08     
            sta $18            ; $d8dd: 85 18     
__d8df:     lda $02b1          ; $d8df: ad b1 02  
            ror                ; $d8e2: 6a        
            ror                ; $d8e3: 6a        
            ror                ; $d8e4: 6a        
            ror                ; $d8e5: 6a        
            and #$e0           ; $d8e6: 29 e0     
            clc                ; $d8e8: 18        
            adc $18            ; $d8e9: 65 18     
            sta $40            ; $d8eb: 85 40     
            sta $02cd          ; $d8ed: 8d cd 02  
            ldx #$01           ; $d8f0: a2 01     
__d8f2:     lda #$00           ; $d8f2: a9 00     
            sta $18            ; $d8f4: 85 18     
            sta $90,x          ; $d8f6: 95 90     
            lda $28            ; $d8f8: a5 28     
            and #$01           ; $d8fa: 29 01     
            beq __d900         ; $d8fc: f0 02     
            lda #$ff           ; $d8fe: a9 ff     
__d900:     sta $17            ; $d900: 85 17     
            lda $02b1,x        ; $d902: bd b1 02  
            and #$78           ; $d905: 29 78     
            clc                ; $d907: 18        
            adc #$08           ; $d908: 69 08     
            asl                ; $d90a: 0a        
            asl                ; $d90b: 0a        
            bcc __d910         ; $d90c: 90 02     
            inc $17            ; $d90e: e6 17     
__d910:     sec                ; $d910: 38        
            sbc $29            ; $d911: e5 29     
            sta $79,x          ; $d913: 95 79     
            beq __d927         ; $d915: f0 10     
            bcc __d921         ; $d917: 90 08     
            lda $17            ; $d919: a5 17     
            beq __d931         ; $d91b: f0 14     
            bpl __d92b         ; $d91d: 10 0c     
            bmi __d92f         ; $d91f: 30 0e     
__d921:     lda $17            ; $d921: a5 17     
            bne __d931         ; $d923: d0 0c     
            beq __d92f         ; $d925: f0 08     
__d927:     lda $17            ; $d927: a5 17     
            beq __d92f         ; $d929: f0 04     
__d92b:     inc $90,x          ; $d92b: f6 90     
            bne __d931         ; $d92d: d0 02     
__d92f:     dec $90,x          ; $d92f: d6 90     
__d931:     lda $02b1,x        ; $d931: bd b1 02  
            tay                ; $d934: a8        
            lda $0400,y        ; $d935: b9 00 04  
            cmp #$80           ; $d938: c9 80     
            bcc __d948         ; $d93a: 90 0c     
            and #$a2           ; $d93c: 29 a2     
            cmp #$a0           ; $d93e: c9 a0     
            bne __d94c         ; $d940: d0 0a     
            lda #$10           ; $d942: a9 10     
            sta $18            ; $d944: 85 18     
            bne __d94c         ; $d946: d0 04     
__d948:     lda #$08           ; $d948: a9 08     
            sta $18            ; $d94a: 85 18     
__d94c:     lda $02b1,x        ; $d94c: bd b1 02  
            ror                ; $d94f: 6a        
            ror                ; $d950: 6a        
            ror                ; $d951: 6a        
            ror                ; $d952: 6a        
            and #$e0           ; $d953: 29 e0     
            clc                ; $d955: 18        
            adc $18            ; $d956: 65 18     
            sta $40,x          ; $d958: 95 40     
            cpx $0229          ; $d95a: ec 29 02  
            beq __d962         ; $d95d: f0 03     
            inx                ; $d95f: e8        
            bne __d8f2         ; $d960: d0 90     
__d962:     lda #$3c           ; $d962: a9 3c     
            sta $022c          ; $d964: 8d 2c 02  
            lda #$00           ; $d967: a9 00     
            sta $0242          ; $d969: 8d 42 02  
            inc $02db          ; $d96c: ee db 02  
__d96f:     lda $2002          ; $d96f: ad 02 20  
            bpl __d96f         ; $d972: 10 fb     
            lda $28            ; $d974: a5 28     
            sta $2000          ; $d976: 8d 00 20  
            rts                ; $d979: 60        

;-------------------------------------------------------------------------------
__d97a:     lda ($1b),y        ; $d97a: b1 1b     
            sta $17            ; $d97c: 85 17     
            lda #$00           ; $d97e: a9 00     
            sta $19            ; $d980: 85 19     
            ldx #$08           ; $d982: a2 08     
__d984:     lsr $17            ; $d984: 46 17     
            bcc __d98b         ; $d986: 90 03     
            clc                ; $d988: 18        
            adc #$3c           ; $d989: 69 3c     
__d98b:     ror                ; $d98b: 6a        
            ror $19            ; $d98c: 66 19     
            dex                ; $d98e: ca        
            bne __d984         ; $d98f: d0 f3     
            sta $1a            ; $d991: 85 1a     
            rts                ; $d993: 60        

;-------------------------------------------------------------------------------
__d994:     .hex 80 20 40 10   ; $d994: 80 20 40 10   Data

;-------------------------------------------------------------------------------
__d998:     ldx $0229          ; $d998: ae 29 02  
__d99b:     stx $0241          ; $d99b: 8e 41 02  
            lda $02df,x        ; $d99e: bd df 02  
            and #$0f           ; $d9a1: 29 0f     
            sta $02df,x        ; $d9a3: 9d df 02  
            lda #$00           ; $d9a6: a9 00     
            sta $fc            ; $d9a8: 85 fc     
            sta $fd            ; $d9aa: 85 fd     
            lda $79,x          ; $d9ac: b5 79     
            adc #$20           ; $d9ae: 69 20     
            sta $fe            ; $d9b0: 85 fe     
            sta $ff            ; $d9b2: 85 ff     
            lda $79,x          ; $d9b4: b5 79     
            sta $17            ; $d9b6: 85 17     
            lda $2a            ; $d9b8: a5 2a     
            sec                ; $d9ba: 38        
            sbc $29            ; $d9bb: e5 29     
            beq __d9d4         ; $d9bd: f0 15     
            bpl __d9cc         ; $d9bf: 10 0b     
            clc                ; $d9c1: 18        
            adc $79,x          ; $d9c2: 75 79     
            sta $79,x          ; $d9c4: 95 79     
            jsr __c721         ; $d9c6: 20 21 c7  
            jmp __d9d4         ; $d9c9: 4c d4 d9  

;-------------------------------------------------------------------------------
__d9cc:     clc                ; $d9cc: 18        
            adc $79,x          ; $d9cd: 75 79     
            sta $79,x          ; $d9cf: 95 79     
            jsr __c704         ; $d9d1: 20 04 c7  
__d9d4:     lda $f9            ; $d9d4: a5 f9     
            bne __da24         ; $d9d6: d0 4c     
            jsr __cfbc         ; $d9d8: 20 bc cf  
            lda $0244,x        ; $d9db: bd 44 02  
            beq __da0f         ; $d9de: f0 2f     
            cmp #$01           ; $d9e0: c9 01     
            beq __da24         ; $d9e2: f0 40     
            cmp #$18           ; $d9e4: c9 18     
            beq __da01         ; $d9e6: f0 19     
            bcc __da24         ; $d9e8: 90 3a     
            lda #$00           ; $d9ea: a9 00     
            sta $02df,x        ; $d9ec: 9d df 02  
            sta $02e9,x        ; $d9ef: 9d e9 02  
            cpx $02dd          ; $d9f2: ec dd 02  
            bne __da24         ; $d9f5: d0 2d     
            sta $02dd          ; $d9f7: 8d dd 02  
            lda #$02           ; $d9fa: a9 02     
            sta $0227          ; $d9fc: 8d 27 02  
            bne __da24         ; $d9ff: d0 23     
__da01:     lda $40,x          ; $da01: b5 40     
            clc                ; $da03: 18        
            adc #$15           ; $da04: 69 15     
            sta $40,x          ; $da06: 95 40     
            lda #$01           ; $da08: a9 01     
            sta $061b          ; $da0a: 8d 1b 06  
            bne __da24         ; $da0d: d0 15     
__da0f:     jsr __d074         ; $da0f: 20 74 d0  
            lda $0291          ; $da12: ad 91 02  
            ora $022c          ; $da15: 0d 2c 02  
            bne __da24         ; $da18: d0 0a     
            lda $029b,x        ; $da1a: bd 9b 02  
            beq __da27         ; $da1d: f0 08     
            lda #$00           ; $da1f: a9 00     
            sta $02e9,x        ; $da21: 9d e9 02  
__da24:     jmp __db71         ; $da24: 4c 71 db  

;-------------------------------------------------------------------------------
__da27:     lda $02e9,x        ; $da27: bd e9 02  
            bne __da24         ; $da2a: d0 f8     
            ldy #$00           ; $da2c: a0 00     
            lda $02df,x        ; $da2e: bd df 02  
            bne __da3c         ; $da31: d0 09     
            cpx $022a          ; $da33: ec 2a 02  
            beq __da3e         ; $da36: f0 06     
            bcc __da3e         ; $da38: 90 04     
            bcs __da3d         ; $da3a: b0 01     
__da3c:     iny                ; $da3c: c8        
__da3d:     iny                ; $da3d: c8        
__da3e:     lda $023c,y        ; $da3e: b9 3c 02  
            beq __da24         ; $da41: f0 e1     
            cpx $02dd          ; $da43: ec dd 02  
            beq __da24         ; $da46: f0 dc     
            lda $40,x          ; $da48: b5 40     
            and #$0f           ; $da4a: 29 0f     
            beq __da51         ; $da4c: f0 03     
__da4e:     jmp __db67         ; $da4e: 4c 67 db  

;-------------------------------------------------------------------------------
__da51:     lda $29            ; $da51: a5 29     
            clc                ; $da53: 18        
            adc $79,x          ; $da54: 75 79     
            and #$0f           ; $da56: 29 0f     
            beq __da5d         ; $da58: f0 03     
__da5a:     jmp __db5b         ; $da5a: 4c 5b db  

;-------------------------------------------------------------------------------
__da5d:     lda $02df,x        ; $da5d: bd df 02  
            beq __da6d         ; $da60: f0 0b     
            dec $02df,x        ; $da62: de df 02  
            beq __da6d         ; $da65: f0 06     
            jsr __c05f         ; $da67: 20 5f c0  
            jmp __da72         ; $da6a: 4c 72 da  

;-------------------------------------------------------------------------------
__da6d:     lda $05f8          ; $da6d: ad f8 05  
            beq __da7f         ; $da70: f0 0d     
__da72:     lda #$00           ; $da72: a9 00     
            sta $05f8          ; $da74: 8d f8 05  
            lda $86,x          ; $da77: b5 86     
            cmp #$02           ; $da79: c9 02     
            bcs __da5a         ; $da7b: b0 dd     
            bcc __da4e         ; $da7d: 90 cf     
__da7f:     ldy $0229          ; $da7f: ac 29 02  
__da82:     sty $18            ; $da82: 84 18     
            cpx $18            ; $da84: e4 18     
            beq __dab1         ; $da86: f0 29     
            bcc __dab1         ; $da88: 90 27     
            lda $0244,y        ; $da8a: b9 44 02  
            ora $029b,y        ; $da8d: 19 9b 02  
            bne __dab1         ; $da90: d0 1f     
            cpy $02dd          ; $da92: cc dd 02  
            beq __dab1         ; $da95: f0 1a     
            cpy $022a          ; $da97: cc 2a 02  
            beq __da9e         ; $da9a: f0 02     
            bcs __daa3         ; $da9c: b0 05     
__da9e:     lda $02e9,y        ; $da9e: b9 e9 02  
            bne __dab1         ; $daa1: d0 0e     
__daa3:     lda $40,x          ; $daa3: b5 40     
            cmp $0040,y        ; $daa5: d9 40 00  
            bne __dab1         ; $daa8: d0 07     
            lda $79,x          ; $daaa: b5 79     
            cmp $0079,y        ; $daac: d9 79 00  
            beq __dac1         ; $daaf: f0 10     
__dab1:     dey                ; $dab1: 88        
            bne __da82         ; $dab2: d0 ce     
            jsr __c05f         ; $dab4: 20 5f c0  
            lda $02dd          ; $dab7: ad dd 02  
            beq __dac4         ; $daba: f0 08     
            cpx $02dd          ; $dabc: ec dd 02  
            bne __daea         ; $dabf: d0 29     
__dac1:     jmp __db71         ; $dac1: 4c 71 db  

;-------------------------------------------------------------------------------
__dac4:     lda $0226          ; $dac4: ad 26 02  
            ora $0227          ; $dac7: 0d 27 02  
            bne __daea         ; $daca: d0 1e     
            ldy $86,x          ; $dacc: b4 86     
            lda $02df,x        ; $dace: bd df 02  
            and __d994,y       ; $dad1: 39 94 d9  
            beq __daea         ; $dad4: f0 14     
            lda $79,x          ; $dad6: b5 79     
            clc                ; $dad8: 18        
            adc $29            ; $dad9: 65 29     
            and #$10           ; $dadb: 29 10     
            bne __daea         ; $dadd: d0 0b     
            stx $02dd          ; $dadf: 8e dd 02  
            lda #$70           ; $dae2: a9 70     
            sta $02de          ; $dae4: 8d de 02  
            jmp __db71         ; $dae7: 4c 71 db  

;-------------------------------------------------------------------------------
__daea:     ldy #$03           ; $daea: a0 03     
            lda $04f2          ; $daec: ad f2 04  
            and #$04           ; $daef: 29 04     
            beq __dafc         ; $daf1: f0 09     
            cpx $022a          ; $daf3: ec 2a 02  
            beq __db03         ; $daf6: f0 0b     
            bcc __db03         ; $daf8: 90 09     
            bcs __db17         ; $dafa: b0 1b     
__dafc:     cpx $022a          ; $dafc: ec 2a 02  
            beq __db17         ; $daff: f0 16     
            bcc __db17         ; $db01: 90 14     
__db03:     dey                ; $db03: 88        
            beq __db18         ; $db04: f0 12     
            lda $90,x          ; $db06: b5 90     
            bmi __db14         ; $db08: 30 0a     
            bne __db7b         ; $db0a: d0 6f     
            lda $79,x          ; $db0c: b5 79     
            cmp $79            ; $db0e: c5 79     
            beq __db17         ; $db10: f0 05     
            bcs __db7b         ; $db12: b0 67     
__db14:     jmp __dd07         ; $db14: 4c 07 dd  

;-------------------------------------------------------------------------------
__db17:     dey                ; $db17: 88        
__db18:     lda $0228          ; $db18: ad 28 02  
            cmp $022f          ; $db1b: cd 2f 02  
            bcs __db2f         ; $db1e: b0 0f     
            lda $0221          ; $db20: ad 21 02  
            bne __db2a         ; $db23: d0 05     
            lda $0220          ; $db25: ad 20 02  
            beq __db2f         ; $db28: f0 05     
__db2a:     lda $0225          ; $db2a: ad 25 02  
            bne __db4f         ; $db2d: d0 20     
__db2f:     lda #$00           ; $db2f: a9 00     
            sta $17            ; $db31: 85 17     
            lda $40,x          ; $db33: b5 40     
            sec                ; $db35: 38        
            sbc $40            ; $db36: e5 40     
            bcs __db41         ; $db38: b0 07     
            sta $17            ; $db3a: 85 17     
            lda #$00           ; $db3c: a9 00     
            sec                ; $db3e: 38        
            sbc $17            ; $db3f: e5 17     
__db41:     cmp #$11           ; $db41: c9 11     
            bcs __db49         ; $db43: b0 04     
            cpy #$00           ; $db45: c0 00     
            bne __db03         ; $db47: d0 ba     
__db49:     lda $17            ; $db49: a5 17     
            bne __db58         ; $db4b: d0 0b     
            beq __db55         ; $db4d: f0 06     
__db4f:     lda $40,x          ; $db4f: b5 40     
            cmp $40            ; $db51: c5 40     
            bcs __db58         ; $db53: b0 03     
__db55:     jmp __de90         ; $db55: 4c 90 de  

;-------------------------------------------------------------------------------
__db58:     jmp __df78         ; $db58: 4c 78 df  

;-------------------------------------------------------------------------------
__db5b:     lda $86,x          ; $db5b: b5 86     
            cmp #$02           ; $db5d: c9 02     
            bne __db64         ; $db5f: d0 03     
            jmp __e0d0         ; $db61: 4c d0 e0  

;-------------------------------------------------------------------------------
__db64:     jmp __e112         ; $db64: 4c 12 e1  

;-------------------------------------------------------------------------------
__db67:     lda $86,x          ; $db67: b5 86     
            bne __db6e         ; $db69: d0 03     
            jmp __e05c         ; $db6b: 4c 5c e0  

;-------------------------------------------------------------------------------
__db6e:     jmp __e096         ; $db6e: 4c 96 e0  

;-------------------------------------------------------------------------------
__db71:     dex                ; $db71: ca        
            beq __db7a         ; $db72: f0 06     
            inc $022b          ; $db74: ee 2b 02  
            jmp __d99b         ; $db77: 4c 9b d9  

;-------------------------------------------------------------------------------
__db7a:     rts                ; $db7a: 60        

;-------------------------------------------------------------------------------
__db7b:     lda $86,x          ; $db7b: b5 86     
            beq __dbe5         ; $db7d: f0 66     
            cmp #$02           ; $db7f: c9 02     
            beq __db8b         ; $db81: f0 08     
            bcc __db88         ; $db83: 90 03     
            jmp __dc84         ; $db85: 4c 84 dc  

;-------------------------------------------------------------------------------
__db88:     jmp __dc30         ; $db88: 4c 30 dc  

;-------------------------------------------------------------------------------
__db8b:     ldy $40,x          ; $db8b: b4 40     
            cpy $40            ; $db8d: c4 40     
            beq __dbb5         ; $db8f: f0 24     
            bcc __dbb5         ; $db91: 90 22     
            lda $02df,x        ; $db93: bd df 02  
            and #$20           ; $db96: 29 20     
            bne __dbaf         ; $db98: d0 15     
            cpy $fc            ; $db9a: c4 fc     
            bne __dbdc         ; $db9c: d0 3e     
            lda $022b          ; $db9e: ad 2b 02  
            and #$07           ; $dba1: 29 07     
            bne __dbaf         ; $dba3: d0 0a     
            lda #$01           ; $dba5: a9 01     
            sta $02df,x        ; $dba7: 9d df 02  
            sta $023e          ; $dbaa: 8d 3e 02  
            bne __dbdc         ; $dbad: d0 2d     
__dbaf:     cpy $fd            ; $dbaf: c4 fd     
            bne __dbdf         ; $dbb1: d0 2c     
            beq __dbd3         ; $dbb3: f0 1e     
__dbb5:     lda $02df,x        ; $dbb5: bd df 02  
            bmi __dbcf         ; $dbb8: 30 15     
            cpy $fd            ; $dbba: c4 fd     
            bne __dbdf         ; $dbbc: d0 21     
            lda $022b          ; $dbbe: ad 2b 02  
            and #$07           ; $dbc1: 29 07     
            bne __dbcf         ; $dbc3: d0 0a     
            lda #$01           ; $dbc5: a9 01     
            sta $02df,x        ; $dbc7: 9d df 02  
            sta $023e          ; $dbca: 8d 3e 02  
            bne __dbdf         ; $dbcd: d0 10     
__dbcf:     cpy $fc            ; $dbcf: c4 fc     
            bne __dbdc         ; $dbd1: d0 09     
__dbd3:     lda $79,x          ; $dbd3: b5 79     
            cmp $ff            ; $dbd5: c5 ff     
            bne __dbe2         ; $dbd7: d0 09     
__dbd9:     jmp __e112         ; $dbd9: 4c 12 e1  

;-------------------------------------------------------------------------------
__dbdc:     jmp __e096         ; $dbdc: 4c 96 e0  

;-------------------------------------------------------------------------------
__dbdf:     jmp __e05c         ; $dbdf: 4c 5c e0  

;-------------------------------------------------------------------------------
__dbe2:     jmp __e0d0         ; $dbe2: 4c d0 e0  

;-------------------------------------------------------------------------------
__dbe5:     lda $02df,x        ; $dbe5: bd df 02  
            and #$10           ; $dbe8: 29 10     
            bne __dc21         ; $dbea: d0 35     
            lda $79,x          ; $dbec: b5 79     
            cmp $fe            ; $dbee: c5 fe     
            bne __dbd9         ; $dbf0: d0 e7     
            lda $79,x          ; $dbf2: b5 79     
            sec                ; $dbf4: 38        
            sbc $79            ; $dbf5: e5 79     
            cmp #$11           ; $dbf7: c9 11     
            bcs __dc0d         ; $dbf9: b0 12     
            lda $40,x          ; $dbfb: b5 40     
            sec                ; $dbfd: 38        
            sbc $40            ; $dbfe: e5 40     
            bcs __dc09         ; $dc00: b0 07     
            sta $17            ; $dc02: 85 17     
            lda #$00           ; $dc04: a9 00     
            sec                ; $dc06: 38        
            sbc $17            ; $dc07: e5 17     
__dc09:     cmp #$10           ; $dc09: c9 10     
            bcc __dc14         ; $dc0b: 90 07     
__dc0d:     lda $022b          ; $dc0d: ad 2b 02  
            and #$07           ; $dc10: 29 07     
            bne __dc21         ; $dc12: d0 0d     
__dc14:     lda #$02           ; $dc14: a9 02     
            sta $02df,x        ; $dc16: 9d df 02  
            lda #$01           ; $dc19: a9 01     
            sta $023e          ; $dc1b: 8d 3e 02  
            jmp __e112         ; $dc1e: 4c 12 e1  

;-------------------------------------------------------------------------------
__dc21:     ldy $40,x          ; $dc21: b4 40     
            cpy $fd            ; $dc23: c4 fd     
            bne __dc78         ; $dc25: d0 51     
            lda $79,x          ; $dc27: b5 79     
            cmp $ff            ; $dc29: c5 ff     
            bne __dc81         ; $dc2b: d0 54     
            jmp __e096         ; $dc2d: 4c 96 e0  

;-------------------------------------------------------------------------------
__dc30:     lda $02df,x        ; $dc30: bd df 02  
            and #$10           ; $dc33: 29 10     
            bne __dc6c         ; $dc35: d0 35     
            lda $79,x          ; $dc37: b5 79     
            cmp $fe            ; $dc39: c5 fe     
            bne __dc7b         ; $dc3b: d0 3e     
            lda $79,x          ; $dc3d: b5 79     
            sec                ; $dc3f: 38        
            sbc $79            ; $dc40: e5 79     
            cmp #$11           ; $dc42: c9 11     
            bcs __dc58         ; $dc44: b0 12     
            lda $40,x          ; $dc46: b5 40     
            sec                ; $dc48: 38        
            sbc $40            ; $dc49: e5 40     
            bcs __dc54         ; $dc4b: b0 07     
            sta $17            ; $dc4d: 85 17     
            lda #$00           ; $dc4f: a9 00     
            sec                ; $dc51: 38        
            sbc $17            ; $dc52: e5 17     
__dc54:     cmp #$10           ; $dc54: c9 10     
            bcc __dc5f         ; $dc56: 90 07     
__dc58:     lda $022b          ; $dc58: ad 2b 02  
            and #$07           ; $dc5b: 29 07     
            bne __dc6c         ; $dc5d: d0 0d     
__dc5f:     lda #$02           ; $dc5f: a9 02     
            sta $02df,x        ; $dc61: 9d df 02  
            lda #$01           ; $dc64: a9 01     
            sta $023e          ; $dc66: 8d 3e 02  
            jmp __e112         ; $dc69: 4c 12 e1  

;-------------------------------------------------------------------------------
__dc6c:     ldy $40,x          ; $dc6c: b4 40     
            cpy $fc            ; $dc6e: c4 fc     
            bne __dc7e         ; $dc70: d0 0c     
            lda $79,x          ; $dc72: b5 79     
            cmp $ff            ; $dc74: c5 ff     
            bne __dc81         ; $dc76: d0 09     
__dc78:     jmp __e05c         ; $dc78: 4c 5c e0  

;-------------------------------------------------------------------------------
__dc7b:     jmp __e112         ; $dc7b: 4c 12 e1  

;-------------------------------------------------------------------------------
__dc7e:     jmp __e096         ; $dc7e: 4c 96 e0  

;-------------------------------------------------------------------------------
__dc81:     jmp __e0d0         ; $dc81: 4c d0 e0  

;-------------------------------------------------------------------------------
__dc84:     cpx $022a          ; $dc84: ec 2a 02  
            beq __dc8b         ; $dc87: f0 02     
            bpl __dcc1         ; $dc89: 10 36     
__dc8b:     lda $90,x          ; $dc8b: b5 90     
            ora $0225          ; $dc8d: 0d 25 02  
            bne __dcc1         ; $dc90: d0 2f     
            lda $40,x          ; $dc92: b5 40     
            sec                ; $dc94: 38        
            sbc $40            ; $dc95: e5 40     
            bcs __dca0         ; $dc97: b0 07     
            sta $17            ; $dc99: 85 17     
            lda #$00           ; $dc9b: a9 00     
            sec                ; $dc9d: 38        
            sbc $17            ; $dc9e: e5 17     
__dca0:     cmp #$10           ; $dca0: c9 10     
            bcs __dcc1         ; $dca2: b0 1d     
            ldy #$00           ; $dca4: a0 00     
__dca6:     iny                ; $dca6: c8        
            sty $17            ; $dca7: 84 17     
            cpx $17            ; $dca9: e4 17     
            beq __dcb4         ; $dcab: f0 07     
            lda $0040,y        ; $dcad: b9 40 00  
            cmp $40,x          ; $dcb0: d5 40     
            beq __dcc1         ; $dcb2: f0 0d     
__dcb4:     cpy $022a          ; $dcb4: cc 2a 02  
            bne __dca6         ; $dcb7: d0 ed     
            lda #$50           ; $dcb9: a9 50     
            sta $02e9,x        ; $dcbb: 9d e9 02  
            jmp __db71         ; $dcbe: 4c 71 db  

;-------------------------------------------------------------------------------
__dcc1:     lda $02df,x        ; $dcc1: bd df 02  
            and #$10           ; $dcc4: 29 10     
            bne __dce2         ; $dcc6: d0 1a     
            lda $79,x          ; $dcc8: b5 79     
            cmp $fe            ; $dcca: c5 fe     
            bne __dc7b         ; $dccc: d0 ad     
            lda $022b          ; $dcce: ad 2b 02  
            and #$07           ; $dcd1: 29 07     
            bne __dce2         ; $dcd3: d0 0d     
            lda #$02           ; $dcd5: a9 02     
            sta $02df,x        ; $dcd7: 9d df 02  
            lda #$01           ; $dcda: a9 01     
            sta $023e          ; $dcdc: 8d 3e 02  
            jmp __e112         ; $dcdf: 4c 12 e1  

;-------------------------------------------------------------------------------
__dce2:     lda $40,x          ; $dce2: b5 40     
            cmp $40            ; $dce4: c5 40     
            bcs __dcf3         ; $dce6: b0 0b     
            cmp $fd            ; $dce8: c5 fd     
            bne __dd04         ; $dcea: d0 18     
            cmp $fc            ; $dcec: c5 fc     
            bne __dcfe         ; $dcee: d0 0e     
            jmp __e0d0         ; $dcf0: 4c d0 e0  

;-------------------------------------------------------------------------------
__dcf3:     cmp $fc            ; $dcf3: c5 fc     
            bne __dcfe         ; $dcf5: d0 07     
            cmp $fd            ; $dcf7: c5 fd     
            beq __dd01         ; $dcf9: f0 06     
            jmp __e05c         ; $dcfb: 4c 5c e0  

;-------------------------------------------------------------------------------
__dcfe:     jmp __e096         ; $dcfe: 4c 96 e0  

;-------------------------------------------------------------------------------
__dd01:     jmp __e0d0         ; $dd01: 4c d0 e0  

;-------------------------------------------------------------------------------
__dd04:     jmp __e05c         ; $dd04: 4c 5c e0  

;-------------------------------------------------------------------------------
__dd07:     lda $86,x          ; $dd07: b5 86     
            beq __dd6f         ; $dd09: f0 64     
            cmp #$02           ; $dd0b: c9 02     
            beq __dd14         ; $dd0d: f0 05     
            bcs __dd17         ; $dd0f: b0 06     
            jmp __ddba         ; $dd11: 4c ba dd  

;-------------------------------------------------------------------------------
__dd14:     jmp __de0e         ; $dd14: 4c 0e de  

;-------------------------------------------------------------------------------
__dd17:     ldy $40,x          ; $dd17: b4 40     
            cpy $40            ; $dd19: c4 40     
            bcs __dd3d         ; $dd1b: b0 20     
            lda $02df,x        ; $dd1d: bd df 02  
            bmi __dd37         ; $dd20: 30 15     
            cpy $fd            ; $dd22: c4 fd     
            bne __dd69         ; $dd24: d0 43     
            lda $022b          ; $dd26: ad 2b 02  
            and #$07           ; $dd29: 29 07     
            bne __dd37         ; $dd2b: d0 0a     
            lda #$01           ; $dd2d: a9 01     
            sta $02df,x        ; $dd2f: 9d df 02  
            sta $023e          ; $dd32: 8d 3e 02  
            bne __dd69         ; $dd35: d0 32     
__dd37:     cpy $fc            ; $dd37: c4 fc     
            bne __dd66         ; $dd39: d0 2b     
            beq __dd5d         ; $dd3b: f0 20     
__dd3d:     lda $02df,x        ; $dd3d: bd df 02  
            and #$20           ; $dd40: 29 20     
            bne __dd59         ; $dd42: d0 15     
            cpy $fc            ; $dd44: c4 fc     
            bne __dd66         ; $dd46: d0 1e     
            lda $022b          ; $dd48: ad 2b 02  
            and #$07           ; $dd4b: 29 07     
            bne __dd59         ; $dd4d: d0 0a     
            lda #$01           ; $dd4f: a9 01     
            sta $02df,x        ; $dd51: 9d df 02  
            sta $023e          ; $dd54: 8d 3e 02  
            bne __dd66         ; $dd57: d0 0d     
__dd59:     cpy $fd            ; $dd59: c4 fd     
            bne __dd69         ; $dd5b: d0 0c     
__dd5d:     lda $79,x          ; $dd5d: b5 79     
            cmp $fe            ; $dd5f: c5 fe     
            bne __dd6c         ; $dd61: d0 09     
__dd63:     jmp __e0d0         ; $dd63: 4c d0 e0  

;-------------------------------------------------------------------------------
__dd66:     jmp __e096         ; $dd66: 4c 96 e0  

;-------------------------------------------------------------------------------
__dd69:     jmp __e05c         ; $dd69: 4c 5c e0  

;-------------------------------------------------------------------------------
__dd6c:     jmp __e112         ; $dd6c: 4c 12 e1  

;-------------------------------------------------------------------------------
__dd6f:     lda $02df,x        ; $dd6f: bd df 02  
            and #$40           ; $dd72: 29 40     
            bne __ddab         ; $dd74: d0 35     
            lda $79,x          ; $dd76: b5 79     
            cmp $ff            ; $dd78: c5 ff     
            bne __dd63         ; $dd7a: d0 e7     
            lda $79            ; $dd7c: a5 79     
            sec                ; $dd7e: 38        
            sbc $79,x          ; $dd7f: f5 79     
            cmp #$11           ; $dd81: c9 11     
            bcs __dd97         ; $dd83: b0 12     
            lda $40,x          ; $dd85: b5 40     
            sec                ; $dd87: 38        
            sbc $40            ; $dd88: e5 40     
            bcs __dd93         ; $dd8a: b0 07     
            sta $17            ; $dd8c: 85 17     
            lda #$00           ; $dd8e: a9 00     
            sec                ; $dd90: 38        
            sbc $17            ; $dd91: e5 17     
__dd93:     cmp #$10           ; $dd93: c9 10     
            bcc __dd9e         ; $dd95: 90 07     
__dd97:     lda $022b          ; $dd97: ad 2b 02  
            and #$07           ; $dd9a: 29 07     
            bne __ddab         ; $dd9c: d0 0d     
__dd9e:     lda #$02           ; $dd9e: a9 02     
            sta $02df,x        ; $dda0: 9d df 02  
            lda #$01           ; $dda3: a9 01     
            sta $023e          ; $dda5: 8d 3e 02  
            jmp __e0d0         ; $dda8: 4c d0 e0  

;-------------------------------------------------------------------------------
__ddab:     ldy $40,x          ; $ddab: b4 40     
            cpy $fd            ; $ddad: c4 fd     
            bne __de0b         ; $ddaf: d0 5a     
            lda $79,x          ; $ddb1: b5 79     
            cmp $fe            ; $ddb3: c5 fe     
            bne __de02         ; $ddb5: d0 4b     
            jmp __e096         ; $ddb7: 4c 96 e0  

;-------------------------------------------------------------------------------
__ddba:     lda $02df,x        ; $ddba: bd df 02  
            and #$40           ; $ddbd: 29 40     
            bne __ddf6         ; $ddbf: d0 35     
            lda $79,x          ; $ddc1: b5 79     
            cmp $ff            ; $ddc3: c5 ff     
            bne __de05         ; $ddc5: d0 3e     
            lda $79            ; $ddc7: a5 79     
            sec                ; $ddc9: 38        
            sbc $79,x          ; $ddca: f5 79     
            cmp #$11           ; $ddcc: c9 11     
            bcs __dde2         ; $ddce: b0 12     
            lda $40,x          ; $ddd0: b5 40     
            sec                ; $ddd2: 38        
            sbc $40            ; $ddd3: e5 40     
            bcs __ddde         ; $ddd5: b0 07     
            sta $17            ; $ddd7: 85 17     
            lda #$00           ; $ddd9: a9 00     
            sec                ; $dddb: 38        
            sbc $17            ; $dddc: e5 17     
__ddde:     cmp #$10           ; $ddde: c9 10     
            bcc __dde9         ; $dde0: 90 07     
__dde2:     lda $022b          ; $dde2: ad 2b 02  
            and #$07           ; $dde5: 29 07     
            bne __ddf6         ; $dde7: d0 0d     
__dde9:     lda #$02           ; $dde9: a9 02     
            sta $02df,x        ; $ddeb: 9d df 02  
            lda #$01           ; $ddee: a9 01     
            sta $023e          ; $ddf0: 8d 3e 02  
            jmp __e0d0         ; $ddf3: 4c d0 e0  

;-------------------------------------------------------------------------------
__ddf6:     ldy $40,x          ; $ddf6: b4 40     
            cpy $fc            ; $ddf8: c4 fc     
            bne __de08         ; $ddfa: d0 0c     
            lda $79,x          ; $ddfc: b5 79     
            cmp $fe            ; $ddfe: c5 fe     
            beq __de0b         ; $de00: f0 09     
__de02:     jmp __e112         ; $de02: 4c 12 e1  

;-------------------------------------------------------------------------------
__de05:     jmp __e0d0         ; $de05: 4c d0 e0  

;-------------------------------------------------------------------------------
__de08:     jmp __e096         ; $de08: 4c 96 e0  

;-------------------------------------------------------------------------------
__de0b:     jmp __e05c         ; $de0b: 4c 5c e0  

;-------------------------------------------------------------------------------
__de0e:     cpx $022a          ; $de0e: ec 2a 02  
            beq __de15         ; $de11: f0 02     
            bpl __de4b         ; $de13: 10 36     
__de15:     lda $90,x          ; $de15: b5 90     
            ora $0225          ; $de17: 0d 25 02  
            bne __de4b         ; $de1a: d0 2f     
            lda $40,x          ; $de1c: b5 40     
            sec                ; $de1e: 38        
            sbc $40            ; $de1f: e5 40     
            bcs __de2a         ; $de21: b0 07     
            sta $17            ; $de23: 85 17     
            lda #$00           ; $de25: a9 00     
            sec                ; $de27: 38        
            sbc $17            ; $de28: e5 17     
__de2a:     cmp #$10           ; $de2a: c9 10     
            bcs __de4b         ; $de2c: b0 1d     
            ldy #$00           ; $de2e: a0 00     
__de30:     iny                ; $de30: c8        
            sty $17            ; $de31: 84 17     
            cpx $17            ; $de33: e4 17     
            beq __de3e         ; $de35: f0 07     
            lda $40,x          ; $de37: b5 40     
            cmp $0040,y        ; $de39: d9 40 00  
            beq __de4b         ; $de3c: f0 0d     
__de3e:     cpy $022a          ; $de3e: cc 2a 02  
            bne __de30         ; $de41: d0 ed     
            lda #$50           ; $de43: a9 50     
            sta $02e9,x        ; $de45: 9d e9 02  
            jmp __db71         ; $de48: 4c 71 db  

;-------------------------------------------------------------------------------
__de4b:     lda $02df,x        ; $de4b: bd df 02  
            and #$40           ; $de4e: 29 40     
            bne __de6c         ; $de50: d0 1a     
            lda $79,x          ; $de52: b5 79     
            cmp $ff            ; $de54: c5 ff     
            bne __de05         ; $de56: d0 ad     
            lda $022b          ; $de58: ad 2b 02  
            and #$07           ; $de5b: 29 07     
            bne __de6c         ; $de5d: d0 0d     
            lda #$02           ; $de5f: a9 02     
            sta $02df,x        ; $de61: 9d df 02  
            lda #$01           ; $de64: a9 01     
            sta $023e          ; $de66: 8d 3e 02  
            jmp __e0d0         ; $de69: 4c d0 e0  

;-------------------------------------------------------------------------------
__de6c:     lda $40,x          ; $de6c: b5 40     
            cmp $40            ; $de6e: c5 40     
            beq __de7f         ; $de70: f0 0d     
            bcc __de7f         ; $de72: 90 0b     
            cmp $fc            ; $de74: c5 fc     
            bne __de8d         ; $de76: d0 15     
            cmp $fd            ; $de78: c5 fd     
            bne __de8a         ; $de7a: d0 0e     
            jmp __e112         ; $de7c: 4c 12 e1  

;-------------------------------------------------------------------------------
__de7f:     cmp $fd            ; $de7f: c5 fd     
            bne __de8a         ; $de81: d0 07     
            cmp $fc            ; $de83: c5 fc     
            bne __de8d         ; $de85: d0 06     
            jmp __e112         ; $de87: 4c 12 e1  

;-------------------------------------------------------------------------------
__de8a:     jmp __e05c         ; $de8a: 4c 5c e0  

;-------------------------------------------------------------------------------
__de8d:     jmp __e096         ; $de8d: 4c 96 e0  

;-------------------------------------------------------------------------------
__de90:     lda $86,x          ; $de90: b5 86     
            beq __de9d         ; $de92: f0 09     
            cmp #$02           ; $de94: c9 02     
            beq __def8         ; $de96: f0 60     
            bcs __deca         ; $de98: b0 30     
            jmp __df2f         ; $de9a: 4c 2f df  

;-------------------------------------------------------------------------------
__de9d:     lda $90,x          ; $de9d: b5 90     
            beq __dea5         ; $de9f: f0 04     
            bmi __deab         ; $dea1: 30 08     
            bpl __deb7         ; $dea3: 10 12     
__dea5:     lda $79,x          ; $dea5: b5 79     
            cmp $79            ; $dea7: c5 79     
            bcs __deb7         ; $dea9: b0 0c     
__deab:     lda $79,x          ; $deab: b5 79     
            cmp $ff            ; $dead: c5 ff     
            bne __df2c         ; $deaf: d0 7b     
            cmp $fe            ; $deb1: c5 fe     
            bne __df23         ; $deb3: d0 6e     
            beq __dec1         ; $deb5: f0 0a     
__deb7:     lda $79,x          ; $deb7: b5 79     
            cmp $fe            ; $deb9: c5 fe     
            bne __df23         ; $debb: d0 66     
            cmp $ff            ; $debd: c5 ff     
            bne __df2c         ; $debf: d0 6b     
__dec1:     lda $40,x          ; $dec1: b5 40     
            cmp $fd            ; $dec3: c5 fd     
            bne __df29         ; $dec5: d0 62     
            jmp __e096         ; $dec7: 4c 96 e0  

;-------------------------------------------------------------------------------
__deca:     lda $02df,x        ; $deca: bd df 02  
            and #$20           ; $decd: 29 20     
            bne __dee9         ; $decf: d0 18     
            lda $40,x          ; $ded1: b5 40     
            cmp $fc            ; $ded3: c5 fc     
            bne __df26         ; $ded5: d0 4f     
            lda $022b          ; $ded7: ad 2b 02  
            and #$07           ; $deda: 29 07     
            bne __dee9         ; $dedc: d0 0b     
            lda #$01           ; $dede: a9 01     
            sta $02df,x        ; $dee0: 9d df 02  
            sta $023e          ; $dee3: 8d 3e 02  
            jmp __e096         ; $dee6: 4c 96 e0  

;-------------------------------------------------------------------------------
__dee9:     ldy $79,x          ; $dee9: b4 79     
            cpy $fe            ; $deeb: c4 fe     
            bne __df23         ; $deed: d0 34     
            lda $40,x          ; $deef: b5 40     
            cmp $fd            ; $def1: c5 fd     
            bne __df29         ; $def3: d0 34     
            jmp __e0d0         ; $def5: 4c d0 e0  

;-------------------------------------------------------------------------------
__def8:     lda $02df,x        ; $def8: bd df 02  
            and #$20           ; $defb: 29 20     
            bne __df17         ; $defd: d0 18     
            lda $40,x          ; $deff: b5 40     
            cmp $fc            ; $df01: c5 fc     
            bne __df26         ; $df03: d0 21     
            lda $022b          ; $df05: ad 2b 02  
            and #$07           ; $df08: 29 07     
            bne __df17         ; $df0a: d0 0b     
            lda #$01           ; $df0c: a9 01     
            sta $02df,x        ; $df0e: 9d df 02  
            sta $023e          ; $df11: 8d 3e 02  
            jmp __e096         ; $df14: 4c 96 e0  

;-------------------------------------------------------------------------------
__df17:     ldy $79,x          ; $df17: b4 79     
            cpy $ff            ; $df19: c4 ff     
            bne __df2c         ; $df1b: d0 0f     
            lda $40,x          ; $df1d: b5 40     
            cmp $fd            ; $df1f: c5 fd     
            bne __df29         ; $df21: d0 06     
__df23:     jmp __e112         ; $df23: 4c 12 e1  

;-------------------------------------------------------------------------------
__df26:     jmp __e096         ; $df26: 4c 96 e0  

;-------------------------------------------------------------------------------
__df29:     jmp __e05c         ; $df29: 4c 5c e0  

;-------------------------------------------------------------------------------
__df2c:     jmp __e0d0         ; $df2c: 4c d0 e0  

;-------------------------------------------------------------------------------
__df2f:     lda $02df,x        ; $df2f: bd df 02  
            and #$20           ; $df32: 29 20     
            bne __df4e         ; $df34: d0 18     
            ldy $40,x          ; $df36: b4 40     
            cpy $fc            ; $df38: c4 fc     
            bne __df26         ; $df3a: d0 ea     
            lda $022b          ; $df3c: ad 2b 02  
            and #$07           ; $df3f: 29 07     
            bne __df4e         ; $df41: d0 0b     
            lda #$01           ; $df43: a9 01     
            sta $02df,x        ; $df45: 9d df 02  
            sta $023e          ; $df48: 8d 3e 02  
            jmp __e096         ; $df4b: 4c 96 e0  

;-------------------------------------------------------------------------------
__df4e:     lda $90,x          ; $df4e: b5 90     
            beq __df56         ; $df50: f0 04     
            bpl __df5e         ; $df52: 10 0a     
            bmi __df6b         ; $df54: 30 15     
__df56:     lda $79,x          ; $df56: b5 79     
            cmp $79            ; $df58: c5 79     
            beq __df6b         ; $df5a: f0 0f     
            bcc __df6b         ; $df5c: 90 0d     
__df5e:     lda $79,x          ; $df5e: b5 79     
            cmp $fe            ; $df60: c5 fe     
            bne __df23         ; $df62: d0 bf     
            cmp $ff            ; $df64: c5 ff     
            bne __df2c         ; $df66: d0 c4     
            jmp __e05c         ; $df68: 4c 5c e0  

;-------------------------------------------------------------------------------
__df6b:     lda $79,x          ; $df6b: b5 79     
            cmp $ff            ; $df6d: c5 ff     
            bne __df2c         ; $df6f: d0 bb     
            cmp $fe            ; $df71: c5 fe     
            bne __df23         ; $df73: d0 ae     
            jmp __e05c         ; $df75: 4c 5c e0  

;-------------------------------------------------------------------------------
__df78:     lda $86,x          ; $df78: b5 86     
            cmp #$03           ; $df7a: c9 03     
            beq __dfe2         ; $df7c: f0 64     
            cmp #$01           ; $df7e: c9 01     
            beq __df87         ; $df80: f0 05     
            bcs __dfb6         ; $df82: b0 32     
            jmp __e017         ; $df84: 4c 17 e0  

;-------------------------------------------------------------------------------
__df87:     lda $90,x          ; $df87: b5 90     
            beq __df8f         ; $df89: f0 04     
            bmi __df97         ; $df8b: 30 0a     
            bpl __dfa3         ; $df8d: 10 14     
__df8f:     lda $79,x          ; $df8f: b5 79     
            cmp $79            ; $df91: c5 79     
            beq __dfa3         ; $df93: f0 0e     
            bcc __dfa3         ; $df95: 90 0c     
__df97:     lda $79,x          ; $df97: b5 79     
            cmp $fe            ; $df99: c5 fe     
            bne __e014         ; $df9b: d0 77     
            cmp $ff            ; $df9d: c5 ff     
            bne __e00b         ; $df9f: d0 6a     
            beq __dfad         ; $dfa1: f0 0a     
__dfa3:     lda $79,x          ; $dfa3: b5 79     
            cmp $ff            ; $dfa5: c5 ff     
            bne __e00b         ; $dfa7: d0 62     
            cmp $fe            ; $dfa9: c5 fe     
            bne __e014         ; $dfab: d0 67     
__dfad:     lda $40,x          ; $dfad: b5 40     
            cmp $fc            ; $dfaf: c5 fc     
            bne __e011         ; $dfb1: d0 5e     
            jmp __e05c         ; $dfb3: 4c 5c e0  

;-------------------------------------------------------------------------------
__dfb6:     lda $02df,x        ; $dfb6: bd df 02  
            bmi __dfd3         ; $dfb9: 30 18     
            lda $40,x          ; $dfbb: b5 40     
            cmp $fd            ; $dfbd: c5 fd     
            bne __e00e         ; $dfbf: d0 4d     
            lda $022b          ; $dfc1: ad 2b 02  
            and #$07           ; $dfc4: 29 07     
            bne __dfd3         ; $dfc6: d0 0b     
            lda #$01           ; $dfc8: a9 01     
            sta $02df,x        ; $dfca: 9d df 02  
            sta $023e          ; $dfcd: 8d 3e 02  
            jmp __e05c         ; $dfd0: 4c 5c e0  

;-------------------------------------------------------------------------------
__dfd3:     ldy $79,x          ; $dfd3: b4 79     
            cpy $ff            ; $dfd5: c4 ff     
            bne __e00b         ; $dfd7: d0 32     
            lda $40,x          ; $dfd9: b5 40     
            cmp $fc            ; $dfdb: c5 fc     
            bne __e011         ; $dfdd: d0 32     
            jmp __e112         ; $dfdf: 4c 12 e1  

;-------------------------------------------------------------------------------
__dfe2:     lda $02df,x        ; $dfe2: bd df 02  
            bmi __dfff         ; $dfe5: 30 18     
            lda $40,x          ; $dfe7: b5 40     
            cmp $fd            ; $dfe9: c5 fd     
            bne __e00e         ; $dfeb: d0 21     
            lda $022b          ; $dfed: ad 2b 02  
            and #$07           ; $dff0: 29 07     
            bne __dfff         ; $dff2: d0 0b     
            lda #$01           ; $dff4: a9 01     
            sta $02df,x        ; $dff6: 9d df 02  
            sta $023e          ; $dff9: 8d 3e 02  
            jmp __e05c         ; $dffc: 4c 5c e0  

;-------------------------------------------------------------------------------
__dfff:     ldy $79,x          ; $dfff: b4 79     
            cpy $fe            ; $e001: c4 fe     
            bne __e014         ; $e003: d0 0f     
            lda $40,x          ; $e005: b5 40     
            cmp $fc            ; $e007: c5 fc     
            bne __e011         ; $e009: d0 06     
__e00b:     jmp __e0d0         ; $e00b: 4c d0 e0  

;-------------------------------------------------------------------------------
__e00e:     jmp __e05c         ; $e00e: 4c 5c e0  

;-------------------------------------------------------------------------------
__e011:     jmp __e096         ; $e011: 4c 96 e0  

;-------------------------------------------------------------------------------
__e014:     jmp __e112         ; $e014: 4c 12 e1  

;-------------------------------------------------------------------------------
__e017:     lda $02df,x        ; $e017: bd df 02  
            bmi __e034         ; $e01a: 30 18     
            ldy $40,x          ; $e01c: b4 40     
            cpy $fd            ; $e01e: c4 fd     
            bne __e00e         ; $e020: d0 ec     
            lda $022b          ; $e022: ad 2b 02  
            and #$07           ; $e025: 29 07     
            bne __e034         ; $e027: d0 0b     
            lda #$01           ; $e029: a9 01     
            sta $02df,x        ; $e02b: 9d df 02  
            sta $023e          ; $e02e: 8d 3e 02  
            jmp __e05c         ; $e031: 4c 5c e0  

;-------------------------------------------------------------------------------
__e034:     lda $90,x          ; $e034: b5 90     
            beq __e03c         ; $e036: f0 04     
            bmi __e042         ; $e038: 30 08     
            bpl __e04f         ; $e03a: 10 13     
__e03c:     lda $79,x          ; $e03c: b5 79     
            cmp $79            ; $e03e: c5 79     
            bcs __e04f         ; $e040: b0 0d     
__e042:     lda $79,x          ; $e042: b5 79     
            cmp $ff            ; $e044: c5 ff     
            bne __e00b         ; $e046: d0 c3     
            cmp $fe            ; $e048: c5 fe     
            bne __e014         ; $e04a: d0 c8     
            jmp __e096         ; $e04c: 4c 96 e0  

;-------------------------------------------------------------------------------
__e04f:     lda $79,x          ; $e04f: b5 79     
            cmp $fe            ; $e051: c5 fe     
            bne __e014         ; $e053: d0 bf     
            cmp $ff            ; $e055: c5 ff     
            bne __e00b         ; $e057: d0 b2     
            jmp __e096         ; $e059: 4c 96 e0  

;-------------------------------------------------------------------------------
__e05c:     ldy #$00           ; $e05c: a0 00     
            lda $02df,x        ; $e05e: bd df 02  
            and #$0f           ; $e061: 29 0f     
            sta $02df,x        ; $e063: 9d df 02  
            bne __e071         ; $e066: d0 09     
            cpx $022a          ; $e068: ec 2a 02  
            beq __e073         ; $e06b: f0 06     
            bcc __e073         ; $e06d: 90 04     
            bcs __e072         ; $e06f: b0 01     
__e071:     iny                ; $e071: c8        
__e072:     iny                ; $e072: c8        
__e073:     lda $023c,y        ; $e073: b9 3c 02  
            cmp #$02           ; $e076: c9 02     
            bcc __e087         ; $e078: 90 0d     
            lda $40,x          ; $e07a: b5 40     
            and #$0f           ; $e07c: 29 0f     
            cmp #$0f           ; $e07e: c9 0f     
            bne __e087         ; $e080: d0 05     
            lda #$01           ; $e082: a9 01     
            sta $023c,y        ; $e084: 99 3c 02  
__e087:     lda $40,x          ; $e087: b5 40     
            clc                ; $e089: 18        
            adc $023c,y        ; $e08a: 79 3c 02  
            sta $40,x          ; $e08d: 95 40     
            lda #$00           ; $e08f: a9 00     
            sta $86,x          ; $e091: 95 86     
            jmp __db71         ; $e093: 4c 71 db  

;-------------------------------------------------------------------------------
__e096:     ldy #$00           ; $e096: a0 00     
            lda $02df,x        ; $e098: bd df 02  
            and #$0f           ; $e09b: 29 0f     
            sta $02df,x        ; $e09d: 9d df 02  
            bne __e0ab         ; $e0a0: d0 09     
            cpx $022a          ; $e0a2: ec 2a 02  
            beq __e0ad         ; $e0a5: f0 06     
            bcc __e0ad         ; $e0a7: 90 04     
            bcs __e0ac         ; $e0a9: b0 01     
__e0ab:     iny                ; $e0ab: c8        
__e0ac:     iny                ; $e0ac: c8        
__e0ad:     lda $023c,y        ; $e0ad: b9 3c 02  
            cmp #$02           ; $e0b0: c9 02     
            bcc __e0c1         ; $e0b2: 90 0d     
            lda $40,x          ; $e0b4: b5 40     
            and #$0f           ; $e0b6: 29 0f     
            cmp #$01           ; $e0b8: c9 01     
            bne __e0c1         ; $e0ba: d0 05     
            lda #$01           ; $e0bc: a9 01     
            sta $023c,y        ; $e0be: 99 3c 02  
__e0c1:     lda $40,x          ; $e0c1: b5 40     
            sec                ; $e0c3: 38        
            sbc $023c,y        ; $e0c4: f9 3c 02  
            sta $40,x          ; $e0c7: 95 40     
            lda #$01           ; $e0c9: a9 01     
            sta $86,x          ; $e0cb: 95 86     
            jmp __db71         ; $e0cd: 4c 71 db  

;-------------------------------------------------------------------------------
__e0d0:     ldy #$00           ; $e0d0: a0 00     
            lda $02df,x        ; $e0d2: bd df 02  
            and #$0f           ; $e0d5: 29 0f     
            sta $02df,x        ; $e0d7: 9d df 02  
            bne __e0e5         ; $e0da: d0 09     
            cpx $022a          ; $e0dc: ec 2a 02  
            beq __e0e7         ; $e0df: f0 06     
            bcc __e0e7         ; $e0e1: 90 04     
            bcs __e0e6         ; $e0e3: b0 01     
__e0e5:     iny                ; $e0e5: c8        
__e0e6:     iny                ; $e0e6: c8        
__e0e7:     lda $023c,y        ; $e0e7: b9 3c 02  
            cmp #$02           ; $e0ea: c9 02     
            bcc __e0fe         ; $e0ec: 90 10     
            lda $79,x          ; $e0ee: b5 79     
            clc                ; $e0f0: 18        
            adc $29            ; $e0f1: 65 29     
            and #$0f           ; $e0f3: 29 0f     
            cmp #$0f           ; $e0f5: c9 0f     
            bne __e0fe         ; $e0f7: d0 05     
            lda #$01           ; $e0f9: a9 01     
            sta $023c,y        ; $e0fb: 99 3c 02  
__e0fe:     lda $79,x          ; $e0fe: b5 79     
            sta $17            ; $e100: 85 17     
            clc                ; $e102: 18        
            adc $023c,y        ; $e103: 79 3c 02  
            sta $79,x          ; $e106: 95 79     
            jsr __c704         ; $e108: 20 04 c7  
            lda #$02           ; $e10b: a9 02     
            sta $86,x          ; $e10d: 95 86     
            jmp __db71         ; $e10f: 4c 71 db  

;-------------------------------------------------------------------------------
__e112:     ldy #$00           ; $e112: a0 00     
            lda $02df,x        ; $e114: bd df 02  
            and #$0f           ; $e117: 29 0f     
            sta $02df,x        ; $e119: 9d df 02  
            bne __e127         ; $e11c: d0 09     
            cpx $022a          ; $e11e: ec 2a 02  
            beq __e129         ; $e121: f0 06     
            bcc __e129         ; $e123: 90 04     
            bcs __e128         ; $e125: b0 01     
__e127:     iny                ; $e127: c8        
__e128:     iny                ; $e128: c8        
__e129:     lda $023c,y        ; $e129: b9 3c 02  
            cmp #$02           ; $e12c: c9 02     
            bcc __e140         ; $e12e: 90 10     
            lda $79,x          ; $e130: b5 79     
            clc                ; $e132: 18        
            adc $29            ; $e133: 65 29     
            and #$0f           ; $e135: 29 0f     
            cmp #$01           ; $e137: c9 01     
            bne __e140         ; $e139: d0 05     
            lda #$01           ; $e13b: a9 01     
            sta $023c,y        ; $e13d: 99 3c 02  
__e140:     lda $79,x          ; $e140: b5 79     
            sta $17            ; $e142: 85 17     
            sec                ; $e144: 38        
            sbc $023c,y        ; $e145: f9 3c 02  
            sta $79,x          ; $e148: 95 79     
            jsr __c721         ; $e14a: 20 21 c7  
            lda #$03           ; $e14d: a9 03     
            sta $86,x          ; $e14f: 95 86     
            jmp __db71         ; $e151: 4c 71 db  

;-------------------------------------------------------------------------------
__e154:     .hex 00 00 01 ff   ; $e154: 00 00 01 ff   Data
__e158:     .hex 01 ff 00 00   ; $e158: 01 ff 00 00   Data

;-------------------------------------------------------------------------------
__e15c:     lda $f9            ; $e15c: a5 f9     
            bne __e1c7         ; $e15e: d0 67     
            ldx $02dd          ; $e160: ae dd 02  
            beq __e1c7         ; $e163: f0 62     
            ldy #$00           ; $e165: a0 00     
            lda $02de          ; $e167: ad de 02  
            cmp #$01           ; $e16a: c9 01     
            beq __e1b5         ; $e16c: f0 47     
            cmp #$18           ; $e16e: c9 18     
            bcs __e1c7         ; $e170: b0 55     
            cmp #$15           ; $e172: c9 15     
            bcs __e187         ; $e174: b0 11     
            cmp #$10           ; $e176: c9 10     
            bcs __e189         ; $e178: b0 0f     
            cmp #$09           ; $e17a: c9 09     
            bcs __e18a         ; $e17c: b0 0c     
            cmp #$04           ; $e17e: c9 04     
            bcs __e184         ; $e180: b0 02     
            iny                ; $e182: c8        
            iny                ; $e183: c8        
__e184:     iny                ; $e184: c8        
            bne __e18a         ; $e185: d0 03     
__e187:     dey                ; $e187: 88        
            dey                ; $e188: 88        
__e189:     dey                ; $e189: 88        
__e18a:     sty $18            ; $e18a: 84 18     
            ldy $86,x          ; $e18c: b4 86     
            lda $79,x          ; $e18e: b5 79     
            sta $17            ; $e190: 85 17     
            clc                ; $e192: 18        
            adc __e154,y       ; $e193: 79 54 e1  
            sta $79,x          ; $e196: 95 79     
            cpy #$02           ; $e198: c0 02     
            beq __e1a6         ; $e19a: f0 0a     
            cpy #$03           ; $e19c: c0 03     
            bne __e1a9         ; $e19e: d0 09     
            jsr __c721         ; $e1a0: 20 21 c7  
            jmp __e1a9         ; $e1a3: 4c a9 e1  

;-------------------------------------------------------------------------------
__e1a6:     jsr __c704         ; $e1a6: 20 04 c7  
__e1a9:     lda $40,x          ; $e1a9: b5 40     
            clc                ; $e1ab: 18        
            adc $18            ; $e1ac: 65 18     
            clc                ; $e1ae: 18        
            adc __e158,y       ; $e1af: 79 58 e1  
            sta $40,x          ; $e1b2: 95 40     
            rts                ; $e1b4: 60        

;-------------------------------------------------------------------------------
__e1b5:     lda #$00           ; $e1b5: a9 00     
            sta $02dd          ; $e1b7: 8d dd 02  
            sta $02de          ; $e1ba: 8d de 02  
            lda #$02           ; $e1bd: a9 02     
            sta $0227          ; $e1bf: 8d 27 02  
            lda #$19           ; $e1c2: a9 19     
            sta $0244,x        ; $e1c4: 9d 44 02  
__e1c7:     rts                ; $e1c7: 60        

;-------------------------------------------------------------------------------
__e1c8:     lda $f9            ; $e1c8: a5 f9     
            beq __e1cd         ; $e1ca: f0 01     
            rts                ; $e1cc: 60        

;-------------------------------------------------------------------------------
__e1cd:     ldx $029b          ; $e1cd: ae 9b 02  
            beq __e205         ; $e1d0: f0 33     
            lda $029b,x        ; $e1d2: bd 9b 02  
            cmp #$04           ; $e1d5: c9 04     
            bcs __e205         ; $e1d7: b0 2c     
            lda $2c            ; $e1d9: a5 2c     
            and #$02           ; $e1db: 29 02     
            beq __e205         ; $e1dd: f0 26     
            lda $02a6          ; $e1df: ad a6 02  
            bne __e205         ; $e1e2: d0 21     
            lda #$18           ; $e1e4: a9 18     
            sta $02a6          ; $e1e6: 8d a6 02  
            inc $029b,x        ; $e1e9: fe 9b 02  
            lda $029b,x        ; $e1ec: bd 9b 02  
            cmp #$04           ; $e1ef: c9 04     
            bne __e200         ; $e1f1: d0 0d     
            lda #$01           ; $e1f3: a9 01     
            sta $061d          ; $e1f5: 8d 1d 06  
            lda $86            ; $e1f8: a5 86     
            sta $4d,x          ; $e1fa: 95 4d     
            lda #$6e           ; $e1fc: a9 6e     
            bne __e202         ; $e1fe: d0 02     
__e200:     lda #$3c           ; $e200: a9 3c     
__e202:     sta $02a6,x        ; $e202: 9d a6 02  
__e205:     ldx $0229          ; $e205: ae 29 02  
__e208:     lda $0244,x        ; $e208: bd 44 02  
            cmp #$48           ; $e20b: c9 48     
            bne __e228         ; $e20d: d0 19     
            lda #$00           ; $e20f: a9 00     
            sta $029b,x        ; $e211: 9d 9b 02  
            sta $02a6,x        ; $e214: 9d a6 02  
            cpx $029b          ; $e217: ec 9b 02  
            bne __e228         ; $e21a: d0 0c     
            sta $025a          ; $e21c: 8d 5a 02  
            sta $029b          ; $e21f: 8d 9b 02  
            sta $02a6          ; $e222: 8d a6 02  
__e225:     jmp __e2b1         ; $e225: 4c b1 e2  

;-------------------------------------------------------------------------------
__e228:     lda $029b,x        ; $e228: bd 9b 02  
            beq __e225         ; $e22b: f0 f8     
            cmp #$04           ; $e22d: c9 04     
            bcc __e27c         ; $e22f: 90 4b     
            lda $02a6,x        ; $e231: bd a6 02  
            beq __e272         ; $e234: f0 3c     
            dec $02a6,x        ; $e236: de a6 02  
            lda $02a6,x        ; $e239: bd a6 02  
            cmp #$5a           ; $e23c: c9 5a     
            bne __e2b1         ; $e23e: d0 71     
            dec $02a6,x        ; $e240: de a6 02  
            lda $4d,x          ; $e243: b5 4d     
            cmp #$02           ; $e245: c9 02     
            bcc __e250         ; $e247: 90 07     
            cpx $022a          ; $e249: ec 2a 02  
            beq __e254         ; $e24c: f0 06     
            bcc __e254         ; $e24e: 90 04     
__e250:     lda #$02           ; $e250: a9 02     
            bne __e256         ; $e252: d0 02     
__e254:     lda #$04           ; $e254: a9 04     
__e256:     sta $1f            ; $e256: 85 1f     
            inc $029b,x        ; $e258: fe 9b 02  
            ldy #$03           ; $e25b: a0 03     
            lda #$ef           ; $e25d: a9 ef     
__e25f:     dey                ; $e25f: 88        
            sta $0250,y        ; $e260: 99 50 02  
            bne __e25f         ; $e263: d0 fa     
            lda #$00           ; $e265: a9 00     
            sta $029b          ; $e267: 8d 9b 02  
            sta $02a6          ; $e26a: 8d a6 02  
            sta $025a          ; $e26d: 8d 5a 02  
            beq __e2b1         ; $e270: f0 3f     
__e272:     sta $029b,x        ; $e272: 9d 9b 02  
            lda #$01           ; $e275: a9 01     
            sta $0244,x        ; $e277: 9d 44 02  
            bne __e2b1         ; $e27a: d0 35     
__e27c:     lda $02a6,x        ; $e27c: bd a6 02  
            beq __e287         ; $e27f: f0 06     
            dec $02a6,x        ; $e281: de a6 02  
            jmp __e2b1         ; $e284: 4c b1 e2  

;-------------------------------------------------------------------------------
__e287:     dec $029b,x        ; $e287: de 9b 02  
            lda $029b,x        ; $e28a: bd 9b 02  
            beq __e296         ; $e28d: f0 07     
            lda #$3c           ; $e28f: a9 3c     
            sta $02a6,x        ; $e291: 9d a6 02  
            bne __e2b1         ; $e294: d0 1b     
__e296:     lda $0227          ; $e296: ad 27 02  
            cmp #$02           ; $e299: c9 02     
            bcs __e2a7         ; $e29b: b0 0a     
            lda #$02           ; $e29d: a9 02     
            sta $0227          ; $e29f: 8d 27 02  
            lda #$00           ; $e2a2: a9 00     
            sta $0226          ; $e2a4: 8d 26 02  
__e2a7:     cpx $029b          ; $e2a7: ec 9b 02  
            bne __e2b1         ; $e2aa: d0 05     
            lda #$00           ; $e2ac: a9 00     
            sta $029b          ; $e2ae: 8d 9b 02  
__e2b1:     dex                ; $e2b1: ca        
            beq __e2b7         ; $e2b2: f0 03     
            jmp __e208         ; $e2b4: 4c 08 e2  

;-------------------------------------------------------------------------------
__e2b7:     lda $02a6          ; $e2b7: ad a6 02  
            beq __e2bf         ; $e2ba: f0 03     
            dec $02a6          ; $e2bc: ce a6 02  
__e2bf:     rts                ; $e2bf: 60        

;-------------------------------------------------------------------------------
            .hex 7c 80 88 94   ; $e2c0: 7c 80 88 94   Data
__e2c4:     .hex 89 70 98 a8   ; $e2c4: 89 70 98 a8   Data
            .hex 60 f0         ; $e2c8: 60 f0         Data

;-------------------------------------------------------------------------------
__e2ca:     ldx $0229          ; $e2ca: ae 29 02  
__e2cd:     lda $029b,x        ; $e2cd: bd 9b 02  
            bne __e2d5         ; $e2d0: d0 03     
            jmp __e41b         ; $e2d2: 4c 1b e4  

;-------------------------------------------------------------------------------
__e2d5:     stx $19            ; $e2d5: 86 19     
            lda #$00           ; $e2d7: a9 00     
            sta $1b            ; $e2d9: 85 1b     
            sta $1d            ; $e2db: 85 1d     
            ldx $0229          ; $e2dd: ae 29 02  
__e2e0:     lda $029b,x        ; $e2e0: bd 9b 02  
            cmp #$05           ; $e2e3: c9 05     
            beq __e2ed         ; $e2e5: f0 06     
            cmp #$02           ; $e2e7: c9 02     
            bcc __e2ed         ; $e2e9: 90 02     
            inc $1b            ; $e2eb: e6 1b     
__e2ed:     cpx $19            ; $e2ed: e4 19     
            beq __e2f4         ; $e2ef: f0 03     
            dex                ; $e2f1: ca        
            bne __e2e0         ; $e2f2: d0 ec     
__e2f4:     ldx $19            ; $e2f4: a6 19     
            lda #$30           ; $e2f6: a9 30     
            cpx $022a          ; $e2f8: ec 2a 02  
            beq __e301         ; $e2fb: f0 04     
            bcc __e301         ; $e2fd: 90 02     
            lda #$00           ; $e2ff: a9 00     
__e301:     sta $17            ; $e301: 85 17     
            ldy #$01           ; $e303: a0 01     
            sty $18            ; $e305: 84 18     
__e307:     stx $1e            ; $e307: 86 1e     
            cpy $1e            ; $e309: c4 1e     
            beq __e31e         ; $e30b: f0 11     
            lda $40,x          ; $e30d: b5 40     
            cmp $0040,y        ; $e30f: d9 40 00  
            beq __e318         ; $e312: f0 04     
            bcs __e31e         ; $e314: b0 08     
            bcc __e31c         ; $e316: 90 04     
__e318:     cpy $1e            ; $e318: c4 1e     
            bcs __e31e         ; $e31a: b0 02     
__e31c:     inc $18            ; $e31c: e6 18     
__e31e:     iny                ; $e31e: c8        
            cpy $0229          ; $e31f: cc 29 02  
            beq __e307         ; $e322: f0 e3     
            bcc __e307         ; $e324: 90 e1     
            lda $18            ; $e326: a5 18     
            asl                ; $e328: 0a        
            asl                ; $e329: 0a        
            asl                ; $e32a: 0a        
            clc                ; $e32b: 18        
            adc #$10           ; $e32c: 69 10     
            clc                ; $e32e: 18        
            adc $0240          ; $e32f: 6d 40 02  
            sta $18            ; $e332: 85 18     
            ldy $029b,x        ; $e334: bc 9b 02  
            cpy #$05           ; $e337: c0 05     
            beq __e3a3         ; $e339: f0 68     
            lda $17            ; $e33b: a5 17     
            clc                ; $e33d: 18        
            adc __e2bf,y       ; $e33e: 79 bf e2  
            ldy $18            ; $e341: a4 18     
            sta $0701,y        ; $e343: 99 01 07  
            clc                ; $e346: 18        
            adc #$02           ; $e347: 69 02     
            sta $0705,y        ; $e349: 99 05 07  
            sta $1a            ; $e34c: 85 1a     
            lda $029b,x        ; $e34e: bd 9b 02  
            cmp #$02           ; $e351: c9 02     
            bcc __e3c5         ; $e353: 90 70     
            beq __e359         ; $e355: f0 02     
            bcs __e37b         ; $e357: b0 22     
__e359:     ldy $1b            ; $e359: a4 1b     
            lda __e2c4,y       ; $e35b: b9 c4 e2  
            clc                ; $e35e: 18        
            adc $0240          ; $e35f: 6d 40 02  
            sta $1c            ; $e362: 85 1c     
            tay                ; $e364: a8        
            lda $1a            ; $e365: a5 1a     
            clc                ; $e367: 18        
            adc #$02           ; $e368: 69 02     
            sta $0701,y        ; $e36a: 99 01 07  
            lda $17            ; $e36d: a5 17     
            beq __e3c5         ; $e36f: f0 54     
            lda $1a            ; $e371: a5 1a     
            clc                ; $e373: 18        
            adc #$04           ; $e374: 69 04     
            sta $0705,y        ; $e376: 99 05 07  
            bne __e3c5         ; $e379: d0 4a     
__e37b:     ldy $1b            ; $e37b: a4 1b     
            lda __e2c4,y       ; $e37d: b9 c4 e2  
            clc                ; $e380: 18        
            adc $0240          ; $e381: 6d 40 02  
            sta $1c            ; $e384: 85 1c     
            tay                ; $e386: a8        
            lda $1a            ; $e387: a5 1a     
            clc                ; $e389: 18        
            adc #$02           ; $e38a: 69 02     
            sta $0701,y        ; $e38c: 99 01 07  
            clc                ; $e38f: 18        
            adc #$02           ; $e390: 69 02     
            sta $0705,y        ; $e392: 99 05 07  
            clc                ; $e395: 18        
            adc #$02           ; $e396: 69 02     
            sta $0709,y        ; $e398: 99 09 07  
            clc                ; $e39b: 18        
            adc #$02           ; $e39c: 69 02     
            sta $070d,y        ; $e39e: 99 0d 07  
            bne __e3c5         ; $e3a1: d0 22     
__e3a3:     lda $17            ; $e3a3: a5 17     
            beq __e3b5         ; $e3a5: f0 0e     
            lda #$00           ; $e3a7: a9 00     
            sta $17            ; $e3a9: 85 17     
            lda $4d,x          ; $e3ab: b5 4d     
            cmp #$02           ; $e3ad: c9 02     
            bcc __e3b5         ; $e3af: 90 04     
            lda #$04           ; $e3b1: a9 04     
            sta $17            ; $e3b3: 85 17     
__e3b5:     lda $17            ; $e3b5: a5 17     
            clc                ; $e3b7: 18        
            adc __e2bf,y       ; $e3b8: 79 bf e2  
            ldy $18            ; $e3bb: a4 18     
            sta $0701,y        ; $e3bd: 99 01 07  
            lda #$81           ; $e3c0: a9 81     
            sta $0705,y        ; $e3c2: 99 05 07  
__e3c5:     lda $029b,x        ; $e3c5: bd 9b 02  
            cmp #$05           ; $e3c8: c9 05     
            beq __e411         ; $e3ca: f0 45     
            lda $17            ; $e3cc: a5 17     
            beq __e3d4         ; $e3ce: f0 04     
            lda #$02           ; $e3d0: a9 02     
            bne __e3d6         ; $e3d2: d0 02     
__e3d4:     lda #$01           ; $e3d4: a9 01     
__e3d6:     ldy $86,x          ; $e3d6: b4 86     
            cpy #$03           ; $e3d8: c0 03     
            bne __e3de         ; $e3da: d0 02     
            ora #$40           ; $e3dc: 09 40     
__e3de:     ldy $18            ; $e3de: a4 18     
            sta $0702,y        ; $e3e0: 99 02 07  
            sta $0706,y        ; $e3e3: 99 06 07  
            ldy $029b,x        ; $e3e6: bc 9b 02  
            cpy #$02           ; $e3e9: c0 02     
            bcc __e422         ; $e3eb: 90 35     
            beq __e3f1         ; $e3ed: f0 02     
            bcs __e401         ; $e3ef: b0 10     
__e3f1:     ldy $1c            ; $e3f1: a4 1c     
            sta $0702,y        ; $e3f3: 99 02 07  
            ldy $17            ; $e3f6: a4 17     
            beq __e422         ; $e3f8: f0 28     
            ldy $1c            ; $e3fa: a4 1c     
            sta $0706,y        ; $e3fc: 99 06 07  
            bne __e422         ; $e3ff: d0 21     
__e401:     ldy $1c            ; $e401: a4 1c     
            sta $0702,y        ; $e403: 99 02 07  
            sta $0706,y        ; $e406: 99 06 07  
            sta $070a,y        ; $e409: 99 0a 07  
            sta $070e,y        ; $e40c: 99 0e 07  
            bne __e422         ; $e40f: d0 11     
__e411:     lda #$00           ; $e411: a9 00     
            sta $0702,y        ; $e413: 99 02 07  
            sta $0706,y        ; $e416: 99 06 07  
            beq __e422         ; $e419: f0 07     
__e41b:     dex                ; $e41b: ca        
            beq __e421         ; $e41c: f0 03     
            jmp __e2cd         ; $e41e: 4c cd e2  

;-------------------------------------------------------------------------------
__e421:     rts                ; $e421: 60        

;-------------------------------------------------------------------------------
__e422:     lda $029b,x        ; $e422: bd 9b 02  
            cmp #$05           ; $e425: c9 05     
            beq __e439         ; $e427: f0 10     
            cmp #$03           ; $e429: c9 03     
            bcs __e43c         ; $e42b: b0 0f     
            cmp #$02           ; $e42d: c9 02     
            bne __e439         ; $e42f: d0 08     
            lda $17            ; $e431: a5 17     
            beq __e440         ; $e433: f0 0b     
            lda #$08           ; $e435: a9 08     
            sta $1d            ; $e437: 85 1d     
__e439:     jmp __e578         ; $e439: 4c 78 e5  

;-------------------------------------------------------------------------------
__e43c:     lda #$08           ; $e43c: a9 08     
            sta $1d            ; $e43e: 85 1d     
__e440:     lda $90,x          ; $e440: b5 90     
            beq __e452         ; $e442: f0 0e     
            bmi __e462         ; $e444: 30 1c     
            lda $79,x          ; $e446: b5 79     
            cmp #$04           ; $e448: c9 04     
            bcc __e46f         ; $e44a: 90 23     
            cmp #$0c           ; $e44c: c9 0c     
            bcc __e4a7         ; $e44e: 90 57     
            bcs __e472         ; $e450: b0 20     
__e452:     lda $79,x          ; $e452: b5 79     
            cmp #$02           ; $e454: c9 02     
            bcc __e478         ; $e456: 90 20     
            cmp #$0a           ; $e458: c9 0a     
            bcc __e46c         ; $e45a: 90 10     
            cmp #$fc           ; $e45c: c9 fc     
            bcc __e475         ; $e45e: 90 15     
            bcs __e46f         ; $e460: b0 0d     
__e462:     lda $79,x          ; $e462: b5 79     
            beq __e478         ; $e464: f0 12     
            cmp #$fa           ; $e466: c9 fa     
            bcc __e472         ; $e468: 90 08     
            bcs __e478         ; $e46a: b0 0c     

;-------------------------------------------------------------------------------
__e46c:     jmp __e4d6         ; $e46c: 4c d6 e4  

;-------------------------------------------------------------------------------
__e46f:     jmp __e505         ; $e46f: 4c 05 e5  

;-------------------------------------------------------------------------------
__e472:     jmp __e534         ; $e472: 4c 34 e5  

;-------------------------------------------------------------------------------
__e475:     jmp __e553         ; $e475: 4c 53 e5  

;-------------------------------------------------------------------------------
__e478:     lda $86,x          ; $e478: b5 86     
            cmp #$03           ; $e47a: c9 03     
            beq __e4ad         ; $e47c: f0 2f     
__e47e:     ldy $18            ; $e47e: a4 18     
            lda #$f0           ; $e480: a9 f0     
            sta $0700,y        ; $e482: 99 00 07  
            sta $0704,y        ; $e485: 99 04 07  
            ldy $1c            ; $e488: a4 1c     
            lda $40,x          ; $e48a: b5 40     
            sec                ; $e48c: 38        
            sbc $1d            ; $e48d: e5 1d     
            sta $0700,y        ; $e48f: 99 00 07  
            lda $1d            ; $e492: a5 1d     
            beq __e4a4         ; $e494: f0 0e     
            clc                ; $e496: 18        
            adc $40,x          ; $e497: 75 40     
            sta $070c,y        ; $e499: 99 0c 07  
            lda #$f0           ; $e49c: a9 f0     
            sta $0704,y        ; $e49e: 99 04 07  
            sta $0708,y        ; $e4a1: 99 08 07  
__e4a4:     jmp __e628         ; $e4a4: 4c 28 e6  

;-------------------------------------------------------------------------------
__e4a7:     lda $86,x          ; $e4a7: b5 86     
            cmp #$03           ; $e4a9: c9 03     
            beq __e47e         ; $e4ab: f0 d1     
__e4ad:     ldy $18            ; $e4ad: a4 18     
            lda $40,x          ; $e4af: b5 40     
            sec                ; $e4b1: 38        
            sbc $1d            ; $e4b2: e5 1d     
            sta $0700,y        ; $e4b4: 99 00 07  
            lda #$f0           ; $e4b7: a9 f0     
            sta $0704,y        ; $e4b9: 99 04 07  
            ldy $1c            ; $e4bc: a4 1c     
            sta $0700,y        ; $e4be: 99 00 07  
            lda $1d            ; $e4c1: a5 1d     
            beq __e4d3         ; $e4c3: f0 0e     
            clc                ; $e4c5: 18        
            adc $40,x          ; $e4c6: 75 40     
            sta $0704,y        ; $e4c8: 99 04 07  
            lda #$f0           ; $e4cb: a9 f0     
            sta $0708,y        ; $e4cd: 99 08 07  
            sta $070c,y        ; $e4d0: 99 0c 07  
__e4d3:     jmp __e628         ; $e4d3: 4c 28 e6  

;-------------------------------------------------------------------------------
__e4d6:     lda $86,x          ; $e4d6: b5 86     
            cmp #$03           ; $e4d8: c9 03     
            beq __e50b         ; $e4da: f0 2f     
__e4dc:     ldy $18            ; $e4dc: a4 18     
            lda #$f0           ; $e4de: a9 f0     
            sta $0700,y        ; $e4e0: 99 00 07  
            lda $40,x          ; $e4e3: b5 40     
            sec                ; $e4e5: 38        
            sbc $1d            ; $e4e6: e5 1d     
            sta $0704,y        ; $e4e8: 99 04 07  
            ldy $1c            ; $e4eb: a4 1c     
            sta $0700,y        ; $e4ed: 99 00 07  
            lda $1d            ; $e4f0: a5 1d     
            beq __e502         ; $e4f2: f0 0e     
            clc                ; $e4f4: 18        
            adc $40,x          ; $e4f5: 75 40     
            sta $0708,y        ; $e4f7: 99 08 07  
            sta $070c,y        ; $e4fa: 99 0c 07  
            lda #$f0           ; $e4fd: a9 f0     
            sta $0704,y        ; $e4ff: 99 04 07  
__e502:     jmp __e628         ; $e502: 4c 28 e6  

;-------------------------------------------------------------------------------
__e505:     lda $86,x          ; $e505: b5 86     
            cmp #$03           ; $e507: c9 03     
            beq __e4dc         ; $e509: f0 d1     
__e50b:     ldy $18            ; $e50b: a4 18     
            lda $40,x          ; $e50d: b5 40     
            sec                ; $e50f: 38        
            sbc $1d            ; $e510: e5 1d     
            sta $0700,y        ; $e512: 99 00 07  
            sta $0704,y        ; $e515: 99 04 07  
            ldy $1c            ; $e518: a4 1c     
            lda #$f0           ; $e51a: a9 f0     
            sta $0700,y        ; $e51c: 99 00 07  
            lda $1d            ; $e51f: a5 1d     
            beq __e531         ; $e521: f0 0e     
            clc                ; $e523: 18        
            adc $40,x          ; $e524: 75 40     
            sta $0704,y        ; $e526: 99 04 07  
            sta $0708,y        ; $e529: 99 08 07  
            lda #$f0           ; $e52c: a9 f0     
            sta $070c,y        ; $e52e: 99 0c 07  
__e531:     jmp __e628         ; $e531: 4c 28 e6  

;-------------------------------------------------------------------------------
__e534:     ldy $18            ; $e534: a4 18     
            lda #$f0           ; $e536: a9 f0     
            sta $0700,y        ; $e538: 99 00 07  
            sta $0704,y        ; $e53b: 99 04 07  
            ldy $1d            ; $e53e: a4 1d     
            beq __e550         ; $e540: f0 0e     
            ldy $1c            ; $e542: a4 1c     
            sta $0700,y        ; $e544: 99 00 07  
            sta $0704,y        ; $e547: 99 04 07  
            sta $0708,y        ; $e54a: 99 08 07  
            sta $070c,y        ; $e54d: 99 0c 07  
__e550:     jmp __e628         ; $e550: 4c 28 e6  

;-------------------------------------------------------------------------------
__e553:     ldy $18            ; $e553: a4 18     
            lda $40,x          ; $e555: b5 40     
            sec                ; $e557: 38        
            sbc $1d            ; $e558: e5 1d     
            sta $0700,y        ; $e55a: 99 00 07  
            sta $0704,y        ; $e55d: 99 04 07  
            ldy $1c            ; $e560: a4 1c     
            sta $0700,y        ; $e562: 99 00 07  
            lda $1d            ; $e565: a5 1d     
            beq __e575         ; $e567: f0 0c     
            clc                ; $e569: 18        
            adc $40,x          ; $e56a: 75 40     
            sta $0704,y        ; $e56c: 99 04 07  
            sta $0708,y        ; $e56f: 99 08 07  
            sta $070c,y        ; $e572: 99 0c 07  
__e575:     jmp __e628         ; $e575: 4c 28 e6  

;-------------------------------------------------------------------------------
__e578:     lda $90,x          ; $e578: b5 90     
            beq __e586         ; $e57a: f0 0a     
            bmi __e58e         ; $e57c: 30 10     
            lda $79,x          ; $e57e: b5 79     
            cmp #$08           ; $e580: c9 08     
            bcc __e5c5         ; $e582: 90 41     
            bcs __e5f4         ; $e584: b0 6e     
__e586:     lda $79,x          ; $e586: b5 79     
            cmp #$06           ; $e588: c9 06     
            bcc __e596         ; $e58a: 90 0a     
            bcs __e60c         ; $e58c: b0 7e     
__e58e:     lda $79,x          ; $e58e: b5 79     
            beq __e596         ; $e590: f0 04     
            cmp #$fe           ; $e592: c9 fe     
            bcc __e5f4         ; $e594: 90 5e     

;-------------------------------------------------------------------------------
__e596:     lda $029b,x        ; $e596: bd 9b 02  
            cmp #$05           ; $e599: c9 05     
            beq __e5a3         ; $e59b: f0 06     
            lda $86,x          ; $e59d: b5 86     
            cmp #$03           ; $e59f: c9 03     
            beq __e5d2         ; $e5a1: f0 2f     
__e5a3:     ldy $18            ; $e5a3: a4 18     
            lda #$ef           ; $e5a5: a9 ef     
            sta $0700,y        ; $e5a7: 99 00 07  
            lda $40,x          ; $e5aa: b5 40     
            sec                ; $e5ac: 38        
            sbc $1d            ; $e5ad: e5 1d     
            sta $0704,y        ; $e5af: 99 04 07  
            lda $1d            ; $e5b2: a5 1d     
            beq __e628         ; $e5b4: f0 72     
            ldy $1c            ; $e5b6: a4 1c     
            clc                ; $e5b8: 18        
            adc $40,x          ; $e5b9: 75 40     
            sta $0704,y        ; $e5bb: 99 04 07  
            lda #$ef           ; $e5be: a9 ef     
            sta $0700,y        ; $e5c0: 99 00 07  
            bne __e628         ; $e5c3: d0 63     
__e5c5:     lda $029b,x        ; $e5c5: bd 9b 02  
            cmp #$05           ; $e5c8: c9 05     
            beq __e5d2         ; $e5ca: f0 06     
            lda $86,x          ; $e5cc: b5 86     
            cmp #$03           ; $e5ce: c9 03     
            beq __e5a3         ; $e5d0: f0 d1     
__e5d2:     ldy $18            ; $e5d2: a4 18     
            lda $40,x          ; $e5d4: b5 40     
            sec                ; $e5d6: 38        
            sbc $1d            ; $e5d7: e5 1d     
            sta $0700,y        ; $e5d9: 99 00 07  
            lda #$ef           ; $e5dc: a9 ef     
            sta $0704,y        ; $e5de: 99 04 07  
            lda $1d            ; $e5e1: a5 1d     
            beq __e628         ; $e5e3: f0 43     
            ldy $1c            ; $e5e5: a4 1c     
            clc                ; $e5e7: 18        
            adc $40,x          ; $e5e8: 75 40     
            sta $0700,y        ; $e5ea: 99 00 07  
            lda #$ef           ; $e5ed: a9 ef     
            sta $0704,y        ; $e5ef: 99 04 07  
            bne __e628         ; $e5f2: d0 34     
__e5f4:     ldy $18            ; $e5f4: a4 18     
            lda #$ef           ; $e5f6: a9 ef     
            sta $0700,y        ; $e5f8: 99 00 07  
            sta $0704,y        ; $e5fb: 99 04 07  
            ldy $1d            ; $e5fe: a4 1d     
            beq __e628         ; $e600: f0 26     
            ldy $1c            ; $e602: a4 1c     
            sta $0700,y        ; $e604: 99 00 07  
            sta $0704,y        ; $e607: 99 04 07  
            bne __e628         ; $e60a: d0 1c     
__e60c:     ldy $18            ; $e60c: a4 18     
            lda $40,x          ; $e60e: b5 40     
            sec                ; $e610: 38        
            sbc $1d            ; $e611: e5 1d     
            sta $0700,y        ; $e613: 99 00 07  
            sta $0704,y        ; $e616: 99 04 07  
            lda $1d            ; $e619: a5 1d     
            beq __e628         ; $e61b: f0 0b     
            ldy $1c            ; $e61d: a4 1c     
            clc                ; $e61f: 18        
            adc $40,x          ; $e620: 75 40     
            sta $0700,y        ; $e622: 99 00 07  
            sta $0704,y        ; $e625: 99 04 07  
__e628:     lda $029b,x        ; $e628: bd 9b 02  
            cmp #$05           ; $e62b: c9 05     
            beq __e6ab         ; $e62d: f0 7c     
            cmp #$03           ; $e62f: c9 03     
            bcs __e63b         ; $e631: b0 08     
            cmp #$02           ; $e633: c9 02     
            bne __e6ab         ; $e635: d0 74     
            lda $17            ; $e637: a5 17     
            bne __e6ab         ; $e639: d0 70     
__e63b:     ldy $18            ; $e63b: a4 18     
            lda $86,x          ; $e63d: b5 86     
            cmp #$03           ; $e63f: c9 03     
            beq __e677         ; $e641: f0 34     
            lda $79,x          ; $e643: b5 79     
            sec                ; $e645: 38        
            sbc #$0c           ; $e646: e9 0c     
            sta $0703,y        ; $e648: 99 03 07  
            clc                ; $e64b: 18        
            adc #$08           ; $e64c: 69 08     
            sta $0707,y        ; $e64e: 99 07 07  
            ldy $1c            ; $e651: a4 1c     
            clc                ; $e653: 18        
            adc #$08           ; $e654: 69 08     
            sta $0703,y        ; $e656: 99 03 07  
            lda $029b,x        ; $e659: bd 9b 02  
            cmp #$03           ; $e65c: c9 03     
            bcc __e674         ; $e65e: 90 14     
            lda $79,x          ; $e660: b5 79     
            sec                ; $e662: 38        
            sbc #$0c           ; $e663: e9 0c     
            sta $0707,y        ; $e665: 99 07 07  
            clc                ; $e668: 18        
            adc #$08           ; $e669: 69 08     
            sta $070b,y        ; $e66b: 99 0b 07  
            clc                ; $e66e: 18        
            adc #$08           ; $e66f: 69 08     
            sta $070f,y        ; $e671: 99 0f 07  
__e674:     jmp __e41b         ; $e674: 4c 1b e4  

;-------------------------------------------------------------------------------
__e677:     lda $79,x          ; $e677: b5 79     
            clc                ; $e679: 18        
            adc #$04           ; $e67a: 69 04     
            sta $0703,y        ; $e67c: 99 03 07  
            sec                ; $e67f: 38        
            sbc #$08           ; $e680: e9 08     
            sta $0707,y        ; $e682: 99 07 07  
            ldy $1c            ; $e685: a4 1c     
            sec                ; $e687: 38        
            sbc #$08           ; $e688: e9 08     
            sta $0703,y        ; $e68a: 99 03 07  
            lda $029b,x        ; $e68d: bd 9b 02  
            cmp #$03           ; $e690: c9 03     
            bcc __e6a8         ; $e692: 90 14     
            lda $79,x          ; $e694: b5 79     
            clc                ; $e696: 18        
            adc #$04           ; $e697: 69 04     
            sta $0707,y        ; $e699: 99 07 07  
            sec                ; $e69c: 38        
            sbc #$08           ; $e69d: e9 08     
            sta $070b,y        ; $e69f: 99 0b 07  
            sec                ; $e6a2: 38        
            sbc #$08           ; $e6a3: e9 08     
            sta $070f,y        ; $e6a5: 99 0f 07  
__e6a8:     jmp __e41b         ; $e6a8: 4c 1b e4  

;-------------------------------------------------------------------------------
__e6ab:     ldy $18            ; $e6ab: a4 18     
            lda $029b,x        ; $e6ad: bd 9b 02  
            cmp #$05           ; $e6b0: c9 05     
            beq __e6ba         ; $e6b2: f0 06     
            lda $86,x          ; $e6b4: b5 86     
            cmp #$03           ; $e6b6: c9 03     
            beq __e6e0         ; $e6b8: f0 26     
__e6ba:     lda $79,x          ; $e6ba: b5 79     
            sta $0707,y        ; $e6bc: 99 07 07  
            sec                ; $e6bf: 38        
            sbc #$08           ; $e6c0: e9 08     
            sta $0703,y        ; $e6c2: 99 03 07  
            lda $029b,x        ; $e6c5: bd 9b 02  
            cmp #$05           ; $e6c8: c9 05     
            beq __e6dd         ; $e6ca: f0 11     
            cmp #$02           ; $e6cc: c9 02     
            bcc __e6dd         ; $e6ce: 90 0d     
            ldy $1c            ; $e6d0: a4 1c     
            lda $79,x          ; $e6d2: b5 79     
            sta $0707,y        ; $e6d4: 99 07 07  
            sec                ; $e6d7: 38        
            sbc #$08           ; $e6d8: e9 08     
            sta $0703,y        ; $e6da: 99 03 07  
__e6dd:     jmp __e41b         ; $e6dd: 4c 1b e4  

;-------------------------------------------------------------------------------
__e6e0:     lda $79,x          ; $e6e0: b5 79     
            sta $0703,y        ; $e6e2: 99 03 07  
            sec                ; $e6e5: 38        
            sbc #$08           ; $e6e6: e9 08     
            sta $0707,y        ; $e6e8: 99 07 07  
            lda $029b,x        ; $e6eb: bd 9b 02  
            cmp #$02           ; $e6ee: c9 02     
            bcc __e6ff         ; $e6f0: 90 0d     
            ldy $1c            ; $e6f2: a4 1c     
            lda $79,x          ; $e6f4: b5 79     
            sta $0703,y        ; $e6f6: 99 03 07  
            sec                ; $e6f9: 38        
            sbc #$08           ; $e6fa: e9 08     
            sta $0707,y        ; $e6fc: 99 07 07  
__e6ff:     jmp __e41b         ; $e6ff: 4c 1b e4  

;-------------------------------------------------------------------------------
__e702:     lda #$1f           ; $e702: a9 1f     
            sta $2006          ; $e704: 8d 06 20  
            lda #$f0           ; $e707: a9 f0     
            sta $2006          ; $e709: 8d 06 20  
            lda $2007          ; $e70c: ad 07 20  
            ldx #$10           ; $e70f: a2 10     
            lda #$00           ; $e711: a9 00     
__e713:     ora $2007          ; $e713: 0d 07 20  
            dex                ; $e716: ca        
            bne __e713         ; $e717: d0 fa     
__e719:     asl                ; $e719: 0a        
            beq __e721         ; $e71a: f0 05     
            bcc __e719         ; $e71c: 90 fb     
            inx                ; $e71e: e8        
            bne __e719         ; $e71f: d0 f8     
__e721:     cpx #$04           ; $e721: e0 04     
            bcc __e728         ; $e723: 90 03     
            jmp ($fffc)        ; $e725: 6c fc ff  

;-------------------------------------------------------------------------------
__e728:     rts                ; $e728: 60        

;-------------------------------------------------------------------------------
__e729:     lda $05f4          ; $e729: ad f4 05  
            bne __e753         ; $e72c: d0 25     
            ldx #$05           ; $e72e: a2 05     
__e730:     lda $04,x          ; $e730: b5 04     
            bne __e753         ; $e732: d0 1f     
            dex                ; $e734: ca        
            bne __e730         ; $e735: d0 f9     
            lda $04            ; $e737: a5 04     
            cmp #$02           ; $e739: c9 02     
            bne __e753         ; $e73b: d0 16     
            lda $0259          ; $e73d: ad 59 02  
            cmp #$0e           ; $e740: c9 0e     
            bne __e753         ; $e742: d0 0f     
            lda $2e            ; $e744: a5 2e     
            cmp #$01           ; $e746: c9 01     
            bne __e753         ; $e748: d0 09     
            lda $2f            ; $e74a: a5 2f     
            cmp #$02           ; $e74c: c9 02     
__e74e:     .hex d0            ; $e74e: d0            Data
__e74f:     .hex 03 ee f4 05   ; $e74f: 03 ee f4 05   Data

;-------------------------------------------------------------------------------
__e753:     rts                ; $e753: 60        

;-------------------------------------------------------------------------------
            .hex 74 e7 7a e7   ; $e754: 74 e7 7a e7   Data
            .hex 82 e7 8c e7   ; $e758: 82 e7 8c e7   Data
            .hex 98 e7         ; $e75c: 98 e7         Data
__e75e:     .hex a6            ; $e75e: a6            Data
__e75f:     .hex e7 b6 e7 c8   ; $e75f: e7 b6 e7 c8   Data
            .hex e7 77 e7 7e   ; $e763: e7 77 e7 7e   Data
            .hex e7 87 e7 92   ; $e767: e7 87 e7 92   Data
            .hex e7 9f e7 ae   ; $e76b: e7 9f e7 ae   Data
            .hex e7 bf e7 d2   ; $e76f: e7 bf e7 d2   Data
            .hex e7 98 a8 b8   ; $e773: e7 98 a8 b8   Data
            .hex 88 80 78 a0   ; $e777: 88 80 78 a0   Data
            .hex a0 b0 b0 78   ; $e77b: a0 b0 b0 78   Data
            .hex 88 78 88 98   ; $e77f: 88 78 88 98   Data
            .hex 98 a8 b8 b8   ; $e783: 98 a8 b8 b8   Data
            .hex 78 88 80 78   ; $e787: 78 88 80 78   Data
            .hex 88 98 98 a8   ; $e78b: 88 98 98 a8   Data
            .hex a8 b8 b8 78   ; $e78f: a8 b8 b8 78   Data
            .hex 88 78 88 78   ; $e793: 88 78 88 78   Data
            .hex 88 90 98 a0   ; $e797: 88 90 98 a0   Data
            .hex b0 b0 c0 c0   ; $e79b: b0 b0 c0 c0   Data
            .hex 90 80 70 78   ; $e79f: 90 80 70 78   Data
            .hex 88 78 88 90   ; $e7a3: 88 78 88 90   Data
            .hex 90 a0 a0 b0   ; $e7a7: 90 a0 a0 b0   Data
            .hex b0 c0 c0 78   ; $e7ab: b0 c0 c0 78   Data
            .hex 88 78 88 78   ; $e7af: 88 78 88 78   Data
            .hex 88 78 88 98   ; $e7b3: 88 78 88 98   Data
            .hex 98 98 a8 a8   ; $e7b7: 98 98 a8 a8   Data
            .hex a8 b8 b8 b8   ; $e7bb: a8 b8 b8 b8   Data
            .hex 70 80 90 70   ; $e7bf: 70 80 90 70   Data
            .hex 80 90 70 80   ; $e7c3: 80 90 70 80   Data
            .hex 90 90 a0 a0   ; $e7c7: 90 90 a0 a0   Data
            .hex b0 b0 b0 c0   ; $e7cb: b0 b0 b0 c0   Data
            .hex c0 c0 c0 80   ; $e7cf: c0 c0 c0 80   Data
            .hex 78 88 70 80   ; $e7d3: 78 88 70 80   Data
            .hex 90 68 78 88   ; $e7d7: 90 68 78 88   Data
            .hex 98            ; $e7db: 98            Data

;-------------------------------------------------------------------------------
__e7dc:     lda #$00           ; $e7dc: a9 00     
            ldx #$0a           ; $e7de: a2 0a     
__e7e0:     sta $90,x          ; $e7e0: 95 90     
            sta $02df,x        ; $e7e2: 9d df 02  
            sta $029b,x        ; $e7e5: 9d 9b 02  
            dex                ; $e7e8: ca        
            bne __e7e0         ; $e7e9: d0 f5     
            ldx #$06           ; $e7eb: a2 06     
__e7ed:     sta $02e9,x        ; $e7ed: 9d e9 02  
            dex                ; $e7f0: ca        
            bne __e7ed         ; $e7f1: d0 fa     
            lda $0259          ; $e7f3: ad 59 02  
            asl                ; $e7f6: 0a        
            tay                ; $e7f7: a8        
            lda __9e60,y       ; $e7f8: b9 60 9e  
            sta $1b            ; $e7fb: 85 1b     
            lda __9e61,y       ; $e7fd: b9 61 9e  
            sta $1c            ; $e800: 85 1c     
            ldy #$01           ; $e802: a0 01     
            lda ($1b),y        ; $e804: b1 1b     
            sta $022a          ; $e806: 8d 2a 02  
            dey                ; $e809: 88        
            clc                ; $e80a: 18        
            adc ($1b),y        ; $e80b: 71 1b     
            sta $0229          ; $e80d: 8d 29 02  
            asl                ; $e810: 0a        
            tay                ; $e811: a8        
            lda __e74e,y       ; $e812: b9 4e e7  
            sta $1b            ; $e815: 85 1b     
            lda __e74f,y       ; $e817: b9 4f e7  
            sta $1c            ; $e81a: 85 1c     
            lda __e75e,y       ; $e81c: b9 5e e7  
            sta $1d            ; $e81f: 85 1d     
            lda __e75f,y       ; $e821: b9 5f e7  
            sta $1e            ; $e824: 85 1e     
            ldy $0229          ; $e826: ac 29 02  
__e829:     dey                ; $e829: 88        
            lda ($1b),y        ; $e82a: b1 1b     
            sta $0041,y        ; $e82c: 99 41 00  
            lda ($1d),y        ; $e82f: b1 1d     
            sta $007a,y        ; $e831: 99 7a 00  
            cpy #$00           ; $e834: c0 00     
            bne __e829         ; $e836: d0 f1     
            rts                ; $e838: 60        

;-------------------------------------------------------------------------------
__e839:     .hex d3 d4 db dc   ; $e839: d3 d4 db dc   Data
__e83d:     .hex f0 f0 55 55   ; $e83d: f0 f0 55 55   Data

;-------------------------------------------------------------------------------
__e841:     lda $0243          ; $e841: ad 43 02  
            beq __e84f         ; $e844: f0 09     
            cmp #$02           ; $e846: c9 02     
            beq __e852         ; $e848: f0 08     
            bcs __e895         ; $e84a: b0 49     
            jmp __e9d1         ; $e84c: 4c d1 e9  

;-------------------------------------------------------------------------------
__e84f:     jmp __e8ed         ; $e84f: 4c ed e8  

;-------------------------------------------------------------------------------
__e852:     ldx $02c7          ; $e852: ae c7 02  
            lda $05f2,x        ; $e855: bd f2 05  
            beq __e864         ; $e858: f0 0a     
            lda $2d            ; $e85a: a5 2d     
            eor $2c            ; $e85c: 45 2c     
            and $2d            ; $e85e: 25 2d     
            and #$03           ; $e860: 29 03     
            beq __e896         ; $e862: f0 32     
__e864:     ldx #$00           ; $e864: a2 00     
__e866:     lda #$23           ; $e866: a9 23     
            sta $0260,x        ; $e868: 9d 60 02  
            lda __e839,x       ; $e86b: bd 39 e8  
            sta $0270,x        ; $e86e: 9d 70 02  
            lda __e83d,x       ; $e871: bd 3d e8  
            sta $0280,x        ; $e874: 9d 80 02  
            inx                ; $e877: e8        
            cpx #$04           ; $e878: e0 04     
            bne __e866         ; $e87a: d0 ea     
            dex                ; $e87c: ca        
            stx $0243          ; $e87d: 8e 43 02  
            lda #$f0           ; $e880: a9 f0     
            sta $022d          ; $e882: 8d 2d 02  
            lda #$00           ; $e885: a9 00     
            sta $022e          ; $e887: 8d 2e 02  
            jsr __e7dc         ; $e88a: 20 dc e7  
            lda #$01           ; $e88d: a9 01     
            sta $062d          ; $e88f: 8d 2d 06  
            sta $062e          ; $e892: 8d 2e 06  
__e895:     rts                ; $e895: 60        

;-------------------------------------------------------------------------------
__e896:     lda #$02           ; $e896: a9 02     
            sta $022d          ; $e898: 8d 2d 02  
            ldx $02c7          ; $e89b: ae c7 02  
            lda $2d            ; $e89e: a5 2d     
            eor $2c            ; $e8a0: 45 2c     
            and $2d            ; $e8a2: 25 2d     
            and #$10           ; $e8a4: 29 10     
            bne __e8b8         ; $e8a6: d0 10     
            lda $2d            ; $e8a8: a5 2d     
            and #$10           ; $e8aa: 29 10     
            beq __e8c4         ; $e8ac: f0 16     
            lda $04fa          ; $e8ae: ad fa 04  
            bne __e8c3         ; $e8b1: d0 10     
            lda #$06           ; $e8b3: a9 06     
            sta $04fa          ; $e8b5: 8d fa 04  

;-------------------------------------------------------------------------------
__e8b8:     lda $0259          ; $e8b8: ad 59 02  
            cmp $05f2,x        ; $e8bb: dd f2 05  
            bcs __e8c3         ; $e8be: b0 03     
            inc $0259          ; $e8c0: ee 59 02  
__e8c3:     rts                ; $e8c3: 60        

;-------------------------------------------------------------------------------
__e8c4:     lda $2d            ; $e8c4: a5 2d     
            eor $2c            ; $e8c6: 45 2c     
            and $2d            ; $e8c8: 25 2d     
            and #$20           ; $e8ca: 29 20     
            bne __e8de         ; $e8cc: d0 10     
            lda $2d            ; $e8ce: a5 2d     
            and #$20           ; $e8d0: 29 20     
            beq __e8e7         ; $e8d2: f0 13     
            lda $04fa          ; $e8d4: ad fa 04  
            bne __e8e6         ; $e8d7: d0 0d     
            lda #$06           ; $e8d9: a9 06     
            sta $04fa          ; $e8db: 8d fa 04  

;-------------------------------------------------------------------------------
__e8de:     lda $0259          ; $e8de: ad 59 02  
            beq __e8e6         ; $e8e1: f0 03     
            dec $0259          ; $e8e3: ce 59 02  
__e8e6:     rts                ; $e8e6: 60        

;-------------------------------------------------------------------------------
__e8e7:     lda #$1e           ; $e8e7: a9 1e     
            sta $04fa          ; $e8e9: 8d fa 04  
            rts                ; $e8ec: 60        

;-------------------------------------------------------------------------------
__e8ed:     lda $28            ; $e8ed: a5 28     
            and #$01           ; $e8ef: 29 01     
            beq __e91b         ; $e8f1: f0 28     
            lda $2e            ; $e8f3: a5 2e     
            eor $04fe          ; $e8f5: 4d fe 04  
            and $2e            ; $e8f8: 25 2e     
            and #$0c           ; $e8fa: 29 0c     
            beq __e911         ; $e8fc: f0 13     
            dec $28            ; $e8fe: c6 28     
            lda #$00           ; $e900: a9 00     
            sta $29            ; $e902: 85 29     
            lda #$51           ; $e904: a9 51     
            sta $022d          ; $e906: 8d 2d 02  
            lda #$02           ; $e909: a9 02     
            sta $022e          ; $e90b: 8d 2e 02  
__e90e:     jmp __e9b2         ; $e90e: 4c b2 e9  

;-------------------------------------------------------------------------------
__e911:     inc $29            ; $e911: e6 29     
            lda $29            ; $e913: a5 29     
            bne __e90e         ; $e915: d0 f7     
            dec $28            ; $e917: c6 28     
            bne __e90e         ; $e919: d0 f3     
__e91b:     lda $2e            ; $e91b: a5 2e     
            eor $04fe          ; $e91d: 4d fe 04  
            and $2e            ; $e920: 25 2e     
            cmp #$0d           ; $e922: c9 0d     
            beq __e944         ; $e924: f0 1e     
            and #$0c           ; $e926: 29 0c     
            beq __e90e         ; $e928: f0 e4     
            cmp #$08           ; $e92a: c9 08     
            beq __e94c         ; $e92c: f0 1e     
            lda #$51           ; $e92e: a9 51     
            sta $022d          ; $e930: 8d 2d 02  
            lda #$02           ; $e933: a9 02     
            sta $022e          ; $e935: 8d 2e 02  
            lda $16            ; $e938: a5 16     
            beq __e940         ; $e93a: f0 04     
            dec $16            ; $e93c: c6 16     
            beq __e9af         ; $e93e: f0 6f     
__e940:     inc $16            ; $e940: e6 16     
            bne __e9af         ; $e942: d0 6b     

;-------------------------------------------------------------------------------
__e944:     lda #$47           ; $e944: a9 47     
            sta $05f2          ; $e946: 8d f2 05  
            sta $05f3          ; $e949: 8d f3 05  

;-------------------------------------------------------------------------------
__e94c:     lda $05f0          ; $e94c: ad f0 05  
            sta $05f5          ; $e94f: 8d f5 05  
            lda $05f1          ; $e952: ad f1 05  
            sta $05f6          ; $e955: 8d f6 05  
            lda #$ff           ; $e958: a9 ff     
            sta $0259          ; $e95a: 8d 59 02  
            lda #$03           ; $e95d: a9 03     
            sta $02c9          ; $e95f: 8d c9 02  
            sta $02ca          ; $e962: 8d ca 02  
            lda #$00           ; $e965: a9 00     
            sta $04fc          ; $e967: 8d fc 04  
            sta $022f          ; $e96a: 8d 2f 02  
            sta $0295          ; $e96d: 8d 95 02  
            sta $0296          ; $e970: 8d 96 02  
            sta $0297          ; $e973: 8d 97 02  
            sta $0298          ; $e976: 8d 98 02  
            sta $022c          ; $e979: 8d 2c 02  
            sta $02c7          ; $e97c: 8d c7 02  
            sta $04f6          ; $e97f: 8d f6 04  
            sta $04f7          ; $e982: 8d f7 04  
            sta $0611          ; $e985: 8d 11 06  
            sta $0612          ; $e988: 8d 12 06  
            sta $0613          ; $e98b: 8d 13 06  
            ldx #$06           ; $e98e: a2 06     
__e990:     dex                ; $e990: ca        
            sta $04,x          ; $e991: 95 04     
            sta $0a,x          ; $e993: 95 0a     
            sta $1f,x          ; $e995: 95 1f     
            bne __e990         ; $e997: d0 f7     
            inx                ; $e999: e8        
            stx $f8            ; $e99a: 86 f8     
            stx $025b          ; $e99c: 8e 5b 02  
            stx $04fb          ; $e99f: 8e fb 04  
            inx                ; $e9a2: e8        
            stx $0243          ; $e9a3: 8e 43 02  
            lda #$ef           ; $e9a6: a9 ef     
            sta $0292          ; $e9a8: 8d 92 02  
            lda #$fe           ; $e9ab: a9 fe     
            sta $f7            ; $e9ad: 85 f7     
__e9af:     jmp __ea34         ; $e9af: 4c 34 ea  

;-------------------------------------------------------------------------------
__e9b2:     lda $022d          ; $e9b2: ad 2d 02  
            ora $022e          ; $e9b5: 0d 2e 02  
            bne __e9af         ; $e9b8: d0 f5     
            sta $02db          ; $e9ba: 8d db 02  
            sta $02cb          ; $e9bd: 8d cb 02  
            sta $02cc          ; $e9c0: 8d cc 02  
            lda #$02           ; $e9c3: a9 02     
            sta $0259          ; $e9c5: 8d 59 02  
            lda #$07           ; $e9c8: a9 07     
            sta $022e          ; $e9ca: 8d 2e 02  
            inc $0243          ; $e9cd: ee 43 02  
            rts                ; $e9d0: 60        

;-------------------------------------------------------------------------------
__e9d1:     lda $2e            ; $e9d1: a5 2e     
            eor $04fe          ; $e9d3: 4d fe 04  
            and $2e            ; $e9d6: 25 2e     
            and #$0c           ; $e9d8: 29 0c     
            bne __ea02         ; $e9da: d0 26     
            lda $03e2          ; $e9dc: ad e2 03  
            ora $0295          ; $e9df: 0d 95 02  
            ora $0296          ; $e9e2: 0d 96 02  
            ora $022c          ; $e9e5: 0d 2c 02  
            bne __ea34         ; $e9e8: d0 4a     
            lda $022f          ; $e9ea: ad 2f 02  
            beq __e9fe         ; $e9ed: f0 0f     
            lda $0291          ; $e9ef: ad 91 02  
            cmp #$01           ; $e9f2: c9 01     
            beq __e9fe         ; $e9f4: f0 08     
            lda $022d          ; $e9f6: ad 2d 02  
            ora $022e          ; $e9f9: 0d 2e 02  
            bne __ea34         ; $e9fc: d0 36     

;-------------------------------------------------------------------------------
__e9fe:     lda #$b5           ; $e9fe: a9 b5     
            bne __ea04         ; $ea00: d0 02     
__ea02:     lda #$b4           ; $ea02: a9 b4     
__ea04:     sta $28            ; $ea04: 85 28     
            ldx #$00           ; $ea06: a2 00     
            stx $025b          ; $ea08: 8e 5b 02  
            stx $0291          ; $ea0b: 8e 91 02  
            stx $022f          ; $ea0e: 8e 2f 02  
            stx $0243          ; $ea11: 8e 43 02  
            stx $02db          ; $ea14: 8e db 02  
            stx $022c          ; $ea17: 8e 2c 02  
            stx $03e2          ; $ea1a: 8e e2 03  
            stx $02ea          ; $ea1d: 8e ea 02  
            inx                ; $ea20: e8        
            stx $91            ; $ea21: 86 91     
            inx                ; $ea23: e8        
            stx $022e          ; $ea24: 8e 2e 02  
            lda #$51           ; $ea27: a9 51     
            sta $022d          ; $ea29: 8d 2d 02  
            lda #$ef           ; $ea2c: a9 ef     
            sta $0292          ; $ea2e: 8d 92 02  
            jsr __ac8b         ; $ea31: 20 8b ac  
__ea34:     ldx $0243          ; $ea34: ae 43 02  
            bne __ea89         ; $ea37: d0 50     
            stx $0245          ; $ea39: 8e 45 02  
            stx $029c          ; $ea3c: 8e 9c 02  
            stx $022a          ; $ea3f: 8e 2a 02  
            stx $02e0          ; $ea42: 8e e0 02  
            inx                ; $ea45: e8        
            stx $0229          ; $ea46: 8e 29 02  
            lda #$03           ; $ea49: a9 03     
            sta $02c9          ; $ea4b: 8d c9 02  
            lda $28            ; $ea4e: a5 28     
            and #$03           ; $ea50: 29 03     
            bne __ea61         ; $ea52: d0 0d     
            lda $26            ; $ea54: a5 26     
            and #$40           ; $ea56: 29 40     
            sta $022c          ; $ea58: 8d 2c 02  
            lda #$00           ; $ea5b: a9 00     
            sta $87            ; $ea5d: 85 87     
            beq __ea6f         ; $ea5f: f0 0e     
__ea61:     lda #$03           ; $ea61: a9 03     
            sta $87            ; $ea63: 85 87     
            lda #$48           ; $ea65: a9 48     
            cmp $29            ; $ea67: c5 29     
            bcc __ea6f         ; $ea69: 90 04     
            lda #$01           ; $ea6b: a9 01     
            bne __ea71         ; $ea6d: d0 02     
__ea6f:     lda #$00           ; $ea6f: a9 00     
__ea71:     sta $91            ; $ea71: 85 91     
            lda $16            ; $ea73: a5 16     
            beq __ea7b         ; $ea75: f0 04     
            lda #$8a           ; $ea77: a9 8a     
            bne __ea7d         ; $ea79: d0 02     
__ea7b:     lda #$7a           ; $ea7b: a9 7a     
__ea7d:     sta $41            ; $ea7d: 85 41     
            lda #$48           ; $ea7f: a9 48     
            sec                ; $ea81: 38        
            sbc $29            ; $ea82: e5 29     
            sta $7a            ; $ea84: 85 7a     
            jsr __c73e         ; $ea86: 20 3e c7  
__ea89:     rts                ; $ea89: 60        

;-------------------------------------------------------------------------------
__ea8a:     lda #$00           ; $ea8a: a9 00     
            sta $19            ; $ea8c: 85 19     
            ldx #$09           ; $ea8e: a2 09     
__ea90:     lda $0400,x        ; $ea90: bd 00 04  
            and #$d0           ; $ea93: 29 d0     
            cmp #$80           ; $ea95: c9 80     
            beq __ea9b         ; $ea97: f0 02     
            inc $19            ; $ea99: e6 19     
__ea9b:     inx                ; $ea9b: e8        
            cpx #$70           ; $ea9c: e0 70     
            bne __ea90         ; $ea9e: d0 f0     
            ldx $19            ; $eaa0: a6 19     
            dex                ; $eaa2: ca        
            cpx $022f          ; $eaa3: ec 2f 02  
            bcs __eaac         ; $eaa6: b0 04     
            lda #$01           ; $eaa8: a9 01     
            bne __eaae         ; $eaaa: d0 02     
__eaac:     lda #$00           ; $eaac: a9 00     
__eaae:     sta $19            ; $eaae: 85 19     
            lda $0259          ; $eab0: ad 59 02  
            asl                ; $eab3: 0a        
            tay                ; $eab4: a8        
            lda __9e60,y       ; $eab5: b9 60 9e  
            sta $1b            ; $eab8: 85 1b     
            lda __9e61,y       ; $eaba: b9 61 9e  
            sta $1c            ; $eabd: 85 1c     
            ldx #$00           ; $eabf: a2 00     
            ldy #$0c           ; $eac1: a0 0c     
            sty $17            ; $eac3: 84 17     
__eac5:     lda $19            ; $eac5: a5 19     
            bne __eae3         ; $eac7: d0 1a     
            lda $0244,x        ; $eac9: bd 44 02  
            cmp #$01           ; $eacc: c9 01     
            beq __eaeb         ; $eace: f0 1b     
            lda $02b1,x        ; $ead0: bd b1 02  
            bne __ead9         ; $ead3: d0 04     
            ldy $17            ; $ead5: a4 17     
            lda ($1b),y        ; $ead7: b1 1b     
__ead9:     tay                ; $ead9: a8        
            lda $0400,y        ; $eada: b9 00 04  
            and #$d0           ; $eadd: 29 d0     
            cmp #$80           ; $eadf: c9 80     
            bne __eae7         ; $eae1: d0 04     
__eae3:     lda #$80           ; $eae3: a9 80     
            bne __eae8         ; $eae5: d0 01     
__eae7:     tya                ; $eae7: 98        
__eae8:     sta $02b1,x        ; $eae8: 9d b1 02  
__eaeb:     cpx $0229          ; $eaeb: ec 29 02  
            beq __eaf5         ; $eaee: f0 05     
            inx                ; $eaf0: e8        
            inc $17            ; $eaf1: e6 17     
            bne __eac5         ; $eaf3: d0 d0     
__eaf5:     ldx #$00           ; $eaf5: a2 00     
__eaf7:     lda $02b1,x        ; $eaf7: bd b1 02  
            bpl __eb5b         ; $eafa: 10 5f     
            ror $022b          ; $eafc: 6e 2b 02  
            lda $022b          ; $eaff: ad 2b 02  
            sta $18            ; $eb02: 85 18     
__eb04:     lda $18            ; $eb04: a5 18     
            clc                ; $eb06: 18        
            adc #$03           ; $eb07: 69 03     
            sta $18            ; $eb09: 85 18     
            and #$07           ; $eb0b: 29 07     
            beq __eb04         ; $eb0d: f0 f5     
            cmp #$07           ; $eb0f: c9 07     
            beq __eb04         ; $eb11: f0 f1     
            lda $18            ; $eb13: a5 18     
            and #$78           ; $eb15: 29 78     
            beq __eb04         ; $eb17: f0 eb     
            cmp #$70           ; $eb19: c9 70     
            beq __eb04         ; $eb1b: f0 e7     
            lda $18            ; $eb1d: a5 18     
            and #$7f           ; $eb1f: 29 7f     
            sta $18            ; $eb21: 85 18     
            tay                ; $eb23: a8        
            lda $0400,y        ; $eb24: b9 00 04  
            and #$d0           ; $eb27: 29 d0     
            cmp #$80           ; $eb29: c9 80     
            beq __eb04         ; $eb2b: f0 d7     
            lda $19            ; $eb2d: a5 19     
            beq __eb3e         ; $eb2f: f0 0d     
            cpx #$00           ; $eb31: e0 00     
            beq __eb56         ; $eb33: f0 21     
            lda $18            ; $eb35: a5 18     
            cmp $02b1          ; $eb37: cd b1 02  
            beq __eb04         ; $eb3a: f0 c8     
            bne __eb56         ; $eb3c: d0 18     
__eb3e:     ldy #$00           ; $eb3e: a0 00     
__eb40:     lda $0244,y        ; $eb40: b9 44 02  
            cmp #$01           ; $eb43: c9 01     
            beq __eb4e         ; $eb45: f0 07     
            lda $18            ; $eb47: a5 18     
            cmp $02b1,y        ; $eb49: d9 b1 02  
            beq __eb04         ; $eb4c: f0 b6     
__eb4e:     cpy $0229          ; $eb4e: cc 29 02  
            beq __eb56         ; $eb51: f0 03     
            iny                ; $eb53: c8        
            bne __eb40         ; $eb54: d0 ea     
__eb56:     lda $18            ; $eb56: a5 18     
            sta $02b1,x        ; $eb58: 9d b1 02  
__eb5b:     cpx $0229          ; $eb5b: ec 29 02  
            beq __eb6b         ; $eb5e: f0 0b     
            inx                ; $eb60: e8        
            lda $0244,x        ; $eb61: bd 44 02  
            cmp #$01           ; $eb64: c9 01     
            beq __eb5b         ; $eb66: f0 f3     
            jmp __eaf7         ; $eb68: 4c f7 ea  

;-------------------------------------------------------------------------------
__eb6b:     rts                ; $eb6b: 60        

;-------------------------------------------------------------------------------
__eb6c:     .hex 00 00 00 01   ; $eb6c: 00 00 00 01   Data
            .hex 01 02 02 03   ; $eb70: 01 02 02 03   Data
            .hex 03 04 04 05   ; $eb74: 03 04 04 05   Data
            .hex 05 06 06 07   ; $eb78: 05 06 06 07   Data
__eb7c:     .hex 04 06 08      ; $eb7c: 04 06 08      Data

;-------------------------------------------------------------------------------
__eb7f:     lda $f9            ; $eb7f: a5 f9     
            beq __eb84         ; $eb81: f0 01     
            rts                ; $eb83: 60        

;-------------------------------------------------------------------------------
__eb84:     lda $04fc          ; $eb84: ad fc 04  
            cmp #$05           ; $eb87: c9 05     
            bne __eb97         ; $eb89: d0 0c     
            ora #$80           ; $eb8b: 09 80     
            sta $04fc          ; $eb8d: 8d fc 04  
            lda #$00           ; $eb90: a9 00     
            sta $024f          ; $eb92: 8d 4f 02  
            beq __ebad         ; $eb95: f0 16     
__eb97:     lda $03e2          ; $eb97: ad e2 03  
            cmp #$01           ; $eb9a: c9 01     
            beq __eba0         ; $eb9c: f0 02     
            bne __ebaa         ; $eb9e: d0 0a     
__eba0:     inc $025c          ; $eba0: ee 5c 02  
            lda $025c          ; $eba3: ad 5c 02  
            cmp #$03           ; $eba6: c9 03     
            beq __ebad         ; $eba8: f0 03     
__ebaa:     jmp __ec45         ; $ebaa: 4c 45 ec  

;-------------------------------------------------------------------------------
__ebad:     lda #$00           ; $ebad: a9 00     
            sta $18            ; $ebaf: 85 18     
__ebb1:     lda #$00           ; $ebb1: a9 00     
            sta $17            ; $ebb3: 85 17     
            ldx #$08           ; $ebb5: a2 08     
__ebb7:     inx                ; $ebb7: e8        
            cpx #$6f           ; $ebb8: e0 6f     
            bcs __ebd8         ; $ebba: b0 1c     
            txa                ; $ebbc: 8a        
            and #$07           ; $ebbd: 29 07     
            beq __ebb7         ; $ebbf: f0 f6     
            cmp #$07           ; $ebc1: c9 07     
            beq __ebb7         ; $ebc3: f0 f2     
            lda $0400,x        ; $ebc5: bd 00 04  
            and #$d0           ; $ebc8: 29 d0     
            cmp #$80           ; $ebca: c9 80     
            beq __ebb7         ; $ebcc: f0 e9     
            inc $17            ; $ebce: e6 17     
            lda $17            ; $ebd0: a5 17     
            cmp $18            ; $ebd2: c5 18     
            beq __ebdf         ; $ebd4: f0 09     
            bne __ebb7         ; $ebd6: d0 df     
__ebd8:     lda $17            ; $ebd8: a5 17     
            lsr                ; $ebda: 4a        
            sta $18            ; $ebdb: 85 18     
            bne __ebb1         ; $ebdd: d0 d2     
__ebdf:     lda #$00           ; $ebdf: a9 00     
            sta $17            ; $ebe1: 85 17     
            sta $19            ; $ebe3: 85 19     
            sta $9b            ; $ebe5: 85 9b     
            txa                ; $ebe7: 8a        
            and #$78           ; $ebe8: 29 78     
            clc                ; $ebea: 18        
            adc #$08           ; $ebeb: 69 08     
            asl                ; $ebed: 0a        
            asl                ; $ebee: 0a        
            rol $17            ; $ebef: 26 17     
            sta $18            ; $ebf1: 85 18     
            lda $28            ; $ebf3: a5 28     
            lsr                ; $ebf5: 4a        
            bcc __ebfa         ; $ebf6: 90 02     
            dec $17            ; $ebf8: c6 17     
__ebfa:     lda $18            ; $ebfa: a5 18     
            sec                ; $ebfc: 38        
            sbc $29            ; $ebfd: e5 29     
            sta $84            ; $ebff: 85 84     
            beq __ec13         ; $ec01: f0 10     
            bcc __ec0d         ; $ec03: 90 08     
            lda $17            ; $ec05: a5 17     
            beq __ec1d         ; $ec07: f0 14     
            bpl __ec17         ; $ec09: 10 0c     
            bmi __ec1b         ; $ec0b: 30 0e     
__ec0d:     lda $17            ; $ec0d: a5 17     
            bne __ec1d         ; $ec0f: d0 0c     
            beq __ec1b         ; $ec11: f0 08     

;-------------------------------------------------------------------------------
__ec13:     lda $17            ; $ec13: a5 17     
            beq __ec1b         ; $ec15: f0 04     
__ec17:     inc $9b            ; $ec17: e6 9b     
            bne __ec1d         ; $ec19: d0 02     
__ec1b:     dec $9b            ; $ec1b: c6 9b     
__ec1d:     lda $0400,x        ; $ec1d: bd 00 04  
            cmp #$80           ; $ec20: c9 80     
            bcc __ec2a         ; $ec22: 90 06     
            and #$a2           ; $ec24: 29 a2     
            cmp #$a0           ; $ec26: c9 a0     
            bne __ec2e         ; $ec28: d0 04     
__ec2a:     lda #$10           ; $ec2a: a9 10     
            sta $19            ; $ec2c: 85 19     
__ec2e:     txa                ; $ec2e: 8a        
            ror                ; $ec2f: 6a        
            ror                ; $ec30: 6a        
            ror                ; $ec31: 6a        
            ror                ; $ec32: 6a        
            and #$e0           ; $ec33: 29 e0     
            clc                ; $ec35: 18        
            adc $19            ; $ec36: 65 19     
            sta $4b            ; $ec38: 85 4b     
            lda #$02           ; $ec3a: a9 02     
            sta $025e          ; $ec3c: 8d 5e 02  
            lda #$00           ; $ec3f: a9 00     
            sta $025d          ; $ec41: 8d 5d 02  
            rts                ; $ec44: 60        

;-------------------------------------------------------------------------------
__ec45:     lda $025e          ; $ec45: ad 5e 02  
            ora $025d          ; $ec48: 0d 5d 02  
            ora $024f          ; $ec4b: 0d 4f 02  
            bne __ec66         ; $ec4e: d0 16     
            lda $04fc          ; $ec50: ad fc 04  
            cmp #$85           ; $ec53: c9 85     
            bne __ec5c         ; $ec55: d0 05     
            lda #$00           ; $ec57: a9 00     
            sta $04fc          ; $ec59: 8d fc 04  
__ec5c:     lda #$00           ; $ec5c: a9 00     
            sta $025f          ; $ec5e: 8d 5f 02  
            lda #$ef           ; $ec61: a9 ef     
            sta $4b            ; $ec63: 85 4b     
            rts                ; $ec65: 60        

;-------------------------------------------------------------------------------
__ec66:     ldx #$0b           ; $ec66: a2 0b     
            stx $0241          ; $ec68: 8e 41 02  
            lda $84            ; $ec6b: a5 84     
            sta $17            ; $ec6d: 85 17     
            lda $2a            ; $ec6f: a5 2a     
            sec                ; $ec71: 38        
            sbc $29            ; $ec72: e5 29     
            beq __ec8b         ; $ec74: f0 15     
            bpl __ec83         ; $ec76: 10 0b     
            clc                ; $ec78: 18        
            adc $84            ; $ec79: 65 84     
            sta $84            ; $ec7b: 85 84     
            jsr __c721         ; $ec7d: 20 21 c7  
            jmp __ec8b         ; $ec80: 4c 8b ec  

;-------------------------------------------------------------------------------
__ec83:     clc                ; $ec83: 18        
            adc $84            ; $ec84: 65 84     
            sta $84            ; $ec86: 85 84     
            jsr __c704         ; $ec88: 20 04 c7  
__ec8b:     lda $04fc          ; $ec8b: ad fc 04  
            cmp #$85           ; $ec8e: c9 85     
            beq __ecb8         ; $ec90: f0 26     
            lda $025f          ; $ec92: ad 5f 02  
            bne __ed12         ; $ec95: d0 7b     
            jsr __cfbc         ; $ec97: 20 bc cf  
            lda $0244,x        ; $ec9a: bd 44 02  
            beq __ecb8         ; $ec9d: f0 19     
            cmp #$01           ; $ec9f: c9 01     
            beq __ed12         ; $eca1: f0 6f     
            cmp #$18           ; $eca3: c9 18     
            beq __eca8         ; $eca5: f0 01     
            rts                ; $eca7: 60        

;-------------------------------------------------------------------------------
__eca8:     dec $0244,x        ; $eca8: de 44 02  
            lda $4b            ; $ecab: a5 4b     
            clc                ; $ecad: 18        
            adc #$15           ; $ecae: 69 15     
            sta $4b            ; $ecb0: 85 4b     
            lda #$01           ; $ecb2: a9 01     
            sta $061b          ; $ecb4: 8d 1b 06  
            rts                ; $ecb7: 60        

;-------------------------------------------------------------------------------
__ecb8:     lda $9b            ; $ecb8: a5 9b     
            bne __ed12         ; $ecba: d0 56     
            lda $84            ; $ecbc: a5 84     
            sec                ; $ecbe: 38        
            sbc $79            ; $ecbf: e5 79     
            bcs __ecca         ; $ecc1: b0 07     
            sta $17            ; $ecc3: 85 17     
            lda #$00           ; $ecc5: a9 00     
            sec                ; $ecc7: 38        
            sbc $17            ; $ecc8: e5 17     
__ecca:     cmp #$09           ; $ecca: c9 09     
            bcs __ed12         ; $eccc: b0 44     
            lda $4b            ; $ecce: a5 4b     
            sec                ; $ecd0: 38        
            sbc $40            ; $ecd1: e5 40     
            bcs __ecdc         ; $ecd3: b0 07     
            sta $17            ; $ecd5: 85 17     
            lda #$00           ; $ecd7: a9 00     
            sec                ; $ecd9: 38        
            sbc $17            ; $ecda: e5 17     
__ecdc:     cmp #$09           ; $ecdc: c9 09     
            bcs __ed12         ; $ecde: b0 32     
            lda $04fc          ; $ece0: ad fc 04  
            cmp #$85           ; $ece3: c9 85     
            beq __ed13         ; $ece5: f0 2c     
            lda $0259          ; $ece7: ad 59 02  
            and #$1f           ; $ecea: 29 1f     
            tax                ; $ecec: aa        
            cpx #$10           ; $eced: e0 10     
            bcc __ecf3         ; $ecef: 90 02     
            ldx #$0f           ; $ecf1: a2 0f     
__ecf3:     lda __eb6c,x       ; $ecf3: bd 6c eb  
            sta $20            ; $ecf6: 85 20     
            cpx #$03           ; $ecf8: e0 03     
            bcs __ed01         ; $ecfa: b0 05     
            lda __eb7c,x       ; $ecfc: bd 7c eb  
            sta $1f            ; $ecff: 85 1f     
__ed01:     ldx #$01           ; $ed01: a2 01     
            stx $025f          ; $ed03: 8e 5f 02  
            stx $061a          ; $ed06: 8e 1a 06  
            dex                ; $ed09: ca        
            stx $025e          ; $ed0a: 8e 5e 02  
            ldx #$5a           ; $ed0d: a2 5a     
            stx $025d          ; $ed0f: 8e 5d 02  
__ed12:     rts                ; $ed12: 60        

;-------------------------------------------------------------------------------
__ed13:     inc $02c9          ; $ed13: ee c9 02  
            ldx #$01           ; $ed16: a2 01     
            stx $0614          ; $ed18: 8e 14 06  
            dex                ; $ed1b: ca        
            stx $04fc          ; $ed1c: 8e fc 04  
            stx $025d          ; $ed1f: 8e 5d 02  
            stx $025e          ; $ed22: 8e 5e 02  
            rts                ; $ed25: 60        

;-------------------------------------------------------------------------------
__ed26:     .hex 59 5d 61 65   ; $ed26: 59 5d 61 65   Data
            .hex 65 69 69 6d   ; $ed2a: 65 69 69 6d   Data
            .hex 6d 71 71 75   ; $ed2e: 6d 71 71 75   Data
            .hex 75 79 79 7d   ; $ed32: 75 79 79 7d   Data
__ed36:     .hex 8d 99 eb 85   ; $ed36: 8d 99 eb 85   Data
            .hex 85 89 89 8b   ; $ed3a: 85 89 89 8b   Data
            .hex 8b 8d 8d 8f   ; $ed3e: 8b 8d 8d 8f   Data
            .hex 8f 99 99 e9   ; $ed42: 8f 99 99 e9   Data

;-------------------------------------------------------------------------------
__ed46:     lda #$00           ; $ed46: a9 00     
            sta $1b            ; $ed48: 85 1b     
            lda $024f          ; $ed4a: ad 4f 02  
            beq __ed8a         ; $ed4d: f0 3b     
            cmp #$19           ; $ed4f: c9 19     
            bcs __ed79         ; $ed51: b0 26     
            cmp #$01           ; $ed53: c9 01     
            bne __ed58         ; $ed55: d0 01     
            rts                ; $ed57: 60        

;-------------------------------------------------------------------------------
__ed58:     cmp #$0c           ; $ed58: c9 0c     
            bcc __ed60         ; $ed5a: 90 04     
            lda #$a8           ; $ed5c: a9 a8     
            bne __ed69         ; $ed5e: d0 09     
__ed60:     cmp #$02           ; $ed60: c9 02     
            bne __ed67         ; $ed62: d0 03     
            inc $04fc          ; $ed64: ee fc 04  
__ed67:     lda #$aa           ; $ed67: a9 aa     
__ed69:     sta $17            ; $ed69: 85 17     
            lda #$00           ; $ed6b: a9 00     
            sta $18            ; $ed6d: 85 18     
            lda #$20           ; $ed6f: a9 20     
            sta $19            ; $ed71: 85 19     
            lda #$40           ; $ed73: a9 40     
            sta $1a            ; $ed75: 85 1a     
            bne __edee         ; $ed77: d0 75     
__ed79:     lda $04f1          ; $ed79: ad f1 04  
            and #$02           ; $ed7c: 29 02     
            beq __ed84         ; $ed7e: f0 04     
            lda #$ff           ; $ed80: a9 ff     
            bne __ed86         ; $ed82: d0 02     
__ed84:     lda #$01           ; $ed84: a9 01     
__ed86:     sta $1b            ; $ed86: 85 1b     
            bne __edc7         ; $ed88: d0 3d     
__ed8a:     lda $04fc          ; $ed8a: ad fc 04  
            cmp #$85           ; $ed8d: c9 85     
            beq __ede6         ; $ed8f: f0 55     
            lda $025f          ; $ed91: ad 5f 02  
            beq __edc7         ; $ed94: f0 31     
            lda $f9            ; $ed96: a5 f9     
            bne __eda2         ; $ed98: d0 08     
            lda $4b            ; $ed9a: a5 4b     
            cmp #$20           ; $ed9c: c9 20     
            bcc __eda2         ; $ed9e: 90 02     
            dec $4b            ; $eda0: c6 4b     
__eda2:     lda $0259          ; $eda2: ad 59 02  
            and #$1f           ; $eda5: 29 1f     
            tax                ; $eda7: aa        
            cpx #$10           ; $eda8: e0 10     
            bcc __edae         ; $edaa: 90 02     
            ldx #$0f           ; $edac: a2 0f     
__edae:     lda __ed36,x       ; $edae: bd 36 ed  
            sta $17            ; $edb1: 85 17     
            cpx #$03           ; $edb3: e0 03     
            bcs __edbb         ; $edb5: b0 04     
            lda #$81           ; $edb7: a9 81     
            bne __edbd         ; $edb9: d0 02     
__edbb:     lda #$83           ; $edbb: a9 83     
__edbd:     sta $18            ; $edbd: 85 18     
            lda #$00           ; $edbf: a9 00     
            sta $19            ; $edc1: 85 19     
            sta $1a            ; $edc3: 85 1a     
            beq __edee         ; $edc5: f0 27     
__edc7:     lda #$02           ; $edc7: a9 02     
            sta $18            ; $edc9: 85 18     
            lda #$03           ; $edcb: a9 03     
            sta $19            ; $edcd: 85 19     
            lda #$00           ; $edcf: a9 00     
            sta $1a            ; $edd1: 85 1a     
            lda $0259          ; $edd3: ad 59 02  
            and #$1f           ; $edd6: 29 1f     
            tax                ; $edd8: aa        
            cpx #$10           ; $edd9: e0 10     
            bcc __eddf         ; $eddb: 90 02     
            ldx #$0f           ; $eddd: a2 0f     
__eddf:     lda __ed26,x       ; $eddf: bd 26 ed  
            sta $17            ; $ede2: 85 17     
            bne __edee         ; $ede4: d0 08     

;-------------------------------------------------------------------------------
__ede6:     lda #$86           ; $ede6: a9 86     
            sta $17            ; $ede8: 85 17     
            lda #$01           ; $edea: a9 01     
            sta $19            ; $edec: 85 19     

;-------------------------------------------------------------------------------
__edee:     ldy #$88           ; $edee: a0 88     
            lda $17            ; $edf0: a5 17     
            sta $0701,y        ; $edf2: 99 01 07  
            ldx $025f          ; $edf5: ae 5f 02  
            beq __edfe         ; $edf8: f0 04     
            lda $18            ; $edfa: a5 18     
            bne __ee01         ; $edfc: d0 03     
__edfe:     clc                ; $edfe: 18        
            adc $18            ; $edff: 65 18     
__ee01:     sta $0705,y        ; $ee01: 99 05 07  
            lda $19            ; $ee04: a5 19     
            sta $0702,y        ; $ee06: 99 02 07  
            ora $1a            ; $ee09: 05 1a     
            sta $0706,y        ; $ee0b: 99 06 07  
            lda $9b            ; $ee0e: a5 9b     
            bne __ee18         ; $ee10: d0 06     
            lda $84            ; $ee12: a5 84     
            cmp #$06           ; $ee14: c9 06     
            bcs __ee1c         ; $ee16: b0 04     
__ee18:     lda #$ef           ; $ee18: a9 ef     
            bne __ee21         ; $ee1a: d0 05     
__ee1c:     lda $4b            ; $ee1c: a5 4b     
            clc                ; $ee1e: 18        
            adc $1b            ; $ee1f: 65 1b     
__ee21:     sta $0700,y        ; $ee21: 99 00 07  
            ldx $04fc          ; $ee24: ae fc 04  
            cpx #$85           ; $ee27: e0 85     
            bne __ee2d         ; $ee29: d0 02     
            lda #$ef           ; $ee2b: a9 ef     
__ee2d:     sta $0704,y        ; $ee2d: 99 04 07  
            lda $84            ; $ee30: a5 84     
            ldx $04fc          ; $ee32: ae fc 04  
            cpx #$85           ; $ee35: e0 85     
            bne __ee3c         ; $ee37: d0 03     
            clc                ; $ee39: 18        
            adc #$04           ; $ee3a: 69 04     
__ee3c:     sta $0707,y        ; $ee3c: 99 07 07  
            sec                ; $ee3f: 38        
            sbc #$08           ; $ee40: e9 08     
            sta $0703,y        ; $ee42: 99 03 07  
            rts                ; $ee45: 60        

;-------------------------------------------------------------------------------
__ee46:     lda $f9            ; $ee46: a5 f9     
            bne __ee5b         ; $ee48: d0 11     
            lda $02ce          ; $ee4a: ad ce 02  
            bne __ee94         ; $ee4d: d0 45     
            lda $03e2          ; $ee4f: ad e2 03  
            cmp #$01           ; $ee52: c9 01     
            bne __ee5b         ; $ee54: d0 05     
            lda $02cf          ; $ee56: ad cf 02  
            bne __ee5c         ; $ee59: d0 01     
__ee5b:     rts                ; $ee5b: 60        

;-------------------------------------------------------------------------------
__ee5c:     inc $04fd          ; $ee5c: ee fd 04  
            lda #$98           ; $ee5f: a9 98     
            sta $02ce          ; $ee61: 8d ce 02  
            ldx #$70           ; $ee64: a2 70     
__ee66:     dex                ; $ee66: ca        
            lda $0370,x        ; $ee67: bd 70 03  
            beq __ee66         ; $ee6a: f0 fa     
            txa                ; $ee6c: 8a        
            and #$78           ; $ee6d: 29 78     
            clc                ; $ee6f: 18        
            adc #$08           ; $ee70: 69 08     
            asl                ; $ee72: 0a        
            asl                ; $ee73: 0a        
            sec                ; $ee74: 38        
            sbc $29            ; $ee75: e5 29     
            sta $85            ; $ee77: 85 85     
            txa                ; $ee79: 8a        
            ror                ; $ee7a: 6a        
            ror                ; $ee7b: 6a        
            ror                ; $ee7c: 6a        
            ror                ; $ee7d: 6a        
            and #$e0           ; $ee7e: 29 e0     
            clc                ; $ee80: 18        
            adc #$0c           ; $ee81: 69 0c     
            sta $4c            ; $ee83: 85 4c     
            sta $04f3          ; $ee85: 8d f3 04  
            lda #$00           ; $ee88: a9 00     
            sta $02cf          ; $ee8a: 8d cf 02  
            sta $9c            ; $ee8d: 85 9c     
            lda #$03           ; $ee8f: a9 03     
            sta $04f5          ; $ee91: 8d f5 04  
__ee94:     ldx #$0c           ; $ee94: a2 0c     
            lda $85            ; $ee96: a5 85     
            sta $17            ; $ee98: 85 17     
            lda $2a            ; $ee9a: a5 2a     
            sec                ; $ee9c: 38        
            sbc $29            ; $ee9d: e5 29     
            beq __eeb6         ; $ee9f: f0 15     
            bpl __eeae         ; $eea1: 10 0b     
            clc                ; $eea3: 18        
            adc $85            ; $eea4: 65 85     
            sta $85            ; $eea6: 85 85     
            jsr __c721         ; $eea8: 20 21 c7  
            jmp __eeb6         ; $eeab: 4c b6 ee  

;-------------------------------------------------------------------------------
__eeae:     clc                ; $eeae: 18        
            adc $85            ; $eeaf: 65 85     
            sta $85            ; $eeb1: 85 85     
            jsr __c704         ; $eeb3: 20 04 c7  
__eeb6:     lda $02ce          ; $eeb6: ad ce 02  
            cmp #$80           ; $eeb9: c9 80     
            beq __eec3         ; $eebb: f0 06     
            cmp #$81           ; $eebd: c9 81     
            beq __eef7         ; $eebf: f0 36     
            bne __eefc         ; $eec1: d0 39     
__eec3:     lda $04f1          ; $eec3: ad f1 04  
            and #$07           ; $eec6: 29 07     
            cmp #$04           ; $eec8: c9 04     
            beq __eed0         ; $eeca: f0 04     
            lda #$00           ; $eecc: a9 00     
            beq __eed2         ; $eece: f0 02     
__eed0:     lda #$01           ; $eed0: a9 01     
__eed2:     sta $04f4          ; $eed2: 8d f4 04  
            lda $04f5          ; $eed5: ad f5 04  
            sec                ; $eed8: 38        
            sbc $04f4          ; $eed9: ed f4 04  
            sta $04f5          ; $eedc: 8d f5 04  
            lda $4c            ; $eedf: a5 4c     
            sec                ; $eee1: 38        
            sbc $04f5          ; $eee2: ed f5 04  
            sta $4c            ; $eee5: 85 4c     
            cmp $04f3          ; $eee7: cd f3 04  
            bne __ef0d         ; $eeea: d0 21     
            lda #$01           ; $eeec: a9 01     
            sta $061b          ; $eeee: 8d 1b 06  
            lda #$18           ; $eef1: a9 18     
            sta $02ce          ; $eef3: 8d ce 02  
            rts                ; $eef6: 60        

;-------------------------------------------------------------------------------
__eef7:     lda #$01           ; $eef7: a9 01     
            sta $0621          ; $eef9: 8d 21 06  
__eefc:     dec $02ce          ; $eefc: ce ce 02  
            lda $02ce          ; $eeff: ad ce 02  
            and #$bf           ; $ef02: 29 bf     
            bne __ef0d         ; $ef04: d0 07     
            sta $02ce          ; $ef06: 8d ce 02  
            lda #$ef           ; $ef09: a9 ef     
            sta $4c            ; $ef0b: 85 4c     
__ef0d:     rts                ; $ef0d: 60        

;-------------------------------------------------------------------------------
__ef0e:     lda $0259          ; $ef0e: ad 59 02  
            and #$1f           ; $ef11: 29 1f     
            cmp #$07           ; $ef13: c9 07     
            bne __ef22         ; $ef15: d0 0b     
            lda $04fd          ; $ef17: ad fd 04  
            cmp #$0a           ; $ef1a: c9 0a     
            bne __ef22         ; $ef1c: d0 04     
            lda #$03           ; $ef1e: a9 03     
            bne __ef24         ; $ef20: d0 02     
__ef22:     lda #$00           ; $ef22: a9 00     
__ef24:     sta $1b            ; $ef24: 85 1b     
            lda $02ce          ; $ef26: ad ce 02  
            beq __ef3b         ; $ef29: f0 10     
            cmp #$80           ; $ef2b: c9 80     
            beq __ef52         ; $ef2d: f0 23     
            and #$7f           ; $ef2f: 29 7f     
            cmp #$40           ; $ef31: c9 40     
            bcs __ef74         ; $ef33: b0 3f     
            cmp #$0c           ; $ef35: c9 0c     
            bcc __ef40         ; $ef37: 90 07     
            bcs __ef3c         ; $ef39: b0 01     
__ef3b:     rts                ; $ef3b: 60        

;-------------------------------------------------------------------------------
__ef3c:     lda #$a8           ; $ef3c: a9 a8     
            bne __ef42         ; $ef3e: d0 02     
__ef40:     lda #$aa           ; $ef40: a9 aa     
__ef42:     sta $17            ; $ef42: 85 17     
            lda #$00           ; $ef44: a9 00     
            sta $18            ; $ef46: 85 18     
            lda #$20           ; $ef48: a9 20     
            sta $19            ; $ef4a: 85 19     
            lda #$60           ; $ef4c: a9 60     
            sta $1a            ; $ef4e: 85 1a     
            bne __ef8a         ; $ef50: d0 38     
__ef52:     lda $04f5          ; $ef52: ad f5 04  
            cmp #$02           ; $ef55: c9 02     
            bcc __ef64         ; $ef57: 90 0b     
            lda $04f1          ; $ef59: ad f1 04  
            and #$04           ; $ef5c: 29 04     
            beq __ef64         ; $ef5e: f0 04     
            lda #$ed           ; $ef60: a9 ed     
            bne __ef66         ; $ef62: d0 02     
__ef64:     lda #$f1           ; $ef64: a9 f1     
__ef66:     sta $17            ; $ef66: 85 17     
            lda #$02           ; $ef68: a9 02     
            sta $18            ; $ef6a: 85 18     
            lda $1b            ; $ef6c: a5 1b     
            sta $19            ; $ef6e: 85 19     
            sta $1a            ; $ef70: 85 1a     
            bpl __ef8a         ; $ef72: 10 16     

;-------------------------------------------------------------------------------
__ef74:     lda #$8f           ; $ef74: a9 8f     
            sta $17            ; $ef76: 85 17     
            lda $1b            ; $ef78: a5 1b     
            beq __ef80         ; $ef7a: f0 04     
            lda #$f4           ; $ef7c: a9 f4     
            bne __ef82         ; $ef7e: d0 02     
__ef80:     lda #$f2           ; $ef80: a9 f2     
__ef82:     sta $18            ; $ef82: 85 18     
            lda #$00           ; $ef84: a9 00     
            sta $19            ; $ef86: 85 19     
            sta $1a            ; $ef88: 85 1a     
__ef8a:     ldy #$08           ; $ef8a: a0 08     
            lda $17            ; $ef8c: a5 17     
            sta $0701,y        ; $ef8e: 99 01 07  
            clc                ; $ef91: 18        
            adc $18            ; $ef92: 65 18     
            sta $0705,y        ; $ef94: 99 05 07  
            lda $19            ; $ef97: a5 19     
            sta $0702,y        ; $ef99: 99 02 07  
            lda $1a            ; $ef9c: a5 1a     
            sta $0706,y        ; $ef9e: 99 06 07  
            lda $9c            ; $efa1: a5 9c     
            beq __efa9         ; $efa3: f0 04     
            lda #$f0           ; $efa5: a9 f0     
            bne __efab         ; $efa7: d0 02     
__efa9:     lda $4c            ; $efa9: a5 4c     
__efab:     sta $0700,y        ; $efab: 99 00 07  
            sta $0704,y        ; $efae: 99 04 07  
            lda $85            ; $efb1: a5 85     
            sta $0707,y        ; $efb3: 99 07 07  
            sec                ; $efb6: 38        
            sbc #$08           ; $efb7: e9 08     
            sta $0703,y        ; $efb9: 99 03 07  
            rts                ; $efbc: 60        

;-------------------------------------------------------------------------------
__efbd:     lda $f9            ; $efbd: a5 f9     
            bne __effa         ; $efbf: d0 39     
            lda $03e2          ; $efc1: ad e2 03  
            cmp #$de           ; $efc4: c9 de     
            beq __efd0         ; $efc6: f0 08     
            bcs __effa         ; $efc8: b0 30     
            cmp #$10           ; $efca: c9 10     
            bcs __efe2         ; $efcc: b0 14     
            bcc __effa         ; $efce: 90 2a     
__efd0:     ldx #$00           ; $efd0: a2 00     
            lda $0295          ; $efd2: ad 95 02  
            beq __efd8         ; $efd5: f0 01     
            inx                ; $efd7: e8        
__efd8:     lda $0295,x        ; $efd8: bd 95 02  
            ora #$80           ; $efdb: 09 80     
            sta $0295,x        ; $efdd: 9d 95 02  
            bne __effa         ; $efe0: d0 18     
__efe2:     ldx #$00           ; $efe2: a2 00     
            lda $0295          ; $efe4: ad 95 02  
            bmi __efea         ; $efe7: 30 01     
            inx                ; $efe9: e8        
__efea:     ldy $0229          ; $efea: ac 29 02  
__efed:     lda $0244,y        ; $efed: b9 44 02  
            cmp #$48           ; $eff0: c9 48     
            bne __eff7         ; $eff2: d0 03     
            inc $0295,x        ; $eff4: fe 95 02  
__eff7:     dey                ; $eff7: 88        
            bne __efed         ; $eff8: d0 f3     
__effa:     rts                ; $effa: 60        

;-------------------------------------------------------------------------------
            .hex 00 00 00 00   ; $effb: 00 00 00 00   Data
            .hex 01 01 02 03   ; $efff: 01 01 02 03   Data
            .hex 05            ; $f003: 05            Data
__f004:     .hex 08 01 02 04   ; $f004: 08 01 02 04   Data
            .hex 07 00 05 00   ; $f008: 07 00 05 00   Data
            .hex 00 00         ; $f00c: 00 00         Data
__f00e:     .hex 00 85 89 8d   ; $f00e: 00 85 89 8d   Data
            .hex e9 85 87 89   ; $f012: e9 85 87 89   Data
            .hex 8b 8f eb      ; $f016: 8b 8f eb      Data

;-------------------------------------------------------------------------------
__f019:     lda $0292          ; $f019: ad 92 02  
            cmp #$ef           ; $f01c: c9 ef     
            bne __f066         ; $f01e: d0 46     
            lda $03e2          ; $f020: ad e2 03  
            cmp #$10           ; $f023: c9 10     
            bcs __f033         ; $f025: b0 0c     
            ldx #$00           ; $f027: a2 00     
__f029:     lda $0295,x        ; $f029: bd 95 02  
            bmi __f034         ; $f02c: 30 06     
            inx                ; $f02e: e8        
            cpx #$02           ; $f02f: e0 02     
            bne __f029         ; $f031: d0 f6     
__f033:     rts                ; $f033: 60        

;-------------------------------------------------------------------------------
__f034:     and #$7f           ; $f034: 29 7f     
            sta $0295,x        ; $f036: 9d 95 02  
            beq __f033         ; $f039: f0 f8     
            tax                ; $f03b: aa        
            lda __f00e,x       ; $f03c: bd 0e f0  
            sta $0293          ; $f03f: 8d 93 02  
            lda __effa,x       ; $f042: bd fa ef  
            sta $21            ; $f045: 85 21     
            lda __f004,x       ; $f047: bd 04 f0  
            sta $20            ; $f04a: 85 20     
            lda #$f0           ; $f04c: a9 f0     
            sta $0294          ; $f04e: 8d 94 02  
            lda $40            ; $f051: a5 40     
            clc                ; $f053: 18        
            adc #$58           ; $f054: 69 58     
            cmp #$d0           ; $f056: c9 d0     
            bcs __f060         ; $f058: b0 06     
            cmp #$20           ; $f05a: c9 20     
            bcc __f060         ; $f05c: 90 02     
            bcs __f063         ; $f05e: b0 03     
__f060:     clc                ; $f060: 18        
            adc #$58           ; $f061: 69 58     
__f063:     sta $0292          ; $f063: 8d 92 02  
__f066:     lda $f9            ; $f066: a5 f9     
            bne __f077         ; $f068: d0 0d     
            lda $0294          ; $f06a: ad 94 02  
            sec                ; $f06d: 38        
            sbc #$03           ; $f06e: e9 03     
            sta $0294          ; $f070: 8d 94 02  
            cmp #$03           ; $f073: c9 03     
            bcc __f0db         ; $f075: 90 64     
__f077:     ldx #$00           ; $f077: a2 00     
            lda $0295          ; $f079: ad 95 02  
            bpl __f07f         ; $f07c: 10 01     
            inx                ; $f07e: e8        
__f07f:     lda $0295,x        ; $f07f: bd 95 02  
            sta $17            ; $f082: 85 17     
            lda #$f4           ; $f084: a9 f4     
            clc                ; $f086: 18        
            adc $0240          ; $f087: 6d 40 02  
            tay                ; $f08a: a8        
            lda $0293          ; $f08b: ad 93 02  
            sta $0701,y        ; $f08e: 99 01 07  
            lda #$83           ; $f091: a9 83     
            sta $0705,y        ; $f093: 99 05 07  
            ldx $17            ; $f096: a6 17     
            cpx #$05           ; $f098: e0 05     
            bcc __f0a1         ; $f09a: 90 05     
            lda #$81           ; $f09c: a9 81     
            sta $0709,y        ; $f09e: 99 09 07  
__f0a1:     lda $26            ; $f0a1: a5 26     
            lsr                ; $f0a3: 4a        
            lsr                ; $f0a4: 4a        
            and #$03           ; $f0a5: 29 03     
            sta $0702,y        ; $f0a7: 99 02 07  
            sta $0706,y        ; $f0aa: 99 06 07  
            cpx #$05           ; $f0ad: e0 05     
            bcc __f0b4         ; $f0af: 90 03     
            sta $070a,y        ; $f0b1: 99 0a 07  
__f0b4:     lda $0292          ; $f0b4: ad 92 02  
            sta $0700,y        ; $f0b7: 99 00 07  
            sta $0704,y        ; $f0ba: 99 04 07  
            cpx #$05           ; $f0bd: e0 05     
            bcc __f0c4         ; $f0bf: 90 03     
            sta $0708,y        ; $f0c1: 99 08 07  
__f0c4:     lda $0294          ; $f0c4: ad 94 02  
            sta $0703,y        ; $f0c7: 99 03 07  
            clc                ; $f0ca: 18        
            adc #$08           ; $f0cb: 69 08     
            sta $0707,y        ; $f0cd: 99 07 07  
            cpx #$05           ; $f0d0: e0 05     
            bcc __f0ef         ; $f0d2: 90 1b     
            clc                ; $f0d4: 18        
            adc #$08           ; $f0d5: 69 08     
            sta $070b,y        ; $f0d7: 99 0b 07  
            rts                ; $f0da: 60        

;-------------------------------------------------------------------------------
__f0db:     lda #$ef           ; $f0db: a9 ef     
            sta $0292          ; $f0dd: 8d 92 02  
            ldx #$00           ; $f0e0: a2 00     
            lda $0295          ; $f0e2: ad 95 02  
            beq __f0e9         ; $f0e5: f0 02     
            bpl __f0ea         ; $f0e7: 10 01     
__f0e9:     inx                ; $f0e9: e8        
__f0ea:     lda #$00           ; $f0ea: a9 00     
            sta $0295,x        ; $f0ec: 9d 95 02  
__f0ef:     rts                ; $f0ef: 60        

;-------------------------------------------------------------------------------
__f0f0:     lda $16            ; $f0f0: a5 16     
            beq __f0fb         ; $f0f2: f0 07     
            lda $25            ; $f0f4: a5 25     
            cmp $02c7          ; $f0f6: cd c7 02  
            bne __f0fc         ; $f0f9: d0 01     
__f0fb:     rts                ; $f0fb: 60        

;-------------------------------------------------------------------------------
__f0fc:     sta $02c7          ; $f0fc: 8d c7 02  
            lda $025c          ; $f0ff: ad 5c 02  
            sta $0299          ; $f102: 8d 99 02  
            lda $05f7          ; $f105: ad f7 05  
            sta $025c          ; $f108: 8d 5c 02  
            lda $0299          ; $f10b: ad 99 02  
            sta $05f7          ; $f10e: 8d f7 05  
            lda $0259          ; $f111: ad 59 02  
            sta $0299          ; $f114: 8d 99 02  
            lda $0298          ; $f117: ad 98 02  
            sta $0259          ; $f11a: 8d 59 02  
            lda $0299          ; $f11d: ad 99 02  
            sta $0298          ; $f120: 8d 98 02  
            lda $022f          ; $f123: ad 2f 02  
            sta $0299          ; $f126: 8d 99 02  
            lda $0297          ; $f129: ad 97 02  
            sta $022f          ; $f12c: 8d 2f 02  
            lda $0299          ; $f12f: ad 99 02  
            sta $0297          ; $f132: 8d 97 02  
            lda $02c9          ; $f135: ad c9 02  
            sta $0299          ; $f138: 8d 99 02  
            lda $02ca          ; $f13b: ad ca 02  
            sta $02c9          ; $f13e: 8d c9 02  
            lda $0299          ; $f141: ad 99 02  
            sta $02ca          ; $f144: 8d ca 02  
            ldx #$00           ; $f147: a2 00     
__f149:     lda $02b1,x        ; $f149: bd b1 02  
            sta $0299          ; $f14c: 8d 99 02  
            lda $02bc,x        ; $f14f: bd bc 02  
            sta $02b1,x        ; $f152: 9d b1 02  
            lda $0299          ; $f155: ad 99 02  
            sta $02bc,x        ; $f158: 9d bc 02  
            lda $0245,x        ; $f15b: bd 45 02  
            sta $0299          ; $f15e: 8d 99 02  
            lda $03e6,x        ; $f161: bd e6 03  
            sta $0245,x        ; $f164: 9d 45 02  
            lda $0299          ; $f167: ad 99 02  
            sta $03e6,x        ; $f16a: 9d e6 03  
            inx                ; $f16d: e8        
            cpx #$0b           ; $f16e: e0 0b     
            bne __f149         ; $f170: d0 d7     
            ldx #$00           ; $f172: a2 00     
__f174:     lda $0400,x        ; $f174: bd 00 04  
            sta $0299          ; $f177: 8d 99 02  
            lda $0500,x        ; $f17a: bd 00 05  
            sta $0400,x        ; $f17d: 9d 00 04  
            lda $0299          ; $f180: ad 99 02  
            sta $0500,x        ; $f183: 9d 00 05  
            inx                ; $f186: e8        
            cpx #$f0           ; $f187: e0 f0     
            bne __f174         ; $f189: d0 e9     
            rts                ; $f18b: 60        

;-------------------------------------------------------------------------------
__f18c:     lda $f9            ; $f18c: a5 f9     
            beq __f191         ; $f18e: f0 01     
__f190:     rts                ; $f190: 60        

;-------------------------------------------------------------------------------
__f191:     lda $029a          ; $f191: ad 9a 02  
            beq __f190         ; $f194: f0 fa     
            cmp #$01           ; $f196: c9 01     
            beq __f216         ; $f198: f0 7c     
            cmp #$02           ; $f19a: c9 02     
            beq __f1df         ; $f19c: f0 41     
            cmp #$03           ; $f19e: c9 03     
            beq __f1a8         ; $f1a0: f0 06     
            dec $029a          ; $f1a2: ce 9a 02  
            jmp __f22e         ; $f1a5: 4c 2e f2  

;-------------------------------------------------------------------------------
__f1a8:     lda #$21           ; $f1a8: a9 21     
            sta $17            ; $f1aa: 85 17     
            ldy #$09           ; $f1ac: a0 09     
__f1ae:     lda $0400,y        ; $f1ae: b9 00 04  
            cmp #$81           ; $f1b1: c9 81     
            bne __f1c5         ; $f1b3: d0 10     
            iny                ; $f1b5: c8        
            tya                ; $f1b6: 98        
            and #$07           ; $f1b7: 29 07     
            bne __f1ae         ; $f1b9: d0 f3     
            iny                ; $f1bb: c8        
            lda $17            ; $f1bc: a5 17     
            clc                ; $f1be: 18        
            adc #$20           ; $f1bf: 69 20     
            sta $17            ; $f1c1: 85 17     
            bne __f1ae         ; $f1c3: d0 e9     
__f1c5:     lda $29            ; $f1c5: a5 29     
            cmp $17            ; $f1c7: c5 17     
            bcs __f1d0         ; $f1c9: b0 05     
            dec $029a          ; $f1cb: ce 9a 02  
            bne __f22e         ; $f1ce: d0 5e     
__f1d0:     sec                ; $f1d0: 38        
            sbc #$02           ; $f1d1: e9 02     
            sta $29            ; $f1d3: 85 29     
            lda $79            ; $f1d5: a5 79     
            clc                ; $f1d7: 18        
            adc #$02           ; $f1d8: 69 02     
            sta $79            ; $f1da: 85 79     
            jmp __f22e         ; $f1dc: 4c 2e f2  

;-------------------------------------------------------------------------------
__f1df:     lda #$e0           ; $f1df: a9 e0     
            sta $17            ; $f1e1: 85 17     
            ldy #$6f           ; $f1e3: a0 6f     
__f1e5:     lda $0400,y        ; $f1e5: b9 00 04  
            cmp #$81           ; $f1e8: c9 81     
            bne __f1fc         ; $f1ea: d0 10     
            dey                ; $f1ec: 88        
            tya                ; $f1ed: 98        
            and #$07           ; $f1ee: 29 07     
            bne __f1e5         ; $f1f0: d0 f3     
            dey                ; $f1f2: 88        
            lda $17            ; $f1f3: a5 17     
            sec                ; $f1f5: 38        
            sbc #$20           ; $f1f6: e9 20     
            sta $17            ; $f1f8: 85 17     
            bne __f1e5         ; $f1fa: d0 e9     
__f1fc:     lda $29            ; $f1fc: a5 29     
            cmp $17            ; $f1fe: c5 17     
            bcc __f207         ; $f200: 90 05     
            dec $029a          ; $f202: ce 9a 02  
            bne __f22e         ; $f205: d0 27     
__f207:     clc                ; $f207: 18        
            adc #$01           ; $f208: 69 01     
            sta $29            ; $f20a: 85 29     
            lda $79            ; $f20c: a5 79     
            sec                ; $f20e: 38        
            sbc #$01           ; $f20f: e9 01     
            sta $79            ; $f211: 85 79     
            jmp __f22e         ; $f213: 4c 2e f2  

;-------------------------------------------------------------------------------
__f216:     lda $29            ; $f216: a5 29     
            cmp $02c8          ; $f218: cd c8 02  
            bne __f222         ; $f21b: d0 05     
            dec $029a          ; $f21d: ce 9a 02  
            beq __f22e         ; $f220: f0 0c     
__f222:     sec                ; $f222: 38        
            sbc #$02           ; $f223: e9 02     
            sta $29            ; $f225: 85 29     
            lda $79            ; $f227: a5 79     
            clc                ; $f229: 18        
            adc #$02           ; $f22a: 69 02     
            sta $79            ; $f22c: 85 79     
__f22e:     inc $022c          ; $f22e: ee 2c 02  
            lda #$00           ; $f231: a9 00     
            sta $17            ; $f233: 85 17     
            lda $02cd          ; $f235: ad cd 02  
            sta $40            ; $f238: 85 40     
            lda $02c8          ; $f23a: ad c8 02  
            sec                ; $f23d: 38        
            sbc $29            ; $f23e: e5 29     
            bcs __f249         ; $f240: b0 07     
            sta $17            ; $f242: 85 17     
            lda #$00           ; $f244: a9 00     
            sec                ; $f246: 38        
            sbc $17            ; $f247: e5 17     
__f249:     cmp #$80           ; $f249: c9 80     
            bcs __f253         ; $f24b: b0 06     
            lda $79            ; $f24d: a5 79     
            cmp #$06           ; $f24f: c9 06     
            bcs __f257         ; $f251: b0 04     

;-------------------------------------------------------------------------------
__f253:     lda #$f0           ; $f253: a9 f0     
            sta $40            ; $f255: 85 40     

;-------------------------------------------------------------------------------
__f257:     rts                ; $f257: 60        

;-------------------------------------------------------------------------------
__f258:     .hex fe fe 02 02   ; $f258: fe fe 02 02   Data
__f25c:     .hex fe 02 fe 02   ; $f25c: fe 02 fe 02   Data

;-------------------------------------------------------------------------------
__f260:     lda $0243          ; $f260: ad 43 02  
            cmp #$05           ; $f263: c9 05     
            beq __f268         ; $f265: f0 01     
            rts                ; $f267: 60        

;-------------------------------------------------------------------------------
__f268:     lda $16            ; $f268: a5 16     
            beq __f27b         ; $f26a: f0 0f     
            lda $02ca          ; $f26c: ad ca 02  
            beq __f27b         ; $f26f: f0 0a     
            lda $022d          ; $f271: ad 2d 02  
            ora $022e          ; $f274: 0d 2e 02  
            beq __f2c9         ; $f277: f0 50     
            bne __f28e         ; $f279: d0 13     
__f27b:     lda $022d          ; $f27b: ad 2d 02  
            ora $022e          ; $f27e: 0d 2e 02  
            beq __f2d9         ; $f281: f0 56     
            lda $2e            ; $f283: a5 2e     
            eor $04fe          ; $f285: 4d fe 04  
            and $2e            ; $f288: 25 2e     
            and #$0c           ; $f28a: 29 0c     
            bne __f2dd         ; $f28c: d0 4f     
__f28e:     ldx $0229          ; $f28e: ae 29 02  
__f291:     ldy $86,x          ; $f291: b4 86     
            lda $40,x          ; $f293: b5 40     
            clc                ; $f295: 18        
            adc __f258,y       ; $f296: 79 58 f2  
            sta $40,x          ; $f299: 95 40     
            cmp #$20           ; $f29b: c9 20     
            bcc __f2a3         ; $f29d: 90 04     
            cmp #$d0           ; $f29f: c9 d0     
            bcc __f2a9         ; $f2a1: 90 06     
__f2a3:     lda $86,x          ; $f2a3: b5 86     
            eor #$02           ; $f2a5: 49 02     
            sta $86,x          ; $f2a7: 95 86     
__f2a9:     lda $79,x          ; $f2a9: b5 79     
            clc                ; $f2ab: 18        
            adc __f25c,y       ; $f2ac: 79 5c f2  
            sta $79,x          ; $f2af: 95 79     
            cmp #$10           ; $f2b1: c9 10     
            bcc __f2b9         ; $f2b3: 90 04     
            cmp #$f0           ; $f2b5: c9 f0     
            bcc __f2bf         ; $f2b7: 90 06     
__f2b9:     lda $86,x          ; $f2b9: b5 86     
            eor #$01           ; $f2bb: 49 01     
            sta $86,x          ; $f2bd: 95 86     
__f2bf:     dex                ; $f2bf: ca        
            bne __f291         ; $f2c0: d0 cf     
            jsr __e2ca         ; $f2c2: 20 ca e2  
            jsr __e729         ; $f2c5: 20 29 e7  
            rts                ; $f2c8: 60        

;-------------------------------------------------------------------------------
__f2c9:     ldx #$03           ; $f2c9: a2 03     
            stx $0243          ; $f2cb: 8e 43 02  
            dex                ; $f2ce: ca        
            stx $022d          ; $f2cf: 8e 2d 02  
            inc $025b          ; $f2d2: ee 5b 02  
            jsr __f321         ; $f2d5: 20 21 f3  
            rts                ; $f2d8: 60        

;-------------------------------------------------------------------------------
__f2d9:     lda #$b5           ; $f2d9: a9 b5     
            bne __f2df         ; $f2db: d0 02     

;-------------------------------------------------------------------------------
__f2dd:     lda #$b4           ; $f2dd: a9 b4     
__f2df:     sta $28            ; $f2df: 85 28     
            lda $05f5          ; $f2e1: ad f5 05  
            sta $05f0          ; $f2e4: 8d f0 05  
            lda $05f6          ; $f2e7: ad f6 05  
            sta $05f1          ; $f2ea: 8d f1 05  
            ldx #$00           ; $f2ed: a2 00     
            stx $05f5          ; $f2ef: 8e f5 05  
            stx $05f6          ; $f2f2: 8e f6 05  
            stx $0291          ; $f2f5: 8e 91 02  
            stx $022f          ; $f2f8: 8e 2f 02  
            stx $02db          ; $f2fb: 8e db 02  
            stx $0243          ; $f2fe: 8e 43 02  
            stx $25            ; $f301: 86 25     
            stx $02ea          ; $f303: 8e ea 02  
            inx                ; $f306: e8        
            stx $0229          ; $f307: 8e 29 02  
            stx $91            ; $f30a: 86 91     
            inx                ; $f30c: e8        
            stx $022e          ; $f30d: 8e 2e 02  
            lda #$51           ; $f310: a9 51     
            sta $022d          ; $f312: 8d 2d 02  
            lda #$ef           ; $f315: a9 ef     
            sta $0292          ; $f317: 8d 92 02  
            jsr __f321         ; $f31a: 20 21 f3  
            jsr __ac8b         ; $f31d: 20 8b ac  
            rts                ; $f320: 60        

;-------------------------------------------------------------------------------
__f321:     ldx $02c7          ; $f321: ae c7 02  
            lda $0259          ; $f324: ad 59 02  
            cmp $05f2,x        ; $f327: dd f2 05  
            bcc __f32f         ; $f32a: 90 03     
            sta $05f2,x        ; $f32c: 9d f2 05  
__f32f:     rts                ; $f32f: 60        

;-------------------------------------------------------------------------------
__f330:     ldx #$00           ; $f330: a2 00     
            ldy #$00           ; $f332: a0 00     
__f334:     lda $0235,x        ; $f334: bd 35 02  
            clc                ; $f337: 18        
            adc $0230,y        ; $f338: 79 30 02  
            sta $17            ; $f33b: 85 17     
            rol                ; $f33d: 2a        
            rol                ; $f33e: 2a        
            rol                ; $f33f: 2a        
            and #$07           ; $f340: 29 07     
            cpx #$04           ; $f342: e0 04     
            beq __f393         ; $f344: f0 4d     
            cpy #$01           ; $f346: c0 01     
            bpl __f380         ; $f348: 10 36     
            cpx #$01           ; $f34a: e0 01     
            beq __f35c         ; $f34c: f0 0e     
            and #$03           ; $f34e: 29 03     
            sta $023a          ; $f350: 8d 3a 02  
            lda $17            ; $f353: a5 17     
            and #$3f           ; $f355: 29 3f     
            sta $0235,x        ; $f357: 9d 35 02  
            bpl __f39d         ; $f35a: 10 41     
__f35c:     and #$03           ; $f35c: 29 03     
            lsr                ; $f35e: 4a        
            sta $023b          ; $f35f: 8d 3b 02  
            lda $17            ; $f362: a5 17     
            and #$7f           ; $f364: 29 7f     
            sta $0236          ; $f366: 8d 36 02  
            iny                ; $f369: c8        
            lda $0228          ; $f36a: ad 28 02  
            cmp $022f          ; $f36d: cd 2f 02  
            bcs __f37c         ; $f370: b0 0a     
            lda $0221          ; $f372: ad 21 02  
            bne __f39d         ; $f375: d0 26     
            lda $0220          ; $f377: ad 20 02  
            bne __f39d         ; $f37a: d0 21     
__f37c:     iny                ; $f37c: c8        
            iny                ; $f37d: c8        
            bne __f39d         ; $f37e: d0 1d     
__f380:     and #$03           ; $f380: 29 03     
            sta $023a,x        ; $f382: 9d 3a 02  
            lda $17            ; $f385: a5 17     
            and #$3f           ; $f387: 29 3f     
            sta $0235,x        ; $f389: 9d 35 02  
            cpx #$03           ; $f38c: e0 03     
            beq __f39d         ; $f38e: f0 0d     
            iny                ; $f390: c8        
            bne __f39d         ; $f391: d0 0a     
__f393:     lsr                ; $f393: 4a        
            lsr                ; $f394: 4a        
            sta $023e          ; $f395: 8d 3e 02  
            lda $17            ; $f398: a5 17     
            sta $0235,x        ; $f39a: 9d 35 02  
__f39d:     inx                ; $f39d: e8        
            cpx #$05           ; $f39e: e0 05     
            bne __f334         ; $f3a0: d0 92     
            rts                ; $f3a2: 60        

;-------------------------------------------------------------------------------
__f3a3:     txa                ; $f3a3: 8a        
            pha                ; $f3a4: 48        
            tya                ; $f3a5: 98        
            pha                ; $f3a6: 48        
            ldx #$00           ; $f3a7: a2 00     
            stx $18            ; $f3a9: 86 18     
            ldy $f4            ; $f3ab: a4 f4     
            bne __f3f7         ; $f3ad: d0 48     
__f3af:     lda $9d            ; $f3af: a5 9d     
            clc                ; $f3b1: 18        
            adc $18            ; $f3b2: 65 18     
            and #$27           ; $f3b4: 29 27     
            sta $2006          ; $f3b6: 8d 06 20  
            lda $a7            ; $f3b9: a5 a7     
            and #$9f           ; $f3bb: 29 9f     
            sta $2006          ; $f3bd: 8d 06 20  
__f3c0:     lda $b1,x          ; $f3c0: b5 b1     
            sta $2007          ; $f3c2: 8d 07 20  
            lda $b2,x          ; $f3c5: b5 b2     
            sta $2007          ; $f3c7: 8d 07 20  
__f3ca:     inx                ; $f3ca: e8        
            inx                ; $f3cb: e8        
            txa                ; $f3cc: 8a        
            and #$0f           ; $f3cd: 29 0f     
            beq __f3ee         ; $f3cf: f0 1d     
            and #$03           ; $f3d1: 29 03     
            beq __f3e0         ; $f3d3: f0 0b     
            lda $fa            ; $f3d5: a5 fa     
            beq __f3c0         ; $f3d7: f0 e7     
            txa                ; $f3d9: 8a        
            and #$02           ; $f3da: 29 02     
            bne __f3ca         ; $f3dc: d0 ec     
            beq __f3c0         ; $f3de: f0 e0     
__f3e0:     inc $a7            ; $f3e0: e6 a7     
            lda $a7            ; $f3e2: a5 a7     
            and #$1f           ; $f3e4: 29 1f     
            bne __f3af         ; $f3e6: d0 c7     
            lda #$04           ; $f3e8: a9 04     
            sta $18            ; $f3ea: 85 18     
            bne __f3af         ; $f3ec: d0 c1     
__f3ee:     lda #$00           ; $f3ee: a9 00     
            sta $9d            ; $f3f0: 85 9d     
            pla                ; $f3f2: 68        
            tay                ; $f3f3: a8        
            pla                ; $f3f4: 68        
            tax                ; $f3f5: aa        
            rts                ; $f3f6: 60        

;-------------------------------------------------------------------------------
__f3f7:     lda $9e            ; $f3f7: a5 9e     
            clc                ; $f3f9: 18        
            adc $18            ; $f3fa: 65 18     
            and #$27           ; $f3fc: 29 27     
            sta $2006          ; $f3fe: 8d 06 20  
            lda $a8            ; $f401: a5 a8     
            and #$9f           ; $f403: 29 9f     
            sta $2006          ; $f405: 8d 06 20  
__f408:     lda $c1,x          ; $f408: b5 c1     
            sta $2007          ; $f40a: 8d 07 20  
            lda $c2,x          ; $f40d: b5 c2     
            sta $2007          ; $f40f: 8d 07 20  
__f412:     inx                ; $f412: e8        
            inx                ; $f413: e8        
            txa                ; $f414: 8a        
            and #$0f           ; $f415: 29 0f     
            beq __f436         ; $f417: f0 1d     
            and #$03           ; $f419: 29 03     
            beq __f428         ; $f41b: f0 0b     
            lda $fb            ; $f41d: a5 fb     
            beq __f408         ; $f41f: f0 e7     
            txa                ; $f421: 8a        
            and #$02           ; $f422: 29 02     
            bne __f412         ; $f424: d0 ec     
            beq __f408         ; $f426: f0 e0     
__f428:     inc $a8            ; $f428: e6 a8     
            lda $a8            ; $f42a: a5 a8     
            and #$1f           ; $f42c: 29 1f     
            bne __f3f7         ; $f42e: d0 c7     
            lda #$04           ; $f430: a9 04     
            sta $18            ; $f432: 85 18     
            bne __f3f7         ; $f434: d0 c1     
__f436:     lda #$00           ; $f436: a9 00     
            sta $9e            ; $f438: 85 9e     
            pla                ; $f43a: 68        
            tay                ; $f43b: a8        
            pla                ; $f43c: 68        
            tax                ; $f43d: aa        
            rts                ; $f43e: 60        

;-------------------------------------------------------------------------------
__f43f:     txa                ; $f43f: 8a        
            pha                ; $f440: 48        
            tya                ; $f441: 98        
            pha                ; $f442: 48        
            ldx $f4            ; $f443: a6 f4     
            txa                ; $f445: 8a        
            asl                ; $f446: 0a        
            asl                ; $f447: 0a        
            tay                ; $f448: a8        
__f449:     lda $9f,x          ; $f449: b5 9f     
            sta $2006          ; $f44b: 8d 06 20  
            lda $a9,x          ; $f44e: b5 a9     
            sta $2006          ; $f450: 8d 06 20  
            lda $00d1,y        ; $f453: b9 d1 00  
            sta $2007          ; $f456: 8d 07 20  
            lda $00d2,y        ; $f459: b9 d2 00  
            sta $2007          ; $f45c: 8d 07 20  
            iny                ; $f45f: c8        
            iny                ; $f460: c8        
            tya                ; $f461: 98        
            and #$03           ; $f462: 29 03     
            beq __f46a         ; $f464: f0 04     
            inc $a9,x          ; $f466: f6 a9     
            bne __f449         ; $f468: d0 df     
__f46a:     dec $a9,x          ; $f46a: d6 a9     
            pla                ; $f46c: 68        
            tay                ; $f46d: a8        
            pla                ; $f46e: 68        
            tax                ; $f46f: aa        
            rts                ; $f470: 60        

;-------------------------------------------------------------------------------
__f471:     .hex 20 80 81 41   ; $f471: 20 80 81 41   Data
            .hex 10 40 00 20   ; $f475: 10 40 00 20   Data
            .hex 80 10 02 20   ; $f479: 80 10 02 20   Data
            .hex 81 40 10 02   ; $f47d: 81 40 10 02   Data
            .hex 11 02 80 10   ; $f481: 11 02 80 10   Data
            .hex 80 40 01 10   ; $f485: 80 40 01 10   Data
            .hex 40 00 20 40   ; $f489: 40 00 20 40   Data
__f48d:     .hex 05 2d 1e 28   ; $f48d: 05 2d 1e 28   Data
            .hex 3e 69 3c 28   ; $f491: 3e 69 3c 28   Data
            .hex 19 05 0f 50   ; $f495: 19 05 0f 50   Data
            .hex 28 2d 32 0f   ; $f499: 28 2d 32 0f   Data
            .hex 50 3c 3c 8c   ; $f49d: 50 3c 3c 8c   Data
            .hex a0 a0 a0 a0   ; $f4a1: a0 a0 a0 a0   Data
            .hex a0 a0 fa fa   ; $f4a5: a0 a0 fa fa   Data

;-------------------------------------------------------------------------------
__f4a9:     lda $0243          ; $f4a9: ad 43 02  
            cmp #$01           ; $f4ac: c9 01     
            bne __f4d4         ; $f4ae: d0 24     
            lda $022c          ; $f4b0: ad 2c 02  
            bne __f4d4         ; $f4b3: d0 1f     
            inc $02cc          ; $f4b5: ee cc 02  
            ldx $02cb          ; $f4b8: ae cb 02  
            lda __f48d,x       ; $f4bb: bd 8d f4  
            cmp $02cc          ; $f4be: cd cc 02  
            bne __f4cb         ; $f4c1: d0 08     
            lda #$00           ; $f4c3: a9 00     
            sta $02cc          ; $f4c5: 8d cc 02  
            inc $02cb          ; $f4c8: ee cb 02  
__f4cb:     lda $2d            ; $f4cb: a5 2d     
            and #$0c           ; $f4cd: 29 0c     
            ora __f471,x       ; $f4cf: 1d 71 f4  
            sta $2d            ; $f4d2: 85 2d     
__f4d4:     rts                ; $f4d4: 60        

;-------------------------------------------------------------------------------
__f4d5:     .hex fe fe fe fe   ; $f4d5: fe fe fe fe   Data
            .hex fe fe fe fe   ; $f4d9: fe fe fe fe   Data
            .hex fe fe fe 19   ; $f4dd: fe fe fe 19   Data
            .hex 0a 1e 1c 0e   ; $f4e1: 0a 1e 1c 0e   Data
__f4e5:     .hex fe 11 0e 1b   ; $f4e5: fe 11 0e 1b   Data
            .hex 0a 17 0a 12   ; $f4e9: 0a 17 0a 12   Data

;-------------------------------------------------------------------------------
__f4ed:     lda $0243          ; $f4ed: ad 43 02  
            beq __f53b         ; $f4f0: f0 49     
            ldx #$00           ; $f4f2: a2 00     
            stx $f4            ; $f4f4: 86 f4     
            lda $03e2          ; $f4f6: ad e2 03  
            beq __f51f         ; $f4f9: f0 24     
            cmp #$de           ; $f4fb: c9 de     
            bcs __f51f         ; $f4fd: b0 20     
            lda $9d            ; $f4ff: a5 9d     
            beq __f506         ; $f501: f0 03     
            jsr __f3a3         ; $f503: 20 a3 f3  
__f506:     lda $9e            ; $f506: a5 9e     
            beq __f50f         ; $f508: f0 05     
            inc $f4            ; $f50a: e6 f4     
            jsr __f3a3         ; $f50c: 20 a3 f3  
__f50f:     lda $9f,x          ; $f50f: b5 9f     
            beq __f518         ; $f511: f0 05     
            stx $f4            ; $f513: 86 f4     
            jsr __f43f         ; $f515: 20 3f f4  
__f518:     inx                ; $f518: e8        
            cpx #$04           ; $f519: e0 04     
            bne __f50f         ; $f51b: d0 f2     
            beq __f561         ; $f51d: f0 42     
__f51f:     lda $9d            ; $f51f: a5 9d     
            bne __f52e         ; $f521: d0 0b     
            lda $9e            ; $f523: a5 9e     
            bne __f53c         ; $f525: d0 15     
            lda $03e2          ; $f527: ad e2 03  
            bne __f552         ; $f52a: d0 26     
            beq __f561         ; $f52c: f0 33     
__f52e:     jsr __f3a3         ; $f52e: 20 a3 f3  
__f531:     stx $f4            ; $f531: 86 f4     
            jsr __f43f         ; $f533: 20 3f f4  
            inx                ; $f536: e8        
            cpx #$04           ; $f537: e0 04     
            bne __f531         ; $f539: d0 f6     
__f53b:     rts                ; $f53b: 60        

;-------------------------------------------------------------------------------
__f53c:     inc $f4            ; $f53c: e6 f4     
            jsr __f3a3         ; $f53e: 20 a3 f3  
__f541:     stx $f4            ; $f541: 86 f4     
            jsr __f43f         ; $f543: 20 3f f4  
__f546:     inx                ; $f546: e8        
            cpx #$06           ; $f547: e0 06     
            beq __f581         ; $f549: f0 36     
            txa                ; $f54b: 8a        
            and #$02           ; $f54c: 29 02     
            bne __f546         ; $f54e: d0 f6     
            beq __f541         ; $f550: f0 ef     
__f552:     lda $9f,x          ; $f552: b5 9f     
            beq __f581         ; $f554: f0 2b     
            stx $f4            ; $f556: 86 f4     
            jsr __f43f         ; $f558: 20 3f f4  
            inx                ; $f55b: e8        
            cpx #$08           ; $f55c: e0 08     
            bne __f552         ; $f55e: d0 f2     
            rts                ; $f560: 60        

;-------------------------------------------------------------------------------
__f561:     ldx #$00           ; $f561: a2 00     
__f563:     lda $0260,x        ; $f563: bd 60 02  
            beq __f582         ; $f566: f0 1a     
            sta $2006          ; $f568: 8d 06 20  
            lda $0270,x        ; $f56b: bd 70 02  
            sta $2006          ; $f56e: 8d 06 20  
            lda $0280,x        ; $f571: bd 80 02  
            sta $2007          ; $f574: 8d 07 20  
            lda #$00           ; $f577: a9 00     
            sta $0260,x        ; $f579: 9d 60 02  
            inx                ; $f57c: e8        
            cpx #$10           ; $f57d: e0 10     
            bne __f563         ; $f57f: d0 e2     
__f581:     rts                ; $f581: 60        

;-------------------------------------------------------------------------------
__f582:     lda $0243          ; $f582: ad 43 02  
            cmp #$01           ; $f585: c9 01     
            beq __f581         ; $f587: f0 f8     
            lda $28            ; $f589: a5 28     
            and #$7b           ; $f58b: 29 7b     
            sta $2000          ; $f58d: 8d 00 20  
            lda $f9            ; $f590: a5 f9     
            beq __f5bb         ; $f592: f0 27     
            lda #$20           ; $f594: a9 20     
            sta $2006          ; $f596: 8d 06 20  
            lda #$74           ; $f599: a9 74     
            sta $2006          ; $f59b: 8d 06 20  
            lda $26            ; $f59e: a5 26     
            and #$30           ; $f5a0: 29 30     
            beq __f5aa         ; $f5a2: f0 06     
            ldx #$08           ; $f5a4: a2 08     
            lda #$10           ; $f5a6: a9 10     
            bne __f5ad         ; $f5a8: d0 03     
__f5aa:     tax                ; $f5aa: aa        
            lda #$08           ; $f5ab: a9 08     
__f5ad:     sta $17            ; $f5ad: 85 17     
__f5af:     lda __f4d5,x       ; $f5af: bd d5 f4  
            sta $2007          ; $f5b2: 8d 07 20  
            inx                ; $f5b5: e8        
            cpx $17            ; $f5b6: e4 17     
            bne __f5af         ; $f5b8: d0 f5     
            rts                ; $f5ba: 60        

;-------------------------------------------------------------------------------
__f5bb:     lda $03e2          ; $f5bb: ad e2 03  
            cmp #$02           ; $f5be: c9 02     
            bcs __f5e9         ; $f5c0: b0 27     
            lda #$20           ; $f5c2: a9 20     
            sta $2006          ; $f5c4: 8d 06 20  
            lda #$63           ; $f5c7: a9 63     
            sta $2006          ; $f5c9: 8d 06 20  
            lda $02c7          ; $f5cc: ad c7 02  
            beq __f5d3         ; $f5cf: f0 02     
            lda #$06           ; $f5d1: a9 06     
__f5d3:     sta $18            ; $f5d3: 85 18     
            jsr __f656         ; $f5d5: 20 56 f6  
            lda #$20           ; $f5d8: a9 20     
            sta $2006          ; $f5da: 8d 06 20  
            lda #$6c           ; $f5dd: a9 6c     
            sta $2006          ; $f5df: 8d 06 20  
            lda #$0c           ; $f5e2: a9 0c     
            sta $18            ; $f5e4: 85 18     
            jsr __f656         ; $f5e6: 20 56 f6  
__f5e9:     lda $0243          ; $f5e9: ad 43 02  
            cmp #$02           ; $f5ec: c9 02     
            beq __f62d         ; $f5ee: f0 3d     
            bcc __f655         ; $f5f0: 90 63     
            lda $022d          ; $f5f2: ad 2d 02  
            ora $022e          ; $f5f5: 0d 2e 02  
            ora $0291          ; $f5f8: 0d 91 02  
            bne __f655         ; $f5fb: d0 58     
            ldy #$20           ; $f5fd: a0 20     
            sty $2006          ; $f5ff: 8c 06 20  
            ldy #$74           ; $f602: a0 74     
            sty $2006          ; $f604: 8c 06 20  
            ldx $05f4          ; $f607: ae f4 05  
            beq __f619         ; $f60a: f0 0d     
            dex                ; $f60c: ca        
__f60d:     lda __f4e5,x       ; $f60d: bd e5 f4  
            sta $2007          ; $f610: 8d 07 20  
            inx                ; $f613: e8        
            cpx #$08           ; $f614: e0 08     
            bne __f60d         ; $f616: d0 f5     
            rts                ; $f618: 60        

;-------------------------------------------------------------------------------
__f619:     ldx #$08           ; $f619: a2 08     
__f61b:     cpx $02c9          ; $f61b: ec c9 02  
            bcs __f624         ; $f61e: b0 04     
            lda #$0f           ; $f620: a9 0f     
            bne __f626         ; $f622: d0 02     
__f624:     lda #$fe           ; $f624: a9 fe     
__f626:     sta $2007          ; $f626: 8d 07 20  
            dex                ; $f629: ca        
            bne __f61b         ; $f62a: d0 ef     
            rts                ; $f62c: 60        

;-------------------------------------------------------------------------------
__f62d:     ldy #$20           ; $f62d: a0 20     
            sty $2006          ; $f62f: 8c 06 20  
            ldy #$5a           ; $f632: a0 5a     
            sty $2006          ; $f634: 8c 06 20  
            lda $f7            ; $f637: a5 f7     
            sta $2007          ; $f639: 8d 07 20  
            lda $f8            ; $f63c: a5 f8     
            sta $2007          ; $f63e: 8d 07 20  
            ldy #$21           ; $f641: a0 21     
            sty $2006          ; $f643: 8c 06 20  
            ldy #$f2           ; $f646: a0 f2     
            sty $2006          ; $f648: 8c 06 20  
            ldx $f7            ; $f64b: a6 f7     
            stx $2007          ; $f64d: 8e 07 20  
            lda $f8            ; $f650: a5 f8     
            sta $2007          ; $f652: 8d 07 20  
__f655:     rts                ; $f655: 60        

;-------------------------------------------------------------------------------
__f656:     lda #$01           ; $f656: a9 01     
            sta $17            ; $f658: 85 17     
            lda $18            ; $f65a: a5 18     
            clc                ; $f65c: 18        
            adc #$06           ; $f65d: 69 06     
            tax                ; $f65f: aa        
__f660:     lda $03,x          ; $f660: b5 03     
            beq __f66a         ; $f662: f0 06     
            ldy #$00           ; $f664: a0 00     
            sty $17            ; $f666: 84 17     
            beq __f670         ; $f668: f0 06     
__f66a:     ldy $17            ; $f66a: a4 17     
            beq __f670         ; $f66c: f0 02     
            lda #$fe           ; $f66e: a9 fe     
__f670:     sta $2007          ; $f670: 8d 07 20  
            dex                ; $f673: ca        
            cpx $18            ; $f674: e4 18     
            bne __f660         ; $f676: d0 e8     
            rts                ; $f678: 60        

;-------------------------------------------------------------------------------
            lda $2f            ; $f679: a5 2f     
            eor $05ff          ; $f67b: 4d ff 05  
            and $2f            ; $f67e: 25 2f     
            sta $18            ; $f680: 85 18     
            and #$40           ; $f682: 29 40     
            beq __f692         ; $f684: f0 0c     
            lda $05f9          ; $f686: ad f9 05  
            cmp #$02           ; $f689: c9 02     
            bcs __f6a0         ; $f68b: b0 13     
            inc $05f9          ; $f68d: ee f9 05  
            bne __f6a0         ; $f690: d0 0e     
__f692:     lda $18            ; $f692: a5 18     
            and #$80           ; $f694: 29 80     
            beq __f6a3         ; $f696: f0 0b     
            lda $05f9          ; $f698: ad f9 05  
            beq __f6a0         ; $f69b: f0 03     
            dec $05f9          ; $f69d: ce f9 05  
__f6a0:     jmp __f729         ; $f6a0: 4c 29 f7  

;-------------------------------------------------------------------------------
__f6a3:     lda $18            ; $f6a3: a5 18     
            and #$10           ; $f6a5: 29 10     
            beq __f6e8         ; $f6a7: f0 3f     
            lda $05f9          ; $f6a9: ad f9 05  
            beq __f6cf         ; $f6ac: f0 21     
            cmp #$01           ; $f6ae: c9 01     
            beq __f6c3         ; $f6b0: f0 11     
            inc $05fb          ; $f6b2: ee fb 05  
            lda $05fb          ; $f6b5: ad fb 05  
            cmp #$08           ; $f6b8: c9 08     
            bcc __f6e5         ; $f6ba: 90 29     
            lda #$00           ; $f6bc: a9 00     
            sta $05fb          ; $f6be: 8d fb 05  
            beq __f6e5         ; $f6c1: f0 22     
__f6c3:     lda $05fa          ; $f6c3: ad fa 05  
            clc                ; $f6c6: 18        
            adc #$10           ; $f6c7: 69 10     
            sta $05fa          ; $f6c9: 8d fa 05  
            jmp __f729         ; $f6cc: 4c 29 f7  

;-------------------------------------------------------------------------------
__f6cf:     lda $05fa          ; $f6cf: ad fa 05  
            and #$0f           ; $f6d2: 29 0f     
            cmp #$0f           ; $f6d4: c9 0f     
            beq __f6dd         ; $f6d6: f0 05     
            inc $05fa          ; $f6d8: ee fa 05  
            bne __f6e5         ; $f6db: d0 08     
__f6dd:     lda $05fa          ; $f6dd: ad fa 05  
            and #$f0           ; $f6e0: 29 f0     
            sta $05fa          ; $f6e2: 8d fa 05  
__f6e5:     jmp __f729         ; $f6e5: 4c 29 f7  

;-------------------------------------------------------------------------------
__f6e8:     lda $18            ; $f6e8: a5 18     
            and #$20           ; $f6ea: 29 20     
            beq __f729         ; $f6ec: f0 3b     
            lda $05f9          ; $f6ee: ad f9 05  
            beq __f714         ; $f6f1: f0 21     
            cmp #$01           ; $f6f3: c9 01     
            beq __f708         ; $f6f5: f0 11     
            dec $05fb          ; $f6f7: ce fb 05  
            lda $05fb          ; $f6fa: ad fb 05  
            cmp #$ff           ; $f6fd: c9 ff     
            bne __f729         ; $f6ff: d0 28     
            lda #$07           ; $f701: a9 07     
            sta $05fb          ; $f703: 8d fb 05  
            bne __f729         ; $f706: d0 21     
__f708:     lda $05fa          ; $f708: ad fa 05  
            sec                ; $f70b: 38        
            sbc #$10           ; $f70c: e9 10     
            sta $05fa          ; $f70e: 8d fa 05  
            jmp __f729         ; $f711: 4c 29 f7  

;-------------------------------------------------------------------------------
__f714:     lda $05fa          ; $f714: ad fa 05  
            and #$0f           ; $f717: 29 0f     
            beq __f721         ; $f719: f0 06     
            dec $05fa          ; $f71b: ce fa 05  
            jmp __f729         ; $f71e: 4c 29 f7  

;-------------------------------------------------------------------------------
__f721:     lda $05fa          ; $f721: ad fa 05  
            ora #$0f           ; $f724: 09 0f     
            sta $05fa          ; $f726: 8d fa 05  
__f729:     rts                ; $f729: 60        

;-------------------------------------------------------------------------------
            lda #$b0           ; $f72a: a9 b0     
            sta $2000          ; $f72c: 8d 00 20  
            lda #$20           ; $f72f: a9 20     
            sta $2006          ; $f731: 8d 06 20  
            lda #$41           ; $f734: a9 41     
            sta $2006          ; $f736: 8d 06 20  
            lda $05f9          ; $f739: ad f9 05  
            cmp #$02           ; $f73c: c9 02     
            bne __f74a         ; $f73e: d0 0a     
            lda $26            ; $f740: a5 26     
            and #$18           ; $f742: 29 18     
            bne __f74a         ; $f744: d0 04     
            lda #$fe           ; $f746: a9 fe     
            bne __f74d         ; $f748: d0 03     
__f74a:     lda $05fb          ; $f74a: ad fb 05  
__f74d:     sta $2007          ; $f74d: 8d 07 20  
            lda $05f9          ; $f750: ad f9 05  
            cmp #$01           ; $f753: c9 01     
            bne __f761         ; $f755: d0 0a     
            lda $26            ; $f757: a5 26     
            and #$18           ; $f759: 29 18     
            bne __f761         ; $f75b: d0 04     
            lda #$fe           ; $f75d: a9 fe     
            bne __f76a         ; $f75f: d0 09     
__f761:     lda $05fa          ; $f761: ad fa 05  
            ror                ; $f764: 6a        
            ror                ; $f765: 6a        
            ror                ; $f766: 6a        
            ror                ; $f767: 6a        
            and #$0f           ; $f768: 29 0f     
__f76a:     sta $2007          ; $f76a: 8d 07 20  
            lda $26            ; $f76d: a5 26     
            and #$18           ; $f76f: 29 18     
            ora $05f9          ; $f771: 0d f9 05  
            bne __f77a         ; $f774: d0 04     
            lda #$fe           ; $f776: a9 fe     
            bne __f77f         ; $f778: d0 05     
__f77a:     lda $05fa          ; $f77a: ad fa 05  
            and #$0f           ; $f77d: 29 0f     
__f77f:     sta $2007          ; $f77f: 8d 07 20  
            lda $05fb          ; $f782: ad fb 05  
            sta $1c            ; $f785: 85 1c     
            lda $05fa          ; $f787: ad fa 05  
            sta $1b            ; $f78a: 85 1b     
            ldx #$00           ; $f78c: a2 00     
            lda ($1b,x)        ; $f78e: a1 1b     
            ror                ; $f790: 6a        
            ror                ; $f791: 6a        
            ror                ; $f792: 6a        
            ror                ; $f793: 6a        
            and #$0f           ; $f794: 29 0f     
            sta $2007          ; $f796: 8d 07 20  
            lda ($1b,x)        ; $f799: a1 1b     
            and #$0f           ; $f79b: 29 0f     
            sta $2007          ; $f79d: 8d 07 20  
            lda $28            ; $f7a0: a5 28     
            sta $2000          ; $f7a2: 8d 00 20  
            rts                ; $f7a5: 60        

;-------------------------------------------------------------------------------
__f7a6:     lda #$c0           ; $f7a6: a9 c0     
            sta $4017          ; $f7a8: 8d 17 40  
            lda #$00           ; $f7ab: a9 00     
            sta $4015          ; $f7ad: 8d 15 40  
            sta $33            ; $f7b0: 85 33     
            sta $32            ; $f7b2: 85 32     
            ldx #$27           ; $f7b4: a2 27     
__f7b6:     sta $0610,x        ; $f7b6: 9d 10 06  
            dex                ; $f7b9: ca        
            bpl __f7b6         ; $f7ba: 10 fa     
            lda #$80           ; $f7bc: a9 80     
            ldx #$15           ; $f7be: a2 15     
__f7c0:     sta $0638,x        ; $f7c0: 9d 38 06  
            dex                ; $f7c3: ca        
            bpl __f7c0         ; $f7c4: 10 fa     
            rts                ; $f7c6: 60        

;-------------------------------------------------------------------------------
__f7c7:     lda $33            ; $f7c7: a5 33     
            sta $4011          ; $f7c9: 8d 11 40  
            lda $32            ; $f7cc: a5 32     
            sta $4015          ; $f7ce: 8d 15 40  
            ldx #$00           ; $f7d1: a2 00     
__f7d3:     lsr $31            ; $f7d3: 46 31     
            ldy #$04           ; $f7d5: a0 04     
__f7d7:     lda $0600,x        ; $f7d7: bd 00 06  
            bcc __f7df         ; $f7da: 90 03     
            sta $4000,x        ; $f7dc: 9d 00 40  
__f7df:     inx                ; $f7df: e8        
            dey                ; $f7e0: 88        
            bne __f7d7         ; $f7e1: d0 f4     
            cpx #$10           ; $f7e3: e0 10     
            bcc __f7d3         ; $f7e5: 90 ec     
            ldx #$15           ; $f7e7: a2 15     
__f7e9:     ldy $0638,x        ; $f7e9: bc 38 06  
            lda $0610,y        ; $f7ec: b9 10 06  
            bne __f7f6         ; $f7ef: d0 05     
            lda #$80           ; $f7f1: a9 80     
            sta $0638,x        ; $f7f3: 9d 38 06  
__f7f6:     dex                ; $f7f6: ca        
            bpl __f7e9         ; $f7f7: 10 f0     
            ldx #$28           ; $f7f9: a2 28     
            lda $30            ; $f7fb: a5 30     
            beq __f801         ; $f7fd: f0 02     
            ldx #$01           ; $f7ff: a2 01     
__f801:     stx $3a            ; $f801: 86 3a     
            ldx #$00           ; $f803: a2 00     
            stx $32            ; $f805: 86 32     
            stx $35            ; $f807: 86 35     
            stx $3c            ; $f809: 86 3c     
__f80b:     jsr __f82e         ; $f80b: 20 2e f8  
            inc $3c            ; $f80e: e6 3c     
            ldx $3c            ; $f810: a6 3c     
            cpx $3a            ; $f812: e4 3a     
            bne __f80b         ; $f814: d0 f5     
            lda $32            ; $f816: a5 32     
            and #$0c           ; $f818: 29 0c     
            bne __f827         ; $f81a: d0 0b     
            lda $33            ; $f81c: a5 33     
            sec                ; $f81e: 38        
            sbc #$08           ; $f81f: e9 08     
            bcs __f825         ; $f821: b0 02     
            lda #$00           ; $f823: a9 00     
__f825:     sta $33            ; $f825: 85 33     
__f827:     lda $32            ; $f827: a5 32     
            eor $35            ; $f829: 45 35     
            sta $32            ; $f82b: 85 32     
__f82d:     rts                ; $f82d: 60        

;-------------------------------------------------------------------------------
__f82e:     ldy $0610,x        ; $f82e: bc 10 06  
            beq __f82d         ; $f831: f0 fa     
            lda __fa82,x       ; $f833: bd 82 fa  
            dey                ; $f836: 88        
            beq __f841         ; $f837: f0 08     
            tax                ; $f839: aa        
            dec $0690,x        ; $f83a: de 90 06  
            bne __f88d         ; $f83d: d0 4e     
            beq __f86d         ; $f83f: f0 2c     
__f841:     inc $0610,x        ; $f841: fe 10 06  
            tax                ; $f844: aa        
            lda $0638,x        ; $f845: bd 38 06  
            bmi __f85e         ; $f848: 30 14     
            tay                ; $f84a: a8        
            cmp $3c            ; $f84b: c5 3c     
            beq __f85e         ; $f84d: f0 0f     
            bcs __f859         ; $f84f: b0 08     
            lda #$00           ; $f851: a9 00     
            ldx $3c            ; $f853: a6 3c     
            sta $0610,x        ; $f855: 9d 10 06  
            rts                ; $f858: 60        

;-------------------------------------------------------------------------------
__f859:     lda #$00           ; $f859: a9 00     
            sta $0610,y        ; $f85b: 99 10 06  
__f85e:     lda $3c            ; $f85e: a5 3c     
            sta $0638,x        ; $f860: 9d 38 06  
            lda #$01           ; $f863: a9 01     
            sta $064e,x        ; $f865: 9d 4e 06  
            lda #$00           ; $f868: a9 00     
            sta $06a6,x        ; $f86a: 9d a6 06  
__f86d:     jsr __fa0c         ; $f86d: 20 0c fa  
            lda #$78           ; $f870: a9 78     
            sta $34            ; $f872: 85 34     
__f874:     jsr __fa29         ; $f874: 20 29 fa  
            bmi __f8c0         ; $f877: 30 47     
            cmp #$60           ; $f879: c9 60     
            beq __f89a         ; $f87b: f0 1d     
            bcs __f8e6         ; $f87d: b0 67     
            pha                ; $f87f: 48        
            jsr __f893         ; $f880: 20 93 f8  
            pla                ; $f883: 68        
            bcs __f88c         ; $f884: b0 06     
            jsr __f996         ; $f886: 20 96 f9  
            jsr __f9db         ; $f889: 20 db f9  
__f88c:     rts                ; $f88c: 60        

;-------------------------------------------------------------------------------
__f88d:     jsr __fa0c         ; $f88d: 20 0c fa  
            jmp __f8a7         ; $f890: 4c a7 f8  

;-------------------------------------------------------------------------------
__f893:     lda #$7f           ; $f893: a9 7f     
            and $067a,x        ; $f895: 3d 7a 06  
            bpl __f89f         ; $f898: 10 05     
__f89a:     lda #$80           ; $f89a: a9 80     
            ora $067a,x        ; $f89c: 1d 7a 06  
__f89f:     sta $067a,x        ; $f89f: 9d 7a 06  
            and #$7f           ; $f8a2: 29 7f     
            sta $0690,x        ; $f8a4: 9d 90 06  
__f8a7:     lda $3b            ; $f8a7: a5 3b     
            bit $32            ; $f8a9: 24 32     
            bne __f8be         ; $f8ab: d0 11     
            ora $32            ; $f8ad: 05 32     
            sta $32            ; $f8af: 85 32     
            ldy $067a,x        ; $f8b1: bc 7a 06  
            bpl __f8bc         ; $f8b4: 10 06     
            lda $3b            ; $f8b6: a5 3b     
            ora $35            ; $f8b8: 05 35     
            sta $35            ; $f8ba: 85 35     
__f8bc:     clc                ; $f8bc: 18        
            rts                ; $f8bd: 60        

;-------------------------------------------------------------------------------
__f8be:     sec                ; $f8be: 38        
            rts                ; $f8bf: 60        

;-------------------------------------------------------------------------------
__f8c0:     and #$7f           ; $f8c0: 29 7f     
            sta $067a,x        ; $f8c2: 9d 7a 06  
            jmp __f874         ; $f8c5: 4c 74 f8  

;-------------------------------------------------------------------------------
__f8c8:     ldy $3b            ; $f8c8: a4 3b     
            cpy #$04           ; $f8ca: c0 04     
            bcs __f8dd         ; $f8cc: b0 0f     
            sta $3d            ; $f8ce: 85 3d     
            lda $0664,x        ; $f8d0: bd 64 06  
            and #$f0           ; $f8d3: 29 f0     
            ora $3d            ; $f8d5: 05 3d     
            sta $0664,x        ; $f8d7: 9d 64 06  
__f8da:     jmp __f874         ; $f8da: 4c 74 f8  

;-------------------------------------------------------------------------------
__f8dd:     eor #$0f           ; $f8dd: 49 0f     
            asl                ; $f8df: 0a        
            asl                ; $f8e0: 0a        
            asl                ; $f8e1: 0a        
            sta $33            ; $f8e2: 85 33     
            bpl __f8da         ; $f8e4: 10 f4     
__f8e6:     cmp #$70           ; $f8e6: c9 70     
            and #$0f           ; $f8e8: 29 0f     
            bcs __f8c8         ; $f8ea: b0 dc     
            jsr __f8f2         ; $f8ec: 20 f2 f8  
            jmp __f874         ; $f8ef: 4c 74 f8  

;-------------------------------------------------------------------------------
__f8f2:     asl                ; $f8f2: 0a        
            tay                ; $f8f3: a8        
            lda __f8ff,y       ; $f8f4: b9 ff f8  
            sta $3d            ; $f8f7: 85 3d     
            lda __f900,y       ; $f8f9: b9 00 f9  
            sta $3e            ; $f8fc: 85 3e     
            JMP ($003D)           ; $f8fe: 6c 3d 00

;-------------------------------------------------------------------------------
            .hex 15 f9 26 f9   ; $f901: 15 f9 26 f9   Data
            .hex 2d f9 33 f9   ; $f905: 2d f9 33 f9   Data
            .hex 3d f9 47 f9   ; $f909: 3d f9 47 f9   Data
            .hex 4e f9 57 f9   ; $f90d: 4e f9 57 f9   Data
            .hex 77 f9 88 f9   ; $f911: 77 f9 88 f9   Data

;-------------------------------------------------------------------------------
            lda #$00           ; $f915: a9 00     
            ldy $3c            ; $f917: a4 3c     
            sta $0610,y        ; $f919: 99 10 06  
            lda #$80           ; $f91c: a9 80     
            sta $0638,x        ; $f91e: 9d 38 06  
            pla                ; $f921: 68        
            pla                ; $f922: 68        
            jmp __f89a         ; $f923: 4c 9a f8  

;-------------------------------------------------------------------------------
            jsr __fa29         ; $f926: 20 29 fa  
            sta $0664,x        ; $f929: 9d 64 06  
            rts                ; $f92c: 60        

;-------------------------------------------------------------------------------
            jsr __fa29         ; $f92d: 20 29 fa  
            sta $34            ; $f930: 85 34     
            rts                ; $f932: 60        

;-------------------------------------------------------------------------------
            jsr __fa29         ; $f933: 20 29 fa  
            tay                ; $f936: a8        
            lda #$01           ; $f937: a9 01     
            sta $0610,y        ; $f939: 99 10 06  
            rts                ; $f93c: 60        

;-------------------------------------------------------------------------------
            jsr __fa29         ; $f93d: 20 29 fa  
            tay                ; $f940: a8        
            lda #$00           ; $f941: a9 00     
            sta $06bc,y        ; $f943: 99 bc 06  
            rts                ; $f946: 60        

;-------------------------------------------------------------------------------
            jsr __f95e         ; $f947: 20 5e f9  
            bne __f957         ; $f94a: d0 0b     
            beq __f953         ; $f94c: f0 05     
            jsr __f95e         ; $f94e: 20 5e f9  
            beq __f957         ; $f951: f0 04     
__f953:     inc $064e,x        ; $f953: fe 4e 06  
            rts                ; $f956: 60        

;-------------------------------------------------------------------------------
__f957:     jsr __fa29         ; $f957: 20 29 fa  
            sta $064e,x        ; $f95a: 9d 4e 06  
            rts                ; $f95d: 60        

;-------------------------------------------------------------------------------
__f95e:     jsr __fa29         ; $f95e: 20 29 fa  
            pha                ; $f961: 48        
            and #$0f           ; $f962: 29 0f     
            tay                ; $f964: a8        
            lda $06bc,y        ; $f965: b9 bc 06  
            clc                ; $f968: 18        
            adc #$01           ; $f969: 69 01     
            sta $06bc,y        ; $f96b: 99 bc 06  
            pla                ; $f96e: 68        
            lsr                ; $f96f: 4a        
            lsr                ; $f970: 4a        
            lsr                ; $f971: 4a        
            lsr                ; $f972: 4a        
            cmp $06bc,y        ; $f973: d9 bc 06  
            rts                ; $f976: 60        

;-------------------------------------------------------------------------------
            jsr __fa29         ; $f977: 20 29 fa  
            ora #$01           ; $f97a: 09 01     
            sta $06a6,x        ; $f97c: 9d a6 06  
            lda $0664,x        ; $f97f: bd 64 06  
            and #$df           ; $f982: 29 df     
            sta $0664,x        ; $f984: 9d 64 06  
            rts                ; $f987: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $f988: a9 00     
            sta $06a6,x        ; $f98a: 9d a6 06  
            lda $0664,x        ; $f98d: bd 64 06  
            ora #$20           ; $f990: 09 20     
            sta $0664,x        ; $f992: 9d 64 06  
            rts                ; $f995: 60        

;-------------------------------------------------------------------------------
__f996:     sta $3d            ; $f996: 85 3d     
            ldy $3b            ; $f998: a4 3b     
            cpy #$08           ; $f99a: c0 08     
            beq __f9bc         ; $f99c: f0 1e     
            and #$78           ; $f99e: 29 78     
            lsr                ; $f9a0: 4a        
            lsr                ; $f9a1: 4a        
            tay                ; $f9a2: a8        
            lda __f9c3,y       ; $f9a3: b9 c3 f9  
            sta $38            ; $f9a6: 85 38     
            lda __f9c4,y       ; $f9a8: b9 c4 f9  
            sta $39            ; $f9ab: 85 39     
            lda $3d            ; $f9ad: a5 3d     
            and #$07           ; $f9af: 29 07     
            tay                ; $f9b1: a8        
            bpl __f9b8         ; $f9b2: 10 04     
__f9b4:     lsr $38            ; $f9b4: 46 38     
            ror $39            ; $f9b6: 66 39     
__f9b8:     dey                ; $f9b8: 88        
            bpl __f9b4         ; $f9b9: 10 f9     
            rts                ; $f9bb: 60        

;-------------------------------------------------------------------------------
__f9bc:     sta $39            ; $f9bc: 85 39     
            lda #$00           ; $f9be: a9 00     
            sta $38            ; $f9c0: 85 38     
            rts                ; $f9c2: 60        

;-------------------------------------------------------------------------------
__f9c3:     .hex 07            ; $f9c3: 07            Data
__f9c4:     .hex f2 07 80 07   ; $f9c4: f2 07 80 07   Data
            .hex 14 06 ae 06   ; $f9c8: 14 06 ae 06   Data
            .hex 43 05 f4 05   ; $f9cc: 43 05 f4 05   Data
            .hex 9e 05 4e 05   ; $f9d0: 9e 05 4e 05   Data
            .hex 02 04 ba 04   ; $f9d4: 02 04 ba 04   Data
            .hex 76 04 36      ; $f9d8: 76 04 36      Data

;-------------------------------------------------------------------------------
__f9db:     ldy #$00           ; $f9db: a0 00     
            lda ($36),y        ; $f9dd: b1 36     
            and #$03           ; $f9df: 29 03     
            asl                ; $f9e1: 0a        
            asl                ; $f9e2: 0a        
            tay                ; $f9e3: a8        
            lda $0664,x        ; $f9e4: bd 64 06  
            sta $0600,y        ; $f9e7: 99 00 06  
            lda $34            ; $f9ea: a5 34     
            sta $0601,y        ; $f9ec: 99 01 06  
            lda $39            ; $f9ef: a5 39     
            sta $0602,y        ; $f9f1: 99 02 06  
            lda $06a6,x        ; $f9f4: bd a6 06  
            bit __fa25         ; $f9f7: 2c 25 fa  
            bne __f9fe         ; $f9fa: d0 02     
            lda #$08           ; $f9fc: a9 08     
__f9fe:     and #$f8           ; $f9fe: 29 f8     
            ora $38            ; $fa00: 05 38     
            sta $0603,y        ; $fa02: 99 03 06  
            lda $3b            ; $fa05: a5 3b     
            ora $31            ; $fa07: 05 31     
            sta $31            ; $fa09: 85 31     
            rts                ; $fa0b: 60        

;-------------------------------------------------------------------------------
__fa0c:     lda $3c            ; $fa0c: a5 3c     
            asl                ; $fa0e: 0a        
            tay                ; $fa0f: a8        
            lda __fa32,y       ; $fa10: b9 32 fa  
            sta $36            ; $fa13: 85 36     
            lda __fa33,y       ; $fa15: b9 33 fa  
            sta $37            ; $fa18: 85 37     
            ldy #$00           ; $fa1a: a0 00     
            lda ($36),y        ; $fa1c: b1 36     
            tay                ; $fa1e: a8        
            lda __fa25,y       ; $fa1f: b9 25 fa  
            sta $3b            ; $fa22: 85 3b     
            rts                ; $fa24: 60        

;-------------------------------------------------------------------------------
__fa25:     .hex 01 02 04 08   ; $fa25: 01 02 04 08   Data

;-------------------------------------------------------------------------------
__fa29:     ldy $064e,x        ; $fa29: bc 4e 06  
            inc $064e,x        ; $fa2c: fe 4e 06  
            lda ($36),y        ; $fa2f: b1 36     
            rts                ; $fa31: 60        

;-------------------------------------------------------------------------------
__fa32:     .hex b7            ; $fa32: b7            Data
__fa33:     .hex fa a3 fd b4   ; $fa33: fa a3 fd b4   Data
            .hex fd c5 fd d2   ; $fa37: fd c5 fd d2   Data
            .hex fa 06 fb 1f   ; $fa3b: fa 06 fb 1f   Data
            .hex fb 38 fb 51   ; $fa3f: fb 38 fb 51   Data
            .hex fb 5b fb aa   ; $fa43: fb 5b fb aa   Data
            .hex fa 08 fd 65   ; $fa47: fa 08 fd 65   Data
            .hex fb e3 fa c4   ; $fa4b: fb e3 fa c4   Data
            .hex fa 7f fb 87   ; $fa4f: fa 7f fb 87   Data
            .hex fb 33 fe f3   ; $fa53: fb 33 fe f3   Data
            .hex fa 72 fd 9b   ; $fa57: fa 72 fd 9b   Data
            .hex fd 9b fb f8   ; $fa5b: fd 9b fb f8   Data
            .hex fb 26 fc 69   ; $fa5f: fb 26 fc 69   Data
            .hex fc ac fc 2f   ; $fa63: fc ac fc 2f   Data
            .hex fd 4a fd 65   ; $fa67: fd 4a fd 65   Data
            .hex fd cf fc ee   ; $fa6b: fd cf fc ee   Data
            .hex fc d4 fd ef   ; $fa6f: fc d4 fd ef   Data
            .hex fd 0d fe 43   ; $fa73: fd 0d fe 43   Data
            .hex fe b6 fe 09   ; $fa77: fe b6 fe 09   Data
            .hex ff 2b ff 86   ; $fa7b: ff 2b ff 86   Data
            .hex ff af ff      ; $fa7f: ff af ff      Data
__fa82:     .hex 10 13 14 15   ; $fa82: 10 13 14 15   Data
            .hex 04 00 01 02   ; $fa86: 04 00 01 02   Data
            .hex 11 12 05 06   ; $fa8a: 11 12 05 06   Data
            .hex 07 08 09 0a   ; $fa8e: 07 08 09 0a   Data
            .hex 0b 0c 0d 0e   ; $fa92: 0b 0c 0d 0e   Data
            .hex 0f 00 01 00   ; $fa96: 0f 00 01 00   Data
            .hex 01 02 00 01   ; $fa9a: 01 02 00 01   Data
            .hex 02 00 01 00   ; $fa9e: 02 00 01 00   Data
            .hex 01 02 00 01   ; $faa2: 01 02 00 01   Data
            .hex 02 13 14 15   ; $faa6: 02 13 14 15   Data
            .hex 01 62 82 84   ; $faaa: 01 62 82 84   Data
            .hex 14 1c 34 3c   ; $faae: 14 1c 34 3c   Data
            .hex 4c 05 54 3c   ; $fab2: 4c 05 54 3c   Data
            .hex 61 00 62 42   ; $fab6: 61 00 62 42   Data
            .hex 84 5b 04 1c   ; $faba: 84 5b 04 1c   Data
            .hex 3c 54 3c 1c   ; $fabe: 3c 54 3c 1c   Data
            .hex 04 61 01 62   ; $fac2: 04 61 01 62   Data
            .hex 80 82 0b 2b   ; $fac6: 80 82 0b 2b   Data
            .hex 33 43 0b 2b   ; $faca: 33 43 0b 2b   Data
            .hex 33 44 68 04   ; $face: 33 44 68 04   Data
            .hex 00 62 9f 87   ; $fad2: 00 62 9f 87   Data
            .hex 1c 2c 3c 04   ; $fad6: 1c 2c 3c 04   Data
            .hex 53 60 05 60   ; $fada: 53 60 05 60   Data
            .hex 90 62 8b 54   ; $fade: 90 62 8b 54   Data
            .hex 61 00 62 80   ; $fae2: 61 00 62 80   Data
            .hex 82 08 20 58   ; $fae6: 82 08 20 58   Data
            .hex 31 0a 42 1b   ; $faea: 31 0a 42 1b   Data
            .hex 13 1b 23 1b   ; $faee: 13 1b 23 1b   Data
            .hex 61 01 62 80   ; $faf2: 61 01 62 80   Data
            .hex 65 08 81 14   ; $faf6: 65 08 81 14   Data
            .hex 3c 66 68 06   ; $fafa: 3c 66 68 06   Data
            .hex 65 08 14 3c   ; $fafe: 65 08 14 3c   Data
            .hex 66 68 0d 61   ; $fb02: 66 68 0d 61   Data
            .hex 00 62 41 83   ; $fb06: 00 62 41 83   Data
            .hex 53 4b 43 3b   ; $fb0a: 53 4b 43 3b   Data
            .hex 43 3b 33 2b   ; $fb0e: 43 3b 33 2b   Data
            .hex 33 2b 23 1b   ; $fb12: 33 2b 23 1b   Data
            .hex 23 1b 13 0b   ; $fb16: 23 1b 13 0b   Data
            .hex 03 43 23 04   ; $fb1a: 03 43 23 04   Data
            .hex 61 01 62 41   ; $fb1e: 61 01 62 41   Data
            .hex 83 23 1b 13   ; $fb22: 83 23 1b 13   Data
            .hex 0b 13 0b 03   ; $fb26: 0b 13 0b 03   Data
            .hex 5a 03 5a 52   ; $fb2a: 5a 03 5a 52   Data
            .hex 4a 52 4a 42   ; $fb2e: 4a 52 4a 42   Data
            .hex 3a 32 13 52   ; $fb32: 3a 32 13 52   Data
            .hex 33 61 02 62   ; $fb36: 33 61 02 62   Data
            .hex 06 83 0c 04   ; $fb3a: 06 83 0c 04   Data
            .hex 5b 53 5b 53   ; $fb3e: 5b 53 5b 53   Data
            .hex 4b 43 4b 43   ; $fb42: 4b 43 4b 43   Data
            .hex 3b 33 3b 33   ; $fb46: 3b 33 3b 33   Data
            .hex 2b 23 1b 5b   ; $fb4a: 2b 23 1b 5b   Data
            .hex 3b 1c 61 00   ; $fb4e: 3b 1c 61 00   Data
            .hex 62 42 84 23   ; $fb52: 62 42 84 23   Data
            .hex 43 04 1c 23   ; $fb56: 43 04 1c 23   Data
            .hex 61 01 62 42   ; $fb5a: 61 01 62 42   Data
            .hex 84 14 53 33   ; $fb5e: 84 14 53 33   Data
            .hex 1b 13 61 01   ; $fb62: 1b 13 61 01   Data
            .hex 62 c0 81 2a   ; $fb66: 62 c0 81 2a   Data
            .hex 32 42 52 03   ; $fb6a: 32 42 52 03   Data
            .hex 8c 1b 81 2b   ; $fb6e: 8c 1b 81 2b   Data
            .hex 1b 13 8c 03   ; $fb72: 1b 13 8c 03   Data
            .hex 81 52 4a 42   ; $fb76: 81 52 4a 42   Data
            .hex 3a 32 2a 22   ; $fb7a: 3a 32 2a 22   Data
            .hex 61 01 62 80   ; $fb7e: 61 01 62 80   Data
            .hex 82 51 59 68   ; $fb82: 82 51 59 68   Data
            .hex 04 01 62 80   ; $fb86: 04 01 62 80   Data
            .hex 82 1c 2c 3c   ; $fb8a: 82 1c 2c 3c   Data
            .hex 4c 60 34 44   ; $fb8e: 4c 60 34 44   Data
            .hex 54 5c 60 4c   ; $fb92: 54 5c 60 4c   Data
            .hex 54 05 15 60   ; $fb96: 54 05 15 60   Data
            .hex 61 00 62 02   ; $fb9a: 61 00 62 02   Data
            .hex 88 65 00 65   ; $fb9e: 88 65 00 65   Data
            .hex 01 53 3b 3b   ; $fba2: 01 53 3b 3b   Data
            .hex 3b 67 31 18   ; $fba6: 3b 67 31 18   Data
            .hex 67 20 15 5b   ; $fbaa: 67 20 15 5b   Data
            .hex 68 09 04 68   ; $fbae: 68 09 04 68   Data
            .hex 09 a0 60 62   ; $fbb2: 09 a0 60 62   Data
            .hex 41 65 00 86   ; $fbb6: 41 65 00 86   Data
            .hex 60 86 4b 8c   ; $fbba: 60 86 4b 8c   Data
            .hex 53 04 86 53   ; $fbbe: 53 04 86 53   Data
            .hex 8c 4b 66 20   ; $fbc2: 8c 4b 66 20   Data
            .hex 20 65 00 86   ; $fbc6: 20 65 00 86   Data
            .hex 53 9e 53 67   ; $fbca: 53 9e 53 67   Data
            .hex 20 39 8c 4b   ; $fbce: 20 39 8c 4b   Data
            .hex 68 2e 8c 65   ; $fbd2: 68 2e 8c 65   Data
            .hex 00 33 86 33   ; $fbd6: 00 33 86 33   Data
            .hex 8c 3b 43 86   ; $fbda: 8c 3b 43 86   Data
            .hex 3b 8c 67 20   ; $fbde: 3b 8c 67 20   Data
            .hex 4b 33 68 3d   ; $fbe2: 4b 33 68 3d   Data
            .hex 2b 65 00 86   ; $fbe6: 2b 65 00 86   Data
            .hex 53 9e 53 67   ; $fbea: 53 9e 53 67   Data
            .hex 20 59 8c 2b   ; $fbee: 20 59 8c 2b   Data
            .hex 68 4e 86 4b   ; $fbf2: 68 4e 86 4b   Data
            .hex 68 1c 02 62   ; $fbf6: 68 1c 02 62   Data
            .hex 18 88 65 02   ; $fbfa: 18 88 65 02   Data
            .hex 5b 53 66 62   ; $fbfe: 5b 53 66 62   Data
            .hex 06 a0 60 8c   ; $fc02: 06 a0 60 8c   Data
            .hex 65 01 1b 52   ; $fc06: 65 01 1b 52   Data
            .hex 66 41 10 65   ; $fc0a: 66 41 10 65   Data
            .hex 01 13 52 66   ; $fc0e: 01 13 52 66   Data
            .hex 41 17 65 01   ; $fc12: 41 17 65 01   Data
            .hex 03 3a 66 41   ; $fc16: 03 3a 66 41   Data
            .hex 1e 65 01 52   ; $fc1a: 1e 65 01 52   Data
            .hex 2a 66 31 25   ; $fc1e: 2a 66 31 25   Data
            .hex 03 13 68 0e   ; $fc22: 03 13 68 0e   Data
            .hex 00 62 82 65   ; $fc26: 00 62 82 65   Data
            .hex 00 65 01 8a   ; $fc2a: 00 65 01 8a   Data
            .hex 4b 94 53 53   ; $fc2e: 4b 94 53 53   Data
            .hex 8a 53 53 67   ; $fc32: 8a 53 53 67   Data
            .hex 31 1b 67 20   ; $fc36: 31 1b 67 20   Data
            .hex 18 1c 68 08   ; $fc3a: 18 1c 68 08   Data
            .hex 2c 68 08 54   ; $fc3e: 2c 68 08 54   Data
            .hex 94 44 44 3c   ; $fc42: 94 44 44 3c   Data
            .hex 2c 65 00 65   ; $fc46: 2c 65 00 65   Data
            .hex 01 8a 33 94   ; $fc4a: 01 8a 33 94   Data
            .hex 3b 3b 8a 3b   ; $fc4e: 3b 3b 8a 3b   Data
            .hex 3b 67 31 39   ; $fc52: 3b 67 31 39   Data
            .hex 67 20 36 14   ; $fc56: 67 20 36 14   Data
            .hex 68 26 1c 68   ; $fc5a: 68 26 1c 68   Data
            .hex 26 3c 2c 43   ; $fc5e: 26 3c 2c 43   Data
            .hex 04 1c 94 3c   ; $fc62: 04 1c 94 3c   Data
            .hex 54 68 03 01   ; $fc66: 54 68 03 01   Data
            .hex 62 82 65 02   ; $fc6a: 62 82 65 02   Data
            .hex 65 03 8a 33   ; $fc6e: 65 03 8a 33   Data
            .hex 94 3b 3b 8a   ; $fc72: 94 3b 3b 8a   Data
            .hex 3b 3b 67 33   ; $fc76: 3b 3b 67 33   Data
            .hex 1b 67 22 18   ; $fc7a: 1b 67 22 18   Data
            .hex 1c 68 08 2c   ; $fc7e: 1c 68 08 2c   Data
            .hex 68 08 54 94   ; $fc82: 68 08 54 94   Data
            .hex 2c 2c 1c 14   ; $fc86: 2c 2c 1c 14   Data
            .hex 65 02 65 03   ; $fc8a: 65 02 65 03   Data
            .hex 8a 13 94 1b   ; $fc8e: 8a 13 94 1b   Data
            .hex 1b 8a 1b 1b   ; $fc92: 1b 8a 1b 1b   Data
            .hex 67 33 39 67   ; $fc96: 67 33 39 67   Data
            .hex 22 36 14 68   ; $fc9a: 22 36 14 68   Data
            .hex 26 1c 68 26   ; $fc9e: 26 1c 68 26   Data
            .hex 3c 1c 2b 43   ; $fca2: 3c 1c 2b 43   Data
            .hex 04 94 1c 3c   ; $fca6: 04 94 1c 3c   Data
            .hex 68 03 02 62   ; $fcaa: 68 03 02 62   Data
            .hex 0c 8a 1b 52   ; $fcae: 0c 8a 1b 52   Data
            .hex 1b 52 a8 1b   ; $fcb2: 1b 52 a8 1b   Data
            .hex 8a 13 52 13   ; $fcb6: 8a 13 52 13   Data
            .hex 52 a8 13 8a   ; $fcba: 52 a8 13 8a   Data
            .hex 0b 52 0b 52   ; $fcbe: 0b 52 0b 52   Data
            .hex a8 0b 8a 5a   ; $fcc2: a8 0b 8a 5a   Data
            .hex 94 5a 5a 8a   ; $fcc6: 94 5a 5a 8a   Data
            .hex 52 03 13 68   ; $fcca: 52 03 13 68   Data
            .hex 04 00 62 83   ; $fcce: 04 00 62 83   Data
            .hex 90 1a 1a 88   ; $fcd2: 90 1a 1a 88   Data
            .hex 51 98 1a 88   ; $fcd6: 51 98 1a 88   Data
            .hex 51 90 1a 88   ; $fcda: 51 90 1a 88   Data
            .hex 51 90 1a 88   ; $fcde: 51 90 1a 88   Data
            .hex 1a 90 51 90   ; $fce2: 1a 90 51 90   Data
            .hex 02 02 88 60   ; $fce6: 02 02 88 60   Data
            .hex 98 39 02 61   ; $fcea: 98 39 02 61   Data
            .hex 01 62 83 90   ; $fcee: 01 62 83 90   Data
            .hex 19 19 98 1a   ; $fcf2: 19 19 98 1a   Data
            .hex 88 19 60 90   ; $fcf6: 88 19 60 90   Data
            .hex 19 88 19 1a   ; $fcfa: 19 88 19 1a   Data
            .hex 51 60 19 90   ; $fcfe: 51 60 19 90   Data
            .hex 39 39 98 38   ; $fd02: 39 39 98 38   Data
            .hex 39 61 02 62   ; $fd06: 39 61 02 62   Data
            .hex 03 82 52 13   ; $fd0a: 03 82 52 13   Data
            .hex 2b 81 4b 53   ; $fd0e: 2b 81 4b 53   Data
            .hex 14 8f 2c 7b   ; $fd12: 14 8f 2c 7b   Data
            .hex 83 15 81 14   ; $fd16: 83 15 81 14   Data
            .hex 0c 86 04 78   ; $fd1a: 0c 86 04 78   Data
            .hex 83 15 81 14   ; $fd1e: 83 15 81 14   Data
            .hex 0c 86 04 75   ; $fd22: 0c 86 04 75   Data
            .hex 83 15 81 14   ; $fd26: 83 15 81 14   Data
            .hex 0c 86 04 7f   ; $fd2a: 0c 86 04 7f   Data
            .hex 61 00 62 82   ; $fd2e: 61 00 62 82   Data
            .hex 88 4b 53 53   ; $fd32: 88 4b 53 53   Data
            .hex 4a 52 52 49   ; $fd36: 4a 52 52 49   Data
            .hex 51 51 52 03   ; $fd3a: 51 51 52 03   Data
            .hex 13 98 1b 90   ; $fd3e: 13 98 1b 90   Data
            .hex 62 1f 42 69   ; $fd42: 62 1f 42 69   Data
            .hex 50 b8 3a 61   ; $fd46: 50 b8 3a 61   Data
            .hex 01 62 82 88   ; $fd4a: 01 62 82 88   Data
            .hex 4a 52 52 49   ; $fd4e: 4a 52 52 49   Data
            .hex 51 51 48 50   ; $fd52: 51 51 48 50   Data
            .hex 50 51 02 12   ; $fd56: 50 51 02 12   Data
            .hex 98 1a 90 62   ; $fd5a: 98 1a 90 62   Data
            .hex 9f 51 b8 69   ; $fd5e: 9f 51 b8 69   Data
            .hex 50 19 61 02   ; $fd62: 50 19 61 02   Data
            .hex 62 00 bc 4b   ; $fd66: 62 00 bc 4b   Data
            .hex 49 62 70 90   ; $fd6a: 49 62 70 90   Data
            .hex 13 b8 1b 61   ; $fd6e: 13 b8 1b 61   Data
            .hex 01 62 3a 81   ; $fd72: 01 62 3a 81   Data
            .hex 58 01 58 83   ; $fd76: 58 01 58 83   Data
            .hex 01 81 09 01   ; $fd7a: 01 81 09 01   Data
            .hex 09 83 01 81   ; $fd7e: 09 83 01 81   Data
            .hex 50 58 50 83   ; $fd82: 50 58 50 83   Data
            .hex 58 81 01 58   ; $fd86: 58 81 01 58   Data
            .hex 01 83 58 81   ; $fd8a: 01 83 58 81   Data
            .hex 01 09 01 83   ; $fd8e: 01 09 01 83   Data
            .hex 09 81 31 29   ; $fd92: 09 81 31 29   Data
            .hex 31 83 29 68   ; $fd96: 31 83 29 68   Data
            .hex 03 02 62 0f   ; $fd9a: 03 02 62 0f   Data
            .hex 83 1a 2a 68   ; $fd9e: 83 1a 2a 68   Data
            .hex 04 00 62 42   ; $fda2: 04 00 62 42   Data
            .hex 85 53 04 8a   ; $fda6: 85 53 04 8a   Data
            .hex 53 3b 1b 62   ; $fdaa: 53 3b 1b 62   Data
            .hex 5f 69 20 a8   ; $fdae: 5f 69 20 a8   Data
            .hex 3b 61 01 62   ; $fdb2: 3b 61 01 62   Data
            .hex 44 94 3b 62   ; $fdb6: 44 94 3b 62   Data
            .hex 42 8a 1b 52   ; $fdba: 42 8a 1b 52   Data
            .hex 62 5f 69 20   ; $fdbe: 62 5f 69 20   Data
            .hex a8 1b 61 02   ; $fdc2: a8 1b 61 02   Data
            .hex 62 3f 94 1c   ; $fdc6: 62 3f 94 1c   Data
            .hex 8a 62 0f 53   ; $fdca: 8a 62 0f 53   Data
            .hex 3b a8 62 4a   ; $fdce: 3b a8 62 4a   Data
            .hex 53 61 00 62   ; $fdd2: 53 61 00 62   Data
            .hex 85 8c 53 86   ; $fdd6: 85 8c 53 86   Data
            .hex 04 8c 14 86   ; $fdda: 04 8c 14 86   Data
            .hex 53 8c 5b 86   ; $fdde: 53 8c 5b 86   Data
            .hex 04 92 14 1c   ; $fde2: 04 92 14 1c   Data
            .hex 8c 1c a6 62   ; $fde6: 8c 1c a6 62   Data
            .hex 5f 69 d0 1d   ; $fdea: 5f 69 d0 1d   Data
            .hex 61 01 62 82   ; $fdee: 61 01 62 82   Data
            .hex 8c 51 86 52   ; $fdf2: 8c 51 86 52   Data
            .hex 8c 41 86 52   ; $fdf6: 8c 41 86 52   Data
            .hex 8c 39 86 52   ; $fdfa: 8c 39 86 52   Data
            .hex 8c 29 86 52   ; $fdfe: 8c 29 86 52   Data
            .hex 92 19 8c 50   ; $fe02: 92 19 8c 50   Data
            .hex a6 62 9f 69   ; $fe06: a6 62 9f 69   Data
            .hex d0 19 61 02   ; $fe0a: d0 19 61 02   Data
            .hex 62 00 8c 00   ; $fe0e: 62 00 8c 00   Data
            .hex 62 10 86 04   ; $fe12: 62 10 86 04   Data
            .hex 65 00 8c 60   ; $fe16: 65 00 8c 60   Data
            .hex 86 04 66 30   ; $fe1a: 86 04 66 30   Data
            .hex 0b 9e 53 65   ; $fe1e: 0b 9e 53 65   Data
            .hex 00 79 84 55   ; $fe22: 00 79 84 55   Data
            .hex 1e 66 20 18   ; $fe26: 1e 66 20 18   Data
            .hex 76 65 00 55   ; $fe2a: 76 65 00 55   Data
            .hex 1e 66 20 20   ; $fe2e: 1e 66 20 20   Data
            .hex 61 03 62 80   ; $fe32: 61 03 62 80   Data
            .hex 82 07 05 82   ; $fe36: 82 07 05 82   Data
            .hex 60 83 04 03   ; $fe3a: 60 83 04 03   Data
            .hex 82 60 83 01   ; $fe3e: 82 60 83 01   Data
            .hex 61 00 62 82   ; $fe42: 61 00 62 82   Data
            .hex 89 65 02 65   ; $fe46: 89 65 02 65   Data
            .hex 01 65 00 60   ; $fe4a: 01 65 00 60   Data
            .hex 1b 1b 52 0b   ; $fe4e: 1b 1b 52 0b   Data
            .hex 1b 2b 67 41   ; $fe52: 1b 2b 67 41   Data
            .hex 2a 1b 66 20   ; $fe56: 2a 1b 66 20   Data
            .hex 0a 60 3b 53   ; $fe5a: 0a 60 3b 53   Data
            .hex 3b 43 3b 2b   ; $fe5e: 3b 43 3b 2b   Data
            .hex 43 3b 2b 1b   ; $fe62: 43 3b 2b 1b   Data
            .hex 3b 2b 1b 0b   ; $fe66: 3b 2b 1b 0b   Data
            .hex 2b 68 08 3b   ; $fe6a: 2b 68 08 3b   Data
            .hex 60 3b 53 3b   ; $fe6e: 60 3b 53 3b   Data
            .hex 43 2b 0b d1   ; $fe72: 43 2b 0b d1   Data
            .hex 1b 89 67 22   ; $fe76: 1b 89 67 22   Data
            .hex 04 65 01 65   ; $fe7a: 04 65 01 65   Data
            .hex 00 89 60 53   ; $fe7e: 00 89 60 53   Data
            .hex 53 3b 43 53   ; $fe82: 53 3b 43 53   Data
            .hex 04 67 20 4a   ; $fe86: 04 67 20 4a   Data
            .hex 53 68 3c 0c   ; $fe8a: 53 68 3c 0c   Data
            .hex 60 67 21 61   ; $fe8e: 60 67 21 61   Data
            .hex 0c 0c 0c 04   ; $fe92: 0c 0c 0c 04   Data
            .hex 53 43 04 53   ; $fe96: 53 43 04 53   Data
            .hex 92 43 89 53   ; $fe9a: 92 43 89 53   Data
            .hex 92 43 53 89   ; $fe9e: 92 43 53 89   Data
            .hex 68 3a 1c 2c   ; $fea2: 68 3a 1c 2c   Data
            .hex 44 3c 2c 1c   ; $fea6: 44 3c 2c 1c   Data
            .hex 3c 2c 92 1c   ; $feaa: 3c 2c 92 1c   Data
            .hex 89 2c 92 1c   ; $feae: 89 2c 92 1c   Data
            .hex 2c 89 68 06   ; $feb2: 2c 89 68 06   Data
            .hex 01 62 82 65   ; $feb6: 01 62 82 65   Data
            .hex 05 65 04 65   ; $feba: 05 65 04 65   Data
            .hex 03 89 1a 52   ; $febe: 03 89 1a 52   Data
            .hex 1a 52 92 0a   ; $fec2: 1a 52 92 0a   Data
            .hex 0a 66 83 09   ; $fec6: 0a 66 83 09   Data
            .hex 67 25 03 68   ; $feca: 67 25 03 68   Data
            .hex 19 65 03 65   ; $fece: 19 65 03 65   Data
            .hex 04 89 60 3b   ; $fed2: 04 89 60 3b   Data
            .hex 3b 1b 2b 3b   ; $fed6: 3b 1b 2b 3b   Data
            .hex 43 67 24 2b   ; $feda: 43 67 24 2b   Data
            .hex 3b 68 1d 53   ; $fede: 3b 68 1d 53   Data
            .hex 60 67 23 41   ; $fee2: 60 67 23 41   Data
            .hex 53 53 53 43   ; $fee6: 53 53 53 43   Data
            .hex 3b 2b 43 3b   ; $feea: 3b 2b 43 3b   Data
            .hex 92 2b 89 3b   ; $feee: 92 2b 89 3b   Data
            .hex 92 2b 3b 68   ; $fef2: 92 2b 3b 68   Data
            .hex 1b 04 0c 2c   ; $fef6: 1b 04 0c 2c   Data
            .hex 1c 0c 04 1c   ; $fefa: 1c 0c 04 1c   Data
            .hex 4b 92 3b 89   ; $fefe: 4b 92 3b 89   Data
            .hex 4b 92 3b 4b   ; $ff02: 4b 92 3b 4b   Data
            .hex 89 68 07 02   ; $ff06: 89 68 07 02   Data
            .hex 62 0c 65 07   ; $ff0a: 62 0c 65 07   Data
            .hex 65 06 92 3b   ; $ff0e: 65 06 92 3b   Data
            .hex 3b 2b 2b 66   ; $ff12: 3b 2b 2b 66   Data
            .hex 86 08 67 27   ; $ff16: 86 08 67 27   Data
            .hex 03 89 65 06   ; $ff1a: 03 89 65 06   Data
            .hex 1b 52 1b 52   ; $ff1e: 1b 52 1b 52   Data
            .hex 92 0b 0b 89   ; $ff22: 92 0b 0b 89   Data
            .hex 66 86 15 68   ; $ff26: 66 86 15 68   Data
            .hex 05 00 62 81   ; $ff2a: 05 00 62 81   Data
            .hex 65 00 86 62   ; $ff2e: 65 00 86 62   Data
            .hex 81 53 04 8c   ; $ff32: 81 53 04 8c   Data
            .hex 53 1c 86 53   ; $ff36: 53 1c 86 53   Data
            .hex 04 8c 53 62   ; $ff3a: 04 8c 53 62   Data
            .hex 8e a4 1c 62   ; $ff3e: 8e a4 1c 62   Data
            .hex 81 8c 3b 62   ; $ff42: 81 8c 3b 62   Data
            .hex 8e 3b 62 81   ; $ff46: 8e 3b 62 81   Data
            .hex 33 62 8e b0   ; $ff4a: 33 62 8e b0   Data
            .hex 3b 62 81 86   ; $ff4e: 3b 62 81 86   Data
            .hex 2b 3b 8c 2b   ; $ff52: 2b 3b 8c 2b   Data
            .hex 53 86 2b 3b   ; $ff56: 53 86 2b 3b   Data
            .hex 8c 2b b0 62   ; $ff5a: 8c 2b b0 62   Data
            .hex 8e 52 67 20   ; $ff5e: 8e 52 67 20   Data
            .hex 42 98 3b 43   ; $ff62: 42 98 3b 43   Data
            .hex 4b 94 53 84   ; $ff66: 4b 94 53 84   Data
            .hex 60 68 05 62   ; $ff6a: 60 68 05 62   Data
            .hex 81 8c 1b 1b   ; $ff6e: 81 8c 1b 1b   Data
            .hex 1b 1b 60 62   ; $ff72: 1b 1b 60 62   Data
            .hex 80 82 08 20   ; $ff76: 80 82 08 20   Data
            .hex 58 31 0a 42   ; $ff7a: 58 31 0a 42   Data
            .hex 1b 13 1b 23   ; $ff7e: 1b 13 1b 23   Data
            .hex 1b 87 60 61   ; $ff82: 1b 87 60 61   Data
            .hex 01 62 82 8c   ; $ff86: 01 62 82 8c   Data
            .hex 65 02 65 01   ; $ff8a: 65 02 65 01   Data
            .hex 1a 03 51 03   ; $ff8e: 1a 03 51 03   Data
            .hex 66 41 08 12   ; $ff92: 66 41 08 12   Data
            .hex 03 0a 03 02   ; $ff96: 03 0a 03 02   Data
            .hex 03 51 03 67   ; $ff9a: 03 51 03 67   Data
            .hex 22 24 1a 03   ; $ff9e: 22 24 1a 03   Data
            .hex 22 0b 2a 13   ; $ffa2: 22 0b 2a 13   Data
            .hex 51 13 68 06   ; $ffa6: 51 13 68 06   Data
            .hex 1a 1a 1a 1a   ; $ffaa: 1a 1a 1a 1a   Data
            .hex 61 02 62 00   ; $ffae: 61 02 62 00   Data
            .hex 8c 65 04 65   ; $ffb2: 8c 65 04 65   Data
            .hex 03 60 62 17   ; $ffb6: 03 60 62 17   Data
            .hex 3c 66 83 08   ; $ffba: 3c 66 83 08   Data
            .hex 65 03 60 44   ; $ffbe: 65 03 60 44   Data
            .hex 66 43 11 67   ; $ffc2: 66 43 11 67   Data
            .hex 24 23 60 3c   ; $ffc6: 24 23 60 3c   Data
            .hex 60 44 60 4c   ; $ffca: 60 44 60 4c   Data
            .hex 60 54 68 06   ; $ffce: 60 54 68 06   Data
            .hex 3c 3c 3c 3c   ; $ffd2: 3c 3c 3c 3c   Data
            .hex 61 ff ff ff   ; $ffd6: 61 ff ff ff   Data
            .hex ff ff ff ff   ; $ffda: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffde: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffe2: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffe6: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffea: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffee: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fff2: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fff6: ff ff ff ff   Data

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: 49 a7     Vector table
            .dw reset                      ; $fffc: 2d a5     Vector table
            .dw irq                        ; $fffe: 2d a5     Vector table
