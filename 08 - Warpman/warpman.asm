;-------------------------------------------------------------------------------
; Warpman (Japan).nes disasembled by DISASM6 v1.5
; Revised, commented, and generally being turned into something decent by Retrolovania

; Still very much a work in progress!

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 1              ; 1 x 16k PRG banks
            .db 1              ; 1 x 8k CHR banks
            .db %00000000      ; Mirroring: Horizontal
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
            .org $c000         ; Set program counter

;-------------------------------------------------------------------------------
; ROM Start
;-------------------------------------------------------------------------------
            .hex 43 4f 50 59   ; $c000: 43 4f 50 59   Data
            .hex 52 49 47 48   ; $c004: 52 49 47 48   Data
            .hex 54 20 31 39   ; $c008: 54 20 31 39   Data
            .hex 38 31 20 31   ; $c00c: 38 31 20 31   Data
            .hex 39 38 35 20   ; $c010: 39 38 35 20   Data
            .hex 4e 41 4d 43   ; $c014: 4e 41 4d 43   Data
            .hex 4f 20 4c 54   ; $c018: 4f 20 4c 54   Data
            .hex 44 2e 0d 0a   ; $c01c: 44 2e 0d 0a   Data
            .hex 41 4c 4c 20   ; $c020: 41 4c 4c 20   Data
            .hex 52 49 47 48   ; $c024: 52 49 47 48   Data
            .hex 54 53 20 52   ; $c028: 54 53 20 52   Data
            .hex 45 53 45 52   ; $c02c: 45 53 45 52   Data
            .hex 56 45 44 20   ; $c030: 56 45 44 20   Data
            .hex 20 20 20 20   ; $c034: 20 20 20 20   Data
            .hex 20 20 20 20   ; $c038: 20 20 20 20   Data
            .hex 20 20 0d 0a   ; $c03c: 20 20 0d 0a   Data

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      sei                ; $c040: 78        
            cld                ; $c041: d8        
            ldx #$ff           ; $c042: a2 ff     
            txs                ; $c044: 9a        
            lda #$12           ; $c045: a9 12     
            sta $2000          ; $c047: 8d 00 20  
            lda #$06           ; $c04a: a9 06     
            sta $2001          ; $c04c: 8d 01 20  
__c04f:     lda $2002          ; $c04f: ad 02 20  
            bpl __c04f         ; $c052: 10 fb     
            jsr __cb97         ; $c054: 20 97 cb  
            lda #$00           ; $c057: a9 00     
            tax                ; $c059: aa        
__c05a:     sta $0100,x        ; $c05a: 9d 00 01  
            sta $0200,x        ; $c05d: 9d 00 02  
            sta $0400,x        ; $c060: 9d 00 04  
            sta $0500,x        ; $c063: 9d 00 05  
            sta $0600,x        ; $c066: 9d 00 06  
            sta $0700,x        ; $c069: 9d 00 07  
            inx                ; $c06c: e8        
            bne __c05a         ; $c06d: d0 eb     
__c06f:     sta $00,x          ; $c06f: 95 00     
            inx                ; $c071: e8        
            cpx #$b0           ; $c072: e0 b0     
            bne __c06f         ; $c074: d0 f9     
            lda $d0            ; $c076: a5 d0     
            cmp __c106         ; $c078: cd 06 c1  
            bne __c084         ; $c07b: d0 07     
            lda $d1            ; $c07d: a5 d1     
            cmp __c107         ; $c07f: cd 07 c1  
            beq __c090         ; $c082: f0 0c     
__c084:     ldx #$00           ; $c084: a2 00     
__c086:     lda __c0e6,x       ; $c086: bd e6 c0  
            sta $b0,x          ; $c089: 95 b0     
            inx                ; $c08b: e8        
            cpx #$20           ; $c08c: e0 20     
            bne __c086         ; $c08e: d0 f6     
__c090:     ldx #$00           ; $c090: a2 00     
__c092:     lda __c106,x       ; $c092: bd 06 c1  
            sta $d0,x          ; $c095: 95 d0     
            inx                ; $c097: e8        
            cpx #$10           ; $c098: e0 10     
            bne __c092         ; $c09a: d0 f6     
            lda $be            ; $c09c: a5 be     
            sta $bd            ; $c09e: 85 bd     
            jsr __f0a6         ; $c0a0: 20 a6 f0  
            ldy #$03           ; $c0a3: a0 03     
            jsr __c44b         ; $c0a5: 20 4b c4  
__c0a8:     jsr __c14f         ; $c0a8: 20 4f c1  
            jsr __c4db         ; $c0ab: 20 db c4  
            jsr __c165         ; $c0ae: 20 65 c1  
            lda $03            ; $c0b1: a5 03     
            beq __c0be         ; $c0b3: f0 09     
            lda $14            ; $c0b5: a5 14     
            cmp #$01           ; $c0b7: c9 01     
            bne __c0cb         ; $c0b9: d0 10     
            jmp __c0cb         ; $c0bb: 4c cb c0  

;-------------------------------------------------------------------------------
__c0be:     ldy #$00           ; $c0be: a0 00     
            jsr __c46f         ; $c0c0: 20 6f c4  
            ldy #$40           ; $c0c3: a0 40     
            jsr __c46f         ; $c0c5: 20 6f c4  
            jsr __c1df         ; $c0c8: 20 df c1  
__c0cb:     jsr __d0ed         ; $c0cb: 20 ed d0  
            jsr __c4f1         ; $c0ce: 20 f1 c4  
            jsr __d049         ; $c0d1: 20 49 d0  
            lda #$06           ; $c0d4: a9 06     
            sta $2001          ; $c0d6: 8d 01 20  
            jsr __cbae         ; $c0d9: 20 ae cb  
            lda #$1e           ; $c0dc: a9 1e     
            sta $2001          ; $c0de: 8d 01 20  
            inc $01            ; $c0e1: e6 01     
            jmp __c0a8         ; $c0e3: 4c a8 c0  

;-------------------------------------------------------------------------------
__c0e6:     .hex 00 03 00 00   ; $c0e6: 00 03 00 00   Data
            .hex 00 00 00 00   ; $c0ea: 00 00 00 00   Data
            .hex 00 00 00 00   ; $c0ee: 00 00 00 00   Data
            .hex 00 00 00 00   ; $c0f2: 00 00 00 00   Data
            .hex 00 00 00 00   ; $c0f6: 00 00 00 00   Data
            .hex 00 00 00 00   ; $c0fa: 00 00 00 00   Data
            .hex 00 00 00 00   ; $c0fe: 00 00 00 00   Data
            .hex 00 00 00 00   ; $c102: 00 00 00 00   Data
__c106:     .hex 5a            ; $c106: 5a            Data
__c107:     .hex a5 4c 78 c4   ; $c107: a5 4c 78 c4   Data

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        inc $00            ; $c10b: e6 00     
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        rti                ; $c10d: 40        

;-------------------------------------------------------------------------------
            .hex a5 a0 85 a2   ; $c10e: a5 a0 85 a2   Data
            .hex a2 08 a9 00   ; $c112: a2 08 a9 00   Data
            .hex 0a 26 a2 90   ; $c116: 0a 26 a2 90   Data
            .hex 07 18 65 a1   ; $c11a: 07 18 65 a1   Data
            .hex 90 02 e6 a2   ; $c11e: 90 02 e6 a2   Data
            .hex ca d0 f1 85   ; $c122: ca d0 f1 85   Data
            .hex a3 a5 a1 10   ; $c126: a3 a5 a1 10   Data
            .hex 07 a5 a2 38   ; $c12a: 07 a5 a2 38   Data
            .hex e5 a0 85 a2   ; $c12e: e5 a0 85 a2   Data
            .hex 60            ; $c132: 60            Data

;-------------------------------------------------------------------------------
__c133:     lda $0c            ; $c133: a5 0c     
            eor $0d            ; $c135: 45 0d     
            eor #$ff           ; $c137: 49 ff     
            asl                ; $c139: 0a        
            asl                ; $c13a: 0a        
            rol $0d            ; $c13b: 26 0d     
            rol $0c            ; $c13d: 26 0c     
            lda $0e            ; $c13f: a5 0e     
            asl                ; $c141: 0a        
            asl                ; $c142: 0a        
            ora #$01           ; $c143: 09 01     
            clc                ; $c145: 18        
            adc $0e            ; $c146: 65 0e     
            sta $0e            ; $c148: 85 0e     
            eor $0c            ; $c14a: 45 0c     
            eor $0d            ; $c14c: 45 0d     
            rts                ; $c14e: 60        

;-------------------------------------------------------------------------------
__c14f:     lda #$00           ; $c14f: a9 00     
            sta $2005          ; $c151: 8d 05 20  
            lda $0b            ; $c154: a5 0b     
            asl                ; $c156: 0a        
            lda $0a            ; $c157: a5 0a     
            rol                ; $c159: 2a        
            sta $2005          ; $c15a: 8d 05 20  
            lda #$24           ; $c15d: a9 24     
            rol                ; $c15f: 2a        
            asl                ; $c160: 0a        
            sta $2000          ; $c161: 8d 00 20  
            rts                ; $c164: 60        

;-------------------------------------------------------------------------------
__c165:     ldy #$01           ; $c165: a0 01     
            sty $4016          ; $c167: 8c 16 40  
            dey                ; $c16a: 88        
            sty $4016          ; $c16b: 8c 16 40  
            ldx #$00           ; $c16e: a2 00     
            jsr __c18e         ; $c170: 20 8e c1  
            ldy #$01           ; $c173: a0 01     
            ldx #$01           ; $c175: a2 01     
            jsr __c18e         ; $c177: 20 8e c1  
            lda $02            ; $c17a: a5 02     
            beq __c184         ; $c17c: f0 06     
            cmp $16            ; $c17e: c5 16     
            bne __c18d         ; $c180: d0 0b     
            eor $03            ; $c182: 45 03     
__c184:     sta $03            ; $c184: 85 03     
            beq __c18d         ; $c186: f0 05     
            lda #$01           ; $c188: a9 01     
            sta $0600          ; $c18a: 8d 00 06  
__c18d:     rts                ; $c18d: 60        

;-------------------------------------------------------------------------------
__c18e:     lda #$80           ; $c18e: a9 80     
            sta $90            ; $c190: 85 90     
__c192:     lda $4016,y        ; $c192: b9 16 40  
            and #$03           ; $c195: 29 03     
            cmp #$01           ; $c197: c9 01     
            ror $90            ; $c199: 66 90     
            bcc __c192         ; $c19b: 90 f5     
            lda $90            ; $c19d: a5 90     
            lsr                ; $c19f: 4a        
            bcc __c1a4         ; $c1a0: 90 02     
            ora #$01           ; $c1a2: 09 01     
__c1a4:     sta $90            ; $c1a4: 85 90     
__c1a6:     lsr $90            ; $c1a6: 46 90     
            lda $12,x          ; $c1a8: b5 12     
            rol                ; $c1aa: 2a        
            and #$03           ; $c1ab: 29 03     
            sta $12,x          ; $c1ad: 95 12     
            inx                ; $c1af: e8        
            inx                ; $c1b0: e8        
            cpx #$06           ; $c1b1: e0 06     
            bcc __c1a6         ; $c1b3: 90 f1     
            ldy $90            ; $c1b5: a4 90     
            lda __c1bd,y       ; $c1b7: b9 bd c1  
            sta $12,x          ; $c1ba: 95 12     
            rts                ; $c1bc: 60        

;-------------------------------------------------------------------------------
__c1bd:     .hex ff 03 01 ff   ; $c1bd: ff 03 01 ff   Data
            .hex 02 03 01 02   ; $c1c1: 02 03 01 02   Data
            .hex 00 03 01 00   ; $c1c5: 00 03 01 00   Data
            .hex ff 03 01 ff   ; $c1c9: ff 03 01 ff   Data

;-------------------------------------------------------------------------------
__c1cd:     ldx #$00           ; $c1cd: a2 00     
            txa                ; $c1cf: 8a        
__c1d0:     sta $07c0,x        ; $c1d0: 9d c0 07  
            sta $07d0,x        ; $c1d3: 9d d0 07  
            sta $07f0,x        ; $c1d6: 9d f0 07  
            inx                ; $c1d9: e8        
            cpx #$10           ; $c1da: e0 10     
            bne __c1d0         ; $c1dc: d0 f2     
            rts                ; $c1de: 60        

;-------------------------------------------------------------------------------
__c1df:     ldx #$00           ; $c1df: a2 00     
__c1e1:     lda $07c0,x        ; $c1e1: bd c0 07  
            beq __c1f3         ; $c1e4: f0 0d     
            inc $07f0,x        ; $c1e6: fe f0 07  
            lda $07f0,x        ; $c1e9: bd f0 07  
            cmp $07e0,x        ; $c1ec: dd e0 07  
            bcc __c1fb         ; $c1ef: 90 0a     
            lda #$01           ; $c1f1: a9 01     
__c1f3:     sta $07d0,x        ; $c1f3: 9d d0 07  
            lda #$00           ; $c1f6: a9 00     
            sta $07f0,x        ; $c1f8: 9d f0 07  
__c1fb:     inx                ; $c1fb: e8        
            cpx #$10           ; $c1fc: e0 10     
            bne __c1e1         ; $c1fe: d0 e1     
            rts                ; $c200: 60        

;-------------------------------------------------------------------------------
__c201:     sty $93            ; $c201: 84 93     
            sta $92            ; $c203: 85 92     
            asl                ; $c205: 0a        
            tay                ; $c206: a8        
            lda $04e0,x        ; $c207: bd e0 04  
            adc $0520,x        ; $c20a: 7d 20 05  
            sta $04e0,x        ; $c20d: 9d e0 04  
            lda $04c0,x        ; $c210: bd c0 04  
            adc $0500,x        ; $c213: 7d 00 05  
            sta $04c0,x        ; $c216: 9d c0 04  
            lda __c228,y       ; $c219: b9 28 c2  
            sta $90            ; $c21c: 85 90     
            lda __c229,y       ; $c21e: b9 29 c2  
            sta $91            ; $c221: 85 91     
            ldy $93            ; $c223: a4 93     
            jmp ($0090)        ; $c225: 6c 90 00  

;-------------------------------------------------------------------------------
__c228:     .hex 30            ; $c228: 30            Data
__c229:     .hex c2 cc c2 58   ; $c229: c2 cc c2 58   Data
            .hex c2 f4 c2      ; $c22d: c2 f4 c2      Data

;-------------------------------------------------------------------------------
            lda $0460,x        ; $c230: bd 60 04  
            clc                ; $c233: 18        
            adc $0520,x        ; $c234: 7d 20 05  
            sta $9b            ; $c237: 85 9b     
            lda $0440,x        ; $c239: bd 40 04  
            adc $0500,x        ; $c23c: 7d 00 05  
            sta $9a            ; $c23f: 85 9a     
            cmp __c368,y       ; $c241: d9 68 c3  
            bcc __c280         ; $c244: 90 3a     
            lda #$00           ; $c246: a9 00     
            sta $0460,x        ; $c248: 9d 60 04  
            lda __c368,y       ; $c24b: b9 68 c3  
            sta $0440,x        ; $c24e: 9d 40 04  
            lda $92            ; $c251: a5 92     
            ora #$80           ; $c253: 09 80     
            sta $92            ; $c255: 85 92     
            rts                ; $c257: 60        

;-------------------------------------------------------------------------------
            lda $0460,x        ; $c258: bd 60 04  
            sec                ; $c25b: 38        
            sbc $0520,x        ; $c25c: fd 20 05  
            sta $9b            ; $c25f: 85 9b     
            lda $0440,x        ; $c261: bd 40 04  
            sbc $0500,x        ; $c264: fd 00 05  
            sta $9a            ; $c267: 85 9a     
            cmp __c36e,y       ; $c269: d9 6e c3  
            bcs __c280         ; $c26c: b0 12     
            lda #$00           ; $c26e: a9 00     
            sta $0460,x        ; $c270: 9d 60 04  
            lda __c36e,y       ; $c273: b9 6e c3  
            sta $0440,x        ; $c276: 9d 40 04  
            lda $92            ; $c279: a5 92     
            ora #$80           ; $c27b: 09 80     
            sta $92            ; $c27d: 85 92     
            rts                ; $c27f: 60        

;-------------------------------------------------------------------------------
__c280:     lda $50            ; $c280: a5 50     
            bne __c2c1         ; $c282: d0 3d     
            lda $07a2          ; $c284: ad a2 07  
            sta $98            ; $c287: 85 98     
            ldy #$00           ; $c289: a0 00     
__c28b:     sty $99            ; $c28b: 84 99     
            lda $0400,x        ; $c28d: bd 00 04  
            sec                ; $c290: 38        
            sbc $07a3,y        ; $c291: f9 a3 07  
            ldy $93            ; $c294: a4 93     
            clc                ; $c296: 18        
            adc __c37a,y       ; $c297: 79 7a c3  
            cmp __c37d,y       ; $c29a: d9 7d c3  
            bcs __c2b9         ; $c29d: b0 1a     
            ldy $99            ; $c29f: a4 99     
            lda $9a            ; $c2a1: a5 9a     
            sec                ; $c2a3: 38        
            sbc $07a4,y        ; $c2a4: f9 a4 07  
            ldy $93            ; $c2a7: a4 93     
            clc                ; $c2a9: 18        
            adc __c374,y       ; $c2aa: 79 74 c3  
            cmp __c377,y       ; $c2ad: d9 77 c3  
            bcs __c2b9         ; $c2b0: b0 07     
            lda $92            ; $c2b2: a5 92     
            ora #$80           ; $c2b4: 09 80     
            sta $92            ; $c2b6: 85 92     
            rts                ; $c2b8: 60        

;-------------------------------------------------------------------------------
__c2b9:     ldy $99            ; $c2b9: a4 99     
            iny                ; $c2bb: c8        
            iny                ; $c2bc: c8        
            cpy $98            ; $c2bd: c4 98     
            bne __c28b         ; $c2bf: d0 ca     
__c2c1:     lda $9b            ; $c2c1: a5 9b     
            sta $0460,x        ; $c2c3: 9d 60 04  
            lda $9a            ; $c2c6: a5 9a     
            sta $0440,x        ; $c2c8: 9d 40 04  
            rts                ; $c2cb: 60        

;-------------------------------------------------------------------------------
            lda $0420,x        ; $c2cc: bd 20 04  
            clc                ; $c2cf: 18        
            adc $0520,x        ; $c2d0: 7d 20 05  
            sta $9b            ; $c2d3: 85 9b     
            lda $0400,x        ; $c2d5: bd 00 04  
            adc $0500,x        ; $c2d8: 7d 00 05  
            sta $9a            ; $c2db: 85 9a     
            cmp __c36b,y       ; $c2dd: d9 6b c3  
            bcc __c31c         ; $c2e0: 90 3a     
            lda #$00           ; $c2e2: a9 00     
            sta $0420,x        ; $c2e4: 9d 20 04  
            lda __c36b,y       ; $c2e7: b9 6b c3  
            sta $0400,x        ; $c2ea: 9d 00 04  
            lda $92            ; $c2ed: a5 92     
            ora #$80           ; $c2ef: 09 80     
            sta $92            ; $c2f1: 85 92     
            rts                ; $c2f3: 60        

;-------------------------------------------------------------------------------
            lda $0420,x        ; $c2f4: bd 20 04  
            sec                ; $c2f7: 38        
            sbc $0520,x        ; $c2f8: fd 20 05  
            sta $9b            ; $c2fb: 85 9b     
            lda $0400,x        ; $c2fd: bd 00 04  
            sbc $0500,x        ; $c300: fd 00 05  
            sta $9a            ; $c303: 85 9a     
            cmp __c371,y       ; $c305: d9 71 c3  
            bcs __c31c         ; $c308: b0 12     
            lda #$00           ; $c30a: a9 00     
            sta $0420,x        ; $c30c: 9d 20 04  
            lda __c371,y       ; $c30f: b9 71 c3  
            sta $0400,x        ; $c312: 9d 00 04  
            lda $92            ; $c315: a5 92     
            ora #$80           ; $c317: 09 80     
            sta $92            ; $c319: 85 92     
            rts                ; $c31b: 60        

;-------------------------------------------------------------------------------
__c31c:     lda $50            ; $c31c: a5 50     
            bne __c35d         ; $c31e: d0 3d     
            lda $07a2          ; $c320: ad a2 07  
            sta $98            ; $c323: 85 98     
            ldy #$00           ; $c325: a0 00     
__c327:     sty $99            ; $c327: 84 99     
            lda $0440,x        ; $c329: bd 40 04  
            sec                ; $c32c: 38        
            sbc $07a4,y        ; $c32d: f9 a4 07  
            ldy $93            ; $c330: a4 93     
            clc                ; $c332: 18        
            adc __c374,y       ; $c333: 79 74 c3  
            cmp __c377,y       ; $c336: d9 77 c3  
            bcs __c355         ; $c339: b0 1a     
            ldy $99            ; $c33b: a4 99     
            lda $9a            ; $c33d: a5 9a     
            sec                ; $c33f: 38        
            sbc $07a3,y        ; $c340: f9 a3 07  
            ldy $93            ; $c343: a4 93     
            clc                ; $c345: 18        
            adc __c37a,y       ; $c346: 79 7a c3  
            cmp __c37d,y       ; $c349: d9 7d c3  
            bcs __c355         ; $c34c: b0 07     
            lda $92            ; $c34e: a5 92     
            ora #$80           ; $c350: 09 80     
            sta $92            ; $c352: 85 92     
            rts                ; $c354: 60        

;-------------------------------------------------------------------------------
__c355:     ldy $99            ; $c355: a4 99     
            iny                ; $c357: c8        
            iny                ; $c358: c8        
            cpy $98            ; $c359: c4 98     
            bne __c327         ; $c35b: d0 ca     
__c35d:     lda $9b            ; $c35d: a5 9b     
            sta $0420,x        ; $c35f: 9d 20 04  
            lda $9a            ; $c362: a5 9a     
            sta $0400,x        ; $c364: 9d 00 04  
            rts                ; $c367: 60        

;-------------------------------------------------------------------------------
__c368:     .hex e0 eb e8      ; $c368: e0 eb e8      Data
__c36b:     .hex cf da d7      ; $c36b: cf da d7      Data
__c36e:     .hex 20 1d 20      ; $c36e: 20 1d 20      Data
__c371:     .hex 27 24 27      ; $c371: 27 24 27      Data
__c374:     .hex 0b 00 03      ; $c374: 0b 00 03      Data
__c377:     .hex 17 09 0f      ; $c377: 17 09 0f      Data
__c37a:     .hex 0b 00 03      ; $c37a: 0b 00 03      Data
__c37d:     .hex 17 09 0f a0   ; $c37d: 17 09 0f a0   Data
            .hex 00 a5 14 c9   ; $c381: 00 a5 14 c9   Data
            .hex 01 d0 04 b1   ; $c385: 01 d0 04 b1   Data
            .hex ce 85 cd 20   ; $c389: ce 85 cd 20   Data
            .hex c3 c3 a5 14   ; $c38d: c3 c3 a5 14   Data
            .hex c9 02 d0 04   ; $c391: c9 02 d0 04   Data
            .hex a5 cd 91 ce   ; $c395: a5 cd 91 ce   Data
            .hex 20 1f c4 a5   ; $c399: 20 1f c4 a5   Data
            .hex 01 29 0f d0   ; $c39d: 01 29 0f d0   Data
            .hex 20 20 81 cb   ; $c3a1: 20 20 81 cb   Data
            .hex a5 0a d0 19   ; $c3a5: a5 0a d0 19   Data
            .hex a9 1f 99 00   ; $c3a9: a9 1f 99 00   Data
            .hex 02 a9 00 99   ; $c3ad: 02 a9 00 99   Data
            .hex 01 02 99 02   ; $c3b1: 01 02 99 02   Data
            .hex 02 a5 cc 49   ; $c3b5: 02 a5 cc 49   Data
            .hex ff 0a 0a 0a   ; $c3b9: ff 0a 0a 0a   Data
            .hex 69 97 99 03   ; $c3bd: 69 97 99 03   Data
            .hex 02 60 a5 14   ; $c3c1: 02 60 a5 14   Data
            .hex 4a 90 1c a5   ; $c3c5: 4a 90 1c a5   Data
            .hex 18 c5 cb f0   ; $c3c9: 18 c5 cb f0   Data
            .hex 16 85 cb 0a   ; $c3cd: 16 85 cb 0a   Data
            .hex b0 11 4a 4a   ; $c3d1: b0 11 4a 4a   Data
            .hex 90 0e 20 fe   ; $c3d5: 90 0e 20 fe   Data
            .hex c3 a5 cc c9   ; $c3d9: c3 a5 cc c9   Data
            .hex 02 90 04 b1   ; $c3dd: 02 90 04 b1   Data
            .hex ce 85 cd 60   ; $c3e1: ce 85 cd 60   Data
            .hex 4a 90 0d e6   ; $c3e5: 4a 90 0d e6   Data
            .hex cc a5 cc c9   ; $c3e9: cc a5 cc c9   Data
            .hex 06 90 04 a9   ; $c3ed: 06 90 04 a9   Data
            .hex 00 85 cc 60   ; $c3f1: 00 85 cc 60   Data
            .hex c6 cc 10 04   ; $c3f5: c6 cc 10 04   Data
            .hex a9 05 85 cc   ; $c3f9: a9 05 85 cc   Data
            .hex 60 4a a5 cc   ; $c3fd: 60 4a a5 cc   Data
            .hex 90 0e 4a aa   ; $c401: 90 0e 4a aa   Data
            .hex 90 07 b5 cd   ; $c405: 90 07 b5 cd   Data
            .hex 69 0f 95 cd   ; $c409: 69 0f 95 cd   Data
            .hex 60 f6 cd 60   ; $c40d: 60 f6 cd 60   Data
            .hex 4a aa 90 07   ; $c411: 4a aa 90 07   Data
            .hex b5 cd e9 10   ; $c415: b5 cd e9 10   Data
            .hex 95 cd 60 d6   ; $c419: 95 cd 60 d6   Data
            .hex cd 60 a2 00   ; $c41d: cd 60 a2 00   Data
            .hex a5 cf 20 34   ; $c421: a5 cf 20 34   Data
            .hex c4 a5 ce 20   ; $c425: c4 a5 ce 20   Data
            .hex 34 c4 a5 14   ; $c429: 34 c4 a5 14   Data
            .hex 4a a5 cd b0   ; $c42d: 4a a5 cd b0   Data
            .hex 02 b1 ce 48   ; $c431: 02 b1 ce 48   Data
            .hex 4a 4a 4a 4a   ; $c435: 4a 4a 4a 4a   Data
            .hex 20 3f c4 68   ; $c439: 20 3f c4 68   Data
            .hex 29 0f 09 30   ; $c43d: 29 0f 09 30   Data
            .hex c9 3a 90 02   ; $c441: c9 3a 90 02   Data
            .hex 69 06 95 38   ; $c445: 69 06 95 38   Data
            .hex e8 60         ; $c449: e8 60         Data

;-------------------------------------------------------------------------------
__c44b:     lda __c461,y       ; $c44b: b9 61 c4  
            sta $90            ; $c44e: 85 90     
            lda __c462,y       ; $c450: b9 62 c4  
            sta $91            ; $c453: 85 91     
            tsx                ; $c455: ba        
            txa                ; $c456: 8a        
            ldx __c463,y       ; $c457: be 63 c4  
            STA $00c1,x        ; $c45a: 9d c1 00
            txs                ; $c45d: 9a        
            jmp ($0090)        ; $c45e: 6c 90 00  

;-------------------------------------------------------------------------------
__c461:     .hex 79            ; $c461: 79            Data
__c462:     .hex c4            ; $c462: c4            Data
__c463:     .hex 7f bc cd 3f   ; $c463: 7f bc cd 3f   Data
            .hex 7f c4 7f      ; $c467: 7f c4 7f      Data

;-------------------------------------------------------------------------------
__c46a:     tsx                ; $c46a: ba        
            txa                ; $c46b: 8a        
            and #$c0           ; $c46c: 29 c0     
            tay                ; $c46e: a8        
__c46f:     tsx                ; $c46f: ba        
            txa                ; $c470: 8a        
            ldx $0100,y        ; $c471: be 00 01  
            sta $0100,y        ; $c474: 99 00 01  
            txs                ; $c477: 9a        
            rts                ; $c478: 60        

;-------------------------------------------------------------------------------
__c479:     jsr __c46a         ; $c479: 20 6a c4  
            jmp __c479         ; $c47c: 4c 79 c4  

;-------------------------------------------------------------------------------
            jsr __f0a6         ; $c47f: 20 a6 f0  
            jsr __c1cd         ; $c482: 20 cd c1  
            jsr __e3e4         ; $c485: 20 e4 e3  
            jsr __edd8         ; $c488: 20 d8 ed  
            jsr __ef4d         ; $c48b: 20 4d ef  
            lda #$00           ; $c48e: a9 00     
            sta $41            ; $c490: 85 41     
            sta $58            ; $c492: 85 58     
            sta $59            ; $c494: 85 59     
            lda $50            ; $c496: a5 50     
            bne __c4bc         ; $c498: d0 22     
            jsr __e226         ; $c49a: 20 26 e2  
__c49d:     jsr __c46a         ; $c49d: 20 6a c4  
            lda $41            ; $c4a0: a5 41     
            bne __c49d         ; $c4a2: d0 f9     
            jsr __ddbb         ; $c4a4: 20 bb dd  
            jsr __e242         ; $c4a7: 20 42 e2  
            jsr __e40c         ; $c4aa: 20 0c e4  
            jsr __edf4         ; $c4ad: 20 f4 ed  
            jsr __ef79         ; $c4b0: 20 79 ef  
            jsr __d107         ; $c4b3: 20 07 d1  
            jsr __dd37         ; $c4b6: 20 37 dd  
            jmp __c49d         ; $c4b9: 4c 9d c4  

;-------------------------------------------------------------------------------
__c4bc:     jsr __e8d9         ; $c4bc: 20 d9 e8  
__c4bf:     jsr __c46a         ; $c4bf: 20 6a c4  
            lda $41            ; $c4c2: a5 41     
            bne __c4bf         ; $c4c4: d0 f9     
            jsr __ddbb         ; $c4c6: 20 bb dd  
            jsr __e8fb         ; $c4c9: 20 fb e8  
            jsr __e40c         ; $c4cc: 20 0c e4  
            jsr __ef79         ; $c4cf: 20 79 ef  
            jsr __d107         ; $c4d2: 20 07 d1  
            jsr __dd37         ; $c4d5: 20 37 dd  
            jmp __c4bf         ; $c4d8: 4c bf c4  

;-------------------------------------------------------------------------------
__c4db:     ldx #$00           ; $c4db: a2 00     
            stx $07            ; $c4dd: 86 07     
            stx $09            ; $c4df: 86 09     
            lda #$20           ; $c4e1: a9 20     
            sta $08            ; $c4e3: 85 08     
            lda #$f0           ; $c4e5: a9 f0     
__c4e7:     sta $0200,x        ; $c4e7: 9d 00 02  
            inx                ; $c4ea: e8        
            inx                ; $c4eb: e8        
            inx                ; $c4ec: e8        
            inx                ; $c4ed: e8        
            bne __c4e7         ; $c4ee: d0 f7     
            rts                ; $c4f0: 60        

;-------------------------------------------------------------------------------
__c4f1:     ldx #$00           ; $c4f1: a2 00     
            jsr __c5ca         ; $c4f3: 20 ca c5  
            inx                ; $c4f6: e8        
            jsr __c5ca         ; $c4f7: 20 ca c5  
            ldx #$10           ; $c4fa: a2 10     
__c4fc:     jsr __c8d8         ; $c4fc: 20 d8 c8  
            inx                ; $c4ff: e8        
            cpx #$14           ; $c500: e0 14     
            bne __c4fc         ; $c502: d0 f8     
            ldx #$02           ; $c504: a2 02     
__c506:     jsr __c6db         ; $c506: 20 db c6  
            inx                ; $c509: e8        
            cpx $55            ; $c50a: e4 55     
            bne __c506         ; $c50c: d0 f8     
            ldx #$0a           ; $c50e: a2 0a     
__c510:     jsr __c78e         ; $c510: 20 8e c7  
            inx                ; $c513: e8        
            cpx #$0e           ; $c514: e0 0e     
            bne __c510         ; $c516: d0 f8     
            jsr __cb05         ; $c518: 20 05 cb  
            inx                ; $c51b: e8        
            jsr __cb33         ; $c51c: 20 33 cb  
            ldx #$14           ; $c51f: a2 14     
__c521:     jsr __cada         ; $c521: 20 da ca  
            inx                ; $c524: e8        
            cpx #$18           ; $c525: e0 18     
            bne __c521         ; $c527: d0 f8     
            lda $03            ; $c529: a5 03     
            beq __c53a         ; $c52b: f0 0d     
            lda $01            ; $c52d: a5 01     
            and #$10           ; $c52f: 29 10     
            beq __c53a         ; $c531: f0 07     
            ldx $4e            ; $c533: a6 4e     
            bne __c53a         ; $c535: d0 03     
            jsr __c563         ; $c537: 20 63 c5  
__c53a:     lda $04            ; $c53a: a5 04     
            beq __c543         ; $c53c: f0 05     
            dec $04            ; $c53e: c6 04     
            jsr __c561         ; $c540: 20 61 c5  
__c543:     lda $42            ; $c543: a5 42     
            beq __c551         ; $c545: f0 0a     
            dec $42            ; $c547: c6 42     
            ldx #$20           ; $c549: a2 20     
            jsr __c563         ; $c54b: 20 63 c5  
            jsr __c55c         ; $c54e: 20 5c c5  
__c551:     lda $43            ; $c551: a5 43     
            beq __c59f         ; $c553: f0 4a     
            dec $43            ; $c555: c6 43     
            ldx #$25           ; $c557: a2 25     
            jsr __c563         ; $c559: 20 63 c5  
__c55c:     ldx #$16           ; $c55c: a2 16     
            jsr __c563         ; $c55e: 20 63 c5  
__c561:     ldx #$09           ; $c561: a2 09     
__c563:     lda __c5a0,x       ; $c563: bd a0 c5  
            sta $90            ; $c566: 85 90     
            inx                ; $c568: e8        
            lda __c5a0,x       ; $c569: bd a0 c5  
            sta $93            ; $c56c: 85 93     
            inx                ; $c56e: e8        
            lda __c5a0,x       ; $c56f: bd a0 c5  
            sta $92            ; $c572: 85 92     
__c574:     inx                ; $c574: e8        
            lda __c5a0,x       ; $c575: bd a0 c5  
            beq __c59f         ; $c578: f0 25     
            bpl __c597         ; $c57a: 10 1b     
            sta $91            ; $c57c: 85 91     
            jsr __cb81         ; $c57e: 20 81 cb  
            lda $90            ; $c581: a5 90     
            sta $0200,y        ; $c583: 99 00 02  
            lda $91            ; $c586: a5 91     
            sta $0201,y        ; $c588: 99 01 02  
            lda $92            ; $c58b: a5 92     
            sta $0202,y        ; $c58d: 99 02 02  
            lda $93            ; $c590: a5 93     
            sta $0203,y        ; $c592: 99 03 02  
            lda #$08           ; $c595: a9 08     
__c597:     clc                ; $c597: 18        
            adc $93            ; $c598: 65 93     
            sta $93            ; $c59a: 85 93     
            jmp __c574         ; $c59c: 4c 74 c5  

;-------------------------------------------------------------------------------
__c59f:     rts                ; $c59f: 60        

;-------------------------------------------------------------------------------
__c5a0:     .hex 43 74 00 f0   ; $c5a0: 43 74 00 f0   Data
            .hex f1 f2 f3 f4   ; $c5a4: f1 f2 f3 f4   Data
            .hex 00 5b 64 00   ; $c5a8: 00 5b 64 00   Data
            .hex f5 f1 f6 f4   ; $c5ac: f5 f1 f6 f4   Data
            .hex 08 f7 f8 f4   ; $c5b0: 08 f7 f8 f4   Data
            .hex f9 00 43 68   ; $c5b4: f9 00 43 68   Data
            .hex 00 f0 fa f1   ; $c5b8: 00 f0 fa f1   Data
            .hex fb f4 f9 00   ; $c5bc: fb f4 f9 00   Data
            .hex 43 a0 00 fc   ; $c5c0: 43 a0 00 fc   Data
            .hex 00 43 a0 00   ; $c5c4: 00 43 a0 00   Data
            .hex fd 00         ; $c5c8: fd 00         Data

;-------------------------------------------------------------------------------
__c5ca:     lda $0480,x        ; $c5ca: bd 80 04  
            tay                ; $c5cd: a8        
            lda __c5db,y       ; $c5ce: b9 db c5  
            sta $90            ; $c5d1: 85 90     
            lda __c5dc,y       ; $c5d3: b9 dc c5  
            sta $91            ; $c5d6: 85 91     
            jmp ($0090)        ; $c5d8: 6c 90 00  

;-------------------------------------------------------------------------------
__c5db:     .hex 78            ; $c5db: 78            Data
__c5dc:     .hex c4 1a c6 95   ; $c5dc: c4 1a c6 95   Data
            .hex c6 15 c6      ; $c5e0: c6 15 c6      Data

;-------------------------------------------------------------------------------
__c5e3:     ldy #$00           ; $c5e3: a0 00     
__c5e5:     sty $94            ; $c5e5: 84 94     
            lda __c667,y       ; $c5e7: b9 67 c6  
            sta $90            ; $c5ea: 85 90     
            lda __c691,y       ; $c5ec: b9 91 c6  
            sta $93            ; $c5ef: 85 93     
            lda $0540,x        ; $c5f1: bd 40 05  
            and #$0c           ; $c5f4: 29 0c     
            ora $94            ; $c5f6: 05 94     
            tay                ; $c5f8: a8        
            lda __c67b,y       ; $c5f9: b9 7b c6  
            sta $91            ; $c5fc: 85 91     
            tya                ; $c5fe: 98        
            lsr                ; $c5ff: 4a        
            lsr                ; $c600: 4a        
            tay                ; $c601: a8        
            lda __c68b,x       ; $c602: bd 8b c6  
            ora __c68d,y       ; $c605: 19 8d c6  
            sta $92            ; $c608: 85 92     
            jsr __cb56         ; $c60a: 20 56 cb  
            ldy $94            ; $c60d: a4 94     
            iny                ; $c60f: c8        
            cpy #$04           ; $c610: c0 04     
            bne __c5e5         ; $c612: d0 d1     
            rts                ; $c614: 60        

;-------------------------------------------------------------------------------
            lda $01            ; $c615: a5 01     
            lsr                ; $c617: 4a        
            bcs __c666         ; $c618: b0 4c     
            lda $7a,x          ; $c61a: b5 7a     
            bne __c5e3         ; $c61c: d0 c5     
            lda $04c0,x        ; $c61e: bd c0 04  
            lsr                ; $c621: 4a        
            and #$04           ; $c622: 29 04     
            tay                ; $c624: a8        
            lda $05c0,x        ; $c625: bd c0 05  
            asl                ; $c628: 0a        
            lda $04a0,x        ; $c629: bd a0 04  
            bcc __c632         ; $c62c: 90 04     
            ldy #$00           ; $c62e: a0 00     
            ora #$04           ; $c630: 09 04     
__c632:     asl                ; $c632: 0a        
            asl                ; $c633: 0a        
            sta $95            ; $c634: 85 95     
            sty $97            ; $c636: 84 97     
            ldy $04a0,x        ; $c638: bc a0 04  
            lda __c68b,x       ; $c63b: bd 8b c6  
            ora __c68d,y       ; $c63e: 19 8d c6  
            sta $92            ; $c641: 85 92     
            ldy #$00           ; $c643: a0 00     
__c645:     sty $94            ; $c645: 84 94     
            lda __c667,y       ; $c647: b9 67 c6  
            sta $90            ; $c64a: 85 90     
            lda __c691,y       ; $c64c: b9 91 c6  
            sta $93            ; $c64f: 85 93     
            tya                ; $c651: 98        
            ora $95            ; $c652: 05 95     
            tay                ; $c654: a8        
            lda __c66b,y       ; $c655: b9 6b c6  
            ora $97            ; $c658: 05 97     
            sta $91            ; $c65a: 85 91     
            jsr __cb56         ; $c65c: 20 56 cb  
            ldy $94            ; $c65f: a4 94     
            iny                ; $c661: c8        
            cpy #$04           ; $c662: c0 04     
            bne __c645         ; $c664: d0 df     
__c666:     rts                ; $c666: 60        

;-------------------------------------------------------------------------------
__c667:     .hex 00 00 08 08   ; $c667: 00 00 08 08   Data
__c66b:     .hex 10 11 12 13   ; $c66b: 10 11 12 13   Data
            .hex 18 19 1a 1b   ; $c66f: 18 19 1a 1b   Data
            .hex 11 10 13 12   ; $c673: 11 10 13 12   Data
            .hex 20 21 22 23   ; $c677: 20 21 22 23   Data
__c67b:     .hex 04 05 06 07   ; $c67b: 04 05 06 07   Data
            .hex 08 09 0a 0b   ; $c67f: 08 09 0a 0b   Data
            .hex 05 04 07 06   ; $c683: 05 04 07 06   Data
            .hex 0c 0d 0e 0f   ; $c687: 0c 0d 0e 0f   Data
__c68b:     .hex 03 00         ; $c68b: 03 00         Data
__c68d:     .hex 00 00 40 00   ; $c68d: 00 00 40 00   Data
__c691:     .hex 00 08 00 08   ; $c691: 00 08 00 08   Data

;-------------------------------------------------------------------------------
            ldy $04a0,x        ; $c695: bc a0 04  
            lda __c68d,y       ; $c698: b9 8d c6  
            sta $92            ; $c69b: 85 92     
            beq __c6a1         ; $c69d: f0 02     
            lda #$01           ; $c69f: a9 01     
__c6a1:     sta $95            ; $c6a1: 85 95     
            lda $0540,x        ; $c6a3: bd 40 05  
            cmp #$30           ; $c6a6: c9 30     
            lda __c68b,x       ; $c6a8: bd 8b c6  
            bcc __c6af         ; $c6ab: 90 02     
            lda #$00           ; $c6ad: a9 00     
__c6af:     ora $92            ; $c6af: 05 92     
            sta $92            ; $c6b1: 85 92     
            ldy #$00           ; $c6b3: a0 00     
__c6b5:     sty $94            ; $c6b5: 84 94     
            lda __c667,y       ; $c6b7: b9 67 c6  
            sta $90            ; $c6ba: 85 90     
            lda __c691,y       ; $c6bc: b9 91 c6  
            sta $93            ; $c6bf: 85 93     
            lda $0540,x        ; $c6c1: bd 40 05  
            lsr                ; $c6c4: 4a        
            lsr                ; $c6c5: 4a        
            and #$0c           ; $c6c6: 29 0c     
            ora #$a0           ; $c6c8: 09 a0     
            ora $94            ; $c6ca: 05 94     
            eor $95            ; $c6cc: 45 95     
            sta $91            ; $c6ce: 85 91     
            jsr __cb56         ; $c6d0: 20 56 cb  
            ldy $94            ; $c6d3: a4 94     
            iny                ; $c6d5: c8        
            cpy #$04           ; $c6d6: c0 04     
            bne __c6b5         ; $c6d8: d0 db     
            rts                ; $c6da: 60        

;-------------------------------------------------------------------------------
__c6db:     lda $0480,x        ; $c6db: bd 80 04  
            tay                ; $c6de: a8        
            lda __c6ec,y       ; $c6df: b9 ec c6  
            sta $90            ; $c6e2: 85 90     
            lda __c6ed,y       ; $c6e4: b9 ed c6  
            sta $91            ; $c6e7: 85 91     
            jmp ($0090)        ; $c6e9: 6c 90 00  

;-------------------------------------------------------------------------------
__c6ec:     .hex 78            ; $c6ec: 78            Data
__c6ed:     .hex c4 f8 c6 95   ; $c6ed: c4 f8 c6 95   Data
            .hex c8 fa c7 1e   ; $c6f1: c8 fa c7 1e   Data
            .hex c8 48 c7      ; $c6f5: c8 48 c7      Data

;-------------------------------------------------------------------------------
            lda $0580,x        ; $c6f8: bd 80 05  
            asl                ; $c6fb: 0a        
            asl                ; $c6fc: 0a        
            tay                ; $c6fd: a8        
            lda __c881,y       ; $c6fe: b9 81 c8  
            sta $95            ; $c701: 85 95     
            tya                ; $c703: 98        
            ora $05a0,x        ; $c704: 1d a0 05  
            tay                ; $c707: a8        
            lda __c882,y       ; $c708: b9 82 c8  
            sta $96            ; $c70b: 85 96     
            lda $04c0,x        ; $c70d: bd c0 04  
            lsr                ; $c710: 4a        
            and #$04           ; $c711: 29 04     
            ora $04a0,x        ; $c713: 1d a0 04  
            sta $97            ; $c716: 85 97     
            ldy #$00           ; $c718: a0 00     
__c71a:     sty $94            ; $c71a: 84 94     
            lda __c667,y       ; $c71c: b9 67 c6  
            sta $90            ; $c71f: 85 90     
            lda __c691,y       ; $c721: b9 91 c6  
            sta $93            ; $c724: 85 93     
            tya                ; $c726: 98        
            asl                ; $c727: 0a        
            asl                ; $c728: 0a        
            asl                ; $c729: 0a        
            ora $97            ; $c72a: 05 97     
            tay                ; $c72c: a8        
            lda __c859,y       ; $c72d: b9 59 c8  
            ora $95            ; $c730: 05 95     
            sta $91            ; $c732: 85 91     
            ldy $97            ; $c734: a4 97     
            lda __c879,y       ; $c736: b9 79 c8  
            ora $96            ; $c739: 05 96     
            sta $92            ; $c73b: 85 92     
            jsr __cb61         ; $c73d: 20 61 cb  
            ldy $94            ; $c740: a4 94     
            iny                ; $c742: c8        
            cpy #$04           ; $c743: c0 04     
            bne __c71a         ; $c745: d0 d3     
            rts                ; $c747: 60        

;-------------------------------------------------------------------------------
            lda $0580,x        ; $c748: bd 80 05  
            asl                ; $c74b: 0a        
            asl                ; $c74c: 0a        
            ora $05a0,x        ; $c74d: 1d a0 05  
            tay                ; $c750: a8        
            lda __c882,y       ; $c751: b9 82 c8  
            ldy $04a0,x        ; $c754: bc a0 04  
            ora __c68d,y       ; $c757: 19 8d c6  
            sta $92            ; $c75a: 85 92     
            and #$40           ; $c75c: 29 40     
            beq __c762         ; $c75e: f0 02     
            lda #$01           ; $c760: a9 01     
__c762:     sta $95            ; $c762: 85 95     
            ldy #$00           ; $c764: a0 00     
__c766:     sty $94            ; $c766: 84 94     
            lda __c667,y       ; $c768: b9 67 c6  
            sta $90            ; $c76b: 85 90     
            lda __c691,y       ; $c76d: b9 91 c6  
            sta $93            ; $c770: 85 93     
            lda $04a0,x        ; $c772: bd a0 04  
            eor #$03           ; $c775: 49 03     
            beq __c77b         ; $c777: f0 02     
            lda #$04           ; $c779: a9 04     
__c77b:     eor #$8c           ; $c77b: 49 8c     
            ora $94            ; $c77d: 05 94     
            eor $95            ; $c77f: 45 95     
            sta $91            ; $c781: 85 91     
            jsr __cb61         ; $c783: 20 61 cb  
            ldy $94            ; $c786: a4 94     
            iny                ; $c788: c8        
            cpy #$04           ; $c789: c0 04     
            bne __c766         ; $c78b: d0 d9     
            rts                ; $c78d: 60        

;-------------------------------------------------------------------------------
__c78e:     lda $0480,x        ; $c78e: bd 80 04  
            tay                ; $c791: a8        
            lda __c79f,y       ; $c792: b9 9f c7  
            sta $90            ; $c795: 85 90     
            lda __c7a0,y       ; $c797: b9 a0 c7  
            sta $91            ; $c79a: 85 91     
            jmp ($0090)        ; $c79c: 6c 90 00  

;-------------------------------------------------------------------------------
__c79f:     .hex 78            ; $c79f: 78            Data
__c7a0:     .hex c4 a9 c7 95   ; $c7a0: c4 a9 c7 95   Data
            .hex c8 b8 c8 1e   ; $c7a4: c8 b8 c8 1e   Data
            .hex c8            ; $c7a8: c8            Data

;-------------------------------------------------------------------------------
            ldy $0580,x        ; $c7a9: bc 80 05  
            lda __c84e,y       ; $c7ac: b9 4e c8  
            sta $92            ; $c7af: 85 92     
            sta $ca            ; $c7b1: 85 ca     
            ldy #$00           ; $c7b3: a0 00     
__c7b5:     sty $94            ; $c7b5: 84 94     
            lda __c667,y       ; $c7b7: b9 67 c6  
            sta $90            ; $c7ba: 85 90     
            lda __c691,y       ; $c7bc: b9 91 c6  
            sta $93            ; $c7bf: 85 93     
            lda $04c0,x        ; $c7c1: bd c0 04  
            lsr                ; $c7c4: 4a        
            and #$04           ; $c7c5: 29 04     
            ora $94            ; $c7c7: 05 94     
            ldy $0580,x        ; $c7c9: bc 80 05  
            ora __c84b,y       ; $c7cc: 19 4b c8  
            sta $91            ; $c7cf: 85 91     
            jsr __cb61         ; $c7d1: 20 61 cb  
            ldy $94            ; $c7d4: a4 94     
            iny                ; $c7d6: c8        
            cpy #$04           ; $c7d7: c0 04     
            bne __c7b5         ; $c7d9: d0 da     
            lda $05e0,x        ; $c7db: bd e0 05  
            beq __c7f9         ; $c7de: f0 19     
            clc                ; $c7e0: 18        
            adc #$8f           ; $c7e1: 69 8f     
            sta $91            ; $c7e3: 85 91     
            ldy $04a0,x        ; $c7e5: bc a0 04  
            lda __c851,y       ; $c7e8: b9 51 c8  
            sta $90            ; $c7eb: 85 90     
            lda __c855,y       ; $c7ed: b9 55 c8  
            sta $93            ; $c7f0: 85 93     
            lda #$00           ; $c7f2: a9 00     
            sta $92            ; $c7f4: 85 92     
            jmp __cb61         ; $c7f6: 4c 61 cb  

;-------------------------------------------------------------------------------
__c7f9:     rts                ; $c7f9: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $c7fa: a9 00     
            sta $92            ; $c7fc: 85 92     
            lda $0540,x        ; $c7fe: bd 40 05  
            cmp #$40           ; $c801: c9 40     
            bcc __c807         ; $c803: 90 02     
            lda #$30           ; $c805: a9 30     
__c807:     and #$30           ; $c807: 29 30     
            lsr                ; $c809: 4a        
            lsr                ; $c80a: 4a        
            ora #$b0           ; $c80b: 09 b0     
            sta $95            ; $c80d: 85 95     
            and #$0c           ; $c80f: 29 0c     
            bne __c82c         ; $c811: d0 19     
            ldy $05a0,x        ; $c813: bc a0 05  
            lda __c88a,y       ; $c816: b9 8a c8  
            sta $92            ; $c819: 85 92     
            jmp __c82c         ; $c81b: 4c 2c c8  

;-------------------------------------------------------------------------------
            lda #$02           ; $c81e: a9 02     
            sta $92            ; $c820: 85 92     
            lda $0540,x        ; $c822: bd 40 05  
            lsr                ; $c825: 4a        
            and #$0c           ; $c826: 29 0c     
            ora #$c0           ; $c828: 09 c0     
            sta $95            ; $c82a: 85 95     
__c82c:     ldy #$00           ; $c82c: a0 00     
__c82e:     sty $94            ; $c82e: 84 94     
            lda __c667,y       ; $c830: b9 67 c6  
            sta $90            ; $c833: 85 90     
            lda __c691,y       ; $c835: b9 91 c6  
            sta $93            ; $c838: 85 93     
            lda $95            ; $c83a: a5 95     
            ora $94            ; $c83c: 05 94     
            sta $91            ; $c83e: 85 91     
            jsr __cb61         ; $c840: 20 61 cb  
            ldy $94            ; $c843: a4 94     
            iny                ; $c845: c8        
            cpy #$04           ; $c846: c0 04     
            bne __c82e         ; $c848: d0 e4     
            rts                ; $c84a: 60        

;-------------------------------------------------------------------------------
__c84b:     .hex 60 68 70      ; $c84b: 60 68 70      Data
__c84e:     .hex 00 00 03      ; $c84e: 00 00 03      Data
__c851:     .hex 04 f8 04 10   ; $c851: 04 f8 04 10   Data
__c855:     .hex f8 04 10 04   ; $c855: f8 04 10 04   Data
__c859:     .hex 01 08 00 0c   ; $c859: 01 08 00 0c   Data
            .hex 05 09 04 0d   ; $c85d: 05 09 04 0d   Data
            .hex 00 09 01 0d   ; $c861: 00 09 01 0d   Data
            .hex 04 08 05 0c   ; $c865: 04 08 05 0c   Data
            .hex 03 0a 02 0e   ; $c869: 03 0a 02 0e   Data
            .hex 07 0b 06 0f   ; $c86d: 07 0b 06 0f   Data
            .hex 02 0b 03 0f   ; $c871: 02 0b 03 0f   Data
            .hex 06 0a 07 0e   ; $c875: 06 0a 07 0e   Data
__c879:     .hex 40 00 00 00   ; $c879: 40 00 00 00   Data
            .hex 40 40 00 40   ; $c87d: 40 40 00 40   Data
__c881:     .hex 30            ; $c881: 30            Data
__c882:     .hex 01 02 03 40   ; $c882: 01 02 03 40   Data
            .hex 01 02 03 50   ; $c886: 01 02 03 50   Data
__c88a:     .hex 01 02 03 84   ; $c88a: 01 02 03 84   Data
            .hex 85 86 87 85   ; $c88e: 85 86 87 85   Data
            .hex 84 87 86      ; $c892: 84 87 86      Data

;-------------------------------------------------------------------------------
            lda #$00           ; $c895: a9 00     
            sta $92            ; $c897: 85 92     
            ldy #$00           ; $c899: a0 00     
__c89b:     sty $94            ; $c89b: 84 94     
            lda __c667,y       ; $c89d: b9 67 c6  
            sta $90            ; $c8a0: 85 90     
            lda __c691,y       ; $c8a2: b9 91 c6  
            sta $93            ; $c8a5: 85 93     
            lda $94            ; $c8a7: a5 94     
            ora #$ac           ; $c8a9: 09 ac     
            sta $91            ; $c8ab: 85 91     
            jsr __cb61         ; $c8ad: 20 61 cb  
            ldy $94            ; $c8b0: a4 94     
            iny                ; $c8b2: c8        
            cpy #$04           ; $c8b3: c0 04     
            bne __c89b         ; $c8b5: d0 e4     
            rts                ; $c8b7: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $c8b8: a9 00     
            sta $92            ; $c8ba: 85 92     
            sta $93            ; $c8bc: 85 93     
            lda #$04           ; $c8be: a9 04     
            sta $90            ; $c8c0: 85 90     
            lda $05a0,x        ; $c8c2: bd a0 05  
            clc                ; $c8c5: 18        
            adc #$9a           ; $c8c6: 69 9a     
__c8c8:     sta $91            ; $c8c8: 85 91     
            jsr __cb61         ; $c8ca: 20 61 cb  
            lda #$08           ; $c8cd: a9 08     
            sta $93            ; $c8cf: 85 93     
            lda #$9c           ; $c8d1: a9 9c     
            sta $91            ; $c8d3: 85 91     
            jmp __cb61         ; $c8d5: 4c 61 cb  

;-------------------------------------------------------------------------------
__c8d8:     lda $50            ; $c8d8: a5 50     
            bne __c906         ; $c8da: d0 2a     
            ldy $0480,x        ; $c8dc: bc 80 04  
            lda __c8ec,y       ; $c8df: b9 ec c8  
            sta $90            ; $c8e2: 85 90     
            lda __c8ed,y       ; $c8e4: b9 ed c8  
            sta $91            ; $c8e7: 85 91     
            jmp ($0090)        ; $c8e9: 6c 90 00  

;-------------------------------------------------------------------------------
__c8ec:     .hex 78            ; $c8ec: 78            Data
__c8ed:     .hex c4 f4 c8 4f   ; $c8ed: c4 f4 c8 4f   Data
            .hex c9 22 c9      ; $c8f1: c9 22 c9      Data

;-------------------------------------------------------------------------------
            lda #$00           ; $c8f4: a9 00     
            sta $90            ; $c8f6: 85 90     
            sta $92            ; $c8f8: 85 92     
            sta $93            ; $c8fa: 85 93     
            lda $0580,x        ; $c8fc: bd 80 05  
            ora #$9a           ; $c8ff: 09 9a     
            sta $91            ; $c901: 85 91     
            jmp __cb61         ; $c903: 4c 61 cb  

;-------------------------------------------------------------------------------
__c906:     ldy $0480,x        ; $c906: bc 80 04  
            lda __c916,y       ; $c909: b9 16 c9  
            sta $90            ; $c90c: 85 90     
            lda __c917,y       ; $c90e: b9 17 c9  
            sta $91            ; $c911: 85 91     
            jmp ($0090)        ; $c913: 6c 90 00  

;-------------------------------------------------------------------------------
__c916:     .hex 78            ; $c916: 78            Data
__c917:     .hex c4 3a c9 3a   ; $c917: c4 3a c9 3a   Data
            .hex c9 3a c9 9e   ; $c91b: c9 3a c9 9e   Data
            .hex c9 22 c9      ; $c91f: c9 22 c9      Data

;-------------------------------------------------------------------------------
            lda #$00           ; $c922: a9 00     
            sta $92            ; $c924: 85 92     
            sta $93            ; $c926: 85 93     
            lda #$04           ; $c928: a9 04     
            sta $90            ; $c92a: 85 90     
            lda $05a0,x        ; $c92c: bd a0 05  
            cmp #$04           ; $c92f: c9 04     
            bcc __c935         ; $c931: 90 02     
            lda #$03           ; $c933: a9 03     
__c935:     adc #$9b           ; $c935: 69 9b     
            jmp __c8c8         ; $c937: 4c c8 c8  

;-------------------------------------------------------------------------------
            lda $0580,x        ; $c93a: bd 80 05  
            ora #$96           ; $c93d: 09 96     
            sta $91            ; $c93f: 85 91     
            lda $04e0,x        ; $c941: bd e0 04  
            sta $92            ; $c944: 85 92     
            lda #$04           ; $c946: a9 04     
            sta $90            ; $c948: 85 90     
            sta $93            ; $c94a: 85 93     
            jmp __cb61         ; $c94c: 4c 61 cb  

;-------------------------------------------------------------------------------
__c94f:     lda #$08           ; $c94f: a9 08     
            sta $94            ; $c951: 85 94     
            lda #$2f           ; $c953: a9 2f     
            sta $91            ; $c955: 85 91     
__c957:     jsr __c9cb         ; $c957: 20 cb c9  
            jsr __ca01         ; $c95a: 20 01 ca  
            dec $94            ; $c95d: c6 94     
            bne __c957         ; $c95f: d0 f6     
            lda $0540,x        ; $c961: bd 40 05  
            cmp #$06           ; $c964: c9 06     
            bcs __c99d         ; $c966: b0 35     
            asl                ; $c968: 0a        
            tay                ; $c969: a8        
            lda __ca69,y       ; $c96a: b9 69 ca  
            sta $96            ; $c96d: 85 96     
            lda __ca6a,y       ; $c96f: b9 6a ca  
            sta $97            ; $c972: 85 97     
            ldy #$00           ; $c974: a0 00     
            lda ($96),y        ; $c976: b1 96     
            sta $94            ; $c978: 85 94     
            iny                ; $c97a: c8        
__c97b:     lda ($96),y        ; $c97b: b1 96     
            clc                ; $c97d: 18        
            adc $0400,x        ; $c97e: 7d 00 04  
            sta $90            ; $c981: 85 90     
            iny                ; $c983: c8        
            lda ($96),y        ; $c984: b1 96     
            clc                ; $c986: 18        
            adc $0440,x        ; $c987: 7d 40 04  
            sta $93            ; $c98a: 85 93     
            iny                ; $c98c: c8        
            lda ($96),y        ; $c98d: b1 96     
            sta $92            ; $c98f: 85 92     
            iny                ; $c991: c8        
            sty $95            ; $c992: 84 95     
            jsr __ca01         ; $c994: 20 01 ca  
            ldy $95            ; $c997: a4 95     
            dec $94            ; $c999: c6 94     
            bne __c97b         ; $c99b: d0 de     
__c99d:     rts                ; $c99d: 60        

;-------------------------------------------------------------------------------
            lda $0580,x        ; $c99e: bd 80 05  
            bne __c94f         ; $c9a1: d0 ac     
            lda #$08           ; $c9a3: a9 08     
            sta $94            ; $c9a5: 85 94     
            lda #$2e           ; $c9a7: a9 2e     
            sta $91            ; $c9a9: 85 91     
__c9ab:     jsr __c9cb         ; $c9ab: 20 cb c9  
            lda $0540,x        ; $c9ae: bd 40 05  
            cmp #$07           ; $c9b1: c9 07     
            bcs __c9c3         ; $c9b3: b0 0e     
            lda $94            ; $c9b5: a5 94     
            sbc #$00           ; $c9b7: e9 00     
            lsr                ; $c9b9: 4a        
            tay                ; $c9ba: a8        
            lda __d1f6,y       ; $c9bb: b9 f6 d1  
            and $04c0,x        ; $c9be: 3d c0 04  
            bne __c9c6         ; $c9c1: d0 03     
__c9c3:     jsr __ca13         ; $c9c3: 20 13 ca  
__c9c6:     dec $94            ; $c9c6: c6 94     
            bne __c9ab         ; $c9c8: d0 e1     
            rts                ; $c9ca: 60        

;-------------------------------------------------------------------------------
__c9cb:     ldy $94            ; $c9cb: a4 94     
            lda $0540,x        ; $c9cd: bd 40 05  
            and #$03           ; $c9d0: 29 03     
            ora __ca2a,y       ; $c9d2: 19 2a ca  
            sta $92            ; $c9d5: 85 92     
            tya                ; $c9d7: 98        
            asl                ; $c9d8: 0a        
            tay                ; $c9d9: a8        
            lda __ca31,y       ; $c9da: b9 31 ca  
            sta $d3            ; $c9dd: 85 d3     
            lda __ca32,y       ; $c9df: b9 32 ca  
            sta $d4            ; $c9e2: 85 d4     
            jsr $00d2          ; $c9e4: 20 d2 00  
            clc                ; $c9e7: 18        
            adc $0400,x        ; $c9e8: 7d 00 04  
            sta $90            ; $c9eb: 85 90     
            lda __ca41,y       ; $c9ed: b9 41 ca  
            sta $d3            ; $c9f0: 85 d3     
            lda __ca42,y       ; $c9f2: b9 42 ca  
            sta $d4            ; $c9f5: 85 d4     
            jsr $00d2          ; $c9f7: 20 d2 00  
            clc                ; $c9fa: 18        
            adc $0440,x        ; $c9fb: 7d 40 04  
            sta $93            ; $c9fe: 85 93     
            rts                ; $ca00: 60        

;-------------------------------------------------------------------------------
__ca01:     lda $90            ; $ca01: a5 90     
            sec                ; $ca03: 38        
            sbc #$23           ; $ca04: e9 23     
            cmp #$b9           ; $ca06: c9 b9     
            bcs __ca2a         ; $ca08: b0 20     
            lda $93            ; $ca0a: a5 93     
            sec                ; $ca0c: 38        
            sbc #$1c           ; $ca0d: e9 1c     
            cmp #$d1           ; $ca0f: c9 d1     
            bcs __ca2a         ; $ca11: b0 17     
__ca13:     jsr __cb81         ; $ca13: 20 81 cb  
            lda $90            ; $ca16: a5 90     
            sta $0200,y        ; $ca18: 99 00 02  
            lda $91            ; $ca1b: a5 91     
            sta $0201,y        ; $ca1d: 99 01 02  
            lda $92            ; $ca20: a5 92     
            sta $0202,y        ; $ca22: 99 02 02  
            lda $93            ; $ca25: a5 93     
            sta $0203,y        ; $ca27: 99 03 02  
__ca2a:     rts                ; $ca2a: 60        

;-------------------------------------------------------------------------------
            .hex 40 00 00 80   ; $ca2b: 40 00 00 80   Data
            .hex 80 c0         ; $ca2f: 80 c0         Data
__ca31:     .hex c0            ; $ca31: c0            Data
__ca32:     .hex 40 63 ca 63   ; $ca32: 40 63 ca 63   Data
            .hex ca 53 ca 56   ; $ca36: ca 53 ca 56   Data
            .hex ca 59 ca 59   ; $ca3a: ca 59 ca 59   Data
            .hex ca 56 ca      ; $ca3e: ca 56 ca      Data
__ca41:     .hex 53            ; $ca41: 53            Data
__ca42:     .hex ca 56 ca 53   ; $ca42: ca 56 ca 53   Data
            .hex ca 63 ca 63   ; $ca46: ca 63 ca 63   Data
            .hex ca 53 ca 56   ; $ca4a: ca 53 ca 56   Data
            .hex ca 59 ca 59   ; $ca4e: ca 59 ca 59   Data
            .hex ca            ; $ca52: ca            Data

;-------------------------------------------------------------------------------
            lda #$00           ; $ca53: a9 00     
            rts                ; $ca55: 60        

;-------------------------------------------------------------------------------
            lda #$08           ; $ca56: a9 08     
            rts                ; $ca58: 60        

;-------------------------------------------------------------------------------
            lda $0540,x        ; $ca59: bd 40 05  
            eor #$ff           ; $ca5c: 49 ff     
            asl                ; $ca5e: 0a        
            asl                ; $ca5f: 0a        
            adc #$2b           ; $ca60: 69 2b     
            rts                ; $ca62: 60        

;-------------------------------------------------------------------------------
            lda $0540,x        ; $ca63: bd 40 05  
            asl                ; $ca66: 0a        
            asl                ; $ca67: 0a        
            adc #$E0           ; $ca68: 69 e0
__ca6a:     rts                ; $ca6a: 60        

;-------------------------------------------------------------------------------
            .hex 75 ca 8e ca   ; $ca6b: 75 ca 8e ca   Data
            .hex a7 ca b4 ca   ; $ca6f: a7 ca b4 ca   Data
            .hex cd ca 08 f0   ; $ca73: cd ca 08 f0   Data
            .hex e8 01 e8 f0   ; $ca77: e8 01 e8 f0   Data
            .hex 01 e8 18 41   ; $ca7b: 01 e8 18 41   Data
            .hex f0 20 41 18   ; $ca7f: f0 20 41 18   Data
            .hex e8 81 20 f0   ; $ca83: e8 81 20 f0   Data
            .hex 81 20 18 c1   ; $ca87: 81 20 18 c1   Data
            .hex 18 20 c1 08   ; $ca8b: 18 20 c1 08   Data
            .hex f8 e8 02 e8   ; $ca8f: f8 e8 02 e8   Data
            .hex f8 02 e8 10   ; $ca93: f8 02 e8 10   Data
            .hex 42 f8 20 42   ; $ca97: 42 f8 20 42   Data
            .hex 10 e8 82 20   ; $ca9b: 10 e8 82 20   Data
            .hex f8 82 20 10   ; $ca9f: f8 82 20 10   Data
            .hex c2 10 20 c2   ; $caa3: c2 10 20 c2   Data
            .hex 04 f0 f0 03   ; $caa7: 04 f0 f0 03   Data
            .hex f0 18 43 18   ; $caab: f0 18 43 18   Data
            .hex f0 83 18 18   ; $caaf: f0 83 18 18   Data
            .hex c3 08 f8 f0   ; $cab3: c3 08 f8 f0   Data
            .hex 00 f0 f8 00   ; $cab7: 00 f0 f8 00   Data
            .hex f0 10 40 f8   ; $cabb: f0 10 40 f8   Data
            .hex 18 40 10 f0   ; $cabf: 18 40 10 f0   Data
            .hex 80 18 f8 80   ; $cac3: 80 18 f8 80   Data
            .hex 18 10 c0 10   ; $cac7: 18 10 c0 10   Data
            .hex 18 c0 04 f8   ; $cacb: 18 c0 04 f8   Data
            .hex f8 01 f8 10   ; $cacf: f8 01 f8 10   Data
            .hex 41 10 f8 81   ; $cad3: 41 10 f8 81   Data
            .hex 10 10 c1      ; $cad7: 10 10 c1      Data

;-------------------------------------------------------------------------------
__cada:     lda $0480,x        ; $cada: bd 80 04  
            beq __cafc         ; $cadd: f0 1d     
            lda #$00           ; $cadf: a9 00     
            sta $90            ; $cae1: 85 90     
            sta $93            ; $cae3: 85 93     
            ldy $04a0,x        ; $cae5: bc a0 04  
            lda $04c0,x        ; $cae8: bd c0 04  
            and #$08           ; $caeb: 29 08     
            lsr                ; $caed: 4a        
            lsr                ; $caee: 4a        
            ora __cafd,y       ; $caef: 19 fd ca  
            sta $91            ; $caf2: 85 91     
            lda __cb01,y       ; $caf4: b9 01 cb  
            sta $92            ; $caf7: 85 92     
            jmp __cb61         ; $caf9: 4c 61 cb  

;-------------------------------------------------------------------------------
__cafc:     rts                ; $cafc: 60        

;-------------------------------------------------------------------------------
__cafd:     .hex 28 29 28 29   ; $cafd: 28 29 28 29   Data
__cb01:     .hex 02 02 42 82   ; $cb01: 02 02 42 82   Data

;-------------------------------------------------------------------------------
__cb05:     ldy $0480,x        ; $cb05: bc 80 04  
            beq __cb80         ; $cb08: f0 76     
            lda __cb2d,y       ; $cb0a: b9 2d cb  
            sta $91            ; $cb0d: 85 91     
            lda __cb2e,y       ; $cb0f: b9 2e cb  
            sta $92            ; $cb12: 85 92     
            ldy #$00           ; $cb14: a0 00     
            sty $94            ; $cb16: 84 94     
            lda __c667,y       ; $cb18: b9 67 c6  
            sta $90            ; $cb1b: 85 90     
            lda __c691,y       ; $cb1d: b9 91 c6  
            sta $93            ; $cb20: 85 93     
            jsr __cb61         ; $cb22: 20 61 cb  
            inc $91            ; $cb25: e6 91     
            ldy $94            ; $cb27: a4 94     
            iny                ; $cb29: c8        
            cpy #$04           ; $cb2a: c0 04     
            BNE __cb16         ; $cb2c: d0 e8
__cb2d:     inx                ; $cb2d: e8        
__cb2e:     rts                ; $cb2e: 60        

;-------------------------------------------------------------------------------
            .hex 78 02 7c 02   ; $cb2f: 78 02 7c 02   Data

;-------------------------------------------------------------------------------
__cb33:     lda $0480,x        ; $cb33: bd 80 04  
            beq __cb2e         ; $cb36: f0 f6     
            lda #$04           ; $cb38: a9 04     
            sta $90            ; $cb3a: 85 90     
            sta $93            ; $cb3c: 85 93     
            lda $04e0,x        ; $cb3e: bd e0 04  
            and #$08           ; $cb41: 29 08     
            beq __cb47         ; $cb43: f0 02     
            lda #$40           ; $cb45: a9 40     
__cb47:     ora $50            ; $cb47: 05 50     
            eor #$01           ; $cb49: 49 01     
            sta $92            ; $cb4b: 85 92     
            lda $50            ; $cb4d: a5 50     
            ora #$2c           ; $cb4f: 09 2c     
            sta $91            ; $cb51: 85 91     
            jmp __cb61         ; $cb53: 4c 61 cb  

;-------------------------------------------------------------------------------
__cb56:     ldy $07            ; $cb56: a4 07     
            tya                ; $cb58: 98        
            clc                ; $cb59: 18        
            adc #$04           ; $cb5a: 69 04     
            sta $07            ; $cb5c: 85 07     
            jmp __cb64         ; $cb5e: 4c 64 cb  

;-------------------------------------------------------------------------------
__cb61:     jsr __cb81         ; $cb61: 20 81 cb  
__cb64:     lda $0400,x        ; $cb64: bd 00 04  
            clc                ; $cb67: 18        
            adc $90            ; $cb68: 65 90     
            sta $0200,y        ; $cb6a: 99 00 02  
            lda $91            ; $cb6d: a5 91     
            sta $0201,y        ; $cb6f: 99 01 02  
            lda $92            ; $cb72: a5 92     
            sta $0202,y        ; $cb74: 99 02 02  
            lda $0440,x        ; $cb77: bd 40 04  
            clc                ; $cb7a: 18        
            adc $93            ; $cb7b: 65 93     
            sta $0203,y        ; $cb7d: 99 03 02  
__cb80:     rts                ; $cb80: 60        

;-------------------------------------------------------------------------------
__cb81:     lda $08            ; $cb81: a5 08     
            tay                ; $cb83: a8        
            clc                ; $cb84: 18        
            adc #$04           ; $cb85: 69 04     
            beq __cb8b         ; $cb87: f0 02     
            sta $08            ; $cb89: 85 08     
__cb8b:     lda $01            ; $cb8b: a5 01     
            lsr                ; $cb8d: 4a        
            bcc __cb96         ; $cb8e: 90 06     
            tya                ; $cb90: 98        
            eor #$fc           ; $cb91: 49 fc     
            adc #$1f           ; $cb93: 69 1f     
            tay                ; $cb95: a8        
__cb96:     rts                ; $cb96: 60        

;-------------------------------------------------------------------------------
__cb97:     lda #$3f           ; $cb97: a9 3f     
            sta $2006          ; $cb99: 8d 06 20  
            lda #$00           ; $cb9c: a9 00     
            sta $2006          ; $cb9e: 8d 06 20  
            ldx #$20           ; $cba1: a2 20     
            lda #$0f           ; $cba3: a9 0f     
__cba5:     sta $2007          ; $cba5: 8d 07 20  
            dex                ; $cba8: ca        
            bne __cba5         ; $cba9: d0 fa     
            jmp __cbfc         ; $cbab: 4c fc cb  

;-------------------------------------------------------------------------------
__cbae:     jsr __cd1e         ; $cbae: 20 1e cd  
            jsr __d6c6         ; $cbb1: 20 c6 d6  
            ldy #$0c           ; $cbb4: a0 0c     
            lda $09            ; $cbb6: a5 09     
            beq __cbdc         ; $cbb8: f0 22     
            ldx #$00           ; $cbba: a2 00     
__cbbc:     lda $0180,x        ; $cbbc: bd 80 01  
            sta $2006          ; $cbbf: 8d 06 20  
            inx                ; $cbc2: e8        
            lda $0180,x        ; $cbc3: bd 80 01  
            sta $2006          ; $cbc6: 8d 06 20  
            inx                ; $cbc9: e8        
            ldy $0180,x        ; $cbca: bc 80 01  
            inx                ; $cbcd: e8        
__cbce:     lda $0180,x        ; $cbce: bd 80 01  
            sta $2007          ; $cbd1: 8d 07 20  
            inx                ; $cbd4: e8        
            dey                ; $cbd5: 88        
            bne __cbce         ; $cbd6: d0 f6     
            cpx $09            ; $cbd8: e4 09     
            bne __cbbc         ; $cbda: d0 e0     
__cbdc:     ldy $05            ; $cbdc: a4 05     
            beq __cbf1         ; $cbde: f0 11     
            lda #$00           ; $cbe0: a9 00     
            sta $05            ; $cbe2: 85 05     
            lda __cc0b,y       ; $cbe4: b9 0b cc  
            sta $d3            ; $cbe7: 85 d3     
            lda __cc0c,y       ; $cbe9: b9 0c cc  
            sta $d4            ; $cbec: 85 d4     
            jsr $00d2          ; $cbee: 20 d2 00  
__cbf1:     ldy $06            ; $cbf1: a4 06     
            beq __cc0c         ; $cbf3: f0 17     
            lda #$00           ; $cbf5: a9 00     
            sta $06            ; $cbf7: 85 06     
            jsr __d551         ; $cbf9: 20 51 d5  
__cbfc:     lda #$3f           ; $cbfc: a9 3f     
            sta $2006          ; $cbfe: 8d 06 20  
            lda #$00           ; $cc01: a9 00     
            sta $2006          ; $cc03: 8d 06 20  
            sta $2006          ; $cc06: 8d 06 20  
            sta $2006          ; $cc09: 8d 06 20
__cc0c:     rts                ; $cc0c: 60        

;-------------------------------------------------------------------------------
            .hex 2a d0 fe d1   ; $cc0d: 2a d0 fe d1   Data
            .hex 74 d0 84 92   ; $cc11: 74 d0 84 92   Data
            .hex 86 93 a0 18   ; $cc15: 86 93 a0 18   Data
            .hex 20 35 cc a4   ; $cc19: 20 35 cc a4   Data
            .hex 92 a6 93 60   ; $cc1d: 92 a6 93 60   Data

;-------------------------------------------------------------------------------
__cc21:     sty $92            ; $cc21: 84 92     
            stx $93            ; $cc23: 86 93     
            lda $05a0,x        ; $cc25: bd a0 05  
            asl                ; $cc28: 0a        
            asl                ; $cc29: 0a        
            tay                ; $cc2a: a8        
            ldx $92            ; $cc2b: a6 92     
            jsr __cc35         ; $cc2d: 20 35 cc  
            ldy $92            ; $cc30: a4 92     
            ldx $93            ; $cc32: a6 93     
            rts                ; $cc34: 60        

;-------------------------------------------------------------------------------
__cc35:     lda $40            ; $cc35: a5 40     
            beq __cc7a         ; $cc37: f0 41     
            lda $0560,x        ; $cc39: bd 60 05  
            asl                ; $cc3c: 0a        
            asl                ; $cc3d: 0a        
            adc #$b7           ; $cc3e: 69 b7     
            tax                ; $cc40: aa        
            lda __cc96,y       ; $cc41: b9 96 cc  
            clc                ; $cc44: 18        
            jsr __ccb2         ; $cc45: 20 b2 cc  
            lda __cc95,y       ; $cc48: b9 95 cc  
            jsr __ccb2         ; $cc4b: 20 b2 cc  
            lda __cc94,y       ; $cc4e: b9 94 cc  
            jsr __ccb2         ; $cc51: 20 b2 cc  
            lda __cc93,y       ; $cc54: b9 93 cc  
            jsr __ccb2         ; $cc57: 20 b2 cc  
            inx                ; $cc5a: e8        
            inx                ; $cc5b: e8        
            jsr __cc7b         ; $cc5c: 20 7b cc  
            inx                ; $cc5f: e8        
            inx                ; $cc60: e8        
            ldy #$03           ; $cc61: a0 03     
            sec                ; $cc63: 38        
__cc64:     lda $00b0,y        ; $cc64: b9 b0 00  
            sbc $00,x          ; $cc67: f5 00     
            dex                ; $cc69: ca        
            dey                ; $cc6a: 88        
            bne __cc64         ; $cc6b: d0 f7     
            bcs __cc7a         ; $cc6d: b0 0b     
__cc6f:     inx                ; $cc6f: e8        
            iny                ; $cc70: c8        
            lda $00,x          ; $cc71: b5 00     
            sta $00b0,y        ; $cc73: 99 b0 00  
            cpy #$03           ; $cc76: c0 03     
            bne __cc6f         ; $cc78: d0 f5     
__cc7a:     rts                ; $cc7a: 60        

;-------------------------------------------------------------------------------
__cc7b:     ldy #$00           ; $cc7b: a0 00     
            cpx #$b5           ; $cc7d: e0 b5     
            beq __cc82         ; $cc7f: f0 01     
            iny                ; $cc81: c8        
__cc82:     lda $006e,y        ; $cc82: b9 6e 00  
            bne __cc92         ; $cc85: d0 0b     
            lda $00,x          ; $cc87: b5 00     
            cmp #$03           ; $cc89: c9 03     
            bcc __cc92         ; $cc8b: 90 05     
            lda #$01           ; $cc8d: a9 01     
            sta $006e,y        ; $cc8f: 99 6e 00  
__cc92:     rts                ; $cc92: 60        

;-------------------------------------------------------------------------------
__cc93:     .hex 00            ; $cc93: 00            Data
__cc94:     .hex 00            ; $cc94: 00            Data
__cc95:     .hex 00            ; $cc95: 00            Data
__cc96:     .hex 60 00 00 00   ; $cc96: 60 00 00 00   Data
            .hex 90 00 00 01   ; $cc9a: 90 00 00 01   Data
            .hex 50 00 00 05   ; $cc9e: 50 00 00 05   Data
            .hex 00 00 00 10   ; $cca2: 00 00 00 10   Data
            .hex 00 00 00 20   ; $cca6: 00 00 00 20   Data
            .hex 00 00 00 03   ; $ccaa: 00 00 00 03   Data
            .hex 00            ; $ccae: 00            Data

;-------------------------------------------------------------------------------
__ccaf:     sec                ; $ccaf: 38        
            lda #$00           ; $ccb0: a9 00     
__ccb2:     pha                ; $ccb2: 48        
            and #$0f           ; $ccb3: 29 0f     
            sta $90            ; $ccb5: 85 90     
            pla                ; $ccb7: 68        
            and #$f0           ; $ccb8: 29 f0     
            sta $91            ; $ccba: 85 91     
            lda $00,x          ; $ccbc: b5 00     
            and #$0f           ; $ccbe: 29 0f     
            adc $90            ; $ccc0: 65 90     
            cmp #$0a           ; $ccc2: c9 0a     
            bcc __ccc8         ; $ccc4: 90 02     
            adc #$05           ; $ccc6: 69 05     
__ccc8:     sta $90            ; $ccc8: 85 90     
            clc                ; $ccca: 18        
            lda $00,x          ; $cccb: b5 00     
            and #$f0           ; $cccd: 29 f0     
            adc $90            ; $cccf: 65 90     
            adc $91            ; $ccd1: 65 91     
            bcs __ccd9         ; $ccd3: b0 04     
            cmp #$a0           ; $ccd5: c9 a0     
            bcc __ccdc         ; $ccd7: 90 03     
__ccd9:     adc #$5f           ; $ccd9: 69 5f     
            sec                ; $ccdb: 38        
__ccdc:     sta $00,x          ; $ccdc: 95 00     
            dex                ; $ccde: ca        
            rts                ; $ccdf: 60        

;-------------------------------------------------------------------------------
__cce0:     ldx #$00           ; $cce0: a2 00     
            jsr __cce6         ; $cce2: 20 e6 cc  
            inx                ; $cce5: e8        
__cce6:     lda $58,x          ; $cce6: b5 58     
            beq __cd10         ; $cce8: f0 26     
            dec $58,x          ; $ccea: d6 58     
            lda $58,x          ; $ccec: b5 58     
            and #$03           ; $ccee: 29 03     
            bne __cd10         ; $ccf0: d0 1e     
            lda #$20           ; $ccf2: a9 20     
            sta $2006          ; $ccf4: 8d 06 20  
            lda __cd1c,x       ; $ccf7: bd 1c cd  
            sta $2006          ; $ccfa: 8d 06 20  
            lda $58,x          ; $ccfd: b5 58     
            and #$04           ; $ccff: 29 04     
            beq __cd11         ; $cd01: f0 0e     
            ldy #$00           ; $cd03: a0 00     
__cd05:     lda __d1ac,y       ; $cd05: b9 ac d1  
            sta $2007          ; $cd08: 8d 07 20  
            iny                ; $cd0b: c8        
            cpy #$05           ; $cd0c: c0 05     
            bne __cd05         ; $cd0e: d0 f5     
__cd10:     rts                ; $cd10: 60        

;-------------------------------------------------------------------------------
__cd11:     ldy #$05           ; $cd11: a0 05     
            lda #$23           ; $cd13: a9 23     
__cd15:     sta $2007          ; $cd15: 8d 07 20  
            dey                ; $cd18: 88        
            bne __cd15         ; $cd19: d0 fa     
            rts                ; $cd1b: 60        

;-------------------------------------------------------------------------------
__cd1c:     .hex 88 93         ; $cd1c: 88 93         Data

;-------------------------------------------------------------------------------
__cd1e:     lda $01            ; $cd1e: a5 01     
            and #$03           ; $cd20: 29 03     
            beq __cd55         ; $cd22: f0 31     
            cmp #$02           ; $cd24: c9 02     
            bcs __cce0         ; $cd26: b0 b8     
            ldy #$00           ; $cd28: a0 00     
            jsr __cd38         ; $cd2a: 20 38 cd  
            ldy #$04           ; $cd2d: a0 04     
            jsr __cd38         ; $cd2f: 20 38 cd  
            lda $bd            ; $cd32: a5 bd     
            beq __cd54         ; $cd34: f0 1e     
            ldy #$08           ; $cd36: a0 08     
__cd38:     lda __cdad,y       ; $cd38: b9 ad cd  
            sta $2006          ; $cd3b: 8d 06 20  
            lda __cdac,y       ; $cd3e: b9 ac cd  
            sta $2006          ; $cd41: 8d 06 20  
            ldx __cdae,y       ; $cd44: be ae cd  
            lda __cdaf,y       ; $cd47: b9 af cd  
            tay                ; $cd4a: a8        
__cd4b:     lda $00,x          ; $cd4b: b5 00     
            sta $2007          ; $cd4d: 8d 07 20  
            inx                ; $cd50: e8        
            dey                ; $cd51: 88        
            bne __cd4b         ; $cd52: d0 f7     
__cd54:     rts                ; $cd54: 60        

;-------------------------------------------------------------------------------
__cd55:     ldy #$00           ; $cd55: a0 00     
            jsr __cd61         ; $cd57: 20 61 cd  
            ldy #$04           ; $cd5a: a0 04     
            jsr __cd61         ; $cd5c: 20 61 cd  
            ldy #$08           ; $cd5f: a0 08     
__cd61:     lda __cda0,y       ; $cd61: b9 a0 cd  
            sta $90            ; $cd64: 85 90     
            lda __cda1,y       ; $cd66: b9 a1 cd  
            sta $91            ; $cd69: 85 91     
            ldx __cda2,y       ; $cd6b: be a2 cd  
            lda __cda3,y       ; $cd6e: b9 a3 cd  
            tay                ; $cd71: a8        
__cd72:     lda $00,x          ; $cd72: b5 00     
            lsr                ; $cd74: 4a        
            lsr                ; $cd75: 4a        
            lsr                ; $cd76: 4a        
            lsr                ; $cd77: 4a        
            jsr __cd88         ; $cd78: 20 88 cd  
            lda $00,x          ; $cd7b: b5 00     
            and #$0f           ; $cd7d: 29 0f     
            jsr __cd88         ; $cd7f: 20 88 cd  
            inx                ; $cd82: e8        
            dec $90            ; $cd83: c6 90     
            bne __cd72         ; $cd85: d0 eb     
            rts                ; $cd87: 60        

;-------------------------------------------------------------------------------
__cd88:     bne __cd95         ; $cd88: d0 0b     
            dec $91            ; $cd8a: c6 91     
            bmi __cd95         ; $cd8c: 30 07     
            lda #$23           ; $cd8e: a9 23     
            sta $0000,y        ; $cd90: 99 00 00  
            iny                ; $cd93: c8        
            rts                ; $cd94: 60        

;-------------------------------------------------------------------------------
__cd95:     ora #$30           ; $cd95: 09 30     
            sta $0000,y        ; $cd97: 99 00 00  
            iny                ; $cd9a: c8        
            lda #$00           ; $cd9b: a9 00     
            sta $91            ; $cd9d: 85 91     
            rts                ; $cd9f: 60        

;-------------------------------------------------------------------------------
__cda0:     .hex 04            ; $cda0: 04            Data
__cda1:     .hex 06            ; $cda1: 06            Data
__cda2:     .hex b0            ; $cda2: b0            Data
__cda3:     .hex 20 04 06 b4   ; $cda3: 20 04 06 b4   Data
            .hex 28 04 06 b8   ; $cda7: 28 04 06 b8   Data
            .hex 30            ; $cdab: 30            Data
__cdac:     .hex 6e            ; $cdac: 6e            Data
__cdad:     .hex 20            ; $cdad: 20            Data
__cdae:     .hex 22            ; $cdae: 22            Data
__cdaf:     .hex 06 64 20 2a   ; $cdaf: 06 64 20 2a   Data
            .hex 06 78 20 32   ; $cdb3: 06 78 20 32   Data
            .hex 06 8d 20 38   ; $cdb7: 06 8d 20 38   Data
            .hex 06            ; $cdbb: 06            Data

;-------------------------------------------------------------------------------
            lda #$00           ; $cdbc: a9 00     
            sta $46            ; $cdbe: 85 46     
            sta $47            ; $cdc0: 85 47     
            lda #$03           ; $cdc2: a9 03     
            sta $44            ; $cdc4: 85 44     
            sta $45            ; $cdc6: 85 45     
            sta $48            ; $cdc8: 85 48     
            sta $49            ; $cdca: 85 49     
            lda #$02           ; $cdcc: a9 02     
            sta $05            ; $cdce: 85 05     
            lda #$80           ; $cdd0: a9 80     
            sta $0a            ; $cdd2: 85 0a     
            lda #$00           ; $cdd4: a9 00     
            sta $0b            ; $cdd6: 85 0b     
            ldy #$00           ; $cdd8: a0 00     
            jsr __c44b         ; $cdda: 20 4b c4  
__cddd:     jsr __c46a         ; $cddd: 20 6a c4  
            jsr __d01e         ; $cde0: 20 1e d0  
            lda $16            ; $cde3: a5 16     
            lsr                ; $cde5: 4a        
            bcs __cdf3         ; $cde6: b0 0b     
            lda $14            ; $cde8: a5 14     
            lsr                ; $cdea: 4a        
            bcs __cdf3         ; $cdeb: b0 06     
            lda $0a            ; $cded: a5 0a     
            cmp #$f8           ; $cdef: c9 f8     
            bcc __cddd         ; $cdf1: 90 ea     
__cdf3:     lda #$00           ; $cdf3: a9 00     
            sta $0a            ; $cdf5: 85 0a     
            sta $0b            ; $cdf7: 85 0b     
            lda __ce31         ; $cdf9: ad 31 ce  
            sta $ae            ; $cdfc: 85 ae     
            lda __ce32         ; $cdfe: ad 32 ce  
            sta $af            ; $ce01: 85 af     
__ce03:     jsr __c46a         ; $ce03: 20 6a c4  
            jsr __c133         ; $ce06: 20 33 c1  
            lda $14            ; $ce09: a5 14     
            cmp #$01           ; $ce0b: c9 01     
            bne __ce19         ; $ce0d: d0 0a     
            lda __ce31         ; $ce0f: ad 31 ce  
            sta $ae            ; $ce12: 85 ae     
            lda __ce32         ; $ce14: ad 32 ce  
            sta $af            ; $ce17: 85 af     
__ce19:     lda #$06           ; $ce19: a9 06     
            sta $05            ; $ce1b: 85 05     
            lda $16            ; $ce1d: a5 16     
            cmp #$01           ; $ce1f: c9 01     
            beq __ce33         ; $ce21: f0 10     
            dec $af            ; $ce23: c6 af     
            bne __ce03         ; $ce25: d0 dc     
            dec $ae            ; $ce27: c6 ae     
            bne __ce03         ; $ce29: d0 d8     
            jsr __c46a         ; $ce2b: 20 6a c4  
            jmp __d7f8         ; $ce2e: 4c f8 d7  

;-------------------------------------------------------------------------------
__ce31:     .hex 02            ; $ce31: 02            Data
__ce32:     .hex 00            ; $ce32: 00            Data

;-------------------------------------------------------------------------------
__ce33:     lda $14            ; $ce33: a5 14     
            and #$01           ; $ce35: 29 01     
            lda $12            ; $ce37: a5 12     
            and #$01           ; $ce39: 29 01     
            jsr __c46a         ; $ce3b: 20 6a c4  
            lda #$04           ; $ce3e: a9 04     
            sta $05            ; $ce40: 85 05     
            lda #$00           ; $ce42: a9 00     
            sta $76            ; $ce44: 85 76     
            sta $50            ; $ce46: 85 50     
            tax                ; $ce48: aa        
__ce49:     sta $b4,x          ; $ce49: 95 b4     
            inx                ; $ce4b: e8        
            cpx #$08           ; $ce4c: e0 08     
            bne __ce49         ; $ce4e: d0 f9     
            lda $bc            ; $ce50: a5 bc     
            sta $bd            ; $ce52: 85 bd     
            sta $be            ; $ce54: 85 be     
            lda #$18           ; $ce56: a9 18     
            sta $52            ; $ce58: 85 52     
            sta $53            ; $ce5a: 85 53     
            lda #$01           ; $ce5c: a9 01     
            sta $40            ; $ce5e: 85 40     
            sta $51            ; $ce60: 85 51     
            sta $02            ; $ce62: 85 02     
            sta $0607          ; $ce64: 8d 07 06  
            sta $0608          ; $ce67: 8d 08 06  
            sta $0609          ; $ce6a: 8d 09 06  
            sta $060a          ; $ce6d: 8d 0a 06  
            lda #$f0           ; $ce70: a9 f0     
            sta $a9            ; $ce72: 85 a9     
__ce74:     jsr __c46a         ; $ce74: 20 6a c4  
            dec $a9            ; $ce77: c6 a9     
            bne __ce74         ; $ce79: d0 f9     
            jsr __dd6d         ; $ce7b: 20 6d dd  
            jsr __d876         ; $ce7e: 20 76 d8  
            ldy #$06           ; $ce81: a0 06     
            jsr __c44b         ; $ce83: 20 4b c4  
__ce86:     jsr __c46a         ; $ce86: 20 6a c4  
            jsr __d977         ; $ce89: 20 77 d9  
            lda $bd            ; $ce8c: a5 bd     
            bne __ced3         ; $ce8e: d0 43     
            lda $48            ; $ce90: a5 48     
            bne __ced9         ; $ce92: d0 45     
__ce94:     lda $50            ; $ce94: a5 50     
            bne __cea5         ; $ce96: d0 0d     
            jsr __d95a         ; $ce98: 20 5a d9  
__ce9b:     jsr __c46a         ; $ce9b: 20 6a c4  
            jsr __d977         ; $ce9e: 20 77 d9  
            lda $76            ; $cea1: a5 76     
            bne __ce9b         ; $cea3: d0 f6     
__cea5:     jsr __f0a6         ; $cea5: 20 a6 f0  
            lda #$00           ; $cea8: a9 00     
            sta $02            ; $ceaa: 85 02     
            sta $76            ; $ceac: 85 76     
            sta $71            ; $ceae: 85 71     
            lda #$01           ; $ceb0: a9 01     
            sta $41            ; $ceb2: 85 41     
            sta $0621          ; $ceb4: 8d 21 06  
            sta $0622          ; $ceb7: 8d 22 06  
            sta $0623          ; $ceba: 8d 23 06  
            sta $0624          ; $cebd: 8d 24 06  
            lda #$b4           ; $cec0: a9 b4     
            sta $04            ; $cec2: 85 04     
__cec4:     jsr __c46a         ; $cec4: 20 6a c4  
            lda $16            ; $cec7: a5 16     
            lsr                ; $cec9: 4a        
            bcs __ced0         ; $ceca: b0 04     
            lda $04            ; $cecc: a5 04     
            bne __cec4         ; $cece: d0 f4     
__ced0:     jmp reset          ; $ced0: 4c 40 c0  

;-------------------------------------------------------------------------------
__ced3:     lda $48            ; $ced3: a5 48     
            ora $49            ; $ced5: 05 49     
            beq __ce94         ; $ced7: f0 bb     
__ced9:     lda $53            ; $ced9: a5 53     
            beq __cef7         ; $cedb: f0 1a     
            jsr __cf7e         ; $cedd: 20 7e cf  
            jmp __ce86         ; $cee0: 4c 86 ce  

;-------------------------------------------------------------------------------
__cee3:     lda $bd            ; $cee3: a5 bd     
            bne __ceec         ; $cee5: d0 05     
            lda $48            ; $cee7: a5 48     
            beq __cef2         ; $cee9: f0 07     
__ceeb:     rts                ; $ceeb: 60        

;-------------------------------------------------------------------------------
__ceec:     lda $48            ; $ceec: a5 48     
            ora $49            ; $ceee: 05 49     
            bne __ceeb         ; $cef0: d0 f9     

;-------------------------------------------------------------------------------
__cef2:     pla                ; $cef2: 68        
            pla                ; $cef3: 68        
            jmp __ce94         ; $cef4: 4c 94 ce  

;-------------------------------------------------------------------------------
__cef7:     lda $50            ; $cef7: a5 50     
            bne __cf0e         ; $cef9: d0 13     
            jsr __d95a         ; $cefb: 20 5a d9  
__cefe:     jsr __c46a         ; $cefe: 20 6a c4  
            jsr __d977         ; $cf01: 20 77 d9  
            jsr __cf7e         ; $cf04: 20 7e cf  
            jsr __cee3         ; $cf07: 20 e3 ce  
            lda $76            ; $cf0a: a5 76     
            bne __cefe         ; $cf0c: d0 f0     
__cf0e:     lda #$78           ; $cf0e: a9 78     
            sta $a9            ; $cf10: 85 a9     
__cf12:     jsr __c46a         ; $cf12: 20 6a c4  
            jsr __d977         ; $cf15: 20 77 d9  
            jsr __cf7e         ; $cf18: 20 7e cf  
            jsr __cee3         ; $cf1b: 20 e3 ce  
            ldx #$0a           ; $cf1e: a2 0a     
__cf20:     lda $0480,x        ; $cf20: bd 80 04  
            bne __cf12         ; $cf23: d0 ed     
            inx                ; $cf25: e8        
            cpx #$0e           ; $cf26: e0 0e     
            bne __cf20         ; $cf28: d0 f6     
            lda $0480          ; $cf2a: ad 80 04  
            cmp #$04           ; $cf2d: c9 04     
            beq __cf12         ; $cf2f: f0 e1     
            lda $bd            ; $cf31: a5 bd     
            beq __cf3c         ; $cf33: f0 07     
            lda $0481          ; $cf35: ad 81 04  
            cmp #$04           ; $cf38: c9 04     
            beq __cf12         ; $cf3a: f0 d6     
__cf3c:     dec $a9            ; $cf3c: c6 a9     
            bne __cf12         ; $cf3e: d0 d2     
            lda #$01           ; $cf40: a9 01     
            sta $41            ; $cf42: 85 41     
            sta $0603          ; $cf44: 8d 03 06  
            sta $0604          ; $cf47: 8d 04 06  
            sta $0605          ; $cf4a: 8d 05 06  
            sta $0606          ; $cf4d: 8d 06 06  
            lda #$f0           ; $cf50: a9 f0     
            sta $a9            ; $cf52: 85 a9     
__cf54:     jsr __c46a         ; $cf54: 20 6a c4  
            dec $a9            ; $cf57: c6 a9     
            bne __cf54         ; $cf59: d0 f9     
            lda #$18           ; $cf5b: a9 18     
            sta $52            ; $cf5d: 85 52     
            sta $53            ; $cf5f: 85 53     
            lda $51            ; $cf61: a5 51     
            cmp #$48           ; $cf63: c9 48     
            bcs __cf6c         ; $cf65: b0 05     
            ldx #$51           ; $cf67: a2 51     
            jsr __ccaf         ; $cf69: 20 af cc  
__cf6c:     lda #$04           ; $cf6c: a9 04     
            sta $05            ; $cf6e: 85 05     
            jsr __dd4c         ; $cf70: 20 4c dd  
            jsr __d8af         ; $cf73: 20 af d8  
            ldy #$06           ; $cf76: a0 06     
            jsr __c44b         ; $cf78: 20 4b c4  
            jmp __ce86         ; $cf7b: 4c 86 ce  

;-------------------------------------------------------------------------------
__cf7e:     lda $bd            ; $cf7e: a5 bd     
            bne __cf90         ; $cf80: d0 0e     
            lda $76            ; $cf82: a5 76     
            beq __cf8f         ; $cf84: f0 09     
            ldx #$00           ; $cf86: a2 00     
            jsr __cfce         ; $cf88: 20 ce cf  
            lda $92            ; $cf8b: a5 92     
            bne __cfa5         ; $cf8d: d0 16     
__cf8f:     rts                ; $cf8f: 60        

;-------------------------------------------------------------------------------
__cf90:     lda $76            ; $cf90: a5 76     
            beq __cf8f         ; $cf92: f0 fb     
            ldx #$00           ; $cf94: a2 00     
            jsr __cfce         ; $cf96: 20 ce cf  
            lda $92            ; $cf99: a5 92     
            bne __cfa5         ; $cf9b: d0 08     
            inx                ; $cf9d: e8        
            jsr __cfce         ; $cf9e: 20 ce cf  
            lda $92            ; $cfa1: a5 92     
            beq __cf8f         ; $cfa3: f0 ea     
__cfa5:     lda $4c            ; $cfa5: a5 4c     
            sta $4a            ; $cfa7: 85 4a     
            lda $4d            ; $cfa9: a5 4d     
            sta $4b            ; $cfab: 85 4b     
            lda #$00           ; $cfad: a9 00     
            sta $4c            ; $cfaf: 85 4c     
            sta $4d            ; $cfb1: 85 4d     
            sta $76            ; $cfb3: 85 76     
            lda $50            ; $cfb5: a5 50     
            eor #$01           ; $cfb7: 49 01     
            sta $50            ; $cfb9: 85 50     
            lda #$04           ; $cfbb: a9 04     
            sta $05            ; $cfbd: 85 05     
            lda $53            ; $cfbf: a5 53     
            sta $52            ; $cfc1: 85 52     
            jsr __d8a4         ; $cfc3: 20 a4 d8  
            jsr __dd4c         ; $cfc6: 20 4c dd  
            ldy #$06           ; $cfc9: a0 06     
            jmp __c44b         ; $cfcb: 4c 4b c4  

;-------------------------------------------------------------------------------
__cfce:     lda #$00           ; $cfce: a9 00     
            sta $92            ; $cfd0: 85 92     
            lda $0480,x        ; $cfd2: bd 80 04  
            cmp #$02           ; $cfd5: c9 02     
            beq __cfdd         ; $cfd7: f0 04     
            cmp #$06           ; $cfd9: c9 06     
            bne __cff7         ; $cfdb: d0 1a     
__cfdd:     lda $50            ; $cfdd: a5 50     
            bne __cff8         ; $cfdf: d0 17     
            lda $0440,x        ; $cfe1: bd 40 04  
            sec                ; $cfe4: 38        
            sbc #$78           ; $cfe5: e9 78     
            cmp #$11           ; $cfe7: c9 11     
            bcs __cff7         ; $cfe9: b0 0c     
            lda $0400,x        ; $cfeb: bd 00 04  
            sec                ; $cfee: 38        
            sbc #$6f           ; $cfef: e9 6f     
            cmp #$11           ; $cff1: c9 11     
            bcs __cff7         ; $cff3: b0 02     
            inc $92            ; $cff5: e6 92     
__cff7:     rts                ; $cff7: 60        

;-------------------------------------------------------------------------------
__cff8:     lda $048e          ; $cff8: ad 8e 04  
            cmp #$04           ; $cffb: c9 04     
            bne __d01d         ; $cffd: d0 1e     
            lda $0440,x        ; $cfff: bd 40 04  
            sec                ; $d002: 38        
            sbc $044e          ; $d003: ed 4e 04  
            clc                ; $d006: 18        
            adc #$08           ; $d007: 69 08     
            cmp #$11           ; $d009: c9 11     
            bcs __d01d         ; $d00b: b0 10     
            lda $0400,x        ; $d00d: bd 00 04  
            sec                ; $d010: 38        
            sbc $040e          ; $d011: ed 0e 04  
            clc                ; $d014: 18        
            adc #$08           ; $d015: 69 08     
            cmp #$11           ; $d017: c9 11     
            bcs __d01d         ; $d019: b0 02     
            inc $92            ; $d01b: e6 92     
__d01d:     rts                ; $d01d: 60        

;-------------------------------------------------------------------------------
__d01e:     lda $0b            ; $d01e: a5 0b     
            clc                ; $d020: 18        
            adc #$80           ; $d021: 69 80     
            sta $0b            ; $d023: 85 0b     
            bcc __d029         ; $d025: 90 02     
            inc $0a            ; $d027: e6 0a     
__d029:     rts                ; $d029: 60        

;-------------------------------------------------------------------------------
            jsr __cb97         ; $d02a: 20 97 cb  
            jsr __d091         ; $d02d: 20 91 d0  
            lda #$0e           ; $d030: a9 0e     
            sta $06            ; $d032: 85 06     
            ldy #$00           ; $d034: a0 00     
            jsr __d551         ; $d036: 20 51 d5  
            ldy #$02           ; $d039: a0 02     
            jsr __d551         ; $d03b: 20 51 d5  
            ldy #$00           ; $d03e: a0 00     
            jsr __d661         ; $d040: 20 61 d6  
            jsr __d088         ; $d043: 20 88 d0  
            jsr __d05f         ; $d046: 20 5f d0  
__d049:     jsr __f0d9         ; $d049: 20 d9 f0  
            lda #$00           ; $d04c: a9 00     
            sta $00            ; $d04e: 85 00     
__d050:     lda $00            ; $d050: a5 00     
            beq __d050         ; $d052: f0 fc     
            lda #$00           ; $d054: a9 00     
            sta $2003          ; $d056: 8d 03 20  
            lda #$02           ; $d059: a9 02     
            sta $4014          ; $d05b: 8d 14 40  
__d05e:     rts                ; $d05e: 60        

;-------------------------------------------------------------------------------
__d05f:     jsr __d186         ; $d05f: 20 86 d1  
            jsr __d0c9         ; $d062: 20 c9 d0  
            lda $bd            ; $d065: a5 bd     
            beq __d05e         ; $d067: f0 f5     
            ldy #$0c           ; $d069: a0 0c     
            jsr __d551         ; $d06b: 20 51 d5  
            jsr __d18d         ; $d06e: 20 8d d1  
            jmp __d0d0         ; $d071: 4c d0 d0  

;-------------------------------------------------------------------------------
            lda $14            ; $d074: a5 14     
            cmp #$01           ; $d076: c9 01     
            bne __d090         ; $d078: d0 16     
            lda $bc            ; $d07a: a5 bc     
            asl                ; $d07c: 0a        
            adc #$04           ; $d07d: 69 04     
            jsr __d550         ; $d07f: 20 50 d5  
            lda $bc            ; $d082: a5 bc     
            eor #$01           ; $d084: 49 01     
            sta $bc            ; $d086: 85 bc     
__d088:     lda $bc            ; $d088: a5 bc     
            asl                ; $d08a: 0a        
            adc #$08           ; $d08b: 69 08     
            jmp __d550         ; $d08d: 4c 50 d5  

;-------------------------------------------------------------------------------
__d090:     rts                ; $d090: 60        

;-------------------------------------------------------------------------------
__d091:     lda #$20           ; $d091: a9 20     
            ldx #$20           ; $d093: a2 20     
            jsr __d0b5         ; $d095: 20 b5 d0  
            ldx #$28           ; $d098: a2 28     
            jsr __d0b5         ; $d09a: 20 b5 d0  
            lda #$00           ; $d09d: a9 00     
            ldx #$23           ; $d09f: a2 23     
            jsr __d0a6         ; $d0a1: 20 a6 d0  
            ldx #$2b           ; $d0a4: a2 2b     
__d0a6:     stx $2006          ; $d0a6: 8e 06 20  
            ldx #$c0           ; $d0a9: a2 c0     
            stx $2006          ; $d0ab: 8e 06 20  
__d0ae:     sta $2007          ; $d0ae: 8d 07 20  
            inx                ; $d0b1: e8        
            bne __d0ae         ; $d0b2: d0 fa     
            rts                ; $d0b4: 60        

;-------------------------------------------------------------------------------
__d0b5:     stx $2006          ; $d0b5: 8e 06 20  
            ldx #$00           ; $d0b8: a2 00     
            stx $2006          ; $d0ba: 8e 06 20  
            ldy #$04           ; $d0bd: a0 04     
__d0bf:     sta $2007          ; $d0bf: 8d 07 20  
            dex                ; $d0c2: ca        
            bne __d0bf         ; $d0c3: d0 fa     
            dey                ; $d0c5: 88        
            bne __d0bf         ; $d0c6: d0 f7     
            rts                ; $d0c8: 60        

;-------------------------------------------------------------------------------
__d0c9:     lda #$84           ; $d0c9: a9 84     
            ldx $44            ; $d0cb: a6 44     
            jmp __d0d4         ; $d0cd: 4c d4 d0  

;-------------------------------------------------------------------------------
__d0d0:     lda #$98           ; $d0d0: a9 98     
            ldx $45            ; $d0d2: a6 45     
__d0d4:     beq __d0ec         ; $d0d4: f0 16     
            cpx #$04           ; $d0d6: e0 04     
            bcc __d0dc         ; $d0d8: 90 02     
            ldx #$04           ; $d0da: a2 04     
__d0dc:     ldy #$20           ; $d0dc: a0 20     
            sty $2006          ; $d0de: 8c 06 20  
            sta $2006          ; $d0e1: 8d 06 20  
            lda #$5e           ; $d0e4: a9 5e     
__d0e6:     sta $2007          ; $d0e6: 8d 07 20  
            dex                ; $d0e9: ca        
            bne __d0e6         ; $d0ea: d0 fa     
__d0ec:     rts                ; $d0ec: 60        

;-------------------------------------------------------------------------------
__d0ed:     lda $6e            ; $d0ed: a5 6e     
            cmp #$01           ; $d0ef: c9 01     
            bne __d0fa         ; $d0f1: d0 07     
            inc $6e            ; $d0f3: e6 6e     
            ldx #$00           ; $d0f5: a2 00     
            jmp __d129         ; $d0f7: 4c 29 d1  

;-------------------------------------------------------------------------------
__d0fa:     lda $6f            ; $d0fa: a5 6f     
            cmp #$01           ; $d0fc: c9 01     
            bne __d0ec         ; $d0fe: d0 ec     
            inc $6f            ; $d100: e6 6f     
            ldx #$01           ; $d102: a2 01     
            jmp __d129         ; $d104: 4c 29 d1  

;-------------------------------------------------------------------------------
__d107:     ldx #$00           ; $d107: a2 00     
            jsr __d10d         ; $d109: 20 0d d1  
            inx                ; $d10c: e8        
__d10d:     lda $46,x          ; $d10d: b5 46     
            cmp #$1f           ; $d10f: c9 1f     
            bne __d13d         ; $d111: d0 2a     
            lda #$00           ; $d113: a9 00     
            sta $46            ; $d115: 85 46     
            sta $47            ; $d117: 85 47     
            stx $90            ; $d119: 86 90     
            txa                ; $d11b: 8a        
            eor #$01           ; $d11c: 49 01     
            tax                ; $d11e: aa        
            lda #$01           ; $d11f: a9 01     
            sta $58,x          ; $d121: 95 58     
            ldx $90            ; $d123: a6 90     
            lda #$20           ; $d125: a9 20     
            sta $58,x          ; $d127: 95 58     
__d129:     lda $40            ; $d129: a5 40     
            sta $060f          ; $d12b: 8d 0f 06  
            sta $0610          ; $d12e: 8d 10 06  
            sta $0611          ; $d131: 8d 11 06  
            lda #$5e           ; $d134: a9 5e     
            jsr __d15e         ; $d136: 20 5e d1  
            inc $44,x          ; $d139: f6 44     
            inc $48,x          ; $d13b: f6 48     
__d13d:     rts                ; $d13d: 60        

;-------------------------------------------------------------------------------
__d13e:     sty $90            ; $d13e: 84 90     
            stx $91            ; $d140: 86 91     
            ldx #$00           ; $d142: a2 00     
            jsr __d15a         ; $d144: 20 5a d1  
            ldy $90            ; $d147: a4 90     
            ldx $91            ; $d149: a6 91     
            rts                ; $d14b: 60        

;-------------------------------------------------------------------------------
__d14c:     sty $90            ; $d14c: 84 90     
            stx $91            ; $d14e: 86 91     
            ldx #$01           ; $d150: a2 01     
            jsr __d15a         ; $d152: 20 5a d1  
            ldx $91            ; $d155: a6 91     
            ldy $90            ; $d157: a4 90     
            rts                ; $d159: 60        

;-------------------------------------------------------------------------------
__d15a:     dec $44,x          ; $d15a: d6 44     
            lda #$23           ; $d15c: a9 23     
__d15e:     sta $92            ; $d15e: 85 92     
            ldy $09            ; $d160: a4 09     
            lda #$20           ; $d162: a9 20     
            sta $0180,y        ; $d164: 99 80 01  
            lda $44,x          ; $d167: b5 44     
            cmp #$04           ; $d169: c9 04     
            bcs __d183         ; $d16b: b0 16     
            adc __d184,x       ; $d16d: 7d 84 d1  
            iny                ; $d170: c8        
            sta $0180,y        ; $d171: 99 80 01  
            iny                ; $d174: c8        
            lda #$01           ; $d175: a9 01     
            sta $0180,y        ; $d177: 99 80 01  
            iny                ; $d17a: c8        
            lda $92            ; $d17b: a5 92     
            sta $0180,y        ; $d17d: 99 80 01  
            iny                ; $d180: c8        
            sty $09            ; $d181: 84 09     
__d183:     rts                ; $d183: 60        

;-------------------------------------------------------------------------------
__d184:     .hex 84 98         ; $d184: 84 98         Data

;-------------------------------------------------------------------------------
__d186:     ldx #$88           ; $d186: a2 88     
            lda $46            ; $d188: a5 46     
            jmp __d191         ; $d18a: 4c 91 d1  

;-------------------------------------------------------------------------------
__d18d:     ldx #$93           ; $d18d: a2 93     
            lda $47            ; $d18f: a5 47     
__d191:     ldy #$20           ; $d191: a0 20     
            sty $2006          ; $d193: 8c 06 20  
            stx $2006          ; $d196: 8e 06 20  
            ldx #$00           ; $d199: a2 00     
__d19b:     lsr                ; $d19b: 4a        
            ldy #$23           ; $d19c: a0 23     
            bcc __d1a3         ; $d19e: 90 03     
            ldy __d1ac,x       ; $d1a0: bc ac d1  
__d1a3:     sty $2007          ; $d1a3: 8c 07 20  
            inx                ; $d1a6: e8        
            cpx #$05           ; $d1a7: e0 05     
            bne __d19b         ; $d1a9: d0 f0     
            rts                ; $d1ab: 60        

;-------------------------------------------------------------------------------
__d1ac:     .hex 14 15 16 17   ; $d1ac: 14 15 16 17   Data
            .hex 18            ; $d1b0: 18            Data

;-------------------------------------------------------------------------------
__d1b1:     sty $92            ; $d1b1: 84 92     
            stx $93            ; $d1b3: 86 93     
            clc                ; $d1b5: 18        
            bmi __d1c0         ; $d1b6: 30 08     
            tay                ; $d1b8: a8        
            adc #$88           ; $d1b9: 69 88     
            ldx #$00           ; $d1bb: a2 00     
            jmp __d1c7         ; $d1bd: 4c c7 d1  

;-------------------------------------------------------------------------------
__d1c0:     and #$7f           ; $d1c0: 29 7f     
            tay                ; $d1c2: a8        
            adc #$93           ; $d1c3: 69 93     
            ldx #$01           ; $d1c5: a2 01     

;-------------------------------------------------------------------------------
__d1c7:     sta $91            ; $d1c7: 85 91     
            lda $46,x          ; $d1c9: b5 46     
            ora __d1f6,y       ; $d1cb: 19 f6 d1  
            cmp $46,x          ; $d1ce: d5 46     
            beq __d1f1         ; $d1d0: f0 1f     
            sta $46,x          ; $d1d2: 95 46     
            ldx $09            ; $d1d4: a6 09     
            lda #$20           ; $d1d6: a9 20     
            sta $0180,x        ; $d1d8: 9d 80 01  
            inx                ; $d1db: e8        
            lda $91            ; $d1dc: a5 91     
            sta $0180,x        ; $d1de: 9d 80 01  
            inx                ; $d1e1: e8        
            lda #$01           ; $d1e2: a9 01     
            sta $0180,x        ; $d1e4: 9d 80 01  
            inx                ; $d1e7: e8        
            lda __d1ac,y       ; $d1e8: b9 ac d1  
            sta $0180,x        ; $d1eb: 9d 80 01  
            inx                ; $d1ee: e8        
            stx $09            ; $d1ef: 86 09     
__d1f1:     ldx $93            ; $d1f1: a6 93     
            ldy $92            ; $d1f3: a4 92     
__d1f5:     rts                ; $d1f5: 60        

;-------------------------------------------------------------------------------
__d1f6:     .hex 01 02 04 08   ; $d1f6: 01 02 04 08   Data
            .hex 10 20 40 80   ; $d1fa: 10 20 40 80   Data

;-------------------------------------------------------------------------------
            jsr __cb97         ; $d1fe: 20 97 cb  
            ldy #$00           ; $d201: a0 00     
            jsr __d78f         ; $d203: 20 8f d7  
            ldy #$02           ; $d206: a0 02     
            jsr __d551         ; $d208: 20 51 d5  
            jsr __d4e4         ; $d20b: 20 e4 d4  
            jsr __d05f         ; $d20e: 20 5f d0  
            jsr __d47c         ; $d211: 20 7c d4  
            lda #$10           ; $d214: a9 10     
            sta $06            ; $d216: 85 06     
            lda #$20           ; $d218: a9 20     
            sta $90            ; $d21a: 85 90     
            lda #$c5           ; $d21c: a9 c5     
            sta $91            ; $d21e: 85 91     
            lda $50            ; $d220: a5 50     
            bne __d24e         ; $d222: d0 2a     
            ldy #$15           ; $d224: a0 15     
__d226:     ldx #$18           ; $d226: a2 18     
            jsr __d53c         ; $d228: 20 3c d5  
__d22b:     jsr __c133         ; $d22b: 20 33 c1  
            lsr                ; $d22e: 4a        
            lsr                ; $d22f: 4a        
            lsr                ; $d230: 4a        
            lsr                ; $d231: 4a        
            cmp #$03           ; $d232: c9 03     
            bcc __d238         ; $d234: 90 02     
            lda #$16           ; $d236: a9 16     
__d238:     adc #$09           ; $d238: 69 09     
            sta $2007          ; $d23a: 8d 07 20  
            dex                ; $d23d: ca        
            bne __d22b         ; $d23e: d0 eb     
            dey                ; $d240: 88        
            bne __d226         ; $d241: d0 e3     
            jsr __d322         ; $d243: 20 22 d3  
            ldy #$05           ; $d246: a0 05     
            jsr __d661         ; $d248: 20 61 d6  
            jmp __d049         ; $d24b: 4c 49 d0  

;-------------------------------------------------------------------------------
__d24e:     ldy $5a            ; $d24e: a4 5a     
            lda __dbfa,y       ; $d250: b9 fa db  
            sta $92            ; $d253: 85 92     
            lda __dbfb,y       ; $d255: b9 fb db  
            sta $93            ; $d258: 85 93     
            ldy #$00           ; $d25a: a0 00     
__d25c:     lda ($92),y        ; $d25c: b1 92     
            sta $07b3,y        ; $d25e: 99 b3 07  
            iny                ; $d261: c8        
            cpy #$0d           ; $d262: c0 0d     
            bne __d25c         ; $d264: d0 f6     
            lda #$00           ; $d266: a9 00     
            sta $92            ; $d268: 85 92     
__d26a:     lda #$00           ; $d26a: a9 00     
            sta $93            ; $d26c: 85 93     
__d26e:     jsr __d53c         ; $d26e: 20 3c d5  
            lda #$08           ; $d271: a9 08     
            sta $94            ; $d273: 85 94     
__d275:     lda #$00           ; $d275: a9 00     
            sta $95            ; $d277: 85 95     
__d279:     jsr __d29e         ; $d279: 20 9e d2  
            inc $95            ; $d27c: e6 95     
            lda $95            ; $d27e: a5 95     
            cmp #$03           ; $d280: c9 03     
            bne __d279         ; $d282: d0 f5     
            dec $94            ; $d284: c6 94     
            bne __d275         ; $d286: d0 ed     
            inc $93            ; $d288: e6 93     
            lda $93            ; $d28a: a5 93     
            cmp #$03           ; $d28c: c9 03     
            bne __d26e         ; $d28e: d0 de     
            inc $92            ; $d290: e6 92     
            lda $92            ; $d292: a5 92     
            cmp #$07           ; $d294: c9 07     
            bne __d26a         ; $d296: d0 d2     
            jsr __d3b7         ; $d298: 20 b7 d3  
            jmp __d049         ; $d29b: 4c 49 d0  

;-------------------------------------------------------------------------------
__d29e:     lda $93            ; $d29e: a5 93     
            asl                ; $d2a0: 0a        
            adc $93            ; $d2a1: 65 93     
            adc $95            ; $d2a3: 65 95     
            asl                ; $d2a5: 0a        
            asl                ; $d2a6: 0a        
            sta $96            ; $d2a7: 85 96     
            ldx $94            ; $d2a9: a6 94     
            jsr __d2ba         ; $d2ab: 20 ba d2  
            jsr __d2de         ; $d2ae: 20 de d2  
            ldy $96            ; $d2b1: a4 96     
            lda __d2fe,y       ; $d2b3: b9 fe d2  
            sta $2007          ; $d2b6: 8d 07 20  
            rts                ; $d2b9: 60        

;-------------------------------------------------------------------------------
__d2ba:     lda $92            ; $d2ba: a5 92     
            asl                ; $d2bc: 0a        
            tay                ; $d2bd: a8        
            lda $93            ; $d2be: a5 93     
            cmp #$01           ; $d2c0: c9 01     
            beq __d2d7         ; $d2c2: f0 13     
            bcs __d2d8         ; $d2c4: b0 12     
            dey                ; $d2c6: 88        
            bmi __d2d7         ; $d2c7: 30 0e     
__d2c9:     lda $07b3,y        ; $d2c9: b9 b3 07  
            and __d1f5,x       ; $d2cc: 3d f5 d1  
            beq __d2d7         ; $d2cf: f0 06     
            lda $96            ; $d2d1: a5 96     
            ora #$02           ; $d2d3: 09 02     
            sta $96            ; $d2d5: 85 96     
__d2d7:     rts                ; $d2d7: 60        

;-------------------------------------------------------------------------------
__d2d8:     iny                ; $d2d8: c8        
            cpy #$0d           ; $d2d9: c0 0d     
            bcc __d2c9         ; $d2db: 90 ec     
            rts                ; $d2dd: 60        

;-------------------------------------------------------------------------------
__d2de:     lda $92            ; $d2de: a5 92     
            asl                ; $d2e0: 0a        
            tay                ; $d2e1: a8        
            lda $95            ; $d2e2: a5 95     
            cmp #$01           ; $d2e4: c9 01     
            beq __d2fd         ; $d2e6: f0 15     
            bcs __d2ef         ; $d2e8: b0 05     
            inx                ; $d2ea: e8        
            cpx #$09           ; $d2eb: e0 09     
            bcs __d2fd         ; $d2ed: b0 0e     
__d2ef:     lda $07b3,y        ; $d2ef: b9 b3 07  
            and __d1f5,x       ; $d2f2: 3d f5 d1  
            beq __d2fd         ; $d2f5: f0 06     
            lda $96            ; $d2f7: a5 96     
            ora #$01           ; $d2f9: 09 01     
            sta $96            ; $d2fb: 85 96     
__d2fd:     rts                ; $d2fd: 60        

;-------------------------------------------------------------------------------
__d2fe:     .hex 00 01 03 0f   ; $d2fe: 00 01 03 0f   Data
            .hex 01 01 04 04   ; $d302: 01 01 04 04   Data
            .hex 02 01 05 0e   ; $d306: 02 01 05 0e   Data
            .hex 03 04 03 04   ; $d30a: 03 04 03 04   Data
            .hex 04 04 04 04   ; $d30e: 04 04 04 04   Data
            .hex 05 04 05 04   ; $d312: 05 04 05 04   Data
            .hex 06 07 03 0d   ; $d316: 06 07 03 0d   Data
            .hex 07 07 04 04   ; $d31a: 07 07 04 04   Data
            .hex 08 07 05 0c   ; $d31e: 08 07 05 0c   Data

;-------------------------------------------------------------------------------
__d322:     ldy $5a            ; $d322: a4 5a     
            lda __db83,y       ; $d324: b9 83 db  
            sta $90            ; $d327: 85 90     
            lda __db84,y       ; $d329: b9 84 db  
            sta $91            ; $d32c: 85 91     
            ldy #$00           ; $d32e: a0 00     
            lda ($90),y        ; $d330: b1 90     
            tax                ; $d332: aa        
            sta $07a2,y        ; $d333: 99 a2 07  
__d336:     iny                ; $d336: c8        
            lda ($90),y        ; $d337: b1 90     
            sta $07a2,y        ; $d339: 99 a2 07  
            dex                ; $d33c: ca        
            bne __d336         ; $d33d: d0 f7     
__d33f:     jsr __d34a         ; $d33f: 20 4a d3  
            inx                ; $d342: e8        
            inx                ; $d343: e8        
            cpx $07a2          ; $d344: ec a2 07  
            bne __d33f         ; $d347: d0 f6     
            rts                ; $d349: 60        

;-------------------------------------------------------------------------------
__d34a:     lda $07a4,x        ; $d34a: bd a4 07  
            sta $91            ; $d34d: 85 91     
            lda $07a3,x        ; $d34f: bd a3 07  
            clc                ; $d352: 18        
            adc #$01           ; $d353: 69 01     
            lsr                ; $d355: 4a        
            lsr                ; $d356: 4a        
            sta $92            ; $d357: 85 92     
            lsr                ; $d359: 4a        
            lsr                ; $d35a: 4a        
            sta $94            ; $d35b: 85 94     
            ror $91            ; $d35d: 66 91     
            lsr                ; $d35f: 4a        
            ror $91            ; $d360: 66 91     
            lsr                ; $d362: 4a        
            ror $91            ; $d363: 66 91     
            ora #$20           ; $d365: 09 20     
            sta $90            ; $d367: 85 90     
            jsr __d392         ; $d369: 20 92 d3  
            lda #$23           ; $d36c: a9 23     
            sta $2006          ; $d36e: 8d 06 20  
            lda $91            ; $d371: a5 91     
            lsr                ; $d373: 4a        
            lsr                ; $d374: 4a        
            rol $94            ; $d375: 26 94     
            and #$07           ; $d377: 29 07     
            sta $93            ; $d379: 85 93     
            lda $92            ; $d37b: a5 92     
            and #$38           ; $d37d: 29 38     
            ora $93            ; $d37f: 05 93     
            ora #$c0           ; $d381: 09 c0     
            sta $2006          ; $d383: 8d 06 20  
            lda $94            ; $d386: a5 94     
            and #$03           ; $d388: 29 03     
            tay                ; $d38a: a8        
            lda __d3b3,y       ; $d38b: b9 b3 d3  
            sta $2007          ; $d38e: 8d 07 20  
            rts                ; $d391: 60        

;-------------------------------------------------------------------------------
__d392:     ldy #$10           ; $d392: a0 10     
            jsr __d397         ; $d394: 20 97 d3  
__d397:     lda $90            ; $d397: a5 90     
            sta $2006          ; $d399: 8d 06 20  
            lda $91            ; $d39c: a5 91     
            sta $2006          ; $d39e: 8d 06 20  
            clc                ; $d3a1: 18        
            adc #$20           ; $d3a2: 69 20     
            sta $91            ; $d3a4: 85 91     
            bcc __d3aa         ; $d3a6: 90 02     
            inc $91            ; $d3a8: e6 91     
__d3aa:     sty $2007          ; $d3aa: 8c 07 20  
            iny                ; $d3ad: c8        
            sty $2007          ; $d3ae: 8c 07 20  
            iny                ; $d3b1: c8        
            rts                ; $d3b2: 60        

;-------------------------------------------------------------------------------
__d3b3:     .hex fd f7 df 7f   ; $d3b3: fd f7 df 7f   Data

;-------------------------------------------------------------------------------
__d3b7:     ldx #$00           ; $d3b7: a2 00     
__d3b9:     txa                ; $d3b9: 8a        
            eor #$ff           ; $d3ba: 49 ff     
            sec                ; $d3bc: 38        
            adc #$23           ; $d3bd: 69 23     
            lsr                ; $d3bf: 4a        
            lsr                ; $d3c0: 4a        
            sta $93            ; $d3c1: 85 93     
            txa                ; $d3c3: 8a        
            and #$fc           ; $d3c4: 29 fc     
            beq __d3cf         ; $d3c6: f0 07     
            lda #$08           ; $d3c8: a9 08     
            cpx #$20           ; $d3ca: e0 20     
            bcc __d3cf         ; $d3cc: 90 01     
            asl                ; $d3ce: 0a        
__d3cf:     sta $92            ; $d3cf: 85 92     
            txa                ; $d3d1: 8a        
            and #$03           ; $d3d2: 29 03     
            asl                ; $d3d4: 0a        
            ora $92            ; $d3d5: 05 92     
            sta $92            ; $d3d7: 85 92     
            ldy #$00           ; $d3d9: a0 00     
__d3db:     stx $91            ; $d3db: 86 91     
            tya                ; $d3dd: 98        
            beq __d3e7         ; $d3de: f0 07     
            lda #$18           ; $d3e0: a9 18     
            cpy #$0e           ; $d3e2: c0 0e     
            bcc __d3e7         ; $d3e4: 90 01     
            asl                ; $d3e6: 0a        
__d3e7:     clc                ; $d3e7: 18        
            adc $92            ; $d3e8: 65 92     
            tax                ; $d3ea: aa        
            lda __d40c,x       ; $d3eb: bd 0c d4  
            sta $d3            ; $d3ee: 85 d3     
            lda __d40d,x       ; $d3f0: bd 0d d4  
            sta $d4            ; $d3f3: 85 d4     
            ldx $93            ; $d3f5: a6 93     
            clc                ; $d3f7: 18        
            jsr $00d2          ; $d3f8: 20 d2 00  
            ldx $91            ; $d3fb: a6 91     
            ror $077e,x        ; $d3fd: 7e 7e 07  
            iny                ; $d400: c8        
            iny                ; $d401: c8        
            cpy #$10           ; $d402: c0 10     
            bne __d3db         ; $d404: d0 d5     
            inx                ; $d406: e8        
            cpx #$24           ; $d407: e0 24     
            bne __d3b9         ; $d409: d0 ae     
            rts                ; $d40b: 60        

;-------------------------------------------------------------------------------
__d40c:     .hex 5d            ; $d40c: 5d            Data
__d40d:     .hex d4 5d d4 5c   ; $d40d: d4 5d d4 5c   Data
            .hex d4 5c d4 5d   ; $d411: d4 5c d4 5d   Data
            .hex d4 5e d4 5d   ; $d415: d4 5e d4 5d   Data
            .hex d4 5c d4 5c   ; $d419: d4 5c d4 5c   Data
            .hex d4 5d d4 5d   ; $d41d: d4 5d d4 5d   Data
            .hex d4 5c d4 54   ; $d421: d4 5c d4 54   Data
            .hex d4 5d d4 5c   ; $d425: d4 5d d4 5c   Data
            .hex d4 5d d4 54   ; $d429: d4 5d d4 54   Data
            .hex d4 5e d4 68   ; $d42d: d4 5e d4 68   Data
            .hex d4 72 d4 5c   ; $d431: d4 72 d4 5c   Data
            .hex d4 5d d4 68   ; $d435: d4 5d d4 68   Data
            .hex d4 5d d4 5d   ; $d439: d4 5d d4 5d   Data
            .hex d4 5c d4 5c   ; $d43d: d4 5c d4 5c   Data
            .hex d4 5d d4 5d   ; $d441: d4 5d d4 5d   Data
            .hex d4 5c d4 5d   ; $d445: d4 5c d4 5d   Data
            .hex d4 72 d4 5c   ; $d449: d4 72 d4 5c   Data
            .hex d4 5c d4 5d   ; $d44d: d4 5c d4 5d   Data
            .hex d4 5d d4      ; $d451: d4 5d d4      Data

;-------------------------------------------------------------------------------
            lda $07b2,y        ; $d454: b9 b2 07  
            and __d1f5,x       ; $d457: 3d f5 d1  
            beq __d45d         ; $d45a: f0 01     
            sec                ; $d45c: 38        
__d45d:     rts                ; $d45d: 60        

;-------------------------------------------------------------------------------
            lda $07b3,y        ; $d45e: b9 b3 07  
            and __d1f6,x       ; $d461: 3d f6 d1  
            beq __d467         ; $d464: f0 01     
            sec                ; $d466: 38        
__d467:     rts                ; $d467: 60        

;-------------------------------------------------------------------------------
            lda $07b2,y        ; $d468: b9 b2 07  
            and __d1f6,x       ; $d46b: 3d f6 d1  
            beq __d471         ; $d46e: f0 01     
            sec                ; $d470: 38        
__d471:     rts                ; $d471: 60        

;-------------------------------------------------------------------------------
            lda $07b1,y        ; $d472: b9 b1 07  
            and __d1f6,x       ; $d475: 3d f6 d1  
            beq __d47b         ; $d478: f0 01     
            sec                ; $d47a: 38        
__d47b:     rts                ; $d47b: 60        

;-------------------------------------------------------------------------------
__d47c:     ldx $52            ; $d47c: a6 52     
            beq __d499         ; $d47e: f0 19     
            lda #$20           ; $d480: a9 20     
            sta $90            ; $d482: 85 90     
            lda #$c2           ; $d484: a9 c2     
            sta $91            ; $d486: 85 91     
__d488:     jsr __d53c         ; $d488: 20 3c d5  
            lda #$5f           ; $d48b: a9 5f     
            sta $2007          ; $d48d: 8d 07 20  
            dex                ; $d490: ca        
            beq __d499         ; $d491: f0 06     
            sta $2007          ; $d493: 8d 07 20  
            dex                ; $d496: ca        
            bne __d488         ; $d497: d0 ef     
__d499:     rts                ; $d499: 60        

;-------------------------------------------------------------------------------
__d49a:     lda $52            ; $d49a: a5 52     
            beq __d4e3         ; $d49c: f0 45     
            dec $52            ; $d49e: c6 52     
            lda #$23           ; $d4a0: a9 23     
            sta $92            ; $d4a2: 85 92     
            ldy $09            ; $d4a4: a4 09     
            lda $52            ; $d4a6: a5 52     
            and #$fe           ; $d4a8: 29 fe     
            sta $91            ; $d4aa: 85 91     
            lda #$00           ; $d4ac: a9 00     
            asl $91            ; $d4ae: 06 91     
            rol                ; $d4b0: 2a        
            asl $91            ; $d4b1: 06 91     
            rol                ; $d4b3: 2a        
            asl $91            ; $d4b4: 06 91     
            rol                ; $d4b6: 2a        
            asl $91            ; $d4b7: 06 91     
            rol                ; $d4b9: 2a        
            sta $90            ; $d4ba: 85 90     
            lda $52            ; $d4bc: a5 52     
            and #$01           ; $d4be: 29 01     
            ora $91            ; $d4c0: 05 91     
            clc                ; $d4c2: 18        
            adc #$c2           ; $d4c3: 69 c2     
            sta $91            ; $d4c5: 85 91     
            lda $90            ; $d4c7: a5 90     
            adc #$20           ; $d4c9: 69 20     
            sta $0180,y        ; $d4cb: 99 80 01  
            iny                ; $d4ce: c8        
            lda $91            ; $d4cf: a5 91     
            sta $0180,y        ; $d4d1: 99 80 01  
            iny                ; $d4d4: c8        
            lda #$01           ; $d4d5: a9 01     
            sta $0180,y        ; $d4d7: 99 80 01  
            iny                ; $d4da: c8        
            lda $92            ; $d4db: a5 92     
            sta $0180,y        ; $d4dd: 99 80 01  
            iny                ; $d4e0: c8        
            sty $09            ; $d4e1: 84 09     
__d4e3:     rts                ; $d4e3: 60        

;-------------------------------------------------------------------------------
__d4e4:     lda #$78           ; $d4e4: a9 78     
            sta $91            ; $d4e6: 85 91     
            lda $51            ; $d4e8: a5 51     
            and #$0f           ; $d4ea: 29 0f     
            sta $92            ; $d4ec: 85 92     
            lda $51            ; $d4ee: a5 51     
            lsr                ; $d4f0: 4a        
            lsr                ; $d4f1: 4a        
            lsr                ; $d4f2: 4a        
            lsr                ; $d4f3: 4a        
            tax                ; $d4f4: aa        
            clc                ; $d4f5: 18        
            adc $92            ; $d4f6: 65 92     
            eor #$ff           ; $d4f8: 49 ff     
            adc #$8f           ; $d4fa: 69 8f     
            lsr                ; $d4fc: 4a        
            ror $91            ; $d4fd: 66 91     
            lsr                ; $d4ff: 4a        
            ror $91            ; $d500: 66 91     
            sta $90            ; $d502: 85 90     
            txa                ; $d504: 8a        
            beq __d524         ; $d505: f0 1d     
__d507:     jsr __d53c         ; $d507: 20 3c d5  
            lda #$3c           ; $d50a: a9 3c     
            sta $2007          ; $d50c: 8d 07 20  
            lda #$3d           ; $d50f: a9 3d     
            sta $2007          ; $d511: 8d 07 20  
            jsr __d53c         ; $d514: 20 3c d5  
            lda #$3e           ; $d517: a9 3e     
            sta $2007          ; $d519: 8d 07 20  
            lda #$3f           ; $d51c: a9 3f     
            sta $2007          ; $d51e: 8d 07 20  
            dex                ; $d521: ca        
            bne __d507         ; $d522: d0 e3     
__d524:     ldx $92            ; $d524: a6 92     
            beq __d53b         ; $d526: f0 13     
__d528:     jsr __d53c         ; $d528: 20 3c d5  
            lda #$3a           ; $d52b: a9 3a     
            sta $2007          ; $d52d: 8d 07 20  
            jsr __d53c         ; $d530: 20 3c d5  
            lda #$3b           ; $d533: a9 3b     
            sta $2007          ; $d535: 8d 07 20  
            dex                ; $d538: ca        
            bne __d528         ; $d539: d0 ed     
__d53b:     rts                ; $d53b: 60        

;-------------------------------------------------------------------------------
__d53c:     lda $90            ; $d53c: a5 90     
            sta $2006          ; $d53e: 8d 06 20  
            lda $91            ; $d541: a5 91     
            sta $2006          ; $d543: 8d 06 20  
            clc                ; $d546: 18        
            adc #$20           ; $d547: 69 20     
            sta $91            ; $d549: 85 91     
            bcc __d54f         ; $d54b: 90 02     
            inc $90            ; $d54d: e6 90     
__d54f:     rts                ; $d54f: 60        

;-------------------------------------------------------------------------------
__d550:     tay                ; $d550: a8        
__d551:     lda __d57d,y       ; $d551: b9 7d d5  
            sta $90            ; $d554: 85 90     
            lda __d57e,y       ; $d556: b9 7e d5  
            sta $91            ; $d559: 85 91     
            ldy #$00           ; $d55b: a0 00     
__d55d:     lda ($90),y        ; $d55d: b1 90     
            beq __d57c         ; $d55f: f0 1b     
            tax                ; $d561: aa        
            iny                ; $d562: c8        
            iny                ; $d563: c8        
            lda ($90),y        ; $d564: b1 90     
            sta $2006          ; $d566: 8d 06 20  
            dey                ; $d569: 88        
            lda ($90),y        ; $d56a: b1 90     
            sta $2006          ; $d56c: 8d 06 20  
            iny                ; $d56f: c8        
            iny                ; $d570: c8        
__d571:     lda ($90),y        ; $d571: b1 90     
            sta $2007          ; $d573: 8d 07 20  
            iny                ; $d576: c8        
            dex                ; $d577: ca        
            bne __d571         ; $d578: d0 f7     
            beq __d55d         ; $d57a: f0 e1     
__d57c:     rts                ; $d57c: 60        

;-------------------------------------------------------------------------------
__d57d:     .hex 8f            ; $d57d: 8f            Data
__d57e:     .hex d5 f3 d5 ff   ; $d57e: d5 f3 d5 ff   Data
            .hex d5 04 d6 09   ; $d582: d5 04 d6 09   Data
            .hex d6 0e d6 13   ; $d586: d6 0e d6 13   Data
            .hex d6 19 d6 3d   ; $d58a: d6 19 d6 3d   Data
            .hex d6 08 eb 21   ; $d58e: d6 08 eb 21   Data
            .hex 31 20 50 4c   ; $d592: 31 20 50 4c   Data
            .hex 41 59 45 52   ; $d596: 41 59 45 52   Data
            .hex 09 2b 22 32   ; $d59a: 09 2b 22 32   Data
            .hex 20 50 4c 41   ; $d59e: 20 50 4c 41   Data
            .hex 59 45 52 53   ; $d5a2: 59 45 52 53   Data
            .hex 09 8b 22 24   ; $d5a6: 09 8b 22 24   Data
            .hex 25 26 27 28   ; $d5aa: 25 26 27 28   Data
            .hex 29 2a 2b 2c   ; $d5ae: 29 2a 2b 2c   Data
            .hex 16 e4 22 40   ; $d5b2: 16 e4 22 40   Data
            .hex 20 31 39 38   ; $d5b6: 20 31 39 38   Data
            .hex 31 20 31 39   ; $d5ba: 31 20 31 39   Data
            .hex 38 35 20 4e   ; $d5be: 38 35 20 4e   Data
            .hex 41 4d 43 4f   ; $d5c2: 41 4d 43 4f   Data
            .hex 20 4c 54 44   ; $d5c6: 20 4c 54 44   Data
            .hex 2e 13 26 23   ; $d5ca: 2e 13 26 23   Data
            .hex 41 4c 4c 20   ; $d5ce: 41 4c 4c 20   Data
            .hex 52 49 47 48   ; $d5d2: 52 49 47 48   Data
            .hex 54 53 20 52   ; $d5d6: 54 53 20 52   Data
            .hex 45 53 45 52   ; $d5da: 45 53 45 52   Data
            .hex 56 45 44 0e   ; $d5de: 56 45 44 0e   Data
            .hex ca 23 fa fa   ; $d5e2: ca 23 fa fa   Data
            .hex fa fa 05 00   ; $d5e6: fa fa 05 00   Data
            .hex ff ff ff ff   ; $d5ea: ff ff ff ff   Data
            .hex ff ff ff ff   ; $d5ee: ff ff ff ff   Data
            .hex 00 02 62 20   ; $d5f2: 00 02 62 20   Data
            .hex 5c 2d 03 6b   ; $d5f6: 5c 2d 03 6b   Data
            .hex 20 5b 5c 2d   ; $d5fa: 20 5b 5c 2d   Data
            .hex 00 01 e9 21   ; $d5fe: 00 01 e9 21   Data
            .hex 20 00 01 29   ; $d602: 20 00 01 29   Data
            .hex 22 20 00 01   ; $d606: 22 20 00 01   Data
            .hex e9 21 2f 00   ; $d60a: e9 21 2f 00   Data
            .hex 01 29 22 2f   ; $d60e: 01 29 22 2f   Data
            .hex 00 02 76 20   ; $d612: 00 02 76 20   Data
            .hex 5d 2d 00 20   ; $d616: 5d 2d 00 20   Data
            .hex 00 3f 0f 16   ; $d61a: 00 3f 0f 16   Data
            .hex 20 0f 0f 08   ; $d61e: 20 0f 0f 08   Data
            .hex 27 0f 0f 11   ; $d622: 27 0f 0f 11   Data
            .hex 29 0f 0f 16   ; $d626: 29 0f 0f 16   Data
            .hex 27 10 0f 16   ; $d62a: 27 10 0f 16   Data
            .hex 27 11 0f 27   ; $d62e: 27 11 0f 27   Data
            .hex 11 2a 0f 34   ; $d632: 11 2a 0f 34   Data
            .hex 14 21 0f 16   ; $d636: 14 21 0f 16   Data
            .hex 20 1a 00 20   ; $d63a: 20 1a 00 20   Data
            .hex 00 3f 0f 16   ; $d63e: 00 3f 0f 16   Data
            .hex 20 01 0f 08   ; $d642: 20 01 0f 08   Data
            .hex 27 01 0f 11   ; $d646: 27 01 0f 11   Data
            .hex 29 01 0f 11   ; $d64a: 29 01 0f 11   Data
            .hex 2c 01 0f 16   ; $d64e: 2c 01 0f 16   Data
            .hex 27 11 0f 27   ; $d652: 27 11 0f 27   Data
            .hex 11 2a 0f 34   ; $d656: 11 2a 0f 34   Data
            .hex 14 21 0f 16   ; $d65a: 14 21 0f 16   Data
            .hex 20 1a 00      ; $d65e: 20 1a 00      Data

;-------------------------------------------------------------------------------
__d661:     lda __d69a,y       ; $d661: b9 9a d6  
            sta $91            ; $d664: 85 91     
            lda __d69b,y       ; $d666: b9 9b d6  
            sta $90            ; $d669: 85 90     
            lda __d69c,y       ; $d66b: b9 9c d6  
            sta $92            ; $d66e: 85 92     
            ldx __d69d,y       ; $d670: be 9d d6  
            lda __d69e,y       ; $d673: b9 9e d6  
            tay                ; $d676: a8        
__d677:     lda $92            ; $d677: a5 92     
            sta $93            ; $d679: 85 93     
            lda $90            ; $d67b: a5 90     
            sta $2006          ; $d67d: 8d 06 20  
            lda $91            ; $d680: a5 91     
            sta $2006          ; $d682: 8d 06 20  
            clc                ; $d685: 18        
            adc #$20           ; $d686: 69 20     
            sta $91            ; $d688: 85 91     
            bcc __d68e         ; $d68a: 90 02     
            inc $90            ; $d68c: e6 90     
__d68e:     sty $2007          ; $d68e: 8c 07 20  
            iny                ; $d691: c8        
            dec $93            ; $d692: c6 93     
            bne __d68e         ; $d694: d0 f8     
            dex                ; $d696: ca        
            bne __d677         ; $d697: d0 de     
            rts                ; $d699: 60        

;-------------------------------------------------------------------------------
__d69a:     .hex 06            ; $d69a: 06            Data
__d69b:     .hex 21            ; $d69b: 21            Data
__d69c:     .hex 14            ; $d69c: 14            Data
__d69d:     .hex 03            ; $d69d: 03            Data
__d69e:     .hex b0 cf 21 04   ; $d69e: b0 cf 21 04   Data
            .hex 04 a0         ; $d6a2: 04 a0         Data

;-------------------------------------------------------------------------------
__d6a4:     lda #$00           ; $d6a4: a9 00     
            sta $060c          ; $d6a6: 8d 0c 06  
            rts                ; $d6a9: 60        

;-------------------------------------------------------------------------------
__d6aa:     lda __d77f,y       ; $d6aa: b9 7f d7  
            asl                ; $d6ad: 0a        
            tax                ; $d6ae: aa        
            lda __d760,x       ; $d6af: bd 60 d7  
            sta $2006          ; $d6b2: 8d 06 20  
            lda __d75f,x       ; $d6b5: bd 5f d7  
            sta $2006          ; $d6b8: 8d 06 20  
            lda __d77f,y       ; $d6bb: b9 7f d7  
            ora #$a0           ; $d6be: 09 a0     
            sta $2007          ; $d6c0: 8d 07 20  
            jmp __d70b         ; $d6c3: 4c 0b d7  

;-------------------------------------------------------------------------------
__d6c6:     lda $50            ; $d6c6: a5 50     
            bne __d6a4         ; $d6c8: d0 da     
            lda $76            ; $d6ca: a5 76     
            beq __d6a4         ; $d6cc: f0 d6     
            lda $060c          ; $d6ce: ad 0c 06  
            bne __d6d8         ; $d6d1: d0 05     
            lda $40            ; $d6d3: a5 40     
            sta $060c          ; $d6d5: 8d 0c 06  
__d6d8:     lda $79            ; $d6d8: a5 79     
            and #$03           ; $d6da: 29 03     
            bne __d735         ; $d6dc: d0 57     
            lda $79            ; $d6de: a5 79     
            lsr                ; $d6e0: 4a        
            lsr                ; $d6e1: 4a        
            and #$0f           ; $d6e2: 29 0f     
            tay                ; $d6e4: a8        
            lda $78            ; $d6e5: a5 78     
            cmp #$01           ; $d6e7: c9 01     
            beq __d6aa         ; $d6e9: f0 bf     
            lda __d77f,y       ; $d6eb: b9 7f d7  
            asl                ; $d6ee: 0a        
            tax                ; $d6ef: aa        
            lda __d760,x       ; $d6f0: bd 60 d7  
            sta $2006          ; $d6f3: 8d 06 20  
            lda __d75f,x       ; $d6f6: bd 5f d7  
            sta $2006          ; $d6f9: 8d 06 20  
            lda $79            ; $d6fc: a5 79     
            lsr                ; $d6fe: 4a        
            lsr                ; $d6ff: 4a        
            and #$30           ; $d700: 29 30     
            ora __d77f,y       ; $d702: 19 7f d7  
            clc                ; $d705: 18        
            adc #$60           ; $d706: 69 60     
            sta $2007          ; $d708: 8d 07 20  
__d70b:     lda $79            ; $d70b: a5 79     
            and #$08           ; $d70d: 29 08     
            beq __d736         ; $d70f: f0 25     
            lda #$23           ; $d711: a9 23     
            sta $2006          ; $d713: 8d 06 20  
            lda #$db           ; $d716: a9 db     
            sta $2006          ; $d718: 8d 06 20  
            lda #$ff           ; $d71b: a9 ff     
            sta $2007          ; $d71d: 8d 07 20  
            sta $2007          ; $d720: 8d 07 20  
            lda #$23           ; $d723: a9 23     
            sta $2006          ; $d725: 8d 06 20  
            lda #$e3           ; $d728: a9 e3     
            sta $2006          ; $d72a: 8d 06 20  
            lda #$ff           ; $d72d: a9 ff     
            sta $2007          ; $d72f: 8d 07 20  
            sta $2007          ; $d732: 8d 07 20  
__d735:     rts                ; $d735: 60        

;-------------------------------------------------------------------------------
__d736:     lda #$23           ; $d736: a9 23     
            sta $2006          ; $d738: 8d 06 20  
            lda #$db           ; $d73b: a9 db     
            sta $2006          ; $d73d: 8d 06 20  
            lda #$7f           ; $d740: a9 7f     
            sta $2007          ; $d742: 8d 07 20  
            lda #$5f           ; $d745: a9 5f     
            sta $2007          ; $d747: 8d 07 20  
            lda #$23           ; $d74a: a9 23     
            sta $2006          ; $d74c: 8d 06 20  
            lda #$e3           ; $d74f: a9 e3     
            sta $2006          ; $d751: 8d 06 20  
            lda #$f7           ; $d754: a9 f7     
            sta $2007          ; $d756: 8d 07 20  
            lda #$f5           ; $d759: a9 f5     
            sta $2007          ; $d75b: 8d 07 20  
            rts                ; $d75e: 60        

;-------------------------------------------------------------------------------
__d75f:     .hex cf            ; $d75f: cf            Data
__d760:     .hex 21 d0 21 d1   ; $d760: 21 d0 21 d1   Data
            .hex 21 d2 21 ef   ; $d764: 21 d2 21 ef   Data
            .hex 21 f0 21 f1   ; $d768: 21 f0 21 f1   Data
            .hex 21 f2 21 0f   ; $d76c: 21 f2 21 0f   Data
            .hex 22 10 22 11   ; $d770: 22 10 22 11   Data
            .hex 22 12 22 2f   ; $d774: 22 12 22 2f   Data
            .hex 22 30 22 31   ; $d778: 22 30 22 31   Data
            .hex 22 32 22      ; $d77c: 22 32 22      Data
__d77f:     .hex 06 05 09 0a   ; $d77f: 06 05 09 0a   Data
            .hex 0b 07 03 02   ; $d783: 0b 07 03 02   Data
            .hex 01 00 04 08   ; $d787: 01 00 04 08   Data
            .hex 0c 0d 0e 0f   ; $d78b: 0c 0d 0e 0f   Data

;-------------------------------------------------------------------------------
__d78f:     lda __d7cc,y       ; $d78f: b9 cc d7  
            sta $2006          ; $d792: 8d 06 20  
            lda __d7cb,y       ; $d795: b9 cb d7  
            sta $2006          ; $d798: 8d 06 20  
            lda __d7cd,y       ; $d79b: b9 cd d7  
            sta $90            ; $d79e: 85 90     
            lda __d7ce,y       ; $d7a0: b9 ce d7  
            sta $91            ; $d7a3: 85 91     
            ldy #$ff           ; $d7a5: a0 ff     
__d7a7:     iny                ; $d7a7: c8        
            lda ($90),y        ; $d7a8: b1 90     
            bne __d7ad         ; $d7aa: d0 01     
            rts                ; $d7ac: 60        

;-------------------------------------------------------------------------------
__d7ad:     sta $92            ; $d7ad: 85 92     
            sty $93            ; $d7af: 84 93     
__d7b1:     iny                ; $d7b1: c8        
            lda ($90),y        ; $d7b2: b1 90     
            bne __d7bf         ; $d7b4: d0 09     
            dec $92            ; $d7b6: c6 92     
            beq __d7a7         ; $d7b8: f0 ed     
            ldy $93            ; $d7ba: a4 93     
            jmp __d7b1         ; $d7bc: 4c b1 d7  

;-------------------------------------------------------------------------------
__d7bf:     tax                ; $d7bf: aa        
            iny                ; $d7c0: c8        
            lda ($90),y        ; $d7c1: b1 90     
__d7c3:     sta $2007          ; $d7c3: 8d 07 20  
            dex                ; $d7c6: ca        
            bne __d7c3         ; $d7c7: d0 fa     
            beq __d7b1         ; $d7c9: f0 e6     

;-------------------------------------------------------------------------------
__d7cb:     .hex 00            ; $d7cb: 00            Data
__d7cc:     .hex 20            ; $d7cc: 20            Data
__d7cd:     .hex cf            ; $d7cd: cf            Data
__d7ce:     .hex d7 01 a4 23   ; $d7ce: d7 01 a4 23   Data
            .hex 1a 20 00 15   ; $d7d2: 1a 20 00 15   Data
            .hex 06 23 1a 20   ; $d7d6: 06 23 1a 20   Data
            .hex 00 01 06 23   ; $d7da: 00 01 06 23   Data
            .hex 1a 20 00 01   ; $d7de: 1a 20 00 01   Data
            .hex 42 23 00 01   ; $d7e2: 42 23 00 01   Data
            .hex 08 00 02 f0   ; $d7e6: 08 00 02 f0   Data
            .hex 04 fa 01 f5   ; $d7ea: 04 fa 01 f5   Data
            .hex 01 33 00 05   ; $d7ee: 01 33 00 05   Data
            .hex 07 ff 01 33   ; $d7f2: 07 ff 01 33   Data
            .hex 00 00         ; $d7f6: 00 00         Data
__d7f8:     lda #$0a           ; $d7f8: a9 0a     
            sta $ae            ; $d7fa: 85 ae     
            lda #$00           ; $d7fc: a9 00     
            sta $af            ; $d7fe: 85 af     
            jsr __d85b         ; $d800: 20 5b d8  
            lda #$04           ; $d803: a9 04     
            sta $05            ; $d805: 85 05     
            lda #$00           ; $d807: a9 00     
            sta $76            ; $d809: 85 76     
            sta $50            ; $d80b: 85 50     
            sta $0c            ; $d80d: 85 0c     
            sta $0d            ; $d80f: 85 0d     
            sta $0e            ; $d811: 85 0e     
            sta $0f            ; $d813: 85 0f     
            sta $bd            ; $d815: 85 bd     
            lda #$18           ; $d817: a9 18     
            sta $52            ; $d819: 85 52     
            sta $53            ; $d81b: 85 53     
            lda #$01           ; $d81d: a9 01     
            sta $51            ; $d81f: 85 51     
            lda #$3c           ; $d821: a9 3c     
            sta $a9            ; $d823: 85 a9     
__d825:     jsr __d85b         ; $d825: 20 5b d8  
            dec $a9            ; $d828: c6 a9     
            bne __d825         ; $d82a: d0 f9     
            jsr __dd6d         ; $d82c: 20 6d dd  
            jsr __d876         ; $d82f: 20 76 d8  
            ldy #$06           ; $d832: a0 06     
            jsr __c44b         ; $d834: 20 4b c4  
__d837:     jsr __d85b         ; $d837: 20 5b d8  
            jsr __d977         ; $d83a: 20 77 d9  
            lda $bd            ; $d83d: a5 bd     
            bne __d848         ; $d83f: d0 07     
            lda $48            ; $d841: a5 48     
            bne __d84e         ; $d843: d0 09     
__d845:     jmp __d872         ; $d845: 4c 72 d8  

;-------------------------------------------------------------------------------
__d848:     lda $48            ; $d848: a5 48     
            ora $49            ; $d84a: 05 49     
            beq __d845         ; $d84c: f0 f7     
__d84e:     lda $53            ; $d84e: a5 53     
            beq __d858         ; $d850: f0 06     
            jsr __cf7e         ; $d852: 20 7e cf  
            jmp __d837         ; $d855: 4c 37 d8  

;-------------------------------------------------------------------------------
__d858:     jmp __d872         ; $d858: 4c 72 d8  

;-------------------------------------------------------------------------------
__d85b:     jsr __c46a         ; $d85b: 20 6a c4  
            lda $16            ; $d85e: a5 16     
            cmp #$01           ; $d860: c9 01     
            beq __d872         ; $d862: f0 0e     
            lda $14            ; $d864: a5 14     
            cmp #$01           ; $d866: c9 01     
            beq __d872         ; $d868: f0 08     
            dec $af            ; $d86a: c6 af     
            bne __d875         ; $d86c: d0 07     
            dec $ae            ; $d86e: c6 ae     
            bne __d875         ; $d870: d0 03     
__d872:     jmp reset          ; $d872: 4c 40 c0  

;-------------------------------------------------------------------------------
__d875:     rts                ; $d875: 60        

;-------------------------------------------------------------------------------
__d876:     jsr __d96b         ; $d876: 20 6b d9  
            ldy #$00           ; $d879: a0 00     
            sty $75            ; $d87b: 84 75     
            sty $74            ; $d87d: 84 74     
            sty $7d            ; $d87f: 84 7d     
            sty $7c            ; $d881: 84 7c     
            sty $5a            ; $d883: 84 5a     
            sty $5b            ; $d885: 84 5b     
            sty $4a            ; $d887: 84 4a     
            sty $4b            ; $d889: 84 4b     
            sty $4c            ; $d88b: 84 4c     
            sty $4c            ; $d88d: 84 4c     
            jmp __d8e3         ; $d88f: 4c e3 d8  

;-------------------------------------------------------------------------------
__d892:     lda #$00           ; $d892: a9 00     
            sta $71            ; $d894: 85 71     
            sta $7c            ; $d896: 85 7c     
            sta $7d            ; $d898: 85 7d     
            lda $74            ; $d89a: a5 74     
            sec                ; $d89c: 38        
            sbc #$0a           ; $d89d: e9 0a     
            bcc __d8a3         ; $d89f: 90 02     
            sta $74            ; $d8a1: 85 74     
__d8a3:     rts                ; $d8a3: 60        

;-------------------------------------------------------------------------------
__d8a4:     jsr __d95a         ; $d8a4: 20 5a d9  
            jsr __d892         ; $d8a7: 20 92 d8  
            ldy $70            ; $d8aa: a4 70     
            jmp __d8e5         ; $d8ac: 4c e5 d8  

;-------------------------------------------------------------------------------
__d8af:     jsr __d96b         ; $d8af: 20 6b d9  
            lda #$00           ; $d8b2: a9 00     
            sta $75            ; $d8b4: 85 75     
            sta $74            ; $d8b6: 85 74     
            sta $4a            ; $d8b8: 85 4a     
            sta $4b            ; $d8ba: 85 4b     
            sta $4c            ; $d8bc: 85 4c     
            sta $4c            ; $d8be: 85 4c     
            lda $5a            ; $d8c0: a5 5a     
            clc                ; $d8c2: 18        
            adc #$02           ; $d8c3: 69 02     
            cmp #$12           ; $d8c5: c9 12     
            bcc __d8cb         ; $d8c7: 90 02     
            lda #$00           ; $d8c9: a9 00     
__d8cb:     sta $5a            ; $d8cb: 85 5a     
            lda $5b            ; $d8cd: a5 5b     
            clc                ; $d8cf: 18        
            adc #$02           ; $d8d0: 69 02     
            cmp #$0e           ; $d8d2: c9 0e     
            bcc __d8d8         ; $d8d4: 90 02     
            lda #$00           ; $d8d6: a9 00     
__d8d8:     sta $5b            ; $d8d8: 85 5b     
            ldy $70            ; $d8da: a4 70     
            iny                ; $d8dc: c8        
            cpy #$0b           ; $d8dd: c0 0b     
            bcc __d8e3         ; $d8df: 90 02     
            ldy #$05           ; $d8e1: a0 05     
__d8e3:     sty $70            ; $d8e3: 84 70     
__d8e5:     lda #$00           ; $d8e5: a9 00     
            sta $71            ; $d8e7: 85 71     
            sta $73            ; $d8e9: 85 73     
            sta $72            ; $d8eb: 85 72     
            sta $048e          ; $d8ed: 8d 8e 04  
            sta $57            ; $d8f0: 85 57     
            sta $048f          ; $d8f2: 8d 8f 04  
            sta $7f            ; $d8f5: 85 7f     
            lda __db7f         ; $d8f7: ad 7f db  
            sta $7e            ; $d8fa: 85 7e     
            lda #$08           ; $d8fc: a9 08     
            sta $0749          ; $d8fe: 8d 49 07  
            lda __db12         ; $d901: ad 12 db  
            sta $0520          ; $d904: 8d 20 05  
            sta $0521          ; $d907: 8d 21 05  
            lda __db11         ; $d90a: ad 11 db  
            sta $0500          ; $d90d: 8d 00 05  
            sta $0501          ; $d910: 8d 01 05  
            ldx #$00           ; $d913: a2 00     
__d915:     lda __db14         ; $d915: ad 14 db  
            sta $0530,x        ; $d918: 9d 30 05  
            lda __db13         ; $d91b: ad 13 db  
            sta $0510,x        ; $d91e: 9d 10 05  
            lda __db20,y       ; $d921: b9 20 db  
            sta $0534,x        ; $d924: 9d 34 05  
            lda __db15,y       ; $d927: b9 15 db  
            sta $0514,x        ; $d92a: 9d 14 05  
            inx                ; $d92d: e8        
            cpx #$04           ; $d92e: e0 04     
            bne __d915         ; $d930: d0 e3     
            ldx #$00           ; $d932: a2 00     
__d934:     lda __db36,y       ; $d934: b9 36 db  
            sta $0522,x        ; $d937: 9d 22 05  
            lda __db2b,y       ; $d93a: b9 2b db  
            sta $0502,x        ; $d93d: 9d 02 05  
            inx                ; $d940: e8        
            cpx #$08           ; $d941: e0 08     
            bne __d934         ; $d943: d0 ef     
            lda __db6d         ; $d945: ad 6d db  
            sta $07e0          ; $d948: 8d e0 07  
            sta $07e1          ; $d94b: 8d e1 07  
            lda __db6e         ; $d94e: ad 6e db  
            sta $07e2          ; $d951: 8d e2 07  
            lda __db41,y       ; $d954: b9 41 db  
            sta $55            ; $d957: 85 55     
            rts                ; $d959: 60        

;-------------------------------------------------------------------------------
__d95a:     lda $50            ; $d95a: a5 50     
            bne __d96b         ; $d95c: d0 0d     
            lda $76            ; $d95e: a5 76     
            beq __d96b         ; $d960: f0 09     
            lda #$00           ; $d962: a9 00     
            sta $79            ; $d964: 85 79     
            lda #$01           ; $d966: a9 01     
            sta $78            ; $d968: 85 78     
            rts                ; $d96a: 60        

;-------------------------------------------------------------------------------
__d96b:     lda #$00           ; $d96b: a9 00     
            sta $76            ; $d96d: 85 76     
            sta $79            ; $d96f: 85 79     
            lda __db80         ; $d971: ad 80 db  
            sta $78            ; $d974: 85 78     
            rts                ; $d976: 60        

;-------------------------------------------------------------------------------
__d977:     ldy $70            ; $d977: a4 70     
            lda $72            ; $d979: a5 72     
            lsr                ; $d97b: 4a        
            lsr                ; $d97c: 4a        
            lsr                ; $d97d: 4a        
            ora __db4c,y       ; $d97e: 19 4c db  
            tax                ; $d981: aa        
            lda __db6f,x       ; $d982: bd 6f db  
            sta $07e3          ; $d985: 8d e3 07  
            jsr __dabf         ; $d988: 20 bf da  
            jsr __d9ac         ; $d98b: 20 ac d9  
            jsr __da12         ; $d98e: 20 12 da  
            jsr __da48         ; $d991: 20 48 da  
            jsr __da2f         ; $d994: 20 2f da  
            lda $72            ; $d997: a5 72     
            cmp #$18           ; $d999: c9 18     
            bcs __d9ab         ; $d99b: b0 0e     
            inc $73            ; $d99d: e6 73     
            lda $73            ; $d99f: a5 73     
            cmp #$96           ; $d9a1: c9 96     
            bcc __d9ab         ; $d9a3: 90 06     
            lda #$00           ; $d9a5: a9 00     
            sta $73            ; $d9a7: 85 73     
            inc $72            ; $d9a9: e6 72     
__d9ab:     rts                ; $d9ab: 60        

;-------------------------------------------------------------------------------
__d9ac:     inc $79            ; $d9ac: e6 79     
            lda $50            ; $d9ae: a5 50     
            bne __d9cb         ; $d9b0: d0 19     
            lda $79            ; $d9b2: a5 79     
            and #$3f           ; $d9b4: 29 3f     
            bne __d9ca         ; $d9b6: d0 12     
            dec $78            ; $d9b8: c6 78     
            bne __d9ca         ; $d9ba: d0 0e     
            ldx $76            ; $d9bc: a6 76     
            lda __db81,x       ; $d9be: bd 81 db  
            sta $78            ; $d9c1: 85 78     
            txa                ; $d9c3: 8a        
            eor #$01           ; $d9c4: 49 01     
            sta $76            ; $d9c6: 85 76     
            bne __d9ca         ; $d9c8: d0 00     
__d9ca:     rts                ; $d9ca: 60        

;-------------------------------------------------------------------------------
__d9cb:     lda $76            ; $d9cb: a5 76     
            bne __da11         ; $d9cd: d0 42     
            lda $79            ; $d9cf: a5 79     
            and #$3f           ; $d9d1: 29 3f     
            bne __da11         ; $d9d3: d0 3c     
            dec $78            ; $d9d5: c6 78     
            bne __da11         ; $d9d7: d0 38     
__d9d9:     lda #$01           ; $d9d9: a9 01     
            sta $76            ; $d9db: 85 76     
            ldx #$0e           ; $d9dd: a2 0e     
            lda #$02           ; $d9df: a9 02     
            sta $0480,x        ; $d9e1: 9d 80 04  
__d9e4:     jsr __c133         ; $d9e4: 20 33 c1  
            sta $91            ; $d9e7: 85 91     
            and #$07           ; $d9e9: 29 07     
            sta $90            ; $d9eb: 85 90     
            asl                ; $d9ed: 0a        
            adc $90            ; $d9ee: 65 90     
            asl                ; $d9f0: 0a        
            asl                ; $d9f1: 0a        
            asl                ; $d9f2: 0a        
            adc #$27           ; $d9f3: 69 27     
            sta $0400,x        ; $d9f5: 9d 00 04  
            lda $91            ; $d9f8: a5 91     
            lsr                ; $d9fa: 4a        
            lsr                ; $d9fb: 4a        
            lsr                ; $d9fc: 4a        
            lsr                ; $d9fd: 4a        
            cmp #$09           ; $d9fe: c9 09     
            bcc __da04         ; $da00: 90 02     
            sbc #$08           ; $da02: e9 08     
__da04:     sta $90            ; $da04: 85 90     
            asl                ; $da06: 0a        
            adc $90            ; $da07: 65 90     
            asl                ; $da09: 0a        
            asl                ; $da0a: 0a        
            asl                ; $da0b: 0a        
            adc #$20           ; $da0c: 69 20     
            sta $0440,x        ; $da0e: 9d 40 04  
__da11:     rts                ; $da11: 60        

;-------------------------------------------------------------------------------
__da12:     lda $71            ; $da12: a5 71     
            bne __da2e         ; $da14: d0 18     
            lda __db57,y       ; $da16: b9 57 db  
            cmp $53            ; $da19: c5 53     
            bcc __da2e         ; $da1b: 90 11     
__da1d:     lda #$01           ; $da1d: a9 01     
            sta $71            ; $da1f: 85 71     
            lda $40            ; $da21: a5 40     
            sta $060d          ; $da23: 8d 0d 06  
            sta $060e          ; $da26: 8d 0e 06  
            lda #$04           ; $da29: a9 04     
            sta $0749          ; $da2b: 8d 49 07  
__da2e:     rts                ; $da2e: 60        

;-------------------------------------------------------------------------------
__da2f:     lda $71            ; $da2f: a5 71     
            bne __da47         ; $da31: d0 14     
            lda $74            ; $da33: a5 74     
            cmp #$46           ; $da35: c9 46     
            bcs __da1d         ; $da37: b0 e4     
            inc $75            ; $da39: e6 75     
            lda $75            ; $da3b: a5 75     
            cmp #$3c           ; $da3d: c9 3c     
            bcc __da47         ; $da3f: 90 06     
            lda #$00           ; $da41: a9 00     
            sta $75            ; $da43: 85 75     
            inc $74            ; $da45: e6 74     
__da47:     rts                ; $da47: 60        

;-------------------------------------------------------------------------------
__da48:     lda $71            ; $da48: a5 71     
            bne __dabe         ; $da4a: d0 72     
            inc $7d            ; $da4c: e6 7d     
            lda $7d            ; $da4e: a5 7d     
            cmp #$3c           ; $da50: c9 3c     
            bcc __dabe         ; $da52: 90 6a     
            lda #$00           ; $da54: a9 00     
            sta $7d            ; $da56: 85 7d     
            inc $7c            ; $da58: e6 7c     
            lda $7c            ; $da5a: a5 7c     
            cmp #$0b           ; $da5c: c9 0b     
            bcc __dabe         ; $da5e: 90 5e     
            lda #$00           ; $da60: a9 00     
            sta $7c            ; $da62: 85 7c     
            ldx #$0a           ; $da64: a2 0a     
__da66:     lda $0480,x        ; $da66: bd 80 04  
            bne __dab9         ; $da69: d0 4e     
            sta $0420,x        ; $da6b: 9d 20 04  
            sta $0460,x        ; $da6e: 9d 60 04  
            jsr __c133         ; $da71: 20 33 c1  
            sta $90            ; $da74: 85 90     
            and #$07           ; $da76: 29 07     
            cmp #$05           ; $da78: c9 05     
            bcs __dabe         ; $da7a: b0 42     
            adc #$01           ; $da7c: 69 01     
            sta $05e0,x        ; $da7e: 9d e0 05  
            lda $90            ; $da81: a5 90     
            lsr                ; $da83: 4a        
            lsr                ; $da84: 4a        
            lsr                ; $da85: 4a        
            sta $90            ; $da86: 85 90     
            and #$03           ; $da88: 29 03     
            cmp #$03           ; $da8a: c9 03     
            bcs __dabe         ; $da8c: b0 30     
            sta $0580,x        ; $da8e: 9d 80 05  
            adc #$03           ; $da91: 69 03     
            sta $05a0,x        ; $da93: 9d a0 05  
            lda #$08           ; $da96: a9 08     
            sta $0480,x        ; $da98: 9d 80 04  
            lda #$2f           ; $da9b: a9 2f     
            sta $0540,x        ; $da9d: 9d 40 05  
            lda $90            ; $daa0: a5 90     
            lsr                ; $daa2: 4a        
            lsr                ; $daa3: 4a        
            and #$03           ; $daa4: 29 03     
            sta $04a0,x        ; $daa6: 9d a0 04  
            tay                ; $daa9: a8        
            lda __e562,y       ; $daaa: b9 62 e5  
            sta $0400,x        ; $daad: 9d 00 04  
            lda __e566,y       ; $dab0: b9 66 e5  
            sta $0440,x        ; $dab3: 9d 40 04  
            ldy $70            ; $dab6: a4 70     
            rts                ; $dab8: 60        

;-------------------------------------------------------------------------------
__dab9:     inx                ; $dab9: e8        
            cpx #$0a           ; $daba: e0 0a     
            bne __da66         ; $dabc: d0 a8     
__dabe:     rts                ; $dabe: 60        

;-------------------------------------------------------------------------------
__dabf:     lda $57            ; $dabf: a5 57     
            bne __db10         ; $dac1: d0 4d     
            inc $7f            ; $dac3: e6 7f     
            lda $7f            ; $dac5: a5 7f     
            cmp #$3c           ; $dac7: c9 3c     
            bcc __db10         ; $dac9: 90 45     
            lda #$00           ; $dacb: a9 00     
            sta $7f            ; $dacd: 85 7f     
            dec $7e            ; $dacf: c6 7e     
            bne __db10         ; $dad1: d0 3d     
            inc $57            ; $dad3: e6 57     
            lda #$00           ; $dad5: a9 00     
            sta $4a            ; $dad7: 85 4a     
            sta $4b            ; $dad9: 85 4b     
            lda #$02           ; $dadb: a9 02     
__dadd:     sta $048f          ; $dadd: 8d 8f 04  
            lda #$00           ; $dae0: a9 00     
            sta $04ef          ; $dae2: 8d ef 04  
            lda #$02           ; $dae5: a9 02     
            sta $04cf          ; $dae7: 8d cf 04  
__daea:     ldx #$0f           ; $daea: a2 0f     
            jsr __d9e4         ; $daec: 20 e4 d9  
            ldx #$00           ; $daef: a2 00     
__daf1:     lda $040f          ; $daf1: ad 0f 04  
            sbc $07a3,x        ; $daf4: fd a3 07  
            adc #$10           ; $daf7: 69 10     
            cmp #$21           ; $daf9: c9 21     
            bcs __db09         ; $dafb: b0 0c     
            lda $044f          ; $dafd: ad 4f 04  
            sbc $07a4,x        ; $db00: fd a4 07  
            adc #$10           ; $db03: 69 10     
            cmp #$21           ; $db05: c9 21     
            bcc __daea         ; $db07: 90 e1     
__db09:     inx                ; $db09: e8        
            inx                ; $db0a: e8        
            cpx $07a2          ; $db0b: ec a2 07  
            bne __daf1         ; $db0e: d0 e1     
__db10:     rts                ; $db10: 60        

;-------------------------------------------------------------------------------
__db11:     .hex 01            ; $db11: 01            Data
__db12:     .hex 00            ; $db12: 00            Data
__db13:     .hex 03            ; $db13: 03            Data
__db14:     .hex 00            ; $db14: 00            Data
__db15:     .hex 00 00 00 00   ; $db15: 00 00 00 00   Data
            .hex 00 01 01 00   ; $db19: 00 01 01 00   Data
            .hex 01 01 01      ; $db1d: 01 01 01      Data
__db20:     .hex c0 c0 c0 e0   ; $db20: c0 c0 c0 e0   Data
            .hex e0 00 00 e0   ; $db24: e0 00 00 e0   Data
            .hex 00 20 20      ; $db28: 00 20 20      Data
__db2b:     .hex 00 00 00 00   ; $db2b: 00 00 00 00   Data
            .hex 00 00 00 00   ; $db2f: 00 00 00 00   Data
            .hex 00 00 00      ; $db33: 00 00 00      Data
__db36:     .hex 70 70 80 80   ; $db36: 70 70 80 80   Data
            .hex 80 70 80 90   ; $db3a: 80 70 80 90   Data
            .hex a0 b0 c0      ; $db3e: a0 b0 c0      Data
__db41:     .hex 06 07 06 06   ; $db41: 06 07 06 06   Data
            .hex 07 07 06 07   ; $db45: 07 07 06 07   Data
            .hex 08 09 0a      ; $db49: 08 09 0a      Data
__db4c:     .hex 00 00 04 08   ; $db4c: 00 00 04 08   Data
            .hex 04 08 08 0c   ; $db50: 04 08 08 0c   Data
            .hex 04 08 0c      ; $db54: 04 08 0c      Data
__db57:     .hex 02 03 04 03   ; $db57: 02 03 04 03   Data
            .hex 04 04 05 04   ; $db5b: 04 04 05 04   Data
            .hex 05 06 07 00   ; $db5f: 05 06 07 00   Data
            .hex 00 01 00 00   ; $db63: 00 01 00 00   Data
            .hex 02 00 01 02   ; $db67: 02 00 01 02   Data
            .hex 02 02         ; $db6b: 02 02         Data
__db6d:     .hex 20            ; $db6d: 20            Data
__db6e:     .hex 3c            ; $db6e: 3c            Data
__db6f:     .hex e0 e0 a0 a0   ; $db6f: e0 e0 a0 a0   Data
            .hex a0 80 80 60   ; $db73: a0 80 80 60   Data
            .hex 80 60 60 40   ; $db77: 80 60 60 40   Data
            .hex 40 30 20 10   ; $db7b: 40 30 20 10   Data
__db7f:     .hex 1e            ; $db7f: 1e            Data
__db80:     .hex 28            ; $db80: 28            Data
__db81:     .hex 05 0f         ; $db81: 05 0f         Data
__db83:     .hex 95            ; $db83: 95            Data
__db84:     .hex db a2 db af   ; $db84: db a2 db af   Data
            .hex db b8 db c5   ; $db88: db b8 db c5   Data
            .hex db c8 db d5   ; $db8c: db c8 db d5   Data
            .hex db e2 db ef   ; $db90: db e2 db ef   Data
            .hex db 0c 4f 90   ; $db94: db 0c 4f 90   Data
            .hex 5f b0 6f 50   ; $db98: 5f b0 6f 50   Data
            .hex 7f b0 8f 50   ; $db9c: 7f b0 8f 50   Data
            .hex af 60 0c 3f   ; $dba0: af 60 0c 3f   Data
            .hex 80 6f 50 6f   ; $dba4: 80 6f 50 6f   Data
            .hex b0 af 30 af   ; $dba8: b0 af 30 af   Data
            .hex 80 af d0 08   ; $dbac: 80 af d0 08   Data
            .hex 4f 50 4f 70   ; $dbb0: 4f 50 4f 70   Data
            .hex af 80 af a0   ; $dbb4: af 80 af a0   Data
            .hex 0c 3f b0 4f   ; $dbb8: 0c 3f b0 4f   Data
            .hex d0 6f d0 8f   ; $dbbc: d0 6f d0 8f   Data
            .hex 30 af 30 bf   ; $dbc0: 30 af 30 bf   Data
            .hex 40 02 af 80   ; $dbc4: 40 02 af 80   Data
            .hex 0c 3f 30 6f   ; $dbc8: 0c 3f 30 6f   Data
            .hex 50 6f b0 8f   ; $dbcc: 50 6f b0 8f   Data
            .hex 50 8f b0 bf   ; $dbd0: 50 8f b0 bf   Data
            .hex d0 0c 3f 80   ; $dbd4: d0 0c 3f 80   Data
            .hex 6f 50 7f b0   ; $dbd8: 6f 50 7f b0   Data
            .hex 7f d0 8f 50   ; $dbdc: 7f d0 8f 50   Data
            .hex bf 80 0c 4f   ; $dbe0: bf 80 0c 4f   Data
            .hex 50 4f 60 4f   ; $dbe4: 50 4f 60 4f   Data
            .hex b0 9f 50 9f   ; $dbe8: b0 9f 50 9f   Data
            .hex 60 9f b0 0a   ; $dbec: 60 9f b0 0a   Data
            .hex 4f 40 4f 80   ; $dbf0: 4f 40 4f 80   Data
            .hex 4f d0 9f 60   ; $dbf4: 4f d0 9f 60   Data
            .hex 9f a0         ; $dbf8: 9f a0         Data
__dbfa:     .hex 0c            ; $dbfa: 0c            Data
__dbfb:     .hex dc 19 dc 26   ; $dbfb: dc 19 dc 26   Data
            .hex dc 33 dc 40   ; $dbff: dc 33 dc 40   Data
            .hex dc 4d dc 5a   ; $dc03: dc 4d dc 5a   Data
            .hex dc 67 dc 74   ; $dc07: dc 67 dc 74   Data
            .hex dc 00 00 00   ; $dc0b: dc 00 00 00   Data
            .hex 00 00 00 00   ; $dc0f: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dc13: 00 00 00 00   Data
            .hex 00 00 04 02   ; $dc17: 00 00 04 02   Data
            .hex 40 42 00 00   ; $dc1b: 40 42 00 00   Data
            .hex 00 00 04 44   ; $dc1f: 00 00 04 44   Data
            .hex 00 40 40 00   ; $dc23: 00 40 40 00   Data
            .hex 00 00 00 00   ; $dc27: 00 00 00 00   Data
            .hex 00 6c 00 00   ; $dc2b: 00 6c 00 00   Data
            .hex 00 00 00 00   ; $dc2f: 00 00 00 00   Data
            .hex 00 00 50 42   ; $dc33: 00 00 50 42   Data
            .hex 00 00 28 00   ; $dc37: 00 00 28 00   Data
            .hex 00 42 14 00   ; $dc3b: 00 42 14 00   Data
            .hex 00 00 00 00   ; $dc3f: 00 00 00 00   Data
            .hex 00 7c 00 00   ; $dc43: 00 7c 00 00   Data
            .hex 00 7c 00 00   ; $dc47: 00 7c 00 00   Data
            .hex 00 00 00 02   ; $dc4b: 00 00 00 02   Data
            .hex 04 02 00 02   ; $dc4f: 04 02 00 02   Data
            .hex 00 40 00 40   ; $dc53: 00 40 00 40   Data
            .hex 40 40 00 00   ; $dc57: 40 40 00 00   Data
            .hex 08 00 48 00   ; $dc5b: 08 00 48 00   Data
            .hex 42 00 42 00   ; $dc5f: 42 00 42 00   Data
            .hex 12 00 10 00   ; $dc63: 12 00 10 00   Data
            .hex 00 00 00 04   ; $dc67: 00 00 00 04   Data
            .hex 00 04 e0 04   ; $dc6b: 00 04 e0 04   Data
            .hex 00 04 00 00   ; $dc6f: 00 04 00 00   Data
            .hex 00 00 00 38   ; $dc73: 00 00 00 38   Data
            .hex 24 04 00 00   ; $dc77: 24 04 00 00   Data
            .hex 00 40 20 38   ; $dc7b: 00 40 20 38   Data
            .hex 00 00         ; $dc7f: 00 00         Data
__dc81:     .hex 8f            ; $dc81: 8f            Data
__dc82:     .hex dc a7 dc bf   ; $dc82: dc a7 dc bf   Data
            .hex dc d7 dc ef   ; $dc86: dc d7 dc ef   Data
            .hex dc 07 dd 1f   ; $dc8a: dc 07 dd 1f   Data
            .hex dd 00 00 00   ; $dc8e: dd 00 00 00   Data
            .hex 00 00 00 00   ; $dc92: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dc96: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dc9a: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dc9e: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dca2: 00 00 00 00   Data
            .hex 00 00 02 00   ; $dca6: 00 00 02 00   Data
            .hex 00 00 00 00   ; $dcaa: 00 00 00 00   Data
            .hex 00 02 00 00   ; $dcae: 00 02 00 00   Data
            .hex 00 00 02 00   ; $dcb2: 00 00 02 00   Data
            .hex 00 00 00 00   ; $dcb6: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dcba: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dcbe: 00 00 00 00   Data
            .hex 02 00 00 00   ; $dcc2: 02 00 00 00   Data
            .hex 00 00 02 02   ; $dcc6: 00 00 02 02   Data
            .hex 00 00 00 00   ; $dcca: 00 00 00 00   Data
            .hex 00 00 02 02   ; $dcce: 00 00 02 02   Data
            .hex 00 00 00 00   ; $dcd2: 00 00 00 00   Data
            .hex 00 02 02 02   ; $dcd6: 00 02 02 02   Data
            .hex 02 01 01 02   ; $dcda: 02 01 01 02   Data
            .hex 02 02 01 01   ; $dcde: 02 02 01 01   Data
            .hex 02 02 02 01   ; $dce2: 02 02 02 01   Data
            .hex 01 02 02 02   ; $dce6: 01 02 02 02   Data
            .hex 01 01 02 02   ; $dcea: 01 01 02 02   Data
            .hex 02 01 01 01   ; $dcee: 02 01 01 01   Data
            .hex 01 01 01 01   ; $dcf2: 01 01 01 01   Data
            .hex 01 01 01 01   ; $dcf6: 01 01 01 01   Data
            .hex 01 01 01 01   ; $dcfa: 01 01 01 01   Data
            .hex 01 01 01 01   ; $dcfe: 01 01 01 01   Data
            .hex 01 01 01 01   ; $dd02: 01 01 01 01   Data
            .hex 01 02 02 02   ; $dd06: 01 02 02 02   Data
            .hex 00 00 00 02   ; $dd0a: 00 00 00 02   Data
            .hex 02 02 00 00   ; $dd0e: 02 02 00 00   Data
            .hex 00 00 00 02   ; $dd12: 00 00 00 02   Data
            .hex 02 02 00 00   ; $dd16: 02 02 00 00   Data
            .hex 00 00 00 02   ; $dd1a: 00 00 00 02   Data
            .hex 02 00 00 00   ; $dd1e: 02 00 00 00   Data
            .hex 00 00 02 02   ; $dd22: 00 00 02 02   Data
            .hex 02 02 02 02   ; $dd26: 02 02 02 02   Data
            .hex 02 02 02 02   ; $dd2a: 02 02 02 02   Data
            .hex 02 02 02 02   ; $dd2e: 02 02 02 02   Data
            .hex 02 01 01 01   ; $dd32: 02 01 01 01   Data
            .hex 01            ; $dd36: 01            Data

;-------------------------------------------------------------------------------
__dd37:     lda $048f          ; $dd37: ad 8f 04  
            beq __dd4b         ; $dd3a: f0 0f     
            dec $04ef          ; $dd3c: ce ef 04  
            bne __dd4b         ; $dd3f: d0 0a     
            dec $04cf          ; $dd41: ce cf 04  
            bne __dd4b         ; $dd44: d0 05     
            lda #$00           ; $dd46: a9 00     
            sta $048f          ; $dd48: 8d 8f 04  
__dd4b:     rts                ; $dd4b: 60        

;-------------------------------------------------------------------------------
__dd4c:     lda $48            ; $dd4c: a5 48     
            beq __dd55         ; $dd4e: f0 05     
            ldx #$00           ; $dd50: a2 00     
            jsr __dd7d         ; $dd52: 20 7d dd  
__dd55:     lda $bd            ; $dd55: a5 bd     
            beq __dd5d         ; $dd57: f0 04     
            lda $49            ; $dd59: a5 49     
            bne __dd7b         ; $dd5b: d0 1e     
__dd5d:     rts                ; $dd5d: 60        

;-------------------------------------------------------------------------------
__dd5e:     txa                ; $dd5e: 8a        
            bne __dd74         ; $dd5f: d0 13     
__dd61:     lda $44            ; $dd61: a5 44     
            beq __ddb4         ; $dd63: f0 4f     
            jsr __d13e         ; $dd65: 20 3e d1  
            ldx #$00           ; $dd68: a2 00     
            jmp __dd7d         ; $dd6a: 4c 7d dd  

;-------------------------------------------------------------------------------
__dd6d:     jsr __dd61         ; $dd6d: 20 61 dd  
            lda $bd            ; $dd70: a5 bd     
            beq __ddb4         ; $dd72: f0 40     
__dd74:     lda $45            ; $dd74: a5 45     
            beq __ddb4         ; $dd76: f0 3c     
            jsr __d14c         ; $dd78: 20 4c d1  
__dd7b:     ldx #$01           ; $dd7b: a2 01     
__dd7d:     lda #$00           ; $dd7d: a9 00     
            sta $0420,x        ; $dd7f: 9d 20 04  
            sta $0460,x        ; $dd82: 9d 60 04  
            sta $04c0,x        ; $dd85: 9d c0 04  
            sta $04e0,x        ; $dd88: 9d e0 04  
            sta $7a,x          ; $dd8b: 95 7a     
            ldy $50            ; $dd8d: a4 50     
            lda __ddb9,y       ; $dd8f: b9 b9 dd  
            sta $0400,x        ; $dd92: 9d 00 04  
            lda __ddb5,x       ; $dd95: bd b5 dd  
            sta $0440,x        ; $dd98: 9d 40 04  
            lda __ddb7,x       ; $dd9b: bd b7 dd  
            sta $04a0,x        ; $dd9e: 9d a0 04  
            ora #$80           ; $dda1: 09 80     
            sta $05c0,x        ; $dda3: 9d c0 05  
            txa                ; $dda6: 8a        
            sta $0560,x        ; $dda7: 9d 60 05  
            lda #$78           ; $ddaa: a9 78     
            sta $0540,x        ; $ddac: 9d 40 05  
            lda #$06           ; $ddaf: a9 06     
            sta $0480,x        ; $ddb1: 9d 80 04  
__ddb4:     rts                ; $ddb4: 60        

;-------------------------------------------------------------------------------
__ddb5:     .hex 78 88         ; $ddb5: 78 88         Data
__ddb7:     .hex 02 00         ; $ddb7: 02 00         Data
__ddb9:     .hex 5f 6f         ; $ddb9: 5f 6f         Data

;-------------------------------------------------------------------------------
__ddbb:     ldx #$00           ; $ddbb: a2 00     
            jsr __ddc1         ; $ddbd: 20 c1 dd  
            inx                ; $ddc0: e8        
__ddc1:     ldy $0480,x        ; $ddc1: bc 80 04  
            lda __ddd1,y       ; $ddc4: b9 d1 dd  
            sta $90            ; $ddc7: 85 90     
            lda __ddd2,y       ; $ddc9: b9 d2 dd  
            sta $91            ; $ddcc: 85 91     
            jmp ($0090)        ; $ddce: 6c 90 00  

;-------------------------------------------------------------------------------
__ddd1:     .hex 78            ; $ddd1: 78            Data
__ddd2:     .hex c4 f8 dd b7   ; $ddd2: c4 f8 dd b7   Data
            .hex e1 d9 dd      ; $ddd6: e1 d9 dd      Data

;-------------------------------------------------------------------------------
            jsr __ddf8         ; $ddd9: 20 f8 dd  
            lda $0540,x        ; $dddc: bd 40 05  
            beq __dde6         ; $dddf: f0 05     
            dec $0540,x        ; $dde1: de 40 05  
            bne __ddf7         ; $dde4: d0 11     
__dde6:     lda $05c0,x        ; $dde6: bd c0 05  
            bpl __ddf2         ; $dde9: 10 07     
            lda $07c0,x        ; $ddeb: bd c0 07  
            ora $64,x          ; $ddee: 15 64     
            beq __ddf7         ; $ddf0: f0 05     
__ddf2:     lda #$02           ; $ddf2: a9 02     
            sta $0480,x        ; $ddf4: 9d 80 04  
__ddf7:     rts                ; $ddf7: 60        

;-------------------------------------------------------------------------------
__ddf8:     jsr __debb         ; $ddf8: 20 bb de  
            jsr __de64         ; $ddfb: 20 64 de  
            ldy #$0f           ; $ddfe: a0 0f     
            lda $0480,y        ; $de00: b9 80 04  
            beq __de3a         ; $de03: f0 35     
            lda $0400,y        ; $de05: b9 00 04  
            sec                ; $de08: 38        
            sbc $0400,x        ; $de09: fd 00 04  
            clc                ; $de0c: 18        
            adc #$08           ; $de0d: 69 08     
            cmp #$11           ; $de0f: c9 11     
            bcs __de3a         ; $de11: b0 27     
            lda $0440,y        ; $de13: b9 40 04  
            sec                ; $de16: 38        
            sbc $0440,x        ; $de17: fd 40 04  
            clc                ; $de1a: 18        
            adc #$08           ; $de1b: 69 08     
            cmp #$11           ; $de1d: c9 11     
            bcs __de3a         ; $de1f: b0 19     
            lda #$01           ; $de21: a9 01     
            sta $4c,x          ; $de23: 95 4c     
            lda $40            ; $de25: a5 40     
            sta $0618          ; $de27: 8d 18 06  
            lda $bd            ; $de2a: a5 bd     
            beq __de3b         ; $de2c: f0 0d     
            lda $0480,y        ; $de2e: b9 80 04  
            cmp #$02           ; $de31: c9 02     
            beq __de41         ; $de33: f0 0c     
            lda #$00           ; $de35: a9 00     
            sta $0480,y        ; $de37: 99 80 04  
__de3a:     rts                ; $de3a: 60        

;-------------------------------------------------------------------------------
__de3b:     sta $0480,y        ; $de3b: 99 80 04  
            jmp __de4a         ; $de3e: 4c 4a de  

;-------------------------------------------------------------------------------
__de41:     stx $9f            ; $de41: 86 9f     
            lda #$04           ; $de43: a9 04     
            jsr __dadd         ; $de45: 20 dd da  
            ldx $9f            ; $de48: a6 9f     
__de4a:     lda $50            ; $de4a: a5 50     
            beq __de56         ; $de4c: f0 08     
            stx $9f            ; $de4e: 86 9f     
            jsr __d9d9         ; $de50: 20 d9 d9  
            ldx $9f            ; $de53: a6 9f     
            rts                ; $de55: 60        

;-------------------------------------------------------------------------------
__de56:     lda #$01           ; $de56: a9 01     
            sta $76            ; $de58: 85 76     
            lda __db81         ; $de5a: ad 81 db  
            sta $78            ; $de5d: 85 78     
            lda #$00           ; $de5f: a9 00     
            sta $79            ; $de61: 85 79     
            rts                ; $de63: 60        

;-------------------------------------------------------------------------------
__de64:     lda $50            ; $de64: a5 50     
            bne __deab         ; $de66: d0 43     
            txa                ; $de68: 8a        
            eor #$01           ; $de69: 49 01     
            ora #$10           ; $de6b: 09 10     
            tay                ; $de6d: a8        
            jsr __de73         ; $de6e: 20 73 de  
            iny                ; $de71: c8        
            iny                ; $de72: c8        
__de73:     lda $0480,y        ; $de73: b9 80 04  
            beq __deab         ; $de76: f0 33     
            lda $0400,y        ; $de78: b9 00 04  
            sec                ; $de7b: 38        
            sbc $0400,x        ; $de7c: fd 00 04  
            clc                ; $de7f: 18        
            adc #$04           ; $de80: 69 04     
            cmp #$11           ; $de82: c9 11     
            bcs __deab         ; $de84: b0 25     
            lda $0440,y        ; $de86: b9 40 04  
            sec                ; $de89: 38        
            sbc $0440,x        ; $de8a: fd 40 04  
            clc                ; $de8d: 18        
            adc #$04           ; $de8e: 69 04     
            cmp #$11           ; $de90: c9 11     
            bcs __deab         ; $de92: b0 17     
            lda #$00           ; $de94: a9 00     
            sta $0480,y        ; $de96: 99 80 04  
            lda #$01           ; $de99: a9 01     
            cmp $7a,x          ; $de9b: d5 7a     
            beq __deab         ; $de9d: f0 0c     
            sta $7a,x          ; $de9f: 95 7a     
            lda #$02           ; $dea1: a9 02     
            sta $0480,x        ; $dea3: 9d 80 04  
            lda #$40           ; $dea6: a9 40     
            sta $0540,x        ; $dea8: 9d 40 05  
__deab:     rts                ; $deab: 60        

;-------------------------------------------------------------------------------
__deac:     dec $0540,x        ; $deac: de 40 05  
            bne __deba         ; $deaf: d0 09     
            lda #$00           ; $deb1: a9 00     
            sta $7a,x          ; $deb3: 95 7a     
            lda #$02           ; $deb5: a9 02     
            sta $0480,x        ; $deb7: 9d 80 04  
__deba:     rts                ; $deba: 60        

;-------------------------------------------------------------------------------
__debb:     lda $7a,x          ; $debb: b5 7a     
            bne __deac         ; $debd: d0 ed     
            jsr __e1d9         ; $debf: 20 d9 e1  
            lda $50            ; $dec2: a5 50     
            bne __dee5         ; $dec4: d0 1f     
            lda $05c0,x        ; $dec6: bd c0 05  
            bmi __dee4         ; $dec9: 30 19     
            ldy #$00           ; $decb: a0 00     
            jsr __c201         ; $decd: 20 01 c2  
            lda $92            ; $ded0: a5 92     
            bpl __dee1         ; $ded2: 10 0d     
            lda $04a0,x        ; $ded4: bd a0 04  
            cmp $05c0,x        ; $ded7: dd c0 05  
            beq __dee4         ; $deda: f0 08     
            ldy #$00           ; $dedc: a0 00     
            jmp __c201         ; $dede: 4c 01 c2  

;-------------------------------------------------------------------------------
__dee1:     sta $04a0,x        ; $dee1: 9d a0 04  
__dee4:     rts                ; $dee4: 60        

;-------------------------------------------------------------------------------
__dee5:     lda $05c0,x        ; $dee5: bd c0 05  
            bmi __dee4         ; $dee8: 30 fa     
            eor $04a0,x        ; $deea: 5d a0 04  
            eor #$02           ; $deed: 49 02     
            bne __def7         ; $deef: d0 06     
            lda $05c0,x        ; $def1: bd c0 05  
            sta $04a0,x        ; $def4: 9d a0 04  
__def7:     lda $05c0,x        ; $def7: bd c0 05  
            asl                ; $defa: 0a        
            asl                ; $defb: 0a        
            ora $04a0,x        ; $defc: 1d a0 04  
            asl                ; $deff: 0a        
            tay                ; $df00: a8        
            lda __df16,y       ; $df01: b9 16 df  
            sta $94            ; $df04: 85 94     
            lda __df17,y       ; $df06: b9 17 df  
            sta $95            ; $df09: 85 95     
            lda $04a0,x        ; $df0b: bd a0 04  
            ldy #$00           ; $df0e: a0 00     
            jsr __c201         ; $df10: 20 01 c2  
            jmp ($0094)        ; $df13: 6c 94 00  

;-------------------------------------------------------------------------------
__df16:     .hex 36            ; $df16: 36            Data
__df17:     .hex df f0 df 78   ; $df17: df f0 df 78   Data
            .hex c4 aa e0 63   ; $df1b: c4 aa e0 63   Data
            .hex df a3 df 5d   ; $df1f: df a3 df 5d   Data
            .hex e0 78 c4 78   ; $df23: e0 78 c4 78   Data
            .hex c4 d0 df 10   ; $df27: c4 d0 df 10   Data
            .hex e0 ca e0 83   ; $df2b: e0 ca e0 83   Data
            .hex df 78 c4 3d   ; $df2f: df 78 c4 3d   Data
            .hex e0 7d e0      ; $df33: e0 7d e0      Data

;-------------------------------------------------------------------------------
            jsr __e0ea         ; $df36: 20 ea e0  
            lda $96            ; $df39: a5 96     
            cmp #$04           ; $df3b: c9 04     
            bcs __df62         ; $df3d: b0 23     
__df3f:     ldy $95            ; $df3f: a4 95     
            lda $077e,y        ; $df41: b9 7e 07  
            ldy $94            ; $df44: a4 94     
            and __d1f6,y       ; $df46: 39 f6 d1  
            beq __df62         ; $df49: f0 17     
            lda $92            ; $df4b: a5 92     
            ora #$80           ; $df4d: 09 80     
            sta $92            ; $df4f: 85 92     
__df51:     lda $0460,x        ; $df51: bd 60 04  
            sec                ; $df54: 38        
            sbc $97            ; $df55: e5 97     
            sta $0460,x        ; $df57: 9d 60 04  
            lda $0440,x        ; $df5a: bd 40 04  
            sbc $96            ; $df5d: e5 96     
            sta $0440,x        ; $df5f: 9d 40 04  
__df62:     rts                ; $df62: 60        

;-------------------------------------------------------------------------------
            jsr __e0ea         ; $df63: 20 ea e0  
            lda $96            ; $df66: a5 96     
            cmp #$04           ; $df68: c9 04     
            bcs __df62         ; $df6a: b0 f6     
            ldy $95            ; $df6c: a4 95     
            lda $077f,y        ; $df6e: b9 7f 07  
            ldy $94            ; $df71: a4 94     
            and __d1f6,y       ; $df73: 39 f6 d1  
            bne __df3f         ; $df76: d0 c7     
            lda #$01           ; $df78: a9 01     
            sta $04a0,x        ; $df7a: 9d a0 04  
            jsr __df51         ; $df7d: 20 51 df  
            jmp __e098         ; $df80: 4c 98 e0  

;-------------------------------------------------------------------------------
            jsr __e0ea         ; $df83: 20 ea e0  
            lda $96            ; $df86: a5 96     
            cmp #$04           ; $df88: c9 04     
            bcs __df62         ; $df8a: b0 d6     
            ldy $95            ; $df8c: a4 95     
            lda $0781,y        ; $df8e: b9 81 07  
            ldy $94            ; $df91: a4 94     
            and __d1f6,y       ; $df93: 39 f6 d1  
            bne __df3f         ; $df96: d0 a7     
            lda #$03           ; $df98: a9 03     
            sta $04a0,x        ; $df9a: 9d a0 04  
            jsr __df51         ; $df9d: 20 51 df  
            jmp __dfbe         ; $dfa0: 4c be df  

;-------------------------------------------------------------------------------
            jsr __e0fe         ; $dfa3: 20 fe e0  
            lda $96            ; $dfa6: a5 96     
            cmp #$04           ; $dfa8: c9 04     
            bcs __dfcf         ; $dfaa: b0 23     
__dfac:     ldy $95            ; $dfac: a4 95     
            lda $077f,y        ; $dfae: b9 7f 07  
            ldy $94            ; $dfb1: a4 94     
            and __d1f6,y       ; $dfb3: 39 f6 d1  
            beq __dfcf         ; $dfb6: f0 17     
            lda $92            ; $dfb8: a5 92     
            ora #$80           ; $dfba: 09 80     
            sta $92            ; $dfbc: 85 92     
__dfbe:     lda $0420,x        ; $dfbe: bd 20 04  
            sec                ; $dfc1: 38        
            sbc $97            ; $dfc2: e5 97     
            sta $0420,x        ; $dfc4: 9d 20 04  
            lda $0400,x        ; $dfc7: bd 00 04  
            sbc $96            ; $dfca: e5 96     
            sta $0400,x        ; $dfcc: 9d 00 04  
__dfcf:     rts                ; $dfcf: 60        

;-------------------------------------------------------------------------------
            jsr __e0fe         ; $dfd0: 20 fe e0  
            lda $96            ; $dfd3: a5 96     
            cmp #$04           ; $dfd5: c9 04     
            bcs __dfcf         ; $dfd7: b0 f6     
            ldy $95            ; $dfd9: a4 95     
            lda $0780,y        ; $dfdb: b9 80 07  
            ldy $94            ; $dfde: a4 94     
            and __d1f6,y       ; $dfe0: 39 f6 d1  
            bne __dfac         ; $dfe3: d0 c7     
            lda #$02           ; $dfe5: a9 02     
            sta $04a0,x        ; $dfe7: 9d a0 04  
            jsr __dfbe         ; $dfea: 20 be df  
            jmp __df51         ; $dfed: 4c 51 df  

;-------------------------------------------------------------------------------
            jsr __e0fe         ; $dff0: 20 fe e0  
            lda $96            ; $dff3: a5 96     
            cmp #$04           ; $dff5: c9 04     
            bcs __dfcf         ; $dff7: b0 d6     
            ldy $95            ; $dff9: a4 95     
            lda $077e,y        ; $dffb: b9 7e 07  
            ldy $94            ; $dffe: a4 94     
            and __d1f6,y       ; $e000: 39 f6 d1  
            bne __dfac         ; $e003: d0 a7     
            lda #$00           ; $e005: a9 00     
            sta $04a0,x        ; $e007: 9d a0 04  
            jsr __dfbe         ; $e00a: 20 be df  
            jmp __e02b         ; $e00d: 4c 2b e0  

;-------------------------------------------------------------------------------
            jsr __e112         ; $e010: 20 12 e1  
            lda $96            ; $e013: a5 96     
            cmp #$04           ; $e015: c9 04     
            bcs __e03c         ; $e017: b0 23     
__e019:     ldy $95            ; $e019: a4 95     
            lda $0780,y        ; $e01b: b9 80 07  
            ldy $94            ; $e01e: a4 94     
            and __d1f6,y       ; $e020: 39 f6 d1  
            beq __e03c         ; $e023: f0 17     
            lda $92            ; $e025: a5 92     
            ora #$80           ; $e027: 09 80     
            sta $92            ; $e029: 85 92     
__e02b:     lda $0460,x        ; $e02b: bd 60 04  
            clc                ; $e02e: 18        
            adc $97            ; $e02f: 65 97     
            sta $0460,x        ; $e031: 9d 60 04  
            lda $0440,x        ; $e034: bd 40 04  
            adc $96            ; $e037: 65 96     
            sta $0440,x        ; $e039: 9d 40 04  
__e03c:     rts                ; $e03c: 60        

;-------------------------------------------------------------------------------
            jsr __e112         ; $e03d: 20 12 e1  
            lda $96            ; $e040: a5 96     
            cmp #$04           ; $e042: c9 04     
            bcs __e03c         ; $e044: b0 f6     
            ldy $95            ; $e046: a4 95     
            lda $0781,y        ; $e048: b9 81 07  
            ldy $94            ; $e04b: a4 94     
            and __d1f6,y       ; $e04d: 39 f6 d1  
            bne __e019         ; $e050: d0 c7     
            lda #$03           ; $e052: a9 03     
            sta $04a0,x        ; $e054: 9d a0 04  
            jsr __e02b         ; $e057: 20 2b e0  
            jmp __dfbe         ; $e05a: 4c be df  

;-------------------------------------------------------------------------------
            jsr __e112         ; $e05d: 20 12 e1  
            lda $96            ; $e060: a5 96     
            cmp #$04           ; $e062: c9 04     
            bcs __e03c         ; $e064: b0 d6     
            ldy $95            ; $e066: a4 95     
            lda $077f,y        ; $e068: b9 7f 07  
            ldy $94            ; $e06b: a4 94     
            and __d1f6,y       ; $e06d: 39 f6 d1  
            bne __e019         ; $e070: d0 a7     
            lda #$01           ; $e072: a9 01     
            sta $04a0,x        ; $e074: 9d a0 04  
            jsr __e02b         ; $e077: 20 2b e0  
            jmp __e098         ; $e07a: 4c 98 e0  

;-------------------------------------------------------------------------------
            jsr __e14d         ; $e07d: 20 4d e1  
            lda $96            ; $e080: a5 96     
            cmp #$04           ; $e082: c9 04     
            bcs __e0a9         ; $e084: b0 23     
__e086:     ldy $95            ; $e086: a4 95     
            lda $0781,y        ; $e088: b9 81 07  
            ldy $94            ; $e08b: a4 94     
            and __d1f6,y       ; $e08d: 39 f6 d1  
            beq __e0a9         ; $e090: f0 17     
            lda $92            ; $e092: a5 92     
            ora #$80           ; $e094: 09 80     
            sta $92            ; $e096: 85 92     
__e098:     lda $0420,x        ; $e098: bd 20 04  
            clc                ; $e09b: 18        
            adc $97            ; $e09c: 65 97     
            sta $0420,x        ; $e09e: 9d 20 04  
            lda $0400,x        ; $e0a1: bd 00 04  
            adc $96            ; $e0a4: 65 96     
            sta $0400,x        ; $e0a6: 9d 00 04  
__e0a9:     rts                ; $e0a9: 60        

;-------------------------------------------------------------------------------
            jsr __e14d         ; $e0aa: 20 4d e1  
            lda $96            ; $e0ad: a5 96     
            cmp #$04           ; $e0af: c9 04     
            bcs __e0a9         ; $e0b1: b0 f6     
            ldy $95            ; $e0b3: a4 95     
            lda $077e,y        ; $e0b5: b9 7e 07  
            ldy $94            ; $e0b8: a4 94     
            and __d1f6,y       ; $e0ba: 39 f6 d1  
            bne __e086         ; $e0bd: d0 c7     
            lda #$00           ; $e0bf: a9 00     
            sta $04a0,x        ; $e0c1: 9d a0 04  
            jsr __e098         ; $e0c4: 20 98 e0  
            jmp __e02b         ; $e0c7: 4c 2b e0  

;-------------------------------------------------------------------------------
            jsr __e14d         ; $e0ca: 20 4d e1  
            lda $96            ; $e0cd: a5 96     
            cmp #$04           ; $e0cf: c9 04     
            bcs __e0a9         ; $e0d1: b0 d6     
            ldy $95            ; $e0d3: a4 95     
            lda $0780,y        ; $e0d5: b9 80 07  
            ldy $94            ; $e0d8: a4 94     
            and __d1f6,y       ; $e0da: 39 f6 d1  
            bne __e086         ; $e0dd: d0 a7     
            lda #$02           ; $e0df: a9 02     
            sta $04a0,x        ; $e0e1: 9d a0 04  
            jsr __e098         ; $e0e4: 20 98 e0  
            jmp __e02b         ; $e0e7: 4c 2b e0  

;-------------------------------------------------------------------------------
__e0ea:     jsr __e170         ; $e0ea: 20 70 e1  
            lda $91            ; $e0ed: a5 91     
            and #$07           ; $e0ef: 29 07     
            ora __e186,y       ; $e0f1: 19 86 e1  
            sta $96            ; $e0f4: 85 96     
            lda $0460,x        ; $e0f6: bd 60 04  
            sta $97            ; $e0f9: 85 97     
            jmp __e13a         ; $e0fb: 4c 3a e1  

;-------------------------------------------------------------------------------
__e0fe:     jsr __e13a         ; $e0fe: 20 3a e1  
            lda $90            ; $e101: a5 90     
            and #$07           ; $e103: 29 07     
            ora __e186,y       ; $e105: 19 86 e1  
            sta $96            ; $e108: 85 96     
            lda $0420,x        ; $e10a: bd 20 04  
            sta $97            ; $e10d: 85 97     
            jmp __e170         ; $e10f: 4c 70 e1  

;-------------------------------------------------------------------------------
__e112:     jsr __e170         ; $e112: 20 70 e1  
            lda $91            ; $e115: a5 91     
            and #$07           ; $e117: 29 07     
            ora __e186,y       ; $e119: 19 86 e1  
            sta $96            ; $e11c: 85 96     
            ora $0460,x        ; $e11e: 1d 60 04  
            sta $97            ; $e121: 85 97     
            beq __e13a         ; $e123: f0 15     
            lda $95            ; $e125: a5 95     
            clc                ; $e127: 18        
            adc #$04           ; $e128: 69 04     
            sta $95            ; $e12a: 85 95     
            lda #$00           ; $e12c: a9 00     
            sec                ; $e12e: 38        
            sbc $0460,x        ; $e12f: fd 60 04  
            sta $97            ; $e132: 85 97     
            lda #$18           ; $e134: a9 18     
            sbc $96            ; $e136: e5 96     
            sta $96            ; $e138: 85 96     
__e13a:     lda $0400,x        ; $e13a: bd 00 04  
            sec                ; $e13d: 38        
            sbc #$27           ; $e13e: e9 27     
            sta $90            ; $e140: 85 90     
            and #$f8           ; $e142: 29 f8     
            lsr                ; $e144: 4a        
            lsr                ; $e145: 4a        
            tay                ; $e146: a8        
            lda __e185,y       ; $e147: b9 85 e1  
            sta $94            ; $e14a: 85 94     
            rts                ; $e14c: 60        

;-------------------------------------------------------------------------------
__e14d:     jsr __e13a         ; $e14d: 20 3a e1  
            lda $90            ; $e150: a5 90     
            and #$07           ; $e152: 29 07     
            ora __e186,y       ; $e154: 19 86 e1  
            sta $96            ; $e157: 85 96     
            ora $0420,x        ; $e159: 1d 20 04  
            sta $97            ; $e15c: 85 97     
            beq __e170         ; $e15e: f0 10     
            inc $94            ; $e160: e6 94     
            lda #$00           ; $e162: a9 00     
            sec                ; $e164: 38        
            sbc $0420,x        ; $e165: fd 20 04  
            sta $97            ; $e168: 85 97     
            lda #$18           ; $e16a: a9 18     
            sbc $96            ; $e16c: e5 96     
            sta $96            ; $e16e: 85 96     
__e170:     lda $0440,x        ; $e170: bd 40 04  
            sec                ; $e173: 38        
            sbc #$20           ; $e174: e9 20     
            sta $91            ; $e176: 85 91     
            and #$f8           ; $e178: 29 f8     
            lsr                ; $e17a: 4a        
            lsr                ; $e17b: 4a        
            tay                ; $e17c: a8        
            lda __e185,y       ; $e17d: b9 85 e1  
            asl                ; $e180: 0a        
            asl                ; $e181: 0a        
            sta $95            ; $e182: 85 95     
            rts                ; $e184: 60        

;-------------------------------------------------------------------------------
__e185:     .hex 00            ; $e185: 00            Data
__e186:     .hex 00 00 08 00   ; $e186: 00 00 08 00   Data
            .hex 10 01 00 01   ; $e18a: 10 01 00 01   Data
            .hex 08 01 10 02   ; $e18e: 08 01 10 02   Data
            .hex 00 02 08 02   ; $e192: 00 02 08 02   Data
            .hex 10 03 00 03   ; $e196: 10 03 00 03   Data
            .hex 08 03 10 04   ; $e19a: 08 03 10 04   Data
            .hex 00 04 08 04   ; $e19e: 00 04 08 04   Data
            .hex 10 05 00 05   ; $e1a2: 10 05 00 05   Data
            .hex 08 05 10 06   ; $e1a6: 08 05 10 06   Data
            .hex 00 06 08 06   ; $e1aa: 00 06 08 06   Data
            .hex 10 07 00 07   ; $e1ae: 10 07 00 07   Data
            .hex 08 07 10 08   ; $e1b2: 08 07 10 08   Data
            .hex 00            ; $e1b6: 00            Data

;-------------------------------------------------------------------------------
            inc $0540,x        ; $e1b7: fe 40 05  
            lda $0540,x        ; $e1ba: bd 40 05  
            cmp #$40           ; $e1bd: c9 40     
            bcc __e1d8         ; $e1bf: 90 17     
            lda #$00           ; $e1c1: a9 00     
            sta $0480,x        ; $e1c3: 9d 80 04  
            jsr __d892         ; $e1c6: 20 92 d8  
            jsr __dd5e         ; $e1c9: 20 5e dd  
            dec $48,x          ; $e1cc: d6 48     
            bne __e1d8         ; $e1ce: d0 08     
            lda $bd            ; $e1d0: a5 bd     
            beq __e1d8         ; $e1d2: f0 04     
            lda #$78           ; $e1d4: a9 78     
            sta $42,x          ; $e1d6: 95 42     
__e1d8:     rts                ; $e1d8: 60        

;-------------------------------------------------------------------------------
__e1d9:     lda $40            ; $e1d9: a5 40     
            beq __e1e3         ; $e1db: f0 06     
            lda $18,x          ; $e1dd: b5 18     
            sta $05c0,x        ; $e1df: 9d c0 05  
            rts                ; $e1e2: 60        

;-------------------------------------------------------------------------------
__e1e3:     lda $4f            ; $e1e3: a5 4f     
            bne __e201         ; $e1e5: d0 1a     
            lda $69            ; $e1e7: a5 69     
            bne __e1fe         ; $e1e9: d0 13     
            ldy $68            ; $e1eb: a4 68     
            lda __ff00,y       ; $e1ed: b9 00 ff  
            sta $05c0          ; $e1f0: 8d c0 05  
            iny                ; $e1f3: c8        
            lda __ff00,y       ; $e1f4: b9 00 ff  
            beq __e200         ; $e1f7: f0 07     
            sta $69            ; $e1f9: 85 69     
            iny                ; $e1fb: c8        
            sty $68            ; $e1fc: 84 68     
__e1fe:     dec $69            ; $e1fe: c6 69     
__e200:     rts                ; $e200: 60        

;-------------------------------------------------------------------------------
__e201:     inc $69            ; $e201: e6 69     
            lda $05c0          ; $e203: ad c0 05  
            cmp $18            ; $e206: c5 18     
            beq __e225         ; $e208: f0 1b     
            ldy $68            ; $e20a: a4 68     
            sta __ff00,y       ; $e20c: 99 00 ff  
            iny                ; $e20f: c8        
            lda $69            ; $e210: a5 69     
            sta __ff00,y       ; $e212: 99 00 ff  
            iny                ; $e215: c8        
            sty $68            ; $e216: 84 68     
            lda $18            ; $e218: a5 18     
            sta $05c0          ; $e21a: 8d c0 05  
            lda #$00           ; $e21d: a9 00     
            sta $69            ; $e21f: 85 69     
            iny                ; $e221: c8        
            sta __ff00,y       ; $e222: 99 00 ff  
__e225:     rts                ; $e225: 60        

;-------------------------------------------------------------------------------
__e226:     lda #$00           ; $e226: a9 00     
            sta $07c0          ; $e228: 8d c0 07  
            sta $07c1          ; $e22b: 8d c1 07  
            ldx #$10           ; $e22e: a2 10     
__e230:     sta $04c0,x        ; $e230: 9d c0 04  
            sta $04e0,x        ; $e233: 9d e0 04  
            sta $0480,x        ; $e236: 9d 80 04  
            sta $0580,x        ; $e239: 9d 80 05  
            inx                ; $e23c: e8        
            cpx #$14           ; $e23d: e0 14     
            bne __e230         ; $e23f: d0 ef     
            rts                ; $e241: 60        

;-------------------------------------------------------------------------------
__e242:     ldx #$00           ; $e242: a2 00     
            jsr __e378         ; $e244: 20 78 e3  
            lda $bd            ; $e247: a5 bd     
            beq __e24f         ; $e249: f0 04     
            inx                ; $e24b: e8        
            jsr __e378         ; $e24c: 20 78 e3  
__e24f:     ldx #$10           ; $e24f: a2 10     
            ldy #$00           ; $e251: a0 00     
            jsr __e265         ; $e253: 20 65 e2  
            inx                ; $e256: e8        
            ldy #$01           ; $e257: a0 01     
            jsr __e265         ; $e259: 20 65 e2  
            inx                ; $e25c: e8        
            ldy #$00           ; $e25d: a0 00     
            jsr __e265         ; $e25f: 20 65 e2  
            inx                ; $e262: e8        
            ldy #$01           ; $e263: a0 01     
__e265:     sty $94            ; $e265: 84 94     
            ldy $0480,x        ; $e267: bc 80 04  
            lda __e279,y       ; $e26a: b9 79 e2  
            sta $90            ; $e26d: 85 90     
            lda __e27a,y       ; $e26f: b9 7a e2  
            sta $91            ; $e272: 85 91     
            ldy $94            ; $e274: a4 94     
            jmp ($0090)        ; $e276: 6c 90 00  

;-------------------------------------------------------------------------------
__e279:     .hex 81            ; $e279: 81            Data
__e27a:     .hex e2 f0 e2 36   ; $e27a: e2 f0 e2 36   Data
            .hex e3 6d e3      ; $e27e: e3 6d e3      Data

;-------------------------------------------------------------------------------
            lda $0480,y        ; $e281: b9 80 04  
            cmp #$02           ; $e284: c9 02     
            beq __e28c         ; $e286: f0 04     
            cmp #$06           ; $e288: c9 06     
            bne __e2e7         ; $e28a: d0 5b     
__e28c:     lda $07d0,y        ; $e28c: b9 d0 07  
            beq __e2e7         ; $e28f: f0 56     
            asl                ; $e291: 0a        
            sta $0480,x        ; $e292: 9d 80 04  
            lda $40            ; $e295: a5 40     
            sta $061d          ; $e297: 8d 1d 06  
            sta $061e          ; $e29a: 8d 1e 06  
            sta $061f          ; $e29d: 8d 1f 06  
            txa                ; $e2a0: 8a        
            and #$01           ; $e2a1: 29 01     
            sta $0560,x        ; $e2a3: 9d 60 05  
            lda #$00           ; $e2a6: a9 00     
            sta $07d0,y        ; $e2a8: 99 d0 07  
            sta $05a0,x        ; $e2ab: 9d a0 05  
            lda $004a,y        ; $e2ae: b9 4a 00  
            sta $0580,x        ; $e2b1: 9d 80 05  
            lda $04a0,y        ; $e2b4: b9 a0 04  
            and #$7f           ; $e2b7: 29 7f     
            sta $04a0,x        ; $e2b9: 9d a0 04  
__e2bc:     lda $0400,y        ; $e2bc: b9 00 04  
            sta $90            ; $e2bf: 85 90     
            lda $0440,y        ; $e2c1: b9 40 04  
            sta $92            ; $e2c4: 85 92     
            lda $0420,y        ; $e2c6: b9 20 04  
            sta $0420,x        ; $e2c9: 9d 20 04  
            lda $0460,y        ; $e2cc: b9 60 04  
            sta $0460,x        ; $e2cf: 9d 60 04  
            ldy $04a0,x        ; $e2d2: bc a0 04  
            lda $90            ; $e2d5: a5 90     
            clc                ; $e2d7: 18        
            adc __e2e8,y       ; $e2d8: 79 e8 e2  
            sta $0400,x        ; $e2db: 9d 00 04  
            lda $92            ; $e2de: a5 92     
            clc                ; $e2e0: 18        
            adc __e2ec,y       ; $e2e1: 79 ec e2  
            sta $0440,x        ; $e2e4: 9d 40 04  
__e2e7:     rts                ; $e2e7: 60        

;-------------------------------------------------------------------------------
__e2e8:     .hex 05 08 05 00   ; $e2e8: 05 08 05 00   Data
__e2ec:     .hex 08 04 00 04   ; $e2ec: 08 04 00 04   Data

;-------------------------------------------------------------------------------
            lda $04a0,x        ; $e2f0: bd a0 04  
            ldy #$01           ; $e2f3: a0 01     
            jsr __c201         ; $e2f5: 20 01 c2  
            lda $92            ; $e2f8: a5 92     
            bpl __e32d         ; $e2fa: 10 31     
            lda $0580,x        ; $e2fc: bd 80 05  
            beq __e32a         ; $e2ff: f0 29     
            lda #$08           ; $e301: a9 08     
            sta $0540,x        ; $e303: 9d 40 05  
            ldy $04a0,x        ; $e306: bc a0 04  
            lda $0400,x        ; $e309: bd 00 04  
            clc                ; $e30c: 18        
            adc __e32e,y       ; $e30d: 79 2e e3  
            sta $0400,x        ; $e310: 9d 00 04  
            lda $0440,x        ; $e313: bd 40 04  
            clc                ; $e316: 18        
            adc __e332,y       ; $e317: 79 32 e3  
            sta $0440,x        ; $e31a: 9d 40 04  
            lda $40            ; $e31d: a5 40     
            sta $0612          ; $e31f: 8d 12 06  
            sta $0613          ; $e322: 8d 13 06  
            sta $0614          ; $e325: 8d 14 06  
            lda #$04           ; $e328: a9 04     
__e32a:     sta $0480,x        ; $e32a: 9d 80 04  
__e32d:     rts                ; $e32d: 60        

;-------------------------------------------------------------------------------
__e32e:     .hex fc f5 fc 03   ; $e32e: fc f5 fc 03   Data
__e332:     .hex f5 fc 03 fc   ; $e332: f5 fc 03 fc   Data

;-------------------------------------------------------------------------------
            jsr __eb5b         ; $e336: 20 5b eb  
            dec $0540,x        ; $e339: de 40 05  
            bne __e36c         ; $e33c: d0 2e     
            lda $05a0,x        ; $e33e: bd a0 05  
            cmp #$02           ; $e341: c9 02     
            bcc __e367         ; $e343: 90 22     
            cmp #$04           ; $e345: c9 04     
            bcc __e34b         ; $e347: 90 02     
            lda #$03           ; $e349: a9 03     
__e34b:     sty $92            ; $e34b: 84 92     
            stx $93            ; $e34d: 86 93     
            clc                ; $e34f: 18        
            adc #$01           ; $e350: 69 01     
            asl                ; $e352: 0a        
            asl                ; $e353: 0a        
            tay                ; $e354: a8        
            lda #$20           ; $e355: a9 20     
            sta $0540,x        ; $e357: 9d 40 05  
            lda #$06           ; $e35a: a9 06     
            sta $0480,x        ; $e35c: 9d 80 04  
            jsr __cc35         ; $e35f: 20 35 cc  
            ldx $93            ; $e362: a6 93     
            ldy $92            ; $e364: a4 92     
            rts                ; $e366: 60        

;-------------------------------------------------------------------------------
__e367:     lda #$00           ; $e367: a9 00     
            sta $0480,x        ; $e369: 9d 80 04  
__e36c:     rts                ; $e36c: 60        

;-------------------------------------------------------------------------------
            dec $0540,x        ; $e36d: de 40 05  
            bne __e377         ; $e370: d0 05     
            lda #$00           ; $e372: a9 00     
            sta $0480,x        ; $e374: 9d 80 04  
__e377:     rts                ; $e377: 60        

;-------------------------------------------------------------------------------
__e378:     lda $40            ; $e378: a5 40     
            beq __e38b         ; $e37a: f0 0f     
            lda $12,x          ; $e37c: b5 12     
            sta $6c,x          ; $e37e: 95 6c     
            sta $07c0,x        ; $e380: 9d c0 07  
            cmp #$01           ; $e383: c9 01     
            bne __e38a         ; $e385: d0 03     
            sta $07d0,x        ; $e387: 9d d0 07  
__e38a:     rts                ; $e38a: 60        

;-------------------------------------------------------------------------------
__e38b:     lda $4f            ; $e38b: a5 4f     
            bne __e3b9         ; $e38d: d0 2a     
            lda $6b            ; $e38f: a5 6b     
            bne __e39f         ; $e391: d0 0c     
            ldy $6a            ; $e393: a4 6a     
            lda __ff80,y       ; $e395: b9 80 ff  
            beq __e3b8         ; $e398: f0 1e     
            sta $6b            ; $e39a: 85 6b     
            iny                ; $e39c: c8        
            sty $6a            ; $e39d: 84 6a     
__e39f:     dec $6b            ; $e39f: c6 6b     
            lda $6a            ; $e3a1: a5 6a     
            eor #$01           ; $e3a3: 49 01     
            lsr                ; $e3a5: 4a        
            lda $07c0          ; $e3a6: ad c0 07  
            rol                ; $e3a9: 2a        
            and #$03           ; $e3aa: 29 03     
            sta $6c            ; $e3ac: 85 6c     
            sta $07c0          ; $e3ae: 8d c0 07  
            cmp #$01           ; $e3b1: c9 01     
            bne __e3b8         ; $e3b3: d0 03     
            sta $07d0          ; $e3b5: 8d d0 07  
__e3b8:     rts                ; $e3b8: 60        

;-------------------------------------------------------------------------------
__e3b9:     inc $6b            ; $e3b9: e6 6b     
            lda $12            ; $e3bb: a5 12     
            sta $6c            ; $e3bd: 85 6c     
            sta $07c0          ; $e3bf: 8d c0 07  
            cmp #$01           ; $e3c2: c9 01     
            bne __e3c9         ; $e3c4: d0 03     
            sta $07d0          ; $e3c6: 8d d0 07  
__e3c9:     lda $12            ; $e3c9: a5 12     
            beq __e3e3         ; $e3cb: f0 16     
            cmp #$03           ; $e3cd: c9 03     
            beq __e3e3         ; $e3cf: f0 12     
            ldy $6a            ; $e3d1: a4 6a     
            lda $6b            ; $e3d3: a5 6b     
            sta __ff80,y       ; $e3d5: 99 80 ff  
            iny                ; $e3d8: c8        
            sty $6a            ; $e3d9: 84 6a     
            lda #$00           ; $e3db: a9 00     
            sta $6b            ; $e3dd: 85 6b     
            iny                ; $e3df: c8        
            sta __ff80,y       ; $e3e0: 99 80 ff  
__e3e3:     rts                ; $e3e3: 60        

;-------------------------------------------------------------------------------
__e3e4:     lda #$01           ; $e3e4: a9 01     
            sta $07c2          ; $e3e6: 8d c2 07  
            lda #$00           ; $e3e9: a9 00     
            sta $56            ; $e3eb: 85 56     
            sta $77            ; $e3ed: 85 77     
            lda #$ff           ; $e3ef: a9 ff     
            sta $5c            ; $e3f1: 85 5c     
            sta $5d            ; $e3f3: 85 5d     
            sta $5e            ; $e3f5: 85 5e     
            sta $5f            ; $e3f7: 85 5f     
            ldx #$02           ; $e3f9: a2 02     
__e3fb:     lda #$00           ; $e3fb: a9 00     
            sta $04c0,x        ; $e3fd: 9d c0 04  
            sta $04e0,x        ; $e400: 9d e0 04  
            sta $0480,x        ; $e403: 9d 80 04  
            inx                ; $e406: e8        
            cpx $55            ; $e407: e4 55     
            bne __e3fb         ; $e409: d0 f0     
            rts                ; $e40b: 60        

;-------------------------------------------------------------------------------
__e40c:     lda #$00           ; $e40c: a9 00     
            sta $9e            ; $e40e: 85 9e     
            ldx #$02           ; $e410: a2 02     
__e412:     stx $9f            ; $e412: 86 9f     
            lda $71            ; $e414: a5 71     
            beq __e42b         ; $e416: f0 13     
            ldy $70            ; $e418: a4 70     
            lda __db36,y       ; $e41a: b9 36 db  
            clc                ; $e41d: 18        
            adc #$20           ; $e41e: 69 20     
            sta $0520,x        ; $e420: 9d 20 05  
            lda __db2b,y       ; $e423: b9 2b db  
            adc #$00           ; $e426: 69 00     
            sta $0500,x        ; $e428: 9d 00 05  
__e42b:     jsr __e44f         ; $e42b: 20 4f e4  
            ldx $9f            ; $e42e: a6 9f     
            inx                ; $e430: e8        
            cpx $55            ; $e431: e4 55     
            bne __e412         ; $e433: d0 dd     
            lda $9e            ; $e435: a5 9e     
            beq __e449         ; $e437: f0 10     
            lda $0612          ; $e439: ad 12 06  
            bne __e449         ; $e43c: d0 0b     
            lda $0620          ; $e43e: ad 20 06  
            bne __e448         ; $e441: d0 05     
            lda $40            ; $e443: a5 40     
            sta $0620          ; $e445: 8d 20 06  
__e448:     rts                ; $e448: 60        

;-------------------------------------------------------------------------------
__e449:     lda #$00           ; $e449: a9 00     
            sta $0620          ; $e44b: 8d 20 06  
__e44e:     rts                ; $e44e: 60        

;-------------------------------------------------------------------------------
__e44f:     ldy $0480,x        ; $e44f: bc 80 04  
            lda __e45f,y       ; $e452: b9 5f e4  
            sta $90            ; $e455: 85 90     
            lda __e460,y       ; $e457: b9 60 e4  
            sta $91            ; $e45a: 85 91     
            jmp ($0090)        ; $e45c: 6c 90 00  

;-------------------------------------------------------------------------------
__e45f:     .hex 9a            ; $e45f: 9a            Data
__e460:     .hex e4 75 e6 59   ; $e460: e4 75 e6 59   Data
            .hex e8 66 e8 66   ; $e464: e8 66 e8 66   Data
            .hex e8 71 e8      ; $e468: e8 71 e8      Data

;-------------------------------------------------------------------------------
__e46b:     tay                ; $e46b: a8        
            lda #$00           ; $e46c: a9 00     
            sta $77            ; $e46e: 85 77     
            lda $0400,y        ; $e470: b9 00 04  
            sta $0400,x        ; $e473: 9d 00 04  
            lda $0440,y        ; $e476: b9 40 04  
            sta $0440,x        ; $e479: 9d 40 04  
            lda $05a0,y        ; $e47c: b9 a0 05  
            sta $05a0,x        ; $e47f: 9d a0 05  
            lda #$02           ; $e482: a9 02     
            sta $0580,x        ; $e484: 9d 80 05  
            eor $04a0,y        ; $e487: 59 a0 04  
            sta $04a0,x        ; $e48a: 9d a0 04  
            lda #$06           ; $e48d: a9 06     
            sta $0480,x        ; $e48f: 9d 80 04  
            lda #$80           ; $e492: a9 80     
            sta $0540,x        ; $e494: 9d 40 05  
            jmp __d49a         ; $e497: 4c 9a d4  

;-------------------------------------------------------------------------------
            lda $07d2          ; $e49a: ad d2 07  
            beq __e44e         ; $e49d: f0 af     
            lda $52            ; $e49f: a5 52     
            beq __e44e         ; $e4a1: f0 ab     
            lda $77            ; $e4a3: a5 77     
            bne __e46b         ; $e4a5: d0 c4     
            jsr __e522         ; $e4a7: 20 22 e5  
            bcs __e44e         ; $e4aa: b0 a2     
            lda #$08           ; $e4ac: a9 08     
            sta $0480,x        ; $e4ae: 9d 80 04  
            lda #$00           ; $e4b1: a9 00     
            sta $07d2          ; $e4b3: 8d d2 07  
            sta $0420,x        ; $e4b6: 9d 20 04  
            sta $0460,x        ; $e4b9: 9d 60 04  
            lda #$17           ; $e4bc: a9 17     
            sta $0540,x        ; $e4be: 9d 40 05  
            tya                ; $e4c1: 98        
            sta $05c0,x        ; $e4c2: 9d c0 05  
            sta $04a0,x        ; $e4c5: 9d a0 04  
            lda __e562,y       ; $e4c8: b9 62 e5  
            sta $0400,x        ; $e4cb: 9d 00 04  
            lda __e566,y       ; $e4ce: b9 66 e5  
            sta $0440,x        ; $e4d1: 9d 40 04  
            ldy $5b            ; $e4d4: a4 5b     
            lda __dc81,y       ; $e4d6: b9 81 dc  
            sta $90            ; $e4d9: 85 90     
            lda __dc82,y       ; $e4db: b9 82 dc  
            sta $91            ; $e4de: 85 91     
            ldy $52            ; $e4e0: a4 52     
            dey                ; $e4e2: 88        
            lda ($90),y        ; $e4e3: b1 90     
            sta $0580,x        ; $e4e5: 9d 80 05  
            jsr __e701         ; $e4e8: 20 01 e7  
            jsr __d49a         ; $e4eb: 20 9a d4  
            ldx $9f            ; $e4ee: a6 9f     
__e4f0:     jsr __e56a         ; $e4f0: 20 6a e5  
            ldy #$00           ; $e4f3: a0 00     
            jsr __e4f9         ; $e4f5: 20 f9 e4  
            iny                ; $e4f8: c8        
__e4f9:     lda $0480,y        ; $e4f9: b9 80 04  
            cmp #$02           ; $e4fc: c9 02     
            bne __e578         ; $e4fe: d0 78     
            lda $0400,x        ; $e500: bd 00 04  
            sec                ; $e503: 38        
            sbc $0400,y        ; $e504: f9 00 04  
            clc                ; $e507: 18        
            adc #$08           ; $e508: 69 08     
            cmp #$11           ; $e50a: c9 11     
            bcs __e578         ; $e50c: b0 6a     
            lda $0440,x        ; $e50e: bd 40 04  
            sec                ; $e511: 38        
            sbc $0440,y        ; $e512: f9 40 04  
            clc                ; $e515: 18        
            adc #$08           ; $e516: 69 08     
            cmp #$11           ; $e518: c9 11     
            bcs __e578         ; $e51a: b0 5c     
            jsr __eeab         ; $e51c: 20 ab ee  
            jmp __e59f         ; $e51f: 4c 9f e5  

;-------------------------------------------------------------------------------
__e522:     stx $90            ; $e522: 86 90     
            ldy $56            ; $e524: a4 56     
            inc $56            ; $e526: e6 56     
            lda $56            ; $e528: a5 56     
            and #$03           ; $e52a: 29 03     
            sta $56            ; $e52c: 85 56     
            ldx #$00           ; $e52e: a2 00     
__e530:     lda $0480,x        ; $e530: bd 80 04  
            cmp #$02           ; $e533: c9 02     
            bne __e54d         ; $e535: d0 16     
            lda $0400,x        ; $e537: bd 00 04  
            sec                ; $e53a: 38        
            sbc __e55a,y       ; $e53b: f9 5a e5  
            cmp #$20           ; $e53e: c9 20     
            bcs __e54d         ; $e540: b0 0b     
            lda $0440,x        ; $e542: bd 40 04  
            sec                ; $e545: 38        
            sbc __e55e,y       ; $e546: f9 5e e5  
            cmp #$20           ; $e549: c9 20     
            bcc __e556         ; $e54b: 90 09     
__e54d:     inx                ; $e54d: e8        
            cpx $55            ; $e54e: e4 55     
            bne __e530         ; $e550: d0 de     
            ldx $90            ; $e552: a6 90     
            clc                ; $e554: 18        
            rts                ; $e555: 60        

;-------------------------------------------------------------------------------
__e556:     ldx $90            ; $e556: a6 90     
            sec                ; $e558: 38        
            rts                ; $e559: 60        

;-------------------------------------------------------------------------------
__e55a:     .hex 27 27 bf bf   ; $e55a: 27 27 bf bf   Data
__e55e:     .hex 20 d0 d0 20   ; $e55e: 20 d0 d0 20   Data
__e562:     .hex 27 27 cf cf   ; $e562: 27 27 cf cf   Data
__e566:     .hex 20 e0 e0 20   ; $e566: 20 e0 e0 20   Data

;-------------------------------------------------------------------------------
__e56a:     lda $50            ; $e56a: a5 50     
            bne __e578         ; $e56c: d0 0a     
            ldy #$10           ; $e56e: a0 10     
__e570:     jsr __e579         ; $e570: 20 79 e5  
            iny                ; $e573: c8        
            cpy #$14           ; $e574: c0 14     
            bne __e570         ; $e576: d0 f8     
__e578:     rts                ; $e578: 60        

;-------------------------------------------------------------------------------
__e579:     lda $0480,y        ; $e579: b9 80 04  
            cmp #$02           ; $e57c: c9 02     
            bne __e578         ; $e57e: d0 f8     
            lda $0400,y        ; $e580: b9 00 04  
            sec                ; $e583: 38        
            sbc $0400,x        ; $e584: fd 00 04  
            clc                ; $e587: 18        
            adc #$04           ; $e588: 69 04     
            cmp #$11           ; $e58a: c9 11     
            bcs __e578         ; $e58c: b0 ea     
            lda $0440,y        ; $e58e: b9 40 04  
            sec                ; $e591: 38        
            sbc $0440,x        ; $e592: fd 40 04  
            clc                ; $e595: 18        
            adc #$04           ; $e596: 69 04     
            cmp #$11           ; $e598: c9 11     
            bcs __e578         ; $e59a: b0 dc     
            jsr __e5d2         ; $e59c: 20 d2 e5  
__e59f:     lda #$04           ; $e59f: a9 04     
            sta $0480,x        ; $e5a1: 9d 80 04  
            lda #$08           ; $e5a4: a9 08     
            sta $0540,x        ; $e5a6: 9d 40 05  
            lda $40            ; $e5a9: a5 40     
            sta $061c          ; $e5ab: 8d 1c 06  
            lda $0560,y        ; $e5ae: b9 60 05  
            sty $92            ; $e5b1: 84 92     
            tay                ; $e5b3: a8        
            lda $005c,y        ; $e5b4: b9 5c 00  
            asl                ; $e5b7: 0a        
            asl                ; $e5b8: 0a        
            ora $05a0,x        ; $e5b9: 1d a0 05  
            sta $005c,y        ; $e5bc: 99 5c 00  
            lda $005e,y        ; $e5bf: b9 5e 00  
            asl                ; $e5c2: 0a        
            asl                ; $e5c3: 0a        
            ora $0580,x        ; $e5c4: 1d 80 05  
            sta $005e,y        ; $e5c7: 99 5e 00  
            jsr __e602         ; $e5ca: 20 02 e6  
            ldy $92            ; $e5cd: a4 92     
            jmp __cc21         ; $e5cf: 4c 21 cc  

;-------------------------------------------------------------------------------
__e5d2:     lda $0580,y        ; $e5d2: b9 80 05  
            beq __e5fe         ; $e5d5: f0 27     
            lda $0400,x        ; $e5d7: bd 00 04  
            sta $0400,y        ; $e5da: 99 00 04  
            lda $0440,x        ; $e5dd: bd 40 04  
            sta $0440,y        ; $e5e0: 99 40 04  
            lda #$08           ; $e5e3: a9 08     
            sta $0540,y        ; $e5e5: 99 40 05  
            lda $40            ; $e5e8: a5 40     
            sta $0612          ; $e5ea: 8d 12 06  
            sta $0613          ; $e5ed: 8d 13 06  
            sta $0614          ; $e5f0: 8d 14 06  
            lda #$01           ; $e5f3: a9 01     
            clc                ; $e5f5: 18        
            adc $05a0,y        ; $e5f6: 79 a0 05  
            sta $05a0,y        ; $e5f9: 99 a0 05  
            lda #$04           ; $e5fc: a9 04     
__e5fe:     sta $0480,y        ; $e5fe: 99 80 04  
            rts                ; $e601: 60        

;-------------------------------------------------------------------------------
__e602:     and #$3f           ; $e602: 29 3f     
            beq __e60e         ; $e604: f0 08     
            cmp #$15           ; $e606: c9 15     
            beq __e60e         ; $e608: f0 04     
            cmp #$2a           ; $e60a: c9 2a     
            bne __e674         ; $e60c: d0 66     
__e60e:     lda $005c,y        ; $e60e: b9 5c 00  
            and #$3f           ; $e611: 29 3f     
            beq __e61d         ; $e613: f0 08     
            cmp #$15           ; $e615: c9 15     
            beq __e61d         ; $e617: f0 04     
            cmp #$2a           ; $e619: c9 2a     
            bne __e674         ; $e61b: d0 57     
__e61d:     stx $93            ; $e61d: 86 93     
            ldx #$0a           ; $e61f: a2 0a     
__e621:     lda $0480,x        ; $e621: bd 80 04  
            bne __e66d         ; $e624: d0 47     
            sta $05e0,x        ; $e626: 9d e0 05  
            sta $0420,x        ; $e629: 9d 20 04  
            sta $0460,x        ; $e62c: 9d 60 04  
            lda #$08           ; $e62f: a9 08     
            sta $0480,x        ; $e631: 9d 80 04  
            lda #$2f           ; $e634: a9 2f     
            sta $0540,x        ; $e636: 9d 40 05  
            jsr __c133         ; $e639: 20 33 c1  
            and #$03           ; $e63c: 29 03     
            sta $04a0,x        ; $e63e: 9d a0 04  
            tay                ; $e641: a8        
            lda __e562,y       ; $e642: b9 62 e5  
            sta $0400,x        ; $e645: 9d 00 04  
            lda __e566,y       ; $e648: b9 66 e5  
            sta $0440,x        ; $e64b: 9d 40 04  
            ldy $92            ; $e64e: a4 92     
            lda $0560,y        ; $e650: b9 60 05  
            tay                ; $e653: a8        
            lda $005c,y        ; $e654: b9 5c 00  
            and #$03           ; $e657: 29 03     
            sta $0580,x        ; $e659: 9d 80 05  
            clc                ; $e65c: 18        
            adc #$03           ; $e65d: 69 03     
            sta $05a0,x        ; $e65f: 9d a0 05  
            lda #$ff           ; $e662: a9 ff     
            sta $005c,y        ; $e664: 99 5c 00  
            sta $005e,y        ; $e667: 99 5e 00  
            jmp __e672         ; $e66a: 4c 72 e6  

;-------------------------------------------------------------------------------
__e66d:     inx                ; $e66d: e8        
            cpx #$0e           ; $e66e: e0 0e     
            bne __e621         ; $e670: d0 af     
__e672:     ldx $93            ; $e672: a6 93     
__e674:     rts                ; $e674: 60        

;-------------------------------------------------------------------------------
            lda #$01           ; $e675: a9 01     
            sta $9e            ; $e677: 85 9e     
            inc $0540,x        ; $e679: fe 40 05  
            jsr __e701         ; $e67c: 20 01 e7  
            lda $0580,x        ; $e67f: bd 80 05  
            beq __e6aa         ; $e682: f0 26     
            cmp #$02           ; $e684: c9 02     
            bcs __e6a3         ; $e686: b0 1b     
            lda $0540,x        ; $e688: bd 40 05  
            and #$40           ; $e68b: 29 40     
            beq __e6aa         ; $e68d: f0 1b     
            lda #$0a           ; $e68f: a9 0a     
            sta $0480,x        ; $e691: 9d 80 04  
__e694:     lda $50            ; $e694: a5 50     
            bne __e6a2         ; $e696: d0 0a     
            ldy #$10           ; $e698: a0 10     
__e69a:     jsr __e887         ; $e69a: 20 87 e8  
            iny                ; $e69d: c8        
            cpy #$14           ; $e69e: c0 14     
            bne __e69a         ; $e6a0: d0 f8     
__e6a2:     rts                ; $e6a2: 60        

;-------------------------------------------------------------------------------
__e6a3:     lda $0540,x        ; $e6a3: bd 40 05  
            bne __e6aa         ; $e6a6: d0 02     
            stx $77            ; $e6a8: 86 77     
__e6aa:     lda $50            ; $e6aa: a5 50     
            bne __e6e5         ; $e6ac: d0 37     
            jsr __e76b         ; $e6ae: 20 6b e7  
            lda $05c0,x        ; $e6b1: bd c0 05  
            bmi __e6e2         ; $e6b4: 30 2c     
            ldy #$00           ; $e6b6: a0 00     
            jsr __c201         ; $e6b8: 20 01 c2  
            lda $92            ; $e6bb: a5 92     
            bpl __e6df         ; $e6bd: 10 20     
            lda $04a0,x        ; $e6bf: bd a0 04  
            cmp $05c0,x        ; $e6c2: dd c0 05  
            beq __e6d5         ; $e6c5: f0 0e     
            ldy #$00           ; $e6c7: a0 00     
            jsr __c201         ; $e6c9: 20 01 c2  
            lda $92            ; $e6cc: a5 92     
            bpl __e6e2         ; $e6ce: 10 12     
            lda #$02           ; $e6d0: a9 02     
            jmp __e6dc         ; $e6d2: 4c dc e6  

;-------------------------------------------------------------------------------
__e6d5:     jsr __c133         ; $e6d5: 20 33 c1  
            and #$03           ; $e6d8: 29 03     
            ora #$01           ; $e6da: 09 01     
__e6dc:     eor $04a0,x        ; $e6dc: 5d a0 04  
__e6df:     sta $04a0,x        ; $e6df: 9d a0 04  
__e6e2:     jmp __e4f0         ; $e6e2: 4c f0 e4  

;-------------------------------------------------------------------------------
__e6e5:     jsr __e73b         ; $e6e5: 20 3b e7  
            jsr __dee5         ; $e6e8: 20 e5 de  
            lda $92            ; $e6eb: a5 92     
            bpl __e6fe         ; $e6ed: 10 0f     
            jsr __c133         ; $e6ef: 20 33 c1  
            and #$03           ; $e6f2: 29 03     
            cmp $04a0,x        ; $e6f4: dd a0 04  
            bne __e6fb         ; $e6f7: d0 02     
            eor #$02           ; $e6f9: 49 02     
__e6fb:     sta $04a0,x        ; $e6fb: 9d a0 04  
__e6fe:     jmp __e4f0         ; $e6fe: 4c f0 e4  

;-------------------------------------------------------------------------------
__e701:     lda $0400,x        ; $e701: bd 00 04  
            sec                ; $e704: 38        
            sbc #$50           ; $e705: e9 50     
            cmp #$57           ; $e707: c9 57     
            bcs __e71b         ; $e709: b0 10     
            lda $0440,x        ; $e70b: bd 40 04  
            sec                ; $e70e: 38        
            sbc #$49           ; $e70f: e9 49     
            cmp #$6f           ; $e711: c9 6f     
            bcs __e71b         ; $e713: b0 06     
            lda #$02           ; $e715: a9 02     
            sta $05a0,x        ; $e717: 9d a0 05  
            rts                ; $e71a: 60        

;-------------------------------------------------------------------------------
__e71b:     lda $0400,x        ; $e71b: bd 00 04  
            sec                ; $e71e: 38        
            sbc #$30           ; $e71f: e9 30     
            cmp #$97           ; $e721: c9 97     
            bcs __e735         ; $e723: b0 10     
            lda $0440,x        ; $e725: bd 40 04  
            sec                ; $e728: 38        
            sbc #$29           ; $e729: e9 29     
            cmp #$af           ; $e72b: c9 af     
            bcs __e735         ; $e72d: b0 06     
            lda #$01           ; $e72f: a9 01     
            sta $05a0,x        ; $e731: 9d a0 05  
            rts                ; $e734: 60        

;-------------------------------------------------------------------------------
__e735:     lda #$00           ; $e735: a9 00     
            sta $05a0,x        ; $e737: 9d a0 05  
            rts                ; $e73a: 60        

;-------------------------------------------------------------------------------
__e73b:     lda $76            ; $e73b: a5 76     
            ora $71            ; $e73d: 05 71     
            ora $048f          ; $e73f: 0d 8f 04  
            bne __e787         ; $e742: d0 43     
__e744:     lda $79            ; $e744: a5 79     
            and #$03           ; $e746: 29 03     
            bne __e76a         ; $e748: d0 20     
            lda $79            ; $e74a: a5 79     
            lsr                ; $e74c: 4a        
            lsr                ; $e74d: 4a        
            and #$07           ; $e74e: 29 07     
            adc #$02           ; $e750: 69 02     
            sta $90            ; $e752: 85 90     
            cpx $90            ; $e754: e4 90     
            bne __e76a         ; $e756: d0 12     
__e758:     jsr __c133         ; $e758: 20 33 c1  
            and #$03           ; $e75b: 29 03     
            eor $05c0,x        ; $e75d: 5d c0 05  
            cmp #$02           ; $e760: c9 02     
            beq __e76a         ; $e762: f0 06     
            eor $05c0,x        ; $e764: 5d c0 05  
            sta $05c0,x        ; $e767: 9d c0 05  
__e76a:     rts                ; $e76a: 60        

;-------------------------------------------------------------------------------
__e76b:     lda $76            ; $e76b: a5 76     
            ora $71            ; $e76d: 05 71     
            ora $048f          ; $e76f: 0d 8f 04  
            bne __e787         ; $e772: d0 13     
            lda $05a0,x        ; $e774: bd a0 05  
            cmp #$02           ; $e777: c9 02     
            beq __e744         ; $e779: f0 c9     
            jsr __e82a         ; $e77b: 20 2a e8  
            lda __e821,y       ; $e77e: b9 21 e8  
            bmi __e786         ; $e781: 30 03     
            sta $05c0,x        ; $e783: 9d c0 05  
__e786:     rts                ; $e786: 60        

;-------------------------------------------------------------------------------
__e787:     lda $79            ; $e787: a5 79     
            and #$03           ; $e789: 29 03     
            bne __e786         ; $e78b: d0 f9     
            lda $79            ; $e78d: a5 79     
            lsr                ; $e78f: 4a        
            lsr                ; $e790: 4a        
            and #$07           ; $e791: 29 07     
            adc #$02           ; $e793: 69 02     
            sta $90            ; $e795: 85 90     
            cpx $90            ; $e797: e4 90     
            bne __e786         ; $e799: d0 eb     
            lda $79            ; $e79b: a5 79     
            and #$60           ; $e79d: 29 60     
            bne __e758         ; $e79f: d0 b7     
            ldy #$00           ; $e7a1: a0 00     
            jsr __e7e1         ; $e7a3: 20 e1 e7  
            lda $bd            ; $e7a6: a5 bd     
            beq __e7c8         ; $e7a8: f0 1e     
            ldy #$01           ; $e7aa: a0 01     
            lda $0480,y        ; $e7ac: b9 80 04  
            cmp #$02           ; $e7af: c9 02     
            bne __e7c6         ; $e7b1: d0 13     
            jsr __e7e1         ; $e7b3: 20 e1 e7  
            lda $91            ; $e7b6: a5 91     
            clc                ; $e7b8: 18        
            adc $93            ; $e7b9: 65 93     
            sta $96            ; $e7bb: 85 96     
            lda $90            ; $e7bd: a5 90     
            clc                ; $e7bf: 18        
            adc $92            ; $e7c0: 65 92     
            cmp $96            ; $e7c2: c5 96     
            bcs __e7c8         ; $e7c4: b0 02     
__e7c6:     ldy #$00           ; $e7c6: a0 00     
__e7c8:     lda $0480,y        ; $e7c8: b9 80 04  
            cmp #$02           ; $e7cb: c9 02     
            bne __e758         ; $e7cd: d0 89     
            lda $0090,y        ; $e7cf: b9 90 00  
            cmp $0092,y        ; $e7d2: d9 92 00  
            lda $0094,y        ; $e7d5: b9 94 00  
            rol                ; $e7d8: 2a        
            tay                ; $e7d9: a8        
            lda __e819,y       ; $e7da: b9 19 e8  
            sta $05c0,x        ; $e7dd: 9d c0 05  
            rts                ; $e7e0: 60        

;-------------------------------------------------------------------------------
__e7e1:     lda $0400,y        ; $e7e1: b9 00 04  
            sec                ; $e7e4: 38        
            sbc $0400,x        ; $e7e5: fd 00 04  
            ror                ; $e7e8: 6a        
            eor #$80           ; $e7e9: 49 80     
            sec                ; $e7eb: 38        
            bpl __e7f3         ; $e7ec: 10 05     
            eor #$ff           ; $e7ee: 49 ff     
            adc #$00           ; $e7f0: 69 00     
            clc                ; $e7f2: 18        
__e7f3:     sta $0090,y        ; $e7f3: 99 90 00  
            lda #$00           ; $e7f6: a9 00     
            rol                ; $e7f8: 2a        
            sta $0094,y        ; $e7f9: 99 94 00  
            lda $0440,y        ; $e7fc: b9 40 04  
            sec                ; $e7ff: 38        
            sbc $0440,x        ; $e800: fd 40 04  
            ror                ; $e803: 6a        
            eor #$80           ; $e804: 49 80     
            sec                ; $e806: 38        
            bpl __e80e         ; $e807: 10 05     
            eor #$ff           ; $e809: 49 ff     
            adc #$00           ; $e80b: 69 00     
            clc                ; $e80d: 18        
__e80e:     sta $0092,y        ; $e80e: 99 92 00  
            lda $0094,y        ; $e811: b9 94 00  
            rol                ; $e814: 2a        
            sta $0094,y        ; $e815: 99 94 00  
            rts                ; $e818: 60        

;-------------------------------------------------------------------------------
__e819:     .hex 02 03 00 03   ; $e819: 02 03 00 03   Data
            .hex 02 01 00 01   ; $e81d: 02 01 00 01   Data
__e821:     .hex 01 01 00 02   ; $e821: 01 01 00 02   Data
            .hex 80 00 02 03   ; $e825: 80 00 02 03   Data
            .hex 03            ; $e829: 03            Data

;-------------------------------------------------------------------------------
__e82a:     ldy #$00           ; $e82a: a0 00     
            lda $0440,x        ; $e82c: bd 40 04  
            clc                ; $e82f: 18        
            adc $0400,x        ; $e830: 7d 00 04  
            bcs __e83f         ; $e833: b0 0a     
            cmp #$ff           ; $e835: c9 ff     
            bcs __e83f         ; $e837: b0 06     
            iny                ; $e839: c8        
            cmp #$f7           ; $e83a: c9 f7     
            bcs __e83f         ; $e83c: b0 01     
            iny                ; $e83e: c8        
__e83f:     lda $0440,x        ; $e83f: bd 40 04  
            sec                ; $e842: 38        
            sbc $0400,x        ; $e843: fd 00 04  
            bcs __e851         ; $e846: b0 09     
            cmp #$e9           ; $e848: c9 e9     
            bcs __e855         ; $e84a: b0 09     
            tya                ; $e84c: 98        
            adc #$06           ; $e84d: 69 06     
            tay                ; $e84f: a8        
            rts                ; $e850: 60        

;-------------------------------------------------------------------------------
__e851:     cmp #$21           ; $e851: c9 21     
            bcs __e858         ; $e853: b0 03     
__e855:     iny                ; $e855: c8        
            iny                ; $e856: c8        
            iny                ; $e857: c8        
__e858:     rts                ; $e858: 60        

;-------------------------------------------------------------------------------
            dec $0540,x        ; $e859: de 40 05  
            bne __e865         ; $e85c: d0 07     
            lda #$00           ; $e85e: a9 00     
            sta $0480,x        ; $e860: 9d 80 04  
            dec $53            ; $e863: c6 53     
__e865:     rts                ; $e865: 60        

;-------------------------------------------------------------------------------
            dec $0540,x        ; $e866: de 40 05  
            bne __e870         ; $e869: d0 05     
            lda #$02           ; $e86b: a9 02     
            sta $0480,x        ; $e86d: 9d 80 04  
__e870:     rts                ; $e870: 60        

;-------------------------------------------------------------------------------
            jsr __e694         ; $e871: 20 94 e6  
            jsr __e8ad         ; $e874: 20 ad e8  
            inc $0540,x        ; $e877: fe 40 05  
            lda $0540,x        ; $e87a: bd 40 05  
            and #$40           ; $e87d: 29 40     
            bne __e886         ; $e87f: d0 05     
            lda #$02           ; $e881: a9 02     
            sta $0480,x        ; $e883: 9d 80 04  
__e886:     rts                ; $e886: 60        

;-------------------------------------------------------------------------------
__e887:     lda $0480,y        ; $e887: b9 80 04  
            cmp #$02           ; $e88a: c9 02     
            bne __e886         ; $e88c: d0 f8     
            lda $0400,y        ; $e88e: b9 00 04  
            sec                ; $e891: 38        
            sbc $0400,x        ; $e892: fd 00 04  
            clc                ; $e895: 18        
            adc #$04           ; $e896: 69 04     
            cmp #$11           ; $e898: c9 11     
            bcs __e886         ; $e89a: b0 ea     
            lda $0440,y        ; $e89c: b9 40 04  
            sec                ; $e89f: 38        
            sbc $0440,x        ; $e8a0: fd 40 04  
            clc                ; $e8a3: 18        
            adc #$04           ; $e8a4: 69 04     
            cmp #$11           ; $e8a6: c9 11     
            bcs __e886         ; $e8a8: b0 dc     
            jmp __e5d2         ; $e8aa: 4c d2 e5  

;-------------------------------------------------------------------------------
__e8ad:     ldy #$00           ; $e8ad: a0 00     
            jsr __e8b3         ; $e8af: 20 b3 e8  
            iny                ; $e8b2: c8        
__e8b3:     lda $0480,y        ; $e8b3: b9 80 04  
            cmp #$02           ; $e8b6: c9 02     
            bne __e886         ; $e8b8: d0 cc     
            lda $0400,x        ; $e8ba: bd 00 04  
            sec                ; $e8bd: 38        
            sbc $0400,y        ; $e8be: f9 00 04  
            clc                ; $e8c1: 18        
            adc #$08           ; $e8c2: 69 08     
            cmp #$11           ; $e8c4: c9 11     
            bcs __e886         ; $e8c6: b0 be     
            lda $0440,x        ; $e8c8: bd 40 04  
            sec                ; $e8cb: 38        
            sbc $0440,y        ; $e8cc: f9 40 04  
            clc                ; $e8cf: 18        
            adc #$08           ; $e8d0: 69 08     
            cmp #$11           ; $e8d2: c9 11     
            bcs __e886         ; $e8d4: b0 b0     
            jmp __eeab         ; $e8d6: 4c ab ee  

;-------------------------------------------------------------------------------
__e8d9:     ldx #$00           ; $e8d9: a2 00     
            jsr __e930         ; $e8db: 20 30 e9  
            inx                ; $e8de: e8        
            jsr __e930         ; $e8df: 20 30 e9  
            ldx #$10           ; $e8e2: a2 10     
            lda #$00           ; $e8e4: a9 00     
__e8e6:     sta $0480,x        ; $e8e6: 9d 80 04  
            sta $0420,x        ; $e8e9: 9d 20 04  
            sta $0460,x        ; $e8ec: 9d 60 04  
            sta $04a0,x        ; $e8ef: 9d a0 04  
            sta $0580,x        ; $e8f2: 9d 80 05  
            inx                ; $e8f5: e8        
            cpx #$14           ; $e8f6: e0 14     
            bne __e8e6         ; $e8f8: d0 ec     
            rts                ; $e8fa: 60        

;-------------------------------------------------------------------------------
__e8fb:     ldx #$00           ; $e8fb: a2 00     
            jsr __e939         ; $e8fd: 20 39 e9  
            inx                ; $e900: e8        
            jsr __e939         ; $e901: 20 39 e9  
            lda #$00           ; $e904: a9 00     
            sta $9e            ; $e906: 85 9e     
            ldx #$10           ; $e908: a2 10     
__e90a:     stx $9f            ; $e90a: 86 9f     
            jsr __e96f         ; $e90c: 20 6f e9  
            ldx $9f            ; $e90f: a6 9f     
            inx                ; $e911: e8        
            cpx #$14           ; $e912: e0 14     
            bne __e90a         ; $e914: d0 f4     
            lda $9e            ; $e916: a5 9e     
            beq __e92a         ; $e918: f0 10     
            lda $0612          ; $e91a: ad 12 06  
            bne __e92a         ; $e91d: d0 0b     
            lda $0617          ; $e91f: ad 17 06  
            bne __e929         ; $e922: d0 05     
            lda $40            ; $e924: a5 40     
            sta $0617          ; $e926: 8d 17 06  
__e929:     rts                ; $e929: 60        

;-------------------------------------------------------------------------------
__e92a:     lda #$00           ; $e92a: a9 00     
            sta $0617          ; $e92c: 8d 17 06  
            rts                ; $e92f: 60        

;-------------------------------------------------------------------------------
__e930:     lda #$00           ; $e930: a9 00     
            sta $60,x          ; $e932: 95 60     
            sta $62,x          ; $e934: 95 62     
            sta $64,x          ; $e936: 95 64     
            rts                ; $e938: 60        

;-------------------------------------------------------------------------------
__e939:     jsr __e378         ; $e939: 20 78 e3  
            lda $0480,x        ; $e93c: bd 80 04  
            cmp #$02           ; $e93f: c9 02     
            beq __e947         ; $e941: f0 04     
            cmp #$06           ; $e943: c9 06     
            bne __e95c         ; $e945: d0 15     
__e947:     lda #$00           ; $e947: a9 00     
            sta $60,x          ; $e949: 95 60     
            lda $6c,x          ; $e94b: b5 6c     
            beq __e95c         ; $e94d: f0 0d     
            cmp #$02           ; $e94f: c9 02     
            bcc __e964         ; $e951: 90 11     
            beq __e95c         ; $e953: f0 07     
            lda $62,x          ; $e955: b5 62     
            cmp __ea6b,x       ; $e957: dd 6b ea  
            bcc __e961         ; $e95a: 90 05     
__e95c:     lda #$00           ; $e95c: a9 00     
            sta $64,x          ; $e95e: 95 64     
            rts                ; $e960: 60        

;-------------------------------------------------------------------------------
__e961:     inc $62,x          ; $e961: f6 62     
            rts                ; $e963: 60        

;-------------------------------------------------------------------------------
__e964:     lda #$00           ; $e964: a9 00     
            sta $62,x          ; $e966: 95 62     
            lda #$01           ; $e968: a9 01     
            sta $60,x          ; $e96a: 95 60     
            sta $64,x          ; $e96c: 95 64     
__e96e:     rts                ; $e96e: 60        

;-------------------------------------------------------------------------------
__e96f:     ldy $0480,x        ; $e96f: bc 80 04  
            lda __e97f,y       ; $e972: b9 7f e9  
            sta $90            ; $e975: 85 90     
            lda __e980,y       ; $e977: b9 80 e9  
            sta $91            ; $e97a: 85 91     
            jmp ($0090)        ; $e97c: 6c 90 00  

;-------------------------------------------------------------------------------
__e97f:     .hex 8b            ; $e97f: 8b            Data
__e980:     .hex e9 41 ea ac   ; $e980: e9 41 ea ac   Data
            .hex ea ee ea 34   ; $e984: ea ee ea 34   Data
            .hex eb cd ed      ; $e988: eb cd ed      Data

;-------------------------------------------------------------------------------
            ldy #$00           ; $e98b: a0 00     
            jsr __e992         ; $e98d: 20 92 e9  
            ldy #$01           ; $e990: a0 01     
__e992:     lda $0060,y        ; $e992: b9 60 00  
            beq __e96e         ; $e995: f0 d7     
            asl                ; $e997: 0a        
            sta $0480,x        ; $e998: 9d 80 04  
            lda #$00           ; $e99b: a9 00     
            sta $0060,y        ; $e99d: 99 60 00  
            lda $004a,y        ; $e9a0: b9 4a 00  
            sta $0580,x        ; $e9a3: 9d 80 05  
            lda $40            ; $e9a6: a5 40     
            sta $0615          ; $e9a8: 8d 15 06  
            lda __ea6f         ; $e9ab: ad 6f ea  
            sta $04e0,x        ; $e9ae: 9d e0 04  
            tya                ; $e9b1: 98        
            sta $0560,x        ; $e9b2: 9d 60 05  
            tax                ; $e9b5: aa        
            lda $04a0,y        ; $e9b6: b9 a0 04  
            asl                ; $e9b9: 0a        
            tay                ; $e9ba: a8        
            lda __ea01,y       ; $e9bb: b9 01 ea  
            sta $d3            ; $e9be: 85 d3     
            lda __ea02,y       ; $e9c0: b9 02 ea  
            sta $d4            ; $e9c3: 85 d4     
            jsr $00d2          ; $e9c5: 20 d2 00  
            ldx $9f            ; $e9c8: a6 9f     
            lda $94            ; $e9ca: a5 94     
            asl                ; $e9cc: 0a        
            adc $94            ; $e9cd: 65 94     
            asl                ; $e9cf: 0a        
            asl                ; $e9d0: 0a        
            asl                ; $e9d1: 0a        
            adc #$27           ; $e9d2: 69 27     
            sta $0400,x        ; $e9d4: 9d 00 04  
            lda $95            ; $e9d7: a5 95     
            asl                ; $e9d9: 0a        
            adc $95            ; $e9da: 65 95     
            asl                ; $e9dc: 0a        
            adc #$20           ; $e9dd: 69 20     
            sta $0440,x        ; $e9df: 9d 40 04  
            lda #$00           ; $e9e2: a9 00     
            sta $04c0,x        ; $e9e4: 9d c0 04  
__e9e7:     ldy $95            ; $e9e7: a4 95     
            lda $077e,y        ; $e9e9: b9 7e 07  
            ldy $94            ; $e9ec: a4 94     
            and __d1f6,y       ; $e9ee: 39 f6 d1  
            clc                ; $e9f1: 18        
            beq __e9f5         ; $e9f2: f0 01     
            sec                ; $e9f4: 38        
__e9f5:     rol $04c0,x        ; $e9f5: 3e c0 04  
            inc $95            ; $e9f8: e6 95     
            lda $95            ; $e9fa: a5 95     
            and #$03           ; $e9fc: 29 03     
            bne __e9e7         ; $e9fe: d0 e7     
            rts                ; $ea00: 60        

;-------------------------------------------------------------------------------
__ea01:     .hex 09            ; $ea01: 09            Data
__ea02:     .hex ea 19 ea 25   ; $ea02: ea 19 ea 25   Data
            .hex ea 35 ea      ; $ea06: ea 35 ea      Data

;-------------------------------------------------------------------------------
            jsr __e0ea         ; $ea09: 20 ea e0  
            lda $96            ; $ea0c: a5 96     
            cmp #$11           ; $ea0e: c9 11     
            bcc __ea18         ; $ea10: 90 06     
            lda $95            ; $ea12: a5 95     
            adc #$03           ; $ea14: 69 03     
            sta $95            ; $ea16: 85 95     
__ea18:     rts                ; $ea18: 60        

;-------------------------------------------------------------------------------
            jsr __e0fe         ; $ea19: 20 fe e0  
            lda $96            ; $ea1c: a5 96     
            cmp #$11           ; $ea1e: c9 11     
            bcc __ea24         ; $ea20: 90 02     
            inc $94            ; $ea22: e6 94     
__ea24:     rts                ; $ea24: 60        

;-------------------------------------------------------------------------------
            jsr __e112         ; $ea25: 20 12 e1  
            lda $96            ; $ea28: a5 96     
            cmp #$11           ; $ea2a: c9 11     
            bcc __ea34         ; $ea2c: 90 06     
            lda $95            ; $ea2e: a5 95     
            sbc #$04           ; $ea30: e9 04     
            sta $95            ; $ea32: 85 95     
__ea34:     rts                ; $ea34: 60        

;-------------------------------------------------------------------------------
            jsr __e14d         ; $ea35: 20 4d e1  
            lda $96            ; $ea38: a5 96     
            cmp #$11           ; $ea3a: c9 11     
            bcc __ea40         ; $ea3c: 90 02     
            dec $94            ; $ea3e: c6 94     
__ea40:     rts                ; $ea40: 60        

;-------------------------------------------------------------------------------
            ldy $0560,x        ; $ea41: bc 60 05  
            lda $0064,y        ; $ea44: b9 64 00  
            bne __ea4e         ; $ea47: d0 05     
            lda #$04           ; $ea49: a9 04     
            sta $0480,x        ; $ea4b: 9d 80 04  
__ea4e:     lda $0062,y        ; $ea4e: b9 62 00  
            ldy #$00           ; $ea51: a0 00     
__ea53:     cmp __ea6a,y       ; $ea53: d9 6a ea  
            bcc __ea5d         ; $ea56: 90 05     
            iny                ; $ea58: c8        
            cpy #$02           ; $ea59: c0 02     
            bne __ea53         ; $ea5b: d0 f6     
__ea5d:     lda __ea6c,y       ; $ea5d: b9 6c ea  
            sta $0540,x        ; $ea60: 9d 40 05  
            lda __ea6f,y       ; $ea63: b9 6f ea  
            sta $04e0,x        ; $ea66: 9d e0 04  
            rts                ; $ea69: 60        

;-------------------------------------------------------------------------------
__ea6a:     .hex 08            ; $ea6a: 08            Data
__ea6b:     .hex 10            ; $ea6b: 10            Data
__ea6c:     .hex 3c 78 b4      ; $ea6c: 3c 78 b4      Data
__ea6f:     .hex 00 02 01      ; $ea6f: 00 02 01      Data

;-------------------------------------------------------------------------------
__ea72:     ldy #$02           ; $ea72: a0 02     
__ea74:     lda $0480,y        ; $ea74: b9 80 04  
            cmp #$02           ; $ea77: c9 02     
            bne __eaa6         ; $ea79: d0 2b     
            lda $0400,y        ; $ea7b: b9 00 04  
            sec                ; $ea7e: 38        
            sbc $0400,x        ; $ea7f: fd 00 04  
            clc                ; $ea82: 18        
            adc #$08           ; $ea83: 69 08     
            cmp #$11           ; $ea85: c9 11     
            bcs __eaa6         ; $ea87: b0 1d     
            lda $0440,y        ; $ea89: b9 40 04  
            sec                ; $ea8c: 38        
            sbc $0440,x        ; $ea8d: fd 40 04  
            clc                ; $ea90: 18        
            adc #$08           ; $ea91: 69 08     
            cmp #$11           ; $ea93: c9 11     
            bcs __eaa6         ; $ea95: b0 0f     
            lda #$06           ; $ea97: a9 06     
            sta $0480,x        ; $ea99: 9d 80 04  
            lda $40            ; $ea9c: a5 40     
            sta $0616          ; $ea9e: 8d 16 06  
            tya                ; $eaa1: 98        
            sta $05e0,x        ; $eaa2: 9d e0 05  
            rts                ; $eaa5: 60        

;-------------------------------------------------------------------------------
__eaa6:     iny                ; $eaa6: c8        
            cpy $55            ; $eaa7: c4 55     
            bne __ea74         ; $eaa9: d0 c9     
            rts                ; $eaab: 60        

;-------------------------------------------------------------------------------
            lda #$01           ; $eaac: a9 01     
            sta $9e            ; $eaae: 85 9e     
            lda $0580,x        ; $eab0: bd 80 05  
            beq __eab8         ; $eab3: f0 03     
            jsr __ea72         ; $eab5: 20 72 ea  
__eab8:     dec $0540,x        ; $eab8: de 40 05  
            bne __ead8         ; $eabb: d0 1b     
__eabd:     lda #$08           ; $eabd: a9 08     
            sta $0480,x        ; $eabf: 9d 80 04  
            lda #$08           ; $eac2: a9 08     
            sta $0540,x        ; $eac4: 9d 40 05  
            lda #$00           ; $eac7: a9 00     
            sta $05a0,x        ; $eac9: 9d a0 05  
            lda $40            ; $eacc: a5 40     
            sta $0612          ; $eace: 8d 12 06  
            sta $0613          ; $ead1: 8d 13 06  
            sta $0614          ; $ead4: 8d 14 06  
            rts                ; $ead7: 60        

;-------------------------------------------------------------------------------
__ead8:     ldy #$00           ; $ead8: a0 00     
            lda $0540,x        ; $eada: bd 40 05  
__eadd:     cmp __ea6c,y       ; $eadd: d9 6c ea  
            bcc __eae7         ; $eae0: 90 05     
            iny                ; $eae2: c8        
            cpy #$02           ; $eae3: c0 02     
            bne __eadd         ; $eae5: d0 f6     
__eae7:     lda __ea6f,y       ; $eae7: b9 6f ea  
            sta $04e0,x        ; $eaea: 9d e0 04  
            rts                ; $eaed: 60        

;-------------------------------------------------------------------------------
            ldy $05e0,x        ; $eaee: bc e0 05  
            lda $0480,y        ; $eaf1: b9 80 04  
            beq __eb2e         ; $eaf4: f0 38     
            lda #$01           ; $eaf6: a9 01     
            sta $9e            ; $eaf8: 85 9e     
            lda $04a0,y        ; $eafa: b9 a0 04  
            asl                ; $eafd: 0a        
            tay                ; $eafe: a8        
            lda __eb26,y       ; $eaff: b9 26 eb  
            sta $90            ; $eb02: 85 90     
            lda __eb27,y       ; $eb04: b9 27 eb  
            sta $91            ; $eb07: 85 91     
            ldy $05e0,x        ; $eb09: bc e0 05  
            lda $0400,y        ; $eb0c: b9 00 04  
            clc                ; $eb0f: 18        
            adc $90            ; $eb10: 65 90     
            sta $0400,x        ; $eb12: 9d 00 04  
            lda $0440,y        ; $eb15: b9 40 04  
            clc                ; $eb18: 18        
            adc $91            ; $eb19: 65 91     
            sta $0440,x        ; $eb1b: 9d 40 04  
            dec $0540,x        ; $eb1e: de 40 05  
            bne __ead8         ; $eb21: d0 b5     
            jmp __eabd         ; $eb23: 4c bd ea  

;-------------------------------------------------------------------------------
__eb26:     .hex 00            ; $eb26: 00            Data
__eb27:     .hex f4 f4 00 00   ; $eb27: f4 f4 00 00   Data
            .hex 0c 0c 00      ; $eb2b: 0c 0c 00      Data

;-------------------------------------------------------------------------------
__eb2e:     lda #$00           ; $eb2e: a9 00     
            sta $0480,x        ; $eb30: 9d 80 04  
__eb33:     rts                ; $eb33: 60        

;-------------------------------------------------------------------------------
            jsr __eb5b         ; $eb34: 20 5b eb  
            dec $0540,x        ; $eb37: de 40 05  
            bne __eb33         ; $eb3a: d0 f7     
            lda $05a0,x        ; $eb3c: bd a0 05  
            cmp #$02           ; $eb3f: c9 02     
            bcc __eb2e         ; $eb41: 90 eb     
            cmp #$04           ; $eb43: c9 04     
            bcc __eb49         ; $eb45: 90 02     
            lda #$03           ; $eb47: a9 03     
__eb49:     adc #$01           ; $eb49: 69 01     
            asl                ; $eb4b: 0a        
            asl                ; $eb4c: 0a        
            tay                ; $eb4d: a8        
            lda #$20           ; $eb4e: a9 20     
            sta $0540,x        ; $eb50: 9d 40 05  
            lda #$0a           ; $eb53: a9 0a     
            sta $0480,x        ; $eb55: 9d 80 04  
            jmp __cc35         ; $eb58: 4c 35 cc  

;-------------------------------------------------------------------------------
__eb5b:     jsr __ec1c         ; $eb5b: 20 1c ec  
            jsr __ecd3         ; $eb5e: 20 d3 ec  
            jsr __ed53         ; $eb61: 20 53 ed  
            ldy $0540,x        ; $eb64: bc 40 05  
            iny                ; $eb67: c8        
            sty $93            ; $eb68: 84 93     
            lda $0480,y        ; $eb6a: b9 80 04  
            cmp #$02           ; $eb6d: c9 02     
            bne __eba8         ; $eb6f: d0 37     
            lda $0580,x        ; $eb71: bd 80 05  
            bne __ebbf         ; $eb74: d0 49     
            lda $0400,y        ; $eb76: b9 00 04  
            sec                ; $eb79: 38        
            sbc $0400,x        ; $eb7a: fd 00 04  
            sta $90            ; $eb7d: 85 90     
            lda $0440,y        ; $eb7f: b9 40 04  
            sec                ; $eb82: 38        
            sbc $0440,x        ; $eb83: fd 40 04  
            sta $91            ; $eb86: 85 91     
            ldy $04c0,x        ; $eb88: bc c0 04  
            clc                ; $eb8b: 18        
            adc __ebdc,y       ; $eb8c: 79 dc eb  
            cmp __ebec,y       ; $eb8f: d9 ec eb  
            bcs __eba8         ; $eb92: b0 14     
            lda $91            ; $eb94: a5 91     
            clc                ; $eb96: 18        
            adc #$0f           ; $eb97: 69 0f     
            cmp #$1f           ; $eb99: c9 1f     
            bcs __eba9         ; $eb9b: b0 0c     
            lda $90            ; $eb9d: a5 90     
            clc                ; $eb9f: 18        
            adc __ebfc,y       ; $eba0: 79 fc eb  
            cmp __ec0c,y       ; $eba3: d9 0c ec  
            bcc __ebb2         ; $eba6: 90 0a     
__eba8:     rts                ; $eba8: 60        

;-------------------------------------------------------------------------------
__eba9:     lda $90            ; $eba9: a5 90     
            clc                ; $ebab: 18        
            adc #$0f           ; $ebac: 69 0f     
            cmp #$1f           ; $ebae: c9 1f     
            bcs __eba8         ; $ebb0: b0 f6     
__ebb2:     inc $05a0,x        ; $ebb2: fe a0 05  
            txa                ; $ebb5: 8a        
            tay                ; $ebb6: a8        
            ldx $93            ; $ebb7: a6 93     
            jsr __e59f         ; $ebb9: 20 9f e5  
            ldx $92            ; $ebbc: a6 92     
            rts                ; $ebbe: 60        

;-------------------------------------------------------------------------------
__ebbf:     lda $0400,y        ; $ebbf: b9 00 04  
            sec                ; $ebc2: 38        
            sbc $0400,x        ; $ebc3: fd 00 04  
            clc                ; $ebc6: 18        
            adc #$2b           ; $ebc7: 69 2b     
            cmp #$57           ; $ebc9: c9 57     
            bcs __ebdb         ; $ebcb: b0 0e     
            lda $0440,y        ; $ebcd: b9 40 04  
            sec                ; $ebd0: 38        
            sbc $0440,x        ; $ebd1: fd 40 04  
            clc                ; $ebd4: 18        
            adc #$2b           ; $ebd5: 69 2b     
            cmp #$57           ; $ebd7: c9 57     
            bcc __ebb2         ; $ebd9: 90 d7     
__ebdb:     rts                ; $ebdb: 60        

;-------------------------------------------------------------------------------
__ebdc:     .hex 2b 2b 0f 0f   ; $ebdc: 2b 2b 0f 0f   Data
            .hex 2b 2b 0f 0f   ; $ebe0: 2b 2b 0f 0f   Data
            .hex 2b 2b 0f 0f   ; $ebe4: 2b 2b 0f 0f   Data
            .hex 2b 2b 0f 0f   ; $ebe8: 2b 2b 0f 0f   Data
__ebec:     .hex 57 57 3b 3b   ; $ebec: 57 57 3b 3b   Data
            .hex 57 57 3b 3b   ; $ebf0: 57 57 3b 3b   Data
            .hex 3b 3b 1f 1f   ; $ebf4: 3b 3b 1f 1f   Data
            .hex 3b 3b 1f 1f   ; $ebf8: 3b 3b 1f 1f   Data
__ebfc:     .hex 2b 0f 2b 0f   ; $ebfc: 2b 0f 2b 0f   Data
            .hex 2b 0f 2b 0f   ; $ec00: 2b 0f 2b 0f   Data
            .hex 2b 0f 2b 0f   ; $ec04: 2b 0f 2b 0f   Data
            .hex 2b 0f 2b 0f   ; $ec08: 2b 0f 2b 0f   Data
__ec0c:     .hex 57 3b 57 3b   ; $ec0c: 57 3b 57 3b   Data
            .hex 3b 1f 3b 1f   ; $ec10: 3b 1f 3b 1f   Data
            .hex 57 3b 57 3b   ; $ec14: 57 3b 57 3b   Data
            .hex 3b 1f 3b 1f   ; $ec18: 3b 1f 3b 1f   Data

;-------------------------------------------------------------------------------
__ec1c:     ldy $0540,x        ; $ec1c: bc 40 05  
            dey                ; $ec1f: 88        
            cpy #$02           ; $ec20: c0 02     
            bcs __ec64         ; $ec22: b0 40     
            sty $93            ; $ec24: 84 93     
            lda $0480,y        ; $ec26: b9 80 04  
            cmp #$02           ; $ec29: c9 02     
            bne __ec64         ; $ec2b: d0 37     
            lda $0580,x        ; $ec2d: bd 80 05  
            bne __ec76         ; $ec30: d0 44     
            lda $0400,y        ; $ec32: b9 00 04  
            sec                ; $ec35: 38        
            sbc $0400,x        ; $ec36: fd 00 04  
            sta $90            ; $ec39: 85 90     
            lda $0440,y        ; $ec3b: b9 40 04  
            sec                ; $ec3e: 38        
            sbc $0440,x        ; $ec3f: fd 40 04  
            sta $91            ; $ec42: 85 91     
            ldy $04c0,x        ; $ec44: bc c0 04  
            clc                ; $ec47: 18        
            adc __ec93,y       ; $ec48: 79 93 ec  
            cmp __eca3,y       ; $ec4b: d9 a3 ec  
            bcs __ec64         ; $ec4e: b0 14     
            lda $91            ; $ec50: a5 91     
            clc                ; $ec52: 18        
            adc #$08           ; $ec53: 69 08     
            cmp #$11           ; $ec55: c9 11     
            bcs __ec65         ; $ec57: b0 0c     
            lda $90            ; $ec59: a5 90     
            clc                ; $ec5b: 18        
            adc __ecb3,y       ; $ec5c: 79 b3 ec  
            cmp __ecc3,y       ; $ec5f: d9 c3 ec  
            bcc __ec6e         ; $ec62: 90 0a     
__ec64:     rts                ; $ec64: 60        

;-------------------------------------------------------------------------------
__ec65:     lda $90            ; $ec65: a5 90     
            clc                ; $ec67: 18        
            adc #$08           ; $ec68: 69 08     
            cmp #$11           ; $ec6a: c9 11     
            bcs __ec64         ; $ec6c: b0 f6     
__ec6e:     inc $05a0,x        ; $ec6e: fe a0 05  
            ldy $93            ; $ec71: a4 93     
            jmp __eeab         ; $ec73: 4c ab ee  

;-------------------------------------------------------------------------------
__ec76:     lda $0400,y        ; $ec76: b9 00 04  
            sec                ; $ec79: 38        
            sbc $0400,x        ; $ec7a: fd 00 04  
            clc                ; $ec7d: 18        
            adc #$23           ; $ec7e: 69 23     
            cmp #$47           ; $ec80: c9 47     
            bcs __ec92         ; $ec82: b0 0e     
            lda $0440,y        ; $ec84: b9 40 04  
            sec                ; $ec87: 38        
            sbc $0440,x        ; $ec88: fd 40 04  
            clc                ; $ec8b: 18        
            adc #$23           ; $ec8c: 69 23     
            cmp #$47           ; $ec8e: c9 47     
            bcc __ec6e         ; $ec90: 90 dc     
__ec92:     rts                ; $ec92: 60        

;-------------------------------------------------------------------------------
__ec93:     .hex 23 23 08 08   ; $ec93: 23 23 08 08   Data
            .hex 23 23 08 08   ; $ec97: 23 23 08 08   Data
            .hex 23 23 08 08   ; $ec9b: 23 23 08 08   Data
            .hex 23 23 08 08   ; $ec9f: 23 23 08 08   Data
__eca3:     .hex 47 47 2c 2c   ; $eca3: 47 47 2c 2c   Data
            .hex 47 47 2c 2c   ; $eca7: 47 47 2c 2c   Data
            .hex 2c 2c 11 11   ; $ecab: 2c 2c 11 11   Data
            .hex 2c 2c 11 11   ; $ecaf: 2c 2c 11 11   Data
__ecb3:     .hex 23 08 23 08   ; $ecb3: 23 08 23 08   Data
            .hex 23 08 23 08   ; $ecb7: 23 08 23 08   Data
            .hex 23 08 23 08   ; $ecbb: 23 08 23 08   Data
            .hex 23 08 23 08   ; $ecbf: 23 08 23 08   Data
__ecc3:     .hex 47 2c 47 2c   ; $ecc3: 47 2c 47 2c   Data
            .hex 2c 11 2c 11   ; $ecc7: 2c 11 2c 11   Data
            .hex 47 2c 47 2c   ; $eccb: 47 2c 47 2c   Data
            .hex 2c 11 2c 11   ; $eccf: 2c 11 2c 11   Data

;-------------------------------------------------------------------------------
__ecd3:     lda $0540,x        ; $ecd3: bd 40 05  
            sbc #$03           ; $ecd6: e9 03     
            cmp #$04           ; $ecd8: c9 04     
            bcs __ed1f         ; $ecda: b0 43     
            adc #$09           ; $ecdc: 69 09     
            tay                ; $ecde: a8        
            sty $93            ; $ecdf: 84 93     
            lda $0480,y        ; $ece1: b9 80 04  
            cmp #$02           ; $ece4: c9 02     
            bne __ed1f         ; $ece6: d0 37     
            lda $0580,x        ; $ece8: bd 80 05  
            bne __ed36         ; $eceb: d0 49     
            lda $0400,y        ; $eced: b9 00 04  
            sec                ; $ecf0: 38        
            sbc $0400,x        ; $ecf1: fd 00 04  
            sta $90            ; $ecf4: 85 90     
            lda $0440,y        ; $ecf6: b9 40 04  
            sec                ; $ecf9: 38        
            sbc $0440,x        ; $ecfa: fd 40 04  
            sta $91            ; $ecfd: 85 91     
            ldy $04c0,x        ; $ecff: bc c0 04  
            clc                ; $ed02: 18        
            adc __ebdc,y       ; $ed03: 79 dc eb  
            cmp __ebec,y       ; $ed06: d9 ec eb  
            bcs __ed1f         ; $ed09: b0 14     
            lda $91            ; $ed0b: a5 91     
            clc                ; $ed0d: 18        
            adc #$0f           ; $ed0e: 69 0f     
            cmp #$1f           ; $ed10: c9 1f     
            bcs __ed20         ; $ed12: b0 0c     
            lda $90            ; $ed14: a5 90     
            clc                ; $ed16: 18        
            adc __ebfc,y       ; $ed17: 79 fc eb  
            cmp __ec0c,y       ; $ed1a: d9 0c ec  
            bcc __ed29         ; $ed1d: 90 0a     
__ed1f:     rts                ; $ed1f: 60        

;-------------------------------------------------------------------------------
__ed20:     lda $90            ; $ed20: a5 90     
            clc                ; $ed22: 18        
            adc #$0f           ; $ed23: 69 0f     
            cmp #$1f           ; $ed25: c9 1f     
            bcs __ed1f         ; $ed27: b0 f6     
__ed29:     inc $05a0,x        ; $ed29: fe a0 05  
            txa                ; $ed2c: 8a        
            tay                ; $ed2d: a8        
            ldx $93            ; $ed2e: a6 93     
            jsr __f040         ; $ed30: 20 40 f0  
            ldx $92            ; $ed33: a6 92     
            rts                ; $ed35: 60        

;-------------------------------------------------------------------------------
__ed36:     lda $0400,y        ; $ed36: b9 00 04  
            sec                ; $ed39: 38        
            sbc $0400,x        ; $ed3a: fd 00 04  
            clc                ; $ed3d: 18        
            adc #$2b           ; $ed3e: 69 2b     
            cmp #$57           ; $ed40: c9 57     
            bcs __ed52         ; $ed42: b0 0e     
            lda $0440,y        ; $ed44: b9 40 04  
            sec                ; $ed47: 38        
            sbc $0440,x        ; $ed48: fd 40 04  
            clc                ; $ed4b: 18        
            adc #$2b           ; $ed4c: 69 2b     
            cmp #$57           ; $ed4e: c9 57     
            bcc __ed29         ; $ed50: 90 d7     
__ed52:     rts                ; $ed52: 60        

;-------------------------------------------------------------------------------
__ed53:     lda $0540,x        ; $ed53: bd 40 05  
            cmp #$07           ; $ed56: c9 07     
            bne __ed9e         ; $ed58: d0 44     
            ldy #$0e           ; $ed5a: a0 0e     
            sty $93            ; $ed5c: 84 93     
            lda $0480,y        ; $ed5e: b9 80 04  
            beq __ed9e         ; $ed61: f0 3b     
            cmp #$02           ; $ed63: c9 02     
            bne __ed9e         ; $ed65: d0 37     
            lda $0580,x        ; $ed67: bd 80 05  
            bne __edb0         ; $ed6a: d0 44     
            lda $0400,y        ; $ed6c: b9 00 04  
            sec                ; $ed6f: 38        
            sbc $0400,x        ; $ed70: fd 00 04  
            sta $90            ; $ed73: 85 90     
            lda $0440,y        ; $ed75: b9 40 04  
            sec                ; $ed78: 38        
            sbc $0440,x        ; $ed79: fd 40 04  
            sta $91            ; $ed7c: 85 91     
            ldy $04c0,x        ; $ed7e: bc c0 04  
            clc                ; $ed81: 18        
            adc __ebdc,y       ; $ed82: 79 dc eb  
            cmp __ebec,y       ; $ed85: d9 ec eb  
            bcs __ed9e         ; $ed88: b0 14     
            lda $91            ; $ed8a: a5 91     
            clc                ; $ed8c: 18        
            adc #$0f           ; $ed8d: 69 0f     
            cmp #$1f           ; $ed8f: c9 1f     
            bcs __ed9f         ; $ed91: b0 0c     
            lda $90            ; $ed93: a5 90     
            clc                ; $ed95: 18        
            adc __ebfc,y       ; $ed96: 79 fc eb  
            cmp __ec0c,y       ; $ed99: d9 0c ec  
            bcc __eda8         ; $ed9c: 90 0a     
__ed9e:     rts                ; $ed9e: 60        

;-------------------------------------------------------------------------------
__ed9f:     lda $90            ; $ed9f: a5 90     
            clc                ; $eda1: 18        
            adc #$0f           ; $eda2: 69 0f     
            cmp #$1f           ; $eda4: c9 1f     
            bcs __ed9e         ; $eda6: b0 f6     

;-------------------------------------------------------------------------------
__eda8:     ldy $93            ; $eda8: a4 93     
            lda #$04           ; $edaa: a9 04     
            sta $0480,y        ; $edac: 99 80 04  
            rts                ; $edaf: 60        

;-------------------------------------------------------------------------------
__edb0:     lda $0400,y        ; $edb0: b9 00 04  
            sec                ; $edb3: 38        
            sbc $0400,x        ; $edb4: fd 00 04  
            clc                ; $edb7: 18        
            adc #$2b           ; $edb8: 69 2b     
            cmp #$57           ; $edba: c9 57     
            bcs __edcc         ; $edbc: b0 0e     
            lda $0440,y        ; $edbe: b9 40 04  
            sec                ; $edc1: 38        
            sbc $0440,x        ; $edc2: fd 40 04  
            clc                ; $edc5: 18        
            adc #$2b           ; $edc6: 69 2b     
            cmp #$57           ; $edc8: c9 57     
            bcc __eda8         ; $edca: 90 dc     
__edcc:     rts                ; $edcc: 60        

;-------------------------------------------------------------------------------
            dec $0540,x        ; $edcd: de 40 05  
            bne __edd7         ; $edd0: d0 05     
            lda #$00           ; $edd2: a9 00     
            sta $0480,x        ; $edd4: 9d 80 04  
__edd7:     rts                ; $edd7: 60        

;-------------------------------------------------------------------------------
__edd8:     lda #$01           ; $edd8: a9 01     
            sta $07c3          ; $edda: 8d c3 07  
            lda #$02           ; $eddd: a9 02     
            sta $54            ; $eddf: 85 54     
            ldx #$14           ; $ede1: a2 14     
            lda #$00           ; $ede3: a9 00     
__ede5:     sta $04c0,x        ; $ede5: 9d c0 04  
            sta $04e0,x        ; $ede8: 9d e0 04  
            sta $0480,x        ; $edeb: 9d 80 04  
            inx                ; $edee: e8        
            cpx #$18           ; $edef: e0 18     
            bne __ede5         ; $edf1: d0 f2     
            rts                ; $edf3: 60        

;-------------------------------------------------------------------------------
__edf4:     ldx #$14           ; $edf4: a2 14     
__edf6:     jsr __edff         ; $edf6: 20 ff ed  
            inx                ; $edf9: e8        
            cpx #$18           ; $edfa: e0 18     
            bne __edf6         ; $edfc: d0 f8     
            rts                ; $edfe: 60        

;-------------------------------------------------------------------------------
__edff:     ldy $0480,x        ; $edff: bc 80 04  
            lda __ee0f,y       ; $ee02: b9 0f ee  
            sta $90            ; $ee05: 85 90     
            lda __ee10,y       ; $ee07: b9 10 ee  
            sta $91            ; $ee0a: 85 91     
            jmp ($0090)        ; $ee0c: 6c 90 00  

;-------------------------------------------------------------------------------
__ee0f:     .hex 13            ; $ee0f: 13            Data
__ee10:     .hex ee 38 ef      ; $ee10: ee 38 ef      Data

;-------------------------------------------------------------------------------
            lda $07d3          ; $ee13: ad d3 07  
            beq __ee37         ; $ee16: f0 1f     
            stx $95            ; $ee18: 86 95     
            jsr __c133         ; $ee1a: 20 33 c1  
            and $bd            ; $ee1d: 25 bd     
            tax                ; $ee1f: aa        
            lda $0480,x        ; $ee20: bd 80 04  
            cmp #$02           ; $ee23: c9 02     
            bne __ee35         ; $ee25: d0 0e     
            jsr __ee38         ; $ee27: 20 38 ee  
            ldy $54            ; $ee2a: a4 54     
            iny                ; $ee2c: c8        
            cpy $55            ; $ee2d: c4 55     
            bcc __ee33         ; $ee2f: 90 02     
            ldy #$02           ; $ee31: a0 02     
__ee33:     sty $54            ; $ee33: 84 54     
__ee35:     ldx $95            ; $ee35: a6 95     
__ee37:     rts                ; $ee37: 60        

;-------------------------------------------------------------------------------
__ee38:     ldy $54            ; $ee38: a4 54     
            lda $0480,y        ; $ee3a: b9 80 04  
            cmp #$02           ; $ee3d: c9 02     
            bne __ee37         ; $ee3f: d0 f6     
            jsr __eefb         ; $ee41: 20 fb ee  
            lda $90            ; $ee44: a5 90     
            beq __ee37         ; $ee46: f0 ef     
            cmp #$03           ; $ee48: c9 03     
            beq __ee37         ; $ee4a: f0 eb     
            jsr __ef1c         ; $ee4c: 20 1c ef  
            ldx $95            ; $ee4f: a6 95     
            sta $04a0,x        ; $ee51: 9d a0 04  
            lda $71            ; $ee54: a5 71     
            beq __ee6d         ; $ee56: f0 15     
            ldy $70            ; $ee58: a4 70     
            lda __db20,y       ; $ee5a: b9 20 db  
            clc                ; $ee5d: 18        
            adc #$40           ; $ee5e: 69 40     
            sta $0520,x        ; $ee60: 9d 20 05  
            lda __db15,y       ; $ee63: b9 15 db  
            adc #$00           ; $ee66: 69 00     
            sta $0500,x        ; $ee68: 9d 00 05  
            ldy $54            ; $ee6b: a4 54     
__ee6d:     lda #$02           ; $ee6d: a9 02     
            sta $0480,x        ; $ee6f: 9d 80 04  
            lda #$00           ; $ee72: a9 00     
            sta $07d3          ; $ee74: 8d d3 07  
            jsr __e2bc         ; $ee77: 20 bc e2  
__ee7a:     jsr __eec2         ; $ee7a: 20 c2 ee  
            ldy #$00           ; $ee7d: a0 00     
            jsr __ee83         ; $ee7f: 20 83 ee  
            iny                ; $ee82: c8        
__ee83:     lda $0480,y        ; $ee83: b9 80 04  
            cmp #$02           ; $ee86: c9 02     
            bne __eec1         ; $ee88: d0 37     
            lda $0400,x        ; $ee8a: bd 00 04  
            sec                ; $ee8d: 38        
            sbc $0400,y        ; $ee8e: f9 00 04  
            clc                ; $ee91: 18        
            adc #$04           ; $ee92: 69 04     
            cmp #$11           ; $ee94: c9 11     
            bcs __eec1         ; $ee96: b0 29     
            lda $0440,x        ; $ee98: bd 40 04  
            sec                ; $ee9b: 38        
            sbc $0440,y        ; $ee9c: f9 40 04  
            clc                ; $ee9f: 18        
            adc #$04           ; $eea0: 69 04     
            cmp #$11           ; $eea2: c9 11     
            bcs __eec1         ; $eea4: b0 1b     
            lda #$00           ; $eea6: a9 00     
            sta $0480,x        ; $eea8: 9d 80 04  
__eeab:     lda $4e            ; $eeab: a5 4e     
            bne __eec1         ; $eead: d0 12     
            lda #$04           ; $eeaf: a9 04     
            sta $0480,y        ; $eeb1: 99 80 04  
            lda #$00           ; $eeb4: a9 00     
            sta $0540,y        ; $eeb6: 99 40 05  
            lda $40            ; $eeb9: a5 40     
            sta $0601          ; $eebb: 8d 01 06  
            sta $0602          ; $eebe: 8d 02 06  
__eec1:     rts                ; $eec1: 60        

;-------------------------------------------------------------------------------
__eec2:     lda $50            ; $eec2: a5 50     
            bne __eed0         ; $eec4: d0 0a     
            ldy #$10           ; $eec6: a0 10     
__eec8:     jsr __eed1         ; $eec8: 20 d1 ee  
            iny                ; $eecb: c8        
            cpy #$14           ; $eecc: c0 14     
            bne __eec8         ; $eece: d0 f8     
__eed0:     rts                ; $eed0: 60        

;-------------------------------------------------------------------------------
__eed1:     lda $0480,y        ; $eed1: b9 80 04  
            beq __eefa         ; $eed4: f0 24     
            lda $0400,x        ; $eed6: bd 00 04  
            sec                ; $eed9: 38        
            sbc $0400,y        ; $eeda: f9 00 04  
            clc                ; $eedd: 18        
            adc #$04           ; $eede: 69 04     
            cmp #$09           ; $eee0: c9 09     
            bcs __eefa         ; $eee2: b0 16     
            lda $0440,x        ; $eee4: bd 40 04  
            sec                ; $eee7: 38        
            sbc $0440,y        ; $eee8: f9 40 04  
            clc                ; $eeeb: 18        
            adc #$04           ; $eeec: 69 04     
            cmp #$09           ; $eeee: c9 09     
            bcs __eefa         ; $eef0: b0 08     
            lda #$00           ; $eef2: a9 00     
            sta $0480,y        ; $eef4: 99 80 04  
            sta $0480,x        ; $eef7: 9d 80 04  
__eefa:     rts                ; $eefa: 60        

;-------------------------------------------------------------------------------
__eefb:     lda #$00           ; $eefb: a9 00     
            sta $90            ; $eefd: 85 90     
            lda $0400,y        ; $eeff: b9 00 04  
            sec                ; $ef02: 38        
            sbc $0400,x        ; $ef03: fd 00 04  
            clc                ; $ef06: 18        
            adc #$20           ; $ef07: 69 20     
            cmp #$41           ; $ef09: c9 41     
            rol $90            ; $ef0b: 26 90     
            lda $0440,y        ; $ef0d: b9 40 04  
            sec                ; $ef10: 38        
            sbc $0440,x        ; $ef11: fd 40 04  
            clc                ; $ef14: 18        
            adc #$20           ; $ef15: 69 20     
            cmp #$41           ; $ef17: c9 41     
            rol $90            ; $ef19: 26 90     
            rts                ; $ef1b: 60        

;-------------------------------------------------------------------------------
__ef1c:     dec $90            ; $ef1c: c6 90     
            beq __ef2d         ; $ef1e: f0 0d     
            lda $0400,y        ; $ef20: b9 00 04  
            cmp $0400,x        ; $ef23: dd 00 04  
            lda $90            ; $ef26: a5 90     
            bcc __ef37         ; $ef28: 90 0d     
__ef2a:     adc #$01           ; $ef2a: 69 01     
            rts                ; $ef2c: 60        

;-------------------------------------------------------------------------------
__ef2d:     lda $0440,y        ; $ef2d: b9 40 04  
            cmp $0440,x        ; $ef30: dd 40 04  
            lda $90            ; $ef33: a5 90     
            bcs __ef2a         ; $ef35: b0 f3     
__ef37:     rts                ; $ef37: 60        

;-------------------------------------------------------------------------------
            lda $04a0,x        ; $ef38: bd a0 04  
            ldy #$02           ; $ef3b: a0 02     
            jsr __c201         ; $ef3d: 20 01 c2  
            lda $92            ; $ef40: a5 92     
            bmi __ef47         ; $ef42: 30 03     
            jmp __ee7a         ; $ef44: 4c 7a ee  

;-------------------------------------------------------------------------------
__ef47:     lda #$00           ; $ef47: a9 00     
            sta $0480,x        ; $ef49: 9d 80 04  
            rts                ; $ef4c: 60        

;-------------------------------------------------------------------------------
__ef4d:     ldx #$0a           ; $ef4d: a2 0a     
            ldy $70            ; $ef4f: a4 70     
__ef51:     lda #$00           ; $ef51: a9 00     
            sta $04c0,x        ; $ef53: 9d c0 04  
            sta $04e0,x        ; $ef56: 9d e0 04  
            sta $0480,x        ; $ef59: 9d 80 04  
            lda $50            ; $ef5c: a5 50     
            bne __ef62         ; $ef5e: d0 02     
            lda #$10           ; $ef60: a9 10     
__ef62:     clc                ; $ef62: 18        
            adc #$10           ; $ef63: 69 10     
            adc __db36,y       ; $ef65: 79 36 db  
            sta $0520,x        ; $ef68: 9d 20 05  
            lda #$00           ; $ef6b: a9 00     
            adc __db2b,y       ; $ef6d: 79 2b db  
            sta $0500,x        ; $ef70: 9d 00 05  
            inx                ; $ef73: e8        
            cpx #$0e           ; $ef74: e0 0e     
            bne __ef51         ; $ef76: d0 d9     
            rts                ; $ef78: 60        

;-------------------------------------------------------------------------------
__ef79:     lda #$00           ; $ef79: a9 00     
            sta $9e            ; $ef7b: 85 9e     
            sta $9d            ; $ef7d: 85 9d     
            ldx #$0a           ; $ef7f: a2 0a     
__ef81:     stx $9f            ; $ef81: 86 9f     
            jsr __efba         ; $ef83: 20 ba ef  
            ldx $9f            ; $ef86: a6 9f     
            inx                ; $ef88: e8        
            cpx #$0e           ; $ef89: e0 0e     
            bne __ef81         ; $ef8b: d0 f4     
            jsr __efa5         ; $ef8d: 20 a5 ef  
            lda $9e            ; $ef90: a5 9e     
            beq __ef9f         ; $ef92: f0 0b     
            lda $061b          ; $ef94: ad 1b 06  
            bne __ef9e         ; $ef97: d0 05     
            lda $40            ; $ef99: a5 40     
            sta $061b          ; $ef9b: 8d 1b 06  
__ef9e:     rts                ; $ef9e: 60        

;-------------------------------------------------------------------------------
__ef9f:     lda #$00           ; $ef9f: a9 00     
            sta $061b          ; $efa1: 8d 1b 06  
            rts                ; $efa4: 60        

;-------------------------------------------------------------------------------
__efa5:     lda $9d            ; $efa5: a5 9d     
            beq __efb4         ; $efa7: f0 0b     
            lda $0619          ; $efa9: ad 19 06  
            bne __efb3         ; $efac: d0 05     
            lda $40            ; $efae: a5 40     
            sta $0619          ; $efb0: 8d 19 06  
__efb3:     rts                ; $efb3: 60        

;-------------------------------------------------------------------------------
__efb4:     lda #$00           ; $efb4: a9 00     
            sta $0619          ; $efb6: 8d 19 06  
            rts                ; $efb9: 60        

;-------------------------------------------------------------------------------
__efba:     ldy $0480,x        ; $efba: bc 80 04  
            lda __efca,y       ; $efbd: b9 ca ef  
            sta $90            ; $efc0: 85 90     
            lda __efcb,y       ; $efc2: b9 cb ef  
            sta $91            ; $efc5: 85 91     
            jmp ($0090)        ; $efc7: 6c 90 00  

;-------------------------------------------------------------------------------
__efca:     .hex 78            ; $efca: 78            Data
__efcb:     .hex c4 6e f0 8b   ; $efcb: c4 6e f0 8b   Data
            .hex f0 9b f0 66   ; $efcf: f0 9b f0 66   Data
            .hex e8            ; $efd3: e8            Data

;-------------------------------------------------------------------------------
__efd4:     jsr __f006         ; $efd4: 20 06 f0  
            ldy #$00           ; $efd7: a0 00     
            jsr __efdd         ; $efd9: 20 dd ef  
            iny                ; $efdc: c8        
__efdd:     lda $0480,y        ; $efdd: b9 80 04  
            cmp #$02           ; $efe0: c9 02     
            bne __f014         ; $efe2: d0 30     
            lda $0400,y        ; $efe4: b9 00 04  
            sec                ; $efe7: 38        
            sbc $0400,x        ; $efe8: fd 00 04  
            clc                ; $efeb: 18        
            adc #$04           ; $efec: 69 04     
            cmp #$11           ; $efee: c9 11     
            bcs __f014         ; $eff0: b0 22     
            lda $0440,y        ; $eff2: b9 40 04  
            sec                ; $eff5: 38        
            sbc $0440,x        ; $eff6: fd 40 04  
            clc                ; $eff9: 18        
            adc #$04           ; $effa: 69 04     
            cmp #$11           ; $effc: c9 11     
            bcs __f014         ; $effe: b0 14     
            jsr __eeab         ; $f000: 20 ab ee  
            jmp __f040         ; $f003: 4c 40 f0  

;-------------------------------------------------------------------------------
__f006:     lda $50            ; $f006: a5 50     
            bne __f014         ; $f008: d0 0a     
            ldy #$10           ; $f00a: a0 10     
__f00c:     jsr __f015         ; $f00c: 20 15 f0  
            iny                ; $f00f: c8        
            cpy #$14           ; $f010: c0 14     
            bne __f00c         ; $f012: d0 f8     
__f014:     rts                ; $f014: 60        

;-------------------------------------------------------------------------------
__f015:     lda $0480,y        ; $f015: b9 80 04  
            beq __f014         ; $f018: f0 fa     
            lda $0480,x        ; $f01a: bd 80 04  
            cmp #$02           ; $f01d: c9 02     
            bne __f014         ; $f01f: d0 f3     
            lda $0400,y        ; $f021: b9 00 04  
            sec                ; $f024: 38        
            sbc $0400,x        ; $f025: fd 00 04  
            clc                ; $f028: 18        
            adc #$04           ; $f029: 69 04     
            cmp #$11           ; $f02b: c9 11     
            bcs __f014         ; $f02d: b0 e5     
            lda $0440,y        ; $f02f: b9 40 04  
            sec                ; $f032: 38        
            sbc $0440,x        ; $f033: fd 40 04  
            clc                ; $f036: 18        
            adc #$04           ; $f037: 69 04     
            cmp #$11           ; $f039: c9 11     
            bcs __f014         ; $f03b: b0 d7     
            jsr __e5d2         ; $f03d: 20 d2 e5  
__f040:     lda #$04           ; $f040: a9 04     
            sta $0480,x        ; $f042: 9d 80 04  
            lda #$08           ; $f045: a9 08     
            sta $0540,x        ; $f047: 9d 40 05  
            lda $40            ; $f04a: a5 40     
            sta $061a          ; $f04c: 8d 1a 06  
            jsr __cc21         ; $f04f: 20 21 cc  
            lda $05e0,x        ; $f052: bd e0 05  
            beq __f014         ; $f055: f0 bd     
            lda $0560,y        ; $f057: b9 60 05  
            bne __f065         ; $f05a: d0 09     
            lda $05e0,x        ; $f05c: bd e0 05  
            sec                ; $f05f: 38        
            sbc #$01           ; $f060: e9 01     
            jmp __d1b1         ; $f062: 4c b1 d1  

;-------------------------------------------------------------------------------
__f065:     lda $05e0,x        ; $f065: bd e0 05  
            clc                ; $f068: 18        
            adc #$7f           ; $f069: 69 7f     
            jmp __d1b1         ; $f06b: 4c b1 d1  

;-------------------------------------------------------------------------------
            ldy #$9e           ; $f06e: a0 9e     
            lda $05e0,x        ; $f070: bd e0 05  
            beq __f077         ; $f073: f0 02     
            ldy #$9d           ; $f075: a0 9d     
__f077:     lda #$01           ; $f077: a9 01     
            sta $0000,y        ; $f079: 99 00 00  
            lda $04a0,x        ; $f07c: bd a0 04  
            ldy #$00           ; $f07f: a0 00     
            jsr __c201         ; $f081: 20 01 c2  
            lda $92            ; $f084: a5 92     
            bmi __f0a0         ; $f086: 30 18     
            jmp __efd4         ; $f088: 4c d4 ef  

;-------------------------------------------------------------------------------
            dec $0540,x        ; $f08b: de 40 05  
            bne __f09a         ; $f08e: d0 0a     
            lda #$06           ; $f090: a9 06     
            sta $0480,x        ; $f092: 9d 80 04  
            lda #$10           ; $f095: a9 10     
            sta $0540,x        ; $f097: 9d 40 05  
__f09a:     rts                ; $f09a: 60        

;-------------------------------------------------------------------------------
            dec $0540,x        ; $f09b: de 40 05  
            bne __f0a5         ; $f09e: d0 05     
__f0a0:     lda #$00           ; $f0a0: a9 00     
            sta $0480,x        ; $f0a2: 9d 80 04  
__f0a5:     rts                ; $f0a5: 60        

;-------------------------------------------------------------------------------
__f0a6:     lda #$0f           ; $f0a6: a9 0f     
            sta $4015          ; $f0a8: 8d 15 40  
            lda #$c0           ; $f0ab: a9 c0     
            sta $4017          ; $f0ad: 8d 17 40  
            lda #$25           ; $f0b0: a9 25     
            sta $e0            ; $f0b2: 85 e0     
            lda #$06           ; $f0b4: a9 06     
            sta $e1            ; $f0b6: 85 e1     
            ldx #$00           ; $f0b8: a2 00     
            ldy #$00           ; $f0ba: a0 00     
__f0bc:     tya                ; $f0bc: 98        
            sta ($e0),y        ; $f0bd: 91 e0     
            sta $0600,x        ; $f0bf: 9d 00 06  
            lda __f3ec,x       ; $f0c2: bd ec f3  
            sta $074d,x        ; $f0c5: 9d 4d 07  
            clc                ; $f0c8: 18        
            lda $e0            ; $f0c9: a5 e0     
            adc #$08           ; $f0cb: 69 08     
            sta $e0            ; $f0cd: 85 e0     
            bcc __f0d3         ; $f0cf: 90 02     
            inc $e1            ; $f0d1: e6 e1     
__f0d3:     inx                ; $f0d3: e8        
            cpx #$25           ; $f0d4: e0 25     
            bne __f0bc         ; $f0d6: d0 e4     
            rts                ; $f0d8: 60        

;-------------------------------------------------------------------------------
__f0d9:     lda $03            ; $f0d9: a5 03     
            bne __f0e3         ; $f0db: d0 06     
            lda #$25           ; $f0dd: a9 25     
            sta $e5            ; $f0df: 85 e5     
            bpl __f0e7         ; $f0e1: 10 04     

;-------------------------------------------------------------------------------
__f0e3:     lda #$01           ; $f0e3: a9 01     
            sta $e5            ; $f0e5: 85 e5     

;-------------------------------------------------------------------------------
__f0e7:     lda #$00           ; $f0e7: a9 00     
            ldx #$03           ; $f0e9: a2 03     
__f0eb:     sta $f9,x          ; $f0eb: 95 f9     
            dex                ; $f0ed: ca        
            bpl __f0eb         ; $f0ee: 10 fb     
            lda #$00           ; $f0f0: a9 00     
            sta $e4            ; $f0f2: 85 e4     
            lda #$25           ; $f0f4: a9 25     
            sta $e0            ; $f0f6: 85 e0     
            lda #$06           ; $f0f8: a9 06     
            sta $e1            ; $f0fa: 85 e1     
__f0fc:     ldx $e4            ; $f0fc: a6 e4     
            lda $0600,x        ; $f0fe: bd 00 06  
            beq __f13e         ; $f101: f0 3b     
            ldy #$00           ; $f103: a0 00     
            lda ($e0),y        ; $f105: b1 e0     
            beq __f13e         ; $f107: f0 35     
            cmp #$05           ; $f109: c9 05     
            bcc __f118         ; $f10b: 90 0b     
            sec                ; $f10d: 38        
            sbc #$05           ; $f10e: e9 05     
            tax                ; $f110: aa        
            lda #$01           ; $f111: a9 01     
            sta $f9,x          ; $f113: 95 f9     
            jmp __f13e         ; $f115: 4c 3e f1  

;-------------------------------------------------------------------------------
__f118:     tax                ; $f118: aa        
            dex                ; $f119: ca        
            lda $f9,x          ; $f11a: b5 f9     
            bne __f13e         ; $f11c: d0 20     
            lda #$01           ; $f11e: a9 01     
            sta $f9,x          ; $f120: 95 f9     
            txa                ; $f122: 8a        
            tay                ; $f123: a8        
            clc                ; $f124: 18        
            adc #$05           ; $f125: 69 05     
            ldy #$00           ; $f127: a0 00     
            sta ($e0),y        ; $f129: 91 e0     
            txa                ; $f12b: 8a        
            asl                ; $f12c: 0a        
            asl                ; $f12d: 0a        
            tax                ; $f12e: aa        
            lda #$04           ; $f12f: a9 04     
            sta $e6            ; $f131: 85 e6     
__f133:     iny                ; $f133: c8        
            lda ($e0),y        ; $f134: b1 e0     
            sta $4000,x        ; $f136: 9d 00 40  
            inx                ; $f139: e8        
            dec $e6            ; $f13a: c6 e6     
            bne __f133         ; $f13c: d0 f5     
__f13e:     clc                ; $f13e: 18        
            lda $e0            ; $f13f: a5 e0     
            adc #$08           ; $f141: 69 08     
            sta $e0            ; $f143: 85 e0     
            bcc __f149         ; $f145: 90 02     
            inc $e1            ; $f147: e6 e1     
__f149:     inc $e4            ; $f149: e6 e4     
            lda $e4            ; $f14b: a5 e4     
            cmp $e5            ; $f14d: c5 e5     
            bcc __f0fc         ; $f14f: 90 ab     
            ldx #$00           ; $f151: a2 00     
__f153:     stx $e6            ; $f153: 86 e6     
            lda $f9,x          ; $f155: b5 f9     
            bne __f165         ; $f157: d0 0c     
            txa                ; $f159: 8a        
            asl                ; $f15a: 0a        
            asl                ; $f15b: 0a        
            tax                ; $f15c: aa        
            asl                ; $f15d: 0a        
            and #$10           ; $f15e: 29 10     
            eor #$10           ; $f160: 49 10     
            sta $4000,x        ; $f162: 9d 00 40  
__f165:     ldx $e6            ; $f165: a6 e6     
            inx                ; $f167: e8        
            cpx #$04           ; $f168: e0 04     
            bcc __f153         ; $f16a: 90 e7     
            ldy #$00           ; $f16c: a0 00     
            sty $e4            ; $f16e: 84 e4     
            lda #$25           ; $f170: a9 25     
            sta $e0            ; $f172: 85 e0     
            lda #$06           ; $f174: a9 06     
            sta $e1            ; $f176: 85 e1     
__f178:     ldx $e4            ; $f178: a6 e4     
            lda $0600,x        ; $f17a: bd 00 06  
            beq __f189         ; $f17d: f0 0a     
            cmp #$01           ; $f17f: c9 01     
            bne __f19d         ; $f181: d0 1a     
            inc $0600,x        ; $f183: fe 00 06  
            jmp __f1aa         ; $f186: 4c aa f1  

;-------------------------------------------------------------------------------
__f189:     clc                ; $f189: 18        
            lda $e0            ; $f18a: a5 e0     
            adc #$08           ; $f18c: 69 08     
            sta $e0            ; $f18e: 85 e0     
            bcc __f194         ; $f190: 90 02     
            inc $e1            ; $f192: e6 e1     
__f194:     inc $e4            ; $f194: e6 e4     
            lda $e4            ; $f196: a5 e4     
            cmp $e5            ; $f198: c5 e5     
            bcc __f178         ; $f19a: 90 dc     
            rts                ; $f19c: 60        

;-------------------------------------------------------------------------------
__f19d:     ldy #$07           ; $f19d: a0 07     
            lda ($e0),y        ; $f19f: b1 e0     
            sec                ; $f1a1: 38        
            sbc #$01           ; $f1a2: e9 01     
            sta ($e0),y        ; $f1a4: 91 e0     
            beq __f1e0         ; $f1a6: f0 38     
            bne __f189         ; $f1a8: d0 df     
__f1aa:     lda #$00           ; $f1aa: a9 00     
            ldy #$05           ; $f1ac: a0 05     
            sta ($e0),y        ; $f1ae: 91 e0     
            jsr __f353         ; $f1b0: 20 53 f3  
            jsr __f362         ; $f1b3: 20 62 f3  
            ldy #$00           ; $f1b6: a0 00     
            sta ($e0),y        ; $f1b8: 91 e0     
            jsr __f362         ; $f1ba: 20 62 f3  
            ldy #$01           ; $f1bd: a0 01     
            sta ($e0),y        ; $f1bf: 91 e0     
            jsr __f362         ; $f1c1: 20 62 f3  
            ldy #$02           ; $f1c4: a0 02     
            sta ($e0),y        ; $f1c6: 91 e0     
            jsr __f362         ; $f1c8: 20 62 f3  
            ldy #$04           ; $f1cb: a0 04     
            sta ($e0),y        ; $f1cd: 91 e0     
            ldy #$00           ; $f1cf: a0 00     
            lda ($e0),y        ; $f1d1: b1 e0     
            cmp #$04           ; $f1d3: c9 04     
            bne __f1e3         ; $f1d5: d0 0c     
            jsr __f362         ; $f1d7: 20 62 f3  
            ldy #$03           ; $f1da: a0 03     
            sta ($e0),y        ; $f1dc: 91 e0     
            bpl __f1e3         ; $f1de: 10 03     
__f1e0:     jsr __f353         ; $f1e0: 20 53 f3  
__f1e3:     jsr __f362         ; $f1e3: 20 62 f3  
            cmp #$e8           ; $f1e6: c9 e8     
            bcs __f255         ; $f1e8: b0 6b     
            cmp #$60           ; $f1ea: c9 60     
            beq __f232         ; $f1ec: f0 44     
            bcc __f1f9         ; $f1ee: 90 09     
            sbc #$60           ; $f1f0: e9 60     
            ldy #$06           ; $f1f2: a0 06     
            sta ($e0),y        ; $f1f4: 91 e0     
            jmp __f1e3         ; $f1f6: 4c e3 f1  

;-------------------------------------------------------------------------------
__f1f9:     pha                ; $f1f9: 48        
            and #$f8           ; $f1fa: 29 f8     
            lsr                ; $f1fc: 4a        
            lsr                ; $f1fd: 4a        
            tax                ; $f1fe: aa        
            lda __f38a,x       ; $f1ff: bd 8a f3  
            sta $e6            ; $f202: 85 e6     
            lda __f38b,x       ; $f204: bd 8b f3  
            sta $e7            ; $f207: 85 e7     
            pla                ; $f209: 68        
            and #$07           ; $f20a: 29 07     
            beq __f216         ; $f20c: f0 08     
            tax                ; $f20e: aa        
__f20f:     lsr $e6            ; $f20f: 46 e6     
            ror $e7            ; $f211: 66 e7     
            dex                ; $f213: ca        
            bne __f20f         ; $f214: d0 f9     
__f216:     ldy #$04           ; $f216: a0 04     
            lda ($e0),y        ; $f218: b1 e0     
            and #$f8           ; $f21a: 29 f8     
            ora $e6            ; $f21c: 05 e6     
            sta ($e0),y        ; $f21e: 91 e0     
            lda $e7            ; $f220: a5 e7     
            dey                ; $f222: 88        
            sta ($e0),y        ; $f223: 91 e0     
            ldy #$00           ; $f225: a0 00     
            lda ($e0),y        ; $f227: b1 e0     
            cmp #$05           ; $f229: c9 05     
            bcc __f232         ; $f22b: 90 05     
            sec                ; $f22d: 38        
            sbc #$04           ; $f22e: e9 04     
            sta ($e0),y        ; $f230: 91 e0     
__f232:     ldy #$06           ; $f232: a0 06     
            lda ($e0),y        ; $f234: b1 e0     
            sta $e6            ; $f236: 85 e6     
            ldx $e4            ; $f238: a6 e4     
            lda $074d,x        ; $f23a: bd 4d 07  
            sta $e7            ; $f23d: 85 e7     
            lda #$00           ; $f23f: a9 00     
            ldx #$04           ; $f241: a2 04     
__f243:     lsr $e7            ; $f243: 46 e7     
            bcc __f24a         ; $f245: 90 03     
            clc                ; $f247: 18        
            adc $e6            ; $f248: 65 e6     
__f24a:     asl $e6            ; $f24a: 06 e6     
            dex                ; $f24c: ca        
            bne __f243         ; $f24d: d0 f4     
            iny                ; $f24f: c8        
            sta ($e0),y        ; $f250: 91 e0     
            jmp __f189         ; $f252: 4c 89 f1  

;-------------------------------------------------------------------------------
__f255:     sbc #$e8           ; $f255: e9 e8     
            jsr __f374         ; $f257: 20 74 f3  

;-------------------------------------------------------------------------------
            .hex 7e f2 95 f2   ; $f25a: 7e f2 95 f2   Data
            .hex a7 f2 b9 f2   ; $f25e: a7 f2 b9 f2   Data
            .hex cb f2 d5 f2   ; $f262: cb f2 d5 f2   Data
            .hex df f2 e9 f2   ; $f266: df f2 e9 f2   Data
            .hex f5 f2 f9 f2   ; $f26a: f5 f2 f9 f2   Data
            .hex fc f2 0d f3   ; $f26e: fc f2 0d f3   Data
            .hex 11 f3 14 f3   ; $f272: 11 f3 14 f3   Data
            .hex 25 f3 29 f3   ; $f276: 25 f3 29 f3   Data
            .hex 2c f3 49 f3   ; $f27a: 2c f3 49 f3   Data

;-------------------------------------------------------------------------------
            ldx $e4            ; $f27e: a6 e4     
            lda #$00           ; $f280: a9 00     
            sta $0600,x        ; $f282: 9d 00 06  
            ldy #$00           ; $f285: a0 00     
            sta ($e0),y        ; $f287: 91 e0     
            ldy #$05           ; $f289: a0 05     
            lda ($e0),y        ; $f28b: b1 e0     
            sec                ; $f28d: 38        
            sbc #$01           ; $f28e: e9 01     
            sta ($e0),y        ; $f290: 91 e0     
            jmp __f189         ; $f292: 4c 89 f1  

;-------------------------------------------------------------------------------
            jsr __f362         ; $f295: 20 62 f3  
            sta $e6            ; $f298: 85 e6     
            ldy #$01           ; $f29a: a0 01     
            lda ($e0),y        ; $f29c: b1 e0     
            and #$3f           ; $f29e: 29 3f     
            ora $e6            ; $f2a0: 05 e6     
            sta ($e0),y        ; $f2a2: 91 e0     
            jmp __f1e3         ; $f2a4: 4c e3 f1  

;-------------------------------------------------------------------------------
            jsr __f362         ; $f2a7: 20 62 f3  
            sta $e6            ; $f2aa: 85 e6     
            ldy #$01           ; $f2ac: a0 01     
            lda ($e0),y        ; $f2ae: b1 e0     
            and #$c0           ; $f2b0: 29 c0     
            ora $e6            ; $f2b2: 05 e6     
            sta ($e0),y        ; $f2b4: 91 e0     
            jmp __f1e3         ; $f2b6: 4c e3 f1  

;-------------------------------------------------------------------------------
            jsr __f362         ; $f2b9: 20 62 f3  
            sta $e6            ; $f2bc: 85 e6     
            ldy #$01           ; $f2be: a0 01     
            lda ($e0),y        ; $f2c0: b1 e0     
            and #$f0           ; $f2c2: 29 f0     
            ora $e6            ; $f2c4: 05 e6     
            sta ($e0),y        ; $f2c6: 91 e0     
            jmp __f1e3         ; $f2c8: 4c e3 f1  

;-------------------------------------------------------------------------------
            jsr __f362         ; $f2cb: 20 62 f3  
            ldy #$02           ; $f2ce: a0 02     
            sta ($e0),y        ; $f2d0: 91 e0     
            jmp __f1e3         ; $f2d2: 4c e3 f1  

;-------------------------------------------------------------------------------
            jsr __f362         ; $f2d5: 20 62 f3  
            ldy #$04           ; $f2d8: a0 04     
            sta ($e0),y        ; $f2da: 91 e0     
            jmp __f1e3         ; $f2dc: 4c e3 f1  

;-------------------------------------------------------------------------------
            jsr __f362         ; $f2df: 20 62 f3  
            ldy #$01           ; $f2e2: a0 01     
            sta ($e0),y        ; $f2e4: 91 e0     
            jmp __f1e3         ; $f2e6: 4c e3 f1  

;-------------------------------------------------------------------------------
            lda #$00           ; $f2e9: a9 00     
            ldx #$08           ; $f2eb: a2 08     
__f2ed:     sta $f0,x          ; $f2ed: 95 f0     
            dex                ; $f2ef: ca        
            bpl __f2ed         ; $f2f0: 10 fb     
            jmp __f1e3         ; $f2f2: 4c e3 f1  

;-------------------------------------------------------------------------------
            ldx #$00           ; $f2f5: a2 00     
            beq __f2fe         ; $f2f7: f0 05     
            ldx #$01           ; $f2f9: a2 01     
            bit $02a2          ; $f2fb: 2c a2 02  
__f2fe:     jsr __f362         ; $f2fe: 20 62 f3  
            inc $f0,x          ; $f301: f6 f0     
            cmp $f0,x          ; $f303: d5 f0     
            bne __f349         ; $f305: d0 42     
            lda #$00           ; $f307: a9 00     
            sta $f0,x          ; $f309: 95 f0     
            beq __f33d         ; $f30b: f0 30     
            ldx #$00           ; $f30d: a2 00     
            beq __f316         ; $f30f: f0 05     
            ldx #$01           ; $f311: a2 01     
            bit $02a2          ; $f313: 2c a2 02  
__f316:     jsr __f362         ; $f316: 20 62 f3  
            inc $f3,x          ; $f319: f6 f3     
            cmp $f3,x          ; $f31b: d5 f3     
            bne __f33d         ; $f31d: d0 1e     
            lda #$00           ; $f31f: a9 00     
            sta $f3,x          ; $f321: 95 f3     
            beq __f349         ; $f323: f0 24     
            ldx #$00           ; $f325: a2 00     
            beq __f32e         ; $f327: f0 05     
            ldx #$01           ; $f329: a2 01     
            bit $02a2          ; $f32b: 2c a2 02  
__f32e:     jsr __f362         ; $f32e: 20 62 f3  
            inc $f6,x          ; $f331: f6 f6     
            cmp $f6,x          ; $f333: d5 f6     
            bne __f33d         ; $f335: d0 06     
            lda #$00           ; $f337: a9 00     
            sta $f6,x          ; $f339: 95 f6     
            beq __f349         ; $f33b: f0 0c     
__f33d:     ldy #$05           ; $f33d: a0 05     
            lda ($e0),y        ; $f33f: b1 e0     
            clc                ; $f341: 18        
            adc #$01           ; $f342: 69 01     
            sta ($e0),y        ; $f344: 91 e0     
            jmp __f1e3         ; $f346: 4c e3 f1  

;-------------------------------------------------------------------------------
__f349:     jsr __f362         ; $f349: 20 62 f3  
            ldy #$05           ; $f34c: a0 05     
            sta ($e0),y        ; $f34e: 91 e0     
            jmp __f1e3         ; $f350: 4c e3 f1  

;-------------------------------------------------------------------------------
__f353:     lda $e4            ; $f353: a5 e4     
            asl                ; $f355: 0a        
            tax                ; $f356: aa        
            lda __f3a2,x       ; $f357: bd a2 f3  
            sta $e2            ; $f35a: 85 e2     
            lda __f3a3,x       ; $f35c: bd a3 f3  
            sta $e3            ; $f35f: 85 e3     
            rts                ; $f361: 60        

;-------------------------------------------------------------------------------
__f362:     lda $e4            ; $f362: a5 e4     
            ldy #$05           ; $f364: a0 05     
            lda ($e0),y        ; $f366: b1 e0     
            tay                ; $f368: a8        
            lda ($e2),y        ; $f369: b1 e2     
            pha                ; $f36b: 48        
            iny                ; $f36c: c8        
            tya                ; $f36d: 98        
            ldy #$05           ; $f36e: a0 05     
            sta ($e0),y        ; $f370: 91 e0     
            pla                ; $f372: 68        
            rts                ; $f373: 60        

;-------------------------------------------------------------------------------
__f374:     asl                ; $f374: 0a        
            tay                ; $f375: a8        
            iny                ; $f376: c8        
            pla                ; $f377: 68        
            sta $e6            ; $f378: 85 e6     
            pla                ; $f37a: 68        
            sta $e7            ; $f37b: 85 e7     
            lda ($e6),y        ; $f37d: b1 e6     
            tax                ; $f37f: aa        
            iny                ; $f380: c8        
            lda ($e6),y        ; $f381: b1 e6     
            sta $e7            ; $f383: 85 e7     
            stx $e6            ; $f385: 86 e6     
            jmp ($00e6)        ; $f387: 6c e6 00  

;-------------------------------------------------------------------------------
__f38a:     .hex 07            ; $f38a: 07            Data
__f38b:     .hex f2 07 80 07   ; $f38b: f2 07 80 07   Data
            .hex 14 06 ae 06   ; $f38f: 14 06 ae 06   Data
            .hex 43 05 f4 05   ; $f393: 43 05 f4 05   Data
            .hex 9e 05 4e 05   ; $f397: 9e 05 4e 05   Data
            .hex 02 04 ba 04   ; $f39b: 02 04 ba 04   Data
            .hex 76 04 36      ; $f39f: 76 04 36      Data
__f3a2:     .hex 11            ; $f3a2: 11            Data
__f3a3:     .hex f4 1f f4 2b   ; $f3a3: f4 1f f4 2b   Data
            .hex f4 25 f6 3c   ; $f3a7: f4 25 f6 3c   Data
            .hex f6 54 f6 61   ; $f3ab: f6 54 f6 61   Data
            .hex f6 84 f4 9f   ; $f3af: f6 84 f4 9f   Data
            .hex f4 c3 f4 dc   ; $f3b3: f4 c3 f4 dc   Data
            .hex f4 fa f4 1b   ; $f3b7: f4 fa f4 1b   Data
            .hex f6 0f f5 1c   ; $f3bb: f6 0f f5 1c   Data
            .hex f5 2a f5 3c   ; $f3bf: f5 2a f5 3c   Data
            .hex f5 4e f5 62   ; $f3c3: f5 4e f5 62   Data
            .hex f5 69 f5 70   ; $f3c7: f5 69 f5 70   Data
            .hex f5 78 f5 8e   ; $f3cb: f5 78 f5 8e   Data
            .hex f5 85 f5 98   ; $f3cf: f5 85 f5 98   Data
            .hex f5 ae f5 c5   ; $f3d3: f5 ae f5 c5   Data
            .hex f5 d3 f5 e2   ; $f3d7: f5 d3 f5 e2   Data
            .hex f5 ef f5 f6   ; $f3db: f5 ef f5 f6   Data
            .hex f5 fd f5 05   ; $f3df: f5 fd f5 05   Data
            .hex f6 37 f4 49   ; $f3e3: f6 37 f4 49   Data
            .hex f4 61 f4 70   ; $f3e7: f4 61 f4 70   Data
            .hex f4            ; $f3eb: f4            Data
__f3ec:     .hex 04 0f 0f 01   ; $f3ec: 04 0f 0f 01   Data
            .hex 01 01 01 05   ; $f3f0: 01 01 01 05   Data
            .hex 05 05 05 01   ; $f3f4: 05 05 05 01   Data
            .hex 0f 02 02 02   ; $f3f8: 0f 02 02 02   Data
            .hex 02 02 0f 0f   ; $f3fc: 02 02 0f 0f   Data
            .hex 0f 04 0c 08   ; $f400: 0f 04 0c 08   Data
            .hex 02 02 02 02   ; $f404: 02 02 02 02   Data
            .hex 02 0c 0c 0c   ; $f408: 02 0c 0c 0c   Data
            .hex 08 05 05 05   ; $f40c: 08 05 05 05   Data
            .hex 05 01 9f 7f   ; $f410: 05 01 9f 7f   Data
            .hex 00 61 1b 53   ; $f414: 00 61 1b 53   Data
            .hex 3b 1c 53 3c   ; $f418: 3b 1c 53 3c   Data
            .hex 1c 54 e8 01   ; $f41c: 1c 54 e8 01   Data
            .hex a0 fa 40 61   ; $f420: a0 fa 40 61   Data
            .hex 53 3b 13 52   ; $f424: 53 3b 13 52   Data
            .hex 3a 12 e8 02   ; $f428: 3a 12 e8 02   Data
            .hex a0 fa 40 61   ; $f42c: a0 fa 40 61   Data
            .hex 3b 13 52 3a   ; $f430: 3b 13 52 3a   Data
            .hex 12 51 e8 01   ; $f434: 12 51 e8 01   Data
            .hex 83 7f f8 62   ; $f438: 83 7f f8 62   Data
            .hex 1c 53 0c 43   ; $f43c: 1c 53 0c 43   Data
            .hex 5b 53 2b 33   ; $f440: 5b 53 2b 33   Data
            .hex ea 20 70 1b   ; $f444: ea 20 70 1b   Data
            .hex e8 02 90 7f   ; $f448: e8 02 90 7f   Data
            .hex f8 61 1c ea   ; $f44c: f8 61 1c ea   Data
            .hex 03 62 1c 53   ; $f450: 03 62 1c 53   Data
            .hex 0c 43 5b 61   ; $f454: 0c 43 5b 61   Data
            .hex 53 62 53 53   ; $f458: 53 62 53 53   Data
            .hex ea 20 70 52   ; $f45c: ea 20 70 52   Data
            .hex e8 03 13 00   ; $f460: e8 03 13 00   Data
            .hex 00 66 1b 64   ; $f464: 00 66 1b 64   Data
            .hex 1b 62 43 43   ; $f468: 1b 62 43 43   Data
            .hex 43 70 33 e8   ; $f46c: 43 70 33 e8   Data
            .hex 04 00 00 00   ; $f470: 04 00 00 00   Data
            .hex 0a 64 49 62   ; $f474: 0a 64 49 62   Data
            .hex 49 64 49 62   ; $f478: 49 64 49 62   Data
            .hex 28 28 28 70   ; $f47c: 28 28 28 70   Data
            .hex ea 20 28 e8   ; $f480: ea 20 28 e8   Data
            .hex 01 83 7f f8   ; $f484: 01 83 7f f8   Data
            .hex ef 62 1b 43   ; $f488: ef 62 1b 43   Data
            .hex 23 4b 2b f3   ; $f48c: 23 4b 2b f3   Data
            .hex 02 13 53 53   ; $f490: 02 13 53 53   Data
            .hex 52 f9 06 43   ; $f494: 52 f9 06 43   Data
            .hex 5b 14 70 ea   ; $f498: 5b 14 70 ea   Data
            .hex 20 1c e8 02   ; $f49c: 20 1c e8 02   Data
            .hex 90 7f f8 ef   ; $f4a0: 90 7f f8 ef   Data
            .hex 61 1b ea 03   ; $f4a4: 61 1b ea 03   Data
            .hex 62 1b 43 23   ; $f4a8: 62 1b 43 23   Data
            .hex 4b 61 2b f4   ; $f4ac: 4b 61 2b f4   Data
            .hex 02 1b 62 43   ; $f4b0: 02 1b 62 43   Data
            .hex 43 43 ea 10   ; $f4b4: 43 43 ea 10   Data
            .hex f9 05 62 2b   ; $f4b8: f9 05 62 2b   Data
            .hex 43 53 70 ea   ; $f4bc: 43 53 70 ea   Data
            .hex 20 5b e8 03   ; $f4c0: 20 5b e8 03   Data
            .hex 13 00 00 ef   ; $f4c4: 13 00 00 ef   Data
            .hex 66 1b 64 1b   ; $f4c8: 66 1b 64 1b   Data
            .hex f5 02 12 62   ; $f4cc: f5 02 12 62   Data
            .hex 52 52 52 f9   ; $f4d0: 52 52 52 f9   Data
            .hex 05 62 43 43   ; $f4d4: 05 62 43 43   Data
            .hex 43 70 33 e8   ; $f4d8: 43 70 33 e8   Data
            .hex 04 00 00 00   ; $f4dc: 04 00 00 00   Data
            .hex 0a 64 49 62   ; $f4e0: 0a 64 49 62   Data
            .hex 49 64 49 62   ; $f4e4: 49 64 49 62   Data
            .hex 28 28 28 64   ; $f4e8: 28 28 28 64   Data
            .hex 49 62 49 64   ; $f4ec: 49 62 49 64   Data
            .hex 49 62 28 28   ; $f4f0: 49 62 28 28   Data
            .hex 28 70 ea 20   ; $f4f4: 28 70 ea 20   Data
            .hex 28 e8 02 9f   ; $f4f8: 28 e8 02 9f   Data
            .hex 7f 00 65 04   ; $f4fc: 7f 00 65 04   Data
            .hex 53 3b 04 5b   ; $f500: 53 3b 04 5b   Data
            .hex 3b 23 3b 2b   ; $f504: 3b 23 3b 2b   Data
            .hex 1b 03 2b 23   ; $f508: 1b 03 2b 23   Data
            .hex 6a 03 e8 01   ; $f50c: 6a 03 e8 01   Data
            .hex 9f 7f 00 ef   ; $f510: 9f 7f 00 ef   Data
            .hex 61 54 04 f3   ; $f514: 61 54 04 f3   Data
            .hex 09 1a f9 06   ; $f518: 09 1a f9 06   Data
            .hex 02 9f 7f 00   ; $f51c: 02 9f 7f 00   Data
            .hex ef 61 34 44   ; $f520: ef 61 34 44   Data
            .hex f4 09 0d f9   ; $f524: f4 09 0d f9   Data
            .hex 06 e8 01 01   ; $f528: 06 e8 01 01   Data
            .hex 7f 48 63 53   ; $f52c: 7f 48 63 53   Data
            .hex 3b 2b 1b 5b   ; $f530: 3b 2b 1b 5b   Data
            .hex 3b 2b 1b 68   ; $f534: 3b 2b 1b 68   Data
            .hex ea 3f 04 e8   ; $f538: ea 3f 04 e8   Data
            .hex 02 01 7f 48   ; $f53c: 02 01 7f 48   Data
            .hex 63 3b 1b 52   ; $f540: 63 3b 1b 52   Data
            .hex 52 3b 1b 5a   ; $f544: 52 3b 1b 5a   Data
            .hex 5a 68 ea 3f   ; $f548: 5a 68 ea 3f   Data
            .hex 3b e8 03 0b   ; $f54c: 3b e8 03 0b   Data
            .hex 00 00 63 1a   ; $f550: 00 00 63 1a   Data
            .hex 1a 1a 1a 1a   ; $f554: 1a 1a 1a 1a   Data
            .hex 1a 1a 1a ee   ; $f558: 1a 1a 1a ee   Data
            .hex ff 68 1c ee   ; $f55c: ff 68 1c ee   Data
            .hex 00 e8 01 20   ; $f560: 00 e8 01 20   Data
            .hex 94 00 62 5c   ; $f564: 94 00 62 5c   Data
            .hex e8 02 20 9c   ; $f568: e8 02 20 9c   Data
            .hex 00 62 51 e8   ; $f56c: 00 62 51 e8   Data
            .hex 04 20 00 00   ; $f570: 04 20 00 00   Data
            .hex 0a 62 49 e8   ; $f574: 0a 62 49 e8   Data
            .hex 01 9f 7f 00   ; $f578: 01 9f 7f 00   Data
            .hex ef 61 1b 2b   ; $f57c: ef 61 1b 2b   Data
            .hex 3b f2 03 06   ; $f580: 3b f2 03 06   Data
            .hex e8 01 9f 7f   ; $f584: e8 01 9f 7f   Data
            .hex 18 61 5c f9   ; $f588: 18 61 5c f9   Data
            .hex 05 e8 01 9f   ; $f58c: 05 e8 01 9f   Data
            .hex 83 00 61 03   ; $f590: 83 00 61 03   Data
            .hex ec 8b 2b e8   ; $f594: ec 8b 2b e8   Data
            .hex 01 9f 7f 00   ; $f598: 01 9f 7f 00   Data
            .hex ef 61 1b 3b   ; $f59c: ef 61 1b 3b   Data
            .hex f0 02 06 53   ; $f5a0: f0 02 06 53   Data
            .hex 14 f0 02 0b   ; $f5a4: 14 f0 02 0b   Data
            .hex 2c 4c f0 02   ; $f5a8: 2c 4c f0 02   Data
            .hex 10 e8 02 9f   ; $f5ac: 10 e8 02 9f   Data
            .hex 7f 00 63 1b   ; $f5b0: 7f 00 63 1b   Data
            .hex 3b 4b 04 53   ; $f5b4: 3b 4b 04 53   Data
            .hex 3b 1b 03 1b   ; $f5b8: 3b 1b 03 1b   Data
            .hex 3b 4b 04 53   ; $f5bc: 3b 4b 04 53   Data
            .hex 04 66 14 f9   ; $f5c0: 04 66 14 f9   Data
            .hex 04 01 9f 7f   ; $f5c4: 04 01 9f 7f   Data
            .hex 00 ef 61 23   ; $f5c8: 00 ef 61 23   Data
            .hex 3b 53 14 f0   ; $f5cc: 3b 53 14 f0   Data
            .hex 02 06 e8 02   ; $f5d0: 02 06 e8 02   Data
            .hex 9f 7f 00 61   ; $f5d4: 9f 7f 00 61   Data
            .hex 1b 3b 4b 04   ; $f5d8: 1b 3b 4b 04   Data
            .hex 53 3b 13 52   ; $f5dc: 53 3b 13 52   Data
            .hex f9 05 01 9f   ; $f5e0: f9 05 01 9f   Data
            .hex 7f 00 ef 61   ; $f5e4: 7f 00 ef 61   Data
            .hex 23 2b 3b f1   ; $f5e8: 23 2b 3b f1   Data
            .hex 02 06 e8 01   ; $f5ec: 02 06 e8 01   Data
            .hex 82 7f 10 61   ; $f5f0: 82 7f 10 61   Data
            .hex 14 e8 02 82   ; $f5f4: 14 e8 02 82   Data
            .hex 7f 10 61 0c   ; $f5f8: 7f 10 61 0c   Data
            .hex e8 04 02 00   ; $f5fc: e8 04 02 00   Data
            .hex 10 0a 61 28   ; $f600: 10 0a 61 28   Data
            .hex e8 03 13 00   ; $f604: e8 03 13 00   Data
            .hex 08 61 13 62   ; $f608: 08 61 13 62   Data
            .hex 1b 61 3b 62   ; $f60c: 1b 61 3b 62   Data
            .hex 43 61 23 62   ; $f610: 43 61 23 62   Data
            .hex 2b 61 4b 62   ; $f614: 2b 61 4b 62   Data
            .hex 53 f9 04 02   ; $f618: 53 f9 04 02   Data
            .hex a0 ea 40 61   ; $f61c: a0 ea 40 61   Data
            .hex 1a 2a 3a f9   ; $f620: 1a 2a 3a f9   Data
            .hex 05 01 83 7f   ; $f624: 05 01 83 7f   Data
            .hex f8 ef 6a 1b   ; $f628: f8 ef 6a 1b   Data
            .hex 53 23 5b 1b   ; $f62c: 53 23 5b 1b   Data
            .hex 53 13 43 64   ; $f630: 53 13 43 64   Data
            .hex 33 ea 20 84   ; $f634: 33 ea 20 84   Data
            .hex 3b 7e 3b e8   ; $f638: 3b 7e 3b e8   Data
            .hex 02 90 7f f8   ; $f63c: 02 90 7f f8   Data
            .hex 65 00 ea 03   ; $f640: 65 00 ea 03   Data
            .hex 6a 1b 53 23   ; $f644: 6a 1b 53 23   Data
            .hex 5b 1b 53 13   ; $f648: 5b 1b 53 13   Data
            .hex 65 43 ea 20   ; $f64c: 65 43 ea 20   Data
            .hex 88 52 52 e8   ; $f650: 88 52 52 e8   Data
            .hex 03 13 00 00   ; $f654: 03 13 00 00   Data
            .hex 74 1b 13 1b   ; $f658: 74 1b 13 1b   Data
            .hex 23 88 1b 1b   ; $f65c: 23 88 1b 1b   Data
            .hex e8 04 00 00   ; $f660: e8 04 00 00   Data
            .hex 00 0a 7e 49   ; $f664: 00 0a 7e 49   Data
            .hex 6a 49 49 74   ; $f668: 6a 49 49 74   Data
            .hex 49 6a 49 88   ; $f66c: 49 6a 49 88   Data
            .hex ea 20 28 ea   ; $f670: ea 20 28 ea   Data
            .hex 00 28 e8 ff   ; $f674: 00 28 e8 ff   Data
            .hex ff ff ff ff   ; $f678: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f67c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f680: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f684: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f688: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f68c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f690: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f694: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f698: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f69c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6a0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6a4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6a8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6ac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6b0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6b4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6b8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6bc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6c0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6c4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6c8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6cc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6d0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6d4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6d8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6dc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6e0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6e4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6e8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6ec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6f0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6f4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6f8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f6fc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f700: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f704: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f708: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f70c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f710: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f714: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f718: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f71c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f720: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f724: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f728: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f72c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f730: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f734: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f738: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f73c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f740: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f744: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f748: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f74c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f750: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f754: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f758: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f75c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f760: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f764: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f768: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f76c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f770: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f774: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f778: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f77c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f780: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f784: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f788: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f78c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f790: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f794: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f798: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f79c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7a0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7a4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7a8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7ac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7b0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7b4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7b8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7bc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7c0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7c4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7c8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7cc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7d0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7d4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7d8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7dc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7e0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7e4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7e8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7ec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7f0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7f4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7f8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f7fc: ff ff ff ff   Data
            .hex 54 48 49 53   ; $f800: 54 48 49 53   Data
            .hex 20 50 52 4f   ; $f804: 20 50 52 4f   Data
            .hex 47 52 41 4d   ; $f808: 47 52 41 4d   Data
            .hex 20 57 41 53   ; $f80c: 20 57 41 53   Data
            .hex 20 54 48 45   ; $f810: 20 54 48 45   Data
            .hex 20 50 4f 53   ; $f814: 20 50 4f 53   Data
            .hex 54 48 55 4d   ; $f818: 54 48 55 4d   Data
            .hex 4f 55 53 20   ; $f81c: 4f 55 53 20   Data
            .hex 57 4f 52 4b   ; $f820: 57 4f 52 4b   Data
            .hex 20 4f 46 20   ; $f824: 20 4f 46 20   Data
            .hex 53 48 4f 49   ; $f828: 53 48 4f 49   Data
            .hex 43 48 49 20   ; $f82c: 43 48 49 20   Data
            .hex 46 55 4b 41   ; $f830: 46 55 4b 41   Data
            .hex 54 41 4e 49   ; $f834: 54 41 4e 49   Data
            .hex 2e 20 48 45   ; $f838: 2e 20 48 45   Data
            .hex 20 57 41 53   ; $f83c: 20 57 41 53   Data
            .hex 20 4f 4e 45   ; $f840: 20 4f 4e 45   Data
            .hex 20 4f 46 20   ; $f844: 20 4f 46 20   Data
            .hex 54 48 45 20   ; $f848: 54 48 45 20   Data
            .hex 42 45 53 54   ; $f84c: 42 45 53 54   Data
            .hex 20 50 52 4f   ; $f850: 20 50 52 4f   Data
            .hex ff ff ff ff   ; $f854: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f858: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f85c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f860: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f864: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f868: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f86c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f870: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f874: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f878: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f87c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f880: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f884: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f888: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f88c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f890: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f894: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f898: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f89c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8a0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8a4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8a8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8ac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8b0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8b4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8b8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8bc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8c0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8c4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8c8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8cc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8d0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8d4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8d8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8dc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8e0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8e4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8e8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8ec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8f0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8f4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8f8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f8fc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f900: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f904: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f908: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f90c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f910: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f914: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f918: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f91c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f920: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f924: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f928: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f92c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f930: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f934: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f938: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f93c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f940: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f944: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f948: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f94c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f950: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f954: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f958: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f95c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f960: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f964: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f968: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f96c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f970: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f974: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f978: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f97c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f980: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f984: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f988: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f98c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f990: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f994: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f998: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f99c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9a0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9a4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9a8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9ac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9b0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9b4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9b8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9bc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9c0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9c4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9c8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9cc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9d0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9d4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9d8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9dc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9e0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9e4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9e8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9ec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9f0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9f4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9f8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $f9fc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa00: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa04: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa08: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa0c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa10: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa14: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa18: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa1c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa20: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa24: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa28: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa2c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa30: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa34: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa38: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa3c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa40: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa44: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa48: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa4c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa50: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa54: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa58: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa5c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa60: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa64: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa68: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa6c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa70: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa74: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa78: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa7c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa80: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa84: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa88: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa8c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa90: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa94: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa98: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fa9c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $faa0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $faa4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $faa8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $faac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fab0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fab4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fab8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fabc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fac0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fac4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fac8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $facc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fad0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fad4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fad8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fadc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fae0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fae4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fae8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $faec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $faf0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $faf4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $faf8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fafc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb00: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb04: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb08: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb0c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb10: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb14: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb18: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb1c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb20: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb24: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb28: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb2c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb30: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb34: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb38: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb3c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb40: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb44: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb48: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb4c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb50: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb54: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb58: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb5c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb60: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb64: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb68: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb6c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb70: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb74: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb78: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb7c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb80: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb84: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb88: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb8c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb90: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb94: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb98: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fb9c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fba0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fba4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fba8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbb0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbb4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbb8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbbc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbc0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbc4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbc8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbcc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbd0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbd4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbd8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbdc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbe0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbe4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbe8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbf0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbf4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbf8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fbfc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc00: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc04: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc08: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc0c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc10: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc14: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc18: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc1c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc20: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc24: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc28: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc2c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc30: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc34: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc38: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc3c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc40: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc44: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc48: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc4c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc50: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc54: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc58: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc5c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc60: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc64: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc68: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc6c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc70: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc74: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc78: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc7c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc80: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc84: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc88: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc8c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc90: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc94: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc98: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fc9c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fca0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fca4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fca8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcb0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcb4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcb8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcbc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcc0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcc4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcc8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fccc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcd0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcd4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcd8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcdc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fce0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fce4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fce8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcf0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcf4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcf8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fcfc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd00: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd04: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd08: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd0c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd10: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd14: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd18: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd1c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd20: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd24: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd28: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd2c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd30: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd34: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd38: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd3c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd40: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd44: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd48: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd4c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd50: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd54: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd58: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd5c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd60: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd64: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd68: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd6c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd70: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd74: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd78: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd7c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd80: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd84: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd88: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd8c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd90: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd94: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd98: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fd9c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fda0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fda4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fda8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdb0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdb4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdb8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdbc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdc0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdc4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdc8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdcc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdd0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdd4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdd8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fddc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fde0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fde4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fde8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdf0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdf4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdf8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fdfc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe00: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe04: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe08: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe0c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe10: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe14: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe18: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe1c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe20: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe24: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe28: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe2c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe30: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe34: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe38: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe3c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe40: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe44: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe48: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe4c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe50: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe54: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe58: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe5c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe60: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe64: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe68: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe6c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe70: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe74: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe78: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe7c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe80: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe84: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe88: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe8c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe90: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe94: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe98: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fe9c: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fea0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fea4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fea8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $feac: ff ff ff ff   Data
            .hex ff ff ff ff   ; $feb0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $feb4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $feb8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $febc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fec0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fec4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fec8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fecc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fed0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fed4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fed8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fedc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fee0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fee4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fee8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $feec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fef0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fef4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fef8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fefc: ff ff ff ff   Data
__ff00:     .hex 82 01 ff ab   ; $ff00: 82 01 ff ab   Data
            .hex 03 0e ff 03   ; $ff04: 03 0e ff 03   Data
            .hex ff 3d ff 56   ; $ff08: ff 3d ff 56   Data
            .hex 03 32 ff 48   ; $ff0c: 03 32 ff 48   Data
            .hex 01 30 ff 51   ; $ff10: 01 30 ff 51   Data
            .hex 00 23 ff 0d   ; $ff14: 00 23 ff 0d   Data
            .hex 03 2f ff 41   ; $ff18: 03 2f ff 41   Data
            .hex 82 0a ff f1   ; $ff1c: 82 0a ff f1   Data
            .hex 01 0e ff 7c   ; $ff20: 01 0e ff 7c   Data
            .hex 03 2d ff 01   ; $ff24: 03 2d ff 01   Data
            .hex 02 16 ff 04   ; $ff28: 02 16 ff 04   Data
            .hex 01 2a ff 03   ; $ff2c: 01 2a ff 03   Data
            .hex 00 1c ff 01   ; $ff30: 00 1c ff 01   Data
            .hex 82 05 01 0e   ; $ff34: 82 05 01 0e   Data
            .hex ff 4f 02 34   ; $ff38: ff 4f 02 34   Data
            .hex ff 06 01 3a   ; $ff3c: ff 06 01 3a   Data
            .hex ff 01 00 6a   ; $ff40: ff 01 00 6a   Data
            .hex ff 03 01 2f   ; $ff44: ff 03 01 2f   Data
            .hex ff 04 00 24   ; $ff48: ff 04 00 24   Data
            .hex ff 80 03 10   ; $ff4c: ff 80 03 10   Data
            .hex 01 10 02 45   ; $ff50: 01 10 02 45   Data
            .hex 03 20 00 40   ; $ff54: 03 20 00 40   Data
            .hex 01 80 02 80   ; $ff58: 01 80 02 80   Data
            .hex 03 80 00 80   ; $ff5c: 03 80 00 80   Data
            .hex 01 80 02 80   ; $ff60: 01 80 02 80   Data
            .hex 03 80 00 80   ; $ff64: 03 80 00 80   Data
            .hex 01 80 02 80   ; $ff68: 01 80 02 80   Data
            .hex 03 80 00 00   ; $ff6c: 03 80 00 00   Data
            .hex ff ff ff ff   ; $ff70: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ff74: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ff78: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ff7c: ff ff ff ff   Data
__ff80:     .hex 07 0a 90 09   ; $ff80: 07 0a 90 09   Data
            .hex 58 0c c8 09   ; $ff84: 58 0c c8 09   Data
            .hex 36 0b ec 0b   ; $ff88: 36 0b ec 0b   Data
            .hex 5c 0b 5e 0a   ; $ff8c: 5c 0b 5e 0a   Data
            .hex 10 0b 01 f0   ; $ff90: 10 0b 01 f0   Data
            .hex 10 f0 10 f0   ; $ff94: 10 f0 10 f0   Data
            .hex 10 f0 40 0b   ; $ff98: 10 f0 40 0b   Data
            .hex 40 0b 40 0b   ; $ff9c: 40 0b 40 0b   Data
            .hex 40 0b 40 0b   ; $ffa0: 40 0b 40 0b   Data
            .hex 40 0b 40 0b   ; $ffa4: 40 0b 40 0b   Data
            .hex 40 0b 40 0b   ; $ffa8: 40 0b 40 0b   Data
            .hex 40 0b 00 ff   ; $ffac: 40 0b 00 ff   Data
            .hex ff ff ff ff   ; $ffb0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffb4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffb8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffbc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffc0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffc4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffc8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffcc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffd0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffd4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffd8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffdc: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffe0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffe4: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffe8: ff ff ff ff   Data
            .hex ff ff ff ff   ; $ffec: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fff0: ff ff ff ff   Data
            .hex ff ff ff ff   ; $fff4: ff ff ff ff   Data
            .hex ff ff         ; $fff8: ff ff         Data

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: 0b c1     Vector table
            .dw reset                      ; $fffc: 40 c0     Vector table
            .dw irq                        ; $fffe: 0d c1     Vector table
