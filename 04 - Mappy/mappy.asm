;-------------------------------------------------------------------------------
; Mappy (Japan).nes disassembled by DISASM6 v1.5
; Revised, commented, and generally being turned into something decent by Retrolovania

; Still very much a work in progress!

;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 1              ; 1 x 16k PRG banks
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
            .org $c000         ; Set program counter

;-------------------------------------------------------------------------------
; ROM Start
;-------------------------------------------------------------------------------
__c000:     .hex 43 4f 50 59   ; $c000: 43 4f 50 59   Data
            .hex 52 49 47 48   ; $c004: 52 49 47 48   Data
            .hex 54 20 31 39   ; $c008: 54 20 31 39   Data
            .hex 38 33 20 31   ; $c00c: 38 33 20 31   Data
            .hex 39 38 34 20   ; $c010: 39 38 34 20   Data
            .hex 4e 41 4d 43   ; $c014: 4e 41 4d 43   Data
            .hex 4f 20 4c 54   ; $c018: 4f 20 4c 54   Data
            .hex 44 2e 41 4c   ; $c01c: 44 2e 41 4c   Data
            .hex 4c 20 52 49   ; $c020: 4c 20 52 49   Data
            .hex 47 48 54 53   ; $c024: 47 48 54 53   Data
            .hex 20 52 45 53   ; $c028: 20 52 45 53   Data
            .hex 45 52 56 45   ; $c02c: 45 52 56 45   Data
            .hex 44            ; $c030: 44            Data

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      SEI                ; $c031: 78          Disable interrupts.
            CLD                ; $c032: d8          Turns off decimal mode.        
            LDX #$5F           ; $c033: a2 5f       Load value $5F into X register. (Immediate)
            TXS                ; $c035: 9a          Transfer X to stack pointer. (Mappy doesn't need all of zeropage.)
            LDA #$00           ; $c036: a9 00       Load value $00 into Accumulator. (Immediate)
            STA PPUCTRL        ; $c038: 8d 00 20    Store Accumulator in PPUCTRL (clears it)
            STA PPUMASK        ; $c03b: 8d 01 20    Store Accumulator in PPUMASK (clears it)
Wait_VBlank:     
            LDA PPUSTATUS      ; $c03e: ad 02 20    Load value in PPUSTATUS to Accumulator.
            BPL Wait_VBlank    ; $c041: 10 fb       If PPUSTATUS value is greater than or equal to zero (most significant bit of A isn't set), then loop. If not, then continue. 
            LDA #$07           ; $c043: a9 07       Load value $07 into Accumulator. (Immediate)      
            STA $01            ; $c045: 85 01       Store Accumulator value at address $01 (this is zeropage).
            LDA #$00           ; $c047: a9 00       Load value $00 into Accumulator. (Immediate)     
            STA $00            ; $c049: 85 00       Store Accumulator value at address $00 (this is zeropage).    
            TAY                ; $c04b: a8          Transfer Accumulator value to Y register. (essentially clears Y)
Mem_Clear:  
            STA ($00),Y        ; $c04c: 91 00       Store Accumulator value at address ($00 + Y value)
            INY                ; $c04e: c8          Increment Y by one.        
            BNE Mem_Clear      ; $c04f: d0 fb       Is the Zero Flag (Z) clear? If so, keep going. If not, loop.
            DEC $01            ; $c051: c6 01       Decrement value at address $01 by one.
            BNE Mem_Clear      ; $c053: d0 f7       Is the Zero Flag (Z) clear? If so, keep going. If not, loop.     
            JSR __c25c         ; $c055: 20 5c c2    Jump to function __c25c
            LDA #$5A           ; $c058: a9 5a       Load value $5A into Accumulator.     
            STA $3E            ; $c05a: 85 3e       Store Accumulator value at address 3E 
            LDA #$A5           ; $c05c: a9 a5     
            STA $3F            ; $c05e: 85 3f     
            LDY #$00           ; $c060: a0 00     
            JSR __c128         ; $c062: 20 28 c1  
            JSR __f4b5         ; $c065: 20 b5 f4  
            LDA #$88           ; $c068: a9 88     
            STA PPUCTRL        ; $c06a: 8d 00 20  
__c06d:     LDA $20            ; $c06d: a5 20     
            BEQ __c06d         ; $c06f: f0 fc     
            LDA #$07           ; $c071: a9 07     
            STA OAMDMA         ; $c073: 8d 14 40  
            JSR __c150         ; $c076: 20 50 c1  
            JSR __c1c9         ; $c079: 20 c9 c1  
            JSR __c0d0         ; $c07c: 20 d0 c0  
            LDX #$14           ; $c07f: a2 14     
            STX $2c            ; $c081: 86 2c     
            LDA $28            ; $c083: a5 28     
            STA $10            ; $c085: 85 10     
            LDA $29            ; $c087: a5 29     
            ASL $10            ; $c089: 06 10     
            ROL                ; $c08b: 2a        
            ASL $10            ; $c08c: 06 10     
            ROL                ; $c08e: 2a        
            ASL $10            ; $c08f: 06 10     
            ROL                ; $c091: 2a        
            STA PPUSCROLL      ; $c092: 8d 05 20  
            LDA #$00           ; $c095: a9 00     
            STA PPUSCROLL      ; $c097: 8d 05 20  
            LDA #$88           ; $c09a: a9 88     
            ADC #$00           ; $c09c: 69 00     
            STA PPUCTRL        ; $c09e: 8d 00 20  
            JSR __f4f1         ; $c0a1: 20 f1 f4  
            LDA $23            ; $c0a4: a5 23     
            BEQ __c0b5         ; $c0a6: f0 0d     
            JSR __d735         ; $c0a8: 20 35 d7  
            LDA $24            ; $c0ab: a5 24     
            AND #$03           ; $c0ad: 29 03     
            CMP #$01           ; $c0af: c9 01     
            BNE __c0c7         ; $c0b1: d0 14     
            BEQ __c0c7         ; $c0b3: f0 12     
__c0b5:     LDA $24            ; $c0b5: a5 24     
            AND #$03           ; $c0b7: 29 03     
            CMP #$01           ; $c0b9: c9 01     
            BNE __c0bf         ; $c0bb: d0 02     
            nop                ; $c0bd: ea        
            nop                ; $c0be: ea        
__c0bf:     JSR __c7c9         ; $c0bf: 20 c9 c7  
            LDY #$00           ; $c0c2: a0 00     
            JSR __c146         ; $c0c4: 20 46 c1  
__c0c7:     INC $21            ; $c0c7: e6 21     
            LDA #$00           ; $c0c9: a9 00     
            STA $20            ; $c0cb: 85 20     
            JMP __c06d         ; $c0cd: 4c 6d c0  

;-------------------------------------------------------------------------------
__c0d0:     LDX #$00           ; $c0d0: a2 00     
            LDA $23            ; $c0d2: a5 23     
            BEQ __c117         ; $c0d4: f0 41     
            LDA $24            ; $c0d6: a5 24     
            AND #$03           ; $c0d8: 29 03     
            CMP #$01           ; $c0da: c9 01     
            nop                ; $c0dc: ea        
            nop                ; $c0dd: ea        
            LDA #$68           ; $c0de: a9 68     
            STA $10            ; $c0e0: 85 10     
            LDY #$67           ; $c0e2: a0 67     
            LDA $21            ; $c0e4: a5 21     
            AND #$10           ; $c0e6: 29 10     
            BNE __c0ec         ; $c0e8: d0 02     
            LDY #$f7           ; $c0ea: a0 f7     
__c0ec:     STY $11            ; $c0ec: 84 11     
            LDY #$00           ; $c0ee: a0 00     
__c0f0:     LDA $11            ; $c0f0: a5 11     
            STA $0700,x        ; $c0f2: 9d 00 07  
            INX                ; $c0f5: e8        
            LDA __c123,y       ; $c0f6: b9 23 c1  
            INY                ; $c0f9: c8        
            STA $0700,x        ; $c0fa: 9d 00 07  
            INX                ; $c0fd: e8        
            LDA #$02           ; $c0fe: a9 02     
            STA $0700,x        ; $c100: 9d 00 07  
            INX                ; $c103: e8        
            LDA $10            ; $c104: a5 10     
            STA $0700,x        ; $c106: 9d 00 07  
            CLC                ; $c109: 18        
            ADC #$08           ; $c10a: 69 08     
            STA $10            ; $c10c: 85 10     
            INX                ; $c10e: e8        
            CPX #$14           ; $c10f: e0 14     
            BNE __c0f0         ; $c111: d0 dd     
__c113:     INX                ; $c113: e8        
            BPL __c113         ; $c114: 10 fd     
            RTS                ; $c116: 60        

;-------------------------------------------------------------------------------
__c117:     LDA #$f7           ; $c117: a9 f7     
__c119:     STA $0700,x        ; $c119: 9d 00 07  
            INX                ; $c11c: e8        
            INX                ; $c11d: e8        
            INX                ; $c11e: e8        
            INX                ; $c11f: e8        
            BNE __c119         ; $c120: d0 f7     
            RTS                ; $c122: 60        

;-------------------------------------------------------------------------------
__c123:     .hex d0 d2 dc cf   ; $c123: d0 d2 dc cf   Data
            .hex d4            ; $c127: d4            Data
__c128:     LDA __c13e,y       ; $c128: b9 3e c1  
            STA $1e            ; $c12b: 85 1e     
            LDA __c13f,y       ; $c12d: b9 3f c1  
            STA $1f            ; $c130: 85 1f     
            TSX                ; $c132: ba        
            TXA                ; $c133: 8a        
            LDX __c140,y       ; $c134: be 40 c1  
            .hex 9d c1 00      ; $c137: 9d c1 00  Bad Addr Mode - STA $00c1,x
            TXS                ; $c13a: 9a        
            JMP ($001e)        ; $c13b: 6c 1e 00  

;-------------------------------------------------------------------------------
__c13e:     .hex 4f            ; $c13e: 4f            Data
__c13f:     .hex c8            ; $c13f: c8            Data
__c140:     .hex 3f            ; $c140: 3f            Data

;-------------------------------------------------------------------------------
__c141:     TSX                ; $c141: ba        
            TXA                ; $c142: 8a        
            AND #$c0           ; $c143: 29 c0     
            TAY                ; $c145: a8        
__c146:     TSX                ; $c146: ba        
            TXA                ; $c147: 8a        
            LDX $0100,y        ; $c148: be 00 01  
            STA $0100,y        ; $c14b: 99 00 01  
            TXS                ; $c14e: 9a        
            RTS                ; $c14f: 60        

;-------------------------------------------------------------------------------
__c150:     JSR __c241         ; $c150: 20 41 c2  
__c153:     CPX $2a            ; $c153: e4 2a     
            BEQ __c175         ; $c155: f0 1e     
            LDY $0500,x        ; $c157: bc 00 05  
            INX                ; $c15a: e8        
            LDA $0500,x        ; $c15b: bd 00 05  
            INX                ; $c15e: e8        
            STA PPUADDR          ; $c15f: 8d 06 20  
            STY PPUADDR          ; $c162: 8c 06 20  
            LDY $0500,x        ; $c165: bc 00 05  
            INX                ; $c168: e8        
__c169:     LDA $0500,x        ; $c169: bd 00 05  
            INX                ; $c16c: e8        
            STA PPUDATA          ; $c16d: 8d 07 20  
            DEY                ; $c170: 88        
            BNE __c169         ; $c171: d0 f6     
            BEQ __c153         ; $c173: f0 de     
__c175:     LDX #$00           ; $c175: a2 00     
__c177:     CPX $2b            ; $c177: e4 2b     
            BEQ __c1a2         ; $c179: f0 27     
            LDY $04c0,x        ; $c17b: bc c0 04  
            INX                ; $c17e: e8        
            LDA $04c0,x        ; $c17f: bd c0 04  
            INX                ; $c182: e8        
            STA PPUADDR          ; $c183: 8d 06 20  
            STY PPUADDR          ; $c186: 8c 06 20  
            LDA $04c0,x        ; $c189: bd c0 04  
            INX                ; $c18c: e8        
            STA $1e            ; $c18d: 85 1e     
            LDA $04c0,x        ; $c18f: bd c0 04  
            INX                ; $c192: e8        
            STA $1f            ; $c193: 85 1f     
            LDA PPUDATA          ; $c195: ad 07 20  
            LDA PPUDATA          ; $c198: ad 07 20  
            LDY #$08           ; $c19b: a0 08     
            STA ($1e),y        ; $c19d: 91 1e     
            JMP __c177         ; $c19f: 4c 77 c1  

;-------------------------------------------------------------------------------
__c1a2:     JSR __c239         ; $c1a2: 20 39 c2  
            LDA #$00           ; $c1a5: a9 00     
            STA PPUSCROLL          ; $c1a7: 8d 05 20  
            STA PPUSCROLL          ; $c1aa: 8d 05 20  
            LDA #$88           ; $c1ad: a9 88     
            STA PPUCTRL          ; $c1af: 8d 00 20  
            LDX $2b            ; $c1b2: a6 2b     
__c1b4:     nop                ; $c1b4: ea        
            nop                ; $c1b5: ea        
            INX                ; $c1b6: e8        
            CPX #$40           ; $c1b7: e0 40     
            BNE __c1b4         ; $c1b9: d0 f9     
            LDX $2a            ; $c1bb: a6 2a     
__c1bd:     nop                ; $c1bd: ea        
            nop                ; $c1be: ea        
            nop                ; $c1bf: ea        
            nop                ; $c1c0: ea        
            INX                ; $c1c1: e8        
            BNE __c1bd         ; $c1c2: d0 f9     
            STX $2a            ; $c1c4: 86 2a     
            STX $2b            ; $c1c6: 86 2b     
            RTS                ; $c1c8: 60        

;-------------------------------------------------------------------------------
__c1c9:     LDX #$01           ; $c1c9: a2 01     
            STX $4016          ; $c1cb: 8e 16 40  
            DEX                ; $c1ce: ca        
            STX $4016          ; $c1cf: 8e 16 40  
            JSR __c249         ; $c1d2: 20 49 c2  
            INX                ; $c1d5: e8        
            JSR __c249         ; $c1d6: 20 49 c2  
            LDA $41            ; $c1d9: a5 41     
            EOR #$01           ; $c1db: 49 01     
            TAX                ; $c1dd: aa        
            ROR $10,x          ; $c1de: 76 10     
            ROR $10,x          ; $c1e0: 76 10     
            LDX $41            ; $c1e2: a6 41     
            ROR $10,x          ; $c1e4: 76 10     
            ROL                ; $c1e6: 2a        
            ROR $10,x          ; $c1e7: 76 10     
            ROL                ; $c1e9: 2a        
            AND #$03           ; $c1ea: 29 03     
            CMP #$01           ; $c1ec: c9 01     
            ROL $22            ; $c1ee: 26 22     
            ROR $11            ; $c1f0: 66 11     
            ROR $10            ; $c1f2: 66 10     
            ROL $24            ; $c1f4: 26 24     
            ROR $11            ; $c1f6: 66 11     
            ROR $10            ; $c1f8: 66 10     
            ROL $25            ; $c1fa: 26 25     
            LDA $10,x          ; $c1fc: b5 10     
            AND #$0f           ; $c1fe: 29 0f     
            LSR                ; $c200: 4a        
            LSR                ; $c201: 4a        
            TAX                ; $c202: aa        
            LDA __c258,x       ; $c203: bd 58 c2  
            LDX #$00           ; $c206: a2 00     
            CMP $26            ; $c208: c5 26     
            BEQ __c20d         ; $c20a: f0 01     
            INX                ; $c20c: e8        
__c20d:     STA $26            ; $c20d: 85 26     
            STX $27            ; $c20f: 86 27     
            LDA $42            ; $c211: a5 42     
            BEQ __c234         ; $c213: f0 1f     
            LDA $4f            ; $c215: a5 4f     
            ORA $4b            ; $c217: 05 4b     
            BNE __c234         ; $c219: d0 19     
            LDA $040f          ; $c21b: ad 0f 04  
            BEQ __c234         ; $c21e: f0 14     
            LDA $25            ; $c220: a5 25     
            AND #$03           ; $c222: 29 03     
            CMP #$01           ; $c224: c9 01     
            BNE __c233         ; $c226: d0 0b     
            EOR $23            ; $c228: 45 23     
            STA $23            ; $c22a: 85 23     
            BEQ __c233         ; $c22c: f0 05     
            LDA #$01           ; $c22e: a9 01     
            STA $0600          ; $c230: 8d 00 06  
__c233:     RTS                ; $c233: 60        

;-------------------------------------------------------------------------------
__c234:     LDA #$00           ; $c234: a9 00     
            STA $23            ; $c236: 85 23     
            RTS                ; $c238: 60        

;-------------------------------------------------------------------------------
__c239:     LDX #$1e           ; $c239: a2 1e     
            STX PPUMASK          ; $c23b: 8e 01 20  
            STX $2d            ; $c23e: 86 2d     
            RTS                ; $c240: 60        

;-------------------------------------------------------------------------------
__c241:     LDX #$00           ; $c241: a2 00     
            STX PPUMASK          ; $c243: 8e 01 20  
            STX $2d            ; $c246: 86 2d     
            RTS                ; $c248: 60        

;-------------------------------------------------------------------------------
__c249:     LDY #$08           ; $c249: a0 08     
__c24b:     LDA $4016,x        ; $c24b: bd 16 40  
            AND #$03           ; $c24e: 29 03     
            CMP #$01           ; $c250: c9 01     
            ROR $10,x          ; $c252: 76 10     
            DEY                ; $c254: 88        
            BNE __c24b         ; $c255: d0 f4     
            RTS                ; $c257: 60        

;-------------------------------------------------------------------------------
__c258:     .hex 00 ff 01 00   ; $c258: 00 ff 01 00   Data
__c25c:     LDA $3e            ; $c25c: a5 3e     
            CMP #$5a           ; $c25e: c9 5a     
            BNE __c2a7         ; $c260: d0 45     
            LDA $3f            ; $c262: a5 3f     
            CMP #$a5           ; $c264: c9 a5     
            BNE __c2a7         ; $c266: d0 3f     
            LDA $41            ; $c268: a5 41     
            BEQ __c26f         ; $c26a: f0 03     
            JSR __ca81         ; $c26c: 20 81 ca  
__c26f:     JSR __c2b3         ; $c26f: 20 b3 c2  
            JSR __c2e5         ; $c272: 20 e5 c2  
            LDX #$01           ; $c275: a2 01     
            LDA $00,x          ; $c277: b5 00     
            INX                ; $c279: e8        
            STA $40            ; $c27a: 85 40     
            LDA $00,x          ; $c27c: b5 00     
            INX                ; $c27e: e8        
            STA $41            ; $c27f: 85 41     
            LDA $00,x          ; $c281: b5 00     
            INX                ; $c283: e8        
            STA $4a            ; $c284: 85 4a     
            LDA $00,x          ; $c286: b5 00     
            INX                ; $c288: e8        
            STA $77            ; $c289: 85 77     
            LDY #$71           ; $c28b: a0 71     
            JSR __c297         ; $c28d: 20 97 c2  
            LDY #$b1           ; $c290: a0 b1     
            JSR __c297         ; $c292: 20 97 c2  
            LDY #$44           ; $c295: a0 44     
__c297:     LDA #$04           ; $c297: a9 04     
            STA $00            ; $c299: 85 00     
__c29b:     LDA $00,x          ; $c29b: b5 00     
            INX                ; $c29d: e8        
            STA $0000,y        ; $c29e: 99 00 00  
            INY                ; $c2a1: c8        
            DEC $00            ; $c2a2: c6 00     
            BNE __c29b         ; $c2a4: d0 f5     
            RTS                ; $c2a6: 60        

;-------------------------------------------------------------------------------
__c2a7:     JSR __c2e5         ; $c2a7: 20 e5 c2  
            LDA #$02           ; $c2aa: a9 02     
            STA $45            ; $c2ac: 85 45     
            LDA #$01           ; $c2ae: a9 01     
            STA $77            ; $c2b0: 85 77     
            RTS                ; $c2b2: 60        

;-------------------------------------------------------------------------------
__c2b3:     LDX #$01           ; $c2b3: a2 01     
            LDA $40            ; $c2b5: a5 40     
            STA $00,x          ; $c2b7: 95 00     
            INX                ; $c2b9: e8        
            LDA $41            ; $c2ba: a5 41     
            STA $00,x          ; $c2bc: 95 00     
            INX                ; $c2be: e8        
            LDA $4a            ; $c2bf: a5 4a     
            STA $00,x          ; $c2c1: 95 00     
            INX                ; $c2c3: e8        
            LDA $77            ; $c2c4: a5 77     
            STA $00,x          ; $c2c6: 95 00     
            INX                ; $c2c8: e8        
            LDY #$71           ; $c2c9: a0 71     
            JSR __c2d5         ; $c2cb: 20 d5 c2  
            LDY #$b1           ; $c2ce: a0 b1     
            JSR __c2d5         ; $c2d0: 20 d5 c2  
            LDY #$44           ; $c2d3: a0 44     
__c2d5:     LDA #$04           ; $c2d5: a9 04     
            STA $00            ; $c2d7: 85 00     
__c2d9:     LDA $0000,y        ; $c2d9: b9 00 00  
            INY                ; $c2dc: c8        
            STA $00,x          ; $c2dd: 95 00     
            INX                ; $c2df: e8        
            DEC $00            ; $c2e0: c6 00     
            BNE __c2d9         ; $c2e2: d0 f5     
            RTS                ; $c2e4: 60        

;-------------------------------------------------------------------------------
__c2e5:     LDX #$20           ; $c2e5: a2 20     
            LDA #$00           ; $c2e7: a9 00     
__c2e9:     STA $00,x          ; $c2e9: 95 00     
            INX                ; $c2eb: e8        
            BNE __c2e9         ; $c2ec: d0 fb     
            RTS                ; $c2ee: 60        

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        php                ; $c2ef: 08        
            PHA                ; $c2f0: 48        
            TXA                ; $c2f1: 8a        
            PHA                ; $c2f2: 48        
            tya                ; $c2f3: 98        
            PHA                ; $c2f4: 48        
            LDA $20            ; $c2f5: a5 20     
            BEQ __c2fc         ; $c2f7: f0 03     
            JSR __f4f1         ; $c2f9: 20 f1 f4  
__c2fc:     INC $20            ; $c2fc: e6 20     
            PLA                ; $c2fe: 68        
            TAY                ; $c2ff: a8        
            PLA                ; $c300: 68        
            TAX                ; $c301: aa        
            PLA                ; $c302: 68        
            plp                ; $c303: 28        
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        rti                ; $c304: 40        

;-------------------------------------------------------------------------------
__c305:     LDA $2c            ; $c305: a5 2c     
            PHA                ; $c307: 48        
            LDY #$00           ; $c308: a0 00     
            STY $11            ; $c30a: 84 11     
            LDA ($1e),y        ; $c30c: b1 1e     
            INY                ; $c30e: c8        
            SEC                ; $c30f: 38        
            SBC $28            ; $c310: e5 28     
            STA $10            ; $c312: 85 10     
            LDA ($1e),y        ; $c314: b1 1e     
            INY                ; $c316: c8        
            SBC $29            ; $c317: e5 29     
            ASL $10            ; $c319: 06 10     
            ROL                ; $c31b: 2a        
            ASL $10            ; $c31c: 06 10     
            ROL                ; $c31e: 2a        
            ASL $10            ; $c31f: 06 10     
            ROL                ; $c321: 2a        
            BCC __c326         ; $c322: 90 02     
            DEC $11            ; $c324: c6 11     
__c326:     STA $10            ; $c326: 85 10     
            LDA ($1e),y        ; $c328: b1 1e     
            INY                ; $c32a: c8        
            STA $16            ; $c32b: 85 16     
            LDA ($1e),y        ; $c32d: b1 1e     
            INY                ; $c32f: c8        
            ASL $16            ; $c330: 06 16     
            ROL                ; $c332: 2a        
            ASL $16            ; $c333: 06 16     
            ROL                ; $c335: 2a        
            ASL $16            ; $c336: 06 16     
            ROL                ; $c338: 2a        
            STA $16            ; $c339: 85 16     
            JSR __c342         ; $c33b: 20 42 c3  
            PLA                ; $c33e: 68        
            CMP $2c            ; $c33f: c5 2c     
            RTS                ; $c341: 60        

;-------------------------------------------------------------------------------
__c342:     LDA ($1e),y        ; $c342: b1 1e     
            STA $15            ; $c344: 85 15     
            AND #$fe           ; $c346: 29 fe     
            TAX                ; $c348: aa        
            LDA __c356,x       ; $c349: bd 56 c3  
            STA $1c            ; $c34c: 85 1c     
            LDA __c357,x       ; $c34e: bd 57 c3  
            STA $1d            ; $c351: 85 1d     
            JMP ($001c)        ; $c353: 6c 1c 00  

;-------------------------------------------------------------------------------
__c356:     .hex 4f            ; $c356: 4f            Data
__c357:     .hex c1 c0 c3 a8   ; $c357: c1 c0 c3 a8   Data
            .hex c4 b0 c4 c6   ; $c35b: c4 b0 c4 c6   Data
            .hex c4 f5 c4 18   ; $c35f: c4 f5 c4 18   Data
            .hex c5 10 c5 21   ; $c363: c5 10 c5 21   Data
            .hex c5 a3 c5 b2   ; $c367: c5 a3 c5 b2   Data
            .hex c5 f6 c5 1e   ; $c36b: c5 f6 c5 1e   Data
            .hex c6 4f c1 87   ; $c36f: c6 4f c1 87   Data
            .hex c6 ac c6 c1   ; $c373: c6 ac c6 c1   Data
            .hex c6 7c c3 a7   ; $c377: c6 7c c3 a7   Data
            .hex c3 a9 ae 85   ; $c37b: c3 a9 ae 85   Data
            .hex 12 a9 00 85   ; $c37f: 12 a9 00 85   Data
            .hex 14 a9 03 85   ; $c383: 14 a9 03 85   Data
            .hex 13 a5 1e c9   ; $c387: 13 a5 1e c9   Data
            .hex 20 d0 04 a9   ; $c38b: 20 d0 04 a9   Data
            .hex 66 85 12 20   ; $c38f: 66 85 12 20   Data
            .hex 15 c4 a9 67   ; $c393: 15 c4 a9 67   Data
            .hex 85 12 a5 10   ; $c397: 85 12 a5 10   Data
            .hex 18 69 08 85   ; $c39b: 18 69 08 85   Data
            .hex 10 90 02 e6   ; $c39f: 10 90 02 e6   Data
            .hex 11 4c 15 c4   ; $c3a3: 11 4c 15 c4   Data
            .hex a0 07 b1 1e   ; $c3a7: a0 07 b1 1e   Data
            .hex 29 08 f0 10   ; $c3ab: 29 08 f0 10   Data
            .hex a9 06 4c 44   ; $c3af: a9 06 4c 44   Data
            .hex c3            ; $c3b3: c3            Data

;-------------------------------------------------------------------------------
__c3b4:     LDY #$05           ; $c3b4: a0 05     
            LDA ($1e),y        ; $c3b6: b1 1e     
            TAX                ; $c3b8: aa        
            LDA __c47c,x       ; $c3b9: bd 7c c4  
            STA $13            ; $c3bc: 85 13     
            TXA                ; $c3be: 8a        
            RTS                ; $c3bf: 60        

;-------------------------------------------------------------------------------
            JSR __c3b4         ; $c3c0: 20 b4 c3  
            ASL                ; $c3c3: 0a        
            ASL                ; $c3c4: 0a        
            STA $12            ; $c3c5: 85 12     
            LDY #$07           ; $c3c7: a0 07     
            LDA ($1e),y        ; $c3c9: b1 1e     
            LSR                ; $c3cb: 4a        
            LSR                ; $c3cc: 4a        
            AND #$03           ; $c3cd: 29 03     
            ORA $12            ; $c3cf: 05 12     
__c3d1:     TAX                ; $c3d1: aa        
            LDA __c480,x       ; $c3d2: bd 80 c4  
            STA $12            ; $c3d5: 85 12     
__c3d7:     LDY #$06           ; $c3d7: a0 06     
            LDA ($1e),y        ; $c3d9: b1 1e     
            bmi __c3e3         ; $c3db: 30 06     
            LDA $13            ; $c3dd: a5 13     
            EOR #$40           ; $c3df: 49 40     
            STA $13            ; $c3e1: 85 13     
__c3e3:     LDA $13            ; $c3e3: a5 13     
            ROL                ; $c3e5: 2a        
            ROL                ; $c3e6: 2a        
            ROL                ; $c3e7: 2a        
            AND #$03           ; $c3e8: 29 03     
            STA $14            ; $c3ea: 85 14     
__c3ec:     JSR __c401         ; $c3ec: 20 01 c4  
            LDA $10            ; $c3ef: a5 10     
            SEC                ; $c3f1: 38        
            SBC #$08           ; $c3f2: e9 08     
            STA $10            ; $c3f4: 85 10     
            BCS __c3fa         ; $c3f6: b0 02     
            DEC $11            ; $c3f8: c6 11     
__c3fa:     LDA $16            ; $c3fa: a5 16     
            CLC                ; $c3fc: 18        
            ADC #$08           ; $c3fd: 69 08     
            STA $16            ; $c3ff: 85 16     
__c401:     JSR __c40f         ; $c401: 20 0f c4  
            LDA $10            ; $c404: a5 10     
            CLC                ; $c406: 18        
            ADC #$08           ; $c407: 69 08     
            STA $10            ; $c409: 85 10     
            BCC __c40f         ; $c40b: 90 02     
            INC $11            ; $c40d: e6 11     
__c40f:     JSR __c415         ; $c40f: 20 15 c4  
            INC $12            ; $c412: e6 12     
            RTS                ; $c414: 60        

;-------------------------------------------------------------------------------
__c415:     LDA $11            ; $c415: a5 11     
            BNE __c454         ; $c417: d0 3b     
            LDA $10            ; $c419: a5 10     
            CMP #$f9           ; $c41b: c9 f9     
            BCS __c454         ; $c41d: b0 35     
            LDX $2c            ; $c41f: a6 2c     
            CPX #$34           ; $c421: e0 34     
            BCC __c433         ; $c423: 90 0e     
            LDA $21            ; $c425: a5 21     
            AND #$0f           ; $c427: 29 0f     
            TAY                ; $c429: a8        
            TXA                ; $c42a: 8a        
            EOR __c455,y       ; $c42b: 59 55 c4  
            CMP #$34           ; $c42e: c9 34     
            BCC __c433         ; $c430: 90 01     
            TAX                ; $c432: aa        
__c433:     LDA $16            ; $c433: a5 16     
            SEC                ; $c435: 38        
            SBC #$01           ; $c436: e9 01     
            STA $0700,x        ; $c438: 9d 00 07  
            LDA $12            ; $c43b: a5 12     
            EOR $14            ; $c43d: 45 14     
            STA $0701,x        ; $c43f: 9d 01 07  
            JSR __c465         ; $c442: 20 65 c4  
            STA $0702,x        ; $c445: 9d 02 07  
            LDA $10            ; $c448: a5 10     
            STA $0703,x        ; $c44a: 9d 03 07  
            LDA $2c            ; $c44d: a5 2c     
            CLC                ; $c44f: 18        
            ADC #$04           ; $c450: 69 04     
            STA $2c            ; $c452: 85 2c     
__c454:     RTS                ; $c454: 60        

;-------------------------------------------------------------------------------
__c455:     .hex 00 f0 20 d0   ; $c455: 00 f0 20 d0   Data
            .hex 40 b0 60 90   ; $c459: 40 b0 60 90   Data
            .hex 80 70 a0 50   ; $c45d: 80 70 a0 50   Data
            .hex c0 30 e0 10   ; $c461: c0 30 e0 10   Data

;-------------------------------------------------------------------------------
__c465:     LDA $7c            ; $c465: a5 7c     
            BNE __c479         ; $c467: d0 10     
            LDA $15            ; $c469: a5 15     
            LSR                ; $c46b: 4a        
            BCS __c474         ; $c46c: b0 06     
            LDA $16            ; $c46e: a5 16     
            CMP #$40           ; $c470: c9 40     
            BCS __c479         ; $c472: b0 05     
__c474:     LDA $13            ; $c474: a5 13     
            ORA #$20           ; $c476: 09 20     
            RTS                ; $c478: 60        

;-------------------------------------------------------------------------------
__c479:     LDA $13            ; $c479: a5 13     
            RTS                ; $c47b: 60        

;-------------------------------------------------------------------------------
__c47c:     .hex 00 02 02 01   ; $c47c: 00 02 02 01   Data
__c480:     .hex 04 00 04 00   ; $c480: 04 00 04 00   Data
            .hex 74 78 7c a4   ; $c484: 74 78 7c a4   Data
            .hex 34 38 34 30   ; $c488: 34 38 34 30   Data
            .hex 1c 18 1c 18   ; $c48c: 1c 18 1c 18   Data
            .hex 10 74 48 28   ; $c490: 10 74 48 28   Data
            .hex 08 0c 08 0c   ; $c494: 08 0c 08 0c   Data
            .hex 74 78 7c a4   ; $c498: 74 78 7c a4   Data
            .hex 40 44 40 44   ; $c49c: 40 44 40 44   Data
            .hex 20 24 20 24   ; $c4a0: 20 24 20 24   Data
            .hex 14 a8 4c 2c   ; $c4a4: 14 a8 4c 2c   Data

;-------------------------------------------------------------------------------
            JSR __c3b4         ; $c4a8: 20 b4 c3  
            ORA #$10           ; $c4ab: 09 10     
            JMP __c3d1         ; $c4ad: 4c d1 c3  

;-------------------------------------------------------------------------------
            JSR __c3b4         ; $c4b0: 20 b4 c3  
            ASL                ; $c4b3: 0a        
            ASL                ; $c4b4: 0a        
            ADC #$14           ; $c4b5: 69 14     
            STA $12            ; $c4b7: 85 12     
            LDY #$07           ; $c4b9: a0 07     
            LDA ($1e),y        ; $c4bb: b1 1e     
            AND #$0c           ; $c4bd: 29 0c     
            LSR                ; $c4bf: 4a        
            LSR                ; $c4c0: 4a        
            ORA $12            ; $c4c1: 05 12     
            JMP __c3d1         ; $c4c3: 4c d1 c3  

;-------------------------------------------------------------------------------
            LDA $21            ; $c4c6: a5 21     
            LSR                ; $c4c8: 4a        
            AND #$03           ; $c4c9: 29 03     
            STA $13            ; $c4cb: 85 13     
            LDA #$50           ; $c4cd: a9 50     
            STA $12            ; $c4cf: 85 12     
            LDY #$06           ; $c4d1: a0 06     
            LDA ($1e),y        ; $c4d3: b1 1e     
            bmi __c4dd         ; $c4d5: 30 06     
            LDA $13            ; $c4d7: a5 13     
            ORA #$40           ; $c4d9: 09 40     
            STA $13            ; $c4db: 85 13     
__c4dd:     JSR __c3e3         ; $c4dd: 20 e3 c3  
            LDA $10            ; $c4e0: a5 10     
            SEC                ; $c4e2: 38        
            SBC #$08           ; $c4e3: e9 08     
            STA $10            ; $c4e5: 85 10     
            BCS __c4eb         ; $c4e7: b0 02     
            DEC $11            ; $c4e9: c6 11     
__c4eb:     LDA $16            ; $c4eb: a5 16     
            CLC                ; $c4ed: 18        
            ADC #$08           ; $c4ee: 69 08     
            STA $16            ; $c4f0: 85 16     
            JMP __c3e3         ; $c4f2: 4c e3 c3  

;-------------------------------------------------------------------------------
            LDA #$3c           ; $c4f5: a9 3c     
            STA $12            ; $c4f7: 85 12     
            LDY #$05           ; $c4f9: a0 05     
            LDA ($1e),y        ; $c4fb: b1 1e     
            CMP #$01           ; $c4fd: c9 01     
            BNE __c509         ; $c4ff: d0 08     
            LDY #$41           ; $c501: a0 41     
            LDA $21            ; $c503: a5 21     
            AND #$10           ; $c505: 29 10     
            BNE __c50b         ; $c507: d0 02     
__c509:     LDY #$01           ; $c509: a0 01     
__c50b:     STY $13            ; $c50b: 84 13     
            JMP __c3e3         ; $c50d: 4c e3 c3  

;-------------------------------------------------------------------------------
            LDY #$07           ; $c510: a0 07     
            LDA ($1e),y        ; $c512: b1 1e     
            AND #$08           ; $c514: 29 08     
            BNE __c520         ; $c516: d0 08     
            JSR __c3b4         ; $c518: 20 b4 c3  
            ORA #$24           ; $c51b: 09 24     
            JMP __c3d1         ; $c51d: 4c d1 c3  

;-------------------------------------------------------------------------------
__c520:     RTS                ; $c520: 60        

;-------------------------------------------------------------------------------
            LDA $21            ; $c521: a5 21     
            LSR                ; $c523: 4a        
            AND #$03           ; $c524: 29 03     
            STA $13            ; $c526: 85 13     
            LDA #$00           ; $c528: a9 00     
            STA $14            ; $c52a: 85 14     
            LDY #$07           ; $c52c: a0 07     
            LDA ($1e),y        ; $c52e: b1 1e     
            php                ; $c530: 08        
            ASL                ; $c531: 0a        
            TAX                ; $c532: aa        
            JSR __c540         ; $c533: 20 40 c5  
            LDX #$28           ; $c536: a2 28     
            JSR __c540         ; $c538: 20 40 c5  
            plp                ; $c53b: 28        
            BPL __c562         ; $c53c: 10 24     
            LDX #$2c           ; $c53e: a2 2c     
__c540:     JSR __c543         ; $c540: 20 43 c5  
__c543:     JSR __c563         ; $c543: 20 63 c5  
            LDA $16            ; $c546: a5 16     
            CLC                ; $c548: 18        
            ADC #$08           ; $c549: 69 08     
            STA $16            ; $c54b: 85 16     
            JSR __c563         ; $c54d: 20 63 c5  
            LDA $16            ; $c550: a5 16     
            SEC                ; $c552: 38        
            SBC #$08           ; $c553: e9 08     
            STA $16            ; $c555: 85 16     
            LDA $10            ; $c557: a5 10     
            CLC                ; $c559: 18        
            ADC #$08           ; $c55a: 69 08     
            STA $10            ; $c55c: 85 10     
            BCC __c562         ; $c55e: 90 02     
            INC $11            ; $c560: e6 11     
__c562:     RTS                ; $c562: 60        

;-------------------------------------------------------------------------------
__c563:     LDA __c573,x       ; $c563: bd 73 c5  
            BEQ __c571         ; $c566: f0 09     
            STA $12            ; $c568: 85 12     
            STX $17            ; $c56a: 86 17     
            JSR __c415         ; $c56c: 20 15 c4  
            LDX $17            ; $c56f: a6 17     
__c571:     INX                ; $c571: e8        
            RTS                ; $c572: 60        

;-------------------------------------------------------------------------------
__c573:     .hex 00 00 58 5c   ; $c573: 00 00 58 5c   Data
            .hex 00 00 5e 5f   ; $c577: 00 00 5e 5f   Data
            .hex 00 00 58 64   ; $c57b: 00 00 58 64   Data
            .hex 5a 5b 58 5c   ; $c57f: 5a 5b 58 5c   Data
            .hex 5a 5b 62 63   ; $c583: 5a 5b 62 63   Data
            .hex 58 5c 58 59   ; $c587: 58 5c 58 59   Data
            .hex 58 5d 58 59   ; $c58b: 58 5d 58 59   Data
            .hex 5e 5f 58 59   ; $c58f: 5e 5f 58 59   Data
            .hex 60 61 58 59   ; $c593: 60 61 58 59   Data
            .hex 62 63 58 59   ; $c597: 62 63 58 59   Data
            .hex 58 59 58 59   ; $c59b: 58 59 58 59   Data
            .hex 00 65 58 5c   ; $c59f: 00 65 58 5c   Data

;-------------------------------------------------------------------------------
            LDA #$02           ; $c5a3: a9 02     
            STA $13            ; $c5a5: 85 13     
            LDA #$70           ; $c5a7: a9 70     
            STA $12            ; $c5a9: 85 12     
            LDA #$00           ; $c5ab: a9 00     
            STA $14            ; $c5ad: 85 14     
            JMP __c3ec         ; $c5af: 4c ec c3  

;-------------------------------------------------------------------------------
__c5b2:     LDA #$02           ; $c5b2: a9 02     
            STA $13            ; $c5b4: 85 13     
            LDA #$00           ; $c5b6: a9 00     
            STA $14            ; $c5b8: 85 14     
            LDA #$69           ; $c5ba: a9 69     
            STA $12            ; $c5bc: 85 12     
            LDA $10            ; $c5be: a5 10     
            SEC                ; $c5c0: 38        
            SBC #$08           ; $c5c1: e9 08     
            STA $10            ; $c5c3: 85 10     
            BCS __c5c9         ; $c5c5: b0 02     
            DEC $11            ; $c5c7: c6 11     
__c5c9:     LDA $16            ; $c5c9: a5 16     
            SEC                ; $c5cb: 38        
            SBC #$08           ; $c5cc: e9 08     
            STA $16            ; $c5ce: 85 16     
            JSR __c401         ; $c5d0: 20 01 c4  
            LDA $10            ; $c5d3: a5 10     
            SEC                ; $c5d5: 38        
            SBC #$08           ; $c5d6: e9 08     
            STA $10            ; $c5d8: 85 10     
            BCS __c5de         ; $c5da: b0 02     
            DEC $11            ; $c5dc: c6 11     
__c5de:     LDA $16            ; $c5de: a5 16     
            CLC                ; $c5e0: 18        
            ADC #$08           ; $c5e1: 69 08     
            STA $16            ; $c5e3: 85 16     
            JSR __c40f         ; $c5e5: 20 0f c4  
            LDA $10            ; $c5e8: a5 10     
            CLC                ; $c5ea: 18        
            ADC #$08           ; $c5eb: 69 08     
            STA $10            ; $c5ed: 85 10     
            BCC __c5f3         ; $c5ef: 90 02     
            INC $11            ; $c5f1: e6 11     
__c5f3:     JMP __c3ec         ; $c5f3: 4c ec c3  

;-------------------------------------------------------------------------------
            LDA #$00           ; $c5f6: a9 00     
            STA $13            ; $c5f8: 85 13     
            LDY #$07           ; $c5fa: a0 07     
            LDA ($1e),y        ; $c5fc: b1 1e     
            ASL                ; $c5fe: 0a        
            bmi __c614         ; $c5ff: 30 13     
            AND #$0c           ; $c601: 29 0c     
            ORA #$80           ; $c603: 09 80     
            STA $12            ; $c605: 85 12     
            LDA ($1e),y        ; $c607: b1 1e     
            AND #$08           ; $c609: 29 08     
            BEQ __c611         ; $c60b: f0 04     
            LDA #$c0           ; $c60d: a9 c0     
            STA $13            ; $c60f: 85 13     
__c611:     JMP __c3d7         ; $c611: 4c d7 c3  

;-------------------------------------------------------------------------------
__c614:     LSR                ; $c614: 4a        
            AND #$04           ; $c615: 29 04     
            ORA #$90           ; $c617: 09 90     
            STA $12            ; $c619: 85 12     
            JMP __c3d7         ; $c61b: 4c d7 c3  

;-------------------------------------------------------------------------------
            LDA #$02           ; $c61e: a9 02     
            STA $13            ; $c620: 85 13     
            LDA #$00           ; $c622: a9 00     
            STA $14            ; $c624: 85 14     
            LDA $21            ; $c626: a5 21     
            AND #$20           ; $c628: 29 20     
            BEQ __c63d         ; $c62a: f0 11     
            LDA #$e8           ; $c62c: a9 e8     
            STA $12            ; $c62e: 85 12     
            JSR __c64c         ; $c630: 20 4c c6  
            LDA $16            ; $c633: a5 16     
            SEC                ; $c635: 38        
            SBC #$08           ; $c636: e9 08     
            STA $16            ; $c638: 85 16     
            JMP __c415         ; $c63a: 4c 15 c4  

;-------------------------------------------------------------------------------
__c63d:     LDA #$dd           ; $c63d: a9 dd     
            STA $12            ; $c63f: 85 12     
            LDA $10            ; $c641: a5 10     
            SEC                ; $c643: 38        
            SBC #$06           ; $c644: e9 06     
            STA $10            ; $c646: 85 10     
            BCS __c64c         ; $c648: b0 02     
            DEC $11            ; $c64a: c6 11     
__c64c:     LDA #$03           ; $c64c: a9 03     
            STA $18            ; $c64e: 85 18     
__c650:     JSR __c65c         ; $c650: 20 5c c6  
            DEC $18            ; $c653: c6 18     
            BNE __c650         ; $c655: d0 f9     
            LDA #$02           ; $c657: a9 02     
            JMP __c65e         ; $c659: 4c 5e c6  

;-------------------------------------------------------------------------------
__c65c:     LDA #$03           ; $c65c: a9 03     
__c65e:     STA $17            ; $c65e: 85 17     
__c660:     JSR __c415         ; $c660: 20 15 c4  
            LDA $10            ; $c663: a5 10     
            CLC                ; $c665: 18        
            ADC #$08           ; $c666: 69 08     
            STA $10            ; $c668: 85 10     
            BCC __c66e         ; $c66a: 90 02     
            INC $11            ; $c66c: e6 11     
__c66e:     INC $12            ; $c66e: e6 12     
            DEC $17            ; $c670: c6 17     
            BNE __c660         ; $c672: d0 ec     
            LDA $10            ; $c674: a5 10     
            SEC                ; $c676: 38        
            SBC #$18           ; $c677: e9 18     
            STA $10            ; $c679: 85 10     
            BCS __c67f         ; $c67b: b0 02     
            DEC $11            ; $c67d: c6 11     
__c67f:     LDA $16            ; $c67f: a5 16     
            CLC                ; $c681: 18        
            ADC #$08           ; $c682: 69 08     
            STA $16            ; $c684: 85 16     
            RTS                ; $c686: 60        

;-------------------------------------------------------------------------------
            LDA #$02           ; $c687: a9 02     
            STA $13            ; $c689: 85 13     
            LDA #$00           ; $c68b: a9 00     
            STA $14            ; $c68d: 85 14     
            LDA #$f4           ; $c68f: a9 f4     
            STA $12            ; $c691: 85 12     
            LDA #$08           ; $c693: a9 08     
            STA $17            ; $c695: 85 17     
__c697:     JSR __c415         ; $c697: 20 15 c4  
            LDA $10            ; $c69a: a5 10     
            CLC                ; $c69c: 18        
            ADC #$08           ; $c69d: 69 08     
            STA $10            ; $c69f: 85 10     
            BCC __c6a5         ; $c6a1: 90 02     
            INC $11            ; $c6a3: e6 11     
__c6a5:     INC $12            ; $c6a5: e6 12     
            DEC $17            ; $c6a7: c6 17     
            BNE __c697         ; $c6a9: d0 ec     
            RTS                ; $c6ab: 60        

;-------------------------------------------------------------------------------
            LDY #$07           ; $c6ac: a0 07     
            LDA ($1e),y        ; $c6ae: b1 1e     
            CMP #$08           ; $c6b0: c9 08     
            LDA #$98           ; $c6b2: a9 98     
            BCC __c6b8         ; $c6b4: 90 02     
            LDA #$9c           ; $c6b6: a9 9c     
__c6b8:     STA $12            ; $c6b8: 85 12     
            LDA #$00           ; $c6ba: a9 00     
            STA $13            ; $c6bc: 85 13     
            JMP __c3d7         ; $c6be: 4c d7 c3  

;-------------------------------------------------------------------------------
            LDA $1e            ; $c6c1: a5 1e     
            CMP #$20           ; $c6c3: c9 20     
            BCC __c6cc         ; $c6c5: 90 05     
            BNE __c6d7         ; $c6c7: d0 0e     
            JMP __c5b2         ; $c6c9: 4c b2 c5  

;-------------------------------------------------------------------------------
__c6cc:     LDA #$a8           ; $c6cc: a9 a8     
            STA $12            ; $c6ce: 85 12     
            LDA #$02           ; $c6d0: a9 02     
            STA $13            ; $c6d2: 85 13     
            JMP __c3d7         ; $c6d4: 4c d7 c3  

;-------------------------------------------------------------------------------
__c6d7:     LDA #$2c           ; $c6d7: a9 2c     
            STA $12            ; $c6d9: 85 12     
            LDA #$01           ; $c6db: a9 01     
            STA $13            ; $c6dd: 85 13     
            JSR __c3d7         ; $c6df: 20 d7 c3  
            LDA $16            ; $c6e2: a5 16     
            SEC                ; $c6e4: 38        
            SBC #$10           ; $c6e5: e9 10     
            STA $16            ; $c6e7: 85 16     
            LDA #$ae           ; $c6e9: a9 ae     
            STA $12            ; $c6eb: 85 12     
            LDA #$03           ; $c6ed: a9 03     
            STA $13            ; $c6ef: 85 13     
            JSR __e84d         ; $c6f1: 20 4d e8  
            LDA #$67           ; $c6f4: a9 67     
            STA $12            ; $c6f6: 85 12     
            JMP __e84d         ; $c6f8: 4c 4d e8  

;-------------------------------------------------------------------------------
__c6fb:     LDY #$00           ; $c6fb: a0 00     
__c6fd:     LDA ($12),y        ; $c6fd: b1 12     
            BNE __c717         ; $c6ff: d0 16     
            INY                ; $c701: c8        
__c702:     LDA ($12),y        ; $c702: b1 12     
            BEQ __c716         ; $c704: f0 10     
            BPL __c70a         ; $c706: 10 02     
            DEC $11            ; $c708: c6 11     
__c70a:     INY                ; $c70a: c8        
            CLC                ; $c70b: 18        
            ADC $10            ; $c70c: 65 10     
            STA $10            ; $c70e: 85 10     
            BCC __c6fd         ; $c710: 90 eb     
            INC $11            ; $c712: e6 11     
            BCS __c6fd         ; $c714: b0 e7     
__c716:     RTS                ; $c716: 60        

;-------------------------------------------------------------------------------
__c717:     INY                ; $c717: c8        
            STA $15            ; $c718: 85 15     
            STA $16            ; $c71a: 85 16     
            JSR __c78e         ; $c71c: 20 8e c7  
__c71f:     LDA $14            ; $c71f: a5 14     
            bmi __c781         ; $c721: 30 5e     
            LDA $10            ; $c723: a5 10     
            STA $17            ; $c725: 85 17     
            LDA $11            ; $c727: a5 11     
            STA $18            ; $c729: 85 18     
            ASL $17            ; $c72b: 06 17     
            ROL $18            ; $c72d: 26 18     
            ASL $17            ; $c72f: 06 17     
            ROL                ; $c731: 2a        
            ASL $17            ; $c732: 06 17     
            ASL $17            ; $c734: 06 17     
            ROL $18            ; $c736: 26 18     
            ASL $17            ; $c738: 06 17     
            ROL $18            ; $c73a: 26 18     
            ASL $17            ; $c73c: 06 17     
            ROL $18            ; $c73e: 26 18     
            ASL $17            ; $c740: 06 17     
            ROL                ; $c742: 2a        
            AND #$03           ; $c743: 29 03     
            TAX                ; $c745: aa        
            LDA $14            ; $c746: a5 14     
            STA $17            ; $c748: 85 17     
            LDA #$03           ; $c74a: a9 03     
            INX                ; $c74c: e8        
            DEX                ; $c74d: ca        
            BEQ __c759         ; $c74e: f0 09     
__c750:     ASL                ; $c750: 0a        
            ASL                ; $c751: 0a        
            ASL $17            ; $c752: 06 17     
            ASL $17            ; $c754: 06 17     
            DEX                ; $c756: ca        
            BNE __c750         ; $c757: d0 f7     
__c759:     LDX $18            ; $c759: a6 18     
            EOR #$ff           ; $c75b: 49 ff     
            AND $0180,x        ; $c75d: 3d 80 01  
            ORA $17            ; $c760: 05 17     
            STA $0180,x        ; $c762: 9d 80 01  
            LSR $18            ; $c765: 46 18     
            LSR $18            ; $c767: 46 18     
            LSR $18            ; $c769: 46 18     
            TXA                ; $c76b: 8a        
            AND #$07           ; $c76c: 29 07     
            TAX                ; $c76e: aa        
            LDA #$01           ; $c76f: a9 01     
            INX                ; $c771: e8        
            DEX                ; $c772: ca        
            BEQ __c779         ; $c773: f0 04     
__c775:     ASL                ; $c775: 0a        
            DEX                ; $c776: ca        
            BNE __c775         ; $c777: d0 fc     
__c779:     LDX $18            ; $c779: a6 18     
            ORA $0170,x        ; $c77b: 1d 70 01  
            STA $0170,x        ; $c77e: 9d 70 01  
__c781:     INC $10            ; $c781: e6 10     
            BNE __c787         ; $c783: d0 02     
            INC $11            ; $c785: e6 11     
__c787:     DEC $16            ; $c787: c6 16     
            BNE __c71f         ; $c789: d0 94     
            JMP __c702         ; $c78b: 4c 02 c7  

;-------------------------------------------------------------------------------
__c78e:     LDA $2d            ; $c78e: a5 2d     
            BEQ __c7b4         ; $c790: f0 22     
            LDX $2a            ; $c792: a6 2a     
            LDA $10            ; $c794: a5 10     
            STA $0500,x        ; $c796: 9d 00 05  
            INX                ; $c799: e8        
            LDA $11            ; $c79a: a5 11     
            STA $0500,x        ; $c79c: 9d 00 05  
            INX                ; $c79f: e8        
            LDA $15            ; $c7a0: a5 15     
            STA $0500,x        ; $c7a2: 9d 00 05  
            INX                ; $c7a5: e8        
__c7a6:     LDA ($12),y        ; $c7a6: b1 12     
            INY                ; $c7a8: c8        
            STA $0500,x        ; $c7a9: 9d 00 05  
            INX                ; $c7ac: e8        
            DEC $15            ; $c7ad: c6 15     
            BNE __c7a6         ; $c7af: d0 f5     
            STX $2a            ; $c7b1: 86 2a     
            RTS                ; $c7b3: 60        

;-------------------------------------------------------------------------------
__c7b4:     LDA $11            ; $c7b4: a5 11     
            STA PPUADDR          ; $c7b6: 8d 06 20  
            LDA $10            ; $c7b9: a5 10     
            STA PPUADDR          ; $c7bb: 8d 06 20  
__c7be:     LDA ($12),y        ; $c7be: b1 12     
            INY                ; $c7c0: c8        
            STA PPUDATA          ; $c7c1: 8d 07 20  
            DEC $15            ; $c7c4: c6 15     
            BNE __c7be         ; $c7c6: d0 f6     
            RTS                ; $c7c8: 60        

;-------------------------------------------------------------------------------
__c7c9:     LDA #$00           ; $c7c9: a9 00     
            STA $12            ; $c7cb: 85 12     
            STA $13            ; $c7cd: 85 13     
            LDA #$c0           ; $c7cf: a9 c0     
            STA $10            ; $c7d1: 85 10     
            LDA #$23           ; $c7d3: a9 23     
            STA $11            ; $c7d5: 85 11     
            JSR __c7e2         ; $c7d7: 20 e2 c7  
            LDA #$c0           ; $c7da: a9 c0     
            STA $10            ; $c7dc: 85 10     
            LDA #$27           ; $c7de: a9 27     
            STA $11            ; $c7e0: 85 11     
__c7e2:     LDA #$08           ; $c7e2: a9 08     
            STA $14            ; $c7e4: 85 14     
__c7e6:     LDA #$08           ; $c7e6: a9 08     
            STA $15            ; $c7e8: 85 15     
__c7ea:     LDY $12            ; $c7ea: a4 12     
            LDA $0170,y        ; $c7ec: b9 70 01  
            BEQ __c803         ; $c7ef: f0 12     
            LSR                ; $c7f1: 4a        
            STA $0170,y        ; $c7f2: 99 70 01  
            BCC __c7fa         ; $c7f5: 90 03     
            JSR __c818         ; $c7f7: 20 18 c8  
__c7fa:     INC $10            ; $c7fa: e6 10     
            INC $13            ; $c7fc: e6 13     
            DEC $15            ; $c7fe: c6 15     
            JMP __c7ea         ; $c800: 4c ea c7  

;-------------------------------------------------------------------------------
__c803:     LDA $10            ; $c803: a5 10     
            CLC                ; $c805: 18        
            ADC $15            ; $c806: 65 15     
            STA $10            ; $c808: 85 10     
            LDA $13            ; $c80a: a5 13     
            CLC                ; $c80c: 18        
            ADC $15            ; $c80d: 65 15     
            STA $13            ; $c80f: 85 13     
            INC $12            ; $c811: e6 12     
            DEC $14            ; $c813: c6 14     
            BNE __c7e6         ; $c815: d0 cf     
            RTS                ; $c817: 60        

;-------------------------------------------------------------------------------
__c818:     LDA $2d            ; $c818: a5 2d     
            BEQ __c83c         ; $c81a: f0 20     
            LDX $2a            ; $c81c: a6 2a     
            LDA $10            ; $c81e: a5 10     
            STA $0500,x        ; $c820: 9d 00 05  
            INX                ; $c823: e8        
            LDA $11            ; $c824: a5 11     
            STA $0500,x        ; $c826: 9d 00 05  
            INX                ; $c829: e8        
            LDA #$01           ; $c82a: a9 01     
            STA $0500,x        ; $c82c: 9d 00 05  
            INX                ; $c82f: e8        
            LDY $13            ; $c830: a4 13     
            LDA $0180,y        ; $c832: b9 80 01  
            STA $0500,x        ; $c835: 9d 00 05  
            INX                ; $c838: e8        
            STX $2a            ; $c839: 86 2a     
            RTS                ; $c83b: 60        

;-------------------------------------------------------------------------------
__c83c:     LDA $11            ; $c83c: a5 11     
            STA PPUADDR          ; $c83e: 8d 06 20  
            LDA $10            ; $c841: a5 10     
            STA PPUADDR          ; $c843: 8d 06 20  
            LDY $13            ; $c846: a4 13     
            LDA $0180,y        ; $c848: b9 80 01  
            STA PPUDATA          ; $c84b: 8d 07 20  
            RTS                ; $c84e: 60        

;-------------------------------------------------------------------------------
__c84f:     LDA #$00           ; $c84f: a9 00     
            STA $42            ; $c851: 85 42     
            JSR __f4bf         ; $c853: 20 bf f4  
            LDA $41            ; $c856: a5 41     
            BEQ __c85d         ; $c858: f0 03     
            JSR __ca81         ; $c85a: 20 81 ca  
__c85d:     STA $75            ; $c85d: 85 75     
            LDA #$02           ; $c85f: a9 02     
            STA $76            ; $c861: 85 76     
            LDA #$ff           ; $c863: a9 ff     
            STA $48            ; $c865: 85 48     
            LDA #$07           ; $c867: a9 07     
            STA $49            ; $c869: 85 49     
            LDA #$03           ; $c86b: a9 03     
            STA $70            ; $c86d: 85 70     
            LDX #$20           ; $c86f: a2 20     
            LDA #$00           ; $c871: a9 00     
__c873:     STA $70,x          ; $c873: 95 70     
            INX                ; $c875: e8        
            CPX #$40           ; $c876: e0 40     
            BNE __c873         ; $c878: d0 f9     
            JSR __c241         ; $c87a: 20 41 c2  
            JSR __cbb1         ; $c87d: 20 b1 cb  
            JSR __c239         ; $c880: 20 39 c2  
            LDA #$00           ; $c883: a9 00     
            STA $28            ; $c885: 85 28     
            STA $29            ; $c887: 85 29     
            JSR __cd2b         ; $c889: 20 2b cd  
            LDA #$f0           ; $c88c: a9 f0     
            STA $0f            ; $c88e: 85 0f     
__c890:     JSR __c141         ; $c890: 20 41 c1  
            JSR __cd3e         ; $c893: 20 3e cd  
            nop                ; $c896: ea        
            nop                ; $c897: ea        
            nop                ; $c898: ea        
            JSR __d73e         ; $c899: 20 3e d7  
            LDA $25            ; $c89c: a5 25     
            AND #$03           ; $c89e: 29 03     
            CMP #$01           ; $c8a0: c9 01     
            BEQ __c8ab         ; $c8a2: f0 07     
            DEC $0f            ; $c8a4: c6 0f     
            BNE __c890         ; $c8a6: d0 e8     
            JMP __ff65         ; $c8a8: 4c 65 ff  

;-------------------------------------------------------------------------------
__c8ab:     LDA #$01           ; $c8ab: a9 01     
            STA $42            ; $c8ad: 85 42     
            LDA $4a            ; $c8af: a5 4a     
            STA $40            ; $c8b1: 85 40     
            LDA #$00           ; $c8b3: a9 00     
            STA $41            ; $c8b5: 85 41     
            STA $71            ; $c8b7: 85 71     
            STA $72            ; $c8b9: 85 72     
            STA $73            ; $c8bb: 85 73     
            STA $74            ; $c8bd: 85 74     
            STA $7a            ; $c8bf: 85 7a     
            STA $7d            ; $c8c1: 85 7d     
            LDA #$01           ; $c8c3: a9 01     
            STA $77            ; $c8c5: 85 77     
            LDX #$00           ; $c8c7: a2 00     
__c8c9:     LDA $70,x          ; $c8c9: b5 70     
            STA $b0,x          ; $c8cb: 95 b0     
            INX                ; $c8cd: e8        
            CPX #$20           ; $c8ce: e0 20     
            BNE __c8c9         ; $c8d0: d0 f7     
            DEC $70            ; $c8d2: c6 70     
            JSR __caa7         ; $c8d4: 20 a7 ca  
            JSR __c241         ; $c8d7: 20 41 c2  
            JSR __cd49         ; $c8da: 20 49 cd  
            JSR __e35b         ; $c8dd: 20 5b e3  
            JSR __e5c5         ; $c8e0: 20 c5 e5  
            JSR __e862         ; $c8e3: 20 62 e8  
            JSR __f001         ; $c8e6: 20 01 f0  
            JSR __c239         ; $c8e9: 20 39 c2  
            LDX #$00           ; $c8ec: a2 00     
__c8ee:     LDA $0200,x        ; $c8ee: bd 00 02  
            STA $0300,x        ; $c8f1: 9d 00 03  
            INX                ; $c8f4: e8        
            BNE __c8ee         ; $c8f5: d0 f7     
            LDX #$01           ; $c8f7: a2 01     
__c8f9:     LDA $70,x          ; $c8f9: b5 70     
            STA $b0,x          ; $c8fb: 95 b0     
            INX                ; $c8fd: e8        
            CPX #$40           ; $c8fe: e0 40     
            BNE __c8f9         ; $c900: d0 f7     
__c902:     JSR __f3c1         ; $c902: 20 c1 f3  
            JSR __d7f1         ; $c905: 20 f1 d7  
            JSR __d846         ; $c908: 20 46 d8  
            LDA #$00           ; $c90b: a9 00     
            STA $4b            ; $c90d: 85 4b     
            STA $4f            ; $c90f: 85 4f     
            STA $31            ; $c911: 85 31     
            LDA #$3c           ; $c913: a9 3c     
            STA $0f            ; $c915: 85 0f     
__c917:     JSR __c141         ; $c917: 20 41 c1  
            JSR __cb60         ; $c91a: 20 60 cb  
            JSR __cb02         ; $c91d: 20 02 cb  
            LDA __cba6         ; $c920: ad a6 cb  
            STA $1e            ; $c923: 85 1e     
            LDA __cba7         ; $c925: ad a7 cb  
            STA $1f            ; $c928: 85 1f     
            JSR __cb3b         ; $c92a: 20 3b cb  
            DEC $0f            ; $c92d: c6 0f     
            BNE __c917         ; $c92f: d0 e6     
            LDA #$02           ; $c931: a9 02     
            STA $040f          ; $c933: 8d 0f 04  
            LDX #$20           ; $c936: a2 20     
__c938:     LDA #$02           ; $c938: a9 02     
            STA $040f,x        ; $c93a: 9d 0f 04  
            TXA                ; $c93d: 8a        
            CLC                ; $c93e: 18        
            ADC #$10           ; $c93f: 69 10     
            TAX                ; $c941: aa        
            CPX $68            ; $c942: e4 68     
            BNE __c938         ; $c944: d0 f2     
__c946:     JSR __c141         ; $c946: 20 41 c1  
            LDA $60            ; $c949: a5 60     
            CMP #$01           ; $c94b: c9 01     
            BEQ __c961         ; $c94d: f0 12     
            CMP #$03           ; $c94f: c9 03     
            BNE __c959         ; $c951: d0 06     
            LDA $61            ; $c953: a5 61     
            CMP #$3c           ; $c955: c9 3c     
            BNE __c961         ; $c957: d0 08     
__c959:     LDA #$01           ; $c959: a9 01     
            STA $0613          ; $c95b: 8d 13 06  
            STA $0614          ; $c95e: 8d 14 06  
__c961:     JSR __cb60         ; $c961: 20 60 cb  
            JSR __f2e6         ; $c964: 20 e6 f2  
            LDA $4f            ; $c967: a5 4f     
            BNE __c972         ; $c969: d0 07     
            LDA $4b            ; $c96b: a5 4b     
            BEQ __c946         ; $c96d: f0 d7     
            JMP __ca28         ; $c96f: 4c 28 ca  

;-------------------------------------------------------------------------------
__c972:     JSR __c141         ; $c972: 20 41 c1  
            JSR __cb60         ; $c975: 20 60 cb  
            LDA $04a5          ; $c978: ad a5 04  
            ORA $04ad          ; $c97b: 0d ad 04  
            BNE __c972         ; $c97e: d0 f2     
            LDA #$b4           ; $c980: a9 b4     
            STA $0f            ; $c982: 85 0f     
__c984:     JSR __c141         ; $c984: 20 41 c1  
            LDA $0f            ; $c987: a5 0f     
            CMP #$78           ; $c989: c9 78     
            BNE __c995         ; $c98b: d0 08     
            LDA #$01           ; $c98d: a9 01     
            STA $0611          ; $c98f: 8d 11 06  
            STA $0612          ; $c992: 8d 12 06  
__c995:     JSR __cb60         ; $c995: 20 60 cb  
            DEC $0f            ; $c998: c6 0f     
            BNE __c984         ; $c99a: d0 e8     
            JSR __f4bf         ; $c99c: 20 bf f4  
__c99f:     JSR __d6e8         ; $c99f: 20 e8 d6  
            JSR __caa7         ; $c9a2: 20 a7 ca  
            LDX #$20           ; $c9a5: a2 20     
            LDA #$00           ; $c9a7: a9 00     
__c9a9:     STA $70,x          ; $c9a9: 95 70     
            INX                ; $c9ab: e8        
            CPX #$40           ; $c9ac: e0 40     
            BNE __c9a9         ; $c9ae: d0 f9     
            JSR __c241         ; $c9b0: 20 41 c2  
            JSR __cd49         ; $c9b3: 20 49 cd  
            JSR __e35b         ; $c9b6: 20 5b e3  
            LDA $7c            ; $c9b9: a5 7c     
            BNE __c9cf         ; $c9bb: d0 12     
            JSR __e5c5         ; $c9bd: 20 c5 e5  
            JSR __e862         ; $c9c0: 20 62 e8  
            JSR __f001         ; $c9c3: 20 01 f0  
            JSR __ef17         ; $c9c6: 20 17 ef  
            JSR __c239         ; $c9c9: 20 39 c2  
            JMP __c902         ; $c9cc: 4c 02 c9  

;-------------------------------------------------------------------------------
__c9cf:     JSR __f3c1         ; $c9cf: 20 c1 f3  
            JSR __f13a         ; $c9d2: 20 3a f1  
            JSR __c239         ; $c9d5: 20 39 c2  
            JSR __d80b         ; $c9d8: 20 0b d8  
            JSR __d8c0         ; $c9db: 20 c0 d8  
            LDA #$00           ; $c9de: a9 00     
            STA $4b            ; $c9e0: 85 4b     
            STA $4f            ; $c9e2: 85 4f     
            LDA #$ac           ; $c9e4: a9 ac     
            STA $0f            ; $c9e6: 85 0f     
            LDA #$08           ; $c9e8: a9 08     
            STA $0e            ; $c9ea: 85 0e     
__c9ec:     JSR __c141         ; $c9ec: 20 41 c1  
            JSR __cb7b         ; $c9ef: 20 7b cb  
            LDA $4b            ; $c9f2: a5 4b     
            BEQ __c9fe         ; $c9f4: f0 08     
            LDA $042f          ; $c9f6: ad 2f 04  
            ORA $043f          ; $c9f9: 0d 3f 04  
            BEQ __ca11         ; $c9fc: f0 13     
__c9fe:     LDA $4f            ; $c9fe: a5 4f     
            BNE __ca11         ; $ca00: d0 0f     
            LDA $0f            ; $ca02: a5 0f     
            SEC                ; $ca04: 38        
            SBC #$01           ; $ca05: e9 01     
            STA $0f            ; $ca07: 85 0f     
            BCS __ca0d         ; $ca09: b0 02     
            DEC $0e            ; $ca0b: c6 0e     
__ca0d:     ORA $0e            ; $ca0d: 05 0e     
            BNE __c9ec         ; $ca0f: d0 db     
__ca11:     LDA #$1e           ; $ca11: a9 1e     
            STA $0f            ; $ca13: 85 0f     
__ca15:     JSR __c141         ; $ca15: 20 41 c1  
            JSR __d71c         ; $ca18: 20 1c d7  
            DEC $0f            ; $ca1b: c6 0f     
            BNE __ca15         ; $ca1d: d0 f6     
            JSR __f4bf         ; $ca1f: 20 bf f4  
            JSR __ce1a         ; $ca22: 20 1a ce  
            JMP __c99f         ; $ca25: 4c 9f c9  

;-------------------------------------------------------------------------------
__ca28:     JSR __c141         ; $ca28: 20 41 c1  
            JSR __cb60         ; $ca2b: 20 60 cb  
            LDA $040f          ; $ca2e: ad 0f 04  
            BNE __ca28         ; $ca31: d0 f5     
            LDA $40            ; $ca33: a5 40     
            BNE __ca41         ; $ca35: d0 0a     
            LDA $70            ; $ca37: a5 70     
            BNE __ca67         ; $ca39: d0 2c     
            JSR __cac3         ; $ca3b: 20 c3 ca  
            JMP __c84f         ; $ca3e: 4c 4f c8  

;-------------------------------------------------------------------------------
__ca41:     LDA $70            ; $ca41: a5 70     
            BNE __ca60         ; $ca43: d0 1b     
            JSR __cab4         ; $ca45: 20 b4 ca  
            LDA $b0            ; $ca48: a5 b0     
            BNE __ca64         ; $ca4a: d0 18     
            LDA #$3c           ; $ca4c: a9 3c     
            STA $0f            ; $ca4e: 85 0f     
__ca50:     JSR __c141         ; $ca50: 20 41 c1  
            JSR __cb31         ; $ca53: 20 31 cb  
            JSR __d71c         ; $ca56: 20 1c d7  
            DEC $0f            ; $ca59: c6 0f     
            BNE __ca50         ; $ca5b: d0 f3     
            JMP __c84f         ; $ca5d: 4c 4f c8  

;-------------------------------------------------------------------------------
__ca60:     LDA $b0            ; $ca60: a5 b0     
            BEQ __ca67         ; $ca62: f0 03     
__ca64:     JSR __ca81         ; $ca64: 20 81 ca  
__ca67:     DEC $70            ; $ca67: c6 70     
            JSR __caa7         ; $ca69: 20 a7 ca  
            JSR __c241         ; $ca6c: 20 41 c2  
            JSR __cd49         ; $ca6f: 20 49 cd  
            JSR __e35b         ; $ca72: 20 5b e3  
            JSR __e614         ; $ca75: 20 14 e6  
            JSR __e8b2         ; $ca78: 20 b2 e8  
            JSR __c239         ; $ca7b: 20 39 c2  
            JMP __c902         ; $ca7e: 4c 02 c9  

;-------------------------------------------------------------------------------
__ca81:     LDA $41            ; $ca81: a5 41     
            EOR #$01           ; $ca83: 49 01     
            STA $41            ; $ca85: 85 41     
            LDX #$00           ; $ca87: a2 00     
__ca89:     LDA $0200,x        ; $ca89: bd 00 02  
            LDY $0300,x        ; $ca8c: bc 00 03  
            STA $0300,x        ; $ca8f: 9d 00 03  
            tya                ; $ca92: 98        
            STA $0200,x        ; $ca93: 9d 00 02  
            INX                ; $ca96: e8        
            BNE __ca89         ; $ca97: d0 f0     
__ca99:     LDA $70,x          ; $ca99: b5 70     
            LDY $b0,x          ; $ca9b: b4 b0     
            STA $b0,x          ; $ca9d: 95 b0     
            STY $70,x          ; $ca9f: 94 70     
            INX                ; $caa1: e8        
            CPX #$40           ; $caa2: e0 40     
            BNE __ca99         ; $caa4: d0 f3     
            RTS                ; $caa6: 60        

;-------------------------------------------------------------------------------
__caa7:     LDA #$00           ; $caa7: a9 00     
            LDX #$00           ; $caa9: a2 00     
__caab:     STA $0400,x        ; $caab: 9d 00 04  
            INX                ; $caae: e8        
            CPX #$c0           ; $caaf: e0 c0     
            BNE __caab         ; $cab1: d0 f8     
            RTS                ; $cab3: 60        

;-------------------------------------------------------------------------------
__cab4:     LDA $b0            ; $cab4: a5 b0     
            BEQ __cac3         ; $cab6: f0 0b     
            LDA #$78           ; $cab8: a9 78     
            STA $0f            ; $caba: 85 0f     
            LDA #$00           ; $cabc: a9 00     
            STA $0e            ; $cabe: 85 0e     
            JMP __cada         ; $cac0: 4c da ca  

;-------------------------------------------------------------------------------
__cac3:     LDA #$01           ; $cac3: a9 01     
            STA $0615          ; $cac5: 8d 15 06  
            STA $0616          ; $cac8: 8d 16 06  
            STA $0617          ; $cacb: 8d 17 06  
            LDA #$00           ; $cace: a9 00     
            STA $42            ; $cad0: 85 42     
            LDA #$a4           ; $cad2: a9 a4     
            STA $0f            ; $cad4: 85 0f     
            LDA #$01           ; $cad6: a9 01     
            STA $0e            ; $cad8: 85 0e     
__cada:     JSR __c141         ; $cada: 20 41 c1  
            LDA $40            ; $cadd: a5 40     
            BEQ __cae4         ; $cadf: f0 03     
            JSR __cb02         ; $cae1: 20 02 cb  
__cae4:     JSR __cb31         ; $cae4: 20 31 cb  
            JSR __d71c         ; $cae7: 20 1c d7  
            LDA $25            ; $caea: a5 25     
            AND #$03           ; $caec: 29 03     
            CMP #$01           ; $caee: c9 01     
            BEQ __cb01         ; $caf0: f0 0f     
            LDA $0f            ; $caf2: a5 0f     
            SEC                ; $caf4: 38        
            SBC #$01           ; $caf5: e9 01     
            STA $0f            ; $caf7: 85 0f     
            BCS __cafd         ; $caf9: b0 02     
            DEC $0e            ; $cafb: c6 0e     
__cafd:     ORA $0e            ; $cafd: 05 0e     
            BNE __cada         ; $caff: d0 d9     
__cb01:     RTS                ; $cb01: 60        

;-------------------------------------------------------------------------------
__cb02:     LDA __cb8a         ; $cb02: ad 8a cb  
            STA $1e            ; $cb05: 85 1e     
            LDA __cb8b         ; $cb07: ad 8b cb  
            STA $1f            ; $cb0a: 85 1f     
            JSR __cb3b         ; $cb0c: 20 3b cb  
            LDA $41            ; $cb0f: a5 41     
            CLC                ; $cb11: 18        
            ADC #$d6           ; $cb12: 69 d6     
__cb14:     BEQ __cb25         ; $cb14: f0 0f     
            STA $12            ; $cb16: 85 12     
            LDA #$02           ; $cb18: a9 02     
            STA $13            ; $cb1a: 85 13     
            LDA #$00           ; $cb1c: a9 00     
            STA $14            ; $cb1e: 85 14     
            STA $15            ; $cb20: 85 15     
            JSR __c415         ; $cb22: 20 15 c4  
__cb25:     LDA $10            ; $cb25: a5 10     
            CLC                ; $cb27: 18        
            ADC #$08           ; $cb28: 69 08     
            STA $10            ; $cb2a: 85 10     
            BNE __cb30         ; $cb2c: d0 02     
            INC $11            ; $cb2e: e6 11     
__cb30:     RTS                ; $cb30: 60        

;-------------------------------------------------------------------------------
__cb31:     LDA __cb97         ; $cb31: ad 97 cb  
            STA $1e            ; $cb34: 85 1e     
            LDA __cb98         ; $cb36: ad 98 cb  
            STA $1f            ; $cb39: 85 1f     
__cb3b:     LDY #$00           ; $cb3b: a0 00     
            LDA ($1e),y        ; $cb3d: b1 1e     
            INY                ; $cb3f: c8        
            STA $10            ; $cb40: 85 10     
            LDA ($1e),y        ; $cb42: b1 1e     
            INY                ; $cb44: c8        
            STA $11            ; $cb45: 85 11     
            LDA ($1e),y        ; $cb47: b1 1e     
            INY                ; $cb49: c8        
            STA $16            ; $cb4a: 85 16     
            LDA ($1e),y        ; $cb4c: b1 1e     
            INY                ; $cb4e: c8        
            STA $18            ; $cb4f: 85 18     
__cb51:     LDA ($1e),y        ; $cb51: b1 1e     
            STY $17            ; $cb53: 84 17     
            JSR __cb14         ; $cb55: 20 14 cb  
            LDY $17            ; $cb58: a4 17     
            INY                ; $cb5a: c8        
            DEC $18            ; $cb5b: c6 18     
            BNE __cb51         ; $cb5d: d0 f2     
            RTS                ; $cb5f: 60        

;-------------------------------------------------------------------------------
__cb60:     JSR __e3fe         ; $cb60: 20 fe e3  
            JSR __d8d8         ; $cb63: 20 d8 d8  
            JSR __ed4e         ; $cb66: 20 4e ed  
            JSR __ef3f         ; $cb69: 20 3f ef  
            JSR __e634         ; $cb6c: 20 34 e6  
            JSR __e8cc         ; $cb6f: 20 cc e8  
            JSR __f04d         ; $cb72: 20 4d f0  
            JSR __d71c         ; $cb75: 20 1c d7  
            JMP __d5ab         ; $cb78: 4c ab d5  

;-------------------------------------------------------------------------------
__cb7b:     JSR __e3fe         ; $cb7b: 20 fe e3  
            JSR __d8d8         ; $cb7e: 20 d8 d8  
            JSR __f18f         ; $cb81: 20 8f f1  
            JSR __d71c         ; $cb84: 20 1c d7  
            JMP __d5ab         ; $cb87: 4c ab d5  

;-------------------------------------------------------------------------------
__cb8a:     .hex 8c            ; $cb8a: 8c            Data
__cb8b:     .hex cb 58 00 78   ; $cb8b: cb 58 00 78   Data
            .hex 07 d0 d1 d2   ; $cb8f: 07 d0 d1 d2   Data
            .hex d3 d4 d5 00   ; $cb93: d3 d4 d5 00   Data
__cb97:     .hex 99            ; $cb97: 99            Data
__cb98:     .hex cb 58 00 88   ; $cb98: cb 58 00 88   Data
            .hex 09 d8 d2 d9   ; $cb9c: 09 d8 d2 d9   Data
            .hex d4 00 da db   ; $cba0: d4 00 da db   Data
            .hex d4 d5         ; $cba4: d4 d5         Data
__cba6:     .hex a8            ; $cba6: a8            Data
__cba7:     .hex cb 60 00 88   ; $cba7: cb 60 00 88   Data
            .hex 05 d5 d4 d2   ; $cbab: 05 d5 d4 d2   Data
            .hex ca d3         ; $cbaf: ca d3         Data
__cbb1:     JSR __cbf5         ; $cbb1: 20 f5 cb  
            LDY #$02           ; $cbb4: a0 02     
            JSR __cc15         ; $cbb6: 20 15 cc  
            LDY #$00           ; $cbb9: a0 00     
            JSR __d5d9         ; $cbbb: 20 d9 d5  
            LDY #$04           ; $cbbe: a0 04     
            JSR __d5d9         ; $cbc0: 20 d9 d5  
            LDY #$08           ; $cbc3: a0 08     
            JSR __d5d9         ; $cbc5: 20 d9 d5  
            LDA #$b0           ; $cbc8: a9 b0     
            STA $10            ; $cbca: 85 10     
            LDY #$00           ; $cBCC: a0 00     
__cbce:     LDX #$14           ; $cbce: a2 14     
            LDA __cbee,y       ; $cbd0: b9 ee cb  
            STA PPUADDR          ; $cbd3: 8d 06 20  
            LDA __cbed,y       ; $cbd6: b9 ed cb  
            STA PPUADDR          ; $cbd9: 8d 06 20  
__cbdc:     LDA $10            ; $cbdc: a5 10     
            STA PPUDATA          ; $cbde: 8d 07 20  
            INC $10            ; $cbe1: e6 10     
            DEX                ; $cbe3: ca        
            BNE __cbdc         ; $cbe4: d0 f6     
            INY                ; $cbe6: c8        
            INY                ; $cbe7: c8        
            CPY #$08           ; $cbe8: c0 08     
            BNE __cbce         ; $cbea: d0 e2     
            RTS                ; $cbec: 60        

;-------------------------------------------------------------------------------
__cbed:     .hex 07            ; $cbed: 07            Data
__cbee:     .hex 21 27 21 47   ; $cbee: 21 27 21 47   Data
            .hex 21 67 21      ; $cbf2: 21 67 21      Data

;-------------------------------------------------------------------------------
__cbf5:     LDA #$00           ; $cbf5: a9 00     
            STA $2a            ; $cbf7: 85 2a     
            STA $2b            ; $cbf9: 85 2b     
            LDA #$20           ; $cbfb: a9 20     
            STA PPUADDR          ; $cbfd: 8d 06 20  
            LDA #$00           ; $cc00: a9 00     
            STA PPUADDR          ; $cc02: 8d 06 20  
            LDA #$00           ; $cc05: a9 00     
            LDY #$08           ; $cc07: a0 08     
            LDX #$00           ; $cc09: a2 00     
__cc0b:     STA PPUDATA          ; $cc0b: 8d 07 20  
            DEX                ; $cc0e: ca        
            BNE __cc0b         ; $cc0f: d0 fa     
            DEY                ; $cc11: 88        
            BNE __cc0b         ; $cc12: d0 f7     
__cc14:     RTS                ; $cc14: 60        

;-------------------------------------------------------------------------------
__cc15:     LDA __cc41,y       ; $cc15: b9 41 cc  
            STA $10            ; $cc18: 85 10     
            LDA __cc42,y       ; $cc1a: b9 42 cc  
            STA $11            ; $cc1d: 85 11     
            LDY #$00           ; $cc1f: a0 00     
__cc21:     LDA ($10),y        ; $cc21: b1 10     
            BEQ __cc14         ; $cc23: f0 ef     
            INY                ; $cc25: c8        
            STA $12            ; $cc26: 85 12     
            LDA ($10),y        ; $cc28: b1 10     
            INY                ; $cc2a: c8        
            TAX                ; $cc2b: aa        
            LDA ($10),y        ; $cc2c: b1 10     
            INY                ; $cc2e: c8        
            STA PPUADDR          ; $cc2f: 8d 06 20  
            STX PPUADDR          ; $cc32: 8e 06 20  
__cc35:     LDA ($10),y        ; $cc35: b1 10     
            INY                ; $cc37: c8        
            STA PPUDATA          ; $cc38: 8d 07 20  
            DEC $12            ; $cc3b: c6 12     
            BNE __cc35         ; $cc3d: d0 f6     
            BEQ __cc21         ; $cc3f: f0 e0     

;-------------------------------------------------------------------------------
__cc41:     .hex 4b            ; $cc41: 4b            Data
__cc42:     .hex cc 60 cc ef   ; $cc42: cc 60 cc ef   Data
            .hex cc 03 cd 17   ; $cc46: cc 03 cd 17   Data
            .hex cd 11 4b 20   ; $cc4a: cd 11 4b 20   Data
            .hex a0 a1 a2 a3   ; $cc4e: a0 a1 a2 a3   Data
            .hex a4 a5 a6 a7   ; $cc52: a4 a5 a6 a7   Data
            .hex 00 00 00 ac   ; $cc56: 00 00 00 ac   Data
            .hex ad 00 00 00   ; $cc5a: ad 00 00 00   Data
            .hex ae 00 20 00   ; $cc5e: ae 00 20 00   Data
            .hex 3f 0f 30 16   ; $cc62: 3f 0f 30 16   Data
            .hex 21 0f 16 17   ; $cc66: 21 0f 16 17   Data
            .hex 13 0f 27 29   ; $cc6a: 13 0f 27 29   Data
            .hex 13 0f 29 21   ; $cc6e: 13 0f 29 21   Data
            .hex 13 0f 10 11   ; $cc72: 13 0f 10 11   Data
            .hex 36 0f 25 11   ; $cc76: 36 0f 25 11   Data
            .hex 27 0f 16 11   ; $cc7a: 27 0f 16 11   Data
            .hex 36 0f 30 30   ; $cc7e: 36 0f 30 30   Data
            .hex 30 06 d1 23   ; $cc82: 30 06 d1 23   Data
            .hex 55 55 55 aa   ; $cc86: 55 55 55 aa   Data
            .hex ff ff 15 45   ; $cc8a: ff ff 15 45   Data
            .hex 20 a8 aa ab   ; $cc8e: 20 a8 aa ab   Data
            .hex 00 00 00 a0   ; $cc92: 00 00 00 a0   Data
            .hex a1 a2 a3 a4   ; $cc96: a1 a2 a3 a4   Data
            .hex a5 a6 a7 00   ; $cc9a: a5 a6 a7 00   Data
            .hex 00 00 00 a9   ; $cc9e: 00 00 00 a9   Data
            .hex aa ab 08 eb   ; $cca2: aa ab 08 eb   Data
            .hex 21 02 00 1a   ; $cca6: 21 02 00 1a   Data
            .hex 16 0b 23 0f   ; $ccaa: 16 0b 23 0f   Data
            .hex 1c 09 2b 22   ; $ccae: 1c 09 2b 22   Data
            .hex 03 00 1a 16   ; $ccb2: 03 00 1a 16   Data
            .hex 0b 23 0f 1c   ; $ccb6: 0b 23 0f 1c   Data
            .hex 1d 01 8b 22   ; $ccba: 1d 01 8b 22   Data
            .hex 27 16 e5 22   ; $ccbe: 27 16 e5 22   Data
            .hex 26 00 02 0a   ; $ccc2: 26 00 02 0a   Data
            .hex 09 04 00 02   ; $ccc6: 09 04 00 02   Data
            .hex 0a 09 05 00   ; $ccca: 0a 09 05 00   Data
            .hex 18 0b 17 0d   ; $ccce: 18 0b 17 0d   Data
            .hex 19 00 16 1e   ; $ccd2: 19 00 16 1e   Data
            .hex 0e 25 13 27   ; $ccd6: 0e 25 13 27   Data
            .hex 23 0b 16 16   ; $ccda: 23 0b 16 16   Data
            .hex 00 1c 13 11   ; $ccde: 00 1c 13 11   Data
            .hex 12 1e 1d 00   ; $cce2: 12 1e 1d 00   Data
            .hex 1c 0f 1d 0f   ; $cce6: 1c 0f 1d 0f   Data
            .hex 1c 20 0f 0e   ; $ccea: 1c 20 0f 0e   Data
            .hex 00 10 00 3f   ; $ccee: 00 10 00 3f   Data
            .hex 0f 30 16 21   ; $ccf2: 0f 30 16 21   Data
            .hex 0f 16 36 17   ; $ccf6: 0f 16 36 17   Data
            .hex 0f 19 11 36   ; $ccfa: 0f 19 11 36   Data
            .hex 0f 29 19 13   ; $ccfe: 0f 29 19 13   Data
            .hex 00 10 00 3f   ; $cd02: 00 10 00 3f   Data
            .hex 0f 30 16 21   ; $cd06: 0f 30 16 21   Data
            .hex 0f 11 36 17   ; $cd0a: 0f 11 36 17   Data
            .hex 0f 19 11 36   ; $cd0e: 0f 19 11 36   Data
            .hex 0f 29 19 13   ; $cd12: 0f 29 19 13   Data
            .hex 00 10 00 3f   ; $cd16: 00 10 00 3f   Data
            .hex 0f 30 16 21   ; $cd1a: 0f 30 16 21   Data
            .hex 0f 19 36 17   ; $cd1e: 0f 19 36 17   Data
            .hex 0f 19 11 36   ; $cd22: 0f 19 11 36   Data
            .hex 0f 29 19 13   ; $cd26: 0f 29 19 13   Data
            .hex 00            ; $cd2a: 00            Data
__cd2b:     LDX #$00           ; $cd2b: a2 00     
__cd2d:     LDA __cd39,x       ; $cd2d: bd 39 cd  
            STA $0490,x        ; $cd30: 9d 90 04  
            INX                ; $cd33: e8        
            CPX #$05           ; $cd34: e0 05     
            BNE __cd2d         ; $cd36: d0 f5     
            RTS                ; $cd38: 60        

;-------------------------------------------------------------------------------
__cd39:     .hex 00 0c 00 14   ; $cd39: 00 0c 00 14   Data
            .hex 1c            ; $cd3d: 1c            Data
__cd3e:     LDA #$90           ; $cd3e: a9 90     
            STA $1e            ; $cd40: 85 1e     
            LDA #$04           ; $cd42: a9 04     
            STA $1f            ; $cd44: 85 1f     
            JMP __c305         ; $cd46: 4c 05 c3  

;-------------------------------------------------------------------------------
__cd49:     JSR __cbf5         ; $cd49: 20 f5 cb  
            JSR __d703         ; $cd4c: 20 03 d7  
            LDA $7a            ; $cd4f: a5 7a     
            ASL                ; $cd51: 0a        
            ASL                ; $cd52: 0a        
            STA $1f            ; $cd53: 85 1f     
            TAX                ; $cd55: aa        
            LDA __cdbf,x       ; $cd56: bd bf cd  
            STA $7c            ; $cd59: 85 7c     
            BEQ __cd8d         ; $cd5b: f0 30     
            LDA #$00           ; $cd5d: a9 00     
            STA $28            ; $cd5f: 85 28     
            STA $29            ; $cd61: 85 29     
            LDY #$0c           ; $cd63: a0 0c     
            JSR __d126         ; $cd65: 20 26 d1  
            JSR __c239         ; $cd68: 20 39 c2  
            LDA #$01           ; $cd6b: a9 01     
            STA $060e          ; $cd6d: 8d 0e 06  
            STA $060f          ; $cd70: 8d 0f 06  
            STA $0610          ; $cd73: 8d 10 06  
            LDA #$d2           ; $cd76: a9 d2     
            STA $0f            ; $cd78: 85 0f     
__cd7a:     JSR __c141         ; $cd7a: 20 41 c1  
            JSR __cdff         ; $cd7d: 20 ff cd  
            DEC $0f            ; $cd80: c6 0f     
            BNE __cd7a         ; $cd82: d0 f6     
            JSR __c241         ; $cd84: 20 41 c2  
            JSR __cbf5         ; $cd87: 20 f5 cb  
            JSR __d703         ; $cd8a: 20 03 d7  
__cd8d:     LDY #$08           ; $cd8d: a0 08     
            JSR __cf69         ; $cd8f: 20 69 cf  
            LDX $1f            ; $cd92: a6 1f     
            LDY __cdc0,x       ; $cd94: bc c0 cd  
            JSR __cc15         ; $cd97: 20 15 cc  
            LDX $1f            ; $cd9a: a6 1f     
            LDY __cdc1,x       ; $cd9c: bc c1 cd  
            JSR __cf69         ; $cd9f: 20 69 cf  
            LDX $1f            ; $cda2: a6 1f     
            LDY __cdc2,x       ; $cda4: bc c2 cd  
            JSR __d126         ; $cda7: 20 26 d1  
            LDX #$00           ; $cdaa: a2 00     
            LDY #$18           ; $cdac: a0 18     
            LDA #$00           ; $cdae: a9 00     
            JSR __cdb7         ; $cdb0: 20 b7 cd  
            LDY #$78           ; $cdb3: a0 78     
            LDA #$55           ; $cdb5: a9 55     
__cdb7:     STA $0170,x        ; $cdb7: 9d 70 01  
            INX                ; $cdba: e8        
            DEY                ; $cdbb: 88        
            BNE __cdb7         ; $cdbc: d0 f9     
            RTS                ; $cdbe: 60        

;-------------------------------------------------------------------------------
__cdbf:     .hex 00            ; $cdbf: 00            Data
__cdc0:     .hex 04            ; $cdc0: 04            Data
__cdc1:     .hex 00            ; $cdc1: 00            Data
__cdc2:     .hex 00 00 08 00   ; $cdc2: 00 00 08 00   Data
            .hex 00 02 04 0a   ; $cdc6: 00 02 04 0a   Data
            .hex 0a 00 06 02   ; $cdca: 0a 00 06 02   Data
            .hex 02 00 04 02   ; $cdce: 02 00 04 02   Data
            .hex 02 00 08 02   ; $cdd2: 02 00 08 02   Data
            .hex 02 04 04 0a   ; $cdd6: 02 04 04 0a   Data
            .hex 0a 00 06 04   ; $cdda: 0a 00 06 04   Data
            .hex 04 00 04 04   ; $cdde: 04 00 04 04   Data
            .hex 04 00 08 04   ; $cde2: 04 00 08 04   Data
            .hex 04 06 04 0a   ; $cde6: 04 06 04 0a   Data
            .hex 0a 00 06 06   ; $cdea: 0a 00 06 06   Data
            .hex 06 00 04 06   ; $cdee: 06 00 04 06   Data
            .hex 06 00 08 06   ; $cdf2: 06 00 08 06   Data
            .hex 06 08 04 0a   ; $cdf6: 06 08 04 0a   Data
            .hex 0a 00 06 00   ; $cdfa: 0a 00 06 00   Data
            .hex 00            ; $cdfe: 00            Data
__cdff:     LDA #$7c           ; $cdff: a9 7c     
            STA $10            ; $ce01: 85 10     
            LDA #$00           ; $ce03: a9 00     
            STA $11            ; $ce05: 85 11     
            STA $14            ; $ce07: 85 14     
            STA $15            ; $ce09: 85 15     
            LDA #$aa           ; $ce0b: a9 aa     
            STA $16            ; $ce0d: 85 16     
            LDA #$cb           ; $ce0f: a9 cb     
            STA $12            ; $ce11: 85 12     
            LDA #$02           ; $ce13: a9 02     
            STA $13            ; $ce15: 85 13     
            JMP __c3ec         ; $ce17: 4c ec c3  

;-------------------------------------------------------------------------------
__ce1a:     LDA #$00           ; $ce1a: a9 00     
            STA $28            ; $ce1c: 85 28     
            STA $29            ; $ce1e: 85 29     
            JSR __c241         ; $ce20: 20 41 c2  
            JSR __cbf5         ; $ce23: 20 f5 cb  
            JSR __d703         ; $ce26: 20 03 d7  
            JSR __c239         ; $ce29: 20 39 c2  
            LDY #$00           ; $ce2c: a0 00     
            JSR __cecd         ; $ce2e: 20 cd ce  
            LDA #$01           ; $ce31: a9 01     
            STA $0601          ; $ce33: 8d 01 06  
            STA $0618          ; $ce36: 8d 18 06  
            JSR __cebb         ; $ce39: 20 bb ce  
            LDY #$04           ; $ce3c: a0 04     
            JSR __cecd         ; $ce3e: 20 cd ce  
            LDY #$0e           ; $ce41: a0 0e     
            JSR __d5d9         ; $ce43: 20 d9 d5  
            LDY #$12           ; $ce46: a0 12     
            JSR __d5d9         ; $ce48: 20 d9 d5  
            JSR __cebb         ; $ce4b: 20 bb ce  
            LDY #$08           ; $ce4e: a0 08     
            JSR __cecd         ; $ce50: 20 cd ce  
            LDY #$10           ; $ce53: a0 10     
            JSR __d5d9         ; $ce55: 20 d9 d5  
            LDY #$14           ; $ce58: a0 14     
            JSR __d5d9         ; $ce5a: 20 d9 d5  
            JSR __ce94         ; $ce5d: 20 94 ce  
            LDA $5a            ; $ce60: a5 5a     
            STA $5e            ; $ce62: 85 5e     
            BEQ __ce76         ; $ce64: f0 10     
            LDA $52            ; $ce66: a5 52     
            BNE __ce76         ; $ce68: d0 0c     
            LDY #$0c           ; $ce6a: a0 0c     
            JSR __cecd         ; $ce6c: 20 cd ce  
            LDA $5e            ; $ce6f: a5 5e     
            CLC                ; $ce71: 18        
            ADC #$50           ; $ce72: 69 50     
            STA $5e            ; $ce74: 85 5e     
__ce76:     JSR __ce94         ; $ce76: 20 94 ce  
            LDY #$10           ; $ce79: a0 10     
            JSR __cecd         ; $ce7b: 20 cd ce  
            LDY #$0a           ; $ce7e: a0 0a     
            JSR __d4e5         ; $ce80: 20 e5 d4  
            LDY #$16           ; $ce83: a0 16     
            JSR __d5d9         ; $ce85: 20 d9 d5  
            JSR __ce94         ; $ce88: 20 94 ce  
            LDA #$01           ; $ce8b: a9 01     
            STA $43            ; $ce8d: 85 43     
            LDY #$0c           ; $ce8f: a0 0c     
            JMP __d4e5         ; $ce91: 4c e5 d4  

;-------------------------------------------------------------------------------
__ce94:     LDA #$78           ; $ce94: a9 78     
            STA $0f            ; $ce96: 85 0f     
__ce98:     JSR __c141         ; $ce98: 20 41 c1  
            LDA #$38           ; $ce9b: a9 38     
            STA $10            ; $ce9d: 85 10     
            LDA #$70           ; $ce9f: a9 70     
            STA $16            ; $cea1: 85 16     
            LDA #$00           ; $cea3: a9 00     
            STA $11            ; $cea5: 85 11     
            STA $14            ; $cea7: 85 14     
            LDA #$02           ; $cea9: a9 02     
            STA $13            ; $ceab: 85 13     
            JSR __c63d         ; $cead: 20 3d c6  
            JSR __d71c         ; $ceb0: 20 1c d7  
            JSR __d5ab         ; $ceb3: 20 ab d5  
            DEC $0f            ; $ceb6: c6 0f     
            BNE __ce98         ; $ceb8: d0 de     
            RTS                ; $ceba: 60        

;-------------------------------------------------------------------------------
__cebb:     LDA #$78           ; $cebb: a9 78     
            STA $0f            ; $cebd: 85 0f     
__cebf:     JSR __c141         ; $cebf: 20 41 c1  
            JSR __d71c         ; $cec2: 20 1c d7  
            JSR __d5ab         ; $cec5: 20 ab d5  
            DEC $0f            ; $cec8: c6 0f     
            BNE __cebf         ; $ceca: d0 f3     
            RTS                ; $cecc: 60        

;-------------------------------------------------------------------------------
__cecd:     LDA __cf08,y       ; $cecd: b9 08 cf  
            STA $10            ; $ced0: 85 10     
            LDA __cf09,y       ; $ced2: b9 09 cf  
            STA $11            ; $ced5: 85 11     
            LDA __cf0a,y       ; $ced7: b9 0a cf  
            STA $12            ; $ceda: 85 12     
            LDA __cf0b,y       ; $cedc: b9 0b cf  
            STA $13            ; $cedf: 85 13     
            LDA #$80           ; $cee1: a9 80     
            STA $14            ; $cee3: 85 14     
            JMP __c6fb         ; $cee5: 4c fb c6  

;-------------------------------------------------------------------------------
            LDX #$00           ; $cee8: a2 00     
            LDA #$00           ; $ceea: a9 00     
__ceec:     STA $04,x          ; $ceec: 95 04     
            INX                ; $ceee: e8        
            CPX #$04           ; $ceef: e0 04     
            BNE __ceec         ; $cef1: d0 f9     
            LDA $51            ; $cef3: a5 51     
            BEQ __cefb         ; $cef5: f0 04     
            LDA #$50           ; $cef7: a9 50     
            STA $06            ; $cef9: 85 06     
__cefb:     RTS                ; $cefb: 60        

;-------------------------------------------------------------------------------
            LDX #$00           ; $cefc: a2 00     
            LDA #$00           ; $cefe: a9 00     
__cf00:     STA $00,x          ; $cf00: 95 00     
            INX                ; $cf02: e8        
            CPX #$04           ; $cf03: e0 04     
            BNE __cf00         ; $cf05: d0 f9     
            RTS                ; $cf07: 60        

;-------------------------------------------------------------------------------
__cf08:     .hex 0c            ; $cf08: 0c            Data
__cf09:     .hex 21            ; $cf09: 21            Data
__cf0a:     .hex 1c            ; $cf0a: 1c            Data
__cf0b:     .hex cf 67 21 26   ; $cf0b: cf 67 21 26   Data
            .hex cf 09 22 3a   ; $cf0f: cf 09 22 3a   Data
            .hex cf 86 22 48   ; $cf13: cf 86 22 48   Data
            .hex cf 0d 23 5f   ; $cf17: cf 0d 23 5f   Data
            .hex cf 08 0f 0b   ; $cf1b: cf 08 0f 0b   Data
            .hex 1c 18 13 18   ; $cf1f: 1c 18 13 18   Data
            .hex 11 1d 00 02   ; $cf23: 11 1d 00 02   Data
            .hex 28 29 1e 0e   ; $cf27: 28 29 1e 0e   Data
            .hex 2a 2b 00 03   ; $cf2b: 2a 2b 00 03   Data
            .hex 01 01 00 8b   ; $cf2f: 01 01 00 8b   Data
            .hex 00 00 00 00   ; $cf33: 00 00 00 00   Data
            .hex 00 8a 00 0c   ; $cf37: 00 8a 00 0c   Data
            .hex 03 01 01 01   ; $cf3b: 03 01 01 01   Data
            .hex 00 8b 00 00   ; $cf3f: 00 8b 00 00   Data
            .hex 00 00 00 8a   ; $cf43: 00 00 00 8a   Data
            .hex 00 15 1a 0f   ; $cf47: 00 15 1a 0f   Data
            .hex 1c 10 0f 0d   ; $cf4b: 1c 10 0f 0d   Data
            .hex 1e 00 11 0b   ; $cf4f: 1e 00 11 0b   Data
            .hex 17 0f 00 00   ; $cf53: 17 0f 00 00   Data
            .hex 8a 00 00 06   ; $cf57: 8a 00 00 06   Data
            .hex 01 01 01 00   ; $cf5b: 01 01 01 00   Data
            .hex 08 1e 19 1e   ; $cf5f: 08 1e 19 1e   Data
            .hex 0b 16 00 00   ; $cf63: 0b 16 00 00   Data
            .hex 8a 00         ; $cf67: 8a 00         Data

;-------------------------------------------------------------------------------
__cf69:     LDA __cfa6,y       ; $cf69: b9 a6 cf  
            STA $10            ; $cf6c: 85 10     
            LDA __cfa7,y       ; $cf6e: b9 a7 cf  
            STA $11            ; $cf71: 85 11     
            LDY #$00           ; $cf73: a0 00     
__cf75:     LDA ($10),y        ; $cf75: b1 10     
            BEQ __cfa5         ; $cf77: f0 2c     
            INY                ; $cf79: c8        
            STA $17            ; $cf7a: 85 17     
            LDA ($10),y        ; $cf7c: b1 10     
            INY                ; $cf7e: c8        
            TAX                ; $cf7f: aa        
            LDA ($10),y        ; $cf80: b1 10     
            INY                ; $cf82: c8        
            STA PPUADDR          ; $cf83: 8d 06 20  
            STX PPUADDR          ; $cf86: 8e 06 20  
            STY $16            ; $cf89: 84 16     
__cf8b:     LDA ($10),y        ; $cf8b: b1 10     
            BEQ __cf9c         ; $cf8d: f0 0d     
            INY                ; $cf8f: c8        
            TAX                ; $cf90: aa        
            LDA ($10),y        ; $cf91: b1 10     
            INY                ; $cf93: c8        
__cf94:     STA PPUDATA          ; $cf94: 8d 07 20  
            DEX                ; $cf97: ca        
            BNE __cf94         ; $cf98: d0 fa     
            BEQ __cf8b         ; $cf9a: f0 ef     
__cf9c:     INY                ; $cf9c: c8        
            DEC $17            ; $cf9d: c6 17     
            BEQ __cf75         ; $cf9f: f0 d4     
            LDY $16            ; $cfa1: a4 16     
            BNE __cf8b         ; $cfa3: d0 e6     
__cfa5:     RTS                ; $cfa5: 60        

;-------------------------------------------------------------------------------
__cfa6:     .hex b2            ; $cfa6: b2            Data
__cfa7:     .hex cf db cf 0e   ; $cfa7: cf db cf 0e   Data
            .hex d0 47 d0 7a   ; $cfab: d0 47 d0 7a   Data
            .hex d0 c5 d0 01   ; $cfaf: d0 c5 d0 01   Data
            .hex a3 20 01 5a   ; $cfb3: a3 20 01 5a   Data
            .hex 1c 84 02 00   ; $cfb7: 1c 84 02 00   Data
            .hex 01 5a 1d 84   ; $cfbb: 01 5a 1d 84   Data
            .hex 01 00 01 5a   ; $cfbf: 01 00 01 5a   Data
            .hex 1e 84 00 01   ; $cfc3: 1e 84 00 01   Data
            .hex a0 24 18 84   ; $cfc7: a0 24 18 84   Data
            .hex 01 5b 07 00   ; $cfcb: 01 5b 07 00   Data
            .hex 19 84 01 5b   ; $cfcf: 19 84 01 5b   Data
            .hex 06 00 1a 84   ; $cfd3: 06 00 1a 84   Data
            .hex 01 5b 00 00   ; $cfd7: 01 5b 00 00   Data
            .hex 01 93 20 01   ; $cfdb: 01 93 20 01   Data
            .hex 74 0c 75 01   ; $cfdf: 74 0c 75 01   Data
            .hex 00 01 7b 1e   ; $cfe3: 00 01 7b 1e   Data
            .hex 84 01 00 01   ; $cfe7: 84 01 00 01   Data
            .hex 77 1e 84 01   ; $cfeb: 77 1e 84 01   Data
            .hex 7b 1f 84 00   ; $cfef: 7b 1f 84 00   Data
            .hex 01 80 24 08   ; $cff3: 01 80 24 08   Data
            .hex 75 01 76 17   ; $cff7: 75 01 76 17   Data
            .hex 00 1a 84 01   ; $cffb: 00 1a 84 01   Data
            .hex 7e 05 00 1a   ; $cfff: 7e 05 00 1a   Data
            .hex 84 01 7a 05   ; $d003: 84 01 7a 05   Data
            .hex 00 1b 84 01   ; $d007: 00 1b 84 01   Data
            .hex 7e 00 00 01   ; $d00b: 7e 00 00 01   Data
            .hex 91 20 01 74   ; $d00f: 91 20 01 74   Data
            .hex 0e 75 10 00   ; $d013: 0e 75 10 00   Data
            .hex 01 7b 0f 84   ; $d017: 01 7b 0f 84   Data
            .hex 10 00 01 77   ; $d01b: 10 00 01 77   Data
            .hex 0f 84 08 00   ; $d01f: 0f 84 08 00   Data
            .hex 07 81 01 7b   ; $d023: 07 81 01 7b   Data
            .hex 10 84 00 01   ; $d027: 10 84 00 01   Data
            .hex 80 24 0a 75   ; $d02b: 80 24 0a 75   Data
            .hex 01 76 15 00   ; $d02f: 01 76 15 00   Data
            .hex 0b 84 01 7e   ; $d033: 0b 84 01 7e   Data
            .hex 14 00 0b 84   ; $d037: 14 00 0b 84   Data
            .hex 01 7a 14 00   ; $d03b: 01 7a 14 00   Data
            .hex 0c 84 01 7e   ; $d03f: 0c 84 01 7e   Data
            .hex 07 81 00 00   ; $d043: 07 81 00 00   Data
            .hex 01 82 20 01   ; $d047: 01 82 20 01   Data
            .hex 74 1d 75 01   ; $d04b: 74 1d 75 01   Data
            .hex 00 01 7b 1e   ; $d04f: 00 01 7b 1e   Data
            .hex 84 01 00 01   ; $d053: 84 01 00 01   Data
            .hex 77 1e 84 01   ; $d057: 77 1e 84 01   Data
            .hex 7b 1f 84 00   ; $d05b: 7b 1f 84 00   Data
            .hex 01 80 24 19   ; $d05f: 01 80 24 19   Data
            .hex 75 01 76 06   ; $d063: 75 01 76 06   Data
            .hex 00 1a 84 01   ; $d067: 00 1a 84 01   Data
            .hex 7e 05 00 1a   ; $d06b: 7e 05 00 1a   Data
            .hex 84 01 7a 05   ; $d06f: 84 01 7a 05   Data
            .hex 00 1b 84 01   ; $d073: 00 1b 84 01   Data
            .hex 7e 00 00 05   ; $d077: 7e 00 00 05   Data
            .hex 01 21 01 4c   ; $d07b: 01 21 01 4c   Data
            .hex 1e 4a 01 00   ; $d07f: 1e 4a 01 00   Data
            .hex 01 4c 1f 00   ; $d083: 01 4c 1f 00   Data
            .hex 01 4c 1f 00   ; $d087: 01 4c 1f 00   Data
            .hex 01 4c 1f 00   ; $d08b: 01 4c 1f 00   Data
            .hex 00 05 00 25   ; $d08f: 00 05 00 25   Data
            .hex 1a 4a 01 4d   ; $d093: 1a 4a 01 4d   Data
            .hex 1f 00 01 4d   ; $d097: 1f 00 01 4d   Data
            .hex 1f 00 01 4d   ; $d09b: 1f 00 01 4d   Data
            .hex 1f 00 01 4d   ; $d09f: 1f 00 01 4d   Data
            .hex 05 00 00 20   ; $d0a3: 05 00 00 20   Data
            .hex 80 23 01 4e   ; $d0a7: 80 23 01 4e   Data
            .hex 01 4f 00 20   ; $d0ab: 01 4f 00 20   Data
            .hex 80 27 01 4e   ; $d0af: 80 27 01 4e   Data
            .hex 01 4f 00 01   ; $d0b3: 01 4f 00 01   Data
            .hex c0 23 08 00   ; $d0b7: c0 23 08 00   Data
            .hex 38 55 00 01   ; $d0bb: 38 55 00 01   Data
            .hex c0 27 40 55   ; $d0bf: c0 27 40 55   Data
            .hex 00 00 05 a2   ; $d0c3: 00 00 05 a2   Data
            .hex 20 01 82 01   ; $d0c7: 20 01 82 01   Data
            .hex 83 04 4a 00   ; $d0cb: 83 04 4a 00   Data
            .hex 16 c2 20 01   ; $d0cf: 16 c2 20 01   Data
            .hex 4c 01 4d 04   ; $d0d3: 4c 01 4d 04   Data
            .hex 00 01 4c 01   ; $d0d7: 00 01 4c 01   Data
            .hex 4d 04 00 01   ; $d0db: 4d 04 00 01   Data
            .hex 4c 01 4d 04   ; $d0df: 4c 01 4d 04   Data
            .hex 00 01 4c 01   ; $d0e3: 00 01 4c 01   Data
            .hex 4d 04 00 01   ; $d0e7: 4d 04 00 01   Data
            .hex 4c 01 4d 06   ; $d0eb: 4c 01 4d 06   Data
            .hex 00 00 04 a0   ; $d0ef: 00 00 04 a0   Data
            .hex 24 01 82 01   ; $d0f3: 24 01 82 01   Data
            .hex 83 04 4a 00   ; $d0f7: 83 04 4a 00   Data
            .hex 01 b8 24 01   ; $d0fb: 01 b8 24 01   Data
            .hex 82 01 83 00   ; $d0ff: 82 01 83 00   Data
            .hex 16 c0 24 01   ; $d103: 16 c0 24 01   Data
            .hex 4c 01 4d 04   ; $d107: 4c 01 4d 04   Data
            .hex 00 01 4c 01   ; $d10b: 00 01 4c 01   Data
            .hex 4d 04 00 01   ; $d10f: 4d 04 00 01   Data
            .hex 4c 01 4d 04   ; $d113: 4c 01 4d 04   Data
            .hex 00 01 4c 01   ; $d117: 00 01 4c 01   Data
            .hex 4d 04 00 01   ; $d11b: 4d 04 00 01   Data
            .hex 4c 01 4d 06   ; $d11f: 4c 01 4d 06   Data
            .hex 00 00 00      ; $d123: 00 00 00      Data

;-------------------------------------------------------------------------------
__d126:     LDA __d185,y       ; $d126: b9 85 d1  
            STA $10            ; $d129: 85 10     
            LDA __d186,y       ; $d12b: b9 86 d1  
            STA $11            ; $d12e: 85 11     
            LDY #$00           ; $d130: a0 00     
__d132:     LDA ($10),y        ; $d132: b1 10     
            BEQ __d184         ; $d134: f0 4e     
            INY                ; $d136: c8        
            STA $17            ; $d137: 85 17     
            LDA ($10),y        ; $d139: b1 10     
            INY                ; $d13b: c8        
            STA $12            ; $d13c: 85 12     
            LDA ($10),y        ; $d13e: b1 10     
            INY                ; $d140: c8        
            STA $13            ; $d141: 85 13     
__d143:     LDA ($10),y        ; $d143: b1 10     
            INY                ; $d145: c8        
            STA $14            ; $d146: 85 14     
            LDA ($10),y        ; $d148: b1 10     
            INY                ; $d14a: c8        
            STA $15            ; $d14b: 85 15     
            STY $16            ; $d14d: 84 16     
            LDY #$00           ; $d14f: a0 00     
__d151:     LDA $15            ; $d151: a5 15     
            STA PPUADDR          ; $d153: 8d 06 20  
            LDA $14            ; $d156: a5 14     
            STA PPUADDR          ; $d158: 8d 06 20  
            LDA ($12),y        ; $d15b: b1 12     
            INY                ; $d15d: c8        
            TAX                ; $d15e: aa        
__d15f:     LDA ($12),y        ; $d15f: b1 12     
            INY                ; $d161: c8        
            STA PPUDATA          ; $d162: 8d 07 20  
            DEX                ; $d165: ca        
            BNE __d15f         ; $d166: d0 f7     
            LDA ($12),y        ; $d168: b1 12     
            BEQ __d17c         ; $d16a: f0 10     
            BPL __d170         ; $d16c: 10 02     
            DEC $15            ; $d16e: c6 15     
__d170:     INY                ; $d170: c8        
            CLC                ; $d171: 18        
            ADC $14            ; $d172: 65 14     
            STA $14            ; $d174: 85 14     
            BCC __d151         ; $d176: 90 d9     
            INC $15            ; $d178: e6 15     
            BCS __d151         ; $d17a: b0 d5     
__d17c:     LDY $16            ; $d17c: a4 16     
            DEC $17            ; $d17e: c6 17     
            BNE __d143         ; $d180: d0 c1     
            BEQ __d132         ; $d182: f0 ae     
__d184:     RTS                ; $d184: 60        

;-------------------------------------------------------------------------------
__d185:     .hex 93            ; $d185: 93            Data
__d186:     .hex d1 f5 d1 62   ; $d186: d1 f5 d1 62   Data
            .hex d2 d9 d2 50   ; $d18a: d2 d9 d2 50   Data
            .hex d3 1c d4 83   ; $d18e: d3 1c d4 83   Data
            .hex d4 04 51 d3   ; $d192: d4 04 51 d3   Data
            .hex a8 20 b2 20   ; $d196: a8 20 b2 20   Data
            .hex a8 24 b2 24   ; $d19a: a8 24 b2 24   Data
            .hex 03 6b d3 8d   ; $d19e: 03 6b d3 8d   Data
            .hex 20 9d 20 8d   ; $d1a2: 20 9d 20 8d   Data
            .hex 24 01 b3 d3   ; $d1a6: 24 01 b3 d3   Data
            .hex 06 21 04 d1   ; $d1aa: 06 21 04 d1   Data
            .hex d3 86 21 06   ; $d1ae: d3 86 21 06   Data
            .hex 22 86 22 06   ; $d1b2: 22 86 22 06   Data
            .hex 23 01 c2 d3   ; $d1b6: 23 01 c2 d3   Data
            .hex 00 25 04 c5   ; $d1ba: 00 25 04 c5   Data
            .hex d3 85 25 05   ; $d1be: d3 85 25 05   Data
            .hex 26 85 26 05   ; $d1c2: 26 85 26 05   Data
            .hex 27 15 10 d4   ; $d1c6: 27 15 10 d4   Data
            .hex 82 21 02 22   ; $d1ca: 82 21 02 22   Data
            .hex 82 22 02 23   ; $d1ce: 82 22 02 23   Data
            .hex a2 23 92 21   ; $d1d2: a2 23 92 21   Data
            .hex 12 22 92 22   ; $d1d6: 12 22 92 22   Data
            .hex 12 23 b2 23   ; $d1da: 12 23 b2 23   Data
            .hex 1c 21 86 25   ; $d1de: 1c 21 86 25   Data
            .hex 06 26 86 26   ; $d1e2: 06 26 86 26   Data
            .hex 06 27 a6 27   ; $d1e6: 06 27 a6 27   Data
            .hex 96 25 16 26   ; $d1ea: 96 25 16 26   Data
            .hex 96 26 16 27   ; $d1ee: 96 26 16 27   Data
            .hex b6 27 00 08   ; $d1f2: b6 27 00 08   Data
            .hex 5d d3 c3 20   ; $d1f6: 5d d3 c3 20   Data
            .hex c7 20 cb 20   ; $d1fa: c7 20 cb 20   Data
            .hex cf 20 cb 24   ; $d1fe: cf 20 cb 24   Data
            .hex cf 24 d3 24   ; $d202: cf 24 d3 24   Data
            .hex d7 24 04 51   ; $d206: d7 24 04 51   Data
            .hex d3 b5 20 b8   ; $d20a: d3 b5 20 b8   Data
            .hex 20 a2 24 a5   ; $d20e: 20 a2 24 a5   Data
            .hex 24 01 6f d3   ; $d212: 24 01 6f d3   Data
            .hex bc 20 02 b3   ; $d216: bc 20 02 b3   Data
            .hex d3 06 21 06   ; $d21a: d3 06 21 06   Data
            .hex 23 03 e0 d3   ; $d21e: 23 03 e0 d3   Data
            .hex 86 21 06 22   ; $d222: 86 21 06 22   Data
            .hex 86 22 02 c2   ; $d226: 86 22 02 c2   Data
            .hex d3 00 25 00   ; $d22a: d3 00 25 00   Data
            .hex 27 03 ef d3   ; $d22e: 27 03 ef d3   Data
            .hex 80 25 00 26   ; $d232: 80 25 00 26   Data
            .hex 80 26 13 10   ; $d236: 80 26 13 10   Data
            .hex d4 02 21 82   ; $d23a: d4 02 21 82   Data
            .hex 21 02 22 82   ; $d23e: 21 02 22 82   Data
            .hex 22 02 23 a2   ; $d242: 22 02 23 a2   Data
            .hex 23 10 22 1c   ; $d246: 23 10 22 1c   Data
            .hex 21 9c 21 9c   ; $d24a: 21 9c 21 9c   Data
            .hex 22 1c 23 bc   ; $d24e: 22 1c 23 bc   Data
            .hex 23 08 26 16   ; $d252: 23 08 26 16   Data
            .hex 25 96 25 16   ; $d256: 25 96 25 16   Data
            .hex 26 96 26 16   ; $d25a: 26 96 26 16   Data
            .hex 27 b6 27 00   ; $d25e: 27 b6 27 00   Data
            .hex 02 81 d3 82   ; $d262: 02 81 d3 82   Data
            .hex 20 96 24 03   ; $d266: 20 96 24 03   Data
            .hex 51 d3 b2 20   ; $d26a: 51 d3 b2 20   Data
            .hex bd 20 a8 24   ; $d26e: bd 20 a8 24   Data
            .hex 04 5d d3 b6   ; $d272: 04 5d d3 b6   Data
            .hex 20 b9 20 a1   ; $d276: 20 b9 20 a1   Data
            .hex 24 a4 24 03   ; $d27a: 24 a4 24 03   Data
            .hex b3 d3 06 21   ; $d27e: b3 d3 06 21   Data
            .hex 86 21 86 22   ; $d282: 86 21 86 22   Data
            .hex 01 fe d3 06   ; $d286: 01 fe d3 06   Data
            .hex 22 01 d1 d3   ; $d28a: 22 01 d1 d3   Data
            .hex 06 23 04 c2   ; $d28e: 06 23 04 c2   Data
            .hex d3 00 25 80   ; $d292: d3 00 25 80   Data
            .hex 25 00 26 80   ; $d296: 25 00 26 80   Data
            .hex 26 01 c5 d3   ; $d29a: 26 01 c5 d3   Data
            .hex 05 27 01 16   ; $d29e: 05 27 01 16   Data
            .hex d4 1c 21 18   ; $d2a2: d4 1c 21 18   Data
            .hex 10 d4 02 21   ; $d2a6: 10 d4 02 21   Data
            .hex 82 21 02 22   ; $d2aa: 82 21 02 22   Data
            .hex 82 22 02 23   ; $d2ae: 82 22 02 23   Data
            .hex a2 23 12 21   ; $d2b2: a2 23 12 21   Data
            .hex 92 21 12 22   ; $d2b6: 92 21 12 22   Data
            .hex 92 22 12 23   ; $d2ba: 92 22 12 23   Data
            .hex b2 23 06 25   ; $d2be: b2 23 06 25   Data
            .hex 86 25 06 26   ; $d2c2: 86 25 06 26   Data
            .hex 86 26 06 27   ; $d2c6: 86 26 06 27   Data
            .hex a6 27 16 25   ; $d2ca: a6 27 16 25   Data
            .hex 96 25 16 26   ; $d2ce: 96 25 16 26   Data
            .hex 96 26 16 27   ; $d2d2: 96 26 16 27   Data
            .hex b6 27 00 08   ; $d2d6: b6 27 00 08   Data
            .hex 51 d3 a3 20   ; $d2da: 51 d3 a3 20   Data
            .hex a9 20 af 20   ; $d2de: a9 20 af 20   Data
            .hex b5 20 a5 24   ; $d2e2: b5 20 a5 24   Data
            .hex ab 24 b1 24   ; $d2e6: ab 24 b1 24   Data
            .hex b7 24 08 5d   ; $d2ea: b7 24 08 5d   Data
            .hex d3 a6 20 ac   ; $d2ee: d3 a6 20 ac   Data
            .hex 20 b2 20 b8   ; $d2f2: 20 b2 20 b8   Data
            .hex 20 a2 24 a8   ; $d2f6: 20 a2 24 a8   Data
            .hex 24 ae 24 b4   ; $d2fa: 24 ae 24 b4   Data
            .hex 24 01 a1 d3   ; $d2fe: 24 01 a1 d3   Data
            .hex bc 20 04 65   ; $d302: bc 20 04 65   Data
            .hex d3 88 20 94   ; $d306: d3 88 20 94   Data
            .hex 20 84 24 90   ; $d30a: 20 84 24 90   Data
            .hex 24 05 c2 d3   ; $d30e: 24 05 c2 d3   Data
            .hex 06 21 86 21   ; $d312: 06 21 86 21   Data
            .hex 06 22 86 22   ; $d316: 06 22 86 22   Data
            .hex 06 23 05 b3   ; $d31a: 06 23 05 b3   Data
            .hex d3 00 25 80   ; $d31e: d3 00 25 80   Data
            .hex 25 00 26 80   ; $d322: 25 00 26 80   Data
            .hex 26 00 27 12   ; $d326: 26 00 27 12   Data
            .hex 10 d4 02 21   ; $d32a: 10 d4 02 21   Data
            .hex 82 21 02 23   ; $d32e: 82 21 02 23   Data
            .hex a2 23 0c 22   ; $d332: a2 23 0c 22   Data
            .hex 8c 22 9c 21   ; $d336: 8c 22 9c 21   Data
            .hex 1c 22 9c 22   ; $d33a: 1c 22 9c 22   Data
            .hex 1c 23 bc 23   ; $d33e: 1c 23 bc 23   Data
            .hex 1c 21 0c 26   ; $d342: 1c 21 0c 26   Data
            .hex 8c 26 16 25   ; $d346: 8c 26 16 25   Data
            .hex 96 25 16 27   ; $d34a: 96 25 16 27   Data
            .hex b6 27 00 02   ; $d34e: b6 27 00 02   Data
            .hex 5c 5d 20 02   ; $d352: 5c 5d 20 02   Data
            .hex 5e 5f 20 02   ; $d356: 5e 5f 20 02   Data
            .hex 60 60 00 02   ; $d35a: 60 60 00 02   Data
            .hex 71 72 20 02   ; $d35e: 71 72 20 02   Data
            .hex 73 73 00 04   ; $d362: 73 73 00 04   Data
            .hex 76 00 00 74   ; $d366: 76 00 00 74   Data
            .hex 00 02 61 62   ; $d36a: 00 02 61 62   Data
            .hex 1f 04 63 64   ; $d36e: 1f 04 63 64   Data
            .hex 65 66 20 04   ; $d372: 65 66 20 04   Data
            .hex 67 68 69 6a   ; $d376: 67 68 69 6a   Data
            .hex 20 04 67 6b   ; $d37a: 20 04 67 6b   Data
            .hex 6c 6a 00 04   ; $d37e: 6c 6a 00 04   Data
            .hex 74 75 75 76   ; $d382: 74 75 75 76   Data
            .hex 1f 06 7b 84   ; $d386: 1f 06 7b 84   Data
            .hex 78 79 84 7e   ; $d38a: 78 79 84 7e   Data
            .hex 20 06 77 84   ; $d38e: 20 06 77 84   Data
            .hex 7c 7d 84 7a   ; $d392: 7c 7d 84 7a   Data
            .hex 1f 08 7b 84   ; $d396: 1f 08 7b 84   Data
            .hex 84 6b 6c 84   ; $d39a: 84 6b 6c 84   Data
            .hex 84 7e 00 04   ; $d39e: 84 7e 00 04   Data
            .hex 78 7f 80 79   ; $d3a2: 78 7f 80 79   Data
            .hex 20 04 7c 00   ; $d3a6: 20 04 7c 00   Data
            .hex 00 7d 20 04   ; $d3aa: 00 7d 20 04   Data
            .hex 6b 00 00 6c   ; $d3ae: 6b 00 00 6c   Data
            .hex 00 01 4b 06   ; $d3b2: 00 01 4b 06   Data
            .hex 01 4b 05 01   ; $d3b6: 01 4b 05 01   Data
            .hex 4b 05 01 4b   ; $d3ba: 4b 05 01 4b   Data
            .hex 05 01 4b 00   ; $d3be: 05 01 4b 00   Data
            .hex 01 4b 05 01   ; $d3c2: 01 4b 05 01   Data
            .hex 4b 05 01 4b   ; $d3c6: 4b 05 01 4b   Data
            .hex 05 01 4b 06   ; $d3ca: 05 01 4b 06   Data
            .hex 01 4b 00 01   ; $d3ce: 01 4b 00 01   Data
            .hex 4b 06 01 4b   ; $d3d2: 4b 06 01 4b   Data
            .hex 05 01 4b 05   ; $d3d6: 05 01 4b 05   Data
            .hex 01 4b 07 01   ; $d3da: 01 4b 07 01   Data
            .hex 4b 00 01 4b   ; $d3de: 4b 00 01 4b   Data
            .hex 05 01 4b 04   ; $d3e2: 05 01 4b 04   Data
            .hex 01 4b 05 01   ; $d3e6: 01 4b 05 01   Data
            .hex 4b 07 01 4b   ; $d3ea: 4b 07 01 4b   Data
            .hex 00 01 4b 07   ; $d3ee: 00 01 4b 07   Data
            .hex 01 4b 05 01   ; $d3f2: 01 4b 05 01   Data
            .hex 4b 04 01 4b   ; $d3f6: 4b 04 01 4b   Data
            .hex 05 01 4b 00   ; $d3fa: 05 01 4b 00   Data
            .hex 01 4b 06 01   ; $d3fe: 01 4b 06 01   Data
            .hex 4b 05 01 4b   ; $d402: 4b 05 01 4b   Data
            .hex 05 01 4b 03   ; $d406: 05 01 4b 03   Data
            .hex 01 4b 02 01   ; $d40a: 01 4b 02 01   Data
            .hex 4b 00 04 00   ; $d40e: 4b 00 04 00   Data
            .hex 00 00 00 00   ; $d412: 00 00 00 00   Data
            .hex 04 49 49 49   ; $d416: 04 49 49 49   Data
            .hex 49 00 05 67   ; $d41a: 49 00 05 67   Data
            .hex d4 e8 20 ee   ; $d41e: d4 e8 20 ee   Data
            .hex 22 e0 26 66   ; $d422: 22 e0 26 66   Data
            .hex 25 f2 24 06   ; $d426: 25 f2 24 06   Data
            .hex 5b d4 68 22   ; $d42a: 5b d4 68 22   Data
            .hex 14 21 1a 22   ; $d42e: 14 21 1a 22   Data
            .hex 00 25 ec 25   ; $d432: 00 25 ec 25   Data
            .hex 72 26 04 7b   ; $d436: 72 26 04 7b   Data
            .hex d4 02 22 8e   ; $d43a: d4 02 22 8e   Data
            .hex 22 80 26 12   ; $d43e: 22 80 26 12   Data
            .hex 26 0a 10 d4   ; $d442: 26 0a 10 d4   Data
            .hex 84 23 a4 23   ; $d446: 84 23 a4 23   Data
            .hex aa 23 b0 23   ; $d44a: aa 23 b0 23   Data
            .hex b6 23 bc 23   ; $d44e: b6 23 bc 23   Data
            .hex a2 27 a8 27   ; $d452: a2 27 a8 27   Data
            .hex ae 27 b4 27   ; $d456: ae 27 b4 27   Data
            .hex 00 02 00 00   ; $d45a: 00 02 00 00   Data
            .hex 20 02 00 00   ; $d45e: 20 02 00 00   Data
            .hex 20 02 00 00   ; $d462: 20 02 00 00   Data
            .hex 20 02 00 00   ; $d466: 20 02 00 00   Data
            .hex 20 02 00 00   ; $d46a: 20 02 00 00   Data
            .hex 20 02 00 00   ; $d46e: 20 02 00 00   Data
            .hex 20 02 00 00   ; $d472: 20 02 00 00   Data
            .hex 20 02 00 00   ; $d476: 20 02 00 00   Data
            .hex 00 02 82 83   ; $d47a: 00 02 82 83   Data
            .hex 06 02 82 83   ; $d47e: 06 02 82 83   Data
            .hex 00 01 93 d4   ; $d482: 00 01 93 d4   Data
            .hex 6a 21 01 a0   ; $d486: 6a 21 01 a0   Data
            .hex d4 51 22 01   ; $d48a: d4 51 22 01   Data
            .hex af d4 c9 22   ; $d48e: af d4 c9 22   Data
            .hex 00 0b 0c 19   ; $d492: 00 0b 0c 19   Data
            .hex 18 1f 1d 00   ; $d496: 18 1f 1d 00   Data
            .hex 1c 19 1f 18   ; $d49a: 1c 19 1f 18   Data
            .hex 0e 00 02 28   ; $d49e: 0e 00 02 28   Data
            .hex 29 1a 09 1d   ; $d4a2: 29 1a 09 1d   Data
            .hex 1e 13 18 11   ; $d4a6: 1e 13 18 11   Data
            .hex 00 2a 2b 1d   ; $d4aa: 00 2a 2b 1d   Data
            .hex 00 0d 0c 0f   ; $d4ae: 00 0d 0c 0f   Data
            .hex 10 19 1c 0f   ; $d4b2: 10 19 1c 0f   Data
            .hex 00 00 00 0f   ; $d4b6: 00 00 00 0f   Data
            .hex 18 0e 1d 00   ; $d4ba: 18 0e 1d 00   Data

;-------------------------------------------------------------------------------
__d4be:     STA $19            ; $d4be: 85 19     
__d4c0:     LDY $19            ; $d4c0: a4 19     
            JSR __d4ca         ; $d4c2: 20 ca d4  
            DEC $18            ; $d4c5: c6 18     
            BNE __d4c0         ; $d4c7: d0 f7     
__d4c9:     RTS                ; $d4c9: 60        

;-------------------------------------------------------------------------------
__d4ca:     LDA $42            ; $d4ca: a5 42     
            BEQ __d4c9         ; $d4cc: f0 fb     
            STA $43            ; $d4ce: 85 43     
            tya                ; $d4d0: 98        
            CLC                ; $d4d1: 18        
            ADC __d561         ; $d4d2: 6d 61 d5  
            STA $12            ; $d4d5: 85 12     
            LDA __d562         ; $d4d7: ad 62 d5  
            ADC #$00           ; $d4da: 69 00     
            STA $13            ; $d4dc: 85 13     
            LDX #$74           ; $d4de: a2 74     
            LDY #$03           ; $d4e0: a0 03     
            JMP __d502         ; $d4e2: 4c 02 d5  

;-------------------------------------------------------------------------------
__d4e5:     LDA __d536,y       ; $d4e5: b9 36 d5  
            STA $10            ; $d4e8: 85 10     
            LDA __d537,y       ; $d4ea: b9 37 d5  
            STA $11            ; $d4ed: 85 11     
            LDY #$00           ; $d4ef: a0 00     
            LDA ($10),y        ; $d4f1: b1 10     
            INY                ; $d4f3: c8        
            TAX                ; $d4f4: aa        
            LDA ($10),y        ; $d4f5: b1 10     
            INY                ; $d4f7: c8        
            STA $12            ; $d4f8: 85 12     
            LDA ($10),y        ; $d4fa: b1 10     
            INY                ; $d4fc: c8        
            STA $13            ; $d4fd: 85 13     
            LDA ($10),y        ; $d4ff: b1 10     
            TAY                ; $d501: a8        
__d502:     CLC                ; $d502: 18        
__d503:     LDA ($12),y        ; $d503: b1 12     
            AND #$0f           ; $d505: 29 0f     
            STA $14            ; $d507: 85 14     
            LDA ($12),y        ; $d509: b1 12     
            AND #$f0           ; $d50b: 29 f0     
            STA $15            ; $d50d: 85 15     
            LDA $00,x          ; $d50f: b5 00     
            AND #$0f           ; $d511: 29 0f     
            ADC $14            ; $d513: 65 14     
            CMP #$0a           ; $d515: c9 0a     
            BCC __d51b         ; $d517: 90 02     
            ADC #$05           ; $d519: 69 05     
__d51b:     STA $14            ; $d51b: 85 14     
            CLC                ; $d51d: 18        
            LDA $00,x          ; $d51e: b5 00     
            AND #$f0           ; $d520: 29 f0     
            ADC $14            ; $d522: 65 14     
            ADC $15            ; $d524: 65 15     
            BCS __d52c         ; $d526: b0 04     
            CMP #$a0           ; $d528: c9 a0     
            BCC __d52f         ; $d52a: 90 03     

;-------------------------------------------------------------------------------
__d52c:     ADC #$5f           ; $d52c: 69 5f     
            SEC                ; $d52e: 38        

;-------------------------------------------------------------------------------
__d52f:     STA $00,x          ; $d52f: 95 00     
            DEX                ; $d531: ca        
            DEY                ; $d532: 88        
            BPL __d503         ; $d533: 10 ce     
            RTS                ; $d535: 60        

;-------------------------------------------------------------------------------
__d536:     .hex 44            ; $d536: 44            Data
__d537:     .hex d5 48 d5 4c   ; $d537: d5 48 d5 4c   Data
            .hex d5 50 d5 54   ; $d53b: d5 50 d5 54   Data
            .hex d5 58 d5 5c   ; $d53f: d5 58 d5 5c   Data
            .hex d5 76 49 00   ; $d543: d5 76 49 00   Data
            .hex 00 70 60 d5   ; $d547: 00 70 60 d5   Data
            .hex 00 77 60 d5   ; $d54b: 00 77 60 d5   Data
            .hex 00 50 60 d5   ; $d54f: 00 50 60 d5   Data
            .hex 00 57 67 d5   ; $d553: 00 57 67 d5   Data
            .hex 03 5f 54 00   ; $d557: 03 5f 54 00   Data
            .hex 03 74 5c 00   ; $d55b: 03 74 5c 00   Data
            .hex 03 01         ; $d55f: 03 01         Data
__d561:     .hex 63            ; $d561: 63            Data
__d562:     .hex d5 00 00 01   ; $d562: d5 00 00 01   Data
            .hex 00 00 00 02   ; $d566: 00 00 00 02   Data
            .hex 00 00 00 03   ; $d56a: 00 00 00 03   Data
            .hex 00 00 00 04   ; $d56e: 00 00 00 04   Data
            .hex 00 00 00 05   ; $d572: 00 00 00 05   Data
            .hex 00 00 00 02   ; $d576: 00 00 00 02   Data
            .hex 00 00 00 04   ; $d57a: 00 00 00 04   Data
            .hex 00 00 00 08   ; $d57e: 00 00 00 08   Data
            .hex 00 00 00 12   ; $d582: 00 00 00 12   Data
            .hex 00 00 00 16   ; $d586: 00 00 00 16   Data
            .hex 00 00 00 20   ; $d58a: 00 00 00 20   Data
            .hex 00 00 00 30   ; $d58e: 00 00 00 30   Data
            .hex 00 00 00 40   ; $d592: 00 00 00 40   Data
            .hex 00 00 00 50   ; $d596: 00 00 00 50   Data
            .hex 00 00 00 60   ; $d59a: 00 00 00 60   Data
            .hex 00 00 00 00   ; $d59e: 00 00 00 00   Data
            .hex 10 00 00 00   ; $d5a2: 10 00 00 00   Data
            .hex 50 00 00 10   ; $d5a6: 50 00 00 10   Data
            .hex 00            ; $d5aa: 00            Data

;-------------------------------------------------------------------------------
__d5ab:     LDA $30            ; $d5ab: a5 30     
            BEQ __d5be         ; $d5ad: f0 0f     
            STA $18            ; $d5af: 85 18     
            LDA #$40           ; $d5b1: a9 40     
            JSR __d4be         ; $d5b3: 20 be d4  
            LDA #$00           ; $d5b6: a9 00     
            STA $30            ; $d5b8: 85 30     
            LDA #$01           ; $d5ba: a9 01     
            STA $43            ; $d5bc: 85 43     
__d5be:     LDA $43            ; $d5be: a5 43     
            BEQ __d628         ; $d5c0: f0 66     
            CMP #$01           ; $d5c2: c9 01     
            BEQ __d5d5         ; $d5c4: f0 0f     
            LDA #$00           ; $d5c6: a9 00     
            STA $43            ; $d5c8: 85 43     
            JSR __d694         ; $d5ca: 20 94 d6  
            JSR __d6aa         ; $d5cd: 20 aa d6  
            LDY #$08           ; $d5d0: a0 08     
            JMP __d5d9         ; $d5d2: 4c d9 d5  

;-------------------------------------------------------------------------------
__d5d5:     INC $43            ; $d5d5: e6 43     
            LDY #$00           ; $d5d7: a0 00     
__d5d9:     LDA __d640,y       ; $d5d9: b9 40 d6  
            STA $10            ; $d5dc: 85 10     
            LDA __d641,y       ; $d5de: b9 41 d6  
            STA $11            ; $d5e1: 85 11     
            LDY #$00           ; $d5e3: a0 00     
            LDA ($10),y        ; $d5e5: b1 10     
            INY                ; $d5e7: c8        
            STA $12            ; $d5e8: 85 12     
            LDA ($10),y        ; $d5ea: b1 10     
            INY                ; $d5ec: c8        
            STA $13            ; $d5ed: 85 13     
            LDA ($10),y        ; $d5ef: b1 10     
            INY                ; $d5f1: c8        
            TAX                ; $d5f2: aa        
            LDA ($10),y        ; $d5f3: b1 10     
            INY                ; $d5f5: c8        
            STA $14            ; $d5f6: 85 14     
            LDA ($10),y        ; $d5f8: b1 10     
            STA $15            ; $d5fa: 85 15     
            LDY $2a            ; $d5fc: a4 2a     
            LDA $12            ; $d5fe: a5 12     
            STA $0500,y        ; $d600: 99 00 05  
            INY                ; $d603: c8        
            LDA $13            ; $d604: a5 13     
            STA $0500,y        ; $d606: 99 00 05  
            INY                ; $d609: c8        
            LDA $14            ; $d60a: a5 14     
            ASL                ; $d60c: 0a        
            STA $0500,y        ; $d60d: 99 00 05  
            INY                ; $d610: c8        
__d611:     LDA $00,x          ; $d611: b5 00     
            LSR                ; $d613: 4a        
            LSR                ; $d614: 4a        
            LSR                ; $d615: 4a        
            LSR                ; $d616: 4a        
            JSR __d629         ; $d617: 20 29 d6  
            LDA $00,x          ; $d61a: b5 00     
            INX                ; $d61c: e8        
            AND #$0f           ; $d61d: 29 0f     
            JSR __d629         ; $d61f: 20 29 d6  
            DEC $14            ; $d622: c6 14     
            BNE __d611         ; $d624: d0 eb     
            STY $2a            ; $d626: 84 2a     
__d628:     RTS                ; $d628: 60        

;-------------------------------------------------------------------------------
__d629:     BNE __d634         ; $d629: d0 09     
            DEC $15            ; $d62b: c6 15     
            bmi __d634         ; $d62d: 30 05     
            STA $0500,y        ; $d62f: 99 00 05  
            INY                ; $d632: c8        
            RTS                ; $d633: 60        

;-------------------------------------------------------------------------------
__d634:     CLC                ; $d634: 18        
            ADC #$01           ; $d635: 69 01     
            STA $0500,y        ; $d637: 99 00 05  
            INY                ; $d63a: c8        
            LDA #$00           ; $d63b: a9 00     
            STA $15            ; $d63d: 85 15     
            RTS                ; $d63f: 60        

;-------------------------------------------------------------------------------
__d640:     .hex 58            ; $d640: 58            Data
__d641:     .hex d6 5d d6 67   ; $d641: d6 5d d6 67   Data
            .hex d6 62 d6 6c   ; $d645: d6 62 d6 6c   Data
            .hex d6 71 d6 76   ; $d649: d6 71 d6 76   Data
            .hex d6 7b d6 80   ; $d64d: d6 7b d6 80   Data
            .hex d6 85 d6 8a   ; $d651: d6 85 d6 8a   Data
            .hex d6 8f d6 62   ; $d655: d6 8f d6 62   Data
            .hex 20 71 04 06   ; $d659: 20 71 04 06   Data
            .hex 74 20 71 04   ; $d65d: 74 20 71 04   Data
            .hex 06 62 20 b1   ; $d661: 06 62 20 b1   Data
            .hex 04 06 74 20   ; $d665: 04 06 74 20   Data
            .hex b1 04 06 6b   ; $d669: b1 04 06 6b   Data
            .hex 20 44 04 06   ; $d66d: 20 44 04 06   Data
            .hex 76 20 70 01   ; $d671: 76 20 70 01   Data
            .hex 01 7a 20 77   ; $d675: 01 7a 20 77   Data
            .hex 01 01 90 21   ; $d679: 01 01 90 21   Data
            .hex 50 01 01 10   ; $d67d: 50 01 01 10   Data
            .hex 22 51 01 01   ; $d681: 22 51 01 01   Data
            .hex 97 21 56 02   ; $d685: 97 21 56 02   Data
            .hex 02 17 22 5a   ; $d689: 02 17 22 5a   Data
            .hex 02 02 15 23   ; $d68d: 02 02 15 23   Data
            .hex 5d 03 04      ; $d691: 5d 03 04      Data

;-------------------------------------------------------------------------------
__d694:     LDX #$03           ; $d694: a2 03     
            SEC                ; $d696: 38        
__d697:     LDA $44,x          ; $d697: b5 44     
            SBC $71,x          ; $d699: f5 71     
            DEX                ; $d69b: ca        
            BPL __d697         ; $d69c: 10 f9     
            BCS __d6a9         ; $d69e: b0 09     
            LDX #$03           ; $d6a0: a2 03     
__d6a2:     LDA $71,x          ; $d6a2: b5 71     
            STA $44,x          ; $d6a4: 95 44     
            DEX                ; $d6a6: ca        
            BPL __d6a2         ; $d6a7: 10 f9     
__d6a9:     RTS                ; $d6a9: 60        

;-------------------------------------------------------------------------------
__d6aa:     LDA $75            ; $d6aa: a5 75     
            CMP $48            ; $d6ac: c5 48     
            BEQ __d6a9         ; $d6ae: f0 f9     
            LDA $72            ; $d6b0: a5 72     
            CMP $76            ; $d6b2: c5 76     
            BCC __d6a9         ; $d6b4: 90 f3     
            LDA $75            ; $d6b6: a5 75     
            BNE __d6bc         ; $d6b8: d0 02     
            STA $76            ; $d6ba: 85 76     
__d6bc:     INC $75            ; $d6bc: e6 75     
            BNE __d6c2         ; $d6be: d0 02     
            DEC $75            ; $d6c0: c6 75     
__d6c2:     LDY #$00           ; $d6c2: a0 00     
            JSR __d4e5         ; $d6c4: 20 e5 d4  
            BCC __d6cd         ; $d6c7: 90 04     
            LDA $48            ; $d6c9: a5 48     
            STA $75            ; $d6cb: 85 75     
__d6cd:     LDA #$01           ; $d6cd: a9 01     
            STA $0602          ; $d6cf: 8d 02 06  
            STA $0603          ; $d6d2: 8d 03 06  
            STA $0604          ; $d6d5: 8d 04 06  
            LDY #$02           ; $d6d8: a0 02     
            JSR __d4e5         ; $d6da: 20 e5 d4  
            BCC __d6e3         ; $d6dd: 90 04     
            LDA #$99           ; $d6df: a9 99     
            STA $70            ; $d6e1: 85 70     
__d6e3:     LDY #$0a           ; $d6e3: a0 0a     
            JMP __d5d9         ; $d6e5: 4c d9 d5  

;-------------------------------------------------------------------------------
__d6e8:     LDY #$04           ; $d6e8: a0 04     
            JSR __d4e5         ; $d6ea: 20 e5 d4  
            INC $7a            ; $d6ed: e6 7a     
            LDA $7a            ; $d6ef: a5 7a     
            AND #$0f           ; $d6f1: 29 0f     
            STA $7a            ; $d6f3: 85 7a     
            LDA $7d            ; $d6f5: a5 7d     
            CLC                ; $d6f7: 18        
            ADC #$01           ; $d6f8: 69 01     
            CMP #$20           ; $d6fa: c9 20     
            BCC __d700         ; $d6fc: 90 02     
            LDA #$1c           ; $d6fe: a9 1c     
__d700:     STA $7d            ; $d700: 85 7d     
            RTS                ; $d702: 60        

;-------------------------------------------------------------------------------
__d703:     LDY #$00           ; $d703: a0 00     
            JSR __cc15         ; $d705: 20 15 cc  
            LDY #$08           ; $d708: a0 08     
            JSR __d5d9         ; $d70a: 20 d9 d5  
            LDY #$0a           ; $d70d: a0 0a     
            JSR __d5d9         ; $d70f: 20 d9 d5  
            LDY #$0c           ; $d712: a0 0c     
            JSR __d5d9         ; $d714: 20 d9 d5  
            LDY #$00           ; $d717: a0 00     
            JMP __d5d9         ; $d719: 4c d9 d5  

;-------------------------------------------------------------------------------
__d71c:     LDA $42            ; $d71c: a5 42     
            BEQ __d735         ; $d71e: f0 15     
            LDA $21            ; $d720: a5 21     
            AND #$0f           ; $d722: 29 0f     
            BNE __d734         ; $d724: d0 0e     
            LDA $21            ; $d726: a5 21     
            LSR                ; $d728: 4a        
            LSR                ; $d729: 4a        
            LSR                ; $d72a: 4a        
            AND #$02           ; $d72b: 29 02     
            ORA $41            ; $d72d: 05 41     
            ASL                ; $d72f: 0a        
            TAY                ; $d730: a8        
            JMP __d77a         ; $d731: 4c 7a d7  

;-------------------------------------------------------------------------------
__d734:     RTS                ; $d734: 60        

;-------------------------------------------------------------------------------
__d735:     LDA #$02           ; $d735: a9 02     
            ORA $41            ; $d737: 05 41     
            ASL                ; $d739: 0a        
            TAY                ; $d73a: a8        
            JMP __d77a         ; $d73b: 4c 7a d7  

;-------------------------------------------------------------------------------
__d73e:     LDA $24            ; $d73e: a5 24     
            AND #$03           ; $d740: 29 03     
            CMP #$01           ; $d742: c9 01     
            BNE __d750         ; $d744: d0 0a     
            LDA #$f0           ; $d746: a9 f0     
            STA $0f            ; $d748: 85 0f     
            LDA $4a            ; $d74a: a5 4a     
            EOR #$01           ; $d74c: 49 01     
            STA $4a            ; $d74e: 85 4a     
__d750:     LDA $4a            ; $d750: a5 4a     
            ASL                ; $d752: 0a        
            ADC #$08           ; $d753: 69 08     
            PHA                ; $d755: 48        
            TAY                ; $d756: a8        
            JSR __d77a         ; $d757: 20 7a d7  
            PLA                ; $d75a: 68        
            CLC                ; $d75b: 18        
            ADC #$04           ; $d75c: 69 04     
            TAY                ; $d75e: a8        
            JMP __d77a         ; $d75f: 4c 7a d7  

;-------------------------------------------------------------------------------
            LDA $22            ; $d762: a5 22     
            AND #$03           ; $d764: 29 03     
            CMP #$01           ; $d766: c9 01     
            BNE __d774         ; $d768: d0 0a     
            LDA #$f0           ; $d76a: a9 f0     
            STA $0f            ; $d76c: 85 0f     
            LDA $2e            ; $d76e: a5 2e     
            EOR #$01           ; $d770: 49 01     
            STA $2e            ; $d772: 85 2e     
__d774:     LDA $2e            ; $d774: a5 2e     
            ASL                ; $d776: 0a        
            ADC #$10           ; $d777: 69 10     
            TAY                ; $d779: a8        
__d77a:     LDA __d7ad,y       ; $d77a: b9 ad d7  
            STA $10            ; $d77d: 85 10     
            LDA __d7ae,y       ; $d77f: b9 ae d7  
            STA $11            ; $d782: 85 11     
            LDY #$00           ; $d784: a0 00     
            LDX $2a            ; $d786: a6 2a     
            LDA ($10),y        ; $d788: b1 10     
            INY                ; $d78a: c8        
            STA $0500,x        ; $d78b: 9d 00 05  
            INX                ; $d78e: e8        
            LDA ($10),y        ; $d78f: b1 10     
            INY                ; $d791: c8        
            STA $0500,x        ; $d792: 9d 00 05  
            INX                ; $d795: e8        
            LDA ($10),y        ; $d796: b1 10     
            INY                ; $d798: c8        
            STA $0500,x        ; $d799: 9d 00 05  
            STA $12            ; $d79c: 85 12     
            INX                ; $d79e: e8        
__d79f:     LDA ($10),y        ; $d79f: b1 10     
            INY                ; $d7a1: c8        
            STA $0500,x        ; $d7a2: 9d 00 05  
            INX                ; $d7a5: e8        
            DEC $12            ; $d7a6: c6 12     
            BNE __d79f         ; $d7a8: d0 f5     
            STX $2a            ; $d7aa: 86 2a     
            RTS                ; $d7ac: 60        

;-------------------------------------------------------------------------------
__d7ad:     .hex c1            ; $d7ad: c1            Data
__d7ae:     .hex d7 c7 d7 cd   ; $d7ae: d7 c7 d7 cd   Data
            .hex d7 d3 d7 d9   ; $d7b2: d7 d3 d7 d9   Data
            .hex d7 e1 d7 dd   ; $d7b6: d7 e1 d7 dd   Data
            .hex d7 e5 d7 e9   ; $d7ba: d7 e5 d7 e9   Data
            .hex d7 ed d7 45   ; $d7be: d7 ed d7 45   Data
            .hex 20 03 00 00   ; $d7c2: 20 03 00 00   Data
            .hex 00 45 20 03   ; $d7c6: 00 45 20 03   Data
            .hex 00 00 00 45   ; $d7ca: 00 00 00 45   Data
            .hex 20 03 a8 aa   ; $d7ce: 20 03 a8 aa   Data
            .hex ab 45 20 03   ; $d7d2: ab 45 20 03   Data
            .hex a9 aa ab e9   ; $d7d6: a9 aa ab e9   Data
            .hex 21 01 af 29   ; $d7da: 21 01 af 29   Data
            .hex 22 01 00 e9   ; $d7de: 22 01 00 e9   Data
            .hex 21 01 00 29   ; $d7e2: 21 01 00 29   Data
            .hex 22 01 af ac   ; $d7e6: 22 01 af ac   Data
            .hex 21 01 00 ac   ; $d7ea: 21 01 00 ac   Data
            .hex 21 01 18      ; $d7ee: 21 01 18      Data

;-------------------------------------------------------------------------------
__d7f1:     JSR __d825         ; $d7f1: 20 25 d8  
__d7f4:     LDA __d838,y       ; $d7f4: b9 38 d8  
            STA ($1e),y        ; $d7f7: 91 1e     
            INY                ; $d7f9: c8        
            CPY #$07           ; $d7fa: c0 07     
            BNE __d7f4         ; $d7fc: d0 f6     
            LDA #$4b           ; $d7fe: a9 4b     
            LDY #$08           ; $d800: a0 08     
            STA ($1e),y        ; $d802: 91 1e     
            LDA #$00           ; $d804: a9 00     
            LDY #$0f           ; $d806: a0 0f     
            STA ($1e),y        ; $d808: 91 1e     
            RTS                ; $d80a: 60        

;-------------------------------------------------------------------------------
__d80b:     JSR __d825         ; $d80b: 20 25 d8  
__d80e:     LDA __d83f,y       ; $d80e: b9 3f d8  
            STA ($1e),y        ; $d811: 91 1e     
            INY                ; $d813: c8        
            CPY #$07           ; $d814: c0 07     
            BNE __d80e         ; $d816: d0 f6     
            LDA #$00           ; $d818: a9 00     
            LDY #$08           ; $d81a: a0 08     
            STA ($1e),y        ; $d81c: 91 1e     
            LDA #$02           ; $d81e: a9 02     
            LDY #$0f           ; $d820: a0 0f     
            STA ($1e),y        ; $d822: 91 1e     
            RTS                ; $d824: 60        

;-------------------------------------------------------------------------------
__d825:     LDA #$00           ; $d825: a9 00     
            STA $28            ; $d827: 85 28     
            LDA #$1c           ; $d829: a9 1c     
            STA $29            ; $d82b: 85 29     
            LDA #$00           ; $d82d: a9 00     
            STA $1e            ; $d82f: 85 1e     
            LDA #$04           ; $d831: a9 04     
            STA $1f            ; $d833: 85 1f     
            LDY #$00           ; $d835: a0 00     
            RTS                ; $d837: 60        

;-------------------------------------------------------------------------------
__d838:     .hex 00 34 00 1a   ; $d838: 00 34 00 1a   Data
            .hex 02 00 ff      ; $d83c: 02 00 ff      Data
__d83f:     .hex 00 35 00 0a   ; $d83f: 00 35 00 0a   Data
            .hex 06 00 ff      ; $d843: 06 00 ff      Data

;-------------------------------------------------------------------------------
__d846:     LDA #$30           ; $d846: a9 30     
            STA $4c            ; $d848: 85 4c     
            LDA #$00           ; $d84a: a9 00     
            STA $4d            ; $d84c: 85 4d     
            LDA #$10           ; $d84e: a9 10     
            STA $4e            ; $d850: 85 4e     
            LDA #$30           ; $d852: a9 30     
            STA $1e            ; $d854: 85 1e     
            LDA #$04           ; $d856: a9 04     
            STA $1f            ; $d858: 85 1f     
            LDX #$00           ; $d85a: a2 00     
__d85c:     LDA #$03           ; $d85c: a9 03     
            JSR __d894         ; $d85e: 20 94 d8  
            LDA #$01           ; $d861: a9 01     
            LDY #$06           ; $d863: a0 06     
            STA ($1e),y        ; $d865: 91 1e     
            TXA                ; $d867: 8a        
            CLC                ; $d868: 18        
            ADC #$08           ; $d869: 69 08     
            TAX                ; $d86b: aa        
            LDA $1e            ; $d86c: a5 1e     
            CLC                ; $d86e: 18        
            ADC #$10           ; $d86f: 69 10     
            STA $1e            ; $d871: 85 1e     
            CMP $68            ; $d873: c5 68     
            BNE __d85c         ; $d875: d0 e5     
            LDA #$00           ; $d877: a9 00     
            STA $35            ; $d879: 85 35     
            LDA #$09           ; $d87b: a9 09     
            STA $36            ; $d87d: 85 36     
            LDA #$04           ; $d87f: a9 04     
            STA $37            ; $d881: 85 37     
            LDA #$20           ; $d883: a9 20     
            STA $1e            ; $d885: 85 1e     
            LDA #$04           ; $d887: a9 04     
            STA $1f            ; $d889: 85 1f     
            LDA #$ff           ; $d88b: a9 ff     
            STA $0426          ; $d88d: 8d 26 04  
            LDX #$00           ; $d890: a2 00     
            LDA #$02           ; $d892: a9 02     
__d894:     LDY #$05           ; $d894: a0 05     
            STA ($1e),y        ; $d896: 91 1e     
            TXA                ; $d898: 8a        
            ASL                ; $d899: 0a        
            ASL                ; $d89a: 0a        
            ADC #$20           ; $d89b: 69 20     
            LDY #$00           ; $d89d: a0 00     
            STA ($1e),y        ; $d89f: 91 1e     
            INY                ; $d8a1: c8        
            LDA $0264,x        ; $d8a2: bd 64 02  
            STA ($1e),y        ; $d8a5: 91 1e     
            LDA $0265,x        ; $d8a7: bd 65 02  
            LDY #$03           ; $d8aa: a0 03     
            STA ($1e),y        ; $d8ac: 91 1e     
            INY                ; $d8ae: c8        
            LDA #$02           ; $d8af: a9 02     
            STA ($1e),y        ; $d8b1: 91 1e     
            LDA #$00           ; $d8b3: a9 00     
            LDY #$0f           ; $d8b5: a0 0f     
            STA ($1e),y        ; $d8b7: 91 1e     
            LDA #$4b           ; $d8b9: a9 4b     
            LDY #$08           ; $d8bb: a0 08     
            STA ($1e),y        ; $d8bd: 91 1e     
            RTS                ; $d8bf: 60        

;-------------------------------------------------------------------------------
__d8c0:     LDX #$00           ; $d8c0: a2 00     
__d8c2:     LDA __d8d3,x       ; $d8c2: bd d3 d8  
            STA $0410,x        ; $d8c5: 9d 10 04  
            INX                ; $d8c8: e8        
            CPX #$05           ; $d8c9: e0 05     
            BNE __d8c2         ; $d8cb: d0 f5     
            LDA #$0e           ; $d8cd: a9 0e     
            STA $041f          ; $d8cf: 8d 1f 04  
            RTS                ; $d8d2: 60        

;-------------------------------------------------------------------------------
__d8d3:     .hex 00 05 00 18   ; $d8d3: 00 05 00 18   Data
            .hex 18            ; $d8d7: 18            Data

;-------------------------------------------------------------------------------
__d8d8:     LDA #$00           ; $d8d8: a9 00     
            STA $1e            ; $d8da: 85 1e     
            LDA #$04           ; $d8dc: a9 04     
            STA $1f            ; $d8de: 85 1f     
__d8e0:     JSR __d939         ; $d8e0: 20 39 d9  
            JSR __da2c         ; $d8e3: 20 2c da  
            JSR __c305         ; $d8e6: 20 05 c3  
            LDA $1e            ; $d8e9: a5 1e     
            CLC                ; $d8eb: 18        
            ADC #$10           ; $d8ec: 69 10     
            STA $1e            ; $d8ee: 85 1e     
            CMP #$90           ; $d8f0: c9 90     
            BNE __d8e0         ; $d8f2: d0 ec     
            INC $4d            ; $d8f4: e6 4d     
            LDA $4d            ; $d8f6: a5 4d     
            CMP $4e            ; $d8f8: c5 4e     
            BCC __d938         ; $d8fa: 90 3c     
            LDA #$00           ; $d8fc: a9 00     
            STA $4d            ; $d8fe: 85 4d     
            LDX $4c            ; $d900: a6 4c     
            LDA $040f,x        ; $d902: bd 0f 04  
            CMP #$1a           ; $d905: c9 1a     
            BNE __d92b         ; $d907: d0 22     
            LDA $0407,x        ; $d909: bd 07 04  
            BNE __d92b         ; $d90c: d0 1d     
            STA $0400,x        ; $d90e: 9d 00 04  
            STA $0402,x        ; $d911: 9d 02 04  
            LDA #$1d           ; $d914: a9 1d     
            STA $0401,x        ; $d916: 9d 01 04  
            LDA #$06           ; $d919: a9 06     
            STA $0403,x        ; $d91b: 9d 03 04  
            STA $0404,x        ; $d91e: 9d 04 04  
            LDA #$1c           ; $d921: a9 1c     
            STA $040f,x        ; $d923: 9d 0f 04  
            LDA #$00           ; $d926: a9 00     
            STA $0408,x        ; $d928: 9d 08 04  
__d92b:     TXA                ; $d92b: 8a        
            CLC                ; $d92c: 18        
            ADC #$10           ; $d92d: 69 10     
            TAX                ; $d92f: aa        
            CPX #$90           ; $d930: e0 90     
            BNE __d936         ; $d932: d0 02     
            LDX #$10           ; $d934: a2 10     
__d936:     STX $4c            ; $d936: 86 4c     
__d938:     RTS                ; $d938: 60        

;-------------------------------------------------------------------------------
__d939:     LDY #$0d           ; $d939: a0 0d     
            LDA $1e            ; $d93b: a5 1e     
            BEQ __d98a         ; $d93d: f0 4b     
            LDA #$00           ; $d93f: a9 00     
            STA ($1e),y        ; $d941: 91 1e     
            LDA $1e            ; $d943: a5 1e     
            CMP #$20           ; $d945: c9 20     
            BCC __d94b         ; $d947: 90 02     
            BEQ __d998         ; $d949: f0 4d     
__d94b:     LDY #$0f           ; $d94b: a0 0f     
            LDA ($1e),y        ; $d94d: b1 1e     
            CMP #$02           ; $d94f: c9 02     
            BEQ __d997         ; $d951: f0 44     
            CMP #$0c           ; $d953: c9 0c     
            BNE __d997         ; $d955: d0 40     
            LDA $040f          ; $d957: ad 0f 04  
            CMP #$0c           ; $d95a: c9 0c     
            BNE __d970         ; $d95c: d0 12     
            LDY #$00           ; $d95e: a0 00     
            LDA ($1e),y        ; $d960: b1 1e     
            SEC                ; $d962: 38        
            SBC $0400          ; $d963: ed 00 04  
            INY                ; $d966: c8        
            LDA ($1e),y        ; $d967: b1 1e     
            SBC $0401          ; $d969: ed 01 04  
            CMP #$02           ; $d96c: c9 02     
            BCC __d997         ; $d96e: 90 27     
__d970:     LDY #$0a           ; $d970: a0 0a     
            LDA ($1e),y        ; $d972: b1 1e     
            AND #$fc           ; $d974: 29 fc     
            ORA #$01           ; $d976: 09 01     
            LDY #$03           ; $d978: a0 03     
            CMP ($1e),y        ; $d97a: d1 1e     
            BNE __d997         ; $d97c: d0 19     
            LDY #$0a           ; $d97e: a0 0a     
            LDA ($1e),y        ; $d980: b1 1e     
            LSR                ; $d982: 4a        
            LDY #$0d           ; $d983: a0 0d     
            BCS __d9b5         ; $d985: b0 2e     
            JMP __d9bc         ; $d987: 4c bc d9  

;-------------------------------------------------------------------------------
__d98a:     LDA $42            ; $d98a: a5 42     
            BEQ __d9c7         ; $d98c: f0 39     
            LDA $26            ; $d98e: a5 26     
            STA ($1e),y        ; $d990: 91 1e     
            LDA $22            ; $d992: a5 22     
            INY                ; $d994: c8        
            STA ($1e),y        ; $d995: 91 1e     
__d997:     RTS                ; $d997: 60        

;-------------------------------------------------------------------------------
__d998:     LDA $042f          ; $d998: ad 2f 04  
            CMP #$02           ; $d99b: c9 02     
            BEQ __d997         ; $d99d: f0 f8     
            CMP #$0c           ; $d99f: c9 0c     
            BNE __d997         ; $d9a1: d0 f4     
            LDA $36            ; $d9a3: a5 36     
            CMP $0423          ; $d9a5: cd 23 04  
            BCC __d997         ; $d9a8: 90 ed     
            LDA $0421          ; $d9aa: ad 21 04  
            CMP #$06           ; $d9ad: c9 06     
            BCC __d9bc         ; $d9af: 90 0b     
            CMP #$34           ; $d9b1: c9 34     
            BCC __d9c1         ; $d9b3: 90 0c     
__d9b5:     LDA #$ff           ; $d9b5: a9 ff     
            STA ($1e),y        ; $d9b7: 91 1e     
            RTS                ; $d9b9: 60        

;-------------------------------------------------------------------------------
__d9ba:     bmi __d9b5         ; $d9ba: 30 f9     
__d9bc:     LDA #$01           ; $d9bc: a9 01     
            STA ($1e),y        ; $d9be: 91 1e     
            RTS                ; $d9c0: 60        

;-------------------------------------------------------------------------------
__d9c1:     LDA $0426          ; $d9c1: ad 26 04  
            STA ($1e),y        ; $d9c4: 91 1e     
            RTS                ; $d9c6: 60        

;-------------------------------------------------------------------------------
__d9c7:     ASL $040e          ; $d9c7: 0e 0e 04  
            LDA $3c            ; $d9ca: a5 3c     
            BEQ __d9d1         ; $d9cc: f0 03     
            DEC $3c            ; $d9ce: c6 3c     
            RTS                ; $d9d0: 60        

;-------------------------------------------------------------------------------
__d9d1:     LDX $3d            ; $d9d1: a6 3d     
            LDA __ffe1,x       ; $d9d3: bd e1 ff  
            BEQ __d9e7         ; $d9d6: f0 0f     
            ASL                ; $d9d8: 0a        
            ASL                ; $d9d9: 0a        
            STA $3c            ; $d9da: 85 3c     
            LDA __ffe1,x       ; $d9dc: bd e1 ff  
            INX                ; $d9df: e8        
            STX $3d            ; $d9e0: 86 3d     
            ASL                ; $d9e2: 0a        
            BCS __d9ba         ; $d9e3: b0 d5     
            bmi __d9ec         ; $d9e5: 30 05     
__d9e7:     LDA #$00           ; $d9e7: a9 00     
            STA ($1e),y        ; $d9e9: 91 1e     
            RTS                ; $d9eb: 60        

;-------------------------------------------------------------------------------
__d9ec:     INC $040e          ; $d9ec: ee 0e 04  
            RTS                ; $d9ef: 60        

;-------------------------------------------------------------------------------
__d9f0:     LDA $0421          ; $d9f0: ad 21 04  
            SEC                ; $d9f3: 38        
            SBC #$06           ; $d9f4: e9 06     
            CMP #$2e           ; $d9f6: c9 2e     
            BCS __da02         ; $d9f8: b0 08     
            LDA $35            ; $d9fa: a5 35     
            BEQ __da1e         ; $d9fc: f0 20     
            LDA #$00           ; $d9fe: a9 00     
            STA $35            ; $da00: 85 35     
__da02:     LDA $36            ; $da02: a5 36     
            CMP #$09           ; $da04: c9 09     
            BNE __da0f         ; $da06: d0 07     
            LDA #$04           ; $da08: a9 04     
            STA $37            ; $da0a: 85 37     
            JMP __da17         ; $da0c: 4c 17 da  

;-------------------------------------------------------------------------------
__da0f:     CMP #$19           ; $da0f: c9 19     
            BNE __da17         ; $da11: d0 04     
            LDA #$fc           ; $da13: a9 fc     
            STA $37            ; $da15: 85 37     

;-------------------------------------------------------------------------------
__da17:     LDA $36            ; $da17: a5 36     
            CLC                ; $da19: 18        
            ADC $37            ; $da1a: 65 37     
            STA $36            ; $da1c: 85 36     
__da1e:     RTS                ; $da1e: 60        

;-------------------------------------------------------------------------------
__da1f:     LDA __e17a,x       ; $da1f: bd 7a e1  
            STA $1c            ; $da22: 85 1c     
            LDA __e17b,x       ; $da24: bd 7b e1  
            STA $1d            ; $da27: 85 1d     
            JMP ($001c)        ; $da29: 6c 1c 00  

;-------------------------------------------------------------------------------
__da2c:     LDY #$0f           ; $da2c: a0 0f     
            LDA ($1e),y        ; $da2e: b1 1e     
            TAX                ; $da30: aa        
            LDA $7c            ; $da31: a5 7c     
            BNE __da1f         ; $da33: d0 ea     
            LDA __da42,x       ; $da35: bd 42 da  
            STA $1c            ; $da38: 85 1c     
            LDA __da43,x       ; $da3a: bd 43 da  
            STA $1d            ; $da3d: 85 1d     
            JMP ($001c)        ; $da3f: 6c 1c 00  

;-------------------------------------------------------------------------------
__da42:     .hex 4f            ; $da42: 4f            Data
__da43:     .hex c1 70 da c7   ; $da43: c1 70 da c7   Data
            .hex da 94 db 45   ; $da47: da 94 db 45   Data
            .hex db 02 dc 5c   ; $da4b: db 02 dc 5c   Data
            .hex dc fe dc 62   ; $da4f: dc fe dc 62   Data
            .hex dd a8 dd c6   ; $da53: dd a8 dd c6   Data
            .hex dd 4f c1 4f   ; $da57: dd 4f c1 4f   Data
            .hex c1 d4 dd e0   ; $da5b: c1 d4 dd e0   Data
            .hex dd 2d de 61   ; $da5f: dd 2d de 61   Data
            .hex de 37 db 25   ; $da63: de 37 db 25   Data
            .hex de 7a de 98   ; $da67: de 7a de 98   Data
            .hex de 55 db 7b   ; $da6b: de 55 db 7b   Data
            .hex db            ; $da6f: db            Data

;-------------------------------------------------------------------------------
            LDA $1e            ; $da70: a5 1e     
            CMP #$20           ; $da72: c9 20     
            BNE __da7e         ; $da74: d0 08     
            LDA $042a          ; $da76: ad 2a 04  
            BEQ __da7e         ; $da79: f0 03     
            DEC $042a          ; $da7b: ce 2a 04  
__da7e:     JSR __e0b7         ; $da7e: 20 b7 e0  
            BEQ __dad8         ; $da81: f0 55     
            JSR __ea90         ; $da83: 20 90 ea  
            JSR __f0b1         ; $da86: 20 b1 f0  
            JSR __f0e7         ; $da89: 20 e7 f0  
            BNE __da91         ; $da8c: d0 03     
            JMP __db83         ; $da8e: 4c 83 db  

;-------------------------------------------------------------------------------
__da91:     LDY #$08           ; $da91: a0 08     
            LDA ($1e),y        ; $da93: b1 1e     
            SEC                ; $da95: 38        
            SBC #$49           ; $da96: e9 49     
            CMP #$09           ; $da98: c9 09     
            BCS __daa2         ; $da9a: b0 06     
            JSR __dee9         ; $da9c: 20 e9 de  
            JMP __e972         ; $da9f: 4c 72 e9  

;-------------------------------------------------------------------------------
__daa2:     LDA $1e            ; $daa2: a5 1e     
            CMP #$20           ; $daa4: c9 20     
            BEQ __daab         ; $daa6: f0 03     
            JSR __dea6         ; $daa8: 20 a6 de  
__daab:     LDA #$0b           ; $daab: a9 0b     
            LDY #$07           ; $daad: a0 07     
            STA ($1e),y        ; $daaf: 91 1e     
            LDA #$d0           ; $dab1: a9 d0     
__dab3:     LDY #$0b           ; $dab3: a0 0b     
            STA ($1e),y        ; $dab5: 91 1e     
            LDA #$09           ; $dab7: a9 09     
            INY                ; $dab9: c8        
            STA ($1e),y        ; $daba: 91 1e     
            LDA #$04           ; $dabc: a9 04     
            LDY #$0f           ; $dabe: a0 0f     
            STA ($1e),y        ; $dac0: 91 1e     
            LDY #$04           ; $dac2: a0 04     
            STA ($1e),y        ; $dac4: 91 1e     
            RTS                ; $dac6: 60        

;-------------------------------------------------------------------------------
            LDY #$07           ; $dac7: a0 07     
            LDA ($1e),y        ; $dac9: b1 1e     
            SEC                ; $dacb: 38        
            SBC #$01           ; $dacc: e9 01     
            STA ($1e),y        ; $dace: 91 1e     
            BNE __dad5         ; $dad0: d0 03     
            JMP __db83         ; $dad2: 4c 83 db  

;-------------------------------------------------------------------------------
__dad5:     JMP __e03d         ; $dad5: 4c 3d e0  

;-------------------------------------------------------------------------------
__dad8:     LDA $1e            ; $dad8: a5 1e     
            BNE __db11         ; $dada: d0 35     
            LDA #$1e           ; $dADC: a9 1e     
            STA $0404          ; $dade: 8d 04 04  
            LDA #$00           ; $dae1: a9 00     
            STA $0407          ; $dae3: 8d 07 04  
            LDA #$08           ; $dae6: a9 08     
            STA $040f          ; $dae8: 8d 0f 04  
            LDA #$01           ; $daeb: a9 01     
            STA $4b            ; $daed: 85 4b     
__daef:     JSR __f4bf         ; $daef: 20 bf f4  
            LDX #$10           ; $daf2: a2 10     
__daf4:     LDA $040f,x        ; $daf4: bd 0f 04  
            CMP #$16           ; $daf7: c9 16     
            BEQ __db07         ; $daf9: f0 0c     
            CMP #$20           ; $dafb: c9 20     
            BEQ __db07         ; $dafd: f0 08     
            LDA #$00           ; $daff: a9 00     
            STA $040f,x        ; $db01: 9d 0f 04  
            STA $0404,x        ; $db04: 9d 04 04  
__db07:     TXA                ; $db07: 8a        
            CLC                ; $db08: 18        
            ADC #$10           ; $db09: 69 10     
            TAX                ; $db0b: aa        
            CPX #$90           ; $db0c: e0 90     
            BNE __daf4         ; $db0e: d0 e4     
            RTS                ; $db10: 60        

;-------------------------------------------------------------------------------
__db11:     LDA #$20           ; $db11: a9 20     
            LDY #$04           ; $db13: a0 04     
            STA ($1e),y        ; $db15: 91 1e     
            LDA #$22           ; $db17: a9 22     
            LDY #$0f           ; $db19: a0 0f     
            STA ($1e),y        ; $db1b: 91 1e     
            LDY #$05           ; $db1d: a0 05     
            LDA ($1e),y        ; $db1f: b1 1e     
            TAX                ; $db21: aa        
            LDA #$78           ; $db22: a9 78     
            CPX #$03           ; $db24: e0 03     
            BNE __db2a         ; $db26: d0 02     
            LDA $65            ; $db28: a5 65     
__db2a:     LDY #$07           ; $db2a: a0 07     
            STA ($1e),y        ; $db2c: 91 1e     
            LDY __db33,x       ; $db2e: bc 33 db  
            .hex 4c ca         ; $db31: 4c ca     Suspected data
__db33:     .hex d4 44 44 08   ; $db33: d4 44 44 08   Data
            .hex a0 07 b1 1e   ; $db37: a0 07 b1 1e   Data
            .hex 38 e9 01 91   ; $db3b: 38 e9 01 91   Data
            .hex 1e d0 12 4c   ; $db3f: 1e d0 12 4c   Data
            .hex 17 dd         ; $db43: 17 dd         Data

;-------------------------------------------------------------------------------
            INC $0407          ; $db45: ee 07 04  
            LDA $0407          ; $db48: ad 07 04  
            CMP #$20           ; $db4b: c9 20     
            BCC __db54         ; $db4d: 90 05     
            LDA #$2a           ; $db4f: a9 2a     
            STA $040f          ; $db51: 8d 0f 04  
__db54:     RTS                ; $db54: 60        

;-------------------------------------------------------------------------------
            LDA $04a5          ; $db55: ad a5 04  
            ORA $04ad          ; $db58: 0d ad 04  
            BNE __db7a         ; $db5b: d0 1d     
            JSR __f4bf         ; $db5d: 20 bf f4  
            LDA #$01           ; $db60: a9 01     
            STA $060b          ; $db62: 8d 0b 06  
            STA $060c          ; $db65: 8d 0c 06  
            STA $060d          ; $db68: 8d 0d 06  
            LDA #$16           ; $db6b: a9 16     
            STA $0404          ; $db6d: 8d 04 04  
            LDA #$00           ; $db70: a9 00     
            STA $0407          ; $db72: 8d 07 04  
            LDA #$2c           ; $db75: a9 2c     
            STA $040f          ; $db77: 8d 0f 04  
__db7a:     RTS                ; $db7a: 60        

;-------------------------------------------------------------------------------
            INC $0407          ; $db7b: ee 07 04  
            BPL __db7a         ; $db7e: 10 fa     
            JMP __de6f         ; $db80: 4c 6f de  

;-------------------------------------------------------------------------------
__db83:     LDA #$00           ; $db83: a9 00     
            LDY #$08           ; $db85: a0 08     
            STA ($1e),y        ; $db87: 91 1e     
            LDA #$06           ; $db89: a9 06     
            LDY #$0f           ; $db8b: a0 0f     
            STA ($1e),y        ; $db8d: 91 1e     
            LDY #$04           ; $db8f: a0 04     
            STA ($1e),y        ; $db91: 91 1e     
__db93:     RTS                ; $db93: 60        

;-------------------------------------------------------------------------------
            JSR __e102         ; $db94: 20 02 e1  
            BEQ __dba4         ; $db97: f0 0b     
            LDY #$08           ; $db99: a0 08     
            LDA ($1e),y        ; $db9b: b1 1e     
            SEC                ; $db9d: 38        
            SBC #$49           ; $db9e: e9 49     
            CMP #$07           ; $dba0: c9 07     
            BCS __dba7         ; $dba2: b0 03     

;-------------------------------------------------------------------------------
__dba4:     JMP __dad8         ; $dba4: 4c d8 da  

;-------------------------------------------------------------------------------
__dba7:     LDY #$03           ; $dba7: a0 03     
            LDA ($1e),y        ; $dba9: b1 1e     
            CMP #$1c           ; $dbab: c9 1c     
            BCC __dbb2         ; $dbad: 90 03     
            JMP __dad8         ; $dbaf: 4c d8 da  

;-------------------------------------------------------------------------------
__dbb2:     JSR __e06a         ; $dbb2: 20 6a e0  
            JSR __e469         ; $dbb5: 20 69 e4  
            BCS __db93         ; $dbb8: b0 d9     
__dbba:     LDY #$05           ; $dbba: a0 05     
            LDA ($1e),y        ; $dbbc: b1 1e     
            BNE __dbe3         ; $dbbe: d0 23     
            STX $18            ; $dbc0: 86 18     
            LDA $42            ; $dbc2: a5 42     
            STA $060a          ; $dbc4: 8d 0a 06  
            LDY #$3c           ; $dbc7: a0 3c     
            JSR __d4ca         ; $dbc9: 20 ca d4  
            LDX $18            ; $dBCC: a6 18     
            LDA $0202,x        ; $dbce: bd 02 02  
            BNE __dbe3         ; $dbd1: d0 10     
            LDA #$01           ; $dbd3: a9 01     
            STA $0200,x        ; $dbd5: 9d 00 02  
            LDA #$09           ; $dbd8: a9 09     
            STA $0201,x        ; $dbda: 9d 01 02  
            LDA #$80           ; $dbdd: a9 80     
            STA $0202,x        ; $dbdf: 9d 02 02  
            RTS                ; $dbe2: 60        

;-------------------------------------------------------------------------------
__dbe3:     LDY #$01           ; $dbe3: a0 01     
            LDA $0201,x        ; $dbe5: bd 01 02  
            CMP #$08           ; $dbe8: c9 08     
            BCC __dbed         ; $dbea: 90 01     
            INY                ; $dbec: c8        
__dbed:     tya                ; $dbed: 98        
            STA $0200,x        ; $dbee: 9d 00 02  
            TXA                ; $dbf1: 8a        
            LDY #$0b           ; $dbf2: a0 0b     
            STA ($1e),y        ; $dbf4: 91 1e     
            LDA #$00           ; $dbf6: a9 00     
            LDY #$07           ; $dbf8: a0 07     
            STA ($1e),y        ; $dbfa: 91 1e     
            LDA #$0a           ; $dbfc: a9 0a     
            LDY #$0f           ; $dbfe: a0 0f     
            STA ($1e),y        ; $dc00: 91 1e     
            LDY #$0b           ; $dc02: a0 0b     
            LDA ($1e),y        ; $dc04: b1 1e     
            TAX                ; $dc06: aa        
            JSR __e4a4         ; $dc07: 20 a4 e4  
            LDA $0202,x        ; $dc0a: bd 02 02  
            BPL __dc12         ; $dc0d: 10 03     
            JMP __db83         ; $dc0f: 4c 83 db  

;-------------------------------------------------------------------------------
__dc12:     LDA $0201,x        ; $dc12: bd 01 02  
            CMP #$07           ; $dc15: c9 07     
            BNE __dc58         ; $dc17: d0 3f     
            LDY #$05           ; $dc19: a0 05     
            LDA ($1e),y        ; $dc1b: b1 1e     
            BNE __dc22         ; $dc1d: d0 03     
            DEC $0202,x        ; $dc1f: de 02 02  
__dc22:     LDA #$00           ; $dc22: a9 00     
            LDY #$08           ; $dc24: a0 08     
            STA ($1e),y        ; $dc26: 91 1e     
            LDA #$0c           ; $dc28: a9 0c     
            LDY #$0f           ; $dc2a: a0 0f     
            STA ($1e),y        ; $dc2c: 91 1e     
            LDA #$06           ; $dc2e: a9 06     
            LDY #$04           ; $dc30: a0 04     
            STA ($1e),y        ; $dc32: 91 1e     
            LDA $1e            ; $dc34: a5 1e     
            CMP #$20           ; $dc36: c9 20     
            BEQ __dc59         ; $dc38: f0 1f     
            LDY #$0a           ; $dc3a: a0 0a     
            LDA ($1e),y        ; $dc3c: b1 1e     
            AND #$fc           ; $dc3e: 29 fc     
            ORA #$01           ; $dc40: 09 01     
            LDY #$03           ; $dc42: a0 03     
            CMP ($1e),y        ; $dc44: d1 1e     
            BCC __dc58         ; $dc46: 90 10     
            LDA ($1e),y        ; $dc48: b1 1e     
            AND #$fc           ; $dc4a: 29 fc     
            STA $10            ; $dc4c: 85 10     
            LDY #$0a           ; $dc4e: a0 0a     
            LDA ($1e),y        ; $dc50: b1 1e     
            AND #$01           ; $dc52: 29 01     
            ORA $10            ; $dc54: 05 10     
            STA ($1e),y        ; $dc56: 91 1e     
__dc58:     RTS                ; $dc58: 60        

;-------------------------------------------------------------------------------
__dc59:     JMP __d9f0         ; $dc59: 4c f0 d9  

;-------------------------------------------------------------------------------
            JSR __e102         ; $dc5c: 20 02 e1  
            BNE __dc64         ; $dc5f: d0 03     
            JMP __dad8         ; $dc61: 4c d8 da  

;-------------------------------------------------------------------------------
__dc64:     LDY #$03           ; $dc64: a0 03     
            LDA ($1e),y        ; $dc66: b1 1e     
            AND #$03           ; $dc68: 29 03     
            SEC                ; $dc6a: 38        
            SBC #$01           ; $dc6b: e9 01     
            CMP #$02           ; $dc6d: c9 02     
            BCS __dc77         ; $dc6f: b0 06     
            LDY #$0d           ; $dc71: a0 0d     
            LDA ($1e),y        ; $dc73: b1 1e     
            BNE __dccd         ; $dc75: d0 56     
__dc77:     LDY #$08           ; $dc77: a0 08     
            LDA ($1e),y        ; $dc79: b1 1e     
            CMP #$59           ; $dc7b: c9 59     
            BEQ __dc91         ; $dc7d: f0 12     
            SEC                ; $dc7f: 38        
            SBC #$30           ; $dc80: e9 30     
            CMP #$20           ; $dc82: c9 20     
            BCC __dc91         ; $dc84: 90 0b     
            LDY #$03           ; $dc86: a0 03     
            LDA ($1e),y        ; $dc88: b1 1e     
            CMP #$06           ; $dc8a: c9 06     
            BCC __dc91         ; $dc8c: 90 03     
            JMP __e084         ; $dc8e: 4c 84 e0  

;-------------------------------------------------------------------------------
__dc91:     LDY #$03           ; $dc91: a0 03     
            LDA ($1e),y        ; $dc93: b1 1e     
            AND #$fc           ; $dc95: 29 fc     
            STA $10            ; $dc97: 85 10     
            LDA $1e            ; $dc99: a5 1e     
            CMP #$20           ; $dc9b: c9 20     
            BEQ __dcbd         ; $dc9d: f0 1e     
            LDY #$0a           ; $dc9f: a0 0a     
            LDA ($1e),y        ; $dca1: b1 1e     
            AND #$fc           ; $dca3: 29 fc     
            CMP $10            ; $dca5: c5 10     
            BEQ __dcb4         ; $dca7: f0 0b     
            LDA ($1e),y        ; $dca9: b1 1e     
            AND #$03           ; $dcab: 29 03     
            ORA $10            ; $dcad: 05 10     
            STA ($1e),y        ; $dcaf: 91 1e     
            JMP __db83         ; $dcb1: 4c 83 db  

;-------------------------------------------------------------------------------
__dcb4:     LDA ($1e),y        ; $dcb4: b1 1e     
            EOR #$01           ; $dcb6: 49 01     
            STA ($1e),y        ; $dcb8: 91 1e     
            JMP __db83         ; $dcba: 4c 83 db  

;-------------------------------------------------------------------------------
__dcbd:     LDA $10            ; $dcbd: a5 10     
            ORA #$01           ; $dcbf: 09 01     
            SEC                ; $dcc1: 38        
            SBC $37            ; $dcc2: e5 37     
            STA $36            ; $dcc4: 85 36     
            LDA #$01           ; $dcc6: a9 01     
            STA $35            ; $dcc8: 85 35     
            JMP __db83         ; $dcca: 4c 83 db  

;-------------------------------------------------------------------------------
__dccd:     LDY #$06           ; $dccd: a0 06     
            STA ($1e),y        ; $dccf: 91 1e     
            LDY #$03           ; $dcd1: a0 03     
            LDA ($1e),y        ; $dcd3: b1 1e     
            AND #$fe           ; $dcd5: 29 fe     
            ORA #$02           ; $dcd7: 09 02     
            STA ($1e),y        ; $dcd9: 91 1e     
            DEY                ; $dcdb: 88        
            LDA #$00           ; $dcdc: a9 00     
            STA ($1e),y        ; $dcde: 91 1e     
            LDA #$10           ; $dce0: a9 10     
            LDY #$07           ; $dce2: a0 07     
            STA ($1e),y        ; $dce4: 91 1e     
            LDA #$e0           ; $dce6: a9 e0     
            LDY #$0b           ; $dce8: a0 0b     
            STA ($1e),y        ; $dcea: 91 1e     
            LDA #$04           ; $dcec: a9 04     
            INY                ; $dcee: c8        
            STA ($1e),y        ; $dcef: 91 1e     
            LDA #$0e           ; $dcf1: a9 0e     
            LDY #$0f           ; $dcf3: a0 0f     
            STA ($1e),y        ; $dcf5: 91 1e     
            LDA #$04           ; $dcf7: a9 04     
            LDY #$04           ; $dcf9: a0 04     
            STA ($1e),y        ; $dcfb: 91 1e     
            RTS                ; $dcfd: 60        

;-------------------------------------------------------------------------------
            LDY #$08           ; $dcfe: a0 08     
            LDA ($1e),y        ; $dd00: b1 1e     
            SEC                ; $dd02: 38        
            SBC #$49           ; $dd03: e9 49     
            CMP #$10           ; $dd05: c9 10     
            BCC __dd40         ; $dd07: 90 37     
            LDY #$07           ; $dd09: a0 07     
            LDA ($1e),y        ; $dd0b: b1 1e     
            SEC                ; $dd0d: 38        
            SBC #$01           ; $dd0e: e9 01     
            STA ($1e),y        ; $dd10: 91 1e     
            BEQ __dd17         ; $dd12: f0 03     
            JMP __e03d         ; $dd14: 4c 3d e0  

;-------------------------------------------------------------------------------
__dd17:     LDA #$00           ; $dd17: a9 00     
            LDY #$02           ; $dd19: a0 02     
            STA ($1e),y        ; $dd1b: 91 1e     
            INY                ; $dd1d: c8        
            LDA ($1e),y        ; $dd1e: b1 1e     
            AND #$fc           ; $dd20: 29 fc     
            ORA #$02           ; $dd22: 09 02     
            STA ($1e),y        ; $dd24: 91 1e     
            LDA #$4b           ; $dd26: a9 4b     
            LDY #$08           ; $dd28: a0 08     
            STA ($1e),y        ; $dd2a: 91 1e     
            LDY #$05           ; $dd2c: a0 05     
            LDA ($1e),y        ; $dd2e: b1 1e     
            BNE __dd35         ; $dd30: d0 03     
            JSR __e3de         ; $dd32: 20 de e3  
__dd35:     LDA #$02           ; $dd35: a9 02     
            LDY #$0f           ; $dd37: a0 0f     
            STA ($1e),y        ; $dd39: 91 1e     
            LDY #$04           ; $dd3b: a0 04     
            STA ($1e),y        ; $dd3d: 91 1e     
            RTS                ; $dd3f: 60        

;-------------------------------------------------------------------------------
__dd40:     LDA $1e            ; $dd40: a5 1e     
            CMP #$20           ; $dd42: c9 20     
            BEQ __dd4c         ; $dd44: f0 06     
            JSR __dea6         ; $dd46: 20 a6 de  
            JMP __dd4f         ; $dd49: 4c 4f dd  

;-------------------------------------------------------------------------------
__dd4c:     JSR __da02         ; $dd4c: 20 02 da  

;-------------------------------------------------------------------------------
__dd4f:     LDA #$00           ; $dd4f: a9 00     
            SEC                ; $dd51: 38        
            LDY #$06           ; $dd52: a0 06     
            SBC ($1e),y        ; $dd54: f1 1e     
            STA ($1e),y        ; $dd56: 91 1e     
            LDA #$06           ; $dd58: a9 06     
            INY                ; $dd5a: c8        
            STA ($1e),y        ; $dd5b: 91 1e     
            LDA #$00           ; $dd5d: a9 00     
            JMP __dab3         ; $dd5f: 4c b3 da  

;-------------------------------------------------------------------------------
            JSR __f0b1         ; $dd62: 20 b1 f0  
            JSR __f0e7         ; $dd65: 20 e7 f0  
            BEQ __dda2         ; $dd68: f0 38     
            LDY #$08           ; $dd6a: a0 08     
            LDA ($1e),y        ; $dd6c: b1 1e     
            SEC                ; $dd6e: 38        
            SBC #$49           ; $dd6f: e9 49     
            CMP #$09           ; $dd71: c9 09     
            BCS __dda5         ; $dd73: b0 30     
            LDA $1e            ; $dd75: a5 1e     
            BNE __dd7c         ; $dd77: d0 03     
            JSR __e134         ; $dd79: 20 34 e1  
__dd7c:     LDA #$80           ; $dd7c: a9 80     
            JSR __df09         ; $dd7e: 20 09 df  
            LDY #$07           ; $dd81: a0 07     
            LDA ($1e),y        ; $dd83: b1 1e     
            SEC                ; $dd85: 38        
            SBC #$01           ; $dd86: e9 01     
            STA ($1e),y        ; $dd88: 91 1e     
            BNE __dda1         ; $dd8a: d0 15     
            LDY #$05           ; $dd8c: a0 05     
            LDA ($1e),y        ; $dd8e: b1 1e     
            BNE __dd95         ; $dd90: d0 03     
            JMP __dd17         ; $dd92: 4c 17 dd  

;-------------------------------------------------------------------------------
__dd95:     LDA $65            ; $dd95: a5 65     
            LDY #$07           ; $dd97: a0 07     
            STA ($1e),y        ; $dd99: 91 1e     
            LDA #$12           ; $dd9b: a9 12     
            LDY #$0f           ; $dd9d: a0 0f     
            STA ($1e),y        ; $dd9f: 91 1e     
__dda1:     RTS                ; $dda1: 60        

;-------------------------------------------------------------------------------
__dda2:     JMP __db83         ; $dda2: 4c 83 db  

;-------------------------------------------------------------------------------
__dda5:     JMP __daa2         ; $dda5: 4c a2 da  

;-------------------------------------------------------------------------------
            LDY #$07           ; $dda8: a0 07     
            LDA ($1e),y        ; $ddaa: b1 1e     
            SEC                ; $ddac: 38        
            SBC #$01           ; $ddad: e9 01     
            STA ($1e),y        ; $ddaf: 91 1e     
            BNE __dda1         ; $ddb1: d0 ee     
            LDA #$40           ; $ddb3: a9 40     
            LDY #$07           ; $ddb5: a0 07     
            STA ($1e),y        ; $ddb7: 91 1e     
            LDA #$0e           ; $ddb9: a9 0e     
            LDY #$04           ; $ddbb: a0 04     
            STA ($1e),y        ; $ddbd: 91 1e     
            LDA #$14           ; $ddbf: a9 14     
            LDY #$0f           ; $ddc1: a0 0f     
            STA ($1e),y        ; $ddc3: 91 1e     
__ddc5:     RTS                ; $ddc5: 60        

;-------------------------------------------------------------------------------
            LDY #$07           ; $ddc6: a0 07     
            LDA ($1e),y        ; $ddc8: b1 1e     
            SEC                ; $ddca: 38        
            SBC #$01           ; $ddcb: e9 01     
            STA ($1e),y        ; $ddcd: 91 1e     
            BNE __ddc5         ; $ddcf: d0 f4     
            JMP __dd17         ; $ddd1: 4c 17 dd  

;-------------------------------------------------------------------------------
            LDY #$07           ; $ddd4: a0 07     
            LDA ($1e),y        ; $ddd6: b1 1e     
            BEQ __dddf         ; $ddd8: f0 05     
            SEC                ; $ddda: 38        
            SBC #$01           ; $dddb: e9 01     
            STA ($1e),y        ; $dddd: 91 1e     
__dddf:     RTS                ; $dddf: 60        

;-------------------------------------------------------------------------------
            LDA $4b            ; $dde0: a5 4b     
            ORA $4f            ; $dde2: 05 4f     
            BNE __de24         ; $dde4: d0 3e     
            LDY #$08           ; $dde6: a0 08     
            LDA ($1e),y        ; $dde8: b1 1e     
            SEC                ; $ddea: 38        
            SBC #$49           ; $ddeb: e9 49     
            CMP #$07           ; $dded: c9 07     
            BCC __de07         ; $ddef: 90 16     
            LDY #$03           ; $ddf1: a0 03     
            LDA ($1e),y        ; $ddf3: b1 1e     
            CMP #$1c           ; $ddf5: c9 1c     
            BCS __de04         ; $ddf7: b0 0b     
            JSR __e06a         ; $ddf9: 20 6a e0  
            JSR __e469         ; $ddfc: 20 69 e4  
            BCS __de24         ; $ddff: b0 23     
            JMP __dbba         ; $de01: 4c ba db  

;-------------------------------------------------------------------------------
__de04:     JMP __dad8         ; $de04: 4c d8 da  

;-------------------------------------------------------------------------------
__de07:     LDA $1e            ; $de07: a5 1e     
            CMP #$20           ; $de09: c9 20     
            BNE __de2a         ; $de0b: d0 1d     
            LDA #$24           ; $de0d: a9 24     
            STA $042f          ; $de0f: 8d 2f 04  
            LDA #$12           ; $de12: a9 12     
            STA $0424          ; $de14: 8d 24 04  
            LDA #$78           ; $de17: a9 78     
            STA $0427          ; $de19: 8d 27 04  
            LDA #$09           ; $de1c: a9 09     
            STA $36            ; $de1e: 85 36     
            LDA #$04           ; $de20: a9 04     
            STA $37            ; $de22: 85 37     
__de24:     RTS                ; $de24: 60        

;-------------------------------------------------------------------------------
            DEC $0427          ; $de25: ce 27 04  
            BNE __de24         ; $de28: d0 fa     
__de2a:     JMP __dd17         ; $de2a: 4c 17 dd  

;-------------------------------------------------------------------------------
            DEC $0427          ; $de2d: ce 27 04  
            BEQ __de59         ; $de30: f0 27     
            LDA $0423          ; $de32: ad 23 04  
            CMP $0403          ; $de35: cd 03 04  
            BNE __de79         ; $de38: d0 3f     
            LDA $0421          ; $de3a: ad 21 04  
            SEC                ; $de3d: 38        
            SBC $0401          ; $de3e: ed 01 04  
            CMP #$02           ; $de41: c9 02     
            BCS __de79         ; $de43: b0 34     
            LDA #$20           ; $de45: a9 20     
            STA $042f          ; $de47: 8d 2f 04  
            LDA #$15           ; $de4a: a9 15     
            STA $0424          ; $de4c: 8d 24 04  
            LDA #$78           ; $de4f: a9 78     
            STA $0427          ; $de51: 8d 27 04  
            LDY #$44           ; $de54: a0 44     
            JMP __d4ca         ; $de56: 4c ca d4  

;-------------------------------------------------------------------------------
__de59:     LDA #$10           ; $de59: a9 10     
            STA $042a          ; $de5b: 8d 2a 04  
            JMP __dd17         ; $de5e: 4c 17 dd  

;-------------------------------------------------------------------------------
            DEC $0427          ; $de61: ce 27 04  
            BNE __de79         ; $de64: d0 13     
            LDA $4b            ; $de66: a5 4b     
            ORA $4f            ; $de68: 05 4f     
            BNE __de6f         ; $de6a: d0 03     
            JMP __dd17         ; $de6c: 4c 17 dd  

;-------------------------------------------------------------------------------
__de6f:     LDA #$00           ; $de6f: a9 00     
            LDY #$0f           ; $de71: a0 0f     
            STA ($1e),y        ; $de73: 91 1e     
            LDY #$04           ; $de75: a0 04     
            STA ($1e),y        ; $de77: 91 1e     
__de79:     RTS                ; $de79: 60        

;-------------------------------------------------------------------------------
            LDY #$07           ; $de7a: a0 07     
            LDA ($1e),y        ; $de7c: b1 1e     
            SEC                ; $de7e: 38        
            SBC #$01           ; $de7f: e9 01     
            STA ($1e),y        ; $de81: 91 1e     
            BNE __de97         ; $de83: d0 12     
            LDA #$28           ; $de85: a9 28     
            LDY #$0f           ; $de87: a0 0f     
            STA ($1e),y        ; $de89: 91 1e     
            LDA #$24           ; $de8b: a9 24     
            LDY #$04           ; $de8d: a0 04     
            STA ($1e),y        ; $de8f: 91 1e     
            LDA #$40           ; $de91: a9 40     
            LDY #$07           ; $de93: a0 07     
            STA ($1e),y        ; $de95: 91 1e     
__de97:     RTS                ; $de97: 60        

;-------------------------------------------------------------------------------
            LDY #$07           ; $de98: a0 07     
            LDA ($1e),y        ; $de9a: b1 1e     
            SEC                ; $de9c: 38        
            SBC #$01           ; $de9d: e9 01     
            STA ($1e),y        ; $de9f: 91 1e     
            BNE __de97         ; $dea1: d0 f4     
            JMP __db83         ; $dea3: 4c 83 db  

;-------------------------------------------------------------------------------
__dea6:     LDY #$06           ; $dea6: a0 06     
            LDA ($1e),y        ; $dea8: b1 1e     
            AND #$01           ; $deaa: 29 01     
            EOR #$01           ; $deac: 49 01     
            STA $10            ; $deae: 85 10     
            LDY #$03           ; $deb0: a0 03     
            LDA ($1e),y        ; $deb2: b1 1e     
            AND #$fc           ; $deb4: 29 fc     
            ORA $10            ; $deb6: 05 10     
            STA $10            ; $deb8: 85 10     
            LDY #$01           ; $deba: a0 01     
            LDA ($1e),y        ; $debc: b1 1e     
            CMP $0401          ; $debe: cd 01 04  
            LDA $0403          ; $DEC1: ad 03 04  
            AND #$fc           ; $DEC4: 29 fc     
            ADC #$00           ; $DEC6: 69 00     
            LDY #$0a           ; $DEC8: a0 0a     
            STA ($1e),y        ; $DECa: 91 1e     
            CMP $10            ; $DECc: c5 10     
            BNE __dee1         ; $DECe: d0 11     
            LDX $21            ; $ded0: a6 21     
            LDA __c000,x       ; $ded2: bd 00 c0  
            LSR                ; $ded5: 4a        
            LDA #$04           ; $ded6: a9 04     
            BCC __dedc         ; $ded8: 90 02     
            LDA #$fc           ; $deda: a9 fc     
__dedc:     CLC                ; $dedc: 18        
            ADC ($1e),y        ; $dedd: 71 1e     
            STA ($1e),y        ; $dedf: 91 1e     
__dee1:     RTS                ; $dee1: 60        

;-------------------------------------------------------------------------------
__dee2:     LDA #$00           ; $dee2: a9 00     
            LDY #$07           ; $dee4: a0 07     
            STA ($1e),y        ; $dee6: 91 1e     
__dee8:     RTS                ; $dee8: 60        

;-------------------------------------------------------------------------------
__dee9:     LDA $1e            ; $dee9: a5 1e     
            BNE __def7         ; $deeb: d0 0a     
            LDY #$0d           ; $deed: a0 0d     
            LDA ($1e),y        ; $deef: b1 1e     
            BEQ __dee2         ; $def1: f0 ef     
            LDY #$06           ; $def3: a0 06     
            STA ($1e),y        ; $def5: 91 1e     
__def7:     LDY #$07           ; $def7: a0 07     
            LDA ($1e),y        ; $def9: b1 1e     
            CLC                ; $defb: 18        
            ADC #$01           ; $defc: 69 01     
            STA ($1e),y        ; $defe: 91 1e     
            LDY #$09           ; $df00: a0 09     
            LDA ($1e),y        ; $df02: b1 1e     
            BNE __dee8         ; $df04: d0 e2     
            JSR __e018         ; $df06: 20 18 e0  
__df09:     LDX #$04           ; $df09: a2 04     
__df0b:     STA $10            ; $df0b: 85 10     
            JSR __df8a         ; $df0d: 20 8a df  
            LDY #$06           ; $df10: a0 06     
            LDA ($1e),y        ; $df12: b1 1e     
            bmi __df53         ; $df14: 30 3d     
            LDY #$01           ; $df16: a0 01     
            LDA ($1e),y        ; $df18: b1 1e     
            CMP #$38           ; $df1a: c9 38     
            BEQ __df36         ; $df1c: f0 18     
            DEY                ; $df1e: 88        
            LDA ($1e),y        ; $df1f: b1 1e     
            CLC                ; $df21: 18        
            ADC $10            ; $df22: 65 10     
            STA ($1e),y        ; $df24: 91 1e     
            BCC __df52         ; $df26: 90 2a     
            INY                ; $df28: c8        
            LDA ($1e),y        ; $df29: b1 1e     
            ADC #$00           ; $df2b: 69 00     
            STA ($1e),y        ; $df2d: 91 1e     
            CMP #$38           ; $df2f: c9 38     
            BCS __df36         ; $df31: b0 03     
            JMP __dfcd         ; $df33: 4c cd df  

;-------------------------------------------------------------------------------
__df36:     DEY                ; $df36: 88        
            LDA #$00           ; $df37: a9 00     
            STA ($1e),y        ; $df39: 91 1e     
            LDA #$4d           ; $df3b: a9 4d     
            LDY #$08           ; $df3d: a0 08     
            STA ($1e),y        ; $df3f: 91 1e     
            LDA $1e            ; $df41: a5 1e     
            BEQ __df52         ; $df43: f0 0d     
            CMP #$20           ; $df45: c9 20     
            BNE __df4c         ; $df47: d0 03     
            JSR __d9f0         ; $df49: 20 f0 d9  
__df4c:     LDA #$ff           ; $df4c: a9 ff     
            LDY #$06           ; $df4e: a0 06     
            STA ($1e),y        ; $df50: 91 1e     
__df52:     RTS                ; $df52: 60        

;-------------------------------------------------------------------------------
__df53:     LDY #$00           ; $df53: a0 00     
            LDA ($1e),y        ; $df55: b1 1e     
            SEC                ; $df57: 38        
            SBC $10            ; $df58: e5 10     
            STA ($1e),y        ; $df5a: 91 1e     
            BCS __df89         ; $df5c: b0 2b     
            INY                ; $df5e: c8        
            LDA ($1e),y        ; $df5f: b1 1e     
            SBC #$00           ; $df61: e9 00     
            STA ($1e),y        ; $df63: 91 1e     
            CMP #$02           ; $df65: c9 02     
            BCS __dfc9         ; $df67: b0 60     
            LDA #$02           ; $df69: a9 02     
            STA ($1e),y        ; $df6b: 91 1e     
            DEY                ; $df6d: 88        
            LDA #$00           ; $df6e: a9 00     
            STA ($1e),y        ; $df70: 91 1e     
            LDA #$4c           ; $df72: a9 4c     
            LDY #$08           ; $df74: a0 08     
            STA ($1e),y        ; $df76: 91 1e     
            LDA $1e            ; $df78: a5 1e     
            BEQ __df89         ; $df7a: f0 0d     
            CMP #$20           ; $df7c: c9 20     
            BNE __df83         ; $df7e: d0 03     
            JSR __d9f0         ; $df80: 20 f0 d9  
__df83:     LDA #$01           ; $df83: a9 01     
            LDY #$06           ; $df85: a0 06     
            STA ($1e),y        ; $df87: 91 1e     
__df89:     RTS                ; $df89: 60        

;-------------------------------------------------------------------------------
__df8a:     LDY #$05           ; $df8a: a0 05     
            LDA ($1e),y        ; $df8c: b1 1e     
            BNE __dfb4         ; $df8e: d0 24     
            LDA $0401          ; $df90: ad 01 04  
            SEC                ; $df93: 38        
            SBC #$0f           ; $df94: e9 0f     
            CMP #$1c           ; $df96: c9 1c     
            BCS __dfb4         ; $df98: b0 1a     
            LDA $0406          ; $df9a: ad 06 04  
            bmi __dfb5         ; $df9d: 30 16     
            LDA $28            ; $df9f: a5 28     
            CLC                ; $dfa1: 18        
            ADC $10            ; $dfa2: 65 10     
            STA $11            ; $dfa4: 85 11     
            LDA $29            ; $dfa6: a5 29     
            ADC #$00           ; $dfa8: 69 00     
            CMP #$1c           ; $dfaa: c9 1c     
            BCS __dfb4         ; $dfac: b0 06     
            STA $29            ; $dfae: 85 29     
            LDA $11            ; $dfb0: a5 11     
            STA $28            ; $dfb2: 85 28     
__dfb4:     RTS                ; $dfb4: 60        

;-------------------------------------------------------------------------------
__dfb5:     LDA $28            ; $dfb5: a5 28     
            SEC                ; $dfb7: 38        
            SBC $10            ; $dfb8: e5 10     
            STA $11            ; $dfba: 85 11     
            LDA $29            ; $dfbc: a5 29     
            SBC #$00           ; $dfbe: e9 00     
            BCC __dfc8         ; $dfc0: 90 06     
            STA $29            ; $dfc2: 85 29     
            LDA $11            ; $dfc4: a5 11     
            STA $28            ; $dfc6: 85 28     
__dfc8:     RTS                ; $dfc8: 60        

;-------------------------------------------------------------------------------
__dfc9:     TXA                ; $dfc9: 8a        
            ORA #$04           ; $dfca: 09 04     
            TAX                ; $dfcc: aa        
__dfcd:     LDY #$01           ; $dfcd: a0 01     
            LDA ($1e),y        ; $dfcf: b1 1e     
            CLC                ; $dfd1: 18        
            ADC __e010,x       ; $dfd2: 7d 10 e0  
            ASL                ; $dfd5: 0a        
            ASL                ; $dfd6: 0a        
            ASL                ; $dfd7: 0a        
            STA $10            ; $dfd8: 85 10     
            LDY #$03           ; $dfda: a0 03     
            LDA ($1e),y        ; $dfdc: b1 1e     
            BCC __dfe2         ; $dfde: 90 02     
            ORA #$20           ; $dfe0: 09 20     
__dfe2:     CLC                ; $dfe2: 18        
            ADC __e011,x       ; $dfe3: 7d 11 e0  
            LSR                ; $dfe6: 4a        
            ROR $10            ; $dfe7: 66 10     
            LSR                ; $dfe9: 4a        
            ROR $10            ; $dfea: 66 10     
            LSR                ; $dfec: 4a        
            ROR $10            ; $dfed: 66 10     
            ORA #$20           ; $dfef: 09 20     
            STA $11            ; $dff1: 85 11     
            LDX $2b            ; $dff3: a6 2b     
            LDA $10            ; $dff5: a5 10     
            STA $04c0,x        ; $dff7: 9d c0 04  
            INX                ; $dffa: e8        
            LDA $11            ; $dffb: a5 11     
            STA $04c0,x        ; $dffd: 9d c0 04  
            INX                ; $e000: e8        
            LDA $1e            ; $e001: a5 1e     
            STA $04c0,x        ; $e003: 9d c0 04  
            INX                ; $e006: e8        
            LDA $1f            ; $e007: a5 1f     
            STA $04c0,x        ; $e009: 9d c0 04  
            INX                ; $e00c: e8        
            STX $2b            ; $e00d: 86 2b     
            RTS                ; $e00f: 60        

;-------------------------------------------------------------------------------
__e010:     .hex 01            ; $e010: 01            Data
__e011:     .hex 00 02 01 01   ; $e011: 00 02 01 01   Data
            .hex 02 00 01      ; $e015: 02 00 01      Data

;-------------------------------------------------------------------------------
__e018:     LDY #$00           ; $e018: a0 00     
            LDA $60            ; $e01a: a5 60     
            BEQ __e020         ; $e01c: f0 02     
            LDY #$04           ; $e01e: a0 04     
__e020:     STY $10            ; $e020: 84 10     
            LDY #$05           ; $e022: a0 05     
            LDA ($1e),y        ; $e024: b1 1e     
            BEQ __e032         ; $e026: f0 0a     
            CMP #$03           ; $e028: c9 03     
            BCC __e035         ; $e02a: 90 09     
            LDA $64            ; $e02c: a5 64     
            CLC                ; $e02e: 18        
            ADC $10            ; $e02f: 65 10     
            RTS                ; $e031: 60        

;-------------------------------------------------------------------------------
__e032:     LDA $63            ; $e032: a5 63     
            RTS                ; $e034: 60        

;-------------------------------------------------------------------------------
__e035:     LDA $64            ; $e035: a5 64     
            CLC                ; $e037: 18        
            ADC #$04           ; $e038: 69 04     
            ADC $10            ; $e03a: 65 10     
            RTS                ; $e03c: 60        

;-------------------------------------------------------------------------------
__e03d:     LDY #$0c           ; $e03d: a0 0c     
            LDA ($1e),y        ; $e03f: b1 1e     
            DEY                ; $e041: 88        
            CLC                ; $e042: 18        
            ADC ($1e),y        ; $e043: 71 1e     
            STA ($1e),y        ; $e045: 91 1e     
            ASL                ; $e047: 0a        
            BCC __e055         ; $e048: 90 0b     
            PHA                ; $e04a: 48        
            LDY #$03           ; $e04b: a0 03     
            LDA ($1e),y        ; $e04d: b1 1e     
            SEC                ; $e04f: 38        
            SBC #$01           ; $e050: e9 01     
            STA ($1e),y        ; $e052: 91 1e     
            PLA                ; $e054: 68        
__e055:     LDY #$02           ; $e055: a0 02     
            CLC                ; $e057: 18        
            ADC ($1e),y        ; $e058: 71 1e     
            STA ($1e),y        ; $e05a: 91 1e     
            INY                ; $e05c: c8        
            LDA ($1e),y        ; $e05d: b1 1e     
            ADC #$00           ; $e05f: 69 00     
            STA ($1e),y        ; $e061: 91 1e     
            LDA #$30           ; $e063: a9 30     
            LDX #$02           ; $e065: a2 02     
            JMP __df0b         ; $e067: 4c 0b df  

;-------------------------------------------------------------------------------
__e06a:     JSR __e018         ; $e06a: 20 18 e0  
            CLC                ; $e06d: 18        
            ADC #$20           ; $e06e: 69 20     
            LDY #$02           ; $e070: a0 02     
            ADC ($1e),y        ; $e072: 71 1e     
            STA ($1e),y        ; $e074: 91 1e     
            BCC __e0a3         ; $e076: 90 2b     
            INY                ; $e078: c8        
            LDA ($1e),y        ; $e079: b1 1e     
            ADC #$00           ; $e07b: 69 00     
            STA ($1e),y        ; $e07d: 91 1e     
            LDX #$04           ; $e07f: a2 04     
            JMP __e0a0         ; $e081: 4c a0 e0  

;-------------------------------------------------------------------------------
__e084:     JSR __e018         ; $e084: 20 18 e0  
            CLC                ; $e087: 18        
            ADC #$20           ; $e088: 69 20     
__e08a:     STA $10            ; $e08a: 85 10     
            LDY #$02           ; $e08c: a0 02     
            LDA ($1e),y        ; $e08e: b1 1e     
            SEC                ; $e090: 38        
            SBC $10            ; $e091: e5 10     
            STA ($1e),y        ; $e093: 91 1e     
            BCS __e0a3         ; $e095: b0 0c     
            INY                ; $e097: c8        
            LDA ($1e),y        ; $e098: b1 1e     
            SBC #$00           ; $e09a: e9 00     
            STA ($1e),y        ; $e09c: 91 1e     
            LDX #$00           ; $e09e: a2 00     
__e0a0:     JSR __dfcd         ; $e0a0: 20 cd df  
__e0a3:     LDY #$0d           ; $e0a3: a0 0d     
            LDA ($1e),y        ; $e0a5: b1 1e     
            BEQ __e0ad         ; $e0a7: f0 04     
            LDY #$06           ; $e0a9: a0 06     
            STA ($1e),y        ; $e0ab: 91 1e     
__e0ad:     LDY #$07           ; $e0ad: a0 07     
            LDA ($1e),y        ; $e0af: b1 1e     
            CLC                ; $e0b1: 18        
            ADC #$01           ; $e0b2: 69 01     
            STA ($1e),y        ; $e0b4: 91 1e     
            RTS                ; $e0b6: 60        

;-------------------------------------------------------------------------------
__e0b7:     LDA $1e            ; $e0b7: a5 1e     
            BNE __e0ff         ; $e0b9: d0 44     
            LDA $2e            ; $e0bb: a5 2e     
            BNE __e0ff         ; $e0bd: d0 40     
            LDX #$10           ; $e0bf: a2 10     
__e0c1:     LDA $040f,x        ; $e0c1: bd 0f 04  
            CMP #$02           ; $e0c4: c9 02     
            BNE __e0f6         ; $e0c6: d0 2e     
            CPX #$20           ; $e0c8: e0 20     
            BNE __e0d1         ; $e0ca: d0 05     
            LDA $042a          ; $e0cc: ad 2a 04  
            BNE __e0f6         ; $e0cf: d0 25     
__e0d1:     LDA $0403,x        ; $e0d1: bd 03 04  
            CMP $0403          ; $e0d4: cd 03 04  
            BNE __e0f6         ; $e0d7: d0 1d     
            LDA $0400,x        ; $e0d9: bd 00 04  
            SEC                ; $e0dc: 38        
            SBC $0400          ; $e0dd: ed 00 04  
            LDA $0401,x        ; $e0e0: bd 01 04  
            SBC $0401          ; $e0e3: ed 01 04  
            CLC                ; $e0e6: 18        
            ADC #$01           ; $e0e7: 69 01     
            CMP #$02           ; $e0e9: c9 02     
            BCS __e0f6         ; $e0eb: b0 09     
            LDA $0406,x        ; $e0ed: bd 06 04  
            STA $0406          ; $e0f0: 8d 06 04  
            LDA #$00           ; $e0f3: a9 00     
            RTS                ; $e0f5: 60        

;-------------------------------------------------------------------------------
__e0f6:     TXA                ; $e0f6: 8a        
            CLC                ; $e0f7: 18        
            ADC #$10           ; $e0f8: 69 10     
            TAX                ; $e0fa: aa        
            CPX #$90           ; $e0fb: e0 90     
            BNE __e0c1         ; $e0fd: d0 c2     
__e0ff:     LDA #$ff           ; $e0ff: a9 ff     
            RTS                ; $e101: 60        

;-------------------------------------------------------------------------------
__e102:     LDA $1e            ; $e102: a5 1e     
            BNE __e131         ; $e104: d0 2b     
            LDA $0412          ; $e106: ad 12 04  
            SEC                ; $e109: 38        
            SBC $0402          ; $e10a: ed 02 04  
            LDA $0413          ; $e10d: ad 13 04  
            SBC $0403          ; $e110: ed 03 04  
            CLC                ; $e113: 18        
            ADC #$01           ; $e114: 69 01     
            CMP #$02           ; $e116: c9 02     
            BCS __e131         ; $e118: b0 17     
            LDA $0410          ; $e11a: ad 10 04  
            SEC                ; $e11d: 38        
            SBC $0400          ; $e11e: ed 00 04  
            LDA $0411          ; $e121: ad 11 04  
            SBC $0401          ; $e124: ed 01 04  
            CLC                ; $e127: 18        
            ADC #$01           ; $e128: 69 01     
            CMP #$02           ; $e12a: c9 02     
            BCS __e131         ; $e12c: b0 03     
            LDA #$00           ; $e12e: a9 00     
            RTS                ; $e130: 60        

;-------------------------------------------------------------------------------
__e131:     LDA #$ff           ; $e131: a9 ff     
            RTS                ; $e133: 60        

;-------------------------------------------------------------------------------
__e134:     LDX #$20           ; $e134: a2 20     
__e136:     LDA $040f,x        ; $e136: bd 0f 04  
            CMP #$02           ; $e139: c9 02     
            BNE __e170         ; $e13b: d0 33     
            LDA $0403,x        ; $e13d: bd 03 04  
            CMP $0403          ; $e140: cd 03 04  
            BNE __e170         ; $e143: d0 2b     
            LDA $0400,x        ; $e145: bd 00 04  
            SEC                ; $e148: 38        
            SBC $0400          ; $e149: ed 00 04  
            LDA $0401,x        ; $e14c: bd 01 04  
            SBC $0401          ; $e14f: ed 01 04  
            CLC                ; $e152: 18        
            ADC #$01           ; $e153: 69 01     
            CMP #$02           ; $e155: c9 02     
            BCS __e170         ; $e157: b0 17     
            LDA $0406          ; $e159: ad 06 04  
            STA $0406,x        ; $e15c: 9d 06 04  
            LDA #$0c           ; $e15f: a9 0c     
            STA $0404,x        ; $e161: 9d 04 04  
            LDA #$10           ; $e164: a9 10     
            STA $040f,x        ; $e166: 9d 0f 04  
            LDA #$08           ; $e169: a9 08     
            STA $0407,x        ; $e16b: 9d 07 04  
            INC $30            ; $e16e: e6 30     
__e170:     TXA                ; $e170: 8a        
            CLC                ; $e171: 18        
            ADC #$01           ; $e172: 69 01     
            TAX                ; $e174: aa        
            CPX #$90           ; $e175: e0 90     
            BNE __e136         ; $e177: d0 bd     
            RTS                ; $e179: 60        

;-------------------------------------------------------------------------------
__e17a:     .hex 4f            ; $e17a: 4f            Data
__e17b:     .hex c1 9d e1 9c   ; $e17b: c1 9d e1 9c   Data
            .hex e1 00 e2 30   ; $e17f: e1 00 e2 30   Data
            .hex e2 a1 e2 ac   ; $e183: e2 a1 e2 ac   Data
            .hex e2 ee e2 e0   ; $e187: e2 ee e2 e0   Data
            .hex e2 39 e3      ; $e18b: e2 39 e3      Data
__e18e:     LDA #$00           ; $e18e: a9 00     
            STA $0407          ; $e190: 8d 07 04  
            LDA #$01           ; $e193: a9 01     
            STA $4b            ; $e195: 85 4b     
            LDA #$04           ; $e197: a9 04     
            STA $040f          ; $e199: 8d 0f 04  
            RTS                ; $e19c: 60        

;-------------------------------------------------------------------------------
            LDY #$08           ; $e19d: a0 08     
            LDA ($1e),y        ; $e19f: b1 1e     
            SEC                ; $e1a1: 38        
            SBC #$49           ; $e1a2: e9 49     
            CMP #$07           ; $e1a4: c9 07     
            BCC __e18e         ; $e1a6: 90 e6     
            LDY #$03           ; $e1a8: a0 03     
            LDA ($1e),y        ; $e1aa: b1 1e     
            CMP #$1c           ; $e1ac: c9 1c     
            BCS __e18e         ; $e1ae: b0 de     
            JSR __e06a         ; $e1b0: 20 6a e0  
            JSR __e469         ; $e1b3: 20 69 e4  
            BCS __e1e0         ; $e1b6: b0 28     
            LDY #$05           ; $e1b8: a0 05     
            LDA ($1e),y        ; $e1ba: b1 1e     
            BNE __e1e1         ; $e1bc: d0 23     
            STX $18            ; $e1be: 86 18     
            LDA #$01           ; $e1c0: a9 01     
            STA $060a          ; $e1c2: 8d 0a 06  
            LDY #$3c           ; $e1c5: a0 3c     
            JSR __d4ca         ; $e1c7: 20 ca d4  
            LDX $18            ; $e1ca: a6 18     
            LDA $0202,x        ; $e1cc: bd 02 02  
            BNE __e1e1         ; $e1cf: d0 10     
            LDA #$01           ; $e1d1: a9 01     
            STA $0200,x        ; $e1d3: 9d 00 02  
            LDA #$09           ; $e1d6: a9 09     
            STA $0201,x        ; $e1d8: 9d 01 02  
            LDA #$80           ; $e1db: a9 80     
            STA $0202,x        ; $e1dd: 9d 02 02  
__e1e0:     RTS                ; $e1e0: 60        

;-------------------------------------------------------------------------------
__e1e1:     LDY #$01           ; $e1e1: a0 01     
            LDA $0201,x        ; $e1e3: bd 01 02  
            CMP #$08           ; $e1e6: c9 08     
            BCC __e1eb         ; $e1e8: 90 01     
            INY                ; $e1ea: c8        
__e1eb:     tya                ; $e1eb: 98        
            STA $0200,x        ; $e1ec: 9d 00 02  
            TXA                ; $e1ef: 8a        
            LDY #$0b           ; $e1f0: a0 0b     
            STA ($1e),y        ; $e1f2: 91 1e     
            LDA #$00           ; $e1f4: a9 00     
            LDY #$07           ; $e1f6: a0 07     
            STA ($1e),y        ; $e1f8: 91 1e     
            LDA #$06           ; $e1fa: a9 06     
            LDY #$0f           ; $e1fc: a0 0f     
            STA ($1e),y        ; $e1fe: 91 1e     
            LDY #$0b           ; $e200: a0 0b     
            LDA ($1e),y        ; $e202: b1 1e     
            TAX                ; $e204: aa        
            JSR __e4a4         ; $e205: 20 a4 e4  
            LDA $0202,x        ; $e208: bd 02 02  
            bmi __e25d         ; $e20b: 30 50     
            LDA $0201,x        ; $e20d: bd 01 02  
            CMP #$07           ; $e210: c9 07     
            BNE __e22f         ; $e212: d0 1b     
            LDY #$05           ; $e214: a0 05     
            LDA ($1e),y        ; $e216: b1 1e     
            BNE __e21d         ; $e218: d0 03     
            DEC $0202,x        ; $e21a: de 02 02  
__e21d:     LDA #$00           ; $e21d: a9 00     
            LDY #$08           ; $e21f: a0 08     
            STA ($1e),y        ; $e221: 91 1e     
            LDA #$08           ; $e223: a9 08     
            LDY #$0f           ; $e225: a0 0f     
            STA ($1e),y        ; $e227: 91 1e     
            LDA #$06           ; $e229: a9 06     
            LDY #$04           ; $e22b: a0 04     
            STA ($1e),y        ; $e22d: 91 1e     
__e22f:     RTS                ; $e22f: 60        

;-------------------------------------------------------------------------------
            LDY #$03           ; $e230: a0 03     
            LDA ($1e),y        ; $e232: b1 1e     
            CMP #$08           ; $e234: c9 08     
            BCC __e247         ; $e236: 90 0f     
            AND #$03           ; $e238: 29 03     
            SEC                ; $e23a: 38        
            SBC #$01           ; $e23b: e9 01     
            CMP #$02           ; $e23d: c9 02     
            BCS __e247         ; $e23f: b0 06     
            LDY #$0d           ; $e241: a0 0d     
            LDA ($1e),y        ; $e243: b1 1e     
            BNE __e270         ; $e245: d0 29     
__e247:     LDY #$08           ; $e247: a0 08     
            LDA ($1e),y        ; $e249: b1 1e     
            SEC                ; $e24b: 38        
            SBC #$30           ; $e24c: e9 30     
            CMP #$20           ; $e24e: c9 20     
            BCC __e25d         ; $e250: 90 0b     
            LDY #$03           ; $e252: a0 03     
            LDA ($1e),y        ; $e254: b1 1e     
            CMP #$06           ; $e256: c9 06     
            BCC __e25d         ; $e258: 90 03     
            JMP __e084         ; $e25a: 4c 84 e0  

;-------------------------------------------------------------------------------
__e25d:     LDA #$00           ; $e25d: a9 00     
            LDY #$08           ; $e25f: a0 08     
            STA ($1e),y        ; $e261: 91 1e     
            LDA #$02           ; $e263: a9 02     
            LDY #$0f           ; $e265: a0 0f     
            STA ($1e),y        ; $e267: 91 1e     
            LDA #$06           ; $e269: a9 06     
            LDY #$04           ; $e26b: a0 04     
            STA ($1e),y        ; $e26d: 91 1e     
            RTS                ; $e26f: 60        

;-------------------------------------------------------------------------------
__e270:     LDY #$06           ; $e270: a0 06     
            STA ($1e),y        ; $e272: 91 1e     
            LDY #$03           ; $e274: a0 03     
            LDA ($1e),y        ; $e276: b1 1e     
            AND #$fe           ; $e278: 29 fe     
            ORA #$02           ; $e27a: 09 02     
            STA ($1e),y        ; $e27c: 91 1e     
            DEY                ; $e27e: 88        
            LDA #$00           ; $e27f: a9 00     
            STA ($1e),y        ; $e281: 91 1e     
            LDA #$21           ; $e283: a9 21     
            LDY #$07           ; $e285: a0 07     
            STA ($1e),y        ; $e287: 91 1e     
            LDA #$e0           ; $e289: a9 e0     
            LDY #$0b           ; $e28b: a0 0b     
            STA ($1e),y        ; $e28d: 91 1e     
            LDA #$02           ; $e28f: a9 02     
            INY                ; $e291: c8        
            STA ($1e),y        ; $e292: 91 1e     
            LDA #$0a           ; $e294: a9 0a     
            LDY #$0f           ; $e296: a0 0f     
            STA ($1e),y        ; $e298: 91 1e     
            LDA #$04           ; $e29a: a9 04     
            LDY #$04           ; $e29c: a0 04     
            STA ($1e),y        ; $e29e: 91 1e     
            RTS                ; $e2a0: 60        

;-------------------------------------------------------------------------------
            LDY #$08           ; $e2a1: a0 08     
            LDA ($1e),y        ; $e2a3: b1 1e     
            SEC                ; $e2a5: 38        
            SBC #$49           ; $e2a6: e9 49     
            CMP #$10           ; $e2a8: c9 10     
            BCC __e2ba         ; $e2aa: 90 0e     
            LDY #$07           ; $e2ac: a0 07     
            LDA ($1e),y        ; $e2ae: b1 1e     
            SEC                ; $e2b0: 38        
            SBC #$01           ; $e2b1: e9 01     
            STA ($1e),y        ; $e2b3: 91 1e     
            BEQ __e25d         ; $e2b5: f0 a6     
            JMP __e03d         ; $e2b7: 4c 3d e0  

;-------------------------------------------------------------------------------
__e2ba:     LDA #$00           ; $e2ba: a9 00     
            SEC                ; $e2bc: 38        
            LDY #$06           ; $e2bd: a0 06     
            SBC ($1e),y        ; $e2bf: f1 1e     
            STA ($1e),y        ; $e2c1: 91 1e     
            LDA #$06           ; $e2c3: a9 06     
            INY                ; $e2c5: c8        
            STA ($1e),y        ; $e2c6: 91 1e     
            LDA #$00           ; $e2c8: a9 00     
            LDY #$0b           ; $e2ca: a0 0b     
            STA ($1e),y        ; $e2cc: 91 1e     
            LDA #$09           ; $e2ce: a9 09     
            INY                ; $e2d0: c8        
            STA ($1e),y        ; $e2d1: 91 1e     
            LDA #$0c           ; $e2d3: a9 0c     
            LDY #$0f           ; $e2d5: a0 0f     
            STA ($1e),y        ; $e2d7: 91 1e     
            LDA #$04           ; $e2d9: a9 04     
            LDY #$04           ; $e2db: a0 04     
            STA ($1e),y        ; $e2dd: 91 1e     
            RTS                ; $e2df: 60        

;-------------------------------------------------------------------------------
            DEC $0437          ; $e2e0: ce 37 04  
            BNE __e2ed         ; $e2e3: d0 08     
            LDA #$00           ; $e2e5: a9 00     
            STA $0434          ; $e2e7: 8d 34 04  
            STA $043f          ; $e2ea: 8d 3f 04  
__e2ed:     RTS                ; $e2ed: 60        

;-------------------------------------------------------------------------------
            LDA $0413          ; $e2ee: ad 13 04  
            CMP $0403          ; $e2f1: cd 03 04  
            BNE __e331         ; $e2f4: d0 3b     
            LDA $0411          ; $e2f6: ad 11 04  
            SEC                ; $e2f9: 38        
            SBC $0401          ; $e2fa: ed 01 04  
            CMP #$02           ; $e2fd: c9 02     
            BCS __e331         ; $e2ff: b0 30     
            INC $51            ; $e301: e6 51     
            LDA #$20           ; $e303: a9 20     
            STA $5a            ; $e305: 85 5a     
            JSR __f4bf         ; $e307: 20 bf f4  
            LDA #$01           ; $e30a: a9 01     
            STA $0606          ; $e30c: 8d 06 06  
            LDA #$00           ; $e30f: a9 00     
            STA $0414          ; $e311: 8d 14 04  
            STA $041f          ; $e314: 8d 1f 04  
            JSR __e18e         ; $e317: 20 8e e1  
            LDA #$12           ; $e31a: a9 12     
            STA $042f          ; $e31c: 8d 2f 04  
            LDX #$00           ; $e31f: a2 00     
__e321:     LDA __e332,x       ; $e321: bd 32 e3  
            STA $0420,x        ; $e324: 9d 20 04  
            INX                ; $e327: e8        
            CPX #$07           ; $e328: e0 07     
            BNE __e321         ; $e32a: d0 f5     
            LDA #$00           ; $e32c: a9 00     
            STA $042b          ; $e32e: 8d 2b 04  
__e331:     RTS                ; $e331: 60        

;-------------------------------------------------------------------------------
__e332:     .hex 00 05 00 18   ; $e332: 00 05 00 18   Data
            .hex 06 02 ff ad   ; $e336: 06 02 ff ad   Data
            .hex 28 04 38 e9   ; $e33a: 28 04 38 e9   Data
            .hex 30 c9 19 b0   ; $e33e: 30 c9 19 b0   Data
            .hex 03 20 56 e4   ; $e342: 03 20 56 e4   Data
            .hex ad 23 04 c9   ; $e346: ad 23 04 c9   Data
            .hex 06 90 05 a9   ; $e34a: 06 90 05 a9   Data
            .hex 40 4c 8a e0   ; $e34e: 40 4c 8a e0   Data
__e352:     .hex a9 00 8d 24   ; $e352: a9 00 8d 24   Data
            .hex 04 8d 2f 04   ; $e356: 04 8d 2f 04   Data
            .hex 60            ; $e35a: 60            Data

;-------------------------------------------------------------------------------
__e35b:     LDX $7a            ; $e35b: a6 7a     
            LDY __e4e1,x       ; $e35d: bc e1 e4  
            LDA __e4f1,y       ; $e360: b9 f1 e4  
            STA $1c            ; $e363: 85 1c     
            LDA __e4f2,y       ; $e365: b9 f2 e4  
            STA $1d            ; $e368: 85 1d     
            LDY #$00           ; $e36a: a0 00     
            LDA ($1c),y        ; $e36c: b1 1c     
            INY                ; $e36e: c8        
            STA $80            ; $e36f: 85 80     
            LDX #$00           ; $e371: a2 00     
__e373:     LDA #$00           ; $e373: a9 00     
            STA $0200,x        ; $e375: 9d 00 02  
            STA $0201,x        ; $e378: 9d 01 02  
            LDA #$03           ; $e37b: a9 03     
            STA $0202,x        ; $e37d: 9d 02 02  
            LDA ($1c),y        ; $e380: b1 1c     
            INY                ; $e382: c8        
            STY $1b            ; $e383: 84 1b     
            STA $0203,x        ; $e385: 9d 03 02  
            TAY                ; $e388: a8        
            LDA __e537,y       ; $e389: b9 37 e5  
            STA $10            ; $e38c: 85 10     
            LDA __e538,y       ; $e38e: b9 38 e5  
            STA $11            ; $e391: 85 11     
            JSR __e3bd         ; $e393: 20 bd e3  
            LDA $10            ; $e396: a5 10     
            STA $0204,x        ; $e398: 9d 04 02  
            LDA $11            ; $e39b: a5 11     
            STA $0205,x        ; $e39d: 9d 05 02  
            LDY $1b            ; $e3a0: a4 1b     
            TXA                ; $e3a2: 8a        
            CLC                ; $e3a3: 18        
            ADC #$08           ; $e3a4: 69 08     
            TAX                ; $e3a6: aa        
            CPX $80            ; $e3a7: e4 80     
            BNE __e373         ; $e3a9: d0 c8     
            LDX #$00           ; $e3ab: a2 00     
__e3ad:     STX $1b            ; $e3ad: 86 1b     
            JSR __e427         ; $e3af: 20 27 e4  
            LDA $1b            ; $e3b2: a5 1b     
            CLC                ; $e3b4: 18        
            ADC #$08           ; $e3b5: 69 08     
            TAX                ; $e3b7: aa        
            CPX $80            ; $e3b8: e4 80     
            BNE __e3ad         ; $e3ba: d0 f1     
            RTS                ; $e3bc: 60        

;-------------------------------------------------------------------------------
__e3bd:     LDA $10            ; $e3bd: a5 10     
            AND #$1f           ; $e3bf: 29 1f     
            ASL $10            ; $e3c1: 06 10     
            ROL $11            ; $e3c3: 26 11     
            ASL $10            ; $e3c5: 06 10     
            ROL $11            ; $e3c7: 26 11     
            ASL $10            ; $e3c9: 06 10     
            ROL $11            ; $e3cb: 26 11     
            STA $10            ; $e3cd: 85 10     
            LDA $11            ; $e3cf: a5 11     
            AND #$20           ; $e3d1: 29 20     
            ORA $10            ; $e3d3: 05 10     
            STA $10            ; $e3d5: 85 10     
            LDA $11            ; $e3d7: a5 11     
            AND #$1f           ; $e3d9: 29 1f     
            STA $11            ; $e3db: 85 11     
            RTS                ; $e3dd: 60        

;-------------------------------------------------------------------------------
__e3de:     LDX #$00           ; $e3de: a2 00     
__e3e0:     STX $1b            ; $e3e0: 86 1b     
            LDA $0202,x        ; $e3e2: bd 02 02  
            bmi __e3f3         ; $e3e5: 30 0c     
            CMP #$03           ; $e3e7: c9 03     
            BEQ __e3f3         ; $e3e9: f0 08     
            LDA #$03           ; $e3eb: a9 03     
            STA $0202,x        ; $e3ed: 9d 02 02  
            JSR __e427         ; $e3f0: 20 27 e4  
__e3f3:     LDA $1b            ; $e3f3: a5 1b     
            CLC                ; $e3f5: 18        
            ADC #$08           ; $e3f6: 69 08     
            TAX                ; $e3f8: aa        
            CPX $80            ; $e3f9: e4 80     
            BNE __e3e0         ; $e3fb: d0 e3     
            RTS                ; $e3fd: 60        

;-------------------------------------------------------------------------------
__e3fe:     LDX #$00           ; $e3fe: a2 00     
__e400:     STX $1b            ; $e400: 86 1b     
            JSR __e410         ; $e402: 20 10 e4  
            LDA $1b            ; $e405: a5 1b     
            CLC                ; $e407: 18        
            ADC #$08           ; $e408: 69 08     
            TAX                ; $e40a: aa        
            CPX $80            ; $e40b: e4 80     
            BNE __e400         ; $e40d: d0 f1     
__e40f:     RTS                ; $e40f: 60        

;-------------------------------------------------------------------------------
__e410:     LDA $0200,x        ; $e410: bd 00 02  
            BEQ __e40f         ; $e413: f0 fa     
            INC $0201,x        ; $e415: fe 01 02  
            LDA $0201,x        ; $e418: bd 01 02  
            CMP #$0a           ; $e41b: c9 0a     
            BCC __e427         ; $e41d: 90 08     
            LDA #$00           ; $e41f: a9 00     
            STA $0201,x        ; $e421: 9d 01 02  
            DEC $0200,x        ; $e424: de 00 02  
__e427:     LDY $0203,x        ; $e427: bc 03 02  
            LDA __e537,y       ; $e42a: b9 37 e5  
            STA $10            ; $e42d: 85 10     
            LDA __e538,y       ; $e42f: b9 38 e5  
            STA $11            ; $e432: 85 11     
            LDA $0202,x        ; $e434: bd 02 02  
            BPL __e442         ; $e437: 10 09     
            LDA #$00           ; $e439: a9 00     
            STA $14            ; $e43b: 85 14     
            LDY #$14           ; $e43d: a0 14     
            JMP __e449         ; $e43f: 4c 49 e4  

;-------------------------------------------------------------------------------
__e442:     STA $14            ; $e442: 85 14     
            LDA $0201,x        ; $e444: bd 01 02  
            ASL                ; $e447: 0a        
            TAY                ; $e448: a8        
__e449:     LDA __e569,y       ; $e449: b9 69 e5  
            STA $12            ; $e44c: 85 12     
            LDA __e56a,y       ; $e44e: b9 6a e5  
            STA $13            ; $e451: 85 13     
            JMP __c6fb         ; $e453: 4c fb c6  

;-------------------------------------------------------------------------------
            LDA __e537         ; $e456: ad 37 e5  
            STA $10            ; $e459: 85 10     
            LDA __e538         ; $e45b: ad 38 e5  
            STA $11            ; $e45e: 85 11     
            LDA #$00           ; $e460: a9 00     
            STA $14            ; $e462: 85 14     
            LDY #$14           ; $e464: a0 14     
            JMP __e449         ; $e466: 4c 49 e4  

;-------------------------------------------------------------------------------
__e469:     LDX #$00           ; $e469: a2 00     
__e46b:     LDA $0202,x        ; $e46b: bd 02 02  
            bmi __e497         ; $e46e: 30 27     
            LDY #$01           ; $e470: a0 01     
            LDA ($1e),y        ; $e472: b1 1e     
            SEC                ; $e474: 38        
            SBC $0204,x        ; $e475: fd 04 02  
            CLC                ; $e478: 18        
            ADC #$01           ; $e479: 69 01     
            CMP #$04           ; $e47b: c9 04     
            BCS __e497         ; $e47d: b0 18     
            LDA $0205,x        ; $e47f: bd 05 02  
            CLC                ; $e482: 18        
            ADC __e4ce         ; $e483: 6d ce e4  
            STA $11            ; $e486: 85 11     
            LDY #$02           ; $e488: a0 02     
            LDA ($1e),y        ; $e48a: b1 1e     
            CLC                ; $e48c: 18        
            SBC __e4cd         ; $e48d: ed cd e4  
            INY                ; $e490: c8        
            LDA ($1e),y        ; $e491: b1 1e     
            SBC $11            ; $e493: e5 11     
            BEQ __e4a2         ; $e495: f0 0b     
__e497:     TXA                ; $e497: 8a        
            CLC                ; $e498: 18        
            ADC #$08           ; $e499: 69 08     
            TAX                ; $e49b: aa        
            CPX $80            ; $e49c: e4 80     
            BNE __e46b         ; $e49e: d0 cb     
            SEC                ; $e4a0: 38        
            RTS                ; $e4a1: 60        

;-------------------------------------------------------------------------------
__e4a2:     CLC                ; $e4a2: 18        
            RTS                ; $e4a3: 60        

;-------------------------------------------------------------------------------
__e4a4:     LDA #$06           ; $e4a4: a9 06     
            LDY #$04           ; $e4a6: a0 04     
            STA ($1e),y        ; $e4a8: 91 1e     
            LDY #$07           ; $e4aa: a0 07     
            LDA ($1e),y        ; $e4ac: b1 1e     
            ASL                ; $e4ae: 0a        
            TAY                ; $e4af: a8        
            LDA __e4ce,y       ; $e4b0: b9 ce e4  
            PHA                ; $e4b3: 48        
            LDA __e4cd,y       ; $e4b4: b9 cd e4  
            LDY #$02           ; $e4b7: a0 02     
            STA ($1e),y        ; $e4b9: 91 1e     
            INY                ; $e4bb: c8        
            PLA                ; $e4bc: 68        
            CLC                ; $e4bd: 18        
            ADC $0205,x        ; $e4be: 7d 05 02  
            STA ($1e),y        ; $e4c1: 91 1e     
            LDY #$07           ; $e4c3: a0 07     
            LDA ($1e),y        ; $e4c5: b1 1e     
            CLC                ; $e4c7: 18        
            ADC #$01           ; $e4c8: 69 01     
            STA ($1e),y        ; $e4ca: 91 1e     
            RTS                ; $e4cc: 60        

;-------------------------------------------------------------------------------
__e4cd:     .hex 40            ; $e4cd: 40            Data
__e4ce:     .hex fe 80 fe c0   ; $e4ce: fe 80 fe c0   Data
            .hex fe 00 ff c0   ; $e4d2: fe 00 ff c0   Data
            .hex fe 80 fe 40   ; $e4d6: fe 80 fe 40   Data
            .hex fe 00 fe c0   ; $e4da: fe 00 fe c0   Data
            .hex fd 00 fe      ; $e4de: fd 00 fe      Data
__e4e1:     .hex 00 0a 08 02   ; $e4e1: 00 0a 08 02   Data
            .hex 02 02 08 04   ; $e4e5: 02 02 08 04   Data
            .hex 04 04 08 06   ; $e4e9: 04 04 08 06   Data
            .hex 0c 06 08 00   ; $e4ed: 0c 06 08 00   Data
__e4f1:     .hex ff            ; $e4f1: ff            Data
__e4f2:     .hex e4 0b e5 12   ; $e4f2: e4 0b e5 12   Data
            .hex e5 19 e5 2a   ; $e4f6: e5 19 e5 2a   Data
            .hex e5 04 e5 21   ; $e4fa: e5 04 e5 21   Data
            .hex e5 20 0e 14   ; $e4fe: e5 20 0e 14   Data
            .hex 28 30 30 0e   ; $e502: 28 30 30 0e   Data
            .hex 14 28 30 06   ; $e506: 14 28 30 06   Data
            .hex 22 30 04 08   ; $e50a: 22 30 04 08   Data
            .hex 0e 18 20 30   ; $e50e: 0e 18 20 30   Data
            .hex 30 04 0a 0e   ; $e512: 30 04 0a 0e   Data
            .hex 14 28 30 38   ; $e516: 14 28 30 38   Data
            .hex 02 0c 0e 18   ; $e51a: 02 0c 0e 18   Data
            .hex 1a 24 30 40   ; $e51e: 1a 24 30 40   Data
            .hex 02 04 0c 0e   ; $e522: 02 04 0c 0e   Data
            .hex 18 1a 24 30   ; $e526: 18 1a 24 30   Data
            .hex 60 00 08 10   ; $e52a: 60 00 08 10   Data
            .hex 12 16 18 1c   ; $e52e: 12 16 18 1c   Data
            .hex 1e 26 2a 2c   ; $e532: 1e 26 2a 2c   Data
            .hex 2e            ; $e536: 2e            Data
__e537:     .hex 04            ; $e537: 04            Data
__e538:     .hex 22 02 22 1c   ; $e538: 22 02 22 1c   Data
            .hex 22 82 22 90   ; $e53c: 22 82 22 90   Data
            .hex 22 9c 22 0c   ; $e540: 22 9c 22 0c   Data
            .hex 23 82 23 8a   ; $e544: 23 82 23 8a   Data
            .hex 23 90 23 92   ; $e548: 23 90 23 92   Data
            .hex 23 96 23 9c   ; $e54c: 23 96 23 9c   Data
            .hex 23 16 26 82   ; $e550: 23 16 26 82   Data
            .hex 26 14 26 88   ; $e554: 26 14 26 88   Data
            .hex 26 16 26 0c   ; $e558: 26 16 26 0c   Data
            .hex 27 82 27 86   ; $e55c: 27 82 27 86   Data
            .hex 27 88 27 8e   ; $e560: 27 88 27 8e   Data
            .hex 27 94 27 96   ; $e564: 27 94 27 96   Data
            .hex 27            ; $e568: 27            Data
__e569:     .hex 7f            ; $e569: 7f            Data
__e56a:     .hex e5 8b e5 91   ; $e56a: e5 8b e5 91   Data
            .hex e5 97 e5 91   ; $e56e: e5 97 e5 91   Data
            .hex e5 8b e5 7f   ; $e572: e5 8b e5 7f   Data
            .hex e5 9d e5 a9   ; $e576: e5 9d e5 a9   Data
            .hex e5 9d e5 b5   ; $e57a: e5 9d e5 b5   Data
            .hex e5 04 30 30   ; $e57e: e5 04 30 30   Data
            .hex 30 30 dc 04   ; $e582: 30 30 dc 04   Data
            .hex 00 00 00 00   ; $e586: 00 00 00 00   Data
            .hex 00 04 31 32   ; $e58a: 00 04 31 32   Data
            .hex 33 34 00 04   ; $e58e: 33 34 00 04   Data
            .hex 35 36 37 38   ; $e592: 35 36 37 38   Data
            .hex 00 04 39 3a   ; $e596: 00 04 39 3a   Data
            .hex 3b 3c 00 04   ; $e59a: 3b 3c 00 04   Data
            .hex 3d 59 59 42   ; $e59e: 3d 59 59 42   Data
            .hex dc 04 3e 3f   ; $e5a2: dc 04 3e 3f   Data
            .hex 40 41 00 04   ; $e5a6: 40 41 00 04   Data
            .hex 43 59 59 48   ; $e5aa: 43 59 59 48   Data
            .hex dc 04 44 45   ; $e5ae: dc 04 44 45   Data
            .hex 46 47 00 04   ; $e5b2: 46 47 00 04   Data
            .hex 85 00 00 86   ; $e5b6: 85 00 00 86   Data
            .hex 1d 02 00 00   ; $e5ba: 1d 02 00 00   Data
            .hex bd 04 00 00   ; $e5be: bd 04 00 00   Data
            .hex 00 00 00      ; $e5c2: 00 00 00      Data
__e5c5:     LDA __e798         ; $e5c5: ad 98 e7  
            STA $1c            ; $e5c8: 85 1c     
            LDA __e799         ; $e5ca: ad 99 e7  
            STA $1d            ; $e5cd: 85 1d     
            LDY #$00           ; $e5cf: a0 00     
            LDA ($1c),y        ; $e5d1: b1 1c     
            STA $81            ; $e5d3: 85 81     
            LSR                ; $e5d5: 4a        
            LSR                ; $e5d6: 4a        
            LSR                ; $e5d7: 4a        
            STA $7b            ; $e5d8: 85 7b     
            BEQ __e633         ; $e5da: f0 57     
            INY                ; $e5dc: c8        
            LDX #$00           ; $e5dd: a2 00     
__e5df:     LDA #$02           ; $e5df: a9 02     
            STA $0260,x        ; $e5e1: 9d 60 02  
            LDA #$00           ; $e5e4: a9 00     
            STA $0263,x        ; $e5e6: 9d 63 02  
            LDA ($1c),y        ; $e5e9: b1 1c     
            INY                ; $e5eb: c8        
            STY $1b            ; $e5ec: 84 1b     
            STA $0261,x        ; $e5ee: 9d 61 02  
            TAY                ; $e5f1: a8        
            LDA __e7a5,y       ; $e5f2: b9 a5 e7  
            STA $10            ; $e5f5: 85 10     
            LDA __e7a6,y       ; $e5f7: b9 a6 e7  
            STA $11            ; $e5fa: 85 11     
            JSR __e3bd         ; $e5fc: 20 bd e3  
            LDA $10            ; $e5ff: a5 10     
            STA $0264,x        ; $e601: 9d 64 02  
            LDA $11            ; $e604: a5 11     
            STA $0265,x        ; $e606: 9d 65 02  
            LDY $1b            ; $e609: a4 1b     
            TXA                ; $e60b: 8a        
            CLC                ; $e60c: 18        
            ADC #$08           ; $e60d: 69 08     
            TAX                ; $e60f: aa        
            CPX $81            ; $e610: e4 81     
            BNE __e5df         ; $e612: d0 cb     
__e614:     LDX #$00           ; $e614: a2 00     
            STX $31            ; $e616: 86 31     
__e618:     STX $1b            ; $e618: 86 1b     
            LDA $0260,x        ; $e61a: bd 60 02  
            CMP #$02           ; $e61d: c9 02     
            BNE __e629         ; $e61f: d0 08     
            LDA #$00           ; $e621: a9 00     
            STA $0263,x        ; $e623: 9d 63 02  
            JSR __e72c         ; $e626: 20 2c e7  
__e629:     LDA $1b            ; $e629: a5 1b     
            CLC                ; $e62b: 18        
            ADC #$08           ; $e62c: 69 08     
            TAX                ; $e62e: aa        
            CPX $81            ; $e62f: e4 81     
            BNE __e618         ; $e631: d0 e5     
__e633:     RTS                ; $e633: 60        

;-------------------------------------------------------------------------------
__e634:     LDA $81            ; $e634: a5 81     
            BEQ __e649         ; $e636: f0 11     
            LDX #$00           ; $e638: a2 00     
__e63a:     STX $1b            ; $e63a: 86 1b     
            JSR __e64a         ; $e63c: 20 4a e6  
            LDA $1b            ; $e63f: a5 1b     
            CLC                ; $e641: 18        
            ADC #$08           ; $e642: 69 08     
            TAX                ; $e644: aa        
            CPX $81            ; $e645: e4 81     
            BNE __e63a         ; $e647: d0 f1     
__e649:     RTS                ; $e649: 60        

;-------------------------------------------------------------------------------
__e64a:     LDY $0260,x        ; $e64a: bc 60 02  
            LDA __e65a,y       ; $e64d: b9 5a e6  
            STA $1c            ; $e650: 85 1c     
            LDA __e65b,y       ; $e652: b9 5b e6  
            STA $1d            ; $e655: 85 1d     
            JMP ($001c)        ; $e657: 6c 1c 00  

;-------------------------------------------------------------------------------
__e65a:     .hex 4f            ; $e65a: 4f            Data
__e65b:     .hex c1 60 e6 fa   ; $e65b: c1 60 e6 fa   Data
            .hex e6            ; $e65f: e6            Data

;-------------------------------------------------------------------------------
            JSR __e757         ; $e660: 20 57 e7  
            LDA $0263,x        ; $e663: bd 63 02  
            BEQ __e66d         ; $e666: f0 05     
            JSR __e71e         ; $e668: 20 1e e7  
            LDX $1b            ; $e66b: a6 1b     
__e66d:     LDA $0265,x        ; $e66d: bd 65 02  
            CMP $0403          ; $e670: cd 03 04  
            BNE __e649         ; $e673: d0 d4     
            LDA $0264,x        ; $e675: bd 64 02  
            SEC                ; $e678: 38        
            SBC $0401          ; $e679: ed 01 04  
            CMP #$02           ; $e67c: c9 02     
            BCS __e649         ; $e67e: b0 c9     
            DEC $7b            ; $e680: c6 7b     
            BNE __e697         ; $e682: d0 13     
            LDA #$01           ; $e684: a9 01     
            STA $4f            ; $e686: 85 4f     
            LDA #$00           ; $e688: a9 00     
            STA $040f          ; $e68a: 8d 0f 04  
            STA $0404          ; $e68d: 8d 04 04  
            TXA                ; $e690: 8a        
            PHA                ; $e691: 48        
            JSR __daef         ; $e692: 20 ef da  
            PLA                ; $e695: 68        
            TAX                ; $e696: aa        
__e697:     LDA $42            ; $e697: a5 42     
            STA $0608          ; $e699: 8d 08 06  
            LDA #$04           ; $e69c: a9 04     
            STA $0260,x        ; $e69e: 9d 60 02  
            LDA #$3c           ; $e6a1: a9 3c     
            STA $0262,x        ; $e6a3: 9d 62 02  
            LDA #$01           ; $e6a6: a9 01     
            STA $18            ; $e6a8: 85 18     
            LDA $0263,x        ; $e6aa: bd 63 02  
            BEQ __e6b6         ; $e6ad: f0 07     
            LDA $31            ; $e6af: a5 31     
            CLC                ; $e6b1: 18        
            ADC #$02           ; $e6b2: 69 02     
            STA $18            ; $e6b4: 85 18     
__e6b6:     LDA $0261,x        ; $e6b6: bd 61 02  
            AND #$fc           ; $e6b9: 29 fc     
            JSR __d4be         ; $e6bb: 20 be d4  
            LDX $1b            ; $e6be: a6 1b     
            JSR __e70a         ; $e6c0: 20 0a e7  
            LDX $1b            ; $e6c3: a6 1b     
            LDA $0263,x        ; $e6c5: bd 63 02  
            BNE __e6f7         ; $e6c8: d0 2d     
            LDX #$00           ; $e6ca: a2 00     
__e6cc:     STX $1a            ; $e6cc: 86 1a     
            LDA $0260,x        ; $e6ce: bd 60 02  
            CMP #$02           ; $e6d1: c9 02     
            BNE __e6e2         ; $e6d3: d0 0d     
            LDA $0263,x        ; $e6d5: bd 63 02  
            BEQ __e6e2         ; $e6d8: f0 08     
            LDA #$00           ; $e6da: a9 00     
            STA $0263,x        ; $e6dc: 9d 63 02  
            JSR __e72c         ; $e6df: 20 2c e7  
__e6e2:     LDA $1a            ; $e6e2: a5 1a     
            CLC                ; $e6e4: 18        
            ADC #$08           ; $e6e5: 69 08     
            TAX                ; $e6e7: aa        
            CPX $81            ; $e6e8: e4 81     
            BNE __e6cc         ; $e6ea: d0 e0     
            LDA $1b            ; $e6ec: a5 1b     
            EOR #$08           ; $e6ee: 49 08     
            TAX                ; $e6f0: aa        
            LDA #$01           ; $e6f1: a9 01     
            STA $0263,x        ; $e6f3: 9d 63 02  
            RTS                ; $e6f6: 60        

;-------------------------------------------------------------------------------
__e6f7:     INC $31            ; $e6f7: e6 31     
            RTS                ; $e6f9: 60        

;-------------------------------------------------------------------------------
            JSR __e7f5         ; $e6fa: 20 f5 e7  
            LDX $1b            ; $e6fd: a6 1b     
            DEC $0262,x        ; $e6ff: de 62 02  
            BNE __e71d         ; $e702: d0 19     
            LDA #$00           ; $e704: a9 00     
            STA $0260,x        ; $e706: 9d 60 02  
            RTS                ; $e709: 60        

;-------------------------------------------------------------------------------
__e70a:     LDY #$0a           ; $e70a: a0 0a     
            LDA __e7b9,y       ; $e70c: b9 b9 e7  
            STA $12            ; $e70f: 85 12     
            LDA __e7ba,y       ; $e711: b9 ba e7  
            STA $13            ; $e714: 85 13     
            LDA #$80           ; $e716: a9 80     
            STA $14            ; $e718: 85 14     
            JMP __e747         ; $e71a: 4c 47 e7  

;-------------------------------------------------------------------------------
__e71d:     RTS                ; $e71d: 60        

;-------------------------------------------------------------------------------
__e71e:     LDA $21            ; $e71e: a5 21     
            AND #$03           ; $e720: 29 03     
            EOR #$01           ; $e722: 49 01     
            BNE __e71d         ; $e724: d0 f7     
            LDA $21            ; $e726: a5 21     
            AND #$04           ; $e728: 29 04     
            BEQ __e70a         ; $e72a: f0 de     
__e72c:     LDA $0261,x        ; $e72c: bd 61 02  
            LSR                ; $e72f: 4a        
            AND #$fe           ; $e730: 29 fe     
            TAY                ; $e732: a8        
            CMP #$06           ; $e733: c9 06     
            LDA #$00           ; $e735: a9 00     
            BCC __e73b         ; $e737: 90 02     
            LDA #$02           ; $e739: a9 02     
__e73b:     STA $14            ; $e73b: 85 14     
            LDA __e7b9,y       ; $e73d: b9 b9 e7  
            STA $12            ; $e740: 85 12     
            LDA __e7ba,y       ; $e742: b9 ba e7  
            STA $13            ; $e745: 85 13     
__e747:     LDY $0261,x        ; $e747: bc 61 02  
            LDA __e7a5,y       ; $e74a: b9 a5 e7  
            STA $10            ; $e74d: 85 10     
            LDA __e7a6,y       ; $e74f: b9 a6 e7  
            STA $11            ; $e752: 85 11     
            JMP __c6fb         ; $e754: 4c fb c6  

;-------------------------------------------------------------------------------
__e757:     LDA $042f          ; $e757: ad 2f 04  
            CMP #$02           ; $e75a: c9 02     
            BNE __e787         ; $e75c: d0 29     
            LDA $042a          ; $e75e: ad 2a 04  
            BNE __e787         ; $e761: d0 24     
            LDA $0265,x        ; $e763: bd 65 02  
            CMP $0423          ; $e766: cd 23 04  
            BNE __e787         ; $e769: d0 1c     
            LDA $0264,x        ; $e76b: bd 64 02  
            CMP $0421          ; $e76e: cd 21 04  
            BNE __e787         ; $e771: d0 14     
            LDA #$00           ; $e773: a9 00     
            STA $0420          ; $e775: 8d 20 04  
            LDA #$13           ; $e778: a9 13     
            STA $0424          ; $e77a: 8d 24 04  
            LDA #$1e           ; $e77d: a9 1e     
            STA $042f          ; $e77f: 8d 2f 04  
            LDA #$78           ; $e782: a9 78     
            STA $0427          ; $e784: 8d 27 04  
__e787:     RTS                ; $e787: 60        

;-------------------------------------------------------------------------------
            .hex 02            ; $e788: 02        Invalid Opcode - KIL 
            .hex 02            ; $e789: 02        Invalid Opcode - KIL 
            brk                ; $e78a: 00        
            .hex 02            ; $e78b: 02        Invalid Opcode - KIL 
            .hex 02            ; $e78c: 02        Invalid Opcode - KIL 
            .hex 02            ; $e78d: 02        Invalid Opcode - KIL 
            brk                ; $e78e: 00        
            .hex 02            ; $e78f: 02        Invalid Opcode - KIL 
            .hex 02            ; $e790: 02        Invalid Opcode - KIL 
            .hex 02            ; $e791: 02        Invalid Opcode - KIL 
            brk                ; $e792: 00        
            .hex 02            ; $e793: 02        Invalid Opcode - KIL 
            .hex 02            ; $e794: 02        Invalid Opcode - KIL 
            .hex 02            ; $e795: 02        Invalid Opcode - KIL 
            brk                ; $e796: 00        
            .hex 02            ; $e797: 02        Invalid Opcode - KIL 
__e798:     .hex 9a            ; $e798: 9a            Data
__e799:     .hex e7 50 00 02   ; $e799: e7 50 00 02   Data
            .hex 04 06 08 0a   ; $e79d: 04 06 08 0a   Data
            .hex 0c 0e 10 12   ; $e7a1: 0c 0e 10 12   Data
__e7a5:     .hex 52            ; $e7a5: 52            Data
__e7a6:     .hex 25 d8 22 41   ; $e7a6: 25 d8 22 41   Data
            .hex 26 4a 27 49   ; $e7aa: 26 4a 27 49   Data
            .hex 21 42 27 d7   ; $e7ae: 21 42 27 d7   Data
            .hex 21 48 23 c7   ; $e7b2: 21 48 23 c7   Data
            .hex 21 53 26      ; $e7b6: 21 53 26      Data
__e7b9:     .hex c5            ; $e7b9: c5            Data
__e7ba:     .hex e7 cd e7 d5   ; $e7ba: e7 cd e7 d5   Data
            .hex e7 dd e7 e5   ; $e7be: e7 dd e7 e5   Data
            .hex e7 ed e7 02   ; $e7c2: e7 ed e7 02   Data
            .hex 8c 8d 1e 02   ; $e7c6: 8c 8d 1e 02   Data
            .hex 8e 8f 00 02   ; $e7ca: 8e 8f 00 02   Data
            .hex 90 91 1e 02   ; $e7ce: 90 91 1e 02   Data
            .hex 92 93 00 02   ; $e7d2: 92 93 00 02   Data
            .hex 94 95 1e 02   ; $e7d6: 94 95 1e 02   Data
            .hex 96 97 00 02   ; $e7da: 96 97 00 02   Data
            .hex 98 99 1e 02   ; $e7de: 98 99 1e 02   Data
            .hex 9a 9b 00 02   ; $e7e2: 9a 9b 00 02   Data
            .hex 9c 9d 1e 02   ; $e7e6: 9c 9d 1e 02   Data
            .hex 9e 9f 00 02   ; $e7ea: 9e 9f 00 02   Data
            .hex 00 00 1e 02   ; $e7ee: 00 00 1e 02   Data
            .hex 00 00 00      ; $e7f2: 00 00 00      Data

;-------------------------------------------------------------------------------
__e7f5:     LDA #$00           ; $e7f5: a9 00     
            STA $11            ; $e7f7: 85 11     
            SEC                ; $e7f9: 38        
            SBC $28            ; $e7fa: e5 28     
            STA $10            ; $e7fc: 85 10     
            LDA $0264,x        ; $e7fe: bd 64 02  
            SBC $29            ; $e801: e5 29     
            CLC                ; $e803: 18        
            ADC #$01           ; $e804: 69 01     
            ASL $10            ; $e806: 06 10     
            ROL                ; $e808: 2a        
            ASL $10            ; $e809: 06 10     
            ROL                ; $e80b: 2a        
            ASL $10            ; $e80c: 06 10     
            ROL                ; $e80e: 2a        
            STA $10            ; $e80f: 85 10     
            BCC __e815         ; $e811: 90 02     
            DEC $11            ; $e813: c6 11     
__e815:     LDA $0265,x        ; $e815: bd 65 02  
            SEC                ; $e818: 38        
            SBC #$01           ; $e819: e9 01     
            ASL                ; $e81b: 0a        
            ASL                ; $e81c: 0a        
            ASL                ; $e81d: 0a        
            STA $16            ; $e81e: 85 16     
            LDA $0261,x        ; $e820: bd 61 02  
            LSR                ; $e823: 4a        
            LSR                ; $e824: 4a        
            CLC                ; $e825: 18        
            ADC #$ac           ; $e826: 69 ac     
            STA $12            ; $e828: 85 12     
            LDA #$03           ; $e82a: a9 03     
            STA $13            ; $e82c: 85 13     
            JSR __e84d         ; $e82e: 20 4d e8  
            LDA #$67           ; $e831: a9 67     
            STA $12            ; $e833: 85 12     
            JSR __e84d         ; $e835: 20 4d e8  
            LDX $1b            ; $e838: a6 1b     
            LDA $0263,x        ; $e83a: bd 63 02  
            BEQ __e861         ; $e83d: f0 22     
            LDA #$68           ; $e83f: a9 68     
            STA $12            ; $e841: 85 12     
            JSR __e84d         ; $e843: 20 4d e8  
            LDA $31            ; $e846: a5 31     
            CLC                ; $e848: 18        
            ADC #$b0           ; $e849: 69 b0     
            STA $12            ; $e84b: 85 12     
__e84d:     LDA #$00           ; $e84d: a9 00     
            STA $14            ; $e84f: 85 14     
            STA $15            ; $e851: 85 15     
            JSR __c415         ; $e853: 20 15 c4  
            LDA $10            ; $e856: a5 10     
            CLC                ; $e858: 18        
            ADC #$08           ; $e859: 69 08     
            STA $10            ; $e85b: 85 10     
            BCC __e861         ; $e85d: 90 02     
            INC $11            ; $e85f: e6 11     
__e861:     RTS                ; $e861: 60        

;-------------------------------------------------------------------------------
__e862:     LDA $7a            ; $e862: a5 7a     
            ASL                ; $e864: 0a        
            TAY                ; $e865: a8        
            LDA __eafc,y       ; $e866: b9 fc ea  
            STA $1c            ; $e869: 85 1c     
            LDA __eafd,y       ; $e86b: b9 fd ea  
            STA $1d            ; $e86e: 85 1d     
            LDY #$00           ; $e870: a0 00     
            LDA ($1c),y        ; $e872: b1 1c     
            STA $83            ; $e874: 85 83     
            BEQ __e8cb         ; $e876: f0 53     
            INY                ; $e878: c8        
            LDX #$00           ; $e879: a2 00     
__e87b:     STX $1b            ; $e87b: 86 1b     
            LDA #$00           ; $e87d: a9 00     
            STA $02b0,x        ; $e87f: 9d b0 02  
            STA $02b6,x        ; $e882: 9d b6 02  
            LDA ($1c),y        ; $e885: b1 1c     
            INY                ; $e887: c8        
            STA $02b1,x        ; $e888: 9d b1 02  
            LDA ($1c),y        ; $e88b: b1 1c     
            INY                ; $e88d: c8        
            STA $02b2,x        ; $e88e: 9d b2 02  
            STA $10            ; $e891: 85 10     
            LDA ($1c),y        ; $e893: b1 1c     
            INY                ; $e895: c8        
            STA $02b3,x        ; $e896: 9d b3 02  
            STA $11            ; $e899: 85 11     
            JSR __e3bd         ; $e89b: 20 bd e3  
            LDA $10            ; $e89e: a5 10     
            STA $02b4,x        ; $e8a0: 9d b4 02  
            LDA $11            ; $e8a3: a5 11     
            STA $02b5,x        ; $e8a5: 9d b5 02  
            LDA $1b            ; $e8a8: a5 1b     
            CLC                ; $e8aa: 18        
            ADC #$08           ; $e8ab: 69 08     
            TAX                ; $e8ad: aa        
            CPX $83            ; $e8ae: e4 83     
            BNE __e87b         ; $e8b0: d0 c9     
__e8b2:     LDX #$00           ; $e8b2: a2 00     
__e8b4:     STX $1b            ; $e8b4: 86 1b     
            LDA $02b1,x        ; $e8b6: bd b1 02  
            AND #$fc           ; $e8b9: 29 fc     
            STA $02b1,x        ; $e8bb: 9d b1 02  
            JSR __e8ff         ; $e8be: 20 ff e8  
            LDA $1b            ; $e8c1: a5 1b     
            CLC                ; $e8c3: 18        
            ADC #$08           ; $e8c4: 69 08     
            TAX                ; $e8c6: aa        
            CPX $83            ; $e8c7: e4 83     
            BNE __e8b4         ; $e8c9: d0 e9     
__e8cb:     RTS                ; $e8cb: 60        

;-------------------------------------------------------------------------------
__e8cc:     LDA $83            ; $e8cc: a5 83     
            BEQ __e8cb         ; $e8ce: f0 fb     
            LDX #$00           ; $e8d0: a2 00     
__e8d2:     STX $1b            ; $e8d2: 86 1b     
            JSR __e91d         ; $e8d4: 20 1d e9  
            LDA $1b            ; $e8d7: a5 1b     
            CLC                ; $e8d9: 18        
            ADC #$08           ; $e8da: 69 08     
            TAX                ; $e8dc: aa        
            CPX $83            ; $e8dd: e4 83     
            BNE __e8d2         ; $e8df: d0 f1     
            LDA $21            ; $e8e1: a5 21     
            AND #$03           ; $e8e3: 29 03     
            ASL                ; $e8e5: 0a        
            ASL                ; $e8e6: 0a        
            ASL                ; $e8e7: 0a        
            TAX                ; $e8e8: aa        
            LDA $02b0,x        ; $e8e9: bd b0 02  
            BNE __e8cb         ; $e8ec: d0 dd     
            LDA $02b1,x        ; $e8ee: bd b1 02  
            AND #$0a           ; $e8f1: 29 0a     
            EOR #$08           ; $e8f3: 49 08     
            BNE __e8cb         ; $e8f5: d0 d4     
            LDY #$10           ; $e8f7: a0 10     
            LDA $21            ; $e8f9: a5 21     
            AND #$04           ; $e8fb: 29 04     
            BEQ __e902         ; $e8fd: f0 03     
__e8ff:     LDY $02b1,x        ; $e8ff: bc b1 02  
__e902:     LDA $02b2,x        ; $e902: bd b2 02  
            STA $10            ; $e905: 85 10     
            LDA $02b3,x        ; $e907: bd b3 02  
            STA $11            ; $e90a: 85 11     
            LDA __ec4f,y       ; $e90c: b9 4f ec  
            STA $12            ; $e90f: 85 12     
            LDA __ec50,y       ; $e911: b9 50 ec  
            STA $13            ; $e914: 85 13     
            LDA #$80           ; $e916: a9 80     
            STA $14            ; $e918: 85 14     
            JMP __c6fb         ; $e91a: 4c fb c6  

;-------------------------------------------------------------------------------
__e91d:     LDA $02b0,x        ; $e91d: bd b0 02  
            BEQ __e942         ; $e920: f0 20     
            INC $02b6,x        ; $e922: fe b6 02  
            LDA $02b6,x        ; $e925: bd b6 02  
            CMP #$05           ; $e928: c9 05     
            BCC __e943         ; $e92a: 90 17     
            LDA #$00           ; $e92c: a9 00     
            STA $02b0,x        ; $e92e: 9d b0 02  
            STA $02b6,x        ; $e931: 9d b6 02  
            LDA $02b1,x        ; $e934: bd b1 02  
            AND #$06           ; $e937: 29 06     
            EOR #$02           ; $e939: 49 02     
            STA $02b1,x        ; $e93b: 9d b1 02  
            AND #$02           ; $e93e: 29 02     
            BEQ __e8ff         ; $e940: f0 bd     
__e942:     RTS                ; $e942: 60        

;-------------------------------------------------------------------------------
__e943:     ASL                ; $e943: 0a        
            STA $10            ; $e944: 85 10     
            JSR __e94d         ; $e946: 20 4d e9  
            TAY                ; $e949: a8        
            JMP __e902         ; $e94a: 4c 02 e9  

;-------------------------------------------------------------------------------
__e94d:     LDA $02b1,x        ; $e94d: bd b1 02  
            AND #$06           ; $e950: 29 06     
            BEQ __e960         ; $e952: f0 0c     
            CMP #$04           ; $e954: c9 04     
            BCC __e966         ; $e956: 90 0e     
            BEQ __e96c         ; $e958: f0 12     
            LDA #$22           ; $e95a: a9 22     
            SEC                ; $e95c: 38        
            SBC $10            ; $e95d: e5 10     
            RTS                ; $e95f: 60        

;-------------------------------------------------------------------------------
__e960:     LDA $10            ; $e960: a5 10     
            CLC                ; $e962: 18        
            ADC #$10           ; $e963: 69 10     
            RTS                ; $e965: 60        

;-------------------------------------------------------------------------------
__e966:     LDA #$1a           ; $e966: a9 1a     
            SEC                ; $e968: 38        
            SBC $10            ; $e969: e5 10     
            RTS                ; $e96b: 60        

;-------------------------------------------------------------------------------
__e96c:     LDA $10            ; $e96c: a5 10     
            CLC                ; $e96e: 18        
            ADC #$18           ; $e96f: 69 18     
__e971:     RTS                ; $e971: 60        

;-------------------------------------------------------------------------------
__e972:     LDA $83            ; $e972: a5 83     
            BEQ __e971         ; $e974: f0 fb     
            LDY #$0e           ; $e976: a0 0e     
            LDA ($1e),y        ; $e978: b1 1e     
            AND #$03           ; $e97a: 29 03     
            CMP #$01           ; $e97c: c9 01     
            BNE __e971         ; $e97e: d0 f1     
            LDY #$00           ; $e980: a0 00     
            LDX #$00           ; $e982: a2 00     
__e984:     JSR __e9b8         ; $e984: 20 b8 e9  
            TXA                ; $e987: 8a        
            CLC                ; $e988: 18        
            ADC #$08           ; $e989: 69 08     
            TAX                ; $e98b: aa        
            CPX $83            ; $e98c: e4 83     
            BNE __e984         ; $e98e: d0 f4     
            DEY                ; $e990: 88        
            bmi __e971         ; $e991: 30 de     
__e993:     LDA $0012,y        ; $e993: b9 12 00  
            DEY                ; $e996: 88        
            LDX $12,y          ; $e997: b6 12     
__e999:     DEY                ; $e999: 88        
            bmi __e9a4         ; $e99a: 30 08     
            CMP $0012,y        ; $e99c: d9 12 00  
            BCS __e993         ; $e99f: b0 f2     
            DEY                ; $e9a1: 88        
            BCC __e999         ; $e9a2: 90 f5     
__e9a4:     LDA #$01           ; $e9a4: a9 01     
            STA $02b0,x        ; $e9a6: 9d b0 02  
            JSR __ea05         ; $e9a9: 20 05 ea  
            LDA $02b1,x        ; $e9ac: bd b1 02  
            AND #$0a           ; $e9af: 29 0a     
            EOR #$08           ; $e9b1: 49 08     
            BNE __e971         ; $e9b3: d0 bc     
            JMP __ee04         ; $e9b5: 4c 04 ee  

;-------------------------------------------------------------------------------
__e9b8:     STY $11            ; $e9b8: 84 11     
            LDA $1e            ; $e9ba: a5 1e     
            STA $02b7,x        ; $e9bc: 9d b7 02  
            BNE __e9cb         ; $e9bf: d0 0a     
            LDA $02b4,x        ; $e9c1: bd b4 02  
            SEC                ; $e9c4: 38        
            SBC $29            ; $e9c5: e5 29     
            CMP #$21           ; $e9c7: c9 21     
            BCS __e9eb         ; $e9c9: b0 20     
__e9cb:     LDY #$03           ; $e9cb: a0 03     
            LDA ($1e),y        ; $e9cd: b1 1e     
            SEC                ; $e9cf: 38        
            SBC $02b5,x        ; $e9d0: fd b5 02  
            CMP #$02           ; $e9d3: c9 02     
            BCS __e9eb         ; $e9d5: b0 14     
            LDY #$01           ; $e9d7: a0 01     
            LDA ($1e),y        ; $e9d9: b1 1e     
            SEC                ; $e9db: 38        
            SBC $02b4,x        ; $e9dc: fd b4 02  
            STA $10            ; $e9df: 85 10     
            LDY #$06           ; $e9e1: a0 06     
            LDA ($1e),y        ; $e9e3: b1 1e     
            bmi __e9ee         ; $e9e5: 30 07     
            INC $10            ; $e9e7: e6 10     
            bmi __e9f2         ; $e9e9: 30 07     
__e9eb:     LDY $11            ; $e9eb: a4 11     
            RTS                ; $e9ed: 60        

;-------------------------------------------------------------------------------
__e9ee:     LDA $10            ; $e9ee: a5 10     
            bmi __e9eb         ; $e9f0: 30 f9     
__e9f2:     LDY $11            ; $e9f2: a4 11     
            STX $12,y          ; $e9f4: 96 12     
            INY                ; $e9f6: c8        
            LDA $10            ; $e9f7: a5 10     
            BPL __ea00         ; $e9f9: 10 05     
            LDA #$00           ; $e9fb: a9 00     
            SEC                ; $e9fd: 38        
            SBC $10            ; $e9fe: e5 10     
__ea00:     STA $0012,y        ; $ea00: 99 12 00  
            INY                ; $ea03: c8        
            RTS                ; $ea04: 60        

;-------------------------------------------------------------------------------
__ea05:     LDA $02b1,x        ; $ea05: bd b1 02  
            AND #$06           ; $ea08: 29 06     
            TAY                ; $ea0a: a8        
            LDA __ea49,y       ; $ea0b: b9 49 ea  
            STA $1c            ; $ea0e: 85 1c     
            LDA __ea4a,y       ; $ea10: b9 4a ea  
            STA $1d            ; $ea13: 85 1d     
            LDY #$00           ; $ea15: a0 00     
__ea17:     CPY #$10           ; $ea17: c0 10     
            BEQ __ea3c         ; $ea19: f0 21     
            LDA $0404,y        ; $ea1b: b9 04 04  
            BEQ __ea3c         ; $ea1e: f0 1c     
            LDA $040f,y        ; $ea20: b9 0f 04  
            CMP #$16           ; $ea23: c9 16     
            BEQ __ea3c         ; $ea25: f0 15     
            LDA $0403,y        ; $ea27: b9 03 04  
            SEC                ; $ea2a: 38        
            SBC $02b5,x        ; $ea2b: fd b5 02  
            CMP #$02           ; $ea2e: c9 02     
            BCS __ea3c         ; $ea30: b0 0a     
            LDA $02b4,x        ; $ea32: bd b4 02  
            SEC                ; $ea35: 38        
            SBC $0401,y        ; $ea36: f9 01 04  
            JSR __ea46         ; $ea39: 20 46 ea  
__ea3c:     tya                ; $ea3c: 98        
            CLC                ; $ea3d: 18        
            ADC #$10           ; $ea3e: 69 10     
            TAY                ; $ea40: a8        
            CPY #$90           ; $ea41: c0 90     
            BNE __ea17         ; $ea43: d0 d2     
            RTS                ; $ea45: 60        

;-------------------------------------------------------------------------------
__ea46:     JMP ($001c)        ; $ea46: 6c 1c 00  

;-------------------------------------------------------------------------------
__ea49:     .hex 5e            ; $ea49: 5e            Data
__ea4a:     .hex ea 51 ea 69   ; $ea4a: ea 51 ea 69   Data
            .hex ea 59 ea 18   ; $ea4e: ea 59 ea 18   Data
            .hex 69 01 c9 04   ; $ea52: 69 01 c9 04   Data
            .hex 90 18 60 c9   ; $ea56: 90 18 60 c9   Data
            .hex 04 4c 63 ea   ; $ea5a: 04 4c 63 ea   Data
            .hex 18 69 02 c9   ; $ea5e: 18 69 02 c9   Data
            .hex 03 b0 2a a9   ; $ea62: 03 b0 2a a9   Data
            .hex 01 90 09      ; $ea66: 01 90 09      Data

;-------------------------------------------------------------------------------
            SEC                ; $ea69: 38        
            SBC #$02           ; $ea6a: e9 02     
            CMP #$03           ; $ea6c: c9 03     
            BCS __ea8f         ; $ea6e: b0 1f     
            LDA #$ff           ; $ea70: a9 ff     
            STA $0406,y        ; $ea72: 99 06 04  
            LDA #$0c           ; $ea75: a9 0c     
            STA $0404,y        ; $ea77: 99 04 04  
            LDA #$10           ; $ea7a: a9 10     
            STA $040f,y        ; $ea7c: 99 0f 04  
            LDA #$08           ; $ea7f: a9 08     
            STA $0407,y        ; $ea81: 99 07 04  
            CPY #$00           ; $ea84: c0 00     
            BEQ __ea8f         ; $ea86: f0 07     
            LDA $02b7,x        ; $ea88: bd b7 02  
            BNE __ea8f         ; $ea8b: d0 02     
            INC $30            ; $ea8d: e6 30     
__ea8f:     RTS                ; $ea8f: 60        

;-------------------------------------------------------------------------------
__ea90:     LDA #$00           ; $ea90: a9 00     
            LDY #$09           ; $ea92: a0 09     
            STA ($1e),y        ; $ea94: 91 1e     
            LDX #$00           ; $ea96: a2 00     
__ea98:     LDA $02b0,x        ; $ea98: bd b0 02  
            BNE __eae8         ; $ea9b: d0 4b     
            LDA $02b1,x        ; $ea9d: bd b1 02  
            AND #$02           ; $eaa0: 29 02     
            BNE __eae8         ; $eaa2: d0 44     
            LDY #$03           ; $eaa4: a0 03     
            LDA ($1e),y        ; $eaa6: b1 1e     
            SEC                ; $eaa8: 38        
            SBC $02b5,x        ; $eaa9: fd b5 02  
            CMP #$02           ; $eaac: c9 02     
            BCS __eae8         ; $eaae: b0 38     
            LDY #$06           ; $eab0: a0 06     
            LDA ($1e),y        ; $eab2: b1 1e     
            bmi __eade         ; $eab4: 30 28     
            LDA $02b4,x        ; $eab6: bd b4 02  
            SEC                ; $eab9: 38        
            LDY #$01           ; $eaba: a0 01     
            SBC ($1e),y        ; $eabc: f1 1e     
            CMP #$02           ; $eabe: c9 02     
            BNE __eae8         ; $eac0: d0 26     
__eac2:     LDA $1e            ; $eac2: a5 1e     
            STA $02b7,x        ; $eac4: 9d b7 02  
            BEQ __ead7         ; $eac7: f0 0e     
            CMP #$20           ; $eac9: c9 20     
            BCC __ead4         ; $eacb: 90 07     
            LDA $02b1,x        ; $eacd: bd b1 02  
            AND #$08           ; $ead0: 29 08     
            BNE __eaf2         ; $ead2: d0 1e     
__ead4:     JSR __e9a4         ; $ead4: 20 a4 e9  
__ead7:     LDA #$01           ; $ead7: a9 01     
            LDY #$09           ; $ead9: a0 09     
            STA ($1e),y        ; $eadb: 91 1e     
            RTS                ; $eadd: 60        

;-------------------------------------------------------------------------------
__eade:     LDA $02b4,x        ; $eade: bd b4 02  
            SEC                ; $eae1: 38        
            LDY #$01           ; $eae2: a0 01     
            CMP ($1e),y        ; $eae4: d1 1e     
            BEQ __eac2         ; $eae6: f0 da     
__eae8:     TXA                ; $eae8: 8a        
            CLC                ; $eae9: 18        
            ADC #$08           ; $eaea: 69 08     
            TAX                ; $eaec: aa        
            CPX $83            ; $eaed: e4 83     
            BNE __ea98         ; $eaef: d0 a7     
            RTS                ; $eaf1: 60        

;-------------------------------------------------------------------------------
__eaf2:     LDY #$06           ; $eaf2: a0 06     
            SEC                ; $eaf4: 38        
            LDA #$00           ; $eaf5: a9 00     
            SBC ($1e),y        ; $eaf7: f1 1e     
            STA ($1e),y        ; $eaf9: 91 1e     
            RTS                ; $eafb: 60        

;-------------------------------------------------------------------------------
__eafc:     .hex 1c            ; $eafc: 1c            Data
__eafd:     .hex eb 3b eb 4e   ; $eafd: eb 3b eb 4e   Data
            .hex ec 5a eb 73   ; $eb01: ec 5a eb 73   Data
            .hex eb 8c eb 4e   ; $eb05: eb 8c eb 4e   Data
            .hex ec a8 eb c4   ; $eb09: ec a8 eb c4   Data
            .hex eb dd eb 4e   ; $eb0d: eb dd eb 4e   Data
            .hex ec f3 eb 09   ; $eb11: ec f3 eb 09   Data
            .hex ec 22 ec 4e   ; $eb15: ec 22 ec 4e   Data
            .hex ec 2f ec 50   ; $eb19: ec 2f ec 50   Data
            .hex 08 ac 21 08   ; $eb1d: 08 ac 21 08   Data
            .hex 2c 23 0c 2f   ; $eb21: 2c 23 0c 2f   Data
            .hex 25 0c af 26   ; $eb25: 25 0c af 26   Data
            .hex 00 2c 21 00   ; $eb29: 00 2c 21 00   Data
            .hex bd 21 00 ac   ; $eb2d: bd 21 00 ac   Data
            .hex 22 04 bd 22   ; $eb31: 22 04 bd 22   Data
            .hex 04 3d 23 04   ; $eb35: 04 3d 23 04   Data
            .hex 2f 26 50 08   ; $eb39: 2f 26 50 08   Data
            .hex 2c 22 08 2c   ; $eb3d: 2c 22 08 2c   Data
            .hex 23 0c 2f 25   ; $eb41: 23 0c 2f 25   Data
            .hex 0c 2f 27 00   ; $eb45: 0c 2f 27 00   Data
            .hex 2c 21 00 ac   ; $eb49: 2c 21 00 ac   Data
            .hex 22 00 3d 23   ; $eb4d: 22 00 3d 23   Data
            .hex 00 2a 26 04   ; $eb51: 00 2a 26 04   Data
            .hex 3d 22 04 a5   ; $eb55: 3d 22 04 a5   Data
            .hex 25 40 08 2c   ; $eb59: 25 40 08 2c   Data
            .hex 21 08 2c 23   ; $eb5d: 21 08 2c 23   Data
            .hex 0c b0 25 0c   ; $eb61: 0c b0 25 0c   Data
            .hex b0 26 00 25   ; $eb65: b0 26 00 25   Data
            .hex 27 04 2b 22   ; $eb69: 27 04 2b 22   Data
            .hex 04 2f 25 04   ; $eb6d: 04 2f 25 04   Data
            .hex 30 26 40 08   ; $eb71: 30 26 40 08   Data
            .hex ab 21 08 ab   ; $eb75: ab 21 08 ab   Data
            .hex 22 0c b0 25   ; $eb79: 22 0c b0 25   Data
            .hex 0c b0 26 00   ; $eb7d: 0c b0 26 00   Data
            .hex 26 22 00 2a   ; $eb81: 26 22 00 2a   Data
            .hex 25 04 2f 27   ; $eb85: 25 04 2f 27   Data
            .hex 04 31 23 48   ; $eb89: 04 31 23 48   Data
            .hex 08 2c 21 08   ; $eb8d: 08 2c 21 08   Data
            .hex 2c 23 0c 2f   ; $eb91: 2c 23 0c 2f   Data
            .hex 25 0c b0 26   ; $eb95: 25 0c b0 26   Data
            .hex 00 ab 21 00   ; $eb99: 00 ab 21 00   Data
            .hex a6 22 00 25   ; $eb9d: a6 22 00 25   Data
            .hex 27 04 b5 25   ; $eba1: 27 04 b5 25   Data
            .hex 04 30 26 48   ; $eba5: 04 30 26 48   Data
            .hex 08 ac 21 08   ; $eba9: 08 ac 21 08   Data
            .hex 39 22 08 2c   ; $ebad: 39 22 08 2c   Data
            .hex 23 0c af 26   ; $ebb1: 23 0c af 26   Data
            .hex 00 26 22 00   ; $ebb5: 00 26 22 00   Data
            .hex 3d 23 04 2f   ; $ebb9: 3d 23 04 2f   Data
            .hex 27 04         ; $ebbd: 27 04         Data
__ebbf:     .hex 2f 25 04 b5   ; $ebbf: 2f 25 04 b5   Data
            .hex 25 40 08 2c   ; $ebc3: 25 40 08 2c   Data
            .hex 23 08 af 25   ; $ebc7: 23 08 af 25   Data
            .hex 0c 39 22      ; $ebcb: 0c 39 22      Data
__ebce:     .hex 0c 2f 25 00   ; $ebce: 0c 2f 25 00   Data
            .hex 2c 22 00 a6   ; $ebd2: 2c 22 00 a6   Data
            .hex 22 00 af 26   ; $ebd6: 22 00 af 26   Data
            .hex 04 3d 23 38   ; $ebda: 04 3d 23 38   Data
            .hex 0c ac 21 0c   ; $ebde: 0c ac 21 0c   Data
            .hex 39 22 0c 3d   ; $ebe2: 39 22 0c 3d   Data
            .hex 23 0c af 25   ; $ebe6: 23 0c af 25   Data
            .hex 00 2c 22 00   ; $ebea: 00 2c 22 00   Data
            .hex a6 22 00 2f   ; $ebee: a6 22 00 2f   Data
            .hex 26 38 08 30   ; $ebf2: 26 38 08 30   Data
            .hex 21 08 35 23   ; $ebf6: 21 08 35 23   Data
            .hex 08 a6 25 0c   ; $ebfa: 08 a6 25 0c   Data
            .hex 35 22 00 a6   ; $ebfe: 35 22 00 a6   Data
            .hex 26 00 26 27   ; $ec02: 26 00 26 27   Data
            .hex 04 26 25 40   ; $ec06: 04 26 25 40   Data
            .hex 08 30 21 08   ; $ec0a: 08 30 21 08   Data
            .hex 26 26 0c 35   ; $ec0e: 26 26 0c 35   Data
            .hex 23 0c 2b 25   ; $ec12: 23 0c 2b 25   Data
            .hex 00 30         ; $ec16: 00 30         Data
__ec18:     .hex 22 00 a6 22   ; $ec18: 22 00 a6 22   Data
            .hex 00 26 27 04   ; $ec1c: 00 26 27 04   Data
            .hex ab 25 20 08   ; $ec20: ab 25 20 08   Data
            .hex 35 21 08 26   ; $ec24: 35 21 08 26   Data
            .hex 25 08 a6 26   ; $ec28: 25 08 a6 26   Data
            .hex 0c b5         ; $ec2c: 0c b5         Data
__ec2e:     .hex 22 50 08 bd   ; $ec2e: 22 50 08 bd   Data
            .hex 22 08 2c 23   ; $ec32: 22 08 2c 23   Data
            .hex 0c 2f 27      ; $ec36: 0c 2f 27      Data
__ec39:     .hex 0c bd         ; $ec39: 0c bd     Suspected data
__ec3b:     .hex 21 00 2c 21   ; $ec3b: 21 00 2c 21   Data
            .hex 00 2c 22 00   ; $ec3f: 00 2c 22 00   Data
            .hex a6 22 00 aa   ; $ec43: a6 22 00 aa   Data
            .hex 26 04 2f 25   ; $ec47: 26 04 2f 25   Data
            .hex 04 2f 26 00   ; $ec4b: 04 2f 26 00   Data
__ec4f:     .hex 71            ; $ec4f: 71            Data
__ec50:     .hex ec c5 ec 7a   ; $ec50: ec c5 ec 7a   Data
            .hex ec 01 ed 83   ; $ec54: ec 01 ed 83   Data
            .hex ec c5 ec 8c   ; $ec58: ec c5 ec 8c   Data
            .hex ec 01 ed 95   ; $ec5c: ec 01 ed 95   Data
            .hex ec 9e ec aa   ; $ec60: ec 9e ec aa   Data
            .hex ec b6 ec c5   ; $ec64: ec b6 ec c5   Data
            .hex ec d4 ec e2   ; $ec68: ec d4 ec e2   Data
            .hex ec f0 ec 01   ; $ec6c: ec f0 ec 01   Data
            .hex ed 01 56 1f   ; $ec70: ed 01 56 1f   Data
            .hex 01 58 1f 01   ; $ec74: 01 58 1f 01   Data
            .hex 56 00 01 56   ; $ec78: 56 00 01 56   Data
            .hex 1f 01 57 1f   ; $ec7c: 1f 01 57 1f   Data
            .hex 01 56 00 01   ; $ec80: 01 56 00 01   Data
            .hex 53 1f 01 55   ; $ec84: 53 1f 01 55   Data
            .hex 1f 01 53 00   ; $ec88: 1f 01 53 00   Data
            .hex 01 53 1f 01   ; $ec8c: 01 53 1f 01   Data
            .hex 54 1f 01 53   ; $ec90: 54 1f 01 53   Data
            .hex 00 01 52 1f   ; $ec94: 00 01 52 1f   Data
            .hex 01 52 1f 01   ; $ec98: 01 52 1f 01   Data
            .hex 52 00 02 87   ; $ec9c: 52 00 02 87   Data
            .hex 00 1e 02 87   ; $eca0: 00 1e 02 87   Data
            .hex 00 1e 02 87   ; $eca4: 00 1e 02 87   Data
            .hex 00 00 02 87   ; $eca8: 00 00 02 87   Data
            .hex 89 1e 02 87   ; $ecac: 89 1e 02 87   Data
            .hex 89 1e 02 87   ; $ecb0: 89 1e 02 87   Data
            .hex 89 00 03 87   ; $ecb4: 89 00 03 87   Data
            .hex 88 00 1d 03   ; $ecb8: 88 00 1d 03   Data
            .hex 87 88 00 1d   ; $ecbc: 87 88 00 1d   Data
            .hex 03 87 88 00   ; $ecc0: 03 87 88 00   Data
            .hex 00 03 87 88   ; $ecc4: 00 03 87 88   Data
            .hex 89 1d 03 87   ; $ecc8: 89 1d 03 87   Data
            .hex 88 89 1d 03   ; $eccc: 88 89 1d 03   Data
            .hex 87 88 89 00   ; $ecd0: 87 88 89 00   Data
            .hex 00 ff 02 00   ; $ecd4: 00 ff 02 00   Data
            .hex 89 1e 02 00   ; $ecd8: 89 1e 02 00   Data
            .hex 89 1e 02 00   ; $ecdc: 89 1e 02 00   Data
            .hex 89 00 00 ff   ; $ece0: 89 00 00 ff   Data
            .hex 02 87 89 1e   ; $ece4: 02 87 89 1e   Data
            .hex 02 87 89 1e   ; $ece8: 02 87 89 1e   Data
            .hex 02 87 89 00   ; $ecec: 02 87 89 00   Data
            .hex 00 fe 03 00   ; $ecf0: 00 fe 03 00   Data
            .hex 88 89 1d 03   ; $ecf4: 88 89 1d 03   Data
            .hex 00 88 89 1d   ; $ecf8: 00 88 89 1d   Data
            .hex 03 00 88 89   ; $ecfc: 03 00 88 89   Data
            .hex 00 00 fe 03   ; $ed00: 00 00 fe 03   Data
            .hex 87 88 89 1d   ; $ed04: 87 88 89 1d   Data
            .hex 03 87 88 89   ; $ed08: 03 87 88 89   Data
            .hex 1d 03 87 88   ; $ed0c: 1d 03 87 88   Data
            .hex 89 00         ; $ed10: 89 00         Data
__ed12:     LDA #$60           ; $ed12: a9 60     
            JSR __ee4d         ; $ed14: 20 4d ee  
            JSR __c305         ; $ed17: 20 05 c3  
            BNE __ed4d         ; $ed1a: d0 31     

;-------------------------------------------------------------------------------
__ed1c:     LDA #$30           ; $ed1c: a9 30     
            STA $4c            ; $ed1e: 85 4c     
            LDA #$00           ; $ed20: a9 00     
            LDY #$05           ; $ed22: a0 05     
            STA ($1e),y        ; $ed24: 91 1e     
            LDY #$04           ; $ed26: a0 04     
            STA ($1e),y        ; $ed28: 91 1e     
            LDX #$20           ; $ed2a: a2 20     
__ed2c:     LDA $040b,x        ; $ed2c: bd 0b 04  
            CMP $1e            ; $ed2f: c5 1e     
            BNE __ed44         ; $ed31: d0 11     
            LDA $040f,x        ; $ed33: bd 0f 04  
            CMP #$18           ; $ed36: c9 18     
            BNE __ed44         ; $ed38: d0 0a     
            LDA #$1a           ; $ed3a: a9 1a     
            STA $040f,x        ; $ed3c: 9d 0f 04  
            LDA #$3c           ; $ed3f: a9 3c     
            STA $0407,x        ; $ed41: 9d 07 04  
__ed44:     TXA                ; $ed44: 8a        
            CLC                ; $ed45: 18        
            ADC #$10           ; $ed46: 69 10     
            TAX                ; $ed48: aa        
            CPX #$90           ; $ed49: e0 90     
            BNE __ed2c         ; $ed4b: d0 df     
__ed4d:     RTS                ; $ed4d: 60        

;-------------------------------------------------------------------------------
__ed4e:     LDA #$a0           ; $ed4e: a9 a0     
            STA $1e            ; $ed50: 85 1e     
            LDA #$04           ; $ed52: a9 04     
            STA $1f            ; $ed54: 85 1f     
__ed56:     JSR __ed65         ; $ed56: 20 65 ed  
            LDA $1e            ; $ed59: a5 1e     
            CLC                ; $ed5b: 18        
            ADC #$08           ; $ed5c: 69 08     
            STA $1e            ; $ed5e: 85 1e     
            CMP #$c0           ; $ed60: c9 c0     
            BNE __ed56         ; $ed62: d0 f2     
            RTS                ; $ed64: 60        

;-------------------------------------------------------------------------------
__ed65:     LDY #$05           ; $ed65: a0 05     
            LDA ($1e),y        ; $ed67: b1 1e     
            BEQ __ed4d         ; $ed69: f0 e2     
            CMP #$02           ; $ed6b: c9 02     
            BCS __ed12         ; $ed6d: b0 a3     
            LDA $42            ; $ed6f: a5 42     
            STA $0609          ; $ed71: 8d 09 06  
            JSR __ee77         ; $ed74: 20 77 ee  
            JSR __eec9         ; $ed77: 20 c9 ee  
            LDA #$08           ; $ed7a: a9 08     
            LDY #$04           ; $ed7c: a0 04     
            STA ($1e),y        ; $ed7e: 91 1e     
            LDA $63            ; $ed80: a5 63     
            CLC                ; $ed82: 18        
            ADC #$08           ; $ed83: 69 08     
            JSR __ee4d         ; $ed85: 20 4d ee  
            JSR __c305         ; $ed88: 20 05 c3  
            BNE __ed4d         ; $ed8b: d0 c0     
            LDY #$00           ; $ed8d: a0 00     
            LDX #$20           ; $ed8f: a2 20     
__ed91:     JSR __ede2         ; $ed91: 20 e2 ed  
            TXA                ; $ed94: 8a        
            CLC                ; $ed95: 18        
            ADC #$10           ; $ed96: 69 10     
            TAX                ; $ed98: aa        
            CPX #$90           ; $ed99: e0 90     
            BNE __ed91         ; $ed9b: d0 f4     
            tya                ; $ed9d: 98        
            BNE __eda3         ; $ed9e: d0 03     
            JMP __ed1c         ; $eda0: 4c 1c ed  

;-------------------------------------------------------------------------------
__eda3:     LDX #$fd           ; $eda3: a2 fd     
            ASL                ; $eda5: 0a        
            ADC #$fe           ; $eda6: 69 fe     
            PHA                ; $eda8: 48        
            bmi __edad         ; $eda9: 30 02     
            LDX #$ff           ; $edab: a2 ff     
__edad:     LDY #$07           ; $edad: a0 07     
            STA ($1e),y        ; $edaf: 91 1e     
            LDA #$02           ; $edb1: a9 02     
            LDY #$05           ; $edb3: a0 05     
            STA ($1e),y        ; $edb5: 91 1e     
            LDA #$10           ; $edb7: a9 10     
            LDY #$04           ; $edb9: a0 04     
            STA ($1e),y        ; $edbb: 91 1e     
            LDA #$00           ; $edbd: a9 00     
            LDY #$06           ; $edbf: a0 06     
            SEC                ; $edc1: 38        
            SBC ($1e),y        ; $edc2: f1 1e     
            STA ($1e),y        ; $edc4: 91 1e     
            BPL __edca         ; $edc6: 10 02     
            LDX #$fe           ; $edc8: a2 fe     
__edca:     LDY #$01           ; $edca: a0 01     
            TXA                ; $edcc: 8a        
            CLC                ; $edcd: 18        
            ADC ($1e),y        ; $edce: 71 1e     
            STA ($1e),y        ; $edd0: 91 1e     
            LDA #$01           ; $edd2: a9 01     
            STA $18            ; $edd4: 85 18     
            PLA                ; $edd6: 68        
            ASL                ; $edd7: 0a        
            BCC __eddc         ; $edd8: 90 02     
            INC $18            ; $edda: e6 18     
__eddc:     CLC                ; $eddc: 18        
            ADC #$14           ; $eddd: 69 14     
            JMP __d4be         ; $eddf: 4c be d4  

;-------------------------------------------------------------------------------
__ede2:     LDA $040b,x        ; $ede2: bd 0b 04  
            CMP $1e            ; $ede5: c5 1e     
            BNE __ee03         ; $ede7: d0 1a     
            LDA $040f,x        ; $ede9: bd 0f 04  
            CMP #$16           ; $eDEC: c9 16     
            BNE __ee03         ; $edee: d0 13     
            LDA #$18           ; $edf0: a9 18     
            STA $040f,x        ; $edf2: 9d 0f 04  
            LDA #$00           ; $edf5: a9 00     
            STA $0404,x        ; $edf7: 9d 04 04  
            INY                ; $edfa: c8        
            CPX #$20           ; $edfb: e0 20     
            BNE __ee03         ; $edfd: d0 04     
            tya                ; $edff: 98        
            ORA #$40           ; $ee00: 09 40     
            TAY                ; $ee02: a8        
__ee03:     RTS                ; $ee03: 60        

;-------------------------------------------------------------------------------
__ee04:     LDY #$00           ; $ee04: a0 00     
__ee06:     LDA $04a5,y        ; $ee06: b9 a5 04  
            BEQ __ee15         ; $ee09: f0 0a     
            tya                ; $ee0b: 98        
            CLC                ; $ee0c: 18        
            ADC #$08           ; $ee0d: 69 08     
            TAY                ; $ee0f: a8        
            CPY #$20           ; $ee10: c0 20     
            BNE __ee06         ; $ee12: d0 f2     
            RTS                ; $ee14: 60        

;-------------------------------------------------------------------------------
__ee15:     LDA #$01           ; $ee15: a9 01     
            STA $04a5,y        ; $ee17: 99 a5 04  
            LDA #$00           ; $ee1a: a9 00     
            STA $04a0,y        ; $ee1c: 99 a0 04  
            STA $04a2,y        ; $ee1f: 99 a2 04  
            LDA $02b5,x        ; $ee22: bd b5 02  
            SEC                ; $ee25: 38        
            SBC #$01           ; $ee26: e9 01     
            STA $04a3,y        ; $ee28: 99 a3 04  
            LDA $02b1,x        ; $ee2b: bd b1 02  
            AND #$04           ; $ee2e: 29 04     
            BEQ __ee41         ; $ee30: f0 0f     
            LDA #$ff           ; $ee32: a9 ff     
            STA $04a6,y        ; $ee34: 99 a6 04  
            LDA $02b4,x        ; $ee37: bd b4 02  
            SEC                ; $ee3a: 38        
            SBC #$02           ; $ee3b: e9 02     
            STA $04a1,y        ; $ee3d: 99 a1 04  
            RTS                ; $ee40: 60        

;-------------------------------------------------------------------------------
__ee41:     LDA #$01           ; $ee41: a9 01     
            STA $04a6,y        ; $ee43: 99 a6 04  
            LDA $02b4,x        ; $ee46: bd b4 02  
            STA $04a1,y        ; $ee49: 99 a1 04  
            RTS                ; $ee4c: 60        

;-------------------------------------------------------------------------------
__ee4d:     STA $10            ; $ee4d: 85 10     
            LDY #$06           ; $ee4f: a0 06     
            LDA ($1e),y        ; $ee51: b1 1e     
            bmi __ee66         ; $ee53: 30 11     
            LDY #$00           ; $ee55: a0 00     
            LDA ($1e),y        ; $ee57: b1 1e     
            CLC                ; $ee59: 18        
            ADC $10            ; $ee5a: 65 10     
            STA ($1e),y        ; $ee5c: 91 1e     
            INY                ; $ee5e: c8        
            LDA ($1e),y        ; $ee5f: b1 1e     
            ADC #$00           ; $ee61: 69 00     
            STA ($1e),y        ; $ee63: 91 1e     
            RTS                ; $ee65: 60        

;-------------------------------------------------------------------------------
__ee66:     LDY #$00           ; $ee66: a0 00     
            LDA ($1e),y        ; $ee68: b1 1e     
            SEC                ; $ee6a: 38        
            SBC $10            ; $ee6b: e5 10     
            STA ($1e),y        ; $ee6d: 91 1e     
            INY                ; $ee6f: c8        
            LDA ($1e),y        ; $ee70: b1 1e     
            SBC #$00           ; $ee72: e9 00     
            STA ($1e),y        ; $ee74: 91 1e     
            RTS                ; $ee76: 60        

;-------------------------------------------------------------------------------
__ee77:     LDX #$20           ; $ee77: a2 20     
__ee79:     LDA $0404,x        ; $ee79: bd 04 04  
            BEQ __eebf         ; $ee7c: f0 41     
            LDA $040f,x        ; $ee7e: bd 0f 04  
            SEC                ; $ee81: 38        
            SBC #$16           ; $ee82: e9 16     
            CMP #$06           ; $ee84: c9 06     
            BCC __eebf         ; $ee86: 90 37     
            LDA $0403,x        ; $ee88: bd 03 04  
            LDY #$03           ; $ee8b: a0 03     
            SEC                ; $ee8d: 38        
            SBC ($1e),y        ; $ee8e: f1 1e     
            CLC                ; $ee90: 18        
            ADC #$01           ; $ee91: 69 01     
            CMP #$04           ; $ee93: c9 04     
            BCS __eebf         ; $ee95: b0 28     
            LDA $0401,x        ; $ee97: bd 01 04  
            LDY #$01           ; $ee9a: a0 01     
            SEC                ; $ee9c: 38        
            SBC ($1e),y        ; $ee9d: f1 1e     
            PHA                ; $ee9f: 48        
            LDY #$06           ; $eea0: a0 06     
            LDA ($1e),y        ; $eea2: b1 1e     
            BPL __eeab         ; $eea4: 10 05     
            PLA                ; $eea6: 68        
            CLC                ; $eea7: 18        
            ADC #$01           ; $eea8: 69 01     
            PHA                ; $eeaa: 48        
__eeab:     PLA                ; $eeab: 68        
            CMP #$02           ; $eeac: c9 02     
            BCS __eebf         ; $eeae: b0 0f     
            LDA $1e            ; $eeb0: a5 1e     
            STA $040b,x        ; $eeb2: 9d 0b 04  
            LDA #$00           ; $eeb5: a9 00     
            STA $0407,x        ; $eeb7: 9d 07 04  
            LDA #$16           ; $eeba: a9 16     
            STA $040f,x        ; $eebc: 9d 0f 04  
__eebf:     TXA                ; $eebf: 8a        
            CLC                ; $eec0: 18        
            ADC #$10           ; $eec1: 69 10     
            TAX                ; $eec3: aa        
            CPX #$90           ; $eec4: e0 90     
            BNE __ee79         ; $eec6: d0 b1     
            RTS                ; $eec8: 60        

;-------------------------------------------------------------------------------
__eec9:     LDX #$20           ; $eec9: a2 20     
__eecb:     LDA $040b,x        ; $eecb: bd 0b 04  
            CMP $1e            ; $eece: c5 1e     
            BNE __eee1         ; $eed0: d0 0f     
            LDA $040f,x        ; $eed2: bd 0f 04  
            CMP #$16           ; $eed5: c9 16     
            BNE __eee1         ; $eed7: d0 08     
            LDA $63            ; $eed9: a5 63     
            CLC                ; $eedb: 18        
            ADC #$08           ; $eedc: 69 08     
            JSR __eeeb         ; $eede: 20 eb ee  
__eee1:     TXA                ; $eee1: 8a        
            CLC                ; $eee2: 18        
            ADC #$10           ; $eee3: 69 10     
            TAX                ; $eee5: aa        
            CPX #$90           ; $eee6: e0 90     
            BNE __eecb         ; $eee8: d0 e1     
            RTS                ; $eeea: 60        

;-------------------------------------------------------------------------------
__eeeb:     STA $10            ; $eeeb: 85 10     
            LDY #$06           ; $eeed: a0 06     
            LDA ($1e),y        ; $eeef: b1 1e     
            bmi __ef05         ; $eef1: 30 12     
            LDA $0400,x        ; $eef3: bd 00 04  
            CLC                ; $eef6: 18        
            ADC $10            ; $eef7: 65 10     
            STA $0400,x        ; $eef9: 9d 00 04  
            LDA $0401,x        ; $eefc: bd 01 04  
            ADC #$00           ; $eeff: 69 00     
            STA $0401,x        ; $ef01: 9d 01 04  
            RTS                ; $ef04: 60        

;-------------------------------------------------------------------------------
__ef05:     LDA $0400,x        ; $ef05: bd 00 04  
            SEC                ; $ef08: 38        
            SBC $10            ; $ef09: e5 10     
            STA $0400,x        ; $ef0b: 9d 00 04  
            LDA $0401,x        ; $ef0e: bd 01 04  
            SBC #$00           ; $ef11: e9 00     
            STA $0401,x        ; $ef13: 9d 01 04  
            RTS                ; $ef16: 60        

;-------------------------------------------------------------------------------
__ef17:     LDA $7a            ; $ef17: a5 7a     
            SEC                ; $ef19: 38        
            SBC #$07           ; $ef1a: e9 07     
            CMP #$03           ; $ef1c: c9 03     
            LDA #$00           ; $ef1e: a9 00     
            BCS __ef2e         ; $ef20: b0 0c     
            LDX #$00           ; $ef22: a2 00     
__ef24:     LDA __ef2f,x       ; $ef24: bd 2f ef  
            STA $a0,x          ; $ef27: 95 a0     
            INX                ; $ef29: e8        
            CPX #$10           ; $ef2a: e0 10     
            BNE __ef24         ; $ef2c: d0 f6     
__ef2e:     RTS                ; $ef2e: 60        

;-------------------------------------------------------------------------------
__ef2f:     .hex 00 03 00 06   ; $ef2f: 00 03 00 06   Data
            .hex 0a 01 00 00   ; $ef33: 0a 01 00 00   Data
            .hex 00 37 00 06   ; $ef37: 00 37 00 06   Data
            .hex 0a 01 00 00   ; $ef3b: 0a 01 00 00   Data

;-------------------------------------------------------------------------------
__ef3f:     LDA #$a0           ; $ef3f: a9 a0     
            STA $1e            ; $ef41: 85 1e     
            LDA #$00           ; $ef43: a9 00     
            STA $1f            ; $ef45: 85 1f     
            JSR __ef4e         ; $ef47: 20 4e ef  
            LDA #$a8           ; $ef4a: a9 a8     
            STA $1e            ; $ef4c: 85 1e     
__ef4e:     LDY #$05           ; $ef4e: a0 05     
            LDA ($1e),y        ; $ef50: b1 1e     
            BEQ __ef2e         ; $ef52: f0 da     
            CMP #$02           ; $ef54: c9 02     
            BCC __ef78         ; $ef56: 90 20     
            JSR __ef9b         ; $ef58: 20 9b ef  
            LDY #$02           ; $ef5b: a0 02     
            LDA ($1e),y        ; $ef5d: b1 1e     
            CLC                ; $ef5f: 18        
            ADC #$80           ; $ef60: 69 80     
            STA ($1e),y        ; $ef62: 91 1e     
            INY                ; $ef64: c8        
            LDA ($1e),y        ; $ef65: b1 1e     
            ADC #$00           ; $ef67: 69 00     
            STA ($1e),y        ; $ef69: 91 1e     
            CMP #$1c           ; $ef6b: c9 1c     
            BCC __ef75         ; $ef6d: 90 06     
            LDA #$00           ; $ef6f: a9 00     
            LDY #$05           ; $ef71: a0 05     
            STA ($1e),y        ; $ef73: 91 1e     
__ef75:     JMP __c305         ; $ef75: 4c 05 c3  

;-------------------------------------------------------------------------------
__ef78:     LDY #$03           ; $ef78: a0 03     
            LDA ($1e),y        ; $ef7a: b1 1e     
            CMP $0403          ; $ef7c: cd 03 04  
            BNE __ef98         ; $ef7f: d0 17     
            LDY #$01           ; $ef81: a0 01     
            LDA ($1e),y        ; $ef83: b1 1e     
            SEC                ; $ef85: 38        
            SBC $0401          ; $ef86: ed 01 04  
            CMP #$02           ; $ef89: c9 02     
            BCS __ef98         ; $ef8b: b0 0b     
            LDA $42            ; $ef8d: a5 42     
            STA $0607          ; $ef8f: 8d 07 06  
            LDA #$02           ; $ef92: a9 02     
            LDY #$05           ; $ef94: a0 05     
            STA ($1e),y        ; $ef96: 91 1e     
__ef98:     JMP __c305         ; $ef98: 4c 05 c3  

;-------------------------------------------------------------------------------
__ef9b:     LDX #$20           ; $ef9b: a2 20     
__ef9d:     LDA $040f,x        ; $ef9d: bd 0f 04  
            CMP #$16           ; $efa0: c9 16     
            BCS __eff7         ; $efa2: b0 53     
            LDY #$00           ; $efa4: a0 00     
            LDA ($1e),y        ; $efa6: b1 1e     
            SEC                ; $efa8: 38        
            SBC $0400,x        ; $efa9: fd 00 04  
            INY                ; $efac: c8        
            LDA ($1e),y        ; $efad: b1 1e     
            SBC $0401,x        ; $efaf: fd 01 04  
            CLC                ; $efb2: 18        
            ADC #$01           ; $efb3: 69 01     
            CMP #$02           ; $efb5: c9 02     
            BCS __eff7         ; $efb7: b0 3e     
            INY                ; $efb9: c8        
            LDA ($1e),y        ; $efba: b1 1e     
            SEC                ; $efbc: 38        
            SBC $0402,x        ; $efbd: fd 02 04  
            INY                ; $efc0: c8        
            LDA ($1e),y        ; $efc1: b1 1e     
            SBC $0403,x        ; $efc3: fd 03 04  
            CLC                ; $efc6: 18        
            ADC #$01           ; $efc7: 69 01     
            CMP #$02           ; $efc9: c9 02     
            BCS __eff7         ; $efcb: b0 2a     
            LDA $65            ; $efcd: a5 65     
            STA $0407,x        ; $efcf: 9d 07 04  
            LDA #$26           ; $efd2: a9 26     
            STA $040f,x        ; $efd4: 9d 0f 04  
            LDA #$22           ; $efd7: a9 22     
            STA $0404,x        ; $efd9: 9d 04 04  
            LDA $0403,x        ; $efdc: bd 03 04  
            CMP #$19           ; $efdf: c9 19     
            BCC __efe8         ; $efe1: 90 05     
            LDA #$19           ; $efe3: a9 19     
            STA $0403,x        ; $efe5: 9d 03 04  
__efe8:     STX $1b            ; $efe8: 86 1b     
            LDY #$08           ; $efea: a0 08     
            CPX #$20           ; $efec: e0 20     
            BNE __eff2         ; $efee: d0 02     
            LDY #$44           ; $eff0: a0 44     
__eff2:     JSR __d4ca         ; $eff2: 20 ca d4  
            LDX $1b            ; $eff5: a6 1b     
__eff7:     TXA                ; $eff7: 8a        
            CLC                ; $eff8: 18        
            ADC #$10           ; $eff9: 69 10     
            TAX                ; $effb: aa        
            CPX #$90           ; $effc: e0 90     
            BNE __ef9d         ; $effe: d0 9d     
            RTS                ; $f000: 60        

;-------------------------------------------------------------------------------
__f001:     LDA $7a            ; $f001: a5 7a     
            ASL                ; $f003: 0a        
            SBC #$15           ; $f004: e9 15     
            CMP #$06           ; $f006: c9 06     
            BCS __f040         ; $f008: b0 36     
            ASL                ; $f00a: 0a        
            TAX                ; $f00b: aa        
            LDY #$00           ; $f00c: a0 00     
            JSR __f013         ; $f00e: 20 13 f0  
            LDY #$08           ; $f011: a0 08     
__f013:     LDA #$02           ; $f013: a9 02     
            STA $0090,y        ; $f015: 99 90 00  
            LDA __f041,x       ; $f018: bd 41 f0  
            INX                ; $f01b: e8        
            STA $0092,y        ; $f01c: 99 92 00  
            STA $10            ; $f01f: 85 10     
            LDA __f041,x       ; $f021: bd 41 f0  
            INX                ; $f024: e8        
            STX $1b            ; $f025: 86 1b     
            STA $0093,y        ; $f027: 99 93 00  
            STA $11            ; $f02a: 85 11     
            JSR __e3bd         ; $f02c: 20 bd e3  
            LDA $10            ; $f02f: a5 10     
            STA $0094,y        ; $f031: 99 94 00  
            LDA $11            ; $f034: a5 11     
            STA $0095,y        ; $f036: 99 95 00  
            LDX #$00           ; $f039: a2 00     
            JSR __f06d         ; $f03b: 20 6d f0  
            LDX $1b            ; $f03e: a6 1b     
__f040:     RTS                ; $f040: 60        

;-------------------------------------------------------------------------------
__f041:     .hex 09 22 88 25   ; $f041: 09 22 88 25   Data
            .hex 93 22 11 26   ; $f045: 93 22 11 26   Data
            .hex 09 22 07 26   ; $f049: 09 22 07 26   Data

;-------------------------------------------------------------------------------
__f04d:     LDY #$00           ; $f04d: a0 00     
            JSR __f054         ; $f04f: 20 54 f0  
            LDY #$08           ; $f052: a0 08     
__f054:     LDA $0090,y        ; $f054: b9 90 00  
            BEQ __f040         ; $f057: f0 e7     
            CMP #$02           ; $f059: c9 02     
            BCC __f09c         ; $f05b: 90 3f     
            BNE __f088         ; $f05d: d0 29     
            LDA $21            ; $f05f: a5 21     
            AND #$03           ; $f061: 29 03     
            CMP #$02           ; $f063: c9 02     
            BNE __f040         ; $f065: d0 d9     
            LDA $21            ; $f067: a5 21     
            AND #$04           ; $f069: 29 04     
            LSR                ; $f06b: 4a        
            TAX                ; $f06c: aa        
__f06d:     LDA $0092,y        ; $f06d: b9 92 00  
            STA $10            ; $f070: 85 10     
            LDA $0093,y        ; $f072: b9 93 00  
            STA $11            ; $f075: 85 11     
            LDA #$80           ; $f077: a9 80     
            STA $14            ; $f079: 85 14     
            LDA __f128,x       ; $f07b: bd 28 f1  
            STA $12            ; $f07e: 85 12     
            LDA __f129,x       ; $f080: bd 29 f1  
            STA $13            ; $f083: 85 13     
            JMP __c6fb         ; $f085: 4c fb c6  

;-------------------------------------------------------------------------------
__f088:     JSR __f0ce         ; $f088: 20 ce f0  
            BEQ __f040         ; $f08b: f0 b3     
            LDA #$01           ; $f08d: a9 01     
            STA $0090,y        ; $f08f: 99 90 00  
            LDA #$78           ; $f092: a9 78     
            STA $0096,y        ; $f094: 99 96 00  
            LDX #$00           ; $f097: a2 00     
            JMP __f06d         ; $f099: 4c 6d f0  

;-------------------------------------------------------------------------------
__f09c:     LDA $0096,y        ; $f09c: b9 96 00  
            SEC                ; $f09f: 38        
            SBC #$01           ; $f0a0: e9 01     
            STA $0096,y        ; $f0a2: 99 96 00  
            BNE __f040         ; $f0a5: d0 99     
            LDA #$00           ; $f0a7: a9 00     
            STA $0090,y        ; $f0a9: 99 90 00  
            LDX #$04           ; $f0ac: a2 04     
            JMP __f06d         ; $f0ae: 4c 6d f0  

;-------------------------------------------------------------------------------
__f0b1:     LDY #$00           ; $f0b1: a0 00     
            JSR __f0b8         ; $f0b3: 20 b8 f0  
            LDY #$08           ; $f0b6: a0 08     
__f0b8:     LDA $0090,y        ; $f0b8: b9 90 00  
            CMP #$02           ; $f0bb: c9 02     
            BNE __f0e6         ; $f0bd: d0 27     
            JSR __f0ce         ; $f0bf: 20 ce f0  
            BNE __f0e6         ; $f0c2: d0 22     
            LDA #$03           ; $f0c4: a9 03     
            STA $0090,y        ; $f0c6: 99 90 00  
            LDX #$02           ; $f0c9: a2 02     
            JMP __f06d         ; $f0cb: 4c 6d f0  

;-------------------------------------------------------------------------------
__f0ce:     LDA $0094,y        ; $f0ce: b9 94 00  
            SEC                ; $f0d1: 38        
            SBC $0401          ; $f0d2: ed 01 04  
            CMP #$02           ; $f0d5: c9 02     
            BCS __f0e4         ; $f0d7: b0 0b     
            LDA $0095,y        ; $f0d9: b9 95 00  
            SEC                ; $f0dc: 38        
            SBC $0403          ; $f0dd: ed 03 04  
            CMP #$02           ; $f0e0: c9 02     
            BEQ __f0e6         ; $f0e2: f0 02     
__f0e4:     LDA #$ff           ; $f0e4: a9 ff     
__f0e6:     RTS                ; $f0e6: 60        

;-------------------------------------------------------------------------------
__f0e7:     LDX #$00           ; $f0e7: a2 00     
            JSR __f0f0         ; $f0e9: 20 f0 f0  
            BEQ __f127         ; $f0ec: f0 39     
            LDX #$08           ; $f0ee: a2 08     
__f0f0:     LDA $90,x          ; $f0f0: b5 90     
            CMP #$01           ; $f0f2: c9 01     
            BNE __f127         ; $f0f4: d0 31     
            LDA $95,x          ; $f0f6: b5 95     
            SEC                ; $f0f8: 38        
            LDY #$03           ; $f0f9: a0 03     
            SBC ($1e),y        ; $f0fb: f1 1e     
            CMP #$02           ; $f0fd: c9 02     
            BNE __f0e4         ; $f0ff: d0 e3     
            LDA $94,x          ; $f101: b5 94     
            SEC                ; $f103: 38        
            LDY #$01           ; $f104: a0 01     
            SBC ($1e),y        ; $f106: f1 1e     
            BEQ __f118         ; $f108: f0 0e     
            CMP #$01           ; $f10a: c9 01     
            BNE __f127         ; $f10c: d0 19     
            LDY #$00           ; $f10e: a0 00     
            LDA ($1e),y        ; $f110: b1 1e     
            CMP #$c0           ; $f112: c9 c0     
            BCC __f0e4         ; $f114: 90 ce     
            BCS __f120         ; $f116: b0 08     
__f118:     LDY #$00           ; $f118: a0 00     
            LDA ($1e),y        ; $f11a: b1 1e     
            CMP #$40           ; $f11c: c9 40     
            BCS __f0e4         ; $f11e: b0 c4     
__f120:     LDA #$01           ; $f120: a9 01     
            STA $0607          ; $f122: 8d 07 06  
            LDA #$00           ; $f125: a9 00     
__f127:     RTS                ; $f127: 60        

;-------------------------------------------------------------------------------
__f128:     .hex 2e            ; $f128: 2e            Data
__f129:     .hex f1 32 f1 36   ; $f129: f1 32 f1 36   Data
            .hex f1 02 51 51   ; $f12d: f1 02 51 51   Data
            .hex 00 02 50 50   ; $f131: 00 02 50 50   Data
            .hex 00 02 4a 4a   ; $f135: 00 02 4a 4a   Data
            .hex 00            ; $f139: 00            Data
__f13a:     LDY $7c            ; $f13a: a4 7c     
            LDA __f27f,y       ; $f13c: b9 7f f2  
            STA $1c            ; $f13f: 85 1c     
            LDA __f280,y       ; $f141: b9 80 f2  
            STA $1d            ; $f144: 85 1d     
            LDY #$00           ; $f146: a0 00     
            LDA ($1c),y        ; $f148: b1 1c     
            INY                ; $f14a: c8        
            STA $53            ; $f14b: 85 53     
            LSR                ; $f14d: 4a        
            LSR                ; $f14e: 4a        
            LSR                ; $f14f: 4a        
            STA $52            ; $f150: 85 52     
            LDA #$00           ; $f152: a9 00     
            STA $50            ; $f154: 85 50     
            STA $51            ; $f156: 85 51     
            LDX #$00           ; $f158: a2 00     
__f15a:     STA $54,x          ; $f15a: 95 54     
            INX                ; $f15c: e8        
            CPX #$0c           ; $f15d: e0 0c     
            BNE __f15a         ; $f15f: d0 f9     
            LDX #$00           ; $f161: a2 00     
__f163:     LDA #$02           ; $f163: a9 02     
            STA $0260,x        ; $f165: 9d 60 02  
            LDA ($1c),y        ; $f168: b1 1c     
            INY                ; $f16a: c8        
            STA $10            ; $f16b: 85 10     
            STA $0266,x        ; $f16d: 9d 66 02  
            LDA ($1c),y        ; $f170: b1 1c     
            INY                ; $f172: c8        
            STA $11            ; $f173: 85 11     
            STA $0267,x        ; $f175: 9d 67 02  
            JSR __e3bd         ; $f178: 20 bd e3  
            LDA $10            ; $f17b: a5 10     
            STA $0264,x        ; $f17d: 9d 64 02  
            LDA $11            ; $f180: a5 11     
            STA $0265,x        ; $f182: 9d 65 02  
            TXA                ; $f185: 8a        
            CLC                ; $f186: 18        
            ADC #$08           ; $f187: 69 08     
            TAX                ; $f189: aa        
            CPX $53            ; $f18a: e4 53     
            BNE __f163         ; $f18c: d0 d5     
            RTS                ; $f18e: 60        

;-------------------------------------------------------------------------------
__f18f:     LDA $53            ; $f18f: a5 53     
            BEQ __f1a4         ; $f191: f0 11     
            LDX #$00           ; $f193: a2 00     
__f195:     STX $1b            ; $f195: 86 1b     
            JSR __f1a5         ; $f197: 20 a5 f1  
            LDA $1b            ; $f19a: a5 1b     
            CLC                ; $f19c: 18        
            ADC #$08           ; $f19d: 69 08     
            TAX                ; $f19f: aa        
            CPX $53            ; $f1a0: e4 53     
            BNE __f195         ; $f1a2: d0 f1     
__f1a4:     RTS                ; $f1a4: 60        

;-------------------------------------------------------------------------------
__f1a5:     LDY $0260,x        ; $f1a5: bc 60 02  
            LDA __f1b5,y       ; $f1a8: b9 b5 f1  
            STA $1c            ; $f1ab: 85 1c     
            LDA __f1b6,y       ; $f1ad: b9 b6 f1  
            STA $1d            ; $f1b0: 85 1d     
            JMP ($001c)        ; $f1b2: 6c 1c 00  

;-------------------------------------------------------------------------------
__f1b5:     .hex 4f            ; $f1b5: 4f            Data
__f1b6:     .hex c1 b9 f1 20   ; $f1b6: c1 b9 f1 20   Data
            .hex 33 f2 20 15   ; $f1ba: 33 f2 20 15   Data
            .hex f2 a6 1b bd   ; $f1be: f2 a6 1b bd   Data
            .hex 60 02 c9 02   ; $f1c2: 60 02 c9 02   Data
            .hex d0 4c bd 65   ; $f1c6: d0 4c bd 65   Data
            .hex 02 cd 03 04   ; $f1ca: 02 cd 03 04   Data
            .hex d0 44 bd 64   ; $f1ce: d0 44 bd 64   Data
            .hex 02 38 ed 01   ; $f1d2: 02 38 ed 01   Data
            .hex 04 c9 02 b0   ; $f1d6: 04 c9 02 b0   Data
            .hex 39 ad 0f 04   ; $f1da: 39 ad 0f 04   Data
            .hex c9 08 d0 0f   ; $f1de: c9 08 d0 0f   Data
            .hex a9 00 8d 08   ; $f1e2: a9 00 8d 08   Data
            .hex 04 a9 02 8d   ; $f1e6: 04 a9 02 8d   Data
            .hex 0f 04 a9 06   ; $f1ea: 0f 04 a9 06   Data
            .hex 8d 04 04      ; $f1ee: 8d 04 04      Data
__f1f1:     LDA #$01           ; $f1f1: a9 01     
            STA $0608          ; $f1f3: 8d 08 06  
            LDA #$00           ; $f1f6: a9 00     
            STA $0260,x        ; $f1f8: 9d 60 02  
            DEC $52            ; $f1fb: c6 52     
            LDY #$06           ; $f1fd: a0 06     
            JSR __d4e5         ; $f1ff: 20 e5 d4  
            LDY #$08           ; $f202: a0 08     
            JSR __d4e5         ; $f204: 20 e5 d4  
            LDA __f277         ; $f207: ad 77 f2  
            STA $12            ; $f20a: 85 12     
            LDA __f278         ; $f20c: ad 78 f2  
            STA $13            ; $f20f: 85 13     
            JMP __f250         ; $f211: 4c 50 f2  

;-------------------------------------------------------------------------------
__f214:     RTS                ; $f214: 60        

;-------------------------------------------------------------------------------
            LDA $0265,x        ; $f215: bd 65 02  
            CMP $0423          ; $f218: cd 23 04  
            BNE __f214         ; $f21b: d0 f7     
            LDA $0264,x        ; $f21d: bd 64 02  
            SEC                ; $f220: 38        
            SBC $0421          ; $f221: ed 21 04  
            CMP #$02           ; $f224: c9 02     
            BCS __f214         ; $f226: b0 ec     
            LDA #$00           ; $f228: a9 00     
            STA $042f          ; $f22a: 8d 2f 04  
            STA $0424          ; $f22d: 8d 24 04  
            JMP __f1f1         ; $f230: 4c f1 f1  

;-------------------------------------------------------------------------------
            LDA $1b            ; $f233: a5 1b     
            LSR                ; $f235: 4a        
            LSR                ; $f236: 4a        
            LSR                ; $f237: 4a        
            EOR $21            ; $f238: 45 21     
            AND #$0f           ; $f23a: 29 0f     
            BNE __f214         ; $f23c: d0 d6     
            LDA $21            ; $f23e: a5 21     
            AND #$10           ; $f240: 29 10     
            LSR                ; $f242: 4a        
            LSR                ; $f243: 4a        
            LSR                ; $f244: 4a        
            TAY                ; $f245: a8        
            LDA __f263,y       ; $f246: b9 63 f2  
            STA $12            ; $f249: 85 12     
            LDA __f264,y       ; $f24b: b9 64 f2  
            STA $13            ; $f24e: 85 13     
__f250:     LDX $1b            ; $f250: a6 1b     
            LDA $0266,x        ; $f252: bd 66 02  
            STA $10            ; $f255: 85 10     
            LDA $0267,x        ; $f257: bd 67 02  
            STA $11            ; $f25a: 85 11     
            LDA #$00           ; $f25c: a9 00     
            STA $14            ; $f25e: 85 14     
            JMP __c6fb         ; $f260: 4c fb c6  

;-------------------------------------------------------------------------------
__f263:     .hex 67            ; $f263: 67            Data
__f264:     .hex f2 6f f2 02   ; $f264: f2 6f f2 02   Data
            .hex 28 29 1e 02   ; $f268: 28 29 1e 02   Data
            .hex 2a 2b 00 02   ; $f26c: 2a 2b 00 02   Data
            .hex 2c 2d 1e 02   ; $f270: 2c 2d 1e 02   Data
            .hex 2e 2f 00      ; $f274: 2e 2f 00      Data
__f277:     .hex 79            ; $f277: 79            Data
__f278:     .hex f2 02 00 00   ; $f278: f2 02 00 00   Data
            .hex 1e 02 00      ; $f27c: 1e 02 00      Data
__f27f:     .hex 00            ; $f27f: 00            Data
__f280:     .hex 00 89 f2 a8   ; $f280: 00 89 f2 a8   Data
            .hex f2 c7 f2 c7   ; $f284: f2 c7 f2 c7   Data
            .hex f2 78 d5 24   ; $f288: f2 78 d5 24   Data
            .hex 55 26 0f 25   ; $f28c: 55 26 0f 25   Data
            .hex 0c 26 e9 24   ; $f290: 0c 26 e9 24   Data
            .hex 03 25 c3 26   ; $f294: 03 25 c3 26   Data
            .hex fd 20 9a 22   ; $f298: fd 20 9a 22   Data
            .hex f7 20 94 21   ; $f29c: f7 20 94 21   Data
            .hex f1 20 eb 20   ; $f2a0: f1 20 eb 20   Data
            .hex 06 21 c5 20   ; $f2a4: 06 21 c5 20   Data
            .hex 78 d5 24 55   ; $f2a8: 78 d5 24 55   Data
            .hex 26 ef 24 0c   ; $f2ac: 26 ef 24 0c   Data
            .hex 26 49 25 c3   ; $f2b0: 26 49 25 c3   Data
            .hex 24 c3 26 9d   ; $f2b4: 24 c3 26 9d   Data
            .hex 21 9a 22 17   ; $f2b8: 21 9a 22 17   Data
            .hex 21 d1 20 d1   ; $f2bc: 21 d1 20 d1   Data
            .hex 22 0b 22 eb   ; $f2c0: 22 0b 22 eb   Data
            .hex 20 c5 20 78   ; $f2c4: 20 c5 20 78   Data
            .hex d5 24 55 26   ; $f2c8: d5 24 55 26   Data
            .hex cf 24 29 25   ; $f2cc: cf 24 29 25   Data
            .hex c3 24 c3 26   ; $f2d0: c3 24 c3 26   Data
            .hex 80 25 3d 21   ; $f2d4: 80 25 3d 21   Data
            .hex 9a 22 f7 20   ; $f2d8: 9a 22 f7 20   Data
            .hex 11 21 d1 22   ; $f2dc: 11 21 d1 22   Data
            .hex 0b 22 eb 20   ; $f2e0: 0b 22 eb 20   Data
            .hex e5 20         ; $f2e4: e5 20         Data

;-------------------------------------------------------------------------------
__f2e6:     LDA $60            ; $f2e6: a5 60     
            BEQ __f2fe         ; $f2e8: f0 14     
            CMP #$02           ; $f2ea: c9 02     
            BCC __f32f         ; $f2ec: 90 41     
            BEQ __f35b         ; $f2ee: f0 6b     
            LDA $61            ; $f2f0: a5 61     
            CMP #$3c           ; $f2f2: c9 3c     
            BEQ __f2fd         ; $f2f4: f0 07     
            INC $61            ; $f2f6: e6 61     
            LDA $42            ; $f2f8: a5 42     
            STA $0605          ; $f2fa: 8d 05 06  
__f2fd:     RTS                ; $f2fd: 60        

;-------------------------------------------------------------------------------
__f2fe:     INC $61            ; $f2fe: e6 61     
            LDA $61            ; $f300: a5 61     
            CMP #$3c           ; $f302: c9 3c     
            BNE __f2fd         ; $f304: d0 f7     
            LDA #$00           ; $f306: a9 00     
            STA $61            ; $f308: 85 61     
            INC $62            ; $f30a: e6 62     
            LDA $62            ; $f30c: a5 62     
            CMP $66            ; $f30e: c5 66     
            BNE __f2fd         ; $f310: d0 eb     
            LDA #$01           ; $f312: a9 01     
            STA $60            ; $f314: 85 60     
            LDX #$00           ; $f316: a2 00     
__f318:     LDA __f3aa,x       ; $f318: bd aa f3  
            STA $0490,x        ; $f31b: 9d 90 04  
            INX                ; $f31e: e8        
            CPX #$08           ; $f31f: e0 08     
            BNE __f318         ; $f321: d0 f5     
__f323:     JSR __f4bf         ; $f323: 20 bf f4  
            LDA #$03           ; $f326: a9 03     
            STA $06f5          ; $f328: 8d f5 06  
            STA $06f6          ; $f32b: 8d f6 06  
            RTS                ; $f32e: 60        

;-------------------------------------------------------------------------------
__f32f:     JSR __f383         ; $f32f: 20 83 f3  
            JSR __f3b2         ; $f332: 20 b2 f3  
            LDA $42            ; $f335: a5 42     
            STA $0605          ; $f337: 8d 05 06  
            LDA $0491          ; $f33a: ad 91 04  
            BEQ __f2fd         ; $f33d: f0 be     
            LDA #$02           ; $f33f: a9 02     
            STA $60            ; $f341: 85 60     
            LDA #$00           ; $f343: a9 00     
            STA $61            ; $f345: 85 61     
            STA $62            ; $f347: 85 62     
            LDX $68            ; $f349: a6 68     
            LDA #$1a           ; $f34b: a9 1a     
            STA $040f,x        ; $f34d: 9d 0f 04  
            LDA #$01           ; $f350: a9 01     
            STA $0407,x        ; $f352: 9d 07 04  
            LDA #$03           ; $f355: a9 03     
            STA $0405,x        ; $f357: 9d 05 04  
            RTS                ; $f35a: 60        

;-------------------------------------------------------------------------------
__f35b:     INC $61            ; $f35b: e6 61     
            LDA $61            ; $f35d: a5 61     
            CMP #$3c           ; $f35f: c9 3c     
            BNE __f2fd         ; $f361: d0 9a     
            LDA #$00           ; $f363: a9 00     
            STA $61            ; $f365: 85 61     
            INC $62            ; $f367: e6 62     
            LDA $62            ; $f369: a5 62     
            CMP $67            ; $f36b: c5 67     
            BNE __f2fd         ; $f36d: d0 8e     
            LDA #$03           ; $f36f: a9 03     
            STA $60            ; $f371: 85 60     
            LDA #$1a           ; $f373: a9 1a     
            STA $041f          ; $f375: 8d 1f 04  
            LDA #$01           ; $f378: a9 01     
            STA $0417          ; $f37a: 8d 17 04  
            STA $0415          ; $f37d: 8d 15 04  
            JMP __f323         ; $f380: 4c 23 f3  

;-------------------------------------------------------------------------------
__f383:     LDX #$00           ; $f383: a2 00     
__f385:     LDA $0490,x        ; $f385: bd 90 04  
            STA $10,x          ; $f388: 95 10     
            INX                ; $f38a: e8        
            CPX #$08           ; $f38b: e0 08     
            BNE __f385         ; $f38d: d0 f6     
            LDA $21            ; $f38f: a5 21     
            AND #$03           ; $f391: 29 03     
            STA $13            ; $f393: 85 13     
__f395:     JSR __c415         ; $f395: 20 15 c4  
            LDA $10            ; $f398: a5 10     
            CLC                ; $f39a: 18        
            ADC #$08           ; $f39b: 69 08     
            STA $10            ; $f39d: 85 10     
            BCC __f3a3         ; $f39f: 90 02     
            INC $11            ; $f3a1: e6 11     
__f3a3:     INC $12            ; $f3a3: e6 12     
            DEC $17            ; $f3a5: c6 17     
            BNE __f395         ; $f3a7: d0 ec     
            RTS                ; $f3a9: 60        

;-------------------------------------------------------------------------------
__f3aa:     .hex f8 00 a0 00   ; $f3aa: f8 00 a0 00   Data
            .hex 00 00 68 04   ; $f3ae: 00 00 68 04   Data
__f3b2:     LDA $0490          ; $f3b2: ad 90 04  
            SEC                ; $f3b5: 38        
            SBC #$02           ; $f3b6: e9 02     
            STA $0490          ; $f3b8: 8d 90 04  
            BCS __f3c0         ; $f3bb: b0 03     
            .hex ce 91         ; $f3bd: ce 91     Suspected data
__f3bf:     .hex 04            ; $f3bf: 04            Data
__f3c0:     RTS                ; $f3c0: 60        

;-------------------------------------------------------------------------------
__f3c1:     LDA #$00           ; $f3c1: a9 00     
            STA $60            ; $f3c3: 85 60     
            STA $61            ; $f3c5: 85 61     
            STA $62            ; $f3c7: 85 62     
            LDA $7d            ; $f3c9: a5 7d     
            ASL                ; $f3cb: 0a        
            ADC $7d            ; $f3cc: 65 7d     
            ASL                ; $f3ce: 0a        
            TAX                ; $f3cf: aa        
            LDY #$00           ; $f3d0: a0 00     
__f3d2:     LDA __f3df,x       ; $f3d2: bd df f3  
            STA $0063,y        ; $f3d5: 99 63 00  
            INX                ; $f3d8: e8        
            INY                ; $f3d9: c8        
            CPY #$06           ; $f3da: c0 06     
            BNE __f3d2         ; $f3dc: d0 f4     
            RTS                ; $f3de: 60        

;-------------------------------------------------------------------------------
__f3df:     .hex 20 1c b4 50   ; $f3df: 20 1c b4 50   Data
            .hex 46 60 20 1e   ; $f3e3: 46 60 20 1e   Data
            .hex a0 3c 46 60   ; $f3e7: a0 3c 46 60   Data
            .hex 1e 1c b4 50   ; $f3eb: 1e 1c b4 50   Data
            .hex 46 60 22 23   ; $f3ef: 46 60 22 23   Data
            .hex a0 46 37 60   ; $f3f3: a0 46 37 60   Data
            .hex 22 24 a0 46   ; $f3f7: 22 24 a0 46   Data
            .hex 37 60 22 26   ; $f3fb: 37 60 22 26   Data
            .hex 96 3c 32 60   ; $f3ff: 96 3c 32 60   Data
            .hex 1e 1c b4 50   ; $f403: 1e 1c b4 50   Data
            .hex 46 60 24 26   ; $f407: 46 60 24 26   Data
            .hex 8c 28 32 70   ; $f40b: 8c 28 32 70   Data
            .hex 24 28 8c 28   ; $f40f: 24 28 8c 28   Data
            .hex 32 70 24 2a   ; $f413: 32 70 24 2a   Data
            .hex 78 1e 41 70   ; $f417: 78 1e 41 70   Data
            .hex 1e 1c b4 50   ; $f41b: 1e 1c b4 50   Data
            .hex 46 60 26 28   ; $f41f: 46 60 26 28   Data
            .hex 78 28 2d 70   ; $f423: 78 28 2d 70   Data
            .hex 26 2a 78 28   ; $f427: 26 2a 78 28   Data
            .hex 2d 70 26 2c   ; $f42b: 2d 70 26 2c   Data
            .hex 64 1e 32 70   ; $f42f: 64 1e 32 70   Data
            .hex 1e 1c b4 50   ; $f433: 1e 1c b4 50   Data
            .hex 46 60 28 2c   ; $f437: 46 60 28 2c   Data
            .hex 64 1e 2d 70   ; $f43b: 64 1e 2d 70   Data
            .hex 28 2e 64 1e   ; $f43f: 28 2e 64 1e   Data
            .hex 2d 70 28 30   ; $f443: 2d 70 28 30   Data
            .hex 5a 14 28 70   ; $f447: 5a 14 28 70   Data
            .hex 1e 1c b4 50   ; $f44b: 1e 1c b4 50   Data
            .hex 46 60 2a 2e   ; $f44f: 46 60 2a 2e   Data
            .hex 5a 1e 2d 80   ; $f453: 5a 1e 2d 80   Data
            .hex 2a 30 50 14   ; $f457: 2a 30 50 14   Data
            .hex 28 80 2a 34   ; $f45b: 28 80 2a 34   Data
            .hex 5a 1e 2d 80   ; $f45f: 5a 1e 2d 80   Data
            .hex 1e 1c b4 50   ; $f463: 1e 1c b4 50   Data
            .hex 46 60 2c 32   ; $f467: 46 60 2c 32   Data
            .hex 50 1e 28 80   ; $f46b: 50 1e 28 80   Data
            .hex 2c 32 3c 14   ; $f46f: 2c 32 3c 14   Data
            .hex 28 80 2c 34   ; $f473: 28 80 2c 34   Data
            .hex 50 1e 28 80   ; $f477: 50 1e 28 80   Data
            .hex 1e 1c b4 50   ; $f47b: 1e 1c b4 50   Data
            .hex 46 60 2c 32   ; $f47f: 46 60 2c 32   Data
            .hex 3c 14 28 80   ; $f483: 3c 14 28 80   Data
            .hex 2c 36 50 1e   ; $f487: 2c 36 50 1e   Data
            .hex 23 80 2c 38   ; $f48b: 23 80 2c 38   Data
            .hex 50 1e 28 80   ; $f48f: 50 1e 28 80   Data
            .hex 1e 1c b4 50   ; $f493: 1e 1c b4 50   Data
            .hex 46 60 2c 38   ; $f497: 46 60 2c 38   Data
            .hex 3c 14 28 80   ; $f49b: 3c 14 28 80   Data

;-------------------------------------------------------------------------------
__f49f:     ASL                ; $f49f: 0a        
            TAY                ; $f4a0: a8        
            INY                ; $f4a1: c8        
            PLA                ; $f4a2: 68        
            STA $f6            ; $f4a3: 85 f6     
            PLA                ; $f4a5: 68        
            STA $f7            ; $f4a6: 85 f7     
            LDA ($f6),y        ; $f4a8: b1 f6     
            TAX                ; $f4aa: aa        
            INY                ; $f4ab: c8        
            LDA ($f6),y        ; $f4ac: b1 f6     
            STA $f7            ; $f4ae: 85 f7     
            STX $f6            ; $f4b0: 86 f6     
            JMP ($00f6)        ; $f4b2: 6c f6 00  

;-------------------------------------------------------------------------------
__f4b5:     LDA #$0f           ; $f4b5: a9 0f     
            STA $4015          ; $f4b7: 8d 15 40  
            LDA #$c0           ; $f4ba: a9 c0     
            STA $4017          ; $f4bc: 8d 17 40  
__f4bf:     LDA #$19           ; $f4bf: a9 19     
            STA $f0            ; $f4c1: 85 f0     
            LDA #$06           ; $f4c3: a9 06     
            STA $f1            ; $f4c5: 85 f1     
            LDX #$00           ; $f4c7: a2 00     
            LDY #$00           ; $f4c9: a0 00     
__f4cb:     LDA #$00           ; $f4cb: a9 00     
            STA ($f0),y        ; $f4cd: 91 f0     
            STA $0600,x        ; $f4cf: 9d 00 06  
            CLC                ; $f4d2: 18        
            LDA $f0            ; $f4d3: a5 f0     
            ADC #$08           ; $f4d5: 69 08     
            STA $f0            ; $f4d7: 85 f0     
            BCC __f4dd         ; $f4d9: 90 02     
            INC $f1            ; $f4db: e6 f1     
__f4dd:     INX                ; $f4dd: e8        
            CPX #$19           ; $f4de: e0 19     
            BNE __f4cb         ; $f4e0: d0 e9     
            LDX #$19           ; $f4e2: a2 19     
            LDY #$00           ; $f4e4: a0 00     
__f4e6:     LDA __f89e,y       ; $f4e6: b9 9e f8  
            STA $06e2,y        ; $f4e9: 99 e2 06  
            INY                ; $f4ec: c8        
            DEX                ; $f4ed: ca        
            BNE __f4e6         ; $f4ee: d0 f6     
            RTS                ; $f4f0: 60        

;-------------------------------------------------------------------------------
__f4f1:     LDA $23            ; $f4f1: a5 23     
            BNE __f4fb         ; $f4f3: d0 06     
            LDA #$19           ; $f4f5: a9 19     
            STA $f5            ; $f4f7: 85 f5     
            BPL __f509         ; $f4f9: 10 0e     
__f4fb:     LDA #$01           ; $f4fb: a9 01     
            STA $f5            ; $f4fd: 85 f5     
            LDA #$10           ; $f4ff: a9 10     
            STA $4004          ; $f501: 8d 04 40  
            LDA #$00           ; $f504: a9 00     
            STA $4008          ; $f506: 8d 08 40  
__f509:     LDA #$00           ; $f509: a9 00     
            STA $fc            ; $f50b: 85 fc     
            STA $fd            ; $f50d: 85 fd     
            STA $fe            ; $f50f: 85 fe     
            STA $ff            ; $f511: 85 ff     (the heck is it doing here?)
            LDA $f5            ; $f513: a5 f5     
            STA $f4            ; $f515: 85 f4     
            LDA #$19           ; $f517: a9 19     
            STA $f0            ; $f519: 85 f0     
            LDA #$06           ; $f51b: a9 06     
            STA $f1            ; $f51d: 85 f1     
__f51f:     LDY #$00           ; $f51f: a0 00     
            LDA ($f0),y        ; $f521: b1 f0     
            BEQ __f55a         ; $f523: f0 35     
            CMP #$05           ; $f525: c9 05     
            BCC __f534         ; $f527: 90 0b     
            SEC                ; $f529: 38        
            SBC #$05           ; $f52a: e9 05     
            TAX                ; $f52c: aa        
            LDA #$01           ; $f52d: a9 01     
            STA $fc,x          ; $f52f: 95 fc     
            JMP __f55a         ; $f531: 4c 5a f5  

;-------------------------------------------------------------------------------
__f534:     TAX                ; $f534: aa        
            DEX                ; $f535: ca        
            LDA $fc,x          ; $f536: b5 fc     
            BNE __f55a         ; $f538: d0 20     
            LDA #$01           ; $f53a: a9 01     
            STA $fc,x          ; $f53c: 95 fc     
            TXA                ; $f53e: 8a        
            TAY                ; $f53f: a8        
            CLC                ; $f540: 18        
            ADC #$05           ; $f541: 69 05     
            LDY #$00           ; $f543: a0 00     
            STA ($f0),y        ; $f545: 91 f0     
            TXA                ; $f547: 8a        
            ASL                ; $f548: 0a        
            ASL                ; $f549: 0a        
            TAX                ; $f54a: aa        
            LDA #$04           ; $f54b: a9 04     
            STA $f6            ; $f54d: 85 f6     
__f54f:     INY                ; $f54f: c8        
            LDA ($f0),y        ; $f550: b1 f0     
            STA $4000,x        ; $f552: 9d 00 40  This is actually writing to $4005 as well for the sweep contROL.
            INX                ; $f555: e8        
            DEC $f6            ; $f556: c6 f6     
            BNE __f54f         ; $f558: d0 f5     
__f55a:     CLC                ; $f55a: 18        
            LDA $f0            ; $f55b: a5 f0     
            ADC #$08           ; $f55d: 69 08     
            STA $f0            ; $f55f: 85 f0     
            BCC __f565         ; $f561: 90 02     
            INC $f1            ; $f563: e6 f1     
__f565:     DEC $f4            ; $f565: c6 f4     
            BNE __f51f         ; $f567: d0 b6     
            LDX #$00           ; $f569: a2 00     
__f56b:     STX $f6            ; $f56b: 86 f6     
            LDA $fc,x          ; $f56d: b5 fc     
            BNE __f57d         ; $f56f: d0 0c     
            TXA                ; $f571: 8a        
            ASL                ; $f572: 0a        
            ASL                ; $f573: 0a        
            TAX                ; $f574: aa        
            ASL                ; $f575: 0a        
            AND #$10           ; $f576: 29 10     
            EOR #$10           ; $f578: 49 10     
            STA $4000,x        ; $f57a: 9d 00 40  
__f57d:     LDX $f6            ; $f57d: a6 f6     
            INX                ; $f57f: e8        
            CPX #$04           ; $f580: e0 04     
            BCC __f56b         ; $f582: 90 e7     
            LDY #$00           ; $f584: a0 00     
            STY $f4            ; $f586: 84 f4     
            LDA #$19           ; $f588: a9 19     
            STA $f0            ; $f58a: 85 f0     
            LDA #$06           ; $f58c: a9 06     
            STA $f1            ; $f58e: 85 f1     
__f590:     LDX $f4            ; $f590: a6 f4     
            LDA __f885,x       ; $f592: bd 85 f8  
            BEQ __f5a4         ; $f595: f0 0d     
            LDA $0600,x        ; $f597: bd 00 06  
            BNE __f5b1         ; $f59a: d0 15     
            LDY #$00           ; $f59c: a0 00     
            LDA ($f0),y        ; $f59e: b1 f0     
            BEQ __f5b8         ; $f5a0: f0 16     
            BNE __f5cc         ; $f5a2: d0 28     
__f5a4:     LDA $0600,x        ; $f5a4: bd 00 06  
            BEQ __f5b8         ; $f5a7: f0 0f     
            LDY #$00           ; $f5a9: a0 00     
            LDA ($f0),y        ; $f5ab: b1 f0     
            BNE __f5cc         ; $f5ad: d0 1d     
            BEQ __f5d9         ; $f5af: f0 28     
__f5b1:     LDA #$00           ; $f5b1: a9 00     
            STA $0600,x        ; $f5b3: 9d 00 06  
            BPL __f5d9         ; $f5b6: 10 21     
__f5b8:     CLC                ; $f5b8: 18        
            LDA $f0            ; $f5b9: a5 f0     
            ADC #$08           ; $f5bb: 69 08     
            STA $f0            ; $f5bd: 85 f0     
            BCC __f5c3         ; $f5bf: 90 02     
            INC $f1            ; $f5c1: e6 f1     
__f5c3:     INC $f4            ; $f5c3: e6 f4     
            LDA $f4            ; $f5c5: a5 f4     
            CMP $f5            ; $f5c7: c5 f5     
            BCC __f590         ; $f5c9: 90 c5     
            RTS                ; $f5cb: 60        

;-------------------------------------------------------------------------------
__f5cc:     LDY #$07           ; $f5cc: a0 07     
            LDA ($f0),y        ; $f5ce: b1 f0     
            SEC                ; $f5d0: 38        
            SBC #$01           ; $f5d1: e9 01     
            STA ($f0),y        ; $f5d3: 91 f0     
            BEQ __f633         ; $f5d5: f0 5c     
            BNE __f5b8         ; $f5d7: d0 df     
__f5d9:     LDA $f4            ; $f5d9: a5 f4     
            CMP #$13           ; $f5db: c9 13     
            BEQ __f5ef         ; $f5dd: f0 10     
            CMP #$14           ; $f5df: c9 14     
            BEQ __f5fc         ; $f5e1: f0 19     
            LDA #$00           ; $f5e3: a9 00     
            LDY #$05           ; $f5e5: a0 05     
            STA ($f0),y        ; $f5e7: 91 f0     
            JSR __f7f4         ; $f5e9: 20 f4 f7  
            JMP __f606         ; $f5ec: 4c 06 f6  

;-------------------------------------------------------------------------------
__f5ef:     LDA __f879         ; $f5ef: ad 79 f8  
            STA $f8            ; $f5f2: 85 f8     
            LDA __f87a         ; $f5f4: ad 7a f8  
            STA $f9            ; $f5f7: 85 f9     
            JMP __f606         ; $f5f9: 4c 06 f6  

;-------------------------------------------------------------------------------
__f5fc:     LDA __f87b         ; $f5fc: ad 7b f8  
            STA $fa            ; $f5ff: 85 fa     
            LDA __f87c         ; $f601: ad 7c f8  
            STA $fb            ; $f604: 85 fb     
__f606:     JSR __f80b         ; $f606: 20 0b f8  
            LDY #$00           ; $f609: a0 00     
            STA ($f0),y        ; $f60b: 91 f0     
            JSR __f80b         ; $f60d: 20 0b f8  
            LDY #$01           ; $f610: a0 01     
            STA ($f0),y        ; $f612: 91 f0     
            JSR __f80b         ; $f614: 20 0b f8  
            LDY #$02           ; $f617: a0 02     
            STA ($f0),y        ; $f619: 91 f0     
            JSR __f80b         ; $f61b: 20 0b f8  
            LDY #$04           ; $f61e: a0 04     
            STA ($f0),y        ; $f620: 91 f0     
            LDY #$00           ; $f622: a0 00     
            LDA ($f0),y        ; $f624: b1 f0     
            CMP #$04           ; $f626: c9 04     
            BNE __f636         ; $f628: d0 0c     
            JSR __f80b         ; $f62a: 20 0b f8  
            LDY #$03           ; $f62d: a0 03     
            STA ($f0),y        ; $f62f: 91 f0     
            BPL __f636         ; $f631: 10 03     
__f633:     JSR __f7f4         ; $f633: 20 f4 f7  
__f636:     JSR __f80b         ; $f636: 20 0b f8  
            CMP #$e8           ; $f639: c9 e8     
            BCS __f6a7         ; $f63b: b0 6a     
            CMP #$60           ; $f63d: c9 60     
            BEQ __f67c         ; $f63f: f0 3b     
            BCS __f69f         ; $f641: b0 5c     
            PHA                ; $f643: 48        
            AND #$f8           ; $f644: 29 f8     
            LSR                ; $f646: 4a        
            LSR                ; $f647: 4a        
            TAX                ; $f648: aa        
            LDA __f83b,x       ; $f649: bd 3b f8  
            STA $f6            ; $f64c: 85 f6     
            LDA __f83c,x       ; $f64e: bd 3c f8  
            STA $f7            ; $f651: 85 f7     
            PLA                ; $f653: 68        
            AND #$07           ; $f654: 29 07     
            BEQ __f660         ; $f656: f0 08     
            TAX                ; $f658: aa        
__f659:     LSR $f6            ; $f659: 46 f6     
            ROR $f7            ; $f65b: 66 f7     
            DEX                ; $f65d: ca        
            BNE __f659         ; $f65e: d0 f9     
__f660:     LDY #$04           ; $f660: a0 04     
            LDA ($f0),y        ; $f662: b1 f0     
            AND #$f8           ; $f664: 29 f8     
            ORA $f6            ; $f666: 05 f6     
            STA ($f0),y        ; $f668: 91 f0     
            LDA $f7            ; $f66a: a5 f7     
            DEY                ; $f66c: 88        
            STA ($f0),y        ; $f66d: 91 f0     
            LDY #$00           ; $f66f: a0 00     
            LDA ($f0),y        ; $f671: b1 f0     
            CMP #$05           ; $f673: c9 05     
            BCC __f67c         ; $f675: 90 05     
            SEC                ; $f677: 38        
            SBC #$04           ; $f678: e9 04     
            STA ($f0),y        ; $f67a: 91 f0     
__f67c:     LDY #$06           ; $f67c: a0 06     
            LDA ($f0),y        ; $f67e: b1 f0     
            STA $f6            ; $f680: 85 f6     
            LDX $f4            ; $f682: a6 f4     
            LDA $06e2,x        ; $f684: bd e2 06  
            STA $f7            ; $f687: 85 f7     
            LDA #$00           ; $f689: a9 00     
            LDX #$08           ; $f68b: a2 08     
__f68d:     LSR $f7            ; $f68d: 46 f7     
            BCC __f694         ; $f68f: 90 03     
            CLC                ; $f691: 18        
            ADC $f6            ; $f692: 65 f6     
__f694:     ASL $f6            ; $f694: 06 f6     
            DEX                ; $f696: ca        
            BNE __f68d         ; $f697: d0 f4     
            INY                ; $f699: c8        
            STA ($f0),y        ; $f69a: 91 f0     
            JMP __f5b8         ; $f69c: 4c b8 f5  

;-------------------------------------------------------------------------------
__f69f:     SBC #$60           ; $f69f: e9 60     
            LDY #$06           ; $f6a1: a0 06     
            STA ($f0),y        ; $f6a3: 91 f0     
            BPL __f636         ; $f6a5: 10 8f     
__f6a7:     SBC #$e8           ; $f6a7: e9 e8     
            JSR __f49f         ; $f6a9: 20 9f f4  

;-------------------------------------------------------------------------------
            .hex d0 f6 de f6   ; $f6ac: d0 f6 de f6   Data
            .hex f0 f6 02 f7   ; $f6b0: f0 f6 02 f7   Data
            .hex 14 f7 1e f7   ; $f6b4: 14 f7 1e f7   Data
            .hex 28 f7 32 f7   ; $f6b8: 28 f7 32 f7   Data
            .hex 3f f7 43 f7   ; $f6bc: 3f f7 43 f7   Data
            .hex 46 f7 5a f7   ; $f6c0: 46 f7 5a f7   Data
            .hex 5e f7 61 f7   ; $f6c4: 5e f7 61 f7   Data
            .hex 75 f7 79 f7   ; $f6c8: 75 f7 79 f7   Data
            .hex 7c f7 c2 f7   ; $f6cc: 7c f7 c2 f7   Data

;-------------------------------------------------------------------------------
            LDX $f4            ; $f6d0: a6 f4     
            LDA #$00           ; $f6d2: a9 00     
            STA $0600,x        ; $f6d4: 9d 00 06  
            LDY #$00           ; $f6d7: a0 00     
            STA ($f0),y        ; $f6d9: 91 f0     
            JMP __f5b8         ; $f6db: 4c b8 f5  

;-------------------------------------------------------------------------------
            JSR __f80b         ; $f6de: 20 0b f8  
            STA $f6            ; $f6e1: 85 f6     
            LDY #$01           ; $f6e3: a0 01     
            LDA ($f0),y        ; $f6e5: b1 f0     
            AND #$3f           ; $f6e7: 29 3f     
            ORA $f6            ; $f6e9: 05 f6     
            STA ($f0),y        ; $f6eb: 91 f0     
            JMP __f636         ; $f6ed: 4c 36 f6  

;-------------------------------------------------------------------------------
            JSR __f80b         ; $f6f0: 20 0b f8  
            STA $f6            ; $f6f3: 85 f6     
            LDY #$01           ; $f6f5: a0 01     
            LDA ($f0),y        ; $f6f7: b1 f0     
            AND #$c0           ; $f6f9: 29 c0     
            ORA $f6            ; $f6fb: 05 f6     
            STA ($f0),y        ; $f6fd: 91 f0     
            JMP __f636         ; $f6ff: 4c 36 f6  

;-------------------------------------------------------------------------------
            JSR __f80b         ; $f702: 20 0b f8  
            STA $f6            ; $f705: 85 f6     
            LDY #$01           ; $f707: a0 01     
            LDA ($f0),y        ; $f709: b1 f0     
            AND #$f0           ; $f70b: 29 f0     
            ORA $f6            ; $f70d: 05 f6     
            STA ($f0),y        ; $f70f: 91 f0     
            JMP __f636         ; $f711: 4c 36 f6  

;-------------------------------------------------------------------------------
            JSR __f80b         ; $f714: 20 0b f8  
            LDY #$02           ; $f717: a0 02     
            STA ($f0),y        ; $f719: 91 f0     
            JMP __f636         ; $f71b: 4c 36 f6  

;-------------------------------------------------------------------------------
            JSR __f80b         ; $f71e: 20 0b f8  
            LDY #$04           ; $f721: a0 04     
            STA ($f0),y        ; $f723: 91 f0     
            JMP __f636         ; $f725: 4c 36 f6  

;-------------------------------------------------------------------------------
            JSR __f80b         ; $f728: 20 0b f8  
            LDY #$01           ; $f72b: a0 01     
            STA ($f0),y        ; $f72d: 91 f0     
            JMP __f636         ; $f72f: 4c 36 f6  

;-------------------------------------------------------------------------------
            LDA #$00           ; $f732: a9 00     
            LDX #$08           ; $f734: a2 08     
__f736:     STA $0161,x        ; $f736: 9d 61 01  
            DEX                ; $f739: ca        
            BPL __f736         ; $f73a: 10 fa     
            JMP __f636         ; $f73c: 4c 36 f6  

;-------------------------------------------------------------------------------
            LDX #$00           ; $f73f: a2 00     
            BEQ __f748         ; $f741: f0 05     
            LDX #$01           ; $f743: a2 01     
            BIT $02a2          ; $f745: 2c a2 02  
__f748:     JSR __f80b         ; $f748: 20 0b f8  
            INC $0161,x        ; $f74b: fe 61 01  
            CMP $0161,x        ; $f74e: dd 61 01  
            BNE __f7c2         ; $f751: d0 6f     
            LDA #$00           ; $f753: a9 00     
            STA $0161,x        ; $f755: 9d 61 01  
            BEQ __f790         ; $f758: f0 36     
            LDX #$00           ; $f75a: a2 00     
            BEQ __f763         ; $f75c: f0 05     
            LDX #$01           ; $f75e: a2 01     
            BIT $02a2          ; $f760: 2c a2 02  
__f763:     JSR __f80b         ; $f763: 20 0b f8  
            INC $0164,x        ; $f766: fe 64 01  
            CMP $0164,x        ; $f769: dd 64 01  
            BNE __f790         ; $f76c: d0 22     
            LDA #$00           ; $f76e: a9 00     
            STA $0164,x        ; $f770: 9d 64 01  
            BEQ __f7c2         ; $f773: f0 4d     
            LDX #$00           ; $f775: a2 00     
            BEQ __f77e         ; $f777: f0 05     
            LDX #$01           ; $f779: a2 01     
            BIT $02a2          ; $f77b: 2c a2 02  
__f77e:     JSR __f80b         ; $f77e: 20 0b f8  
            INC $0167,x        ; $f781: fe 67 01  
            CMP $0167,x        ; $f784: dd 67 01  
            BNE __f790         ; $f787: d0 07     
            LDA #$00           ; $f789: a9 00     
            STA $0167,x        ; $f78b: 9d 67 01  
            BEQ __f7c2         ; $f78e: f0 32     
__f790:     LDA $f4            ; $f790: a5 f4     
            CMP #$13           ; $f792: c9 13     
            BEQ __f7a6         ; $f794: f0 10     
            CMP #$14           ; $f796: c9 14     
            BEQ __f7b4         ; $f798: f0 1a     
            LDY #$05           ; $f79a: a0 05     
            LDA ($f0),y        ; $f79c: b1 f0     
            CLC                ; $f79e: 18        
            ADC #$01           ; $f79f: 69 01     
            STA ($f0),y        ; $f7a1: 91 f0     
            JMP __f636         ; $f7a3: 4c 36 f6  

;-------------------------------------------------------------------------------
__f7a6:     LDA $f8            ; $f7a6: a5 f8     
            CLC                ; $f7a8: 18        
            ADC #$02           ; $f7a9: 69 02     
            STA $f8            ; $f7ab: 85 f8     
            BCC __f7b1         ; $f7ad: 90 02     
            INC $f9            ; $f7af: e6 f9     
__f7b1:     JMP __f636         ; $f7b1: 4c 36 f6  

;-------------------------------------------------------------------------------
__f7b4:     LDA $fa            ; $f7b4: a5 fa     
            CLC                ; $f7b6: 18        
            ADC #$02           ; $f7b7: 69 02     
            STA $fa            ; $f7b9: 85 fa     
            BCC __f7bf         ; $f7bb: 90 02     
            INC $fb            ; $f7bd: e6 fb     
__f7bf:     JMP __f636         ; $f7bf: 4c 36 f6  

;-------------------------------------------------------------------------------
__f7c2:     LDA $f4            ; $f7c2: a5 f4     
            CMP #$13           ; $f7c4: c9 13     
            BEQ __f7d6         ; $f7c6: f0 0e     
            CMP #$14           ; $f7c8: c9 14     
            BEQ __f7e5         ; $f7ca: f0 19     
            JSR __f80b         ; $f7cc: 20 0b f8  
            LDY #$05           ; $f7cf: a0 05     
            STA ($f0),y        ; $f7d1: 91 f0     
            JMP __f636         ; $f7d3: 4c 36 f6  

;-------------------------------------------------------------------------------
__f7d6:     JSR __f80b         ; $f7d6: 20 0b f8  
            PHA                ; $f7d9: 48        
            JSR __f80b         ; $f7da: 20 0b f8  
            STA $f9            ; $f7dd: 85 f9     
            PLA                ; $f7df: 68        
            STA $f8            ; $f7e0: 85 f8     
            JMP __f636         ; $f7e2: 4c 36 f6  

;-------------------------------------------------------------------------------
__f7e5:     JSR __f80b         ; $f7e5: 20 0b f8  
            PHA                ; $f7e8: 48        
            JSR __f80b         ; $f7e9: 20 0b f8  
            STA $fb            ; $f7ec: 85 fb     
            PLA                ; $f7ee: 68        
            STA $fa            ; $f7ef: 85 fa     
            JMP __f636         ; $f7f1: 4c 36 f6  

;-------------------------------------------------------------------------------
__f7f4:     LDA $f4            ; $f7f4: a5 f4     
            CMP #$13           ; $f7f6: c9 13     
            BEQ __f80a         ; $f7f8: f0 10     
            CMP #$14           ; $f7fa: c9 14     
            BEQ __f80a         ; $f7fc: f0 0c     
            ASL                ; $f7fe: 0a        
            TAX                ; $f7ff: aa        
            LDA __f853,x       ; $f800: bd 53 f8  
            STA $f2            ; $f803: 85 f2     
            LDA __f854,x       ; $f805: bd 54 f8  
            STA $f3            ; $f808: 85 f3     
__f80a:     RTS                ; $f80a: 60        

;-------------------------------------------------------------------------------
__f80b:     LDA $f4            ; $f80b: a5 f4     
            CMP #$13           ; $f80d: c9 13     
            BEQ __f825         ; $f80f: f0 14     
            CMP #$14           ; $f811: c9 14     
            BEQ __f830         ; $f813: f0 1b     
            LDY #$05           ; $f815: a0 05     
            LDA ($f0),y        ; $f817: b1 f0     
            TAY                ; $f819: a8        
            LDA ($f2),y        ; $f81a: b1 f2     
            PHA                ; $f81c: 48        
            INY                ; $f81d: c8        
            tya                ; $f81e: 98        
            LDY #$05           ; $f81f: a0 05     
            STA ($f0),y        ; $f821: 91 f0     
            PLA                ; $f823: 68        
            RTS                ; $f824: 60        

;-------------------------------------------------------------------------------
__f825:     LDY #$00           ; $f825: a0 00     
            LDA ($f8),y        ; $f827: b1 f8     
            INC $f8            ; $f829: e6 f8     
            BNE __f82f         ; $f82b: d0 02     
            INC $f9            ; $f82d: e6 f9     
__f82f:     RTS                ; $f82f: 60        

;-------------------------------------------------------------------------------
__f830:     LDY #$00           ; $f830: a0 00     
            LDA ($fa),y        ; $f832: b1 fa     
            INC $fa            ; $f834: e6 fa     
            BNE __f83a         ; $f836: d0 02     
            INC $fb            ; $f838: e6 fb     
__f83a:     RTS                ; $f83a: 60        

;-------------------------------------------------------------------------------
__f83b:     .hex 07            ; $f83b: 07            Data
__f83c:     .hex f2 07 80 07   ; $f83c: f2 07 80 07   Data
            .hex 14 06 ae 06   ; $f840: 14 06 ae 06   Data
            .hex 43 05 f4 05   ; $f844: 43 05 f4 05   Data
            .hex 9e 05 4e 05   ; $f848: 9e 05 4e 05   Data
            .hex 02 04 ba 04   ; $f84c: 02 04 ba 04   Data
            .hex 76 04 36      ; $f850: 76 04 36      Data
__f853:     .hex 86            ; $f853: 86            Data
__f854:     .hex fe 92 fe 13   ; $f854: fe 92 fe 13   Data
            .hex fb 2b fb 3d   ; $f858: fb 2b fb 3d   Data
            .hex fb ba fd a6   ; $f85c: fb ba fd a6   Data
            .hex fd 9f fd 89   ; $f860: fd 9f fd 89   Data
            .hex fd 64 fd 56   ; $f864: fd 64 fd 56   Data
            .hex fd 1a fd 38   ; $f868: fd 1a fd 38   Data
            .hex fd 47 fd 55   ; $f86c: fd 47 fd 55   Data
            .hex fb f5 fb 69   ; $f870: fb f5 fb 69   Data
            .hex fc 5a fe 72   ; $f874: fc 5a fe 72   Data
            .hex fe            ; $f878: fe            Data
__f879:     .hex b7            ; $f879: b7            Data
__f87a:     .hex f8            ; $f87a: f8            Data
__f87b:     .hex 14            ; $f87b: 14            Data
__f87c:     .hex fa c2 fd f9   ; $f87c: fa c2 fd f9   Data
            .hex fd 2a fe 0d   ; $f880: fd 2a fe 0d   Data
            .hex ff            ; $f884: ff            Data
__f885:     .hex 00 00 00 00   ; $f885: 00 00 00 00   Data
            .hex 00 00 00 00   ; $f889: 00 00 00 00   Data
            .hex 01 00 01 00   ; $f88d: 01 00 01 00   Data
            .hex 00 00 00 00   ; $f891: 00 00 00 00   Data
            .hex 00 00 00 00   ; $f895: 00 00 00 00   Data
            .hex 00 00 00 00   ; $f899: 00 00 00 00   Data
            .hex 00            ; $f89d: 00            Data
__f89e:     .hex 01 01 01 01   ; $f89e: 01 01 01 01   Data
            .hex 01 01 01 01   ; $f8a2: 01 01 01 01   Data
            .hex 01 01 01 01   ; $f8a6: 01 01 01 01   Data
            .hex 01 01 01 01   ; $f8aa: 01 01 01 01   Data
            .hex 01 01 01 04   ; $f8ae: 01 01 01 04   Data
            .hex 04 01 01 01   ; $f8b2: 04 01 01 01   Data
            .hex 01 01 03 7f   ; $f8b6: 01 01 03 7f   Data
            .hex 40 ef 64 32   ; $f8ba: 40 ef 64 32   Data
            .hex 13 0b 13 ea   ; $f8be: 13 0b 13 ea   Data
            .hex 20 67 1b 69   ; $f8c2: 20 67 1b 69   Data
            .hex 13 ea 03 64   ; $f8c6: 13 ea 03 64   Data
            .hex 03 13 63 03   ; $f8ca: 03 13 63 03   Data
            .hex 61 52 63 3a   ; $f8ce: 61 52 63 3a   Data
            .hex ea 20 71 03   ; $f8d2: ea 20 71 03   Data
            .hex ea 03 64 2a   ; $f8d6: ea 03 64 2a   Data
            .hex 03 5a 03 ea   ; $f8da: 03 5a 03 ea   Data
            .hex 20 67 13 69   ; $f8de: 20 67 13 69   Data
            .hex 03 ea 03 64   ; $f8e2: 03 ea 03 64   Data
            .hex 52 03 63 52   ; $f8e6: 52 03 63 52   Data
            .hex 64 3a ea 20   ; $f8ea: 64 3a ea 20   Data
            .hex 71 2a ea 03   ; $f8ee: 71 2a ea 03   Data
            .hex 63 12 61 2a   ; $f8f2: 63 12 61 2a   Data
            .hex 63 52 61 12   ; $f8f6: 63 52 61 12   Data
            .hex 63 2a 61 52   ; $f8fa: 63 2a 61 52   Data
            .hex 63 12 61 52   ; $f8fe: 63 12 61 52   Data
            .hex 63 1a 61 3a   ; $f902: 63 1a 61 3a   Data
            .hex 63 52 61 22   ; $f906: 63 52 61 22   Data
            .hex 63 3a 61 52   ; $f90a: 63 3a 61 52   Data
            .hex 63 22 61 52   ; $f90e: 63 22 61 52   Data
            .hex f6 04 fe f9   ; $f912: f6 04 fe f9   Data
            .hex 64 60 63 13   ; $f916: 64 60 63 13   Data
            .hex 61 0b 64 03   ; $f91a: 61 0b 64 03   Data
            .hex 63 2a 65 52   ; $f91e: 63 2a 65 52   Data
            .hex 64 52 4a 3a   ; $f922: 64 52 4a 3a   Data
            .hex f3 03 97 f9   ; $f926: f3 03 97 f9   Data
            .hex f0 02 bc f8   ; $f92a: f0 02 bc f8   Data
            .hex 63 12 61 4a   ; $f92e: 63 12 61 4a   Data
            .hex 63 32 61 12   ; $f932: 63 32 61 12   Data
            .hex 63 4a 61 32   ; $f936: 63 4a 61 32   Data
            .hex f0 05 2e f9   ; $f93a: f0 05 2e f9   Data
            .hex 63 12 61 4a   ; $f93e: 63 12 61 4a   Data
            .hex 63 02 61 3a   ; $f942: 63 02 61 3a   Data
            .hex 63 22 61 02   ; $f946: 63 22 61 02   Data
            .hex 63 3a 61 22   ; $f94a: 63 3a 61 22   Data
            .hex f0 05 42 f9   ; $f94e: f0 05 42 f9   Data
            .hex 64 02 63 51   ; $f952: 64 02 63 51   Data
            .hex 61 02 63 12   ; $f956: 61 02 63 12   Data
            .hex 61 51 63 02   ; $f95a: 61 51 63 02   Data
            .hex 61 12 63 1a   ; $f95e: 61 12 63 1a   Data
            .hex 61 02 63 12   ; $f962: 61 02 63 12   Data
            .hex 61 1a 63 2a   ; $f966: 61 1a 63 2a   Data
            .hex 61 12 63 1a   ; $f96a: 61 12 63 1a   Data
            .hex 61 2a 63 3a   ; $f96e: 61 2a 63 3a   Data
            .hex 61 1a 63 2a   ; $f972: 61 1a 63 2a   Data
            .hex 61 3a 63 4a   ; $f976: 61 3a 63 4a   Data
            .hex 61 2a 63 3a   ; $f97a: 61 2a 63 3a   Data
            .hex 61 4a 63 52   ; $f97e: 61 4a 63 52   Data
            .hex 61 03 64 13   ; $f982: 61 03 64 13   Data
            .hex 63 0b 61 13   ; $f986: 63 0b 61 13   Data
            .hex 63 0b 61 13   ; $f98a: 63 0b 61 13   Data
            .hex 63 0b 61 13   ; $f98e: 63 0b 61 13   Data
            .hex f0 02 bc f8   ; $f992: f0 02 bc f8   Data
            .hex e8 64 60 13   ; $f996: e8 64 60 13   Data
            .hex 0b 13 1b 13   ; $f99a: 0b 13 1b 13   Data
            .hex 0b 13 f3 02   ; $f99e: 0b 13 f3 02   Data
            .hex c6 f9 64 3a   ; $f9a2: c6 f9 64 3a   Data
            .hex 4b 3b 13 ea   ; $f9a6: 4b 3b 13 ea   Data
            .hex 0f 70 52 ea   ; $f9aa: 0f 70 52 ea   Data
            .hex 03 64 60 03   ; $f9ae: 03 64 60 03   Data
            .hex 5a 03 13 03   ; $f9b2: 5a 03 13 03   Data
            .hex 13 23 2a 2b   ; $f9b6: 13 23 2a 2b   Data
            .hex 1b 13 68 03   ; $f9ba: 1b 13 68 03   Data
            .hex ea 0d 0b ea   ; $f9be: ea 0d 0b ea   Data
            .hex 03 f9 97 f9   ; $f9c2: 03 f9 97 f9   Data
            .hex 64 60 52 13   ; $f9c6: 64 60 52 13   Data
            .hex 2b 63 4b 61   ; $f9ca: 2b 63 4b 61   Data
            .hex 3b 63 4b 64   ; $f9ce: 3b 63 4b 64   Data
            .hex 3b 61 3b 63   ; $f9d2: 3b 61 3b 63   Data
            .hex 33 65 3b ea   ; $f9d6: 33 65 3b ea   Data
            .hex 3c 68 53 ea   ; $f9da: 3c 68 53 ea   Data
            .hex 03 63 3b 61   ; $f9de: 03 63 3b 61   Data
            .hex 13 63 2b 61   ; $f9e2: 13 63 2b 61   Data
            .hex 3b 63 13 61   ; $f9e6: 3b 63 13 61   Data
            .hex 2b 63 3b 61   ; $f9ea: 2b 63 3b 61   Data
            .hex 0b 63 13 65   ; $f9ee: 0b 63 13 65   Data
            .hex 52 64 4a 3a   ; $f9f2: 52 64 4a 3a   Data
            .hex 2a 67 52 69   ; $f9f6: 2a 67 52 69   Data
            .hex 52 f9 bc f8   ; $f9fa: 52 f9 bc f8   Data
            .hex 63 52 61 03   ; $f9fe: 63 52 61 03   Data
            .hex 63 13 61 52   ; $fa02: 63 13 61 52   Data
            .hex 64 3a 2a 63   ; $fa06: 64 3a 2a 63   Data
            .hex 2a 61 3a 64   ; $fa0a: 2a 61 3a 64   Data
            .hex 4a 68 52 f9   ; $fa0e: 4a 68 52 f9   Data
            .hex 54 f9 03 23   ; $fa12: 54 f9 03 23   Data
            .hex 7f 08 68 3a   ; $fa16: 7f 08 68 3a   Data
            .hex 67 12 64 3a   ; $fa1a: 67 12 64 3a   Data
            .hex 61 3a 64 12   ; $fa1e: 61 3a 64 12   Data
            .hex 63 3a 61 4a   ; $fa22: 63 3a 61 4a   Data
            .hex 64 5a 68 03   ; $fa26: 64 5a 68 03   Data
            .hex 67 3a 64 03   ; $fa2a: 67 3a 64 03   Data
            .hex 61 03 64 52   ; $fa2e: 61 03 64 52   Data
            .hex 4a 3a 68 2a   ; $fa32: 4a 3a 68 2a   Data
            .hex 67 02 64 2a   ; $fa36: 67 02 64 2a   Data
            .hex 61 2a 64 02   ; $fa3a: 61 2a 64 02   Data
            .hex 63 2a 61 3a   ; $fa3e: 63 2a 61 3a   Data
            .hex 64 4a 68 52   ; $fa42: 64 4a 68 52   Data
            .hex 67 2a 64 52   ; $fa46: 67 2a 64 52   Data
            .hex 61 52 64 2a   ; $fa4a: 61 52 64 2a   Data
            .hex 22 1a 51 52   ; $fa4e: 22 1a 51 52   Data
            .hex 51 52 02 03   ; $fa52: 51 52 02 03   Data
            .hex 0a 0b f8 04   ; $fa56: 0a 0b f8 04   Data
            .hex 0a fb 74 12   ; $fa5a: 0a fb 74 12   Data
            .hex 64 52 03 0b   ; $fa5e: 64 52 03 0b   Data
            .hex f5 03 aa fa   ; $fa62: f5 03 aa fa   Data
            .hex f2 02 18 fa   ; $fa66: f2 02 18 fa   Data
            .hex ee 7f 68 12   ; $fa6a: ee 7f 68 12   Data
            .hex 66 32 62 4a   ; $fa6e: 66 32 62 4a   Data
            .hex 64 5a 68 13   ; $fa72: 64 5a 68 13   Data
            .hex 64 5a 68 4a   ; $fa76: 64 5a 68 4a   Data
            .hex 5a 64 32 6c   ; $fa7a: 5a 64 32 6c   Data
            .hex 4a 68 02 66   ; $fa7e: 4a 68 02 66   Data
            .hex 22 62 3a 64   ; $fa82: 22 62 3a 64   Data
            .hex 4a 68 03 64   ; $fa86: 4a 68 03 64   Data
            .hex 4a 68 3a 4a   ; $fa8a: 4a 68 3a 4a   Data
            .hex 64 22 6c 3a   ; $fa8e: 64 22 6c 3a   Data
            .hex ee 23 64 51   ; $fa92: ee 23 64 51   Data
            .hex 52 02 03 12   ; $fa96: 52 02 03 12   Data
            .hex 13 1a 1b 2a   ; $fa9a: 13 1a 1b 2a   Data
            .hex 2b 3a 3b 4a   ; $fa9e: 2b 3a 3b 4a   Data
            .hex 4a 32 12 f2   ; $faa2: 4a 32 12 f2   Data
            .hex 02 18 fa e8   ; $faa6: 02 18 fa e8   Data
            .hex 68 13 67 4a   ; $faaa: 68 13 67 4a   Data
            .hex 64 13 61 13   ; $faae: 64 13 61 13   Data
            .hex 64 4a 63 13   ; $fab2: 64 4a 63 13   Data
            .hex 61 23 64 33   ; $fab6: 61 23 64 33   Data
            .hex 68 3b 67 13   ; $faba: 68 3b 67 13   Data
            .hex 64 3b 61 3b   ; $fabe: 64 3b 61 3b   Data
            .hex 64 2b 63 23   ; $fac2: 64 2b 63 23   Data
            .hex 61 23 64 13   ; $fac6: 61 23 64 13   Data
            .hex 68 03 67 3a   ; $faca: 68 03 67 3a   Data
            .hex 64 03 61 03   ; $face: 64 03 61 03   Data
            .hex 64 3a 63 03   ; $fad2: 64 3a 63 03   Data
            .hex 61 13 64 23   ; $fad6: 61 13 64 23   Data
            .hex 78 2b 68 2b   ; $fada: 78 2b 68 2b   Data
            .hex 13 67 4a 64   ; $fade: 13 67 4a 64   Data
            .hex 13 61 13 64   ; $fae2: 13 61 13 64   Data
            .hex 1b 63 13 61   ; $fae6: 1b 63 13 61   Data
            .hex 13 64 03 68   ; $faea: 13 64 03 68   Data
            .hex 52 64 13 2b   ; $faee: 52 64 13 2b   Data
            .hex 3b 68 5b 64   ; $faf2: 3b 68 5b 64   Data
            .hex 3b 1b 1b 1b   ; $faf6: 3b 1b 1b 1b   Data
            .hex 1b 2b 2b 2b   ; $fafa: 1b 2b 2b 2b   Data
            .hex 2b 2a 2a 3a   ; $fafe: 2b 2a 2a 3a   Data
            .hex 4a 67 52 69   ; $fb02: 4a 67 52 69   Data
            .hex 52 f9 18 fa   ; $fb06: 52 f9 18 fa   Data
            .hex 74 60 64 2a   ; $fb0a: 74 60 64 2a   Data
            .hex 68 52 f9 94   ; $fb0e: 68 52 f9 94   Data
            .hex fa 01 04 7f   ; $fb12: fa 01 04 7f   Data
            .hex 40 6c 2b 64   ; $fb16: 40 6c 2b 64   Data
            .hex 13 6c 52 64   ; $fb1a: 13 6c 52 64   Data
            .hex 13 70 2b 3b   ; $fb1e: 13 70 2b 3b   Data
            .hex ea 20 8d 4b   ; $fb22: ea 20 8d 4b   Data
            .hex ea 10 73 4b   ; $fb26: ea 10 73 4b   Data
            .hex e8 03 23 7f   ; $fb2a: e8 03 23 7f   Data
            .hex 08 70 52 53   ; $fb2e: 08 70 52 53   Data
            .hex 3a 3b ee ff   ; $fb32: 3a 3b ee ff   Data
            .hex 8d 32 ee 13   ; $fb36: 8d 32 ee 13   Data
            .hex 73 32 e8 02   ; $fb3a: 73 32 e8 02   Data
            .hex 04 7f 40 6c   ; $fb3e: 04 7f 40 6c   Data
            .hex 60 64 52 6c   ; $fb42: 60 64 52 6c   Data
            .hex 2a 64 52 70   ; $fb46: 2a 64 52 70   Data
            .hex 13 13 ea 20   ; $fb4a: 13 13 ea 20   Data
            .hex 8d 13 ea 10   ; $fb4e: 8d 13 ea 10   Data
            .hex 73 13 e8 01   ; $fb52: 73 13 e8 01   Data
            .hex 07 7f 40 ef   ; $fb56: 07 7f 40 ef   Data
            .hex 6c 2b 66 2b   ; $fb5a: 6c 2b 66 2b   Data
            .hex 2b 68 2b 13   ; $fb5e: 2b 68 2b 13   Data
            .hex 2b 78 3b 72   ; $fb62: 2b 78 3b 72   Data
            .hex 43 66 43 ea   ; $fb66: 43 66 43 ea   Data
            .hex 0f cc 4b ea   ; $fb6a: 0f cc 4b ea   Data
            .hex 05 7e 42 6a   ; $fb6e: 05 7e 42 6a   Data
            .hex 1a 03 7e 1b   ; $fb72: 1a 03 7e 1b   Data
            .hex 2b 74 03 6a   ; $fb76: 2b 74 03 6a   Data
            .hex 52 74 42 2a   ; $fb7a: 52 74 42 2a   Data
            .hex 42 f3 02 51   ; $fb7e: 42 f3 02 51   Data
            .hex 6a 42 2a 03   ; $fb82: 6a 42 2a 03   Data
            .hex ba 52 f0 02   ; $fb86: ba 52 f0 02   Data
            .hex 1a 74 60 6a   ; $fb8a: 1a 74 60 6a   Data
            .hex 2a 42 42 2a   ; $fb8e: 2a 42 42 2a   Data
            .hex 42 52 03 74   ; $fb92: 42 52 03 74   Data
            .hex 1b 2b 7e 03   ; $fb96: 1b 2b 7e 03   Data
            .hex 74 52 52 6a   ; $fb9a: 74 52 52 6a   Data
            .hex 1b 7e 03 88   ; $fb9e: 1b 7e 03 88   Data
            .hex 42 92 43 e8   ; $fba2: 42 92 43 e8   Data
            .hex 6a 2a 74 42   ; $fba6: 6a 2a 74 42   Data
            .hex ba 1a 74 60   ; $fbaa: ba 1a 74 60   Data
            .hex 6a 2a 42 42   ; $fbae: 6a 2a 42 42   Data
            .hex 2a 42 52 f3   ; $fbb2: 2a 42 52 f3   Data
            .hex 02 75 6a 3a   ; $fbb6: 02 75 6a 3a   Data
            .hex 74 1a 92 2a   ; $fbba: 74 1a 92 2a   Data
            .hex 74 2a 74 42   ; $fbbe: 74 2a 74 42   Data
            .hex 6a 42 2a 42   ; $fbc2: 6a 42 2a 42   Data
            .hex ba 1a f9 57   ; $fbc6: ba 1a f9 57   Data
            .hex 6a 03 74 52   ; $fbca: 6a 03 74 52   Data
            .hex 92 42 74 52   ; $fbce: 92 42 74 52   Data
            .hex 52 6a 52 74   ; $fbd2: 52 6a 52 74   Data
            .hex 03 ea 3f ba   ; $fbd6: 03 ea 3f ba   Data
            .hex 1b ea 05 7e   ; $fbda: 1b ea 05 7e   Data
            .hex 2b 6a 03 1b   ; $fbde: 2b 6a 03 1b   Data
            .hex 7e 2b 1b 74   ; $fbe2: 7e 2b 1b 74   Data
            .hex 03 6a 52 74   ; $fbe6: 03 6a 52 74   Data
            .hex 42 2a 42 6a   ; $fbea: 42 2a 42 6a   Data
            .hex 42 2a 03 ba   ; $fbee: 42 2a 03 ba   Data
            .hex 52 f9 1a 02   ; $fbf2: 52 f9 1a 02   Data
            .hex 07 7f 40 6c   ; $fbf6: 07 7f 40 6c   Data
            .hex 13 66 13 13   ; $fbfa: 13 66 13 13   Data
            .hex 68 13 52 13   ; $fbfe: 68 13 52 13   Data
            .hex 78 13 72 1b   ; $fc02: 78 13 72 1b   Data
            .hex 66 1b ea 0f   ; $fc06: 66 1b ea 0f   Data
            .hex cc 23 e9 80   ; $fc0a: cc 23 e9 80   Data
            .hex ea 03 7e 41   ; $fc0e: ea 03 7e 41   Data
            .hex 02 74 1a 7e   ; $fc12: 02 74 1a 7e   Data
            .hex 29 41 74 02   ; $fc16: 29 41 74 02   Data
            .hex 7e 51 0a 74   ; $fc1a: 7e 51 0a 74   Data
            .hex 2a 7e 1a 51   ; $fc1e: 2a 7e 1a 51   Data
            .hex 74 19 f1 02   ; $fc22: 74 19 f1 02   Data
            .hex 1b 7e 09 6a   ; $fc26: 1b 7e 09 6a   Data
            .hex 09 29 7e 41   ; $fc2a: 09 29 7e 41   Data
            .hex 6a 39 02 01   ; $fc2e: 6a 39 02 01   Data
            .hex 74 29 6a 41   ; $fc32: 74 29 6a 41   Data
            .hex 74 02 f7 03   ; $fc36: 74 02 f7 03   Data
            .hex 65 f4 02 55   ; $fc3a: 65 f4 02 55   Data
            .hex 7e 51 0a 74   ; $fc3e: 7e 51 0a 74   Data
            .hex 2a 7e 1a 51   ; $fc42: 2a 7e 1a 51   Data
            .hex 74 19 f9 32   ; $fc46: 74 19 f9 32   Data
            .hex 7e 51 12 74   ; $fc4a: 7e 51 12 74   Data
            .hex 2a 6a 1a 1a   ; $fc4e: 2a 6a 1a 1a   Data
            .hex 0a 0a 02 02   ; $fc52: 0a 0a 02 02   Data
            .hex 51 51 f9 1b   ; $fc56: 51 51 f9 1b   Data
            .hex 6a 51 12 74   ; $fc5a: 6a 51 12 74   Data
            .hex 2a 6a 1a 51   ; $fc5e: 2a 6a 1a 51   Data
            .hex 74 19 88 41   ; $fc62: 74 19 88 41   Data
            .hex 92 42 e8 03   ; $fc66: 92 42 e8 03   Data
            .hex 15 7f 08 6c   ; $fc6a: 15 7f 08 6c   Data
            .hex 53 66 53 53   ; $fc6e: 53 66 53 53   Data
            .hex 68 53 2b 53   ; $fc72: 68 53 2b 53   Data
            .hex ee 8f 78 53   ; $fc76: ee 8f 78 53   Data
            .hex ee 15 72 04   ; $fc7a: ee 15 72 04   Data
            .hex 66 04 ee 8f   ; $fc7e: 66 04 ee 8f   Data
            .hex 9c 14 ee 05   ; $fc82: 9c 14 ee 05   Data
            .hex 90 14 ee 10   ; $fc86: 90 14 ee 10   Data
            .hex 6a 43 65 43   ; $fc8a: 6a 43 65 43   Data
            .hex 04 6a 1c 04   ; $fc8e: 04 6a 1c 04   Data
            .hex 44 1c 04 43   ; $fc92: 44 1c 04 43   Data
            .hex 2b 65 2b 43   ; $fc96: 2b 65 2b 43   Data
            .hex 6a 04 43 2c   ; $fc9a: 6a 04 43 2c   Data
            .hex 04 43 2b 2b   ; $fc9e: 04 43 2b 2b   Data
            .hex 65 2b 43 6a   ; $fca2: 65 2b 43 6a   Data
            .hex 0c 43 2c 0c   ; $fca6: 0c 43 2c 0c   Data
            .hex 43 2b 1b 65   ; $fcaa: 43 2b 1b 65   Data
            .hex 1b 3b 6a 53   ; $fcae: 1b 3b 6a 53   Data
            .hex 3b 1c 53 3b   ; $fcb2: 3b 1c 53 3b   Data
            .hex 1b f2 02 21   ; $fcb6: 1b f2 02 21   Data
            .hex 6a 2b 65 2b   ; $fcba: 6a 2b 65 2b   Data
            .hex 43 6a 0c 43   ; $fcbe: 43 6a 0c 43   Data
            .hex 2c 0c 43 2b   ; $fcc2: 2c 0c 43 2b   Data
            .hex 1b 2b 3b 74   ; $fcc6: 1b 2b 3b 74   Data
            .hex 43 6a 53 74   ; $fcca: 43 6a 53 74   Data
            .hex 04 f8 03 9e   ; $fcce: 04 f8 03 9e   Data
            .hex f5 02 85 6a   ; $fcd2: f5 02 85 6a   Data
            .hex 2b 65 2b 43   ; $fcd6: 2b 65 2b 43   Data
            .hex 6a 0c 43 2c   ; $fcda: 6a 0c 43 2c   Data
            .hex 0c 43 2b 1b   ; $fcde: 0c 43 2b 1b   Data
            .hex 65 1b 3b 6a   ; $fce2: 65 1b 3b 6a   Data
            .hex 53 3b 1c 53   ; $fce6: 53 3b 1c 53   Data
            .hex 3b 1b f9 51   ; $fcea: 3b 1b f9 51   Data
            .hex 6a 2b 65 2b   ; $fcee: 6a 2b 65 2b   Data
            .hex 53 6a 14 53   ; $fcf2: 53 6a 14 53   Data
            .hex 2c 14 53 2b   ; $fcf6: 2c 14 53 2b   Data
            .hex 1b 65 1b 3b   ; $fcfa: 1b 65 1b 3b   Data
            .hex 6a 53 3b 1c   ; $fcfe: 6a 53 3b 1c   Data
            .hex 53 3b 1b f9   ; $fd02: 53 3b 1b f9   Data
            .hex 21 6a 2b 65   ; $fd06: 21 6a 2b 65   Data
            .hex 2b 43 6a 0c   ; $fd0a: 2b 43 6a 0c   Data
            .hex 43 1b 65 1b   ; $fd0e: 43 1b 65 1b   Data
            .hex 3b 6a 53 3b   ; $fd12: 3b 6a 53 3b   Data
            .hex 88 43 04 e8   ; $fd16: 88 43 04 e8   Data
            .hex 01 05 7f 40   ; $fd1a: 01 05 7f 40   Data
            .hex 6c 52 64 2b   ; $fd1e: 6c 52 64 2b   Data
            .hex 6c 13 64 52   ; $fd22: 6c 13 64 52   Data
            .hex 6c 2b 64 13   ; $fd26: 6c 2b 64 13   Data
            .hex 6c 52 64 3a   ; $fd2a: 6c 52 64 3a   Data
            .hex ea 20 80 32   ; $fd2e: ea 20 80 32   Data
            .hex ea 05 70 2a   ; $fd32: ea 05 70 2a   Data
            .hex 60 e8 03 2a   ; $fd36: 60 e8 03 2a   Data
            .hex 7f 08 70 2c   ; $fd3a: 7f 08 70 2c   Data
            .hex 14 53 3b 80   ; $fd3e: 14 53 3b 80   Data
            .hex 1b 70 03 60   ; $fd42: 1b 70 03 60   Data
            .hex e8 02 86 7f   ; $fd46: e8 02 86 7f   Data
            .hex 40 70 50 51   ; $fd4a: 40 70 50 51   Data
            .hex 50 51 ea 07   ; $fd4e: 50 51 ea 07   Data
            .hex 80 59 49 e8   ; $fd52: 80 59 49 e8   Data
            .hex 02 ff 7f 40   ; $fd56: 02 ff 7f 40   Data
            .hex 61 52 5a 03   ; $fd5a: 61 52 5a 03   Data
            .hex 0b ea 02 6a   ; $fd5e: 0b ea 02 6a   Data
            .hex 13 e8 02 df   ; $fd62: 13 e8 02 df   Data
            .hex 7f 38 62 53   ; $fd66: 7f 38 62 53   Data
            .hex 04 14 2c 3c   ; $fd6a: 04 14 2c 3c   Data
            .hex 53 3c 2c 14   ; $fd6e: 53 3c 2c 14   Data
            .hex 04 f7 04 24   ; $fd72: 04 f7 04 24   Data
            .hex f4 03 20 f1   ; $fd76: f4 03 20 f1   Data
            .hex 02 1c e9 40   ; $fd7a: 02 1c e9 40   Data
            .hex f9 04 e9 80   ; $fd7e: f9 04 e9 80   Data
            .hex f9 04 e9 00   ; $fd82: f9 04 e9 00   Data
            .hex f9 04 e8 02   ; $fd86: f9 04 e8 02   Data
            .hex cb 7f 48 61   ; $fd8a: cb 7f 48 61   Data
            .hex 04 5b 53 4b   ; $fd8e: 04 5b 53 4b   Data
            .hex 43 3b 33 2b   ; $fd92: 43 3b 33 2b   Data
            .hex 04 5b 53 4b   ; $fd96: 04 5b 53 4b   Data
            .hex 43 3b 33 2b   ; $fd9a: 43 3b 33 2b   Data
            .hex e8 02 89 7f   ; $fd9e: e8 02 89 7f   Data
            .hex 40 72 13 e8   ; $fda2: 40 72 13 e8   Data
            .hex 02 7f 7f 38   ; $fda6: 02 7f 7f 38   Data
            .hex 62 1c 14 0c   ; $fdaa: 62 1c 14 0c   Data
            .hex 04 5b 53 4b   ; $fdae: 04 5b 53 4b   Data
            .hex 43 3b 33 2b   ; $fdb2: 43 3b 33 2b   Data
            .hex ea 0f 23 e8   ; $fdb6: ea 0f 23 e8   Data
            .hex 01 8f 7f 68   ; $fdba: 01 8f 7f 68   Data
            .hex 63 0c 04 e8   ; $fdbe: 63 0c 04 e8   Data
            .hex 01 07 7f 40   ; $fdc2: 01 07 7f 40   Data
            .hex 6e 2b 67 23   ; $fdc6: 6e 2b 67 23   Data
            .hex 6e 1b 67 13   ; $fdca: 6e 1b 67 13   Data
            .hex 8a 0b 6e 03   ; $fdce: 8a 0b 6e 03   Data
            .hex 67 52 6e 4a   ; $fdd2: 67 52 6e 4a   Data
            .hex 67 3a 8a 2a   ; $fdd6: 67 3a 8a 2a   Data
            .hex 6e 1a 67 22   ; $fdda: 6e 1a 67 22   Data
            .hex 6e 2a 67 32   ; $fdde: 6e 2a 67 32   Data
            .hex 8a 3a 6e 2a   ; $fde2: 8a 3a 6e 2a   Data
            .hex 67 32 6e 3a   ; $fde6: 67 32 6e 3a   Data
            .hex 67 42 8a 4a   ; $fdea: 67 42 8a 4a   Data
            .hex 6e 13 67 0b   ; $fdee: 6e 13 67 0b   Data
            .hex 6e 03 67 5a   ; $fdf2: 6e 03 67 5a   Data
            .hex 8a 52 e8 02   ; $fdf6: 8a 52 e8 02   Data
            .hex 07 7f 40 75   ; $fdfa: 07 7f 40 75   Data
            .hex 13 6e 03 67   ; $fdfe: 13 6e 03 67   Data
            .hex 52 75 4a 2a   ; $fe02: 52 75 4a 2a   Data
            .hex 3a 2a 8a 13   ; $fe06: 3a 2a 8a 13   Data
            .hex 6e 03 67 13   ; $fe0a: 6e 03 67 13   Data
            .hex 6e 1b 67 13   ; $fe0e: 6e 1b 67 13   Data
            .hex 75 03 3a 6e   ; $fe12: 75 03 3a 6e   Data
            .hex 03 67 13 6e   ; $fe16: 03 67 13 6e   Data
            .hex 1b 67 23 8a   ; $fe1a: 1b 67 23 8a   Data
            .hex 2b 6e 52 67   ; $fe1e: 2b 6e 52 67   Data
            .hex 2b 6e 23 67   ; $fe22: 2b 6e 23 67   Data
            .hex 1b 8a 13 e8   ; $fe26: 1b 8a 13 e8   Data
            .hex 03 5d 7f 08   ; $fe2a: 03 5d 7f 08   Data
            .hex 75 52 6e 53   ; $fe2e: 75 52 6e 53   Data
            .hex 67 2b 75 2a   ; $fe32: 67 2b 75 2a   Data
            .hex 2b 52 6e 53   ; $fe36: 2b 52 6e 53   Data
            .hex 67 2b 75 52   ; $fe3a: 67 2b 75 52   Data
            .hex 53 1a 6e 1b   ; $fe3e: 53 1a 6e 1b   Data
            .hex 67 52 75 1a   ; $fe42: 67 52 75 1a   Data
            .hex 1b 2a 6e 2b   ; $fe46: 1b 2a 6e 2b   Data
            .hex 67 03 75 2a   ; $fe4a: 67 03 75 2a   Data
            .hex 2b 6e 52 67   ; $fe4e: 2b 6e 52 67   Data
            .hex 2b 6e 53 67   ; $fe52: 2b 6e 53 67   Data
            .hex 2b 8a 52 e8   ; $fe56: 2b 8a 52 e8   Data
            .hex 01 03 7f 40   ; $fe5a: 01 03 7f 40   Data
            .hex 6c 52 64 03   ; $fe5e: 6c 52 64 03   Data
            .hex 6c 13 64 52   ; $fe62: 6c 13 64 52   Data
            .hex 70 3a 2a 6c   ; $fe66: 70 3a 2a 6c   Data
            .hex 2a 64 3a 70   ; $fe6a: 2a 64 3a 70   Data
            .hex 4a 80 52 e8   ; $fe6e: 4a 80 52 e8   Data
            .hex 02 c4 7f 40   ; $fe72: 02 c4 7f 40   Data
            .hex 6c 52 64 03   ; $fe76: 6c 52 64 03   Data
            .hex 6c 13 64 52   ; $fe7a: 6c 13 64 52   Data
            .hex 70 3a 2a 60   ; $fe7e: 70 3a 2a 60   Data
            .hex 29 80 51 e8   ; $fe82: 29 80 51 e8   Data
            .hex 01 87 7f 40   ; $fe86: 01 87 7f 40   Data
            .hex 68 3b 64 23   ; $fe8a: 68 3b 64 23   Data
            .hex 2b 72 3b e8   ; $fe8e: 2b 72 3b e8   Data
            .hex 01 05 7f 40   ; $fe92: 01 05 7f 40   Data
            .hex ef 6c 0b 63   ; $fe96: ef 6c 0b 63   Data
            .hex 03 69 52 63   ; $fe9a: 03 69 52 63   Data
            .hex 1a 69 32 63   ; $fe9e: 1a 69 32 63   Data
            .hex 3a 69 1a 63   ; $fea2: 3a 69 1a 63   Data
            .hex 0a f6 03 35   ; $fea6: 0a f6 03 35   Data
            .hex f3 02 35 f0   ; $feaa: f3 02 35 f0   Data
            .hex 02 27 6c 1a   ; $feae: 02 27 6c 1a   Data
            .hex 69 0a 63 1a   ; $feb2: 69 0a 63 1a   Data
            .hex 78 60 e8 69   ; $feb6: 78 60 e8 69   Data
            .hex 1a 63 0a 69   ; $feba: 1a 63 0a 69   Data
            .hex 1a 63 32 69   ; $febe: 1a 63 32 69   Data
            .hex 60 6c 3a f9   ; $fec2: 60 6c 3a f9   Data
            .hex 05 69 1a 63   ; $fec6: 05 69 1a 63   Data
            .hex 0a 69 1a 63   ; $feca: 0a 69 1a 63   Data
            .hex 0a 69 60 6c   ; $fece: 0a 69 60 6c   Data
            .hex 1a f3 02 62   ; $fed2: 1a f3 02 62   Data
            .hex 6c 33 63 2b   ; $fed6: 6c 33 63 2b   Data
            .hex 69 1b 63 42   ; $feda: 69 1b 63 42   Data
            .hex 69 5a 63 03   ; $fede: 69 5a 63 03   Data
            .hex 69 42 63 32   ; $fee2: 69 42 63 32   Data
            .hex 69 42 63 32   ; $fee6: 69 42 63 32   Data
            .hex 69 42 63 5a   ; $feea: 69 42 63 5a   Data
            .hex 69 60 6c 03   ; $feee: 69 60 6c 03   Data
            .hex f9 05 6c 43   ; $fef2: f9 05 6c 43   Data
            .hex 63 3b 69 2b   ; $fef6: 63 3b 69 2b   Data
            .hex 63 1b 69 2b   ; $fefa: 63 1b 69 2b   Data
            .hex 6c 3b 33 63   ; $fefe: 6c 3b 33 63   Data
            .hex 2b 69 1b 63   ; $ff02: 2b 69 1b 63   Data
            .hex 0b 69 1b 6c   ; $ff06: 0b 69 1b 6c   Data
            .hex 2b f9 05 02   ; $ff0a: 2b f9 05 02   Data
            .hex 90 7f 40 ef   ; $ff0e: 90 7f 40 ef   Data
            .hex 63 60 ea 03   ; $ff12: 63 60 ea 03   Data
            .hex 6c 18 19 09   ; $ff16: 6c 18 19 09   Data
            .hex 01 69 50 63   ; $ff1a: 01 69 50 63   Data
            .hex 50 f7 03 21   ; $ff1e: 50 f7 03 21   Data
            .hex f4 02 21 f1   ; $ff22: f4 02 21 f1   Data
            .hex 02 1b 6c 40   ; $ff26: 02 1b 6c 40   Data
            .hex 38 28 f9 09   ; $ff2a: 38 28 f9 09   Data
            .hex 6c 30 28 18   ; $ff2e: 6c 30 28 18   Data
            .hex f4 02 36 40   ; $ff32: f4 02 36 40   Data
            .hex 41 31 29 69   ; $ff36: 41 31 29 69   Data
            .hex 19 63 19 6c   ; $ff3a: 19 63 19 6c   Data
            .hex 09 01 50 f9   ; $ff3e: 09 01 50 f9   Data
            .hex 09 6c 50 69   ; $ff42: 09 6c 50 69   Data
            .hex 51 6c 41 63   ; $ff46: 51 6c 41 63   Data
            .hex 41 6c 39 40   ; $ff4a: 41 6c 39 40   Data
            .hex 69 41 6c 31   ; $ff4e: 69 41 6c 31   Data
            .hex 63 31 6c 29   ; $ff52: 63 31 6c 29   Data
            .hex 18 19 09 01   ; $ff56: 18 19 09 01   Data
            .hex 69 50 63 30   ; $ff5a: 69 50 63 30   Data
            .hex 69 28 6f 18   ; $ff5e: 69 28 6f 18   Data
            .hex 6c 60 e8      ; $ff62: 6c 60 e8      Data
__ff65:     LDA #$00           ; $ff65: a9 00     
            STA $7a            ; $ff67: 85 7a     
            STA $7d            ; $ff69: 85 7d     
            LDA #$01           ; $ff6b: a9 01     
            STA $77            ; $ff6d: 85 77     
            JSR __caa7         ; $ff6f: 20 a7 ca  
            JSR __c241         ; $ff72: 20 41 c2  
            JSR __cd49         ; $ff75: 20 49 cd  
            JSR __e35b         ; $ff78: 20 5b e3  
            JSR __e5c5         ; $ff7b: 20 c5 e5  
            JSR __e862         ; $ff7e: 20 62 e8  
            JSR __f001         ; $ff81: 20 01 f0  
            JSR __c239         ; $ff84: 20 39 c2  
            LDX #$00           ; $ff87: a2 00     
__ff89:     LDA $0200,x        ; $ff89: bd 00 02  
            STA $0300,x        ; $ff8c: 9d 00 03  
            INX                ; $ff8f: e8        
            BNE __ff89         ; $ff90: d0 f7     
            JSR __f3c1         ; $ff92: 20 c1 f3  
            JSR __d7f1         ; $ff95: 20 f1 d7  
            JSR __d846         ; $ff98: 20 46 d8  
            LDA #$00           ; $ff9b: a9 00     
            STA $4b            ; $ff9d: 85 4b     
            STA $4f            ; $ff9f: 85 4f     
            STA $31            ; $ffa1: 85 31     
            STA $3c            ; $ffa3: 85 3c     
            STA $3d            ; $ffa5: 85 3d     
            LDA #$02           ; $ffa7: a9 02     
            STA $040f          ; $ffa9: 8d 0f 04  
            LDX #$20           ; $ffac: a2 20     
__ffae:     LDA #$02           ; $ffae: a9 02     
            STA $040f,x        ; $ffb0: 9d 0f 04  
            TXA                ; $ffb3: 8a        
            CLC                ; $ffb4: 18        
            ADC #$10           ; $ffb5: 69 10     
            TAX                ; $ffb7: aa        
            CPX $68            ; $ffb8: e4 68     
            BNE __ffae         ; $ffba: d0 f2     
__ffbc:     JSR __c141         ; $ffbc: 20 41 c1  
            JSR __cb60         ; $ffbf: 20 60 cb  
            JSR __f2e6         ; $ffc2: 20 e6 f2  
            LDA $4f            ; $ffc5: a5 4f     
            ORA $4b            ; $ffc7: 05 4b     
            BNE __ffdb         ; $ffc9: d0 10     
            LDA $24            ; $ffcb: a5 24     
            AND #$03           ; $ffcd: 29 03     
            CMP #$01           ; $ffcf: c9 01     
            BEQ __ffdb         ; $ffd1: f0 08     
            LDA $25            ; $ffd3: a5 25     
            AND #$03           ; $ffd5: 29 03     
            CMP #$01           ; $ffd7: c9 01     
            BNE __ffbc         ; $ffd9: d0 e1     
__ffdb:     JSR __c141         ; $ffdb: 20 41 c1  
            JMP __c84f         ; $ffde: 4c 4f c8  

;-------------------------------------------------------------------------------
__ffe1:     .hex 85 11 c8 40   ; $ffe1: 85 11 c8 40   Data
            .hex d5 21 c4 85   ; $ffe5: d5 21 c4 85   Data
            .hex 15 84 40 c5   ; $ffe9: 15 84 40 c5   Data
            .hex 09 e5 0d b2   ; $ffed: 09 e5 0d b2   Data
            .hex ce e1 11 c8   ; $fff1: ce e1 11 c8   Data
            .hex 40 d9 99 ff   ; $fff5: 40 d9 99 ff   Data
            .hex ff            ; $fff9: ff            Data

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: ef c2     Vector table
            .dw reset                      ; $fffc: 31 c0     Vector table
            .dw irq                        ; $fffe: 04 c3     Vector table
