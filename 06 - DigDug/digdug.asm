;-------------------------------------------------------------------------------
; Dig Dug (Japan).nes disasembled by DISASM6 v1.5
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

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      SEI                ; $c000: 78        
            CLD                ; $c001: d8        
            LDX #$ef           ; $c002: a2 ef     
            TXS                ; $c004: 9a        
            LDA #$10           ; $c005: a9 10     
            STA $2000          ; $c007: 8d 00 20  
            LDA $2002          ; $c00a: ad 02 20  
__c00d:     LDA $2002          ; $c00d: ad 02 20  
            BPL __c00d         ; $c010: 10 fb     
            LDX #$05           ; $c012: a2 05     
__c014:     LDA $68,x          ; $c014: b5 68     
            STA $0100,x        ; $c016: 9d 00 01  
            LDA $88,x          ; $c019: b5 88     
            STA $0110,x        ; $c01b: 9d 10 01  
            LDA $17,x          ; $c01e: b5 17     
            STA $0120,x        ; $c020: 9d 20 01  
            DEX                ; $c023: ca        
            BPL __c014         ; $c024: 10 ee     
            LDA $25            ; $c026: a5 25     
            STA $0140          ; $c028: 8d 40 01  
            LDA #$07           ; $c02b: a9 07     
            STA $e5            ; $c02d: 85 e5     
            LDA #$00           ; $c02f: a9 00     
            STA $e4            ; $c031: 85 e4     
            LDY #$00           ; $c033: a0 00     
__c035:     STA ($e4),y        ; $c035: 91 e4     
            INY                ; $c037: c8        
            BNE __c035         ; $c038: d0 fb     
            DEC $e5            ; $c03a: c6 e5     
            DEC $e5            ; $c03c: c6 e5     
            BEQ __c035         ; $c03e: f0 f5     
            INC $e5            ; $c040: e6 e5     
            BPL __c035         ; $c042: 10 f1     
            LDA #$01           ; $c044: a9 01     
            STA $19            ; $c046: 85 19     
            STA $25            ; $c048: 85 25     
            LDA #$01           ; $c04a: a9 01     
            STA $29            ; $c04c: 85 29     
            LDA #$04           ; $c04e: a9 04     
            STA $2a            ; $c050: 85 2a     
            STA $2b            ; $c052: 85 2b     
            LDX #$00           ; $c054: a2 00     
__c056:     LDA $01f0,x        ; $c056: bd f0 01  
            CMP __ffc1,x       ; $c059: dd c1 ff  
            BNE __c066         ; $c05c: d0 08     
            INX                ; $c05e: e8        
            CPX #$10           ; $c05f: e0 10     
            BNE __c056         ; $c061: d0 f3     
            JMP __c075         ; $c063: 4c 75 c0  

;-------------------------------------------------------------------------------
__c066:     LDX #$00           ; $c066: a2 00     
            LDA #$00           ; $c068: a9 00     
__c06a:     STA $0100,x        ; $c06a: 9d 00 01  
            INX                ; $c06d: e8        
            CPX #$f0           ; $c06e: e0 f0     
            BNE __c06a         ; $c070: d0 f8     
            JMP __c08e         ; $c072: 4c 8e c0  

;-------------------------------------------------------------------------------
__c075:     LDA $0140          ; $c075: ad 40 01  
            STA $25            ; $c078: 85 25     
            LDX #$05           ; $c07a: a2 05     
__c07c:     LDA $0100,x        ; $c07c: bd 00 01  
            STA $68,x          ; $c07f: 95 68     
            LDA $0110,x        ; $c081: bd 10 01  
            STA $88,x          ; $c084: 95 88     
            LDA $0120,x        ; $c086: bd 20 01  
            STA $17,x          ; $c089: 95 17     
            DEX                ; $c08b: ca        
            BPL __c07c         ; $c08c: 10 ee     
__c08e:     LDA #$c0           ; $c08e: a9 c0     
            STA $4017          ; $c090: 8d 17 40  
            LDA #$00           ; $c093: a9 00     
            STA $4010          ; $c095: 8d 10 40  
            JSR __f09e         ; $c098: 20 9e f0  
            LDX #$00           ; $c09b: a2 00     
__c09d:     LDA __ffc1,x       ; $c09d: bd c1 ff  
            STA $01f0,x        ; $c0a0: 9d f0 01  
            INX                ; $c0a3: e8        
            CPX #$10           ; $c0a4: e0 10     
            BNE __c09d         ; $c0a6: d0 f5     
            LDA #$30           ; $c0a8: a9 30     
            STA $2000          ; $c0aa: 8d 00 20  
            STA $08            ; $c0ad: 85 08     
            LDA #$06           ; $c0af: a9 06     
            STA $2001          ; $c0b1: 8d 01 20  
            LDA #$1e           ; $c0b4: a9 1e     
            STA $09            ; $c0b6: 85 09     
__c0b8:     LDA $2002          ; $c0b8: ad 02 20  
            BPL __c0b8         ; $c0bb: 10 fb     
            LDA #$3f           ; $c0bd: a9 3f     
            STA $2006          ; $c0bf: 8d 06 20  
            LDX #$10           ; $c0c2: a2 10     
            STX $2006          ; $c0c4: 8e 06 20  
            LDY #$00           ; $c0c7: a0 00     
__c0c9:     LDA __c2ba,y       ; $c0c9: b9 ba c2  
            STA $2007          ; $c0cc: 8d 07 20  
            INY                ; $c0cf: c8        
            DEX                ; $c0d0: ca        
            BNE __c0c9         ; $c0d1: d0 f6     
            LDA $2002          ; $c0d3: ad 02 20  
            LDA #$3f           ; $c0d6: a9 3f     
            STA $2006          ; $c0d8: 8d 06 20  
            LDA #$00           ; $c0db: a9 00     
            STA $2006          ; $c0dd: 8d 06 20  
            STA $2006          ; $c0e0: 8d 06 20  
            STA $2006          ; $c0e3: 8d 06 20  
            LDY #$00           ; $c0e6: a0 00     
__c0e8:     LDA #$f0           ; $c0e8: a9 f0     
            STA $0700,y        ; $c0ea: 99 00 07  
            INY                ; $c0ed: c8        
            BNE __c0e8         ; $c0ee: d0 f8     
            JSR __c2e6         ; $c0f0: 20 e6 c2  
            LDA $08            ; $c0f3: a5 08     
            ORA #$80           ; $c0f5: 09 80     
            STA $2000          ; $c0f7: 8d 00 20  
__c0fa:     JMP __c0fa         ; $c0fa: 4c fa c0  

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        LDA $08            ; $c0fd: a5 08     
            EOR $11            ; $c0ff: 45 11     
            STA $2000          ; $c101: 8d 00 20  
            STA $08            ; $c104: 85 08     
            LDA $2002          ; $c106: ad 02 20  
            LDA $09            ; $c109: a5 09     
            STA $2001          ; $c10b: 8d 01 20  
            LDA #$00           ; $c10e: a9 00     
            STA $2003          ; $c110: 8d 03 20  
            LDA #$07           ; $c113: a9 07     
            STA $4014          ; $c115: 8d 14 40  
            JSR __c1dd         ; $c118: 20 dd c1  
            LDA $2002          ; $c11b: ad 02 20  
            LDA $12            ; $c11e: a5 12     
            STA $2005          ; $c120: 8d 05 20  
            LDA $13            ; $c123: a5 13     
            STA $2005          ; $c125: 8d 05 20  
            LDA $08            ; $c128: a5 08     
            STA $2000          ; $c12a: 8d 00 20  
            LDA #$00           ; $c12d: a9 00     
            STA $11            ; $c12f: 85 11     
            INC $10            ; $c131: e6 10     
            JSR __c273         ; $c133: 20 73 c2  
            LDA #$00           ; $c136: a9 00     
            STA $2c            ; $c138: 85 2c     
            STA $0f            ; $c13a: 85 0f     
            JSR __c2cb         ; $c13c: 20 cb c2  
            LDA $23            ; $c13f: a5 23     
            BNE __c162         ; $c141: d0 1f     
            LDX $0f            ; $c143: a6 0f     
            LDA #$fc           ; $c145: a9 fc     
            STA $20            ; $c147: 85 20     
            LDA #$f0           ; $c149: a9 f0     
__c14b:     STA $0700,x        ; $c14b: 9d 00 07  
            INX                ; $c14e: e8        
            BNE __c14b         ; $c14f: d0 fa     
            LDY $0f            ; $c151: a4 0f     
            BEQ __c158         ; $c153: f0 03     
            JSR __c17f         ; $c155: 20 7f c1  
__c158:     JSR __e45a         ; $c158: 20 5a e4  
            LDA $2c            ; $c15b: a5 2c     
            BEQ __c162         ; $c15d: f0 03     
            JSR __c20a         ; $c15f: 20 0a c2  
__c162:     LDA $45            ; $c162: a5 45     
            BEQ __c171         ; $c164: f0 0b     
            LDA #$00           ; $c166: a9 00     
            tax                ; $c168: aa        
__c169:     STA $05e0,x        ; $c169: 9d e0 05  
            INX                ; $c16c: e8        
            CPX #$1c           ; $c16d: e0 1c     
            BNE __c169         ; $c16f: d0 f8     
__c171:     JSR __f0d1         ; $c171: 20 d1 f0  
            LDA $2002          ; $c174: ad 02 20  
            LDA $08            ; $c177: a5 08     
            ORA #$80           ; $c179: 09 80     
            STA $2000          ; $c17b: 8d 00 20  
            RTI                ; $c17e: 40        

;-------------------------------------------------------------------------------
__c17f:     LDA $10            ; $c17f: a5 10     
            LSR                ; $c181: 4a        
            BCS __c1b3         ; $c182: b0 2f     
            LDY #$0f           ; $c184: a0 0f     
__c186:     LDA $0710,y        ; $c186: b9 10 07  
            STA $07f0,y        ; $c189: 99 f0 07  
            LDA $0720,y        ; $c18c: b9 20 07  
            STA $0710,y        ; $c18f: 99 10 07  
            LDA $0730,y        ; $c192: b9 30 07  
            STA $07e0,y        ; $c195: 99 e0 07  
            LDA #$f0           ; $c198: a9 f0     
            STA $0720,y        ; $c19a: 99 20 07  
            STA $0730,y        ; $c19d: 99 30 07  
            DEY                ; $c1a0: 88        
            BPL __c186         ; $c1a1: 10 e3     
            LDY #$00           ; $c1a3: a0 00     
__c1a5:     INY                ; $c1a5: c8        
            INY                ; $c1a6: c8        
            INY                ; $c1a7: c8        
            INY                ; $c1a8: c8        
            LDA $0700,y        ; $c1a9: b9 00 07  
            CMP #$f0           ; $c1ac: c9 f0     
            BNE __c1a5         ; $c1ae: d0 f5     
            STY $0f            ; $c1b0: 84 0f     
            RTS                ; $c1b2: 60        

;-------------------------------------------------------------------------------
__c1b3:     LDY #$0f           ; $c1b3: a0 0f     
__c1b5:     LDA $0700,y        ; $c1b5: b9 00 07  
            STA $07f0,y        ; $c1b8: 99 f0 07  
            LDA $0710,y        ; $c1bb: b9 10 07  
            STA $0700,y        ; $c1be: 99 00 07  
            LDA $0720,y        ; $c1c1: b9 20 07  
            STA $07e0,y        ; $c1c4: 99 e0 07  
            LDA $0730,y        ; $c1c7: b9 30 07  
            STA $0710,y        ; $c1ca: 99 10 07  
            LDA #$f0           ; $c1cd: a9 f0     
            STA $0720,y        ; $c1cf: 99 20 07  
            STA $0730,y        ; $c1d2: 99 30 07  
            DEY                ; $c1d5: 88        
            BPL __c1b5         ; $c1d6: 10 dd     
            LDY #$00           ; $c1d8: a0 00     
            JMP __c1a5         ; $c1da: 4c a5 c1  

;-------------------------------------------------------------------------------
__c1dd:     LDY #$00           ; $c1dd: a0 00     
__c1df:     LDA $2002          ; $c1df: ad 02 20  
            LDA $0500,y        ; $c1e2: b9 00 05  
            BEQ __c204         ; $c1e5: f0 1d     
            STA $2006          ; $c1e7: 8d 06 20  
            INY                ; $c1ea: c8        
            LDA $0500,y        ; $c1eb: b9 00 05  
            STA $2006          ; $c1ee: 8d 06 20  
            INY                ; $c1f1: c8        
            LDA $0500,y        ; $c1f2: b9 00 05  
            tax                ; $c1f5: aa        
            INY                ; $c1f6: c8        
__c1f7:     LDA $0500,y        ; $c1f7: b9 00 05  
            STA $2007          ; $c1fa: 8d 07 20  
            INY                ; $c1fd: c8        
            DEX                ; $c1fe: ca        
            BNE __c1f7         ; $c1ff: d0 f6     
            JMP __c1df         ; $c201: 4c df c1  

;-------------------------------------------------------------------------------
__c204:     STA $0e            ; $c204: 85 0e     
            STA $0500          ; $c206: 8d 00 05  
            RTS                ; $c209: 60        

;-------------------------------------------------------------------------------
__c20a:     BPL __c21e         ; $c20a: 10 12     
            LDX $0e            ; $c20c: a6 0e     
            LDA #$17           ; $c20e: a9 17     
            STA $e0            ; $c210: 85 e0     
            LDA #$00           ; $c212: a9 00     
            STA $e1            ; $c214: 85 e1     
            LDA $14            ; $c216: a5 14     
            asl                ; $c218: 0a        
            ORA #$04           ; $c219: 09 04     
            JSR __c22b         ; $c21b: 20 2b c2  
__c21e:     LDX $0e            ; $c21e: a6 0e     
            LDA $27            ; $c220: a5 27     
            STA $e0            ; $c222: 85 e0     
            LDA $28            ; $c224: a5 28     
            STA $e1            ; $c226: 85 e1     
            LDA $14            ; $c228: a5 14     
            asl                ; $c22a: 0a        
__c22b:     tay                ; $c22b: a8        
            LDA __c26c,y       ; $c22c: b9 6c c2  
            STA $0500,x        ; $c22f: 9d 00 05  
            INX                ; $c232: e8        
            LDA __c26b,y       ; $c233: b9 6b c2  
            STA $0500,x        ; $c236: 9d 00 05  
            INX                ; $c239: e8        
            LDA #$05           ; $c23a: a9 05     
            STA $0500,x        ; $c23c: 9d 00 05  
            INX                ; $c23f: e8        
            LDY #$00           ; $c240: a0 00     
            LDA ($e0),y        ; $c242: b1 e0     
            INY                ; $c244: c8        
            CMP #$00           ; $c245: c9 00     
            BNE __c258         ; $c247: d0 0f     
__c249:     LDA ($e0),y        ; $c249: b1 e0     
            BNE __c258         ; $c24b: d0 0b     
            LDA #$24           ; $c24d: a9 24     
            STA $0500,x        ; $c24f: 9d 00 05  
            INX                ; $c252: e8        
            INY                ; $c253: c8        
            CPY #$05           ; $c254: c0 05     
            BNE __c249         ; $c256: d0 f1     
__c258:     LDA ($e0),y        ; $c258: b1 e0     
            STA $0500,x        ; $c25a: 9d 00 05  
            INX                ; $c25d: e8        
            INY                ; $c25e: c8        
            CPY #$06           ; $c25f: c0 06     
            BNE __c258         ; $c261: d0 f5     
            LDA #$00           ; $c263: a9 00     
            STA $0500,x        ; $c265: 9d 00 05  
            STX $0e            ; $c268: 86 0e     
            RTS                ; $c26a: 60        

;-------------------------------------------------------------------------------
__c26b:     .hex 58            ; $c26b: 58            Data
__c26c:     .hex 21 d8 29 d8   ; $c26c: 21 d8 29 d8   Data
            .hex 20 d8 28      ; $c270: 20 d8 28      Data

;-------------------------------------------------------------------------------
__c273:     LDX #$02           ; $c273: a2 02     
__c275:     LDA $00,x          ; $c275: b5 00     
            STA $01,x          ; $c277: 95 01     
            LDA $04,x          ; $c279: b5 04     
            STA $05,x          ; $c27b: 95 05     
            DEX                ; $c27d: ca        
            BPL __c275         ; $c27e: 10 f5     
            LDA #$01           ; $c280: a9 01     
            STA $4016          ; $c282: 8d 16 40  
            LDA #$00           ; $c285: a9 00     
            STA $4016          ; $c287: 8d 16 40  
            LDX #$08           ; $c28a: a2 08     
__c28c:     LDA $4016          ; $c28c: ad 16 40  
            ROR                ; $c28f: 6a        
            BCS __c293         ; $c290: b0 01     
            ROR                ; $c292: 6a        
__c293:     ROR $00            ; $c293: 66 00     
            LDA $4017          ; $c295: ad 17 40  
            ROR                ; $c298: 6a        
            BCS __c29c         ; $c299: b0 01     
            ROR                ; $c29b: 6a        
__c29c:     ROR $04            ; $c29c: 66 04     
            DEX                ; $c29e: ca        
            BNE __c28c         ; $c29f: d0 eb     
            LDA $03            ; $c2a1: a5 03     
            ORA $02            ; $c2a3: 05 02     
            EOR #$ff           ; $c2a5: 49 ff     
            and $01            ; $c2a7: 25 01     
            and $00            ; $c2a9: 25 00     
            STA $03            ; $c2ab: 85 03     
            LDA $07            ; $c2ad: a5 07     
            ORA $06            ; $c2af: 05 06     
            EOR #$ff           ; $c2b1: 49 ff     
            and $05            ; $c2b3: 25 05     
            and $04            ; $c2b5: 25 04     
            STA $07            ; $c2b7: 85 07     
            RTS                ; $c2b9: 60        

;-------------------------------------------------------------------------------
__c2ba:     .hex 0f 0f 30 1c   ; $c2ba: 0f 0f 30 1c   Data
            .hex 0f 16 30 28   ; $c2be: 0f 16 30 28   Data
            .hex 0f 16 30 1a   ; $c2c2: 0f 16 30 1a   Data
            .hex 0f 17 06 07   ; $c2c6: 0f 17 06 07   Data
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        RTI                ; $c2ca: 40        

;-------------------------------------------------------------------------------
__c2cb:     LDA $45            ; $c2cb: a5 45     
            BEQ __c2d8         ; $c2cd: f0 09     
            LDA $03            ; $c2cf: a5 03     
            and #$0c           ; $c2d1: 29 0c     
            BEQ __c2d8         ; $c2d3: f0 03     
            JMP __c2ed         ; $c2d5: 4c ed c2  

;-------------------------------------------------------------------------------
__c2d8:     LDA $16            ; $c2d8: a5 16     
            pha                ; $c2da: 48        
            LDA $15            ; $c2db: a5 15     
            pha                ; $c2dd: 48        
            RTS                ; $c2de: 60        

;-------------------------------------------------------------------------------
__c2df:     pla                ; $c2df: 68        
            STA $15            ; $c2e0: 85 15     
            pla                ; $c2e2: 68        
            STA $16            ; $c2e3: 85 16     
            RTS                ; $c2e5: 60        

;-------------------------------------------------------------------------------
__c2e6:     JSR __c2df         ; $c2e6: 20 df c2  
            LDA #$00           ; $c2e9: a9 00     
            STA $24            ; $c2eb: 85 24     
__c2ed:     JSR __c2df         ; $c2ed: 20 df c2  
            LDA #$00           ; $c2f0: a9 00     
            STA $45            ; $c2f2: 85 45     
            JSR __c74e         ; $c2f4: 20 4e c7  
            JSR __e284         ; $c2f7: 20 84 e2  
            LDA #$06           ; $c2fa: a9 06     
            STA $2001          ; $c2fc: 8d 01 20  
            LDA $2002          ; $c2ff: ad 02 20  
            LDA #$3f           ; $c302: a9 3f     
            STA $2006          ; $c304: 8d 06 20  
            LDA #$00           ; $c307: a9 00     
            STA $2006          ; $c309: 8d 06 20  
            LDX #$00           ; $c30c: a2 00     
__c30e:     LDA __ccdd,x       ; $c30e: bd dd cc  
            STA $2007          ; $c311: 8d 07 20  
            INX                ; $c314: e8        
            CPX #$10           ; $c315: e0 10     
            BNE __c30e         ; $c317: d0 f5     
            LDA $2002          ; $c319: ad 02 20  
            LDA #$3f           ; $c31c: a9 3f     
            STA $2006          ; $c31e: 8d 06 20  
            LDA #$00           ; $c321: a9 00     
            STA $2006          ; $c323: 8d 06 20  
            STA $2006          ; $c326: 8d 06 20  
            STA $2006          ; $c329: 8d 06 20  
            LDA #$00           ; $c32c: a9 00     
            STA $13            ; $c32e: 85 13     
            STA $12            ; $c330: 85 12     
            LDA $08            ; $c332: a5 08     
            ORA #$02           ; $c334: 09 02     
            STA $08            ; $c336: 85 08     
            LDA $2002          ; $c338: ad 02 20  
            LDA #$20           ; $c33b: a9 20     
            STA $2006          ; $c33d: 8d 06 20  
            LDA #$00           ; $c340: a9 00     
            STA $2006          ; $c342: 8d 06 20  
            LDX #$00           ; $c345: a2 00     
            LDA #$24           ; $c347: a9 24     
            JSR __cba0         ; $c349: 20 a0 cb  
            JSR __cba0         ; $c34c: 20 a0 cb  
            JSR __cba0         ; $c34f: 20 a0 cb  
            LDX #$c0           ; $c352: a2 c0     
            JSR __cba0         ; $c354: 20 a0 cb  
            LDX #$40           ; $c357: a2 40     
            LDA #$00           ; $c359: a9 00     
            JSR __cba0         ; $c35b: 20 a0 cb  
            LDA $2002          ; $c35e: ad 02 20  
            LDA #$28           ; $c361: a9 28     
            STA $2006          ; $c363: 8d 06 20  
            LDA #$00           ; $c366: a9 00     
            STA $2006          ; $c368: 8d 06 20  
            LDA #$24           ; $c36b: a9 24     
            LDX #$00           ; $c36d: a2 00     
            JSR __cba0         ; $c36f: 20 a0 cb  
            JSR __cba0         ; $c372: 20 a0 cb  
            JSR __cba0         ; $c375: 20 a0 cb  
            LDX #$c0           ; $c378: a2 c0     
            JSR __cba0         ; $c37a: 20 a0 cb  
            LDX #$40           ; $c37d: a2 40     
            LDA #$00           ; $c37f: a9 00     
            JSR __cba0         ; $c381: 20 a0 cb  
            LDX #$00           ; $c384: a2 00     
            LDY #$0d           ; $c386: a0 0d     
__c388:     JSR __cba7         ; $c388: 20 a7 cb  
            DEY                ; $c38b: 88        
            BNE __c388         ; $c38c: d0 fa     
            LDA $25            ; $c38e: a5 25     
            BEQ __c398         ; $c390: f0 06     
            JSR __cba7         ; $c392: 20 a7 cb  
            JSR __cbd9         ; $c395: 20 d9 cb  
__c398:     JSR __cbe0         ; $c398: 20 e0 cb  
            JSR __cc1d         ; $c39b: 20 1d cc  
            JSR __ca26         ; $c39e: 20 26 ca  
__c3a1:     LDA $03            ; $c3a1: a5 03     
            and #$0c           ; $c3a3: 29 0c     
            BNE __c3b2         ; $c3a5: d0 0b     
            JSR __c2df         ; $c3a7: 20 df c2  
            INC $13            ; $c3aa: e6 13     
            LDA $13            ; $c3ac: a5 13     
            CMP #$f0           ; $c3ae: c9 f0     
            BNE __c3a1         ; $c3b0: d0 ef     
__c3b2:     LDA #$02           ; $c3b2: a9 02     
            STA $11            ; $c3b4: 85 11     
            LDA #$00           ; $c3b6: a9 00     
            STA $13            ; $c3b8: 85 13     
            LDA #$f0           ; $c3ba: a9 f0     
            STA $1e            ; $c3bc: 85 1e     
__c3be:     JSR __c2df         ; $c3be: 20 df c2  
            LDA $03            ; $c3c1: a5 03     
            and #$08           ; $c3c3: 29 08     
            BNE __c40a         ; $c3c5: d0 43     
            LDA $03            ; $c3c7: a5 03     
            and #$04           ; $c3c9: 29 04     
            BEQ __c3d6         ; $c3cb: f0 09     
            LDA $24            ; $c3cd: a5 24     
            EOR #$01           ; $c3cf: 49 01     
            STA $24            ; $c3d1: 85 24     
            JSR __ca26         ; $c3d3: 20 26 ca  
__c3d6:     LDA $10            ; $c3d6: a5 10     
            and #$01           ; $c3d8: 29 01     
            BNE __c3be         ; $c3da: d0 e2     
            DEC $1e            ; $c3dc: c6 1e     
            BNE __c3be         ; $c3de: d0 de     
            LDA #$01           ; $c3e0: a9 01     
            STA $45            ; $c3e2: 85 45     
            STA $47            ; $c3e4: 85 47     
            LDA #$f8           ; $c3e6: a9 f8     
            STA $12            ; $c3e8: 85 12     
            LDA #$08           ; $c3ea: a9 08     
            STA $13            ; $c3ec: 85 13     
            LDX #$00           ; $c3ee: a2 00     
            txa                ; $c3f0: 8a        
            STA $46            ; $c3f1: 85 46     
__c3f3:     STA $60,x          ; $c3f3: 95 60     
            INX                ; $c3f5: e8        
            CPX #$08           ; $c3f6: e0 08     
            BNE __c3f3         ; $c3f8: d0 f9     
            LDX #$0e           ; $c3fa: a2 0e     
__c3fc:     STA $60,x          ; $c3fc: 95 60     
            INX                ; $c3fe: e8        
            CPX #$20           ; $c3ff: e0 20     
            BNE __c3fc         ; $c401: d0 f9     
            INC $60            ; $c403: e6 60     
            INC $6e            ; $c405: e6 6e     
            JMP __c431         ; $c407: 4c 31 c4  

;-------------------------------------------------------------------------------
__c40a:     LDA #$f8           ; $c40a: a9 f8     
            STA $12            ; $c40c: 85 12     
            LDA #$08           ; $c40e: a9 08     
            STA $13            ; $c410: 85 13     
            LDA #$00           ; $c412: a9 00     
            LDX #$3f           ; $c414: a2 3f     
__c416:     STA $60,x          ; $c416: 95 60     
            DEX                ; $c418: ca        
            BPL __c416         ; $c419: 10 fb     
            LDA #$00           ; $c41b: a9 00     
            STA $14            ; $c41d: 85 14     
            LDA $29            ; $c41f: a5 29     
            STA $62            ; $c421: 85 62     
            STA $82            ; $c423: 85 82     
            LDA #$03           ; $c425: a9 03     
            STA $60            ; $c427: 85 60     
            LDX $24            ; $c429: a6 24     
            STX $25            ; $c42b: 86 25     
            BEQ __c431         ; $c42d: f0 02     
            STA $80            ; $c42f: 85 80     
__c431:     JSR __c2df         ; $c431: 20 df c2  
            LDA $6e            ; $c434: a5 6e     
            BNE __c440         ; $c436: d0 08     
            LDA #$01           ; $c438: a9 01     
            STA $05fa          ; $c43a: 8d fa 05  
            STA $05fb          ; $c43d: 8d fb 05  
__c440:     INC $6e            ; $c440: e6 6e     
            CMP #$6f           ; $c442: c9 6f     
            BNE __c44a         ; $c444: d0 04     
            LDA #$63           ; $c446: a9 63     
            STA $6e            ; $c448: 85 6e     
__c44a:     LDA #$00           ; $c44a: a9 00     
            STA $26            ; $c44c: 85 26     
            STA $0e            ; $c44e: 85 0e     
            STA $0b            ; $c450: 85 0b     
            STA $6f            ; $c452: 85 6f     
            LDA #$06           ; $c454: a9 06     
            STA $2001          ; $c456: 8d 01 20  
            JSR __c7d0         ; $c459: 20 d0 c7  
            JSR __c841         ; $c45c: 20 41 c8  
            LDX #$1c           ; $c45f: a2 1c     
            JSR __cba7         ; $c461: 20 a7 cb  
            JSR __cba7         ; $c464: 20 a7 cb  
            JSR __cba7         ; $c467: 20 a7 cb  
            JSR __cba7         ; $c46a: 20 a7 cb  
            JSR __c918         ; $c46d: 20 18 c9  
            JSR __e2f5         ; $c470: 20 f5 e2  
            LDA #$01           ; $c473: a9 01     
            STA $1f            ; $c475: 85 1f     
            JSR __c2df         ; $c477: 20 df c2  
            JSR __c675         ; $c47a: 20 75 c6  
            JSR __c778         ; $c47d: 20 78 c7  
            JMP __c4ae         ; $c480: 4c ae c4  

;-------------------------------------------------------------------------------
__c483:     JSR __c2df         ; $c483: 20 df c2  
            JSR __c742         ; $c486: 20 42 c7  
            LDX #$01           ; $c489: a2 01     
__c48b:     LDA $a0,x          ; $c48b: b5 a0     
            CMP #$04           ; $c48d: c9 04     
            BEQ __c49d         ; $c48f: f0 0c     
            CMP #$06           ; $c491: c9 06     
            BEQ __c49d         ; $c493: f0 08     
            INX                ; $c495: e8        
            CPX #$0e           ; $c496: e0 0e     
            BNE __c48b         ; $c498: d0 f1     
            JMP __c431         ; $c49a: 4c 31 c4  

;-------------------------------------------------------------------------------
__c49d:     LDA #$02           ; $c49d: a9 02     
            STA $a0            ; $c49f: 85 a0     
            JSR __e382         ; $c4a1: 20 82 e3  
            LDA #$01           ; $c4a4: a9 01     
            STA $1f            ; $c4a6: 85 1f     
            JSR __c823         ; $c4a8: 20 23 c8  
            JSR __c85e         ; $c4ab: 20 5e c8  
__c4ae:     JSR __c2df         ; $c4ae: 20 df c2  
            JSR __eead         ; $c4b1: 20 ad ee  
            LDX $14            ; $c4b4: a6 14     
            LDA __c65d,x       ; $c4b6: bd 5d c6  
            STA $27            ; $c4b9: 85 27     
            LDA #$00           ; $c4bb: a9 00     
            STA $28            ; $c4bd: 85 28     
            JSR __ca45         ; $c4bf: 20 45 ca  
            JSR __c675         ; $c4c2: 20 75 c6  
            LDA #$78           ; $c4c5: a9 78     
            STA $1e            ; $c4c7: 85 1e     
            LDA #$0c           ; $c4c9: a9 0c     
            STA $26            ; $c4cb: 85 26     
__c4cd:     JSR __c2df         ; $c4cd: 20 df c2  
            JSR __c675         ; $c4d0: 20 75 c6  
            DEC $26            ; $c4d3: c6 26     
            BNE __c4cd         ; $c4d5: d0 f6     
__c4d7:     JSR __c675         ; $c4d7: 20 75 c6  
            JSR __c2df         ; $c4da: 20 df c2  
            DEC $1e            ; $c4dd: c6 1e     
            BNE __c4d7         ; $c4df: d0 f6     
            INC $1e            ; $c4e1: e6 1e     
            LDA $05fa          ; $c4e3: ad fa 05  
            BNE __c4d7         ; $c4e6: d0 ef     
            JSR __c2df         ; $c4e8: 20 df c2  
            LDA #$01           ; $c4eb: a9 01     
            STA $2d            ; $c4ed: 85 2d     
            LDA #$00           ; $c4ef: a9 00     
            STA $1f            ; $c4f1: 85 1f     
            STA $23            ; $c4f3: 85 23     
__c4f5:     JSR __f026         ; $c4f5: 20 26 f0  
            JSR __c2df         ; $c4f8: 20 df c2  
            LDA $03            ; $c4fb: a5 03     
            and #$08           ; $c4fd: 29 08     
            BNE __c561         ; $c4ff: d0 60     
            JSR __eeee         ; $c501: 20 ee ee  
            JSR __c75e         ; $c504: 20 5e c7  
__c507:     LDA $b0            ; $c507: a5 b0     
            CMP #$0a           ; $c509: c9 0a     
            BCS __c579         ; $c50b: b0 6c     
            LDA $61            ; $c50d: a5 61     
            BNE __c4f5         ; $c50f: d0 e4     
            STA $05f7          ; $c511: 8d f7 05  
            LDA $41            ; $c514: a5 41     
            CMP #$01           ; $c516: c9 01     
            BEQ __c4f5         ; $c518: f0 db     
__c51a:     JSR __c2df         ; $c51a: 20 df c2  
            JSR __c2df         ; $c51d: 20 df c2  
            LDA $05e7          ; $c520: ad e7 05  
            BNE __c51a         ; $c523: d0 f5     
            JSR __c778         ; $c525: 20 78 c7  
            LDA #$01           ; $c528: a9 01     
            STA $26            ; $c52a: 85 26     
            STA $1f            ; $c52c: 85 1f     
__c52e:     JSR __c2df         ; $c52e: 20 df c2  
            LDA $41            ; $c531: a5 41     
            CMP #$02           ; $c533: c9 02     
            BEQ __c52e         ; $c535: f0 f7     
            LDA $44            ; $c537: a5 44     
            BNE __c52e         ; $c539: d0 f3     
            LDA #$01           ; $c53b: a9 01     
            STA $05e5          ; $c53d: 8d e5 05  
            STA $05e6          ; $c540: 8d e6 05  
__c543:     JSR __c2df         ; $c543: 20 df c2  
            LDA $b0            ; $c546: a5 b0     
            CMP #$06           ; $c548: c9 06     
            BCS __c579         ; $c54a: b0 2d     
            LDA $05e5          ; $c54c: ad e5 05  
            BNE __c543         ; $c54f: d0 f2     
            JSR __c74e         ; $c551: 20 4e c7  
            JSR __e284         ; $c554: 20 84 e2  
            LDA $45            ; $c557: a5 45     
            BNE __c55e         ; $c559: d0 03     
            JMP __c431         ; $c55b: 4c 31 c4  

;-------------------------------------------------------------------------------
__c55e:     JMP __c2ed         ; $c55e: 4c ed c2  

;-------------------------------------------------------------------------------
__c561:     LDA #$01           ; $c561: a9 01     
            STA $05e0          ; $c563: 8d e0 05  
__c566:     LDA #$01           ; $c566: a9 01     
            STA $23            ; $c568: 85 23     
            JSR __c6fc         ; $c56a: 20 fc c6  
            JSR __c2df         ; $c56d: 20 df c2  
            LDA $03            ; $c570: a5 03     
            and #$08           ; $c572: 29 08     
            BEQ __c566         ; $c574: f0 f0     
            JMP __c605         ; $c576: 4c 05 c6  

;-------------------------------------------------------------------------------
__c579:     LDA #$01           ; $c579: a9 01     
            STA $1f            ; $c57b: 85 1f     
            JSR __c778         ; $c57d: 20 78 c7  
__c580:     JSR __c2df         ; $c580: 20 df c2  
            LDA $a0            ; $c583: a5 a0     
            BNE __c580         ; $c585: d0 f9     
            LDA $05e3          ; $c587: ad e3 05  
            BNE __c580         ; $c58a: d0 f4     
            LDA $41            ; $c58c: a5 41     
            BEQ __c594         ; $c58e: f0 04     
            CMP #$03           ; $c590: c9 03     
            BNE __c580         ; $c592: d0 ec     
__c594:     LDX $42            ; $c594: a6 42     
            LDA $a0,x          ; $c596: b5 a0     
            CMP #$0a           ; $c598: c9 0a     
            BNE __c5a3         ; $c59a: d0 07     
            LDA #$00           ; $c59c: a9 00     
            STA $a0,x          ; $c59e: 95 a0     
            JSR __e284         ; $c5a0: 20 84 e2  
__c5a3:     JSR __c74e         ; $c5a3: 20 4e c7  
            LDA $61            ; $c5a6: a5 61     
            BNE __c5ba         ; $c5a8: d0 10     
            LDA #$01           ; $c5aa: a9 01     
            STA $05e5          ; $c5ac: 8d e5 05  
            STA $05e6          ; $c5af: 8d e6 05  
__c5b2:     JSR __c2df         ; $c5b2: 20 df c2  
            LDA $05e5          ; $c5b5: ad e5 05  
            BNE __c5b2         ; $c5b8: d0 f8     
__c5ba:     LDA $45            ; $c5ba: a5 45     
            BNE __c602         ; $c5bc: d0 44     
            DEC $60            ; $c5be: c6 60     
            BNE __c60f         ; $c5c0: d0 4d     
            LDA #$08           ; $c5c2: a9 08     
            STA $1e            ; $c5c4: 85 1e     
__c5c6:     JSR __c2df         ; $c5c6: 20 df c2  
            DEC $1e            ; $c5c9: c6 1e     
            BNE __c5c6         ; $c5cb: d0 f9     
            LDA #$78           ; $c5cd: a9 78     
            STA $1e            ; $c5cf: 85 1e     
            LDA #$01           ; $c5d1: a9 01     
            STA $05f8          ; $c5d3: 8d f8 05  
            STA $05f9          ; $c5d6: 8d f9 05  
__c5d9:     JSR __c2df         ; $c5d9: 20 df c2  
            JSR __c65f         ; $c5dc: 20 5f c6  
            DEC $1e            ; $c5df: c6 1e     
            BNE __c5d9         ; $c5e1: d0 f6     
            LDA $80            ; $c5e3: a5 80     
            BNE __c60f         ; $c5e5: d0 28     
            LDA #$5a           ; $c5e7: a9 5a     
            STA $1e            ; $c5e9: 85 1e     
__c5eb:     JSR __c2df         ; $c5eb: 20 df c2  
            JSR __c662         ; $c5ee: 20 62 c6  
            LDA $03            ; $c5f1: a5 03     
            and #$0c           ; $c5f3: 29 0c     
            BNE __c5fb         ; $c5f5: d0 04     
            DEC $1e            ; $c5f7: c6 1e     
            BNE __c5eb         ; $c5f9: d0 f0     
__c5fb:     LDA $14            ; $c5fb: a5 14     
            BEQ __c602         ; $c5fd: f0 03     
            JSR __c620         ; $c5ff: 20 20 c6  
__c602:     JMP __c2ed         ; $c602: 4c ed c2  

;-------------------------------------------------------------------------------
__c605:     LDA #$00           ; $c605: a9 00     
            STA $23            ; $c607: 85 23     
            JSR __c6fc         ; $c609: 20 fc c6  
            JMP __c507         ; $c60c: 4c 07 c5  

;-------------------------------------------------------------------------------
__c60f:     LDA $80            ; $c60f: a5 80     
            BEQ __c61d         ; $c611: f0 0a     
            JSR __c620         ; $c613: 20 20 c6  
            LDA $6e            ; $c616: a5 6e     
            BNE __c61d         ; $c618: d0 03     
            JMP __c431         ; $c61a: 4c 31 c4  

;-------------------------------------------------------------------------------
__c61d:     JMP __c483         ; $c61d: 4c 83 c4  

;-------------------------------------------------------------------------------
__c620:     LDX #$00           ; $c620: a2 00     
__c622:     LDA $0200,x        ; $c622: bd 00 02  
            tay                ; $c625: a8        
            LDA $0300,x        ; $c626: bd 00 03  
            STA $0200,x        ; $c629: 9d 00 02  
            tya                ; $c62c: 98        
            STA $0300,x        ; $c62d: 9d 00 03  
            INX                ; $c630: e8        
            BNE __c622         ; $c631: d0 ef     
            LDX #$07           ; $c633: a2 07     
__c635:     LDA $60,x          ; $c635: b5 60     
            tay                ; $c637: a8        
            LDA $80,x          ; $c638: b5 80     
            STA $60,x          ; $c63a: 95 60     
            tya                ; $c63c: 98        
            STA $80,x          ; $c63d: 95 80     
            DEX                ; $c63f: ca        
            BPL __c635         ; $c640: 10 f3     
            LDX #$11           ; $c642: a2 11     
__c644:     LDA $6e,x          ; $c644: b5 6e     
            tay                ; $c646: a8        
            LDA $8e,x          ; $c647: b5 8e     
            STA $6e,x          ; $c649: 95 6e     
            tya                ; $c64b: 98        
            STA $8e,x          ; $c64c: 95 8e     
            DEX                ; $c64e: ca        
            BPL __c644         ; $c64f: 10 f3     
            LDA $14            ; $c651: a5 14     
            EOR #$01           ; $c653: 49 01     
            STA $14            ; $c655: 85 14     
            asl                ; $c657: 0a        
            ORA #$30           ; $c658: 09 30     
            STA $08            ; $c65a: 85 08     
            RTS                ; $c65c: 60        

;-------------------------------------------------------------------------------
__c65d:     .hex 68 88         ; $c65d: 68 88         Data

;-------------------------------------------------------------------------------
__c65f:     JSR __c68f         ; $c65f: 20 8f c6  
__c662:     LDX $0f            ; $c662: a6 0f     
            LDY #$00           ; $c664: a0 00     
__c666:     LDA __c6dc,y       ; $c666: b9 dc c6  
            STA $0700,x        ; $c669: 9d 00 07  
            INX                ; $c66c: e8        
            INY                ; $c66d: c8        
            CPY #$20           ; $c66e: c0 20     
            BNE __c666         ; $c670: d0 f4     
            STX $0f            ; $c672: 86 0f     
            RTS                ; $c674: 60        

;-------------------------------------------------------------------------------
__c675:     LDA $45            ; $c675: a5 45     
            BNE __c68e         ; $c677: d0 15     
            JSR __c68f         ; $c679: 20 8f c6  
            LDX $0f            ; $c67c: a6 0f     
            LDY #$00           ; $c67e: a0 00     
__c680:     LDA __c6a8,y       ; $c680: b9 a8 c6  
            STA $0700,x        ; $c683: 9d 00 07  
            INX                ; $c686: e8        
            INY                ; $c687: c8        
            CPY #$18           ; $c688: c0 18     
            BNE __c680         ; $c68a: d0 f4     
            STX $0f            ; $c68c: 86 0f     
__c68e:     RTS                ; $c68e: 60        

;-------------------------------------------------------------------------------
__c68f:     LDX #$00           ; $c68f: a2 00     
__c691:     LDA __c6c0,x       ; $c691: bd c0 c6  
            STA $0700,x        ; $c694: 9d 00 07  
            INX                ; $c697: e8        
            CPX #$1c           ; $c698: e0 1c     
            BNE __c691         ; $c69a: d0 f5     
            STX $0f            ; $c69c: 86 0f     
            LDA $14            ; $c69e: a5 14     
            BEQ __c6a7         ; $c6a0: f0 05     
            LDA #$f7           ; $c6a2: a9 f7     
            STA $0719          ; $c6a4: 8d 19 07  
__c6a7:     RTS                ; $c6a7: 60        

;-------------------------------------------------------------------------------
__c6a8:     .hex 84 e7 00 48   ; $c6a8: 84 e7 00 48   Data
            .hex 84 e5 00 50   ; $c6ac: 84 e5 00 50   Data
            .hex 84 f1 00 58   ; $c6b0: 84 f1 00 58   Data
            .hex 84 ef 00 60   ; $c6b4: 84 ef 00 60   Data
            .hex 84 f3 00 68   ; $c6b8: 84 f3 00 68   Data
            .hex 84 fd 00 70   ; $c6bc: 84 fd 00 70   Data
__c6c0:     .hex 64 e1 00 40   ; $c6c0: 64 e1 00 40   Data
            .hex 64 e3 00 48   ; $c6c4: 64 e3 00 48   Data
            .hex 64 f1 00 50   ; $c6c8: 64 f1 00 50   Data
            .hex 64 f3 00 58   ; $c6cc: 64 f3 00 58   Data
            .hex 64 e5 00 60   ; $c6d0: 64 e5 00 60   Data
            .hex 64 e7 00 68   ; $c6d4: 64 e7 00 68   Data
            .hex 64 f5 00 78   ; $c6d8: 64 f5 00 78   Data
__c6dc:     .hex 84 e9 00 3c   ; $c6dc: 84 e9 00 3c   Data
            .hex 84 f1 00 44   ; $c6e0: 84 f1 00 44   Data
            .hex 84 eb 00 4c   ; $c6e4: 84 eb 00 4c   Data
            .hex 84 e5 00 54   ; $c6e8: 84 e5 00 54   Data
            .hex 84 f9 00 64   ; $c6ec: 84 f9 00 64   Data
            .hex 84 fb 00 6c   ; $c6f0: 84 fb 00 6c   Data
            .hex 84 e5 00 74   ; $c6f4: 84 e5 00 74   Data
            .hex 84 e7 00 7c   ; $c6f8: 84 e7 00 7c   Data

;-------------------------------------------------------------------------------
__c6fc:     LDY $0e            ; $c6fc: a4 0e     
            LDA $14            ; $c6fe: a5 14     
            asl                ; $c700: 0a        
            asl                ; $c701: 0a        
            asl                ; $c702: 0a        
            ORA #$22           ; $c703: 09 22     
            STA $0500,y        ; $c705: 99 00 05  
            INY                ; $c708: c8        
            LDA #$39           ; $c709: a9 39     
            STA $0500,y        ; $c70b: 99 00 05  
            INY                ; $c70e: c8        
            LDA #$05           ; $c70f: a9 05     
            STA $0500,y        ; $c711: 99 00 05  
            INY                ; $c714: c8        
            LDX #$00           ; $c715: a2 00     
            LDA $23            ; $c717: a5 23     
            BEQ __c723         ; $c719: f0 08     
            LDA $10            ; $c71b: a5 10     
            and #$10           ; $c71d: 29 10     
            BEQ __c723         ; $c71f: f0 02     
            LDX #$06           ; $c721: a2 06     
__c723:     LDA __c736,x       ; $c723: bd 36 c7  
__c726:     STA $0500,y        ; $c726: 99 00 05  
            INY                ; $c729: c8        
            INX                ; $c72a: e8        
            LDA __c736,x       ; $c72b: bd 36 c7  
            BNE __c726         ; $c72e: d0 f6     
            STA $0500,y        ; $c730: 99 00 05  
            STY $0e            ; $c733: 84 0e     
            RTS                ; $c735: 60        

;-------------------------------------------------------------------------------
__c736:     .hex 24 24 24 24   ; $c736: 24 24 24 24   Data
            .hex 24 00 19 0a   ; $c73a: 24 00 19 0a   Data
            .hex 1e 1c 0e 00   ; $c73e: 1e 1c 0e 00   Data

;-------------------------------------------------------------------------------
__c742:     LDX #$00           ; $c742: a2 00     
__c744:     LDA $72,x          ; $c744: b5 72     
            STA $a0,x          ; $c746: 95 a0     
            INX                ; $c748: e8        
            CPX #$0e           ; $c749: e0 0e     
            BNE __c744         ; $c74b: d0 f7     
            RTS                ; $c74d: 60        

;-------------------------------------------------------------------------------
__c74e:     LDX #$00           ; $c74e: a2 00     
__c750:     LDA $a0,x          ; $c750: b5 a0     
            STA $72,x          ; $c752: 95 72     
            LDA #$00           ; $c754: a9 00     
            STA $a0,x          ; $c756: 95 a0     
            INX                ; $c758: e8        
            CPX #$0e           ; $c759: e0 0e     
            BNE __c750         ; $c75b: d0 f3     
            RTS                ; $c75d: 60        

;-------------------------------------------------------------------------------
__c75e:     LDA $45            ; $c75e: a5 45     
            BEQ __c763         ; $c760: f0 01     
            RTS                ; $c762: 60        

;-------------------------------------------------------------------------------
__c763:     LDA $14            ; $c763: a5 14     
            asl                ; $c765: 0a        
            asl                ; $c766: 0a        
            adc $14            ; $c767: 65 14     
            tax                ; $c769: aa        
            LDA $10            ; $c76a: a5 10     
            and #$10           ; $c76c: 29 10     
            BEQ __c784         ; $c76e: f0 14     
            txa                ; $c770: 8a        
            clc                ; $c771: 18        
            adc #$0a           ; $c772: 69 0a     
            tax                ; $c774: aa        
            JMP __c784         ; $c775: 4c 84 c7  

;-------------------------------------------------------------------------------
__c778:     LDX #$00           ; $c778: a2 00     
            JSR __c784         ; $c77a: 20 84 c7  
            LDA $25            ; $c77d: a5 25     
            BNE __c782         ; $c77f: d0 01     
            RTS                ; $c781: 60        

;-------------------------------------------------------------------------------
__c782:     LDX #$05           ; $c782: a2 05     
__c784:     LDY $0e            ; $c784: a4 0e     
            LDA $14            ; $c786: a5 14     
            asl                ; $c788: 0a        
            asl                ; $c789: 0a        
            asl                ; $c78a: 0a        
            ORA __c7bd,x       ; $c78b: 1d bd c7  
            STA $0500,y        ; $c78e: 99 00 05  
            INY                ; $c791: c8        
            LDA __c7bc,x       ; $c792: bd bc c7  
            STA $0500,y        ; $c795: 99 00 05  
            INY                ; $c798: c8        
            LDA #$03           ; $c799: a9 03     
            STA $0500,y        ; $c79b: 99 00 05  
            INY                ; $c79e: c8        
            LDA __c7be,x       ; $c79f: bd be c7  
            STA $0500,y        ; $c7a2: 99 00 05  
            INY                ; $c7a5: c8        
            LDA __c7bf,x       ; $c7a6: bd bf c7  
            STA $0500,y        ; $c7a9: 99 00 05  
            INY                ; $c7ac: c8        
            LDA __c7c0,x       ; $c7ad: bd c0 c7  
            STA $0500,y        ; $c7b0: 99 00 05  
            INY                ; $c7b3: c8        
            LDA #$00           ; $c7b4: a9 00     
            STA $0500,y        ; $c7b6: 99 00 05  
            STY $0e            ; $c7b9: 84 0e     
            RTS                ; $c7bb: 60        

;-------------------------------------------------------------------------------
__c7bc:     .hex 38            ; $c7bc: 38            Data
__c7bd:     .hex 21            ; $c7bd: 21            Data
__c7be:     .hex 01            ; $c7be: 01            Data
__c7bf:     .hex 1e            ; $c7bf: 1e            Data
__c7c0:     .hex 19 b8 21 02   ; $c7c0: 19 b8 21 02   Data
            .hex 1e 19 38 21   ; $c7c4: 1e 19 38 21   Data
            .hex 24 24 24 b8   ; $c7c8: 24 24 24 b8   Data
            .hex 21 24 24 24   ; $c7cc: 21 24 24 24   Data

;-------------------------------------------------------------------------------
__c7d0:     LDY #$00           ; $c7d0: a0 00     
            LDA #$f9           ; $c7d2: a9 f9     
            LDX #$0c           ; $c7d4: a2 0c     
__c7d6:     STA $0200,y        ; $c7d6: 99 00 02  
            INY                ; $c7d9: c8        
            DEX                ; $c7da: ca        
            BNE __c7d6         ; $c7db: d0 f9     
            LDX #$a8           ; $c7dd: a2 a8     
            LDA #$00           ; $c7df: a9 00     
__c7e1:     STA $0200,y        ; $c7e1: 99 00 02  
            INY                ; $c7e4: c8        
            DEX                ; $c7e5: ca        
            BNE __c7e1         ; $c7e6: d0 f9     
            LDA $2002          ; $c7e8: ad 02 20  
            LDA $14            ; $c7eb: a5 14     
            asl                ; $c7ed: 0a        
            asl                ; $c7ee: 0a        
            asl                ; $c7ef: 0a        
            ORA #$20           ; $c7f0: 09 20     
            STA $2006          ; $c7f2: 8d 06 20  
            LDA #$00           ; $c7f5: a9 00     
            STA $2006          ; $c7f7: 8d 06 20  
            LDY #$04           ; $c7fa: a0 04     
__c7fc:     LDA #$06           ; $c7fc: a9 06     
            STA $e0            ; $c7fe: 85 e0     
__c800:     LDX #$18           ; $c800: a2 18     
            LDA __cb5b,y       ; $c802: b9 5b cb  
            JSR __cba0         ; $c805: 20 a0 cb  
            LDX #$08           ; $c808: a2 08     
            LDA #$24           ; $c80a: a9 24     
            JSR __cba0         ; $c80c: 20 a0 cb  
            DEC $e0            ; $c80f: c6 e0     
            BNE __c800         ; $c811: d0 ed     
            DEY                ; $c813: 88        
            BPL __c7fc         ; $c814: 10 e6     
            LDX #$00           ; $c816: a2 00     
__c818:     LDA __cb60,x       ; $c818: bd 60 cb  
            STA $2007          ; $c81b: 8d 07 20  
            INX                ; $c81e: e8        
            CPX #$40           ; $c81f: e0 40     
            BNE __c818         ; $c821: d0 f5     
__c823:     LDA #$06           ; $c823: a9 06     
            STA $2001          ; $c825: 8d 01 20  
            LDX #$68           ; $c828: a2 68     
            LDY #$59           ; $c82a: a0 59     
            JSR __cbe7         ; $c82c: 20 e7 cb  
            LDA $25            ; $c82f: a5 25     
            BEQ __c83a         ; $c831: f0 07     
            LDX #$88           ; $c833: a2 88     
            LDY #$d9           ; $c835: a0 d9     
            JSR __cbe7         ; $c837: 20 e7 cb  
__c83a:     LDX #$17           ; $c83a: a2 17     
            LDY #$d8           ; $c83c: a0 d8     
            JMP __cbe7         ; $c83e: 4c e7 cb  

;-------------------------------------------------------------------------------
__c841:     LDA $6e            ; $c841: a5 6e     
            CMP #$10           ; $c843: c9 10     
            bcc __c84c         ; $c845: 90 05     
            and #$03           ; $c847: 29 03     
            clc                ; $c849: 18        
            adc #$0c           ; $c84a: 69 0c     
__c84c:     asl                ; $c84c: 0a        
            tay                ; $c84d: a8        
            LDA __fb6f,y       ; $c84e: b9 6f fb  
            STA $ec            ; $c851: 85 ec     
            LDA __fb70,y       ; $c853: b9 70 fb  
            STA $ed            ; $c856: 85 ed     
            LDY #$00           ; $c858: a0 00     
__c85a:     LDA ($ec),y        ; $c85a: b1 ec     
            BPL __c8dc         ; $c85c: 10 7e     
__c85e:     LDA $6e            ; $c85e: a5 6e     
            sec                ; $c860: 38        
            sbc #$01           ; $c861: e9 01     
            LSR                ; $c863: 4a        
            LSR                ; $c864: 4a        
__c865:     CMP #$03           ; $c865: c9 03     
            bcc __c86f         ; $c867: 90 06     
            sec                ; $c869: 38        
            sbc #$03           ; $c86a: e9 03     
            JMP __c865         ; $c86c: 4c 65 c8  

;-------------------------------------------------------------------------------
__c86f:     asl                ; $c86f: 0a        
            asl                ; $c870: 0a        
            tay                ; $c871: a8        
            LDX #$00           ; $c872: a2 00     
__c874:     LDA __caef,x       ; $c874: bd ef ca  
            STA $e0,x          ; $c877: 95 e0     
            INX                ; $c879: e8        
            CPX #$10           ; $c87a: e0 10     
            BNE __c874         ; $c87c: d0 f6     
            LDA __cb4f,y       ; $c87e: b9 4f cb  
            STA $e2            ; $c881: 85 e2     
            LDA __cb50,y       ; $c883: b9 50 cb  
            STA $e3            ; $c886: 85 e3     
            LDA __cb51,y       ; $c888: b9 51 cb  
            STA $e6            ; $c88b: 85 e6     
            LDA __cb52,y       ; $c88d: b9 52 cb  
            STA $e7            ; $c890: 85 e7     
            LDA $6e            ; $c892: a5 6e     
            CMP #$12           ; $c894: c9 12     
            bcc __c89a         ; $c896: 90 02     
            LDA #$12           ; $c898: a9 12     
__c89a:     asl                ; $c89a: 0a        
            asl                ; $c89b: 0a        
            tay                ; $c89c: a8        
            LDX #$00           ; $c89d: a2 00     
__c89f:     LDA __caff,y       ; $c89f: b9 ff ca  
            STA $e8,x          ; $c8a2: 95 e8     
            INY                ; $c8a4: c8        
            INX                ; $c8a5: e8        
            CPX #$04           ; $c8a6: e0 04     
            BNE __c89f         ; $c8a8: d0 f5     
            LDA #$06           ; $c8aa: a9 06     
            STA $2001          ; $c8ac: 8d 01 20  
            LDA $2002          ; $c8af: ad 02 20  
            LDA #$3f           ; $c8b2: a9 3f     
            STA $2006          ; $c8b4: 8d 06 20  
            LDA #$00           ; $c8b7: a9 00     
            STA $2006          ; $c8b9: 8d 06 20  
            LDX #$00           ; $c8bc: a2 00     
__c8be:     LDA $e0,x          ; $c8be: b5 e0     
            STA $2007          ; $c8c0: 8d 07 20  
            INX                ; $c8c3: e8        
            CPX #$10           ; $c8c4: e0 10     
            BNE __c8be         ; $c8c6: d0 f6     
            LDA $2002          ; $c8c8: ad 02 20  
            LDA #$3f           ; $c8cb: a9 3f     
            STA $2006          ; $c8cd: 8d 06 20  
            LDA #$00           ; $c8d0: a9 00     
            STA $2006          ; $c8d2: 8d 06 20  
            STA $2006          ; $c8d5: 8d 06 20  
            STA $2006          ; $c8d8: 8d 06 20  
            RTS                ; $c8db: 60        

;-------------------------------------------------------------------------------
__c8dc:     STA $e0            ; $c8dc: 85 e0     
            asl                ; $c8de: 0a        
            adc $e0            ; $c8df: 65 e0     
            asl                ; $c8e1: 0a        
            asl                ; $c8e2: 0a        
            STA $e2            ; $c8e3: 85 e2     
            INY                ; $c8e5: c8        
            LDA ($ec),y        ; $c8e6: b1 ec     
            STA $e6            ; $c8e8: 85 e6     
            clc                ; $c8ea: 18        
            adc $e2            ; $c8eb: 65 e2     
            tax                ; $c8ed: aa        
            INY                ; $c8ee: c8        
            LDA ($ec),y        ; $c8ef: b1 ec     
            STA $0200,x        ; $c8f1: 9d 00 02  
            STA $e2            ; $c8f4: 85 e2     
            LDA $e0            ; $c8f6: a5 e0     
            asl                ; $c8f8: 0a        
            asl                ; $c8f9: 0a        
            asl                ; $c8fa: 0a        
            asl                ; $c8fb: 0a        
            STA $e8            ; $c8fc: 85 e8     
            asl $e6            ; $c8fe: 06 e6     
            tya                ; $c900: 98        
            pha                ; $c901: 48        
            JSR __d66b         ; $c902: 20 6b d6  
            LDA #$06           ; $c905: a9 06     
            STA $2001          ; $c907: 8d 01 20  
            JSR __c1dd         ; $c90a: 20 dd c1  
            pla                ; $c90d: 68        
            tay                ; $c90e: a8        
            INY                ; $c90f: c8        
            JMP __c85a         ; $c910: 4c 5a c8  

;-------------------------------------------------------------------------------
__c913:     .hex 1b 18 1e 17   ; $c913: 1b 18 1e 17   Data
            .hex 0d            ; $c917: 0d            Data

;-------------------------------------------------------------------------------
__c918:     LDA $6e            ; $c918: a5 6e     
            LDY #$00           ; $c91a: a0 00     
            CMP #$63           ; $c91c: c9 63     
            bcc __c922         ; $c91e: 90 02     
            LDA #$63           ; $c920: a9 63     
__c922:     CMP #$0a           ; $c922: c9 0a     
            bcc __c92d         ; $c924: 90 07     
            sec                ; $c926: 38        
            sbc #$0a           ; $c927: e9 0a     
            INY                ; $c929: c8        
            JMP __c922         ; $c92a: 4c 22 c9  

;-------------------------------------------------------------------------------
__c92d:     STA $e0            ; $c92d: 85 e0     
            STY $e2            ; $c92f: 84 e2     
            LDA #$06           ; $c931: a9 06     
            STA $2001          ; $c933: 8d 01 20  
            LDA $2002          ; $c936: ad 02 20  
            LDA $14            ; $c939: a5 14     
            asl                ; $c93b: 0a        
            asl                ; $c93c: 0a        
            asl                ; $c93d: 0a        
            ORA #$23           ; $c93e: 09 23     
            STA $2006          ; $c940: 8d 06 20  
            STA $e4            ; $c943: 85 e4     
            LDA #$78           ; $c945: a9 78     
            STA $2006          ; $c947: 8d 06 20  
            LDX #$00           ; $c94a: a2 00     
__c94c:     LDA __c913,x       ; $c94c: bd 13 c9  
            STA $2007          ; $c94f: 8d 07 20  
            INX                ; $c952: e8        
            CPX #$05           ; $c953: e0 05     
            BNE __c94c         ; $c955: d0 f5     
            LDA $2002          ; $c957: ad 02 20  
            LDA $e4            ; $c95a: a5 e4     
            STA $2006          ; $c95c: 8d 06 20  
            LDA #$9c           ; $c95f: a9 9c     
            STA $2006          ; $c961: 8d 06 20  
            LDA $e2            ; $c964: a5 e2     
            BNE __c96a         ; $c966: d0 02     
            LDA #$24           ; $c968: a9 24     
__c96a:     STA $2007          ; $c96a: 8d 07 20  
            LDA $e0            ; $c96d: a5 e0     
            STA $2007          ; $c96f: 8d 07 20  
            clc                ; $c972: 18        
            adc $e2            ; $c973: 65 e2     
            CMP #$0c           ; $c975: c9 0c     
            bcc __c97b         ; $c977: 90 02     
            LDA #$0c           ; $c979: a9 0c     
__c97b:     STA $e4            ; $c97b: 85 e4     
            LDA #$0c           ; $c97d: a9 0c     
            sec                ; $c97f: 38        
            sbc $e4            ; $c980: e5 e4     
            tax                ; $c982: aa        
            LDY #$0c           ; $c983: a0 0c     
            LDA #$00           ; $c985: a9 00     
__c987:     STA $00e3,y        ; $c987: 99 e3 00  
            DEY                ; $c98a: 88        
            BNE __c987         ; $c98b: d0 fa     
            LDY $e2            ; $c98d: a4 e2     
            BEQ __c99d         ; $c98f: f0 0c     
            LDA #$02           ; $c991: a9 02     
__c993:     STA $e4,x          ; $c993: 95 e4     
            INX                ; $c995: e8        
            CPX #$0c           ; $c996: e0 0c     
            BEQ __c9ad         ; $c998: f0 13     
            DEY                ; $c99a: 88        
            BNE __c993         ; $c99b: d0 f6     
__c99d:     LDY $e0            ; $c99d: a4 e0     
            BEQ __c9ad         ; $c99f: f0 0c     
            LDA #$04           ; $c9a1: a9 04     
__c9a3:     STA $e4,x          ; $c9a3: 95 e4     
            INX                ; $c9a5: e8        
            CPX #$0c           ; $c9a6: e0 0c     
            BEQ __c9ad         ; $c9a8: f0 03     
            DEY                ; $c9aa: 88        
            BNE __c9a3         ; $c9ab: d0 f6     
__c9ad:     LDA $2002          ; $c9ad: ad 02 20  
            LDA $14            ; $c9b0: a5 14     
            asl                ; $c9b2: 0a        
            asl                ; $c9b3: 0a        
            asl                ; $c9b4: 0a        
            ORA #$20           ; $c9b5: 09 20     
            STA $2006          ; $c9b7: 8d 06 20  
            LDA #$60           ; $c9ba: a9 60     
            STA $2006          ; $c9bc: 8d 06 20  
            LDX #$00           ; $c9bf: a2 00     
__c9c1:     LDA $e4,x          ; $c9c1: b5 e4     
            tay                ; $c9c3: a8        
            LDA __cadd,y       ; $c9c4: b9 dd ca  
            STA $2007          ; $c9c7: 8d 07 20  
            LDA __cade,y       ; $c9ca: b9 de ca  
            STA $2007          ; $c9cd: 8d 07 20  
            INX                ; $c9d0: e8        
            CPX #$0c           ; $c9d1: e0 0c     
            BNE __c9c1         ; $c9d3: d0 ec     
            LDA $2002          ; $c9d5: ad 02 20  
            LDA $14            ; $c9d8: a5 14     
            asl                ; $c9da: 0a        
            asl                ; $c9db: 0a        
            asl                ; $c9dc: 0a        
            ORA #$20           ; $c9dd: 09 20     
            STA $2006          ; $c9df: 8d 06 20  
            LDA #$80           ; $c9e2: a9 80     
            STA $2006          ; $c9e4: 8d 06 20  
            LDX #$00           ; $c9e7: a2 00     
__c9e9:     LDA $e4,x          ; $c9e9: b5 e4     
            tay                ; $c9eb: a8        
            LDA __cae3,y       ; $c9ec: b9 e3 ca  
            STA $2007          ; $c9ef: 8d 07 20  
            LDA __cae4,y       ; $c9f2: b9 e4 ca  
            STA $2007          ; $c9f5: 8d 07 20  
            INX                ; $c9f8: e8        
            CPX #$0c           ; $c9f9: e0 0c     
            BNE __c9e9         ; $c9fb: d0 ec     
            LDA $2002          ; $c9fd: ad 02 20  
            LDA $14            ; $ca00: a5 14     
            asl                ; $ca02: 0a        
            asl                ; $ca03: 0a        
            asl                ; $ca04: 0a        
            ORA #$20           ; $ca05: 09 20     
            STA $2006          ; $ca07: 8d 06 20  
            LDA #$a0           ; $ca0a: a9 a0     
            STA $2006          ; $ca0c: 8d 06 20  
            LDX #$00           ; $ca0f: a2 00     
__ca11:     LDA $e4,x          ; $ca11: b5 e4     
            tay                ; $ca13: a8        
            LDA __cae9,y       ; $ca14: b9 e9 ca  
            STA $2007          ; $ca17: 8d 07 20  
            LDA __caea,y       ; $ca1a: b9 ea ca  
            STA $2007          ; $ca1d: 8d 07 20  
            INX                ; $ca20: e8        
            CPX #$0c           ; $ca21: e0 0c     
            BNE __ca11         ; $ca23: d0 ec     
            RTS                ; $ca25: 60        

;-------------------------------------------------------------------------------
__ca26:     LDY $0e            ; $ca26: a4 0e     
            LDX #$00           ; $ca28: a2 00     
            LDA $24            ; $ca2a: a5 24     
            BEQ __ca30         ; $ca2c: f0 02     
            LDX #$08           ; $ca2e: a2 08     
__ca30:     LDA __cc4a,x       ; $ca30: bd 4a cc  
            STA $0500,y        ; $ca33: 99 00 05  
            INY                ; $ca36: c8        
            INX                ; $ca37: e8        
            txa                ; $ca38: 8a        
            and #$07           ; $ca39: 29 07     
            BNE __ca30         ; $ca3b: d0 f3     
            LDA #$00           ; $ca3d: a9 00     
            STA $0500,y        ; $ca3f: 99 00 05  
            STY $0e            ; $ca42: 84 0e     
            RTS                ; $ca44: 60        

;-------------------------------------------------------------------------------
__ca45:     LDA $60            ; $ca45: a5 60     
            sec                ; $ca47: 38        
            sbc #$01           ; $ca48: e9 01     
            LDX #$00           ; $ca4a: a2 00     
            LDY $0e            ; $ca4c: a4 0e     
            STA $e4            ; $ca4e: 85 e4     
__ca50:     LDA $e4            ; $ca50: a5 e4     
            CMP #$04           ; $ca52: c9 04     
            bcc __ca58         ; $ca54: 90 02     
            LDA #$03           ; $ca56: a9 03     
__ca58:     STA $e0            ; $ca58: 85 e0     
            LDA $14            ; $ca5a: a5 14     
            asl                ; $ca5c: 0a        
            asl                ; $ca5d: 0a        
            asl                ; $ca5e: 0a        
            ORA __cac6,x       ; $ca5f: 1d c6 ca  
            STA $0500,y        ; $ca62: 99 00 05  
            INY                ; $ca65: c8        
            LDA __cac5,x       ; $ca66: bd c5 ca  
            STA $0500,y        ; $ca69: 99 00 05  
            INX                ; $ca6c: e8        
            INY                ; $ca6d: c8        
            INX                ; $ca6e: e8        
            LDA #$06           ; $ca6f: a9 06     
            STA $0500,y        ; $ca71: 99 00 05  
            INY                ; $ca74: c8        
            LDA #$03           ; $ca75: a9 03     
            STA $e2            ; $ca77: 85 e2     
__ca79:     LDA $e0            ; $ca79: a5 e0     
            BEQ __ca94         ; $ca7b: f0 17     
            LDA __cac5,x       ; $ca7d: bd c5 ca  
            STA $0500,y        ; $ca80: 99 00 05  
            INY                ; $ca83: c8        
            LDA __cac6,x       ; $ca84: bd c6 ca  
            STA $0500,y        ; $ca87: 99 00 05  
            INY                ; $ca8a: c8        
            DEC $e0            ; $ca8b: c6 e0     
            DEC $e2            ; $ca8d: c6 e2     
            BNE __ca79         ; $ca8f: d0 e8     
            JMP __caa2         ; $ca91: 4c a2 ca  

;-------------------------------------------------------------------------------
__ca94:     LDA #$24           ; $ca94: a9 24     
            STA $0500,y        ; $ca96: 99 00 05  
            INY                ; $ca99: c8        
            STA $0500,y        ; $ca9a: 99 00 05  
            INY                ; $ca9d: c8        
            DEC $e2            ; $ca9e: c6 e2     
            BNE __ca94         ; $caa0: d0 f2     
__caa2:     INX                ; $caa2: e8        
            INX                ; $caa3: e8        
            CPX #$18           ; $caa4: e0 18     
            BNE __cab0         ; $caa6: d0 08     
            LDA #$00           ; $caa8: a9 00     
            STA $0500,y        ; $caaa: 99 00 05  
            STY $0e            ; $caad: 84 0e     
            RTS                ; $caaf: 60        

;-------------------------------------------------------------------------------
__cab0:     txa                ; $cab0: 8a        
            and #$07           ; $cab1: 29 07     
            BNE __ca50         ; $cab3: d0 9b     
            LDA $e4            ; $cab5: a5 e4     
            sec                ; $cab7: 38        
            sbc #$03           ; $cab8: e9 03     
            STA $e4            ; $caba: 85 e4     
            BPL __ca50         ; $cabc: 10 92     
            LDA #$00           ; $cabe: a9 00     
            STA $e4            ; $cac0: 85 e4     
            JMP __ca50         ; $cac2: 4c 50 ca  

;-------------------------------------------------------------------------------
__cac5:     .hex 98            ; $cac5: 98            Data
__cac6:     .hex 22 2c 2e b8   ; $cac6: 22 2c 2e b8   Data
            .hex 22 2d 2f d8   ; $caca: 22 2d 2f d8   Data
            .hex 22 2c 2e f8   ; $cace: 22 2c 2e f8   Data
            .hex 22 2d 2f 18   ; $cad2: 22 2d 2f 18   Data
            .hex 23 2c 2e 38   ; $cad6: 23 2c 2e 38   Data
            .hex 23 2d 2f      ; $cada: 23 2d 2f      Data
__cadd:     .hex 24            ; $cadd: 24            Data
__cade:     .hex 24 89 8b 24   ; $cade: 24 89 8b 24   Data
            .hex 24            ; $cae2: 24            Data
__cae3:     .hex 24            ; $cae3: 24            Data
__cae4:     .hex 24 84 86 8c   ; $cae4: 24 84 86 8c   Data
            .hex 8e            ; $cae8: 8e            Data
__cae9:     .hex 24            ; $cae9: 24            Data
__caea:     .hex 24 85 87 8d   ; $caea: 24 85 87 8d   Data
            .hex 8f            ; $caee: 8f            Data
__caef:     .hex 0f 16 00 00   ; $caef: 0f 16 00 00   Data
            .hex 0f 30 00 00   ; $caf3: 0f 30 00 00   Data
            .hex 0f 00 01 02   ; $caf7: 0f 00 01 02   Data
            .hex 0f 30 19 16   ; $cafb: 0f 30 19 16   Data
__caff:     .hex 0f 16 1a 28   ; $caff: 0f 16 1a 28   Data
            .hex 0f 16 1a 28   ; $cb03: 0f 16 1a 28   Data
            .hex 0f 30 1a 28   ; $cb07: 0f 30 1a 28   Data
            .hex 0f 28 38 16   ; $cb0b: 0f 28 38 16   Data
            .hex 0f 16 1a 28   ; $cb0f: 0f 16 1a 28   Data
            .hex 0f 16 1a 28   ; $cb13: 0f 16 1a 28   Data
            .hex 0f 23 20 13   ; $cb17: 0f 23 20 13   Data
            .hex 0f 23 20 13   ; $cb1b: 0f 23 20 13   Data
            .hex 0f 30 1a 28   ; $cb1f: 0f 30 1a 28   Data
            .hex 0f 30 1a 28   ; $cb23: 0f 30 1a 28   Data
            .hex 0f 16 26 1a   ; $cb27: 0f 16 26 1a   Data
            .hex 0f 16 26 1a   ; $cb2b: 0f 16 26 1a   Data
            .hex 0f 27 37 00   ; $cb2f: 0f 27 37 00   Data
            .hex 0f 27 37 00   ; $cb33: 0f 27 37 00   Data
            .hex 0f 16 1a 28   ; $cb37: 0f 16 1a 28   Data
            .hex 0f 16 1a 28   ; $cb3b: 0f 16 1a 28   Data
            .hex 0f 16 28 11   ; $cb3f: 0f 16 28 11   Data
            .hex 0f 16 28 11   ; $cb43: 0f 16 28 11   Data
            .hex 0f 26 1a 28   ; $cb47: 0f 26 1a 28   Data
            .hex 0f 26 1a 28   ; $cb4b: 0f 26 1a 28   Data
__cb4f:     .hex 38            ; $cb4f: 38            Data
__cb50:     .hex 27            ; $cb50: 27            Data
__cb51:     .hex 27            ; $cb51: 27            Data
__cb52:     .hex 17 32 29 38   ; $cb52: 17 32 29 38   Data
            .hex 27 10 29 22   ; $cb56: 27 10 29 22   Data
            .hex 19            ; $cb5a: 19            Data
__cb5b:     .hex 57 56 57 56   ; $cb5b: 57 56 57 56   Data
            .hex 54            ; $cb5f: 54            Data
__cb60:     .hex ff ff ff ff   ; $cb60: ff ff ff ff   Data
            .hex ff ff 00 00   ; $cb64: ff ff 00 00   Data
            .hex 0f 0f 0f 0f   ; $cb68: 0f 0f 0f 0f   Data
            .hex 0f 0f 50 50   ; $cb6c: 0f 0f 50 50   Data
            .hex 00 00 00 00   ; $cb70: 00 00 00 00   Data
            .hex 00 00 50 50   ; $cb74: 00 00 50 50   Data
            .hex 00 00 00 00   ; $cb78: 00 00 00 00   Data
            .hex 00 00 50 50   ; $cb7c: 00 00 50 50   Data
            .hex 50 50 58 50   ; $cb80: 50 50 58 50   Data
            .hex 50 50 55 55   ; $cb84: 50 50 55 55   Data
            .hex 55 55 55 55   ; $cb88: 55 55 55 55   Data
            .hex 55 55 ff ff   ; $cb8c: 55 55 ff ff   Data
            .hex 55 55 55 55   ; $cb90: 55 55 55 55   Data
            .hex 55 55 5f 5f   ; $cb94: 55 55 5f 5f   Data
            .hex 55 55 55 55   ; $cb98: 55 55 55 55   Data
            .hex 55 55 55 55   ; $cb9c: 55 55 55 55   Data

;-------------------------------------------------------------------------------
__cba0:     STA $2007          ; $cba0: 8d 07 20  
            DEX                ; $cba3: ca        
            BNE __cba0         ; $cba4: d0 fa     
            RTS                ; $cba6: 60        

;-------------------------------------------------------------------------------
__cba7:     LDA $2002          ; $cba7: ad 02 20  
            LDA __cc5a,x       ; $cbaa: bd 5a cc  
            INX                ; $cbad: e8        
            STA $e8            ; $cbae: 85 e8     
            LDA __cc5a,x       ; $cbb0: bd 5a cc  
            INX                ; $cbb3: e8        
            STA $e9            ; $cbb4: 85 e9     
            STY $e6            ; $cbb6: 84 e6     
            LDY #$01           ; $cbb8: a0 01     
            LDA ($e8),y        ; $cbba: b1 e8     
            STA $2006          ; $cbbc: 8d 06 20  
            LDY #$00           ; $cbbf: a0 00     
            LDA ($e8),y        ; $cbc1: b1 e8     
            STA $2006          ; $cbc3: 8d 06 20  
            LDY #$02           ; $cbc6: a0 02     
            LDA ($e8),y        ; $cbc8: b1 e8     
            STA $e0            ; $cbca: 85 e0     
__cbcc:     INY                ; $cbcc: c8        
            LDA ($e8),y        ; $cbcd: b1 e8     
            STA $2007          ; $cbcf: 8d 07 20  
            DEC $e0            ; $cbd2: c6 e0     
            BNE __cbcc         ; $cbd4: d0 f6     
            LDY $e6            ; $cbd6: a4 e6     
            RTS                ; $cbd8: 60        

;-------------------------------------------------------------------------------
__cbd9:     LDY #$96           ; $cbd9: a0 96     
            LDX #$88           ; $cbdb: a2 88     
            JMP __cc21         ; $cbdd: 4c 21 cc  

;-------------------------------------------------------------------------------
__cbe0:     LDY #$84           ; $cbe0: a0 84     
            LDX #$68           ; $cbe2: a2 68     
            JMP __cc21         ; $cbe4: 4c 21 cc  

;-------------------------------------------------------------------------------
__cbe7:     LDA $2002          ; $cbe7: ad 02 20  
            tya                ; $cbea: 98        
            and #$01           ; $cbeb: 29 01     
            ORA #$20           ; $cbed: 09 20     
            STA $2006          ; $cbef: 8d 06 20  
            tya                ; $cbf2: 98        
            and #$fe           ; $cbf3: 29 fe     
            STA $2006          ; $cbf5: 8d 06 20  
            STY $e6            ; $cbf8: 84 e6     
            STX $e4            ; $cbfa: 86 e4     
            JSR __cc14         ; $cbfc: 20 14 cc  
            LDA $2002          ; $cbff: ad 02 20  
            LDA $e6            ; $cc02: a5 e6     
            and #$01           ; $cc04: 29 01     
            ORA #$28           ; $cc06: 09 28     
            STA $2006          ; $cc08: 8d 06 20  
            LDA $e6            ; $cc0b: a5 e6     
            and #$fe           ; $cc0d: 29 fe     
            STA $2006          ; $cc0f: 8d 06 20  
            LDX $e4            ; $cc12: a6 e4     
__cc14:     LDY #$05           ; $cc14: a0 05     
            LDA $00,x          ; $cc16: b5 00     
            BNE __cc40         ; $cc18: d0 26     
            JMP __cc37         ; $cc1a: 4c 37 cc  

;-------------------------------------------------------------------------------
__cc1d:     LDY #$8d           ; $cc1d: a0 8d     
            LDX #$17           ; $cc1f: a2 17     
__cc21:     LDA $2002          ; $cc21: ad 02 20  
            LDA #$20           ; $cc24: a9 20     
            STA $2006          ; $cc26: 8d 06 20  
            STY $2006          ; $cc29: 8c 06 20  
            LDY #$05           ; $cc2c: a0 05     
__cc2e:     LDA $00,x          ; $cc2e: b5 00     
            BNE __cc3d         ; $cc30: d0 0b     
            LDA #$24           ; $cc32: a9 24     
            STA $2007          ; $cc34: 8d 07 20  
__cc37:     INX                ; $cc37: e8        
            DEY                ; $cc38: 88        
            BNE __cc2e         ; $cc39: d0 f3     
__cc3b:     LDA $00,x          ; $cc3b: b5 00     
__cc3d:     STA $2007          ; $cc3d: 8d 07 20  
__cc40:     INX                ; $cc40: e8        
            DEY                ; $cc41: 88        
            BPL __cc3b         ; $cc42: 10 f7     
            LDA #$00           ; $cc44: a9 00     
            STA $2007          ; $cc46: 8d 07 20  
            RTS                ; $cc49: 60        

;-------------------------------------------------------------------------------
__cc4a:     .hex 21 ea 01 2a   ; $cc4a: 21 ea 01 2a   Data
            .hex 22 2a 01 24   ; $cc4e: 22 2a 01 24   Data
            .hex 21 ea 01 24   ; $cc52: 21 ea 01 24   Data
            .hex 22 2a 01 2a   ; $cc56: 22 2a 01 2a   Data
__cc5a:     .hex ed cc f3 cc   ; $cc5a: ed cc f3 cc   Data
            .hex 04 cd 1b cd   ; $cc5e: 04 cd 1b cd   Data
            .hex 32 cd 49 cd   ; $cc62: 32 cd 49 cd   Data
            .hex 60 cd 77 cd   ; $cc66: 60 cd 77 cd   Data
            .hex 82 cd 8e cd   ; $cc6a: 82 cd 8e cd   Data
            .hex 99 cd b2 cd   ; $cc6e: 99 cd b2 cd   Data
            .hex 9a cc fe cc   ; $cc72: 9a cc fe cc   Data
            .hex 7e cc 84 cc   ; $cc76: 7e cc 84 cc   Data
            .hex 8c cc 92 cc   ; $cc7a: 8c cc 92 cc   Data
            .hex 98 20 03 11   ; $cc7e: 98 20 03 11   Data
            .hex 12 27 b9 20   ; $cc82: 12 27 b9 20   Data
            .hex 05 1c 0c 18   ; $cc86: 05 1c 0c 18   Data
            .hex 1b 0e 98 28   ; $cc8a: 1b 0e 98 28   Data
            .hex 03 11 12 27   ; $cc8e: 03 11 12 27   Data
            .hex b9 28 05 1c   ; $cc92: b9 28 05 1c   Data
            .hex 0c 18 1b 0e   ; $cc96: 0c 18 1b 0e   Data
            .hex c0 23 40 00   ; $cc9a: c0 23 40 00   Data
            .hex 00 00 00 00   ; $cc9e: 00 00 00 00   Data
            .hex 00 00 00 a5   ; $cca2: 00 00 00 a5   Data
            .hex a5 a5 a5 a5   ; $cca6: a5 a5 a5 a5   Data
            .hex a5 a5 a5 aa   ; $ccaa: a5 a5 a5 aa   Data
            .hex aa aa aa aa   ; $ccae: aa aa aa aa   Data
            .hex aa aa aa 55   ; $ccb2: aa aa aa 55   Data
            .hex 55 55 55 55   ; $ccb6: 55 55 55 55   Data
            .hex 55 55 55 55   ; $ccba: 55 55 55 55   Data
            .hex 55 55 55 55   ; $ccbe: 55 55 55 55   Data
            .hex 55 55 55 50   ; $ccc2: 55 55 55 50   Data
            .hex 50 50 50 5f   ; $ccc6: 50 50 50 5f   Data
            .hex 5f 5f 5f 55   ; $ccca: 5f 5f 5f 55   Data
            .hex 55 55 55 55   ; $ccce: 55 55 55 55   Data
            .hex 55 55 55 55   ; $ccd2: 55 55 55 55   Data
            .hex 55 55 55 55   ; $ccd6: 55 55 55 55   Data
            .hex 55 55 55      ; $ccda: 55 55 55      Data
__ccdd:     .hex 0f 16 0f 16   ; $ccdd: 0f 16 0f 16   Data
            .hex 0f 30 30 30   ; $cce1: 0f 30 30 30   Data
            .hex 0f 28 16 02   ; $cce5: 0f 28 16 02   Data
            .hex 0f 0f 16 16   ; $cce9: 0f 0f 16 16   Data
            .hex 64 20 03 01   ; $cced: 64 20 03 01   Data
            .hex 1e 19 6c 20   ; $ccf1: 1e 19 6c 20   Data
            .hex 08 11 12 27   ; $ccf5: 08 11 12 27   Data
            .hex 1c 0c 18 1b   ; $ccf9: 1c 0c 18 1b   Data
            .hex 0e 76 20 03   ; $ccfd: 0e 76 20 03   Data
            .hex 02 1e 19 e7   ; $cd01: 02 1e 19 e7   Data
            .hex 20 14 90 92   ; $cd05: 20 14 90 92   Data
            .hex 94 96 98 9a   ; $cd09: 94 96 98 9a   Data
            .hex 9c 92 a0 24   ; $cd0d: 9c 92 a0 24   Data
            .hex 90 92 94 a2   ; $cd11: 90 92 94 a2   Data
            .hex a4 a6 a5 9c   ; $cd15: a4 a6 a5 9c   Data
            .hex 92 a0 07 21   ; $cd19: 92 a0 07 21   Data
            .hex 14 91 93 95   ; $cd1d: 14 91 93 95   Data
            .hex 97 99 9b 9d   ; $cd21: 97 99 9b 9d   Data
            .hex 9f a1 24 91   ; $cd25: 9f a1 24 91   Data
            .hex 93 95 a3 9e   ; $cd29: 93 95 a3 9e   Data
            .hex 95 9b 9d 9f   ; $cd2d: 95 9b 9d 9f   Data
            .hex a1 27 21 14   ; $cd31: a1 27 21 14   Data
            .hex 91 9e 95 a7   ; $cd35: 91 9e 95 a7   Data
            .hex b0 b2 b4 b6   ; $cd39: b0 b2 b4 b6   Data
            .hex b8 24 91 9e   ; $cd3d: b8 24 91 9e   Data
            .hex 95 ba 9e 95   ; $cd41: 95 ba 9e 95   Data
            .hex b2 b4 b6 b8   ; $cd45: b2 b4 b6 b8   Data
            .hex 47 21 14 a8   ; $cd49: 47 21 14 a8   Data
            .hex aa ac ae b1   ; $cd4d: aa ac ae b1   Data
            .hex b3 b5 b7 b9   ; $cd51: b3 b5 b7 b9   Data
            .hex 24 a8 aa ac   ; $cd55: 24 a8 aa ac   Data
            .hex bb c0 c2 b3   ; $cd59: bb c0 c2 b3   Data
            .hex b5 b7 b9 67   ; $cd5d: b5 b7 b9 67   Data
            .hex 21 14 a9 ab   ; $cd61: 21 14 a9 ab   Data
            .hex ad af bc be   ; $cd65: ad af bc be   Data
            .hex ab ab bd 24   ; $cd69: ab ab bd 24   Data
            .hex a9 ab ad bf   ; $cd6d: a9 ab ad bf   Data
            .hex ab c1 c3 ab   ; $cd71: ab c1 c3 ab   Data
            .hex ab bd ec 21   ; $cd75: ab bd ec 21   Data
            .hex 08 01 24 19   ; $cd79: 08 01 24 19   Data
            .hex 15 0a 22 0e   ; $cd7d: 15 0a 22 0e   Data
            .hex 1b 2c 22 09   ; $cd81: 1b 2c 22 09   Data
            .hex 02 24 19 15   ; $cd85: 02 24 19 15   Data
            .hex 0a 22 0e 1b   ; $cd89: 0a 22 0e 1b   Data
            .hex 1c ac 22 08   ; $cd8d: 1c ac 22 08   Data
            .hex 30 31 32 33   ; $cd91: 30 31 32 33   Data
            .hex 30 31 32 33   ; $cd95: 30 31 32 33   Data
            .hex e5 22 16 28   ; $cd99: e5 22 16 28   Data
            .hex 24 01 09 08   ; $cd9d: 24 01 09 08   Data
            .hex 02 24 01 09   ; $cda1: 02 24 01 09   Data
            .hex 08 05 24 17   ; $cda5: 08 05 24 17   Data
            .hex 0a 16 0c 18   ; $cda9: 0a 16 0c 18   Data
            .hex 24 15 1d 0d   ; $cdad: 24 15 1d 0d   Data
            .hex 26 27 23 13   ; $cdb1: 26 27 23 13   Data
            .hex 0a 15 15 24   ; $cdb5: 0a 15 15 24   Data
            .hex 1b 12 10 11   ; $cdb9: 1b 12 10 11   Data
            .hex 1d 1c 24 1b   ; $cdbd: 1d 1c 24 1b   Data
            .hex 0e 1c 0e 1b   ; $cdc1: 0e 1c 0e 1b   Data
            .hex 1f 0e 0d      ; $cdc5: 1f 0e 0d      Data

;-------------------------------------------------------------------------------
            LDA #$00           ; $cdc8: a9 00     
            STA $05f5          ; $cdca: 8d f5 05  
            STA $05f6          ; $cdcd: 8d f6 05  
            LDY $b0            ; $cdd0: a4 b0     
            LDA __cddf,y       ; $cdd2: b9 df cd  
            STA $ea            ; $cdd5: 85 ea     
            LDA __cde0,y       ; $cdd7: b9 e0 cd  
            STA $eb            ; $cdda: 85 eb     
            JMP ($00ea)        ; $cddc: 6c ea 00  

;-------------------------------------------------------------------------------
__cddf:     .hex 12            ; $cddf: 12            Data
__cde0:     .hex d3 1b cf 63   ; $cde0: d3 1b cf 63   Data
            .hex ce 4d ce ed   ; $cde4: ce 4d ce ed   Data
            .hex cd 12 ce 03   ; $cde8: cd 12 ce 03   Data
            .hex ce            ; $cDEC: ce            Data

;-------------------------------------------------------------------------------
            DEC $0480          ; $cded: ce 80 04  
            BNE __ce3b         ; $cdf0: d0 49     
__cdf2:     LDA #$0a           ; $cdf2: a9 0a     
            STA $b0            ; $cdf4: 85 b0     
            LDA #$01           ; $cdf6: a9 01     
            STA $05e3          ; $cdf8: 8d e3 05  
            STA $05e4          ; $cdfb: 8d e4 05  
            LDA #$10           ; $cdfe: a9 10     
            STA $0480          ; $ce00: 8d 80 04  
            LDY #$10           ; $ce03: a0 10     
            LDA $0410          ; $ce05: ad 10 04  
            and #$30           ; $ce08: 29 30     
            BEQ __ce0e         ; $ce0a: f0 02     
            LDY #$15           ; $ce0c: a0 15     
__ce0e:     tya                ; $ce0e: 98        
            STA $0460          ; $ce0f: 8d 60 04  
            DEC $0480          ; $ce12: ce 80 04  
            BEQ __ce1a         ; $ce15: f0 03     
            JMP __e70d         ; $ce17: 4c 0d e7  

;-------------------------------------------------------------------------------
__ce1a:     LDA $b0            ; $ce1a: a5 b0     
            CMP #$0c           ; $ce1c: c9 0c     
            BEQ __cdf2         ; $ce1e: f0 d2     
            INC $0460          ; $ce20: ee 60 04  
            LDA $0460          ; $ce23: ad 60 04  
            CMP #$15           ; $ce26: c9 15     
            BEQ __ce36         ; $ce28: f0 0c     
            CMP #$1a           ; $ce2a: c9 1a     
            BEQ __ce36         ; $ce2c: f0 08     
            LDA #$10           ; $ce2e: a9 10     
            STA $0480          ; $ce30: 8d 80 04  
            JMP __e70d         ; $ce33: 4c 0d e7  

;-------------------------------------------------------------------------------
__ce36:     LDA #$00           ; $ce36: a9 00     
            STA $a0            ; $ce38: 85 a0     
            RTS                ; $ce3a: 60        

;-------------------------------------------------------------------------------
__ce3b:     LDA $0410          ; $ce3b: ad 10 04  
            LDY #$0c           ; $ce3e: a0 0c     
            and #$30           ; $ce40: 29 30     
            BEQ __ce46         ; $ce42: f0 02     
            LDY #$0e           ; $ce44: a0 0e     
__ce46:     tya                ; $ce46: 98        
            STA $0460          ; $ce47: 8d 60 04  
            JMP __e70d         ; $ce4a: 4c 0d e7  

;-------------------------------------------------------------------------------
            INC $d0            ; $ce4d: e6 d0     
            INC $d0            ; $ce4f: e6 d0     
            LDY #$0d           ; $ce51: a0 0d     
            LDA $0410          ; $ce53: ad 10 04  
            and #$30           ; $ce56: 29 30     
            BEQ __ce5c         ; $ce58: f0 02     
            LDY #$0f           ; $ce5a: a0 0f     
__ce5c:     tya                ; $ce5c: 98        
            STA $0460          ; $ce5d: 8d 60 04  
            JMP __e70d         ; $ce60: 4c 0d e7  

;-------------------------------------------------------------------------------
            LDA $48            ; $ce63: a5 48     
            and #$03           ; $ce65: 29 03     
            BNE __cea1         ; $ce67: d0 38     
            LDA $49            ; $ce69: a5 49     
            and #$03           ; $ce6b: 29 03     
            BEQ __ce7d         ; $ce6d: f0 0e     
            DEC $0480          ; $ce6f: ce 80 04  
            BPL __ceba         ; $ce72: 10 46     
            LDX $04b0          ; $ce74: ae b0 04  
            JSR __cfee         ; $ce77: 20 ee cf  
            JMP __ceba         ; $ce7a: 4c ba ce  

;-------------------------------------------------------------------------------
__ce7d:     LDA $49            ; $ce7d: a5 49     
            and #$f0           ; $ce7f: 29 f0     
            BNE __ce8e         ; $ce81: d0 0b     
            LDX $04b0          ; $ce83: ae b0 04  
            LDA $b0,x          ; $ce86: b5 b0     
            LDX #$00           ; $ce88: a2 00     
            CMP #$04           ; $ce8a: c9 04     
            BEQ __cecb         ; $ce8c: f0 3d     
__ce8e:     LDA #$00           ; $ce8e: a9 00     
            STA $b0            ; $ce90: 85 b0     
            LDA $0460          ; $ce92: ad 60 04  
            and #$02           ; $ce95: 29 02     
            ORA #$04           ; $ce97: 09 04     
            STA $0460          ; $ce99: 8d 60 04  
            LDX #$00           ; $ce9c: a2 00     
            JMP __d312         ; $ce9e: 4c 12 d3  

;-------------------------------------------------------------------------------
__cea1:     LDX $04b0          ; $cea1: ae b0 04  
            LDA $0480,x        ; $cea4: bd 80 04  
            adc #$05           ; $cea7: 69 05     
            STA $0480,x        ; $cea9: 9d 80 04  
            LDA $0480          ; $ceac: ad 80 04  
            sec                ; $ceaf: 38        
            sbc #$08           ; $ceb0: e9 08     
            STA $0480          ; $ceb2: 8d 80 04  
            BPL __ceba         ; $ceb5: 10 03     
            JSR __cfee         ; $ceb7: 20 ee cf  
__ceba:     LDX $04b0          ; $ceba: ae b0 04  
            LDA $b0,x          ; $cebd: b5 b0     
            CMP #$04           ; $cebf: c9 04     
            BNE __ce8e         ; $cec1: d0 cb     
            INC $0480,x        ; $cec3: fe 80 04  
            INC $0480,x        ; $cec6: fe 80 04  
            LDX #$00           ; $cec9: a2 00     
__cecb:     LDA $0480          ; $cecb: ad 80 04  
            LSR                ; $cece: 4a        
            LSR                ; $cecf: 4a        
            LSR                ; $ced0: 4a        
            LSR                ; $ced1: 4a        
            and #$01           ; $ced2: 29 01     
            ORA #$08           ; $ced4: 09 08     
            STA $e0            ; $ced6: 85 e0     
            LDA $0460          ; $ced8: ad 60 04  
            and #$02           ; $cedb: 29 02     
            ORA $e0            ; $cedd: 05 e0     
            STA $0460          ; $cedf: 8d 60 04  
            JSR __e70d         ; $cee2: 20 0d e7  
            LDA $0410          ; $cee5: ad 10 04  
            LSR                ; $cee8: 4a        
            LSR                ; $cee9: 4a        
            LSR                ; $ceea: 4a        
            and #$1e           ; $ceeb: 29 1e     
            tay                ; $ceed: a8        
            LDA __cefb,y       ; $ceee: b9 fb ce  
            STA $ea            ; $cef1: 85 ea     
            LDA __cefc,y       ; $cef3: b9 fc ce  
            STA $eb            ; $cef6: 85 eb     
            JMP ($00ea)        ; $cef8: 6c ea 00  

;-------------------------------------------------------------------------------
__cefb:     .hex 11            ; $cefb: 11            Data
__cefc:     .hex d4 e3 d0 81   ; $cefc: d4 e3 d0 81   Data
            .hex d1 11 d4 72   ; $cf00: d1 11 d4 72   Data
            .hex cf 72 cf 81   ; $cf04: cf 72 cf 81   Data
            .hex d1 72 cf 64   ; $cf08: d1 72 cf 64   Data
            .hex d0 e3 d0 64   ; $cf0c: d0 e3 d0 64   Data
            .hex d0 64 d0 11   ; $cf10: d0 64 d0 11   Data
            .hex d4 e3 d0 81   ; $cf14: d4 e3 d0 81   Data
            .hex d1 11 d4      ; $cf18: d1 11 d4      Data

;-------------------------------------------------------------------------------
            JSR __e70d         ; $cf1b: 20 0d e7  
            INC $04a0          ; $cf1e: ee a0 04  
            LDA $04a0          ; $cf21: ad a0 04  
            CMP #$1e           ; $cf24: c9 1e     
            BNE __cf37         ; $cf26: d0 0f     
            LDA #$00           ; $cf28: a9 00     
            STA $b0            ; $cf2a: 85 b0     
            LDA $0460          ; $cf2c: ad 60 04  
            and #$02           ; $cf2f: 29 02     
            ORA #$04           ; $cf31: 09 04     
            STA $0460          ; $cf33: 8d 60 04  
            RTS                ; $cf36: 60        

;-------------------------------------------------------------------------------
__cf37:     CMP #$15           ; $cf37: c9 15     
            bcc __cf3c         ; $cf39: 90 01     
            RTS                ; $cf3b: 60        

;-------------------------------------------------------------------------------
__cf3c:     LDA $0410          ; $cf3c: ad 10 04  
            LSR                ; $cf3f: 4a        
            LSR                ; $cf40: 4a        
            LSR                ; $cf41: 4a        
            and #$1e           ; $cf42: 29 1e     
            tay                ; $cf44: a8        
            LDA __cf52,y       ; $cf45: b9 52 cf  
            STA $ea            ; $cf48: 85 ea     
            LDA __cf53,y       ; $cf4a: b9 53 cf  
            STA $eb            ; $cf4d: 85 eb     
            JMP ($00ea)        ; $cf4f: 6c ea 00  

;-------------------------------------------------------------------------------
__cf52:     .hex 11            ; $cf52: 11            Data
__cf53:     .hex d4 29 d1 c7   ; $cf53: d4 29 d1 c7   Data
            .hex d1 11 d4 ab   ; $cf57: d1 11 d4 ab   Data
            .hex cf ab cf c7   ; $cf5b: cf ab cf c7   Data
            .hex d1 ab cf 9d   ; $cf5f: d1 ab cf 9d   Data
            .hex d0 29 d1 9d   ; $cf63: d0 29 d1 9d   Data
            .hex d0 9d d0 11   ; $cf67: d0 9d d0 11   Data
            .hex d4 29 d1 c7   ; $cf6b: d4 29 d1 c7   Data
            .hex d1 11 d4      ; $cf6f: d1 11 d4      Data

;-------------------------------------------------------------------------------
__cf72:     LDA $04a0          ; $cf72: ad a0 04  
            clc                ; $cf75: 18        
            adc #$03           ; $cf76: 69 03     
            LSR                ; $cf78: 4a        
            LSR                ; $cf79: 4a        
            STA $e4            ; $cf7a: 85 e4     
            LDA $04a0          ; $cf7c: ad a0 04  
            asl                ; $cf7f: 0a        
            STA $e0            ; $cf80: 85 e0     
            LDA $c0            ; $cf82: a5 c0     
            sec                ; $cf84: 38        
            sbc $e0            ; $cf85: e5 e0     
            STA $ec            ; $cf87: 85 ec     
            clc                ; $cf89: 18        
            adc #$08           ; $cf8a: 69 08     
            STA $e0            ; $cf8c: 85 e0     
            LDA $d0            ; $cf8e: a5 d0     
            STA $ed            ; $cf90: 85 ed     
            clc                ; $cf92: 18        
            adc #$1f           ; $cf93: 69 1f     
            STA $e2            ; $cf95: 85 e2     
            LDA $0470          ; $cf97: ad 70 04  
            ORA #$01           ; $cf9a: 09 01     
            STA $e6            ; $cf9c: 85 e6     
            LDA #$08           ; $cf9e: a9 08     
            STA $e1            ; $cfa0: 85 e1     
            LDA #$00           ; $cfa2: a9 00     
            STA $e3            ; $cfa4: 85 e3     
            LDX #$00           ; $cfa6: a2 00     
            JMP __d21f         ; $cfa8: 4c 1f d2  

;-------------------------------------------------------------------------------
            JSR __cf72         ; $cfab: 20 72 cf  
__cfae:     LDA $a0,x          ; $cfae: b5 a0     
            CMP #$04           ; $cfb0: c9 04     
            BEQ __cfcc         ; $cfb2: f0 18     
            CMP #$06           ; $cfb4: c9 06     
            BEQ __cfcc         ; $cfb6: f0 14     
__cfb8:     INX                ; $cfb8: e8        
            CPX #$0e           ; $cfb9: e0 0e     
            BNE __cfae         ; $cfbb: d0 f1     
            LDX #$00           ; $cfbd: a2 00     
            JSR __eca2         ; $cfbf: 20 a2 ec  
            CMP $e2            ; $cfc2: c5 e2     
            BEQ __cfcb         ; $cfc4: f0 05     
            LDA #$15           ; $cfc6: a9 15     
            STA $04a0          ; $cfc8: 8d a0 04  
__cfcb:     RTS                ; $cfcb: 60        

;-------------------------------------------------------------------------------
__cfcc:     LDA $b0,x          ; $cfcc: b5 b0     
            CMP #$05           ; $cfce: c9 05     
            bcc __cfd6         ; $cfd0: 90 04     
            CMP #$0c           ; $cfd2: c9 0c     
            bcc __cfb8         ; $cfd4: 90 e2     
__cfd6:     LDA $d0,x          ; $cfd6: b5 d0     
            sec                ; $cfd8: 38        
            sbc $ed            ; $cfd9: e5 ed     
            clc                ; $cfdb: 18        
            adc #$03           ; $cfdc: 69 03     
            CMP #$0b           ; $cfde: c9 0b     
            BCS __cfb8         ; $cfe0: b0 d6     
            LDA $c0,x          ; $cfe2: b5 c0     
            sec                ; $cfe4: 38        
            sbc $ec            ; $cfe5: e5 ec     
            clc                ; $cfe7: 18        
            adc #$0e           ; $cfe8: 69 0e     
            CMP #$11           ; $cfea: c9 11     
            BCS __cfb8         ; $cfec: b0 ca     
__cfee:     LDA #$01           ; $cfee: a9 01     
            STA $05f0          ; $cff0: 8d f0 05  
            LDA #$04           ; $cff3: a9 04     
            STA $b0            ; $cff5: 85 b0     
            CMP $b0,x          ; $cff7: d5 b0     
            BEQ __d026         ; $cff9: f0 2b     
            STA $b0,x          ; $cffb: 95 b0     
            LDA $a0,x          ; $cffd: b5 a0     
            asl                ; $cfff: 0a        
            asl                ; $d000: 0a        
            and #$08           ; $d001: 29 08     
            clc                ; $d003: 18        
            adc #$1c           ; $d004: 69 1c     
            STA $0460,x        ; $d006: 9d 60 04  
            LDA #$14           ; $d009: a9 14     
            STA $0480          ; $d00b: 8d 80 04  
            LDA $34            ; $d00e: a5 34     
            adc #$0c           ; $d010: 69 0c     
            STA $0480,x        ; $d012: 9d 80 04  
            LDA $a0,x          ; $d015: b5 a0     
            CMP #$06           ; $d017: c9 06     
            BNE __d05e         ; $d019: d0 43     
            LDA $0470,x        ; $d01b: bd 70 04  
            ORA #$02           ; $d01e: 09 02     
            STA $0470,x        ; $d020: 9d 70 04  
            JMP __d05e         ; $d023: 4c 5e d0  

;-------------------------------------------------------------------------------
__d026:     INC $0460,x        ; $d026: fe 60 04  
            LDA $34            ; $d029: a5 34     
            STA $0480,x        ; $d02b: 9d 80 04  
            LDA #$1f           ; $d02e: a9 1f     
            STA $0480          ; $d030: 8d 80 04  
            LDA $0460,x        ; $d033: bd 60 04  
            and #$07           ; $d036: 29 07     
            CMP #$07           ; $d038: c9 07     
            BNE __d05e         ; $d03a: d0 22     
            LDA #$01           ; $d03c: a9 01     
            STA $05ee          ; $d03e: 8d ee 05  
            LDA #$0a           ; $d041: a9 0a     
            STA $b0,x          ; $d043: 95 b0     
            LDA #$20           ; $d045: a9 20     
            STA $0480,x        ; $d047: 9d 80 04  
            LDA $0410          ; $d04a: ad 10 04  
            STA $04d0,x        ; $d04d: 9d d0 04  
            LDA #$00           ; $d050: a9 00     
            STA $b0            ; $d052: 85 b0     
            LDA $0460          ; $d054: ad 60 04  
            and #$02           ; $d057: 29 02     
            ORA #$04           ; $d059: 09 04     
            STA $0460          ; $d05b: 8d 60 04  
__d05e:     STX $04b0          ; $d05e: 8e b0 04  
            LDX #$00           ; $d061: a2 00     
            RTS                ; $d063: 60        

;-------------------------------------------------------------------------------
__d064:     LDA $04a0          ; $d064: ad a0 04  
            clc                ; $d067: 18        
            adc #$03           ; $d068: 69 03     
            LSR                ; $d06a: 4a        
            LSR                ; $d06b: 4a        
            STA $e4            ; $d06c: 85 e4     
            LDA $04a0          ; $d06e: ad a0 04  
            asl                ; $d071: 0a        
            STA $e0            ; $d072: 85 e0     
            LDA $c0            ; $d074: a5 c0     
            clc                ; $d076: 18        
            adc $e0            ; $d077: 65 e0     
            STA $ec            ; $d079: 85 ec     
            clc                ; $d07b: 18        
            adc #$10           ; $d07c: 69 10     
            STA $e0            ; $d07e: 85 e0     
            LDA $d0            ; $d080: a5 d0     
            STA $ed            ; $d082: 85 ed     
            clc                ; $d084: 18        
            adc #$1f           ; $d085: 69 1f     
            STA $e2            ; $d087: 85 e2     
            LDA $0470          ; $d089: ad 70 04  
            ORA #$01           ; $d08c: 09 01     
            STA $e6            ; $d08e: 85 e6     
            LDA #$f8           ; $d090: a9 f8     
            STA $e1            ; $d092: 85 e1     
            LDA #$00           ; $d094: a9 00     
            STA $e3            ; $d096: 85 e3     
            LDX #$00           ; $d098: a2 00     
            JMP __d21f         ; $d09a: 4c 1f d2  

;-------------------------------------------------------------------------------
            JSR __d064         ; $d09d: 20 64 d0  
__d0a0:     LDA $a0,x          ; $d0a0: b5 a0     
            CMP #$04           ; $d0a2: c9 04     
            BEQ __d0be         ; $d0a4: f0 18     
            CMP #$06           ; $d0a6: c9 06     
            BEQ __d0be         ; $d0a8: f0 14     
__d0aa:     INX                ; $d0aa: e8        
            CPX #$0e           ; $d0ab: e0 0e     
            BNE __d0a0         ; $d0ad: d0 f1     
            LDX #$00           ; $d0af: a2 00     
            JSR __ec5c         ; $d0b1: 20 5c ec  
            CMP $e2            ; $d0b4: c5 e2     
            BEQ __d0bd         ; $d0b6: f0 05     
            LDA #$15           ; $d0b8: a9 15     
            STA $04a0          ; $d0ba: 8d a0 04  
__d0bd:     RTS                ; $d0bd: 60        

;-------------------------------------------------------------------------------
__d0be:     LDA $b0,x          ; $d0be: b5 b0     
            CMP #$05           ; $d0c0: c9 05     
            bcc __d0c8         ; $d0c2: 90 04     
            CMP #$0c           ; $d0c4: c9 0c     
            bcc __d0aa         ; $d0c6: 90 e2     
__d0c8:     LDA $d0,x          ; $d0c8: b5 d0     
            sec                ; $d0ca: 38        
            sbc $ed            ; $d0cb: e5 ed     
            clc                ; $d0cd: 18        
            adc #$03           ; $d0ce: 69 03     
            CMP #$0b           ; $d0d0: c9 0b     
            BCS __d0aa         ; $d0d2: b0 d6     
            LDA $c0,x          ; $d0d4: b5 c0     
            sec                ; $d0d6: 38        
            sbc $ec            ; $d0d7: e5 ec     
            clc                ; $d0d9: 18        
            adc #$02           ; $d0da: 69 02     
            CMP #$11           ; $d0dc: c9 11     
            BCS __d0aa         ; $d0de: b0 ca     
            JMP __cfee         ; $d0e0: 4c ee cf  

;-------------------------------------------------------------------------------
__d0e3:     LDA $04a0          ; $d0e3: ad a0 04  
            clc                ; $d0e6: 18        
            adc #$07           ; $d0e7: 69 07     
            LSR                ; $d0e9: 4a        
            LSR                ; $d0ea: 4a        
            LSR                ; $d0eb: 4a        
            STA $e4            ; $d0ec: 85 e4     
            LDA $04a0          ; $d0ee: ad a0 04  
            asl                ; $d0f1: 0a        
            STA $e2            ; $d0f2: 85 e2     
            LDA $0470          ; $d0f4: ad 70 04  
            LSR                ; $d0f7: 4a        
            LSR                ; $d0f8: 4a        
            LSR                ; $d0f9: 4a        
            EOR #$ff           ; $d0fa: 49 ff     
            and #$08           ; $d0fc: 29 08     
            clc                ; $d0fe: 18        
            adc #$08           ; $d0ff: 69 08     
            adc $c0            ; $d101: 65 c0     
            STA $e0            ; $d103: 85 e0     
            LDA $d0            ; $d105: a5 d0     
            sec                ; $d107: 38        
            sbc $e2            ; $d108: e5 e2     
            STA $ed            ; $d10a: 85 ed     
            clc                ; $d10c: 18        
            adc #$17           ; $d10d: 69 17     
            STA $e2            ; $d10f: 85 e2     
            LDA $c0            ; $d111: a5 c0     
            STA $ec            ; $d113: 85 ec     
            LDA $0470          ; $d115: ad 70 04  
            ORA #$01           ; $d118: 09 01     
            STA $e6            ; $d11a: 85 e6     
            LDA #$10           ; $d11c: a9 10     
            STA $e3            ; $d11e: 85 e3     
            LDA #$00           ; $d120: a9 00     
            STA $e1            ; $d122: 85 e1     
            LDX #$05           ; $d124: a2 05     
            JMP __d21f         ; $d126: 4c 1f d2  

;-------------------------------------------------------------------------------
            JSR __d0e3         ; $d129: 20 e3 d0  
__d12c:     LDA $a0,x          ; $d12c: b5 a0     
            CMP #$04           ; $d12e: c9 04     
            BEQ __d14a         ; $d130: f0 18     
            CMP #$06           ; $d132: c9 06     
            BEQ __d14a         ; $d134: f0 14     
__d136:     INX                ; $d136: e8        
            CPX #$0e           ; $d137: e0 0e     
            BNE __d12c         ; $d139: d0 f1     
            LDX #$00           ; $d13b: a2 00     
            JSR __ed40         ; $d13d: 20 40 ed  
            CMP $e2            ; $d140: c5 e2     
            BEQ __d149         ; $d142: f0 05     
            LDA #$15           ; $d144: a9 15     
            STA $04a0          ; $d146: 8d a0 04  
__d149:     RTS                ; $d149: 60        

;-------------------------------------------------------------------------------
__d14a:     LDA $b0,x          ; $d14a: b5 b0     
            CMP #$05           ; $d14c: c9 05     
            bcc __d154         ; $d14e: 90 04     
            CMP #$0c           ; $d150: c9 0c     
            bcc __d136         ; $d152: 90 e2     
__d154:     LDA $d0,x          ; $d154: b5 d0     
            sec                ; $d156: 38        
            sbc $ed            ; $d157: e5 ed     
            clc                ; $d159: 18        
            adc #$0f           ; $d15a: 69 0f     
            CMP #$11           ; $d15c: c9 11     
            BCS __d136         ; $d15e: b0 d6     
            LDA $0470          ; $d160: ad 70 04  
            and #$40           ; $d163: 29 40     
            BNE __d172         ; $d165: d0 0b     
            LDA $c0,x          ; $d167: b5 c0     
            sec                ; $d169: 38        
            sbc $ec            ; $d16a: e5 ec     
            clc                ; $d16c: 18        
            adc #$03           ; $d16d: 69 03     
            JMP __d17a         ; $d16f: 4c 7a d1  

;-------------------------------------------------------------------------------
__d172:     LDA $c0,x          ; $d172: b5 c0     
            sec                ; $d174: 38        
            sbc $ec            ; $d175: e5 ec     
            clc                ; $d177: 18        
            adc #$07           ; $d178: 69 07     

;-------------------------------------------------------------------------------
__d17a:     CMP #$0b           ; $d17a: c9 0b     
            BCS __d136         ; $d17c: b0 b8     
            JMP __cfee         ; $d17e: 4c ee cf  

;-------------------------------------------------------------------------------
__d181:     LDA $04a0          ; $d181: ad a0 04  
            clc                ; $d184: 18        
            adc #$07           ; $d185: 69 07     
            LSR                ; $d187: 4a        
            LSR                ; $d188: 4a        
            LSR                ; $d189: 4a        
            STA $e4            ; $d18a: 85 e4     
            LDA $04a0          ; $d18c: ad a0 04  
            asl                ; $d18f: 0a        
            STA $e2            ; $d190: 85 e2     
            LDA $0470          ; $d192: ad 70 04  
            LSR                ; $d195: 4a        
            LSR                ; $d196: 4a        
            LSR                ; $d197: 4a        
            EOR #$ff           ; $d198: 49 ff     
            and #$08           ; $d19a: 29 08     
            clc                ; $d19c: 18        
            adc #$08           ; $d19d: 69 08     
            adc $c0            ; $d19f: 65 c0     
            STA $e0            ; $d1a1: 85 e0     
            LDA $d0            ; $d1a3: a5 d0     
            clc                ; $d1a5: 18        
            adc $e2            ; $d1a6: 65 e2     
            STA $ed            ; $d1a8: 85 ed     
            clc                ; $d1aa: 18        
            adc #$17           ; $d1ab: 69 17     
            STA $e2            ; $d1ad: 85 e2     
            LDA $c0            ; $d1af: a5 c0     
            STA $ec            ; $d1b1: 85 ec     
            LDA $0470          ; $d1b3: ad 70 04  
            ORA #$01           ; $d1b6: 09 01     
            STA $e6            ; $d1b8: 85 e6     
            LDA #$f0           ; $d1ba: a9 f0     
            STA $e3            ; $d1bc: 85 e3     
            LDA #$00           ; $d1be: a9 00     
            STA $e1            ; $d1c0: 85 e1     
            LDX #$05           ; $d1c2: a2 05     
            JMP __d21f         ; $d1c4: 4c 1f d2  

;-------------------------------------------------------------------------------
            JSR __d181         ; $d1c7: 20 81 d1  
__d1ca:     LDA $a0,x          ; $d1ca: b5 a0     
            CMP #$04           ; $d1cc: c9 04     
            BEQ __d1e8         ; $d1ce: f0 18     
            CMP #$06           ; $d1d0: c9 06     
            BEQ __d1e8         ; $d1d2: f0 14     
__d1d4:     INX                ; $d1d4: e8        
            CPX #$0e           ; $d1d5: e0 0e     
            BNE __d1ca         ; $d1d7: d0 f1     
            LDX #$00           ; $d1d9: a2 00     
            JSR __ecf6         ; $d1db: 20 f6 ec  
            CMP $e2            ; $d1de: c5 e2     
            BEQ __d1e7         ; $d1e0: f0 05     
            LDA #$15           ; $d1e2: a9 15     
            STA $04a0          ; $d1e4: 8d a0 04  
__d1e7:     RTS                ; $d1e7: 60        

;-------------------------------------------------------------------------------
__d1e8:     LDA $b0,x          ; $d1e8: b5 b0     
            CMP #$05           ; $d1ea: c9 05     
            bcc __d1f2         ; $d1ec: 90 04     
            CMP #$0c           ; $d1ee: c9 0c     
            bcc __d1d4         ; $d1f0: 90 e2     
__d1f2:     LDA $d0,x          ; $d1f2: b5 d0     
            sec                ; $d1f4: 38        
            sbc $ed            ; $d1f5: e5 ed     
            clc                ; $d1f7: 18        
            adc #$02           ; $d1f8: 69 02     
            CMP #$11           ; $d1fa: c9 11     
            BCS __d1d4         ; $d1fc: b0 d6     
            LDA $0470          ; $d1fe: ad 70 04  
            and #$40           ; $d201: 29 40     
            BNE __d210         ; $d203: d0 0b     
            LDA $c0,x          ; $d205: b5 c0     
            sec                ; $d207: 38        
            sbc $ec            ; $d208: e5 ec     
            clc                ; $d20a: 18        
            adc #$03           ; $d20b: 69 03     
            JMP __d218         ; $d20d: 4c 18 d2  

;-------------------------------------------------------------------------------
__d210:     LDA $c0,x          ; $d210: b5 c0     
            sec                ; $d212: 38        
            sbc $ec            ; $d213: e5 ec     
            clc                ; $d215: 18        
            adc #$07           ; $d216: 69 07     
__d218:     CMP #$0b           ; $d218: c9 0b     
            BCS __d1d4         ; $d21a: b0 b8     
            JMP __cfee         ; $d21c: 4c ee cf  

;-------------------------------------------------------------------------------
__d21f:     LDA $10            ; $d21f: a5 10     
            LSR                ; $d221: 4a        
            LSR                ; $d222: 4a        
            bcc __d242         ; $d223: 90 1d     
            LDY $20            ; $d225: a4 20     
            LDA $e4            ; $d227: a5 e4     
            asl                ; $d229: 0a        
            asl                ; $d22a: 0a        
            STA $ee            ; $d22b: 85 ee     
            LDA $20            ; $d22d: a5 20     
            sec                ; $d22f: 38        
            sbc $ee            ; $d230: e5 ee     
            STA $20            ; $d232: 85 20     
            LDA $10            ; $d234: a5 10     
            LSR                ; $d236: 4a        
            BCS __d257         ; $d237: b0 1e     
            LDA $20            ; $d239: a5 20     
            clc                ; $d23b: 18        
            adc #$04           ; $d23c: 69 04     
            tay                ; $d23e: a8        
            JMP __d257         ; $d23f: 4c 57 d2  

;-------------------------------------------------------------------------------
__d242:     LDY $0f            ; $d242: a4 0f     
            LDA $e4            ; $d244: a5 e4     
            asl                ; $d246: 0a        
            asl                ; $d247: 0a        
            adc $0f            ; $d248: 65 0f     
            STA $0f            ; $d24a: 85 0f     
            LDA $10            ; $d24c: a5 10     
            LSR                ; $d24e: 4a        
            bcc __d257         ; $d24f: 90 06     
            LDA $0f            ; $d251: a5 0f     
            sec                ; $d253: 38        
            sbc #$04           ; $d254: e9 04     
            tay                ; $d256: a8        
__d257:     LDA $0700,y        ; $d257: b9 00 07  
            CMP #$f0           ; $d25a: c9 f0     
            BNE __d2b0         ; $d25c: d0 52     
            LDA $e0            ; $d25e: a5 e0     
            CMP #$c4           ; $d260: c9 c4     
            BCS __d284         ; $d262: b0 20     
            LDA $e2            ; $d264: a5 e2     
            CMP #$e4           ; $d266: c9 e4     
            BCS __d284         ; $d268: b0 1a     
            CMP #$10           ; $d26a: c9 10     
            bcc __d284         ; $d26c: 90 16     
            STA $0700,y        ; $d26e: 99 00 07  
            LDA __d2b3,x       ; $d271: bd b3 d2  
            STA $0701,y        ; $d274: 99 01 07  
            LDA $e6            ; $d277: a5 e6     
            STA $0702,y        ; $d279: 99 02 07  
            LDA $e0            ; $d27c: a5 e0     
            STA $0703,y        ; $d27e: 99 03 07  
            JMP __d289         ; $d281: 4c 89 d2  

;-------------------------------------------------------------------------------
__d284:     LDA #$15           ; $d284: a9 15     
            STA $04a0          ; $d286: 8d a0 04  

;-------------------------------------------------------------------------------
__d289:     LDA $e0            ; $d289: a5 e0     
            clc                ; $d28b: 18        
            adc $e1            ; $d28c: 65 e1     
            STA $e0            ; $d28e: 85 e0     
            LDA $e2            ; $d290: a5 e2     
            clc                ; $d292: 18        
            adc $e3            ; $d293: 65 e3     
            STA $e2            ; $d295: 85 e2     
            INX                ; $d297: e8        
            LDA $10            ; $d298: a5 10     
            LSR                ; $d29a: 4a        
            BCS __d2a8         ; $d29b: b0 0b     
            INY                ; $d29d: c8        
            INY                ; $d29e: c8        
            INY                ; $d29f: c8        
            INY                ; $d2a0: c8        
            DEC $e4            ; $d2a1: c6 e4     
            BNE __d257         ; $d2a3: d0 b2     
            LDX #$00           ; $d2a5: a2 00     
            RTS                ; $d2a7: 60        

;-------------------------------------------------------------------------------
__d2a8:     DEY                ; $d2a8: 88        
            DEY                ; $d2a9: 88        
            DEY                ; $d2aa: 88        
            DEY                ; $d2ab: 88        
            DEC $e4            ; $d2ac: c6 e4     
            BNE __d257         ; $d2ae: d0 a7     
__d2b0:     LDX #$00           ; $d2b0: a2 00     
            RTS                ; $d2b2: 60        

;-------------------------------------------------------------------------------
__d2b3:     .hex f4 f6 f8 f6   ; $d2b3: f4 f6 f8 f6   Data
            .hex f8 fc fe fe   ; $d2b7: f8 fc fe fe   Data

;-------------------------------------------------------------------------------
__d2bb:     LDA $49            ; $d2bb: a5 49     
            and #$f0           ; $d2bd: 29 f0     
            BEQ __d2ed         ; $d2bf: f0 2c     
            EOR $0410          ; $d2c1: 4d 10 04  
            and #$f0           ; $d2c4: 29 f0     
            CMP #$c0           ; $d2c6: c9 c0     
            BNE __d2db         ; $d2c8: d0 11     
            EOR $0410          ; $d2ca: 4d 10 04  
            STA $0410          ; $d2cd: 8d 10 04  
            LDA $0470          ; $d2d0: ad 70 04  
            EOR #$40           ; $d2d3: 49 40     
            STA $0470          ; $d2d5: 8d 70 04  
            JMP __d2ed         ; $d2d8: 4c ed d2  

;-------------------------------------------------------------------------------
__d2db:     CMP #$30           ; $d2db: c9 30     
            BNE __d2ed         ; $d2dd: d0 0e     
            EOR $0410          ; $d2df: 4d 10 04  
            STA $0410          ; $d2e2: 8d 10 04  
            LDA $0470          ; $d2e5: ad 70 04  
            EOR #$80           ; $d2e8: 49 80     
            STA $0470          ; $d2ea: 8d 70 04  
__d2ed:     LDA #$00           ; $d2ed: a9 00     
            STA $04a0          ; $d2ef: 8d a0 04  
            LDA #$01           ; $d2f2: a9 01     
            STA $05f1          ; $d2f4: 8d f1 05  
            LDA #$02           ; $d2f7: a9 02     
            STA $b0            ; $d2f9: 85 b0     
            LDA $0460          ; $d2fb: ad 60 04  
            and #$02           ; $d2fe: 29 02     
            ORA #$0d           ; $d300: 09 0d     
            STA $0460          ; $d302: 8d 60 04  
            JMP __e70d         ; $d305: 4c 0d e7  

;-------------------------------------------------------------------------------
__d308:     LDA #$40           ; $d308: a9 40     
            JMP __d33c         ; $d30a: 4c 3c d3  

;-------------------------------------------------------------------------------
__d30d:     LDA #$20           ; $d30d: a9 20     
            JMP __d33c         ; $d30f: 4c 3c d3  

;-------------------------------------------------------------------------------
__d312:     LDA $26            ; $d312: a5 26     
            BNE __d363         ; $d314: d0 4d     
            LDA $1f            ; $d316: a5 1f     
            BNE __d348         ; $d318: d0 2e     
            LDA $48            ; $d31a: a5 48     
            and #$03           ; $d31c: 29 03     
            BNE __d2bb         ; $d31e: d0 9b     
            LDA $49            ; $d320: a5 49     
            and #$f0           ; $d322: 29 f0     
            BEQ __d363         ; $d324: f0 3d     
            pha                ; $d326: 48        
            LDA $05eb          ; $d327: ad eb 05  
            ORA $05e9          ; $d32a: 0d e9 05  
            BNE __d33b         ; $d32d: d0 0c     
            LDY $2d            ; $d32f: a4 2d     
            STY $05f5          ; $d331: 8c f5 05  
            STY $05f6          ; $d334: 8c f6 05  
            LDY #$02           ; $d337: a0 02     
            STY $2d            ; $d339: 84 2d     
__d33b:     pla                ; $d33b: 68        
__d33c:     INC $04d0          ; $d33c: ee d0 04  
            JSR __d707         ; $d33f: 20 07 d7  
            JSR __d372         ; $d342: 20 72 d3  
            JMP __d363         ; $d345: 4c 63 d3  

;-------------------------------------------------------------------------------
__d348:     LDA $c0            ; $d348: a5 c0     
            CMP #$50           ; $d34a: c9 50     
            BNE __d308         ; $d34c: d0 ba     
            LDA $d0            ; $d34e: a5 d0     
            CMP #$60           ; $d350: c9 60     
            BNE __d30d         ; $d352: d0 b9     
            LDA #$80           ; $d354: a9 80     
            STA $0410          ; $d356: 8d 10 04  
            LDA #$04           ; $d359: a9 04     
            STA $0460          ; $d35b: 8d 60 04  
            LDA #$40           ; $d35e: a9 40     
            STA $0470          ; $d360: 8d 70 04  
__d363:     LDA $04d0          ; $d363: ad d0 04  
            LSR                ; $d366: 4a        
            LSR                ; $d367: 4a        
            LSR $0460          ; $d368: 4e 60 04  
            LSR                ; $d36b: 4a        
            ROL $0460          ; $d36c: 2e 60 04  
            JMP __e70d         ; $d36f: 4c 0d e7  

;-------------------------------------------------------------------------------
__d372:     STA $e0            ; $d372: 85 e0     
            LDA $c0            ; $d374: a5 c0     
            BNE __d381         ; $d376: d0 09     
            LDA $e0            ; $d378: a5 e0     
            and #$bf           ; $d37a: 29 bf     
            STA $e0            ; $d37c: 85 e0     
            JMP __d38b         ; $d37e: 4c 8b d3  

;-------------------------------------------------------------------------------
__d381:     CMP #$b0           ; $d381: c9 b0     
            BNE __d38b         ; $d383: d0 06     
            LDA $e0            ; $d385: a5 e0     
            and #$7f           ; $d387: 29 7f     
            STA $e0            ; $d389: 85 e0     
__d38b:     LDA $c0            ; $d38b: a5 c0     
            and #$0f           ; $d38d: 29 0f     
            BEQ __d3a4         ; $d38f: f0 13     
            LDA $e0            ; $d391: a5 e0     
            and #$30           ; $d393: 29 30     
            BEQ __d3a4         ; $d395: f0 0d     
            LDA $e0            ; $d397: a5 e0     
            and #$c0           ; $d399: 29 c0     
            STA $e0            ; $d39b: 85 e0     
            BNE __d3a4         ; $d39d: d0 05     
            LDA $0410          ; $d39f: ad 10 04  
            STA $e0            ; $d3a2: 85 e0     
__d3a4:     LDA $d0            ; $d3a4: a5 d0     
            BNE __d3b1         ; $d3a6: d0 09     
            LDA $e0            ; $d3a8: a5 e0     
            and #$ef           ; $d3aa: 29 ef     
            STA $e0            ; $d3ac: 85 e0     
            JMP __d3bb         ; $d3ae: 4c bb d3  

;-------------------------------------------------------------------------------
__d3b1:     CMP #$c0           ; $d3b1: c9 c0     
            BNE __d3bb         ; $d3b3: d0 06     
            LDA $e0            ; $d3b5: a5 e0     
            and #$df           ; $d3b7: 29 df     
            STA $e0            ; $d3b9: 85 e0     
__d3bb:     LDA $d0            ; $d3bb: a5 d0     
            and #$0f           ; $d3bd: 29 0f     
            BEQ __d3d4         ; $d3bf: f0 13     
            LDA $e0            ; $d3c1: a5 e0     
            and #$c0           ; $d3c3: 29 c0     
            BEQ __d3d4         ; $d3c5: f0 0d     
            LDA $e0            ; $d3c7: a5 e0     
            and #$30           ; $d3c9: 29 30     
            STA $e0            ; $d3cb: 85 e0     
            BNE __d3d4         ; $d3cd: d0 05     
            LDA $0410          ; $d3cf: ad 10 04  
            STA $e0            ; $d3d2: 85 e0     
__d3d4:     LDA $e0            ; $d3d4: a5 e0     
            LSR                ; $d3d6: 4a        
            LSR                ; $d3d7: 4a        
            LSR                ; $d3d8: 4a        
            and #$1e           ; $d3d9: 29 1e     
            tay                ; $d3db: a8        
            LDA __d3f1,y       ; $d3dc: b9 f1 d3  
            STA $ea            ; $d3df: 85 ea     
            LDA __d3f2,y       ; $d3e1: b9 f2 d3  
            STA $eb            ; $d3e4: 85 eb     
            LDA $0460          ; $d3e6: ad 60 04  
            LSR                ; $d3e9: 4a        
            LSR                ; $d3ea: 4a        
            and #$01           ; $d3eb: 29 01     
            tay                ; $d3ed: a8        
            JMP ($00ea)        ; $d3ee: 6c ea 00  

;-------------------------------------------------------------------------------
__d3f1:     .hex 11            ; $d3f1: 11            Data
__d3f2:     .hex d4 c2 d5 30   ; $d3f2: d4 c2 d5 30   Data
            .hex d5 11 d4 9d   ; $d3f6: d5 11 d4 9d   Data
            .hex d4 9d d4 30   ; $d3fa: d4 9d d4 30   Data
            .hex d5 9d d4 12   ; $d3fe: d5 9d d4 12   Data
            .hex d4 c2 d5 12   ; $d402: d4 c2 d5 12   Data
            .hex d4 12 d4 11   ; $d406: d4 12 d4 11   Data
            .hex d4 c2 d5 30   ; $d40a: d4 c2 d5 30   Data
            .hex d5 11 d4      ; $d40e: d5 11 d4      Data

;-------------------------------------------------------------------------------
            RTS                ; $d411: 60        

;-------------------------------------------------------------------------------
            LDA #$40           ; $d412: a9 40     
            STA $0470          ; $d414: 8d 70 04  
            LDA #$80           ; $d417: a9 80     
            STA $0410          ; $d419: 8d 10 04  
            LDA $d0            ; $d41c: a5 d0     
            and #$f0           ; $d41e: 29 f0     
            STA $e8            ; $d420: 85 e8     
            LSR                ; $d422: 4a        
            STA $e0            ; $d423: 85 e0     
            LSR                ; $d425: 4a        
            adc $e0            ; $d426: 65 e0     
            STA $e0            ; $d428: 85 e0     
            LDA $0420          ; $d42a: ad 20 04  
            clc                ; $d42d: 18        
            adc $002e,y        ; $d42e: 79 2e 00  
            STA $0420          ; $d431: 8d 20 04  
            LDA $c0            ; $d434: a5 c0     
            STA $ea            ; $d436: 85 ea     
            adc #$00           ; $d438: 69 00     
            STA $c0            ; $d43a: 85 c0     
            clc                ; $d43c: 18        
            adc #$09           ; $d43d: 69 09     
            LSR                ; $d43f: 4a        
            LSR                ; $d440: 4a        
            STA $e1            ; $d441: 85 e1     
            LSR                ; $d443: 4a        
            STA $e6            ; $d444: 85 e6     
            LSR                ; $d446: 4a        
            clc                ; $d447: 18        
            adc $e0            ; $d448: 65 e0     
            STA $e0            ; $d44a: 85 e0     
            tay                ; $d44c: a8        
            LDA $e1            ; $d44d: a5 e1     
            and #$03           ; $d44f: 29 03     
            STA $e1            ; $d451: 85 e1     
            LDA $0200,y        ; $d453: b9 00 02  
            STA $e2            ; $d456: 85 e2     
            asl                ; $d458: 0a        
            asl                ; $d459: 0a        
            clc                ; $d45a: 18        
            adc $e1            ; $d45b: 65 e1     
            tay                ; $d45d: a8        
            LDA __f7cf,y       ; $d45e: b9 cf f7  
            CMP $e2            ; $d461: c5 e2     
            BEQ __d481         ; $d463: f0 1c     
            pha                ; $d465: 48        
            LDA $e2            ; $d466: a5 e2     
            BNE __d471         ; $d468: d0 07     
            LDA $1f            ; $d46a: a5 1f     
            BNE __d471         ; $d46c: d0 03     
            JSR __ed7c         ; $d46e: 20 7c ed  
__d471:     pla                ; $d471: 68        
            STA $e2            ; $d472: 85 e2     
            LDY $e0            ; $d474: a4 e0     
            STA $0200,y        ; $d476: 99 00 02  
            LDA #$00           ; $d479: a9 00     
            STA $0460          ; $d47b: 8d 60 04  
            JMP __d66b         ; $d47e: 4c 6b d6  

;-------------------------------------------------------------------------------
__d481:     LDA $ea            ; $d481: a5 ea     
            clc                ; $d483: 18        
            adc #$09           ; $d484: 69 09     
            LSR                ; $d486: 4a        
            LSR                ; $d487: 4a        
            and #$03           ; $d488: 29 03     
            CMP $e1            ; $d48a: c5 e1     
            BEQ __d494         ; $d48c: f0 06     
            LDA #$04           ; $d48e: a9 04     
            STA $0460          ; $d490: 8d 60 04  
            RTS                ; $d493: 60        

;-------------------------------------------------------------------------------
__d494:     LDA $0460          ; $d494: ad 60 04  
            and #$fd           ; $d497: 29 fd     
            STA $0460          ; $d499: 8d 60 04  
            RTS                ; $d49c: 60        

;-------------------------------------------------------------------------------
            LDA #$00           ; $d49d: a9 00     
            STA $0470          ; $d49f: 8d 70 04  
            LDA #$40           ; $d4a2: a9 40     
            STA $0410          ; $d4a4: 8d 10 04  
            LDA $d0            ; $d4a7: a5 d0     
            and #$f0           ; $d4a9: 29 f0     
            STA $e8            ; $d4ab: 85 e8     
            LSR                ; $d4ad: 4a        
            STA $e0            ; $d4ae: 85 e0     
            LSR                ; $d4b0: 4a        
            adc $e0            ; $d4b1: 65 e0     
            STA $e0            ; $d4b3: 85 e0     
            LDA $0420          ; $d4b5: ad 20 04  
            sec                ; $d4b8: 38        
            sbc $002e,y        ; $d4b9: f9 2e 00  
            STA $0420          ; $d4bc: 8d 20 04  
            LDA $c0            ; $d4bf: a5 c0     
            STA $ea            ; $d4c1: 85 ea     
            sbc #$00           ; $d4c3: e9 00     
            STA $c0            ; $d4c5: 85 c0     
            clc                ; $d4c7: 18        
            adc #$06           ; $d4c8: 69 06     
            LSR                ; $d4ca: 4a        
            LSR                ; $d4cb: 4a        
            STA $e1            ; $d4cc: 85 e1     
            LSR                ; $d4ce: 4a        
            STA $e6            ; $d4cf: 85 e6     
            LSR                ; $d4d1: 4a        
            clc                ; $d4d2: 18        
            adc $e0            ; $d4d3: 65 e0     
            STA $e0            ; $d4d5: 85 e0     
            tay                ; $d4d7: a8        
            LDA $e1            ; $d4d8: a5 e1     
            and #$03           ; $d4da: 29 03     
            EOR #$03           ; $d4dc: 49 03     
            STA $e1            ; $d4de: 85 e1     
            LDA $0200,y        ; $d4e0: b9 00 02  
            STA $e2            ; $d4e3: 85 e2     
            asl                ; $d4e5: 0a        
            asl                ; $d4e6: 0a        
            clc                ; $d4e7: 18        
            adc $e1            ; $d4e8: 65 e1     
            tay                ; $d4ea: a8        
            LDA $e1            ; $d4eb: a5 e1     
            EOR #$03           ; $d4ed: 49 03     
            STA $e1            ; $d4ef: 85 e1     
            LDA __f99f,y       ; $d4f1: b9 9f f9  
            CMP $e2            ; $d4f4: c5 e2     
            BEQ __d514         ; $d4f6: f0 1c     
            pha                ; $d4f8: 48        
            LDA $e2            ; $d4f9: a5 e2     
            BNE __d504         ; $d4fb: d0 07     
            LDA $1f            ; $d4fd: a5 1f     
            BNE __d504         ; $d4ff: d0 03     
            JSR __ed7c         ; $d501: 20 7c ed  
__d504:     pla                ; $d504: 68        
            STA $e2            ; $d505: 85 e2     
            LDY $e0            ; $d507: a4 e0     
            STA $0200,y        ; $d509: 99 00 02  
            LDA #$00           ; $d50c: a9 00     
            STA $0460          ; $d50e: 8d 60 04  
            JMP __d66b         ; $d511: 4c 6b d6  

;-------------------------------------------------------------------------------
__d514:     LDA $ea            ; $d514: a5 ea     
            clc                ; $d516: 18        
            adc #$06           ; $d517: 69 06     
            LSR                ; $d519: 4a        
            LSR                ; $d51a: 4a        
            and #$03           ; $d51b: 29 03     
            CMP $e1            ; $d51d: c5 e1     
            BEQ __d527         ; $d51f: f0 06     
            LDA #$04           ; $d521: a9 04     
            STA $0460          ; $d523: 8d 60 04  
            RTS                ; $d526: 60        

;-------------------------------------------------------------------------------
__d527:     LDA $0460          ; $d527: ad 60 04  
            and #$fd           ; $d52a: 29 fd     
            STA $0460          ; $d52c: 8d 60 04  
            RTS                ; $d52f: 60        

;-------------------------------------------------------------------------------
            LDA $0470          ; $d530: ad 70 04  
            and #$7f           ; $d533: 29 7f     
            STA $0470          ; $d535: 8d 70 04  
            LDA #$20           ; $d538: a9 20     
            STA $0410          ; $d53a: 8d 10 04  
            LDA $0440          ; $d53d: ad 40 04  
            clc                ; $d540: 18        
            adc $002e,y        ; $d541: 79 2e 00  
            STA $0440          ; $d544: 8d 40 04  
            LDA $d0            ; $d547: a5 d0     
            STA $ea            ; $d549: 85 ea     
            adc #$00           ; $d54b: 69 00     
            STA $d0            ; $d54d: 85 d0     
            clc                ; $d54f: 18        
            adc #$09           ; $d550: 69 09     
            STA $e1            ; $d552: 85 e1     
            and #$f0           ; $d554: 29 f0     
            STA $e8            ; $d556: 85 e8     
            LSR                ; $d558: 4a        
            STA $e0            ; $d559: 85 e0     
            LSR                ; $d55b: 4a        
            adc $e0            ; $d55c: 65 e0     
            STA $e0            ; $d55e: 85 e0     
            LDA $c0            ; $d560: a5 c0     
            and #$f0           ; $d562: 29 f0     
            LSR                ; $d564: 4a        
            LSR                ; $d565: 4a        
            LSR                ; $d566: 4a        
            STA $e6            ; $d567: 85 e6     
            LSR                ; $d569: 4a        
            clc                ; $d56a: 18        
            adc $e0            ; $d56b: 65 e0     
            STA $e0            ; $d56d: 85 e0     
            tay                ; $d56f: a8        
            LDA $e1            ; $d570: a5 e1     
            LSR                ; $d572: 4a        
            LSR                ; $d573: 4a        
            and #$03           ; $d574: 29 03     
            STA $e1            ; $d576: 85 e1     
            LDA $0200,y        ; $d578: b9 00 02  
            STA $e2            ; $d57b: 85 e2     
            asl                ; $d57d: 0a        
            asl                ; $d57e: 0a        
            clc                ; $d57f: 18        
            adc $e1            ; $d580: 65 e1     
            tay                ; $d582: a8        
            LDA __fa87,y       ; $d583: b9 87 fa  
            CMP $e2            ; $d586: c5 e2     
            BEQ __d5a6         ; $d588: f0 1c     
            pha                ; $d58a: 48        
            LDA $e2            ; $d58b: a5 e2     
            BNE __d596         ; $d58d: d0 07     
            LDA $1f            ; $d58f: a5 1f     
            BNE __d596         ; $d591: d0 03     
            JSR __ed7c         ; $d593: 20 7c ed  
__d596:     pla                ; $d596: 68        
            STA $e2            ; $d597: 85 e2     
            LDY $e0            ; $d599: a4 e0     
            STA $0200,y        ; $d59b: 99 00 02  
            LDA #$02           ; $d59e: a9 02     
            STA $0460          ; $d5a0: 8d 60 04  
            JMP __d66b         ; $d5a3: 4c 6b d6  

;-------------------------------------------------------------------------------
__d5a6:     LDA $ea            ; $d5a6: a5 ea     
            clc                ; $d5a8: 18        
            adc #$09           ; $d5a9: 69 09     
            LSR                ; $d5ab: 4a        
            LSR                ; $d5ac: 4a        
            and #$03           ; $d5ad: 29 03     
            CMP $e1            ; $d5af: c5 e1     
            BEQ __d5b9         ; $d5b1: f0 06     
            LDA #$06           ; $d5b3: a9 06     
            STA $0460          ; $d5b5: 8d 60 04  
            RTS                ; $d5b8: 60        

;-------------------------------------------------------------------------------
__d5b9:     LDA $0460          ; $d5b9: ad 60 04  
            ORA #$02           ; $d5bc: 09 02     
            STA $0460          ; $d5be: 8d 60 04  
            RTS                ; $d5c1: 60        

;-------------------------------------------------------------------------------
            LDA $0410          ; $d5c2: ad 10 04  
            and #$c0           ; $d5c5: 29 c0     
            BEQ __d5d1         ; $d5c7: f0 08     
            LDA $0470          ; $d5c9: ad 70 04  
            EOR #$40           ; $d5cc: 49 40     
            STA $0470          ; $d5ce: 8d 70 04  
__d5d1:     LDA $0470          ; $d5d1: ad 70 04  
            ORA #$80           ; $d5d4: 09 80     
            STA $0470          ; $d5d6: 8d 70 04  
            LDA #$10           ; $d5d9: a9 10     
            STA $0410          ; $d5db: 8d 10 04  
            LDA $0440          ; $d5de: ad 40 04  
            sec                ; $d5e1: 38        
            sbc $002e,y        ; $d5e2: f9 2e 00  
            STA $0440          ; $d5e5: 8d 40 04  
            LDA $d0            ; $d5e8: a5 d0     
            STA $ea            ; $d5ea: 85 ea     
            sbc #$00           ; $d5ec: e9 00     
            STA $d0            ; $d5ee: 85 d0     
            clc                ; $d5f0: 18        
            adc #$06           ; $d5f1: 69 06     
            STA $e1            ; $d5f3: 85 e1     
            and #$f0           ; $d5f5: 29 f0     
            STA $e8            ; $d5f7: 85 e8     
            LSR                ; $d5f9: 4a        
            STA $e0            ; $d5fa: 85 e0     
            LSR                ; $d5fc: 4a        
            adc $e0            ; $d5fd: 65 e0     
            STA $e0            ; $d5ff: 85 e0     
            LDA $c0            ; $d601: a5 c0     
            and #$f0           ; $d603: 29 f0     
            LSR                ; $d605: 4a        
            LSR                ; $d606: 4a        
            LSR                ; $d607: 4a        
            STA $e6            ; $d608: 85 e6     
            LSR                ; $d60a: 4a        
            clc                ; $d60b: 18        
            adc $e0            ; $d60c: 65 e0     
            STA $e0            ; $d60e: 85 e0     
            tay                ; $d610: a8        
            LDA $e1            ; $d611: a5 e1     
            LSR                ; $d613: 4a        
            LSR                ; $d614: 4a        
            and #$03           ; $d615: 29 03     
            EOR #$03           ; $d617: 49 03     
            STA $e1            ; $d619: 85 e1     
            LDA $0200,y        ; $d61b: b9 00 02  
            STA $e2            ; $d61e: 85 e2     
            asl                ; $d620: 0a        
            asl                ; $d621: 0a        
            clc                ; $d622: 18        
            adc $e1            ; $d623: 65 e1     
            tay                ; $d625: a8        
            LDA $e1            ; $d626: a5 e1     
            EOR #$03           ; $d628: 49 03     
            STA $e1            ; $d62a: 85 e1     
            LDA __f8b7,y       ; $d62c: b9 b7 f8  
            CMP $e2            ; $d62f: c5 e2     
            BEQ __d64f         ; $d631: f0 1c     
            pha                ; $d633: 48        
            LDA $e2            ; $d634: a5 e2     
            BNE __d63f         ; $d636: d0 07     
            LDA $1f            ; $d638: a5 1f     
            BNE __d63f         ; $d63a: d0 03     
            JSR __ed7c         ; $d63c: 20 7c ed  
__d63f:     pla                ; $d63f: 68        
            STA $e2            ; $d640: 85 e2     
            LDY $e0            ; $d642: a4 e0     
            STA $0200,y        ; $d644: 99 00 02  
            LDA #$02           ; $d647: a9 02     
            STA $0460          ; $d649: 8d 60 04  
            JMP __d66b         ; $d64c: 4c 6b d6  

;-------------------------------------------------------------------------------
__d64f:     LDA $ea            ; $d64f: a5 ea     
            clc                ; $d651: 18        
            adc #$06           ; $d652: 69 06     
            LSR                ; $d654: 4a        
            LSR                ; $d655: 4a        
            and #$03           ; $d656: 29 03     
            CMP $e1            ; $d658: c5 e1     
            BEQ __d662         ; $d65a: f0 06     
            LDA #$06           ; $d65c: a9 06     
            STA $0460          ; $d65e: 8d 60 04  
            RTS                ; $d661: 60        

;-------------------------------------------------------------------------------
__d662:     LDA $0460          ; $d662: ad 60 04  
            ORA #$02           ; $d665: 09 02     
            STA $0460          ; $d667: 8d 60 04  
            RTS                ; $d66a: 60        

;-------------------------------------------------------------------------------
__d66b:     LDA #$00           ; $d66b: a9 00     
            STA $e3            ; $d66d: 85 e3     
            LDA $e8            ; $d66f: a5 e8     
            and #$f0           ; $d671: 29 f0     
            CMP #$40           ; $d673: c9 40     
            bcc __d681         ; $d675: 90 0a     
            CMP #$70           ; $d677: c9 70     
            bcc __d67f         ; $d679: 90 04     
            CMP #$a0           ; $d67b: c9 a0     
            bcc __d681         ; $d67d: 90 02     
__d67f:     INC $e3            ; $d67f: e6 e3     
__d681:     LDA $e6            ; $d681: a5 e6     
            and #$1e           ; $d683: 29 1e     
            STA $e6            ; $d685: 85 e6     
            LDA $14            ; $d687: a5 14     
            asl                ; $d689: 0a        
            ORA #$08           ; $d68a: 09 08     
            STA $e7            ; $d68c: 85 e7     
            LDA $e8            ; $d68e: a5 e8     
            clc                ; $d690: 18        
            adc #$20           ; $d691: 69 20     
            asl                ; $d693: 0a        
            ROL $e7            ; $d694: 26 e7     
            asl                ; $d696: 0a        
            ROL $e7            ; $d697: 26 e7     
            adc $e6            ; $d699: 65 e6     
            STA $e6            ; $d69b: 85 e6     
            LDA $e2            ; $d69d: a5 e2     
            asl                ; $d69f: 0a        
            asl                ; $d6a0: 0a        
            STX $e4            ; $d6a1: 86 e4     
            tax                ; $d6a3: aa        
            LDY $0e            ; $d6a4: a4 0e     
            LDA $e7            ; $d6a6: a5 e7     
            STA $0500,y        ; $d6a8: 99 00 05  
            INY                ; $d6ab: c8        
            LDA $e6            ; $d6ac: a5 e6     
            STA $0500,y        ; $d6ae: 99 00 05  
            clc                ; $d6b1: 18        
            adc #$20           ; $d6b2: 69 20     
            STA $e6            ; $d6b4: 85 e6     
            LDA $e7            ; $d6b6: a5 e7     
            adc #$00           ; $d6b8: 69 00     
            STA $e7            ; $d6ba: 85 e7     
            INY                ; $d6bc: c8        
            LDA #$02           ; $d6bd: a9 02     
            STA $0500,y        ; $d6bf: 99 00 05  
            INY                ; $d6c2: c8        
            LDA __f6e7,x       ; $d6c3: bd e7 f6  
            INX                ; $d6c6: e8        
            ORA $e3            ; $d6c7: 05 e3     
            STA $0500,y        ; $d6c9: 99 00 05  
            INY                ; $d6cc: c8        
            LDA __f6e7,x       ; $d6cd: bd e7 f6  
            INX                ; $d6d0: e8        
            ORA $e3            ; $d6d1: 05 e3     
            STA $0500,y        ; $d6d3: 99 00 05  
            INY                ; $d6d6: c8        
            LDA $e7            ; $d6d7: a5 e7     
            STA $0500,y        ; $d6d9: 99 00 05  
            INY                ; $d6dc: c8        
            LDA $e6            ; $d6dd: a5 e6     
            STA $0500,y        ; $d6df: 99 00 05  
            INY                ; $d6e2: c8        
            LDA #$02           ; $d6e3: a9 02     
            STA $0500,y        ; $d6e5: 99 00 05  
            INY                ; $d6e8: c8        
            LDA __f6e7,x       ; $d6e9: bd e7 f6  
            INX                ; $d6ec: e8        
            ORA $e3            ; $d6ed: 05 e3     
            STA $0500,y        ; $d6ef: 99 00 05  
            INY                ; $d6f2: c8        
            LDA __f6e7,x       ; $d6f3: bd e7 f6  
            INX                ; $d6f6: e8        
            ORA $e3            ; $d6f7: 05 e3     
            STA $0500,y        ; $d6f9: 99 00 05  
            INY                ; $d6fc: c8        
            LDA #$00           ; $d6fd: a9 00     
            STA $0500,y        ; $d6ff: 99 00 05  
            STY $0e            ; $d702: 84 0e     
            LDX $e4            ; $d704: a6 e4     
            RTS                ; $d706: 60        

;-------------------------------------------------------------------------------
__d707:     and #$f0           ; $d707: 29 f0     
            BEQ __d722         ; $d709: f0 17     
            STA $e0            ; $d70b: 85 e0     
            LDA $c0            ; $d70d: a5 c0     
            ORA $d0            ; $d70f: 05 d0     
            and #$0f           ; $d711: 29 0f     
            BNE __d720         ; $d713: d0 0b     
            LDX #$0d           ; $d715: a2 0d     
__d717:     LDA #$08           ; $d717: a9 08     
            CMP $a0,x          ; $d719: d5 a0     
            BEQ __d723         ; $d71b: f0 06     
__d71d:     DEX                ; $d71d: ca        
            BNE __d717         ; $d71e: d0 f7     
__d720:     LDA $e0            ; $d720: a5 e0     
__d722:     RTS                ; $d722: 60        

;-------------------------------------------------------------------------------
__d723:     LDA $b0,x          ; $d723: b5 b0     
            CMP #$03           ; $d725: c9 03     
            BCS __d71d         ; $d727: b0 f4     
            LDA $e0            ; $d729: a5 e0     
            LSR                ; $d72b: 4a        
            LSR                ; $d72c: 4a        
            LSR                ; $d72d: 4a        
            LSR                ; $d72e: 4a        
            and #$0f           ; $d72f: 29 0f     
            tay                ; $d731: a8        
            LDA __d76b,y       ; $d732: b9 6b d7  
            tay                ; $d735: a8        
            LDA __d77b,y       ; $d736: b9 7b d7  
            clc                ; $d739: 18        
            adc $c0            ; $d73a: 65 c0     
            CMP $c0,x          ; $d73c: d5 c0     
            BNE __d71d         ; $d73e: d0 dd     
            LDA __d77f,y       ; $d740: b9 7f d7  
            clc                ; $d743: 18        
            adc $d0            ; $d744: 65 d0     
            CMP $d0,x          ; $d746: d5 d0     
            BNE __d71d         ; $d748: d0 d3     
            LDA __d78f,y       ; $d74a: b9 8f d7  
            CMP $0410          ; $d74d: cd 10 04  
            BEQ __d767         ; $d750: f0 15     
            STA $0410          ; $d752: 8d 10 04  
            LDA __d783,y       ; $d755: b9 83 d7  
            STA $0460          ; $d758: 8d 60 04  
            LDA __d787,y       ; $d75b: b9 87 d7  
            and $0470          ; $d75e: 2d 70 04  
            EOR __d78b,y       ; $d761: 59 8b d7  
            STA $0470          ; $d764: 8d 70 04  
__d767:     LDA #$00           ; $d767: a9 00     
            tax                ; $d769: aa        
            RTS                ; $d76a: 60        

;-------------------------------------------------------------------------------
__d76b:     .hex 00 00 02 00   ; $d76b: 00 00 02 00   Data
            .hex 03 03 02 03   ; $d76f: 03 03 02 03   Data
            .hex 01 00 01 01   ; $d773: 01 00 01 01   Data
            .hex 00 00 02 00   ; $d777: 00 00 02 00   Data
__d77b:     .hex 00 10 00 f0   ; $d77b: 00 10 00 f0   Data
__d77f:     .hex f0 00 10 00   ; $d77f: f0 00 10 00   Data
__d783:     .hex 02 00 02 00   ; $d783: 02 00 02 00   Data
__d787:     .hex 40 00 40 00   ; $d787: 40 00 40 00   Data
__d78b:     .hex c0 40 00 00   ; $d78b: c0 40 00 00   Data
__d78f:     .hex 10 80 20 40   ; $d78f: 10 80 20 40   Data

;-------------------------------------------------------------------------------
__d793:     LDA $b0,x          ; $d793: b5 b0     
            and #$1e           ; $d795: 29 1e     
            tay                ; $d797: a8        
            LDA __d7a5,y       ; $d798: b9 a5 d7  
            STA $ea            ; $d79b: 85 ea     
            LDA __d7a6,y       ; $d79d: b9 a6 d7  
            STA $eb            ; $d7a0: 85 eb     
            JMP ($00ea)        ; $d7a2: 6c ea 00  

;-------------------------------------------------------------------------------
__d7a5:     .hex e2            ; $d7a5: e2            Data
__d7a6:     .hex da c6 d8 6b   ; $d7a6: da c6 d8 6b   Data
            .hex d8 59 d8 4d   ; $d7aa: d8 59 d8 4d   Data
            .hex d8 f9 d7 bc   ; $d7ae: d8 f9 d7 bc   Data
            .hex da bf d8 e9   ; $d7b2: da bf d8 e9   Data
            .hex d9 15 da      ; $d7b6: d9 15 da      Data
__d7b9:     .hex 34 34 34 34   ; $d7b9: 34 34 34 34   Data
            .hex 35 35 35 36   ; $d7bd: 35 35 35 36   Data
            .hex 36 36 37 37   ; $d7c1: 36 36 37 37   Data
            .hex 37 37 37 34   ; $d7c5: 37 37 37 34   Data
__d7c9:     .hex 36 36 36 36   ; $d7c9: 36 36 36 36   Data
            .hex 38 38 38 39   ; $d7cd: 38 38 38 39   Data
            .hex 39 39 3a 3a   ; $d7d1: 39 39 3a 3a   Data
            .hex 3a 3a 3a 36   ; $d7d5: 3a 3a 3a 36   Data
__d7d9:     .hex 02 02 02 02   ; $d7d9: 02 02 02 02   Data
            .hex 03 03 03 04   ; $d7dd: 03 03 03 04   Data
            .hex 04 04 05 05   ; $d7e1: 04 04 05 05   Data
            .hex 05 05 05 02   ; $d7e5: 05 05 05 02   Data
__d7e9:     .hex 04 04 04 04   ; $d7e9: 04 04 04 04   Data
            .hex 06 06 06 08   ; $d7ed: 06 06 06 08   Data
            .hex 08 08 0a 0a   ; $d7f1: 08 08 0a 0a   Data
            .hex 0a 0a 0a 04   ; $d7f5: 0a 0a 0a 04   Data

;-------------------------------------------------------------------------------
            DEC $0480,x        ; $d7f9: de 80 04  
            BNE __d84a         ; $d7fc: d0 4c     
            LDA $0460,x        ; $d7fe: bd 60 04  
            CMP #$1f           ; $d801: c9 1f     
            BEQ __d828         ; $d803: f0 23     
            CMP #$27           ; $d805: c9 27     
            BNE __d854         ; $d807: d0 4b     
            DEC $61            ; $d809: c6 61     
            LDA $04d0,x        ; $d80b: bd d0 04  
            and #$c0           ; $d80e: 29 c0     
            BEQ __d82a         ; $d810: f0 18     
            LDA $d0,x          ; $d812: b5 d0     
            clc                ; $d814: 18        
            adc #$07           ; $d815: 69 07     
            LSR                ; $d817: 4a        
            LSR                ; $d818: 4a        
            LSR                ; $d819: 4a        
            LSR                ; $d81a: 4a        
            tay                ; $d81b: a8        
            LDA __d7c9,y       ; $d81c: b9 c9 d7  
            STA $0460,x        ; $d81f: 9d 60 04  
            LDA __d7e9,y       ; $d822: b9 e9 d7  
            JMP __d83d         ; $d825: 4c 3d d8  

;-------------------------------------------------------------------------------
__d828:     DEC $61            ; $d828: c6 61     
__d82a:     LDA $d0,x          ; $d82a: b5 d0     
            clc                ; $d82c: 18        
            adc #$07           ; $d82d: 69 07     
            LSR                ; $d82f: 4a        
            LSR                ; $d830: 4a        
            LSR                ; $d831: 4a        
            LSR                ; $d832: 4a        
            tay                ; $d833: a8        
            LDA __d7b9,y       ; $d834: b9 b9 d7  
            STA $0460,x        ; $d837: 9d 60 04  
            LDA __d7d9,y       ; $d83a: b9 d9 d7  
__d83d:     JSR __ed83         ; $d83d: 20 83 ed  
            LDA #$3c           ; $d840: a9 3c     
            STA $0480,x        ; $d842: 9d 80 04  
            LDA #$01           ; $d845: a9 01     
            STA $0470,x        ; $d847: 9d 70 04  
__d84a:     JMP __e70d         ; $d84a: 4c 0d e7  

;-------------------------------------------------------------------------------
            DEC $0480,x        ; $d84d: de 80 04  
            BNE __d85d         ; $d850: d0 0b     
            DEC $61            ; $d852: c6 61     
__d854:     LDA #$00           ; $d854: a9 00     
            STA $a0,x          ; $d856: 95 a0     
            RTS                ; $d858: 60        

;-------------------------------------------------------------------------------
            INC $d0,x          ; $d859: f6 d0     
            INC $d0,x          ; $d85b: f6 d0     
__d85d:     LDA $a0,x          ; $d85d: b5 a0     
            asl                ; $d85f: 0a        
            asl                ; $d860: 0a        
            and #$08           ; $d861: 29 08     
            ORA #$20           ; $d863: 09 20     
            STA $0460,x        ; $d865: 9d 60 04  
            JMP __e70d         ; $d868: 4c 0d e7  

;-------------------------------------------------------------------------------
            DEC $0480,x        ; $d86b: de 80 04  
            BNE __d8aa         ; $d86e: d0 3a     
            LDA $34            ; $d870: a5 34     
            STA $0480,x        ; $d872: 9d 80 04  
            DEC $0460,x        ; $d875: de 60 04  
            LDA $0460,x        ; $d878: bd 60 04  
            CMP #$1b           ; $d87b: c9 1b     
            BEQ __d883         ; $d87d: f0 04     
            CMP #$23           ; $d87f: c9 23     
            BNE __d8aa         ; $d881: d0 27     
__d883:     LDA $04c0,x        ; $d883: bd c0 04  
            STA $b0,x          ; $d886: 95 b0     
            CMP #$10           ; $d888: c9 10     
            BCS __d88e         ; $d88a: b0 02     
            LDA #$00           ; $d88c: a9 00     
__d88e:     STA $0480,x        ; $d88e: 9d 80 04  
            CPX $04b0          ; $d891: ec b0 04  
            BNE __d8aa         ; $d894: d0 14     
            LDA $b0            ; $d896: a5 b0     
            CMP #$04           ; $d898: c9 04     
            BNE __d8aa         ; $d89a: d0 0e     
            LDA #$00           ; $d89c: a9 00     
            STA $b0            ; $d89e: 85 b0     
            LDA $0460          ; $d8a0: ad 60 04  
            and #$02           ; $d8a3: 29 02     
            ORA #$04           ; $d8a5: 09 04     
            STA $0460          ; $d8a7: 8d 60 04  
__d8aa:     JMP __e70d         ; $d8aa: 4c 0d e7  

;-------------------------------------------------------------------------------
__d8ad:     LDA #$01           ; $d8ad: a9 01     
            STA $05e9          ; $d8af: 8d e9 05  
            STA $05ea          ; $d8b2: 8d ea 05  
            STA $2d            ; $d8b5: 85 2d     
            LDA #$05           ; $d8b7: a9 05     
            STA $06f1          ; $d8b9: 8d f1 06  
            STA $06f2          ; $d8bc: 8d f2 06  
            LDA #$0e           ; $d8bf: a9 0e     
            STA $b0,x          ; $d8c1: 95 b0     
            JMP __d8d2         ; $d8c3: 4c d2 d8  

;-------------------------------------------------------------------------------
            LDA $1f            ; $d8c6: a5 1f     
            BNE __d8d0         ; $d8c8: d0 06     
            LDA $61            ; $d8ca: a5 61     
            CMP #$01           ; $d8cc: c9 01     
            BEQ __d8ad         ; $d8ce: f0 dd     
__d8d0:     LDA #$02           ; $d8d0: a9 02     
__d8d2:     STA $04c0,x        ; $d8d2: 9d c0 04  
            LDA $0480,x        ; $d8d5: bd 80 04  
            BNE __d92b         ; $d8d8: d0 51     
            LDA $d0,x          ; $d8da: b5 d0     
            clc                ; $d8dc: 18        
            adc #$08           ; $d8dd: 69 08     
            and #$f0           ; $d8df: 29 f0     
            LSR                ; $d8e1: 4a        
            STA $e0            ; $d8e2: 85 e0     
            LSR                ; $d8e4: 4a        
            adc $e0            ; $d8e5: 65 e0     
            STA $e0            ; $d8e7: 85 e0     
            LDA $c0,x          ; $d8e9: b5 c0     
            clc                ; $d8eb: 18        
            adc #$08           ; $d8ec: 69 08     
            LSR                ; $d8ee: 4a        
            LSR                ; $d8ef: 4a        
            LSR                ; $d8f0: 4a        
            LSR                ; $d8f1: 4a        
            clc                ; $d8f2: 18        
            adc $e0            ; $d8f3: 65 e0     
            tay                ; $d8f5: a8        
            LDA $0200,y        ; $d8f6: b9 00 02  
            BPL __d92e         ; $d8f9: 10 33     
            asl                ; $d8fb: 0a        
            BPL __d92e         ; $d8fc: 10 30     
            LDY #$03           ; $d8fe: a0 03     
            LDA $c0,x          ; $d900: b5 c0     
            and #$0f           ; $d902: 29 0f     
            BEQ __d90f         ; $d904: f0 09     
            CMP #$08           ; $d906: c9 08     
            BCS __d91d         ; $d908: b0 13     
            LDY #$01           ; $d90a: a0 01     
            JMP __d91d         ; $d90c: 4c 1d d9  

;-------------------------------------------------------------------------------
__d90f:     LDA $d0,x          ; $d90f: b5 d0     
            and #$0f           ; $d911: 29 0f     
            BEQ __d971         ; $d913: f0 5c     
            LDY #$00           ; $d915: a0 00     
            CMP #$08           ; $d917: c9 08     
            bcc __d91d         ; $d919: 90 02     
            LDY #$02           ; $d91b: a0 02     
__d91d:     tya                ; $d91d: 98        
            STA $0410,x        ; $d91e: 9d 10 04  
            LDA $30            ; $d921: a5 30     
            STA $e0            ; $d923: 85 e0     
            JSR __dc9d         ; $d925: 20 9d dc  
            JMP __d949         ; $d928: 4c 49 d9  

;-------------------------------------------------------------------------------
__d92b:     DEC $0480,x        ; $d92b: de 80 04  
__d92e:     JSR __dd7d         ; $d92e: 20 7d dd  
            LDA $10            ; $d931: a5 10     
            and #$03           ; $d933: 29 03     
            BNE __d93d         ; $d935: d0 06     
            LDA $ea            ; $d937: a5 ea     
            EOR #$04           ; $d939: 49 04     
            STA $ea            ; $d93b: 85 ea     
__d93d:     LDA $ea            ; $d93d: a5 ea     
            STA $0410,x        ; $d93f: 9d 10 04  
            LDA $30            ; $d942: a5 30     
            STA $e0            ; $d944: 85 e0     
            JSR __dcbe         ; $d946: 20 be dc  
__d949:     LDA $1f            ; $d949: a5 1f     
            BNE __d94f         ; $d94b: d0 02     
            LDA $10            ; $d94d: a5 10     
__d94f:     LSR                ; $d94f: 4a        
            LSR                ; $d950: 4a        
            LSR                ; $d951: 4a        
            LSR                ; $d952: 4a        
            and #$01           ; $d953: 29 01     
            ORA #$2c           ; $d955: 09 2c     
            STA $0460,x        ; $d957: 9d 60 04  
            LDA $a0,x          ; $d95a: b5 a0     
            CMP #$04           ; $d95c: c9 04     
            BEQ __d96e         ; $d95e: f0 0e     
            INC $0460,x        ; $d960: fe 60 04  
            INC $0460,x        ; $d963: fe 60 04  
            LDA $0470,x        ; $d966: bd 70 04  
            and #$f0           ; $d969: 29 f0     
            STA $0470,x        ; $d96b: 9d 70 04  
__d96e:     JMP __e70d         ; $d96e: 4c 0d e7  

;-------------------------------------------------------------------------------
__d971:     DEC $b0,x          ; $d971: d6 b0     
            DEC $b0,x          ; $d973: d6 b0     
            LDA #$00           ; $d975: a9 00     
            STA $0480,x        ; $d977: 9d 80 04  
            LDA $d0,x          ; $d97a: b5 d0     
            BNE __d988         ; $d97c: d0 0a     
            LDA $0410,x        ; $d97e: bd 10 04  
            and #$02           ; $d981: 29 02     
            ORA #$01           ; $d983: 09 01     
            JMP __d98d         ; $d985: 4c 8d d9  

;-------------------------------------------------------------------------------
__d988:     LDA $0410,x        ; $d988: bd 10 04  
            and #$02           ; $d98b: 29 02     
__d98d:     STA $0410,x        ; $d98d: 9d 10 04  
            LDA $a0,x          ; $d990: b5 a0     
            CMP #$04           ; $d992: c9 04     
            BEQ __d99e         ; $d994: f0 08     
            LDA $0470,x        ; $d996: bd 70 04  
            ORA #$02           ; $d999: 09 02     
            STA $0470,x        ; $d99b: 9d 70 04  
__d99e:     LDA #$03           ; $d99e: a9 03     
            STA $04b0,x        ; $d9a0: 9d b0 04  
            LDA $b0,x          ; $d9a3: b5 b0     
            BEQ __d9aa         ; $d9a5: f0 03     
            JMP __dabc         ; $d9a7: 4c bc da  

;-------------------------------------------------------------------------------
__d9aa:     JMP __dae2         ; $d9aa: 4c e2 da  

;-------------------------------------------------------------------------------
__d9ad:     JSR __DEC2         ; $d9ad: 20 c2 de  
            LDA $0410,x        ; $d9b0: bd 10 04  
            LSR                ; $d9b3: 4a        
            LSR                ; $d9b4: 4a        
            BCS __d9c0         ; $d9b5: b0 09     
            DEC $e1            ; $d9b7: c6 e1     
            bmi __d9d3         ; $d9b9: 30 18     
            DEC $e0            ; $d9bb: c6 e0     
            JMP __d9ca         ; $d9bd: 4c ca d9  

;-------------------------------------------------------------------------------
__d9c0:     INC $e1            ; $d9c0: e6 e1     
            LDA $e1            ; $d9c2: a5 e1     
            CMP #$0c           ; $d9c4: c9 0c     
            BCS __d9d3         ; $d9c6: b0 0b     
            INC $e0            ; $d9c8: e6 e0     
__d9ca:     LDY $e0            ; $d9ca: a4 e0     
            LDA $0200,y        ; $d9cc: b9 00 02  
            and #$40           ; $d9cf: 29 40     
            BNE __d9d6         ; $d9d1: d0 03     
__d9d3:     JMP __db5a         ; $d9d3: 4c 5a db  

;-------------------------------------------------------------------------------
__d9d6:     LDA $b0,x          ; $d9d6: b5 b0     
            STA $04a0,x        ; $d9d8: 9d a0 04  
            LDA #$10           ; $d9db: a9 10     
            STA $b0,x          ; $d9dd: 95 b0     
            LDA #$00           ; $d9df: a9 00     
            STA $04d0,x        ; $d9e1: 9d d0 04  
            LDA #$40           ; $d9e4: a9 40     
            STA $0480,x        ; $d9e6: 9d 80 04  
            LDA #$10           ; $d9e9: a9 10     
            STA $04c0,x        ; $d9eb: 9d c0 04  
            DEC $0480,x        ; $d9ee: de 80 04  
            BEQ __da04         ; $d9f1: f0 11     
            LDA $0480,x        ; $d9f3: bd 80 04  
            LSR                ; $d9f6: 4a        
            LSR                ; $d9f7: 4a        
            LSR                ; $d9f8: 4a        
            and #$01           ; $d9f9: 29 01     
            clc                ; $d9fb: 18        
            adc #$21           ; $d9fc: 69 21     
            STA $0460,x        ; $d9fe: 9d 60 04  
            JMP __e70d         ; $da01: 4c 0d e7  

;-------------------------------------------------------------------------------
__da04:     LDA #$12           ; $da04: a9 12     
            STA $b0,x          ; $da06: 95 b0     
            LDA #$01           ; $da08: a9 01     
            STA $0480,x        ; $da0a: 9d 80 04  
            STA $05f3          ; $da0d: 8d f3 05  
            LDA #$22           ; $da10: a9 22     
            STA $0460,x        ; $da12: 9d 60 04  
            LDA #$12           ; $da15: a9 12     
            STA $04c0,x        ; $da17: 9d c0 04  
            JSR __e70d         ; $da1a: 20 0d e7  
            LDA $32            ; $da1d: a5 32     
            STA $e1            ; $da1f: 85 e1     
            LDA #$00           ; $da21: a9 00     
            STA $e0            ; $da23: 85 e0     
            asl $e1            ; $da25: 06 e1     
            ROL $e0            ; $da27: 26 e0     
            LDA $e0            ; $da29: a5 e0     
            STA $e2            ; $da2b: 85 e2     
            LDA $e1            ; $da2d: a5 e1     
            STA $e3            ; $da2f: 85 e3     
            asl $e1            ; $da31: 06 e1     
            ROL $e0            ; $da33: 26 e0     
            adc $e1            ; $da35: 65 e1     
            LDA $e2            ; $da37: a5 e2     
            adc $e0            ; $da39: 65 e0     
            STA $e0            ; $da3b: 85 e0     
            LDA $0480,x        ; $da3d: bd 80 04  
            sec                ; $da40: 38        
            sbc $e0            ; $da41: e5 e0     
            STA $0480,x        ; $da43: 9d 80 04  
            BPL __da82         ; $da46: 10 3a     
            clc                ; $da48: 18        
            adc #$10           ; $da49: 69 10     
            STA $0480,x        ; $da4b: 9d 80 04  
            INC $04d0,x        ; $da4e: fe d0 04  
            LDA $04d0,x        ; $da51: bd d0 04  
            CMP #$04           ; $da54: c9 04     
            BEQ __da9a         ; $da56: f0 42     
            STA $e2            ; $da58: 85 e2     
            JSR __DEC2         ; $da5a: 20 c2 de  
            LDA $0410,x        ; $da5d: bd 10 04  
            and #$02           ; $da60: 29 02     
            BNE __da6c         ; $da62: d0 08     
            LDA $e2            ; $da64: a5 e2     
            EOR #$ff           ; $da66: 49 ff     
            STA $e2            ; $da68: 85 e2     
            INC $e2            ; $da6a: e6 e2     
__da6c:     LDA $e1            ; $da6c: a5 e1     
            clc                ; $da6e: 18        
            adc $e2            ; $da6f: 65 e2     
            CMP #$0c           ; $da71: c9 0c     
            BCS __da9a         ; $da73: b0 25     
            LDA $e2            ; $da75: a5 e2     
            clc                ; $da77: 18        
            adc $e0            ; $da78: 65 e0     
            tay                ; $da7a: a8        
            LDA $0200,y        ; $da7b: b9 00 02  
            and #$40           ; $da7e: 29 40     
            BEQ __da9a         ; $da80: f0 18     
__da82:     LDA $04d0,x        ; $da82: bd d0 04  
            clc                ; $da85: 18        
            adc #$28           ; $da86: 69 28     
            STA $0460,x        ; $da88: 9d 60 04  
            DEC $0470,x        ; $da8b: de 70 04  
            JSR __e70d         ; $da8e: 20 0d e7  
            INC $0470,x        ; $da91: fe 70 04  
            LDA #$22           ; $da94: a9 22     
            STA $0460,x        ; $da96: 9d 60 04  
            RTS                ; $da99: 60        

;-------------------------------------------------------------------------------
__da9a:     LDA $04a0,x        ; $da9a: bd a0 04  
            STA $b0,x          ; $da9d: 95 b0     
            STA $04c0,x        ; $da9f: 9d c0 04  
            RTS                ; $daa2: 60        

;-------------------------------------------------------------------------------
__daa3:     LDA #$00           ; $daa3: a9 00     
            STA $a0,x          ; $daa5: 95 a0     
            DEC $61            ; $daa7: c6 61     
            RTS                ; $daa9: 60        

;-------------------------------------------------------------------------------
__daaa:     LDA #$01           ; $daaa: a9 01     
            STA $05e9          ; $daac: 8d e9 05  
            STA $05ea          ; $daaf: 8d ea 05  
            STA $2d            ; $dab2: 85 2d     
            LDA #$05           ; $dab4: a9 05     
            STA $06f1          ; $dab6: 8d f1 06  
            STA $06f2          ; $dab9: 8d f2 06  
__dabc:     LDA #$0c           ; $dabc: a9 0c     
            STA $b0,x          ; $dabe: 95 b0     
            STA $04c0,x        ; $dac0: 9d c0 04  
            LDA $d0,x          ; $dac3: b5 d0     
            BNE __dadd         ; $dac5: d0 16     
            LDA $c0,x          ; $dac7: b5 c0     
            clc                ; $dac9: 18        
            adc #$10           ; $daca: 69 10     
            CMP #$d0           ; $dacc: c9 d0     
            BCS __daa3         ; $dace: b0 d3     
            LDA #$01           ; $dad0: a9 01     
            STA $0410,x        ; $dad2: 9d 10 04  
            LDA $0470,x        ; $dad5: bd 70 04  
            and #$03           ; $dad8: 29 03     
            STA $0470,x        ; $dada: 9d 70 04  
__dadd:     LDA #$0c           ; $dadd: a9 0c     
            JMP __daee         ; $dadf: 4c ee da  

;-------------------------------------------------------------------------------
__dae2:     LDA $1f            ; $dae2: a5 1f     
            BNE __daec         ; $dae4: d0 06     
            LDA $61            ; $dae6: a5 61     
            CMP #$01           ; $dae8: c9 01     
            BEQ __daaa         ; $daea: f0 be     
__daec:     LDA #$00           ; $daec: a9 00     
__daee:     STA $04c0,x        ; $daee: 9d c0 04  
            LDA $c0,x          ; $daf1: b5 c0     
            ORA $d0,x          ; $daf3: 15 d0     
            and #$0f           ; $daf5: 29 0f     
            BEQ __db09         ; $daf7: f0 10     
            LDA $d0,x          ; $daf9: b5 d0     
            BNE __db03         ; $dafb: d0 06     
            LDA $b0,x          ; $dafd: b5 b0     
            CMP #$08           ; $daff: c9 08     
            BCS __db06         ; $db01: b0 03     
__db03:     JMP __dc1b         ; $db03: 4c 1b dc  

;-------------------------------------------------------------------------------
__db06:     JMP __dc59         ; $db06: 4c 59 dc  

;-------------------------------------------------------------------------------
__db09:     LDA $0480,x        ; $db09: bd 80 04  
            BEQ __db17         ; $db0c: f0 09     
            LDA $b0,x          ; $db0e: b5 b0     
            CMP #$08           ; $db10: c9 08     
            BCS __db06         ; $db12: b0 f2     
            JMP __dc34         ; $db14: 4c 34 dc  

;-------------------------------------------------------------------------------
__db17:     INC $0480,x        ; $db17: fe 80 04  
            LDA $a0,x          ; $db1a: b5 a0     
            CMP #$06           ; $db1c: c9 06     
            BNE __db5a         ; $db1e: d0 3a     
            LDA $0410,x        ; $db20: bd 10 04  
            LSR                ; $db23: 4a        
            bcc __db5a         ; $db24: 90 34     
            LDA $c0            ; $db26: a5 c0     
            sec                ; $db28: 38        
            sbc $c0,x          ; $db29: f5 c0     
            BCS __db31         ; $db2b: b0 04     
            EOR #$ff           ; $db2d: 49 ff     
            adc #$01           ; $db2f: 69 01     
__db31:     STA $e0            ; $db31: 85 e0     
            LDA $d0            ; $db33: a5 d0     
            sec                ; $db35: 38        
            sbc $d0,x          ; $db36: f5 d0     
            BCS __db3e         ; $db38: b0 04     
            EOR #$ff           ; $db3a: 49 ff     
            adc #$01           ; $db3c: 69 01     
__db3e:     clc                ; $db3e: 18        
            adc $e0            ; $db3f: 65 e0     
            BCS __db53         ; $db41: b0 10     
            CMP #$3c           ; $db43: c9 3c     
            BCS __db53         ; $db45: b0 0c     
            JSR __f01c         ; $db47: 20 1c f0  
            and #$3f           ; $db4a: 29 3f     
            CMP $33            ; $db4c: c5 33     
            BCS __db5a         ; $db4e: b0 0a     
__db50:     JMP __d9ad         ; $db50: 4c ad d9  

;-------------------------------------------------------------------------------
__db53:     JSR __f01c         ; $db53: 20 1c f0  
            CMP $33            ; $db56: c5 33     
            bcc __db50         ; $db58: 90 f6     
__db5a:     LDA $b0,x          ; $db5a: b5 b0     
            CMP #$08           ; $db5c: c9 08     
            bcc __db67         ; $db5e: 90 07     
            LDA $d0,x          ; $db60: b5 d0     
            BNE __db67         ; $db62: d0 03     
            JMP __dc59         ; $db64: 4c 59 dc  

;-------------------------------------------------------------------------------
__db67:     JSR __de3e         ; $db67: 20 3e de  
            LDA $0400,x        ; $db6a: bd 00 04  
            BPL __db97         ; $db6d: 10 28     
            JSR __f01c         ; $db6f: 20 1c f0  
            and #$07           ; $db72: 29 07     
            BNE __db8f         ; $db74: d0 19     
            LDA $0410,x        ; $db76: bd 10 04  
            JSR __dd64         ; $db79: 20 64 dd  
            CMP $e2            ; $db7c: c5 e2     
            BEQ __db83         ; $db7e: f0 03     
            JMP __dc34         ; $db80: 4c 34 dc  

;-------------------------------------------------------------------------------
__db83:     LDA $0410,x        ; $db83: bd 10 04  
            STA $ea            ; $db86: 85 ea     
            STA $eb            ; $db88: 85 eb     
            INC $eb            ; $db8a: e6 eb     
            JMP __db97         ; $db8c: 4c 97 db  

;-------------------------------------------------------------------------------
__db8f:     LDY $ea            ; $db8f: a4 ea     
            LDA $eb            ; $db91: a5 eb     
            STA $ea            ; $db93: 85 ea     
            STY $eb            ; $db95: 84 eb     
__db97:     LDA $0410,x        ; $db97: bd 10 04  
            EOR #$02           ; $db9a: 49 02     
            CMP $ea            ; $db9c: c5 ea     
            BEQ __dbb8         ; $db9e: f0 18     
            LDA $ea            ; $dba0: a5 ea     
            JSR __dd64         ; $dba2: 20 64 dd  
            CMP $e2            ; $dba5: c5 e2     
            BNE __dbb8         ; $dba7: d0 0f     
            LDA $0400,x        ; $dba9: bd 00 04  
            CMP #$20           ; $dbac: c9 20     
            BEQ __dbb3         ; $dbae: f0 03     
            INC $0400,x        ; $dbb0: fe 00 04  
__dbb3:     LDA $ea            ; $dbb3: a5 ea     
            JMP __dc04         ; $dbb5: 4c 04 dc  

;-------------------------------------------------------------------------------
__dbb8:     LDA $eb            ; $dbb8: a5 eb     
            EOR #$02           ; $dbba: 49 02     
            CMP $0410,x        ; $dbbc: dd 10 04  
            BEQ __dbcf         ; $dbbf: f0 0e     
            LDA $eb            ; $dbc1: a5 eb     
            JSR __dd64         ; $dbc3: 20 64 dd  
            CMP $e2            ; $dbc6: c5 e2     
            BNE __dbcf         ; $dbc8: d0 05     
            LDA $eb            ; $dbca: a5 eb     
            JMP __dc04         ; $dbcc: 4c 04 dc  

;-------------------------------------------------------------------------------
__dbcf:     DEC $0400,x        ; $dbcf: de 00 04  
            BPL __dbd9         ; $dbd2: 10 05     
            LDA #$fe           ; $dbd4: a9 fe     
            STA $0400,x        ; $dbd6: 9d 00 04  
__dbd9:     LDA $ea            ; $dbd9: a5 ea     
            CMP $0410,x        ; $dbdb: dd 10 04  
            BEQ __dbf0         ; $dbde: f0 10     
            EOR #$02           ; $dbe0: 49 02     
            STA $ea            ; $dbe2: 85 ea     
            JSR __dd64         ; $dbe4: 20 64 dd  
            CMP $e2            ; $dbe7: c5 e2     
            BNE __dbf0         ; $dbe9: d0 05     
            LDA $ea            ; $dbeb: a5 ea     
            JMP __dc04         ; $dbed: 4c 04 dc  

;-------------------------------------------------------------------------------
__dbf0:     LDA $eb            ; $dbf0: a5 eb     
            CMP $0410,x        ; $dbf2: dd 10 04  
            BEQ __dc1b         ; $dbf5: f0 24     
            EOR #$02           ; $dbf7: 49 02     
            STA $eb            ; $dbf9: 85 eb     
            JSR __dd64         ; $dbfb: 20 64 dd  
            CMP $e2            ; $dbfe: c5 e2     
            BNE __dc1b         ; $dc00: d0 19     
            LDA $eb            ; $dc02: a5 eb     
__dc04:     STA $ea            ; $dc04: 85 ea     
            CMP #$02           ; $dc06: c9 02     
            BNE __dc13         ; $dc08: d0 09     
            LDA $b0,x          ; $dc0a: b5 b0     
            CMP #$04           ; $dc0c: c9 04     
            bcc __dc13         ; $dc0e: 90 03     
            JMP __dc59         ; $dc10: 4c 59 dc  

;-------------------------------------------------------------------------------
__dc13:     LDA $ea            ; $dc13: a5 ea     
            STA $0410,x        ; $dc15: 9d 10 04  
            JMP __dc59         ; $dc18: 4c 59 dc  

;-------------------------------------------------------------------------------
__dc1b:     LDA #$00           ; $dc1b: a9 00     
            STA $0480,x        ; $dc1d: 9d 80 04  
            LDA $40            ; $dc20: a5 40     
            and #$01           ; $dc22: 29 01     
            BEQ __dc34         ; $dc24: f0 0e     
            CMP $61            ; $dc26: c5 61     
            BEQ __dc34         ; $dc28: f0 0a     
            LDA $0410,x        ; $dc2a: bd 10 04  
            BNE __dc34         ; $dc2d: d0 05     
            LDA #$02           ; $dc2f: a9 02     
            JMP __dc39         ; $dc31: 4c 39 dc  

;-------------------------------------------------------------------------------
__dc34:     LDA $0410,x        ; $dc34: bd 10 04  
            and #$03           ; $dc37: 29 03     
__dc39:     STA $0410,x        ; $dc39: 9d 10 04  
            JSR __dd64         ; $dc3c: 20 64 dd  
            CMP $e2            ; $dc3f: c5 e2     
            BEQ __dc59         ; $dc41: f0 16     
            LDA $0410,x        ; $dc43: bd 10 04  
            EOR #$02           ; $dc46: 49 02     
            STA $0410,x        ; $dc48: 9d 10 04  
            DEC $04b0,x        ; $dc4b: de b0 04  
            BNE __dc59         ; $dc4e: d0 09     
            INC $b0,x          ; $dc50: f6 b0     
            INC $b0,x          ; $dc52: f6 b0     
            LDA #$40           ; $dc54: a9 40     
            STA $0480,x        ; $dc56: 9d 80 04  
__dc59:     LDA $0410,x        ; $dc59: bd 10 04  
            LSR                ; $dc5c: 4a        
            bcc __dc70         ; $dc5d: 90 11     
            LSR                ; $dc5f: 4a        
            ROR                ; $dc60: 6a        
            LSR                ; $dc61: 4a        
            and #$40           ; $dc62: 29 40     
            STA $e0            ; $dc64: 85 e0     
            LDA $0470,x        ; $dc66: bd 70 04  
            and #$03           ; $dc69: 29 03     
            ORA $e0            ; $dc6b: 05 e0     
            STA $0470,x        ; $dc6d: 9d 70 04  
__dc70:     LDA $a0,x          ; $dc70: b5 a0     
            LSR                ; $dc72: 4a        
            and #$01           ; $dc73: 29 01     
            tay                ; $dc75: a8        
            LDA $0031,y        ; $dc76: b9 31 00  
            STA $e0            ; $dc79: 85 e0     
            JSR __dc9d         ; $dc7b: 20 9d dc  
            LDA $1f            ; $dc7e: a5 1f     
            BNE __dc84         ; $dc80: d0 02     
            LDA $10            ; $dc82: a5 10     
__dc84:     and #$10           ; $dc84: 29 10     
            LSR                ; $dc86: 4a        
            LSR                ; $dc87: 4a        
            LSR                ; $dc88: 4a        
            LSR                ; $dc89: 4a        
            STA $e0            ; $dc8a: 85 e0     
            LDA $a0,x          ; $dc8c: b5 a0     
            asl                ; $dc8e: 0a        
            asl                ; $dc8f: 0a        
            and #$08           ; $dc90: 29 08     
            clc                ; $dc92: 18        
            adc #$1a           ; $dc93: 69 1a     
            ORA $e0            ; $dc95: 05 e0     
            STA $0460,x        ; $dc97: 9d 60 04  
            JMP __e70d         ; $dc9a: 4c 0d e7  

;-------------------------------------------------------------------------------
__dc9d:     LDA $1f            ; $dc9d: a5 1f     
            BEQ __dca2         ; $dc9f: f0 01     
            RTS                ; $dca1: 60        

;-------------------------------------------------------------------------------
__dca2:     LDA $0410,x        ; $dca2: bd 10 04  
            asl                ; $dca5: 0a        
            and #$06           ; $dca6: 29 06     
            tay                ; $dca8: a8        
            LDA __dcb6,y       ; $dca9: b9 b6 dc  
            STA $ea            ; $dcac: 85 ea     
            LDA __dcb7,y       ; $dcae: b9 b7 dc  
            STA $eb            ; $dcb1: 85 eb     
            JMP ($00ea)        ; $dcb3: 6c ea 00  

;-------------------------------------------------------------------------------
__dcb6:     .hex f4            ; $dcb6: f4            Data
__dcb7:     .hex dc 11 dd 2e   ; $dcb7: dc 11 dd 2e   Data
            .hex dd 54 dd      ; $dcbb: dd 54 dd      Data

;-------------------------------------------------------------------------------
__dcbe:     LDA $1f            ; $dcbe: a5 1f     
            BEQ __dcc3         ; $dcc0: f0 01     
            RTS                ; $dcc2: 60        

;-------------------------------------------------------------------------------
__dcc3:     LDA $0410,x        ; $dcc3: bd 10 04  
            asl                ; $dcc6: 0a        
            and #$0e           ; $dcc7: 29 0e     
            tay                ; $dcc9: a8        
            LDA __dcd7,y       ; $dcca: b9 d7 dc  
            STA $ea            ; $dccd: 85 ea     
            LDA __dcd8,y       ; $dccf: b9 d8 dc  
            STA $eb            ; $dcd2: 85 eb     
            JMP ($00ea)        ; $dcd4: 6c ea 00  

;-------------------------------------------------------------------------------
__dcd7:     .hex f4            ; $dcd7: f4            Data
__dcd8:     .hex dc 04 dd 11   ; $dcd8: dc 04 dd 11   Data
            .hex dd 21 dd 2e   ; $dcdc: dd 21 dd 2e   Data
            .hex dd 47 dd 54   ; $dce0: dd 47 dd 54   Data
            .hex dd e7 dc      ; $dce4: dd e7 dc      Data

;-------------------------------------------------------------------------------
            LSR $e0            ; $dce7: 46 e0     
            LDA $e0            ; $dce9: a5 e0     
            LSR                ; $dceb: 4a        
            clc                ; $dcec: 18        
            adc $e0            ; $dced: 65 e0     
            STA $e0            ; $dcef: 85 e0     
            JSR __dd54         ; $dcf1: 20 54 dd  
__dcf4:     LDA $0440,x        ; $dcf4: bd 40 04  
            sec                ; $dcf7: 38        
            sbc $e0            ; $dcf8: e5 e0     
            STA $0440,x        ; $dcfa: 9d 40 04  
            LDA $d0,x          ; $dcfd: b5 d0     
            sbc #$00           ; $dcff: e9 00     
            STA $d0,x          ; $dd01: 95 d0     
            RTS                ; $dd03: 60        

;-------------------------------------------------------------------------------
            LSR $e0            ; $dd04: 46 e0     
            LDA $e0            ; $dd06: a5 e0     
            LSR                ; $dd08: 4a        
            clc                ; $dd09: 18        
            adc $e0            ; $dd0a: 65 e0     
            STA $e0            ; $dd0c: 85 e0     
            JSR __dcf4         ; $dd0e: 20 f4 dc  
__dd11:     LDA $0420,x        ; $dd11: bd 20 04  
            sec                ; $dd14: 38        
            sbc $e0            ; $dd15: e5 e0     
            STA $0420,x        ; $dd17: 9d 20 04  
            LDA $c0,x          ; $dd1a: b5 c0     
            sbc #$00           ; $dd1c: e9 00     
            STA $c0,x          ; $dd1e: 95 c0     
            RTS                ; $dd20: 60        

;-------------------------------------------------------------------------------
            LSR $e0            ; $dd21: 46 e0     
            LDA $e0            ; $dd23: a5 e0     
            LSR                ; $dd25: 4a        
            clc                ; $dd26: 18        
            adc $e0            ; $dd27: 65 e0     
            STA $e0            ; $dd29: 85 e0     
            JSR __dd11         ; $dd2b: 20 11 dd  
__dd2e:     LDA $e0            ; $dd2e: a5 e0     
            LSR                ; $dd30: 4a        
            LSR                ; $dd31: 4a        
            clc                ; $dd32: 18        
            adc $e0            ; $dd33: 65 e0     
            bcc __dd39         ; $dd35: 90 02     
            INC $d0,x          ; $dd37: f6 d0     
__dd39:     clc                ; $dd39: 18        
            adc $0440,x        ; $dd3a: 7d 40 04  
            STA $0440,x        ; $dd3d: 9d 40 04  
            LDA $d0,x          ; $dd40: b5 d0     
            adc #$00           ; $dd42: 69 00     
            STA $d0,x          ; $dd44: 95 d0     
            RTS                ; $dd46: 60        

;-------------------------------------------------------------------------------
            LSR $e0            ; $dd47: 46 e0     
            LDA $e0            ; $dd49: a5 e0     
            LSR                ; $dd4b: 4a        
            clc                ; $dd4c: 18        
            adc $e0            ; $dd4d: 65 e0     
            STA $e0            ; $dd4f: 85 e0     
            JSR __dd2e         ; $dd51: 20 2e dd  
__dd54:     LDA $0420,x        ; $dd54: bd 20 04  
            clc                ; $dd57: 18        
            adc $e0            ; $dd58: 65 e0     
            STA $0420,x        ; $dd5a: 9d 20 04  
            LDA $c0,x          ; $dd5d: b5 c0     
            adc #$00           ; $dd5f: 69 00     
            STA $c0,x          ; $dd61: 95 c0     
            RTS                ; $dd63: 60        

;-------------------------------------------------------------------------------
__dd64:     asl                ; $dd64: 0a        
            and #$06           ; $dd65: 29 06     
            tay                ; $dd67: a8        
            LDA __dd75,y       ; $dd68: b9 75 dd  
            STA $e8            ; $dd6b: 85 e8     
            LDA __dd76,y       ; $dd6d: b9 76 dd  
            STA $e9            ; $dd70: 85 e9     
            JMP ($00e8)        ; $dd72: 6c e8 00  

;-------------------------------------------------------------------------------
__dd75:     .hex 2c            ; $dd75: 2c            Data
__dd76:     .hex ed 8e ec dc   ; $dd76: ed 8e ec dc   Data
            .hex ec 46 ec      ; $dd7a: ec 46 ec      Data

;-------------------------------------------------------------------------------
__dd7d:     LDA $b0,x          ; $dd7d: b5 b0     
            CMP #$04           ; $dd7f: c9 04     
            bcc __dd8e         ; $dd81: 90 0b     
            LDA #$20           ; $dd83: a9 20     
            STA $e8            ; $dd85: 85 e8     
            LDA #$10           ; $dd87: a9 10     
            STA $e9            ; $dd89: 85 e9     
            JMP __dd9c         ; $dd8b: 4c 9c dd  

;-------------------------------------------------------------------------------
__dd8e:     LDA $c0            ; $dd8e: a5 c0     
            clc                ; $dd90: 18        
            adc #$10           ; $dd91: 69 10     
            STA $e8            ; $dd93: 85 e8     
            LDA $d0            ; $dd95: a5 d0     
            clc                ; $dd97: 18        
            adc #$10           ; $dd98: 69 10     
            STA $e9            ; $dd9a: 85 e9     
__dd9c:     LDA $d0,x          ; $dd9c: b5 d0     
            clc                ; $dd9e: 18        
            adc #$10           ; $dd9f: 69 10     
            STA $ea            ; $dda1: 85 ea     
            LDA $c0,x          ; $dda3: b5 c0     
            clc                ; $dda5: 18        
            adc #$10           ; $dda6: 69 10     
            CMP $e8            ; $dda8: c5 e8     
            BEQ __dddc         ; $ddaa: f0 30     
            bcc __ddb9         ; $ddac: 90 0b     
            LDA $ea            ; $ddae: a5 ea     
            CMP $e9            ; $ddb0: c5 e9     
            BNE __ddc4         ; $ddb2: d0 10     
            LDA #$02           ; $ddb4: a9 02     
            STA $ea            ; $ddb6: 85 ea     
            RTS                ; $ddb8: 60        

;-------------------------------------------------------------------------------
__ddb9:     LDA $ea            ; $ddb9: a5 ea     
            CMP $e9            ; $ddbb: c5 e9     
            BNE __ddd0         ; $ddbd: d0 11     
            LDA #$06           ; $ddbf: a9 06     
            STA $ea            ; $ddc1: 85 ea     
            RTS                ; $ddc3: 60        

;-------------------------------------------------------------------------------
__ddc4:     bcc __ddcb         ; $ddc4: 90 05     
            LDA #$01           ; $ddc6: a9 01     
            STA $ea            ; $ddc8: 85 ea     
            RTS                ; $ddca: 60        

;-------------------------------------------------------------------------------
__ddcb:     LDA #$03           ; $ddcb: a9 03     
            STA $ea            ; $ddcd: 85 ea     
            RTS                ; $ddcf: 60        

;-------------------------------------------------------------------------------
__ddd0:     bcc __ddd7         ; $ddd0: 90 05     
            LDA #$07           ; $ddd2: a9 07     
            STA $ea            ; $ddd4: 85 ea     
            RTS                ; $ddd6: 60        

;-------------------------------------------------------------------------------
__ddd7:     LDA #$05           ; $ddd7: a9 05     
            STA $ea            ; $ddd9: 85 ea     
            RTS                ; $dddb: 60        

;-------------------------------------------------------------------------------
__dddc:     LDA $e9            ; $dddc: a5 e9     
            CMP $ea            ; $ddde: c5 ea     
            BCS __dde7         ; $dde0: b0 05     
            LDA #$00           ; $dde2: a9 00     
            STA $ea            ; $dde4: 85 ea     
            RTS                ; $dde6: 60        

;-------------------------------------------------------------------------------
__dde7:     LDA #$04           ; $dde7: a9 04     
            STA $ea            ; $dde9: 85 ea     
            RTS                ; $ddeb: 60        

;-------------------------------------------------------------------------------
__dDEC:     LDA $0410,x        ; $dDEC: bd 10 04  
            CMP #$02           ; $ddef: c9 02     
            BNE __ddf8         ; $ddf1: d0 05     
            LDA #$00           ; $ddf3: a9 00     
            STA $0410,x        ; $ddf5: 9d 10 04  
__ddf8:     LDA $d0,x          ; $ddf8: b5 d0     
            BNE __de03         ; $ddfa: d0 07     
            LDA #$01           ; $ddfc: a9 01     
            STA $ea            ; $ddfe: 85 ea     
            STA $eb            ; $de00: 85 eb     
            RTS                ; $de02: 60        

;-------------------------------------------------------------------------------
__de03:     LDA $a0,x          ; $de03: b5 a0     
            CMP #$06           ; $de05: c9 06     
            BNE __de27         ; $de07: d0 1e     
            LDA $d0            ; $de09: a5 d0     
            CMP $d0,x          ; $de0b: d5 d0     
            bcc __de27         ; $de0d: 90 18     
            LDA $c0            ; $de0f: a5 c0     
            CMP $c0,x          ; $de11: d5 c0     
            BCS __de1e         ; $de13: b0 09     
            LDA #$01           ; $de15: a9 01     
            STA $ea            ; $de17: 85 ea     
            LDA #$03           ; $de19: a9 03     
            STA $eb            ; $de1b: 85 eb     
            RTS                ; $de1d: 60        

;-------------------------------------------------------------------------------
__de1e:     LDA #$03           ; $de1e: a9 03     
            STA $ea            ; $de20: 85 ea     
            LDA #$01           ; $de22: a9 01     
            STA $eb            ; $de24: 85 eb     
            RTS                ; $de26: 60        

;-------------------------------------------------------------------------------
__de27:     LDA #$00           ; $de27: a9 00     
            STA $ea            ; $de29: 85 ea     
            LDA $c0,x          ; $de2b: b5 c0     
            clc                ; $de2d: 18        
            adc #$10           ; $de2e: 69 10     
            CMP #$20           ; $de30: c9 20     
            bcc __de39         ; $de32: 90 05     
            LDA #$01           ; $de34: a9 01     
            STA $eb            ; $de36: 85 eb     
            RTS                ; $de38: 60        

;-------------------------------------------------------------------------------
__de39:     LDA #$03           ; $de39: a9 03     
            STA $eb            ; $de3b: 85 eb     
            RTS                ; $de3d: 60        

;-------------------------------------------------------------------------------
__de3e:     LDA $b0,x          ; $de3e: b5 b0     
            CMP #$04           ; $de40: c9 04     
            BCS __dDEC         ; $de42: b0 a8     
            LDA $40            ; $de44: a5 40     
            and #$01           ; $de46: 29 01     
            BNE __de9b         ; $de48: d0 51     
            LDA #$01           ; $de4a: a9 01     
            STA $ea            ; $de4c: 85 ea     
            LDA $c0,x          ; $de4e: b5 c0     
            sec                ; $de50: 38        
            sbc $c0            ; $de51: e5 c0     
            STA $e8            ; $de53: 85 e8     
            BCS __de61         ; $de55: b0 0a     
            EOR #$ff           ; $de57: 49 ff     
            STA $e8            ; $de59: 85 e8     
            INC $e8            ; $de5b: e6 e8     
            LDA #$03           ; $de5d: a9 03     
            STA $ea            ; $de5f: 85 ea     
__de61:     LDA #$00           ; $de61: a9 00     
            STA $eb            ; $de63: 85 eb     
            LDA $d0,x          ; $de65: b5 d0     
            sec                ; $de67: 38        
            sbc $d0            ; $de68: e5 d0     
            STA $e9            ; $de6a: 85 e9     
            BCS __de78         ; $de6c: b0 0a     
            EOR #$ff           ; $de6e: 49 ff     
            STA $e9            ; $de70: 85 e9     
            INC $e9            ; $de72: e6 e9     
            LDA #$02           ; $de74: a9 02     
            STA $eb            ; $de76: 85 eb     
__de78:     LDA $e8            ; $de78: a5 e8     
            CMP $e9            ; $de7a: c5 e9     
            BCS __de8c         ; $de7c: b0 0e     
            STA $e9            ; $de7e: 85 e9     
            LDA $ea            ; $de80: a5 ea     
            STA $e8            ; $de82: 85 e8     
            LDA $eb            ; $de84: a5 eb     
            STA $ea            ; $de86: 85 ea     
            LDA $e8            ; $de88: a5 e8     
            STA $eb            ; $de8a: 85 eb     
__de8c:     LDA $e9            ; $de8c: a5 e9     
            BNE __de9a         ; $de8e: d0 0a     
            JSR __f01c         ; $de90: 20 1c f0  
            and #$01           ; $de93: 29 01     
            LSR $eb            ; $de95: 46 eb     
            ROL                ; $de97: 2a        
            STA $eb            ; $de98: 85 eb     
__de9a:     RTS                ; $de9a: 60        

;-------------------------------------------------------------------------------
__de9b:     LDA $0410,x        ; $de9b: bd 10 04  
            BNE __dea5         ; $de9e: d0 05     
            LDA #$02           ; $dea0: a9 02     
            STA $0410,x        ; $dea2: 9d 10 04  
__dea5:     LDA #$02           ; $dea5: a9 02     
            STA $0400,x        ; $dea7: 9d 00 04  
            STA $eb            ; $deaa: 85 eb     
            LDY #$03           ; $deac: a0 03     
            LDA $c0,x          ; $deae: b5 c0     
            CMP $c0            ; $deb0: c5 c0     
            bcc __debf         ; $deb2: 90 0b     
            LDY #$01           ; $deb4: a0 01     
            BNE __debf         ; $deb6: d0 07     
            STY $eb            ; $deb8: 84 eb     
            LDA #$02           ; $deba: a9 02     
            STA $ea            ; $debc: 85 ea     
            RTS                ; $debe: 60        

;-------------------------------------------------------------------------------
__debf:     STY $ea            ; $debf: 84 ea     
            RTS                ; $DEC1: 60        

;-------------------------------------------------------------------------------
__DEC2:     LDA $d0,x          ; $DEC2: b5 d0     
            and #$f0           ; $DEC4: 29 f0     
            LSR                ; $DEC6: 4a        
            STA $e0            ; $DEC7: 85 e0     
            LSR                ; $DEC9: 4a        
            adc $e0            ; $DECa: 65 e0     
            STA $e0            ; $DECc: 85 e0     
            LDA $c0,x          ; $DECe: b5 c0     
            LSR                ; $ded0: 4a        
            LSR                ; $ded1: 4a        
            LSR                ; $ded2: 4a        
            LSR                ; $ded3: 4a        
            STA $e1            ; $ded4: 85 e1     
            clc                ; $ded6: 18        
            adc $e0            ; $ded7: 65 e0     
            STA $e0            ; $ded9: 85 e0     
            RTS                ; $dedb: 60        

;-------------------------------------------------------------------------------
            LDA $b0,x          ; $dedc: b5 b0     
            BEQ __dee2         ; $dede: f0 02     
            INC $41            ; $dee0: e6 41     
__dee2:     tay                ; $dee2: a8        
            LDA __def0,y       ; $dee3: b9 f0 de  
            STA $ea            ; $dee6: 85 ea     
            LDA __def1,y       ; $dee8: b9 f1 de  
            STA $eb            ; $deeb: 85 eb     
            JMP ($00ea)        ; $deed: 6c ea 00  

;-------------------------------------------------------------------------------
__def0:     .hex 2e            ; $def0: 2e            Data
__def1:     .hex e1 02 e1 03   ; $def1: e1 02 e1 03   Data
            .hex e0 dd df 3d   ; $def5: e0 dd df 3d   Data
            .hex df fc de      ; $def9: df fc de      Data

;-------------------------------------------------------------------------------
            INC $41            ; $defc: e6 41     
            DEC $0480,x        ; $defe: de 80 04  
            BNE __df1c         ; $df01: d0 19     
            LDA $0460,x        ; $df03: bd 60 04  
            CMP #$30           ; $df06: c9 30     
            BNE __df1f         ; $df08: d0 15     
            LDA #$78           ; $df0a: a9 78     
            STA $0480,x        ; $df0c: 9d 80 04  
            LDA $04b0,x        ; $df0f: bd b0 04  
            BEQ __df1f         ; $df12: f0 0b     
            STA $0460,x        ; $df14: 9d 60 04  
            LDA #$01           ; $df17: a9 01     
            STA $0470,x        ; $df19: 9d 70 04  
__df1c:     JMP __e70d         ; $df1c: 4c 0d e7  

;-------------------------------------------------------------------------------
__df1f:     LDA #$00           ; $df1f: a9 00     
            STA $a0,x          ; $df21: 95 a0     
            RTS                ; $df23: 60        

;-------------------------------------------------------------------------------
__df24:     .hex 00 3a 3c 3e   ; $df24: 00 3a 3c 3e   Data
            .hex 40 42 43 44   ; $df28: 40 42 43 44   Data
            .hex 45            ; $df2c: 45            Data
__df2d:     .hex 00 01 19 04   ; $df2d: 00 01 19 04   Data
            .hex 06 08 0a 0c   ; $df31: 06 08 0a 0c   Data
            .hex 0f            ; $df35: 0f            Data

;-------------------------------------------------------------------------------
__df36:     LDA $d0,x          ; $df36: b5 d0     
            and #$0f           ; $df38: 29 0f     
            JMP __e042         ; $df3a: 4c 42 e0  

;-------------------------------------------------------------------------------
            LDA $d0,x          ; $df3d: b5 d0     
            clc                ; $df3f: 18        
            adc #$10           ; $df40: 69 10     
            and #$f0           ; $df42: 29 f0     
            LSR                ; $df44: 4a        
            STA $e0            ; $df45: 85 e0     
            LSR                ; $df47: 4a        
            adc $e0            ; $df48: 65 e0     
            STA $e0            ; $df4a: 85 e0     
            LDA $c0,x          ; $df4c: b5 c0     
            LSR                ; $df4e: 4a        
            LSR                ; $df4f: 4a        
            LSR                ; $df50: 4a        
            LSR                ; $df51: 4a        
            clc                ; $df52: 18        
            adc $e0            ; $df53: 65 e0     
            tay                ; $df55: a8        
            LDA $0200,y        ; $df56: b9 00 02  
            bmi __df36         ; $df59: 30 db     
            LDY #$00           ; $df5b: a0 00     
            STY $e0            ; $df5d: 84 e0     
            LDA $00a0,y        ; $df5f: b9 a0 00  
            BEQ __df68         ; $df62: f0 04     
            CMP #$08           ; $df64: c9 08     
            bcc __dfae         ; $df66: 90 46     
__df68:     INY                ; $df68: c8        
            CPY #$0e           ; $df69: c0 0e     
            BNE __dfae         ; $df6b: d0 41     
            INC $b0,x          ; $df6d: f6 b0     
            INC $b0,x          ; $df6f: f6 b0     
            LDA #$5a           ; $df71: a9 5a     
            STA $0480,x        ; $df73: 9d 80 04  
            LDA $e0            ; $df76: a5 e0     
            pha                ; $df78: 48        
            JSR __e70d         ; $df79: 20 0d e7  
            LDA $d0,x          ; $df7c: b5 d0     
            sec                ; $df7e: 38        
            sbc #$08           ; $df7f: e9 08     
            STA $d0,x          ; $df81: 95 d0     
            LDY #$01           ; $df83: a0 01     
            STY $05f4          ; $df85: 8c f4 05  
            pla                ; $df88: 68        
            tay                ; $df89: a8        
            LDA __df24,y       ; $df8a: b9 24 df  
            STA $04b0,x        ; $df8d: 9d b0 04  
            LDA __df2d,y       ; $df90: b9 2d df  
            BEQ __dfa2         ; $df93: f0 0d     
            CPY #$02           ; $df95: c0 02     
            BEQ __df9f         ; $df97: f0 06     
            JSR __ed88         ; $df99: 20 88 ed  
            JMP __dfa2         ; $df9c: 4c a2 df  

;-------------------------------------------------------------------------------
__df9f:     JSR __ed83         ; $df9f: 20 83 ed  
__dfa2:     INC $6f            ; $dfa2: e6 6f     
            LDA $6f            ; $dfa4: a5 6f     
            CMP #$02           ; $dfa6: c9 02     
            BNE __dfad         ; $dfa8: d0 03     
            JMP __e18c         ; $dfaa: 4c 8c e1  

;-------------------------------------------------------------------------------
__dfad:     RTS                ; $dfad: 60        

;-------------------------------------------------------------------------------
__dfae:     LDA $00b0,y        ; $dfae: b9 b0 00  
            CMP #$06           ; $dfb1: c9 06     
            BNE __df68         ; $dfb3: d0 b3     
            LDA $04b0,y        ; $dfb5: b9 b0 04  
            STA $e2            ; $dfb8: 85 e2     
            CPX $e2            ; $dfba: e4 e2     
            BNE __df68         ; $dfbc: d0 aa     
            LDA $00a0,y        ; $dfbe: b9 a0 00  
            CMP #$04           ; $dfc1: c9 04     
            bcc __dfc7         ; $dfc3: 90 02     
            INC $e0            ; $dfc5: e6 e0     
__dfc7:     LDA #$08           ; $dfc7: a9 08     
            STA $00b0,y        ; $dfc9: 99 b0 00  
            LDA #$5a           ; $dfcc: a9 5a     
            STA $0480,y        ; $dfce: 99 80 04  
            LDA $00d0,y        ; $dfd1: b9 d0 00  
            sec                ; $dfd4: 38        
            sbc #$02           ; $dfd5: e9 02     
            STA $00d0,y        ; $dfd7: 99 d0 00  
            JMP __df68         ; $dfda: 4c 68 df  

;-------------------------------------------------------------------------------
            INC $41            ; $dfdd: e6 41     
            JSR __e70d         ; $dfdf: 20 0d e7  
            DEC $0480,x        ; $dfe2: de 80 04  
            BNE __e002         ; $dfe5: d0 1b     
            INC $0460,x        ; $dfe7: fe 60 04  
            LDA #$3c           ; $dfea: a9 3c     
            STA $0480,x        ; $dfec: 9d 80 04  
            LDA $0460,x        ; $dfef: bd 60 04  
            CMP #$31           ; $dff2: c9 31     
            BNE __dffa         ; $dff4: d0 04     
            INC $0460,x        ; $dff6: fe 60 04  
            RTS                ; $dff9: 60        

;-------------------------------------------------------------------------------
__dffa:     CMP #$34           ; $dffa: c9 34     
            BNE __e002         ; $dffc: d0 04     
            LDA #$00           ; $dffe: a9 00     
            STA $a0,x          ; $e000: 95 a0     
__e002:     RTS                ; $e002: 60        

;-------------------------------------------------------------------------------
            LDA $d0,x          ; $e003: b5 d0     
            and #$0f           ; $e005: 29 0f     
            BNE __e042         ; $e007: d0 39     
            LDA $d0,x          ; $e009: b5 d0     
            clc                ; $e00b: 18        
            adc #$10           ; $e00c: 69 10     
            LSR                ; $e00e: 4a        
            STA $e0            ; $e00f: 85 e0     
            LSR                ; $e011: 4a        
            adc $e0            ; $e012: 65 e0     
            STA $e0            ; $e014: 85 e0     
            LDA $c0,x          ; $e016: b5 c0     
            LSR                ; $e018: 4a        
            LSR                ; $e019: 4a        
            LSR                ; $e01a: 4a        
            LSR                ; $e01b: 4a        
            clc                ; $e01c: 18        
            adc $e0            ; $e01d: 65 e0     
            tay                ; $e01f: a8        
            LDA $0200,y        ; $e020: b9 00 02  
            bmi __e042         ; $e023: 30 1d     
            INC $b0,x          ; $e025: f6 b0     
            INC $b0,x          ; $e027: f6 b0     
            LDA #$01           ; $e029: a9 01     
            STA $05f4          ; $e02b: 8d f4 05  
            LDA #$5a           ; $e02e: a9 5a     
            STA $0480,x        ; $e030: 9d 80 04  
            JSR __e70d         ; $e033: 20 0d e7  
            INC $6f            ; $e036: e6 6f     
            LDA $6f            ; $e038: a5 6f     
            CMP #$02           ; $e03a: c9 02     
            BNE __e041         ; $e03c: d0 03     
            JMP __e18c         ; $e03e: 4c 8c e1  

;-------------------------------------------------------------------------------
__e041:     RTS                ; $e041: 60        

;-------------------------------------------------------------------------------
__e042:     sec                ; $e042: 38        
            sbc #$0e           ; $e043: e9 0e     
            BNE __e04a         ; $e045: d0 03     
            STA $04b0,x        ; $e047: 9d b0 04  
__e04a:     LDA $d0,x          ; $e04a: b5 d0     
            clc                ; $e04c: 18        
            adc #$02           ; $e04d: 69 02     
            STA $d0,x          ; $e04f: 95 d0     
            LDY #$00           ; $e051: a0 00     
__e053:     LDA $00a0,y        ; $e053: b9 a0 00  
            BNE __e066         ; $e056: d0 0e     
__e058:     INY                ; $e058: c8        
            CPY #$0e           ; $e059: c0 0e     
            BNE __e053         ; $e05b: d0 f6     
            JSR __e70d         ; $e05d: 20 0d e7  
            LDA $04b0,x        ; $e060: bd b0 04  
            BEQ __e0ba         ; $e063: f0 55     
            RTS                ; $e065: 60        

;-------------------------------------------------------------------------------
__e066:     CMP #$08           ; $e066: c9 08     
            BCS __e058         ; $e068: b0 ee     
            LDA $00b0,y        ; $e06a: b9 b0 00  
            CMP #$06           ; $e06d: c9 06     
            bcc __e075         ; $e06f: 90 04     
            CMP #$0c           ; $e071: c9 0c     
            bcc __e058         ; $e073: 90 e3     
__e075:     LDA $00c0,y        ; $e075: b9 c0 00  
            sec                ; $e078: 38        
            sbc $c0,x          ; $e079: f5 c0     
            clc                ; $e07b: 18        
            adc #$09           ; $e07c: 69 09     
            CMP #$13           ; $e07e: c9 13     
            BCS __e058         ; $e080: b0 d6     
            LDA $00d0,y        ; $e082: b9 d0 00  
            sec                ; $e085: 38        
            sbc $d0,x          ; $e086: f5 d0     
            clc                ; $e088: 18        
            adc #$04           ; $e089: 69 04     
            CMP #$13           ; $e08b: c9 13     
            BCS __e058         ; $e08d: b0 c9     
            LDA $d0,x          ; $e08f: b5 d0     
            STA $00d0,y        ; $e091: 99 d0 00  
            LDA #$06           ; $e094: a9 06     
            STA $00b0,y        ; $e096: 99 b0 00  
            txa                ; $e099: 8a        
            STA $04b0,y        ; $e09a: 99 b0 04  
            LDA $00a0,y        ; $e09d: b9 a0 00  
            CMP #$06           ; $e0a0: c9 06     
            BNE __e0ae         ; $e0a2: d0 0a     
            LDA $0470,y        ; $e0a4: b9 70 04  
            and #$f0           ; $e0a7: 29 f0     
            ORA #$02           ; $e0a9: 09 02     
            STA $0470,y        ; $e0ab: 99 70 04  
__e0ae:     LDA #$01           ; $e0ae: a9 01     
            STA $05ef          ; $e0b0: 8d ef 05  
            LDA #$08           ; $e0b3: a9 08     
            STA $b0,x          ; $e0b5: 95 b0     
            JMP __e058         ; $e0b7: 4c 58 e0  

;-------------------------------------------------------------------------------
__e0ba:     LDA $d0,x          ; $e0ba: b5 d0     
            clc                ; $e0bc: 18        
            adc #$09           ; $e0bd: 69 09     
            STA $e1            ; $e0bf: 85 e1     
            and #$f0           ; $e0c1: 29 f0     
            STA $e8            ; $e0c3: 85 e8     
            LSR                ; $e0c5: 4a        
            STA $e0            ; $e0c6: 85 e0     
            LSR                ; $e0c8: 4a        
            adc $e0            ; $e0c9: 65 e0     
            STA $e0            ; $e0cb: 85 e0     
            LDA $c0,x          ; $e0cd: b5 c0     
            and #$f0           ; $e0cf: 29 f0     
            LSR                ; $e0d1: 4a        
            LSR                ; $e0d2: 4a        
            LSR                ; $e0d3: 4a        
            STA $e6            ; $e0d4: 85 e6     
            LSR                ; $e0d6: 4a        
            clc                ; $e0d7: 18        
            adc $e0            ; $e0d8: 65 e0     
            STA $e0            ; $e0da: 85 e0     
            tay                ; $e0dc: a8        
            LDA $e1            ; $e0dd: a5 e1     
            LSR                ; $e0df: 4a        
            LSR                ; $e0e0: 4a        
            and #$03           ; $e0e1: 29 03     
            STA $e1            ; $e0e3: 85 e1     
            LDA $0200,y        ; $e0e5: b9 00 02  
            STA $e2            ; $e0e8: 85 e2     
            asl                ; $e0ea: 0a        
            asl                ; $e0eb: 0a        
            clc                ; $e0ec: 18        
            adc $e1            ; $e0ed: 65 e1     
            tay                ; $e0ef: a8        
            LDA __fa87,y       ; $e0f0: b9 87 fa  
            CMP $e2            ; $e0f3: c5 e2     
            BEQ __e101         ; $e0f5: f0 0a     
            STA $e2            ; $e0f7: 85 e2     
            LDY $e0            ; $e0f9: a4 e0     
            STA $0200,y        ; $e0fb: 99 00 02  
            JMP __d66b         ; $e0fe: 4c 6b d6  

;-------------------------------------------------------------------------------
__e101:     RTS                ; $e101: 60        

;-------------------------------------------------------------------------------
            LDA #$03           ; $e102: a9 03     
            STA $41            ; $e104: 85 41     
            LDA $1f            ; $e106: a5 1f     
            BNE __e11d         ; $e108: d0 13     
            DEC $0480,x        ; $e10a: de 80 04  
            BNE __e11d         ; $e10d: d0 0e     
            LDA #$04           ; $e10f: a9 04     
            STA $b0,x          ; $e111: 95 b0     
            STA $04b0,x        ; $e113: 9d b0 04  
            LDA #$01           ; $e116: a9 01     
            STA $05f2          ; $e118: 8d f2 05  
            STA $41            ; $e11b: 85 41     
__e11d:     LDA $0480,x        ; $e11d: bd 80 04  
            LSR                ; $e120: 4a        
            LSR                ; $e121: 4a        
            LSR                ; $e122: 4a        
            LSR                ; $e123: 4a        
            and #$01           ; $e124: 29 01     
            ORA #$30           ; $e126: 09 30     
            STA $0460,x        ; $e128: 9d 60 04  
            JMP __e70d         ; $e12b: 4c 0d e7  

;-------------------------------------------------------------------------------
            JSR __e70d         ; $e12e: 20 0d e7  
            LDA $1f            ; $e131: a5 1f     
            BEQ __e136         ; $e133: f0 01     
            RTS                ; $e135: 60        

;-------------------------------------------------------------------------------
__e136:     LDA $d0,x          ; $e136: b5 d0     
            clc                ; $e138: 18        
            adc #$10           ; $e139: 69 10     
            and #$f0           ; $e13b: 29 f0     
            LSR                ; $e13d: 4a        
            STA $e0            ; $e13e: 85 e0     
            LSR                ; $e140: 4a        
            adc $e0            ; $e141: 65 e0     
            STA $e0            ; $e143: 85 e0     
            LDA $c0,x          ; $e145: b5 c0     
            LSR                ; $e147: 4a        
            LSR                ; $e148: 4a        
            LSR                ; $e149: 4a        
            LSR                ; $e14a: 4a        
            clc                ; $e14b: 18        
            adc $e0            ; $e14c: 65 e0     
            tay                ; $e14e: a8        
            LDA $0200,y        ; $e14f: b9 00 02  
            bmi __e15a         ; $e152: 30 06     
            LDA #$04           ; $e154: a9 04     
            STA $0480,x        ; $e156: 9d 80 04  
            RTS                ; $e159: 60        

;-------------------------------------------------------------------------------
__e15a:     LDA $c0,x          ; $e15a: b5 c0     
            sec                ; $e15c: 38        
            sbc $c0            ; $e15d: e5 c0     
            clc                ; $e15f: 18        
            adc #$02           ; $e160: 69 02     
            CMP #$05           ; $e162: c9 05     
            BCS __e182         ; $e164: b0 1c     
            LDA $d0,x          ; $e166: b5 d0     
            sec                ; $e168: 38        
            sbc $d0            ; $e169: e5 d0     
            clc                ; $e16b: 18        
            adc #$12           ; $e16c: 69 12     
            CMP #$06           ; $e16e: c9 06     
            BCS __e182         ; $e170: b0 10     
            DEC $0480,x        ; $e172: de 80 04  
            BPL __e181         ; $e175: 10 0a     
            LDA $0410          ; $e177: ad 10 04  
            and #$10           ; $e17a: 29 10     
            BEQ __e182         ; $e17c: f0 04     
            INC $0480,x        ; $e17e: fe 80 04  
__e181:     RTS                ; $e181: 60        

;-------------------------------------------------------------------------------
__e182:     LDA #$3c           ; $e182: a9 3c     
            STA $0480,x        ; $e184: 9d 80 04  
            LDA #$02           ; $e187: a9 02     
            STA $b0,x          ; $e189: 95 b0     
            RTS                ; $e18b: 60        

;-------------------------------------------------------------------------------
__e18c:     STX $e4            ; $e18c: 86 e4     
            LDA $6e            ; $e18e: a5 6e     
            CMP #$12           ; $e190: c9 12     
            bcc __e196         ; $e192: 90 02     
            LDA #$12           ; $e194: a9 12     
__e196:     tax                ; $e196: aa        
            LDY $0e            ; $e197: a4 0e     
            LDA $14            ; $e199: a5 14     
            asl                ; $e19b: 0a        
            asl                ; $e19c: 0a        
            asl                ; $e19d: 0a        
            ORA #$22           ; $e19e: 09 22     
            STA $e0            ; $e1a0: 85 e0     
            STA $0500,y        ; $e1a2: 99 00 05  
            INY                ; $e1a5: c8        
            LDA #$0a           ; $e1a6: a9 0a     
            STA $0500,y        ; $e1a8: 99 00 05  
            INY                ; $e1ab: c8        
            LDA #$02           ; $e1ac: a9 02     
            STA $0500,y        ; $e1ae: 99 00 05  
            INY                ; $e1b1: c8        
            LDA __e2cd,x       ; $e1b2: bd cd e2  
            STA $0500,y        ; $e1b5: 99 00 05  
            INY                ; $e1b8: c8        
            clc                ; $e1b9: 18        
            adc #$02           ; $e1ba: 69 02     
            STA $0500,y        ; $e1bc: 99 00 05  
            INY                ; $e1bf: c8        
            LDA $e0            ; $e1c0: a5 e0     
            STA $0500,y        ; $e1c2: 99 00 05  
            INY                ; $e1c5: c8        
            LDA #$2a           ; $e1c6: a9 2a     
            STA $0500,y        ; $e1c8: 99 00 05  
            INY                ; $e1cb: c8        
            LDA #$02           ; $e1cc: a9 02     
            STA $0500,y        ; $e1ce: 99 00 05  
            INY                ; $e1d1: c8        
            LDA __e2cd,x       ; $e1d2: bd cd e2  
            clc                ; $e1d5: 18        
            adc #$01           ; $e1d6: 69 01     
            STA $0500,y        ; $e1d8: 99 00 05  
            INY                ; $e1db: c8        
            clc                ; $e1dc: 18        
            adc #$02           ; $e1dd: 69 02     
            STA $0500,y        ; $e1df: 99 00 05  
            INY                ; $e1e2: c8        
            LDA #$00           ; $e1e3: a9 00     
            STA $0500,y        ; $e1e5: 99 00 05  
            STY $0e            ; $e1e8: 84 0e     
            LDY #$00           ; $e1ea: a0 00     
__e1ec:     LDA $00a0,y        ; $e1ec: b9 a0 00  
            BEQ __e1f5         ; $e1ef: f0 04     
            INY                ; $e1f1: c8        
            JMP __e1ec         ; $e1f2: 4c ec e1  

;-------------------------------------------------------------------------------
__e1f5:     LDA #$0a           ; $e1f5: a9 0a     
            STA $00a0,y        ; $e1f7: 99 a0 00  
            LDA #$50           ; $e1fa: a9 50     
            STA $00c0,y        ; $e1fc: 99 c0 00  
            LDA #$60           ; $e1ff: a9 60     
            STA $00d0,y        ; $e201: 99 d0 00  
            LDA #$00           ; $e204: a9 00     
            STA $00b0,y        ; $e206: 99 b0 00  
            LDA #$f0           ; $e209: a9 f0     
            STA $0480,y        ; $e20b: 99 80 04  
            LDA #$01           ; $e20e: a9 01     
            STA $0470,y        ; $e210: 99 70 04  
            LDA __e2e1,x       ; $e213: bd e1 e2  
            STA $0460,y        ; $e216: 99 60 04  
            STY $42            ; $e219: 84 42     
            LDX $e4            ; $e21b: a6 e4     
            RTS                ; $e21d: 60        

;-------------------------------------------------------------------------------
            LDA $b0,x          ; $e21e: b5 b0     
            BNE __e278         ; $e220: d0 56     
            LDA $c0            ; $e222: a5 c0     
            sec                ; $e224: 38        
            sbc #$48           ; $e225: e9 48     
            CMP #$11           ; $e227: c9 11     
            BCS __e266         ; $e229: b0 3b     
            LDA $d0            ; $e22b: a5 d0     
            sec                ; $e22d: 38        
            sbc #$58           ; $e22e: e9 58     
            CMP #$11           ; $e230: c9 11     
            BCS __e266         ; $e232: b0 32     
            JSR __e284         ; $e234: 20 84 e2  
            LDA #$01           ; $e237: a9 01     
            STA $b0,x          ; $e239: 95 b0     
            STA $05ed          ; $e23b: 8d ed 05  
            LDA #$96           ; $e23e: a9 96     
            STA $0480,x        ; $e240: 9d 80 04  
            LDA $6e            ; $e243: a5 6e     
            sec                ; $e245: 38        
            sbc #$04           ; $e246: e9 04     
            bcc __e25a         ; $e248: 90 10     
            LSR                ; $e24a: 4a        
            clc                ; $e24b: 18        
            adc #$01           ; $e24c: 69 01     
            CMP #$08           ; $e24e: c9 08     
            bcc __e254         ; $e250: 90 02     
            LDA #$08           ; $e252: a9 08     
__e254:     JSR __ed88         ; $e254: 20 88 ed  
            JMP __e70d         ; $e257: 4c 0d e7  

;-------------------------------------------------------------------------------
__e25a:     LDA $6e            ; $e25a: a5 6e     
            clc                ; $e25c: 18        
            adc #$01           ; $e25d: 69 01     
            asl                ; $e25f: 0a        
            JSR __ed83         ; $e260: 20 83 ed  
            JMP __e70d         ; $e263: 4c 0d e7  

;-------------------------------------------------------------------------------
__e266:     LDA $10            ; $e266: a5 10     
            LSR                ; $e268: 4a        
            bcc __e277         ; $e269: 90 0c     
            DEC $0480,x        ; $e26b: de 80 04  
            BNE __e277         ; $e26e: d0 07     
            JSR __e284         ; $e270: 20 84 e2  
            LDA #$00           ; $e273: a9 00     
            STA $a0,x          ; $e275: 95 a0     
__e277:     RTS                ; $e277: 60        

;-------------------------------------------------------------------------------
__e278:     DEC $0480,x        ; $e278: de 80 04  
            BNE __e281         ; $e27b: d0 04     
            LDA #$00           ; $e27d: a9 00     
            STA $a0,x          ; $e27f: 95 a0     
__e281:     JMP __e70d         ; $e281: 4c 0d e7  

;-------------------------------------------------------------------------------
__e284:     LDY $0e            ; $e284: a4 0e     
            LDA $14            ; $e286: a5 14     
            asl                ; $e288: 0a        
            asl                ; $e289: 0a        
            asl                ; $e28a: 0a        
            ORA #$22           ; $e28b: 09 22     
            STA $e0            ; $e28d: 85 e0     
            STA $0500,y        ; $e28f: 99 00 05  
            INY                ; $e292: c8        
            LDA #$0a           ; $e293: a9 0a     
            STA $0500,y        ; $e295: 99 00 05  
            INY                ; $e298: c8        
            LDA #$02           ; $e299: a9 02     
            STA $0500,y        ; $e29b: 99 00 05  
            INY                ; $e29e: c8        
            LDA #$54           ; $e29f: a9 54     
            STA $0500,y        ; $e2a1: 99 00 05  
            INY                ; $e2a4: c8        
            STA $0500,y        ; $e2a5: 99 00 05  
            INY                ; $e2a8: c8        
            LDA $e0            ; $e2a9: a5 e0     
            STA $0500,y        ; $e2ab: 99 00 05  
            INY                ; $e2ae: c8        
            LDA #$2a           ; $e2af: a9 2a     
            STA $0500,y        ; $e2b1: 99 00 05  
            INY                ; $e2b4: c8        
            LDA #$02           ; $e2b5: a9 02     
            STA $0500,y        ; $e2b7: 99 00 05  
            INY                ; $e2ba: c8        
            LDA #$54           ; $e2bb: a9 54     
            STA $0500,y        ; $e2bd: 99 00 05  
            INY                ; $e2c0: c8        
            STA $0500,y        ; $e2c1: 99 00 05  
            INY                ; $e2c4: c8        
            LDA #$00           ; $e2c5: a9 00     
            STA $0500,y        ; $e2c7: 99 00 05  
            STY $0e            ; $e2ca: 84 0e     
            RTS                ; $e2cc: 60        

;-------------------------------------------------------------------------------
__e2cd:     .hex 5c 5c 64 70   ; $e2cd: 5c 5c 64 70   Data
            .hex 60 60 6c 6c   ; $e2d1: 60 60 6c 6c   Data
            .hex 68 68 74 74   ; $e2d5: 68 68 74 74   Data
            .hex 78 78 58 58   ; $e2d9: 78 78 58 58   Data
            .hex 7c 7c 80 80   ; $e2dd: 7c 7c 80 80   Data
__e2e1:     .hex 36 36 38 39   ; $e2e1: 36 36 38 39   Data
            .hex 3a 3a 3b 3b   ; $e2e5: 3a 3a 3b 3b   Data
            .hex 3d 3d 3e 3e   ; $e2e9: 3d 3d 3e 3e   Data
            .hex 3f 3f 40 40   ; $e2ed: 3f 3f 40 40   Data
            .hex 41 41 42 42   ; $e2f1: 41 41 42 42   Data

;-------------------------------------------------------------------------------
__e2f5:     LDA $6e            ; $e2f5: a5 6e     
            CMP #$1c           ; $e2f7: c9 1c     
            bcc __e2fd         ; $e2f9: 90 02     
            LDA #$1c           ; $e2fb: a9 1c     
__e2fd:     LSR                ; $e2fd: 4a        
            tay                ; $e2fe: a8        
            LDX #$01           ; $e2ff: a2 01     
            LDA __e50a,y       ; $e301: b9 0a e5  
            LSR                ; $e304: 4a        
            LSR                ; $e305: 4a        
            LSR                ; $e306: 4a        
            LSR                ; $e307: 4a        
__e308:     and #$0f           ; $e308: 29 0f     
            BNE __e30e         ; $e30a: d0 02     
            LDA #$04           ; $e30c: a9 04     
__e30e:     STA $04b0,x        ; $e30e: 9d b0 04  
            clc                ; $e311: 18        
            adc __e50a,y       ; $e312: 79 0a e5  
            INX                ; $e315: e8        
            CPX #$09           ; $e316: e0 09     
            BNE __e308         ; $e318: d0 ee     
            LDA $6e            ; $e31a: a5 6e     
            CMP #$10           ; $e31c: c9 10     
            bcc __e325         ; $e31e: 90 05     
            and #$03           ; $e320: 29 03     
            clc                ; $e322: 18        
            adc #$0c           ; $e323: 69 0c     
__e325:     asl                ; $e325: 0a        
            tax                ; $e326: aa        
            LDA __e519,x       ; $e327: bd 19 e5  
            STA $ea            ; $e32a: 85 ea     
            LDA __e51a,x       ; $e32c: bd 1a e5  
            STA $eb            ; $e32f: 85 eb     
            LDY #$00           ; $e331: a0 00     
            LDA ($ea),y        ; $e333: b1 ea     
            STA $61            ; $e335: 85 61     
            INY                ; $e337: c8        
__e338:     LDA ($ea),y        ; $e338: b1 ea     
            STA $009f,y        ; $e33a: 99 9f 00  
            INY                ; $e33d: c8        
            CPY #$0f           ; $e33e: c0 0f     
            BNE __e338         ; $e340: d0 f6     
__e342:     LDX #$00           ; $e342: a2 00     
__e344:     LDA ($ea),y        ; $e344: b1 ea     
            STA $e0            ; $e346: 85 e0     
            and #$f0           ; $e348: 29 f0     
            STA $c0,x          ; $e34a: 95 c0     
            LDA $e0            ; $e34c: a5 e0     
            asl                ; $e34e: 0a        
            asl                ; $e34f: 0a        
            asl                ; $e350: 0a        
            asl                ; $e351: 0a        
            STA $d0,x          ; $e352: 95 d0     
            INY                ; $e354: c8        
            LDA $a0,x          ; $e355: b5 a0     
            BEQ __e37c         ; $e357: f0 23     
            STY $e0            ; $e359: 84 e0     
            tay                ; $e35b: a8        
            LDA __e557,y       ; $e35c: b9 57 e5  
            STA $0460,x        ; $e35f: 9d 60 04  
            LDA __e558,y       ; $e362: b9 58 e5  
            STA $0470,x        ; $e365: 9d 70 04  
            LDY $e0            ; $e368: a4 e0     
            LDA #$00           ; $e36a: a9 00     
            STA $b0,x          ; $e36c: 95 b0     
            STA $04a0,x        ; $e36e: 9d a0 04  
            STA $0410,x        ; $e371: 9d 10 04  
            STA $0480,x        ; $e374: 9d 80 04  
            LDA #$04           ; $e377: a9 04     
            STA $0400,x        ; $e379: 9d 00 04  
__e37c:     INX                ; $e37c: e8        
            CPX #$0e           ; $e37d: e0 0e     
            BNE __e344         ; $e37f: d0 c3     
            RTS                ; $e381: 60        

;-------------------------------------------------------------------------------
__e382:     LDX #$09           ; $e382: a2 09     
__e384:     JSR __f01c         ; $e384: 20 1c f0  
            and #$03           ; $e387: 29 03     
            clc                ; $e389: 18        
            adc #$04           ; $e38a: 69 04     
            STA $04b0,x        ; $e38c: 9d b0 04  
            DEX                ; $e38f: ca        
            BNE __e384         ; $e390: d0 f2     
            LDA $6e            ; $e392: a5 6e     
            CMP #$10           ; $e394: c9 10     
            bcc __e39d         ; $e396: 90 05     
            and #$03           ; $e398: 29 03     
            clc                ; $e39a: 18        
            adc #$0c           ; $e39b: 69 0c     
__e39d:     asl                ; $e39d: 0a        
            tax                ; $e39e: aa        
            LDA __e539,x       ; $e39f: bd 39 e5  
            STA $ea            ; $e3a2: 85 ea     
            LDA __e53a,x       ; $e3a4: bd 3a e5  
            STA $eb            ; $e3a7: 85 eb     
            LDY #$00           ; $e3a9: a0 00     
            JMP __e342         ; $e3ab: 4c 42 e3  

;-------------------------------------------------------------------------------
            INC $44            ; $e3ae: e6 44     
            LDA $b0            ; $e3b0: a5 b0     
            CMP #$0a           ; $e3b2: c9 0a     
            BCS __e3cd         ; $e3b4: b0 17     
            LDA $1f            ; $e3b6: a5 1f     
            ORA $05f5          ; $e3b8: 0d f5 05  
            BNE __e3cd         ; $e3bb: d0 10     
            LDA $b0,x          ; $e3bd: b5 b0     
            CMP #$03           ; $e3bf: c9 03     
            bcc __e3cb         ; $e3c1: 90 08     
            CMP #$0c           ; $e3c3: c9 0c     
            BEQ __e3cb         ; $e3c5: f0 04     
            CMP #$0e           ; $e3c7: c9 0e     
            BNE __e3cd         ; $e3c9: d0 02     
__e3cb:     INC $43            ; $e3cb: e6 43     
__e3cd:     LDA $b0            ; $e3cd: a5 b0     
            CMP #$06           ; $e3cf: c9 06     
            BCS __e3e1         ; $e3d1: b0 0e     
            LDA $b0,x          ; $e3d3: b5 b0     
            CMP #$12           ; $e3d5: c9 12     
            BEQ __e40a         ; $e3d7: f0 31     
            and #$0f           ; $e3d9: 29 0f     
            BEQ __e3e4         ; $e3db: f0 07     
            CMP #$0c           ; $e3dd: c9 0c     
            BEQ __e3e4         ; $e3df: f0 03     
__e3e1:     JMP __d793         ; $e3e1: 4c 93 d7  

;-------------------------------------------------------------------------------
__e3e4:     LDA $c0            ; $e3e4: a5 c0     
            sec                ; $e3e6: 38        
            sbc $c0,x          ; $e3e7: f5 c0     
            BPL __e3f0         ; $e3e9: 10 05     
            EOR #$ff           ; $e3eb: 49 ff     
            clc                ; $e3ed: 18        
            adc #$01           ; $e3ee: 69 01     
__e3f0:     STA $e0            ; $e3f0: 85 e0     
            LDA $d0            ; $e3f2: a5 d0     
            sec                ; $e3f4: 38        
            sbc $d0,x          ; $e3f5: f5 d0     
            BPL __e3fe         ; $e3f7: 10 05     
            EOR #$ff           ; $e3f9: 49 ff     
            clc                ; $e3fb: 18        
            adc #$01           ; $e3fc: 69 01     
__e3fe:     clc                ; $e3fe: 18        
            adc $e0            ; $e3ff: 65 e0     
            BCS __e407         ; $e401: b0 04     
            CMP #$09           ; $e403: c9 09     
            bcc __e444         ; $e405: 90 3d     
__e407:     JMP __d793         ; $e407: 4c 93 d7  

;-------------------------------------------------------------------------------
__e40a:     LDA $d0            ; $e40a: a5 d0     
            sec                ; $e40c: 38        
            sbc $d0,x          ; $e40d: f5 d0     
            clc                ; $e40f: 18        
            adc #$06           ; $e410: 69 06     
            CMP #$0d           ; $e412: c9 0d     
            BCS __e407         ; $e414: b0 f1     
            LDA $c0            ; $e416: a5 c0     
            sec                ; $e418: 38        
            sbc $c0,x          ; $e419: f5 c0     
            clc                ; $e41b: 18        
            adc #$06           ; $e41c: 69 06     
            STA $e0            ; $e41e: 85 e0     
            LDA $0410,x        ; $e420: bd 10 04  
            LSR                ; $e423: 4a        
            and #$01           ; $e424: 29 01     
            tay                ; $e426: a8        
            LDA $04d0,x        ; $e427: bd d0 04  
            asl                ; $e42a: 0a        
            asl                ; $e42b: 0a        
            asl                ; $e42c: 0a        
            asl                ; $e42d: 0a        
            STA $e1            ; $e42e: 85 e1     
            adc #$0d           ; $e430: 69 0d     
            STA $e2            ; $e432: 85 e2     
            DEY                ; $e434: 88        
            BEQ __e43e         ; $e435: f0 07     
            LDA $e1            ; $e437: a5 e1     
            clc                ; $e439: 18        
            adc $e0            ; $e43a: 65 e0     
            STA $e0            ; $e43c: 85 e0     
__e43e:     LDA $e0            ; $e43e: a5 e0     
            CMP $e2            ; $e440: c5 e2     
            BCS __e407         ; $e442: b0 c3     
__e444:     LDA #$01           ; $e444: a9 01     
            STA $05e1          ; $e446: 8d e1 05  
            STA $05e2          ; $e449: 8d e2 05  
            STA $1f            ; $e44c: 85 1f     
            LDA #$3c           ; $e44e: a9 3c     
            STA $0480          ; $e450: 8d 80 04  
            LDA #$0c           ; $e453: a9 0c     
            STA $b0            ; $e455: 85 b0     
            JMP __d793         ; $e457: 4c 93 d7  

;-------------------------------------------------------------------------------
__e45a:     LDX #$00           ; $e45a: a2 00     
            LDA $41            ; $e45c: a5 41     
            STA $40            ; $e45e: 85 40     
            STX $41            ; $e460: 86 41     
            STA $43            ; $e462: 85 43     
            JSR __e4f9         ; $e464: 20 f9 e4  
            LDA #$00           ; $e467: a9 00     
            STA $44            ; $e469: 85 44     
            LDA $10            ; $e46b: a5 10     
            LSR                ; $e46d: 4a        
            BCS __e47c         ; $e46e: b0 0c     
            INX                ; $e470: e8        
__e471:     JSR __e4f9         ; $e471: 20 f9 e4  
            INX                ; $e474: e8        
            CPX #$0e           ; $e475: e0 0e     
            BNE __e471         ; $e477: d0 f8     
            JMP __e484         ; $e479: 4c 84 e4  

;-------------------------------------------------------------------------------
__e47c:     LDX #$0d           ; $e47c: a2 0d     
__e47e:     JSR __e4f9         ; $e47e: 20 f9 e4  
            DEX                ; $e481: ca        
            BNE __e47e         ; $e482: d0 fa     
__e484:     LDA $43            ; $e484: a5 43     
            BEQ __e498         ; $e486: f0 10     
            LDA $1f            ; $e488: a5 1f     
            BEQ __e491         ; $e48a: f0 05     
            LDA #$00           ; $e48c: a9 00     
            JMP __e498         ; $e48e: 4c 98 e4  

;-------------------------------------------------------------------------------
__e491:     LDA $05f7          ; $e491: ad f7 05  
            BNE __e498         ; $e494: d0 02     
            LDA #$01           ; $e496: a9 01     
__e498:     STA $05f7          ; $e498: 8d f7 05  
            LDX #$fc           ; $e49b: a2 fc     
__e49d:     LDA $0700,x        ; $e49d: bd 00 07  
            sec                ; $e4a0: 38        
            sbc $d0            ; $e4a1: e5 d0     
            sec                ; $e4a3: 38        
            sbc #$08           ; $e4a4: e9 08     
            CMP #$1f           ; $e4a6: c9 1f     
            BCS __e4b7         ; $e4a8: b0 0d     
            LDA $0703,x        ; $e4aa: bd 03 07  
            sec                ; $e4ad: 38        
            sbc $c0            ; $e4ae: e5 c0     
            clc                ; $e4b0: 18        
            adc #$07           ; $e4b1: 69 07     
            CMP #$1f           ; $e4b3: c9 1f     
            bcc __e4be         ; $e4b5: 90 07     
__e4b7:     DEX                ; $e4b7: ca        
            DEX                ; $e4b8: ca        
            DEX                ; $e4b9: ca        
            DEX                ; $e4ba: ca        
            BNE __e49d         ; $e4bb: d0 e0     
            RTS                ; $e4bd: 60        

;-------------------------------------------------------------------------------
__e4be:     LDA $0701,x        ; $e4be: bd 01 07  
            CMP #$e2           ; $e4c1: c9 e2     
            BCS __e4b7         ; $e4c3: b0 f2     
            CMP #$5c           ; $e4c5: c9 5c     
            bcc __e4b7         ; $e4c7: 90 ee     
            LDY #$00           ; $e4c9: a0 00     
__e4cb:     LDA $0700,y        ; $e4cb: b9 00 07  
            STA $0100,y        ; $e4ce: 99 00 01  
            INY                ; $e4d1: c8        
            CPY $4a            ; $e4d2: c4 4a     
            BNE __e4cb         ; $e4d4: d0 f5     
            INX                ; $e4d6: e8        
            INX                ; $e4d7: e8        
            INX                ; $e4d8: e8        
            INX                ; $e4d9: e8        
            STX $e0            ; $e4da: 86 e0     
            LDX #$00           ; $e4dc: a2 00     
__e4de:     LDA $0700,y        ; $e4de: b9 00 07  
            STA $0700,x        ; $e4e1: 9d 00 07  
            INX                ; $e4e4: e8        
            INY                ; $e4e5: c8        
            CPY $e0            ; $e4e6: c4 e0     
            BNE __e4de         ; $e4e8: d0 f4     
            LDY #$00           ; $e4ea: a0 00     
__e4ec:     LDA $0100,y        ; $e4ec: b9 00 01  
            STA $0700,x        ; $e4ef: 9d 00 07  
            INX                ; $e4f2: e8        
            INY                ; $e4f3: c8        
            CPY $4a            ; $e4f4: c4 4a     
            BNE __e4ec         ; $e4f6: d0 f4     
            RTS                ; $e4f8: 60        

;-------------------------------------------------------------------------------
__e4f9:     .hex bd a0 00      ; $e4f9: bd a0 00  Bad Addr Mode - LDA $00a0,x
            tay                ; $e4fc: a8        
            LDA __e563,y       ; $e4fd: b9 63 e5  
            STA $ea            ; $e500: 85 ea     
            LDA __e564,y       ; $e502: b9 64 e5  
            STA $eb            ; $e505: 85 eb     
            JMP ($00ea)        ; $e507: 6c ea 00  

;-------------------------------------------------------------------------------
__e50a:     .hex 32 42 62 82   ; $e50a: 32 42 62 82   Data
            .hex a2 31 32 42   ; $e50e: a2 31 32 42   Data
            .hex 32 42 34 33   ; $e512: 32 42 34 33   Data
            .hex 40 30 10      ; $e516: 40 30 10      Data
__e519:     .hex 70            ; $e519: 70            Data
__e51a:     .hex e5 70 e5 8f   ; $e51a: e5 70 e5 8f   Data
            .hex e5 a8 e5 c1   ; $e51e: e5 a8 e5 c1   Data
            .hex e5 dc e5 f9   ; $e522: e5 dc e5 f9   Data
            .hex e5 13 e6 2e   ; $e526: e5 13 e6 2e   Data
            .hex e6 49 e6 66   ; $e52a: e6 49 e6 66   Data
            .hex e6 82 e6 9d   ; $e52e: e6 82 e6 9d   Data
            .hex e6 b9 e6 d5   ; $e532: e6 b9 e6 d5   Data
            .hex e6 f1 e6      ; $e536: e6 f1 e6      Data
__e539:     .hex 87            ; $e539: 87            Data
__e53a:     .hex e5 87 e5 9e   ; $e53a: e5 87 e5 9e   Data
            .hex e5 b7 e5 d0   ; $e53e: e5 b7 e5 d0   Data
            .hex e5 eb e5 08   ; $e542: e5 eb e5 08   Data
            .hex e6 22 e6 3d   ; $e546: e6 22 e6 3d   Data
            .hex e6 58 e6 75   ; $e54a: e6 58 e6 75   Data
            .hex e6 91 e6 ac   ; $e54e: e6 91 e6 ac   Data
            .hex e6 c8 e6 e4   ; $e552: e6 c8 e6 e4   Data
            .hex e6            ; $e556: e6            Data
__e557:     .hex 00            ; $e557: 00            Data
__e558:     .hex e7 04 00 1a   ; $e558: e7 04 00 1a   Data
            .hex 01 22 02 30   ; $e55c: 01 22 02 30   Data
            .hex 03 00 00      ; $e560: 03 00 00      Data
__e563:     .hex 6f            ; $e563: 6f            Data
__e564:     .hex e5 c8 cd ae   ; $e564: e5 c8 cd ae   Data
            .hex e3 ae e3 dc   ; $e568: e3 ae e3 dc   Data
            .hex de 1e e2      ; $e56c: de 1e e2      Data

;-------------------------------------------------------------------------------
            RTS                ; $e56f: 60        

;-------------------------------------------------------------------------------
            .hex 04 02 04 04   ; $e570: 04 02 04 04   Data
            .hex 04 06 08 08   ; $e574: 04 06 08 08   Data
            .hex 08 00 00 00   ; $e578: 08 00 00 00   Data
            .hex 00 00 00 90   ; $e57c: 00 00 00 90   Data
            .hex 13 a2 8a 28   ; $e580: 13 a2 8a 28   Data
            .hex 33 2a 98 56   ; $e584: 33 2a 98 56   Data
            .hex 13 a2 8a 28   ; $e588: 13 a2 8a 28   Data
            .hex 33 2a 98 05   ; $e58c: 33 2a 98 05   Data
            .hex 02 04 04 04   ; $e590: 02 04 04 04   Data
            .hex 06 06 08 08   ; $e594: 06 06 08 08   Data
            .hex 08 08 00 00   ; $e598: 08 08 00 00   Data
            .hex 00 00 56 25   ; $e59c: 00 00 56 25   Data
            .hex 18 68 93 9a   ; $e5a0: 18 68 93 9a   Data
            .hex 22 39 73 a7   ; $e5a4: 22 39 73 a7   Data
            .hex 05 02 04 04   ; $e5a8: 05 02 04 04   Data
            .hex 04 06 06 08   ; $e5ac: 04 06 06 08   Data
            .hex 08 08 08 00   ; $e5b0: 08 08 08 00   Data
            .hex 00 00 00 56   ; $e5b4: 00 00 00 56   Data
            .hex 24 49 63 92   ; $e5b8: 24 49 63 92   Data
            .hex 8a 22 38 95   ; $e5bc: 8a 22 38 95   Data
            .hex a9 06 02 04   ; $e5c0: a9 06 02 04   Data
            .hex 04 04 04 06   ; $e5c4: 04 04 04 06   Data
            .hex 06 08 08 08   ; $e5c8: 06 08 08 08   Data
            .hex 08 08 00 00   ; $e5cc: 08 08 00 00   Data
            .hex 56 32 32 63   ; $e5d0: 56 32 32 63   Data
            .hex 8a 39 97 14   ; $e5d4: 8a 39 97 14   Data
            .hex 27 82 94 a9   ; $e5d8: 27 82 94 a9   Data
            .hex 06 02 04 04   ; $e5dc: 06 02 04 04   Data
            .hex 04 06 06 06   ; $e5e0: 04 06 06 06   Data
            .hex 08 08 08 08   ; $e5e4: 08 08 08 08   Data
            .hex 08 00 00 56   ; $e5e8: 08 00 00 56   Data
            .hex 23 44 72 28   ; $e5ec: 23 44 72 28   Data
            .hex 86 99 25 49   ; $e5f0: 86 99 25 49   Data
            .hex 62 8a a3 00   ; $e5f4: 62 8a a3 00   Data
            .hex 00 06 02 04   ; $e5f8: 00 06 02 04   Data
            .hex 04 06 06 06   ; $e5fc: 04 06 06 06   Data
            .hex 06 08 08 08   ; $e600: 06 08 08 08   Data
            .hex 08 00 00 00   ; $e604: 08 00 00 00   Data
            .hex 56 32 32 25   ; $e608: 56 32 32 25   Data
            .hex 28 5a 97 2a   ; $e60c: 28 5a 97 2a   Data
            .hex 58 62 95 07   ; $e610: 58 62 95 07   Data
            .hex 02 04 04 04   ; $e614: 02 04 04 04   Data
            .hex 04 06 06 06   ; $e618: 04 06 06 06   Data
            .hex 08 08 08 08   ; $e61c: 08 08 08 08   Data
            .hex 00 00 56 42   ; $e620: 00 00 56 42   Data
            .hex 44 93 18 38   ; $e624: 44 93 18 38   Data
            .hex 79 a3 14 72   ; $e628: 79 a3 14 72   Data
            .hex 98 a5 07 02   ; $e62c: 98 a5 07 02   Data
            .hex 04 04 04 04   ; $e630: 04 04 04 04   Data
            .hex 06 06 06 08   ; $e634: 06 06 06 08   Data
            .hex 08 08 08 00   ; $e638: 08 08 08 00   Data
            .hex 00 56 43 44   ; $e63c: 00 56 43 44   Data
            .hex 4a 84 23 18   ; $e640: 4a 84 23 18   Data
            .hex 89 24 47 59   ; $e644: 89 24 47 59   Data
            .hex a5 08 02 04   ; $e648: a5 08 02 04   Data
            .hex 04 04 04 06   ; $e64c: 04 04 04 06   Data
            .hex 06 06 06 08   ; $e650: 06 06 06 08   Data
            .hex 08 08 08 08   ; $e654: 08 08 08 08   Data
            .hex 56 33 84 84   ; $e658: 56 33 84 84   Data
            .hex a6 29 29 58   ; $e65c: a6 29 29 58   Data
            .hex 99 16 49 62   ; $e660: 99 16 49 62   Data
            .hex 87 a3 08 02   ; $e664: 87 a3 08 02   Data
            .hex 04 04 04 04   ; $e668: 04 04 04 04   Data
            .hex 06 06 06 06   ; $e66c: 06 06 06 06   Data
            .hex 08 08 08 08   ; $e670: 08 08 08 08   Data
            .hex 00 56 74 99   ; $e674: 00 56 74 99   Data
            .hex a2 a3 25 39   ; $e678: a2 a3 25 39   Data
            .hex 74 87 15 22   ; $e67c: 74 87 15 22   Data
            .hex 6a a7 07 02   ; $e680: 6a a7 07 02   Data
            .hex 04 04 04 06   ; $e684: 04 04 04 06   Data
            .hex 06 06 06 08   ; $e688: 06 06 06 08   Data
            .hex 08 08 08 00   ; $e68c: 08 08 08 00   Data
            .hex 00 56 25 23   ; $e690: 00 56 25 23   Data
            .hex 84 17 33 84   ; $e694: 84 17 33 84   Data
            .hex a5 12 92 48   ; $e698: a5 12 92 48   Data
            .hex a9 08 02 04   ; $e69c: a9 08 02 04   Data
            .hex 04 04 04 06   ; $e6a0: 04 04 04 06   Data
            .hex 06 06 06 08   ; $e6a4: 06 06 06 08   Data
            .hex 08 08 08 00   ; $e6a8: 08 08 08 00   Data
            .hex 56 13 74 74   ; $e6ac: 56 13 74 74   Data
            .hex a5 23 4a 89   ; $e6b0: a5 23 4a 89   Data
            .hex a9 17 72 8a   ; $e6b4: a9 17 72 8a   Data
            .hex 96 08 02 04   ; $e6b8: 96 08 02 04   Data
            .hex 04 04 04 06   ; $e6bc: 04 04 04 06   Data
            .hex 06 06 06 08   ; $e6c0: 06 06 06 08   Data
            .hex 08 08 08 00   ; $e6c4: 08 08 08 00   Data
            .hex 56 35 73 93   ; $e6c8: 56 35 73 93   Data
            .hex 97 49 69 8a   ; $e6cc: 97 49 69 8a   Data
            .hex aa 12 28 62   ; $e6d0: aa 12 28 62   Data
            .hex 79 08 02 04   ; $e6d4: 79 08 02 04   Data
            .hex 04 04 04 06   ; $e6d8: 04 04 04 06   Data
            .hex 06 06 06 08   ; $e6dc: 06 06 06 08   Data
            .hex 08 08 08 00   ; $e6e0: 08 08 08 00   Data
            .hex 56 33 62 72   ; $e6e4: 56 33 62 72   Data
            .hex a4 34 39 49   ; $e6e8: a4 34 39 49   Data
            .hex 97 12 27 79   ; $e6ec: 97 12 27 79   Data
            .hex 93 08 02 04   ; $e6f0: 93 08 02 04   Data
            .hex 04 04 04 06   ; $e6f4: 04 04 04 06   Data
            .hex 06 06 06 08   ; $e6f8: 06 06 06 08   Data
            .hex 08 08 08 00   ; $e6fc: 08 08 08 00   Data
            .hex 56 43 44 92   ; $e700: 56 43 44 92   Data
            .hex 85 15 35 48   ; $e704: 85 15 35 48   Data
            .hex 68 13 29 72   ; $e708: 68 13 29 72   Data
            .hex 87            ; $e70c: 87            Data

;-------------------------------------------------------------------------------
__e70d:     LDA $0460,x        ; $e70d: bd 60 04  
            asl                ; $e710: 0a        
            tay                ; $e711: a8        
            LDA __e816,y       ; $e712: b9 16 e8  
            STA $e0            ; $e715: 85 e0     
            LDA __e817,y       ; $e717: b9 17 e8  
            STA $e1            ; $e71a: 85 e1     
            LDY #$00           ; $e71c: a0 00     
            LDA $c0,x          ; $e71e: b5 c0     
            STA $e2            ; $e720: 85 e2     
            LDA $d0,x          ; $e722: b5 d0     
            STA $e3            ; $e724: 85 e3     
            LDA $0470,x        ; $e726: bd 70 04  
            STA $e4            ; $e729: 85 e4     
            STX $e5            ; $e72b: 86 e5     
            CPX #$00           ; $e72d: e0 00     
            BNE __e737         ; $e72f: d0 06     
            LDA ($e0),y        ; $e731: b1 e0     
            asl                ; $e733: 0a        
            asl                ; $e734: 0a        
            STA $4a            ; $e735: 85 4a     
__e737:     LDA ($e0),y        ; $e737: b1 e0     
            STA $e6            ; $e739: 85 e6     
            tax                ; $e73b: aa        
            INY                ; $e73c: c8        
            LDA ($e0),y        ; $e73d: b1 e0     
            STA $e7            ; $e73f: 85 e7     
__e741:     INY                ; $e741: c8        
            LDA ($e0),y        ; $e742: b1 e0     
            STA $38,x          ; $e744: 95 38     
            DEX                ; $e746: ca        
            BNE __e741         ; $e747: d0 f8     
            LDA $e4            ; $e749: a5 e4     
            LSR                ; $e74b: 4a        
            LSR                ; $e74c: 4a        
            LSR                ; $e74d: 4a        
            LSR                ; $e74e: 4a        
            LSR                ; $e74f: 4a        
            and #$06           ; $e750: 29 06     
            tay                ; $e752: a8        
            LDA __e8a2,y       ; $e753: b9 a2 e8  
            STA $e8            ; $e756: 85 e8     
            LDA __e8a3,y       ; $e758: b9 a3 e8  
            STA $e9            ; $e75b: 85 e9     
            LDY $e7            ; $e75d: a4 e7     
            LDA $e5            ; $e75f: a5 e5     
            BEQ __e768         ; $e761: f0 05     
            LDA $10            ; $e763: a5 10     
            LSR                ; $e765: 4a        
            BCS __e7b6         ; $e766: b0 4e     
__e768:     LDX $e6            ; $e768: a6 e6     
            LDA $38,x          ; $e76a: b5 38     
            STA $ea            ; $e76c: 85 ea     
            LDA $0f            ; $e76e: a5 0f     
            BNE __e77c         ; $e770: d0 0a     
            LDA $0700          ; $e772: ad 00 07  
            CMP #$f0           ; $e775: c9 f0     
            BEQ __e77c         ; $e777: f0 03     
            LDX $e5            ; $e779: a6 e5     
            RTS                ; $e77b: 60        

;-------------------------------------------------------------------------------
__e77c:     LDX $0f            ; $e77c: a6 0f     
            LDA ($e8),y        ; $e77e: b1 e8     
            INY                ; $e780: c8        
            clc                ; $e781: 18        
            adc $e3            ; $e782: 65 e3     
            STA $0700,x        ; $e784: 9d 00 07  
            LDA $ea            ; $e787: a5 ea     
            STA $0701,x        ; $e789: 9d 01 07  
            LDA ($e8),y        ; $e78c: b1 e8     
            INY                ; $e78e: c8        
            EOR $e4            ; $e78f: 45 e4     
            STA $0702,x        ; $e791: 9d 02 07  
            LDA ($e8),y        ; $e794: b1 e8     
            INY                ; $e796: c8        
            clc                ; $e797: 18        
            adc $e2            ; $e798: 65 e2     
            STA $0703,x        ; $e79a: 9d 03 07  
            CMP #$e0           ; $e79d: c9 e0     
            bcc __e7a9         ; $e79f: 90 08     
            LDA #$f0           ; $e7a1: a9 f0     
            STA $0700,x        ; $e7a3: 9d 00 07  
            JMP __e7ad         ; $e7a6: 4c ad e7  

;-------------------------------------------------------------------------------
__e7a9:     INX                ; $e7a9: e8        
            INX                ; $e7aa: e8        
            INX                ; $e7ab: e8        
            INX                ; $e7ac: e8        
__e7ad:     STX $0f            ; $e7ad: 86 0f     
            DEC $e6            ; $e7af: c6 e6     
            BNE __e768         ; $e7b1: d0 b5     
            LDX $e5            ; $e7b3: a6 e5     
            RTS                ; $e7b5: 60        

;-------------------------------------------------------------------------------
__e7b6:     LDA #$00           ; $e7b6: a9 00     
            STA $e7            ; $e7b8: 85 e7     
__e7ba:     LDX $e6            ; $e7ba: a6 e6     
            LDA $38,x          ; $e7bc: b5 38     
            STA $ea            ; $e7be: 85 ea     
            LDA $e6            ; $e7c0: a5 e6     
            asl                ; $e7c2: 0a        
            asl                ; $e7c3: 0a        
            clc                ; $e7c4: 18        
            adc $0f            ; $e7c5: 65 0f     
            sec                ; $e7c7: 38        
            sbc #$04           ; $e7c8: e9 04     
            tax                ; $e7ca: aa        
            LDA $0700,x        ; $e7cb: bd 00 07  
            CMP #$f0           ; $e7ce: c9 f0     
            BNE __e803         ; $e7d0: d0 31     
            INC $e7            ; $e7d2: e6 e7     
            LDA ($e8),y        ; $e7d4: b1 e8     
            INY                ; $e7d6: c8        
            clc                ; $e7d7: 18        
            adc $e3            ; $e7d8: 65 e3     
            STA $0700,x        ; $e7da: 9d 00 07  
            LDA $ea            ; $e7dd: a5 ea     
            STA $0701,x        ; $e7df: 9d 01 07  
            LDA ($e8),y        ; $e7e2: b1 e8     
            INY                ; $e7e4: c8        
            EOR $e4            ; $e7e5: 45 e4     
            STA $0702,x        ; $e7e7: 9d 02 07  
            LDA ($e8),y        ; $e7ea: b1 e8     
            INY                ; $e7ec: c8        
            clc                ; $e7ed: 18        
            adc $e2            ; $e7ee: 65 e2     
            STA $0703,x        ; $e7f0: 9d 03 07  
            CMP #$e0           ; $e7f3: c9 e0     
            bcc __e7fc         ; $e7f5: 90 05     
            LDA #$f0           ; $e7f7: a9 f0     
            STA $0700,x        ; $e7f9: 9d 00 07  
__e7fc:     DEC $e6            ; $e7fc: c6 e6     
            BNE __e7ba         ; $e7fe: d0 ba     
            JMP __e80a         ; $e800: 4c 0a e8  

;-------------------------------------------------------------------------------
__e803:     INY                ; $e803: c8        
            INY                ; $e804: c8        
            INY                ; $e805: c8        
            DEC $e6            ; $e806: c6 e6     
            BNE __e7ba         ; $e808: d0 b0     

;-------------------------------------------------------------------------------
__e80a:     LDA $e7            ; $e80a: a5 e7     
            asl                ; $e80c: 0a        
            asl                ; $e80d: 0a        
            clc                ; $e80e: 18        
            adc $0f            ; $e80f: 65 0f     
            STA $0f            ; $e811: 85 0f     
            LDX $e5            ; $e813: a6 e5     
            RTS                ; $e815: 60        

;-------------------------------------------------------------------------------
__e816:     .hex aa            ; $e816: aa            Data
__e817:     .hex e8 b0 e8 b6   ; $e817: e8 b0 e8 b6   Data
            .hex e8 bb e8 c0   ; $e81b: e8 bb e8 c0   Data
            .hex e8 c4 e8 c8   ; $e81f: e8 c4 e8 c8   Data
            .hex e8 cc e8 d0   ; $e823: e8 cc e8 d0   Data
            .hex e8 d5 e8 da   ; $e827: e8 d5 e8 da   Data
            .hex e8 df e8 e4   ; $e82b: e8 df e8 e4   Data
            .hex e8 e8 e8 ec   ; $e82f: e8 e8 e8 ec   Data
            .hex e8 f0 e8 f4   ; $e833: e8 f0 e8 f4   Data
            .hex e8 f8 e8 fc   ; $e837: e8 f8 e8 fc   Data
            .hex e8 00 e9 04   ; $e83b: e8 00 e9 04   Data
            .hex e9 08 e9 0c   ; $e83f: e9 08 e9 0c   Data
            .hex e9 10 e9 14   ; $e843: e9 10 e9 14   Data
            .hex e9 04 e9 18   ; $e847: e9 04 e9 18   Data
            .hex e9 1c e9 20   ; $e84b: e9 1c e9 20   Data
            .hex e9 24 e9 2a   ; $e84f: e9 24 e9 2a   Data
            .hex e9 32 e9 3a   ; $e853: e9 32 e9 3a   Data
            .hex e9 3e e9 42   ; $e857: e9 3e e9 42   Data
            .hex e9 46 e9 4a   ; $e85b: e9 46 e9 4a   Data
            .hex e9 4e e9 55   ; $e85f: e9 4e e9 55   Data
            .hex e9 5d e9 65   ; $e863: e9 5d e9 65   Data
            .hex e9 69 e9 6d   ; $e867: e9 69 e9 6d   Data
            .hex e9 73 e9 7b   ; $e86b: e9 73 e9 7b   Data
            .hex e9 7f e9 83   ; $e86f: e9 7f e9 83   Data
            .hex e9 87 e9 8b   ; $e873: e9 87 e9 8b   Data
            .hex e9 8f e9 93   ; $e877: e9 8f e9 93   Data
            .hex e9 97 e9 9b   ; $e87b: e9 97 e9 9b   Data
            .hex e9 9f e9 a3   ; $e87f: e9 9f e9 a3   Data
            .hex e9 a7 e9 ab   ; $e883: e9 a7 e9 ab   Data
            .hex e9 af e9 b3   ; $e887: e9 af e9 b3   Data
            .hex e9 b7 e9 bc   ; $e88b: e9 b7 e9 bc   Data
            .hex e9 c1 e9 c6   ; $e88f: e9 c1 e9 c6   Data
            .hex e9 cb e9 d0   ; $e893: e9 cb e9 d0   Data
            .hex e9 d5 e9 da   ; $e897: e9 d5 e9 da   Data
            .hex e9 df e9 e4   ; $e89b: e9 df e9 e4   Data
            .hex e9 e9 e9      ; $e89f: e9 e9 e9      Data
__e8a2:     .hex ee            ; $e8a2: ee            Data
__e8a3:     .hex e9 84 ea 1a   ; $e8a3: e9 84 ea 1a   Data
            .hex eb b0 eb 04   ; $e8a7: eb b0 eb 04   Data
            .hex 00 00 02 42   ; $e8ab: 00 00 02 42   Data
            .hex 42 04 00 04   ; $e8af: 42 04 00 04   Data
            .hex 06 42 42 03   ; $e8b3: 06 42 42 03   Data
            .hex 0c 34 36 e2   ; $e8b7: 0c 34 36 e2   Data
            .hex 03 0c 34 38   ; $e8bb: 03 0c 34 38   Data
            .hex e2 02 00 08   ; $e8bf: e2 02 00 08   Data
            .hex 0a 02 00 0c   ; $e8c3: 0a 02 00 0c   Data
            .hex 0e 02 00 34   ; $e8c7: 0e 02 00 34   Data
            .hex 3a 02 00 34   ; $e8cb: 3a 02 00 34   Data
            .hex 3c 03 15 10   ; $e8cf: 3c 03 15 10   Data
            .hex 12 42 03 15   ; $e8d3: 12 42 03 15   Data
            .hex 14 16 42 03   ; $e8d7: 14 16 42 03   Data
            .hex 1e 34 3e fa   ; $e8db: 1e 34 3e fa   Data
            .hex 03 27 34 40   ; $e8df: 03 27 34 40   Data
            .hex fa 02 30 18   ; $e8e3: fa 02 30 18   Data
            .hex 1a 02 00 1c   ; $e8e7: 1a 02 00 1c   Data
            .hex 1e 02 30 44   ; $e8eb: 1e 02 30 44   Data
            .hex 46 02 00 48   ; $e8ef: 46 02 00 48   Data
            .hex 4a 02 00 20   ; $e8f3: 4a 02 00 20   Data
            .hex 22 02 00 24   ; $e8f7: 22 02 00 24   Data
            .hex 26 02 00 28   ; $e8fb: 26 02 00 28   Data
            .hex 2a 02 00 2c   ; $e8ff: 2a 02 00 2c   Data
            .hex 2e 02 00 30   ; $e903: 2e 02 00 30   Data
            .hex 32 02 00 4c   ; $e907: 32 02 00 4c   Data
            .hex 4e 02 00 50   ; $e90b: 4e 02 00 50   Data
            .hex 52 02 00 54   ; $e90f: 52 02 00 54   Data
            .hex 56 02 00 58   ; $e913: 56 02 00 58   Data
            .hex 5a 02 00 5c   ; $e917: 5a 02 00 5c   Data
            .hex 5e 02 00 60   ; $e91b: 5e 02 00 60   Data
            .hex 62 02 00 68   ; $e91f: 62 02 00 68   Data
            .hex 6a 04 36 a0   ; $e923: 6a 04 36 a0   Data
            .hex a2 a4 a6 06   ; $e927: a2 a4 a6 06   Data
            .hex 42 a8 aa ac   ; $e92b: 42 a8 aa ac   Data
            .hex ae b0 b2 06   ; $e92f: ae b0 b2 06   Data
            .hex 54 b4 b6 b8   ; $e933: 54 b4 b6 b8   Data
            .hex ba bc be 02   ; $e937: ba bc be 02   Data
            .hex 30 64 66 02   ; $e93b: 30 64 66 02   Data
            .hex 00 6c 6e 02   ; $e93f: 00 6c 6e 02   Data
            .hex 00 70 72 02   ; $e943: 00 70 72 02   Data
            .hex 00 74 76 02   ; $e947: 00 74 76 02   Data
            .hex 00 78 7a 05   ; $e94b: 00 78 7a 05   Data
            .hex 66 c0 c2 c4   ; $e94f: 66 c0 c2 c4   Data
            .hex c6 c8 06 42   ; $e953: c6 c8 06 42   Data
            .hex ca cc ce d0   ; $e957: ca cc ce d0   Data
            .hex d2 d4 06 54   ; $e95b: d2 d4 06 54   Data
            .hex d6 d8 da dc   ; $e95f: d6 d8 da dc   Data
            .hex de e0 02 30   ; $e963: de e0 02 30   Data
            .hex 7c 7e 02 75   ; $e967: 7c 7e 02 75   Data
            .hex 82 80 04 75   ; $e96b: 82 80 04 75   Data
            .hex 8a 88 86 84   ; $e96f: 8a 88 86 84   Data
            .hex 06 75 96 94   ; $e973: 06 75 96 94   Data
            .hex 92 90 8e 8c   ; $e977: 92 90 8e 8c   Data
            .hex 02 87 98 98   ; $e97b: 02 87 98 98   Data
            .hex 02 87 9a 9a   ; $e97f: 02 87 9a 9a   Data
            .hex 02 87 9c 9c   ; $e983: 02 87 9c 9c   Data
            .hex 02 87 9e 9e   ; $e987: 02 87 9e 9e   Data
            .hex 02 00 e4 e6   ; $e98b: 02 00 e4 e6   Data
            .hex 02 00 e8 ea   ; $e98f: 02 00 e8 ea   Data
            .hex 02 00 ec ee   ; $e993: 02 00 ec ee   Data
            .hex 02 00 f0 f2   ; $e997: 02 00 f0 f2   Data
            .hex 02 00 c5 c7   ; $e99b: 02 00 c5 c7   Data
            .hex 02 00 d5 c7   ; $e99f: 02 00 d5 c7   Data
            .hex 02 00 d7 c7   ; $e9a3: 02 00 d7 c7   Data
            .hex 02 00 c9 c7   ; $e9a7: 02 00 c9 c7   Data
            .hex 02 00 cb c7   ; $e9ab: 02 00 cb c7   Data
            .hex 02 00 d9 c7   ; $e9af: 02 00 d9 c7   Data
            .hex 02 00 db c7   ; $e9b3: 02 00 db c7   Data
            .hex 03 8d c5 c7   ; $e9b7: 03 8d c5 c7   Data
            .hex dd 03 8d cd   ; $e9bb: dd 03 8d cd   Data
            .hex cf c7 03 8d   ; $e9bf: cf c7 03 8d   Data
            .hex d5 c7 dd 03   ; $e9c3: d5 c7 dd 03   Data
            .hex 8d d7 c7 dd   ; $e9c7: 8d d7 c7 dd   Data
            .hex 03 8d c9 c7   ; $e9cb: 03 8d c9 c7   Data
            .hex dd 03 8d cb   ; $e9cf: dd 03 8d cb   Data
            .hex c7 dd 03 8d   ; $e9d3: c7 dd 03 8d   Data
            .hex df c7 dd 03   ; $e9d7: df c7 dd 03   Data
            .hex 8d d9 c7 dd   ; $e9db: 8d d9 c7 dd   Data
            .hex 03 8d db c7   ; $e9df: 03 8d db c7   Data
            .hex dd 03 8d d1   ; $e9e3: dd 03 8d d1   Data
            .hex c7 dd 03 8d   ; $e9e7: c7 dd 03 8d   Data
            .hex d3 c7 dd 17   ; $e9eb: d3 c7 dd 17   Data
            .hex 00 08 17 00   ; $e9ef: 00 08 17 00   Data
            .hex 10 1d 01 09   ; $e9f3: 10 1d 01 09   Data
            .hex 1d 41 0f 17   ; $e9f7: 1d 41 0f 17   Data
            .hex 00 08 17 00   ; $e9fb: 00 08 17 00   Data
            .hex 10 17 01 10   ; $e9ff: 10 17 01 10   Data
            .hex 17 00 08 17   ; $ea03: 17 00 08 17   Data
            .hex 00 10 1f 01   ; $ea07: 00 10 1f 01   Data
            .hex 08 17 00 08   ; $ea0b: 08 17 00 08   Data
            .hex 17 00 10 1f   ; $ea0f: 17 00 10 1f   Data
            .hex 01 10 17 00   ; $ea13: 01 10 17 00   Data
            .hex 09 17 00 11   ; $ea17: 09 17 00 11   Data
            .hex 1f 01 10 17   ; $ea1b: 1f 01 10 17   Data
            .hex 00 08 17 00   ; $ea1f: 00 08 17 00   Data
            .hex 10 16 00 07   ; $ea23: 10 16 00 07   Data
            .hex 16 00 0f 16   ; $ea27: 16 00 0f 16   Data
            .hex 00 17 26 00   ; $ea2b: 00 17 26 00   Data
            .hex 0f 14 00 06   ; $ea2f: 0f 14 00 06   Data
            .hex 14 00 0e 14   ; $ea33: 14 00 0e 14   Data
            .hex 00 16 24 00   ; $ea37: 00 16 24 00   Data
            .hex 06 24 00 0e   ; $ea3b: 06 24 00 0e   Data
            .hex 24 00 16 14   ; $ea3f: 24 00 16 14   Data
            .hex 00 04 14 00   ; $ea43: 00 04 14 00   Data
            .hex 0c 14 00 14   ; $ea47: 0c 14 00 14   Data
            .hex 24 00 04 24   ; $ea4b: 24 00 04 24   Data
            .hex 00 0c 24 00   ; $ea4f: 00 0c 24 00   Data
            .hex 14 16 00 07   ; $ea53: 14 16 00 07   Data
            .hex 16 00 0f 16   ; $ea57: 16 00 0f 16   Data
            .hex 00 17 26 00   ; $ea5b: 00 17 26 00   Data
            .hex 0b 26 00 13   ; $ea5f: 0b 26 00 13   Data
            .hex 17 00 00 17   ; $ea63: 17 00 00 17   Data
            .hex 00 f8 17 00   ; $ea67: 00 f8 17 00   Data
            .hex f0 17 00 e8   ; $ea6b: f0 17 00 e8   Data
            .hex 17 00 e0 17   ; $ea6f: 17 00 e0 17   Data
            .hex 00 d8 17 00   ; $ea73: 00 d8 17 00   Data
            .hex 08 17 40 10   ; $ea77: 08 17 40 10   Data
            .hex 17 00 06 17   ; $ea7b: 17 00 06 17   Data
            .hex 00 0e 17 00   ; $ea7f: 00 0e 17 00   Data
            .hex 16 17 00 10   ; $ea83: 16 17 00 10   Data
            .hex 17 00 08 1d   ; $ea87: 17 00 08 1d   Data
            .hex 01 0f 1d 41   ; $ea8b: 01 0f 1d 41   Data
            .hex 09 17 00 10   ; $ea8f: 09 17 00 10   Data
            .hex 17 00 08 17   ; $ea93: 17 00 08 17   Data
            .hex 01 08 17 00   ; $ea97: 01 08 17 00   Data
            .hex 10 17 00 08   ; $ea9b: 10 17 00 08   Data
            .hex 1f 01 10 17   ; $ea9f: 1f 01 10 17   Data
            .hex 00 10 17 00   ; $eaa3: 00 10 17 00   Data
            .hex 08 1f 01 08   ; $eaa7: 08 1f 01 08   Data
            .hex 17 00 0f 17   ; $eaab: 17 00 0f 17   Data
            .hex 00 07 1f 01   ; $eaaf: 00 07 1f 01   Data
            .hex 08 17 00 10   ; $eab3: 08 17 00 10   Data
            .hex 17 00 08 16   ; $eab7: 17 00 08 16   Data
            .hex 00 11 16 00   ; $eabb: 00 11 16 00   Data
            .hex 09 16 00 01   ; $eabf: 09 16 00 01   Data
            .hex 26 00 09 14   ; $eac3: 26 00 09 14   Data
            .hex 00 12 14 00   ; $eac7: 00 12 14 00   Data
            .hex 0a 14 00 02   ; $eacb: 0a 14 00 02   Data
            .hex 24 00 12 24   ; $eacf: 24 00 12 24   Data
            .hex 00 0a 24 00   ; $ead3: 00 0a 24 00   Data
            .hex 02 14 00 14   ; $ead7: 02 14 00 14   Data
            .hex 14 00 0c 14   ; $eadb: 14 00 0c 14   Data
            .hex 00 04 24 00   ; $eadf: 00 04 24 00   Data
            .hex 14 24 00 0c   ; $eae3: 14 24 00 0c   Data
            .hex 24 00 04 16   ; $eae7: 24 00 04 16   Data
            .hex 00 11 16 00   ; $eaeb: 00 11 16 00   Data
            .hex 09 16 00 01   ; $eaef: 09 16 00 01   Data
            .hex 26 00 0d 26   ; $eaf3: 26 00 0d 26   Data
            .hex 00 05 17 00   ; $eaf7: 00 05 17 00   Data
            .hex 18 17 00 20   ; $eafb: 18 17 00 20   Data
            .hex 17 00 28 17   ; $eaff: 17 00 28 17   Data
            .hex 00 30 17 00   ; $eb03: 00 30 17 00   Data
            .hex 38 17 00 40   ; $eb07: 38 17 00 40   Data
            .hex 17 00 10 17   ; $eb0b: 17 00 10 17   Data
            .hex 40 08 17 00   ; $eb0f: 40 08 17 00   Data
            .hex 12 17 00 0a   ; $eb13: 12 17 00 0a   Data
            .hex 17 00 02 17   ; $eb17: 17 00 02 17   Data
            .hex 00 08 17 00   ; $eb1b: 00 08 17 00   Data
            .hex 10 11 01 09   ; $eb1f: 10 11 01 09   Data
            .hex 11 41 0f 17   ; $eb23: 11 41 0f 17   Data
            .hex 00 08 17 00   ; $eb27: 00 08 17 00   Data
            .hex 10 17 01 10   ; $eb2b: 10 17 01 10   Data
            .hex 17 00 08 17   ; $eb2f: 17 00 08 17   Data
            .hex 00 10 0f 01   ; $eb33: 00 10 0f 01   Data
            .hex 08 17 00 08   ; $eb37: 08 17 00 08   Data
            .hex 17 00 10 0f   ; $eb3b: 17 00 10 0f   Data
            .hex 01 10 17 00   ; $eb3f: 01 10 17 00   Data
            .hex 09 17 00 11   ; $eb43: 09 17 00 11   Data
            .hex 0f 01 10 1f   ; $eb47: 0f 01 10 1f   Data
            .hex 00 08 1f 00   ; $eb4b: 00 08 1f 00   Data
            .hex 10 18 00 07   ; $eb4f: 10 18 00 07   Data
            .hex 18 00 0f 18   ; $eb53: 18 00 0f 18   Data
            .hex 00 17 08 00   ; $eb57: 00 17 08 00   Data
            .hex 0f 1a 00 06   ; $eb5b: 0f 1a 00 06   Data
            .hex 1a 00 0e 1a   ; $eb5f: 1a 00 0e 1a   Data
            .hex 00 16 0a 00   ; $eb63: 00 16 0a 00   Data
            .hex 06 0a 00 0e   ; $eb67: 06 0a 00 0e   Data
            .hex 0a 00 16 1a   ; $eb6b: 0a 00 16 1a   Data
            .hex 00 04 1a 00   ; $eb6f: 00 04 1a 00   Data
            .hex 0c 1a 00 14   ; $eb73: 0c 1a 00 14   Data
            .hex 0a 00 04 0a   ; $eb77: 0a 00 04 0a   Data
            .hex 00 0c 0a 00   ; $eb7b: 00 0c 0a 00   Data
            .hex 14 18 00 07   ; $eb7f: 14 18 00 07   Data
            .hex 18 00 0f 18   ; $eb83: 18 00 0f 18   Data
            .hex 00 17 08 00   ; $eb87: 00 17 08 00   Data
            .hex 0b 08 00 13   ; $eb8b: 0b 08 00 13   Data
            .hex 17 00 00 17   ; $eb8f: 17 00 00 17   Data
            .hex 00 f8 17 00   ; $eb93: 00 f8 17 00   Data
            .hex f0 17 00 e8   ; $eb97: f0 17 00 e8   Data
            .hex 17 00 e0 17   ; $eb9b: 17 00 e0 17   Data
            .hex 00 d8 17 00   ; $eb9f: 00 d8 17 00   Data
            .hex 08 17 40 10   ; $eba3: 08 17 40 10   Data
            .hex 17 00 06 17   ; $eba7: 17 00 06 17   Data
            .hex 00 0e 17 00   ; $ebab: 00 0e 17 00   Data
            .hex 16 17 00 10   ; $ebaf: 16 17 00 10   Data
            .hex 17 00 08 11   ; $ebb3: 17 00 08 11   Data
            .hex 01 0f 11 41   ; $ebb7: 01 0f 11 41   Data
            .hex 09 17 00 10   ; $ebbb: 09 17 00 10   Data
            .hex 17 00 08 17   ; $ebbf: 17 00 08 17   Data
            .hex 01 08 17 00   ; $ebc3: 01 08 17 00   Data
            .hex 10 17 00 08   ; $ebc7: 10 17 00 08   Data
            .hex 0f 01 10 17   ; $ebcb: 0f 01 10 17   Data
            .hex 00 10 17 00   ; $ebcf: 00 10 17 00   Data
            .hex 08 0f 01 08   ; $ebd3: 08 0f 01 08   Data
            .hex 17 00 0f 17   ; $ebd7: 17 00 0f 17   Data
            .hex 00 07 0f 01   ; $ebdb: 00 07 0f 01   Data
            .hex 08 1f 00 10   ; $ebdf: 08 1f 00 10   Data
            .hex 1f 00 08 18   ; $ebe3: 1f 00 08 18   Data
            .hex 00 11 18 00   ; $ebe7: 00 11 18 00   Data
            .hex 09 18 00 01   ; $ebeb: 09 18 00 01   Data
            .hex 08 00 09 1a   ; $ebef: 08 00 09 1a   Data
            .hex 00 12 1a 00   ; $ebf3: 00 12 1a 00   Data
            .hex 0a 1a 00 02   ; $ebf7: 0a 1a 00 02   Data
            .hex 0a 00 12 0a   ; $ebfb: 0a 00 12 0a   Data
            .hex 00 0a 0a 00   ; $ebff: 00 0a 0a 00   Data
            .hex 02 1a 00 14   ; $ec03: 02 1a 00 14   Data
            .hex 1a 00 0c 1a   ; $ec07: 1a 00 0c 1a   Data
            .hex 00 04 0a 00   ; $ec0b: 00 04 0a 00   Data
            .hex 14 0a 00 0c   ; $ec0f: 14 0a 00 0c   Data
            .hex 0a 00 04 18   ; $ec13: 0a 00 04 18   Data
            .hex 00 11 18 00   ; $ec17: 00 11 18 00   Data
            .hex 09 18 00 01   ; $ec1b: 09 18 00 01   Data
            .hex 08 00 0d 08   ; $ec1f: 08 00 0d 08   Data
            .hex 00 05 17 00   ; $ec23: 00 05 17 00   Data
            .hex 18 17 00 20   ; $ec27: 18 17 00 20   Data
            .hex 17 00 28 17   ; $ec2b: 17 00 28 17   Data
            .hex 00 30 17 00   ; $ec2f: 00 30 17 00   Data
            .hex 38 17 00 40   ; $ec33: 38 17 00 40   Data
            .hex 17 00 10 17   ; $ec37: 17 00 10 17   Data
            .hex 40 08 17 00   ; $ec3b: 40 08 17 00   Data
            .hex 12 17 00 0a   ; $ec3f: 12 17 00 0a   Data
            .hex 17 00 02      ; $ec43: 17 00 02      Data

;-------------------------------------------------------------------------------
            LDA $d0,x          ; $ec46: b5 d0     
            STA $ed            ; $ec48: 85 ed     
            LDA $c0,x          ; $ec4a: b5 c0     
            CMP #$b1           ; $ec4c: c9 b1     
            bcc __ec57         ; $ec4e: 90 07     
            LDA #$00           ; $ec50: a9 00     
            STA $e2            ; $ec52: 85 e2     
            INC $e2            ; $ec54: e6 e2     
            RTS                ; $ec56: 60        

;-------------------------------------------------------------------------------
__ec57:     clc                ; $ec57: 18        
            adc #$03           ; $ec58: 69 03     
            STA $ec            ; $ec5a: 85 ec     
__ec5c:     LDA $ed            ; $ec5c: a5 ed     
            and #$f0           ; $ec5e: 29 f0     
            LSR                ; $ec60: 4a        
            STA $e0            ; $ec61: 85 e0     
            LSR                ; $ec63: 4a        
            adc $e0            ; $ec64: 65 e0     
            STA $e0            ; $ec66: 85 e0     
            LDA $ec            ; $ec68: a5 ec     
            clc                ; $ec6a: 18        
            adc #$09           ; $ec6b: 69 09     
            LSR                ; $ec6d: 4a        
            LSR                ; $ec6e: 4a        
            STA $e1            ; $ec6f: 85 e1     
            LSR                ; $ec71: 4a        
            LSR                ; $ec72: 4a        
            clc                ; $ec73: 18        
            adc $e0            ; $ec74: 65 e0     
            STA $e0            ; $ec76: 85 e0     
            tay                ; $ec78: a8        
            LDA $e1            ; $ec79: a5 e1     
            and #$03           ; $ec7b: 29 03     
            STA $e1            ; $ec7d: 85 e1     
            LDA $0200,y        ; $ec7f: b9 00 02  
            STA $e2            ; $ec82: 85 e2     
            asl                ; $ec84: 0a        
            asl                ; $ec85: 0a        
            clc                ; $ec86: 18        
            adc $e1            ; $ec87: 65 e1     
            tay                ; $ec89: a8        
            LDA __f7cf,y       ; $ec8a: b9 cf f7  
            RTS                ; $ec8d: 60        

;-------------------------------------------------------------------------------
            LDA $d0,x          ; $ec8e: b5 d0     
            STA $ed            ; $ec90: 85 ed     
            LDA $c0,x          ; $ec92: b5 c0     
            BNE __ec9d         ; $ec94: d0 07     
            LDA #$00           ; $ec96: a9 00     
            STA $e2            ; $ec98: 85 e2     
            INC $e2            ; $ec9a: e6 e2     
            RTS                ; $ec9c: 60        

;-------------------------------------------------------------------------------
__ec9d:     sec                ; $ec9d: 38        
            sbc #$03           ; $ec9e: e9 03     
            STA $ec            ; $eca0: 85 ec     
__eca2:     LDA $ed            ; $eca2: a5 ed     
            and #$f0           ; $eca4: 29 f0     
            LSR                ; $eca6: 4a        
            STA $e0            ; $eca7: 85 e0     
            LSR                ; $eca9: 4a        
            adc $e0            ; $ecaa: 65 e0     
            STA $e0            ; $ecac: 85 e0     
            LDA $ec            ; $ecae: a5 ec     
            clc                ; $ecb0: 18        
            adc #$06           ; $ecb1: 69 06     
            LSR                ; $ecb3: 4a        
            LSR                ; $ecb4: 4a        
            STA $e1            ; $ecb5: 85 e1     
            LSR                ; $ecb7: 4a        
            LSR                ; $ecb8: 4a        
            clc                ; $ecb9: 18        
            adc $e0            ; $ecba: 65 e0     
            STA $e0            ; $ecbc: 85 e0     
            tay                ; $ecbe: a8        
            LDA $e1            ; $ecbf: a5 e1     
            and #$03           ; $ecc1: 29 03     
            EOR #$03           ; $ecc3: 49 03     
            STA $e1            ; $ecc5: 85 e1     
            LDA $0200,y        ; $ecc7: b9 00 02  
            STA $e2            ; $ecca: 85 e2     
            asl                ; $eccc: 0a        
            asl                ; $eccd: 0a        
            clc                ; $ecce: 18        
            adc $e1            ; $eccf: 65 e1     
            tay                ; $ecd1: a8        
            LDA $e1            ; $ecd2: a5 e1     
            EOR #$03           ; $ecd4: 49 03     
            STA $e1            ; $ecd6: 85 e1     
            LDA __f99f,y       ; $ecd8: b9 9f f9  
            RTS                ; $ecdb: 60        

;-------------------------------------------------------------------------------
            LDA $c0,x          ; $ecdc: b5 c0     
            STA $ec            ; $ecde: 85 ec     
            LDA $d0,x          ; $ece0: b5 d0     
            BNE __ece6         ; $ece2: d0 02     
            LDA #$04           ; $ece4: a9 04     
__ece6:     CMP #$c1           ; $ece6: c9 c1     
            bcc __ecf1         ; $ece8: 90 07     
            LDA #$00           ; $ecea: a9 00     
            STA $e2            ; $ecec: 85 e2     
            INC $e2            ; $ecee: e6 e2     
            RTS                ; $ecf0: 60        

;-------------------------------------------------------------------------------
__ecf1:     clc                ; $ecf1: 18        
            adc #$03           ; $ecf2: 69 03     
            STA $ed            ; $ecf4: 85 ed     
__ecf6:     LDA $ed            ; $ecf6: a5 ed     
            clc                ; $ecf8: 18        
            adc #$09           ; $ecf9: 69 09     
            STA $e1            ; $ecfb: 85 e1     
            and #$f0           ; $ecfd: 29 f0     
            LSR                ; $ecff: 4a        
            STA $e0            ; $ed00: 85 e0     
            LSR                ; $ed02: 4a        
            adc $e0            ; $ed03: 65 e0     
            STA $e0            ; $ed05: 85 e0     
            LDA $ec            ; $ed07: a5 ec     
            and #$f0           ; $ed09: 29 f0     
            LSR                ; $ed0b: 4a        
            LSR                ; $ed0c: 4a        
            LSR                ; $ed0d: 4a        
            LSR                ; $ed0e: 4a        
            clc                ; $ed0f: 18        
            adc $e0            ; $ed10: 65 e0     
            STA $e0            ; $ed12: 85 e0     
            tay                ; $ed14: a8        
            LDA $e1            ; $ed15: a5 e1     
            LSR                ; $ed17: 4a        
            LSR                ; $ed18: 4a        
            and #$03           ; $ed19: 29 03     
            STA $e1            ; $ed1b: 85 e1     
            LDA $0200,y        ; $ed1d: b9 00 02  
            STA $e2            ; $ed20: 85 e2     
            asl                ; $ed22: 0a        
            asl                ; $ed23: 0a        
            clc                ; $ed24: 18        
            adc $e1            ; $ed25: 65 e1     
            tay                ; $ed27: a8        
            LDA __fa87,y       ; $ed28: b9 87 fa  
            RTS                ; $ed2b: 60        

;-------------------------------------------------------------------------------
            LDA $c0,x          ; $ed2c: b5 c0     
            STA $ec            ; $ed2e: 85 ec     
            LDA $d0,x          ; $ed30: b5 d0     
            BNE __ed3b         ; $ed32: d0 07     
            LDA #$00           ; $ed34: a9 00     
            STA $e2            ; $ed36: 85 e2     
            INC $e2            ; $ed38: e6 e2     
            RTS                ; $ed3a: 60        

;-------------------------------------------------------------------------------
__ed3b:     sec                ; $ed3b: 38        
            sbc #$03           ; $ed3c: e9 03     
            STA $ed            ; $ed3e: 85 ed     
__ed40:     LDA $ed            ; $ed40: a5 ed     
            clc                ; $ed42: 18        
            adc #$06           ; $ed43: 69 06     
            STA $e1            ; $ed45: 85 e1     
            and #$f0           ; $ed47: 29 f0     
            LSR                ; $ed49: 4a        
            STA $e0            ; $ed4a: 85 e0     
            LSR                ; $ed4c: 4a        
            adc $e0            ; $ed4d: 65 e0     
            STA $e0            ; $ed4f: 85 e0     
            LDA $ec            ; $ed51: a5 ec     
            LSR                ; $ed53: 4a        
            LSR                ; $ed54: 4a        
            LSR                ; $ed55: 4a        
            LSR                ; $ed56: 4a        
            clc                ; $ed57: 18        
            adc $e0            ; $ed58: 65 e0     
            STA $e0            ; $ed5a: 85 e0     
            tay                ; $ed5c: a8        
            LDA $e1            ; $ed5d: a5 e1     
            LSR                ; $ed5f: 4a        
            LSR                ; $ed60: 4a        
            and #$03           ; $ed61: 29 03     
            EOR #$03           ; $ed63: 49 03     
            STA $e1            ; $ed65: 85 e1     
            LDA $0200,y        ; $ed67: b9 00 02  
            STA $e2            ; $ed6a: 85 e2     
            asl                ; $ed6c: 0a        
            asl                ; $ed6d: 0a        
            clc                ; $ed6e: 18        
            adc $e1            ; $ed6f: 65 e1     
            tay                ; $ed71: a8        
            LDA $e1            ; $ed72: a5 e1     
            EOR #$03           ; $ed74: 49 03     
            STA $e1            ; $ed76: 85 e1     
            LDA __f8b7,y       ; $ed78: b9 b7 f8  
            RTS                ; $ed7b: 60        

;-------------------------------------------------------------------------------
__ed7c:     LDY #$05           ; $ed7c: a0 05     
            LDA #$01           ; $ed7e: a9 01     
            JMP __ed8a         ; $ed80: 4c 8a ed  

;-------------------------------------------------------------------------------
__ed83:     LDY #$04           ; $ed83: a0 04     
            JMP __ed8a         ; $ed85: 4c 8a ed  

;-------------------------------------------------------------------------------
__ed88:     LDY #$03           ; $ed88: a0 03     
__ed8a:     DEC $45            ; $ed8a: c6 45     
            INC $45            ; $ed8c: e6 45     
            BEQ __ed91         ; $ed8e: f0 01     
            RTS                ; $ed90: 60        

;-------------------------------------------------------------------------------
__ed91:     INC $2c            ; $ed91: e6 2c     
            STA $ee            ; $ed93: 85 ee     
__ed95:     LDA $ee            ; $ed95: a5 ee     
            clc                ; $ed97: 18        
            adc ($27),y        ; $ed98: 71 27     
            pha                ; $ed9a: 48        
            LDA #$00           ; $ed9b: a9 00     
            STA $ee            ; $ed9d: 85 ee     
            pla                ; $ed9f: 68        
__eda0:     CMP #$0a           ; $eda0: c9 0a     
            bcc __edac         ; $eda2: 90 08     
            sec                ; $eda4: 38        
            sbc #$0a           ; $eda5: e9 0a     
            INC $ee            ; $eda7: e6 ee     
            JMP __eda0         ; $eda9: 4c a0 ed  

;-------------------------------------------------------------------------------
__edac:     STA ($27),y        ; $edac: 91 27     
            DEY                ; $edae: 88        
            BNE __ed95         ; $edaf: d0 e4     
            LDA $ee            ; $edb1: a5 ee     
            clc                ; $edb3: 18        
            adc ($27),y        ; $edb4: 71 27     
            STA ($27),y        ; $edb6: 91 27     
            LDY #$00           ; $edb8: a0 00     
__edba:     LDA ($27),y        ; $edba: b1 27     
            CMP $0017,y        ; $edbc: d9 17 00  
            bcc __edd9         ; $edbf: 90 18     
            BNE __edcb         ; $edc1: d0 08     
            INY                ; $edc3: c8        
            CPY #$06           ; $edc4: c0 06     
            BNE __edba         ; $edc6: d0 f2     
            JMP __edd9         ; $edc8: 4c d9 ed  

;-------------------------------------------------------------------------------
__edcb:     LDA ($27),y        ; $edcb: b1 27     
            STA $0017,y        ; $edcd: 99 17 00  
            INY                ; $edd0: c8        
            CPY #$06           ; $edd1: c0 06     
            BNE __edcb         ; $edd3: d0 f6     
            LDA #$80           ; $edd5: a9 80     
            STA $2c            ; $edd7: 85 2c     
__edd9:     LDY #$00           ; $edd9: a0 00     
            LDA ($27),y        ; $eddb: b1 27     
            CMP #$02           ; $eddd: c9 02     
            bcc __ede3         ; $eddf: 90 02     
            LDA #$02           ; $ede1: a9 02     
__ede3:     STA $ee            ; $ede3: 85 ee     
            asl                ; $ede5: 0a        
            asl                ; $ede6: 0a        
            adc $ee            ; $ede7: 65 ee     
            STA $ee            ; $ede9: 85 ee     
            asl                ; $edeb: 0a        
            asl                ; $eDEC: 0a        
            clc                ; $eded: 18        
            adc $ee            ; $edee: 65 ee     
            asl                ; $edf0: 0a        
            asl                ; $edf1: 0a        
            STA $ee            ; $edf2: 85 ee     
            INY                ; $edf4: c8        
            LDA ($27),y        ; $edf5: b1 27     
            STA $ef            ; $edf7: 85 ef     
            asl                ; $edf9: 0a        
            asl                ; $edfa: 0a        
            adc $ef            ; $edfb: 65 ef     
            asl                ; $edfd: 0a        
            adc $ee            ; $edfe: 65 ee     
            bcc __ee04         ; $ee00: 90 02     
            LDA #$ff           ; $ee02: a9 ff     
__ee04:     INY                ; $ee04: c8        
            clc                ; $ee05: 18        
            adc ($27),y        ; $ee06: 71 27     
            bcc __ee0c         ; $ee08: 90 02     
            LDA #$ff           ; $ee0a: a9 ff     
__ee0c:     CMP #$ff           ; $ee0c: c9 ff     
            BNE __ee12         ; $ee0e: d0 02     
            LDA #$fe           ; $ee10: a9 fe     
__ee12:     CMP $62            ; $ee12: c5 62     
            BCS __ee17         ; $ee14: b0 01     
            RTS                ; $ee16: 60        

;-------------------------------------------------------------------------------
__ee17:     INC $60            ; $ee17: e6 60     
            LDA #$01           ; $ee19: a9 01     
            STA $05e7          ; $ee1b: 8d e7 05  
            STA $05e8          ; $ee1e: 8d e8 05  
            LDA $62            ; $ee21: a5 62     
            CMP $29            ; $ee23: c5 29     
            BNE __ee2e         ; $ee25: d0 07     
            LDA $2a            ; $ee27: a5 2a     
            STA $62            ; $ee29: 85 62     
            JMP __ee37         ; $ee2b: 4c 37 ee  

;-------------------------------------------------------------------------------
__ee2e:     clc                ; $ee2e: 18        
            adc $2b            ; $ee2f: 65 2b     
            bcc __ee35         ; $ee31: 90 02     
            LDA #$ff           ; $ee33: a9 ff     
__ee35:     STA $62            ; $ee35: 85 62     
__ee37:     LDA $60            ; $ee37: a5 60     
            sec                ; $ee39: 38        
            sbc #$02           ; $ee3a: e9 02     
            CMP #$09           ; $ee3c: c9 09     
            bcc __ee41         ; $ee3e: 90 01     
            RTS                ; $ee40: 60        

;-------------------------------------------------------------------------------
__ee41:     asl                ; $ee41: 0a        
            tay                ; $ee42: a8        
            LDA __ee9b,y       ; $ee43: b9 9b ee  
            STA $ee            ; $ee46: 85 ee     
            LDA $14            ; $ee48: a5 14     
            asl                ; $ee4a: 0a        
            asl                ; $ee4b: 0a        
            asl                ; $ee4c: 0a        
            ORA __ee9c,y       ; $ee4d: 19 9c ee  
            STA $ef            ; $ee50: 85 ef     
            LDY $0e            ; $ee52: a4 0e     
            LDA $ef            ; $ee54: a5 ef     
            STA $0500,y        ; $ee56: 99 00 05  
            INY                ; $ee59: c8        
            LDA $ee            ; $ee5a: a5 ee     
            STA $0500,y        ; $ee5c: 99 00 05  
            INY                ; $ee5f: c8        
            LDA #$02           ; $ee60: a9 02     
            STA $0500,y        ; $ee62: 99 00 05  
            INY                ; $ee65: c8        
            LDA #$2c           ; $ee66: a9 2c     
            STA $0500,y        ; $ee68: 99 00 05  
            INY                ; $ee6b: c8        
            LDA #$2e           ; $ee6c: a9 2e     
            STA $0500,y        ; $ee6e: 99 00 05  
            INY                ; $ee71: c8        
            LDA $ef            ; $ee72: a5 ef     
            STA $0500,y        ; $ee74: 99 00 05  
            INY                ; $ee77: c8        
            LDA $ee            ; $ee78: a5 ee     
            clc                ; $ee7a: 18        
            adc #$20           ; $ee7b: 69 20     
            STA $0500,y        ; $ee7d: 99 00 05  
            INY                ; $ee80: c8        
            LDA #$02           ; $ee81: a9 02     
            STA $0500,y        ; $ee83: 99 00 05  
            INY                ; $ee86: c8        
            LDA #$2d           ; $ee87: a9 2d     
            STA $0500,y        ; $ee89: 99 00 05  
            INY                ; $ee8c: c8        
            LDA #$2f           ; $ee8d: a9 2f     
            STA $0500,y        ; $ee8f: 99 00 05  
            INY                ; $ee92: c8        
            LDA #$00           ; $ee93: a9 00     
            STA $0500,y        ; $ee95: 99 00 05  
            STY $0e            ; $ee98: 84 0e     
            RTS                ; $ee9a: 60        

;-------------------------------------------------------------------------------
__ee9b:     .hex 98            ; $ee9b: 98            Data
__ee9c:     .hex 22 9a 22 9c   ; $ee9c: 22 9a 22 9c   Data
            .hex 22 d8 22 da   ; $eea0: 22 d8 22 da   Data
            .hex 22 dc 22 18   ; $eea4: 22 dc 22 18   Data
            .hex 23 1a 23 1c   ; $eea8: 23 1a 23 1c   Data
            .hex 23            ; $eeac: 23            Data

;-------------------------------------------------------------------------------
__eead:     LDA #$00           ; $eead: a9 00     
            STA $38            ; $eeaf: 85 38     
            STA $37            ; $eeb1: 85 37     
            STA $35            ; $eeb3: 85 35     
            LDA #$08           ; $eeb5: a9 08     
            STA $06f1          ; $eeb7: 8d f1 06  
            STA $06f2          ; $eeba: 8d f2 06  
            LDA $6e            ; $eebd: a5 6e     
            CMP #$07           ; $eebf: c9 07     
            bcc __eecf         ; $eec1: 90 0c     
            CMP #$18           ; $eec3: c9 18     
            bcc __eec9         ; $eec5: 90 02     
            LDA #$1c           ; $eec7: a9 1c     
__eec9:     LSR                ; $eec9: 4a        
            LSR                ; $eeca: 4a        
            STA $38            ; $eecb: 85 38     
            INC $38            ; $eecd: e6 38     
__eecf:     LDA $6e            ; $eecf: a5 6e     
            CMP #$0f           ; $eed1: c9 0f     
            bcc __eed7         ; $eed3: 90 02     
            LDA #$0f           ; $eed5: a9 0f     
__eed7:     tay                ; $eed7: a8        
            LDX #$00           ; $eed8: a2 00     
__eeda:     LDA __ef6c,y       ; $eeda: b9 6c ef  
            STA $2e,x          ; $eedd: 95 2e     
            tya                ; $eedf: 98        
            clc                ; $eee0: 18        
            adc #$10           ; $eee1: 69 10     
            tay                ; $eee3: a8        
            INX                ; $eee4: e8        
            CPX #$07           ; $eee5: e0 07     
            BNE __eeda         ; $eee7: d0 f1     
            LDA #$3c           ; $eee9: a9 3c     
            STA $36            ; $eeeb: 85 36     
            RTS                ; $eeed: 60        

;-------------------------------------------------------------------------------
__eeee:     DEC $36            ; $eeee: c6 36     
            BNE __ef18         ; $eef0: d0 26     
            LDA #$3c           ; $eef2: a9 3c     
            STA $36            ; $eef4: 85 36     
            INC $37            ; $eef6: e6 37     
            LDA $61            ; $eef8: a5 61     
            BEQ __ef18         ; $eefa: f0 1c     
            LDA $37            ; $eefc: a5 37     
            CMP #$02           ; $eefe: c9 02     
            bcc __ef18         ; $ef00: 90 16     
            LDY $38            ; $ef02: a4 38     
            CPY $61            ; $ef04: c4 61     
            BCS __ef2f         ; $ef06: b0 27     
            CMP #$1e           ; $ef08: c9 1e     
            BEQ __ef19         ; $ef0a: f0 0d     
            CMP #$46           ; $ef0c: c9 46     
            BEQ __ef2f         ; $ef0e: f0 1f     
            CMP #$ff           ; $ef10: c9 ff     
            BNE __ef18         ; $ef12: d0 04     
            LDA #$47           ; $ef14: a9 47     
            STA $37            ; $ef16: 85 37     
__ef18:     RTS                ; $ef18: 60        

;-------------------------------------------------------------------------------
__ef19:     INC $35            ; $ef19: e6 35     
            LDA $6e            ; $ef1b: a5 6e     
            CMP #$0f           ; $ef1d: c9 0f     
            bcc __ef23         ; $ef1f: 90 02     
            LDA #$0f           ; $ef21: a9 0f     
__ef23:     tay                ; $ef23: a8        
            LDA __efdc,y       ; $ef24: b9 dc ef  
            STA $31            ; $ef27: 85 31     
            LDA __efec,y       ; $ef29: b9 ec ef  
            STA $32            ; $ef2c: 85 32     
            RTS                ; $ef2e: 60        

;-------------------------------------------------------------------------------
__ef2f:     LDA $61            ; $ef2f: a5 61     
            BEQ __ef18         ; $ef31: f0 e5     
            LDA #$02           ; $ef33: a9 02     
            CMP $35            ; $ef35: c5 35     
            BEQ __ef18         ; $ef37: f0 df     
            STA $35            ; $ef39: 85 35     
            LDA #$01           ; $ef3b: a9 01     
            STA $05eb          ; $ef3d: 8d eb 05  
            STA $05ec          ; $ef40: 8d ec 05  
            STA $2d            ; $ef43: 85 2d     
            LDA $6e            ; $ef45: a5 6e     
            CMP #$0f           ; $ef47: c9 0f     
            bcc __ef4d         ; $ef49: 90 02     
            LDA #$0f           ; $ef4b: a9 0f     
__ef4d:     tay                ; $ef4d: a8        
            LDA __effc,y       ; $ef4e: b9 fc ef  
            STA $31            ; $ef51: 85 31     
            LDA __f00c         ; $ef53: ad 0c f0  
            STA $32            ; $ef56: 85 32     
            LDA $06f1          ; $ef58: ad f1 06  
            CMP #$08           ; $ef5b: c9 08     
            BNE __ef6b         ; $ef5d: d0 0c     
            LDA #$06           ; $ef5f: a9 06     
            STA $06f1          ; $ef61: 8d f1 06  
            STA $06f2          ; $ef64: 8d f2 06  
            LDA #$01           ; $ef67: a9 01     
            STA $2d            ; $ef69: 85 2d     
__ef6b:     RTS                ; $ef6b: 60        

;-------------------------------------------------------------------------------
__ef6c:     .hex 80 80 80 80   ; $ef6c: 80 80 80 80   Data
            .hex 80 80 88 88   ; $ef70: 80 80 88 88   Data
            .hex 88 88 88 88   ; $ef74: 88 88 88 88   Data
            .hex 88 88 8c 90   ; $ef78: 88 88 8c 90   Data
            .hex a2 a2 a2 a2   ; $ef7c: a2 a2 a2 a2   Data
            .hex a2 a2 a6 a6   ; $ef80: a2 a2 a6 a6   Data
            .hex a6 a6 a6 a6   ; $ef84: a6 a6 a6 a6   Data
            .hex a6 a6 a6 aa   ; $ef88: a6 a6 a6 aa   Data
            .hex 73 73 73 78   ; $ef8c: 73 73 73 78   Data
            .hex 78 78 80 80   ; $ef90: 78 78 80 80   Data
            .hex 80 84 84 84   ; $ef94: 80 84 84 84   Data
            .hex 84 87 8c 96   ; $ef98: 84 87 8c 96   Data
            .hex 7c 7c 80 80   ; $ef9c: 7c 7c 80 80   Data
            .hex 85 89 92 96   ; $efa0: 85 89 92 96   Data
            .hex 9a 9f 9f a3   ; $efa4: 9a 9f 9f a3   Data
            .hex a3 a3 a3 a8   ; $efa8: a3 a3 a3 a8   Data
            .hex 85 85 89 89   ; $efac: 85 85 89 89   Data
            .hex 8d 8d 9a 9f   ; $efb0: 8d 8d 9a 9f   Data
            .hex a3 a8 a8 ac   ; $efb4: a3 a8 a8 ac   Data
            .hex ac ac ac b0   ; $efb8: ac ac ac b0   Data
            .hex 0c 0c 14 0c   ; $efbc: 0c 0c 14 0c   Data
            .hex 0f 11 0c 11   ; $efc0: 0f 11 0c 11   Data
            .hex 11 14 11 11   ; $efc4: 11 14 11 11   Data
            .hex 14 0c 0c 14   ; $efc8: 14 0c 0c 14   Data
            .hex 24 24 24 20   ; $efcc: 24 24 24 20   Data
            .hex 20 20 20 1c   ; $efd0: 20 20 20 1c   Data
            .hex 1c 1c 1c 1a   ; $efd4: 1c 1c 1c 1a   Data
            .hex 1a 1a 18 18   ; $efd8: 1a 1a 18 18   Data
__efdc:     .hex 80 80 89 8d   ; $efdc: 80 80 89 8d   Data
            .hex 92 9a a3 a8   ; $efe0: 92 9a a3 a8   Data
            .hex ac ac ac b0   ; $efe4: ac ac ac b0   Data
            .hex b4 b4 b8 bc   ; $efe8: b4 b4 b8 bc   Data
__efec:     .hex 8d 8d 96 9a   ; $efec: 8d 8d 96 9a   Data
            .hex 9f a8 b0 b4   ; $eff0: 9f a8 b0 b4   Data
            .hex b4 b8 b8 bc   ; $eff4: b4 b8 b8 bc   Data
            .hex c1 c2 c5 ca   ; $eff8: c1 c2 c5 ca   Data
__effc:     .hex ac ac b0 b4   ; $effc: ac ac b0 b4   Data
            .hex b4 bc c1 c5   ; $f000: b4 bc c1 c5   Data
            .hex ca ce d2 d2   ; $f004: ca ce d2 d2   Data
            .hex db db df df   ; $f008: db db df df   Data
__f00c:     .hex b7 b7 bb bf   ; $f00c: b7 b7 bb bf   Data
            .hex bf c7 cc d0   ; $f010: bf c7 cc d0   Data
            .hex d5 d9 dd dd   ; $f014: d5 d9 dd dd   Data
            .hex e2 e6 ea ea   ; $f018: e2 e6 ea ea   Data

;-------------------------------------------------------------------------------
__f01c:     LDA $0b            ; $f01c: a5 0b     
            asl                ; $f01e: 0a        
            asl                ; $f01f: 0a        
            sec                ; $f020: 38        
            adc $0b            ; $f021: 65 0b     
            STA $0b            ; $f023: 85 0b     
            RTS                ; $f025: 60        

;-------------------------------------------------------------------------------
__f026:     LDA $45            ; $f026: a5 45     
            BNE __f03a         ; $f028: d0 10     
            LDA $14            ; $f02a: a5 14     
            asl                ; $f02c: 0a        
            asl                ; $f02d: 0a        
            tay                ; $f02e: a8        
            LDA $0000,y        ; $f02f: b9 00 00  
            STA $49            ; $f032: 85 49     
            LDA $0003,y        ; $f034: b9 03 00  
            STA $48            ; $f037: 85 48     
            RTS                ; $f039: 60        

;-------------------------------------------------------------------------------
__f03a:     LDA $46            ; $f03a: a5 46     
            and #$3f           ; $f03c: 29 3f     
            tay                ; $f03e: a8        
            DEC $47            ; $f03f: c6 47     
            BEQ __f04d         ; $f041: f0 0a     
            LDA __f05c,y       ; $f043: b9 5c f0  
            STA $49            ; $f046: 85 49     
            and #$f0           ; $f048: 29 f0     
            STA $48            ; $f04a: 85 48     
            RTS                ; $f04c: 60        

;-------------------------------------------------------------------------------
__f04d:     LDA __f05e,y       ; $f04d: b9 5e f0  
            STA $48            ; $f050: 85 48     
            STA $49            ; $f052: 85 49     
            INY                ; $f054: c8        
            LDA __f05e,y       ; $f055: b9 5e f0  
            STA $47            ; $f058: 85 47     
            INY                ; $f05a: c8        
            .hex 84            ; $f05b: 84        Suspected data
__f05c:     LSR $60            ; $f05c: 46 60     

;-------------------------------------------------------------------------------
__f05e:     .hex 80 c8 20 80   ; $f05e: 80 c8 20 80   Data
            .hex 40 10 41 20   ; $f062: 40 10 41 20   Data
            .hex 01 60 10 98   ; $f066: 01 60 10 98   Data
            .hex 80 30 20 80   ; $f06a: 80 30 20 80   Data
            .hex 40 00 10 40   ; $f06e: 40 00 10 40   Data
            .hex 40 1c 20 20   ; $f072: 40 1c 20 20   Data
            .hex 10 00 40 40   ; $f076: 10 00 40 40   Data
            .hex 10 20 80 90   ; $f07a: 10 20 80 90   Data
            .hex 20 10 01 60   ; $f07e: 20 10 01 60   Data
            .hex 01 20 20 20   ; $f082: 01 20 20 20   Data
            .hex 01 80 01 20   ; $f086: 01 80 01 20   Data
            .hex 20 40 80 30   ; $f08a: 20 40 80 30   Data
            .hex 10 40 80 20   ; $f08e: 10 40 80 20   Data
            .hex 10 70 40 30   ; $f092: 10 70 40 30   Data
            .hex 41 c0 81 40   ; $f096: 41 c0 81 40   Data
            .hex 01 40 20 80   ; $f09a: 01 40 20 80   Data

;-------------------------------------------------------------------------------
__f09e:     LDA #$0f           ; $f09e: a9 0f     
            STA $4015          ; $f0a0: 8d 15 40  
            LDA #$c0           ; $f0a3: a9 c0     
            STA $4017          ; $f0a5: 8d 17 40  
            LDA #$fc           ; $f0a8: a9 fc     
            STA $e0            ; $f0aa: 85 e0     
            LDA #$05           ; $f0ac: a9 05     
            STA $e1            ; $f0ae: 85 e1     
            LDX #$00           ; $f0b0: a2 00     
            LDY #$00           ; $f0b2: a0 00     
__f0b4:     tya                ; $f0b4: 98        
            STA ($e0),y        ; $f0b5: 91 e0     
            STA $05e0,x        ; $f0b7: 9d e0 05  
            LDA __f3d2,x       ; $f0ba: bd d2 f3  
            STA $06dc,x        ; $f0bd: 9d dc 06  
            clc                ; $f0c0: 18        
            LDA $e0            ; $f0c1: a5 e0     
            adc #$08           ; $f0c3: 69 08     
            STA $e0            ; $f0c5: 85 e0     
            bcc __f0cb         ; $f0c7: 90 02     
            INC $e1            ; $f0c9: e6 e1     
__f0cb:     INX                ; $f0cb: e8        
            CPX #$1c           ; $f0cc: e0 1c     
            BNE __f0b4         ; $f0ce: d0 e4     
            RTS                ; $f0d0: 60        

;-------------------------------------------------------------------------------
__f0d1:     LDA $23            ; $f0d1: a5 23     
            BNE __f0db         ; $f0d3: d0 06     
            LDA #$1c           ; $f0d5: a9 1c     
            STA $e5            ; $f0d7: 85 e5     
            BPL __f0df         ; $f0d9: 10 04     
__f0db:     LDA #$01           ; $f0db: a9 01     
            STA $e5            ; $f0dd: 85 e5     
__f0df:     LDA #$00           ; $f0df: a9 00     
            LDX #$03           ; $f0e1: a2 03     
__f0e3:     STA $f9,x          ; $f0e3: 95 f9     
            DEX                ; $f0e5: ca        
            BPL __f0e3         ; $f0e6: 10 fb     
            LDA #$00           ; $f0e8: a9 00     
            STA $e4            ; $f0ea: 85 e4     
            LDA #$fc           ; $f0ec: a9 fc     
            STA $e0            ; $f0ee: 85 e0     
            LDA #$05           ; $f0f0: a9 05     
            STA $e1            ; $f0f2: 85 e1     
__f0f4:     LDX $e4            ; $f0f4: a6 e4     
            LDA $05e0,x        ; $f0f6: bd e0 05  
            BEQ __f136         ; $f0f9: f0 3b     
            LDY #$00           ; $f0fb: a0 00     
            LDA ($e0),y        ; $f0fd: b1 e0     
            BEQ __f136         ; $f0ff: f0 35     
            CMP #$05           ; $f101: c9 05     
            bcc __f110         ; $f103: 90 0b     
            sec                ; $f105: 38        
            sbc #$05           ; $f106: e9 05     
            tax                ; $f108: aa        
            LDA #$01           ; $f109: a9 01     
            STA $f9,x          ; $f10b: 95 f9     
            JMP __f136         ; $f10d: 4c 36 f1  

;-------------------------------------------------------------------------------
__f110:     tax                ; $f110: aa        
            DEX                ; $f111: ca        
            LDA $f9,x          ; $f112: b5 f9     
            BNE __f136         ; $f114: d0 20     
            LDA #$01           ; $f116: a9 01     
            STA $f9,x          ; $f118: 95 f9     
            txa                ; $f11a: 8a        
            tay                ; $f11b: a8        
            clc                ; $f11c: 18        
            adc #$05           ; $f11d: 69 05     
            LDY #$00           ; $f11f: a0 00     
            STA ($e0),y        ; $f121: 91 e0     
            txa                ; $f123: 8a        
            asl                ; $f124: 0a        
            asl                ; $f125: 0a        
            tax                ; $f126: aa        
            LDA #$04           ; $f127: a9 04     
            STA $e6            ; $f129: 85 e6     
__f12b:     INY                ; $f12b: c8        
            LDA ($e0),y        ; $f12c: b1 e0     
            STA $4000,x        ; $f12e: 9d 00 40  
            INX                ; $f131: e8        
            DEC $e6            ; $f132: c6 e6     
            BNE __f12b         ; $f134: d0 f5     
__f136:     clc                ; $f136: 18        
            LDA $e0            ; $f137: a5 e0     
            adc #$08           ; $f139: 69 08     
            STA $e0            ; $f13b: 85 e0     
            bcc __f141         ; $f13d: 90 02     
            INC $e1            ; $f13f: e6 e1     
__f141:     INC $e4            ; $f141: e6 e4     
            LDA $e4            ; $f143: a5 e4     
            CMP $e5            ; $f145: c5 e5     
            bcc __f0f4         ; $f147: 90 ab     
            LDX #$00           ; $f149: a2 00     
__f14b:     STX $e6            ; $f14b: 86 e6     
            LDA $f9,x          ; $f14d: b5 f9     
            BNE __f15d         ; $f14f: d0 0c     
            txa                ; $f151: 8a        
            asl                ; $f152: 0a        
            asl                ; $f153: 0a        
            tax                ; $f154: aa        
            asl                ; $f155: 0a        
            and #$10           ; $f156: 29 10     
            EOR #$10           ; $f158: 49 10     
            STA $4000,x        ; $f15a: 9d 00 40  
__f15d:     LDX $e6            ; $f15d: a6 e6     
            INX                ; $f15f: e8        
            CPX #$04           ; $f160: e0 04     
            bcc __f14b         ; $f162: 90 e7     
            LDY #$00           ; $f164: a0 00     
            STY $e4            ; $f166: 84 e4     
            LDA #$fc           ; $f168: a9 fc     
            STA $e0            ; $f16a: 85 e0     
            LDA #$05           ; $f16c: a9 05     
            STA $e1            ; $f16e: 85 e1     
__f170:     LDX $e4            ; $f170: a6 e4     
            LDA $05e0,x        ; $f172: bd e0 05  
            BEQ __f181         ; $f175: f0 0a     
            CMP #$01           ; $f177: c9 01     
            BNE __f195         ; $f179: d0 1a     
            INC $05e0,x        ; $f17b: fe e0 05  
            JMP __f1a2         ; $f17e: 4c a2 f1  

;-------------------------------------------------------------------------------
__f181:     clc                ; $f181: 18        
            LDA $e0            ; $f182: a5 e0     
            adc #$08           ; $f184: 69 08     
            STA $e0            ; $f186: 85 e0     
            bcc __f18c         ; $f188: 90 02     
            INC $e1            ; $f18a: e6 e1     
__f18c:     INC $e4            ; $f18c: e6 e4     
            LDA $e4            ; $f18e: a5 e4     
            CMP $e5            ; $f190: c5 e5     
            bcc __f170         ; $f192: 90 dc     
            RTS                ; $f194: 60        

;-------------------------------------------------------------------------------
__f195:     LDY #$07           ; $f195: a0 07     
            LDA ($e0),y        ; $f197: b1 e0     
            sec                ; $f199: 38        
            sbc #$01           ; $f19a: e9 01     
            STA ($e0),y        ; $f19c: 91 e0     
            BEQ __f1d8         ; $f19e: f0 38     
            BNE __f181         ; $f1a0: d0 df     
__f1a2:     LDA #$00           ; $f1a2: a9 00     
            LDY #$05           ; $f1a4: a0 05     
            STA ($e0),y        ; $f1a6: 91 e0     
            JSR __f34b         ; $f1a8: 20 4b f3  
            JSR __f35a         ; $f1ab: 20 5a f3  
            LDY #$00           ; $f1ae: a0 00     
            STA ($e0),y        ; $f1b0: 91 e0     
            JSR __f35a         ; $f1b2: 20 5a f3  
            LDY #$01           ; $f1b5: a0 01     
            STA ($e0),y        ; $f1b7: 91 e0     
            JSR __f35a         ; $f1b9: 20 5a f3  
            LDY #$02           ; $f1bc: a0 02     
            STA ($e0),y        ; $f1be: 91 e0     
            JSR __f35a         ; $f1c0: 20 5a f3  
            LDY #$04           ; $f1c3: a0 04     
            STA ($e0),y        ; $f1c5: 91 e0     
            LDY #$00           ; $f1c7: a0 00     
            LDA ($e0),y        ; $f1c9: b1 e0     
            CMP #$04           ; $f1cb: c9 04     
            BNE __f1db         ; $f1cd: d0 0c     
            JSR __f35a         ; $f1cf: 20 5a f3  
            LDY #$03           ; $f1d2: a0 03     
            STA ($e0),y        ; $f1d4: 91 e0     
            BPL __f1db         ; $f1d6: 10 03     
__f1d8:     JSR __f34b         ; $f1d8: 20 4b f3  
__f1db:     JSR __f35a         ; $f1db: 20 5a f3  
            CMP #$e8           ; $f1de: c9 e8     
            BCS __f24d         ; $f1e0: b0 6b     
            CMP #$60           ; $f1e2: c9 60     
            BEQ __f22a         ; $f1e4: f0 44     
            bcc __f1f1         ; $f1e6: 90 09     
            sbc #$60           ; $f1e8: e9 60     
            LDY #$06           ; $f1ea: a0 06     
            STA ($e0),y        ; $f1ec: 91 e0     
            JMP __f1db         ; $f1ee: 4c db f1  

;-------------------------------------------------------------------------------
__f1f1:     pha                ; $f1f1: 48        
            and #$f8           ; $f1f2: 29 f8     
            LSR                ; $f1f4: 4a        
            LSR                ; $f1f5: 4a        
            tax                ; $f1f6: aa        
            LDA __f382,x       ; $f1f7: bd 82 f3  
            STA $e6            ; $f1fa: 85 e6     
            LDA __f383,x       ; $f1fc: bd 83 f3  
            STA $e7            ; $f1ff: 85 e7     
            pla                ; $f201: 68        
            and #$07           ; $f202: 29 07     
            BEQ __f20e         ; $f204: f0 08     
            tax                ; $f206: aa        
__f207:     LSR $e6            ; $f207: 46 e6     
            ROR $e7            ; $f209: 66 e7     
            DEX                ; $f20b: ca        
            BNE __f207         ; $f20c: d0 f9     
__f20e:     LDY #$04           ; $f20e: a0 04     
            LDA ($e0),y        ; $f210: b1 e0     
            and #$f8           ; $f212: 29 f8     
            ORA $e6            ; $f214: 05 e6     
            STA ($e0),y        ; $f216: 91 e0     
            LDA $e7            ; $f218: a5 e7     
            DEY                ; $f21a: 88        
            STA ($e0),y        ; $f21b: 91 e0     
            LDY #$00           ; $f21d: a0 00     
            LDA ($e0),y        ; $f21f: b1 e0     
            CMP #$05           ; $f221: c9 05     
            bcc __f22a         ; $f223: 90 05     
            sec                ; $f225: 38        
            sbc #$04           ; $f226: e9 04     
            STA ($e0),y        ; $f228: 91 e0     
__f22a:     LDY #$06           ; $f22a: a0 06     
            LDA ($e0),y        ; $f22c: b1 e0     
            STA $e6            ; $f22e: 85 e6     
            LDX $e4            ; $f230: a6 e4     
            LDA $06dc,x        ; $f232: bd dc 06  
            STA $e7            ; $f235: 85 e7     
            LDA #$00           ; $f237: a9 00     
            LDX #$04           ; $f239: a2 04     
__f23b:     LSR $e7            ; $f23b: 46 e7     
            bcc __f242         ; $f23d: 90 03     
            clc                ; $f23f: 18        
            adc $e6            ; $f240: 65 e6     
__f242:     asl $e6            ; $f242: 06 e6     
            DEX                ; $f244: ca        
            BNE __f23b         ; $f245: d0 f4     
            INY                ; $f247: c8        
            STA ($e0),y        ; $f248: 91 e0     
            JMP __f181         ; $f24a: 4c 81 f1  

;-------------------------------------------------------------------------------
__f24d:     sbc #$e8           ; $f24d: e9 e8     
            JSR __f36c         ; $f24f: 20 6c f3  

;-------------------------------------------------------------------------------
            .hex 76 f2 8d f2   ; $f252: 76 f2 8d f2   Data
            .hex 9f f2 b1 f2   ; $f256: 9f f2 b1 f2   Data
            .hex c3 f2 cd f2   ; $f25a: c3 f2 cd f2   Data
            .hex d7 f2 e1 f2   ; $f25e: d7 f2 e1 f2   Data
            .hex ed f2 f1 f2   ; $f262: ed f2 f1 f2   Data
            .hex f4 f2 05 f3   ; $f266: f4 f2 05 f3   Data
            .hex 09 f3 0c f3   ; $f26a: 09 f3 0c f3   Data
            .hex 1d f3 21 f3   ; $f26e: 1d f3 21 f3   Data
            .hex 24 f3 41 f3   ; $f272: 24 f3 41 f3   Data

;-------------------------------------------------------------------------------
            LDX $e4            ; $f276: a6 e4     
            LDA #$00           ; $f278: a9 00     
            STA $05e0,x        ; $f27a: 9d e0 05  
            LDY #$00           ; $f27d: a0 00     
            STA ($e0),y        ; $f27f: 91 e0     
            LDY #$05           ; $f281: a0 05     
            LDA ($e0),y        ; $f283: b1 e0     
            sec                ; $f285: 38        
            sbc #$01           ; $f286: e9 01     
            STA ($e0),y        ; $f288: 91 e0     
            JMP __f181         ; $f28a: 4c 81 f1  

;-------------------------------------------------------------------------------
            JSR __f35a         ; $f28d: 20 5a f3  
            STA $e6            ; $f290: 85 e6     
            LDY #$01           ; $f292: a0 01     
            LDA ($e0),y        ; $f294: b1 e0     
            and #$3f           ; $f296: 29 3f     
            ORA $e6            ; $f298: 05 e6     
            STA ($e0),y        ; $f29a: 91 e0     
            JMP __f1db         ; $f29c: 4c db f1  

;-------------------------------------------------------------------------------
            JSR __f35a         ; $f29f: 20 5a f3  
            STA $e6            ; $f2a2: 85 e6     
            LDY #$01           ; $f2a4: a0 01     
            LDA ($e0),y        ; $f2a6: b1 e0     
            and #$c0           ; $f2a8: 29 c0     
            ORA $e6            ; $f2aa: 05 e6     
            STA ($e0),y        ; $f2ac: 91 e0     
            JMP __f1db         ; $f2ae: 4c db f1  

;-------------------------------------------------------------------------------
            JSR __f35a         ; $f2b1: 20 5a f3  
            STA $e6            ; $f2b4: 85 e6     
            LDY #$01           ; $f2b6: a0 01     
            LDA ($e0),y        ; $f2b8: b1 e0     
            and #$f0           ; $f2ba: 29 f0     
            ORA $e6            ; $f2bc: 05 e6     
            STA ($e0),y        ; $f2be: 91 e0     
            JMP __f1db         ; $f2c0: 4c db f1  

;-------------------------------------------------------------------------------
            JSR __f35a         ; $f2c3: 20 5a f3  
            LDY #$02           ; $f2c6: a0 02     
            STA ($e0),y        ; $f2c8: 91 e0     
            JMP __f1db         ; $f2ca: 4c db f1  

;-------------------------------------------------------------------------------
            JSR __f35a         ; $f2cd: 20 5a f3  
            LDY #$04           ; $f2d0: a0 04     
            STA ($e0),y        ; $f2d2: 91 e0     
            JMP __f1db         ; $f2d4: 4c db f1  

;-------------------------------------------------------------------------------
            JSR __f35a         ; $f2d7: 20 5a f3  
            LDY #$01           ; $f2da: a0 01     
            STA ($e0),y        ; $f2dc: 91 e0     
            JMP __f1db         ; $f2de: 4c db f1  

;-------------------------------------------------------------------------------
            LDA #$00           ; $f2e1: a9 00     
            LDX #$08           ; $f2e3: a2 08     
__f2e5:     STA $f0,x          ; $f2e5: 95 f0     
            DEX                ; $f2e7: ca        
            BPL __f2e5         ; $f2e8: 10 fb     
            JMP __f1db         ; $f2ea: 4c db f1  

;-------------------------------------------------------------------------------
            LDX #$00           ; $f2ed: a2 00     
            BEQ __f2f6         ; $f2ef: f0 05     
            LDX #$01           ; $f2f1: a2 01     
            bit $02a2          ; $f2f3: 2c a2 02  
__f2f6:     JSR __f35a         ; $f2f6: 20 5a f3  
            INC $f0,x          ; $f2f9: f6 f0     
            CMP $f0,x          ; $f2fb: d5 f0     
            BNE __f341         ; $f2fd: d0 42     
            LDA #$00           ; $f2ff: a9 00     
            STA $f0,x          ; $f301: 95 f0     
            BEQ __f335         ; $f303: f0 30     
            LDX #$00           ; $f305: a2 00     
            BEQ __f30e         ; $f307: f0 05     
            LDX #$01           ; $f309: a2 01     
            bit $02a2          ; $f30b: 2c a2 02  
__f30e:     JSR __f35a         ; $f30e: 20 5a f3  
            INC $f3,x          ; $f311: f6 f3     
            CMP $f3,x          ; $f313: d5 f3     
            BNE __f335         ; $f315: d0 1e     
            LDA #$00           ; $f317: a9 00     
            STA $f3,x          ; $f319: 95 f3     
            BEQ __f341         ; $f31b: f0 24     
            LDX #$00           ; $f31d: a2 00     
            BEQ __f326         ; $f31f: f0 05     
            LDX #$01           ; $f321: a2 01     
            bit $02a2          ; $f323: 2c a2 02  
__f326:     JSR __f35a         ; $f326: 20 5a f3  
            INC $f6,x          ; $f329: f6 f6     
            CMP $f6,x          ; $f32b: d5 f6     
            BNE __f335         ; $f32d: d0 06     
            LDA #$00           ; $f32f: a9 00     
            STA $f6,x          ; $f331: 95 f6     
            BEQ __f341         ; $f333: f0 0c     
__f335:     LDY #$05           ; $f335: a0 05     
            LDA ($e0),y        ; $f337: b1 e0     
            clc                ; $f339: 18        
            adc #$01           ; $f33a: 69 01     
            STA ($e0),y        ; $f33c: 91 e0     
            JMP __f1db         ; $f33e: 4c db f1  

;-------------------------------------------------------------------------------
__f341:     JSR __f35a         ; $f341: 20 5a f3  
            LDY #$05           ; $f344: a0 05     
            STA ($e0),y        ; $f346: 91 e0     
            JMP __f1db         ; $f348: 4c db f1  

;-------------------------------------------------------------------------------
__f34b:     LDA $e4            ; $f34b: a5 e4     
            asl                ; $f34d: 0a        
            tax                ; $f34e: aa        
            LDA __f39a,x       ; $f34f: bd 9a f3  
            STA $e2            ; $f352: 85 e2     
            LDA __f39b,x       ; $f354: bd 9b f3  
            STA $e3            ; $f357: 85 e3     
            RTS                ; $f359: 60        

;-------------------------------------------------------------------------------
__f35a:     LDA $e4            ; $f35a: a5 e4     
            LDY #$05           ; $f35c: a0 05     
            LDA ($e0),y        ; $f35e: b1 e0     
            tay                ; $f360: a8        
            LDA ($e2),y        ; $f361: b1 e2     
            pha                ; $f363: 48        
            INY                ; $f364: c8        
            tya                ; $f365: 98        
            LDY #$05           ; $f366: a0 05     
            STA ($e0),y        ; $f368: 91 e0     
            pla                ; $f36a: 68        
            RTS                ; $f36b: 60        

;-------------------------------------------------------------------------------
__f36c:     asl                ; $f36c: 0a        
            tay                ; $f36d: a8        
            INY                ; $f36e: c8        
            pla                ; $f36f: 68        
            STA $e6            ; $f370: 85 e6     
            pla                ; $f372: 68        
            STA $e7            ; $f373: 85 e7     
            LDA ($e6),y        ; $f375: b1 e6     
            tax                ; $f377: aa        
            INY                ; $f378: c8        
            LDA ($e6),y        ; $f379: b1 e6     
            STA $e7            ; $f37b: 85 e7     
            STX $e6            ; $f37d: 86 e6     
            JMP ($00e6)        ; $f37f: 6c e6 00  

;-------------------------------------------------------------------------------
__f382:     .hex 07            ; $f382: 07            Data
__f383:     .hex f2 07 80 07   ; $f383: f2 07 80 07   Data
            .hex 14 06 ae 06   ; $f387: 14 06 ae 06   Data
            .hex 43 05 f4 05   ; $f38b: 43 05 f4 05   Data
            .hex 9e 05 4e 05   ; $f38f: 9e 05 4e 05   Data
            .hex 02 04 ba 04   ; $f393: 02 04 ba 04   Data
            .hex 76 04 36      ; $f397: 76 04 36      Data
__f39a:     .hex 5a            ; $f39a: 5a            Data
__f39b:     .hex f6 cb f5 d7   ; $f39b: f6 cb f5 d7   Data
            .hex f5 7a f4 96   ; $f39f: f5 7a f4 96   Data
            .hex f4 21 f5 42   ; $f3a3: f4 21 f5 42   Data
            .hex f5 b5 f6 c7   ; $f3a7: f5 b5 f6 c7   Data
            .hex f6 f1 f5 04   ; $f3ab: f6 f1 f5 04   Data
            .hex f6 1e f6 33   ; $f3af: f6 1e f6 33   Data
            .hex f6 e3 f5 9c   ; $f3b3: f6 e3 f5 9c   Data
            .hex f5 99 f6 82   ; $f3b7: f5 99 f6 82   Data
            .hex f5 48 f6 d9   ; $f3bb: f5 48 f6 d9   Data
            .hex f6 ad f5 68   ; $f3bf: f6 ad f5 68   Data
            .hex f6 ee f3 33   ; $f3c3: f6 ee f3 33   Data
            .hex f4 7e f6 56   ; $f3c7: f4 7e f6 56   Data
            .hex f5 71 f5 b2   ; $f3cb: f5 71 f5 b2   Data
            .hex f4 f5 f4      ; $f3cf: f4 f5 f4      Data
__f3d2:     .hex 01 01 01 01   ; $f3d2: 01 01 01 01   Data
            .hex 01 01 01 01   ; $f3d6: 01 01 01 01   Data
            .hex 01 01 01 01   ; $f3da: 01 01 01 01   Data
            .hex 01 01 01 01   ; $f3de: 01 01 01 01   Data
            .hex 01 01 01 01   ; $f3e2: 01 01 01 01   Data
            .hex 01 08 08 01   ; $f3e6: 01 08 08 01   Data
            .hex 01 01 01 01   ; $f3ea: 01 01 01 01   Data
            .hex 01 81 7f f8   ; $f3ee: 01 81 7f f8   Data
            .hex 61 4b 53 53   ; $f3f2: 61 4b 53 53   Data
            .hex 53 60 53 53   ; $f3f6: 53 60 53 53   Data
            .hex 53 53 53 53   ; $f3fa: 53 53 53 53   Data
            .hex 53 60 53 53   ; $f3fe: 53 60 53 53   Data
            .hex 53 62 3b 61   ; $f402: 53 62 3b 61   Data
            .hex 2b 62 3b 61   ; $f406: 2b 62 3b 61   Data
            .hex 2b 3b 2b 62   ; $f40a: 2b 3b 2b 62   Data
            .hex 3b 60 2b 60   ; $f40e: 3b 60 2b 60   Data
            .hex 61 33 3b 3b   ; $f412: 61 33 3b 3b   Data
            .hex 3b 60 3b 3b   ; $f416: 3b 60 3b 3b   Data
            .hex 3b 3b 3b 3b   ; $f41a: 3b 3b 3b 3b   Data
            .hex 3b 60 3b 3b   ; $f41e: 3b 60 3b 3b   Data
            .hex 3b 62 3b 61   ; $f422: 3b 62 3b 61   Data
            .hex 2b 62 3b 61   ; $f426: 2b 62 3b 61   Data
            .hex 2b 3b 2b 62   ; $f42a: 2b 3b 2b 62   Data
            .hex 53 66 60 f9   ; $f42e: 53 66 60 f9   Data
            .hex 04 02 81 7f   ; $f432: 04 02 81 7f   Data
            .hex f8 61 1a 52   ; $f436: f8 61 1a 52   Data
            .hex 1a 52 12 52   ; $f43a: 1a 52 12 52   Data
            .hex 12 52 0a 52   ; $f43e: 12 52 0a 52   Data
            .hex 0a 52 02 52   ; $f442: 0a 52 02 52   Data
            .hex 02 52 59 42   ; $f446: 02 52 59 42   Data
            .hex 59 42 59 42   ; $f44a: 59 42 59 42   Data
            .hex 59 42 51 42   ; $f44e: 59 42 51 42   Data
            .hex 51 42 02 42   ; $f452: 51 42 02 42   Data
            .hex 12 42 1a 52   ; $f456: 12 42 1a 52   Data
            .hex 1a 52 12 52   ; $f45a: 1a 52 12 52   Data
            .hex 12 52 0a 52   ; $f45e: 12 52 0a 52   Data
            .hex 0a 52 02 52   ; $f462: 0a 52 02 52   Data
            .hex 02 52 59 42   ; $f466: 02 52 59 42   Data
            .hex 59 42 59 42   ; $f46a: 59 42 59 42   Data
            .hex 59 42 51 42   ; $f46e: 59 42 51 42   Data
            .hex 51 42 02 42   ; $f472: 51 42 02 42   Data
            .hex 12 42 f9 04   ; $f476: 12 42 f9 04   Data
            .hex 01 bc 7f 38   ; $f47a: 01 bc 7f 38   Data
            .hex 64 53 4b 43   ; $f47e: 64 53 4b 43   Data
            .hex 3b 43 3b 33   ; $f482: 3b 43 3b 33   Data
            .hex 2b 33 2b 23   ; $f486: 2b 33 2b 23   Data
            .hex 1b 23 1b 13   ; $f48a: 1b 23 1b 13   Data
            .hex 0b ea 01 03   ; $f48e: 0b ea 01 03   Data
            .hex 43 23 04 e8   ; $f492: 43 23 04 e8   Data
            .hex 02 bc 7f 38   ; $f496: 02 bc 7f 38   Data
            .hex 64 23 1b 13   ; $f49a: 64 23 1b 13   Data
            .hex 0b 13 0b 03   ; $f49e: 0b 13 0b 03   Data
            .hex 5a 03 5a 52   ; $f4a2: 5a 03 5a 52   Data
            .hex 4a 52 4a 42   ; $f4a6: 4a 52 4a 42   Data
            .hex 3a 32 13 52   ; $f4aa: 3a 32 13 52   Data
            .hex ea 01 33 e8   ; $f4ae: ea 01 33 e8   Data
            .hex 01 c1 7f f8   ; $f4b2: 01 c1 7f f8   Data
            .hex 68 4b 53 53   ; $f4b6: 68 4b 53 53   Data
            .hex 53 4a 52 52   ; $f4ba: 53 4a 52 52   Data
            .hex 52 49 51 51   ; $f4be: 52 49 51 51   Data
            .hex 51 60 53 53   ; $f4c2: 51 60 53 53   Data
            .hex 53 53 60 3b   ; $f4c6: 53 53 60 3b   Data
            .hex 60 53 70 3b   ; $f4ca: 60 53 70 3b   Data
            .hex 68 53 04 3b   ; $f4ce: 68 53 04 3b   Data
            .hex 3b ea 02 70   ; $f4d2: 3b ea 02 70   Data
            .hex 3b ea 01 68   ; $f4d6: 3b ea 01 68   Data
            .hex 2b ea 02 70   ; $f4da: 2b ea 02 70   Data
            .hex 1b ea 01 70   ; $f4de: 1b ea 01 70   Data
            .hex 23 52 68 23   ; $f4e2: 23 52 68 23   Data
            .hex 70 52 ea 03   ; $f4e6: 70 52 ea 03   Data
            .hex 23 ea 01 68   ; $f4ea: 23 ea 01 68   Data
            .hex 2b 2b ea 0d   ; $f4ee: 2b 2b ea 0d   Data
            .hex 88 2b e8 02   ; $f4f2: 88 2b e8 02   Data
            .hex 90 7f f8 c8   ; $f4f6: 90 7f f8 c8   Data
            .hex 60 ea 01 68   ; $f4fa: 60 ea 01 68   Data
            .hex 51 02 12 1a   ; $f4fe: 51 02 12 1a   Data
            .hex 51 1a 51 1a   ; $f502: 51 1a 51 1a   Data
            .hex 51 1a 51 1a   ; $f506: 51 1a 51 1a   Data
            .hex 51 1a 51 1a   ; $f50a: 51 1a 51 1a   Data
            .hex 51 1a 51 0a   ; $f50e: 51 1a 51 0a   Data
            .hex 51 0a 51 0a   ; $f512: 51 0a 51 0a   Data
            .hex 51 0a 51 12   ; $f516: 51 0a 51 12   Data
            .hex 51 12 ea 0d   ; $f51a: 51 12 ea 0d   Data
            .hex 88 51 e8 01   ; $f51e: 88 51 e8 01   Data
            .hex c1 7f f8 66   ; $f522: c1 7f f8 66   Data
            .hex 3b 43 4b 6c   ; $f526: 3b 43 4b 6c   Data
            .hex 53 66 3b 6c   ; $f52a: 53 66 3b 6c   Data
            .hex 43 66 2b 6c   ; $f52e: 43 66 2b 6c   Data
            .hex 3b 66 1b 6c   ; $f532: 3b 66 1b 6c   Data
            .hex 2b 66 13 72   ; $f536: 2b 66 13 72   Data
            .hex 1b 6c 1c ea   ; $f53a: 1b 6c 1c ea   Data
            .hex 0d 78 1b e8   ; $f53e: 0d 78 1b e8   Data
            .hex 02 d0 7f f8   ; $f542: 02 d0 7f f8   Data
            .hex 72 60 ea 02   ; $f546: 72 60 ea 02   Data
            .hex 72 51 59 02   ; $f54a: 72 51 59 02   Data
            .hex 12 7c 1a ea   ; $f54e: 12 7c 1a ea   Data
            .hex 0d 78 1a e8   ; $f552: 0d 78 1a e8   Data
            .hex 01 82 7f f8   ; $f556: 01 82 7f f8   Data
            .hex 66 43 4b 53   ; $f55a: 66 43 4b 53   Data
            .hex 6c 5b 66 04   ; $f55e: 6c 5b 66 04   Data
            .hex 6c 0c 72 14   ; $f562: 6c 0c 72 14   Data
            .hex 66 53 72 1c   ; $f566: 66 53 72 1c   Data
            .hex 6c 53 ea 0d   ; $f56a: 6c 53 ea 0d   Data
            .hex 8a 1c e8 02   ; $f56e: 8a 1c e8 02   Data
            .hex 42 7f f8 72   ; $f572: 42 7f f8 72   Data
            .hex 1b 13 0b 03   ; $f576: 1b 13 0b 03   Data
            .hex 5a 6c 52 ea   ; $f57a: 5a 6c 52 ea   Data
            .hex 0d 8a 1a e8   ; $f57e: 0d 8a 1a e8   Data
            .hex 01 01 7f 38   ; $f582: 01 01 7f 38   Data
            .hex 61 4c 15 54   ; $f586: 61 4c 15 54   Data
            .hex 1d 5c 25 05   ; $f58a: 1d 5c 25 05   Data
            .hex 2d 0d 35 15   ; $f58e: 2d 0d 35 15   Data
            .hex 3d 1d 45 62   ; $f592: 3d 1d 45 62   Data
            .hex 42 3a 32 2a   ; $f596: 42 3a 32 2a   Data
            .hex 60 e8 01 43   ; $f59a: 60 e8 01 43   Data
            .hex 7f 28 62 49   ; $f59e: 7f 28 62 49   Data
            .hex 21 5a 32 0b   ; $f5a2: 21 5a 32 0b   Data
            .hex 43 1c 14 1c   ; $f5a6: 43 1c 14 1c   Data
            .hex 24 1c e8 03   ; $f5aa: 24 1c e8 03   Data
            .hex 08 7f 08 61   ; $f5ae: 08 7f 08 61   Data
            .hex 4a 3d 15 3d   ; $f5b2: 4a 3d 15 3d   Data
            .hex 52 3d 15 3d   ; $f5b6: 52 3d 15 3d   Data
            .hex 5a 3d 15 3d   ; $f5ba: 5a 3d 15 3d   Data
            .hex 03 3d 15 3d   ; $f5be: 03 3d 15 3d   Data
            .hex 0b 3d 15 3d   ; $f5c2: 0b 3d 15 3d   Data
            .hex 03 3d 15 3d   ; $f5c6: 03 3d 15 3d   Data
            .hex e8 01 02 7f   ; $f5ca: e8 01 02 7f   Data
            .hex 38 64 23 43   ; $f5ce: 38 64 23 43   Data
            .hex 04 1c 68 23   ; $f5d2: 04 1c 68 23   Data
            .hex e8 02 02 7f   ; $f5d6: e8 02 02 7f   Data
            .hex 38 64 13 52   ; $f5da: 38 64 13 52   Data
            .hex 32 1a 68 13   ; $f5de: 32 1a 68 13   Data
            .hex e8 03 0f 7f   ; $f5e2: e8 03 0f 7f   Data
            .hex 08 64 15 1d   ; $f5e6: 08 64 15 1d   Data
            .hex 35 3d 4d 06   ; $f5ea: 35 3d 4d 06   Data
            .hex 55 3d e8 01   ; $f5ee: 55 3d e8 01   Data
            .hex c1 7f 78 68   ; $f5f2: c1 7f 78 68   Data
            .hex 53 53 3b 53   ; $f5f6: 53 53 3b 53   Data
            .hex 04 14 1c 2c   ; $f5fa: 04 14 1c 2c   Data
            .hex 3c 3c 3c 88   ; $f5fe: 3c 3c 3c 88   Data
            .hex 3c e8 02 c2   ; $f602: 3c e8 02 c2   Data
            .hex 7f 78 68 1a   ; $f606: 7f 78 68 1a   Data
            .hex 70 51 68 51   ; $f60a: 70 51 68 51   Data
            .hex 1a 70 51 68   ; $f60e: 1a 70 51 68   Data
            .hex 51 1a 70 51   ; $f612: 51 1a 70 51   Data
            .hex 51 ea 01 68   ; $f616: 51 ea 01 68   Data
            .hex 51 51 51 e8   ; $f61a: 51 51 51 e8   Data
            .hex 01 81 7f f8   ; $f61e: 01 81 7f f8   Data
            .hex 68 53 3b 3b   ; $f622: 68 53 3b 3b   Data
            .hex 3b 5b 3b 3b   ; $f626: 3b 5b 3b 3b   Data
            .hex 3b 04 3b 3b   ; $f62a: 3b 04 3b 3b   Data
            .hex ea 03 88 3b   ; $f62e: ea 03 88 3b   Data
            .hex e8 02 81 7f   ; $f632: e8 02 81 7f   Data
            .hex f8 68 5a 52   ; $f636: f8 68 5a 52   Data
            .hex 5a 52 5a 52   ; $f63a: 5a 52 5a 52   Data
            .hex 5a 52 5a 52   ; $f63e: 5a 52 5a 52   Data
            .hex 5a ea 03 88   ; $f642: 5a ea 03 88   Data
            .hex 52 e8 01 81   ; $f646: 52 e8 01 81   Data
            .hex 7f 68 62 2c   ; $f64a: 7f 68 62 2c   Data
            .hex 4c 54 15 2c   ; $f64e: 4c 54 15 2c   Data
            .hex 4c 54 15 2c   ; $f652: 4c 54 15 2c   Data
            .hex 4c 54 15 e8   ; $f656: 4c 54 15 e8   Data
            .hex 02 43 7f 38   ; $f65a: 02 43 7f 38   Data
            .hex 64 5b 04 1c   ; $f65e: 64 5b 04 1c   Data
            .hex 3c 54 3c 1c   ; $f662: 3c 54 3c 1c   Data
            .hex 04 e8 03 0a   ; $f666: 04 e8 03 0a   Data
            .hex 7f 08 61 4a   ; $f66a: 7f 08 61 4a   Data
            .hex 42 4a 52 4a   ; $f66e: 42 4a 52 4a   Data
            .hex 42 4a 52 13   ; $f672: 42 4a 52 13   Data
            .hex 0b 13 1b 13   ; $f676: 0b 13 1b 13   Data
            .hex 0b 13 1b e8   ; $f67a: 0b 13 1b e8   Data
            .hex 02 b0 7f 48   ; $f67e: 02 b0 7f 48   Data
            .hex 88 60 62 ea   ; $f682: 88 60 62 ea   Data
            .hex 14 4c 54 4c   ; $f686: 14 4c 54 4c   Data
            .hex 34 4c 54 4c   ; $f68a: 34 4c 54 4c   Data
            .hex 34 4b 53 4b   ; $f68e: 34 4b 53 4b   Data
            .hex 33 4b 53 4b   ; $f692: 33 4b 53 4b   Data
            .hex 33 f9 09 03   ; $f696: 33 f9 09 03   Data
            .hex 0a 7f 08 61   ; $f69a: 0a 7f 08 61   Data
            .hex 4a 03 5a 13   ; $f69e: 4a 03 5a 13   Data
            .hex 0b 23 1b 33   ; $f6a2: 0b 23 1b 33   Data
            .hex 2b 43 3b 53   ; $f6a6: 2b 43 3b 53   Data
            .hex 4b 04 5b 14   ; $f6aa: 4b 04 5b 14   Data
            .hex 0c 24 1c 34   ; $f6ae: 0c 24 1c 34   Data
            .hex 2c 44 e8 01   ; $f6b2: 2c 44 e8 01   Data
            .hex c1 7f f8 67   ; $f6b6: c1 7f f8 67   Data
            .hex 1b 2b 3b 03   ; $f6ba: 1b 2b 3b 03   Data
            .hex 52 60 04 60   ; $f6be: 52 60 04 60   Data
            .hex 7c ea 1d 53   ; $f6c2: 7c ea 1d 53   Data
            .hex e8 02 81 7f   ; $f6c6: e8 02 81 7f   Data
            .hex f8 67 1c 2c   ; $f6ca: f8 67 1c 2c   Data
            .hex 3c 04 53 60   ; $f6ce: 3c 04 53 60   Data
            .hex 05 60 ea 1d   ; $f6d2: 05 60 ea 1d   Data
            .hex 7c 54 e8 02   ; $f6d6: 7c 54 e8 02   Data
            .hex 01 7f 38 62   ; $f6da: 01 7f 38 62   Data
            .hex 48 51 5a 04   ; $f6de: 48 51 5a 04   Data
            .hex 46 16 3e 1e   ; $f6e2: 46 16 3e 1e   Data
            .hex e8            ; $f6e6: e8            Data
__f6e7:     .hex 56 56 56 56   ; $f6e7: 56 56 56 56   Data
            .hex 38 56 3e 56   ; $f6eb: 38 56 3e 56   Data
            .hex 36 56 3c 56   ; $f6ef: 36 56 3c 56   Data
            .hex 36 38 3c 3e   ; $f6f3: 36 38 3c 3e   Data
            .hex 36 36 3c 3c   ; $f6f7: 36 36 3c 3c   Data
            .hex 38 56 54 42   ; $f6fb: 38 56 54 42   Data
            .hex 38 56 54 46   ; $f6ff: 38 56 54 46   Data
            .hex 36 4e 54 46   ; $f703: 36 4e 54 46   Data
            .hex 54 46 54 46   ; $f707: 54 46 54 46   Data
            .hex 38 34 3e 3a   ; $f70b: 38 34 3e 3a   Data
            .hex 38 36 3e 3c   ; $f70f: 38 36 3e 3c   Data
            .hex 54 4a 3e 56   ; $f713: 54 4a 3e 56   Data
            .hex 54 46 3e 56   ; $f717: 54 46 3e 56   Data
            .hex 54 46 3c 52   ; $f71b: 54 46 3c 52   Data
            .hex 36 56 54 42   ; $f71f: 36 56 54 42   Data
            .hex 36 56 54 46   ; $f723: 36 56 54 46   Data
            .hex 36 34 3c 3a   ; $f727: 36 34 3c 3a   Data
            .hex 54 4a 3c 56   ; $f72b: 54 4a 3c 56   Data
            .hex 54 46 3c 56   ; $f72f: 54 46 3c 56   Data
            .hex 36 36 54 54   ; $f733: 36 36 54 54   Data
            .hex 54 54 3c 3c   ; $f737: 54 54 3c 3c   Data
            .hex 38 34 54 54   ; $f73b: 38 34 54 54   Data
            .hex 38 36 54 54   ; $f73f: 38 36 54 54   Data
            .hex 54 4a 54 42   ; $f743: 54 4a 54 42   Data
            .hex 54 46 54 42   ; $f747: 54 46 54 42   Data
            .hex 54 4a 54 46   ; $f74b: 54 4a 54 46   Data
            .hex 54 54 3e 3a   ; $f74f: 54 54 3e 3a   Data
            .hex 54 54 3e 3c   ; $f753: 54 54 3e 3c   Data
            .hex 36 34 54 54   ; $f757: 36 34 54 54   Data
            .hex 54 54 3c 3a   ; $f75b: 54 54 3c 3a   Data
            .hex 56 56 40 42   ; $f75f: 56 56 40 42   Data
            .hex 56 56 44 46   ; $f763: 56 56 44 46   Data
            .hex 40 42 44 46   ; $f767: 40 42 44 46   Data
            .hex 44 46 44 46   ; $f76b: 44 46 44 46   Data
            .hex 56 34 40 54   ; $f76f: 56 34 40 54   Data
            .hex 56 36 40 54   ; $f773: 56 36 40 54   Data
            .hex 48 4a 40 42   ; $f777: 48 4a 40 42   Data
            .hex 44 46 40 42   ; $f77b: 44 46 40 42   Data
            .hex 48 4a 44 46   ; $f77f: 48 4a 44 46   Data
            .hex 56 34 44 54   ; $f783: 56 34 44 54   Data
            .hex 56 36 44 54   ; $f787: 56 36 44 54   Data
            .hex 44 54 44 54   ; $f78b: 44 54 44 54   Data
            .hex 4c 36 44 54   ; $f78f: 4c 36 44 54   Data
            .hex 48 54 40 54   ; $f793: 48 54 40 54   Data
            .hex 44 54 40 54   ; $f797: 44 54 40 54   Data
            .hex 48 54 44 54   ; $f79b: 48 54 44 54   Data
            .hex 56 34 56 3a   ; $f79f: 56 34 56 3a   Data
            .hex 56 36 56 3c   ; $f7a3: 56 36 56 3c   Data
            .hex 34 36 3a 3c   ; $f7a7: 34 36 3a 3c   Data
            .hex 48 54 56 3a   ; $f7ab: 48 54 56 3a   Data
            .hex 44 54 56 3a   ; $f7af: 44 54 56 3a   Data
            .hex 44 54 50 3c   ; $f7b3: 44 54 50 3c   Data
            .hex 48 54 56 3c   ; $f7b7: 48 54 56 3c   Data
            .hex 44 54 56 3c   ; $f7bb: 44 54 56 3c   Data
            .hex 48 4a 56 56   ; $f7bf: 48 4a 56 56   Data
            .hex 44 46 56 56   ; $f7c3: 44 46 56 56   Data
            .hex 44 46 48 4a   ; $f7c7: 44 46 48 4a   Data
            .hex 54 54 54 54   ; $f7cb: 54 54 54 54   Data
__f7cf:     .hex 01 02 c3 f0   ; $f7cf: 01 02 c3 f0   Data
            .hex 01 02 c3 c4   ; $f7d3: 01 02 c3 c4   Data
            .hex 02 02 c3 c4   ; $f7d7: 02 02 c3 c4   Data
            .hex c3 c3 c3 c4   ; $f7db: c3 c3 c3 c4   Data
            .hex c4 c4 c4 c4   ; $f7df: c4 c4 c4 c4   Data
            .hex 05 0e c7 d3   ; $f7e3: 05 0e c7 d3   Data
            .hex 06 0f c7 d3   ; $f7e7: 06 0f c7 d3   Data
            .hex c7 c7 c7 d3   ; $f7eb: c7 c7 c7 d3   Data
            .hex c8 c8 c8 f9   ; $f7ef: c8 c8 c8 f9   Data
            .hex 09 10 c4 09   ; $f7f3: 09 10 c4 09   Data
            .hex 0a c4 0a 0a   ; $f7f7: 0a c4 0a 0a   Data
            .hex 0b 11 cd d4   ; $f7fb: 0b 11 cd d4   Data
            .hex 0c 12 cd d4   ; $f7ff: 0c 12 cd d4   Data
            .hex cd cd cd d4   ; $f803: cd cd cd d4   Data
            .hex 0e 0e c7 d3   ; $f807: 0e 0e c7 d3   Data
            .hex 0f 0f c7 d3   ; $f80b: 0f 0f c7 d3   Data
            .hex 10 10 c4 10   ; $f80f: 10 10 c4 10   Data
            .hex 11 11 cd d4   ; $f813: 11 11 cd d4   Data
            .hex 12 12 cd d4   ; $f817: 12 12 cd d4   Data
            .hex d3 d3 d3 d3   ; $f81b: d3 d3 d3 d3   Data
            .hex d4 d4 d4 d4   ; $f81f: d4 d4 d4 d4   Data
            .hex 15 1c 16 15   ; $f823: 15 1c 16 15   Data
            .hex 16 d3 16 16   ; $f827: 16 d3 16 16   Data
            .hex 17 17 c8 f9   ; $f82b: 17 17 c8 f9   Data
            .hex 98 98 c8 f9   ; $f82f: 98 98 c8 f9   Data
            .hex 99 99 c8 f9   ; $f833: 99 99 c8 f9   Data
            .hex 1a 1d 1b 1a   ; $f837: 1a 1d 1b 1a   Data
            .hex 1b d4 1b 1b   ; $f83b: 1b d4 1b 1b   Data
            .hex 1c 1c d3 1c   ; $f83f: 1c 1c d3 1c   Data
            .hex 1d 1d d4 1d   ; $f843: 1d 1d d4 1d   Data
            .hex 05 0e e0 ea   ; $f847: 05 0e e0 ea   Data
            .hex 06 0f e0 ea   ; $f84b: 06 0f e0 ea   Data
            .hex c7 c7 e0 ea   ; $f84f: c7 c7 e0 ea   Data
            .hex c8 c8 e1 e9   ; $f853: c8 c8 e1 e9   Data
            .hex 15 1c 23 22   ; $f857: 15 1c 23 22   Data
            .hex 16 d3 23 23   ; $f85b: 16 d3 23 23   Data
            .hex 17 17 e1 e9   ; $f85f: 17 17 e1 e9   Data
            .hex 98 98 e1 e9   ; $f863: 98 98 e1 e9   Data
            .hex 99 99 e1 e9   ; $f867: 99 99 e1 e9   Data
            .hex 15 1c 28 27   ; $f86b: 15 1c 28 27   Data
            .hex 16 d3 28 28   ; $f86f: 16 d3 28 28   Data
            .hex f9 f9 e9 e9   ; $f873: f9 f9 e9 e9   Data
            .hex d3 d3 ea ea   ; $f877: d3 d3 ea ea   Data
            .hex f9 f9 ab ab   ; $f87b: f9 f9 ab ab   Data
            .hex f9 f9 ac ac   ; $f87f: f9 f9 ac ac   Data
            .hex f9 f9 ad ad   ; $f883: f9 f9 ad ad   Data
            .hex 09 10 2f 2e   ; $f887: 09 10 2f 2e   Data
            .hex 0a c4 2f 2f   ; $f88b: 0a c4 2f 2f   Data
            .hex c4 c4 f0 f0   ; $f88f: c4 c4 f0 f0   Data
            .hex 1a 1d 34 31   ; $f893: 1a 1d 34 31   Data
            .hex 1a 1d 35 32   ; $f897: 1a 1d 35 32   Data
            .hex d4 d4 f3 f3   ; $f89b: d4 d4 f3 f3   Data
            .hex 1b d4 34 34   ; $f89f: 1b d4 34 34   Data
            .hex 1b d4 35 35   ; $f8a3: 1b d4 35 35   Data
            .hex 0b 11 f8 f3   ; $f8a7: 0b 11 f8 f3   Data
            .hex 0c 12 f8 f3   ; $f8ab: 0c 12 f8 f3   Data
            .hex cd cd f8 f3   ; $f8af: cd cd f8 f3   Data
            .hex f9 f9 f9 f9   ; $f8b3: f9 f9 f9 f9   Data
__f8b7:     .hex 1e 1f e0 f8   ; $f8b7: 1e 1f e0 f8   Data
            .hex 05 06 c3 cd   ; $f8bb: 05 06 c3 cd   Data
            .hex 0e 0f c3 cd   ; $f8bf: 0e 0f c3 cd   Data
            .hex c7 c7 c3 cd   ; $f8c3: c7 c7 c3 cd   Data
            .hex d3 d3 c4 d4   ; $f8c7: d3 d3 c4 d4   Data
            .hex 05 06 c7 c8   ; $f8cb: 05 06 c7 c8   Data
            .hex 06 06 c7 c8   ; $f8cf: 06 06 c7 c8   Data
            .hex c7 c7 c7 c8   ; $f8d3: c7 c7 c7 c8   Data
            .hex c8 c8 c8 c8   ; $f8d7: c8 c8 c8 c8   Data
            .hex 15 15 c4 d4   ; $f8db: 15 15 c4 d4   Data
            .hex 16 16 c4 d4   ; $f8df: 16 16 c4 d4   Data
            .hex 17 99 0c 0b   ; $f8e3: 17 99 0c 0b   Data
            .hex 98 c8 0c 0c   ; $f8e7: 98 c8 0c 0c   Data
            .hex c8 c8 cd cd   ; $f8eb: c8 c8 cd cd   Data
            .hex 0e 0f c7 c8   ; $f8ef: 0e 0f c7 c8   Data
            .hex 0f 0f c7 c8   ; $f8f3: 0f 0f c7 c8   Data
            .hex 1c 1c c4 d4   ; $f8f7: 1c 1c c4 d4   Data
            .hex 17 99 12 11   ; $f8fb: 17 99 12 11   Data
            .hex 98 c8 12 12   ; $f8ff: 98 c8 12 12   Data
            .hex d3 d3 d3 f9   ; $f903: d3 d3 d3 f9   Data
            .hex f9 f9 d4 d4   ; $f907: f9 f9 d4 d4   Data
            .hex 15 15 d3 f9   ; $f90b: 15 15 d3 f9   Data
            .hex 16 16 d3 f9   ; $f90f: 16 16 d3 f9   Data
            .hex 17 99 98 17   ; $f913: 17 99 98 17   Data
            .hex 98 c8 98 98   ; $f917: 98 c8 98 98   Data
            .hex 99 99 c8 99   ; $f91b: 99 99 c8 99   Data
            .hex f9 f9 1a 1a   ; $f91f: f9 f9 1a 1a   Data
            .hex f9 f9 1b 1b   ; $f923: f9 f9 1b 1b   Data
            .hex 1c 1c d3 f9   ; $f927: 1c 1c d3 f9   Data
            .hex f9 f9 1d 1d   ; $f92b: f9 f9 1d 1d   Data
            .hex 1e 1f a5 a4   ; $f92f: 1e 1f a5 a4   Data
            .hex 1f 1f e0 e1   ; $f933: 1f 1f e0 e1   Data
            .hex e0 e0 e0 e1   ; $f937: e0 e0 e0 e1   Data
            .hex e1 e1 e1 e1   ; $f93b: e1 e1 e1 e1   Data
            .hex 22 27 ea e9   ; $f93f: 22 27 ea e9   Data
            .hex 23 28 ea e9   ; $f943: 23 28 ea e9   Data
            .hex a4 a6 a5 a4   ; $f947: a4 a6 a5 a4   Data
            .hex a5 e1 a5 a5   ; $f94b: a5 e1 a5 a5   Data
            .hex a6 a6 e1 a6   ; $f94f: a6 a6 e1 a6   Data
            .hex 27 27 ea e9   ; $f953: 27 27 ea e9   Data
            .hex 28 28 ea e9   ; $f957: 28 28 ea e9   Data
            .hex e9 e9 e9 e9   ; $f95b: e9 e9 e9 e9   Data
            .hex ea ea ea e9   ; $f95f: ea ea ea e9   Data
            .hex ab ad ac ab   ; $f963: ab ad ac ab   Data
            .hex ac e9 ac ac   ; $f967: ac e9 ac ac   Data
            .hex ad ad e9 ad   ; $f96b: ad ad e9 ad   Data
            .hex 22 27 f0 f3   ; $f96f: 22 27 f0 f3   Data
            .hex 23 28 f0 f3   ; $f973: 23 28 f0 f3   Data
            .hex ea ea f0 f3   ; $f977: ea ea f0 f3   Data
            .hex ab ad 32 31   ; $f97b: ab ad 32 31   Data
            .hex ac e9 32 32   ; $f97f: ac e9 32 32   Data
            .hex e9 e9 f3 f3   ; $f983: e9 e9 f3 f3   Data
            .hex ab ad 35 34   ; $f987: ab ad 35 34   Data
            .hex ac e9 35 35   ; $f98b: ac e9 35 35   Data
            .hex a4 a6 37 36   ; $f98f: a4 a6 37 36   Data
            .hex a5 e1 37 37   ; $f993: a5 e1 37 37   Data
            .hex e1 e1 f8 f8   ; $f997: e1 e1 f8 f8   Data
            .hex f9 f9 f9 f9   ; $f99b: f9 f9 f9 f9   Data
__f99f:     .hex 2e 2f f0 c3   ; $f99f: 2e 2f f0 c3   Data
            .hex 09 0a 02 01   ; $f9a3: 09 0a 02 01   Data
            .hex 10 c4 02 02   ; $f9a7: 10 c4 02 02   Data
            .hex c4 c4 c3 c3   ; $f9ab: c4 c4 c3 c3   Data
            .hex c4 c4 c4 c4   ; $f9af: c4 c4 c4 c4   Data
            .hex 15 16 0e 05   ; $f9b3: 15 16 0e 05   Data
            .hex 15 16 0f 06   ; $f9b7: 15 16 0f 06   Data
            .hex d3 d3 c7 c7   ; $f9bb: d3 d3 c7 c7   Data
            .hex f9 f9 c8 c8   ; $f9bf: f9 f9 c8 c8   Data
            .hex 09 0a 10 09   ; $f9c3: 09 0a 10 09   Data
            .hex 0a 0a c4 0a   ; $f9c7: 0a 0a c4 0a   Data
            .hex 1a 1b 11 0b   ; $f9cb: 1a 1b 11 0b   Data
            .hex 1a 1b 12 0c   ; $f9cf: 1a 1b 12 0c   Data
            .hex d4 d4 cd cd   ; $f9d3: d4 d4 cd cd   Data
            .hex 1c d3 0e 0e   ; $f9d7: 1c d3 0e 0e   Data
            .hex 1c d3 0f 0f   ; $f9db: 1c d3 0f 0f   Data
            .hex 10 c4 10 10   ; $f9df: 10 c4 10 10   Data
            .hex 1d d4 11 11   ; $f9e3: 1d d4 11 11   Data
            .hex 1d d4 12 12   ; $f9e7: 1d d4 12 12   Data
            .hex d3 d3 d3 d3   ; $f9eb: d3 d3 d3 d3   Data
            .hex d4 d4 d4 d4   ; $f9ef: d4 d4 d4 d4   Data
            .hex 15 16 1c 15   ; $f9f3: 15 16 1c 15   Data
            .hex 16 16 d3 16   ; $f9f7: 16 16 d3 16   Data
            .hex f9 f9 17 17   ; $f9fb: f9 f9 17 17   Data
            .hex f9 f9 98 98   ; $f9ff: f9 f9 98 98   Data
            .hex f9 f9 99 99   ; $fa03: f9 f9 99 99   Data
            .hex 1a 1b 1d 1a   ; $fa07: 1a 1b 1d 1a   Data
            .hex 1b 1b d4 1b   ; $fa0b: 1b 1b d4 1b   Data
            .hex 1c d3 1c 1c   ; $fa0f: 1c d3 1c 1c   Data
            .hex 1d d4 1d 1d   ; $fa13: 1d d4 1d 1d   Data
            .hex 22 23 e0 c7   ; $fa17: 22 23 e0 c7   Data
            .hex 27 28 e0 c7   ; $fa1b: 27 28 e0 c7   Data
            .hex ea ea e0 c7   ; $fa1f: ea ea e0 c7   Data
            .hex e9 e9 e1 c8   ; $fa23: e9 e9 e1 c8   Data
            .hex 22 23 ea d3   ; $fa27: 22 23 ea d3   Data
            .hex 23 23 ea d3   ; $fa2b: 23 23 ea d3   Data
            .hex ab ab e1 c8   ; $fa2f: ab ab e1 c8   Data
            .hex ac ac e1 c8   ; $fa33: ac ac e1 c8   Data
            .hex ad ad e1 c8   ; $fa37: ad ad e1 c8   Data
            .hex 27 28 ea d3   ; $fa3b: 27 28 ea d3   Data
            .hex 28 28 ea d3   ; $fa3f: 28 28 ea d3   Data
            .hex e9 e9 e9 f9   ; $fa43: e9 e9 e9 f9   Data
            .hex ea ea ea d3   ; $fa47: ea ea ea d3   Data
            .hex ab ab e9 f9   ; $fa4b: ab ab e9 f9   Data
            .hex ac ac e9 f9   ; $fa4f: ac ac e9 f9   Data
            .hex ad ad e9 f9   ; $fa53: ad ad e9 f9   Data
            .hex 2e 2f f0 c4   ; $fa57: 2e 2f f0 c4   Data
            .hex 2f 2f f0 c4   ; $fa5b: 2f 2f f0 c4   Data
            .hex f0 f0 f0 c4   ; $fa5f: f0 f0 f0 c4   Data
            .hex 31 34 f3 d4   ; $fa63: 31 34 f3 d4   Data
            .hex 32 35 f3 d4   ; $fa67: 32 35 f3 d4   Data
            .hex f3 f3 f3 d4   ; $fa6b: f3 f3 f3 d4   Data
            .hex 34 34 f3 d4   ; $fa6f: 34 34 f3 d4   Data
            .hex 35 35 f3 d4   ; $fa73: 35 35 f3 d4   Data
            .hex 31 34 f8 cd   ; $fa77: 31 34 f8 cd   Data
            .hex 32 35 f8 cd   ; $fa7b: 32 35 f8 cd   Data
            .hex f3 f3 f8 cd   ; $fa7f: f3 f3 f8 cd   Data
            .hex f9 f9 f9 f9   ; $fa83: f9 f9 f9 f9   Data
__fa87:     .hex 36 37 f8 e0   ; $fa87: 36 37 f8 e0   Data
            .hex 0b 0c c3 c7   ; $fa8b: 0b 0c c3 c7   Data
            .hex 11 12 c3 c7   ; $fa8f: 11 12 c3 c7   Data
            .hex cd cd c3 c7   ; $fa93: cd cd c3 c7   Data
            .hex d4 d4 c4 d3   ; $fa97: d4 d4 c4 d3   Data
            .hex 17 98 06 05   ; $fa9b: 17 98 06 05   Data
            .hex 99 c8 06 06   ; $fa9f: 99 c8 06 06   Data
            .hex c8 c8 c7 c7   ; $faa3: c8 c8 c7 c7   Data
            .hex c8 c8 c8 c8   ; $faa7: c8 c8 c8 c8   Data
            .hex 1a 1a 15 15   ; $faab: 1a 1a 15 15   Data
            .hex 1b 1b 16 16   ; $faaf: 1b 1b 16 16   Data
            .hex 0b 0c cd c8   ; $fab3: 0b 0c cd c8   Data
            .hex 0c 0c cd c8   ; $fab7: 0c 0c cd c8   Data
            .hex cd cd cd c8   ; $fabb: cd cd cd c8   Data
            .hex 17 98 0f 0e   ; $fabf: 17 98 0f 0e   Data
            .hex 99 c8 0f 0f   ; $fac3: 99 c8 0f 0f   Data
            .hex 1d 1d 1c 1c   ; $fac7: 1d 1d 1c 1c   Data
            .hex 11 12 cd c8   ; $facb: 11 12 cd c8   Data
            .hex 12 12 cd c8   ; $facf: 12 12 cd c8   Data
            .hex f9 f9 d3 d3   ; $fad3: f9 f9 d3 d3   Data
            .hex d4 d4 d4 f9   ; $fad7: d4 d4 d4 f9   Data
            .hex f9 f9 15 15   ; $fadb: f9 f9 15 15   Data
            .hex f9 f9 16 16   ; $fadf: f9 f9 16 16   Data
            .hex 17 98 99 17   ; $fae3: 17 98 99 17   Data
            .hex 98 98 c8 98   ; $fae7: 98 98 c8 98   Data
            .hex 99 c8 99 99   ; $faeb: 99 c8 99 99   Data
            .hex 1a 1a d4 f9   ; $faef: 1a 1a d4 f9   Data
            .hex 1b 1b d4 f9   ; $faf3: 1b 1b d4 f9   Data
            .hex f9 f9 1c 1c   ; $faf7: f9 f9 1c 1c   Data
            .hex 1d 1d d4 f9   ; $fafb: 1d 1d d4 f9   Data
            .hex a4 a5 1f 1e   ; $faff: a4 a5 1f 1e   Data
            .hex a6 e1 1f 1f   ; $fb03: a6 e1 1f 1f   Data
            .hex e1 e1 e0 e0   ; $fb07: e1 e1 e0 e0   Data
            .hex e1 e1 e1 e1   ; $fb0b: e1 e1 e1 e1   Data
            .hex ab ac 27 22   ; $fb0f: ab ac 27 22   Data
            .hex ab ac 28 23   ; $fb13: ab ac 28 23   Data
            .hex a4 a5 a6 e0   ; $fb17: a4 a5 a6 e0   Data
            .hex a5 a5 e1 a5   ; $fb1b: a5 a5 e1 a5   Data
            .hex a6 e1 a6 a6   ; $fb1f: a6 e1 a6 a6   Data
            .hex ad e9 27 27   ; $fb23: ad e9 27 27   Data
            .hex ad e9 28 28   ; $fb27: ad e9 28 28   Data
            .hex e9 e9 e9 e9   ; $fb2b: e9 e9 e9 e9   Data
            .hex e9 e9 ea ea   ; $fb2f: e9 e9 ea ea   Data
            .hex ab ac ad ab   ; $fb33: ab ac ad ab   Data
            .hex ac ac e9 ac   ; $fb37: ac ac e9 ac   Data
            .hex ad e9 ad ad   ; $fb3b: ad e9 ad ad   Data
            .hex 31 32 f0 ea   ; $fb3f: 31 32 f0 ea   Data
            .hex 34 35 f0 ea   ; $fb43: 34 35 f0 ea   Data
            .hex f3 f3 f0 ea   ; $fb47: f3 f3 f0 ea   Data
            .hex 31 32 f3 e9   ; $fb4b: 31 32 f3 e9   Data
            .hex 32 32 f3 e9   ; $fb4f: 32 32 f3 e9   Data
            .hex f3 f3 f3 e9   ; $fb53: f3 f3 f3 e9   Data
            .hex 34 35 f3 e9   ; $fb57: 34 35 f3 e9   Data
            .hex 35 35 f3 e9   ; $fb5b: 35 35 f3 e9   Data
            .hex 36 37 f8 e1   ; $fb5f: 36 37 f8 e1   Data
            .hex 37 37 f8 e1   ; $fb63: 37 37 f8 e1   Data
            .hex f8 f8 f8 e1   ; $fb67: f8 f8 f8 e1   Data
            .hex f9 f9 f9 f9   ; $fb6b: f9 f9 f9 f9   Data
__fb6f:     .hex 8f            ; $fb6f: 8f            Data
__fb70:     .hex fb 8f fb c9   ; $fb70: fb 8f fb c9   Data
            .hex fb 0f fc 55   ; $fb74: fb 0f fc 55   Data
            .hex fc 9b fc ea   ; $fb78: fc 9b fc ea   Data
            .hex fc 30 fd 6d   ; $fb7c: fc 30 fd 6d   Data
            .hex fd bc fd 0b   ; $fb80: fd bc fd 0b   Data
            .hex fe 5a fe a0   ; $fb84: fe 5a fe a0   Data
            .hex fe e6 fe 2c   ; $fb88: fe e6 fe 2c   Data
            .hex ff 72 ff 02   ; $fb8c: ff 72 ff 02   Data
            .hex 01 e0 03 01   ; $fb90: 01 e0 03 01   Data
            .hex e1 04 01 e1   ; $fb94: e1 04 01 e1   Data
            .hex 05 01 f8 02   ; $fb98: 05 01 f8 02   Data
            .hex 08 f0 02 09   ; $fb9c: 08 f0 02 09   Data
            .hex c4 02 0a c3   ; $fba0: c4 02 0a c3   Data
            .hex 06 04 f0 06   ; $fba4: 06 04 f0 06   Data
            .hex 05 f9 06 06   ; $fba8: 05 f9 06 06   Data
            .hex c3 07 08 e0   ; $fbac: c3 07 08 e0   Data
            .hex 08 08 e1 09   ; $fbb0: 08 08 e1 09   Data
            .hex 08 e1 0a 08   ; $fbb4: 08 e1 0a 08   Data
            .hex e1 0b 08 f8   ; $fbb8: e1 0b 08 f8   Data
            .hex 08 01 f0 08   ; $fbbc: 08 01 f0 08   Data
            .hex 02 c4 08 03   ; $fbc0: 02 c4 08 03   Data
            .hex c4 08 04 c3   ; $fbc4: c4 08 04 c3   Data
            .hex ff 01 05 e1   ; $fbc8: ff 01 05 e1   Data
            .hex 02 05 e1 03   ; $fbcc: 02 05 e1 03   Data
            .hex 05 e1 04 05   ; $fbd0: 05 e1 04 05   Data
            .hex e1 05 05 e1   ; $fbd4: e1 05 05 e1   Data
            .hex 06 04 f0 06   ; $fbd8: 06 04 f0 06   Data
            .hex 05 f9 06 06   ; $fbdc: 05 f9 06 06   Data
            .hex c3 03 08 f0   ; $fbe0: c3 03 08 f0   Data
            .hex 03 09 c4 03   ; $fbe4: 03 09 c4 03   Data
            .hex 0a c3 05 01   ; $fbe8: 0a c3 05 01   Data
            .hex f0 05 02 c4   ; $fbec: f0 05 02 c4   Data
            .hex 05 03 c3 07   ; $fbf0: 05 03 c3 07   Data
            .hex 01 e0 08 01   ; $fbf4: 01 e0 08 01   Data
            .hex e1 09 01 f8   ; $fbf8: e1 09 01 f8   Data
            .hex 08 05 f0 08   ; $fbfc: 08 05 f0 08   Data
            .hex 06 c4 08 07   ; $fc00: 06 c4 08 07   Data
            .hex c3 0a 08 f0   ; $fc04: c3 0a 08 f0   Data
            .hex 0a 09 c4 0a   ; $fc08: 0a 09 c4 0a   Data
            .hex 0a c3 ff 01   ; $fc0c: 0a c3 ff 01   Data
            .hex 05 e1 02 05   ; $fc10: 05 e1 02 05   Data
            .hex e1 03 05 e1   ; $fc14: e1 03 05 e1   Data
            .hex 04 05 e1 05   ; $fc18: 04 05 e1 05   Data
            .hex 05 e1 06 04   ; $fc1c: 05 e1 06 04   Data
            .hex f0 06 05 f9   ; $fc20: f0 06 05 f9   Data
            .hex 06 06 c3 04   ; $fc24: 06 06 c3 04   Data
            .hex 01 f0 04 02   ; $fc28: 01 f0 04 02   Data
            .hex c4 04 03 c3   ; $fc2c: c4 04 03 c3   Data
            .hex 02 06 e0 03   ; $fc30: 02 06 e0 03   Data
            .hex 06 e1 04 06   ; $fc34: 06 e1 04 06   Data
            .hex f8 02 08 f0   ; $fc38: f8 02 08 f0   Data
            .hex 02 09 c4 02   ; $fc3c: 02 09 c4 02   Data
            .hex 0a c3 08 04   ; $fc40: 0a c3 08 04   Data
            .hex e0 09 04 e1   ; $fc44: e0 09 04 e1   Data
            .hex 0a 04 f8 0a   ; $fc48: 0a 04 f8 0a   Data
            .hex 07 f0 0a 08   ; $fc4c: 07 f0 0a 08   Data
            .hex c4 0a 09 c3   ; $fc50: c4 0a 09 c3   Data
            .hex ff 01 05 e1   ; $fc54: ff 01 05 e1   Data
            .hex 02 05 e1 03   ; $fc58: 02 05 e1 03   Data
            .hex 05 e1 04 05   ; $fc5c: 05 e1 04 05   Data
            .hex e1 05 05 e1   ; $fc60: e1 05 05 e1   Data
            .hex 06 04 f0 06   ; $fc64: 06 04 f0 06   Data
            .hex 05 f9 06 06   ; $fc68: 05 f9 06 06   Data
            .hex c3 02 02 f0   ; $fc6c: c3 02 02 f0   Data
            .hex 02 03 c4 02   ; $fc70: 02 03 c4 02   Data
            .hex 04 c3 02 06   ; $fc74: 04 c3 02 06   Data
            .hex e0 03 06 e1   ; $fc78: e0 03 06 e1   Data
            .hex 04 06 f8 06   ; $fc7c: 04 06 f8 06   Data
            .hex 09 e0 07 09   ; $fc80: 09 e0 07 09   Data
            .hex e1 08 09 f8   ; $fc84: e1 08 09 f8   Data
            .hex 09 02 f0 09   ; $fc88: 09 02 f0 09   Data
            .hex 03 c4 09 04   ; $fc8c: 03 c4 09 04   Data
            .hex c3 0a 06 f0   ; $fc90: c3 0a 06 f0   Data
            .hex 0a 07 c4 0a   ; $fc94: 0a 07 c4 0a   Data
            .hex 08 c3 ff 01   ; $fc98: 08 c3 ff 01   Data
            .hex 05 e1 02 05   ; $fc9c: 05 e1 02 05   Data
            .hex e1 03 05 e1   ; $fca0: e1 03 05 e1   Data
            .hex 04 05 e1 05   ; $fca4: 04 05 e1 05   Data
            .hex 05 e1 06 04   ; $fca8: 05 e1 06 04   Data
            .hex f0 06 05 f9   ; $fcac: f0 06 05 f9   Data
            .hex 06 06 c3 03   ; $fcb0: 06 06 c3 03   Data
            .hex 01 f0 03 02   ; $fcb4: 01 f0 03 02   Data
            .hex c4 03 03 c3   ; $fcb8: c4 03 03 c3   Data
            .hex 03 04 e0 04   ; $fcbc: 03 04 e0 04   Data
            .hex 04 e1 05 04   ; $fcc0: 04 e1 05 04   Data
            .hex f8 02 07 e0   ; $fcc4: f8 02 07 e0   Data
            .hex 03 07 e1 04   ; $fcc8: 03 07 e1 04   Data
            .hex 07 f8 05 08   ; $fccc: 07 f8 05 08   Data
            .hex e0 06 08 e1   ; $fcd0: e0 06 08 e1   Data
            .hex 07 08 f8 08   ; $fcd4: 07 08 f8 08   Data
            .hex 01 f0 08 02   ; $fcd8: 01 f0 08 02   Data
            .hex c4 08 03 c3   ; $fcdc: c4 08 03 c3   Data
            .hex 09 08 f0 09   ; $fce0: 09 08 f0 09   Data
            .hex 09 c4 09 0a   ; $fce4: 09 c4 09 0a   Data
            .hex c3 ff 01 05   ; $fce8: c3 ff 01 05   Data
            .hex e1 02 05 e1   ; $fcec: e1 02 05 e1   Data
            .hex 03 05 e1 04   ; $fcf0: 03 05 e1 04   Data
            .hex 05 e1 05 05   ; $fcf4: 05 e1 05 05   Data
            .hex e1 06 04 f0   ; $fcf8: e1 06 04 f0   Data
            .hex 06 05 f9 06   ; $fcfc: 06 05 f9 06   Data
            .hex 06 c3 02 02   ; $fd00: 06 c3 02 02   Data
            .hex f0 02 03 c4   ; $fd04: f0 02 03 c4   Data
            .hex 02 04 c3 04   ; $fd08: 02 04 c3 04   Data
            .hex 02 e0 05 02   ; $fd0c: 02 e0 05 02   Data
            .hex e1 06 02 f8   ; $fd10: e1 06 02 f8   Data
            .hex 07 08 f0 07   ; $fd14: 07 08 f0 07   Data
            .hex 09 c4 07 0a   ; $fd18: 09 c4 07 0a   Data
            .hex c3 08 01 f0   ; $fd1c: c3 08 01 f0   Data
            .hex 08 02 c4 08   ; $fd20: 08 02 c4 08   Data
            .hex 03 c3 0a 04   ; $fd24: 03 c3 0a 04   Data
            .hex f0 0a 05 c4   ; $fd28: f0 0a 05 c4   Data
            .hex 0a 06 c3 ff   ; $fd2c: 0a 06 c3 ff   Data
            .hex 01 05 e1 02   ; $fd30: 01 05 e1 02   Data
            .hex 05 e1 03 05   ; $fd34: 05 e1 03 05   Data
            .hex e1 04 05 e1   ; $fd38: e1 04 05 e1   Data
            .hex 05 05 e1 06   ; $fd3c: 05 05 e1 06   Data
            .hex 04 f0 06 05   ; $fd40: 04 f0 06 05   Data
            .hex f9 06 06 c3   ; $fd44: f9 06 06 c3   Data
            .hex 02 04 e0 03   ; $fd48: 02 04 e0 03   Data
            .hex 04 e1 04 04   ; $fd4c: 04 e1 04 04   Data
            .hex f8 03 08 f0   ; $fd50: f8 03 08 f0   Data
            .hex 03 09 c4 03   ; $fd54: 03 09 c4 03   Data
            .hex 0a c3 08 01   ; $fd58: 0a c3 08 01   Data
            .hex f0 08 02 c4   ; $fd5c: f0 08 02 c4   Data
            .hex 08 03 c3 09   ; $fd60: 08 03 c3 09   Data
            .hex 06 f0 09 07   ; $fd64: 06 f0 09 07   Data
            .hex c4 09 08 c3   ; $fd68: c4 09 08 c3   Data
            .hex ff 01 05 e1   ; $fd6c: ff 01 05 e1   Data
            .hex 02 05 e1 03   ; $fd70: 02 05 e1 03   Data
            .hex 05 e1 04 05   ; $fd74: 05 e1 04 05   Data
            .hex e1 05 05 e1   ; $fd78: e1 05 05 e1   Data
            .hex 06 04 f0 06   ; $fd7c: 06 04 f0 06   Data
            .hex 05 f9 06 06   ; $fd80: 05 f9 06 06   Data
            .hex c3 03 01 f0   ; $fd84: c3 03 01 f0   Data
            .hex 03 02 c4 03   ; $fd88: 03 02 c4 03   Data
            .hex 03 c3 03 04   ; $fd8c: 03 c3 03 04   Data
            .hex e0 04 04 e1   ; $fd90: e0 04 04 e1   Data
            .hex 05 04 f8 04   ; $fd94: 05 04 f8 04   Data
            .hex 07 f0 04 08   ; $fd98: 07 f0 04 08   Data
            .hex c4 04 09 c3   ; $fd9c: c4 04 09 c3   Data
            .hex 07 01 e0 08   ; $fda0: 07 01 e0 08   Data
            .hex 01 e1 09 01   ; $fda4: 01 e1 09 01   Data
            .hex f8 0a 02 f0   ; $fda8: f8 0a 02 f0   Data
            .hex 0a 03 c4 0a   ; $fdac: 0a 03 c4 0a   Data
            .hex 04 c3 09 07   ; $fdb0: 04 c3 09 07   Data
            .hex f0 09 08 c4   ; $fdb4: f0 09 08 c4   Data
            .hex 09 09 c3 ff   ; $fdb8: 09 09 c3 ff   Data
            .hex 01 05 e1 02   ; $fdbc: 01 05 e1 02   Data
            .hex 05 e1 03 05   ; $fdc0: 05 e1 03 05   Data
            .hex e1 04 05 e1   ; $fdc4: e1 04 05 e1   Data
            .hex 05 05 e1 06   ; $fdc8: 05 05 e1 06   Data
            .hex 04 f0 06 05   ; $fdcc: 04 f0 06 05   Data
            .hex f9 06 06 c3   ; $fdd0: f9 06 06 c3   Data
            .hex 03 03 e0 04   ; $fdd4: 03 03 e0 04   Data
            .hex 03 e1 05 03   ; $fdd8: 03 e1 05 03   Data
            .hex f8 04 07 f0   ; $fddc: f8 04 07 f0   Data
            .hex 04 08 c4 04   ; $fde0: 04 08 c4 04   Data
            .hex 09 c3 05 0a   ; $fde4: 09 c3 05 0a   Data
            .hex e0 06 0a e1   ; $fde8: e0 06 0a e1   Data
            .hex 07 0a f8 08   ; $fDEC: 07 0a f8 08   Data
            .hex 04 f0 08 05   ; $fdf0: 04 f0 08 05   Data
            .hex c4 08 06 c3   ; $fdf4: c4 08 06 c3   Data
            .hex 09 01 f0 09   ; $fdf8: 09 01 f0 09   Data
            .hex 02 c4 09 03   ; $fdfc: 02 c4 09 03   Data
            .hex c3 09 08 f0   ; $fe00: c3 09 08 f0   Data
            .hex 09 09 c4 09   ; $fe04: 09 09 c4 09   Data
            .hex 0a c3 ff 01   ; $fe08: 0a c3 ff 01   Data
            .hex 05 e1 02 05   ; $fe0c: 05 e1 02 05   Data
            .hex e1 03 05 e1   ; $fe10: e1 03 05 e1   Data
            .hex 04 05 e1 05   ; $fe14: 04 05 e1 05   Data
            .hex 05 e1 06 04   ; $fe18: 05 e1 06 04   Data
            .hex f0 06 05 f9   ; $fe1c: f0 06 05 f9   Data
            .hex 06 06 c3 02   ; $fe20: 06 06 c3 02   Data
            .hex 0a e0 03 0a   ; $fe24: 0a e0 03 0a   Data
            .hex e1 04 0a f8   ; $fe28: e1 04 0a f8   Data
            .hex 04 02 e0 05   ; $fe2c: 04 02 e0 05   Data
            .hex 02 e1 06 02   ; $fe30: 02 e1 06 02   Data
            .hex f8 04 06 f0   ; $fe34: f8 04 06 f0   Data
            .hex 04 07 c4 04   ; $fe38: 04 07 c4 04   Data
            .hex 08 c3 06 08   ; $fe3c: 08 c3 06 08   Data
            .hex e0 07 08 e1   ; $fe40: e0 07 08 e1   Data
            .hex 08 08 f8 09   ; $fe44: 08 08 f8 09   Data
            .hex 02 f0 09 03   ; $fe48: 02 f0 09 03   Data
            .hex c4 09 04 c3   ; $fe4c: c4 09 04 c3   Data
            .hex 09 08 f0 09   ; $fe50: 09 08 f0 09   Data
            .hex 09 c4 09 0a   ; $fe54: 09 c4 09 0a   Data
            .hex c3 ff 01 05   ; $fe58: c3 ff 01 05   Data
            .hex e1 02 05 e1   ; $fe5c: e1 02 05 e1   Data
            .hex 03 05 e1 04   ; $fe60: 03 05 e1 04   Data
            .hex 05 e1 05 05   ; $fe64: 05 e1 05 05   Data
            .hex e1 06 04 f0   ; $fe68: e1 06 04 f0   Data
            .hex 06 05 f9 06   ; $fe6c: 06 05 f9 06   Data
            .hex 06 c3 03 02   ; $fe70: 06 c3 03 02   Data
            .hex f0 03 03 c4   ; $fe74: f0 03 03 c4   Data
            .hex 03 04 c3 03   ; $fe78: 03 04 c3 03   Data
            .hex 08 e0 04 08   ; $fe7c: 08 e0 04 08   Data
            .hex e1 05 08 f8   ; $fe80: e1 05 08 f8   Data
            .hex 05 01 f0 05   ; $fe84: 05 01 f0 05   Data
            .hex 02 c4 05 03   ; $fe88: 02 c4 05 03   Data
            .hex c3 05 0a e0   ; $fe8c: c3 05 0a e0   Data
            .hex 06 0a e1 07   ; $fe90: 06 0a e1 07   Data
            .hex 0a f8 07 01   ; $fe94: 0a f8 07 01   Data
            .hex e0 08 01 e1   ; $fe98: e0 08 01 e1   Data
            .hex 09 01 f8 ff   ; $fe9c: 09 01 f8 ff   Data
            .hex 01 05 e1 02   ; $fea0: 01 05 e1 02   Data
            .hex 05 e1 03 05   ; $fea4: 05 e1 03 05   Data
            .hex e1 04 05 e1   ; $fea8: e1 04 05 e1   Data
            .hex 05 05 e1 06   ; $feac: 05 05 e1 06   Data
            .hex 04 f0 06 05   ; $feb0: 04 f0 06 05   Data
            .hex f9 06 06 c3   ; $feb4: f9 06 06 c3   Data
            .hex 03 01 f0 03   ; $feb8: 03 01 f0 03   Data
            .hex 02 c4 03 03   ; $febc: 02 c4 03 03   Data
            .hex c3 04 06 f0   ; $fec0: c3 04 06 f0   Data
            .hex 04 07 c4 04   ; $fec4: 04 07 c4 04   Data
            .hex 08 c3 03 0a   ; $fec8: 08 c3 03 0a   Data
            .hex e0 04 0a e1   ; $fecc: e0 04 0a e1   Data
            .hex 05 0a f8 09   ; $fed0: 05 0a f8 09   Data
            .hex 08 f0 09 09   ; $fed4: 08 f0 09 09   Data
            .hex c4 09 0a c3   ; $fed8: c4 09 0a c3   Data
            .hex 0a 03 f0 0a   ; $fedc: 0a 03 f0 0a   Data
            .hex 04 c4 0a 05   ; $fee0: 04 c4 0a 05   Data
            .hex c3 ff 01 05   ; $fee4: c3 ff 01 05   Data
            .hex e1 02 05 e1   ; $fee8: e1 02 05 e1   Data
            .hex 03 05 e1 04   ; $feec: 03 05 e1 04   Data
            .hex 05 e1 05 05   ; $fef0: 05 e1 05 05   Data
            .hex e1 06 04 f0   ; $fef4: e1 06 04 f0   Data
            .hex 06 05 f9 06   ; $fef8: 06 05 f9 06   Data
            .hex 06 c3 03 07   ; $fefc: 06 c3 03 07   Data
            .hex f0 03 08 c4   ; $ff00: f0 03 08 c4   Data
            .hex 03 09 c3 04   ; $ff04: 03 09 c3 04   Data
            .hex 03 e0 05 03   ; $ff08: 03 e0 05 03   Data
            .hex e1 06 03 f8   ; $ff0c: e1 06 03 f8   Data
            .hex 05 09 e0 06   ; $ff10: 05 09 e0 06   Data
            .hex 09 e1 07 09   ; $ff14: 09 e1 07 09   Data
            .hex f8 09 04 f0   ; $ff18: f8 09 04 f0   Data
            .hex 09 05 c4 09   ; $ff1c: 09 05 c4 09   Data
            .hex 06 c3 0a 08   ; $ff20: 06 c3 0a 08   Data
            .hex f0 0a 09 c4   ; $ff24: f0 0a 09 c4   Data
            .hex 0a 0a c3 ff   ; $ff28: 0a 0a c3 ff   Data
            .hex 01 05 e1 02   ; $ff2c: 01 05 e1 02   Data
            .hex 05 e1 03 05   ; $ff30: 05 e1 03 05   Data
            .hex e1 04 05 e1   ; $ff34: e1 04 05 e1   Data
            .hex 05 05 e1 06   ; $ff38: 05 05 e1 06   Data
            .hex 04 f0 06 05   ; $ff3c: 04 f0 06 05   Data
            .hex f9 06 06 c3   ; $ff40: f9 06 06 c3   Data
            .hex 02 06 f0 02   ; $ff44: 02 06 f0 02   Data
            .hex 07 c4 02 08   ; $ff48: 07 c4 02 08   Data
            .hex c3 03 03 e0   ; $ff4c: c3 03 03 e0   Data
            .hex 04 03 e1 05   ; $ff50: 04 03 e1 05   Data
            .hex 03 f8 03 0a   ; $ff54: 03 f8 03 0a   Data
            .hex e0 04 0a e1   ; $ff58: e0 04 0a e1   Data
            .hex 05 0a f8 07   ; $ff5c: 05 0a f8 07   Data
            .hex 08 f0 07 09   ; $ff60: 08 f0 07 09   Data
            .hex c4 07 0a c3   ; $ff64: c4 07 0a c3   Data
            .hex 09 03 f0 09   ; $ff68: 09 03 f0 09   Data
            .hex 04 c4 09 05   ; $ff6c: 04 c4 09 05   Data
            .hex c3 ff 01 05   ; $ff70: c3 ff 01 05   Data
            .hex e1 02 05 e1   ; $ff74: e1 02 05 e1   Data
            .hex 03 05 e1 04   ; $ff78: 03 05 e1 04   Data
            .hex 05 e1 05 05   ; $ff7c: 05 e1 05 05   Data
            .hex e1 06 04 f0   ; $ff80: e1 06 04 f0   Data
            .hex 06 05 f9 06   ; $ff84: 06 05 f9 06   Data
            .hex 06 c3 02 04   ; $ff88: 06 c3 02 04   Data
            .hex e0 03 04 e1   ; $ff8c: e0 03 04 e1   Data
            .hex 04 04 f8 02   ; $ff90: 04 04 f8 02   Data
            .hex 08 f0 02 09   ; $ff94: 08 f0 02 09   Data
            .hex c4 02 0a c3   ; $ff98: c4 02 0a c3   Data
            .hex 05 01 f0 05   ; $ff9c: 05 01 f0 05   Data
            .hex 02 c4 05 03   ; $ffa0: 02 c4 05 03   Data
            .hex c3 05 08 f0   ; $ffa4: c3 05 08 f0   Data
            .hex 05 09 c4 05   ; $ffa8: 05 09 c4 05   Data
            .hex 0a c3 08 04   ; $ffac: 0a c3 08 04   Data
            .hex e0 09 04 e1   ; $ffb0: e0 09 04 e1   Data
            .hex 0a 04 f8 08   ; $ffb4: 0a 04 f8 08   Data
            .hex 06 e0 09 06   ; $ffb8: 06 e0 09 06   Data
            .hex e1 0a 06 f8   ; $ffbc: e1 0a 06 f8   Data
            .hex ff            ; $ffc0: ff            Data
__ffc1:     .hex 43 4f 50 59   ; $ffc1: 43 4f 50 59   Data
            .hex 52 49 47 48   ; $ffc5: 52 49 47 48   Data
            .hex 54 20 31 39   ; $ffc9: 54 20 31 39   Data
            .hex 38 32 20 31   ; $ffcd: 38 32 20 31   Data
            .hex 39 38 35 20   ; $ffd1: 39 38 35 20   Data
            .hex 4e 41 4d 43   ; $ffd5: 4e 41 4d 43   Data
            .hex 4f 20 4c 54   ; $ffd9: 4f 20 4c 54   Data
            .hex 44 2e 20 41   ; $ffdd: 44 2e 20 41   Data
            .hex 4c 4c 20 52   ; $ffe1: 4c 4c 20 52   Data
            .hex 49 47 48 54   ; $ffe5: 49 47 48 54   Data
            .hex 53 20 52 45   ; $ffe9: 53 20 52 45   Data
            .hex 53 45 52 56   ; $ffed: 53 45 52 56   Data
            .hex 45 44 ff ff   ; $fff1: 45 44 ff ff   Data
            .hex ff ff ff ff   ; $fff5: ff ff ff ff   Data
            .hex ff            ; $fff9: ff            Data

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: fd c0     Vector table
            .dw reset                      ; $fffc: 00 c0     Vector table
            .dw irq                        ; $fffe: ca c2     Vector table
