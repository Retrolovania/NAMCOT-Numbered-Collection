;-------------------------------------------------------------------------------
; Pac-Man (Japan) (Rev 0).nes disassembled by DISASM6 v1.5
; Revised, commented, and generally being turned into something decent by Retrolovania

; Still very much a work in progress!
;-------------------------------------------------------------------------------
; Known zeropage variables
;-------------------------------------------------------------------------------
            ;$1A-2D = Seems to be position data for Pac-Man & the ghosts (four bytes per character; PM-B-P-I-C; X position, ??, Y position, ??).
            ;         The second and fourth byte are either constantly updating or are set
            ;         depending on whether the sprite was last moving horizontally or vertically.
            ;$33-36 = Seems to be the animation frame of the ghosts (one byte per ghost; 0A-0B up, 0C-0D left, 0E-0F down, 10-11 right)
            ;$3F = Pac_State
            ;$41-42 = X-Y position of the background layer (00 00 is fully centered)
            ;$48 = Game_State
            ;$4B = Frame_Ctr
            ;$4D & $4F = Button_Pressed
            ;$50 & $51 = Pac_Direction
            ;$61-66 = Hi_Score (starts at ten's place, one's is always zero given how scoring works)
            ;$67 = Pac_Lives
            ;$68 = Current_Level
            ;$6A = Dot_Number
            ;$6C-6F = Energizer_State (6C - UR, 6D - UL, 6E - BR, 6F - BL):
                    ;$01 = Uneaten, visible
                    ;$02 = Uneaten, invisible
                    ;$07 = Eaten, invisible
                    ;$2D = Written during title and character screens, invisible yet still technically present
            ;$70-$75 = Active_Score  
            ;$80-$85 = Inactive_Score (stores score of player waiting their turn if in 2P mode)
            ;$87 & $88 = general timers, dunno what to explicitly name these      
            ;$89 = Scared_Timer
            ;$8A = Scared_Ctr
  
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
            .org $C000         ; Set program counter

;-------------------------------------------------------------------------------
; ROM Start
;------------------------------------------------------------------------------
; Namco's copyright information. It reads: "COPY RIGHT 1984 1980 NAMCO LTD. ALL RIGHTS RESERVED"
__c000:
            .hex 43 4f 50 59   ; $c000: 43 4f 50 59   Data
            .hex 20 52 49 47   ; $c004: 20 52 49 47   Data
            .hex 48 54 20 31   ; $c008: 48 54 20 31   Data
            .hex 39 38 34 20   ; $c00c: 39 38 34 20   Data
            .hex 31 39 38 30   ; $c010: 31 39 38 30   Data
            .hex 20 4e 41 4d   ; $c014: 20 4e 41 4d   Data
            .hex 43 4f 20 4c   ; $c018: 43 4f 20 4c   Data
            .hex 54 44 2e 20   ; $c01c: 54 44 2e 20   Data
            .hex 41 4c 4c 20   ; $c020: 41 4c 4c 20   Data
            .hex 52 49 47 48   ; $c024: 52 49 47 48   Data
            .hex 54 53 20 52   ; $c028: 54 53 20 52   Data
            .hex 45 53 45 52   ; $c02c: 45 53 45 52   Data
            .hex 56 45 44      ; $c030: 56 45 44      Data

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      
            SEI                ; $c033: 78        
            CLD                ; $c034: d8        
Init_PPU:     
            LDA #$00           ; $c035  a9 00
            STA PPUCTRL        ; $c035: 8d 00 20    Disable VBlank NMI, set 8x8 sprites, BG/sprite tables at $0000, increment VRAM by one and across, base nametable at $2000
            STA PPUMASK        ; $c039: 8d 01 20    Disable rendering
Wait_VBlank:     
            LDA PPUSTATUS      ; $c03d: ad 02 20    Load value in PPUSTATUS to A  
            BPL Wait_VBlank    ; $c040: 10 fb       If PPUSTATUS is greater than or equal to zero (most significant bit of A isn't set), loop. If not, then continue.     
            LDX #$FF           ; $c042: a2 ff       
            TXS                ; $c044: 9a          Transfer X to stack (Pac-Man uses ALL of zeropage)
            LDA #$00           ; $c045: a9 00       Clear A and Y   
            TAY                ; $c047: a8      
Mem_Clear:     
            STA $0000,Y        ; $c048: 99 00 00    
            INY                ; $c04b: c8          Clear memory from $0000 to $003E (62 bytes)
            CPY #$3E           ; $c04c: c0 3e
            BNE Mem_Clear      ; $c04e: d0 f8     
            LDX #$08           ; $c050: a2 08
            LDY #$87           ; $c052: a0 87
Mem_ClearII:     
            STA ($00),Y        ; $c054: 91 00    
            INY                ; $c056: c8
            BNE Mem_ClearII    ; $c057: d0 fb       Clear 8 blocks of memory (1st is $0087-$00FF, then it goes through $0100 through $07FF in 256-byte chunks)
            INC $01            ; $c059: e6 01
            CPX $01            ; $c05b: e4 01
            BNE Mem_ClearII    ; $c05d: d0 f5
Init_Scroll:     
            LDA #$06           ; $c05f: a9 06
            STA PPUMASK        ; $c061: 8d 01 20    00000110 -> Show BG and sprites in leftmost 8 pixels
            LDA #$00           ; $c064: a9 00
            STA PPUSCROLL      ; $c066: 8d 05 20    Init X & Y scroll
            STA PPUSCROLL      ; $c069: 8d 05 20
            STA $41            ; $c06c: 85 41
            STA $42            ; $c06e: 85 42
            STA PPUMASK        ; $c070: 8d 00 20    Stop showing BG/sprites (and make sure they are)
            STA PPUMASK        ; $c073: 8d 01 20   
            TAY                ; $c076: a8
Hiro_Check:     
            LDA Hiroki,Y       ; $c077: b9 eb c0    
            CMP $0052,Y        ; $c07a: d9 52 00    
            BNE Hiro_HardPass  ; $c07d: d0 07       Jump if system was hard reset (bytes don't match)
            INY                ; $c07f: c8          
            CPY #$0F           ; $c080: c0 0f       Soft reset? Check rest of Hiroki to make sure.
            BNE Hiro_Check     ; $c082: d0 f3            
            BEQ __c0a0         ; $c084: f0 1a        
Hiro_HardPass:     
            LDA #$00           ; $c086: a9 00       
            TAY                ; $c088: a8          
ClearZP:     
            STA $0000,Y        ; $c089: 99 00 00
            INY                ; $c08c: c8
            BNE ClearZP        ; $c08d: d0 fa       Clear all of zeropage      
            LDY #$00           ; $c08f: a0 00
Hiro_Copy:     
            LDA Hiroki,Y       ; $c091: b9 eb c0
            STA $0052,Y        ; $c094: 99 52 00    Copy the Hiroki table to $0052 - $0061...
            INY                ; $c097: c8
            CPY #$0F           ; $c098: c0 0f
            BNE Hiro_Copy      ; $c09a: d0 f5       ...don't continue until it's all in.
            LDA #$01           ; $c09c: a9 01       Prep high score at 10000 points.
            STA $64            ; $c09e: 85 64
__c0a0:     
            LDY #$00           ; $c0a0: a0 00       Clear Y
            STY $3F            ; $c0a2: 84 3f       Store Y value at $3F
            LDA #$07           ; $c0a4: a9 07       Load $07 to A
            STA $45            ; $c0a6: 85 45       Store A value at $45
            LDA #$01           ; $c0a8: a9 01       Load $01 to A
            CMP $47            ; $c0aa: c5 47       Compare value at $47 with A
            BNE __c0c7         ; $c0ac: d0 19       Branch to __c0c7 if Zero Flag is not clear     
            CMP $46            ; $c0ae: c5 46       Compare value at $46 with A     
            BNE __c0c7         ; $c0b0: d0 15       Branch to __c0c7 if Zero Flag is not clear     
__c0b2:     
            LDA $0077,Y        ; $c0b2: b9 77 00    Load value at ($0077 + Y) to A  
            STA $00            ; $c0b5: 85 00       Store A value at $00
            LDA $0067,Y        ; $c0b7: b9 67 00    Load value at ($0067 + Y) to A  
            STA $0077,Y        ; $c0ba: 99 77 00    Store A value at ($0077 + Y)  
            LDA $00            ; $c0bd: a5 00       Load value at $00 to A
            STA $0067,Y        ; $c0bf: 99 67 00    Store A value at ($0067 + Y)  
            INY                ; $c0c2: c8          Increment Y by one
            CPY #$10           ; $c0c3: c0 10       Compare $10 with Y
            BNE __c0b2         ; $c0c5: d0 eb       Loop if Zero Flag is not clear
__c0c7:     
            LDA #$1F           ; $c0c7: a9 1f       Load $1F to A
            STA APUCTRL        ; $c0c9: 8d 15 40    Store A value at APUCTRL
            LDA #$C0           ; $c0cc: a9 c0       Load $C0 to A
            STA APUFrameCtr    ; $c0ce: 8d 17 40    Store A value at APUFrameCtr
            JSR __ee18         ; $c0d1: 20 18 ee    Jump to subroutine __ee18
            JSR __ee40         ; $c0d4: 20 40 ee    Jump to subroutine __ee40  
            LDA #$88           ; $c0d7: a9 88       Load $88 to A
            STA $43            ; $c0d9: 85 43       Store A value at $43
            STA PPUCTRL        ; $c0db: 8d 00 20    Store A value at PPUCTRL  
            LDA #$FF           ; $c0de: a9 ff       Load $FF to A
            STA $48            ; $c0e0: 85 48       Store A value at $48
            STA $023F          ; $c0e2: 8d 3f 02    Store A value at $023F  
            STA $024B          ; $c0e5: 8d 4b 02    Store A value at $024B  
            JMP __c168         ; $c0e8: 4c 68 c1    Jump to __c168

;-------------------------------------------------------------------------------
Hiroki:     
            .hex 48 49 52 4f   ; $c0eb: 48 49 52 4f   Data
            .hex 4b 49 20 41   ; $c0ef: 4b 49 20 41   Data
            .hex 4f 59 41 47   ; $c0f3: 4f 59 41 47   Data
            .hex 49 aa 55      ; $c0f7: 49 aa 55      Data

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        
            PHA                ; $c0fa: 48     
            TXA                ; $c0fb: 8a
            PHA                ; $c0fc: 48       
            TYA                ; $c0fd: 98
            PHA                ; $c0fe: 48          Get A, X and Y onto the stack      
            LDA #$1E           ; $c0ff: a9 1e       
            STA PPUMASK        ; $c101: 8d 01 20    00011110 -> Enable BG and sprites + show them in leftmost 8 pixels
            LDA #$00           ; $c104: a9 00       
            STA OAMADDR        ; $c106: 8d 03 20    Set start of OAM
            STA $40            ; $c109: 85 40       
            LDA $45            ; $c10b: a5 45       
            STA OAMDMA         ; $c10d: 8d 14 40    Send value at $45 to be the high byte of OAMDMA ($45 currently unknown)
            JSR __dde9         ; $c110: 20 e9 dd    Jump to subroutine __dde9
            JSR __e21c         ; $c113: 20 1c e2    Jump to subroutine __e21c  
            LDA $41            ; $c116: a5 41       Load value at $41 to A     
            STA PPUSCROLL      ; $c118: 8d 05 20    Store A value at PPUSCROLL
            LDA $42            ; $c11b: a5 42       Load value at $42 to A     
            STA PPUSCROLL      ; $c11d: 8d 05 20    Store A value at PPUSCROLL  
            LDA $47            ; $c120: a5 47       Load value at $47 to A     
            AND $46            ; $c122: 25 46       Logitcally AND value at $46 with A
            AND #$01           ; $c124: 29 01       Logitcally AND $01 with A     
            ASL                ; $c126: 0a          Shift value in A left one bit          
            ORA $43            ; $c127: 05 43       Logically OR value at $43 with A
            STA PPUCTRL        ; $c129: 8d 00 20    Store A value at PPUCTRL  
            LDA #$01           ; $c12c: a9 01       Load $01 to A
            STA JOYSTROBE      ; $c12e: 8d 16 40    Store A value at JOYSTROBE    
            LDA #$00           ; $c131: a9 00       Clear A
            STA JOYSTROBE      ; $c133: 8d 16 40    Store A value at JOYSTROBE  
            LDX #$08           ; $c136: a2 08       Load $08 to X
__c138:     
            LDA JOYSTROBE      ; $c138: ad 16 40    Load value at JOYSTROBE to A
            AND #$03           ; $c13b: 29 03       Logically AND $03 with A
            CMP #$01           ; $c13d: c9 01       Compare $01 with A
            ROR $4D            ; $c13f: 66 4d       Rotate value at $4D one bit right.     
            LDA APUFrameCtr    ; $c141: ad 17 40    Load value at APUFrameCtr to A
            AND #$03           ; $c144: 29 03       Logically AND $03 with A       
            CMP #$01           ; $c146: c9 01       Compare $01 with A     
            ROR $4E            ; $c148: 66 4e       Rotate value at $4E one bit right.    
            DEX                ; $c14a: ca          Decrement X by one
            BNE __c138         ; $c14b: d0 eb       Loop if Zero Flag is not clear     
            LDX $4D            ; $c14d: a6 4d       Load value at $4D to X
            LDA $46            ; $c14f: a5 46       Load value at $46 to A
            AND $47            ; $c151: 25 47       Logically AND value at $47 with A
            BEQ __c157         ; $c153: f0 02       Branch to __c157 if Zero Flag is clear
            LDX $4E            ; $c155: a6 4e       Load value at $4E to X
__c157:     
            STX $4F            ; $c157: 86 4f       Store X value at $4F 
            INC Frame_Ctr      ; $c159: e6 4b       Increment value at Frame_Ctr by one
            LDA $48            ; $c15b: a5 48       Load value at $48 to A
            BNE __c162         ; $c15d: d0 03       Branch to __c162 if Zero Flag is not clear       
            JSR __ee5c         ; $c15f: 20 5c ee    Jump to subroutine __ee5c
__c162:     
            PLA                ; $c162: 68          Pull A value from stack          
            TAY                ; $c163: a8          Transfer A to Y
            PLA                ; $c164: 68          Pull A value from stack        
            TAX                ; $c165: aa          Transfer A to X
            PLA                ; $c166: 68          Pull A value from stack        
; irq/BRK vector
;-------------------------------------------------------------------------------
irq:        
            RTI                ; $c167: 40          Retrieve flags and program counter from stack, then resume execution from PC

;-------------------------------------------------------------------------------
__c168:     
            LDA #$01           ; $c168: a9 01       Load $01 to A     
            STA $40            ; $c16a: 85 40       Store A value at $40     
__c16c:     
            LDA $40            ; $c16c: a5 40       Load value at $40 to A     
            BNE __c16c         ; $c16e: d0 fc       Loop if Zero Flag is not clear     
            LDA #$08           ; $c170: a9 08       Load $08 to A     
            STA PPUCTRL        ; $c172: 8d 00 20    Store A value at PPUCTRL  
            STA $43            ; $c175: 85 43       Store A value at $43 
            LDA PPUSTATUS      ; $c177: ad 02 20    Load value at PPUSTATUS to A  
            LDA #$00           ; $c17a: a9 00       Clear A
            STA PPUMASK        ; $c17c: 8d 01 20    Store A value at PPUMASK  
            TAX                ; $c17f: aa          Transfer A to X
__c180:     
            STA $0700,X        ; $c180: 9d 00 07    Store A value at address ($0700 + X)  
            INX                ; $c183: e8          Increment X by one
            BNE __c180         ; $c184: d0 fa       Loop if Zero Flag is not clear     
            STA $46            ; $c186: 85 46       Store A value at $46  
            JSR __e2ff         ; $c188: 20 ff e2    Jump to subroutine __e2ff
            JSR __c284         ; $c18b: 20 84 c2    Jump to subroutine __c284  
            JSR __c21f         ; $c18e: 20 1f c2    Jump to subroutine __c21f  
            JSR __e393         ; $c191: 20 93 e3    Jump to subroutine __e393  
            LDA PPUSTATUS      ; $c194: ad 02 20    Load value at PPUSTATUS to A  
            LDA #$3F           ; $c197: a9 3f       Load $3F to A
            STA PPUADDR        ; $c199: 8d 06 20    Store A value at PPUADDR  
            LDA #$00           ; $c19c: a9 00       Clear A
            STA PPUADDR        ; $c19e: 8d 06 20    Store A value at PPUADDR  
            LDY #$00           ; $c1a1: a0 00       Clear Y
__c1a3:     
            LDA __c395,Y       ; $c1a3: b9 95 c3    Load value at (__c395 + Y) to A  
            STA PPUDATA        ; $c1a6: 8d 07 20    Store A value at PPUDATA    
            INY                ; $c1a9: c8          Increment Y by one
            CPY #$10           ; $c1aa: c0 10       Compare $10 with Y
            BNE __c1a3         ; $c1ac: d0 f5       Loop if Zero Flag is not clear     
            LDA #$2D           ; $c1ae: a9 2d       Load $2D to A
            STA $6C            ; $c1b0: 85 6c       Store A value at $6C
            STA $6D            ; $c1b2: 85 6d       Store A value at $6D     
            STA $6E            ; $c1b4: 85 6e       Store A value at $6E     
            STA $6F            ; $c1b6: 85 6f       Store A value at $6F     
            LDA #$FF           ; $c1b8: a9 ff       Load $FF to A
            STA $023F          ; $c1ba: 8d 3f 02    Store A value at $023F  
            STA $48            ; $c1bd: 85 48       Store A value at $48     
            LDA #$00           ; $c1bf: a9 00       Clear A     
            STA $47            ; $c1c1: 85 47       Store A value at $47     
            STA $46            ; $c1c3: 85 46       Store A value at $46     
            STA $42            ; $c1c5: 85 42       Store A value at $42     
            STA $41            ; $c1c7: 85 41       Store A value at $41     
            STA $4C            ; $c1c9: 85 4c       Store A value at $4C     
            STA $87            ; $c1cb: 85 87       Store A value at $87       
            STA $88            ; $c1cd: 85 88       Store A value at $88     
            LDA $3F            ; $c1cf: a5 3f       Load value at $3F to A
            BNE __c1d7         ; $c1d1: d0 04       Branch to __c1d7 if Zero Flag is not clear      
            LDA #$8A           ; $c1d3: a9 8a       Load $8A to A
            BNE __c1d9         ; $c1d5: d0 02       Branch to __c1d9 if Zero Flag is not clear       
__c1d7:     
            LDA #$88           ; $c1d7: a9 88       Load $88 to A
__c1d9:     
            STA PPUCTRL        ; $c1d9: 8d 00 20    Store A value at PPUCTRL  
            STA $43            ; $c1dc: 85 43       Store A value at $43
__c1de:     
            LDA #$01           ; $c1de: a9 01       Load $01 to A
            STA $40            ; $c1e0: 85 40       Store A value at $40     
__c1e2:     
            LDA $40            ; $c1e2: a5 40       Load value at $40 to A     
            BNE __c1e2         ; $c1e4: d0 fc       Loop if Zero Flag is not clear      
            LDY $3F            ; $c1e6: a4 3f       Load $3F to Y
            LDA __c1f5,Y       ; $c1e8: b9 f5 c1    Load value at (__c1f5 + Y) to A    
            STA $10            ; $c1eb: 85 10       Store A value at $10      
            LDA __c1f6,Y       ; $c1ed: b9 f6 c1    Load value at (__c1f6 + Y) to A  
            STA $11            ; $c1f0: 85 11       Store A value at $11      
            JMP ($0010)        ; $c1f2: 6c 10 00    Indirectly jump to address $0010  

;-------------------------------------------------------------------------------
__c1f5:     
            .hex fb            ; $c1f5: fb            Data
__c1f6:     
            .hex c1 bd c3 58   ; $c1f6: c1 bd c3 58   Data
            .hex c4 a5 4d 29   ; $c1fa: c4 a5 4d 29   Data
            .hex 0c f0 07 a9   ; $c1fe: 0c f0 07 a9   Data
            .hex 02 85 3f 4c   ; $c202: 02 85 3f 4c   Data
            .hex 68 c1 e6 42   ; $c206: 68 c1 e6 42   Data
            .hex a9 f0 c5 42   ; $c20a: a9 f0 c5 42   Data
            .hex d0 0c a9 00   ; $c20e: d0 0c a9 00   Data
            .hex 85 42 a9 88   ; $c212: 85 42 a9 88   Data
            .hex 85 43 a9 02   ; $c216: 85 43 a9 02   Data
            .hex 85 3f 4c de   ; $c21a: 85 3f 4c de   Data
            .hex c1            ; $c21e: c1            Data
__c21f:     
            LDA #$20           ; $c21f: a9 20       Load $20 to A     
            STA $00            ; $c221: 85 00       Store A value at $00
            LDA #$E5           ; $c223: a9 e5       Load $E5 to A     
            STA $01            ; $c225: 85 01       Store A value at $01
            LDA #$06           ; $c227: a9 06       Load $00 to A     
            STA $02            ; $c229: 85 02       Store A value at $02
            LDY #$00           ; $c22b: a0 00       Clear Y
__c22d:     
            LDA PPUSTATUS      ; $c22d: ad 02 20    Load value at PPUSTATUS to A  
            LDA $00            ; $c230: a5 00       Load value at $00 to A
            STA PPUADDR        ; $c232: 8d 06 20    Store A value at PPUADDR
            LDA $01            ; $c235: a5 01       Load value at $01 to A     
            STA PPUADDR        ; $c237: 8d 06 20    Store A value at PPUADDR  
            LDA #$17           ; $c23a: a9 17       Load $17 to A     
            STA $03            ; $c23c: 85 03       Store A value at $03 
__c23e:     
            LDA __c29f,Y       ; $c23e: b9 9f c2    Load value at (__c29f + Y) to A    
            STA PPUDATA        ; $c241: 8d 07 20    Store A value at PPUDATA
            INY                ; $c244: c8          Increment Y by one
            DEC $03            ; $c245: c6 03       Decrement value at $03 by one
            BNE __c23e         ; $c247: d0 f5       Loop if Zero Flag is not clear       
            LDA $01            ; $c249: a5 01       Load value at $01 to A  
            CLC                ; $c24b: 18          Clear the carry flag.        
            ADC #$20           ; $c24c: 69 20       Add $20 to A, updating flags and storing result in A     
            STA $01            ; $c24e: 85 01       Store A value at $01
            LDA #$00           ; $c250: a9 00       Clear A
            ADC $00            ; $c252: 65 00       Add value at $00 to A, updating flags and storing result in A       
            STA $00            ; $c254: 85 00       Store A value at $00
            DEC $02            ; $c256: c6 02       Decrement value at $02 by one
            BNE __c22d         ; $c258: d0 d3       Branch to __c22d if Zero Flag is not clear       
            LDA #$06           ; $c25a: a9 06       Load $06 to A
__c25c:     
            .hex 85 00 a0 00   ; $c25c: 85 00 a0 00
__c260:     
            LDA PPUSTATUS      ; $c260: ad 02 20    Load value at PPUSTATUS to A  
            LDA __c329,Y       ; $c263: b9 29 c3    Load value at (__c329 + Y) to A   
            STA PPUADDR        ; $c266: 8d 06 20    Store A value at PPUADDR  
            INY                ; $c269: c8          Increment Y by one
            LDA __c329,Y       ; $c26a: b9 29 c3    Load value at (__c329 + Y) to A  
            STA PPUADDR        ; $c26d: 8d 06 20    Store A value at PPUADDR  
            INY                ; $c270: c8          Increment Y by one
__c271:     
            LDA __c329,Y       ; $c271: b9 29 c3    Load value at (__c329 + Y) to A  
            CMP #$FF           ; $c274: c9 ff       Compare $FF with A
            BEQ __c27e         ; $c276: f0 06       Branch to __c27e if Zero Flag is clear     
            STA PPUDATA        ; $c278: 8d 07 20    Store A value at PPUDATA  
            INY                ; $c27b: c8          Increment Y by one
            BNE __c271         ; $c27c: d0 f3       Loop if Zero Flag is not clear       
__c27e:     
            INY                ; $c27e: c8          Increment Y by one        
            DEC $00            ; $c27f: c6 00       Decrement value at $00 by one
            BNE __c260         ; $c281: d0 dd       Branch to __c260 if Zero Flag is not clear     
            RTS                ; $c283: 60          Return       

;-------------------------------------------------------------------------------
__c284:     
            LDA PPUSTATUS      ; $c284: ad 02 20    Load value at PPUSTATUS to A  
            LDA #$23           ; $c287: a9 23       Load $23 to A     
            STA PPUADDR        ; $c289: 8d 06 20    Store A value at PPUADDR  
            LDA #$C8           ; $c28c: a9 c8       Load $C8 to A     
            STA PPUADDR        ; $c28e: 8d 06 20    Store A value at PPUADDR  
            LDY #$00           ; $c291: a0 00       Clear Y
__c293:     
            LDA __c3a5,Y       ; $c293: b9 a5 c3    Load value at (__c3a5 + Y) to A  
            STA PPUDATA        ; $c296: 8d 07 20    Store A value at PPUDATA  
            INY                ; $c299: c8          Increment Y by one
            CPY #$18           ; $c29a: c0 18       Compare $18 with Y
            BNE __c293         ; $c29c: d0 f5       Loop if Zero Flag is not clear     
            RTS                ; $c29e: 60          Return

;-------------------------------------------------------------------------------
__c29f:     ; Title screen text and padding is here
            .hex e4 e8 e8 e8   ; $c29f: e4 e8 e8 e8   Data
            .hex e8 e8 e8 e8   ; $c2a3: e8 e8 e8 e8   Data
            .hex e8 e8 e8 e8   ; $c2a7: e8 e8 e8 e8   Data
            .hex e8 e8 e8 e8   ; $c2ab: e8 e8 e8 e8   Data
            .hex e8 e8 e8 e8   ; $c2af: e8 e8 e8 e8   Data
            .hex e8 e8 e5 eb   ; $c2b3: e8 e8 e5 eb   Data
            .hex 88 80 81 82   ; $c2b7: 88 80 81 82   Data
            .hex 83 84 85 86   ; $c2bb: 83 84 85 86   Data
            .hex 87 88 88 89   ; $c2bf: 87 88 88 89   Data
            .hex 8a 8b 8c 8d   ; $c2c3: 8a 8b 8c 8d   Data
            .hex 8e 8f 90 91   ; $c2c7: 8e 8f 90 91   Data
            .hex a3 e9 eb 88   ; $c2cb: a3 e9 eb 88   Data
            .hex 92 93 94 95   ; $c2cf: 92 93 94 95   Data
            .hex 96 97 98 99   ; $c2d3: 96 97 98 99   Data
            .hex 9a 9b 9c 9d   ; $c2d7: 9a 9b 9c 9d   Data
            .hex 9e 9f a0 a1   ; $c2db: 9e 9f a0 a1   Data
            .hex a2 a3 a4 a3   ; $c2df: a2 a3 a4 a3   Data
            .hex e9 eb 88 92   ; $c2e3: e9 eb 88 92   Data
            .hex a5 a6 a7 a8   ; $c2e7: a5 a6 a7 a8   Data
            .hex a9 aa ab ac   ; $c2eb: a9 aa ab ac   Data
            .hex ad ae a3 af   ; $c2ef: ad ae a3 af   Data
            .hex d0 d1 d2 a3   ; $c2f3: d0 d1 d2 a3   Data
            .hex d3 a4 a3 e9   ; $c2f7: d3 a4 a3 e9   Data
            .hex eb 88 d4 d5   ; $c2fb: eb 88 d4 d5   Data
            .hex d6 d7 d8 d9   ; $c2ff: d6 d7 d8 d9   Data
            .hex da db 88 88   ; $c303: da db 88 88   Data
            .hex dc d7 dd de   ; $c307: dc d7 dd de   Data
            .hex df e0 e1 e2   ; $c30b: df e0 e1 e2   Data
            .hex e3 a3         ; $c30f: e3 a3         Data
__c311:     
            .hex e9 e7 ea ea   ; $c311: e9 e7 ea ea   Data
            .hex ea ea ea ea   ; $c315: ea ea ea ea   Data
            .hex ea ea ea ea   ; $c319: ea ea ea ea   Data
            .hex ea ea ea ea   ; $c31d: ea ea ea ea   Data
            .hex ea ea ea ea   ; $c321: ea ea ea ea   Data
            .hex ea ea ea e6   ; $c325: ea ea ea e6   Data
            .hex 20 65 b0 b3   ; $c329: 20 65 b0 b3   Data
            .hex b2 20 20 20   ; $c32d: b2 20 20 20   Data
            .hex 20 b4 b5 b6   ; $c331: 20 b4 b5 b6   Data
            .hex b7 b8 b9 ba   ; $c335: b7 b8 b9 ba   Data
            .hex bb 20 20 20   ; $c339: bb 20 20 20   Data
            .hex b1 b3 b2 ff   ; $c33d: b1 b3 b2 ff   Data
            .hex 22 0a 5c 2d   ; $c341: 22 0a 5c 2d   Data
            .hex 31 20 50 4c   ; $c345: 31 20 50 4c   Data
            .hex 41 59 45 52   ; $c349: 41 59 45 52   Data
            .hex ff 22 4c 32   ; $c34d: ff 22 4c 32   Data
            .hex 20 50 4c 41   ; $c351: 20 50 4c 41   Data
            .hex 59 45 52 53   ; $c355: 59 45 52 53   Data
            .hex ff 22 ac 23   ; $c359: ff 22 ac 23   Data
            .hex 24 25 26 27   ; $c35d: 24 25 26 27   Data
            .hex 28 29 2a 2b   ; $c361: 28 29 2a 2b   Data
            .hex ff 23 05 5d   ; $c365: ff 23 05 5d   Data
            .hex 20 31 39 38   ; $c369: 20 31 39 38   Data
            .hex 30 20 31 39   ; $c36d: 30 20 31 39   Data
            .hex 38 34 20 4e   ; $c371: 38 34 20 4e   Data
            .hex 41 4d 43 4f   ; $c375: 41 4d 43 4f   Data
            .hex 20 4c 54 44   ; $c379: 20 4c 54 44   Data
            .hex 5b ff 23 47   ; $c37d: 5b ff 23 47   Data
            .hex 41 4c 4c 20   ; $c381: 41 4c 4c 20   Data
            .hex 52 49 47 48   ; $c385: 52 49 47 48   Data
            .hex 54 53 20 52   ; $c389: 54 53 20 52   Data
            .hex 45 53 45 52   ; $c38d: 45 53 45 52   Data
            .hex 56 45 44 ff   ; $c391: 56 45 44 ff   Data
            .hex 0f 20 0f 06   ; $c395: 0f 20 0f 06   Data
            .hex 0f 26 20 27   ; $c399: 0f 26 20 27   Data
            .hex 0f 06 0f 26   ; $c39d: 0f 06 0f 26   Data
            .hex 0f 06 20 26   ; $c3a1: 0f 06 20 26   Data
            .hex 80 a0 a0 a0   ; $c3a5: 80 a0 a0 a0   Data
            .hex a0 a0 a0 00   ; $c3a9: a0 a0 a0 00   Data
            .hex 00 66 55 55   ; $c3ad: 00 66 55 55   Data
            .hex 55 55 dd 00   ; $c3b1: 55 55 dd 00   Data
            .hex 08 0a 0a 0a   ; $c3b5: 08 0a 0a 0a   Data
            .hex 0a 0a 0a 00   ; $c3b9: 0a 0a 0a 00   Data

;-------------------------------------------------------------------------------
            LDA $87            ; $c3bd: a5 87       Load value at $87 to A     
            ORA $88            ; $c3bf: 05 88       Logically OR value at $88 with A
            BNE __c3dc         ; $c3c1: d0 19       Branch to __c3dc if Zero Flag is not clear     
            LDY #$00           ; $c3c3: a0 00       Clear Y     
__c3c5:     
            LDA __c44d,Y       ; $c3c5: b9 4d c4    Load value at (__c44d + Y) to A  
            STA $024B,Y        ; $c3c8: 99 4b 02    Store A value at ($024B + Y)
            INY                ; $c3cb: c8          Increment Y by one
            CMP #$FF           ; $c3cc: c9 ff       Compare $FF with A
            BNE __c3c5         ; $c3ce: d0 f5       Loop if Zero Flag is not clear      
            LDA $4D            ; $c3d0: a5 4d       Load value at $4D to A     
            AND #$04           ; $c3d2: 29 04       Logically AND $04 with A
            STA $50            ; $c3d4: 85 50       Store A value at $50  
            LDA $4D            ; $c3d6: a5 4d       Load value at $4D to A     
            AND #$08           ; $c3d8: 29 08       Logically AND $08 with A     
            STA $51            ; $c3da: 85 51       Store A value at $51     
__c3dc:     
            CLC                ; $c3dc: 18          Clear carry flag        
            LDA #$01           ; $c3dd: a9 01       Load $01 to A
            ADC $87            ; $c3df: 65 87       Add value at $87 to A, updating flags and storing result in A     
            STA $87            ; $c3e1: 85 87       Store A value at $87
            LDA $88            ; $c3e3: a5 88       Load value at $88 to A
            ADC #$00           ; $c3e5: 69 00       Add $00 to A, updating flags and storing result in A       
            STA $88            ; $c3e7: 85 88       Store A value at $88     
            CMP #$02           ; $c3e9: c9 02       Compare $02 with A
            BNE __c3f8         ; $c3eb: d0 0b       Branch to __c3f8 if Zero Flag is not clear     
            LDA #$00           ; $c3ed: a9 00       Clear A
            STA $87            ; $c3ef: 85 87       Store A value at $87
            LDA #$04           ; $c3f1: a9 04       Load $04 to A
            STA $3F            ; $c3f3: 85 3f       Store A value at $3F
            JMP __c1de         ; $c3f5: 4c de c1    Jump to __c1de

;-------------------------------------------------------------------------------
__c3f8:     
            LDA $4D            ; $c3f8: a5 4d       Load value at $4D to A     
            AND #$04           ; $c3fa: 29 04       Logically AND $04 with A
            CMP $50            ; $c3fc: c5 50       Compare value at $50 with A
            BEQ Title_Wait     ; $c3fe: f0 2f       Branch to Title_Wait if Zero Flag is clear     
            STA $50            ; $c400: 85 50       Store A value at $50
            LDA #$00           ; $c402: a9 00       Clear A
            STA $88            ; $c404: 85 88       Store A value at $88
            LDA #$01           ; $c406: a9 01       Load $01 to A
            STA $87            ; $c408: 85 87       Store A value at $87
            LDA $50            ; $c40a: a5 50       Load value at $50 to A
            BEQ Title_Wait     ; $c40c: f0 21       Branch to Title_Wait if Zero Flag is clear     
            LDX #$00           ; $c40e: a2 00       Clear A
            INC $47            ; $c410: e6 47       Increment value at $47 by one
            LDA $47            ; $c412: a5 47       Load value at $47 to A
            AND #$01           ; $c414: 29 01       Logically AND $01 with A
            STA $47            ; $c416: 85 47       Store A value at $47
            BEQ __c41b         ; $c418: f0 01       Branch to __c41b if Zero Flag is clear       
            INX                ; $c41a: e8          Increment X by one
__c41b:     
            LDA __c455,X       ; $c41b: bd 55 c4    Load value at (__c455 + X) to A  
            STA $024D          ; $c41e: 8d 4d 02    Store A value at $024D
            LDA __c456,X       ; $c421: bd 56 c4    Load value at (__c456 + X) to A  
            STA $0251          ; $c424: 8d 51 02    Store A value at $0251
            LDA #$22           ; $c427: a9 22       Load $22 to A
            STA $024B          ; $c429: 8d 4b 02    Store A value at $024B
            JMP __c1de         ; $c42c: 4c de c1    Jump to __c1de

;-------------------------------------------------------------------------------
Title_Wait: ; The game waits at the title screen for you to press the START button.
            LDA $4D            ; $c42f: a5 4d  
            AND #$08           ; $c431: 29 08       Did the player press START? (START = $08)
            CMP $51            ; $c433: c5 51
            BNE Title_Return   ; $c435: d0 03       Branch to Title_Return if we're in the demo    
            JMP __c1de         ; $c437: 4c de c1

;-------------------------------------------------------------------------------
Title_Return:   ; If the demo is playing, pressing START to return to the title screen triggers this.
            STA $51            ; $c43a: 85 51       Store A value at $51
            LDA $51            ; $c43c: a5 51       Load value from $51 to A
            BNE Game_Start     ; $c43e: d0 03       Branch to Game_Start if Zero Flag is not clear      
            JMP __c1de         ; $c440: 4c de c1    Jump to __c1de  

;-------------------------------------------------------------------------------
Game_Start:     ; This code is triggered when a new game is started. 
            LDA #$00           ; $c443: a9 00
            STA $48            ; $c445: 85 48       Clear $48 (During demo, $48 is FF)
            JSR __ee40         ; $c447: 20 40 ee
            JMP __c98a         ; $c44a: 4c 8a c9

;-------------------------------------------------------------------------------
__c44d:     ; Something in the title screen uses this. (Could these be palettes? I mean, $22 is NOT the universal color, but...)
            .hex 22 0a 5c 00   ; $c44d: 22 0a 5c 00   Data
            .hex 22 4a 20 ff   ; $c451: 22 4a 20 ff   Data
__c455:     
            .hex 5c            ; $c455: 5c            Data
__c456:     
            .hex 20 5c         ; $c456: 20 5c         Data

;-------------------------------------------------------------------------------
            LDA $4D            ; $c458: a5 4d       Load value at $4D to A     
            AND #$0C           ; $c45a: 29 0c       Logically AND $0C with A
            BEQ __c465         ; $c45c: f0 07       Branch to __c465 if Zero Flag is clear     
            LDA #$02           ; $c45e: a9 02       Load $02 to A
            STA $3F            ; $c460: 85 3f       Store A value at $3F
            JMP __c168         ; $c462: 4c 68 c1    Jump to __c168

;-------------------------------------------------------------------------------
__c465:     
            LDY $87            ; $c465: a4 87       Load value at $87 to Y
            LDA __c474,Y       ; $c467: b9 74 c4    Load value at (__c474 + Y) to A   
            STA $10            ; $c46a: 85 10       Store A value at $10     
            LDA __c475,Y       ; $c46c: b9 75 c4    Load value at (__c475 + Y) to A    
            STA $11            ; $c46f: 85 11       Store A value at $11
            JMP ($0010)        ; $c471: 6c 10 00    Indirectly jump to address $0010  

;-------------------------------------------------------------------------------
__c474:     
            .hex 8c            ; $c474: 8c            Data
__c475:     
            .hex c4 b9 c4 b9   ; $c475: c4 b9 c4 b9   Data
            .hex c4 b9 c4 b9   ; $c479: c4 b9 c4 b9   Data
            .hex c4 b9 c4 b9   ; $c47d: c4 b9 c4 b9   Data
            .hex c4 b9 c4 b9   ; $c481: c4 b9 c4 b9   Data
            .hex c4 b9 c4 cf   ; $c485: c4 b9 c4 cf   Data
            .hex c4 c8 c6      ; $c489: c4 c8 c6      Data

;-------------------------------------------------------------------------------
            LDA #$01           ; $c48c: a9 01       Load $01 to A and store it in $40   
            STA $40            ; $c48e: 85 40             
__c490:     
            LDA $40            ; $c490: a5 40       Load value at $40 to A, then loop until Zero Flag is clear     
            BNE __c490         ; $c492: d0 fc     
            
            LDA #$08           ; $c494: a9 08                 
            STA PPUCTRL        ; $c496: 8d 00 20    Enable 8x8 sprites
            STA $43            ; $c499: 85 43   
              
            LDA #$00           ; $c49b: a9 00     
            STA PPUMASK        ; $c49d: 8d 01 20    Stop rendering BG and sprites to screen
            STA $88            ; $c4a0: 85 88   
              
            JSR __c51e         ; $c4a2: 20 1e c5    These subroutines deal with loading the demo screen(s?)
            JSR __c54e         ; $c4a5: 20 4e c5  
            JSR __c4ec         ; $c4a8: 20 ec c4  
            INC $87            ; $c4ab: e6 87       Each increment of $87 here causes a new portion of BG to be displayed.
            INC $87            ; $c4ad: e6 87       Ex: $04 = Blinky's sprite + "OIKAKE.....", then $06 = ""AKABEI"", etc. Continues until 87 reaches $0F
              
            LDA #$88           ; $c4af: a9 88     
            STA PPUCTRL        ; $c4b1: 8d 00 20    Generate an NMI at the start of VBlank (also make sure we still have sprites)
            STA $43            ; $c4b4: 85 43    
             
            JMP __c1de         ; $c4b6: 4c de c1  

;-------------------------------------------------------------------------------
            INC $88            ; $c4b9: e6 88     
            LDA $88            ; $c4bb: a5 88     
            CMP #$30           ; $c4bd: c9 30      Increment $88 and load it to A, then compare it with $30
            BNE __c4cc         ; $c4bf: d0 0b      Branch if Zero Page isn't clear
                 
            LDA #$00           ; $c4c1: a9 00     
            STA $88            ; $c4c3: 85 88     
            JSR __c4ec         ; $c4c5: 20 ec c4  
            INC $87            ; $c4c8: e6 87     
            INC $87            ; $c4ca: e6 87 
__cfcc:
            JMP __c1de         ; $c4cc: 4c de c1     
__c4cf:     
            INC $88            ; $c4cf: e6 88     
            LDA $88            ; $c4d1: a5 88     
            CMP #$80           ; $c4d3: c9 80     
            BEQ __c4da         ; $c4d5: f0 03     
            JMP __c1de         ; $c4d7: 4c de c1  

;-------------------------------------------------------------------------------
__c4da:     
            INC $87            ; $c4da: e6 87     
            INC $87            ; $c4dc: e6 87     
            LDA #$00           ; $c4de: a9 00     
            STA $88            ; $c4e0: 85 88     
            JMP __c1de         ; $c4e2: 4c de c1  

;-------------------------------------------------------------------------------
            LDA #$01           ; $c4e5: a9 01     
            STA $47            ; $c4e7: 85 47     
            JMP __c98a         ; $c4e9: 4c 8a c9  

;-------------------------------------------------------------------------------
__c4ec:     
            LDY $87            ; $c4ec: a4 87     
            LDA __c5d3,Y       ; $c4ee: b9 d3 c5  
            STA $00            ; $c4f1: 85 00     
            LDA __c5d4,Y       ; $c4f3: b9 d4 c5  
            STA $01            ; $c4f6: 85 01     
            LDY #$00           ; $c4f8: a0 00     
__c4fa:     
            LDA ($00),Y        ; $c4fa: b1 00     
            STA $024b,Y        ; $c4fc: 99 4b 02  
            INY                ; $c4ff: c8        
            CMP #$FF           ; $c500: c9 ff     
            BNE __c4fa         ; $c502: d0 f6     
            LDA ($00),Y        ; $c504: b1 00     
            BEQ __c509         ; $c506: f0 01     
            RTS                ; $c508: 60        

;-------------------------------------------------------------------------------
__c509:     
            LDA $87            ; $c509: a5 87     
            SEC                ; $c50b: 38        
            SBC #$02           ; $c50c: e9 02     
            ASL                ; $c50e: 0a        
            ASL                ; $c50f: 0a        
            TAY                ; $c510: a8        
            LDX #$10           ; $c511: a2 10     
__c513:     
            LDA __c688,Y       ; $c513: b9 88 c6  
            STA $0760,Y        ; $c516: 99 60 07  
            INY                ; $c519: c8        
            DEX                ; $c51a: ca        
            BNE __c513         ; $c51b: d0 f6     
            RTS                ; $c51d: 60        

;-------------------------------------------------------------------------------
__c51e:     
            LDA #$20           ; $c51e: a9 20     
            STA PPUADDR        ; $c520: 8d 06 20  
            LDA #$c0           ; $c523: a9 c0     
            STA PPUADDR        ; $c525: 8d 06 20  
            LDA #$17           ; $c528: a9 17     
            STA $00            ; $c52a: 85 00     
__c52c:     
            LDA #$1C           ; $c52c: a9 1c     
            STA $01            ; $c52e: 85 01     
            LDA #$2D           ; $c530: a9 2d     
            STA PPUDATA        ; $c532: 8d 07 20  
            STA PPUDATA        ; $c535: 8d 07 20  
            LDA #$20           ; $c538: a9 20     
__c53a:     
            STA PPUDATA        ; $c53a: 8d 07 20  
            DEC $01            ; $c53d: c6 01     
            BNE __c53a         ; $c53f: d0 f9     
            LDA #$2D           ; $c541: a9 2d     
            STA PPUDATA        ; $c543: 8d 07 20  
            STA PPUDATA        ; $c546: 8d 07 20  
            DEC $00            ; $c549: c6 00     
            BPL __c52c         ; $c54b: 10 df     
            RTS                ; $c54d: 60        

;-------------------------------------------------------------------------------
__c54e:     LDA #$23           ; $c54e: a9 23     
            STA PPUADDR        ; $c550: 8d 06 20  
            LDA #$c0           ; $c553: a9 c0     
            STA PPUADDR        ; $c555: 8d 06 20  
            LDY #$20           ; $c558: a0 20     
            LDA #$00           ; $c55a: a9 00     
__c55c:     STA PPUDATA        ; $c55c: 8d 07 20  
            DEY                ; $c55f: 88        
            BNE __c55c         ; $c560: d0 fa     
            LDA #$23           ; $c562: a9 23     
            STA PPUADDR        ; $c564: 8d 06 20  
            LDA #$d0           ; $c567: a9 d0     
            STA PPUADDR        ; $c569: 8d 06 20  
            LDA #$03           ; $c56c: a9 03     
            STA $00            ; $c56e: 85 00     
            LDA #$55           ; $c570: a9 55     
__c572:     LDY #$08           ; $c572: a0 08     
__c574:     STA PPUDATA        ; $c574: 8d 07 20  
            DEY                ; $c577: 88        
            BNE __c574         ; $c578: d0 fa     
            CLC                ; $c57a: 18        
            ADC #$55           ; $c57b: 69 55     
            DEC $00            ; $c57d: c6 00     
            BNE __c572         ; $c57f: d0 f1     
            LDA #$3F           ; $c581: a9 3f     
            STA PPUADDR        ; $c583: 8d 06 20  
            LDA #$00           ; $c586: a9 00     
            STA PPUADDR        ; $c588: 8d 06 20  
            LDY #$00           ; $c58b: a0 00     
__c58d:     LDA __c5b3,Y       ; $c58d: b9 b3 c5  
            STA PPUDATA        ; $c590: 8d 07 20  
            INY                ; $c593: c8        
            CPY #$20           ; $c594: c0 20     
            BNE __c58d         ; $c596: d0 f5     
            LDA #$23           ; $c598: a9 23     
            STA PPUADDR        ; $c59a: 8d 06 20  
            LDA #$e8           ; $c59d: a9 e8     
            STA PPUADDR        ; $c59f: 8d 06 20  
            LDA #$AA           ; $c5a2: a9 aa     
            STA PPUDATA        ; $c5a4: 8d 07 20  
            STA PPUDATA        ; $c5a7: 8d 07 20  
            STA PPUDATA        ; $c5aa: 8d 07 20  
            LDA #$22           ; $c5ad: a9 22     
            STA PPUDATA        ; $c5af: 8d 07 20  
            RTS                ; $c5b2: 60        

;-------------------------------------------------------------------------------
__c5b3:     ; Demo screen text is here
            .hex 0f 20 0f 06   ; $c5b3: 0f 20 0f 06   Data
            .hex 0f 06 0f 33   ; $c5b7: 0f 06 0f 33   Data
            .hex 0f 33 0f 27   ; $c5bb: 0f 33 0f 27   Data
            .hex 0f 17 0f 21   ; $c5bf: 0f 17 0f 21   Data
            .hex 0f 27 20 06   ; $c5c3: 0f 27 20 06   Data
            .hex 0f 11 20 33   ; $c5c7: 0f 11 20 33   Data
            .hex 0f 20 20 21   ; $c5cb: 0f 20 20 21   Data
            .hex 0f 09 20 17   ; $c5cf: 0f 09 20 17   Data
__c5d3:     
            .hex e7            ; $c5d3: e7            Data
__c5d4:
            .hex c5 ff c5 0e   ; $c5d4: c5 ff c5 0e   Data
            .hex c6 19 c6 28   ; $c5d8: c6 19 c6 28   Data
            .hex c6 32 c6 41   ; $c5dc: c6 32 c6 41   Data
            .hex c6 4c c6 5b   ; $c5e0: c6 4c c6 5b   Data
            .hex c6 66 c6 20   ; $c5e4: c6 66 c6 20   Data
            .hex e6 43 48 52   ; $c5e8: e6 43 48 52   Data
            .hex 41 43 54 45   ; $c5ec: 41 43 54 45   Data
            .hex 52 20 20 3b   ; $c5f0: 52 20 20 3b   Data
            .hex 20 20 4e 49   ; $c5f4: 20 20 4e 49   Data
            .hex 43 4b 4e 41   ; $c5f8: 43 4b 4e 41   Data
            .hex 4d 45 ff 21   ; $c5fc: 4d 45 ff 21   Data
            .hex 48 4f 49 4b   ; $c600: 48 4f 49 4b   Data
            .hex 41 4b 45 2e   ; $c604: 41 4b 45 2e   Data
            .hex 2e 2e 2e 2e   ; $c608: 2e 2e 2e 2e   Data
            .hex ff 00 21 53   ; $c60c: ff 00 21 53   Data
            .hex 5f 41 4b 41   ; $c610: 5f 41 4b 41   Data
            .hex 42 45 49 5f   ; $c614: 42 45 49 5f   Data
            .hex ff 21 a8 4d   ; $c618: ff 21 a8 4d   Data
            .hex 41 43 48 49   ; $c61c: 41 43 48 49   Data
            .hex 42 55 53 45   ; $c620: 42 55 53 45   Data
            .hex 2e 2e ff 00   ; $c624: 2e 2e ff 00   Data
            .hex 21 b3 5f 50   ; $c628: 21 b3 5f 50   Data
            .hex 49 4e 4b 59   ; $c62c: 49 4e 4b 59   Data
            .hex 5f ff 22 08   ; $c630: 5f ff 22 08   Data
            .hex c0 c1 c2 c3   ; $c634: c0 c1 c2 c3   Data
            .hex c4 c5 c6 c7   ; $c638: c4 c5 c6 c7   Data
            .hex 03 03 03 ff   ; $c63c: 03 03 03 ff   Data
            .hex 00 22 13 c8   ; $c640: 00 22 13 c8   Data
            .hex c3 c9 ca c5   ; $c644: c3 c9 ca c5   Data
            .hex c0 c7 c8 ff   ; $c648: c0 c7 c8 ff   Data
            .hex 22 68 4f 54   ; $c64c: 22 68 4f 54   Data
            .hex 4f 42 4f 4b   ; $c650: 4f 42 4f 4b   Data
            .hex 45 2e 2e 2e   ; $c654: 45 2e 2e 2e   Data
            .hex 2e ff 00 22   ; $c658: 2e ff 00 22   Data
            .hex 73 5f 47 55   ; $c65c: 73 5f 47 55   Data
            .hex 5a 55 54 41   ; $c660: 5a 55 54 41   Data
            .hex 5f ff 22 ad   ; $c664: 5f ff 22 ad   Data
            .hex 03 20 31 30   ; $c668: 03 20 31 30   Data
            .hex 20 50 54 53   ; $c66c: 20 50 54 53   Data
            .hex 00 22 ed 01   ; $c670: 00 22 ed 01   Data
            .hex 20 35 30 20   ; $c674: 20 35 30 20   Data
            .hex 50 54 53 00   ; $c678: 50 54 53 00   Data
            .hex 23 4c 23 24   ; $c67c: 23 4c 23 24   Data
            .hex 25 26 27 28   ; $c680: 25 26 27 28   Data
            .hex 29 2a 2b ff   ; $c684: 29 2a 2b ff   Data
__c688:     
            .hex 48 1c 40 26   ; $c688: 48 1c 40 26   Data
            .hex 48 1b 40 2e   ; $c68c: 48 1b 40 2e   Data
            .hex 50 1f 40 26   ; $c690: 50 1f 40 26   Data
            .hex 50 1d 40 2e   ; $c694: 50 1d 40 2e   Data
            .hex 60 1c 41 26   ; $c698: 60 1c 41 26   Data
            .hex 60 1b 41 2e   ; $c69c: 60 1b 41 2e   Data
            .hex 68 1f 41 26   ; $c6a0: 68 1f 41 26   Data
            .hex 68 1d 41 2e   ; $c6a4: 68 1d 41 2e   Data
            .hex 78 1c 42 26   ; $c6a8: 78 1c 42 26   Data
            .hex 78 1b 42 2e   ; $c6ac: 78 1b 42 2e   Data
            .hex 80 1f 42 26   ; $c6b0: 80 1f 42 26   Data
            .hex 80 1d 42 2e   ; $c6b4: 80 1d 42 2e   Data
            .hex 90 1c 43 26   ; $c6b8: 90 1c 43 26   Data
            .hex 90 1b 43 2e   ; $c6bc: 90 1b 43 2e   Data
            .hex 98 1f 43 26   ; $c6c0: 98 1f 43 26   Data
            .hex 98 1d 43 2e   ; $c6c4: 98 1d 43 2e   Data
            .hex a4 88 b9 d7   ; $c6c8: a4 88 b9 d7   Data
            .hex c6 85 10 b9   ; $c6cc: c6 85 10 b9   Data
            .hex d8 c6 85 11   ; $c6d0: d8 c6 85 11   Data
            .hex 6c 10 00 dd   ; $c6d4: 6c 10 00 dd   Data
            .hex c6 28 c7 8d   ; $c6d8: c6 28 c7 8d   Data
            .hex c7 a0 00 b9   ; $c6dc: c7 a0 00 b9   Data
            .hex 0e c9 99 4b   ; $c6e0: 0e c9 99 4b   Data
            .hex 02 c8 c9 ff   ; $c6e4: 02 c8 c9 ff   Data
            .hex d0 f5 a9 ff   ; $c6e8: d0 f5 a9 ff   Data
            .hex 85 1a a9 00   ; $c6ec: 85 1a a9 00   Data
            .hex 85 1b 85 89   ; $c6f0: 85 1b 85 89   Data
            .hex 85 8a a9 f4   ; $c6f4: 85 8a a9 f4   Data
            .hex 8d 74 02 a9   ; $c6f8: 8d 74 02 a9   Data
            .hex a8 8d 76 02   ; $c6fc: a8 8d 76 02   Data
            .hex a9 01 8d 8c   ; $c700: a9 01 8d 8c   Data
            .hex 02 a9 20 8d   ; $c704: 02 a9 20 8d   Data
            .hex 92 02 a9 00   ; $c708: 92 02 a9 00   Data
            .hex a8 99 1e 00   ; $c70c: a8 99 1e 00   Data
            .hex c8 c0 14 d0   ; $c710: c8 c0 14 d0   Data
            .hex f8 a8 99 78   ; $c714: f8 a8 99 78   Data
            .hex 02 c8 c0 14   ; $c718: 02 c8 c0 14   Data
            .hex d0 f8 20 5c   ; $c71c: d0 f8 20 5c   Data
            .hex da e6 88 e6   ; $c720: da e6 88 e6   Data
            .hex 88 4c de c1   ; $c724: 88 4c de c1   Data
            .hex 20 12 c8 20   ; $c728: 20 12 c8 20   Data
            .hex ee c8 ad 74   ; $c72c: ee c8 ad 74   Data
            .hex 02 c9 e0 f0   ; $c730: 02 c9 e0 f0   Data
            .hex 0c c9 d1 f0   ; $c734: 0c c9 d1 f0   Data
            .hex 08 c9 c2 f0   ; $c738: 08 c9 c2 f0   Data
            .hex 04 c9 b3 d0   ; $c73c: 04 c9 b3 d0   Data
            .hex 03 20 de c7   ; $c740: 03 20 de c7   Data
            .hex ad 74 02 c9   ; $c744: ad 74 02 c9   Data
            .hex 40 f0 03 4c   ; $c748: 40 f0 03 4c   Data
            .hex de c1 a0 00   ; $c74c: de c1 a0 00   Data
            .hex a9 00 99 1e   ; $c750: a9 00 99 1e   Data
            .hex 00 a9 c0 99   ; $c754: 00 a9 c0 99   Data
            .hex 1f 00 c8 c8   ; $c758: 1f 00 c8 c8   Data
            .hex c8 c8 c0 10   ; $c75c: c8 c8 c0 10   Data
            .hex d0 ee a9 01   ; $c760: d0 ee a9 01   Data
            .hex 85 1a a9 50   ; $c764: 85 1a a9 50   Data
            .hex 85 1b a9 01   ; $c768: 85 1b a9 01   Data
            .hex 8d 93 02 8d   ; $c76c: 8d 93 02 8d   Data
            .hex 94 02 8d 95   ; $c770: 94 02 8d 95   Data
            .hex 02 8d 96 02   ; $c774: 02 8d 96 02   Data
            .hex a9 00 85 89   ; $c778: a9 00 85 89   Data
            .hex a9 22 8d 4b   ; $c77c: a9 22 8d 4b   Data
            .hex 02 a9 20 8d   ; $c780: 02 a9 20 8d   Data
            .hex 4d 02 e6 88   ; $c784: 4d 02 e6 88   Data
            .hex e6 88 4c de   ; $c788: e6 88 4c de   Data
            .hex c1 a5 8a f0   ; $c78c: c1 a5 8a f0   Data
            .hex 47 20 64 c8   ; $c790: 47 20 64 c8   Data
            .hex c6 8a f0 03   ; $c794: c6 8a f0 03   Data
            .hex 4c de c1 a0   ; $c798: 4c de c1 a0   Data
            .hex 00 b9 8d 02   ; $c79c: 00 b9 8d 02   Data
            .hex 29 e0 d0 03   ; $c7a0: 29 e0 d0 03   Data
            .hex c8 d0 f6 a9   ; $c7a4: c8 d0 f6 a9   Data
            .hex 00 99 8d 02   ; $c7a8: 00 99 8d 02   Data
            .hex a9 00 99 93   ; $c7ac: a9 00 99 93   Data
            .hex 02 98 0a 0a   ; $c7b0: 02 98 0a 0a   Data
            .hex a8 a9 00 99   ; $c7b4: a8 a9 00 99   Data
            .hex 78 02 99 7a   ; $c7b8: 78 02 99 7a   Data
            .hex 02 99 1e 00   ; $c7bc: 02 99 1e 00   Data
            .hex 99 1f 00 a9   ; $c7c0: 99 1f 00 a9   Data
            .hex a8 8d 76 02   ; $c7c4: a8 8d 76 02   Data
            .hex a5 89 c9 04   ; $c7c8: a5 89 c9 04   Data
            .hex f0 03 4c de   ; $c7cc: f0 03 4c de   Data
            .hex c1 a9 01 85   ; $c7d0: c1 a9 01 85   Data
            .hex 47 4c 8a c9   ; $c7d4: 47 4c 8a c9   Data
            .hex 20 12 c8 4c   ; $c7d8: 20 12 c8 4c   Data
            .hex de c1 a0 00   ; $c7dc: de c1 a0 00   Data
            .hex 84 00 b9 78   ; $c7e0: 84 00 b9 78   Data
            .hex 02 f0 08 e6   ; $c7e4: 02 f0 08 e6   Data
            .hex 00 c8 c8 c8   ; $c7e8: 00 c8 c8 c8   Data
            .hex c8 d0 f3 a9   ; $c7ec: c8 d0 f3 a9   Data
            .hex f4 99 78 02   ; $c7f0: f4 99 78 02   Data
            .hex a9 a8 99 7a   ; $c7f4: a9 a8 99 7a   Data
            .hex 02 a9 ff 99   ; $c7f8: 02 a9 ff 99   Data
            .hex 1e 00 a9 00   ; $c7fc: 1e 00 a9 00   Data
            .hex 99 1f 00 a4   ; $c800: 99 1f 00 a4   Data
            .hex 00 a5 89 99   ; $c804: 00 a5 89 99   Data
            .hex 93 02 a9 0c   ; $c808: 93 02 a9 0c   Data
            .hex 99 8d 02 e6   ; $c80c: 99 8d 02 e6   Data
            .hex 89 60 20 a5   ; $c810: 89 60 20 a5   Data
            .hex e9 20 64 c8   ; $c814: e9 20 64 c8   Data
            .hex 20 30 c9 20   ; $c818: 20 30 c9 20   Data
            .hex 21 c8 4c 5c   ; $c81c: 21 c8 4c 5c   Data
            .hex da a5 1a 10   ; $c820: da a5 1a 10   Data
            .hex 01 60 ad 74   ; $c824: 01 60 ad 74   Data
            .hex 02 18 69 08   ; $c828: 02 18 69 08   Data
            .hex 85 00 a0 00   ; $c82c: 85 00 a0 00   Data
            .hex 84 01 b9 78   ; $c830: 84 01 b9 78   Data
            .hex 02 f0 04 c5   ; $c834: 02 f0 04 c5   Data
            .hex 00 90 0b e6   ; $c838: 00 90 0b e6   Data
            .hex 01 c8 c8 c8   ; $c83c: 01 c8 c8 c8   Data
            .hex c8 c0 10 d0   ; $c840: c8 c0 10 d0   Data
            .hex ed 60 a4 89   ; $c844: ed 60 a4 89   Data
            .hex e6 89 a9 40   ; $c848: e6 89 a9 40   Data
            .hex 85 8a b9 24   ; $c84c: 85 8a b9 24   Data
            .hex c9 a4 01 99   ; $c850: c9 a4 01 99   Data
            .hex 8d 02 a9 00   ; $c854: 8d 02 a9 00   Data
            .hex 99 93 02 a9   ; $c858: 99 93 02 a9   Data
            .hex 00 8d 8c 02   ; $c85c: 00 8d 8c 02   Data
            .hex 8d 76 02 60   ; $c860: 8d 76 02 60   Data
            .hex a5 1e 85 00   ; $c864: a5 1e 85 00   Data
            .hex a5 1f 85 01   ; $c868: a5 1f 85 01   Data
            .hex a0 00 b9 22   ; $c86c: a0 00 b9 22   Data
            .hex 00 99 1e 00   ; $c870: 00 99 1e 00   Data
            .hex b9 23 00 99   ; $c874: b9 23 00 99   Data
            .hex 1f 00 c8 c8   ; $c878: 1f 00 c8 c8   Data
            .hex c8 c8 c0 0c   ; $c87c: c8 c8 c0 0c   Data
            .hex d0 ec a5 00   ; $c880: d0 ec a5 00   Data
            .hex 85 2a a5 01   ; $c884: 85 2a a5 01   Data
            .hex 85 2b ad 78   ; $c888: 85 2b ad 78   Data
            .hex 02 85 00 ad   ; $c88c: 02 85 00 ad   Data
            .hex 79 02 85 01   ; $c890: 79 02 85 01   Data
            .hex ad 7a 02 85   ; $c894: ad 7a 02 85   Data
            .hex 02 ad 7b 02   ; $c898: 02 ad 7b 02   Data
            .hex 85 03 a0 00   ; $c89c: 85 03 a0 00   Data
            .hex b9 7c 02 99   ; $c8a0: b9 7c 02 99   Data
            .hex 78 02 c8 c0   ; $c8a4: 78 02 c8 c0   Data
            .hex 0c d0 f5 a5   ; $c8a8: 0c d0 f5 a5   Data
            .hex 00 8d 84 02   ; $c8ac: 00 8d 84 02   Data
            .hex a5 01 8d 85   ; $c8b0: a5 01 8d 85   Data
            .hex 02 a5 02 8d   ; $c8b4: 02 a5 02 8d   Data
            .hex 86 02 a5 03   ; $c8b8: 86 02 a5 03   Data
            .hex 8d 87 02 ad   ; $c8bc: 8d 87 02 ad   Data
            .hex 8d 02 85 00   ; $c8c0: 8d 02 85 00   Data
            .hex a0 00 b9 8e   ; $c8c4: a0 00 b9 8e   Data
            .hex 02 99 8d 02   ; $c8c8: 02 99 8d 02   Data
            .hex c8 c0 03 d0   ; $c8cc: c8 c0 03 d0   Data
            .hex f5 a5 00 8d   ; $c8d0: f5 a5 00 8d   Data
            .hex 90 02 ad 93   ; $c8d4: 90 02 ad 93   Data
            .hex 02 85 00 a0   ; $c8d8: 02 85 00 a0   Data
            .hex 00 b9 94 02   ; $c8dc: 00 b9 94 02   Data
            .hex 99 93 02 c8   ; $c8e0: 99 93 02 c8   Data
            .hex c0 03 d0 f5   ; $c8e4: c0 03 d0 f5   Data
            .hex a5 00 8d 96   ; $c8e8: a5 00 8d 96   Data
            .hex 02 60 a5 4b   ; $c8ec: 02 60 a5 4b   Data
            .hex 29 07 f0 01   ; $c8f0: 29 07 f0 01   Data
            .hex 60 a2 00 a0   ; $c8f4: 60 a2 00 a0   Data
            .hex 00 a5 4b 29   ; $c8f8: 00 a5 4b 29   Data
            .hex 08 f0 02 a0   ; $c8fc: 08 f0 02 a0   Data
            .hex 04 b9 28 c9   ; $c900: 04 b9 28 c9   Data
            .hex 9d 4b 02 e8   ; $c904: 9d 4b 02 e8   Data
            .hex c8 e0 04 d0   ; $c908: c8 e0 04 d0   Data
            .hex f4 60 22 ad   ; $c90c: f4 60 22 ad   Data
            .hex 2d 2d 2d 2d   ; $c910: 2d 2d 2d 2d   Data
            .hex 2d 2d 2d 2d   ; $c914: 2d 2d 2d 2d   Data
            .hex 00 22 ed 2d   ; $c918: 00 22 ed 2d   Data
            .hex 2d 2d 2d 2d   ; $c91c: 2d 2d 2d 2d   Data
            .hex 2d 2d 2d ff   ; $c920: 2d 2d 2d ff   Data
            .hex 2d 2f 32 34   ; $c924: 2d 2f 32 34   Data
            .hex 22 c7 20 ff   ; $c928: 22 c7 20 ff   Data
            .hex 22 c7 01 ff   ; $c92c: 22 c7 01 ff   Data
            .hex a2 00 a5 1a   ; $c930: a2 00 a5 1a   Data
            .hex 30 02 a2 0a   ; $c934: 30 02 a2 0a   Data
            .hex 86 00 e6 b7   ; $c938: 86 00 e6 b7   Data
            .hex a5 b7 29 07   ; $c93c: a5 b7 29 07   Data
            .hex 18 65 00 a8   ; $c940: 18 65 00 a8   Data
            .hex b9 76 c9 8d   ; $c944: b9 76 c9 8d   Data
            .hex 8c 02 a5 4b   ; $c948: 8c 02 a5 4b   Data
            .hex 29 07 f0 01   ; $c94c: 29 07 f0 01   Data
            .hex 60 a5 4b 29   ; $c950: 60 a5 4b 29   Data
            .hex 08 f0 02 a9   ; $c954: 08 f0 02 a9   Data
            .hex 01 18 65 00   ; $c958: 01 18 65 00   Data
            .hex 69 08 a8 b9   ; $c95c: 69 08 a8 b9   Data
            .hex 76 c9 85 00   ; $c960: 76 c9 85 00   Data
            .hex a0 00 b9 8d   ; $c964: a0 00 b9 8d   Data
            .hex 02 f0 05 a5   ; $c968: 02 f0 05 a5   Data
            .hex 00 99 8d 02   ; $c96c: 00 99 8d 02   Data
            .hex c8 c0 04 d0   ; $c970: c8 c0 04 d0   Data
            .hex f1 60 04 04   ; $c974: f1 60 04 04   Data
            .hex 04 05 05 04   ; $c978: 04 05 05 04   Data
            .hex 01 01 0c 0d   ; $c97c: 01 01 0c 0d   Data
            .hex 08 08 08 09   ; $c980: 08 08 08 09   Data
            .hex 09 08 01 01   ; $c984: 09 08 01 01   Data
            .hex 1e 1f         ; $c988: 1e 1f         Data
__c98a:     
            LDA #$08           ; $c98a: a9 08     
            STA PPUCTRL        ; $c98c: 8d 00 20  
            STA $43            ; $c98f: 85 43     
__c991:     
            LDA PPUSTATUS      ; $c991: ad 02 20  
            BPL __c991         ; $c994: 10 fb     
            LDA #$00           ; $c996: a9 00     
            STA PPUMASK        ; $c998: 8d 01 20  
            STA $3F            ; $c99b: 85 3f     
            STA $46            ; $c99d: 85 46     
            STA $69            ; $c99f: 85 69     
            STA $4A            ; $c9a1: 85 4a     
            JSR __e2ff         ; $c9a3: 20 ff e2  
            JSR __e47c         ; $c9a6: 20 7c e4  
            JSR __e379         ; $c9a9: 20 79 e3  
            LDA $48            ; $c9ac: a5 48     
            BEQ __c9b6         ; $c9ae: f0 06     
            LDA #$01           ; $c9b0: a9 01     
            STA $67            ; $c9b2: 85 67     
            BNE __c9cd         ; $c9b4: d0 17     
__c9b6:     
            LDA #$00           ; $c9b6: a9 00     
            TAY                ; $c9b8: a8        
Write_Level:     
            STA $0067,Y        ; $c9b9: 99 67 00  
            INY                ; $c9bc: c8        
            CPY #$20           ; $c9bd: c0 20     
            BNE Write_Level    ; $c9bf: d0 f8     
            LDA #$03           ; $c9c1: a9 03     
            STA $67            ; $c9c3: 85 67     
            STA $77            ; $c9c5: 85 77     
            STA $0600          ; $c9c7: 8d 00 06  
            STA $0601          ; $c9ca: 8d 01 06  
__c9cd:     
            LDA #$FF           ; $c9cd: a9 ff     
            STA Current_Level  ; $c9cf: 85 68     
            STA $78            ; $c9d1: 85 78     
            STA $0245          ; $c9d3: 8d 45 02  
            LDA #$88           ; $c9d6: a9 88     
            STA $43            ; $c9d8: 85 43     
            STA PPUCTRL        ; $c9da: 8d 00 20  
__c9dd:     
            LDA #$01           ; $c9dd: a9 01     
            STA $40            ; $c9df: 85 40     
__c9e1:     
            LDA $40            ; $c9e1: a5 40     
            BNE __c9e1         ; $c9e3: d0 fc     
            LDA $48            ; $c9e5: a5 48     
            BEQ __c9f6         ; $c9e7: f0 0d     
            LDA $4D            ; $c9e9: a5 4d     
            AND #$0C           ; $c9eb: 29 0c     
            BEQ __c9f6         ; $c9ed: f0 07     
            LDA #$02           ; $c9ef: a9 02     
            STA $3F            ; $c9f1: 85 3f     
            JMP __c168         ; $c9f3: 4c 68 c1  

;-------------------------------------------------------------------------------
__c9f6:     LDA $4C            ; $c9f6: a5 4c     
            BEQ __c9fe         ; $c9f8: f0 04     
            DEC $4C            ; $c9fa: c6 4c     
            BNE __c9dd         ; $c9fc: d0 df     
__c9fe:     LDY $3F            ; $c9fe: a4 3f     
            LDA __ca0d,Y       ; $ca00: b9 0d ca  
            STA $10            ; $ca03: 85 10     
            LDA __ca0e,Y       ; $ca05: b9 0e ca  
            STA $11            ; $ca08: 85 11     
            JMP ($0010)        ; $ca0a: 6c 10 00  

;-------------------------------------------------------------------------------
__ca0d:     .hex 35            ; $ca0d: 35            Data
__ca0e:     .hex ce 9d ca 1f   ; $ca0e: ce 9d ca 1f   Data
            .hex ca 0f cc 3c   ; $ca12: ca 0f cc 3c   Data
            .hex cc 61 cd e6   ; $ca16: cc 61 cd e6   Data
            .hex cc 55 e6 4b   ; $ca1a: cc 55 e6 4b   Data
            .hex e7 ad 0f 06   ; $ca1e: e7 ad 0f 06   Data
            .hex f0 03 4c dd   ; $ca22: f0 03 4c dd   Data
            .hex c9            ; $ca26: c9            Data
__ca27:     .hex a5 4d 29 08   ; $ca27: a5 4d 29 08   Data
            .hex c5 49 f0 38   ; $ca2b: c5 49 f0 38   Data
            .hex 85 49 a5 49   ; $ca2f: 85 49 a5 49   Data
            .hex f0 32 e6 4a   ; $ca33: f0 32 e6 4a   Data
            .hex a2 22 a5 47   ; $ca37: a2 22 a5 47   Data
            .hex 25 46 f0 02   ; $ca3b: 25 46 f0 02   Data
            .hex a2 2a         ; $ca3f: a2 2a         Data
__ca41:     .hex 8e 4b 02 a9   ; $ca41: 8e 4b 02 a9   Data
            .hex 37 8d 4c 02   ; $ca45: 37 8d 4c 02   Data
            .hex a2 06 a0 00   ; $ca49: a2 06 a0 00   Data
            .hex a5 4a 29 01   ; $ca4d: a5 4a 29 01   Data
            .hex f0 05 a2 00   ; $ca51: f0 05 a2 00   Data
            .hex 8d 0f 06      ; $ca55: 8d 0f 06      Data
__ca58:     LDA __ca91,X       ; $ca58: bd 91 ca  
            STA $024d,Y        ; $ca5b: 99 4d 02  
            INX                ; $ca5e: e8        
            INY                ; $ca5f: c8        
            CPY #$06           ; $ca60: c0 06     
            BNE __ca58         ; $ca62: d0 f4     
            JMP __c9dd         ; $ca64: 4c dd c9  

;-------------------------------------------------------------------------------
__ca67:     .hex a5 4a 29 01   ; $ca67: a5 4a 29 01   Data
            .hex f0 03 4c dd   ; $ca6b: f0 03 4c dd   Data
            .hex c9            ; $ca6f: c9            Data
__ca70:     JSR __d0ef         ; $ca70: 20 ef d0  
            JSR __dedf         ; $ca73: 20 df de  
            JSR __d2fb         ; $ca76: 20 fb d2  
            JSR __d8f9         ; $ca79: 20 f9 d8  
            JSR __d4c2         ; $ca7c: 20 c2 d4  
            JSR __d937         ; $ca7f: 20 37 d9  
            JSR __d8c9         ; $ca82: 20 c9 d8  
            JSR __ddc9         ; $ca85: 20 c9 dd  
            JSR __d20f         ; $ca88: 20 0f d2  
            JSR __d9ab         ; $ca8b: 20 ab d9  
            JMP __c9dd         ; $ca8e: 4c dd c9  

;-------------------------------------------------------------------------------
__ca91:     ; Pretty sure the pause text is here?
            .hex 50 41 55 53   ; $ca91: 50 41 55 53   Data
            .hex 45 ff 2d 2d   ; $ca95: 45 ff 2d 2d   Data
            .hex 2d 2d 2d ff   ; $ca99: 2d 2d 2d ff   Data
            .hex a5 87 f0 03   ; $ca9d: a5 87 f0 03   Data
            .hex 4c 1a cb      ; $caa1: 4c 1a cb      Data
__caa4:     .hex a9 60 85 00   ; $caa4: a9 60 85 00   Data
            .hex a9 07 85 01   ; $caa8: a9 07 85 01   Data
            .hex a5 48 d0 6a   ; $caac: a5 48 d0 6a   Data
            .hex a9 02 85 04   ; $cab0: a9 02 85 04   Data
            .hex a0 00 84 05   ; $cab4: a0 00 84 05   Data
            .hex 84 06 84 07   ; $cab8: 84 06 84 07   Data
__cabc:     LDX $06            ; $cabc: a6 06     
            LDA __cbf6,X       ; $cabe: bd f6 cb  
            STA $02            ; $cac1: 85 02     
            LDA __cbf7,X       ; $cac3: bd f7 cb  
            STA $03            ; $cac6: 85 03     
            LDX $07            ; $cac8: a6 07     
            LDA __cbfc,X       ; $caca: bd fc cb  
            STA $08            ; $cacd: 85 08     
__cacf:     .hex a5 03 91 00   ; $cacf: a5 03 91 00   Data
            .hex a6            ; $cad3: a6            Data
__cad4:     .hex 05 bd d2 cb   ; $cad4: 05 bd d2 cb   Data
            .hex c8 91 00 bd   ; $cad8: c8 91 00 bd   Data
            .hex e4 cb c8 91   ; $cADC: e4 cb c8 91   Data
            .hex 00 a5 02 c8   ; $cae0: 00 a5 02 c8   Data
            .hex 91 00 a5 02   ; $cae4: 91 00 a5 02   Data
            .hex 18 69 08 85   ; $cae8: 18 69 08 85   Data
            .hex 02 c8 e6 05   ; $caec: 02 c8 e6 05   Data
            .hex c6 08 d0 db   ; $caf0: c6 08 d0 db   Data
            .hex e6 06 e6 06   ; $caf4: e6 06 e6 06   Data
            .hex e6 07 a5 69   ; $caf8: e6 07 a5 69   Data
            .hex d0 04 a5 68   ; $cafc: d0 04 a5 68   Data
            .hex d0 18         ; $cb00: d0 18         Data
__cb02:     .hex c6 04 f0 04   ; $cb02: c6 04 f0 04   Data
            .hex 10 b4 30 10   ; $cb06: 10 b4 30 10   Data
__cb0a:     LDA $47            ; $cb0a: a5 47     
            BEQ __cb1a         ; $cb0c: f0 0c     
            LDA $46            ; $cb0e: a5 46     
            BEQ __cabc         ; $cb10: f0 aa     
            INC $05            ; $cb12: e6 05     
            INC $05            ; $cb14: e6 05     
            INC $05            ; $cb16: e6 05     
            BNE __cabc         ; $cb18: d0 a2     
__cb1a:     LDA $87            ; $cb1a: a5 87     
            CMP #$c0           ; $cb1c: c9 c0     
            BNE __cb23         ; $cb1e: d0 03     
            JMP __cbb2         ; $cb20: 4c b2 cb  

;-------------------------------------------------------------------------------
__cb23:     INC $87            ; $cb23: e6 87     
            LDA $87            ; $cb25: a5 87     
            CMP #$78           ; $cb27: c9 78     
            BEQ __cb2e         ; $cb29: f0 03     
            JMP __cbcf         ; $cb2b: 4c cf cb  

;-------------------------------------------------------------------------------
__cb2e:     
            LDA #$A8           ; $cb2e: a9 a8
            STA $1C            ; $cb30: 85 1c     
            LDA #$60           ; $cb32: a9 60     
            STA $1A            ; $cb34: 85 1a     
            STA $1E            ; $cb36: 85 1e     
            STA $22            ; $cb38: 85 22     
            LDA #$58           ; $cb3a: a9 58     
            STA $26            ; $cb3c: 85 26     
            STA $20            ; $cb3e: 85 20     
            LDA #$68           ; $cb40: a9 68     
            STA $2A            ; $cb42: 85 2a     
            LDA #$70           ; $cb44: a9 70     
            STA $24            ; $cb46: 85 24     
            STA $28            ; $cb48: 85 28     
            STA $2C            ; $cb4a: 85 2c     
            LDA #$00           ; $cb4c: a9 00     
            TAY                ; $cb4e: a8        
__cb4f:     STA $0778,Y        ; $cb4f: 99 78 07  
            INY                ; $cb52: c8        
            CPY #$24           ; $cb53: c0 24     
            BNE __cb4f         ; $cb55: d0 f8     
            LDA $47            ; $cb57: a5 47     
            AND $46            ; $cb59: 25 46     
            BEQ __cb5f         ; $cb5b: f0 02     
            LDA #$08           ; $cb5d: a9 08     
__cb5f:     STA $00            ; $cb5f: 85 00     
            LDA $67            ; $cb61: a5 67     
            SEC                ; $cb63: 38        
            SBC #$01           ; $cb64: e9 01     
            ASL                ; $cb66: 0a        
            TAY                ; $cb67: a8        
            LDA __cc07,Y       ; $cb68: b9 07 cc  
            CLC                ; $cb6b: 18        
            ADC $00            ; $cb6c: 65 00     
            STA $00            ; $cb6e: 85 00     
            LDA __cc08,Y       ; $cb70: b9 08 cc  
            STA $01            ; $cb73: 85 01     
            LDA $00            ; $cb75: a5 00     
            STA $024b          ; $cb77: 8d 4b 02  
            LDA $01            ; $cb7a: a5 01     
            STA $024c          ; $cb7c: 8d 4c 02  
            LDA #$2D           ; $cb7f: a9 2d     
            STA $024d          ; $cb81: 8d 4d 02  
            STA $024e          ; $cb84: 8d 4e 02  
            LDA #$00           ; $cb87: a9 00     
            .hex 8d 4f         ; $cb89: 8d 4f     Suspected data
__cb8b:     .hex 02 a5 00 8d   ; $cb8b: 02 a5 00 8d   Data
            .hex 50 02 a5 01   ; $cb8f: 50 02 a5 01   Data
            .hex 18 69 20 8d   ; $cb93: 18 69 20 8d   Data
            .hex 51 02 a9 2d   ; $cb97: 51 02 a9 2d   Data
            .hex 8d 52 02 8d   ; $cb9b: 8d 52 02 8d   Data
            .hex 53 02 a9 ff   ; $cb9f: 53 02 a9 ff   Data
            .hex 8d 54 02 20   ; $cba3: 8d 54 02 20   Data
            .hex f9 d8 20 37   ; $cba7: f9 d8 20 37   Data
            .hex d9 20 ab d9   ; $cbab: d9 20 ab d9   Data
            .hex 4c cf cb      ; $cbaf: 4c cf cb      Data
__cbb2:     LDA $0600          ; $cbb2: ad 00 06  
            ORA $0601          ; $cbb5: 0d 01 06  
            BNE __cbcf         ; $cbb8: d0 15     
            LDA $48            ; $cbba: a5 48     
            BNE __cbcb         ; $cbbc: d0 0d     
            LDA #$00           ; $cbbe: a9 00     
            STA $69            ; $cbc0: 85 69     
            TAY                ; $cbc2: a8        
__cbc3:     STA $0760,Y        ; $cbc3: 99 60 07  
            INY                ; $cbc6: c8        
            CPY #$a0           ; $cbc7: c0 a0     
            BNE __cbc3         ; $cbc9: d0 f8     
__cbcb:     LDA #$04           ; $cbcb: a9 04     
            STA $3F            ; $cbcd: 85 3f     
__cbcf:     JMP __c9dd         ; $cbcf: 4c dd c9  

;-------------------------------------------------------------------------------
__cbd2:     .hex c6 c3 c1 ba   ; $cbd2: c6 c3 c1 ba   Data
            .hex c7 bb b0 b1   ; $cbd6: c7 bb b0 b1   Data
            .hex b2 b3 b4 b5   ; $cbda: b2 b3 b4 b5   Data
            .hex b6 b7 b4 b8   ; $cbde: b6 b7 b4 b8   Data
            .hex b9 b6         ; $cbe2: b9 b6         Data
__cbe4:     .hex 00 00 00 00   ; $cbe4: 00 00 00 00   Data
            .hex 00 00 02 02   ; $cbe8: 00 00 02 02   Data
            .hex 02 02 02 02   ; $cbec: 02 02 02 02   Data
            .hex 02 02 02 02   ; $cbf0: 02 02 02 02   Data
            .hex 02 02         ; $cbf4: 02 02         Data
__cbf6:     .hex 44            ; $cbf6: 44            Data
__cbf7:     .hex 88 44 60 50   ; $cbf7: 88 44 60 50   Data
            .hex 70            ; $cbfb: 70            Data
__cbfc:     .hex 06 06 03 c0   ; $cbfc: 06 06 03 c0   Data
            .hex c1 c2 c3 c4   ; $cc00: c1 c2 c3 c4   Data
            .hex c5 c3 c6      ; $cc04: c5 c3 c6      Data
__cc07:     .hex 23            ; $cc07: 23            Data
__cc08:     .hex 17 23 19 23   ; $cc08: 17 23 19 23   Data
            .hex 1b 23 57 e6   ; $cc0c: 1b 23 57 e6   Data
            .hex da a9 28 c5   ; $cc10: da a9 28 c5   Data
            .hex da d0 16 a9   ; $cc14: da d0 16 a9   Data
            .hex 02 85 da a9   ; $cc18: 02 85 da a9   Data
            .hex 04 85 3f a9   ; $cc1c: 04 85 3f a9   Data
            .hex 08 a2 fe      ; $cc20: 08 a2 fe      Data
__cc23:     INX                ; $cc23: e8        
            INX                ; $cc24: e8        
            CMP $b8,X          ; $cc25: d5 b8     
            BNE __cc23         ; $cc27: d0 fa     
            LDA #$06           ; $cc29: a9 06     
            STA $b8,X          ; $cc2b: 95 b8     
__cc2d:     .hex 20 c9 dd 20   ; $cc2d: 20 c9 dd 20   Data
            .hex 7f d8 20 37   ; $cc31: 7f d8 20 37   Data
            .hex d9 20 ab d9   ; $cc35: d9 20 ab d9   Data
            .hex 4c dd c9 a5   ; $cc39: 4c dd c9 a5   Data
            .hex 87 d0 23 c6   ; $cc3d: 87 d0 23 c6   Data
            .hex db d0 13 e6   ; $cc41: db d0 13 e6   Data
            .hex 87 a9 0a 85   ; $cc45: 87 a9 0a 85   Data
            .hex db 8d 03 06   ; $cc49: db 8d 03 06   Data
            .hex a9 00 aa      ; $cc4d: a9 00 aa      Data
__cc50:     STA $1E,X          ; $cc50: 95 1e     
            INX                ; $cc52: e8        
            CPX #$14           ; $cc53: e0 14     
            BNE __cc50         ; $cc55: d0 f9     
__cc57:     .hex 20 c9 dd 20   ; $cc57: 20 c9 dd 20   Data
            .hex 37 d9 20 ab   ; $cc5b: 37 d9 20 ab   Data
            .hex d9 4c dd c9   ; $cc5f: d9 4c dd c9   Data
__cc63:     .hex c6 db 10 0f   ; $cc63: c6 db 10 0f   Data
            .hex a9 0a 85 db   ; $cc67: a9 0a 85 db   Data
            .hex a5            ; $cc6b: a5            Data
__cc6c:     .hex 32 18 69 01   ; $cc6c: 32 18 69 01   Data
            .hex 85 32 c9 1e   ; $cc70: 85 32 c9 1e   Data
            .hex f0 09         ; $cc74: f0 09         Data
__cc76:     JSR __ddc9         ; $cc76: 20 c9 dd  
            JSR __d9ab         ; $cc79: 20 ab d9  
            JMP __c9dd         ; $cc7c: 4c dd c9  

;-------------------------------------------------------------------------------
; This code gets triggered when the game switches to the Ready (and Game Over) screen after Pac-Man dies.
__cc7f:     
            LDA $48            ; $cc7f: a5 48 
            BNE $CCBF          ; $cc81: d0 3c
            DEC $67            ; $cc83: c6 67 
            BNE __cc94          ; $cc85: d0 0d
            LDA #$00           ; $cc87: a9 00 
            STA $87            ; $cc89: 85 87
            STA $69            ; $cc8b: 85 69 
            LDA #$0A           ; $cc8d: a9 0a
            STA $3F            ; $cc8f: 85 3f 
            JMP __c9dd          ; $cc91: 4c dd c9
__cc94:     
            LDA #$00           ; $cc94: a9 00     
            STA $3F            ; $cc96: 85 3f     
            LDA #$01           ; $cc98: a9 01     
            STA $69            ; $cc9a: 85 69     
            LDA $47            ; $cc9c: a5 47     
            BEQ __cca4         ; $cc9e: f0 04     
            LDA $77            ; $cca0: a5 77     
            BNE __ccca         ; $cca2: d0 26     
__cca4:     LDA $67            ; $cca4: a5 67     
            BNE __cce3         ; $cca6: d0 3b     
            STA $69            ; $cca8: 85 69     
            LDA $46            ; $ccaa: a5 46     
            BEQ __ccbf         ; $ccac: f0 11     
            LDX #$0F           ; $ccae: a2 0f     
__ccb0:     LDA $67,X          ; $ccb0: b5 67     
            STA $00            ; $ccb2: 85 00     
            LDA $77,X          ; $ccb4: b5 77     
            STA $67,X          ; $ccb6: 95 67     
            LDA $00            ; $ccb8: a5 00     
            STA $77,X          ; $ccba: 95 77     
            DEX                ; $ccbc: ca        
            BPL __ccb0         ; $ccbd: 10 f1     
__ccbf:     LDA #$00           ; $ccbf: a9 00     
            STA $46            ; $ccc1: 85 46     
            LDA #$00           ; $ccc3: a9 00     
            STA $3F            ; $ccc5: 85 3f     
            JMP __c168         ; $ccc7: 4c 68 c1  

;-------------------------------------------------------------------------------
__ccca:     LDX #$0F           ; $ccca: a2 0f     
__cccc:     LDA $67,X          ; $cccc: b5 67     
            STA $00            ; $ccce: 85 00     
            LDA $77,X          ; $ccd0: b5 77     
            STA $67,X          ; $ccd2: 95 67     
            LDA $00            ; $ccd4: a5 00     
            STA $77,X          ; $ccd6: 95 77     
            DEX                ; $ccd8: ca        
            BPL __cccc         ; $ccd9: 10 f1     
            INC $46            ; $ccdb: e6 46     
            LDA $46            ; $ccdd: a5 46     
            AND #$01           ; $ccdf: 29 01     
            STA $46            ; $cce1: 85 46     
__cce3:     JMP __c9dd         ; $cce3: 4c dd c9  

;-------------------------------------------------------------------------------
            LDA $87            ; $cce6: a5 87     
            BNE __ccfb         ; $cce8: d0 11     
            LDX #$00           ; $ccea: a2 00     
__ccec:     STA $1E,X          ; $ccec: 95 1e     
            INX                ; $ccee: e8        
            CPX #$14           ; $ccef: e0 14     
            BNE __ccec         ; $ccf1: d0 f9     
            INC $87            ; $ccf3: e6 87     
            LDA #$01           ; $ccf5: a9 01     
            STA $32            ; $ccf7: 85 32     
            BNE __cd50         ; $ccf9: d0 55     
__ccfb:     LDA Frame_Ctr      ; $ccfb: a5 4b     
            AND #$07           ; $ccfd: 29 07     
            BNE __cd50         ; $ccff: d0 4f     
            LDX #$00           ; $cd01: a2 00     
            LDA $87            ; $cd03: a5 87     
            AND #$01           ; $cd05: 29 01     
            BNE __cd0b         ; $cd07: d0 02     
            LDX #$04           ; $cd09: a2 04     
__cd0b:     LDY #$03           ; $cd0b: a0 03     
__cd0d:     LDA __cd59,X       ; $cd0d: bd 59 cd  
            STA $024b,Y        ; $cd10: 99 4b 02  
            INX                ; $cd13: e8        
            DEY                ; $cd14: 88        
            BPL __cd0d         ; $cd15: 10 f6     
            INC $87            ; $cd17: e6 87     
            LDA #$10           ; $cd19: a9 10     
            CMP $87            ; $cd1b: c5 87     
            BNE __cd50         ; $cd1d: d0 31     
            LDA #$00           ; $cd1f: a9 00     
            STA $1A            ; $cd21: 85 1a     
            STA $1C            ; $cd23: 85 1c     
            STA $87            ; $cd25: 85 87     
            LDA Current_Level  ; $cd27: a5 68     
            CMP #$01           ; $cd29: c9 01     
            BEQ __cd45         ; $cd2b: f0 18     
            INC $87            ; $cd2d: e6 87     
            INC $87            ; $cd2f: e6 87     
            CMP #$04           ; $cd31: c9 04     
            BEQ __cd45         ; $cd33: f0 10     
            INC $87            ; $cd35: e6 87     
            INC $87            ; $cd37: e6 87     
            CMP #$08           ; $cd39: c9 08     
            BEQ __cd45         ; $cd3b: f0 08     
            CMP #$0C           ; $cd3d: c9 0c     
            BEQ __cd45         ; $cd3f: f0 04     
            CMP #$10           ; $cd41: c9 10     
            BNE __cd4c         ; $cd43: d0 07     
__cd45:     LDA #$0E           ; $cd45: a9 0e     
            STA $3F            ; $cd47: 85 3f     
            JMP __cd50         ; $cd49: 4c 50 cd  

;-------------------------------------------------------------------------------
__cd4c:     LDA #$00           ; $cd4c: a9 00     
            STA $3F            ; $cd4e: 85 3f     
__cd50:     JSR __ddc9         ; $cd50: 20 c9 dd  
            JSR __d9ab         ; $cd53: 20 ab d9  
            JMP __c9dd         ; $cd56: 4c dd c9  

;-------------------------------------------------------------------------------
__cd59:     .hex ff 11 05 3f   ; $cd59: ff 11 05 3f   Data
            .hex ff 20 05 3f   ; $cd5d: ff 20 05 3f   Data
__cd61:     .hex a5 87 f0 03   ; $cd61: a5 87 f0 03   Data
            .hex 4c ec cd      ; $cd65: 4c ec cd      Data
__cd68:     
            LDY #$00           ; $cd68: a0 00 
            LDA #$FF           ; $cd6a: a9 ff
__cd6c:     
            STA $0700,Y        ; $cd6c: 99 00 07  
            INY                ; $cd6f: c8        
            CPY #$60           ; $cd70: c0 60     
            BNE __cd6c         ; $cd72: d0 f8     
            LDA #$60           ; $cd74: a9 60     
            STA $00            ; $cd76: 85 00     
            LDA #$07           ; $cd78: a9 07     
            STA $01            ; $cd7a: 85 01     
            LDA #$03           ; $cd7c: a9 03     
            STA $04            ; $cd7e: 85 04     
            LDY #$00           ; $cd80: a0 00     
            STY $05            ; $cd82: 84 05     
            STY $06            ; $cd84: 84 06     
            STY $07            ; $cd86: 84 07     
__cd88:     
            LDX $06            ; $cd88: a6 06     
            LDA __ce29,X       ; $cd8a: bd 29 ce  
            STA $02            ; $cd8d: 85 02     
            LDA __ce2a,X       ; $cd8f: bd 2a ce  
            STA $03            ; $cd92: 85 03     
            LDX $07            ; $cd94: a6 07     
            LDA __ce31,X       ; $cd96: bd 31 ce  
            STA $08            ; $cd99: 85 08     
__cd9b:     
            LDA $03            ; $cd9b: a5 03 
            STA ($00),Y        ; $cd9d: 91 00
            LDX $05            ; $cd9f: a6 05 
            LDA $CE01,X        ; $cda1: bd 01 ce 
            INY                ; $cda4: c8 
            STA ($00),Y        ; $cda5: 91 00 
            LDA $CE15,X        ; $cda7: bd 15 ce 
            INY                ; $cdaa: c8
            STA ($00),Y        ; $cdab: 91 00
            LDA $02            ; $cdad: a5 02
            INY                ; $cdaf: c8
            STA ($00),Y        ; $cdb0: 91 00
            LDA $02            ; $cdb2: a5 02 
            CLC                ; $cdb4: 18 
            ADC #$08           ; $cdb5: 69 08
            STA $02            ; $cdb7: 85 02 
            INY                ; $cdb9: c8
            INC $05            ; $cdba: e6 05
__cdbc:     
            .hex c6 08 d0 db   ; $cdbc: c6 08 d0 db   Data
            .hex e6 06 e6 06   ; $cdc0: e6 06 e6 06   Data
            .hex e6 07 a5 47   ; $cdc4: e6 07 a5 47   Data
            .hex f0 0a a5 77   ; $cdc8: f0 0a a5 77   Data
            .hex d0 06 a5 04   ; $cdcc: d0 06 a5 04   Data
            .hex c9 02 f0 18   ; $cdd0: c9 02 f0 18   Data
__cdd4:     .hex c6 04 f0 04   ; $cdd4: c6 04 f0 04   Data
            .hex 10 ae 30 10   ; $cdd8: 10 ae 30 10   Data
__cddc:     LDA $47            ; $cddc: a5 47     
            BEQ __cdec         ; $cdde: f0 0c     
            LDA $46            ; $cde0: a5 46     
            BEQ __cd88         ; $cde2: f0 a4     
            INC $05            ; $cde4: e6 05     
            INC $05            ; $cde6: e6 05     
            INC $05            ; $cde8: e6 05     
            BNE __cd88         ; $cdea: d0 9c     
__cdec:     INC $87            ; $cDEC: e6 87     
            BNE __cdfe         ; $cdee: d0 0e     
            LDA #$00           ; $cdf0: a9 00     
            TAY                ; $cdf2: a8        
__cdf3:     STA $0760,Y        ; $cdf3: 99 60 07  
            INY                ; $cdf6: c8        
            CPY #$a0           ; $cdf7: c0 a0     
            BNE __cdf3         ; $cdf9: d0 f8     
            JMP __cc94         ; $cdfb: 4c 94 cc  

;-------------------------------------------------------------------------------
__cdfe:     JMP __c9dd         ; $cdfe: 4c dd c9  

;-------------------------------------------------------------------------------
__ce01:     .hex bc b2 bd b4   ; $ce01: bc b2 bd b4   Data
            .hex b6 be b4 b5   ; $ce05: b6 be b4 b5   Data
            .hex b0 b1 b2 b3   ; $ce09: b0 b1 b2 b3   Data
            .hex b4 b5 b6 b7   ; $ce0d: b4 b5 b6 b7   Data
            .hex b4 b8 b9 b6   ; $ce11: b4 b8 b9 b6   Data
__ce15:     .hex 00 00 00 00   ; $ce15: 00 00 00 00   Data
            .hex 00 00 00 00   ; $ce19: 00 00 00 00   Data
            .hex 02 02 02 02   ; $ce1d: 02 02 02 02   Data
            .hex 02 02 02 02   ; $ce21: 02 02 02 02   Data
            .hex 02 02 02 02   ; $ce25: 02 02 02 02   Data
__ce29:     .hex 38            ; $ce29: 38            Data
__ce2a:     .hex 88 60 88 44   ; $ce2a: 88 60 88 44   Data
            .hex 60 50 70      ; $ce2e: 60 50 70      Data
            .hex 04 04 06 03   ; $ce31: 04 04 06 03   Data
__ce35:     
            LDA #$01           ; $ce35: a9 01 
            STA $40            ; $ce37: 85 40
__ce39:    
            LDA $40            ; $ce39: a5 40     
            BNE __ce39         ; $ce3b: d0 fc     
            LDA #$08           ; $ce3d: a9 08     
            STA PPUCTRL        ; $ce3f: 8d 00 20  
            STA $43            ; $ce42: 85 43     
            LDA #$00           ; $ce44: a9 00     
            STA PPUMASK        ; $ce46: 8d 01 20  
            LDX #$00           ; $ce49: a2 00     
__ce4b:     STA $87,X          ; $ce4b: 95 87     
            INX                ; $ce4d: e8        
            CPX #$69           ; $ce4e: e0 69     
            BNE __ce4b         ; $ce50: d0 f9     
            TAX                ; $ce52: aa        
__ce53:     STA $0700,X        ; $ce53: 9d 00 07  
            INX                ; $ce56: e8        
            BNE __ce53         ; $ce57: d0 fa     
            LDA PPUSTATUS      ; $ce59: ad 02 20  
            LDA #$3F           ; $ce5c: a9 3f     
            STA PPUADDR        ; $ce5e: 8d 06 20  
            LDA #$00           ; $ce61: a9 00     
            STA PPUADDR        ; $ce63: 8d 06 20  
            LDY #$00           ; $ce66: a0 00     
__ce68:     LDA __d060,Y       ; $ce68: b9 60 d0  
            STA PPUDATA        ; $ce6b: 8d 07 20  
            INY                ; $ce6e: c8        
            CPY #$20           ; $ce6f: c0 20     
            BNE __ce68         ; $ce71: d0 f5     
            LDA #$02           ; $ce73: a9 02     
            STA $3F            ; $ce75: 85 3f     
            LDA $69            ; $ce77: a5 69     
            BNE __ce99         ; $ce79: d0 1e     
            STA $8B            ; $ce7b: 85 8b     
            LDA #$01           ; $ce7d: a9 01     
            STA $6C            ; $ce7f: 85 6c     
            STA $6D            ; $ce81: 85 6d     
            STA $6E            ; $ce83: 85 6e     
            STA $6F            ; $ce85: 85 6f     
            LDA #$c0           ; $ce87: a9 c0     
            STA $6A            ; $ce89: 85 6a     
            LDA Current_Level  ; $ce8b: a5 68     
            CMP #$16           ; $ce8d: c9 16     
            BEQ __ce93         ; $ce8f: f0 02     
            INC Current_Level  ; $ce91: e6 68     
__ce93:     JSR __d080         ; $ce93: 20 80 d0  
            JSR __e25c         ; $ce96: 20 5c e2  
            JSR __e379         ; $ce99: 20 79 e3  
            JSR __cffa         ; $ce9c: 20 fa cf  
            JSR __e4cd         ; $ce9f: 20 cd e4
            JSR __e53b         ; $cea1: 20 3b e5
            JSR __e47c         ; $cea5: 20 7c e4
            LDX $68            ; $cea8: a6 68 
            LDA #$00           ; $ceaa: a9 00 
            CLC                ; $ceac: 18   Data
__cead:     DEX                ; $cead: ca        
            BMI __ceb4         ; $ceae: 30 04     
            ADC #$06           ; $ceb0: 69 06     
            BNE __cead         ; $ceb2: d0 f9     
__ceb4:     STA $00            ; $ceb4: 85 00     
            TAX                ; $ceb6: aa        
            LDA __eb42,X       ; $ceb7: bd 42 eb  
            TAX                ; $ceba: aa        
            LDA #$00           ; $cebb: a9 00     
            CLC                ; $cebd: 18        
__cebe:     DEX                ; $cebe: ca        
            BMI __cec5         ; $cebf: 30 04     
            ADC #$16           ; $cec1: 69 16     
            BNE __cebe         ; $cec3: d0 f9     
__cec5:     TAY                ; $cec5: a8        
            LDX #$00           ; $cec6: a2 00     
__cec8:     LDA __ebcc,Y       ; $cec8: b9 cc eb  
            STA $9F,X          ; $cecb: 95 9f     
            INX                ; $cecd: e8        
            INY                ; $cece: c8        
            CPX #$16           ; $cecf: e0 16     
            BNE __cec8         ; $ced1: d0 f5     
            LDX $00            ; $ced3: a6 00     
            LDA __eb42,X       ; $ced5: bd 42 eb  
            ASL                ; $ced8: 0a        
            ASL                ; $ced9: 0a        
            ASL                ; $ceda: 0a        
            TAX                ; $cedb: aa        
            LDY #$00           ; $cedc: a0 00     
            STY $d0            ; $cede: 84 d0     
            LDA __ec3a,X       ; $cee0: bd 3a ec  
            STA $CF           ; $cee3: 85 cf     
__cee5:     LDA __ec3a,X       ; $cee5: bd 3a ec  
            STA $0097,Y        ; $cee8: 99 97 00  
            INX                ; $ceeb: e8        
            INY                ; $ceec: c8        
            CPY #$08           ; $ceed: c0 08     
            BNE __cee5         ; $ceef: d0 f4     
            INC $00            ; $cef1: e6 00     
            LDX $00            ; $cef3: a6 00     
            LDA __eb42,X       ; $cef5: bd 42 eb  
            STA $8C            ; $cef8: 85 8c     
            INC $00            ; $cefa: e6 00     
            LDX $00            ; $cefc: a6 00     
            LDA __eb42,X       ; $cefe: bd 42 eb  
            ASL                ; $cf01: 0a        
            TAX                ; $cf02: aa        
            LDA __ec5a,X       ; $cf03: bd 5a ec  
            STA $8D            ; $cf06: 85 8d     
            INX                ; $cf08: e8        
            LDA __ec5a,X       ; $cf09: bd 5a ec  
            STA $8E            ; $cf0c: 85 8e     
            INC $00            ; $cf0e: e6 00     
            LDA $69            ; $cf10: a5 69     
            BEQ __cf38         ; $cf12: f0 24     
            LDX #$0C           ; $cf14: a2 0c     
            LDY #$00           ; $cf16: a0 00     
            LDA __ec68,X       ; $cf18: bd 68 ec  
            STA $008f,Y        ; $cf1b: 99 8f 00  
            INY                ; $cf1e: c8        
            INX                ; $cf1f: e8        
            LDA #$c0           ; $cf20: a9 c0     
            SEC                ; $cf22: 38        
            SBC $6A            ; $cf23: e5 6a     
            STA $01            ; $cf25: 85 01     
__cf27:     LDA $01            ; $cf27: a5 01     
            CLC                ; $cf29: 18        
            ADC __ec68,X       ; $cf2a: 7d 68 ec  
            STA $008f,Y        ; $cf2d: 99 8f 00  
            INY                ; $cf30: c8        
            INX                ; $cf31: e8        
            CPY #$04           ; $cf32: c0 04     
            BNE __cf27         ; $cf34: d0 f1     
            BEQ __cf4e         ; $cf36: f0 16     
__cf38:     LDX $00            ; $cf38: a6 00     
            LDA __eb42,X       ; $cf3a: bd 42 eb  
            ASL                ; $cf3d: 0a        
            ASL                ; $cf3e: 0a        
            TAX                ; $cf3f: aa        
            LDY #$00           ; $cf40: a0 00     
__cf42:     LDA __ec68,X       ; $cf42: bd 68 ec  
            STA $008f,Y        ; $cf45: 99 8f 00  
            INX                ; $cf48: e8        
            INY                ; $cf49: c8        
            CPY #$04           ; $cf4a: c0 04     
            BNE __cf42         ; $cf4c: d0 f4     
__cf4e:     LDA #$04           ; $cf4e: a9 04     
            STA $b8            ; $cf50: 85 b8     
            LDA #$01           ; $cf52: a9 01     
            STA $b9            ; $cf54: 85 b9     
            LDA $8F            ; $cf56: a5 8f     
            STA $01            ; $cf58: 85 01     
            LDX #$00           ; $cf5a: a2 00     
__cf5c:     DEC $01            ; $cf5c: c6 01     
            BEQ __cf6c         ; $cf5e: f0 0c     
            LDA #$02           ; $cf60: a9 02     
            STA $BA,X          ; $cf62: 95 ba     
            LDA #$00           ; $cf64: a9 00     
            STA $BB,X          ; $cf66: 95 bb     
            INX                ; $cf68: e8        
            INX                ; $cf69: e8        
            BNE __cf5c         ; $cf6a: d0 f0     
__cf6c:     LDA #$00           ; $cf6c: a9 00     
__cf6e:     CPX #$06           ; $cf6e: e0 06     
            BEQ __cf7a         ; $cf70: f0 08     
            STA $BA,X          ; $cf72: 95 ba     
            STA $BB,X          ; $cf74: 95 bb     
            INX                ; $cf76: e8        
            INX                ; $cf77: e8        
            BNE __cf6e         ; $cf78: d0 f4     
__cf7a:     LDA $90            ; $cf7a: a5 90     
            STA $d3            ; $cf7c: 85 d3     
            INC $00            ; $cf7e: e6 00     
            LDX $00            ; $cf80: a6 00     
            LDA __eb42,X       ; $cf82: bd 42 eb  
            STA $93            ; $cf85: 85 93     
            INC $00            ; $cf87: e6 00     
            LDX $00            ; $cf89: a6 00     
            LDA __eb42,X       ; $cf8b: bd 42 eb  
            STA $96            ; $cf8e: 85 96     
            LDA $a5            ; $cf90: a5 a5     
            STA $b5            ; $cf92: 85 b5     
            LDA $a6            ; $cf94: a5 a6     
            STA $b6            ; $cf96: 85 b6     
            LDA $AF            ; $cf98: a5 af     
            STA $c4            ; $cf9a: 85 c4     
            STA $c6            ; $cf9c: 85 c6     
            STA $c8            ; $cf9e: 85 c8     
            STA $CA           ; $cfa0: 85 ca     
            LDA $b0            ; $cfa2: a5 b0     
            STA $c5            ; $cfa4: 85 c5     
            STA $c7            ; $cfa6: 85 c7     
            STA $c9            ; $cfa8: 85 c9     
            STA $CB           ; $cfaa: 85 cb     
            LDA #$01           ; $cfac: a9 01     
            STA $50            ; $cfae: 85 50     
            STA $51            ; $cfb0: 85 51     
            LDY #$00           ; $cfb2: a0 00     
            LDX #$00           ; $cfb4: a2 00     
            LDA $46            ; $cfb6: a5 46     
            AND $47            ; $cfb8: 25 47     
            BEQ __cfbe         ; $cfba: f0 02     
            LDY #$09           ; $cfbc: a0 09     
__cfbe:     LDA __d04e,Y       ; $cfbe: b9 4e d0  
            STA $026b,X        ; $cfc1: 9d 6b 02  
            INY                ; $cfc4: c8        
            INX                ; $cfc5: e8        
            CPX #$09           ; $cfc6: e0 09     
            BNE __cfbe         ; $cfc8: d0 f4     
            LDY #$00           ; $cfca: a0 00     
__cfcc:     LDA __d042,Y       ; $cfcc: b9 42 d0  
            STA $0032,Y        ; $cfcf: 99 32 00  
            INY                ; $cfd2: c8        
            CPY #$0C           ; $cfd3: c0 0c     
            BNE __cfcc         ; $cfd5: d0 f5     
            LDY #$00           ; $cfd7: a0 00     
__cfd9:     LDA $006c,Y        ; $cfd9: b9 6c 00  
            CMP #$02           ; $cfdc: c9 02     
            BNE __cfe5         ; $cfde: d0 05     
            LDA #$01           ; $cfe0: a9 01     
            STA $006c,Y        ; $cfe2: 99 6c 00  
__cfe5:     INY                ; $cfe5: c8        
            CPY #$04           ; $cfe6: c0 04     
            BNE __cfd9         ; $cfe8: d0 ef     
            STY $c0            ; $cfea: 84 c0     
            LDA #$FF           ; $cfec: a9 ff     
            STA $89            ; $cfee: 85 89     
            LDA #$88           ; $cff0: a9 88     
            STA PPUCTRL        ; $cff2: 8d 00 20  
            STA $43            ; $cff5: 85 43     
            JMP __c9dd         ; $cff7: 4c dd c9  

;-------------------------------------------------------------------------------
__cffa:     LDY #$22           ; $cffa: a0 22     
            LDA $46            ; $cffc: a5 46     
            AND $47            ; $cffe: 25 47     
            BEQ __d004         ; $d000: f0 02     
            LDY #$2A           ; $d002: a0 2a     
__d004:     STY $00            ; $d004: 84 00     
            LDA #$56           ; $d006: a9 56     
            STA $01            ; $d008: 85 01     
            LDA #$0A           ; $d00a: a9 0a     
            STA $02            ; $d00c: 85 02     
            LDA PPUSTATUS      ; $d00e: ad 02 20  
            LDA $00            ; $d011: a5 00     
            STA PPUADDR        ; $d013: 8d 06 20  
            LDA $01            ; $d016: a5 01     
            STA PPUADDR        ; $d018: 8d 06 20  
            LDA #$06           ; $d01b: a9 06     
            STA $03            ; $d01d: 85 03     
__d01f:     .hex a9 20 8d 07   ; $d01f: a9 20 8d 07   Data
            .hex 20 c6 03 d0   ; $d023: 20 c6 03 d0   Data
            .hex f9 a9 2d 8d   ; $d027: f9 a9 2d 8d   Data
            .hex 07 20 8d 07   ; $d02b: 07 20 8d 07   Data
            .hex 20 a5 01 18   ; $d02f: 20 a5 01 18   Data
            .hex 69 20 85 01   ; $d033: 69 20 85 01   Data
            .hex a5 00 69 00   ; $d037: a5 00 69 00   Data
            .hex 85 00 c6 02   ; $d03b: 85 00 c6 02   Data
            .hex d0 cd 60      ; $d03f: d0 cd 60      Data
__d042:     .hex 04 0c 0a 0a   ; $d042: 04 0c 0a 0a   Data
            .hex 0a 00 00 00   ; $d046: 0a 00 00 00   Data
            .hex 01 02 03 00   ; $d04a: 01 02 03 00   Data
__d04e:     .hex 21 36 20 f7   ; $d04e: 21 36 20 f7   Data
            .hex b0 b3 b2 20   ; $d052: b0 b3 b2 20   Data
            .hex b6 29 b6 29   ; $d056: b6 29 b6 29   Data
            .hex 77 b1 b3 b2   ; $d05a: 77 b1 b3 b2   Data
            .hex 28 b6         ; $d05e: 28 b6         Data
__d060:     .hex 0f 20 0f 06   ; $d060: 0f 20 0f 06   Data
            .hex 0f 11 0f 27   ; $d064: 0f 11 0f 27   Data
            .hex 0f 16 26 06   ; $d068: 0f 16 26 06   Data
            .hex 0f 19 17 12   ; $d06c: 0f 19 17 12   Data
            .hex 0f 27 20 06   ; $d070: 0f 27 20 06   Data
            .hex 0f 11 20 33   ; $d074: 0f 11 20 33   Data
            .hex 0f 21 20 21   ; $d078: 0f 21 20 21   Data
            .hex 0f 09 20 17   ; $d07c: 0f 09 20 17   Data
__d080:     LDA PPUSTATUS      ; $d080: ad 02 20  
            LDA #$23           ; $d083: a9 23     
            STA PPUADDR        ; $d085: 8d 06 20  
            LDA #$c0           ; $d088: a9 c0     
            STA PPUADDR        ; $d08a: 8d 06 20  
            LDX #$01           ; $d08d: a2 01     
__d08f:     LDY #$00           ; $d08f: a0 00     
__d091:     LDA __d0af,Y       ; $d091: b9 af d0  
            STA PPUDATA        ; $d094: 8d 07 20  
            INY                ; $d097: c8        
            CPY #$40           ; $d098: c0 40     
            BNE __d091         ; $d09a: d0 f5     
            DEX                ; $d09c: ca        
            BEQ __d0a0         ; $d09d: f0 01     
            RTS                ; $d09f: 60        

;-------------------------------------------------------------------------------
__d0a0:     LDA PPUSTATUS      ; $d0a0: ad 02 20  
            LDA #$2B           ; $d0a3: a9 2b     
            STA PPUADDR        ; $d0a5: 8d 06 20  
            LDA #$c0           ; $d0a8: a9 c0     
            STA PPUADDR        ; $d0aa: 8d 06 20  
            BNE __d08f         ; $d0ad: d0 e0     
__d0af:     .hex 55 55 55 55   ; $d0af: 55 55 55 55   Data
            .hex 55 11 00 00   ; $d0b3: 55 11 00 00   Data
            .hex 55 55 55 55   ; $d0b7: 55 55 55 55   Data
            .hex 55 11 00 00   ; $d0bb: 55 11 00 00   Data
            .hex 55 55 55 55   ; $d0bf: 55 55 55 55   Data
            .hex 55 11 00 00   ; $d0c3: 55 11 00 00   Data
            .hex 55 55 55 55   ; $d0c7: 55 55 55 55   Data
            .hex 55 51 50 50   ; $d0cb: 55 51 50 50   Data
            .hex 55            ; $d0cf: 55            Data
__d0d0:     .hex 55 55 55 55   ; $d0d0: 55 55 55 55   Data
            .hex 11 05 05 55   ; $d0d4: 11 05 05 55   Data
            .hex 55 55 55 55   ; $d0d8: 55 55 55 55   Data
            .hex 11 00 00 55   ; $d0dc: 11 00 00 55   Data
            .hex 55 55 55 55   ; $d0e0: 55 55 55 55   Data
            .hex 55 55 55 55   ; $d0e4: 55 55 55 55   Data
            .hex 55 55 55 55   ; $d0e8: 55 55 55 55   Data
            .hex 55 55 55      ; $d0ec: 55 55 55      Data
__d0ef:     LDA $89            ; $d0ef: a5 89     
            BMI __d141         ; $d0f1: 30 4e     
            INC $8A            ; $d0f3: e6 8a     
            LDA #$3C           ; $d0f5: a9 3c     
            CMP $8A            ; $d0f7: c5 8a     
            BNE __d117         ; $d0f9: d0 1c     
            LDA #$00           ; $d0fb: a9 00     
            STA $8A            ; $d0fd: 85 8a     
            DEC $89            ; $d0ff: c6 89     
            BPL __d117         ; $d101: 10 14     
            STA $88            ; $d103: 85 88     
            LDX #$00           ; $d105: a2 00     
__d107:     LDA $39,X          ; $d107: b5 39     
            AND #$FC           ; $d109: 29 fc     
            STA $00            ; $d10b: 85 00     
            TXA                ; $d10d: 8a        
            ORA $00            ; $d10e: 05 00     
            STA $39,X          ; $d110: 95 39     
            INX                ; $d112: e8        
            CPX #$04           ; $d113: e0 04     
            BNE __d107         ; $d115: d0 f0     
__d117:     LDA $89            ; $d117: a5 89     
            CMP #$02           ; $d119: c9 02     
            BCS __d141         ; $d11b: b0 24     
            LDX #$00           ; $d11d: a2 00     
__d11f:     .hex a5 8a 29 08   ; $d11f: a5 8a 29 08   Data
            .hex d0 02 a2 05   ; $d123: d0 02 a2 05   Data
__d127:     LDY #$FF           ; $d127: a0 ff     
__d129:     INY                ; $d129: c8        
            LDA $024b,Y        ; $d12a: b9 4b 02  
            CMP #$FF           ; $d12d: c9 ff     
            BNE __d129         ; $d12f: d0 f8     
            TYA                ; $d131: 98        
            BNE __d135         ; $d132: d0 01     
            INX                ; $d134: e8        
__d135:     LDA __d205,X       ; $d135: bd 05 d2  
            STA $024b,Y        ; $d138: 99 4b 02  
            INY                ; $d13b: c8        
            INX                ; $d13c: e8        
            CMP #$FF           ; $d13d: c9 ff     
            BNE __d135         ; $d13f: d0 f4     
__d141:     LDA $88            ; $d141: a5 88     
            BNE __d174         ; $d143: d0 2f     
            LDA $CF           ; $d145: a5 cf     
            CMP #$FF           ; $d147: c9 ff     
            BEQ __d174         ; $d149: f0 29     
            INC $d1            ; $d14b: e6 d1     
            LDA $d1            ; $d14d: a5 d1     
            CMP #$3C           ; $d14f: c9 3c     
            BNE __d174         ; $d151: d0 21     
            LDA #$00           ; $d153: a9 00     
            STA $d1            ; $d155: 85 d1     
            DEC $CF           ; $d157: c6 cf     
            BPL __d174         ; $d159: 10 19     
            INC $d0            ; $d15b: e6 d0     
            LDA $d0            ; $d15d: a5 d0     
            AND #$01           ; $d15f: 29 01     
            BEQ __d16a         ; $d161: f0 07     
            JSR __e003         ; $d163: 20 03 e0  
            LDA #$0F           ; $d166: a9 0f     
            BNE __d16c         ; $d168: d0 02     
__d16a:     LDA $d2            ; $d16a: a5 d2     
__d16c:     STA $87            ; $d16c: 85 87     
            LDX $d0            ; $d16e: a6 d0     
            LDA $97,X          ; $d170: b5 97     
            STA $CF           ; $d172: 85 cf     
__d174:     LDA $d3            ; $d174: a5 d3     
            BEQ __d197         ; $d176: f0 1f     
            CLC                ; $d178: 18        
            ADC $6A            ; $d179: 65 6a     
            CMP #$c0           ; $d17b: c9 c0     
            BNE __d197         ; $d17d: d0 18     
            JSR __d1eb         ; $d17f: 20 eb d1  
            LDA $d3            ; $d182: a5 d3     
            LDX #$00           ; $d184: a2 00     
__d186:     CMP $8F,X          ; $d186: d5 8f     
            BNE __d192         ; $d188: d0 08     
            INX                ; $d18a: e8        
            LDA $8F,X          ; $d18b: b5 8f     
            STA $d3            ; $d18d: 85 d3     
            JMP __d197         ; $d18f: 4c 97 d1  

;-------------------------------------------------------------------------------
__d192:     INX                ; $d192: e8        
            CPX #$04           ; $d193: e0 04     
            BNE __d186         ; $d195: d0 ef     
__d197:     INC $d6            ; $d197: e6 d6     
            LDA #$60           ; $d199: a9 60     
            CMP $d6            ; $d19b: c5 d6     
            BNE __d1b2         ; $d19d: d0 13     
            LDA #$00           ; $d19f: a9 00     
            STA $d6            ; $d1a1: 85 d6     
            INC $d5            ; $d1a3: e6 d5     
            LDA $d5            ; $d1a5: a5 d5     
            CMP $96            ; $d1a7: c5 96     
            BNE __d1b2         ; $d1a9: d0 07     
            LDA #$00           ; $d1ab: a9 00     
            STA $d5            ; $d1ad: 85 d5     
            JSR __d1eb         ; $d1af: 20 eb d1  
__d1b2:     LDX $d4            ; $d1b2: a6 d4     
            CPX #$02           ; $d1b4: e0 02     
            BEQ __d1cf         ; $d1b6: f0 17     
            LDA $8D,X          ; $d1b8: b5 8d     
            CMP $6A            ; $d1ba: c5 6a     
            BNE __d1cf         ; $d1bc: d0 11     
            INC $d4            ; $d1be: e6 d4     
            LDA #$01           ; $d1c0: a9 01     
            STA $d2            ; $d1c2: 85 d2     
            TXA                ; $d1c4: 8a        
            ASL                ; $d1c5: 0a        
            TAX                ; $d1c6: aa        
            LDA $AB,X          ; $d1c7: b5 ab     
            STA $CA           ; $d1c9: 85 ca     
            LDA $AC,X          ; $d1cb: b5 ac     
            STA $CB           ; $d1cd: 85 cb     
__d1cf:     ORA $d7            ; $d1cf: 05 d7     
            ORA $d8            ; $d1d1: 05 d8     
            BEQ __d1ea         ; $d1d3: f0 15     
            DEC $d8            ; $d1d5: c6 d8     
            BNE __d1ea         ; $d1d7: d0 11     
            LDA $d7            ; $d1d9: a5 d7     
            BEQ __d1e4         ; $d1db: f0 07     
            DEC $d7            ; $d1dd: c6 d7     
            LDA #$3C           ; $d1df: a9 3c     
            STA $d8            ; $d1e1: 85 d8     
            RTS                ; $d1e3: 60        

;-------------------------------------------------------------------------------
__d1e4:     STA $2E            ; $d1e4: 85 2e     
            STA $30            ; $d1e6: 85 30     
            STA $8B            ; $d1e8: 85 8b     
__d1ea:     RTS                ; $d1ea: 60        

;-------------------------------------------------------------------------------
__d1eb:     LDX #$00           ; $d1eb: a2 00     
__d1ed:     LDA $BA,X          ; $d1ed: b5 ba     
            BNE __d1f6         ; $d1ef: d0 05     
            LDA #$02           ; $d1f1: a9 02     
            STA $BA,X          ; $d1f3: 95 ba     
            RTS                ; $d1f5: 60        

;-------------------------------------------------------------------------------
__d1f6:     INX                ; $d1f6: e8        
            INX                ; $d1f7: e8        
            CPX #$06           ; $d1f8: e0 06     
            BNE __d1ed         ; $d1fa: d0 f1     
            RTS                ; $d1fc: 60        

;-------------------------------------------------------------------------------
            bit $25            ; $d1fd: 24 25     
            rol $27            ; $d1ff: 26 27     
            plp                ; $d201: 28        
            AND #$2A           ; $d202: 29 2a     
            .hex 2b            ; $d204: 2b        Suspected data
__d205:     .hex 00 3f 15 11   ; $d205: 00 3f 15 11   Data
            .hex ff 00 3f 15   ; $d209: ff 00 3f 15   Data
            .hex 20 ff         ; $d20d: 20 ff         Data
__d20f:     LDA $6A            ; $d20f: a5 6a     
            BNE __d214         ; $d211: d0 01     
            RTS                ; $d213: 60        

;-------------------------------------------------------------------------------
__d214:     LDA #$1E           ; $d214: a9 1e     
            STA $00            ; $d216: 85 00     
            LDA #$00           ; $d218: a9 00     
            STA $01            ; $d21a: 85 01     
            LDA #$01           ; $d21c: a9 01     
            STA $02            ; $d21e: 85 02     
            LDX #$00           ; $d220: a2 00     
__d222:     LDA $b8,X          ; $d222: b5 b8     
            CMP #$04           ; $d224: c9 04     
            BNE __d25a         ; $d226: d0 32     
            LDY #$00           ; $d228: a0 00     
            LDA $1A            ; $d22a: a5 1a     
            CMP ($00),Y        ; $d22c: d1 00     
            BCS __d237         ; $d22e: b0 07     
            LDA ($00),Y        ; $d230: b1 00     
            SEC                ; $d232: 38        
            SBC $1A            ; $d233: e5 1a     
            BCS __d239         ; $d235: b0 02     
__d237:     SBC ($00),Y        ; $d237: f1 00     
__d239:     CMP #$0A           ; $d239: c9 0a     
            BCS __d25a         ; $d23b: b0 1d     
            STA $03            ; $d23d: 85 03     
            LDY #$02           ; $d23f: a0 02     
            LDA $1C            ; $d241: a5 1c     
            CMP ($00),Y        ; $d243: d1 00     
            BCS __d24e         ; $d245: b0 07     
            LDA ($00),Y        ; $d247: b1 00     
            SEC                ; $d249: 38        
            SBC $1C            ; $d24a: e5 1c     
            BCS __d250         ; $d24c: b0 02     
__d24e:     SBC ($00),Y        ; $d24e: f1 00     
__d250:     CMP #$0A           ; $d250: c9 0a     
            BCS __d25a         ; $d252: b0 06     
            ADC $03            ; $d254: 65 03     
            CMP #$05           ; $d256: c9 05     
            bcc __d26a         ; $d258: 90 10     
__d25a:     INX                ; $d25a: e8        
            INX                ; $d25b: e8        
            LDA $00            ; $d25c: a5 00     
            CLC                ; $d25e: 18        
            ADC #$04           ; $d25f: 69 04     
            STA $00            ; $d261: 85 00     
            ASL $02            ; $d263: 06 02     
            CPX #$0A           ; $d265: e0 0a     
            BNE __d222         ; $d267: d0 b9     
            RTS                ; $d269: 60        

;-------------------------------------------------------------------------------
__d26a:     CPX #$08           ; $d26a: e0 08     
            BEQ __d2b3         ; $d26c: f0 45     
            LDA $02            ; $d26e: a5 02     
            AND $88            ; $d270: 25 88     
            BEQ __d2a2         ; $d272: f0 2e     
            TXA                ; $d274: 8a        
            lsr                ; $d275: 4a        
            STA $03            ; $d276: 85 03     
            LDY $d9            ; $d278: a4 d9     
            LDA __d2d7,Y       ; $d27a: b9 d7 d2  
            LDY $03            ; $d27d: a4 03     
            STA $0033,Y        ; $d27f: 99 33 00  
            LDA #$00           ; $d282: a9 00     
            STA $32            ; $d284: 85 32     
            LDY $d9            ; $d286: a4 d9     
            LDA __d2e7,Y       ; $d288: b9 e7 d2  
            STA $DD            ; $d28b: 85 dd     
            LDA __d2e3,Y       ; $d28d: b9 e3 d2  
            STA $DE            ; $d290: 85 de     
            INC $d9            ; $d292: e6 d9     
            LDA #$08           ; $d294: a9 08     
            STA $b8,X          ; $d296: 95 b8     
            STA $0607          ; $d298: 8d 07 06  
            LDA #$06           ; $d29b: a9 06     
            STA $3F            ; $d29d: 85 3f     
            JMP __e060         ; $d29f: 4c 60 e0  

;-------------------------------------------------------------------------------
__d2a2:     LDA #$08           ; $d2a2: a9 08     
            STA $3F            ; $d2a4: 85 3f     
            LDA #$12           ; $d2a6: a9 12     
            STA $32            ; $d2a8: 85 32     
            LDA #$80           ; $d2aa: a9 80     
            STA $DB            ; $d2ac: 85 db     
            LDA #$00           ; $d2ae: a9 00     
            STA $87            ; $d2b0: 85 87     
            RTS                ; $d2b2: 60        

;-------------------------------------------------------------------------------
__d2b3:     LDA $8B            ; $d2b3: a5 8b     
            BEQ __d2b8         ; $d2b5: f0 01     
            RTS                ; $d2b7: 60        

;-------------------------------------------------------------------------------
__d2b8:     STA $d7            ; $d2b8: 85 d7     
            LDA #$80           ; $d2ba: a9 80     
            STA $d8            ; $d2bc: 85 d8     
            STA $8B            ; $d2be: 85 8b     
            STA $0606          ; $d2c0: 8d 06 06  
            LDY $93            ; $d2c3: a4 93     
            LDA __d2eb,Y       ; $d2c5: b9 eb d2  
            STA $DD            ; $d2c8: 85 dd     
            LDA __d2f3,Y       ; $d2ca: b9 f3 d2  
            STA $DE            ; $d2cd: 85 de     
            LDA __d2db,Y       ; $d2cf: b9 db d2  
            STA $37            ; $d2d2: 85 37     
            JMP __e060         ; $d2d4: 4c 60 e0  

;-------------------------------------------------------------------------------
__d2d7:     .hex 2d 2f 32 34   ; $d2d7: 2d 2f 32 34   Data
__d2db:     .hex 2c 2e 30 31   ; $d2db: 2c 2e 30 31   Data
            .hex 33 35 36 37   ; $d2df: 33 35 36 37   Data
__d2e3:     .hex 00 00 00 01   ; $d2e3: 00 00 00 01   Data
__d2e7:     .hex 02 04 08 06   ; $d2e7: 02 04 08 06   Data
__d2eb:     .hex 01 03 05 07   ; $d2eb: 01 03 05 07   Data
            .hex 00 00 00 00   ; $d2ef: 00 00 00 00   Data
__d2f3:     .hex 00 00 00 00   ; $d2f3: 00 00 00 00   Data
            .hex 01 02 03 05   ; $d2f7: 01 02 03 05   Data
__d2fb:     LDA $48            ; $d2fb: a5 48     
            BEQ __d302         ; $d2fd: f0 03     
            JMP __d471         ; $d2ff: 4c 71 d4  

;-------------------------------------------------------------------------------
__d302:     LDA $4F            ; $d302: a5 4f     
            AND #$f0           ; $d304: 29 f0     
            BEQ __d33d         ; $d306: f0 35     
            LDX #$FF           ; $d308: a2 ff     
__d30a:     INX                ; $d30a: e8        
            ASL                ; $d30b: 0a        
            bcc __d30a         ; $d30c: 90 fc     
            LDA __d46d,X       ; $d30e: bd 6d d4  
__d311:     STA $50            ; $d311: 85 50     
            CLC                ; $d313: 18        
            ADC #$02           ; $d314: 69 02     
            AND #$03           ; $d316: 29 03     
            CMP $51            ; $d318: c5 51     
            BNE __d334         ; $d31a: d0 18     
            LDA $1A            ; $d31c: a5 1a     
            ORA $1C            ; $d31e: 05 1c     
            AND #$07           ; $d320: 29 07     
            BNE __d32d         ; $d322: d0 09     
            LDY $50            ; $d324: a4 50     
            LDA $022b,Y        ; $d326: b9 2b 02  
            AND #$f0           ; $d329: 29 f0     
            BNE __d334         ; $d32b: d0 07     
__d32d:     LDA $50            ; $d32d: a5 50     
            STA $51            ; $d32f: 85 51     
            JMP __d341         ; $d331: 4c 41 d3  

;-------------------------------------------------------------------------------
__d334:     LDX $50            ; $d334: a6 50     
            LDA $022b,X        ; $d336: bd 2b 02  
            AND #$f0           ; $d339: 29 f0     
            BEQ __d341         ; $d33b: f0 04     
__d33d:     LDA $51            ; $d33d: a5 51     
            STA $50            ; $d33f: 85 50     
__d341:     LDX #$04           ; $d341: a2 04     
            LDA $88            ; $d343: a5 88     
            BNE __d349         ; $d345: d0 02     
            LDX #$0A           ; $d347: a2 0a     
__d349:     LDA $022a          ; $d349: ad 2a 02  
            CMP #$01           ; $d34c: c9 01     
            BEQ __d360         ; $d34e: f0 10     
            CMP #$02           ; $d350: c9 02     
            BEQ __d360         ; $d352: f0 0c     
            DEX                ; $d354: ca        
            DEX                ; $d355: ca        
            CMP #$03           ; $d356: c9 03     
            BEQ __d360         ; $d358: f0 06     
            CMP #$09           ; $d35a: c9 09     
            BEQ __d360         ; $d35c: f0 02     
            DEX                ; $d35e: ca        
            DEX                ; $d35f: ca        
__d360:     LDA $9F,X          ; $d360: b5 9f     
            STA $b5            ; $d362: 85 b5     
            LDA $a0,X          ; $d364: b5 a0     
            STA $b6            ; $d366: 85 b6     
            LDA $51            ; $d368: a5 51     
            ASL                ; $d36a: 0a        
            TAY                ; $d36b: a8        
            LDA __d379,Y       ; $d36c: b9 79 d3  
            STA $10            ; $d36f: 85 10     
            LDA __d37a,Y       ; $d371: b9 7a d3  
            STA $11            ; $d374: 85 11     
            JMP ($0010)        ; $d376: 6c 10 00  

;-------------------------------------------------------------------------------
__d379:     .hex 81            ; $d379: 81            Data
__d37a:     .hex d3 85 d3 a0   ; $d37a: d3 85 d3 a0   Data
            .hex d3 9c d3 a2   ; $d37e: d3 9c d3 a2   Data
            .hex 02 d0 02 a2   ; $d382: 02 d0 02 a2   Data
            .hex 00            ; $d386: 00            Data
__d387:     .hex b5 1b 38 e5   ; $d387: b5 1b 38 e5   Data
            .hex b5 95 1b a9   ; $d38b: b5 95 1b a9   Data
            .hex 00 b0 02 a9   ; $d38f: 00 b0 02 a9   Data
            .hex 01            ; $d393: 01            Data
__d394:     CLC                ; $d394: 18        
            ADC $b6            ; $d395: 65 b6     
            STA $CC           ; $d397: 85 cc     
            JMP __d3af         ; $d399: 4c af d3  

;-------------------------------------------------------------------------------
            LDX #$00           ; $d39c: a2 00     
            BEQ __d3a2         ; $d39e: f0 02     
            LDX #$02           ; $d3a0: a2 02     
__d3a2:     LDA $1B,X          ; $d3a2: b5 1b     
            CLC                ; $d3a4: 18        
            ADC $b5            ; $d3a5: 65 b5     
            STA $1B,X          ; $d3a7: 95 1b     
            LDA #$00           ; $d3a9: a9 00     
            ADC $b6            ; $d3ab: 65 b6     
            STA $CC           ; $d3ad: 85 cc     
__d3af:     DEC $CC           ; $d3af: c6 cc     
            BPL __d3b4         ; $d3b1: 10 01     
            RTS                ; $d3b3: 60        

;-------------------------------------------------------------------------------
__d3b4:     LDA $51            ; $d3b4: a5 51     
            ASL                ; $d3b6: 0a        
            TAY                ; $d3b7: a8        
            LDA __d3c5,Y       ; $d3b8: b9 c5 d3  
            STA $10            ; $d3bb: 85 10     
            LDA __d3c6,Y       ; $d3bd: b9 c6 d3  
            STA $11            ; $d3c0: 85 11     
            JMP ($0010)        ; $d3c2: 6c 10 00  

;-------------------------------------------------------------------------------
__d3c5:     .hex 05            ; $d3c5: 05            Data
__d3c6:     .hex d4 fb d3 d7   ; $d3c6: d4 fb d3 d7   Data
            .hex d3 cd d3 a2   ; $d3ca: d3 cd d3 a2   Data
            .hex 00 86 00 a9   ; $d3ce: 00 86 00 a9   Data
            .hex 03 85 01 d0   ; $d3d2: 03 85 01 d0   Data
            .hex 06 a2 02 86   ; $d3d6: 06 a2 02 86   Data
            .hex 00 86 01      ; $d3da: 00 86 01      Data
__d3dd:     .hex b5 1a 18 69   ; $d3dd: b5 1a 18 69   Data
            .hex 01 95 1a 29   ; $d3e1: 01 95 1a 29   Data
            .hex 04 d0 44 a6   ; $d3e5: 04 d0 44 a6   Data
            .hex 01 bd 2b 02   ; $d3e9: 01 bd 2b 02   Data
            .hex 29 f0 f0 3b   ; $d3ed: 29 f0 f0 3b   Data
            .hex a6 00 b5 1a   ; $d3f1: a6 00 b5 1a   Data
            .hex 29 fc 95 1a   ; $d3f5: 29 fc 95 1a   Data
            .hex d0 31 a2 00   ; $d3f9: d0 31 a2 00   Data
            .hex 86 00 a9 01   ; $d3fd: 86 00 a9 01   Data
            .hex 85 01 d0 08   ; $d401: 85 01 d0 08   Data
            .hex a2 02 86 00   ; $d405: a2 02 86 00   Data
            .hex a9 00 85 01   ; $d409: a9 00 85 01   Data
__d40d:     LDA $1A,X          ; $d40d: b5 1a     
            SEC                ; $d40f: 38        
            SBC #$01           ; $d410: e9 01     
            STA $1A,X          ; $d412: 95 1a     
            AND #$04           ; $d414: 29 04     
            BEQ __d42c         ; $d416: f0 14     
            LDX $01            ; $d418: a6 01     
            LDA $022b,X        ; $d41a: bd 2b 02  
            AND #$f0           ; $d41d: 29 f0     
            BEQ __d42c         ; $d41f: f0 0b     
            LDX $00            ; $d421: a6 00     
            LDA $1A,X          ; $d423: b5 1a     
            CLC                ; $d425: 18        
            ADC #$04           ; $d426: 69 04     
            AND #$FC           ; $d428: 29 fc     
            STA $1A,X          ; $d42a: 95 1a     
__d42c:     LDA $1A            ; $d42c: a5 1a     
            CMP #$18           ; $d42e: c9 18     
            bcc __d43c         ; $d430: 90 0a     
            CMP #$a9           ; $d432: c9 a9     
            BCS __d43c         ; $d434: b0 06     
            LDA $38            ; $d436: a5 38     
            AND #$DF           ; $d438: 29 df     
            bcc __d440         ; $d43a: 90 04     
__d43c:     LDA #$20           ; $d43c: a9 20     
            ORA $38            ; $d43e: 05 38     
__d440:     STA $38            ; $d440: 85 38     
            LDA $1A            ; $d442: a5 1a     
            CMP #$0B           ; $d444: c9 0b     
            BCS __d44e         ; $d446: b0 06     
            LDA #$BF           ; $d448: a9 bf     
            STA $1A            ; $d44a: 85 1a     
            BNE __d456         ; $d44c: d0 08     
__d44e:     CMP #$c0           ; $d44e: c9 c0     
            bcc __d456         ; $d450: 90 04     
            LDA #$0B           ; $d452: a9 0b     
            STA $1A            ; $d454: 85 1a     
__d456:     LDA $1A            ; $d456: a5 1a     
            ORA $1C            ; $d458: 05 1c     
            AND #$07           ; $d45a: 29 07     
            BNE __d46a         ; $d45c: d0 0c     
            LDA $50            ; $d45e: a5 50     
            CMP $51            ; $d460: c5 51     
            BEQ __d46a         ; $d462: f0 06     
            STA $51            ; $d464: 85 51     
            INC $CC           ; $d466: e6 cc     
            INC $CC           ; $d468: e6 cc     
__d46a:     JMP __d3af         ; $d46a: 4c af d3  

;-------------------------------------------------------------------------------
__d46d:     .hex 03 01 02 00   ; $d46d: 03 01 02 00   Data
__d471:     LDY $e4            ; $d471: a4 e4     
            DEC $e3            ; $d473: c6 e3     
            BNE __d482         ; $d475: d0 0b     
            INC $e4            ; $d477: e6 e4     
            INC $e4            ; $d479: e6 e4     
            LDY $e4            ; $d47b: a4 e4     
            LDA __d48a,Y       ; $d47d: b9 8a d4  
            STA $e3            ; $d480: 85 e3     
__d482:     LDA __d48b,Y       ; $d482: b9 8b d4  
            AND #$03           ; $d485: 29 03     
            JMP __d311         ; $d487: 4c 11 d3  

;-------------------------------------------------------------------------------
__d48a:     
            .hex 00            ; $d48a: 00            Data
__d48b:     
            .hex 01 D0 00 28    ; $d48b: 01 D0 00 28   Data
            .hex 01 28 02 90    ; $d48f: 01 28 02 90   Data
            .hex 03 18 01 60    ; $d48d: 03 18 01 60   Data
            .hex 03 38 00 20    ; $d493: 03 38 00 20   Data
            .hex 02 30 01 10    ; $d49b: 02 30 01 10   Data
            .hex 02 48 01 18    ; $d49f: 02 48 01 18   Data
            .hex 02 40 01 20    ; $d4a3: 02 40 01 20   Data
            .hex 02 18 00 20    ; $d4a7: 02 18 00 20   Data
            .hex 03 40 02 38    ; $d4ab: 03 40 02 38   Data
            .hex 01 18 02 E0    ; $d4af: 01 18 02 E0   Data
            .hex 03 30 00 28    ; $d4b3: 03 30 00 28   Data
            .hex 01 28 02 20    ; $d4b7: 01 28 02 20   Data
            .hex 02 80 03 40    ; $d4bb: 02 80 03 40   Data
            .hex 00 40 01       ; $d4bf: 00 40 01      Data

__d4c2:     
            LDX #$00           ; $d4c2: a2 00     
            LDA #$2F           ; $d4c4: a9 2f     
            STA $00            ; $d4c6: 85 00     
            LDA #$02           ; $d4c8: a9 02     
            STA $01            ; $d4ca: 85 01     
            LDA #$1E           ; $d4cc: a9 1e     
            STA $02            ; $d4ce: 85 02     
            LDA #$00           ; $d4d0: a9 00     
            STA $03            ; $d4d2: 85 03     
            LDA #$01           ; $d4d4: a9 01     
            STA $04            ; $d4d6: 85 04     
__d4d8:     JSR __d4f2         ; $d4d8: 20 f2 d4  
            .hex a5            ; $d4db: a5        Suspected data
__d4dc:     .hex 00 18 69 04   ; $d4dc: 00 18 69 04   Data
            .hex 85 00 a5 02   ; $d4e0: 85 00 a5 02   Data
            .hex 18 69 04 85   ; $d4e4: 18 69 04 85   Data
            .hex 02 06 04 e8   ; $d4e8: 02 06 04 e8   Data
            .hex e8 e0 08 d0   ; $d4ec: e8 e0 08 d0   Data
            .hex e7 60         ; $d4f0: e7 60         Data
__d4f2:     LDY $b8,X          ; $d4f2: b4 b8     
            LDA __d501,Y       ; $d4f4: b9 01 d5  
            STA $10            ; $d4f7: 85 10     
            LDA __d502,Y       ; $d4f9: b9 02 d5  
            STA $11            ; $d4fc: 85 11     
            JMP ($0010)        ; $d4fe: 6c 10 00  

;-------------------------------------------------------------------------------
__d501:     .hex 40            ; $d501: 40            Data
__d502:     .hex d8 f0 d7 0c   ; $d502: d8 f0 d7 0c   Data
            .hex d5 0c d5 0b   ; $d506: d5 0c d5 0b   Data
            .hex d5 60 20 8c   ; $d50a: d5 60 20 8c   Data
            .hex d7 b5 b9 0a   ; $d50e: d7 b5 b9 0a   Data
            .hex a8 b9 20 d5   ; $d512: a8 b9 20 d5   Data
            .hex 85 10 b9 21   ; $d516: 85 10 b9 21   Data
            .hex d5 85 11 6c   ; $d51a: d5 85 11 6c   Data
            .hex 10 00         ; $d51e: 10 00         Data
__d520:     .hex 3e            ; $d520: 3e            Data
__d521:     .hex d5 42 d5 28   ; $d521: d5 42 d5 28   Data
            .hex d5 2c d5 a0   ; $d525: d5 2c d5 a0   Data
            .hex 03 d0 02 a0   ; $d529: 03 d0 02 a0   Data
            .hex 01 b1 02 18   ; $d52d: 01 b1 02 18   Data
            .hex 75 c2 91 02   ; $d531: 75 c2 91 02   Data
            .hex a9 00 75 c3   ; $d535: a9 00 75 c3   Data
            .hex 85 cc 4c 56   ; $d539: 85 cc 4c 56   Data
            .hex d5 a0 03 d0   ; $d53d: d5 a0 03 d0   Data
            .hex 02 a0 01      ; $d541: 02 a0 01      Data
__d544:     .hex b1 02 38 f5   ; $d544: b1 02 38 f5   Data
            .hex c2 91 02 a9   ; $d548: c2 91 02 a9   Data
            .hex 00 b0 02 a9   ; $d54c: 00 b0 02 a9   Data
            .hex 01            ; $d550: 01            Data
__d551:     CLC                ; $d551: 18        
            ADC $c3,X          ; $d552: 75 c3     
            STA $CC           ; $d554: 85 cc     
__d556:     DEC $CC           ; $d556: c6 cc     
            BPL __d55b         ; $d558: 10 01     
            RTS                ; $d55a: 60        

;-------------------------------------------------------------------------------
__d55b:     LDA $b9,X          ; $d55b: b5 b9     
            ASL                ; $d55d: 0a        
            TAY                ; $d55e: a8        
            LDA __d56c,Y       ; $d55f: b9 6c d5  
            STA $10            ; $d562: 85 10     
            LDA __d56d,Y       ; $d564: b9 6d d5  
            STA $11            ; $d567: 85 11     
            JMP ($0010)        ; $d569: 6c 10 00  

;-------------------------------------------------------------------------------
__d56c:     .hex 74            ; $d56c: 74            Data
__d56d:     .hex d5 88 d5 7a   ; $d56d: d5 88 d5 7a   Data
            .hex d5 82 d5 a9   ; $d571: d5 82 d5 a9   Data
            .hex ff 85 05 d0   ; $d575: ff 85 05 d0   Data
            .hex 04 a9 01 85   ; $d579: 04 a9 01 85   Data
            .hex 05            ; $d57d: 05            Data
__d57e:     .hex a0 02 d0 0c   ; $d57e: a0 02 d0 0c   Data
            .hex a9 01 85 05   ; $d582: a9 01 85 05   Data
            .hex d0 04 a9 ff   ; $d586: d0 04 a9 ff   Data
            .hex 85 05         ; $d58a: 85 05         Data
__d58c:     LDY #$00           ; $d58c: a0 00     
__d58e:     LDA ($02),Y        ; $d58e: b1 02     
            CLC                ; $d590: 18        
            ADC $05            ; $d591: 65 05     
            STA ($02),Y        ; $d593: 91 02     
            LDY #$00           ; $d595: a0 00     
            LDA ($02),Y        ; $d597: b1 02     
            CMP #$0A           ; $d599: c9 0a     
            BNE __d5a3         ; $d59b: d0 06     
            LDA #$BF           ; $d59d: a9 bf     
            STA ($02),Y        ; $d59f: 91 02     
            BNE __d5b5         ; $d5a1: d0 12     
__d5a3:     CMP #$c0           ; $d5a3: c9 c0     
            BNE __d5ad         ; $d5a5: d0 06     
            LDA #$0B           ; $d5a7: a9 0b     
            STA ($02),Y        ; $d5a9: 91 02     
            BNE __d5b5         ; $d5ab: d0 08     
__d5ad:     CMP #$18           ; $d5ad: c9 18     
            bcc __d5b5         ; $d5af: 90 04     
            CMP #$a9           ; $d5b1: c9 a9     
            bcc __d5b9         ; $d5b3: 90 04     
__d5b5:     LDA #$20           ; $d5b5: a9 20     
            BNE __d5bb         ; $d5b7: d0 02     
__d5b9:     LDA #$00           ; $d5b9: a9 00     
__d5bb:     STA $05            ; $d5bb: 85 05     
            TXA                ; $d5bd: 8a        
            lsr                ; $d5be: 4a        
            TAY                ; $d5bf: a8        
            LDA $0039,Y        ; $d5c0: b9 39 00  
            AND #$DF           ; $d5c3: 29 df     
__d5c5:     .hex 05 05 99 39   ; $d5c5: 05 05 99 39   Data
            .hex 00 a0 00 b1   ; $d5c9: 00 a0 00 b1   Data
            .hex 02 a0 02 11   ; $d5cd: 02 a0 02 11   Data
            .hex 02 29 07 f0   ; $d5d1: 02 29 07 f0   Data
            .hex 03 4c 56 d5   ; $d5d5: 03 4c 56 d5   Data
__d5d9:     LDY #$00           ; $d5d9: a0 00     
            LDA ($02),Y        ; $d5db: b1 02     
            CMP #$60           ; $d5dd: c9 60     
            BNE __d606         ; $d5df: d0 25     
            LDY #$02           ; $d5e1: a0 02     
            LDA ($02),Y        ; $d5e3: b1 02     
            CMP #$70           ; $d5e5: c9 70     
            BNE __d606         ; $d5e7: d0 1d     
            LDA #$02           ; $d5e9: a9 02     
            STA $b8,X          ; $d5eb: 95 b8     
            LDA #$00           ; $d5ed: a9 00     
            CLC                ; $d5ef: 18        
            SBC $04            ; $d5f0: e5 04     
            AND $88            ; $d5f2: 25 88     
            STA $88            ; $d5f4: 85 88     
            TXA                ; $d5f6: 8a        
            lsr                ; $d5f7: 4a        
            TAY                ; $d5f8: a8        
            STA $05            ; $d5f9: 85 05     
            LDA $0039,Y        ; $d5fb: b9 39 00  
            AND #$FC           ; $d5fe: 29 fc     
            ORA $05            ; $d600: 05 05     
            STA $0039,Y        ; $d602: 99 39 00  
            RTS                ; $d605: 60        

;-------------------------------------------------------------------------------
__d606:     LDA $b8,X          ; $d606: b5 b8     
            CMP #$06           ; $d608: c9 06     
            BNE __d617         ; $d60a: d0 0b     
            LDA #$60           ; $d60c: a9 60     
            STA $CD          ; $d60e: 85 cd     
            LDA #$6F           ; $d610: a9 6f     
            STA $CE           ; $d612: 85 ce     
            JMP __d6e3         ; $d614: 4c e3 d6  

;-------------------------------------------------------------------------------
__d617:     LDA $04            ; $d617: a5 04     
            AND $88            ; $d619: 25 88     
            BNE __d675         ; $d61b: d0 58     
            LDA $04            ; $d61d: a5 04     
            AND $87            ; $d61f: 25 87     
            BNE __d63a         ; $d621: d0 17     
__d623:     .hex 8a a8 b9 32   ; $d623: 8a a8 b9 32   Data
            .hex d6 85 cd b9   ; $d627: d6 85 cd b9   Data
            .hex 33 d6 85 ce   ; $d62b: 33 d6 85 ce   Data
            .hex 4c e3 d6      ; $d62f: 4c e3 d6      Data
__d632:     .hex a8            ; $d632: a8            Data
__d633:     .hex 08 18 08 a8   ; $d633: 08 18 08 a8   Data
            .hex d0 18 d0      ; $d637: d0 18 d0      Data
__d63a:     TXA                ; $d63a: 8a        
            TAY                ; $d63b: a8        
            LDA __d649,Y       ; $d63c: b9 49 d6  
            STA $10            ; $d63f: 85 10     
            LDA __d64a,Y       ; $d641: b9 4a d6  
            STA $11            ; $d644: 85 11     
            JMP ($0010)        ; $d646: 6c 10 00  

;-------------------------------------------------------------------------------
__d649:     .hex a6            ; $d649: a6            Data
__d64a:     .hex d6 b0 d6 cf   ; $d64a: d6 b0 d6 cf   Data
            .hex d6 51 d6      ; $d64e: d6 51 d6      Data
__d651:     .hex a5 1a 38 e5   ; $d651: a5 1a 38 e5   Data
            .hex 2a b0 07 85   ; $d655: 2a b0 07 85   Data
            .hex 05 a9 00 38   ; $d659: 05 a9 00 38   Data
            .hex e5 05         ; $d65d: e5 05         Data
__d65f:     CMP #$20           ; $d65f: c9 20     
            BCS __d6a6         ; $d661: b0 43     
            LDA $1C            ; $d663: a5 1c     
            SEC                ; $d665: 38        
            SBC $2C            ; $d666: e5 2c     
            BCS __d671         ; $d668: b0 07     
            STA $05            ; $d66a: 85 05     
            LDA #$00           ; $d66c: a9 00     
            SEC                ; $d66e: 38        
            SBC $05            ; $d66f: e5 05     
__d671:     CMP #$20           ; $d671: c9 20     
            BCS __d6a6         ; $d673: b0 31     
__d675:     LDA Frame_Ctr      ; $d675: a5 4b     
            STA $05            ; $d677: 85 05     
            LDA #$05           ; $d679: a9 05     
            STA $06            ; $d67b: 85 06     
__d67d:     DEC $06            ; $d67d: c6 06     
            BNE __d685         ; $d67f: d0 04     
            LDA #$02           ; $d681: a9 02     
            BNE __d6a1         ; $d683: d0 1c     
__d685:     INC $05            ; $d685: e6 05     
            LDA $05            ; $d687: a5 05     
            AND #$03           ; $d689: 29 03     
            TAY                ; $d68b: a8        
            LDA ($00),Y        ; $d68c: b1 00     
            AND #$F8           ; $d68e: 29 f8     
            BNE __d67d         ; $d690: d0 eb     
            LDA $05            ; $d692: a5 05     
            CLC                ; $d694: 18        
            ADC #$02           ; $d695: 69 02     
            AND #$03           ; $d697: 29 03     
            CMP $b9,X          ; $d699: d5 b9     
            BEQ __d67d         ; $d69b: f0 e0     
            LDA $05            ; $d69d: a5 05     
            AND #$03           ; $d69f: 29 03     
__d6a1:     STA $b9,X          ; $d6a1: 95 b9     
            JMP __d556         ; $d6a3: 4c 56 d5  

;-------------------------------------------------------------------------------
__d6a6:     LDA $1A            ; $d6a6: a5 1a     
            STA $CD          ; $d6a8: 85 cd     
            LDA $1C            ; $d6aa: a5 1c     
            STA $CE           ; $d6ac: 85 ce     
            BNE __d6e3         ; $d6ae: d0 33     
            LDA $51            ; $d6b0: a5 51     
            ASL                ; $d6b2: 0a        
            TAY                ; $d6b3: a8        
            LDA __d6c7,Y       ; $d6b4: b9 c7 d6  
            CLC                ; $d6b7: 18        
            ADC $1A            ; $d6b8: 65 1a     
            STA $CD          ; $d6ba: 85 cd     
            LDA __d6c8,Y       ; $d6bc: b9 c8 d6  
            CLC                ; $d6bf: 18        
            ADC $1C            ; $d6c0: 65 1c     
            STA $CE           ; $d6c2: 85 ce     
            JMP __d6e3         ; $d6c4: 4c e3 d6  

;-------------------------------------------------------------------------------
__d6c7:     .hex 00            ; $d6c7: 00            Data
__d6c8:     .hex e8 e8 00 00   ; $d6c8: e8 e8 00 00   Data
            .hex 18 18 00 a5   ; $d6cc: 18 18 00 a5   Data
            .hex 1a 38 e5 1e   ; $d6d0: 1a 38 e5 1e   Data
            .hex 18 65 1a 85   ; $d6d4: 18 65 1a 85   Data
            .hex cd a5 1c 38   ; $d6d8: cd a5 1c 38   Data
            .hex e5 20 18 65   ; $d6dc: e5 20 18 65   Data
            .hex 1c 85 ce      ; $d6e0: 1c 85 ce      Data
__d6e3:     LDA $b8,X          ; $d6e3: b5 b8     
            SEC                ; $d6e5: 38        
            SBC #$04           ; $d6e6: e9 04     
            TAY                ; $d6e8: a8        
            LDA __d7ec,Y       ; $d6e9: b9 ec d7  
            STA $0A            ; $d6ec: 85 0a     
            LDA __d7ed,Y       ; $d6ee: b9 ed d7  
            STA $0B            ; $d6f1: 85 0b     
            JSR __e42b         ; $d6f3: 20 2b e4  
            LDA $0C            ; $d6f6: a5 0c     
            CMP #$FF           ; $d6f8: c9 ff     
            BNE __d700         ; $d6fa: d0 04     
            LDA #$02           ; $d6fc: a9 02     
            BNE __d708         ; $d6fe: d0 08     
__d700:     LDA $0D            ; $d700: a5 0d     
            CMP #$FF           ; $d702: c9 ff     
            BNE __d70b         ; $d704: d0 05     
            LDA $0C            ; $d706: a5 0c     
__d708:     STA $b9,X          ; $d708: 95 b9     
            RTS                ; $d70a: 60        

;-------------------------------------------------------------------------------
__d70b:     LDY #$00           ; $d70b: a0 00     
            STY $05            ; $d70d: 84 05     
            LDA $CD          ; $d70f: a5 cd     
            SEC                ; $d711: 38        
            SBC ($02),Y        ; $d712: f1 02     
            BCS __d725         ; $d714: b0 0f     
            STA $08            ; $d716: 85 08     
            LDA #$00           ; $d718: a9 00     
            SEC                ; $d71a: 38        
            SBC $08            ; $d71b: e5 08     
            INC $05            ; $d71d: e6 05     
            INC $05            ; $d71f: e6 05     
            INC $05            ; $d721: e6 05     
            INC $05            ; $d723: e6 05     
__d725:     STA $06            ; $d725: 85 06     
            LDA $CE           ; $d727: a5 ce     
            LDY #$02           ; $d729: a0 02     
            SEC                ; $d72b: 38        
            SBC ($02),Y        ; $d72c: f1 02     
            BCS __d73b         ; $d72e: b0 0b     
            STA $08            ; $d730: 85 08     
            LDA #$00           ; $d732: a9 00     
            SEC                ; $d734: 38        
            SBC $08            ; $d735: e5 08     
            INC $05            ; $d737: e6 05     
            INC $05            ; $d739: e6 05     
__d73b:     STA $07            ; $d73b: 85 07     
            LDA $06            ; $d73d: a5 06     
            CMP $07            ; $d73f: c5 07     
            BCS __d745         ; $d741: b0 02     
            INC $05            ; $d743: e6 05     
__d745:     LDA $05            ; $d745: a5 05     
            ASL                ; $d747: 0a        
            STA $05            ; $d748: 85 05     
            LDA #$02           ; $d74a: a9 02     
            STA $06            ; $d74c: 85 06     
__d74e:     LDY $05            ; $d74e: a4 05     
            LDA __d7dc,Y       ; $d750: b9 dc d7  
            LDY #$00           ; $d753: a0 00     
__d755:     CMP $000c,Y        ; $d755: d9 0c 00  
            BEQ __d708         ; $d758: f0 ae     
            INY                ; $d75a: c8        
            CPY #$04           ; $d75b: c0 04     
            BNE __d755         ; $d75d: d0 f6     
            INC $05            ; $d75f: e6 05     
            DEC $06            ; $d761: c6 06     
            BNE __d74e         ; $d763: d0 e9     
            LDA $b9,X          ; $d765: b5 b9     
            SEC                ; $d767: 38        
            SBC #$01           ; $d768: e9 01     
            AND #$03           ; $d76a: 29 03     
            LDY #$00           ; $d76c: a0 00     
__d76e:     CMP $000c,Y        ; $d76e: d9 0c 00  
            BEQ __d708         ; $d771: f0 95     
            INY                ; $d773: c8        
            CPY #$04           ; $d774: c0 04     
            BNE __d76e         ; $d776: d0 f6     
            LDA $b9,X          ; $d778: b5 b9     
            CLC                ; $d77a: 18        
            ADC #$01           ; $d77b: 69 01     
            AND #$03           ; $d77d: 29 03     
            LDY #$00           ; $d77f: a0 00     
__d781:     CMP $000c,Y        ; $d781: d9 0c 00  
            BEQ __d708         ; $d784: f0 82     
            INY                ; $d786: c8        
            CPY #$04           ; $d787: c0 04     
            BNE __d781         ; $d789: d0 f6     
            RTS                ; $d78b: 60        

;-------------------------------------------------------------------------------
__d78c:     .hex b5 b8 c9 06   ; $d78c: b5 b8 c9 06   Data
            .hex f0 41 a0 02   ; $d790: f0 41 a0 02   Data
            .hex b1 02 c9 70   ; $d794: b1 02 c9 70   Data
            .hex d0 15 a0 00   ; $d798: d0 15 a0 00   Data
            .hex b1 02 c9 90   ; $d79c: b1 02 c9 90   Data
            .hex b0 04 c9 30   ; $d7a0: b0 04 c9 30   Data
            .hex b0 09         ; $d7a4: b0 09         Data
__d7a6:     LDA $b3            ; $d7a6: a5 b3     
            STA $c2,X          ; $d7a8: 95 c2     
            LDA $b4            ; $d7aa: a5 b4     
            STA $c3,X          ; $d7ac: 95 c3     
            RTS                ; $d7ae: 60        

;-------------------------------------------------------------------------------
__d7af:     LDA $04            ; $d7af: a5 04     
            AND $88            ; $d7b1: 25 88     
            BNE __d7ca         ; $d7b3: d0 15     
            TXA                ; $d7b5: 8a        
            BNE __d7c1         ; $d7b6: d0 09     
            LDA $CA           ; $d7b8: a5 ca     
            STA $c2            ; $d7ba: 85 c2     
            LDA $CB           ; $d7bc: a5 cb     
            STA $c3            ; $d7be: 85 c3     
            RTS                ; $d7c0: 60        

;-------------------------------------------------------------------------------
__d7c1:     LDA $AF            ; $d7c1: a5 af     
            STA $c2,X          ; $d7c3: 95 c2     
            LDA $b0            ; $d7c5: a5 b0     
            STA $c3,X          ; $d7c7: 95 c3     
            RTS                ; $d7c9: 60        

;-------------------------------------------------------------------------------
__d7ca:     LDA $b1            ; $d7ca: a5 b1     
            STA $c2,X          ; $d7cc: 95 c2     
            LDA $b2            ; $d7ce: a5 b2     
            STA $c3,X          ; $d7d0: 95 c3     
            RTS                ; $d7d2: 60        

;-------------------------------------------------------------------------------
__d7d3:     LDA #$00           ; $d7d3: a9 00     
            STA $c2,X          ; $d7d5: 95 c2     
            LDA #$02           ; $d7d7: a9 02     
            STA $c3,X          ; $d7d9: 95 c3     
            RTS                ; $d7db: 60        

;-------------------------------------------------------------------------------
__d7dc:     .hex 03 02 02 03   ; $d7dc: 03 02 02 03   Data
            .hex 03 00 00 03   ; $d7e0: 03 00 00 03   Data
            .hex 01 02 02 01   ; $d7e4: 01 02 02 01   Data
            .hex 01 00 00 01   ; $d7e8: 01 00 00 01   Data
__d7ec:     .hex 00            ; $d7ec: 00            Data
__d7ed:     .hex 00 2c 08 a9   ; $d7ed: 00 2c 08 a9   Data
            .hex 00 a8 85 05   ; $d7f1: 00 a8 85 05   Data
            .hex a9 80 85 06   ; $d7f5: a9 80 85 06   Data
            .hex b1 02 c9 60   ; $d7f9: b1 02 c9 60   Data
            .hex f0 1e 90 06   ; $d7fd: f0 1e 90 06   Data
            .hex c6 05 a9 01   ; $d801: c6 05 a9 01   Data
            .hex d0 02         ; $d805: d0 02         Data
__d807:     .hex a9 03         ; $d807: a9 03         Data
__d809:     .hex 95 b9 a0 01   ; $d809: 95 b9 a0 01   Data
            .hex b1 02 18 65   ; $d80d: b1 02 18 65   Data
            .hex 06 91 02 a0   ; $d811: 06 91 02 a0   Data
            .hex 00 b1 02 65   ; $d815: 00 b1 02 65   Data
            .hex 05 91 02 60   ; $d819: 05 91 02 60   Data
__d81d:     .hex a9 00 95 b9   ; $d81d: a9 00 95 b9   Data
            .hex a0 03 b1 02   ; $d821: a0 03 b1 02   Data
            .hex 38 e9 80 91   ; $d825: 38 e9 80 91   Data
            .hex 02 a0 02 b1   ; $d829: 02 a0 02 b1   Data
            .hex 02 e9 00 91   ; $d82d: 02 e9 00 91   Data
            .hex 02 c9 58 f0   ; $d831: 02 c9 58 f0   Data
            .hex 01 60         ; $d835: 01 60         Data
__d837:     LDA #$01           ; $d837: a9 01     
            STA $b9,X          ; $d839: 95 b9     
            LDA #$04           ; $d83b: a9 04     
            STA $b8,X          ; $d83d: 95 b8     
            RTS                ; $d83f: 60        

;-------------------------------------------------------------------------------
            LDA #$00           ; $d840: a9 00     
            STA $05            ; $d842: 85 05     
            LDA #$80           ; $d844: a9 80     
            STA $06            ; $d846: 85 06     
            LDY $b9,X          ; $d848: b4 b9     
            LDA __d857,Y       ; $d84a: b9 57 d8  
            STA $10            ; $d84d: 85 10     
            LDA __d858,Y       ; $d84f: b9 58 d8  
            STA $11            ; $d852: 85 11     
            JMP ($0010)        ; $d854: 6c 10 00  

;-------------------------------------------------------------------------------
__d857:     .hex 5b            ; $d857: 5b            Data
__d858:     .hex d8 5d d8 c6   ; $d858: d8 5d d8 c6   Data
            .hex 05 a0 03 b1   ; $d85c: 05 a0 03 b1   Data
            .hex 02 18 65 06   ; $d860: 02 18 65 06   Data
            .hex 91 02 a0 02   ; $d864: 91 02 a0 02   Data
            .hex b1 02 65 05   ; $d868: b1 02 65 05   Data
            .hex 91 02 c9 69   ; $d86c: 91 02 c9 69   Data
            .hex b0 04 a9 02   ; $d870: b0 04 a9 02   Data
            .hex d0 06         ; $d874: d0 06         Data
__d876:     .hex c9 70 90 04   ; $d876: c9 70 90 04   Data
            .hex a9 00         ; $d87a: a9 00         Data
__d87c:     .hex 95 b9         ; $d87c: 95 b9         Data
__d87e:     RTS                ; $d87e: 60        

;-------------------------------------------------------------------------------
__d87f:     .hex a2 00 a9 2f   ; $d87f: a2 00 a9 2f   Data
            .hex 85 00 a9 02   ; $d883: 85 00 a9 02   Data
            .hex 85 01 a9 1e   ; $d887: 85 01 a9 1e   Data
            .hex 85 02 a9 00   ; $d88b: 85 02 a9 00   Data
            .hex 85 03 a9 01   ; $d88f: 85 03 a9 01   Data
            .hex 85 04         ; $d893: 85 04         Data
__d895:     JSR __d8af         ; $d895: 20 af d8  
            LDA $00            ; $d898: a5 00     
            CLC                ; $d89a: 18        
            ADC #$04           ; $d89b: 69 04     
            STA $00            ; $d89d: 85 00     
            LDA $02            ; $d89f: a5 02     
            CLC                ; $d8a1: 18        
            ADC #$04           ; $d8a2: 69 04     
            STA $02            ; $d8a4: 85 02     
            ASL $04            ; $d8a6: 06 04     
            INX                ; $d8a8: e8        
            INX                ; $d8a9: e8        
            CPX #$08           ; $d8aa: e0 08     
            BNE __d895         ; $d8ac: d0 e7     
            RTS                ; $d8ae: 60        

;-------------------------------------------------------------------------------
__d8af:     LDY $b8,X          ; $d8af: b4 b8     
            LDA __d8be,Y       ; $d8b1: b9 be d8  
            STA $10            ; $d8b4: 85 10     
            LDA __d8bf,Y       ; $d8b6: b9 bf d8  
            STA $11            ; $d8b9: 85 11     
            JMP ($0010)        ; $d8bb: 6c 10 00  

;-------------------------------------------------------------------------------
__d8be:     .hex c8            ; $d8be: c8            Data
__d8bf:     .hex d8 c8 d8 c8   ; $d8bf: d8 c8 d8 c8   Data
            .hex d8 0c d5 c8   ; $d8c3: d8 0c d5 c8   Data
            .hex d8 60         ; $d8c7: d8 60         Data
__d8c9:     LDX #$00           ; $d8c9: a2 00     
            STX $00            ; $d8cb: 86 00     
__d8cd:     LDA $b8,X          ; $d8cd: b5 b8     
            CMP #$06           ; $d8cf: c9 06     
            BNE __d8d7         ; $d8d1: d0 04     
            STA $0608          ; $d8d3: 8d 08 06  
            RTS                ; $d8d6: 60        

;-------------------------------------------------------------------------------
__d8d7:     INX                ; $d8d7: e8        
            INX                ; $d8d8: e8        
            CPX #$08           ; $d8d9: e0 08     
            BNE __d8cd         ; $d8db: d0 f0     
            LDA $88            ; $d8dd: a5 88     
            BEQ __d8e5         ; $d8df: f0 04     
            STA $0609          ; $d8e1: 8d 09 06  
            RTS                ; $d8e4: 60        

;-------------------------------------------------------------------------------
__d8e5:     LDY #$00           ; $d8e5: a0 00     
            LDA $6A            ; $d8e7: a5 6a     
            CMP #$88           ; $d8e9: c9 88     
            BCS __d8f3         ; $d8eb: b0 06     
            INY                ; $d8ed: c8        
            CMP #$42           ; $d8ee: c9 42     
            BCS __d8f3         ; $d8f0: b0 01     
            INY                ; $d8f2: c8        
__d8f3:     LDA #$01           ; $d8f3: a9 01     
            STA $060a,Y        ; $d8f5: 99 0a 06  
            RTS                ; $d8f8: 60        

;-------------------------------------------------------------------------------
__d8f9:     LDA $51            ; $d8f9: a5 51     
            ASL                ; $d8fb: 0a        
            CLC                ; $d8fc: 18        
            ADC #$02           ; $d8fd: 69 02     
            STA $00            ; $d8ff: 85 00     
            LDA $1A            ; $d901: a5 1a     
            ORA $1C            ; $d903: 05 1c     
            AND #$07           ; $d905: 29 07     
            BNE __d919         ; $d907: d0 10     
            LDY $51            ; $d909: a4 51     
            LDA $022b,Y        ; $d90b: b9 2b 02  
            AND #$f0           ; $d90e: 29 f0     
            BEQ __d919         ; $d910: f0 07     
            LDA $B7            ; $d912: a5 b7     
            AND #$03           ; $d914: 29 03     
            JMP __d91d         ; $d916: 4c 1d d9  

;-------------------------------------------------------------------------------
__d919:     INC $B7            ; $d919: e6 b7     
            LDA $B7            ; $d91b: a5 b7     
__d91d:     AND #$07           ; $d91d: 29 07     
            CMP #$06           ; $d91f: c9 06     
            bcc __d927         ; $d921: 90 04     
            LDA #$01           ; $d923: a9 01     
            BNE __d92e         ; $d925: d0 07     
__d927:     TAY                ; $d927: a8        
            LDA __d931,Y       ; $d928: b9 31 d9  
            CLC                ; $d92b: 18        
            ADC $00            ; $d92c: 65 00     
__d92e:     STA $32            ; $d92e: 85 32     
            RTS                ; $d930: 60        

;-------------------------------------------------------------------------------
__d931:     .hex 00 00 00 01   ; $d931: 00 00 00 01   Data
            .hex 01 00         ; $d935: 01 00         Data
__d937:     LDA #$00           ; $d937: a9 00     
            TAX                ; $d939: aa        
            STA $00            ; $d93a: 85 00     
            LDA Frame_Ctr      ; $d93c: a5 4b     
            AND #$08           ; $d93e: 29 08     
            BEQ __d946         ; $d940: f0 04     
            LDA #$01           ; $d942: a9 01     
            STA $00            ; $d944: 85 00     
__d946:     LDA #$01           ; $d946: a9 01     
            STA $01            ; $d948: 85 01     
__d94a:     JSR __d956         ; $d94a: 20 56 d9  
            ASL $01            ; $d94d: 06 01     
            INX                ; $d94f: e8        
            INX                ; $d950: e8        
            CPX #$08           ; $d951: e0 08     
            BNE __d94a         ; $d953: d0 f5     
__d955:     .hex 60            ; $d955: 60            Data
__d956:     LDY $b8,X          ; $d956: b4 b8     
            LDA __d965,Y       ; $d958: b9 65 d9  
            STA $10            ; $d95b: 85 10     
            LDA __d966,Y       ; $d95d: b9 66 d9  
            STA $11            ; $d960: 85 11     
            JMP ($0010)        ; $d962: 6c 10 00  

;-------------------------------------------------------------------------------
__d965:     .hex 8c            ; $d965: 8c            Data
__d966:     .hex d9 8c d9 8c   ; $d966: d9 8c d9 8c   Data
            .hex d9 98 d9 55   ; $d96a: d9 98 d9 55   Data
            .hex d9            ; $d96e: d9            Data
__d96f:     .hex b5 b9 85 03   ; $d96f: b5 b9 85 03   Data
            .hex a9 0a         ; $d973: a9 0a         Data
__d975:     DEC $03            ; $d975: c6 03     
            BMI __d97e         ; $d977: 30 05     
            CLC                ; $d979: 18        
            ADC #$02           ; $d97a: 69 02     
            BNE __d975         ; $d97c: d0 f7     
__d97e:     CLC                ; $d97e: 18        
            ADC $00            ; $d97f: 65 00     
            STA $02            ; $d981: 85 02     
__d983:     TXA                ; $d983: 8a        
            lsr                ; $d984: 4a        
            TAY                ; $d985: a8        
            LDA $02            ; $d986: a5 02     
            STA $0033,Y        ; $d988: 99 33 00  
            RTS                ; $d98b: 60        

;-------------------------------------------------------------------------------
__d98c:     .hex a5 01 25 88   ; $d98c: a5 01 25 88   Data
            .hex f0 dd a9 1e   ; $d990: f0 dd a9 1e   Data
            .hex 85 02 d0 e6   ; $d994: 85 02 d0 e6   Data
            .hex b5 b9 85 03   ; $d998: b5 b9 85 03   Data
            .hex a9 20         ; $d99c: a9 20         Data
__d99e:     DEC $03            ; $d99e: c6 03     
            BMI __d9a7         ; $d9a0: 30 05     
            CLC                ; $d9a2: 18        
            ADC #$01           ; $d9a3: 69 01     
            BNE __d99e         ; $d9a5: d0 f7     
__d9a7:     STA $02            ; $d9a7: 85 02     
            BMI __d983         ; $d9a9: 30 d8     
__d9ab:     LDX #$23           ; $d9ab: a2 23     
__d9ad:     LDA $1A,X          ; $d9ad: b5 1a     
            STA $0274,X        ; $d9af: 9d 74 02  
            DEX                ; $d9b2: ca        
            BPL __d9ad         ; $d9b3: 10 f8     
            LDA #$84           ; $d9b5: a9 84     
            STA $00            ; $d9b7: 85 00     
            LDA #$02           ; $d9b9: a9 02     
            STA $01            ; $d9bb: 85 01     
            LDA #$08           ; $d9bd: a9 08     
            STA $03            ; $d9bf: 85 03     
            LDA #$03           ; $d9c1: a9 03     
            STA $02            ; $d9c3: 85 02     
__d9c5:     LDA $03            ; $d9c5: a5 03     
            AND $88            ; $d9c7: 25 88     
            BNE __da46         ; $d9c9: d0 7b     
            LDY #$00           ; $d9cb: a0 00     
            LDA $0274          ; $d9cd: ad 74 02  
            CMP ($00),Y        ; $d9d0: d1 00     
            BCS __d9dc         ; $d9d2: b0 08     
            LDA ($00),Y        ; $d9d4: b1 00     
            SEC                ; $d9d6: 38        
            SBC $0274          ; $d9d7: ed 74 02  
            BCS __d9de         ; $d9da: b0 02     
__d9dc:     SBC ($00),Y        ; $d9dc: f1 00     
__d9de:     CMP #$19           ; $d9de: c9 19     
            BCS __da46         ; $d9e0: b0 64     
            STA $04            ; $d9e2: 85 04     
            LDY #$02           ; $d9e4: a0 02     
            LDA $0276          ; $d9e6: ad 76 02  
            CMP ($00),Y        ; $d9e9: d1 00     
            BCS __d9f5         ; $d9eb: b0 08     
            LDA ($00),Y        ; $d9ed: b1 00     
            SEC                ; $d9ef: 38        
            SBC $0276          ; $d9f0: ed 76 02  
            BCS __d9f7         ; $d9f3: b0 02     
__d9f5:     SBC ($00),Y        ; $d9f5: f1 00     
__d9f7:     CMP #$19           ; $d9f7: c9 19     
            BCS __da46         ; $d9f9: b0 4b     
            ADC $04            ; $d9fb: 65 04     
            CMP #$10           ; $d9fd: c9 10     
            BCS __da46         ; $d9ff: b0 45     
            LDA $0274          ; $da01: ad 74 02  
            STA $03            ; $da04: 85 03     
            LDA $0276          ; $da06: ad 76 02  
            STA $04            ; $da09: 85 04     
            LDA $028c          ; $da0b: ad 8c 02  
            STA $05            ; $da0e: 85 05     
            LDA $0292          ; $da10: ad 92 02  
            STA $06            ; $da13: 85 06     
            LDY #$00           ; $da15: a0 00     
            LDA ($00),Y        ; $da17: b1 00     
            STA $0274          ; $da19: 8d 74 02  
            LDA $03            ; $da1c: a5 03     
            STA ($00),Y        ; $da1e: 91 00     
            LDY #$02           ; $da20: a0 02     
            LDA ($00),Y        ; $da22: b1 00     
            STA $0276          ; $da24: 8d 76 02  
            LDA $04            ; $da27: a5 04     
            STA ($00),Y        ; $da29: 91 00     
            LDX $02            ; $da2b: a6 02     
            LDA $028d,X        ; $da2d: bd 8d 02  
            STA $028c          ; $da30: 8d 8c 02  
            LDA $05            ; $da33: a5 05     
            STA $028d,X        ; $da35: 9d 8d 02  
            LDA $0293,X        ; $da38: bd 93 02  
            STA $0292          ; $da3b: 8d 92 02  
            LDA $06            ; $da3e: a5 06     
            STA $0293,X        ; $da40: 9d 93 02  
            JMP __da56         ; $da43: 4c 56 da  

;-------------------------------------------------------------------------------
__da46:     LDA $00            ; $da46: a5 00     
            SEC                ; $da48: 38        
            SBC #$04           ; $da49: e9 04     
            STA $00            ; $da4b: 85 00     
            lsr $03            ; $da4d: 46 03     
            DEC $02            ; $da4f: c6 02     
            BMI __da56         ; $da51: 30 03     
            JMP __d9c5         ; $da53: 4c c5 d9  

;-------------------------------------------------------------------------------
__da56:     JSR __e154         ; $da56: 20 54 e1  
            JMP __da5c         ; $da59: 4c 5c da  

;-------------------------------------------------------------------------------
__da5c:     LDA #$74           ; $da5c: a9 74     
            STA $00            ; $da5e: 85 00     
            LDA #$02           ; $da60: a9 02     
            STA $01            ; $da62: 85 01     
            LDA #$00           ; $da64: a9 00     
            STA $02            ; $da66: 85 02     
            LDA #$07           ; $da68: a9 07     
            STA $03            ; $da6a: 85 03     
            LDA #$00           ; $da6c: a9 00     
            STA $04            ; $da6e: 85 04     
__da70:     LDA #$00           ; $da70: a9 00     
            STA $05            ; $da72: 85 05     
            TAX                ; $da74: aa        
__da75:     LDY #$02           ; $da75: a0 02     
            LDA ($00),Y        ; $da77: b1 00     
            BNE __da7f         ; $da79: d0 04     
            LDA #$FF           ; $da7b: a9 ff     
            BNE __da83         ; $da7d: d0 04     
__da7f:     CLC                ; $da7f: 18        
            ADC __ddc1,X       ; $da80: 7d c1 dd  
__da83:     LDY #$00           ; $da83: a0 00     
            STA ($02),Y        ; $da85: 91 02     
            LDY $04            ; $da87: a4 04     
            LDA $028c,Y        ; $da89: b9 8c 02  
            ASL                ; $da8c: 0a        
            rol                ; $da8d: 2a        
            rol                ; $da8e: 2a        
            AND #$03           ; $da8f: 29 03     
            BEQ __dabc         ; $da91: f0 29     
            CMP #$02           ; $da93: c9 02     
            BEQ __db02         ; $da95: f0 6b     
            bcc __dadf         ; $da97: 90 46     
            LDA $028c,Y        ; $da99: b9 8c 02  
            ASL                ; $da9c: 0a        
            ASL                ; $da9d: 0a        
            CLC                ; $da9e: 18        
            ADC $05            ; $da9f: 65 05     
            TAY                ; $daa1: a8        
            STA $06            ; $daa2: 85 06     
            LDA __dc8d,Y       ; $daa4: b9 8d dc  
            LDY #$01           ; $daa7: a0 01     
            STA ($02),Y        ; $daa9: 91 02     
            LDY $04            ; $daab: a4 04     
            LDA $0292,Y        ; $daad: b9 92 02  
            LDY $06            ; $dab0: a4 06     
            ORA __ddc1,Y       ; $dab2: 19 c1 dd  
            LDY #$02           ; $dab5: a0 02     
            STA ($02),Y        ; $dab7: 91 02     
            JMP __db22         ; $dab9: 4c 22 db  

;-------------------------------------------------------------------------------
__dabc:     LDA $028c,Y        ; $dabc: b9 8c 02  
            ASL                ; $dabf: 0a        
            ASL                ; $dac0: 0a        
            CLC                ; $dac1: 18        
            ADC $05            ; $dac2: 65 05     
            TAY                ; $dac4: a8        
            STA $06            ; $dac5: 85 06     
            LDA __db59,Y       ; $dac7: b9 59 db  
            LDY #$01           ; $daca: a0 01     
            STA ($02),Y        ; $dacc: 91 02     
            LDY $04            ; $dace: a4 04     
            LDA $0292,Y        ; $dad0: b9 92 02  
            LDY $06            ; $dad3: a4 06     
            ORA __dc8d,Y       ; $dad5: 19 8d dc  
            LDY #$02           ; $dad8: a0 02     
            STA ($02),Y        ; $dada: 91 02     
            JMP __db22         ; $dADC: 4c 22 db  

;-------------------------------------------------------------------------------
__dadf:     LDA $028c,Y        ; $dadf: b9 8c 02  
            ASL                ; $dae2: 0a        
            ASL                ; $dae3: 0a        
            CLC                ; $dae4: 18        
            ADC $05            ; $dae5: 65 05     
            TAY                ; $dae7: a8        
            STA $06            ; $dae8: 85 06     
            LDA __dc59,Y       ; $daea: b9 59 dc  
            LDY #$01           ; $daed: a0 01     
            STA ($02),Y        ; $daef: 91 02     
            LDY $04            ; $daf1: a4 04     
            LDA $0292,Y        ; $daf3: b9 92 02  
            LDY $06            ; $daf6: a4 06     
            ORA __dd8d,Y       ; $daf8: 19 8d dd  
            LDY #$02           ; $dafb: a0 02     
            STA ($02),Y        ; $dafd: 91 02     
            JMP __db22         ; $daff: 4c 22 db  

;-------------------------------------------------------------------------------
__db02:     LDA $028c,Y        ; $db02: b9 8c 02  
            ASL                ; $db05: 0a        
            ASL                ; $db06: 0a        
            CLC                ; $db07: 18        
            ADC $05            ; $db08: 65 05     
            TAY                ; $db0a: a8        
            STA $06            ; $db0b: 85 06     
            LDA __dc8d,Y       ; $db0d: b9 8d dc  
            LDY #$01           ; $db10: a0 01     
            STA ($02),Y        ; $db12: 91 02     
            LDY $04            ; $db14: a4 04     
            LDA $0292,Y        ; $db16: b9 92 02  
            LDY $06            ; $db19: a4 06     
            ORA __ddc1,Y       ; $db1b: 19 c1 dd  
            LDY #$02           ; $db1e: a0 02     
            STA ($02),Y        ; $db20: 91 02     
__db22:     LDY #$00           ; $db22: a0 00     
            LDA ($00),Y        ; $db24: b1 00     
            BNE __db2c         ; $db26: d0 04     
            LDA #$FF           ; $db28: a9 ff     
            BNE __db30         ; $db2a: d0 04     
__db2c:     CLC                ; $db2c: 18        
            ADC __ddc2,X       ; $db2d: 7d c2 dd  
__db30:     LDY #$03           ; $db30: a0 03     
            STA ($02),Y        ; $db32: 91 02     
            LDA $02            ; $db34: a5 02     
            CLC                ; $db36: 18        
            ADC #$04           ; $db37: 69 04     
            STA $02            ; $db39: 85 02     
            INC $05            ; $db3b: e6 05     
            INX                ; $db3d: e8        
            INX                ; $db3e: e8        
            CPX #$08           ; $db3f: e0 08     
            BEQ __db46         ; $db41: f0 03     
            JMP __da75         ; $db43: 4c 75 da  

;-------------------------------------------------------------------------------
__db46:     LDA $00            ; $db46: a5 00     
            CLC                ; $db48: 18        
            ADC #$04           ; $db49: 69 04     
            STA $00            ; $db4b: 85 00     
            INC $04            ; $db4d: e6 04     
            LDA $04            ; $db4f: a5 04     
            CMP #$06           ; $db51: c9 06     
            BEQ __db58         ; $db53: f0 03     
            JMP __da70         ; $db55: 4c 70 da  

;-------------------------------------------------------------------------------
__db58:     RTS                ; $db58: 60        

;-------------------------------------------------------------------------------
__db59:     .hex 4c 4c 4c 4c   ; $db59: 4c 4c 4c 4c   Data
            .hex 00 00 00 00   ; $db5d: 00 00 00 00   Data
            .hex 04 04 03 03   ; $db61: 04 04 03 03   Data
            .hex 08 08 07 07   ; $db65: 08 08 07 07   Data
            .hex 02 01 02 01   ; $db69: 02 01 02 01   Data
            .hex 06 05 06 05   ; $db6d: 06 05 06 05   Data
            .hex 03 03 04 04   ; $db71: 03 03 04 04   Data
            .hex 07 07 08 08   ; $db75: 07 07 08 08   Data
            .hex 01 02 01      ; $db79: 01 02 01      Data
__db7c:     .hex 02 05 06 05   ; $db7c: 02 05 06 05   Data
            .hex 06 18 18 19   ; $db80: 06 18 18 19   Data
            .hex 19 18 18 1a   ; $db84: 19 18 18 1a   Data
            .hex 1a 1b 1c 1d   ; $db88: 1a 1b 1c 1d   Data
            .hex 1f 1b 1c 1e   ; $db8c: 1f 1b 1c 1e   Data
            .hex 20 21 21 22   ; $db90: 20 21 21 22   Data
            .hex 22 21 21 23   ; $db94: 22 21 21 23   Data
            .hex 23 1c 1b 1f   ; $db98: 23 1c 1b 1f   Data
            .hex 1d 1c 1b 20   ; $db9c: 1d 1c 1b 20   Data
            .hex 1e 00 00 00   ; $dba0: 1e 00 00 00   Data
            .hex 00 09 09 0a   ; $dba4: 00 09 09 0a   Data
            .hex 0a 0b 0b 0c   ; $dba8: 0a 0b 0b 0c   Data
            .hex 0c 4c 4c 0d   ; $dbac: 0c 4c 4c 0d   Data
            .hex 0d 4c 4c 0e   ; $dbb0: 0d 4c 4c 0e   Data
            .hex 0e 4c 4c 0f   ; $dbb4: 0e 4c 4c 0f   Data
            .hex 0f 4c 4c 10   ; $dbb8: 0f 4c 4c 10   Data
            .hex 10 4c 4c 11   ; $dbbc: 10 4c 4c 11   Data
            .hex 11 4c 4c 12   ; $dbc0: 11 4c 4c 12   Data
            .hex 12 4c 4c 13   ; $dbc4: 12 4c 4c 13   Data
            .hex 13 14 15 16   ; $dbc8: 13 14 15 16   Data
            .hex 17 4c 4c 4c   ; $dbcc: 17 4c 4c 4c   Data
            .hex 4c 24 24 25   ; $dbd0: 4c 24 24 25   Data
            .hex 25 24 24 26   ; $dbd4: 25 24 24 26   Data
            .hex 26 27         ; $dbd8: 26 27         Data
__dbda:     .hex 27 4c 4c 28   ; $dbda: 27 4c 4c 28   Data
            .hex 29 2a 2b 2c   ; $dbde: 29 2a 2b 2c   Data
            .hex 2c 2d 2d 29   ; $dbe2: 2c 2d 2d 29   Data
            .hex 28 2b 2a 90   ; $dbe6: 28 2b 2a 90   Data
            .hex 91 92 93 94   ; $dbea: 91 92 93 94   Data
            .hex 95 96 97 98   ; $dbee: 95 96 97 98   Data
            .hex 99 9a 9b 9c   ; $dbf2: 99 9a 9b 9c   Data
            .hex 9d 9e 9f a0   ; $dbf6: 9d 9e 9f a0   Data
            .hex a1 a2 a3 a4   ; $dbfa: a1 a2 a3 a4   Data
            .hex a5 a6 a7 a8   ; $dbfe: a5 a6 a7 a8   Data
            .hex a9 aa ab ac   ; $dc02: a9 aa ab ac   Data
            .hex ad ae af 2e   ; $dc06: ad ae af 2e   Data
            .hex 2f 30 31 32   ; $dc0a: 2f 30 31 32   Data
            .hex 2f 33 31 34   ; $dc0e: 2f 33 31 34   Data
            .hex 2f 35 31 36   ; $dc12: 2f 35 31 36   Data
            .hex 2f 37 31 38   ; $dc16: 2f 37 31 38   Data
            .hex 2f 39 31 3a   ; $dc1a: 2f 39 31 3a   Data
            .hex 2f 3b 31 3c   ; $dc1e: 2f 3b 31 3c   Data
            .hex 2f 3d 31 3e   ; $dc22: 2f 3d 31 3e   Data
            .hex 3f 40 41 42   ; $dc26: 3f 40 41 42   Data
            .hex 3f 43 41 44   ; $dc2a: 3f 43 41 44   Data
            .hex 45 46 47 48   ; $dc2e: 45 46 47 48   Data
            .hex 45 49 47 4a   ; $dc32: 45 49 47 4a   Data
            .hex 45 4b 47 4d   ; $dc36: 45 4b 47 4d   Data
            .hex 4e 4f 50 4e   ; $dc3a: 4e 4f 50 4e   Data
            .hex 4d 50 4f 4f   ; $dc3e: 4d 50 4f 4f   Data
            .hex 50 4d 4e 50   ; $dc42: 50 4d 4e 50   Data
            .hex 4f 4e 4d 4d   ; $dc46: 4f 4e 4d 4d   Data
            .hex 4e 4f 51 4e   ; $dc4a: 4e 4f 51 4e   Data
            .hex 52 53 54 4f   ; $dc4e: 52 53 54 4f   Data
            .hex 51 4d 4e 53   ; $dc52: 51 4d 4e 53   Data
            .hex 54 4e 52      ; $dc56: 54 4e 52      Data
__dc59:     .hex 55 4c 56 4c   ; $dc59: 55 4c 56 4c   Data
            .hex 56 4c 55 4c   ; $dc5d: 56 4c 55 4c   Data
            .hex 4c 57 4c 58   ; $dc61: 4c 57 4c 58   Data
            .hex 4c 59 4c 5a   ; $dc65: 4c 59 4c 5a   Data
            .hex 4c 5b 4c 5c   ; $dc69: 4c 5b 4c 5c   Data
            .hex 4c 4c 4c 5d   ; $dc6d: 4c 4c 4c 5d   Data
            .hex 18 18 19 5e   ; $dc71: 18 18 19 5e   Data
            .hex 60 61 19 5e   ; $dc75: 60 61 19 5e   Data
            .hex 1b 1c 1d 62   ; $dc79: 1b 1c 1d 62   Data
            .hex 1b 1c 1e 63   ; $dc7d: 1b 1c 1e 63   Data
            .hex 64 65 66 67   ; $dc81: 64 65 66 67   Data
            .hex 64 65 68 69   ; $dc85: 64 65 68 69   Data
            .hex 6a 6b 4c 4c   ; $dc89: 6a 6b 4c 4c   Data
__dc8d:     .hex 00 00 00 00   ; $dc8d: 00 00 00 00   Data
            .hex 00 40 80 c0   ; $dc91: 00 40 80 c0   Data
            .hex 80 c0 80 c0   ; $dc95: 80 c0 80 c0   Data
            .hex 80 c0 80 c0   ; $dc99: 80 c0 80 c0   Data
            .hex 00 00 80 80   ; $dc9d: 00 00 80 80   Data
            .hex 00 00 80 80   ; $dca1: 00 00 80 80   Data
            .hex 00 40 00 40   ; $dca5: 00 40 00 40   Data
            .hex 00 40 00 40   ; $dca9: 00 40 00 40   Data
            .hex 40 40 c0 c0   ; $dcad: 40 40 c0 c0   Data
            .hex 40 40 c0 c0   ; $dcb1: 40 40 c0 c0   Data
            .hex 00 40 00 40   ; $dcb5: 00 40 00 40   Data
            .hex 00 40 00 40   ; $dcb9: 00 40 00 40   Data
            .hex 00 00 00 00   ; $dcbd: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dcc1: 00 00 00 00   Data
            .hex 00 40 00 40   ; $dcc5: 00 40 00 40   Data
            .hex 00 40 00 40   ; $dcc9: 00 40 00 40   Data
            .hex 40 40 40 40   ; $dccd: 40 40 40 40   Data
            .hex 40 40 40 40   ; $dcd1: 40 40 40 40   Data
            .hex 00 40 80 c0   ; $dcd5: 00 40 80 c0   Data
            .hex 00 40 00 40   ; $dcd9: 00 40 00 40   Data
            .hex 00 40 00 40   ; $dcdd: 00 40 00 40   Data
            .hex 00 00 00 40   ; $dce1: 00 00 00 40   Data
            .hex 00 00 00 40   ; $dce5: 00 00 00 40   Data
            .hex 00 00 00 40   ; $dce9: 00 00 00 40   Data
            .hex 00 00 00 40   ; $dced: 00 00 00 40   Data
            .hex 00 00 00 40   ; $dcf1: 00 00 00 40   Data
            .hex 00 00 00 40   ; $dcf5: 00 00 00 40   Data
            .hex 00 00 00 40   ; $dcf9: 00 00 00 40   Data
            .hex 00 00 00 00   ; $dcfd: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd01: 00 00 00 00   Data
            .hex 00 40 00 40   ; $dd05: 00 40 00 40   Data
            .hex 00 40 00 40   ; $dd09: 00 40 00 40   Data
            .hex 00 40 00 00   ; $dd0d: 00 40 00 00   Data
            .hex 00 00 00 00   ; $dd11: 00 00 00 00   Data
            .hex 00 40 00 40   ; $dd15: 00 40 00 40   Data
            .hex 40 40 40 40   ; $dd19: 40 40 40 40   Data
            .hex 00 00 00 00   ; $dd1d: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd21: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd25: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd29: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd2d: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd31: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd35: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd39: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd3d: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd41: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd45: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd49: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd4d: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd51: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd55: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd59: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd5d: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd61: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd65: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd69: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd6d: 00 00 00 00   Data
            .hex 40 40 00 40   ; $dd71: 40 40 00 40   Data
            .hex 80 00 80 80   ; $dd75: 80 00 80 80   Data
            .hex 00 c0 c0 c0   ; $dd79: 00 c0 c0 c0   Data
            .hex 00 00 00 00   ; $dd7d: 00 00 00 00   Data
            .hex 40 00 00 00   ; $dd81: 40 00 00 00   Data
            .hex 80 80 80 80   ; $dd85: 80 80 80 80   Data
            .hex 80 80 c0 80   ; $dd89: 80 80 c0 80   Data
__dd8d:     .hex 00 00 00 00   ; $dd8d: 00 00 00 00   Data
            .hex 80 00 80 00   ; $dd91: 80 00 80 00   Data
            .hex 00 00 00 00   ; $dd95: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd99: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dd9d: 00 00 00 00   Data
            .hex 00 00 00 00   ; $dda1: 00 00 00 00   Data
            .hex 00 40 00 00   ; $dda5: 00 40 00 00   Data
            .hex 00 00 00 00   ; $dda9: 00 00 00 00   Data
            .hex 00 00 00 00   ; $ddad: 00 00 00 00   Data
            .hex 00 00 00 00   ; $ddb1: 00 00 00 00   Data
            .hex 00 00 00 00   ; $ddb5: 00 00 00 00   Data
            .hex 00 00 00 00   ; $ddb9: 00 00 00 00   Data
            .hex 00 00 00 00   ; $ddbd: 00 00 00 00   Data
__ddc1:     .hex 03            ; $ddc1: 03            Data
__ddc2:     .hex f4 03 fc 0b   ; $ddc2: f4 03 fc 0b   Data
            .hex f4 0b fc      ; $ddc6: f4 0b fc      Data
__ddc9:     LDA Frame_Ctr      ; $ddc9: a5 4b     
            AND #$0F           ; $ddcb: 29 0f     
            BEQ __ddd0         ; $ddcd: f0 01     
            RTS                ; $ddcf: 60        

;-------------------------------------------------------------------------------
__ddd0:     TAX                ; $ddd0: aa        
__ddd1:     LDA $6C,X          ; $ddd1: b5 6c     
            CMP #$07           ; $ddd3: c9 07     
            BEQ __dde1         ; $ddd5: f0 0a     
            CMP #$01           ; $ddd7: c9 01     
            BNE __dddf         ; $ddd9: d0 04     
            LDA #$02           ; $dddb: a9 02     
            BNE __dde1         ; $dddd: d0 02     
__dddf:     LDA #$01           ; $dddf: a9 01     
__dde1:     STA $6C,X          ; $dde1: 95 6c     
            INX                ; $dde3: e8        
            CPX #$04           ; $dde4: e0 04     
            BNE __ddd1         ; $dde6: d0 e9     
            RTS                ; $dde8: 60        

;-------------------------------------------------------------------------------
__dde9:     LDA $48            ; $dde9: a5 48     
            BEQ __ddf0         ; $ddeb: f0 03     
            JMP __de7e         ; $dded: 4c 7e de  

;-------------------------------------------------------------------------------
__ddf0:     LDA $023f          ; $ddf0: ad 3f 02  
            CMP #$FF           ; $ddf3: c9 ff     
            BEQ __de4a         ; $ddf5: f0 53     
            LDA PPUSTATUS      ; $ddf7: ad 02 20  
            LDA $026b          ; $ddfa: ad 6b 02  
            STA PPUADDR        ; $ddfd: 8d 06 20  
            LDA $026c          ; $de00: ad 6c 02  
            STA PPUADDR        ; $de03: 8d 06 20  
            LDY #$00           ; $de06: a0 00     
__de08:     LDA $023f,Y        ; $de08: b9 3f 02  
            STA PPUDATA        ; $de0b: 8d 07 20  
            INY                ; $de0e: c8        
            CPY #$06           ; $de0f: c0 06     
            BNE __de08         ; $de11: d0 f5     
            LDA #$30           ; $de13: a9 30     
            STA PPUDATA        ; $de15: 8d 07 20  
            LDA #$FF           ; $de18: a9 ff     
            STA $023f          ; $de1a: 8d 3f 02  
            LDA $0245          ; $de1d: ad 45 02  
            CMP #$FF           ; $de20: c9 ff     
            BEQ __de4a         ; $de22: f0 26     
            LDA PPUSTATUS      ; $de24: ad 02 20  
            LDA $0272          ; $de27: ad 72 02  
            STA PPUADDR        ; $de2a: 8d 06 20  
            LDA $0273          ; $de2d: ad 73 02  
            STA PPUADDR        ; $de30: 8d 06 20  
            LDY #$00           ; $de33: a0 00     
__de35:     LDA $0245,Y        ; $de35: b9 45 02  
            STA PPUDATA        ; $de38: 8d 07 20  
            INY                ; $de3b: c8        
            CPY #$06           ; $de3c: c0 06     
            BNE __de35         ; $de3e: d0 f5     
            LDA #$30           ; $de40: a9 30     
            STA PPUDATA        ; $de42: 8d 07 20  
            LDA #$FF           ; $de45: a9 ff     
            STA $0245          ; $de47: 8d 45 02  
__de4a:     LDA Frame_Ctr      ; $de4a: a5 4b     
            AND #$07           ; $de4c: 29 07     
            BNE __de7e         ; $de4e: d0 2e     
            LDA PPUSTATUS      ; $de50: ad 02 20  
            LDA $026d          ; $de53: ad 6d 02  
            STA PPUADDR        ; $de56: 8d 06 20  
            LDA $026e          ; $de59: ad 6e 02  
            STA PPUADDR        ; $de5c: 8d 06 20  
            LDX #$00           ; $de5f: a2 00     
            LDA Frame_Ctr      ; $de61: a5 4b     
            AND #$18           ; $de63: 29 18     
            BEQ __de74         ; $de65: f0 0d     
__de67:     LDA $026f,X        ; $de67: bd 6f 02  
            STA PPUDATA        ; $de6a: 8d 07 20  
            INX                ; $de6d: e8        
            CPX #$03           ; $de6e: e0 03     
            BNE __de67         ; $de70: d0 f5     
            BEQ __de7e         ; $de72: f0 0a     
__de74:     LDA #$20           ; $de74: a9 20     
__de76:     STA PPUDATA        ; $de76: 8d 07 20  
            INX                ; $de79: e8        
            CPX #$03           ; $de7a: e0 03     
            BNE __de76         ; $de7c: d0 f8     
__de7e:     LDY #$00           ; $de7e: a0 00     
            LDX #$00           ; $de80: a2 00     
            LDA $46            ; $de82: a5 46     
            AND $47            ; $de84: 25 47     
            BEQ __de8a         ; $de86: f0 02     
            LDY #$08           ; $de88: a0 08     
__de8a:     LDA PPUSTATUS      ; $de8a: ad 02 20  
            LDA __DECf,Y       ; $de8d: b9 cf de  
            STA PPUADDR        ; $de90: 8d 06 20  
            LDA __ded0,Y       ; $de93: b9 d0 de  
            STA PPUADDR        ; $de96: 8d 06 20  
            LDA $6C,X          ; $de99: b5 6c     
            STA PPUDATA        ; $de9b: 8d 07 20  
            INY                ; $de9e: c8        
            INY                ; $de9f: c8        
            INX                ; $dea0: e8        
            CPX #$04           ; $dea1: e0 04     
            BNE __de8a         ; $dea3: d0 e5     
            LDA PPUSTATUS      ; $dea5: ad 02 20  
            LDY #$FF           ; $dea8: a0 ff     
__deaa:     INY                ; $deaa: c8        
            LDA $024b,Y        ; $deab: b9 4b 02  
            CMP #$FF           ; $deae: c9 ff     
            BEQ __DECb         ; $deb0: f0 19     
            STA PPUADDR        ; $deb2: 8d 06 20  
            INY                ; $deb5: c8        
            LDA $024b,Y        ; $deb6: b9 4b 02  
            STA PPUADDR        ; $deb9: 8d 06 20  
__debc:     INY                ; $debc: c8        
            LDA $024b,Y        ; $debd: b9 4b 02  
            BEQ __deaa         ; $DEC0: f0 e8     
            CMP #$FF           ; $DEC2: c9 ff     
            BEQ __DECb         ; $DEC4: f0 05     
            STA PPUDATA        ; $DEC6: 8d 07 20  
            BNE __debc         ; $DEC9: d0 f1     
__DECb:     STA $024b          ; $DECb: 8d 4b 02  
            RTS                ; $DECe: 60        

;-------------------------------------------------------------------------------
__DECf:     .hex 20            ; $DECf: 20            Data
__ded0:     .hex b4 20 a2 22   ; $ded0: b4 20 a2 22   Data
            .hex d4 22 c2 28   ; $ded4: d4 22 c2 28   Data
            .hex b4 28 a2 2a   ; $ded8: b4 28 a2 2a   Data
            .hex d4 2a c2      ; $dedc: d4 2a c2      Data
__dedf:     LDX #$00           ; $dedf: a2 00     
            LDA $022a          ; $dee1: ad 2a 02  
            CMP #$09           ; $dee4: c9 09     
            BEQ __df1e         ; $dee6: f0 36     
            INX                ; $dee8: e8        
            INX                ; $dee9: e8        
            CMP #$03           ; $deea: c9 03     
            BEQ __df1e         ; $deec: f0 30     
            CMP #$01           ; $deee: c9 01     
            BEQ __def7         ; $def0: f0 05     
            CMP #$02           ; $def2: c9 02     
            BEQ __def7         ; $def4: f0 01     
            RTS                ; $def6: 60        

;-------------------------------------------------------------------------------
__def7:     JSR __dfc6         ; $def7: 20 c6 df  
            LDA $1A            ; $defa: a5 1a     
            STA $02            ; $defc: 85 02     
            LDA $1C            ; $defe: a5 1c     
            STA $03            ; $df00: 85 03     
            JSR __e1dd         ; $df02: 20 dd e1  
            LDX #$00           ; $df05: a2 00     
            LDA $03            ; $df07: a5 03     
            AND #$07           ; $df09: 29 07     
            BEQ __df0f         ; $df0b: f0 02     
            INX                ; $df0d: e8        
            INX                ; $df0e: e8        
__df0f:     LDA $02            ; $df0f: a5 02     
            AND #$0F           ; $df11: 29 0f     
            CMP #$04           ; $df13: c9 04     
            BEQ __df18         ; $df15: f0 01     
            INX                ; $df17: e8        
__df18:     LDA #$07           ; $df18: a9 07     
            STA $6C,X          ; $df1a: 95 6c     
            LDX #$04           ; $df1c: a2 04     
__df1e:     LDA #$00           ; $df1e: a9 00     
            STA $d5            ; $df20: 85 d5     
            STA $d6            ; $df22: 85 d6     
            LDA $1A            ; $df24: a5 1a     
            STA $02            ; $df26: 85 02     
            LDA $1C            ; $df28: a5 1c     
            STA $03            ; $df2a: 85 03     
            JSR __e1dd         ; $df2c: 20 dd e1  
            LDY #$FF           ; $df2f: a0 ff     
__df31:     INY                ; $df31: c8        
            LDA $024b,Y        ; $df32: b9 4b 02  
            CMP #$FF           ; $df35: c9 ff     
            BNE __df31         ; $df37: d0 f8     
            TYA                ; $df39: 98        
            BEQ __df42         ; $df3a: f0 06     
            LDA #$00           ; $df3c: a9 00     
            STA $024b,Y        ; $df3e: 99 4b 02  
            INY                ; $df41: c8        
__df42:     LDA $03            ; $df42: a5 03     
            STA $024b,Y        ; $df44: 99 4b 02  
            INY                ; $df47: c8        
            LDA $02            ; $df48: a5 02     
            STA $024b,Y        ; $df4a: 99 4b 02  
            INY                ; $df4d: c8        
            LDA __dfa6,X       ; $df4e: bd a6 df  
            STA $024b,Y        ; $df51: 99 4b 02  
            INY                ; $df54: c8        
            LDA #$FF           ; $df55: a9 ff     
            STA $024b,Y        ; $df57: 99 4b 02  
            LDA #$07           ; $df5a: a9 07     
            STA $022a          ; $df5c: 8d 2a 02  
            LDA __dfa7,X       ; $df5f: bd a7 df  
            STA $DC            ; $df62: 85 dc     
            DEC $6A            ; $df64: c6 6a    ; Decrement number of dots on maze 
            BNE __df74         ; $df66: d0 0c     
            LDA #$0C           ; $df68: a9 0c     
            STA $3F            ; $df6a: 85 3f     
            LDA #$00           ; $df6c: a9 00     
            STA $87            ; $df6e: 85 87     
            LDA #$48           ; $df70: a9 48     
            STA $4C            ; $df72: 85 4c     
__df74:     LDA $6A            ; $df74: a5 6a     
            CMP #$37           ; $df76: c9 37     
            BEQ __df7e         ; $df78: f0 04     
            CMP #$86           ; $df7a: c9 86     
            BNE __df99         ; $df7c: d0 1b     
__df7e:     LDA #$0A           ; $df7e: a9 0a     
            STA $d7            ; $df80: 85 d7     
            LDA #$3C           ; $df82: a9 3c     
            STA $d8            ; $df84: 85 d8     
            LDY $93            ; $df86: a4 93     
            LDA __dfbe,Y       ; $df88: b9 be df  
            STA $37            ; $df8b: 85 37     
            LDA #$03           ; $df8d: a9 03     
            STA $3D            ; $df8f: 85 3d     
            LDA #$60           ; $df91: a9 60     
            STA $2E            ; $df93: 85 2e     
            LDA #$80           ; $df95: a9 80     
            STA $30            ; $df97: 85 30     
__df99:     LDA $6A            ; $df99: a5 6a     
            AND #$01           ; $df9b: 29 01     
            TAY                ; $df9d: a8        
            LDA #$01           ; $df9e: a9 01     
            STA $0604,Y        ; $dfa0: 99 04 06  
            JMP __e060         ; $dfa3: 4c 60 e0  

;-------------------------------------------------------------------------------
__dfa6:     .hex 08            ; $dfa6: 08            Data
__dfa7:     .hex 01 07 01 07   ; $dfa7: 01 07 01 07   Data
            .hex 05 a2 00      ; $dfab: 05 a2 00      Data
__dfae:     LDA $BA,X          ; $dfae: b5 ba     
            BNE __dfb7         ; $dfb0: d0 05     
            LDA #$02           ; $dfb2: a9 02     
            STA $BA,X          ; $dfb4: 95 ba     
            RTS                ; $dfb6: 60        

;-------------------------------------------------------------------------------
__dfb7:     INX                ; $dfb7: e8        
            INX                ; $dfb8: e8        
            CPX #$06           ; $dfb9: e0 06     
            BNE __dfae         ; $dfbb: d0 f1     
            RTS                ; $dfbd: 60        

;-------------------------------------------------------------------------------
__dfbe:     .hex 24 25 26 27   ; $dfbe: 24 25 26 27   Data
            .hex 28 29 2a 2b   ; $dfc2: 28 29 2a 2b   Data
__dfc6:     LDA $8C            ; $dfc6: a5 8c     
            BNE __dfd0         ; $dfc8: d0 06     
            LDA #$1E           ; $dfca: a9 1e     
            STA $8A            ; $dfcc: 85 8a     
            LDA #$00           ; $dfce: a9 00     
__dfd0:     
            STA $89            ; $dfd0: 85 89     
            LDA #$0F           ; $dfd2: a9 0f     
            STA $88            ; $dfd4: 85 88     
            LDX #$03           ; $dfd6: a2 03     
__dfd8:     
            LDA $39,X          ; $dfd8: b5 39     
            AND #$FC           ; $dfda: 29 fc     
            ORA #$01           ; $dfdc: 09 01     
            STA $39,X          ; $dfde: 95 39     
            DEX                ; $dfe0: ca        
            BPL __dfd8         ; $dfe1: 10 f5     
            LDY #$FF           ; $dfe3: a0 ff     
__dfe5:     INY                ; $dfe5: c8        
            LDA $024b,Y        ; $dfe6: b9 4b 02  
            CMP #$FF           ; $dfe9: c9 ff     
            BNE __dfe5         ; $dfeb: d0 f8     
            LDX #$00           ; $dfed: a2 00     
            TYA                ; $dfef: 98        
            BNE __dff3         ; $dff0: d0 01     
            INX                ; $dff2: e8        
__dff3:     LDA __e05b,X       ; $dff3: bd 5b e0  
            STA $024b,Y        ; $dff6: 99 4b 02  
            INY                ; $dff9: c8        
            INX                ; $dffa: e8        
            CMP #$FF           ; $dffb: c9 ff     
            BNE __dff3         ; $dffd: d0 f4     
            LDA #$00           ; $dfff: a9 00     
            STA $d9            ; $e001: 85 d9     
__e003:     LDX #$00           ; $e003: a2 00     
            LDA #$2F           ; $e005: a9 2f     
            STA $00            ; $e007: 85 00     
            LDA #$02           ; $e009: a9 02     
            STA $01            ; $e00b: 85 01     
            LDA #$1E           ; $e00d: a9 1e     
            STA $02            ; $e00f: 85 02     
            LDA #$00           ; $e011: a9 00     
            STA $03            ; $e013: 85 03     
            LDA #$0F           ; $e015: a9 0f     
            CMP $88            ; $e017: c5 88     
            BEQ __e01f         ; $e019: f0 04     
            LDA $d2            ; $e01b: a5 d2     
            BNE __e046         ; $e01d: d0 27     
__e01f:     LDA $b8,X          ; $e01f: b5 b8     
            CMP #$04           ; $e021: c9 04     
            BNE __e046         ; $e023: d0 21     
            LDA $b9,X          ; $e025: b5 b9     
            CLC                ; $e027: 18        
            ADC #$02           ; $e028: 69 02     
            AND #$03           ; $e02a: 29 03     
            STA $04            ; $e02c: 85 04     
            LDY #$00           ; $e02e: a0 00     
            LDA ($02),Y        ; $e030: b1 02     
            LDY #$02           ; $e032: a0 02     
            ORA ($02),Y        ; $e034: 11 02     
            AND #$07           ; $e036: 29 07     
            BNE __e042         ; $e038: d0 08     
            LDY $04            ; $e03a: a4 04     
            LDA ($00),Y        ; $e03c: b1 00     
            AND #$F8           ; $e03e: 29 f8     
            BNE __e046         ; $e040: d0 04     
__e042:     LDA $04            ; $e042: a5 04     
            STA $b9,X          ; $e044: 95 b9     
__e046:     LDA $00            ; $e046: a5 00     
            CLC                ; $e048: 18        
            ADC #$04           ; $e049: 69 04     
            STA $00            ; $e04b: 85 00     
            LDA $02            ; $e04d: a5 02     
            CLC                ; $e04f: 18        
            ADC #$04           ; $e050: 69 04     
            STA $02            ; $e052: 85 02     
            INX                ; $e054: e8        
            INX                ; $e055: e8        
            CPX #$08           ; $e056: e0 08     
            BNE __e01f         ; $e058: d0 c5     
            RTS                ; $e05a: 60        

;-------------------------------------------------------------------------------
__e05b:     .hex 00 3f 15 11   ; $e05b: 00 3f 15 11   Data
            .hex ff            ; $e05f: ff            Data
__e060:     LDA $48            ; $e060: a5 48     
            BEQ __e065         ; $e062: f0 01     
            RTS                ; $e064: 60        

;-------------------------------------------------------------------------------
__e065:     LDY #$00           ; $e065: a0 00     
            LDA #$06           ; $e067: a9 06     
            STA $00            ; $e069: 85 00     
            CLC                ; $e06b: 18        
__e06c:     LDA $0070,Y        ; $e06c: b9 70 00  
            ADC $00dc,Y        ; $e06f: 79 dc 00  
            STA $0070,Y        ; $e072: 99 70 00  
            CMP #$0A           ; $e075: c9 0a     
            bcc __e07f         ; $e077: 90 06     
            SBC #$0A           ; $e079: e9 0a     
            STA $0070,Y        ; $e07b: 99 70 00  
            SEC                ; $e07e: 38        
__e07f:     LDA #$00           ; $e07f: a9 00     
            STA $00dc,Y        ; $e081: 99 dc 00  
            INY                ; $e084: c8        
            DEC $00            ; $e085: c6 00     
            BNE __e06c         ; $e087: d0 e3     
            LDX #$00           ; $e089: a2 00     
            DEY                ; $e08b: 88        
__e08c:     LDA $0070,Y        ; $e08c: b9 70 00  
            JSR __e148         ; $e08f: 20 48 e1  
            CMP #$30           ; $e092: c9 30     
            BNE __e0a5         ; $e094: d0 0f     
            LDA #$20           ; $e096: a9 20     
            STA $023f,X        ; $e098: 9d 3f 02  
            INX                ; $e09b: e8        
            DEY                ; $e09c: 88        
            BNE __e08c         ; $e09d: d0 ed     
__e09f:     LDA $0070,Y        ; $e09f: b9 70 00  
            JSR __e148         ; $e0a2: 20 48 e1  
__e0a5:     STA $023f,X        ; $e0a5: 9d 3f 02  
            INX                ; $e0a8: e8        
            DEY                ; $e0a9: 88        
            BPL __e09f         ; $e0aa: 10 f3     
            LDA $6B            ; $e0ac: a5 6b     
            BNE __e110         ; $e0ae: d0 60     
            LDA #$01           ; $e0b0: a9 01     
            CMP $73            ; $e0b2: c5 73     
            BNE __e110         ; $e0b4: d0 5a     
            LDA #$01           ; $e0b6: a9 01     
            STA $6B            ; $e0b8: 85 6b     
            STA $0602          ; $e0ba: 8d 02 06  
            INC $67            ; $e0bd: e6 67     
            LDA $67            ; $e0bf: a5 67     
            SEC                ; $e0c1: 38        
            SBC #$02           ; $e0c2: e9 02     
            ASL                ; $e0c4: 0a        
            STA $00            ; $e0c5: 85 00     
            LDY #$FF           ; $e0c7: a0 ff     
__e0c9:     INY                ; $e0c9: c8        
            LDA $024b,Y        ; $e0ca: b9 4b 02  
            CMP #$FF           ; $e0cd: c9 ff     
            BNE __e0c9         ; $e0cf: d0 f8     
            TYA                ; $e0d1: 98        
            BEQ __e0da         ; $e0d2: f0 06     
            LDA #$00           ; $e0d4: a9 00     
            STA $024b,Y        ; $e0d6: 99 4b 02  
            INY                ; $e0d9: c8        
__e0da:     LDA $46            ; $e0da: a5 46     
            AND $47            ; $e0dc: 25 47     
            .hex f0            ; $e0de: f0        Suspected data
__e0df:     .hex 02 a9 08      ; $e0df: 02 a9 08      Data
__e0e2:     .hex 85 01 a2 00   ; $e0e2: 85 01 a2 00   Data
__e0e6:     LDA __e13a,X       ; $e0e6: bd 3a e1  
            CLC                ; $e0e9: 18        
            ADC $01            ; $e0ea: 65 01     
            STA $024b,Y        ; $e0ec: 99 4b 02  
            INY                ; $e0ef: c8        
            INX                ; $e0f0: e8        
            LDA __e13a,X       ; $e0f1: bd 3a e1  
            CLC                ; $e0f4: 18        
            ADC $00            ; $e0f5: 65 00     
            STA $024b,Y        ; $e0f7: 99 4b 02  
            LDA #$03           ; $e0fa: a9 03     
            STA $02            ; $e0fc: 85 02     
__e0fe:     INY                ; $e0fe: c8        
            INX                ; $e0ff: e8        
            LDA __e13a,X       ; $e100: bd 3a e1  
            STA $024b,Y        ; $e103: 99 4b 02  
            DEC $02            ; $e106: c6 02     
            BNE __e0fe         ; $e108: d0 f4     
            INY                ; $e10a: c8        
            INX                ; $e10b: e8        
            CPX #$0A           ; $e10c: e0 0a     
            BNE __e0e6         ; $e10e: d0 d6     
__e110:     LDY #$05           ; $e110: a0 05     
__e112:     LDA $0061,Y        ; $e112: b9 61 00  
            CMP $0070,Y        ; $e115: d9 70 00  
            BEQ __e11d         ; $e118: f0 03     
            bcc __e121         ; $e11a: 90 05     
            RTS                ; $e11c: 60        

;-------------------------------------------------------------------------------
__e11d:     DEY                ; $e11d: 88        
            BPL __e112         ; $e11e: 10 f2     
            RTS                ; $e120: 60        

;-------------------------------------------------------------------------------
__e121:     LDX #$00           ; $e121: a2 00     
__e123:     LDA $023f,X        ; $e123: bd 3f 02  
            STA $0245,X        ; $e126: 9d 45 02  
            INX                ; $e129: e8        
            CPX #$06           ; $e12a: e0 06     
            BNE __e123         ; $e12c: d0 f5     
            LDX #$00           ; $e12e: a2 00     
Score_Update:     
            LDA $70,X          ; $e130: b5 70     
            STA $61,X          ; $e132: 95 61     
            INX                ; $e134: e8        
            CPX #$06           ; $e135: e0 06     
            BNE Score_Update   ; $e137: d0 f7     
            RTS                ; $e139: 60        

;-------------------------------------------------------------------------------
__e13a:     .hex 23 17 3c 3d   ; $e13a: 23 17 3c 3d   Data
            .hex 00 23 37 3e   ; $e13e: 00 23 37 3e   Data
            .hex 3f ff 4a 4a   ; $e142: 3f ff 4a 4a   Data
            .hex 4a 4a         ; $e146: 4a 4a         Data
__e148:     AND #$0F           ; $e148: 29 0f     
            CMP #$0A           ; $e14a: c9 0a     
            BCS __e151         ; $e14c: b0 03     
            ADC #$30           ; $e14e: 69 30     
            RTS                ; $e150: 60        

;-------------------------------------------------------------------------------
__e151:     ADC #$36           ; $e151: 69 36     
            RTS                ; $e153: 60        

;-------------------------------------------------------------------------------
__e154:     LDA $1A            ; $e154: a5 1a     
            STA $02            ; $e156: 85 02     
            LDA $1C            ; $e158: a5 1c     
            STA $03            ; $e15a: 85 03     
            JSR __e1dd         ; $e15c: 20 dd e1  
            LDA $03            ; $e15f: a5 03     
            STA $0200          ; $e161: 8d 00 02  
            LDA $02            ; $e164: a5 02     
            STA $0201          ; $e166: 8d 01 02  
            LDX #$00           ; $e169: a2 00     
            LDY #$00           ; $e16b: a0 00     
__e16d:     LDA $1A,X          ; $e16d: b5 1a     
            STA $02            ; $e16f: 85 02     
            LDA $1C,X          ; $e171: b5 1c     
            STA $03            ; $e173: 85 03     
            JSR __e1dd         ; $e175: 20 dd e1  
            LDA #$20           ; $e178: a9 20     
            STA $14            ; $e17a: 85 14     
            LDA #$00           ; $e17c: a9 00     
            STA $15            ; $e17e: 85 15     
            LDA $02            ; $e180: a5 02     
            STA $12            ; $e182: 85 12     
            LDA $03            ; $e184: a5 03     
            STA $13            ; $e186: 85 13     
            JSR __e24e         ; $e188: 20 4e e2  
            LDA $13            ; $e18b: a5 13     
            STA $0202,Y        ; $e18d: 99 02 02  
            LDA $12            ; $e190: a5 12     
            INY                ; $e192: c8        
            STA $0202,Y        ; $e193: 99 02 02  
            LDA $03            ; $e196: a5 03     
            INY                ; $e198: c8        
            STA $0202,Y        ; $e199: 99 02 02  
            LDA $02            ; $e19c: a5 02     
            SEC                ; $e19e: 38        
            SBC #$01           ; $e19f: e9 01     
            INY                ; $e1a1: c8        
            STA $0202,Y        ; $e1a2: 99 02 02  
            LDA #$20           ; $e1a5: a9 20     
            STA $14            ; $e1a7: 85 14     
            LDA #$00           ; $e1a9: a9 00     
            STA $15            ; $e1ab: 85 15     
            LDA $02            ; $e1ad: a5 02     
            STA $12            ; $e1af: 85 12     
            LDA $03            ; $e1b1: a5 03     
            STA $13            ; $e1b3: 85 13     
            JSR __e240         ; $e1b5: 20 40 e2  
            LDA $13            ; $e1b8: a5 13     
            INY                ; $e1ba: c8        
            STA $0202,Y        ; $e1bb: 99 02 02  
            LDA $12            ; $e1be: a5 12     
            INY                ; $e1c0: c8        
            STA $0202,Y        ; $e1c1: 99 02 02  
            LDA $03            ; $e1c4: a5 03     
            INY                ; $e1c6: c8        
            STA $0202,Y        ; $e1c7: 99 02 02  
            LDA $02            ; $e1ca: a5 02     
            CLC                ; $e1cc: 18        
            ADC #$01           ; $e1cd: 69 01     
            INY                ; $e1cf: c8        
            STA $0202,Y        ; $e1d0: 99 02 02  
            INX                ; $e1d3: e8        
            INX                ; $e1d4: e8        
            INX                ; $e1d5: e8        
            INX                ; $e1d6: e8        
            INY                ; $e1d7: c8        
            CPY #$28           ; $e1d8: c0 28     
            BNE __e16d         ; $e1da: d0 91     
            RTS                ; $e1dc: 60        

;-------------------------------------------------------------------------------
__e1dd:     LDA #$00           ; $e1dd: a9 00     
            STA $05            ; $e1df: 85 05     
            LDA $03            ; $e1e1: a5 03     
            SEC                ; $e1e3: 38        
            SBC #$04           ; $e1e4: e9 04     
            AND #$F8           ; $e1e6: 29 f8     
            ASL                ; $e1e8: 0a        
            rol $05            ; $e1e9: 26 05     
            ASL                ; $e1eb: 0a        
            rol $05            ; $e1ec: 26 05     
            CLC                ; $e1ee: 18        
            ADC #$40           ; $e1ef: 69 40     
            STA $04            ; $e1f1: 85 04     
            LDA #$00           ; $e1f3: a9 00     
            ADC $05            ; $e1f5: 65 05     
            STA $05            ; $e1f7: 85 05     
            LDA $02            ; $e1f9: a5 02     
            SEC                ; $e1fb: 38        
            SBC #$04           ; $e1fc: e9 04     
            lsr                ; $e1fe: 4a        
            lsr                ; $e1ff: 4a        
            lsr                ; $e200: 4a        
            CLC                ; $e201: 18        
            ADC $04            ; $e202: 65 04     
            STA $02            ; $e204: 85 02     
            LDA $05            ; $e206: a5 05     
            CLC                ; $e208: 18        
            ADC #$20           ; $e209: 69 20     
            STA $03            ; $e20b: 85 03     
            LDA $46            ; $e20d: a5 46     
            AND $47            ; $e20f: 25 47     
            BNE __e214         ; $e211: d0 01     
            RTS                ; $e213: 60        

;-------------------------------------------------------------------------------
__e214:     LDA $03            ; $e214: a5 03     
            CLC                ; $e216: 18        
            ADC #$08           ; $e217: 69 08     
            STA $03            ; $e219: 85 03     
            RTS                ; $e21b: 60        

;-------------------------------------------------------------------------------
__e21c:     LDX #$00           ; $e21c: a2 00     
            LDY #$00           ; $e21e: a0 00     
            LDA PPUSTATUS      ; $e220: ad 02 20  
__e223:     LDA $0200,X        ; $e223: bd 00 02  
            STA PPUADDR        ; $e226: 8d 06 20  
            INX                ; $e229: e8        
            LDA $0200,X        ; $e22a: bd 00 02  
            STA PPUADDR        ; $e22d: 8d 06 20  
            LDA PPUDATA        ; $e230: ad 07 20  
            LDA PPUDATA        ; $e233: ad 07 20  
            STA $022a,Y        ; $e236: 99 2a 02  
            INX                ; $e239: e8        
            INY                ; $e23a: c8        
            CPX #$2A           ; $e23b: e0 2a     
            BNE __e223         ; $e23d: d0 e4     
            RTS                ; $e23f: 60        

;-------------------------------------------------------------------------------
__e240:     CLC                ; $e240: 18        
            LDA $12            ; $e241: a5 12     
            ADC $14            ; $e243: 65 14     
            STA $12            ; $e245: 85 12     
            LDA $13            ; $e247: a5 13     
            ADC $15            ; $e249: 65 15     
            STA $13            ; $e24b: 85 13     
            RTS                ; $e24d: 60        

;-------------------------------------------------------------------------------
__e24e:     SEC                ; $e24e: 38        
            LDA $12            ; $e24f: a5 12     
            SBC $14            ; $e251: e5 14     
            STA $12            ; $e253: 85 12     
            LDA $13            ; $e255: a5 13     
            SBC $15            ; $e257: e5 15     
            STA $13            ; $e259: 85 13     
            RTS                ; $e25b: 60        

;-------------------------------------------------------------------------------
__e25c:     LDA #$20           ; $e25c: a9 20     
            STA $02            ; $e25e: 85 02     
            LDA #$40           ; $e260: a9 40     
            STA $03            ; $e262: 85 03     
            LDA $47            ; $e264: a5 47     
            AND $46            ; $e266: 25 46     
            BEQ __e26e         ; $e268: f0 04     
            LDA #$28           ; $e26a: a9 28     
            STA $02            ; $e26c: 85 02     
__e26e:     LDA __fff9         ; $e26e: ad f9 ff  
            STA $01            ; $e271: 85 01     
            LDA __fff8         ; $e273: ad f8 ff  
            STA $00            ; $e276: 85 00     
            LDX #$1B           ; $e278: a2 1b     
            LDY #$00           ; $e27a: a0 00     
__e27c:     LDA PPUSTATUS      ; $e27c: ad 02 20  
            LDA $02            ; $e27f: a5 02     
            STA PPUADDR        ; $e281: 8d 06 20  
            LDA $03            ; $e284: a5 03     
            STA PPUADDR        ; $e286: 8d 06 20  
            LDA #$16           ; $e289: a9 16     
            STA $04            ; $e28b: 85 04     
__e28d:     LDA #$00           ; $e28d: a9 00     
            STA $05            ; $e28f: 85 05     
            LDA ($00),Y        ; $e291: b1 00     
            ASL                ; $e293: 0a        
            rol $05            ; $e294: 26 05     
            ASL                ; $e296: 0a        
            rol $05            ; $e297: 26 05     
            LDA ($00),Y        ; $e299: b1 00     
            AND #$3F           ; $e29b: 29 3f     
__e29d:     STA PPUDATA        ; $e29d: 8d 07 20  
            DEC $04            ; $e2a0: c6 04     
            DEC $05            ; $e2a2: c6 05     
            BPL __e29d         ; $e2a4: 10 f7     
            INY                ; $e2a6: c8        
            BNE __e2ab         ; $e2a7: d0 02     
            INC $01            ; $e2a9: e6 01     
__e2ab:     LDA $04            ; $e2ab: a5 04     
            BNE __e28d         ; $e2ad: d0 de     
            LDA $03            ; $e2af: a5 03     
            CLC                ; $e2b1: 18        
            ADC #$20           ; $e2b2: 69 20     
            STA $03            ; $e2b4: 85 03     
            LDA $02            ; $e2b6: a5 02     
            ADC #$00           ; $e2b8: 69 00     
            STA $02            ; $e2ba: 85 02     
            DEX                ; $e2bc: ca        
            BNE __e27c         ; $e2bd: d0 bd     
            LDY #$02           ; $e2bf: a0 02     
            LDA #$21           ; $e2c1: a9 21     
            STA $00            ; $e2c3: 85 00     
            LDA #$d6           ; $e2c5: a9 d6     
            STA $01            ; $e2c7: 85 01     
            LDA $47            ; $e2c9: a5 47     
            AND $46            ; $e2cb: 25 46     
            BEQ __e2d3         ; $e2cd: f0 04     
            LDA #$29           ; $e2cf: a9 29     
            STA $00            ; $e2d1: 85 00     
__e2d3:     LDX #$07           ; $e2d3: a2 07     
            LDA PPUSTATUS      ; $e2d5: ad 02 20  
            LDA $00            ; $e2d8: a5 00     
            STA PPUADDR        ; $e2da: 8d 06 20  
            LDA $01            ; $e2dd: a5 01     
            STA PPUADDR        ; $e2df: 8d 06 20  
            LDA __e2fc,Y       ; $e2e2: b9 fc e2  
__e2e5:     STA PPUDATA        ; $e2e5: 8d 07 20  
            DEX                ; $e2e8: ca        
            BPL __e2e5         ; $e2e9: 10 fa     
            LDA $01            ; $e2eb: a5 01     
            CLC                ; $e2ed: 18        
            ADC #$20           ; $e2ee: 69 20     
            STA $01            ; $e2f0: 85 01     
            LDA #$00           ; $e2f2: a9 00     
            ADC $00            ; $e2f4: 65 00     
            STA $00            ; $e2f6: 85 00     
            DEY                ; $e2f8: 88        
            BPL __e2d3         ; $e2f9: 10 d8     
            RTS                ; $e2fb: 60        

;-------------------------------------------------------------------------------
__e2fc:     .hex 2d 04 2d      ; $e2fc: 2d 04 2d      Data
__e2ff:     LDA PPUSTATUS      ; $e2ff: ad 02 20  
            LDA #$20           ; $e302: a9 20     
            STA PPUADDR        ; $e304: 8d 06 20  
            LDA #$00           ; $e307: a9 00     
            STA PPUADDR        ; $e309: 8d 06 20  
            LDA #$01           ; $e30c: a9 01     
            STA $02            ; $e30e: 85 02     
__e310:     LDA #$01           ; $e310: a9 01     
            STA $03            ; $e312: 85 03     
            LDA #$03           ; $e314: a9 03     
            STA $00            ; $e316: 85 00     
            LDA #$c0           ; $e318: a9 c0     
            STA $01            ; $e31a: 85 01     
            LDA #$2D           ; $e31c: a9 2d     
__e31e:     STA PPUDATA        ; $e31e: 8d 07 20  
            DEC $01            ; $e321: c6 01     
            BNE __e31e         ; $e323: d0 f9     
            DEC $00            ; $e325: c6 00     
            BPL __e31e         ; $e327: 10 f5     
            DEC $03            ; $e329: c6 03     
            BNE __e335         ; $e32b: d0 08     
            LDA #$40           ; $e32d: a9 40     
            STA $01            ; $e32f: 85 01     
            LDA #$00           ; $e331: a9 00     
            BEQ __e31e         ; $e333: f0 e9     
__e335:     DEC $02            ; $e335: c6 02     
            BNE __e349         ; $e337: d0 10     
            LDA PPUSTATUS      ; $e339: ad 02 20  
            LDA #$28           ; $e33c: a9 28     
            STA PPUADDR        ; $e33e: 8d 06 20  
            LDA #$00           ; $e341: a9 00     
            STA PPUADDR        ; $e343: 8d 06 20  
            JMP __e310         ; $e346: 4c 10 e3  

;-------------------------------------------------------------------------------
__e349:     LDA #$01           ; $e349: a9 01     
            STA $00            ; $e34b: 85 00     
            LDA PPUSTATUS      ; $e34d: ad 02 20  
            LDA #$23           ; $e350: a9 23     
            STA PPUADDR        ; $e352: 8d 06 20  
            LDA #$c0           ; $e355: a9 c0     
            STA PPUADDR        ; $e357: 8d 06 20  
__e35a:     LDA #$00           ; $e35a: a9 00     
            TAY                ; $e35c: a8        
__e35d:     STA PPUDATA        ; $e35d: 8d 07 20  
            INY                ; $e360: c8        
            CPY #$20           ; $e361: c0 20     
            BNE __e35d         ; $e363: d0 f8     
            DEC $00            ; $e365: c6 00     
            BNE __e36a         ; $e367: d0 01     
            RTS                ; $e369: 60        

;-------------------------------------------------------------------------------
__e36a:     LDA PPUSTATUS      ; $e36a: ad 02 20  
            LDA #$2B           ; $e36d: a9 2b     
            STA PPUADDR        ; $e36f: 8d 06 20  
            LDA #$c0           ; $e372: a9 c0     
            STA PPUADDR        ; $e374: 8d 06 20  
            BNE __e35a         ; $e377: d0 e1     
__e379:     LDA #$20           ; $e379: a9 20     
            STA $00            ; $e37b: 85 00     
            LDA #$b6           ; $e37d: a9 b6     
            STA $01            ; $e37f: 85 01     
            LDA #$80           ; $e381: a9 80     
            STA $04            ; $e383: 85 04     
            LDX #$00           ; $e385: a2 00     
            LDA $47            ; $e387: a5 47     
            AND $46            ; $e389: 25 46     
            BEQ __e3a5         ; $e38b: f0 18     
            LDA #$28           ; $e38d: a9 28     
            STA $00            ; $e38f: 85 00     
            BNE __e3a5         ; $e391: d0 12     
__e393:     LDA #$20           ; $e393: a9 20     
            STA $00            ; $e395: 85 00     
            LDA #$83           ; $e397: a9 83     
            STA $01            ; $e399: 85 01     
            LDA #$09           ; $e39b: a9 09     
            STA $04            ; $e39d: 85 04     
            LDA #$01           ; $e39f: a9 01     
            STA $47            ; $e3a1: 85 47     
            LDX #$0C           ; $e3a3: a2 0c     
__e3a5:     LDA $47            ; $e3a5: a5 47     
            AND $46            ; $e3a7: 25 46     
            BEQ __e3b0         ; $e3a9: f0 05     
            TXA                ; $e3ab: 8a        
            CLC                ; $e3ac: 18        
            ADC #$06           ; $e3ad: 69 06     
            TAX                ; $e3af: aa        
__e3b0:     LDA #$03           ; $e3b0: a9 03     
            STA $05            ; $e3b2: 85 05     
__e3b4:     LDA PPUSTATUS      ; $e3b4: ad 02 20  
            LDA $00            ; $e3b7: a5 00     
            STA PPUADDR        ; $e3b9: 8d 06 20  
            LDA $01            ; $e3bc: a5 01     
            STA PPUADDR        ; $e3be: 8d 06 20  
            LDA __e419,X       ; $e3c1: bd 19 e4  
            STA $02            ; $e3c4: 85 02     
            LDA __e41a,X       ; $e3c6: bd 1a e4  
            STA $03            ; $e3c9: 85 03     
            JSR __e3ee         ; $e3cb: 20 ee e3  
            INX                ; $e3ce: e8        
            INX                ; $e3cf: e8        
            LDA $01            ; $e3d0: a5 01     
            CLC                ; $e3d2: 18        
            ADC $04            ; $e3d3: 65 04     
            STA $01            ; $e3d5: 85 01     
            LDA #$00           ; $e3d7: a9 00     
            ADC $00            ; $e3d9: 65 00     
            STA $00            ; $e3db: 85 00     
            DEC $05            ; $e3dd: c6 05     
            LDA $05            ; $e3df: a5 05     
            CMP #$01           ; $e3e1: c9 01     
            BNE __e3e9         ; $e3e3: d0 04     
            LDA $47            ; $e3e5: a5 47     
            BEQ __e3ed         ; $e3e7: f0 04     
__e3e9:     LDA $05            ; $e3e9: a5 05     
            BNE __e3b4         ; $e3eb: d0 c7     
__e3ed:     RTS                ; $e3ed: 60        

;-------------------------------------------------------------------------------
__e3ee:     LDY #$05           ; $e3ee: a0 05     
__e3f0:     LDA ($02),Y        ; $e3f0: b1 02     
            AND #$0F           ; $e3f2: 29 0f     
            BNE __e402         ; $e3f4: d0 0c     
            LDA #$20           ; $e3f6: a9 20     
            STA PPUDATA        ; $e3f8: 8d 07 20  
            DEY                ; $e3fb: 88        
            BNE __e3f0         ; $e3fc: d0 f2     
            BEQ __e40b         ; $e3fe: f0 0b     
__e400:     LDA ($02),Y        ; $e400: b1 02     
__e402:     JSR __e148         ; $e402: 20 48 e1  
            STA PPUDATA        ; $e405: 8d 07 20  
            DEY                ; $e408: 88        
            BNE __e400         ; $e409: d0 f5     
__e40b:     LDA ($02),Y        ; $e40b: b1 02     
            JSR __e148         ; $e40d: 20 48 e1  
            STA PPUDATA        ; $e410: 8d 07 20  
            LDA #$30           ; $e413: a9 30     
            STA PPUDATA        ; $e415: 8d 07 20  
            RTS                ; $e418: 60        

;-------------------------------------------------------------------------------
__e419:     .hex 61            ; $e419: 61            Data
__e41a:     .hex 00 70 00 80   ; $e41a: 00 70 00 80   Data
            .hex 00 61 00 80   ; $e41e: 00 61 00 80   Data
            .hex 00 70 00      ; $e422: 00 70 00      Data
__e425:     .hex 70 00         ; $e425: 70 00         Data
__e427:     .hex 61 00 80 00   ; $e427: 61 00 80 00   Data
__e42b:     LDY #$FF           ; $e42b: a0 ff     
            STY $0C            ; $e42d: 84 0c     
            STY $0D            ; $e42f: 84 0d     
            STY $0E            ; $e431: 84 0e     
            STY $0F            ; $e433: 84 0f     
            INY                ; $e435: c8        
__e436:     LDA ($00),Y        ; $e436: b1 00     
            CMP $0A            ; $e438: c5 0a     
            BEQ __e444         ; $e43a: f0 08     
            AND #$F8           ; $e43c: 29 f8     
            BEQ __e444         ; $e43e: f0 04     
            CMP $0B            ; $e440: c5 0b     
            BNE __e448         ; $e442: d0 04     
__e444:     TYA                ; $e444: 98        
            STA $000c,Y        ; $e445: 99 0c 00  
__e448:     INY                ; $e448: c8        
            CPY #$04           ; $e449: c0 04     
            BNE __e436         ; $e44b: d0 e9     
            LDA $b9,X          ; $e44d: b5 b9     
            CLC                ; $e44f: 18        
            ADC #$02           ; $e450: 69 02     
            AND #$03           ; $e452: 29 03     
            TAY                ; $e454: a8        
            LDA #$FF           ; $e455: a9 ff     
            STA $000c,Y        ; $e457: 99 0c 00  
            LDA #$03           ; $e45a: a9 03     
            STA $0B            ; $e45c: 85 0b     
__e45e:     LDY #$00           ; $e45e: a0 00     
__e460:     LDA $000c,Y        ; $e460: b9 0c 00  
            CMP #$FF           ; $e463: c9 ff     
            BNE __e472         ; $e465: d0 0b     
            LDA $000d,Y        ; $e467: b9 0d 00  
            STA $000c,Y        ; $e46a: 99 0c 00  
            LDA #$FF           ; $e46d: a9 ff     
            STA $000d,Y        ; $e46f: 99 0d 00  
__e472:     INY                ; $e472: c8        
            CPY #$03           ; $e473: c0 03     
            BNE __e460         ; $e475: d0 e9     
            DEC $0B            ; $e477: c6 0b     
            BNE __e45e         ; $e479: d0 e3     
            RTS                ; $e47b: 60        

;-------------------------------------------------------------------------------
__e47c:     LDX #$01           ; $e47c: a2 01     
__e47e:     LDY #$00           ; $e47e: a0 00     
__e480:     LDA __e4b6,Y       ; $e480: b9 b6 e4  
            CPX #$00           ; $e483: e0 00     
            BNE __e489         ; $e485: d0 02     
            ADC #$07           ; $e487: 69 07     
__e489:     STA PPUADDR        ; $e489: 8d 06 20  
            INY                ; $e48c: c8        
            LDA __e4b6,Y       ; $e48d: b9 b6 e4  
            STA PPUADDR        ; $e490: 8d 06 20  
            INY                ; $e493: c8        
            LDA __e4b6,Y       ; $e494: b9 b6 e4  
            STA $00            ; $e497: 85 00     
__e499:     INY                ; $e499: c8        
            LDA __e4b6,Y       ; $e49a: b9 b6 e4  
            STA PPUDATA        ; $e49d: 8d 07 20  
            DEC $00            ; $e4a0: c6 00     
            BNE __e499         ; $e4a2: d0 f5     
            INY                ; $e4a4: c8        
            CPY #$11           ; $e4a5: c0 11     
            BNE __e4ae         ; $e4a7: d0 05     
            LDA $47            ; $e4a9: a5 47     
            BNE __e4ae         ; $e4ab: d0 01     
            RTS                ; $e4ad: 60        

;-------------------------------------------------------------------------------
__e4ae:     CPY #$17           ; $e4ae: c0 17     
            BNE __e480         ; $e4b0: d0 ce     
            DEX                ; $e4b2: ca        
            BEQ __e47e         ; $e4b3: f0 c9     
            RTS                ; $e4b5: 60        

;-------------------------------------------------------------------------------
__e4b6:     .hex 20 76 08 b4   ; $e4b6: 20 76 08 b4   Data
            .hex b5 b6 b7 b8   ; $e4ba: b5 b6 b7 b8   Data
            .hex b9 ba bb 20   ; $e4be: b9 ba bb 20   Data
            .hex f7 03 b0 b3   ; $e4c2: f7 03 b0 b3   Data
            .hex b2 21 77 03   ; $e4c6: b2 21 77 03   Data
            .hex b1 b3 b2      ; $e4ca: b1 b3 b2      Data
__e4cd:     .hex a5 67 d0 01   ; $e4cd: a5 67 d0 01   Data
            .hex 60            ; $e4d1: 60            Data
__e4d2:     .hex 18 69 01 c9   ; $e4d2: 18 69 01 c9   Data
            .hex 07 90 02 a9   ; $e4d6: 07 90 02 a9   Data
            .hex 07            ; $e4da: 07            Data
__e4db:     STA $02            ; $e4db: 85 02     
            LDA #$04           ; $e4dd: a9 04     
            STA $03            ; $e4df: 85 03     
            LDA #$23           ; $e4e1: a9 23     
            STA $00            ; $e4e3: 85 00     
            LDA #$17           ; $e4e5: a9 17     
            STA $01            ; $e4e7: 85 01     
            LDA $46            ; $e4e9: a5 46     
            AND $47            ; $e4eb: 25 47     
            BEQ __e4f6         ; $e4ed: f0 07     
            LDA $00            ; $e4ef: a5 00     
            CLC                ; $e4f1: 18        
            ADC #$08           ; $e4f2: 69 08     
            STA $00            ; $e4f4: 85 00     
__e4f6:     DEC $02            ; $e4f6: c6 02     
            BNE __e4fb         ; $e4f8: d0 01     
            RTS                ; $e4fa: 60        

;-------------------------------------------------------------------------------
__e4fb:     DEC $03            ; $e4fb: c6 03     
            BNE __e506         ; $e4fd: d0 07     
            LDA $01            ; $e4ff: a5 01     
            CLC                ; $e501: 18        
            ADC #$3A           ; $e502: 69 3a     
            STA $01            ; $e504: 85 01     
__e506:     LDY #$3C           ; $e506: a0 3c     
            JSR __e514         ; $e508: 20 14 e5  
            LDA $01            ; $e50b: a5 01     
            CLC                ; $e50d: 18        
            ADC #$02           ; $e50e: 69 02     
            STA $01            ; $e510: 85 01     
            BNE __e4f6         ; $e512: d0 e2     
__e514:     LDA $00            ; $e514: a5 00     
            STA PPUADDR        ; $e516: 8d 06 20  
            LDA $01            ; $e519: a5 01     
            STA PPUADDR        ; $e51b: 8d 06 20  
            STY PPUDATA        ; $e51e: 8c 07 20  
            INY                ; $e521: c8        
            STY PPUDATA        ; $e522: 8c 07 20  
            LDA $00            ; $e525: a5 00     
            STA PPUADDR        ; $e527: 8d 06 20  
            LDA $01            ; $e52a: a5 01     
            CLC                ; $e52c: 18        
            ADC #$20           ; $e52d: 69 20     
            STA PPUADDR        ; $e52f: 8d 06 20  
            INY                ; $e532: c8        
            STY PPUDATA        ; $e533: 8c 07 20  
            INY                ; $e536: c8        
            STY PPUDATA        ; $e537: 8c 07 20  
            RTS                ; $e53a: 60        

;-------------------------------------------------------------------------------
__e53b:     .hex a9 00 85 03   ; $e53b: a9 00 85 03   Data
            .hex 85 0e 85 0f   ; $e53f: 85 0e 85 0f   Data
            .hex a9 15 85 0a   ; $e543: a9 15 85 0a   Data
            .hex a9 11 85 0d   ; $e547: a9 11 85 0d   Data
            .hex a9 05 85 0b   ; $e54b: a9 05 85 0b   Data
            .hex 85 0c a5 68   ; $e54f: 85 0c a5 68   Data
            .hex 85 02 38 e9   ; $e553: 85 02 38 e9   Data
            .hex 07 90 0d c9   ; $e557: 07 90 0d c9   Data
            .hex 0c 90 02 a9   ; $e55b: 0c 90 02 a9   Data
            .hex 0c            ; $e55f: 0c            Data
__e560:     .hex aa a9 07 85   ; $e560: aa a9 07 85   Data
            .hex 02 d0 02      ; $e564: 02 d0 02      Data
__e567:     .hex a2 00         ; $e567: a2 00         Data
__e569:     LDA #$22           ; $e569: a9 22     
            STA $00            ; $e56b: 85 00     
            LDA #$56           ; $e56d: a9 56     
            STA $01            ; $e56f: 85 01     
            LDA $46            ; $e571: a5 46     
            AND $47            ; $e573: 25 47     
            BEQ __e57e         ; $e575: f0 07     
            LDA $00            ; $e577: a5 00     
            CLC                ; $e579: 18        
            ADC #$08           ; $e57a: 69 08     
            STA $00            ; $e57c: 85 00     
__e57e:     LDA #$05           ; $e57e: a9 05     
            STA $04            ; $e580: 85 04     
__e582:     DEC $04            ; $e582: c6 04     
            BNE __e58d         ; $e584: d0 07     
            LDA $01            ; $e586: a5 01     
            CLC                ; $e588: 18        
            ADC #$38           ; $e589: 69 38     
            STA $01            ; $e58b: 85 01     
__e58d:     LDA __e619,X       ; $e58d: bd 19 e6  
            STA $05            ; $e590: 85 05     
            ASL                ; $e592: 0a        
            ASL                ; $e593: 0a        
            ADC #$60           ; $e594: 69 60     
            TAY                ; $e596: a8        
            JSR __e514         ; $e597: 20 14 e5  
            LDY $03            ; $e59a: a4 03     
            LDA __e62d,Y       ; $e59c: b9 2d e6  
            STA $06            ; $e59f: 85 06     
            LDA __e62e,Y       ; $e5a1: b9 2e e6  
            STA $07            ; $e5a4: 85 07     
            LDY $05            ; $e5a6: a4 05     
            LDA __e63d,Y       ; $e5a8: b9 3d e6  
__e5ab:     DEC $07            ; $e5ab: c6 07     
            BMI __e5b3         ; $e5ad: 30 04     
            ASL                ; $e5af: 0a        
            ASL                ; $e5b0: 0a        
            bcc __e5ab         ; $e5b1: 90 f8     
__e5b3:     LDY $06            ; $e5b3: a4 06     
            ORA $000a,Y        ; $e5b5: 19 0a 00  
            STA $000a,Y        ; $e5b8: 99 0a 00  
            LDA $01            ; $e5bb: a5 01     
            CLC                ; $e5bd: 18        
            ADC #$02           ; $e5be: 69 02     
            STA $01            ; $e5c0: 85 01     
            INC $03            ; $e5c2: e6 03     
            INC $03            ; $e5c4: e6 03     
            INX                ; $e5c6: e8        
            DEC $02            ; $e5c7: c6 02     
            BPL __e582         ; $e5c9: 10 b7     
            LDX #$23           ; $e5cb: a2 23     
            LDA $47            ; $e5cd: a5 47     
            AND $46            ; $e5cf: 25 46     
            BEQ __e5d5         ; $e5d1: f0 02     
            LDX #$2B           ; $e5d3: a2 2b     
__e5d5:     STX PPUADDR        ; $e5d5: 8e 06 20  
            STX $00            ; $e5d8: 86 00     
            LDA #$e5           ; $e5da: a9 e5     
            STA PPUADDR        ; $e5dc: 8d 06 20  
            LDX #$00           ; $e5df: a2 00     
__e5e1:     LDA #$03           ; $e5e1: a9 03     
            STA $01            ; $e5e3: 85 01     
__e5e5:     LDA $0A,X          ; $e5e5: b5 0a     
            STA PPUDATA        ; $e5e7: 8d 07 20  
            INX                ; $e5ea: e8        
            DEC $01            ; $e5eb: c6 01     
            BNE __e5e5         ; $e5ed: d0 f6     
            INC $02            ; $e5ef: e6 02     
            BNE __e5ff         ; $e5f1: d0 0c     
            LDA $00            ; $e5f3: a5 00     
            STA PPUADDR        ; $e5f5: 8d 06 20  
            LDA #$ED           ; $e5f8: a9 ed     
            STA PPUADDR        ; $e5fa: 8d 06 20  
            BNE __e5e1         ; $e5fd: d0 e2     
__e5ff:     LDA #$3F           ; $e5ff: a9 3f     
            STA PPUADDR        ; $e601: 8d 06 20  
            LDA #$1D           ; $e604: a9 1d     
            STA PPUADDR        ; $e606: 8d 06 20  
            LDA Current_Level  ; $e609: a5 68     
            CMP #$10           ; $e60b: c9 10     
            bcc __e611         ; $e60d: 90 02     
            LDA #$0F           ; $e60f: a9 0f     
__e611:     TAY                ; $e611: a8        
            LDA __e645,Y       ; $e612: b9 45 e6  
            STA PPUDATA        ; $e615: 8d 07 20  
            RTS                ; $e618: 60        

;-------------------------------------------------------------------------------
__e619:     .hex 00 01 02 02   ; $e619: 00 01 02 02   Data
            .hex 03 03 04 04   ; $e61d: 03 03 04 04   Data
            .hex 05 05 06 06   ; $e621: 05 05 06 06   Data
            .hex 07 07 07 07   ; $e625: 07 07 07 07   Data
            .hex 07 07 07 07   ; $e629: 07 07 07 07   Data
__e62d:     .hex 00            ; $e62d: 00            Data
__e62e:     .hex 03 01 02 01   ; $e62e: 03 01 02 01   Data
            .hex 03 02 02 03   ; $e632: 03 02 02 03   Data
            .hex 01 04 00 04   ; $e636: 01 04 00 04   Data
            .hex 01 05 00      ; $e63a: 01 05 00      Data
__e63d:     .hex 02 02 02 02   ; $e63d: 02 02 02 02   Data
            .hex 03 03 03 03   ; $e641: 03 03 03 03   Data
__e645:     .hex 16 16 26 26   ; $e645: 16 16 26 26   Data
            .hex 06 06 19 19   ; $e649: 06 06 19 19   Data
            .hex 17 17 17 17   ; $e64d: 17 17 17 17   Data
            .hex 12 12 12 12   ; $e651: 12 12 12 12   Data
            .hex a9 08 85 43   ; $e655: a9 08 85 43   Data
            .hex 8d 00 20      ; $e659: 8d 00 20      Data
__e65c:     LDA PPUSTATUS      ; $e65c: ad 02 20  
            BPL __e65c         ; $e65f: 10 fb     
            LDA #$01           ; $e661: a9 01     
            STA $060d          ; $e663: 8d 0d 06  
            STA $060e          ; $e666: 8d 0e 06  
            LDA #$00           ; $e669: a9 00     
            STA PPUMASK        ; $e66b: 8d 01 20  
            JSR __e6c4         ; $e66e: 20 c4 e6  
            LDA #$01           ; $e671: a9 01     
            STA $028d          ; $e673: 8d 8d 02  
            LDA #$01           ; $e676: a9 01     
            STA $0293          ; $e678: 8d 93 02  
            LDA #$f7           ; $e67b: a9 f7     
            STA $0278          ; $e67d: 8d 78 02  
            LDA #$7C           ; $e680: a9 7c     
            STA $027a          ; $e682: 8d 7a 02  
            LDA #$FF           ; $e685: a9 ff     
            STA $1E            ; $e687: 85 1e     
            LDA #$00           ; $e689: a9 00     
            STA $1F            ; $e68b: 85 1f     
            LDA #$00           ; $e68d: a9 00     
            STA $88            ; $e68f: 85 88     
            LDA PPUSTATUS      ; $e691: ad 02 20  
            LDA #$3F           ; $e694: a9 3f     
            STA PPUADDR        ; $e696: 8d 06 20  
            LDA #$10           ; $e699: a9 10     
            STA PPUADDR        ; $e69b: 8d 06 20  
            LDY #$00           ; $e69e: a0 00     
__e6a0:     LDA __e73b,Y       ; $e6a0: b9 3b e7  
            STA PPUDATA        ; $e6a3: 8d 07 20  
            INY                ; $e6a6: c8        
            CPY #$10           ; $e6a7: c0 10     
            BNE __e6a0         ; $e6a9: d0 f5     
            LDA #$20           ; $e6ab: a9 20     
            STA $026f          ; $e6ad: 8d 6f 02  
            STA $0270          ; $e6b0: 8d 70 02  
            STA $0271          ; $e6b3: 8d 71 02  
            LDA #$10           ; $e6b6: a9 10     
            STA $3F            ; $e6b8: 85 3f     
            LDA #$88           ; $e6ba: a9 88     
            STA PPUCTRL        ; $e6bc: 8d 00 20  
            STA $43            ; $e6bf: 85 43     
            JMP __c9dd         ; $e6c1: 4c dd c9  

;-------------------------------------------------------------------------------
__e6c4:     LDX #$20           ; $e6c4: a2 20     
            LDA $47            ; $e6c6: a5 47     
            AND $46            ; $e6c8: 25 46     
            BEQ __e6ce         ; $e6ca: f0 02     
            LDX #$28           ; $e6cc: a2 28     
__e6ce:     LDA PPUSTATUS      ; $e6ce: ad 02 20  
            STX PPUADDR        ; $e6d1: 8e 06 20  
            LDA #$00           ; $e6d4: a9 00     
            STA PPUADDR        ; $e6d6: 8d 06 20  
            LDA #$1C           ; $e6d9: a9 1c     
            STA $00            ; $e6db: 85 00     
__e6dd:     LDA #$02           ; $e6dd: a9 02     
            STA $01            ; $e6df: 85 01     
            LDA #$1C           ; $e6e1: a9 1c     
            STA $02            ; $e6e3: 85 02     
            LDA #$02           ; $e6e5: a9 02     
            STA $03            ; $e6e7: 85 03     
            LDA #$2D           ; $e6e9: a9 2d     
__e6eb:     STA PPUDATA        ; $e6eb: 8d 07 20  
            LDX $01            ; $e6ee: a6 01     
            BEQ __e6fa         ; $e6f0: f0 08     
            DEC $01            ; $e6f2: c6 01     
            BNE __e6eb         ; $e6f4: d0 f5     
            LDA #$20           ; $e6f6: a9 20     
            BNE __e6eb         ; $e6f8: d0 f1     
__e6fa:     LDX $02            ; $e6fa: a6 02     
            BEQ __e706         ; $e6fc: f0 08     
            DEC $02            ; $e6fe: c6 02     
            BNE __e6eb         ; $e700: d0 e9     
            LDA #$2D           ; $e702: a9 2d     
            BNE __e6eb         ; $e704: d0 e5     
__e706:     DEC $03            ; $e706: c6 03     
            BNE __e6eb         ; $e708: d0 e1     
            DEC $00            ; $e70a: c6 00     
            BNE __e6dd         ; $e70c: d0 cf     
            LDA #$00           ; $e70e: a9 00     
            TAX                ; $e710: aa        
__e711:     STA PPUDATA        ; $e711: 8d 07 20  
            INX                ; $e714: e8        
            CPX #$40           ; $e715: e0 40     
            BNE __e711         ; $e717: d0 f8     
            LDA $87            ; $e719: a5 87     
            CMP #$02           ; $e71b: c9 02     
            BEQ __e720         ; $e71d: f0 01     
            RTS                ; $e71f: 60        

;-------------------------------------------------------------------------------
__e720:     LDX #$22           ; $e720: a2 22     
            LDA $47            ; $e722: a5 47     
            AND $46            ; $e724: 25 46     
            BEQ __e72a         ; $e726: f0 02     
            LDX #$2A           ; $e728: a2 2a     
__e72a:     LDA PPUSTATUS      ; $e72a: ad 02 20  
            STX PPUADDR        ; $e72d: 8e 06 20  
            LDA #$30           ; $e730: a9 30     
            STA PPUADDR        ; $e732: 8d 06 20  
            LDA #$5E           ; $e735: a9 5e     
            STA PPUDATA        ; $e737: 8d 07 20  
            RTS                ; $e73a: 60        

;-------------------------------------------------------------------------------
__e73b:     .hex 0f 36 20 06   ; $e73b: 0f 36 20 06   Data
            .hex 0f 27 20 06   ; $e73f: 0f 27 20 06   Data
            .hex 0f 11 20 33   ; $e743: 0f 11 20 33   Data
            .hex 0f 36 20 11   ; $e747: 0f 36 20 11   Data
            .hex 20 a5 e9 20   ; $e74b: 20 a5 e9 20   Data
            .hex 20 ea 20 5c   ; $e74f: 20 ea 20 5c   Data
            .hex da 20 5a e7   ; $e753: da 20 5a e7   Data
            .hex 4c dd c9 a4   ; $e757: 4c dd c9 a4   Data
            .hex 87 b9 69 e7   ; $e75b: 87 b9 69 e7   Data
            .hex 85 10 b9 6a   ; $e75f: 85 10 b9 6a   Data
            .hex e7 85 11 6c   ; $e763: e7 85 11 6c   Data
            .hex 10 00         ; $e767: 10 00         Data
__e769:     .hex 6f            ; $e769: 6f            Data
__e76a:     .hex e7 53 e8 fa   ; $e76a: e7 53 e8 fa   Data
            .hex e8 a4 88 b9   ; $e76e: e8 a4 88 b9   Data
            .hex 7e e7 85 10   ; $e772: 7e e7 85 10   Data
            .hex b9 7f e7 85   ; $e776: b9 7f e7 85   Data
            .hex 11 6c 10 00   ; $e77a: 11 6c 10 00   Data
            .hex 86 e7 af e7   ; $e77e: 86 e7 af e7   Data
            .hex da e7 46 e8   ; $e782: da e7 46 e8   Data
            .hex ad 78 02 c9   ; $e786: ad 78 02 c9   Data
            .hex d0 90 01 60   ; $e78a: d0 90 01 60   Data
            .hex e6 88 e6 88   ; $e78e: e6 88 e6 88   Data
            .hex a9 0c 8d 8c   ; $e792: a9 0c 8d 8c   Data
            .hex 02 a9 20 8d   ; $e796: 02 a9 20 8d   Data
            .hex 92 02 a9 f7   ; $e79a: 92 02 a9 f7   Data
            .hex 8d 74 02 a9   ; $e79e: 8d 74 02 a9   Data
            .hex 7c 8d 76 02   ; $e7a2: 7c 8d 76 02   Data
            .hex a9 fe 85 1a   ; $e7a6: a9 fe 85 1a   Data
            .hex a9 e0 85 1b   ; $e7aa: a9 e0 85 1b   Data
            .hex 60 ad 74 02   ; $e7ae: 60 ad 74 02   Data
            .hex f0 01 60      ; $e7b2: f0 01 60      Data
__e7b5:     .hex e6 88 e6 88   ; $e7b5: e6 88 e6 88   Data
            .hex a9 40 85 4c   ; $e7b9: a9 40 85 4c   Data
            .hex a9 1e 8d 8c   ; $e7bd: a9 1e 8d 8c   Data
            .hex 02 a9 22 8d   ; $e7c1: 02 a9 22 8d   Data
            .hex 92 02 a9 09   ; $e7c5: 92 02 a9 09   Data
            .hex 8d 74 02 a9   ; $e7c9: 8d 74 02 a9   Data
            .hex 7c 8d 76 02   ; $e7cd: 7c 8d 76 02   Data
            .hex a9 01 85 1a   ; $e7d1: a9 01 85 1a   Data
            .hex a9 00 85 1b   ; $e7d5: a9 00 85 1b   Data
            .hex 60 a9 01 8d   ; $e7d9: 60 a9 01 8d   Data
            .hex 0d 06 8d 0e   ; $e7dd: 0d 06 8d 0e   Data
            .hex 06 ad 74 02   ; $e7e1: 06 ad 74 02   Data
            .hex c9 80 b0 01   ; $e7e5: c9 80 b0 01   Data
            .hex 60            ; $e7e9: 60            Data
__e7ea:     .hex e6 88 e6 88   ; $e7ea: e6 88 e6 88   Data
            .hex a9 01 85 1e   ; $e7ee: a9 01 85 1e   Data
            .hex 85 22 85 26   ; $e7f2: 85 22 85 26   Data
            .hex 85 2a a9 c0   ; $e7f6: 85 2a a9 c0   Data
            .hex 85 1f 85 23   ; $e7fa: 85 1f 85 23   Data
            .hex 85 27 85 2b   ; $e7fe: 85 27 85 2b   Data
            .hex 18 a9 38 8d   ; $e802: 18 a9 38 8d   Data
            .hex 8d 02 69 01   ; $e806: 8d 02 69 01   Data
            .hex 8d 8e 02 69   ; $e80a: 8d 8e 02 69   Data
            .hex 01 8d 8f 02   ; $e80e: 01 8d 8f 02   Data
            .hex 69 01 8d 90   ; $e812: 69 01 8d 90   Data
            .hex 02 a9 21 8d   ; $e816: 02 a9 21 8d   Data
            .hex 93 02 8d 94   ; $e81a: 93 02 8d 94   Data
            .hex 02 8d 95 02   ; $e81e: 02 8d 95 02   Data
            .hex 8d 96 02 a9   ; $e822: 8d 96 02 a9   Data
            .hex 09 8d 78 02   ; $e826: 09 8d 78 02   Data
            .hex 8d 80 02 a9   ; $e82a: 8d 80 02 a9   Data
            .hex 19 8d 7c 02   ; $e82e: 19 8d 7c 02   Data
            .hex 8d 84 02 a9   ; $e832: 8d 84 02 a9   Data
            .hex 6c 8d 7a 02   ; $e836: 6c 8d 7a 02   Data
            .hex 8d 7e 02 a9   ; $e83a: 8d 7e 02 a9   Data
            .hex 7c 8d 82 02   ; $e83e: 7c 8d 82 02   Data
            .hex 8d 86 02 60   ; $e842: 8d 86 02 60   Data
            .hex ad 78 02 f0   ; $e846: ad 78 02 f0   Data
            .hex 01 60         ; $e84a: 01 60         Data
__e84c:     LDA #$40           ; $e84c: a9 40     
            STA $4C            ; $e84e: 85 4c     
            JMP __e9a0         ; $e850: 4c a0 e9  

;-------------------------------------------------------------------------------
            LDY $88            ; $e853: a4 88     
            LDA __e862,Y       ; $e855: b9 62 e8  
            STA $10            ; $e858: 85 10     
            LDA __e863,Y       ; $e85a: b9 63 e8  
            STA $11            ; $e85d: 85 11     
            JMP ($0010)        ; $e85f: 6c 10 00  

;-------------------------------------------------------------------------------
__e862:     .hex 68            ; $e862: 68            Data
__e863:     .hex e8 91 e8 cb   ; $e863: e8 91 e8 cb   Data
            .hex e8 ad 78 02   ; $e867: e8 ad 78 02   Data
            .hex c9 a0 90 01   ; $e86b: c9 a0 90 01   Data
            .hex 60 e6 88 e6   ; $e86f: 60 e6 88 e6   Data
            .hex 88 a9 0c 8d   ; $e873: 88 a9 0c 8d   Data
            .hex 8c 02 a9 20   ; $e877: 8c 02 a9 20   Data
            .hex 8d 92 02 a9   ; $e87b: 8d 92 02 a9   Data
            .hex f7 8d 74 02   ; $e87f: f7 8d 74 02   Data
            .hex a9 7c 8d 76   ; $e883: a9 7c 8d 76   Data
            .hex 02 a9 ff 85   ; $e887: 02 a9 ff 85   Data
            .hex 1a a9 00 85   ; $e88b: 1a a9 00 85   Data
            .hex 1b 60 ad 74   ; $e88f: 1b 60 ad 74   Data
            .hex 02 c9 80 d0   ; $e893: 02 c9 80 d0   Data
            .hex 23 a9 ff 85   ; $e897: 23 a9 ff 85   Data
            .hex 1a a9 c0 85   ; $e89b: 1a a9 c0 85   Data
            .hex 1b a9 42 8d   ; $e89f: 1b a9 42 8d   Data
            .hex 8e 02 a9 00   ; $e8a3: 8e 02 a9 00   Data
            .hex 8d 94 02 a9   ; $e8a7: 8d 94 02 a9   Data
            .hex 80 8d 7c 02   ; $e8ab: 80 8d 7c 02   Data
            .hex a9 7c 8d 7e   ; $e8af: a9 7c 8d 7e   Data
            .hex 02 a9 00 85   ; $e8b3: 02 a9 00 85   Data
            .hex 22 85 23 60   ; $e8b7: 22 85 23 60   Data
__e8bb:     .hex c9 78 f0 01   ; $e8bb: c9 78 f0 01   Data
            .hex 60            ; $e8bf: 60            Data
__e8c0:     .hex a9 00 85 1a   ; $e8c0: a9 00 85 1a   Data
            .hex 85 1b e6 88   ; $e8c4: 85 1b e6 88   Data
            .hex e6 88 60 ad   ; $e8c8: e6 88 60 ad   Data
            .hex 8c 02 29 40   ; $e8cc: 8c 02 29 40   Data
            .hex d0 0f a9 46   ; $e8d0: d0 0f a9 46   Data
            .hex 8d 8c 02 a9   ; $e8d4: 8d 8c 02 a9   Data
            .hex 45 8d 8e 02   ; $e8d8: 45 8d 8e 02   Data
            .hex a9 40 85 89   ; $e8dc: a9 40 85 89   Data
            .hex 60            ; $e8e0: 60            Data
__e8e1:     DEC $89            ; $e8e1: c6 89     
            BEQ __e8e6         ; $e8e3: f0 01     
            RTS                ; $e8e5: 60        

;-------------------------------------------------------------------------------
__e8e6:     LDA $028c          ; $e8e6: ad 8c 02  
            CMP #$47           ; $e8e9: c9 47     
            BNE __e8f0         ; $e8eb: d0 03     
            JMP __e9a0         ; $e8ed: 4c a0 e9  

;-------------------------------------------------------------------------------
__e8f0:     LDA #$47           ; $e8f0: a9 47     
            STA $028c          ; $e8f2: 8d 8c 02  
            LDA #$40           ; $e8f5: a9 40     
            STA $89            ; $e8f7: 85 89     
            RTS                ; $e8f9: 60        

;-------------------------------------------------------------------------------
            LDY $88            ; $e8fa: a4 88     
            LDA __e909,Y       ; $e8fc: b9 09 e9  
            STA $10            ; $e8ff: 85 10     
            LDA __e90a,Y       ; $e901: b9 0a e9  
            STA $11            ; $e904: 85 11     
            JMP ($0010)        ; $e906: 6c 10 00  

;-------------------------------------------------------------------------------
__e909:     .hex 11            ; $e909: 11            Data
__e90a:     .hex e9 3a e9 65   ; $e90a: e9 3a e9 65   Data
            .hex e9 96 e9 ad   ; $e90e: e9 96 e9 ad   Data
            .hex 78 02 c9 d8   ; $e912: 78 02 c9 d8   Data
            .hex 90 01 60 e6   ; $e916: 90 01 60 e6   Data
            .hex 88 e6 88 a9   ; $e91a: 88 e6 88 a9   Data
            .hex 4c 8d 8c 02   ; $e91e: 4c 8d 8c 02   Data
            .hex a9 20 8d 92   ; $e922: a9 20 8d 92   Data
            .hex 02 a9 f7 8d   ; $e926: 02 a9 f7 8d   Data
            .hex 74 02 a9 7c   ; $e92a: 74 02 a9 7c   Data
            .hex 8d 76 02 a9   ; $e92e: 8d 76 02 a9   Data
            .hex ff 85 1a a9   ; $e932: ff 85 1a a9   Data
            .hex 00 85 1b 60   ; $e936: 00 85 1b 60   Data
            .hex ad 74 02 f0   ; $e93a: ad 74 02 f0   Data
            .hex 01 60         ; $e93e: 01 60         Data
__e940:     .hex e6 88 e6 88   ; $e940: e6 88 e6 88   Data
            .hex a9 28 85 4c   ; $e944: a9 28 85 4c   Data
            .hex a9 4a 8d 8c   ; $e948: a9 4a 8d 8c   Data
            .hex 02 a9 23 8d   ; $e94c: 02 a9 23 8d   Data
            .hex 92 02 a9 09   ; $e950: 92 02 a9 09   Data
            .hex 8d 74 02 a9   ; $e954: 8d 74 02 a9   Data
            .hex 7c 8d 76 02   ; $e958: 7c 8d 76 02   Data
            .hex a9 01 85 1a   ; $e95c: a9 01 85 1a   Data
            .hex a9 00 85 1b   ; $e960: a9 00 85 1b   Data
            .hex 60 a9 01 8d   ; $e964: 60 a9 01 8d   Data
            .hex 0d 06 8d 0e   ; $e968: 0d 06 8d 0e   Data
            .hex 06 ad 74 02   ; $e96c: 06 ad 74 02   Data
            .hex c9 19 b0 01   ; $e970: c9 19 b0 01   Data
            .hex 60            ; $e974: 60            Data
__e975:     .hex e6 88 e6 88   ; $e975: e6 88 e6 88   Data
            .hex a9 4c 8d 8d   ; $e979: a9 4c 8d 8d   Data
            .hex 02 a9 21 8d   ; $e97d: 02 a9 21 8d   Data
            .hex 93 02 a9 11   ; $e981: 93 02 a9 11   Data
            .hex 8d 78 02 a9   ; $e985: 8d 78 02 a9   Data
            .hex 84 8d 7a 02   ; $e989: 84 8d 7a 02   Data
            .hex a9 01 85 1e   ; $e98d: a9 01 85 1e   Data
            .hex a9 00 85 1f   ; $e991: a9 00 85 1f   Data
            .hex 60 ad 78 02   ; $e995: 60 ad 78 02   Data
            .hex f0 01 60      ; $e999: f0 01 60      Data
__e99c:     LDA #$40           ; $e99c: a9 40     
            STA $4C            ; $e99e: 85 4c     
__e9a0:     LDA #$00           ; $e9a0: a9 00     
            STA $3F            ; $e9a2: 85 3f     
            RTS                ; $e9a4: 60        

;-------------------------------------------------------------------------------
            LDA #$1A           ; $e9a5: a9 1a     
            STA $00            ; $e9a7: 85 00     
            LDA #$00           ; $e9a9: a9 00     
            STA $01            ; $e9ab: 85 01     
            LDA #$74           ; $e9ad: a9 74     
            STA $02            ; $e9af: 85 02     
            LDA #$02           ; $e9b1: a9 02     
            STA $03            ; $e9b3: 85 03     
            LDX #$00           ; $e9b5: a2 00     
__e9b7:     LDY #$00           ; $e9b7: a0 00     
            LDA ($02),Y        ; $e9b9: b1 02     
            BEQ __ea00         ; $e9bb: f0 43     
            INY                ; $e9bd: c8        
            LDA ($00),Y        ; $e9be: b1 00     
            CLC                ; $e9c0: 18        
            ADC ($02),Y        ; $e9c1: 71 02     
            STA ($02),Y        ; $e9c3: 91 02     
            DEY                ; $e9c5: 88        
            LDA ($00),Y        ; $e9c6: b1 00     
            ADC ($02),Y        ; $e9c8: 71 02     
            STA ($02),Y        ; $e9ca: 91 02     
            CMP #$c0           ; $e9cc: c9 c0     
            bcc __e9da         ; $e9ce: 90 0a     
__e9d0:     LDA #$20           ; $e9d0: a9 20     
            ORA $0292,X        ; $e9d2: 1d 92 02  
            STA $0292,X        ; $e9d5: 9d 92 02  
            BNE __e9e6         ; $e9d8: d0 0c     
__e9da:     CMP #$40           ; $e9da: c9 40     
            bcc __e9d0         ; $e9dc: 90 f2     
            LDA #$DF           ; $e9de: a9 df     
            AND $0292,X        ; $e9e0: 3d 92 02  
            STA $0292,X        ; $e9e3: 9d 92 02  
__e9e6:     LDY #$00           ; $e9e6: a0 00     
            LDA ($02),Y        ; $e9e8: b1 02     
            CMP #$FC           ; $e9ea: c9 fc     
            bcc __e9fc         ; $e9ec: 90 0e     
__e9ee:     LDA #$00           ; $e9ee: a9 00     
            STA ($02),Y        ; $e9f0: 91 02     
            STA ($00),Y        ; $e9f2: 91 00     
            INY                ; $e9f4: c8        
            STA ($00),Y        ; $e9f5: 91 00     
            INY                ; $e9f7: c8        
            STA ($02),Y        ; $e9f8: 91 02     
            BNE __ea00         ; $e9fa: d0 04     
__e9fc:     CMP #$04           ; $e9fc: c9 04     
            bcc __e9ee         ; $e9fe: 90 ee     
__ea00:     LDA $00            ; $ea00: a5 00     
            CLC                ; $ea02: 18        
            ADC #$04           ; $ea03: 69 04     
            STA $00            ; $ea05: 85 00     
            LDA $01            ; $ea07: a5 01     
            ADC #$00           ; $ea09: 69 00     
            STA $01            ; $ea0b: 85 01     
            LDA $02            ; $ea0d: a5 02     
            CLC                ; $ea0f: 18        
            ADC #$04           ; $ea10: 69 04     
            STA $02            ; $ea12: 85 02     
            LDA $03            ; $ea14: a5 03     
            ADC #$00           ; $ea16: 69 00     
            STA $03            ; $ea18: 85 03     
            INX                ; $ea1a: e8        
            CPX #$05           ; $ea1b: e0 05     
            BNE __e9b7         ; $ea1d: d0 98     
            RTS                ; $ea1f: 60        

;-------------------------------------------------------------------------------
            LDY $87            ; $ea20: a4 87     
            LDA __ea2f,Y       ; $ea22: b9 2f ea  
            STA $10            ; $ea25: 85 10     
            LDA __ea30,Y       ; $ea27: b9 30 ea  
            STA $11            ; $ea2a: 85 11     
            JMP ($0010)        ; $ea2c: 6c 10 00  

;-------------------------------------------------------------------------------
__ea2f:     .hex 35            ; $ea2f: 35            Data
__ea30:     .hex ea c9 ea f9   ; $ea30: ea c9 ea f9   Data
            .hex ea a4 88 b9   ; $ea34: ea a4 88 b9   Data
            .hex 44 ea 85 10   ; $ea38: 44 ea 85 10   Data
            .hex b9 45 ea 85   ; $ea3c: b9 45 ea 85   Data
            .hex 11 6c 10 00   ; $ea40: 11 6c 10 00   Data
            .hex 4c ea 62 ea   ; $ea44: 4c ea 62 ea   Data
            .hex 79 ea 90 ea   ; $ea48: 79 ea 90 ea   Data
__ea4c:     .hex e6 b7 a5 b7   ; $ea4c: e6 b7 a5 b7   Data
            .hex 29 07 a8 b9   ; $ea50: 29 07 a8 b9   Data
            .hex 5a ea 8d 8d   ; $ea54: 5a ea 8d 8d   Data
            .hex 02 60         ; $ea58: 02 60         Data
__ea5a:     .hex 04 04 04 05   ; $ea5a: 04 04 04 05   Data
            .hex 05 04 01 01   ; $ea5e: 05 04 01 01   Data
            .hex a5 4b 29 07   ; $ea62: a5 4b 29 07   Data
            .hex d0 e4 a5 4b   ; $ea66: d0 e4 a5 4b   Data
            .hex 29 08 d0 04   ; $ea6a: 29 08 d0 04   Data
            .hex a9 0c d0 02   ; $ea6e: a9 0c d0 02   Data
            .hex a9 0d 8d 8c   ; $ea72: a9 0d 8d 8c   Data
            .hex 02 d0 d3      ; $ea76: 02 d0 d3      Data
__ea79:     LDA Frame_Ctr      ; $ea79: a5 4b     
            AND #$07           ; $ea7b: 29 07     
            BEQ __ea80         ; $ea7d: f0 01     
            RTS                ; $ea7f: 60        

;-------------------------------------------------------------------------------
__ea80:     LDA Frame_Ctr      ; $ea80: a5 4b     
            AND #$08           ; $ea82: 29 08     
            BNE __ea8a         ; $ea84: d0 04     
            LDA #$1E           ; $ea86: a9 1e     
            BNE __ea8c         ; $ea88: d0 02     
__ea8a:     LDA #$1F           ; $ea8a: a9 1f     
__ea8c:     STA $028c          ; $ea8c: 8d 8c 02  
            RTS                ; $ea8f: 60        

;-------------------------------------------------------------------------------
            INC $B7            ; $ea90: e6 b7     
            LDA $B7            ; $ea92: a5 b7     
            AND #$07           ; $ea94: 29 07     
            TAY                ; $ea96: a8        
            LDA __eab5,Y       ; $ea97: b9 b5 ea  
            TAY                ; $ea9a: a8        
            LDA __eabd,Y       ; $ea9b: b9 bd ea  
            STA $028d          ; $ea9e: 8d 8d 02  
            LDA __eabe,Y       ; $eaa1: b9 be ea  
            STA $028e          ; $eaa4: 8d 8e 02  
            LDA __eabf,Y       ; $eaa7: b9 bf ea  
            STA $028f          ; $eaaa: 8d 8f 02  
            LDA __eac0,Y       ; $eaad: b9 c0 ea  
            STA $0290          ; $eab0: 8d 90 02  
            BNE __ea79         ; $eab3: d0 c4     
            BRK                ; $eab5:  00
            
 ; This data is a mess. Will need to rough it out later.               
            .hex 00 00 04      ; $eab6:  00 00 04      Data
            .hex 04 00 08 08   ; $eab9: 04 00 08 08   Data
__eabd:     .hex 3c            ; $eabd: 3c            Data
__eabe:     .hex 3d            ; $eabe: 3d            Data
__eabf:     .hex 3e            ; $eabf: 3e            Data
__eac0:     .hex 3f 3c 40 3e   ; $eac0: 3f 3c 40 3e   Data
            .hex 41 38 39 3a   ; $eac4: 41 38 39 3a   Data
            .hex 3b a4 88 b9   ; $eac8: 3b a4 88 b9   Data
            .hex d8 ea 85 10   ; $eacc: d8 ea 85 10   Data
            .hex b9 d9 ea 85   ; $ead0: b9 d9 ea 85   Data
            .hex 11 6c 10 00   ; $ead4: 11 6c 10 00   Data
            .hex 4c ea de ea   ; $ead8: 4c ea de ea   Data
            .hex 4c ea 20 62   ; $eADC: 4c ea 20 62   Data
            .hex ea ad 74 02   ; $eae0: ea ad 74 02   Data
            .hex c9 7d d0 06   ; $eae4: c9 7d d0 06   Data
            .hex a9 43 8d 8e   ; $eae8: a9 43 8d 8e   Data
            .hex 02 60 c9 7b   ; $eaec: 02 60 c9 7b   Data
            .hex f0 01 60      ; $eaf0: f0 01 60      Data
__eaf3:     .hex a9 44 8d 8e   ; $eaf3: a9 44 8d 8e   Data
            .hex 02 60 a4 88   ; $eaf7: 02 60 a4 88   Data
            .hex b9 08 eb 85   ; $eafb: b9 08 eb 85   Data
            .hex 10 b9 09 eb   ; $eaff: 10 b9 09 eb   Data
            .hex 85 11 6c 10   ; $eb03: 85 11 6c 10   Data
            .hex 00            ; $eb07: 00            Data
__eb08:     .hex 4c            ; $eb08: 4c            Data
__eb09:     .hex ea 10 eb 2b   ; $eb09: ea 10 eb 2b   Data
            .hex eb 2b eb a5   ; $eb0d: eb 2b eb a5   Data
            .hex 4b 29 07 f0   ; $eb11: 4b 29 07 f0   Data
            .hex 03 4c 4c ea   ; $eb15: 03 4c 4c ea   Data
            .hex a5 4b 29 08   ; $eb19: a5 4b 29 08   Data
            .hex d0 04 a9 48   ; $eb1d: d0 04 a9 48   Data
            .hex d0 02 a9 49   ; $eb21: d0 02 a9 49   Data
            .hex 8d 8c 02 4c   ; $eb25: 8d 8c 02 4c   Data
            .hex 4c ea a5 4b   ; $eb29: 4c ea a5 4b   Data
            .hex 29 07 f0 01   ; $eb2d: 29 07 f0 01   Data
            .hex 60            ; $eb31: 60            Data
__eb32:     .hex a5 4b 29 08   ; $eb32: a5 4b 29 08   Data
            .hex d0 04 a9 4a   ; $eb36: d0 04 a9 4a   Data
            .hex d0 02         ; $eb3a: d0 02         Data
__eb3c:     .hex a9 4b         ; $eb3c: a9 4b         Data
__eb3e:     .hex 8d 8c 02 60   ; $eb3e: 8d 8c 02 60   Data
__eb42:     .hex 00 07 00 00   ; $eb42: 00 07 00 00   Data
            .hex 00 04 01 06   ; $eb46: 00 04 01 06   Data
            .hex 01 01 01 04   ; $eb4a: 01 01 01 04   Data
            .hex 01 04 02 02   ; $eb4e: 01 04 02 02   Data
            .hex 02 03 02 03   ; $eb52: 02 03 02 03   Data
            .hex 02 02 02 03   ; $eb56: 02 02 02 03   Data
            .hex 02 02 02 02   ; $eb5a: 02 02 02 02   Data
            .hex 03 03 03 05   ; $eb5e: 03 03 03 05   Data
            .hex 03 02 03 03   ; $eb62: 03 02 03 03   Data
            .hex 03 02 03 02   ; $eb66: 03 02 03 02   Data
            .hex 04 03 03 02   ; $eb6a: 04 03 03 02   Data
            .hex 03 02 04 03   ; $eb6e: 03 02 04 03   Data
            .hex 03 01 04 02   ; $eb72: 03 01 04 02   Data
            .hex 05 03 03 05   ; $eb76: 05 03 03 05   Data
            .hex 04 02 05 03   ; $eb7a: 04 02 05 03   Data
            .hex 03 02 04 02   ; $eb7e: 03 02 04 02   Data
            .hex 06 03 03 01   ; $eb82: 06 03 03 01   Data
            .hex 05 02 06 03   ; $eb86: 05 02 06 03   Data
            .hex 03 01 05 02   ; $eb8a: 03 01 05 02   Data
            .hex 07 03 03 03   ; $eb8e: 07 03 03 03   Data
            .hex 05 02 07 03   ; $eb92: 05 02 07 03   Data
            .hex 03 01 06 02   ; $eb96: 03 01 06 02   Data
            .hex 07 03 03 01   ; $eb9a: 07 03 03 01   Data
            .hex 06 02 07 03   ; $eb9e: 06 02 07 03   Data
            .hex 03 00 06 02   ; $eba2: 03 00 06 02   Data
            .hex 07 03 03 01   ; $eba6: 07 03 03 01   Data
            .hex 06 02 07 03   ; $ebaa: 06 02 07 03   Data
            .hex 03 00 06 02   ; $ebae: 03 00 06 02   Data
            .hex 07 03 03 00   ; $ebb2: 07 03 03 00   Data
            .hex 06 02 07 03   ; $ebb6: 06 02 07 03   Data
            .hex 03 00 06 02   ; $ebba: 03 00 06 02   Data
            .hex 07 03 04 00   ; $ebbe: 07 03 04 00   Data
            .hex 06 02 07 03   ; $ebc2: 06 02 07 03   Data
            .hex 04 00 06 02   ; $ebc6: 04 00 06 02   Data
            .hex 07 03         ; $ebca: 07 03         Data
__ebcc:     .hex d0 00         ; $ebcc: d0 00         Data
__ebce:     .hex c0 00 a0 00   ; $ebce: c0 00 a0 00   Data
            .hex b0 00         ; $ebd2: b0 00         Data
__ebd4:     .hex a0 00 80 00   ; $ebd4: a0 00 80 00   Data
            .hex a0 00 b0 00   ; $ebd8: a0 00 b0 00   Data
__ebdc:     bcc __ebde         ; $ebdc: 90 00     
__ebde:     bvc __ebe0         ; $ebde: 50 00     
__ebe0:     bvc __ebe2         ; $ebe0: 50 00     
__ebe2:     BNE __ebe4         ; $ebe2: d0 00     
__ebe4:     CPY #$00           ; $ebe4: c0 00     
            LDY #$00           ; $ebe6: a0 00     
            BCS __ebea         ; $ebe8: b0 00     
__ebea:     LDY #$00           ; $ebea: a0 00     
            .hex 80 00         ; $ebec: 80 00     Invalid Opcode - NOP #$00
            BCS __ebf0         ; $ebee: b0 00     
__ebf0:     CPY #$00           ; $ebf0: c0 00     
            LDY #$00           ; $ebf2: a0 00     
            bvc __ebf6         ; $ebf4: 50 00     
__ebf6:     bvc __ebf8         ; $ebf6: 50 00     
__ebf8:     BEQ __ebfa         ; $ebf8: f0 00     
__ebfa:     CPX #$00           ; $ebfa: e0 00     
            CPY #$00           ; $ebfc: c0 00     
            CPX #$00           ; $ebfe: e0 00     
            BNE __ec02         ; $ec00: d0 00     
__ec02:     BCS __ec04         ; $ec02: b0 00     
__ec04:     CPX #$00           ; $ec04: e0 00     
            BEQ __ec08         ; $ec06: f0 00     
__ec08:     BNE __ec0a         ; $ec08: d0 00     
__ec0a:     BVS __ec0c         ; $ec0a: 70 00     
__ec0c:     BVS __ec0e         ; $ec0c: 70 00     
__ec0e:     BRK                ; $ec0e: 00        
            ORA ($f0,X)        ; $ec0f: 01 f0     
            BRK                ; $ec11: 00        
            BNE __ec14         ; $ec12: d0 00     
__ec14:     BRK                ; $ec14: 00        
            ORA ($f0,X)        ; $ec15: 01 f0     
            BRK                ; $ec17: 00        
            BNE __ec1a         ; $ec18: d0 00     
__ec1a:     BRK                ; $ec1a: 00        
            ORA ($10,X)        ; $ec1b: 01 10     
            ORA ($f0,X)        ; $ec1d: 01 f0     
            BRK                ; $ec1f: 00        
            .hex 80 00         ; $ec20: 80 00     Invalid Opcode - NOP #$00
            .hex 80 00         ; $ec22: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $ec24: 00        
            ORA ($f0,X)        ; $ec25: 01 f0     
            BRK                ; $ec27: 00        
            BNE __ec2a         ; $ec28: d0 00     
__ec2a:     BRK                ; $ec2a: 00        
            ORA ($f0,X)        ; $ec2b: 01 f0     
            BRK                ; $ec2d: 00        
            BNE __ec30         ; $ec2e: d0 00     
__ec30:     JSR $3001          ; $ec30: 20 01 30  
            ORA ($10,X)        ; $ec33: 01 10     
            ORA ($80,X)        ; $ec35: 01 80     
            BRK                ; $ec37: 00        
            .hex 80 00         ; $ec38: 80 00     Invalid Opcode - NOP #$00
__ec3a:     .hex 07 14 07 14   ; $ec3a: 07 14 07 14   Data
            .hex 05 14 05 ff   ; $ec3e: 05 14 05 ff   Data
            .hex 07 14 07 14   ; $ec42: 07 14 07 14   Data
            .hex 05 ff 00 00   ; $ec46: 05 ff 00 00   Data
            .hex 05 14 05 14   ; $ec4a: 05 14 05 14   Data
            .hex 05 ff 00 00   ; $ec4e: 05 ff 00 00   Data
            .hex 05 14 05 14   ; $ec52: 05 14 05 14   Data
            .hex 05 ff 00 00   ; $ec56: 05 ff 00 00   Data
__ec5a:     .hex 14 0a 1e 0f   ; $ec5a: 14 0a 1e 0f   Data
            .hex 28 14 32 19   ; $ec5e: 28 14 32 19   Data
            .hex 3c 1e 50 28   ; $ec62: 3c 1e 50 28   Data
            .hex 64 32         ; $ec66: 64 32         Data
__ec68:     .hex 02 1e 5a 00   ; $ec68: 02 1e 5a 00   Data
            .hex 03 32 00 00   ; $ec6c: 03 32 00 00   Data
            .hex 04 00 00 00   ; $ec70: 04 00 00 00   Data
            .hex 01 07 11 20   ; $ec74: 01 07 11 20   Data
            .hex 2d 1f d0 d0   ; $ec78: 2d 1f d0 d0   Data
            .hex 10 13 d0 d0   ; $ec7c: 10 13 d0 d0   Data
            .hex 10 1d 2d 11   ; $ec80: 10 1d 2d 11   Data
            .hex c3 c3 03 11   ; $ec84: c3 c3 03 11   Data
            .hex c3 c3 03 11   ; $ec88: c3 c3 03 11   Data
            .hex 2d            ; $ec8c: 2d            Data
__ec8d:     .hex 11            ; $ec8d: 11            Data
__ec8e:     .hex 03 1f 10      ; $ec8e: 03 1f 10      Data
__ec91:     .hex 1d 03 1f 10   ; $ec91: 1d 03 1f 10   Data
            .hex 1d 03 11 03   ; $ec95: 1d 03 11 03   Data
            .hex 1f 10 1d 03   ; $ec99: 1f 10 1d 03   Data
            .hex 1f 10 1d 03   ; $ec9d: 1f 10 1d 03   Data
            .hex 11 2d 11 01   ; $eca1: 11 2d 11 01   Data
            .hex 11 20 11 03   ; $eca5: 11 20 11 03   Data
            .hex 11 20 11 03   ; $eca9: 11 20 11 03   Data
            .hex 11 03 11 20   ; $ecad: 11 03 11 20   Data
            .hex 11 03         ; $ecb1: 11 03         Data
__ecb3:     .hex 11 20 11 01   ; $ecb3: 11 20 11 01   Data
            .hex 11 2d         ; $ecb7: 11 2d         Data
__ecb9:     .hex 11 03 1e 10   ; $ecb9: 11 03 1e 10   Data
__ecbd:     .hex 1c 03 1e 10   ; $ecbd: 1c 03 1e 10   Data
            .hex 1c 03 1a 03   ; $ecc1: 1c 03 1a 03   Data
            .hex 1e 10 1c 03   ; $ecc5: 1e 10 1c 03   Data
            .hex 1e 10 1c 03   ; $ecc9: 1e 10 1c 03   Data
            .hex 11 2d 11 c3   ; $eccd: 11 2d 11 c3   Data
            .hex c3 c3 c3 83   ; $ecd1: c3 c3 c3 83   Data
            .hex 11 2d 11 03   ; $ecd5: 11 2d 11 03   Data
            .hex 1f 10 1d 03   ; $ecd9: 1f 10 1d 03   Data
            .hex 1b            ; $ecdd: 1b            Data
__ecde:     .hex 03 1f         ; $ecde: 03 1f     Invalid Opcode - SLO ($1F,X)
            BPL __ecf2         ; $ece0: 10 10     
            BPL __ed01         ; $ece2: 10 1d     
__ece4:     .hex 03 1b         ; $ece4: 03 1b     Invalid Opcode - SLO ($1B,X)
            .hex 03 1f         ; $ece6: 03 1f     Invalid Opcode - SLO ($1F,X)
__ece8:     BPL __ed07         ; $ece8: 10 1d     
            .hex 03 11         ; $ecea: 03 11     Invalid Opcode - SLO ($11,X)
            AND $0311          ; $ecec: 2d 11 03  
            ASL $1C10,X        ; $ecef: 1e 10 1c  
__ecf2:     .hex 03 11         ; $ecf2: 03 11     Invalid Opcode - SLO ($11,X)
            .hex 03 1e         ; $ecf4: 03 1e     Invalid Opcode - SLO ($1E,X)
            BPL __ed0b         ; $ecf6: 10 13     
            BPL __ed16         ; $ecf8: 10 1c     
            .hex 03 11         ; $ecfa: 03 11     Invalid Opcode - SLO ($11,X)
            .hex 03 1e         ; $ecfc: 03 1e     Invalid Opcode - SLO ($1E,X)
            BPL __ed1c         ; $ecfe: 10 1c     
            .hex 03            ; $ed00: 03        Suspected data
__ed01:     ORA ($2D),Y        ; $ed01: 11 2d     
            ORA ($c3),Y        ; $ed03: 11 c3     
            .hex 03 11         ; $ed05: 03 11     Invalid Opcode - SLO ($11,X)
__ed07:     .hex 83 11         ; $ed07: 83 11     Invalid Opcode - SAX ($11,X)
            .hex 83 11         ; $ed09: 83 11     Invalid Opcode - SAX ($11,X)
__ed0b:     .hex c3 03         ; $ed0b: c3 03     Invalid Opcode - DCP ($03,X)
            ORA ($2D),Y        ; $ed0d: 11 2d     
            ASL $1D90,X        ; $ed0f: 1e 90 1d  
            .hex 03 15         ; $ed12: 03 15     Invalid Opcode - SLO ($15,X)
            BPL __ed2e         ; $ed14: 10 18     
__ed16:     PHP                ; $ed16: 08        
            .hex 1a            ; $ed17: 1a        Invalid Opcode - NOP 
            PHP                ; $ed18: 08        
            ORA $1410,Y        ; $ed19: 19 10 14  
__ed1c:     .hex 03 1f         ; $ed1c: 03 1f     Invalid Opcode - SLO ($1F,X)
            bcc __ed3c         ; $ed1e: 90 1c     
            AND $11e0          ; $ed20: 2d e0 11  
            .hex 03 11         ; $ed23: 03 11     Invalid Opcode - SLO ($11,X)
            CPY #$80           ; $ed25: c0 80     
            ORA ($03),Y        ; $ed27: 11 03     
            ORA ($e0),Y        ; $ed29: 11 e0     
            AND $11e0          ; $ed2b: 2d e0 11  
__ed2e:     .hex 03 11         ; $ed2e: 03 11     Invalid Opcode - SLO ($11,X)
            BRK                ; $ed30: 00        
            .hex 1f 17 2c      ; $ed31: 1f 17 2c  Invalid Opcode - SLO $2C17,X
            ASL $1D,X          ; $ed34: 16 1d     
            BRK                ; $ed36: 00        
            ORA ($03),Y        ; $ed37: 11 03     
            ORA ($e0),Y        ; $ed39: 11 e0     
            .hex 2d            ; $ed3b: 2d        Suspected data
__ed3c:     .hex 22            ; $ed3c: 22        Invalid Opcode - KIL 
            bcc __ed5b         ; $ed3d: 90 1c     
            .hex 03 1a         ; $ed3f: 03 1a     Invalid Opcode - SLO ($1A,X)
            BRK                ; $ed41: 00        
            ORA ($80),Y        ; $ed42: 11 80     
            ORA ($00),Y        ; $ed44: 11 00     
            .hex 1a            ; $ed46: 1a        Invalid Opcode - NOP 
            .hex 03 1e         ; $ed47: 03 1e     Invalid Opcode - SLO ($1E,X)
            bcc __ed6c         ; $ed49: 90 21     
            .hex 04 06         ; $ed4b: 04 06     Invalid Opcode - NOP $06
            CPY #$03           ; $ed4d: c0 03     
            RTI                ; $ed4f: 40        

;-------------------------------------------------------------------------------
            ORA ($80),Y        ; $ed50: 11 80     
            ORA ($40),Y        ; $ed52: 11 40     
            .hex 03 c0         ; $ed54: 03 c0     Invalid Opcode - SLO ($c0,X)
            ORA $2D            ; $ed56: 05 2d     
            .hex 22            ; $ed58: 22        Invalid Opcode - KIL 
            bcc __ed78         ; $ed59: 90 1d     
__ed5b:     .hex 03 1b         ; $ed5b: 03 1b     Invalid Opcode - SLO ($1B,X)
            BRK                ; $ed5d: 00        
            ASL $1C90,X        ; $ed5e: 1e 90 1c  
            BRK                ; $ed61: 00        
            .hex 1b 03 1f      ; $ed62: 1b 03 1f  Invalid Opcode - SLO $1F03,Y
            bcc __ed88         ; $ed65: 90 21     
            AND $11e0          ; $ed67: 2d e0 11  
            .hex 03 11         ; $ed6a: 03 11     Invalid Opcode - SLO ($11,X)
__ed6c:     CPY #$80           ; $ed6c: c0 80     
            ORA ($03),Y        ; $ed6e: 11 03     
            ORA ($e0),Y        ; $ed70: 11 e0     
            AND $11e0          ; $ed72: 2d e0 11  
            .hex 03 11         ; $ed75: 03 11     Invalid Opcode - SLO ($11,X)
            BRK                ; $ed77: 00        
__ed78:     .hex 1f 90 1d      ; $ed78: 1f 90 1d  Invalid Opcode - SLO $1D90,X
            BRK                ; $ed7b: 00        
            ORA ($03),Y        ; $ed7c: 11 03     
            ORA ($e0),Y        ; $ed7e: 11 e0     
            AND $901f          ; $ed80: 2d 1f 90  
            .hex 1c 03 1a      ; $ed83: 1c 03 1a  Invalid Opcode - NOP $1A03,X
            BRK                ; $ed86: 00        
            .hex 1e            ; $ed87: 1e        Suspected data
__ed88:     BPL __ed9d         ; $ed88: 10 13     
            BPL __eda8         ; $ed8a: 10 1c     
            BRK                ; $ed8c: 00        
            .hex 1a            ; $ed8d: 1a        Invalid Opcode - NOP 
            .hex 03 1e         ; $ed8e: 03 1e     Invalid Opcode - SLO ($1E,X)
            bcc __edaf         ; $ed90: 90 1d     
            AND __c311         ; $ed92: 2d 11 c3  
            .hex c3 03         ; $ed95: c3 03     Invalid Opcode - DCP ($03,X)
            ORA ($c3),Y        ; $ed97: 11 c3     
            .hex c3 03         ; $ed99: c3 03     Invalid Opcode - DCP ($03,X)
            ORA ($2D),Y        ; $ed9b: 11 2d     
__ed9d:     ORA ($03),Y        ; $ed9d: 11 03     
            ORA $1D10,Y        ; $ed9f: 19 10 1d  
            .hex 03 19         ; $eda2: 03 19     Invalid Opcode - SLO ($19,X)
            BPL __edbe         ; $eda4: 10 18     
            ORA #$1A           ; $eda6: 09 1a     
__eda8:     ORA #$19           ; $eda8: 09 19     
            BPL __edc4         ; $edaa: 10 18     
            .hex 03 1f         ; $edac: 03 1f     Invalid Opcode - SLO ($1F,X)
            .hex 10            ; $edae: 10        Suspected data
__edaf:     CLC                ; $edaf: 18        
            .hex 03 11         ; $edb0: 03 11     Invalid Opcode - SLO ($11,X)
            AND $0111          ; $edb2: 2d 11 01  
            .hex 43 11         ; $edb5: 43 11     Invalid Opcode - SRE ($11,X)
            .hex c3 03         ; $edb7: c3 03     Invalid Opcode - DCP ($03,X)
            BRK                ; $edb9: 00        
            .hex c3 03         ; $edba: c3 03     Invalid Opcode - DCP ($03,X)
            ORA ($43),Y        ; $edbc: 11 43     
__edbe:     ORA ($11,X)        ; $edbe: 01 11     
            AND $1015          ; $edc0: 2d 15 10  
            .hex 1d            ; $edc3: 1d        Suspected data
__edc4:     .hex 03 11         ; $edc4: 03 11     Invalid Opcode - SLO ($11,X)
            .hex 03 1b         ; $edc6: 03 1b     Invalid Opcode - SLO ($1B,X)
            .hex 03 1f         ; $edc8: 03 1f     Invalid Opcode - SLO ($1F,X)
            bcc __ede9         ; $edca: 90 1d     
            .hex 03 1b         ; $edcc: 03 1b     Invalid Opcode - SLO ($1B,X)
            .hex 03 11         ; $edce: 03 11     Invalid Opcode - SLO ($11,X)
            .hex 03 1f         ; $edd0: 03 1f     Invalid Opcode - SLO ($1F,X)
            BPL __ede8         ; $edd2: 10 14     
            AND $1015          ; $edd4: 2d 15 10  
            .hex 1c 03 1a      ; $edd7: 1c 03 1a  Invalid Opcode - NOP $1A03,X
            .hex 03 11         ; $edda: 03 11     Invalid Opcode - SLO ($11,X)
            .hex 03 1e         ; $eddc: 03 1e     Invalid Opcode - SLO ($1E,X)
            BPL __edf3         ; $edde: 10 13     
            BPL __edfe         ; $ede0: 10 1c     
            .hex 03 11         ; $ede2: 03 11     Invalid Opcode - SLO ($11,X)
            .hex 03 1a         ; $ede4: 03 1a     Invalid Opcode - SLO ($1A,X)
__ede6:     .hex 03 1e         ; $ede6: 03 1e     Invalid Opcode - SLO ($1E,X)
__ede8:     .hex 10            ; $ede8: 10        Suspected data
__ede9:     .hex 14 2d         ; $ede9: 14 2d     Invalid Opcode - NOP $2D,X
            ORA ($c3),Y        ; $edeb: 11 c3     
            .hex 03 11         ; $eded: 03 11     Invalid Opcode - SLO ($11,X)
            .hex 83 11         ; $edef: 83 11     Invalid Opcode - SAX ($11,X)
            .hex 83 11         ; $edf1: 83 11     Invalid Opcode - SAX ($11,X)
__edf3:     .hex c3 03         ; $edf3: c3 03     Invalid Opcode - DCP ($03,X)
            ORA ($2D),Y        ; $edf5: 11 2d     
            ORA ($03),Y        ; $edf7: 11 03     
            ORA $1290,Y        ; $edf9: 19 90 12  
            BPL __ee16         ; $edfc: 10 18     
__edfe:     .hex 03 1a         ; $edfe: 03 1a     Invalid Opcode - SLO ($1A,X)
            .hex 03 19         ; $ee00: 03 19     Invalid Opcode - SLO ($19,X)
            BPL __ee16         ; $ee02: 10 12     
            bcc __ee1e         ; $ee04: 90 18     
            .hex 03 11         ; $ee06: 03 11     Invalid Opcode - SLO ($11,X)
            AND __c311         ; $ee08: 2d 11 c3  
            .hex c3 c3         ; $ee0b: c3 c3     Invalid Opcode - DCP ($c3,X)
            .hex c3 83         ; $ee0d: c3 83     Invalid Opcode - DCP ($83,X)
            ORA ($2D),Y        ; $ee0f: 11 2d     
            ASL __d0d0,X       ; $ee11: 1e d0 d0  
            BNE __ede6         ; $ee14: d0 d0     
__ee16:     bcc __ee34         ; $ee16: 90 1c     
__ee18:     LDA #$00           ; $ee18: a9 00     
            STA $f0            ; $ee1a: 85 f0     
            LDA #$06           ; $ee1c: a9 06     
__ee1e:     STA $f1            ; $ee1e: 85 f1     
            LDA #$25           ; $ee20: a9 25     
            STA $f2            ; $ee22: 85 f2     
            LDA #$06           ; $ee24: a9 06     
            STA $f3            ; $ee26: 85 f3     
            LDA __f08c         ; $ee28: ad 8c f0  
            STA $f4            ; $ee2b: 85 f4     
            LDA __f08d         ; $ee2d: ad 8d f0  
            STA $f5            ; $ee30: 85 f5     
            LDA #$40           ; $ee32: a9 40     
__ee34:     STA $f7            ; $ee34: 85 f7     
            LDA #$1F           ; $ee36: a9 1f     
            STA APUCTRL          ; $ee38: 8d 15 40  
            LDA #$c0           ; $ee3b: a9 c0     
            STA APUFrameCtr       ; $ee3d: 8d 17 40  
__ee40:     LDY #$00           ; $ee40: a0 00     
            LDA #$00           ; $ee42: a9 00     
__ee44:     STA ($f0),Y        ; $ee44: 91 f0     
            INY                ; $ee46: c8        
            CPY #$10           ; $ee47: c0 10     
            BNE __ee44         ; $ee49: d0 f9     
            LDY #$00           ; $ee4b: a0 00     
            LDX #$10           ; $ee4d: a2 10     
__ee4f:     LDA #$00           ; $ee4f: a9 00     
            STA ($f2),Y        ; $ee51: 91 f2     
            TYA                ; $ee53: 98        
            CLC                ; $ee54: 18        
            ADC #$08           ; $ee55: 69 08     
            TAY                ; $ee57: a8        
            DEX                ; $ee58: ca        
            BNE __ee4f         ; $ee59: d0 f4     
            RTS                ; $ee5b: 60        

;-------------------------------------------------------------------------------
__ee5c:     LDA #$00           ; $ee5c: a9 00     
            STA $F8            ; $ee5e: 85 f8     
            STA $f9            ; $ee60: 85 f9     
            STA $FA            ; $ee62: 85 fa     
            STA $FB            ; $ee64: 85 fb     
            STA $FD            ; $ee66: 85 fd     
            STA $FF            ; $ee68: 85 ff     
            LDA #$F8           ; $ee6a: a9 f8     
            STA $FE            ; $ee6c: 85 fe     
__ee6e:     LDY $FD            ; $ee6e: a4 fd     
            LDA ($f2),Y        ; $ee70: b1 f2     
            BEQ __eeae         ; $ee72: f0 3a     
            CMP #$05           ; $ee74: c9 05     
            bcc __ee83         ; $ee76: 90 0b     
            SEC                ; $ee78: 38        
            SBC #$05           ; $ee79: e9 05     
            TAY                ; $ee7b: a8        
            LDA #$01           ; $ee7c: a9 01     
            STA ($fe),Y        ; $ee7e: 91 fe     
            JMP __eeae         ; $ee80: 4c ae ee  

;-------------------------------------------------------------------------------
__ee83:     SEC                ; $ee83: 38        
            SBC #$01           ; $ee84: e9 01     
            TAY                ; $ee86: a8        
            LDA ($fe),Y        ; $ee87: b1 fe     
            BNE __eeae         ; $ee89: d0 23     
            LDA #$01           ; $ee8b: a9 01     
            STA ($fe),Y        ; $ee8d: 91 fe     
            TYA                ; $ee8f: 98        
            TAX                ; $ee90: aa        
            ADC #$04           ; $ee91: 69 04     
            LDY $FD            ; $ee93: a4 fd     
            STA ($f2),Y        ; $ee95: 91 f2     
            TXA                ; $ee97: 8a        
            ASL                ; $ee98: 0a        
            ASL                ; $ee99: 0a        
            STA $f6            ; $ee9a: 85 f6     
            LDX #$00           ; $ee9c: a2 00     
            LDA #$04           ; $ee9e: a9 04     
__eea0:     PHA                ; $eea0: 48        
            INY                ; $eea1: c8        
            LDA ($f2),Y        ; $eea2: b1 f2     
            STA ($f6,X)        ; $eea4: 81 f6     
            INC $f6            ; $eea6: e6 f6     
            PLA                ; $eea8: 68        
            SEC                ; $eea9: 38        
            SBC #$01           ; $eeaa: e9 01     
            BNE __eea0         ; $eeac: d0 f2     
__eeae:     LDA $FD            ; $eeae: a5 fd     
            CLC                ; $eeb0: 18        
            ADC #$08           ; $eeb1: 69 08     
            STA $FD            ; $eeb3: 85 fd     
            CMP #$80           ; $eeb5: c9 80     
            bcc __ee6e         ; $eeb7: 90 b5     
            LDY #$00           ; $eeb9: a0 00     
            STY $FC            ; $eebb: 84 fc     
            STY $FD            ; $eebd: 84 fd     
__eebf:     LDY $FC            ; $eebf: a4 fc     
            LDA ($f0),Y        ; $eec1: b1 f0     
            BNE __eec8         ; $eec3: d0 03     
            JMP __ef84         ; $eec5: 4c 84 ef  

;-------------------------------------------------------------------------------
__eec8:     LDY $FD            ; $eec8: a4 fd     
            LDA ($f2),Y        ; $eeca: b1 f2     
            BNE __ef1f         ; $eecc: d0 51     
            LDA $FC            ; $eece: a5 fc     
            ASL                ; $eed0: 0a        
            TAY                ; $eed1: a8        
            LDA ($f4),Y        ; $eed2: b1 f4     
            PHA                ; $eed4: 48        
            LDA $FD            ; $eed5: a5 fd     
            ADC #$05           ; $eed7: 69 05     
            TAY                ; $eed9: a8        
            PLA                ; $eeda: 68        
            STA ($f2),Y        ; $eedb: 91 f2     
            LDA $FC            ; $eedd: a5 fc     
            ASL                ; $eedf: 0a        
            ADC #$01           ; $eee0: 69 01     
            TAY                ; $eee2: a8        
            LDA ($f4),Y        ; $eee3: b1 f4     
            PHA                ; $eee5: 48        
            LDA $FD            ; $eee6: a5 fd     
            ADC #$06           ; $eee8: 69 06     
            TAY                ; $eeea: a8        
            PLA                ; $eeeb: 68        
            STA ($f2),Y        ; $eeec: 91 f2     
            JSR __f04f         ; $eeee: 20 4f f0  
            LDY $FD            ; $eef1: a4 fd     
            STA ($f2),Y        ; $eef3: 91 f2     
            JSR __f04f         ; $eef5: 20 4f f0  
            TAX                ; $eef8: aa        
            LDA $FD            ; $eef9: a5 fd     
            CLC                ; $eefb: 18        
            ADC #$01           ; $eefc: 69 01     
            TAY                ; $eefe: a8        
            TXA                ; $eeff: 8a        
            STA ($f2),Y        ; $ef00: 91 f2     
            JSR __f04f         ; $ef02: 20 4f f0  
            TAX                ; $ef05: aa        
            LDA $FD            ; $ef06: a5 fd     
            CLC                ; $ef08: 18        
            ADC #$02           ; $ef09: 69 02     
            TAY                ; $ef0b: a8        
            TXA                ; $ef0c: 8a        
            STA ($f2),Y        ; $ef0d: 91 f2     
            JSR __f04f         ; $ef0f: 20 4f f0  
            TAX                ; $ef12: aa        
            LDA $FD            ; $ef13: a5 fd     
            CLC                ; $ef15: 18        
            ADC #$04           ; $ef16: 69 04     
            TAY                ; $ef18: a8        
            TXA                ; $ef19: 8a        
            STA ($f2),Y        ; $ef1a: 91 f2     
            JMP __ef2e         ; $ef1c: 4c 2e ef  

;-------------------------------------------------------------------------------
__ef1f:     LDA $FD            ; $ef1f: a5 fd     
            CLC                ; $ef21: 18        
            ADC #$07           ; $ef22: 69 07     
            TAY                ; $ef24: a8        
            LDA ($f2),Y        ; $ef25: b1 f2     
            SEC                ; $ef27: 38        
            SBC #$01           ; $ef28: e9 01     
            STA ($f2),Y        ; $ef2a: 91 f2     
            BNE __ef84         ; $ef2c: d0 56     
__ef2e:     JSR __f04f         ; $ef2e: 20 4f f0  
            CMP #$f0           ; $ef31: c9 f0     
            BCS __ef99         ; $ef33: b0 64     
            CMP #$c0           ; $ef35: c9 c0     
            BCS __ef77         ; $ef37: b0 3e     
            PHA                ; $ef39: 48        
            AND #$f0           ; $ef3a: 29 f0     
            lsr                ; $ef3c: 4a        
            lsr                ; $ef3d: 4a        
            lsr                ; $ef3e: 4a        
            TAX                ; $ef3f: aa        
            LDA __f074,X       ; $ef40: bd 74 f0  
            STA $FE            ; $ef43: 85 fe     
            LDA __f075,X       ; $ef45: bd 75 f0  
            STA $FF            ; $ef48: 85 ff     
            PLA                ; $ef4a: 68        
            AND #$0F           ; $ef4b: 29 0f     
            BEQ __ef57         ; $ef4d: f0 08     
            TAX                ; $ef4f: aa        
__ef50:     lsr $FE            ; $ef50: 46 fe     
            ROR $FF            ; $ef52: 66 ff     
            DEX                ; $ef54: ca        
            BNE __ef50         ; $ef55: d0 f9     
__ef57:     LDA $FD            ; $ef57: a5 fd     
            CLC                ; $ef59: 18        
            ADC #$04           ; $ef5a: 69 04     
            TAY                ; $ef5c: a8        
            LDA ($f2),Y        ; $ef5d: b1 f2     
            AND #$F8           ; $ef5f: 29 f8     
            ORA $FE            ; $ef61: 05 fe     
            STA ($f2),Y        ; $ef63: 91 f2     
            LDA $FF            ; $ef65: a5 ff     
            DEY                ; $ef67: 88        
            STA ($f2),Y        ; $ef68: 91 f2     
            LDY $FD            ; $ef6a: a4 fd     
            LDA ($f2),Y        ; $ef6c: b1 f2     
            CMP #$05           ; $ef6e: c9 05     
            bcc __ef77         ; $ef70: 90 05     
            SEC                ; $ef72: 38        
            SBC #$04           ; $ef73: e9 04     
            STA ($f2),Y        ; $ef75: 91 f2     
__ef77:     JSR __f04f         ; $ef77: 20 4f f0  
            PHA                ; $ef7a: 48        
            LDA $FD            ; $ef7b: a5 fd     
            CLC                ; $ef7d: 18        
            ADC #$07           ; $ef7e: 69 07     
            TAY                ; $ef80: a8        
            PLA                ; $ef81: 68        
            STA ($f2),Y        ; $ef82: 91 f2     
__ef84:     LDA $FD            ; $ef84: a5 fd     
            CLC                ; $ef86: 18        
            ADC #$08           ; $ef87: 69 08     
            STA $FD            ; $ef89: 85 fd     
            LDA $FC            ; $ef8b: a5 fc     
            ADC #$01           ; $ef8d: 69 01     
            STA $FC            ; $ef8f: 85 fc     
            CMP #$10           ; $ef91: c9 10     
            BCS __ef98         ; $ef93: b0 03     
            JMP __eebf         ; $ef95: 4c bf ee  

;-------------------------------------------------------------------------------
__ef98:     RTS                ; $ef98: 60        

;-------------------------------------------------------------------------------
__ef99:     AND #$0F           ; $ef99: 29 0f     
            ASL                ; $ef9b: 0a        
            TAX                ; $ef9c: aa        
            LDA __efaa,X       ; $ef9d: bd aa ef  
            STA $FE            ; $efa0: 85 fe     
            LDA __efab,X       ; $efa2: bd ab ef  
            STA $FF            ; $efa5: 85 ff     
            JMP ($00fe)        ; $efa7: 6c fe 00  

;-------------------------------------------------------------------------------
__efaa:     .hex ca            ; $efaa: ca            Data
__efab:     .hex ef d7 ef ef   ; $efab: ef d7 ef ef   Data
            .hex ef 07 f0 1f   ; $efaf: ef 07 f0 1f   Data
            .hex f0 2f f0 3f   ; $efb3: f0 2f f0 3f   Data
            .hex f0 ca ef ca   ; $efb7: f0 ca ef ca   Data
            .hex ef ca ef ca   ; $efbb: ef ca ef ca   Data
            .hex ef ca ef ca   ; $efbf: ef ca ef ca   Data
            .hex ef ca ef ca   ; $efc3: ef ca ef ca   Data
            .hex ef ca ef a4   ; $efc7: ef ca ef a4   Data
            .hex fc a9 00 91   ; $efcb: fc a9 00 91   Data
            .hex f0 a4 fd 91   ; $efcf: f0 a4 fd 91   Data
            .hex f2 4c 84 ef   ; $efd3: f2 4c 84 ef   Data
            .hex 20 4f f0 48   ; $efd7: 20 4f f0 48   Data
            .hex a5 fd 18 69   ; $efdb: a5 fd 18 69   Data
            .hex 01 a8 b1 f2   ; $efdf: 01 a8 b1 f2   Data
            .hex 29 3f 91 f2   ; $efe3: 29 3f 91 f2   Data
            .hex 68 11 f2 91   ; $efe7: 68 11 f2 91   Data
            .hex f2 4c 2e ef   ; $efeb: f2 4c 2e ef   Data
            .hex 20 4f f0 48   ; $efef: 20 4f f0 48   Data
            .hex a5 fd 18 69   ; $eff3: a5 fd 18 69   Data
            .hex 01 a8 b1 f2   ; $eff7: 01 a8 b1 f2   Data
            .hex 29 cf 91 f2   ; $effb: 29 cf 91 f2   Data
            .hex 68 11 f2 91   ; $efff: 68 11 f2 91   Data
            .hex f2 4c 2e ef   ; $f003: f2 4c 2e ef   Data
            .hex 20 4f f0 48   ; $f007: 20 4f f0 48   Data
            .hex a5 fd 18 69   ; $f00b: a5 fd 18 69   Data
            .hex 01 a8 b1 f2   ; $f00f: 01 a8 b1 f2   Data
            .hex 29 f0 91 f2   ; $f013: 29 f0 91 f2   Data
            .hex 68 11 f2 91   ; $f017: 68 11 f2 91   Data
            .hex f2 4c 2e ef   ; $f01b: f2 4c 2e ef   Data
            .hex 20 4f f0 48   ; $f01f: 20 4f f0 48   Data
            .hex a5 fd 18 69   ; $f023: a5 fd 18 69   Data
            .hex 02 a8 68 91   ; $f027: 02 a8 68 91   Data
            .hex f2 4c 2e ef   ; $f02b: f2 4c 2e ef   Data
            .hex 20 4f f0 48   ; $f02f: 20 4f f0 48   Data
            .hex a5 fd 18 69   ; $f033: a5 fd 18 69   Data
            .hex 04 a8 68 91   ; $f037: 04 a8 68 91   Data
            .hex f2 4c 2e ef   ; $f03b: f2 4c 2e ef   Data
            .hex 20 4f f0 48   ; $f03f: 20 4f f0 48   Data
            .hex a5 fd 18 69   ; $f043: a5 fd 18 69   Data
            .hex 01 a8 68 91   ; $f047: 01 a8 68 91   Data
            .hex f2 4c 2e ef   ; $f04b: f2 4c 2e ef   Data
__f04f:     LDA $FD            ; $f04f: a5 fd     
            CLC                ; $f051: 18        
            ADC #$05           ; $f052: 69 05     
            TAY                ; $f054: a8        
            LDA ($f2),Y        ; $f055: b1 f2     
            STA $FE            ; $f057: 85 fe     
            INY                ; $f059: c8        
            LDA ($f2),Y        ; $f05a: b1 f2     
            STA $FF            ; $f05c: 85 ff     
            LDX #$00           ; $f05e: a2 00     
            LDA ($fe,X)        ; $f060: a1 fe     
            PHA                ; $f062: 48        
            LDA $FE            ; $f063: a5 fe     
            DEY                ; $f065: 88        
            CLC                ; $f066: 18        
            ADC #$01           ; $f067: 69 01     
            STA ($f2),Y        ; $f069: 91 f2     
            LDA $FF            ; $f06b: a5 ff     
            ADC #$00           ; $f06d: 69 00     
            INY                ; $f06f: c8        
            STA ($f2),Y        ; $f070: 91 f2     
            PLA                ; $f072: 68        
            RTS                ; $f073: 60        

;-------------------------------------------------------------------------------
__f074:     .hex 03            ; $f074: 03            Data
__f075:     .hex f9 03 c0 03   ; $f075: f9 03 c0 03   Data
            .hex 8a 03 57 03   ; $f079: 8a 03 57 03   Data
            .hex 27 02 fa 02   ; $f07d: 27 02 fa 02   Data
            .hex cf 02 a7 02   ; $f081: cf 02 a7 02   Data
            .hex 81 02 5d 02   ; $f085: 81 02 5d 02   Data
            .hex 3b 02 1b      ; $f089: 3b 02 1b      Data
__f08c:     .hex 8e            ; $f08c: 8e            Data
__f08d:     .hex f0 57 f3 a0   ; $f08d: f0 57 f3 a0   Data
            .hex f3 ae f0 c8   ; $f091: f3 ae f0 c8   Data
            .hex f2 cb f3 dc   ; $f095: f2 cb f3 dc   Data
            .hex f3 c3 f0 70   ; $f099: f3 c3 f0 70   Data
            .hex f1 a9 f2 5b   ; $f09d: f1 a9 f2 5b   Data
            .hex f1 ee f0 19   ; $f0a1: f1 ee f0 19   Data
            .hex f1 3c f1 93   ; $f0a5: f1 3c f1 93   Data
            .hex f1 06 f2 ed   ; $f0a9: f1 06 f2 ed   Data
            .hex f3 01 03 7f   ; $f0ad: f3 01 03 7f   Data
            .hex 08 a2 0c a2   ; $f0b1: 08 a2 0c a2   Data
            .hex 0c a2 0c a2   ; $f0b5: 0c a2 0c a2   Data
            .hex 0c a2 0c a2   ; $f0b9: 0c a2 0c a2   Data
            .hex 0c a2 0c a2   ; $f0bd: 0c a2 0c a2   Data
            .hex 0c f0 03 04   ; $f0c1: 0c f0 03 04   Data
            .hex 7f 08         ; $f0c5: 7f 08         Data
__f0c7:     .hex 33 01 23 01   ; $f0c7: 33 01 23 01   Data
            .hex 03 01 a2 01   ; $f0cb: 03 01 a2 01   Data
            .hex 92 01 72 01   ; $f0cf: 92 01 72 01   Data
            .hex 52 01 32 01   ; $f0d3: 52 01 32 01   Data
            .hex 22 01 02 01   ; $f0d7: 22 01 02 01   Data
            .hex a1 01 91 01   ; $f0db: a1 01 91 01   Data
            .hex c0 08 91 01   ; $f0df: c0 08 91 01   Data
            .hex a1 01 02 01   ; $f0e3: a1 01 02 01   Data
            .hex 22 01 32 01   ; $f0e7: 22 01 32 01   Data
            .hex 52 01 f0 01   ; $f0eb: 52 01 f0 01   Data
            .hex 96 7f 28 82   ; $f0ef: 96 7f 28 82   Data
            .hex 01 92 01 a2   ; $f0f3: 01 92 01 a2   Data
            .hex 01 b2 01 03   ; $f0f7: 01 b2 01 03   Data
            .hex 01 13 01 23   ; $f0fb: 01 13 01 23   Data
            .hex 01 33 01 43   ; $f0ff: 01 33 01 43   Data
            .hex 01 53 01 33   ; $f103: 01 53 01 33   Data
            .hex 01 23 01 13   ; $f107: 01 23 01 13   Data
            .hex 01 03 01 b2   ; $f10b: 01 03 01 b2   Data
            .hex 01 a2 01 92   ; $f10f: 01 a2 01 92   Data
            .hex 01 82 01 72   ; $f113: 01 82 01 72   Data
            .hex 01 f0 01 96   ; $f117: 01 f0 01 96   Data
            .hex 7f 28 a2 01   ; $f11b: 7f 28 a2 01   Data
            .hex b2 01 03 01   ; $f11f: b2 01 03 01   Data
            .hex 13 01 23 01   ; $f123: 13 01 23 01   Data
            .hex 33 01 43 01   ; $f127: 33 01 43 01   Data
            .hex 53 01 33 01   ; $f12b: 53 01 33 01   Data
            .hex 23 01 13 01   ; $f12f: 23 01 13 01   Data
            .hex 03 01 b2 01   ; $f133: 03 01 b2 01   Data
            .hex a2 01 92 01   ; $f137: a2 01 92 01   Data
            .hex f0 01 96 7f   ; $f13b: f0 01 96 7f   Data
            .hex 28 b2 01 03   ; $f13f: 28 b2 01 03   Data
            .hex 01 13 01 23   ; $f143: 01 13 01 23   Data
            .hex 01 33 01 43   ; $f147: 01 33 01 43   Data
            .hex 01 53 01 33   ; $f14b: 01 53 01 33   Data
            .hex 01 23 01 13   ; $f14f: 01 23 01 13   Data
            .hex 01 03 01 b2   ; $f153: 01 03 01 b2   Data
            .hex 01 a2 01 f0   ; $f157: 01 a2 01 f0   Data
            .hex 02 9c 7f 28   ; $f15b: 02 9c 7f 28   Data
            .hex 31 01 71 01   ; $f15f: 31 01 71 01   Data
            .hex a1 01 12 01   ; $f163: a1 01 12 01   Data
            .hex 32 01 72 01   ; $f167: 32 01 72 01   Data
            .hex a2 01 13 01   ; $f16b: a2 01 13 01   Data
            .hex f0 02 00 7f   ; $f16f: f0 02 00 7f   Data
            .hex 10 20 03 50   ; $f173: 10 20 03 50   Data
            .hex 03 80 02 a0   ; $f177: 03 80 02 a0   Data
            .hex 02 21 02 51   ; $f17b: 02 21 02 51   Data
            .hex 02 81 01 a1   ; $f17f: 02 81 01 a1   Data
            .hex 01 02 01 22   ; $f183: 01 02 01 22   Data
            .hex 01 32 01 52   ; $f187: 01 32 01 52   Data
            .hex 01 f5 18      ; $f18b: 01 f5 18      Data
__f18e:     .hex 73 01         ; $f18e: 73 01     Invalid Opcode - RRA ($01),Y
            CPY #$08           ; $f190: c0 08     
            BEQ __f195         ; $f192: f0 01     
            .hex 03            ; $f194: 03        Suspected data
__f195:     .hex 7f 08 72      ; $f195: 7f 08 72  Invalid Opcode - RRA $7208,X
            .hex 02            ; $f198: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f199: 82 08     Invalid Opcode - NOP #$08
            .hex 72            ; $f19b: 72        Invalid Opcode - KIL 
            .hex 02            ; $f19c: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f19d: 82 08     Invalid Opcode - NOP #$08
            .hex 72            ; $f19f: 72        Invalid Opcode - KIL 
            .hex 02            ; $f1a0: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f1a1: 82 08     Invalid Opcode - NOP #$08
            .hex 42            ; $f1a3: 42        Invalid Opcode - KIL 
            .hex 02            ; $f1a4: 02        Invalid Opcode - KIL 
            .hex 52            ; $f1a5: 52        Invalid Opcode - KIL 
            .hex 04 32         ; $f1a6: 04 32     Invalid Opcode - NOP $32
            .hex 04 82         ; $f1a8: 04 82     Invalid Opcode - NOP $82
            ASL $82            ; $f1aa: 06 82     
            PHP                ; $f1ac: 08        
            .hex b2            ; $f1ad: b2        Invalid Opcode - KIL 
            .hex 02            ; $f1ae: 02        Invalid Opcode - KIL 
            .hex 03 10         ; $f1af: 03 10     Invalid Opcode - SLO ($10,X)
            CPY #$08           ; $f1b1: c0 08     
            .hex 72            ; $f1b3: 72        Invalid Opcode - KIL 
            .hex 02            ; $f1b4: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f1b5: 82 08     Invalid Opcode - NOP #$08
            .hex 72            ; $f1b7: 72        Invalid Opcode - KIL 
            .hex 02            ; $f1b8: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f1b9: 82 08     Invalid Opcode - NOP #$08
            .hex 72            ; $f1bb: 72        Invalid Opcode - KIL 
            .hex 02            ; $f1bc: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f1bd: 82 08     Invalid Opcode - NOP #$08
            .hex 42            ; $f1bf: 42        Invalid Opcode - KIL 
            .hex 02            ; $f1c0: 02        Invalid Opcode - KIL 
            .hex 52            ; $f1c1: 52        Invalid Opcode - KIL 
            .hex 04 32         ; $f1c2: 04 32     Invalid Opcode - NOP $32
            .hex 04 82         ; $f1c4: 04 82     Invalid Opcode - NOP $82
            ASL $82            ; $f1c6: 06 82     
            PHP                ; $f1c8: 08        
            .hex 42            ; $f1c9: 42        Invalid Opcode - KIL 
            .hex 02            ; $f1ca: 02        Invalid Opcode - KIL 
            .hex 52            ; $f1cb: 52        Invalid Opcode - KIL 
            BPL __f18e         ; $f1cc: 10 c0     
            PHP                ; $f1ce: 08        
            .hex 72            ; $f1cf: 72        Invalid Opcode - KIL 
            .hex 02            ; $f1d0: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f1d1: 82 08     Invalid Opcode - NOP #$08
            .hex 72            ; $f1d3: 72        Invalid Opcode - KIL 
            .hex 02            ; $f1d4: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f1d5: 82 08     Invalid Opcode - NOP #$08
            .hex 72            ; $f1d7: 72        Invalid Opcode - KIL 
            .hex 02            ; $f1d8: 02        Invalid Opcode - KIL 
            .hex 82 08         ; $f1d9: 82 08     Invalid Opcode - NOP #$08
            .hex 42            ; $f1db: 42        Invalid Opcode - KIL 
            .hex 02            ; $f1dc: 02        Invalid Opcode - KIL 
            .hex 52            ; $f1dd: 52        Invalid Opcode - KIL 
            .hex 04 32         ; $f1de: 04 32     Invalid Opcode - NOP $32
            .hex 04 82         ; $f1e0: 04 82     Invalid Opcode - NOP $82
            ASL $82            ; $f1e2: 06 82     
            PHP                ; $f1e4: 08        
            LDX #$02           ; $f1e5: a2 02     
            .hex b2            ; $f1e7: b2        Invalid Opcode - KIL 
            PHP                ; $f1e8: 08        
            .hex 03 02         ; $f1e9: 03 02     Invalid Opcode - SLO ($02,X)
            .hex 13 0a         ; $f1eb: 13 0a     Invalid Opcode - SLO ($0A),Y
            .hex 13 02         ; $f1ed: 13 02     Invalid Opcode - SLO ($02),Y
            .hex 23 0c         ; $f1ef: 23 0c     Invalid Opcode - RLA ($0C,X)
            .hex 03 02         ; $f1f1: 03 02     Invalid Opcode - SLO ($02,X)
            .hex 13 08         ; $f1f3: 13 08     Invalid Opcode - SLO ($08),Y
            LDX #$02           ; $f1f5: a2 02     
            .hex b2            ; $f1f7: b2        Invalid Opcode - KIL 
            PHP                ; $f1f8: 08        
            .hex 82 0a         ; $f1f9: 82 0a     Invalid Opcode - NOP #$0A
            LDX #$02           ; $f1fb: a2 02     
            .hex b2            ; $f1fd: b2        Invalid Opcode - KIL 
            ASL                ; $f1fe: 0a        
            .hex 72            ; $f1ff: 72        Invalid Opcode - KIL 
            .hex 02            ; $f200: 02        Invalid Opcode - KIL 
            .hex 82 10         ; $f201: 82 10     Invalid Opcode - NOP #$10
            CPY #$08           ; $f203: c0 08     
            BEQ __f209         ; $f205: f0 02     
            STA ($7F,X)        ; $f207: 81 7f     
__f209:     RTI                ; $f209: 40        

;-------------------------------------------------------------------------------
            .hex 80 08         ; $f20a: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f20c: c0 06     
            .hex 80 04         ; $f20e: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f210: c0 02     
            .hex 80 08         ; $f212: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f214: c0 06     
            .hex 80 04         ; $f216: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f218: c0 02     
            .hex 80 08         ; $f21a: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f21c: c0 06     
            .hex 80 04         ; $f21e: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f220: c0 02     
            ORA ($04,X)        ; $f222: 01 04     
            CPY #$01           ; $f224: c0 01     
            ORA ($04),Y        ; $f226: 11 04     
            CPY #$01           ; $f228: c0 01     
            AND ($04,X)        ; $f22a: 21 04     
            CPY #$01           ; $f22c: c0 01     
            AND ($04),Y        ; $f22e: 31 04     
            CPY #$01           ; $f230: c0 01     
            .hex 80 08         ; $f232: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f234: c0 06     
            .hex 80 04         ; $f236: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f238: c0 02     
            .hex 80 08         ; $f23a: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f23c: c0 06     
            .hex 80 04         ; $f23e: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f240: c0 02     
            .hex 80 08         ; $f242: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f244: c0 06     
            .hex 80 04         ; $f246: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f248: c0 02     
            ORA ($04,X)        ; $f24a: 01 04     
            CPY #$01           ; $f24c: c0 01     
            ORA ($04),Y        ; $f24e: 11 04     
            CPY #$01           ; $f250: c0 01     
            AND ($04,X)        ; $f252: 21 04     
            CPY #$01           ; $f254: c0 01     
            AND ($04),Y        ; $f256: 31 04     
            CPY #$01           ; $f258: c0 01     
            .hex 80 08         ; $f25a: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f25c: c0 06     
            .hex 80 04         ; $f25e: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f260: c0 02     
            .hex 80 08         ; $f262: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f264: c0 06     
            .hex 80 04         ; $f266: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f268: c0 02     
            .hex 80 08         ; $f26a: 80 08     Invalid Opcode - NOP #$08
            CPY #$06           ; $f26c: c0 06     
            .hex 80 04         ; $f26e: 80 04     Invalid Opcode - NOP #$04
            CPY #$02           ; $f270: c0 02     
            ORA ($04,X)        ; $f272: 01 04     
            CPY #$01           ; $f274: c0 01     
            ORA ($04),Y        ; $f276: 11 04     
            CPY #$01           ; $f278: c0 01     
            AND ($04,X)        ; $f27a: 21 04     
            CPY #$01           ; $f27c: c0 01     
            AND ($04),Y        ; $f27e: 31 04     
            CPY #$01           ; $f280: c0 01     
            STA ($0A,X)        ; $f282: 81 0a     
            AND ($04),Y        ; $f284: 31 04     
            CPY #$01           ; $f286: c0 01     
            AND ($04,X)        ; $f288: 21 04     
            CPY #$01           ; $f28a: c0 01     
            ORA ($04),Y        ; $f28c: 11 04     
            CPY #$01           ; $f28e: c0 01     
            BCS __f296         ; $f290: b0 04     
            CPY #$01           ; $f292: c0 01     
            .hex 80 04         ; $f294: 80 04     Invalid Opcode - NOP #$04
__f296:     CPY #$01           ; $f296: c0 01     
            BVS __f29e         ; $f298: 70 04     
            CPY #$01           ; $f29a: c0 01     
            RTS                ; $f29c: 60        

;-------------------------------------------------------------------------------
            PHP                ; $f29d: 08        
__f29e:     CPY #$02           ; $f29e: c0 02     
            BVS __f2aa         ; $f2a0: 70 08     
            CPY #$02           ; $f2a2: c0 02     
            .hex 80 0c         ; $f2a4: 80 0c     Invalid Opcode - NOP #$0C
            CPY #$06           ; $f2a6: c0 06     
            BEQ __f2ac         ; $f2a8: f0 02     
__f2aa:     TYA                ; $f2aa: 98        
            .hex 7f            ; $f2ab: 7f        Suspected data
__f2ac:     plp                ; $f2ac: 28        
            .hex 33 01         ; $f2ad: 33 01     Invalid Opcode - RLA ($01),Y
            .hex 23 01         ; $f2af: 23 01     Invalid Opcode - RLA ($01,X)
            .hex 13 01         ; $f2b1: 13 01     Invalid Opcode - SLO ($01),Y
            .hex 03 01         ; $f2b3: 03 01     Invalid Opcode - SLO ($01,X)
            LDX #$01           ; $f2b5: a2 01     
            .hex 82 01         ; $f2b7: 82 01     Invalid Opcode - NOP #$01
            .hex 72            ; $f2b9: 72        Invalid Opcode - KIL 
            ORA ($52,X)        ; $f2ba: 01 52     
            ORA ($32,X)        ; $f2bc: 01 32     
            ORA ($12,X)        ; $f2be: 01 12     
            ORA ($a1,X)        ; $f2c0: 01 a1     
            ORA ($71,X)        ; $f2c2: 01 71     
            ORA ($31,X)        ; $f2c4: 01 31     
            ORA ($f0,X)        ; $f2c6: 01 f0     
            ORA ($42,X)        ; $f2c8: 01 42     
            .hex 7f 38 23      ; $f2ca: 7f 38 23  Invalid Opcode - RRA $2338,X
            .hex 02            ; $f2cd: 02        Invalid Opcode - KIL 
            .hex 33 02         ; $f2ce: 33 02     Invalid Opcode - RLA ($02),Y
            .hex 43 02         ; $f2d0: 43 02     Invalid Opcode - SRE ($02,X)
            .hex 53 02         ; $f2d2: 53 02     Invalid Opcode - SRE ($02),Y
            .hex 43 02         ; $f2d4: 43 02     Invalid Opcode - SRE ($02,X)
            .hex 33 02         ; $f2d6: 33 02     Invalid Opcode - RLA ($02),Y
            .hex 23 02         ; $f2d8: 23 02     Invalid Opcode - RLA ($02,X)
            .hex 13 02         ; $f2da: 13 02     Invalid Opcode - SLO ($02),Y
            .hex 23 02         ; $f2dc: 23 02     Invalid Opcode - RLA ($02,X)
            .hex 33 02         ; $f2de: 33 02     Invalid Opcode - RLA ($02),Y
            .hex 43 02         ; $f2e0: 43 02     Invalid Opcode - SRE ($02,X)
            .hex 33 02         ; $f2e2: 33 02     Invalid Opcode - RLA ($02),Y
            .hex 23 02         ; $f2e4: 23 02     Invalid Opcode - RLA ($02,X)
            .hex 13 02         ; $f2e6: 13 02     Invalid Opcode - SLO ($02),Y
            .hex 03 02         ; $f2e8: 03 02     Invalid Opcode - SLO ($02,X)
            .hex 13 02         ; $f2ea: 13 02     Invalid Opcode - SLO ($02),Y
            .hex 23 02         ; $f2ec: 23 02     Invalid Opcode - RLA ($02,X)
            .hex 33 02         ; $f2ee: 33 02     Invalid Opcode - RLA ($02),Y
            .hex 23 02         ; $f2f0: 23 02     Invalid Opcode - RLA ($02,X)
            .hex 13 02         ; $f2f2: 13 02     Invalid Opcode - SLO ($02),Y
            .hex 03 02         ; $f2f4: 03 02     Invalid Opcode - SLO ($02,X)
            .hex b2            ; $f2f6: b2        Invalid Opcode - KIL 
            .hex 02            ; $f2f7: 02        Invalid Opcode - KIL 
            .hex 03 02         ; $f2f8: 03 02     Invalid Opcode - SLO ($02,X)
            .hex 13 02         ; $f2fa: 13 02     Invalid Opcode - SLO ($02),Y
            .hex 23 02         ; $f2fc: 23 02     Invalid Opcode - RLA ($02,X)
            .hex 13 02         ; $f2fe: 13 02     Invalid Opcode - SLO ($02),Y
            .hex 03 02         ; $f300: 03 02     Invalid Opcode - SLO ($02,X)
            .hex b2            ; $f302: b2        Invalid Opcode - KIL 
            .hex 02            ; $f303: 02        Invalid Opcode - KIL 
            LDX #$02           ; $f304: a2 02     
            .hex b2            ; $f306: b2        Invalid Opcode - KIL 
            .hex 02            ; $f307: 02        Invalid Opcode - KIL 
            .hex 03 02         ; $f308: 03 02     Invalid Opcode - SLO ($02,X)
            .hex 23 02         ; $f30a: 23 02     Invalid Opcode - RLA ($02,X)
            .hex 03 02         ; $f30c: 03 02     Invalid Opcode - SLO ($02,X)
            .hex b2            ; $f30e: b2        Invalid Opcode - KIL 
            .hex 02            ; $f30f: 02        Invalid Opcode - KIL 
            LDX #$02           ; $f310: a2 02     
            .hex 92            ; $f312: 92        Invalid Opcode - KIL 
            .hex 02            ; $f313: 02        Invalid Opcode - KIL 
            LDX #$02           ; $f314: a2 02     
            .hex b2            ; $f316: b2        Invalid Opcode - KIL 
            .hex 02            ; $f317: 02        Invalid Opcode - KIL 
            .hex 03 02         ; $f318: 03 02     Invalid Opcode - SLO ($02,X)
            .hex b2            ; $f31a: b2        Invalid Opcode - KIL 
            .hex 02            ; $f31b: 02        Invalid Opcode - KIL 
            LDX #$02           ; $f31c: a2 02     
            .hex 92            ; $f31e: 92        Invalid Opcode - KIL 
            .hex 02            ; $f31f: 02        Invalid Opcode - KIL 
            .hex 82 02         ; $f320: 82 02     Invalid Opcode - NOP #$02
            .hex 92            ; $f322: 92        Invalid Opcode - KIL 
            .hex 02            ; $f323: 02        Invalid Opcode - KIL 
            LDX #$02           ; $f324: a2 02     
            .hex 03 02         ; $f326: 03 02     Invalid Opcode - SLO ($02,X)
            LDX #$02           ; $f328: a2 02     
            .hex 92            ; $f32a: 92        Invalid Opcode - KIL 
            .hex 02            ; $f32b: 02        Invalid Opcode - KIL 
            .hex 82 02         ; $f32c: 82 02     Invalid Opcode - NOP #$02
            .hex f2            ; $f32e: f2        Invalid Opcode - KIL 
            BRK                ; $f32f: 00        
            .hex f3 00         ; $f330: f3 00     Invalid Opcode - ISC ($00),Y
            SBC $18,X          ; $f332: f5 18     
            AND ($01),Y        ; $f334: 31 01     
            ADC ($01),Y        ; $f336: 71 01     
            LDA ($01),Y        ; $f338: b1 01     
            .hex 32            ; $f33a: 32        Invalid Opcode - KIL 
            ORA ($72,X)        ; $f33b: 01 72     
            ORA ($b2,X)        ; $f33d: 01 b2     
            ORA ($33,X)        ; $f33f: 01 33     
            ORA ($73,X)        ; $f341: 01 73     
            ORA ($c0,X)        ; $f343: 01 c0     
            .hex 02            ; $f345: 02        Invalid Opcode - KIL 
            AND ($01),Y        ; $f346: 31 01     
            ADC ($01),Y        ; $f348: 71 01     
            LDA ($01),Y        ; $f34a: b1 01     
            .hex 32            ; $f34c: 32        Invalid Opcode - KIL 
            ORA ($72,X)        ; $f34d: 01 72     
            ORA ($b2,X)        ; $f34f: 01 b2     
            ORA ($33,X)        ; $f351: 01 33     
            ORA ($73,X)        ; $f353: 01 73     
            ORA ($f0,X)        ; $f355: 01 f0     
            ORA ($81,X)        ; $f357: 01 81     
            .hex 7f 40 31      ; $f359: 7f 40 31  Invalid Opcode - RRA $3140,X
            PHP                ; $f35c: 08        
            .hex 32            ; $f35d: 32        Invalid Opcode - KIL 
            PHP                ; $f35e: 08        
            LDA ($08,X)        ; $f35f: a1 08     
            ADC ($08),Y        ; $f361: 71 08     
            .hex 32            ; $f363: 32        Invalid Opcode - KIL 
            .hex 07 a1         ; $f364: 07 a1     Invalid Opcode - SLO $a1
            .hex 07 71         ; $f366: 07 71     Invalid Opcode - SLO $71
            .hex 0c c0 06      ; $f368: 0c c0 06  Invalid Opcode - NOP $06c0
            EOR ($08,X)        ; $f36b: 41 08     
            .hex 42            ; $f36d: 42        Invalid Opcode - KIL 
            PHP                ; $f36e: 08        
            LDA ($08),Y        ; $f36f: b1 08     
            STA ($08,X)        ; $f371: 81 08     
            .hex 42            ; $f373: 42        Invalid Opcode - KIL 
            .hex 07 b1         ; $f374: 07 b1     Invalid Opcode - SLO $b1
            .hex 07 81         ; $f376: 07 81     Invalid Opcode - SLO $81
            .hex 0c c0 06      ; $f378: 0c c0 06  Invalid Opcode - NOP $06c0
            AND ($08),Y        ; $f37b: 31 08     
            .hex 32            ; $f37d: 32        Invalid Opcode - KIL 
            PHP                ; $f37e: 08        
            LDA ($08,X)        ; $f37f: a1 08     
            ADC ($08),Y        ; $f381: 71 08     
            .hex 32            ; $f383: 32        Invalid Opcode - KIL 
            .hex 07 a1         ; $f384: 07 a1     Invalid Opcode - SLO $a1
            .hex 07 71         ; $f386: 07 71     Invalid Opcode - SLO $71
            .hex 0c c0 06      ; $f388: 0c c0 06  Invalid Opcode - NOP $06c0
            ADC ($05,X)        ; $f38b: 61 05     
            ADC ($05),Y        ; $f38d: 71 05     
            STA ($05,X)        ; $f38f: 81 05     
            STA ($05,X)        ; $f391: 81 05     
            STA ($05),Y        ; $f393: 91 05     
            LDA ($05,X)        ; $f395: a1 05     
            LDA ($05,X)        ; $f397: a1 05     
            LDA ($05),Y        ; $f399: b1 05     
            .hex 02            ; $f39b: 02        Invalid Opcode - KIL 
            ORA $32            ; $f39c: 05 32     
            .hex 0c f0 02      ; $f39e: 0c f0 02  Invalid Opcode - NOP $02f0
            .hex 82 7f         ; $f3a1: 82 7f     Invalid Opcode - NOP #$7F
            RTI                ; $f3a3: 40        

;-------------------------------------------------------------------------------
            BMI __f3be         ; $f3a4: 30 18     
            LDY #$08           ; $f3a6: a0 08     
            BMI __f3b8         ; $f3a8: 30 0e     
            LDY #$0C           ; $f3aa: a0 0c     
            CPY #$06           ; $f3ac: c0 06     
            RTI                ; $f3ae: 40        

;-------------------------------------------------------------------------------
            CLC                ; $f3af: 18        
            BCS __f3ba         ; $f3b0: b0 08     
            RTI                ; $f3b2: 40        

;-------------------------------------------------------------------------------
            ASL $0Cb0          ; $f3b3: 0e b0 0c  
            CPY #$06           ; $f3b6: c0 06     
__f3b8:     BMI __f3d2         ; $f3b8: 30 18     
__f3ba:     LDY #$08           ; $f3ba: a0 08     
            BMI __f3cc         ; $f3bc: 30 0e     
__f3be:     LDY #$0C           ; $f3be: a0 0c     
            CPY #$06           ; $f3c0: c0 06     
            LDY #$0F           ; $f3c2: a0 0f     
            ORA ($0F,X)        ; $f3c4: 01 0f     
            AND ($0F,X)        ; $f3c6: 21 0f     
            AND ($0C),Y        ; $f3c8: 31 0c     
            BEQ __f3cd         ; $f3ca: f0 01     
__f3cc:     .hex 9f            ; $f3cc: 9f        Suspected data
__f3cd:     .hex 7f 28 01      ; $f3cd: 7f 28 01  Invalid Opcode - RRA $0128,X
            ORA ($41,X)        ; $f3d0: 01 41     
__f3d2:     ORA ($71,X)        ; $f3d2: 01 71     
            ORA ($a1,X)        ; $f3d4: 01 a1     
            ORA ($02,X)        ; $f3d6: 01 02     
            ORA ($f5,X)        ; $f3d8: 01 f5     
            CLC                ; $f3da: 18        
            BEQ __f3de         ; $f3db: f0 01     
            .hex 9f            ; $f3dd: 9f        Suspected data
__f3de:     .hex 7f 28 02      ; $f3de: 7f 28 02  Invalid Opcode - RRA $0228,X
            ORA ($a1,X)        ; $f3e1: 01 a1     
            ORA ($71,X)        ; $f3e3: 01 71     
            ORA ($41,X)        ; $f3e5: 01 41     
            ORA ($f5,X)        ; $f3e7: 01 f5     
            CLC                ; $f3e9: 18        
            ORA ($01,X)        ; $f3ea: 01 01     
            BEQ __f3ef         ; $f3ec: f0 01     
            .hex 9f            ; $f3ee: 9f        Suspected data
__f3ef:     .hex 7f 28 52      ; $f3ef: 7f 28 52  Invalid Opcode - RRA $5228,X
            ORA ($92,X)        ; $f3f2: 01 92     
            ORA ($03,X)        ; $f3f4: 01 03     
            ORA ($33,X)        ; $f3f6: 01 33     
            ORA ($f5,X)        ; $f3f8: 01 f5     
            CLC                ; $f3fa: 18        
            .hex 53 03         ; $f3fb: 53 03     Invalid Opcode - SRE ($03),Y
            SBC $28,X          ; $f3fd: f5 28     
            .hex 53 01         ; $f3ff: 53 01     Invalid Opcode - SRE ($01),Y
            .hex 33 01         ; $f401: 33 01     Invalid Opcode - RLA ($01),Y
            .hex 03 01         ; $f403: 03 01     Invalid Opcode - SLO ($01,X)
            .hex 92            ; $f405: 92        Invalid Opcode - KIL 
            ORA ($f5,X)        ; $f406: 01 f5     
            CLC                ; $f408: 18        
            .hex 52            ; $f409: 52        Invalid Opcode - KIL 
            .hex 03 92         ; $f40a: 03 92     Invalid Opcode - SLO ($92,X)
            ORA ($13,X)        ; $f40c: 01 13     
            ORA ($43,X)        ; $f40e: 01 43     
            ORA ($73,X)        ; $f410: 01 73     
            ORA ($f5,X)        ; $f412: 01 f5     
            CLC                ; $f414: 18        
            .hex 93 0a         ; $f415: 93 0a     Invalid Opcode - AHX ($0A),Y
            SBC $28,X          ; $f417: f5 28     
            .hex 93 01         ; $f419: 93 01     Invalid Opcode - AHX ($01),Y
            .hex 73 01         ; $f41b: 73 01     Invalid Opcode - RRA ($01),Y
            .hex 43 01         ; $f41d: 43 01     Invalid Opcode - SRE ($01,X)
            .hex 13 01         ; $f41f: 13 01     Invalid Opcode - SLO ($01),Y
            SBC $18,X          ; $f421: f5 18     
            .hex 92            ; $f423: 92        Invalid Opcode - KIL 
            .hex 03 f0         ; $f424: 03 f0     Invalid Opcode - SLO ($f0,X)
            .hex ff ff ff      ; $f426: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f429: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f42c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f42f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f432: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f435: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f438: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f43b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f43e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f441: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f444: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f447: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f44a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f44d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f450: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f453: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f456: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f459: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f45c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f45f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f462: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f465: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f468: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f46b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f46e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f471: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f474: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f477: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f47a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f47d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f480: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f483: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f486: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f489: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f48c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f48f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f492: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f495: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f498: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f49b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f49e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4a1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4a4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4a7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4aa: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4ad: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4b0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4b3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4b6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4b9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4bc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4bf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4c2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4c5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4c8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4cb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4ce: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4d1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4d4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4d7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4da: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4dd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4e0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4e3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4e6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4e9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4ec: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4ef: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4f2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4f5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4f8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4fb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f4fe: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f501: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f504: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f507: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f50a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f50d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f510: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f513: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f516: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f519: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f51c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f51f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f522: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f525: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f528: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f52b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f52e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f531: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f534: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f537: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f53a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f53d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f540: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f543: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f546: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f549: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f54c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f54f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f552: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f555: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f558: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f55b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f55e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f561: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f564: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f567: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f56a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f56d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f570: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f573: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f576: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f579: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f57c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f57f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f582: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f585: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f588: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f58b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f58e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f591: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f594: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f597: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f59a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f59d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5a0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5a3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5a6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5a9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5ac: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5af: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5b2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5b5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5b8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5bb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5be: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5c1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5c4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5c7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5ca: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5cd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5d0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5d3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5d6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5d9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5dc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5df: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5e2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5e5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5e8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5eb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5ee: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5f1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5f4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5f7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5fa: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f5fd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f600: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f603: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f606: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f609: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f60c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f60f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f612: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f615: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f618: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f61b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f61e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f621: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f624: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f627: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f62a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f62d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f630: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f633: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f636: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f639: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f63c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f63f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f642: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f645: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f648: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f64b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f64e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f651: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f654: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f657: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f65a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f65d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f660: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f663: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f666: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f669: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f66c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f66f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f672: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f675: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f678: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f67b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f67e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f681: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f684: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f687: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f68a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f68d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f690: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f693: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f696: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f699: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f69c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f69f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6a2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6a5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6a8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6ab: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6ae: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6b1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6b4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6b7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6ba: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6bd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6c0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6c3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6c6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6c9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6cc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6cf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6d2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6d5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6d8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6db: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6de: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6e1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6e4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6e7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6ea: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6ed: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6f0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6f3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6f6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6f9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6fc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f6ff: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f702: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f705: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f708: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f70b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f70e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f711: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f714: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f717: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f71a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f71d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f720: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f723: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f726: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f729: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f72c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f72f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f732: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f735: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f738: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f73b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f73e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f741: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f744: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f747: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f74a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f74d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f750: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f753: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f756: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f759: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f75c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f75f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f762: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f765: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f768: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f76b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f76e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f771: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f774: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f777: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f77a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f77d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f780: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f783: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f786: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f789: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f78c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f78f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f792: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f795: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f798: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f79b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f79e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7a1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7a4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7a7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7aa: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7ad: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7b0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7b3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7b6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7b9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7bc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7bf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7c2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7c5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7c8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7cb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7ce: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7d1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7d4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7d7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7da: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7dd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7e0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7e3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7e6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7e9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7ec: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7ef: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7f2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7f5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7f8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7fb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f7fe: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F801: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F804: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F807: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F80a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F80d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F810: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F813: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F816: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F819: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F81c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F81f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F822: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F825: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F828: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F82b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F82e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F831: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F834: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F837: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F83a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F83d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F840: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F843: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F846: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F849: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F84c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F84f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F852: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F855: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F858: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F85b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F85e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F861: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F864: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F867: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F86a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F86d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F870: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F873: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F876: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F879: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F87c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F87f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F882: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F885: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F888: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F88b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F88e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F891: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F894: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F897: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F89a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F89d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8a0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8a3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8a6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8a9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8ac: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8af: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8b2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8b5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8b8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8bb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8be: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8c1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8c4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8c7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8ca: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8cd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8d0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8d3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8d6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8d9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8dc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8df: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8e2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8e5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8e8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8eb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8ee: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8f1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8f4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8f7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8fa: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $F8fd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f900: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f903: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f906: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f909: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f90c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f90f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f912: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f915: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f918: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f91b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f91e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f921: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f924: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f927: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f92a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f92d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f930: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f933: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f936: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f939: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f93c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f93f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f942: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f945: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f948: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f94b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f94e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f951: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f954: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f957: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f95a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f95d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f960: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f963: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f966: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f969: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f96c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f96f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f972: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f975: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f978: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f97b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f97e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f981: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f984: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f987: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f98a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f98d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f990: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f993: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f996: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f999: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f99c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f99f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9a2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9a5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9a8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9ab: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9ae: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9b1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9b4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9b7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9ba: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9bd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9c0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9c3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9c6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9c9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9cc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9cf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9d2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9d5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9d8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9db: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9de: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9e1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9e4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9e7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9ea: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9ed: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9f0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9f3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9f6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9f9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9fc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $f9ff: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa02: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa05: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa08: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa0b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa0e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa11: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa14: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa17: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa1a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa1d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa20: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa23: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa26: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa29: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa2c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa2f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa32: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa35: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa38: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa3b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa3e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa41: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa44: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa47: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa4a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa4d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa50: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa53: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa56: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa59: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa5c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa5f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa62: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa65: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa68: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa6b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa6e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa71: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa74: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa77: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa7a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa7d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa80: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa83: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa86: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa89: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa8c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa8f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa92: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa95: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa98: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa9b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fa9e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faa1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faa4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faa7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faaa: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faad: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fab0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fab3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fab6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fab9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fabc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fabf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fac2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fac5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fac8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $facb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $face: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fad1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fad4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fad7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fada: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fadd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fae0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fae3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fae6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fae9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faec: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faef: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faf2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faf5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $faf8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fafb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fafe: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb01: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb04: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb07: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb0a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb0d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb10: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb13: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb16: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb19: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb1c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb1f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb22: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb25: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb28: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb2b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb2e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb31: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb34: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb37: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb3a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb3d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb40: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb43: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb46: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb49: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb4c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb4f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb52: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb55: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb58: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb5b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb5e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb61: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb64: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb67: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb6a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb6d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb70: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb73: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb76: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb79: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb7c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb7f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb82: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb85: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb88: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb8b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb8e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb91: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb94: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb97: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb9a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fb9d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fba0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fba3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fba6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fba9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbac: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbaf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbb2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbb5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbb8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbbb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbbe: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbc1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbc4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbc7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbca: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbcd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbd0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbd3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbd6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbd9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbdc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbdf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbe2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbe5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbe8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbeb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbee: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbf1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbf4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbf7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbfa: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fbfd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc00: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc03: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc06: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc09: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc0c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc0f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc12: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc15: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc18: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc1b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc1e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc21: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc24: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc27: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc2a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc2d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc30: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc33: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc36: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc39: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc3c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc3f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc42: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc45: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc48: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc4b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc4e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc51: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc54: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc57: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc5a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc5d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc60: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc63: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc66: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc69: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc6c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc6f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc72: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc75: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc78: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc7b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc7e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc81: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc84: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc87: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc8a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc8d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc90: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc93: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc96: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc99: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc9c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fc9f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fca2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fca5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fca8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcab: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcae: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcb1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcb4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcb7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcba: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcbd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcc0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcc3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcc6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcc9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fccc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fccf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcd2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcd5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcd8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcdb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcde: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fce1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fce4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fce7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcea: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fced: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcf0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcf3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcf6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcf9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcfc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fcff: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd02: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd05: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd08: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd0b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd0e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd11: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd14: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd17: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd1a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd1d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd20: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd23: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd26: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd29: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd2c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd2f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd32: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd35: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd38: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd3b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd3e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd41: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd44: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd47: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd4a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd4d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd50: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd53: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd56: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd59: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd5c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd5f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd62: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd65: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd68: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd6b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd6e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd71: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd74: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd77: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd7a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd7d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd80: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd83: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd86: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd89: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd8c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd8f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd92: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd95: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd98: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd9b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fd9e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fda1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fda4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fda7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdaa: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdad: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdb0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdb3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdb6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdb9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdbc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdbf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdc2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdc5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdc8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdcb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdce: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdd1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdd4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdd7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdda: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fddd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fde0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fde3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fde6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fde9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fDEC: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdef: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdf2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdf5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdf8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdfb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fdfe: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe01: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe04: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe07: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe0a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe0d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe10: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe13: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe16: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe19: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe1c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe1f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe22: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe25: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe28: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe2b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe2e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe31: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe34: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe37: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe3a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe3d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe40: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe43: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe46: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe49: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe4c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe4f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe52: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe55: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe58: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe5b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe5e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe61: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe64: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe67: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe6a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe6d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe70: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe73: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe76: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe79: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe7c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe7f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe82: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe85: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe88: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe8b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe8e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe91: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe94: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe97: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe9a: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fe9d: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fea0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fea3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fea6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fea9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $feac: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $feaf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $feb2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $feb5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $feb8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $febb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $febe: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fec1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fec4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fec7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $feca: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fecd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fed0: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fed3: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fed6: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fed9: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fedc: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fedf: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fee2: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fee5: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fee8: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $feeb: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $feee: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fef1: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fef4: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fef7: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fefa: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $fefd: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF00: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF03: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF06: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF09: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF0c: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF0f: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF12: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF15: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF18: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF1b: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF1e: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF21: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF24: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF27: ff ff ff  Invalid Opcode - ISC $FFff,X
            .hex ff ff ff      ; $FF2a: ff ff ff  Invalid Opcode - ISC $FFff,X
__ff2d:     .hex ff ff ff ff   ; $FF2d: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF31: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF35: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF39: ff ff ff ff   Data
            .hex ff ff         ; $FF3d: ff ff         Data
__ff3f:     .hex ff ff ff ff   ; $FF3f: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF43: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF47: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF4b: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF4f: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF53: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF57: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF5b: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF5f: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF63: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF67: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF6b: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF6f: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF73: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF77: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF7b: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF7f: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF83: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF87: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF8b: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF8f: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF93: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF97: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF9b: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FF9f: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFa3: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFa7: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFab: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFaf: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFb3: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFb7: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFbb: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFbf: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFc3: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFc7: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFcb: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFcf: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFd3: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFd7: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFdb: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFdf: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFe3: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFe7: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFeb: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFef: ff ff ff ff   Data
            .hex ff ff ff ff   ; $FFf3: ff ff ff ff   Data
            .hex ff            ; $FFf7: ff            Data
__fff8:     .hex 78            ; $FFf8: 78            Data
__fff9:     .hex ec            ; $FFf9: ec            Data   ; Is 78 EC an instruction?

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $FFfa: fa c0     Vector table
            .dw reset                      ; $FFfc: 33 c0     Vector table
            .dw irq                        ; $FFfe: 67 c1     Vector table
