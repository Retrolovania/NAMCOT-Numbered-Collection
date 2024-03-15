; Super Chinese (Japan).nes disassembled by nesgodisasm
; Revised, commented, and generally being turned into something decent by Retrolovania
; Still very much a work in progress!

; PRG CRC32 checksum: 899a0067
; CHR CRC32 checksum: 134fc0c6
; Overall CRC32 checksum: 8af25130
; Code base address: $8000

.db "NES", $1a                 ; Magic string that always begins an iNES header
.db $02                        ; Number of 16KB PRG-ROM banks
.db $04                        ; Number of 8KB CHR-ROM banks
.db $e0                        ; Control bits 1
.db $c0                        ; Control bits 2
.db $00                        ; Number of 8KB PRG-RAM banks
.db $00                        ; Video format NTSC/PAL
.dsb 6

.org $8000


APU_DMC_RAW = $4011
APU_FRAME = $4017
APU_PL1_VOL = $4000
APU_SND_CHN = $4015
JOYPAD1 = $4016
JOYPAD2 = $4017
OAM_ADDR = $2003
OAM_DMA = $4014
PPU_ADDR = $2006
PPU_CTRL = $2000
PPU_DATA = $2007
PPU_MASK = $2001
PPU_SCROLL = $2005
PPU_STATUS = $2002


_var_0000_indexed = $0000
_var_0010_indexed = $0010
_var_0016_indexed = $0016
_var_0019 = $0019
_var_001c = $001C
_var_001d = $001D
_var_001e = $001E
_var_001f_indexed = $001F
_var_0020 = $0020
_var_0021 = $0021
_var_0022 = $0022
_var_0023 = $0023
_var_0024 = $0024
_var_0025 = $0025
_var_0026 = $0026
_var_0027_indexed = $0027
_var_0028 = $0028
_var_0029 = $0029
_var_002a = $002A
_var_002b = $002B
_var_002c = $002C
_var_002d_indexed = $002D
_var_002e = $002E
_var_002f_indexed = $002F
_var_0030 = $0030
_var_0031_indexed = $0031
_var_0032 = $0032
_var_0033_indexed = $0033
_var_0035_indexed = $0035
_var_0036_indexed = $0036
_var_0037_indexed = $0037
_var_0039_indexed = $0039
_var_003a_indexed = $003A
_var_003b_indexed = $003B
_var_0041 = $0041
_var_0042 = $0042
_var_0043 = $0043
_var_0046 = $0046
_var_0047 = $0047
_var_0048 = $0048
_var_0049_indexed = $0049
_var_004b = $004B
_var_004c = $004C
_var_004d = $004D
_var_004e = $004E
_var_004f = $004F
_var_0050 = $0050
_var_0051 = $0051
_var_0052 = $0052
_var_0054 = $0054
_var_0056 = $0056
_var_0057 = $0057
_var_0058 = $0058
_var_0059 = $0059
_var_005a = $005A
_var_005b = $005B
_var_005c = $005C
_var_005d = $005D
_var_0060 = $0060
_var_0061_indexed = $0061
_var_0064 = $0064
_var_0065 = $0065
_var_0066 = $0066
_var_0067 = $0067
_var_0068 = $0068
_var_0069 = $0069
_var_006a = $006A
_var_006b = $006B
_var_006c = $006C
_var_006d = $006D
_var_006e = $006E
_var_006f = $006F
_var_0070_indexed = $0070
_var_0071 = $0071
_var_0072 = $0072
_var_0073_indexed = $0073
_var_0076 = $0076
_var_0077 = $0077
_var_0078 = $0078
_var_0079 = $0079
_var_007a = $007A
_var_007b = $007B
_var_007c = $007C
_var_007d = $007D
_var_007e = $007E
_var_007f = $007F
_var_0080 = $0080
_var_0081 = $0081
_var_0085 = $0085
_var_0086 = $0086
_var_0087_indexed = $0087
_var_0088 = $0088
_var_0089 = $0089
_var_008a = $008A
_var_008b = $008B
_var_008c = $008C
_var_008d_indexed = $008D
_var_008e = $008E
_var_008f = $008F
_var_0090 = $0090
_var_0091 = $0091
_var_0092 = $0092
_var_0093 = $0093
_var_0094 = $0094
_var_0095 = $0095
_var_0096 = $0096
_var_0097 = $0097
_var_0098 = $0098
_var_0099 = $0099
_var_009a = $009A
_var_009b = $009B
_var_009c = $009C
_var_009d = $009D
_var_009e = $009E
_var_009f = $009F
_var_00a0 = $00A0
_var_00a1 = $00A1
_var_00a2 = $00A2
_var_00a3 = $00A3
_var_00a4 = $00A4
_var_00a5 = $00A5
_var_00a6_indexed = $00A6
_var_00a7 = $00A7
_var_00a8 = $00A8
_var_00a9 = $00A9
_var_00aa = $00AA
_var_00ab = $00AB
_var_00ac = $00AC
_var_00ad = $00AD
_var_00ae = $00AE
_var_00af = $00AF
_var_00b0_indexed = $00B0
_var_00b1_indexed = $00B1
_var_00bb_indexed = $00BB
_var_00bc_indexed = $00BC
_var_00c4 = $00C4
_var_00c6_indexed = $00C6
_var_00cf_indexed = $00CF
_var_00d0_indexed = $00D0
_var_00d8 = $00D8
_var_00da_indexed = $00DA
_var_00db_indexed = $00DB
_var_00e5 = $00E5
_var_00e6 = $00E6
_var_00e7 = $00E7
_var_00e8 = $00E8
_var_00e9 = $00E9
_var_00ea = $00EA
_var_00eb = $00EB
_var_00ec = $00EC
_var_00ed = $00ED
_var_00ee = $00EE
_var_00ef = $00EF
_var_00f0 = $00F0
_var_00f1_indexed = $00F1
_var_00f2_indexed = $00F2
_var_00f3_indexed = $00F3
_var_00f4_indexed = $00F4
_var_00f5_indexed = $00F5
_var_00f6_indexed = $00F6
_var_00f7_indexed = $00F7
_var_00f8_indexed = $00F8
_var_00f9_indexed = $00F9
_var_00fa_indexed = $00FA
_var_00fb_indexed = $00FB
_var_00fc = $00FC
_var_00fd = $00FD
_var_00ff = $00FF
_var_0100_indexed = $0100
_var_0101_indexed = $0101
_var_0107_indexed = $0107
_var_010d = $010D
_var_010e = $010E
_var_010f = $010F
_var_0110_indexed = $0110
_var_0111 = $0111
_var_0112 = $0112
_var_0113 = $0113
_var_0114 = $0114
_var_0115 = $0115
_var_0116_indexed = $0116
_var_0119 = $0119
_var_011c_indexed = $011C
_var_011f = $011F
_var_0120_indexed = $0120
_var_0123 = $0123
_var_0124_indexed = $0124
_var_012f = $012F
_var_0130_indexed = $0130
_var_0133_indexed = $0133
_var_0136 = $0136
_var_0137 = $0137
_var_0138 = $0138
_var_0139 = $0139
_var_013a = $013A
_var_013b_indexed = $013B
_var_013d_indexed = $013D
_var_013e = $013E
_var_013f = $013F
_var_0140_indexed = $0140
_var_0143_indexed = $0143
_var_0146_indexed = $0146
_var_0148 = $0148
_var_014a = $014A
_var_014b = $014B
_var_0200_indexed = $0200
_var_0201_indexed = $0201
_var_0202_indexed = $0202
_var_0203_indexed = $0203
_var_0204_indexed = $0204
_var_0205_indexed = $0205
_var_0207_indexed = $0207
_var_0208_indexed = $0208
_var_0209_indexed = $0209
_var_020a_indexed = $020A
_var_020b_indexed = $020B
_var_020c_indexed = $020C
_var_020e_indexed = $020E
_var_020f_indexed = $020F
_var_0210_indexed = $0210
_var_0211_indexed = $0211
_var_0212_indexed = $0212
_var_0213_indexed = $0213
_var_0215 = $0215
_var_0216 = $0216
_var_0217 = $0217
_var_0218 = $0218
_var_0219 = $0219
_var_0246_indexed = $0246
_var_0247_indexed = $0247
_var_0248_indexed = $0248
_var_0249_indexed = $0249
_var_024a_indexed = $024A
_var_024b_indexed = $024B
_var_024d_indexed = $024D
_var_024e = $024E
_var_024f = $024F
_var_0251 = $0251
_var_0254_indexed = $0254
_var_0255 = $0255
_var_0256 = $0256
_var_0257 = $0257
_var_0258 = $0258
_var_0259 = $0259
_var_025b = $025B
_var_025c = $025C
_var_0260 = $0260
_var_0262_indexed = $0262
_var_0263_indexed = $0263
_var_0264_indexed = $0264
_var_0265_indexed = $0265
_var_0266_indexed = $0266
_var_0267_indexed = $0267
_var_0277_indexed = $0277
_var_027e_indexed = $027E
_var_027f_indexed = $027F
_var_0280_indexed = $0280
_var_0281_indexed = $0281
_var_0282_indexed = $0282
_var_0283_indexed = $0283
_var_0293_indexed = $0293
_var_0294_indexed = $0294
_var_0295_indexed = $0295
_var_0296_indexed = $0296
_var_0297_indexed = $0297
_var_0298_indexed = $0298
_var_02a1 = $02A1
_var_02a2 = $02A2
_var_02a4 = $02A4
_var_02a5 = $02A5
_var_02a6 = $02A6
_var_02a8_indexed = $02A8
_var_02a9_indexed = $02A9
_var_02aa_indexed = $02AA
_var_02ab_indexed = $02AB
_var_02ac_indexed = $02AC
_var_02ad_indexed = $02AD
_var_02b2 = $02B2
_var_02bd_indexed = $02BD
_var_02be_indexed = $02BE
_var_02bf_indexed = $02BF
_var_02c0_indexed = $02C0
_var_02c1_indexed = $02C1
_var_02c2_indexed = $02C2
_var_02d2 = $02D2
_var_02d3 = $02D3
_var_02d4 = $02D4
_var_02d5 = $02D5
_var_02d6 = $02D6
_var_02d7 = $02D7
_var_02d9 = $02D9
_var_02da = $02DA
_var_02db = $02DB
_var_02dc = $02DC
_var_02dd = $02DD
_var_02de = $02DE
_var_02f0 = $02F0
_var_02f1 = $02F1
_var_02f2 = $02F2
_var_02f3 = $02F3
_var_0300_indexed = $0300
_var_030c_indexed = $030C
_var_0318_indexed = $0318
_var_0324_indexed = $0324
_var_0330_indexed = $0330
_var_033c_indexed = $033C
_var_0348_indexed = $0348
_var_0354_indexed = $0354
_var_0360_indexed = $0360
_var_0364_indexed = $0364
_var_0368_indexed = $0368
_var_0369_indexed = $0369
_var_036a_indexed = $036A
_var_036b = $036B
_var_036c = $036C
_var_036d = $036D
_var_036e = $036E
_var_036f = $036F
_var_0370 = $0370
_var_0371 = $0371
_var_0372 = $0372
_var_0373 = $0373
_var_0374 = $0374
_var_0380_indexed = $0380
_var_0400_indexed = $0400
_var_0480_indexed = $0480
_var_0500_indexed = $0500
_var_0580_indexed = $0580
_var_0600_indexed = $0600
_var_0601_indexed = $0601
_var_0602_indexed = $0602
_var_0603_indexed = $0603
_var_0610_indexed = $0610
_var_0611 = $0611
_var_0612 = $0612
_var_0613 = $0613
_var_0614 = $0614
_var_0615 = $0615
_var_0616 = $0616
_var_0617 = $0617
_var_0618 = $0618
_var_0619 = $0619
_var_061a = $061A
_var_061b = $061B
_var_061c = $061C
_var_061d = $061D
_var_061e = $061E
_var_061f = $061F
_var_0620 = $0620
_var_0621 = $0621
_var_0622 = $0622
_var_0623 = $0623
_var_0624 = $0624
_var_0625 = $0625
_var_0626 = $0626
_var_0627 = $0627
_var_0628 = $0628
_var_0629 = $0629
_var_062a = $062A
_var_062b = $062B
_var_062c = $062C
_var_062d = $062D
_var_062e = $062E
_var_062f = $062F
_var_0630 = $0630
_var_0631 = $0631
_var_0632 = $0632
_var_0633 = $0633
_var_0634 = $0634
_var_0635_indexed = $0635
_var_0643_indexed = $0643
_var_0651_indexed = $0651
_var_065f_indexed = $065F
_var_066d_indexed = $066D
_var_067b_indexed = $067B
_var_0689_indexed = $0689
_var_06a0 = $06A0
_var_06a1 = $06A1
_var_06a2 = $06A2
_var_06a4 = $06A4
_var_06a7 = $06A7
_var_06a8 = $06A8
_var_06a9 = $06A9
_var_06aa = $06AA
_var_06ab = $06AB
_var_06ad = $06AD
_var_06ae_indexed = $06AE
_var_06b1 = $06B1
_var_06b4 = $06B4
_var_06b5 = $06B5
_var_06b8 = $06B8
_var_06b9 = $06B9
_var_06ba = $06BA
_var_06bb = $06BB
_var_06bc = $06BC
_var_06bd = $06BD
_var_06be = $06BE
_var_06bf = $06BF
_var_06c0_indexed = $06C0
_var_06c3 = $06C3
_var_06c4_indexed = $06C4
_var_06c8_indexed = $06C8
_var_06cc_indexed = $06CC
_var_06cd_indexed = $06CD
_var_06ce_indexed = $06CE
_var_0700_indexed = $0700
_var_4cff_indexed = $4CFF

_data_8000:
  jmp _label_acb9                ; $8000  4C B9 AC

.byte $4c, $40, $ad              ; $8003

  jmp _label_ae91                ; $8006  4C 91 AE

.byte $4c, $70, $b0              ; $8009

  jmp _label_b0ce                ; $800C  4C CE B0
  jmp _label_b284                ; $800F  4C 84 B2
  jmp _label_b405                ; $8012  4C 05 B4
  jmp _label_b559                ; $8015  4C 59 B5
  jmp _label_b711                ; $8018  4C 11 B7
  jmp _label_ba42                ; $801B  4C 42 BA
  jmp _label_bb0a                ; $801E  4C 0A BB
  jmp _label_bc77                ; $8021  4C 77 BC
  jmp _label_bcee                ; $8024  4C EE BC
  jmp _label_bded                ; $8027  4C ED BD

.byte $2e, $a4, $28, $a5, $2d, $a5, $32, $a5, $3a, $a5, $45, $a5, $53, $a5, $c7, $a9 ; $802A
.byte $33, $a4, $3d, $a1, $49, $a4, $54, $a4, $7d, $a2, $59, $a4, $e7, $a3, $cc, $a9 ; $803A
.byte $e5, $a7, $eb, $a4, $a2, $a2, $c1, $a1, $f6, $a8, $9b, $a5, $33, $a6, $d1, $a9 ; $804A
.byte $72, $a2, $34, $a2, $b2, $a6, $61, $a4, $cf, $a1, $66, $a1, $95, $a3, $d6, $a9 ; $805A
.byte $51, $a7, $50, $a1, $14, $a3, $dd, $a4, $ca, $a2, $16, $a6, $b0, $a1, $db, $a9 ; $806A
.byte $45, $a1, $35, $a1, $3c, $a2, $95, $a6, $14, $a4, $17, $a7, $79, $a1, $e0, $a9 ; $807A
.byte $a2, $a4, $65, $a3, $2a, $a1, $9d, $a3, $4d, $a6, $9a, $a4, $18, $a2, $e5, $a9 ; $808A
.byte $ce, $a7, $81, $a3, $3b, $a4, $74, $a1, $22, $a8, $b6, $a8, $67, $a2, $ea, $a9 ; $809A
.byte $06, $a3, $b9, $a3, $a8, $a3, $81, $a4, $da, $a5, $f2, $a3, $0e, $a5, $c7, $a9 ; $80AA
.byte $89, $a1, $4a, $a2, $50, $a9, $74, $a4, $b9, $a4, $19, $a9, $c6, $a5, $cc, $a9 ; $80BA
.byte $42, $a3, $5d, $a5, $8c, $a4, $ff, $a5, $02, $a2, $d7, $a6, $fa, $a6, $d1, $a9 ; $80CA
.byte $ab, $a1, $f5, $a2, $06, $a4, $5b, $a1, $df, $a1, $9c, $a8, $62, $a8, $d6, $a9 ; $80DA
.byte $6a, $a5, $71, $a7, $a0, $a1, $28, $a3, $8e, $a7, $3c, $a8, $f1, $a5, $db, $a9 ; $80EA
.byte $b9, $a2, $d9, $a8, $7c, $a8, $e1, $a2, $81, $a5, $79, $a4, $2b, $a7, $e0, $a9 ; $80FA
.byte $d7, $a1, $39, $a9, $c1, $a4, $d2, $a4, $a9, $a5, $08, $a8, $84, $a6, $e5, $a9 ; $810A
.byte $a4, $a9, $88, $a2, $ab, $a7, $6a, $a6, $81, $a9, $70, $a9, $62, $a5, $ea, $a9 ; $811A
.byte $80, $00, $bf, $e8, $19, $3f, $74, $00, $3f, $84, $00, $00, $40, $bf, $a8, $28 ; $812A
.byte $1f, $48, $00, $40, $00, $bf, $d8, $0a, $2f, $54, $00, $40, $40, $bf, $68, $1e ; $813A
.byte $2f, $5c, $ff, $4f, $b8, $ff, $40, $40, $bf, $78, $28, $1f, $8c, $ff, $af, $cc ; $814A
.byte $ff, $40, $40, $bf, $d8, $1e, $5f, $7c, $ff, $df, $48, $ff, $80, $42, $2f, $38 ; $815A
.byte $0a, $6f, $c4, $00, $df, $24, $00, $2f, $e8, $00, $00, $00, $bf, $88, $0a, $00 ; $816A
.byte $00, $af, $7c, $00, $40, $42, $1f, $88, $28, $bf, $74, $01, $4f, $48, $00, $21 ; $817A
.byte $20, $bf, $48, $46, $7f, $78, $00, $3f, $18, $ff, $6f, $38, $00, $0f, $b8, $ff ; $818A
.byte $bf, $a8, $ff, $4f, $08, $ff, $01, $40, $bf, $58, $00, $0f, $88, $00, $9f, $28 ; $819A
.byte $00, $00, $02, $3f, $7c, $2d, $d0, $00, $af, $b4, $14, $4f, $64, $ff, $5f, $d4 ; $81AA
.byte $ff, $5f, $dc, $ff, $8f, $18, $ff, $0c, $00, $bf, $9c, $0f, $2f, $a8, $ff, $7f ; $81BA
.byte $a8, $ff, $cf, $a8, $ff, $01, $00, $bf, $a8, $14, $4f, $98, $00, $40, $00, $bf ; $81CA
.byte $c8, $1e, $1f, $74, $00, $78, $30, $bf, $08, $1e, $0f, $ec, $ff, $9f, $88, $ff ; $81DA
.byte $af, $28, $00, $af, $a8, $00, $9f, $58, $ff, $af, $a8, $ff, $2f, $28, $ff, $2f ; $81EA
.byte $a8, $00, $9f, $58, $00, $af, $e8, $ff, $80, $02, $3f, $7c, $32, $0f, $d4, $01 ; $81FA
.byte $bf, $24, $01, $40, $42, $1f, $5c, $3c, $2f, $d4, $00, $9f, $d8, $01, $80, $00 ; $820A
.byte $bf, $d8, $1e, $bf, $24, $00, $1f, $44, $ff, $81, $42, $4f, $78, $10, $4f, $24 ; $821A
.byte $00, $4f, $c4, $00, $df, $78, $00, $2f, $38, $01, $40, $00, $af, $78, $0a, $4f ; $822A
.byte $14, $00, $08, $40, $bf, $78, $28, $0f, $88, $00, $0f, $98, $00, $2f, $18, $00 ; $823A
.byte $a9, $40, $bf, $98, $1e, $5f, $bc, $00, $6f, $cc, $00, $2f, $18, $ff, $2f, $c8 ; $824A
.byte $ff, $2f, $28, $ff, $8f, $28, $ff, $9f, $b8, $ff, $2f, $18, $00, $80, $00, $af ; $825A
.byte $70, $1e, $bf, $14, $00, $9f, $14, $ff, $40, $42, $0f, $c8, $0f, $bf, $84, $01 ; $826A
.byte $0f, $18, $00, $20, $02, $1f, $78, $0a, $cf, $18, $00, $cf, $d8, $00, $98, $10 ; $827A
.byte $bf, $08, $2d, $1f, $7c, $ff, $6f, $cc, $ff, $9f, $18, $00, $9f, $78, $00, $bf ; $828A
.byte $a8, $00, $1f, $18, $ff, $0f, $e8, $ff, $81, $22, $2f, $a8, $1e, $cf, $2c, $00 ; $829A
.byte $cf, $bc, $00, $2f, $d8, $00, $8f, $78, $00, $7f, $98, $01, $7f, $48, $00, $00 ; $82AA
.byte $32, $0f, $a8, $23, $df, $b8, $00, $7f, $30, $01, $7f, $80, $01, $4f, $98, $00 ; $82BA
.byte $80, $30, $af, $78, $0f, $2f, $74, $00, $7f, $74, $ff, $2f, $e0, $00, $cf, $78 ; $82CA
.byte $ff, $7f, $08, $ff, $1f, $78, $ff, $10, $30, $8f, $78, $23, $1f, $08, $00, $0f ; $82DA
.byte $48, $00, $2f, $b8, $00, $6f, $d8, $00, $1f, $78, $ff, $08, $12, $1f, $28, $19 ; $82EA
.byte $2f, $78, $00, $2f, $88, $00, $1f, $e0, $00, $3f, $d8, $00, $84, $00, $af, $78 ; $82FA
.byte $1e, $3f, $74, $00, $6f, $74, $ff, $0f, $78, $00, $55, $40, $bf, $98, $0a, $2f ; $830A
.byte $54, $ff, $0f, $d8, $00, $cf, $48, $ff, $0f, $88, $00, $4f, $58, $ff, $24, $30 ; $831A
.byte $bf, $18, $32, $6f, $08, $ff, $9f, $08, $00, $2f, $68, $ff, $1f, $08, $ff, $7f ; $832A
.byte $08, $ff, $6f, $d8, $00, $bf, $38, $00, $78, $30, $bf, $88, $19, $3f, $84, $00 ; $833A
.byte $af, $18, $ff, $af, $48, $00, $8f, $b8, $00, $0f, $38, $00, $0f, $48, $00, $cf ; $834A
.byte $c8, $ff, $ef, $18, $ff, $af, $08, $00, $3f, $48, $ff, $80, $40, $8f, $78, $19 ; $835A
.byte $0f, $54, $ff, $0f, $a4, $ff, $4f, $68, $ff, $09, $00, $af, $78, $08, $3f, $98 ; $836A
.byte $ff, $3f, $a8, $ff, $1f, $78, $00, $50, $50, $8f, $48, $28, $6f, $84, $ff, $af ; $837A
.byte $c8, $00, $1f, $d8, $ff, $8f, $d8, $00, $6f, $18, $ff, $40, $02, $2f, $38, $28 ; $838A
.byte $af, $bc, $00, $40, $42, $3f, $a8, $0f, $8f, $14, $00, $1f, $18, $00, $82, $02 ; $839A
.byte $6f, $98, $0a, $6f, $14, $00, $7f, $a4, $ff, $0f, $58, $00, $3f, $38, $01, $59 ; $83AA
.byte $52, $6f, $48, $1e, $2f, $94, $00, $1f, $18, $01, $cf, $98, $00, $cf, $a8, $00 ; $83BA
.byte $0f, $98, $01, $6f, $d8, $00, $9f, $58, $01, $3f, $d8, $00, $40, $20, $bf, $38 ; $83CA
.byte $04, $6f, $bc, $00, $7f, $68, $00, $7f, $88, $00, $bf, $78, $00, $80, $00, $bf ; $83DA
.byte $e8, $0f, $0f, $1c, $ff, $0f, $6c, $00, $0d, $42, $1f, $14, $14, $4f, $58, $00 ; $83EA
.byte $4f, $68, $00, $4f, $78, $00, $bf, $28, $01, $9f, $c8, $00, $60, $00, $af, $c8 ; $83FA
.byte $32, $3f, $4c, $00, $5f, $48, $00, $5f, $e8, $00, $c0, $32, $1f, $54, $19, $7f ; $840A
.byte $6c, $00, $af, $9c, $00, $4f, $cc, $01, $3f, $98, $00, $1f, $88, $01, $4f, $58 ; $841A
.byte $01, $9f, $b8, $01, $00, $00, $9f, $d8, $14, $40, $00, $bf, $88, $0a, $3f, $7c ; $842A
.byte $00, $40, $10, $bf, $d8, $14, $1f, $b4, $00, $2f, $55, $ff, $0f, $28, $00, $80 ; $843A
.byte $00, $9f, $88, $0a, $bf, $1c, $00, $bf, $e4, $00, $00, $02, $0f, $68, $0a, $40 ; $844A
.byte $02, $2f, $88, $0a, $9f, $cc, $00, $c0, $00, $af, $d8, $0a, $0f, $c4, $00, $0f ; $845A
.byte $54, $00, $1f, $9c, $ff, $00, $00, $7f, $b8, $01, $00, $00, $af, $58, $02, $00 ; $846A
.byte $40, $af, $90, $1e, $4f, $08, $00, $02, $00, $bf, $78, $01, $0f, $58, $00, $3f ; $847A
.byte $a8, $00, $02, $40, $bf, $c8, $28, $0f, $58, $00, $4f, $c8, $00, $6f, $08, $00 ; $848A
.byte $40, $00, $af, $58, $0a, $0f, $bc, $00, $80, $32, $2f, $44, $23, $8f, $8c, $01 ; $849A
.byte $af, $4c, $01, $af, $d8, $00, $9f, $10, $01, $8f, $70, $00, $4f, $68, $01, $10 ; $84AA
.byte $02, $6f, $d8, $23, $9f, $d8, $00, $a0, $00, $af, $d0, $3c, $2f, $ac, $ff, $8f ; $84BA
.byte $e4, $ff, $6f, $88, $ff, $3f, $08, $ff, $80, $00, $af, $88, $32, $5f, $cc, $ff ; $84CA
.byte $bf, $1c, $ff, $80, $40, $bf, $98, $32, $1f, $8c, $ff, $af, $6c, $ff, $3f, $e8 ; $84DA
.byte $ff, $7c, $20, $9f, $78, $0a, $1f, $d4, $ff, $4f, $18, $00, $8f, $58, $00, $6f ; $84EA
.byte $d8, $00, $2f, $78, $00, $6f, $98, $00, $cf, $88, $00, $6f, $18, $00, $af, $c8 ; $84FA
.byte $00, $0f, $c8, $00, $c0, $30, $bf, $68, $1e, $2f, $2c, $ff, $7f, $7c, $ff, $d7 ; $850A
.byte $8c, $ff, $a7, $68, $ff, $e7, $68, $ff, $2f, $68, $00, $7f, $68, $00, $00, $00 ; $851A
.byte $bf, $a8, $0a, $00, $00, $af, $b8, $0f, $00, $40, $af, $b8, $19, $9f, $58, $00 ; $852A
.byte $00, $10, $af, $d8, $0f, $df, $48, $ff, $2f, $48, $00, $00, $20, $af, $58, $0a ; $853A
.byte $2f, $68, $00, $9f, $d8, $00, $5f, $88, $00, $00, $00, $7f, $c8, $0a, $00, $00 ; $854A
.byte $bf, $78, $00, $00, $00, $7f, $e4, $01, $40, $00, $9f, $e8, $5a, $1f, $7c, $ff ; $855A
.byte $4c, $10, $af, $18, $32, $1f, $ac, $ff, $9f, $38, $ff, $ef, $b8, $ff, $cf, $38 ; $856A
.byte $ff, $0f, $a8, $00, $8f, $a8, $ff, $54, $32, $1f, $08, $19, $0f, $3c, $00, $8f ; $857A
.byte $a8, $00, $7f, $38, $01, $4f, $48, $00, $5f, $48, $00, $6f, $48, $00, $7f, $48 ; $858A
.byte $00, $40, $10, $bf, $d8, $14, $3f, $1c, $00, $4f, $88, $00, $0f, $68, $00, $68 ; $859A
.byte $50, $af, $68, $32, $2f, $4c, $ff, $af, $68, $ff, $af, $78, $ff, $4f, $88, $00 ; $85AA
.byte $4f, $98, $00, $6f, $78, $ff, $ef, $7c, $ff, $6f, $98, $ff, $40, $30, $af, $68 ; $85BA
.byte $19, $bf, $54, $ff, $0f, $28, $ff, $bf, $d8, $ff, $4f, $08, $00, $6f, $68, $00 ; $85CA
.byte $a0, $10, $af, $38, $14, $3f, $14, $ff, $4f, $c4, $ff, $2f, $d8, $00, $2f, $e8 ; $85DA
.byte $00, $6f, $a8, $00, $3f, $08, $ff, $00, $20, $bf, $88, $2d, $2f, $c8, $00, $4f ; $85EA
.byte $48, $00, $7f, $a8, $00, $80, $32, $2f, $c8, $23, $6f, $2c, $00, $9f, $cc, $01 ; $85FA
.byte $47, $70, $00, $af, $88, $00, $3f, $68, $01, $4f, $68, $01, $88, $30, $af, $c8 ; $860A
.byte $0f, $6f, $cc, $ff, $6f, $4c, $ff, $af, $68, $ff, $af, $78, $ff, $2f, $68, $ff ; $861A
.byte $9f, $c0, $ff, $ef, $28, $ff, $3f, $78, $00, $4c, $20, $af, $88, $0f, $3f, $9c ; $862A
.byte $ff, $bf, $98, $ff, $bf, $a8, $ff, $4f, $28, $00, $1f, $48, $ff, $df, $98, $ff ; $863A
.byte $3f, $08, $00, $70, $30, $af, $a8, $19, $3f, $7c, $ff, $2f, $88, $00, $2f, $98 ; $864A
.byte $00, $2f, $a8, $00, $5f, $08, $ff, $6f, $78, $ff, $7f, $c8, $00, $0f, $38, $ff ; $865A
.byte $84, $30, $af, $58, $32, $3f, $84, $ff, $7f, $14, $ff, $af, $78, $ff, $0f, $58 ; $866A
.byte $ff, $ef, $88, $ff, $27, $d0, $00, $4f, $58, $ff, $28, $02, $1f, $bc, $14, $6f ; $867A
.byte $28, $00, $6f, $38, $00, $5f, $88, $01, $5f, $98, $01, $4a, $20, $af, $b8, $0f ; $868A
.byte $af, $dc, $ff, $bf, $98, $ff, $bf, $a8, $ff, $1f, $68, $00, $1f, $88, $00, $4f ; $869A
.byte $78, $ff, $5f, $28, $00, $bf, $58, $ff, $8c, $32, $0f, $78, $0f, $3f, $3c, $00 ; $86AA
.byte $cf, $2c, $00, $0f, $98, $01, $0f, $a8, $01, $0f, $b8, $01, $6f, $58, $00, $ef ; $86BA
.byte $28, $00, $af, $98, $00, $3f, $38, $01, $00, $00, $af, $78, $1e, $9c, $30, $af ; $86CA
.byte $98, $28, $2f, $4c, $ff, $2f, $dc, $ff, $2f, $28, $00, $3f, $98, $00, $3f, $a8 ; $86DA
.byte $00, $3f, $b8, $00, $4f, $38, $ff, $df, $b8, $ff, $ef, $48, $ff, $1f, $98, $00 ; $86EA
.byte $a0, $30, $af, $98, $1e, $1f, $dc, $ff, $0f, $1c, $00, $bf, $c8, $ff, $bf, $d8 ; $86FA
.byte $ff, $9f, $98, $ff, $2f, $90, $00, $9f, $08, $00, $1f, $a8, $ff, $40, $32, $2f ; $870A
.byte $28, $14, $6f, $9c, $00, $8f, $e8, $00, $0f, $20, $01, $af, $68, $01, $2f, $e8 ; $871A
.byte $00, $7c, $32, $17, $38, $2d, $0f, $bc, $00, $af, $18, $00, $af, $28, $00, $af ; $872A
.byte $38, $00, $3f, $58, $00, $3f, $68, $00, $bf, $b8, $00, $2f, $d8, $00, $bf, $08 ; $873A
.byte $00, $0f, $b8, $01, $8f, $78, $01, $8c, $32, $2f, $a8, $0f, $3f, $7c, $00, $9f ; $874A
.byte $7c, $00, $bf, $28, $01, $bf, $78, $01, $bf, $c8, $01, $df, $58, $00, $df, $98 ; $875A
.byte $00, $af, $78, $01, $0f, $78, $00, $70, $30, $bf, $d8, $32, $6f, $6c, $ff, $8f ; $876A
.byte $c8, $ff, $ef, $48, $ff, $af, $78, $00, $9f, $80, $ff, $ef, $a8, $ff, $6f, $28 ; $877A
.byte $00, $4f, $98, $00, $88, $30, $9f, $80, $32, $7f, $9c, $ff, $af, $cc, $00, $3f ; $878A
.byte $18, $00, $3f, $28, $00, $9f, $48, $ff, $3f, $38, $00, $4f, $a8, $00, $9f, $98 ; $879A
.byte $ff, $2c, $70, $af, $98, $23, $bf, $98, $ff, $9f, $48, $ff, $7f, $98, $00, $7f ; $87AA
.byte $a8, $00, $4f, $88, $ff, $7f, $28, $ff, $af, $e8, $ff, $ef, $50, $ff, $5f, $48 ; $87BA
.byte $00, $3f, $c8, $ff, $40, $72, $0f, $7c, $2d, $df, $8c, $00, $7f, $48, $01, $5f ; $87CA
.byte $38, $00, $5f, $b8, $00, $7f, $d8, $01, $1f, $b8, $01, $9d, $20, $9f, $28, $0a ; $87DA
.byte $8f, $ac, $ff, $27, $9c, $ff, $5f, $98, $ff, $cf, $88, $00, $cf, $98, $00, $cf ; $87EA
.byte $a8, $00, $df, $28, $ff, $0f, $e8, $00, $af, $98, $00, $6f, $68, $ff, $48, $30 ; $87FA
.byte $9f, $38, $32, $df, $ac, $ff, $1f, $68, $00, $1f, $78, $00, $bf, $28, $ff, $cf ; $880A
.byte $d8, $ff, $6f, $58, $00, $7f, $b8, $ff, $c0, $30, $bf, $48, $46, $2f, $7c, $ff ; $881A
.byte $af, $8c, $ff, $df, $1c, $ff, $6f, $58, $ff, $cf, $d8, $ff, $af, $28, $00, $1f ; $882A
.byte $48, $ff, $b8, $30, $af, $68, $32, $bf, $cc, $ff, $1f, $3c, $00, $7f, $68, $ff ; $883A
.byte $7f, $78, $ff, $7f, $88, $ff, $2f, $a8, $ff, $2f, $b8, $ff, $1f, $18, $ff, $1f ; $884A
.byte $d8, $ff, $6f, $58, $ff, $5f, $78, $00, $49, $22, $6f, $48, $32, $1f, $3c, $00 ; $885A
.byte $6f, $78, $01, $6f, $88, $01, $1f, $a8, $00, $0f, $98, $00, $5f, $78, $01, $df ; $886A
.byte $78, $00, $70, $70, $bf, $28, $1e, $3f, $ac, $ff, $5f, $68, $00, $5f, $78, $00 ; $887A
.byte $5f, $88, $00, $0f, $98, $ff, $77, $a0, $ff, $bf, $68, $ff, $9f, $b8, $00, $4f ; $888A
.byte $28, $ff, $48, $32, $1f, $d8, $14, $1f, $8c, $00, $cf, $78, $00, $0f, $48, $01 ; $889A
.byte $1f, $b8, $00, $7f, $08, $00, $e7, $e0, $00, $6f, $48, $01, $78, $30, $bf, $98 ; $88AA
.byte $14, $2f, $ac, $ff, $bf, $68, $ff, $bf, $78, $ff, $bf, $88, $ff, $2f, $48, $ff ; $88BA
.byte $2f, $58, $ff, $3f, $30, $ff, $9f, $a8, $ff, $0f, $d8, $00, $5f, $08, $ff, $4c ; $88CA
.byte $32, $1f, $48, $28, $9f, $bc, $01, $af, $98, $00, $af, $a8, $00, $df, $98, $00 ; $88DA
.byte $2f, $d8, $00, $1f, $a0, $01, $7f, $48, $01, $bf, $48, $00, $74, $70, $8f, $78 ; $88EA
.byte $0f, $1f, $8c, $ff, $af, $68, $ff, $af, $78, $ff, $af, $88, $ff, $2f, $68, $00 ; $88FA
.byte $4f, $48, $ff, $1f, $78, $ff, $9f, $48, $ff, $9f, $a8, $ff, $1f, $78, $00, $e0 ; $890A
.byte $32, $2f, $18, $19, $af, $3c, $00, $af, $6c, $00, $2f, $cc, $00, $4f, $78, $01 ; $891A
.byte $4f, $88, $01, $af, $28, $00, $d7, $b8, $00, $2f, $98, $01, $1f, $e8, $01, $80 ; $892A
.byte $32, $3f, $38, $3c, $0f, $0c, $00, $0f, $6c, $00, $2f, $28, $00, $9f, $38, $00 ; $893A
.byte $0f, $08, $01, $4f, $18, $01, $38, $32, $4f, $cc, $1e, $bf, $c8, $00, $bf, $e8 ; $894A
.byte $00, $df, $28, $00, $0f, $98, $01, $8f, $78, $01, $2f, $98, $00, $5f, $68, $00 ; $895A
.byte $7f, $78, $01, $cf, $c8, $00, $01, $22, $5f, $dc, $1e, $0f, $b8, $00, $ef, $90 ; $896A
.byte $00, $1f, $d8, $01, $4f, $b8, $00, $9c, $32, $2f, $d8, $1e, $0f, $2c, $01, $af ; $897A
.byte $cc, $01, $af, $18, $00, $cf, $88, $01, $cf, $98, $01, $cf, $a8, $01, $e7, $90 ; $898A
.byte $00, $ef, $38, $00, $bf, $e8, $01, $9f, $c8, $00, $b4, $60, $7f, $ec, $32, $df ; $899A
.byte $4c, $ff, $0f, $7c, $ff, $2f, $08, $00, $2f, $68, $00, $bf, $e8, $00, $df, $98 ; $89AA
.byte $ff, $5f, $d8, $ff, $4f, $78, $ff, $df, $e8, $ff, $5f, $98, $ff, $00, $00, $bf ; $89BA
.byte $20, $0a, $00, $00, $bf, $d8, $0a, $00, $00, $bf, $68, $0a, $00, $00, $bf, $d8 ; $89CA
.byte $0a, $00, $00, $bf, $a8, $0a, $00, $00, $bf, $d8, $0a, $00, $00, $bf, $d8, $0a ; $89DA
.byte $00, $00, $bf, $e0, $0a, $03, $aa, $e9, $aa, $54, $ab, $78, $ab, $79, $ab, $e4 ; $89EA
.byte $ab, $e5, $ab, $26, $ac, $27, $ac, $b3, $ac, $28, $e3, $87, $87, $bf, $a0, $af ; $89FA
.byte $d4, $af, $af, $b0, $b2, $d6, $a0, $af, $af, $af, $c0, $c2, $af, $d4, $c0, $cf ; $8A0A
.byte $af, $af, $ca, $ff, $29, $03, $87, $87, $af, $a1, $a2, $a3, $a4, $dd, $b1, $b3 ; $8A1A
.byte $db, $a1, $a2, $a3, $a4, $de, $c1, $c3, $c3, $dc, $d0, $da, $af, $af, $ff, $29 ; $8A2A
.byte $23, $4c, $4e, $af, $a5, $d8, $a5, $a6, $b4, $b6, $b5, $b7, $a5, $d8, $a5, $a6 ; $8A3A
.byte $dc, $c9, $d9, $c6, $a5, $b9, $af, $af, $af, $50, $52, $ff, $29, $43, $4d, $4f ; $8A4A
.byte $af, $a5, $a7, $c5, $a9, $b8, $a8, $a8, $ba, $dc, $a7, $c5, $a9, $b8, $a8, $c5 ; $8A5A
.byte $c7, $a5, $b9, $af, $af, $af, $51, $53, $ff, $29, $63, $6c, $6e, $af, $a5, $d8 ; $8A6A
.byte $a5, $a6, $dc, $c9, $a5, $b9, $a5, $d8, $a5, $a6, $dc, $c9, $d9, $d9, $a5, $d1 ; $8A7A
.byte $ac, $ac, $d8, $70, $72, $ff, $29, $83, $6d, $6f, $af, $aa, $ac, $ad, $ae, $bb ; $8A8A
.byte $b9, $a5, $bc, $aa, $ac, $ad, $ae, $dc, $cc, $cb, $c8, $dc, $d2, $ac, $ac, $d8 ; $8A9A
.byte $71, $73, $ff, $29, $a3, $3c, $3e, $af, $ab, $d9, $d9, $da, $d5, $be, $bd, $da ; $8AAA
.byte $ab, $d9, $d9, $da, $cd, $ce, $d7, $c4, $df, $d9, $d9, $d9, $da, $3d, $3f, $ff ; $8ABA
.byte $2b, $c8, $50, $50, $50, $50, $50, $50, $50, $50, $ff, $2b, $d0, $55, $55, $55 ; $8ACA
.byte $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $ff, $ff, $28 ; $8ADA
.byte $67, $1c, $0c, $18, $1b, $0e, $87, $87, $87, $87, $87, $87, $11, $12, $25, $1c ; $8AEA
.byte $0c, $18, $1b, $0e, $ff, $28, $8b, $00, $00, $ff, $28, $98, $00, $00, $ff, $2a ; $8AFA
.byte $47, $19, $1e, $1c, $11, $87, $1c, $1d, $0a, $1b, $1d, $87, $0b, $1e, $1d, $1d ; $8B0A
.byte $18, $17, $ff, $2a, $cb, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $ff, $2b ; $8B1A
.byte $07, $26, $87, $01, $09, $08, $06, $87, $17, $0a, $16, $0c, $18, $87, $15, $1d ; $8B2A
.byte $0d, $24, $ff, $2b, $46, $0a, $15, $15, $87, $1b, $12, $10, $11, $1d, $1c, $87 ; $8B3A
.byte $1b, $0e, $1c, $0e, $1b, $1f, $0e, $0d, $ff, $ff, $29, $06, $19, $15, $0e, $0a ; $8B4A
.byte $1c, $0e, $87, $1c, $0e, $15, $0e, $0c, $1d, $87, $0f, $15, $18, $18, $1b, $ff ; $8B5A
.byte $29, $cb, $0f, $15, $18, $18, $1b, $ff, $2b, $da, $55, $55, $55, $ff, $ff, $28 ; $8B6A
.byte $ed, $1b, $0e, $0a, $0d, $22, $ff, $29, $4b, $0f, $15, $18, $18, $1b, $ff, $2a ; $8B7A
.byte $c7, $e0, $e2, $e4, $e6, $ff, $2a, $e7, $e1, $e3, $e5, $e7, $ff, $2b, $07, $e8 ; $8B8A
.byte $ea, $ec, $ee, $ff, $2b, $27, $e9, $87, $87, $ef, $ff, $2b, $45, $eb, $ed, $eb ; $8B9A
.byte $ed, $eb, $ed, $eb, $ed, $eb, $ed, $eb, $ed, $eb, $ed, $eb, $ed, $eb, $ed, $eb ; $8BAA
.byte $ed, $eb, $ff, $2b, $cb, $aa, $aa, $ff, $2b, $d2, $aa, $aa, $aa, $ff, $2b, $e2 ; $8BBA
.byte $55, $55, $0f, $0f, $0f, $ff, $2b, $e8, $55, $55, $55, $55, $55, $55, $55, $55 ; $8BCA
.byte $55, $55, $55, $55, $55, $55, $55, $55, $ff, $ff, $ff, $29, $cb, $10, $0a, $16 ; $8BDA
.byte $0e, $87, $18, $1f, $0e, $1b, $ff, $2a, $46, $22, $18, $1e, $87, $16, $12, $1c ; $8BEA
.byte $1c, $0e, $0d, $87, $0f, $15, $18, $18, $1b, $ff, $2a, $8a, $1d, $1b, $22, $87 ; $8BFA
.byte $0a, $10, $0a, $12, $17, $ff, $2b, $da, $55, $55, $55, $ff, $2b, $e1, $aa, $aa ; $8C0A
.byte $aa, $aa, $aa, $aa, $00, $00, $00, $aa, $aa, $aa, $ff, $ff, $ff, $28, $86, $0f ; $8C1A
.byte $15, $18, $18, $1b, $ff, $29, $06, $1c, $0c, $18, $1b, $0e, $ff, $29, $19, $00 ; $8C2A
.byte $00, $ff, $29, $66, $10, $1b, $0a, $0d, $0e, $87, $19, $18, $12, $17, $1d, $ff ; $8C3A
.byte $29, $78, $00, $00, $00, $ff, $29, $a6, $19, $18, $20, $0e, $1b, $87, $19, $18 ; $8C4A
.byte $12, $17, $1d, $ff, $29, $b9, $00, $00, $ff, $29, $e6, $0b, $18, $17, $1e, $1c ; $8C5A
.byte $ff, $2a, $10, $21, $87, $87, $87, $87, $f7, $87, $87, $87, $00, $00, $ff, $2a ; $8C6A
.byte $50, $21, $87, $87, $87, $87, $f7, $87, $87, $87, $00, $00, $ff, $2a, $90, $21 ; $8C7A
.byte $87, $87, $87, $87, $f7, $87, $87, $87, $00, $00, $ff, $2a, $d0, $21, $87, $87 ; $8C8A
.byte $87, $87, $f7, $87, $87, $87, $00, $00, $ff, $2b, $26, $0f, $15, $18, $18, $1b ; $8C9A
.byte $87, $1d, $18, $1d, $0a, $15, $ff, $ff, $ff, $2b, $39, $00, $00, $ff, $ff ; $8CAA

  jsr _func_bf3d                 ; $8CB9  20 3D BF
  lda _var_001d                  ; $8CBC  A5 1D
  and #$02                       ; $8CBE  29 02
  bne _label_8ce2                ; $8CC0  D0 20
  lda _var_004b                  ; $8CC2  A5 4B
  and #$0C                       ; $8CC4  29 0C
  bne _label_8cce                ; $8CC6  D0 06
  lda _var_0065                  ; $8CC8  A5 65
  cmp #$EF                       ; $8CCA  C9 EF
  bne _label_8cdf                ; $8CCC  D0 11

_label_8cce:
  lda #$B2                       ; $8CCE  A9 B2
  sta _var_001d                  ; $8CD0  85 1D
  lda #$00                       ; $8CD2  A9 00
  sta _var_0065                  ; $8CD4  85 65
  sta _var_0050                  ; $8CD6  85 50
  sta _var_0051                  ; $8CD8  85 51
  lda #$01                       ; $8CDA  A9 01
  sta _var_0024                  ; $8CDC  85 24
  rts                            ; $8CDE  60

_label_8cdf:
  inc _var_0065                  ; $8CDF  E6 65
  rts                            ; $8CE1  60

_label_8ce2:
  lda _var_004b                  ; $8CE2  A5 4B
  and #$0C                       ; $8CE4  29 0C
  beq _label_8cf9                ; $8CE6  F0 11
  lda _var_0024                  ; $8CE8  A5 24
  bne _label_8d16                ; $8CEA  D0 2A
  lda _var_004b                  ; $8CEC  A5 4B
  and #$08                       ; $8CEE  29 08
  bne _label_8d24                ; $8CF0  D0 32
  lda #$00                       ; $8CF2  A9 00
  sta _var_0050                  ; $8CF4  85 50
  sta _var_0051                  ; $8CF6  85 51
  rts                            ; $8CF8  60

_label_8cf9:
  lda _var_0051                  ; $8CF9  A5 51
  cmp #$02                       ; $8CFB  C9 02
  bcc _label_8d16                ; $8CFD  90 17
  lda _var_001e                  ; $8CFF  A5 1E
  bne _label_8d17                ; $8D01  D0 14
  inc _var_0021                  ; $8D03  E6 21
  inc a:_var_06c3                ; $8D05  EE C3 06
  lda #$00                       ; $8D08  A9 00
  sta _var_008e                  ; $8D0A  85 8E
  sta _var_0050                  ; $8D0C  85 50
  sta _var_0051                  ; $8D0E  85 51
  lda #$11                       ; $8D10  A9 11
  sta _var_001f_indexed          ; $8D12  85 1F
  sta _var_0026                  ; $8D14  85 26

_label_8d16:
  rts                            ; $8D16  60

_label_8d17:
  lda #$00                       ; $8D17  A9 00
  sta _var_0050                  ; $8D19  85 50
  sta _var_0051                  ; $8D1B  85 51
  sta _var_0065                  ; $8D1D  85 65
  lda #$B0                       ; $8D1F  A9 B0
  sta _var_001d                  ; $8D21  85 1D
  rts                            ; $8D23  60

_label_8d24:
  inc _var_0024                  ; $8D24  E6 24
  lda #$01                       ; $8D26  A9 01
  sta _var_001f_indexed          ; $8D28  85 1F
  lda #$01                       ; $8D2A  A9 01
  sta _var_002c                  ; $8D2C  85 2C
  inc _var_002b                  ; $8D2E  E6 2B
  lda #$00                       ; $8D30  A9 00
  sta _var_002a                  ; $8D32  85 2A
  lda #$04                       ; $8D34  A9 04
  sta a:_var_014a                ; $8D36  8D 4A 01
  inc _var_0023                  ; $8D39  E6 23
  inc _var_0025                  ; $8D3B  E6 25
  inc _var_0022                  ; $8D3D  E6 22
  rts                            ; $8D3F  60

.byte $a5, $7f, $aa, $ca, $a5, $1f, $c9, $81, $f0, $27, $a9, $23, $8d, $06, $20, $a9 ; $8D40
.byte $d3, $8d, $06, $20, $bd, $c1, $ad, $8d, $07, $20, $bd, $c9, $ad, $8d, $07, $20 ; $8D50
.byte $8a, $0a, $0a, $0a, $0a, $aa, $a9, $0e, $85, $2d, $a9, $21, $85, $2e, $4c, $98 ; $8D60
.byte $ad, $ac, $a2, $06, $a9, $23, $8d, $06, $20, $b9, $e1, $ad, $8d, $06, $20, $bd ; $8D70
.byte $e9, $ad, $8d, $07, $20, $bd, $f1, $ad, $aa, $ad, $a2, $06, $0a, $a8, $b9, $d1 ; $8D80
.byte $ad, $85, $2e, $b9, $d2, $ad, $85, $2d, $a5, $2e, $8d, $06, $20, $a5, $2d, $8d ; $8D90
.byte $06, $20, $bd, $11, $ae, $8d, $07, $20, $e8, $8a, $29, $0f, $f0, $0e, $29, $03 ; $8DA0
.byte $d0, $f0, $a5, $2d, $18, $69, $20, $85, $2d, $4c, $98, $ad, $a9, $00, $85, $7f ; $8DB0
.byte $60, $77, $bb, $bb, $bb, $33, $ff, $33, $77, $dd, $ee, $ee, $ee, $cc, $ff, $cc ; $8DC0
.byte $dd, $21, $08, $21, $0c, $21, $10, $21, $14, $22, $08, $22, $0c, $22, $10, $22 ; $8DD0
.byte $14, $d2, $d3, $d4, $d5, $e2, $e3, $e4, $e5, $55, $aa, $aa, $aa, $00, $ff, $55 ; $8DE0
.byte $00, $00, $20, $10, $30, $60, $50, $70, $40, $01, $03, $02, $04, $08, $06, $05 ; $8DF0
.byte $07, $02, $04, $03, $01, $07, $05, $06, $08, $03, $04, $02, $01, $08, $07, $06 ; $8E00
.byte $05, $80, $82, $84, $86, $81, $83, $85, $fd, $a0, $a2, $a4, $a6, $87, $a3, $a5 ; $8E10
.byte $a7, $88, $8a, $8c, $8e, $87, $8b, $8d, $8f, $a8, $aa, $ac, $ae, $a9, $ab, $ad ; $8E20
.byte $af, $b0, $b2, $b4, $b6, $b1, $b3, $b5, $b7, $d0, $d2, $d4, $d6, $d1, $d3, $d5 ; $8E30
.byte $d7, $87, $ba, $bc, $87, $b9, $bb, $bd, $bf, $d8, $da, $dc, $de, $d9, $db, $dd ; $8E40
.byte $df, $87, $4a, $4c, $87, $49, $4b, $4d, $87, $68, $6a, $6c, $6e, $69, $6b, $6d ; $8E50
.byte $6f, $08, $0a, $0c, $0e, $09, $0b, $0d, $0f, $28, $2a, $2c, $2e, $29, $2b, $2d ; $8E60
.byte $2f, $00, $02, $04, $06, $01, $03, $05, $07, $20, $22, $24, $26, $21, $23, $25 ; $8E70
.byte $27, $3c, $3e, $44, $46, $3d, $3f, $45, $47, $60, $62, $64, $66, $61, $63, $65 ; $8E80
.byte $67                        ; $8E90

  lda a:_var_06a8                ; $8E91  AD A8 06
  bne _label_8e9f                ; $8E94  D0 09
  lda _var_004b                  ; $8E96  A5 4B
  bne _label_8ea4                ; $8E98  D0 0A
  lda #$00                       ; $8E9A  A9 00
  sta a:_var_06be                ; $8E9C  8D BE 06

_label_8e9f:
  rts                            ; $8E9F  60

.byte $ee, $be, $06, $60         ; $8EA0

_label_8ea4:
  lda a:_var_06be                ; $8EA4  AD BE 06
  bne _label_8e9f                ; $8EA7  D0 F6
  lda _var_001f_indexed          ; $8EA9  A5 1F
  and #$07                       ; $8EAB  29 07
  bne _label_8e9f                ; $8EAD  D0 F0
  lda _var_001f_indexed          ; $8EAF  A5 1F
  lsr a                          ; $8EB1  4A
  lsr a                          ; $8EB2  4A
  tax                            ; $8EB3  AA
  lda _var_001e                  ; $8EB4  A5 1E
  beq _label_8ebf                ; $8EB6  F0 07
  txa                            ; $8EB8  8A
  lsr a                          ; $8EB9  4A
  clc                            ; $8EBA  18
  adc #$08                       ; $8EBB  69 08
  asl a                          ; $8EBD  0A
  tax                            ; $8EBE  AA

_label_8ebf:
  lda a:_data_b04e_indexed,X     ; $8EBF  BD 4E B0
  sta _var_002d_indexed          ; $8EC2  85 2D
  lda a:_data_b04f_indexed,X     ; $8EC4  BD 4F B0
  sta _var_002e                  ; $8EC7  85 2E
  jmp (_var_002d_indexed)        ; $8EC9  6C 2D 00  jump engine detected

.byte $a5, $26, $c9, $01, $d0, $cd, $a5, $4b, $29, $02, $f0, $c7, $ee, $a2, $06, $ad ; $8ECC
.byte $a2, $06, $c9, $1c, $d0, $be, $4c, $34, $b0, $a5, $4b, $f0, $12, $ee, $a2, $06 ; $8EDC
.byte $d0, $b1, $ee, $a3, $06, $ad, $a3, $06, $c9, $05, $d0, $a7, $4c, $34, $b0, $a9 ; $8EEC
.byte $00, $8d, $a2, $06, $8d, $a3, $06, $60, $ad, $00, $02, $c9, $af, $d0, $94, $4c ; $8EFC
.byte $83, $af, $ad, $6f, $03, $c9, $41, $d0, $8a, $4c, $34, $b0, $a5, $77, $f0, $76 ; $8F0C
.byte $a5, $4b, $29, $10, $f0, $70, $ee, $a2, $06, $ad, $a2, $06, $c9, $0a, $90, $03 ; $8F1C
.byte $4c, $34, $b0, $4c, $a0, $ae, $a5, $4b, $29, $40, $f0, $12, $ee, $a3, $06, $d0 ; $8F2C
.byte $55, $ee, $a2, $06, $ad, $a2, $06, $c9, $03, $d0, $4b, $4c, $34, $b0, $a9, $00 ; $8F3C
.byte $8d, $a2, $06, $60, $ad, $a2, $06, $f0, $09, $c9, $01, $f0, $0a, $a9, $90, $4c ; $8F4C
.byte $65, $af, $a9, $90, $4c, $65, $af, $a9, $20, $85, $2d, $ad, $03, $02, $29, $f0 ; $8F5C
.byte $c5, $2d, $d0, $22, $a5, $4b, $29, $10, $f0, $1c, $ee, $a2, $06, $ad, $a2, $06 ; $8F6C
.byte $c9, $03, $d0, $12, $4c, $34, $b0, $ad, $a2, $06, $d0, $0b, $ad, $03, $02, $c9 ; $8F7C
.byte $ec, $90, $03, $ee, $a2, $06, $60, $ad, $03, $02, $c9, $05, $b0, $f8, $4c, $34 ; $8F8C
.byte $b0, $a5, $77, $f0, $f1, $4c, $cd, $af, $ad, $00, $02, $c9, $9f, $d0, $e7, $ad ; $8F9C
.byte $03, $02, $c9, $04, $d0, $e0, $4c, $34, $b0, $a5, $4b, $29, $10, $f0, $d7, $ee ; $8FAC
.byte $a3, $06, $d0, $d2, $ee, $a2, $06, $ad, $a2, $06, $c9, $02, $d0, $c8, $4c, $34 ; $8FBC
.byte $b0, $a5, $4b, $29, $20, $f0, $7a, $ee, $a3, $06, $d0, $75, $ee, $a2, $06, $ad ; $8FCC
.byte $a2, $06, $c9, $02, $d0, $6b, $4c, $34, $b0, $a5, $4b, $29, $80, $f0, $62, $ee ; $8FDC
.byte $a3, $06, $d0, $5d, $ee, $a2, $06, $ad, $a2, $06, $c9, $02, $d0, $53, $4c, $34 ; $8FEC
.byte $b0, $a5, $77, $f0, $4c, $4c, $e5, $af ; $8FFC

  lda a:_var_06a2                ; $9004  AD A2 06
  beq _label_9012                ; $9007  F0 09
  cmp #$01                       ; $9009  C9 01
  beq _label_9017                ; $900B  F0 0A
  lda #$60                       ; $900D  A9 60
  jmp _label_b019                ; $900F  4C 19 B0

_label_9012:
  lda #$20                       ; $9012  A9 20
  jmp _label_b019                ; $9014  4C 19 B0

_label_9017:
  lda #$40                       ; $9017  A9 40
  sta _var_002d_indexed          ; $9019  85 2D
  lda a:_var_0203_indexed        ; $901B  AD 03 02
  and #$F0                       ; $901E  29 F0
  cmp _var_002d_indexed          ; $9020  C5 2D
  bne _label_904d                ; $9022  D0 29
  lda _var_004b                  ; $9024  A5 4B
  and #$10                       ; $9026  29 10
  beq _label_904d                ; $9028  F0 23
  inc a:_var_06a2                ; $902A  EE A2 06
  lda a:_var_06a2                ; $902D  AD A2 06
  cmp #$03                       ; $9030  C9 03
  bne _label_904d                ; $9032  D0 19
  inc a:_var_06be                ; $9034  EE BE 06
  lda _var_001f_indexed          ; $9037  A5 1F
  lsr a                          ; $9039  4A
  lsr a                          ; $903A  4A
  lsr a                          ; $903B  4A
  sta _var_007f                  ; $903C  85 7F
  lda _var_001e                  ; $903E  A5 1E
  beq _label_904a                ; $9040  F0 08
  ldx _var_007f                  ; $9042  A6 7F
  dex                            ; $9044  CA
  lda a:_data_ae08_indexed+1,X   ; $9045  BD 09 AE
  sta _var_007f                  ; $9048  85 7F

_label_904a:
  inc a:_var_06a8                ; $904A  EE A8 06

_label_904d:
  rts                            ; $904D  60

.byte $4d, $b0, $04, $b0, $e5, $af, $fd, $af, $cd, $af, $b5, $af, $a4, $af, $9d, $af ; $904E
.byte $83, $af, $50, $af, $32, $af, $18, $af, $b5, $af, $0e, $af, $04, $af, $e5, $ae ; $905E
.byte $cc, $ae, $ad, $a5, $06, $d0, $17, $a9, $f7, $8d, $00, $02, $a9, $c0, $8d, $03 ; $906E
.byte $02, $a9, $00, $8d, $a2, $06, $8d, $a3, $06, $e6, $67, $ee, $a5, $06, $ad, $a3 ; $907E
.byte $06, $c9, $04, $b0, $1b, $ad, $00, $02, $c9, $78, $b0, $28, $ee, $a2, $06, $d0 ; $908E
.byte $2b, $ee, $a3, $06, $ad, $a3, $06, $c9, $04, $d0, $21, $a9, $01, $4c, $c5, $b0 ; $909E
.byte $a5, $65, $d0, $10, $ee, $a2, $06, $d0, $13, $ee, $a3, $06, $ad, $a3, $06, $c9 ; $90AE
.byte $08, $d0, $09, $60, $ad, $14, $01, $85, $32, $20, $00, $c0, $20, $fb, $b0, $60 ; $90BE

  lda _var_001f_indexed          ; $90CE  A5 1F
  cmp #$81                       ; $90D0  C9 81
  beq _label_90d5                ; $90D2  F0 01

_label_90d4:
  rts                            ; $90D4  60

_label_90d5:
  lda _var_007e                  ; $90D5  A5 7E
  bne _label_90d4                ; $90D7  D0 FB
  lda a:$06A5                    ; $90D9  AD A5 06
  bne _label_90ec                ; $90DC  D0 0E
  lda a:_var_06aa                ; $90DE  AD AA 06
  cmp #$05                       ; $90E1  C9 05
  bne _label_90d4                ; $90E3  D0 EF
  lda _var_004b                  ; $90E5  A5 4B
  beq _label_90d4                ; $90E7  F0 EB
  jmp _label_b15d                ; $90E9  4C 5D B1

_label_90ec:
  asl a                          ; $90EC  0A
  tax                            ; $90ED  AA
  lda a:_data_b144_indexed+1,X   ; $90EE  BD 45 B1
  sta _var_002d_indexed          ; $90F1  85 2D
  lda a:_data_b146_indexed,X     ; $90F3  BD 46 B1
  sta _var_002e                  ; $90F6  85 2E
  jmp (_var_002d_indexed)        ; $90F8  6C 2D 00  jump engine detected

.byte $a5, $50, $29, $10, $f0, $0f, $a9, $02, $8d, $4f, $02, $a9, $fa, $8d, $4e, $02 ; $90FB
.byte $a9, $ca, $4c, $1c, $b1, $a9, $42, $8d, $4f, $02, $a9, $ca, $8d, $4e, $02, $a9 ; $910B
.byte $fa, $8d, $51, $02, $a9, $00, $8d, $52, $02, $ad, $00, $02, $38, $e9, $0e, $8d ; $911B
.byte $4d, $02, $ad, $03, $02, $8d, $50, $02, $a5, $50, $29, $04, $d0, $04, $a9, $10 ; $912B
.byte $d0, $02, $a9, $11, $85, $32, $20, $03, $c0, $60, $5d, $b1, $5d, $b1, $77, $b1 ; $913B
.byte $88, $b1, $ad, $b1, $77, $b1, $88, $b1, $c2, $b1, $08, $b2, $ee, $a5, $06, $4c ; $914B
.byte $fb, $b0, $ad, $00, $02, $c9, $2f, $f0, $f3, $38, $ed, $14, $01, $8d, $00, $02 ; $915B
.byte $a9, $01, $8d, $a5, $06, $85, $67, $85, $24, $4c, $fb, $b0, $ad, $03, $02, $c9 ; $916B
.byte $40, $f0, $d9, $38, $ed, $14, $01, $8d, $03, $02, $4c, $fb, $b0, $a9, $00, $85 ; $917B
.byte $67, $ad, $03, $02, $c9, $c0, $f0, $c4, $ad, $03, $02, $29, $1f, $f0, $0d, $ad ; $918B
.byte $03, $02, $18, $6d, $14, $01, $8d, $03, $02, $4c, $fb, $b0, $20, $09, $b2, $4c ; $919B
.byte $fb, $b0, $ad, $00, $02, $c9, $6f, $f0, $a3, $18, $6d, $14, $01, $8d, $00, $02 ; $91AB
.byte $a9, $01, $85, $67, $4c, $fb, $b0, $ad, $a6, $06, $c9, $08, $d0, $1d, $ad, $00 ; $91BB
.byte $02, $c9, $f7, $f0, $0a, $38, $ed, $14, $01, $8d, $00, $02, $4c, $fb, $b0, $a9 ; $91CB
.byte $82, $85, $1f, $a9, $00, $85, $8e, $8d, $a3, $06, $60, $a9, $ef, $8d, $4d, $02 ; $91DB
.byte $8d, $4e, $02, $ad, $00, $02, $c9, $cf, $b0, $0a, $18, $6d, $10, $01, $8d, $00 ; $91EB
.byte $02, $4c, $33, $b1, $e6, $85, $a9, $01, $85, $26, $ee, $a5, $06, $60, $a5, $4b ; $91FB
.byte $d0, $05, $a9, $00, $85, $24, $60, $a5, $24, $d0, $6d, $a5, $4b, $29, $10, $f0 ; $920B
.byte $12, $ee, $a3, $06, $ad, $a3, $06, $c9, $09, $d0, $56, $a9, $01, $8d, $a3, $06 ; $921B
.byte $4c, $7c, $b2, $a5, $4b, $29, $20, $f0, $14, $ce, $a3, $06, $ad, $a3, $06, $f0 ; $922B
.byte $04, $c9, $ff, $d0, $3c, $a9, $08, $8d, $a3, $06, $4c, $7c, $b2, $a5, $4b, $29 ; $923B
.byte $03, $f0, $35, $a5, $1e, $f0, $0e, $ae, $a2, $06, $bd, $01, $ae, $cd, $a3, $06 ; $924B
.byte $d0, $11, $4c, $6b, $b2, $ae, $a2, $06, $bd, $f9, $ad, $cd, $a3, $06, $d0, $03 ; $925B
.byte $ee, $a6, $06, $ee, $03, $02, $ee, $a2, $06, $ad, $a2, $06, $c9, $09, $90, $06 ; $926B
.byte $60, $ad, $a3, $06, $85, $7f, $e6, $24, $60 ; $927B

  lda _var_008e                  ; $9284  A5 8E
  beq _label_9289                ; $9286  F0 01
  rts                            ; $9288  60

_label_9289:
  lda #$06                       ; $9289  A9 06
  sta PPU_MASK                   ; $928B  8D 01 20
  lda #$30                       ; $928E  A9 30
  sta PPU_CTRL                   ; $9290  8D 00 20
  jsr _func_c009                 ; $9293  20 09 C0
  jsr _func_c006                 ; $9296  20 06 C0
  lda #$01                       ; $9299  A9 01
  sta _var_007c                  ; $929B  85 7C
  ldx #$07                       ; $929D  A2 07

_label_929f:
  stx a:_data_8000               ; $929F  8E 00 80
  lda a:_data_b3f6_indexed+1,X   ; $92A2  BD F7 B3
  sta a:_data_8000+1             ; $92A5  8D 01 80
  dex                            ; $92A8  CA
  bpl _label_929f                ; $92A9  10 F4
  lda #$00                       ; $92AB  A9 00
  sta _var_007d                  ; $92AD  85 7D
  sta _var_0099                  ; $92AF  85 99
  sta _var_0032                  ; $92B1  85 32
  sta _var_00ec                  ; $92B3  85 EC
  sta _var_00ef                  ; $92B5  85 EF
  lda #$20                       ; $92B7  A9 20
  sta _var_009a                  ; $92B9  85 9A
  ldx #$00                       ; $92BB  A2 00
  lda _var_001f_indexed          ; $92BD  A5 1F
  cmp #$81                       ; $92BF  C9 81
  beq _label_92d6                ; $92C1  F0 13
  cmp #$82                       ; $92C3  C9 82
  beq _label_92e9                ; $92C5  F0 22
  and #$07                       ; $92C7  29 07
  bne _label_930b                ; $92C9  D0 40
  lda _var_001f_indexed          ; $92CB  A5 1F
  cmp #$21                       ; $92CD  C9 21
  bcs _label_92d6                ; $92CF  B0 05
  lda #$08                       ; $92D1  A9 08
  jmp _label_b2d8                ; $92D3  4C D8 B2

_label_92d6:
  lda #$10                       ; $92D6  A9 10
  sta _var_007d                  ; $92D8  85 7D
  lda #$00                       ; $92DA  A9 00
  sta _var_00eb                  ; $92DC  85 EB
  lda _var_001f_indexed          ; $92DE  A5 1F
  cmp #$81                       ; $92E0  C9 81
  bne _label_92fb                ; $92E2  D0 17
  lda #$48                       ; $92E4  A9 48
  jmp _label_b2fd                ; $92E6  4C FD B2

_label_92e9:
  lda #$18                       ; $92E9  A9 18
  sta _var_007d                  ; $92EB  85 7D
  lda _var_001e                  ; $92ED  A5 1E
  bne _label_92f6                ; $92EF  D0 05
  lda #$50                       ; $92F1  A9 50
  jmp _label_b2fd                ; $92F3  4C FD B2

_label_92f6:
  lda #$68                       ; $92F6  A9 68
  jmp _label_b2fd                ; $92F8  4C FD B2

_label_92fb:
  lda _var_001f_indexed          ; $92FB  A5 1F
  and #$F8                       ; $92FD  29 F8
  asl a                          ; $92FF  0A
  asl a                          ; $9300  0A
  rol _var_00ef                  ; $9301  26 EF
  asl a                          ; $9303  0A
  rol _var_00ef                  ; $9304  26 EF
  sta _var_00ec                  ; $9306  85 EC
  jmp _label_b328                ; $9308  4C 28 B3

_label_930b:
  lda _var_0032                  ; $930B  A5 32
  beq _label_9328                ; $930D  F0 19
  ldx #$00                       ; $930F  A2 00
  lda _var_001f_indexed          ; $9311  A5 1F
  cmp #$82                       ; $9313  C9 82
  bne _label_931e                ; $9315  D0 07
  lda _var_001e                  ; $9317  A5 1E
  clc                            ; $9319  18
  adc #$01                       ; $931A  69 01
  asl a                          ; $931C  0A
  tax                            ; $931D  AA

_label_931e:
  lda a:_data_b3ff_indexed,X     ; $931E  BD FF B3
  sta _var_00ef                  ; $9321  85 EF
  lda a:_data_b3ff_indexed+1,X   ; $9323  BD 00 B4
  sta _var_00ec                  ; $9326  85 EC

_label_9328:
  ldx #$00                       ; $9328  A2 00
  lda _var_00ef                  ; $932A  A5 EF
  sta PPU_ADDR                   ; $932C  8D 06 20
  lda _var_00ec                  ; $932F  A5 EC
  sta PPU_ADDR                   ; $9331  8D 06 20
  lda PPU_DATA                   ; $9334  AD 07 20

_label_9337:
  lda PPU_DATA                   ; $9337  AD 07 20
  sta a:_var_0400_indexed,X      ; $933A  9D 00 04
  inx                            ; $933D  E8
  cpx #$40                       ; $933E  E0 40
  bne _label_9337                ; $9340  D0 F5
  ldx #$00                       ; $9342  A2 00
  txa                            ; $9344  8A
  lda #$00                       ; $9345  A9 00
  sta _var_00ef                  ; $9347  85 EF
  lda a:_var_0400_indexed,X      ; $9349  BD 00 04
  asl a                          ; $934C  0A
  rol _var_00ef                  ; $934D  26 EF
  asl a                          ; $934F  0A
  rol _var_00ef                  ; $9350  26 EF
  asl a                          ; $9352  0A
  rol _var_00ef                  ; $9353  26 EF
  asl a                          ; $9355  0A
  rol _var_00ef                  ; $9356  26 EF
  sta _var_00ec                  ; $9358  85 EC
  lda _var_00ef                  ; $935A  A5 EF
  clc                            ; $935C  18
  adc #$04                       ; $935D  69 04
  sta _var_00ef                  ; $935F  85 EF
  ldy #$00                       ; $9361  A0 00
  lda _var_00ef                  ; $9363  A5 EF
  sta PPU_ADDR                   ; $9365  8D 06 20
  lda _var_00ec                  ; $9368  A5 EC
  sta PPU_ADDR                   ; $936A  8D 06 20
  lda PPU_DATA                   ; $936D  AD 07 20

_label_9370:
  lda PPU_DATA                   ; $9370  AD 07 20
  sta a:_var_0480_indexed,Y      ; $9373  99 80 04
  iny                            ; $9376  C8
  cpy #$10                       ; $9377  C0 10
  bne _label_9370                ; $9379  D0 F5
  ldy #$00                       ; $937B  A0 00
  lda _var_009a                  ; $937D  A5 9A
  sta PPU_ADDR                   ; $937F  8D 06 20
  lda _var_0099                  ; $9382  A5 99

_data_9384:
  sta PPU_ADDR                   ; $9384  8D 06 20

_label_9387:
  lda a:_var_0480_indexed,Y      ; $9387  B9 80 04
  sta PPU_DATA                   ; $938A  8D 07 20
  iny                            ; $938D  C8
  tya                            ; $938E  98
  and #$03                       ; $938F  29 03
  bne _label_9387                ; $9391  D0 F4
  tya                            ; $9393  98
  and #$0F                       ; $9394  29 0F
  beq _label_93a2                ; $9396  F0 0A
  lda _var_0099                  ; $9398  A5 99
  clc                            ; $939A  18
  adc #$20                       ; $939B  69 20
  sta _var_0099                  ; $939D  85 99
  jmp _label_b37d                ; $939F  4C 7D B3

_label_93a2:
  txa                            ; $93A2  8A
  and #$0F                       ; $93A3  29 0F
  cmp #$07                       ; $93A5  C9 07
  beq _label_93de                ; $93A7  F0 35
  cmp #$0F                       ; $93A9  C9 0F
  bne _label_93d3                ; $93AB  D0 26
  cpx #$3F                       ; $93AD  E0 3F
  bne _label_93c9                ; $93AF  D0 18
  lda _var_009a                  ; $93B1  A5 9A
  clc                            ; $93B3  18
  adc #$04                       ; $93B4  69 04
  sta _var_009a                  ; $93B6  85 9A
  inc _var_0032                  ; $93B8  E6 32
  lda _var_0032                  ; $93BA  A5 32
  cmp #$02                       ; $93BC  C9 02
  beq _label_93e6                ; $93BE  F0 26
  lda #$00                       ; $93C0  A9 00
  sta _var_0099                  ; $93C2  85 99
  inc _var_009a                  ; $93C4  E6 9A
  jmp _data_b30b_indexed         ; $93C6  4C 0B B3

_label_93c9:
  inc _var_009a                  ; $93C9  E6 9A
  lda #$00                       ; $93CB  A9 00
  sta _var_0099                  ; $93CD  85 99
  inx                            ; $93CF  E8
  jmp _label_b344                ; $93D0  4C 44 B3

_label_93d3:
  lda _var_0099                  ; $93D3  A5 99
  sec                            ; $93D5  38
  sbc #$5C                       ; $93D6  E9 5C
  sta _var_0099                  ; $93D8  85 99
  inx                            ; $93DA  E8
  jmp _label_b344                ; $93DB  4C 44 B3

_label_93de:
  lda #$80                       ; $93DE  A9 80
  sta _var_0099                  ; $93E0  85 99
  inx                            ; $93E2  E8
  jmp _label_b344                ; $93E3  4C 44 B3

_label_93e6:
  lda #$00                       ; $93E6  A9 00
  sta _var_009a                  ; $93E8  85 9A
  sta _var_0099                  ; $93EA  85 99
  ldx #$00                       ; $93EC  A2 00

_label_93ee:
  lda #$00                       ; $93EE  A9 00
  sta a:_var_0400_indexed,X      ; $93F0  9D 00 04
  inx                            ; $93F3  E8
  bne _label_93ee                ; $93F4  D0 F8
  rts                            ; $93F6  60

.byte $2c, $2e, $3c, $3d, $3e, $3f, $0d, $0c, $03, $c0, $02, $c0, $03, $00 ; $93F7

  lda _var_008e                  ; $9405  A5 8E
  beq _label_940a                ; $9407  F0 01
  rts                            ; $9409  60

_label_940a:
  lda _var_001e                  ; $940A  A5 1E
  bne _label_9415                ; $940C  D0 07

_label_940e:
  lda _var_001f_indexed          ; $940E  A5 1F
  sta a:_var_0374                ; $9410  8D 74 03
  bne _label_9421                ; $9413  D0 0C

_label_9415:
  lda _var_001f_indexed          ; $9415  A5 1F
  cmp #$81                       ; $9417  C9 81
  bcs _label_940e                ; $9419  B0 F3
  clc                            ; $941B  18
  adc #$40                       ; $941C  69 40
  sta a:_var_0374                ; $941E  8D 74 03

_label_9421:
  lda a:_var_0374                ; $9421  AD 74 03
  cmp #$5E                       ; $9424  C9 5E
  bcs _label_9439                ; $9426  B0 11
  ldx #$07                       ; $9428  A2 07

_label_942a:
  stx a:_data_8000               ; $942A  8E 00 80
  lda a:_data_b4c4_indexed+1,X   ; $942D  BD C5 B4
  sta a:_data_8000+1             ; $9430  8D 01 80
  dex                            ; $9433  CA
  bpl _label_942a                ; $9434  10 F4
  jmp _label_b447                ; $9436  4C 47 B4

_label_9439:
  ldx #$07                       ; $9439  A2 07

_label_943b:
  stx a:_data_8000               ; $943B  8E 00 80
  lda a:_data_b4cb_indexed+2,X   ; $943E  BD CD B4
  sta a:_data_8000+1             ; $9441  8D 01 80
  dex                            ; $9444  CA
  bpl _label_943b                ; $9445  10 F4
  lda #$00                       ; $9447  A9 00
  sta _var_00ec                  ; $9449  85 EC
  sta _var_00ef                  ; $944B  85 EF
  lda a:_var_0374                ; $944D  AD 74 03
  cmp #$5E                       ; $9450  C9 5E
  bcs _label_9468                ; $9452  B0 14
  tax                            ; $9454  AA
  dex                            ; $9455  CA

_label_9456:
  lda _var_00ec                  ; $9456  A5 EC
  clc                            ; $9458  18
  adc a:_data_b4d5_indexed,X     ; $9459  7D D5 B4
  sta _var_00ec                  ; $945C  85 EC
  bcc _label_9462                ; $945E  90 02
  inc _var_00ef                  ; $9460  E6 EF

_label_9462:
  dex                            ; $9462  CA
  bpl _label_9456                ; $9463  10 F1
  jmp _label_b47c                ; $9465  4C 7C B4

_label_9468:
  sec                            ; $9468  38
  sbc #$5D                       ; $9469  E9 5D
  tax                            ; $946B  AA
  dex                            ; $946C  CA

_label_946d:
  lda _var_00ec                  ; $946D  A5 EC
  clc                            ; $946F  18
  adc a:_data_b532_indexed+1,X   ; $9470  7D 33 B5
  sta _var_00ec                  ; $9473  85 EC
  bcc _label_9479                ; $9475  90 02
  inc _var_00ef                  ; $9477  E6 EF

_label_9479:
  dex                            ; $9479  CA
  bpl _label_946d                ; $947A  10 F1
  lda _var_00ef                  ; $947C  A5 EF
  sta PPU_ADDR                   ; $947E  8D 06 20
  lda _var_00ec                  ; $9481  A5 EC
  sta PPU_ADDR                   ; $9483  8D 06 20
  lda PPU_DATA                   ; $9486  AD 07 20
  lda #$00                       ; $9489  A9 00
  sta _var_0032                  ; $948B  85 32

_label_948d:
  lda _var_0032                  ; $948D  A5 32
  asl a                          ; $948F  0A
  tax                            ; $9490  AA
  lda a:_data_b4bb_indexed,X     ; $9491  BD BB B4
  sta _var_002d_indexed          ; $9494  85 2D
  lda a:_data_b4bc_indexed,X     ; $9496  BD BC B4
  sta _var_002e                  ; $9499  85 2E
  lda PPU_DATA                   ; $949B  AD 07 20
  cmp #$FF                       ; $949E  C9 FF
  beq _label_94ab                ; $94A0  F0 09
  tay                            ; $94A2  A8
  lda PPU_DATA                   ; $94A3  AD 07 20
  sta (_var_002d_indexed),Y      ; $94A6  91 2D
  jmp _label_b49b                ; $94A8  4C 9B B4

_label_94ab:
  lda _var_0032                  ; $94AB  A5 32
  bne _label_94b2                ; $94AD  D0 03
  jsr _data_b924_indexed         ; $94AF  20 24 B9

_label_94b2:
  inc _var_0032                  ; $94B2  E6 32
  lda _var_0032                  ; $94B4  A5 32
  cmp #$05                       ; $94B6  C9 05
  bne _label_948d                ; $94B8  D0 D3
  rts                            ; $94BA  60

.byte $00, $04, $00, $04, $80, $04, $00, $05, $80, $05, $20, $22, $24, $25, $26, $27 ; $94BB
.byte $0d, $0c, $28, $2a, $24, $25, $26, $27, $0d, $0c, $00, $11, $25, $21, $1b, $27 ; $94CB
.byte $35, $21, $0f, $25, $21, $29, $17, $27, $23, $15, $11, $89, $1f, $43, $57, $a9 ; $94DB
.byte $1f, $6f, $13, $8f, $7f, $5b, $3b, $67, $7f, $27, $11, $9b, $91, $83, $55, $97 ; $94EB
.byte $af, $6b, $19, $65, $5d, $57, $81, $d5, $ab, $37, $13, $51, $5b, $35, $95, $71 ; $94FB
.byte $2d, $7f, $13, $b3, $6d, $57, $57, $77, $73, $b1, $15, $7f, $81, $83, $0f, $6b ; $950B
.byte $3d, $cb, $0f, $7d, $39, $a7, $29, $23, $23, $63, $11, $69, $1d, $41, $7d, $9b ; $951B
.byte $8f, $7d, $13, $43, $23, $73, $7d, $71, $00, $89, $87, $11, $45, $6f, $23, $97 ; $952B
.byte $ab, $b3, $39, $19, $9f, $b9, $89, $6d, $8f, $3b, $6b, $13, $65, $6f, $95, $57 ; $953B
.byte $45, $71, $a3, $13, $51, $b5, $6f, $59, $df, $5d, $f7, $15, $07, $05 ; $954B

  lda _var_008e                  ; $9559  A5 8E
  beq _label_955e                ; $955B  F0 01
  rts                            ; $955D  60

_label_955e:
  lda #$FF                       ; $955E  A9 FF
  sta _var_0052                  ; $9560  85 52

_label_9562:
  inc _var_0052                  ; $9562  E6 52
  lda _var_0052                  ; $9564  A5 52
  cmp #$05                       ; $9566  C9 05
  bne _label_9570                ; $9568  D0 06
  lda #$00                       ; $956A  A9 00
  sta PPU_MASK                   ; $956C  8D 01 20
  rts                            ; $956F  60

_label_9570:
  lda _var_0052                  ; $9570  A5 52
  asl a                          ; $9572  0A
  tax                            ; $9573  AA
  lda a:_data_b6ee_indexed+1,X   ; $9574  BD EF B6
  sta _var_0031_indexed          ; $9577  85 31
  lda a:_data_b6ee_indexed+2,X   ; $9579  BD F0 B6
  sta _var_0032                  ; $957C  85 32
  ldy #$00                       ; $957E  A0 00
  cpy #$7C                       ; $9580  C0 7C
  beq _label_9562                ; $9582  F0 DE
  cpy #$3C                       ; $9584  C0 3C
  bcc _label_958f                ; $9586  90 07
  lda #$20                       ; $9588  A9 20
  sta _var_002d_indexed          ; $958A  85 2D
  jmp _label_b593                ; $958C  4C 93 B5

_label_958f:
  lda #$28                       ; $958F  A9 28
  sta _var_002d_indexed          ; $9591  85 2D
  tya                            ; $9593  98
  and #$30                       ; $9594  29 30
  lsr a                          ; $9596  4A
  lsr a                          ; $9597  4A
  lsr a                          ; $9598  4A
  lsr a                          ; $9599  4A
  clc                            ; $959A  18
  adc _var_002d_indexed          ; $959B  65 2D
  sta _var_002d_indexed          ; $959D  85 2D
  tya                            ; $959F  98
  and #$0C                       ; $95A0  29 0C
  asl a                          ; $95A2  0A
  asl a                          ; $95A3  0A
  asl a                          ; $95A4  0A
  asl a                          ; $95A5  0A
  sta _var_002e                  ; $95A6  85 2E
  tya                            ; $95A8  98
  and #$03                       ; $95A9  29 03
  asl a                          ; $95AB  0A
  asl a                          ; $95AC  0A
  asl a                          ; $95AD  0A
  clc                            ; $95AE  18
  adc _var_002e                  ; $95AF  65 2E
  sta _var_002e                  ; $95B1  85 2E
  lda _var_0052                  ; $95B3  A5 52
  beq _label_95cc                ; $95B5  F0 15
  cmp #$01                       ; $95B7  C9 01
  beq _label_95ce                ; $95B9  F0 13
  cmp #$02                       ; $95BB  C9 02
  beq _label_95cc                ; $95BD  F0 0D
  cmp #$03                       ; $95BF  C9 03
  beq _label_95c5                ; $95C1  F0 02
  inc _var_002e                  ; $95C3  E6 2E

_label_95c5:
  lda _var_002e                  ; $95C5  A5 2E
  clc                            ; $95C7  18
  adc #$1F                       ; $95C8  69 1F
  sta _var_002e                  ; $95CA  85 2E

_label_95cc:
  inc _var_002e                  ; $95CC  E6 2E

_label_95ce:
  lda #$00                       ; $95CE  A9 00
  tax                            ; $95D0  AA
  sta _var_002f_indexed          ; $95D1  85 2F
  lda (_var_0031_indexed),Y      ; $95D3  B1 31
  and #$C0                       ; $95D5  29 C0
  beq _label_95e4                ; $95D7  F0 0B
  cmp #$40                       ; $95D9  C9 40
  beq _label_9635                ; $95DB  F0 58
  cmp #$80                       ; $95DD  C9 80
  beq _label_9634                ; $95DF  F0 53
  jmp _label_b633                ; $95E1  4C 33 B6

_label_95e4:
  inc _var_002f_indexed          ; $95E4  E6 2F
  inc _var_002e                  ; $95E6  E6 2E
  inc _var_002e                  ; $95E8  E6 2E
  ldx #$00                       ; $95EA  A2 00
  lda (_var_0031_indexed),Y      ; $95EC  B1 31
  and #$30                       ; $95EE  29 30
  beq _label_95fd                ; $95F0  F0 0B
  cmp #$10                       ; $95F2  C9 10
  beq _label_9635                ; $95F4  F0 3F
  cmp #$20                       ; $95F6  C9 20
  beq _label_9634                ; $95F8  F0 3A
  jmp _label_b633                ; $95FA  4C 33 B6

_label_95fd:
  inc _var_002f_indexed          ; $95FD  E6 2F
  inc _var_002e                  ; $95FF  E6 2E
  inc _var_002e                  ; $9601  E6 2E
  ldx #$00                       ; $9603  A2 00
  lda (_var_0031_indexed),Y      ; $9605  B1 31
  and #$0C                       ; $9607  29 0C
  beq _label_9616                ; $9609  F0 0B
  cmp #$04                       ; $960B  C9 04
  beq _label_9635                ; $960D  F0 26
  cmp #$08                       ; $960F  C9 08
  beq _label_9634                ; $9611  F0 21
  jmp _label_b633                ; $9613  4C 33 B6

_label_9616:
  inc _var_002f_indexed          ; $9616  E6 2F
  inc _var_002e                  ; $9618  E6 2E
  inc _var_002e                  ; $961A  E6 2E
  ldx #$00                       ; $961C  A2 00
  lda (_var_0031_indexed),Y      ; $961E  B1 31
  and #$03                       ; $9620  29 03
  beq _label_962f                ; $9622  F0 0B
  cmp #$01                       ; $9624  C9 01
  beq _label_9635                ; $9626  F0 0D
  cmp #$02                       ; $9628  C9 02
  beq _label_9634                ; $962A  F0 08
  jmp _label_b633                ; $962C  4C 33 B6

_label_962f:
  iny                            ; $962F  C8
  jmp _label_b580                ; $9630  4C 80 B5
  inx                            ; $9633  E8

_label_9634:
  inx                            ; $9634  E8

_label_9635:
  txa                            ; $9635  8A
  asl a                          ; $9636  0A
  asl a                          ; $9637  0A
  tax                            ; $9638  AA
  lda _var_0052                  ; $9639  A5 52
  beq _label_9654                ; $963B  F0 17
  lda a:_data_b6f8_indexed+1,X   ; $963D  BD F9 B6
  sta _var_0057                  ; $9640  85 57
  lda a:_data_b6fa_indexed,X     ; $9642  BD FA B6
  sta _var_0058                  ; $9645  85 58
  lda a:_data_b6fa_indexed+1,X   ; $9647  BD FB B6
  sta _var_0059                  ; $964A  85 59
  lda a:_data_b6fa_indexed+2,X   ; $964C  BD FC B6
  sta _var_005a                  ; $964F  85 5A
  jmp _label_b668                ; $9651  4C 68 B6

_label_9654:
  lda a:_data_b705_indexed,X     ; $9654  BD 05 B7
  sta _var_0057                  ; $9657  85 57
  lda a:_data_b705_indexed+1,X   ; $9659  BD 06 B7
  sta _var_0058                  ; $965C  85 58
  lda a:_data_b707_indexed,X     ; $965E  BD 07 B7
  sta _var_0059                  ; $9661  85 59
  lda a:_data_b707_indexed+1,X   ; $9663  BD 08 B7
  sta _var_005a                  ; $9666  85 5A
  lda _var_0057                  ; $9668  A5 57
  bne _label_966e                ; $966A  D0 02
  inc _var_002e                  ; $966C  E6 2E

_label_966e:
  lda _var_002d_indexed          ; $966E  A5 2D
  sta PPU_ADDR                   ; $9670  8D 06 20
  lda _var_002e                  ; $9673  A5 2E
  sta PPU_ADDR                   ; $9675  8D 06 20
  lda _var_0057                  ; $9678  A5 57
  beq _label_967f                ; $967A  F0 03
  sta PPU_DATA                   ; $967C  8D 07 20

_label_967f:
  lda _var_0058                  ; $967F  A5 58
  beq _label_968c                ; $9681  F0 09
  sta PPU_DATA                   ; $9683  8D 07 20
  lda _var_0057                  ; $9686  A5 57
  bne _label_968c                ; $9688  D0 02
  dec _var_002e                  ; $968A  C6 2E

_label_968c:
  lda _var_002e                  ; $968C  A5 2E
  clc                            ; $968E  18
  adc #$20                       ; $968F  69 20
  sta _var_002e                  ; $9691  85 2E
  bcc _label_9697                ; $9693  90 02
  inc _var_002d_indexed          ; $9695  E6 2D

_label_9697:
  lda _var_0052                  ; $9697  A5 52
  cmp #$03                       ; $9699  C9 03
  bcc _label_96b5                ; $969B  90 18
  cpy #$38                       ; $969D  C0 38
  bcc _label_96b5                ; $969F  90 14
  cpy #$3C                       ; $96A1  C0 3C
  bcs _label_96b5                ; $96A3  B0 10
  lda #$20                       ; $96A5  A9 20
  sta PPU_ADDR                   ; $96A7  8D 06 20
  lda _var_002e                  ; $96AA  A5 2E
  sec                            ; $96AC  38
  sbc #$C0                       ; $96AD  E9 C0
  sta PPU_ADDR                   ; $96AF  8D 06 20
  jmp _label_b6bf                ; $96B2  4C BF B6

_label_96b5:
  lda _var_002d_indexed          ; $96B5  A5 2D
  sta PPU_ADDR                   ; $96B7  8D 06 20
  lda _var_002e                  ; $96BA  A5 2E
  sta PPU_ADDR                   ; $96BC  8D 06 20
  lda _var_0059                  ; $96BF  A5 59
  beq _label_96cb                ; $96C1  F0 08
  sta PPU_DATA                   ; $96C3  8D 07 20
  lda _var_005a                  ; $96C6  A5 5A
  sta PPU_DATA                   ; $96C8  8D 07 20

_label_96cb:
  lda _var_002e                  ; $96CB  A5 2E
  sec                            ; $96CD  38
  sbc #$20                       ; $96CE  E9 20
  sta _var_002e                  ; $96D0  85 2E
  bcs _label_96d6                ; $96D2  B0 02
  dec _var_002d_indexed          ; $96D4  C6 2D

_label_96d6:
  lda _var_002f_indexed          ; $96D6  A5 2F
  beq _label_96e6                ; $96D8  F0 0C
  cmp #$01                       ; $96DA  C9 01
  beq _label_96e9                ; $96DC  F0 0B
  cmp #$02                       ; $96DE  C9 02
  beq _label_96ec                ; $96E0  F0 0A
  iny                            ; $96E2  C8
  jmp _label_b580                ; $96E3  4C 80 B5

_label_96e6:
  jmp _label_b5e4                ; $96E6  4C E4 B5

_label_96e9:
  jmp _label_b5fd                ; $96E9  4C FD B5

_label_96ec:
  jmp _label_b616                ; $96EC  4C 16 B6

.byte $80, $03, $00, $04, $80, $04, $80, $05, $00, $05, $30, $00, $35, $33, $00, $32 ; $96EF
.byte $31, $34, $38, $f6, $00, $00, $f4, $f5, $fa, $fb, $40, $41, $42, $43, $f8, $f9 ; $96FF
.byte $fa, $fb                   ; $970F

  lda _var_008e                  ; $9711  A5 8E
  beq _label_9716                ; $9713  F0 01
  rts                            ; $9715  60

_label_9716:
  ldy #$00                       ; $9716  A0 00
  lda _var_001f_indexed          ; $9718  A5 1F
  cmp #$81                       ; $971A  C9 81
  bcs _label_972d                ; $971C  B0 0F
  lda _var_001e                  ; $971E  A5 1E
  bne _label_9726                ; $9720  D0 04
  lda _var_001f_indexed          ; $9722  A5 1F
  bne _label_972f                ; $9724  D0 09

_label_9726:
  lda _var_001f_indexed          ; $9726  A5 1F
  clc                            ; $9728  18
  adc #$40                       ; $9729  69 40
  bne _label_972f                ; $972B  D0 02

_label_972d:
  lda #$80                       ; $972D  A9 80

_label_972f:
  sec                            ; $972F  38
  sbc #$01                       ; $9730  E9 01
  asl a                          ; $9732  0A
  tax                            ; $9733  AA
  lda a:_data_a02a_indexed,X     ; $9734  BD 2A A0
  sta _var_002d_indexed          ; $9737  85 2D
  lda a:_data_a02a_indexed+1,X   ; $9739  BD 2B A0
  sta _var_002e                  ; $973C  85 2E
  lda (_var_002d_indexed),Y      ; $973E  B1 2D
  and #$C0                       ; $9740  29 C0
  clc                            ; $9742  18
  rol a                          ; $9743  2A
  rol a                          ; $9744  2A
  rol a                          ; $9745  2A
  sta _var_00aa                  ; $9746  85 AA
  lda (_var_002d_indexed),Y      ; $9748  B1 2D
  and #$30                       ; $974A  29 30
  lsr a                          ; $974C  4A
  lsr a                          ; $974D  4A
  lsr a                          ; $974E  4A
  lsr a                          ; $974F  4A
  sta _var_00ab                  ; $9750  85 AB
  lda (_var_002d_indexed),Y      ; $9752  B1 2D
  and #$0C                       ; $9754  29 0C
  lsr a                          ; $9756  4A
  lsr a                          ; $9757  4A
  sta _var_00ac                  ; $9758  85 AC
  lda (_var_002d_indexed),Y      ; $975A  B1 2D
  and #$03                       ; $975C  29 03
  sta _var_00ad                  ; $975E  85 AD
  iny                            ; $9760  C8
  lda (_var_002d_indexed),Y      ; $9761  B1 2D
  and #$C0                       ; $9763  29 C0
  clc                            ; $9765  18
  rol a                          ; $9766  2A
  rol a                          ; $9767  2A
  rol a                          ; $9768  2A
  sta _var_00ae                  ; $9769  85 AE
  lda (_var_002d_indexed),Y      ; $976B  B1 2D
  and #$30                       ; $976D  29 30
  lsr a                          ; $976F  4A
  lsr a                          ; $9770  4A
  lsr a                          ; $9771  4A
  lsr a                          ; $9772  4A
  sta a:_var_010f                ; $9773  8D 0F 01
  lda (_var_002d_indexed),Y      ; $9776  B1 2D
  and #$03                       ; $9778  29 03
  clc                            ; $977A  18
  adc #$B0                       ; $977B  69 B0
  sta _var_001d                  ; $977D  85 1D
  iny                            ; $977F  C8
  lda (_var_002d_indexed),Y      ; $9780  B1 2D
  sta a:_var_0200_indexed        ; $9782  8D 00 02
  iny                            ; $9785  C8
  lda (_var_002d_indexed),Y      ; $9786  B1 2D
  sta a:_var_0203_indexed        ; $9788  8D 03 02
  lda #$7C                       ; $978B  A9 7C
  sta a:_var_0201_indexed        ; $978D  8D 01 02
  lda #$7E                       ; $9790  A9 7E
  sta a:_var_0204_indexed        ; $9792  8D 04 02
  lda #$00                       ; $9795  A9 00
  sta a:_var_0205_indexed        ; $9797  8D 05 02
  sta a:_var_0202_indexed        ; $979A  8D 02 02
  lda #$38                       ; $979D  A9 38
  sta a:_var_0371                ; $979F  8D 71 03
  sta a:_var_0372                ; $97A2  8D 72 03
  sta a:_var_0373                ; $97A5  8D 73 03
  iny                            ; $97A8  C8
  lda (_var_002d_indexed),Y      ; $97A9  B1 2D
  sta _var_0091                  ; $97AB  85 91
  iny                            ; $97AD  C8
  lda #$00                       ; $97AE  A9 00
  sta _var_002f_indexed          ; $97B0  85 2F
  tax                            ; $97B2  AA
  lda _var_002f_indexed          ; $97B3  A5 2F
  cmp _var_00aa                  ; $97B5  C5 AA
  beq _label_97e4                ; $97B7  F0 2B
  lda (_var_002d_indexed),Y      ; $97B9  B1 2D
  sta a:_var_027e_indexed,X      ; $97BB  9D 7E 02
  iny                            ; $97BE  C8
  lda (_var_002d_indexed),Y      ; $97BF  B1 2D
  sta a:_var_0281_indexed,X      ; $97C1  9D 81 02
  iny                            ; $97C4  C8
  lda (_var_002d_indexed),Y      ; $97C5  B1 2D
  sta a:_var_0283_indexed,X      ; $97C7  9D 83 02
  iny                            ; $97CA  C8
  lda #$48                       ; $97CB  A9 48
  sta a:_var_027f_indexed,X      ; $97CD  9D 7F 02
  lda #$4A                       ; $97D0  A9 4A
  sta a:_var_0282_indexed,X      ; $97D2  9D 82 02
  lda #$02                       ; $97D5  A9 02
  sta a:_var_0280_indexed,X      ; $97D7  9D 80 02
  txa                            ; $97DA  8A
  clc                            ; $97DB  18
  adc #$07                       ; $97DC  69 07
  tax                            ; $97DE  AA
  inc _var_002f_indexed          ; $97DF  E6 2F
  jmp _label_b7b3                ; $97E1  4C B3 B7

_label_97e4:
  ldx #$00                       ; $97E4  A2 00

_label_97e6:
  lda #$F6                       ; $97E6  A9 F6
  sta a:_var_06c4_indexed,X      ; $97E8  9D C4 06
  inx                            ; $97EB  E8
  cpx #$3C                       ; $97EC  E0 3C
  bne _label_97e6                ; $97EE  D0 F6
  lda #$F0                       ; $97F0  A9 F0
  sta a:$06D3                    ; $97F2  8D D3 06
  sta a:$06E7                    ; $97F5  8D E7 06
  sta a:$06FB                    ; $97F8  8D FB 06
  lda #$00                       ; $97FB  A9 00
  sta _var_002f_indexed          ; $97FD  85 2F
  tax                            ; $97FF  AA
  lda _var_002f_indexed          ; $9800  A5 2F
  cmp _var_00ab                  ; $9802  C5 AB
  beq _label_9831                ; $9804  F0 2B
  lda (_var_002d_indexed),Y      ; $9806  B1 2D
  sta a:_var_02bd_indexed,X      ; $9808  9D BD 02
  iny                            ; $980B  C8
  lda (_var_002d_indexed),Y      ; $980C  B1 2D
  sta a:_var_02c0_indexed,X      ; $980E  9D C0 02
  iny                            ; $9811  C8
  lda (_var_002d_indexed),Y      ; $9812  B1 2D
  sta a:_var_02c2_indexed,X      ; $9814  9D C2 02
  iny                            ; $9817  C8
  lda #$BC                       ; $9818  A9 BC
  sta a:_var_02be_indexed,X      ; $981A  9D BE 02
  lda #$BE                       ; $981D  A9 BE
  sta a:_var_02c1_indexed,X      ; $981F  9D C1 02
  lda #$01                       ; $9822  A9 01
  sta a:_var_02bf_indexed,X      ; $9824  9D BF 02
  txa                            ; $9827  8A
  clc                            ; $9828  18
  adc #$07                       ; $9829  69 07
  tax                            ; $982B  AA
  inc _var_002f_indexed          ; $982C  E6 2F
  jmp _label_b800                ; $982E  4C 00 B8

_label_9831:
  lda #$00                       ; $9831  A9 00
  sta _var_002f_indexed          ; $9833  85 2F
  tax                            ; $9835  AA
  lda _var_002f_indexed          ; $9836  A5 2F
  cmp _var_00ac                  ; $9838  C5 AC
  beq _label_9867                ; $983A  F0 2B
  lda (_var_002d_indexed),Y      ; $983C  B1 2D
  sta a:_var_02a8_indexed,X      ; $983E  9D A8 02
  iny                            ; $9841  C8
  lda (_var_002d_indexed),Y      ; $9842  B1 2D
  sta a:_var_02ab_indexed,X      ; $9844  9D AB 02
  iny                            ; $9847  C8
  lda (_var_002d_indexed),Y      ; $9848  B1 2D
  sta a:_var_02ad_indexed,X      ; $984A  9D AD 02
  iny                            ; $984D  C8
  lda #$C4                       ; $984E  A9 C4
  sta a:_var_02a9_indexed,X      ; $9850  9D A9 02
  lda #$C6                       ; $9853  A9 C6
  sta a:_var_02ac_indexed,X      ; $9855  9D AC 02
  lda #$02                       ; $9858  A9 02
  sta a:_var_02aa_indexed,X      ; $985A  9D AA 02
  txa                            ; $985D  8A
  clc                            ; $985E  18
  adc #$07                       ; $985F  69 07
  tax                            ; $9861  AA
  inc _var_002f_indexed          ; $9862  E6 2F
  jmp _label_b836                ; $9864  4C 36 B8

_label_9867:
  lda #$00                       ; $9867  A9 00
  sta _var_002f_indexed          ; $9869  85 2F
  tax                            ; $986B  AA
  lda _var_002f_indexed          ; $986C  A5 2F
  cmp _var_00ad                  ; $986E  C5 AD
  beq _label_989d                ; $9870  F0 2B
  lda (_var_002d_indexed),Y      ; $9872  B1 2D
  sta a:_var_0293_indexed,X      ; $9874  9D 93 02
  iny                            ; $9877  C8
  lda (_var_002d_indexed),Y      ; $9878  B1 2D
  sta a:_var_0296_indexed,X      ; $987A  9D 96 02
  iny                            ; $987D  C8
  lda (_var_002d_indexed),Y      ; $987E  B1 2D
  sta a:_var_0298_indexed,X      ; $9880  9D 98 02
  iny                            ; $9883  C8
  lda #$88                       ; $9884  A9 88
  sta a:_var_0294_indexed,X      ; $9886  9D 94 02
  lda #$8A                       ; $9889  A9 8A
  sta a:_var_0297_indexed,X      ; $988B  9D 97 02
  lda #$03                       ; $988E  A9 03
  sta a:_var_0295_indexed,X      ; $9890  9D 95 02
  txa                            ; $9893  8A
  clc                            ; $9894  18
  adc #$07                       ; $9895  69 07
  tax                            ; $9897  AA
  inc _var_002f_indexed          ; $9898  E6 2F
  jmp _label_b86c                ; $989A  4C 6C B8

_label_989d:
  lda _var_00ae                  ; $989D  A5 AE
  beq _label_98c2                ; $989F  F0 21
  lda (_var_002d_indexed),Y      ; $98A1  B1 2D
  sta a:_var_02a1                ; $98A3  8D A1 02
  iny                            ; $98A6  C8
  lda (_var_002d_indexed),Y      ; $98A7  B1 2D
  sta a:_var_02a4                ; $98A9  8D A4 02
  iny                            ; $98AC  C8
  lda (_var_002d_indexed),Y      ; $98AD  B1 2D
  sta a:_var_02a6                ; $98AF  8D A6 02
  lda #$A4                       ; $98B2  A9 A4
  sta a:_var_02a2                ; $98B4  8D A2 02
  lda #$A6                       ; $98B7  A9 A6
  sta a:_var_02a5                ; $98B9  8D A5 02
  lda #$01                       ; $98BC  A9 01
  sta a:$02A3                    ; $98BE  8D A3 02
  iny                            ; $98C1  C8

_label_98c2:
  lda a:_var_010f                ; $98C2  AD 0F 01
  beq _label_9917                ; $98C5  F0 50
  ldx #$00                       ; $98C7  A2 00

_label_98c9:
  stx _var_00af                  ; $98C9  86 AF
  jsr _func_c00c                 ; $98CB  20 0C C0
  lda (_var_002d_indexed),Y      ; $98CE  B1 2D
  sta a:_var_0246_indexed,X      ; $98D0  9D 46 02
  iny                            ; $98D3  C8
  lda (_var_002d_indexed),Y      ; $98D4  B1 2D
  sta a:_var_0249_indexed,X      ; $98D6  9D 49 02
  iny                            ; $98D9  C8
  lda (_var_002d_indexed),Y      ; $98DA  B1 2D
  sta a:_var_024b_indexed,X      ; $98DC  9D 4B 02
  iny                            ; $98DF  C8
  lda #$B8                       ; $98E0  A9 B8
  sta a:_var_0247_indexed,X      ; $98E2  9D 47 02
  lda #$BA                       ; $98E5  A9 BA
  sta a:_var_024a_indexed,X      ; $98E7  9D 4A 02
  lda #$01                       ; $98EA  A9 01
  sta a:_var_0248_indexed,X      ; $98EC  9D 48 02
  ldx _var_00af                  ; $98EF  A6 AF
  inx                            ; $98F1  E8
  cpx a:_var_010f                ; $98F2  EC 0F 01
  bne _label_98c9                ; $98F5  D0 D2
  lda (_var_002d_indexed),Y      ; $98F7  B1 2D
  sta a:_var_025b                ; $98F9  8D 5B 02
  iny                            ; $98FC  C8
  lda (_var_002d_indexed),Y      ; $98FD  B1 2D
  sta a:$025E                    ; $98FF  8D 5E 02
  iny                            ; $9902  C8
  lda (_var_002d_indexed),Y      ; $9903  B1 2D
  sta a:_var_0260                ; $9905  8D 60 02
  lda #$C0                       ; $9908  A9 C0
  sta a:_var_025c                ; $990A  8D 5C 02
  lda #$C2                       ; $990D  A9 C2
  sta a:$025F                    ; $990F  8D 5F 02
  lda #$20                       ; $9912  A9 20
  sta a:$025D                    ; $9914  8D 5D 02

_label_9917:
  lda #$01                       ; $9917  A9 01
  sta a:_var_0137                ; $9919  8D 37 01
  lda #$FF                       ; $991C  A9 FF
  sta _var_0066                  ; $991E  85 66
  jsr _func_bfa0                 ; $9920  20 A0 BF
  rts                            ; $9923  60
  lda #$00                       ; $9924  A9 00
  sta _var_0031_indexed          ; $9926  85 31
  tay                            ; $9928  A8
  ldx _var_0031_indexed          ; $9929  A6 31

_label_992b:
  lda a:_var_0400_indexed,X      ; $992B  BD 00 04
  and #$C0                       ; $992E  29 C0
  sta a:_var_0380_indexed,Y      ; $9930  99 80 03
  inx                            ; $9933  E8
  lda a:_var_0400_indexed,X      ; $9934  BD 00 04
  and #$C0                       ; $9937  29 C0
  lsr a                          ; $9939  4A
  lsr a                          ; $993A  4A
  clc                            ; $993B  18
  adc a:_var_0380_indexed,Y      ; $993C  79 80 03
  sta a:_var_0380_indexed,Y      ; $993F  99 80 03
  inx                            ; $9942  E8
  lda a:_var_0400_indexed,X      ; $9943  BD 00 04
  and #$C0                       ; $9946  29 C0
  lsr a                          ; $9948  4A
  lsr a                          ; $9949  4A
  lsr a                          ; $994A  4A
  lsr a                          ; $994B  4A
  clc                            ; $994C  18
  adc a:_var_0380_indexed,Y      ; $994D  79 80 03
  sta a:_var_0380_indexed,Y      ; $9950  99 80 03
  inx                            ; $9953  E8
  lda a:_var_0400_indexed,X      ; $9954  BD 00 04
  and #$C0                       ; $9957  29 C0
  clc                            ; $9959  18
  rol a                          ; $995A  2A
  rol a                          ; $995B  2A
  rol a                          ; $995C  2A
  clc                            ; $995D  18
  adc a:_var_0380_indexed,Y      ; $995E  79 80 03
  sta a:_var_0380_indexed,Y      ; $9961  99 80 03
  inx                            ; $9964  E8
  iny                            ; $9965  C8
  tya                            ; $9966  98
  and #$03                       ; $9967  29 03
  bne _label_992b                ; $9969  D0 C0
  ldx _var_0031_indexed          ; $996B  A6 31

_label_996d:
  lda a:_var_0400_indexed,X      ; $996D  BD 00 04
  and #$30                       ; $9970  29 30
  asl a                          ; $9972  0A
  asl a                          ; $9973  0A
  sta a:_var_0380_indexed,Y      ; $9974  99 80 03
  inx                            ; $9977  E8
  lda a:_var_0400_indexed,X      ; $9978  BD 00 04
  and #$30                       ; $997B  29 30
  clc                            ; $997D  18
  adc a:_var_0380_indexed,Y      ; $997E  79 80 03
  sta a:_var_0380_indexed,Y      ; $9981  99 80 03
  inx                            ; $9984  E8
  lda a:_var_0400_indexed,X      ; $9985  BD 00 04
  and #$30                       ; $9988  29 30
  lsr a                          ; $998A  4A
  lsr a                          ; $998B  4A
  clc                            ; $998C  18
  adc a:_var_0380_indexed,Y      ; $998D  79 80 03
  sta a:_var_0380_indexed,Y      ; $9990  99 80 03
  inx                            ; $9993  E8
  lda a:_var_0400_indexed,X      ; $9994  BD 00 04
  and #$30                       ; $9997  29 30
  lsr a                          ; $9999  4A
  lsr a                          ; $999A  4A
  lsr a                          ; $999B  4A
  lsr a                          ; $999C  4A
  clc                            ; $999D  18
  adc a:_var_0380_indexed,Y      ; $999E  79 80 03
  sta a:_var_0380_indexed,Y      ; $99A1  99 80 03
  inx                            ; $99A4  E8
  iny                            ; $99A5  C8
  tya                            ; $99A6  98
  and #$03                       ; $99A7  29 03
  bne _label_996d                ; $99A9  D0 C2
  ldx _var_0031_indexed          ; $99AB  A6 31

_label_99ad:
  lda a:_var_0400_indexed,X      ; $99AD  BD 00 04
  and #$0C                       ; $99B0  29 0C
  asl a                          ; $99B2  0A
  asl a                          ; $99B3  0A
  asl a                          ; $99B4  0A
  asl a                          ; $99B5  0A
  sta a:_var_0380_indexed,Y      ; $99B6  99 80 03
  inx                            ; $99B9  E8
  lda a:_var_0400_indexed,X      ; $99BA  BD 00 04
  and #$0C                       ; $99BD  29 0C
  asl a                          ; $99BF  0A
  asl a                          ; $99C0  0A
  clc                            ; $99C1  18
  adc a:_var_0380_indexed,Y      ; $99C2  79 80 03
  sta a:_var_0380_indexed,Y      ; $99C5  99 80 03
  inx                            ; $99C8  E8
  lda a:_var_0400_indexed,X      ; $99C9  BD 00 04
  and #$0C                       ; $99CC  29 0C
  clc                            ; $99CE  18
  adc a:_var_0380_indexed,Y      ; $99CF  79 80 03
  sta a:_var_0380_indexed,Y      ; $99D2  99 80 03
  inx                            ; $99D5  E8
  lda a:_var_0400_indexed,X      ; $99D6  BD 00 04
  and #$0C                       ; $99D9  29 0C
  lsr a                          ; $99DB  4A
  lsr a                          ; $99DC  4A
  clc                            ; $99DD  18
  adc a:_var_0380_indexed,Y      ; $99DE  79 80 03
  sta a:_var_0380_indexed,Y      ; $99E1  99 80 03
  inx                            ; $99E4  E8
  iny                            ; $99E5  C8
  tya                            ; $99E6  98
  and #$03                       ; $99E7  29 03
  bne _label_99ad                ; $99E9  D0 C2
  ldx _var_0031_indexed          ; $99EB  A6 31

_label_99ed:
  lda a:_var_0400_indexed,X      ; $99ED  BD 00 04
  and #$03                       ; $99F0  29 03
  clc                            ; $99F2  18
  ror a                          ; $99F3  6A
  ror a                          ; $99F4  6A
  ror a                          ; $99F5  6A
  sta a:_var_0380_indexed,Y      ; $99F6  99 80 03
  inx                            ; $99F9  E8
  lda a:_var_0400_indexed,X      ; $99FA  BD 00 04
  and #$03                       ; $99FD  29 03
  asl a                          ; $99FF  0A
  asl a                          ; $9A00  0A
  asl a                          ; $9A01  0A
  asl a                          ; $9A02  0A
  clc                            ; $9A03  18
  adc a:_var_0380_indexed,Y      ; $9A04  79 80 03
  sta a:_var_0380_indexed,Y      ; $9A07  99 80 03
  inx                            ; $9A0A  E8
  lda a:_var_0400_indexed,X      ; $9A0B  BD 00 04
  and #$03                       ; $9A0E  29 03
  asl a                          ; $9A10  0A
  asl a                          ; $9A11  0A
  clc                            ; $9A12  18
  adc a:_var_0380_indexed,Y      ; $9A13  79 80 03
  sta a:_var_0380_indexed,Y      ; $9A16  99 80 03
  inx                            ; $9A19  E8
  lda a:_var_0400_indexed,X      ; $9A1A  BD 00 04
  and #$03                       ; $9A1D  29 03
  clc                            ; $9A1F  18
  adc a:_var_0380_indexed,Y      ; $9A20  79 80 03
  sta a:_var_0380_indexed,Y      ; $9A23  99 80 03
  inx                            ; $9A26  E8
  iny                            ; $9A27  C8
  tya                            ; $9A28  98
  and #$03                       ; $9A29  29 03
  bne _label_99ed                ; $9A2B  D0 C0
  cpy #$80                       ; $9A2D  C0 80
  beq _label_9a37                ; $9A2F  F0 06
  txa                            ; $9A31  8A
  sta _var_0031_indexed          ; $9A32  85 31
  jmp _label_b929                ; $9A34  4C 29 B9

_label_9a37:
  ldx #$00                       ; $9A37  A2 00

_label_9a39:
  lda #$00                       ; $9A39  A9 00
  sta a:_var_0400_indexed,X      ; $9A3B  9D 00 04
  inx                            ; $9A3E  E8
  bne _label_9a39                ; $9A3F  D0 F8
  rts                            ; $9A41  60
  lda _var_008e                  ; $9A42  A5 8E
  beq _label_9a47                ; $9A44  F0 01
  rts                            ; $9A46  60

_label_9a47:
  lda #$00                       ; $9A47  A9 00
  sta _var_007c                  ; $9A49  85 7C
  lda #$18                       ; $9A4B  A9 18
  sta _var_007d                  ; $9A4D  85 7D
  lda #$06                       ; $9A4F  A9 06
  sta PPU_MASK                   ; $9A51  8D 01 20
  lda #$30                       ; $9A54  A9 30
  sta PPU_CTRL                   ; $9A56  8D 00 20
  lda #$20                       ; $9A59  A9 20
  sta PPU_ADDR                   ; $9A5B  8D 06 20
  lda #$00                       ; $9A5E  A9 00
  sta PPU_ADDR                   ; $9A60  8D 06 20
  tax                            ; $9A63  AA

_label_9a64:
  lda #$87                       ; $9A64  A9 87
  sta PPU_DATA                   ; $9A66  8D 07 20
  inx                            ; $9A69  E8
  bne _label_9a64                ; $9A6A  D0 F8
  inc _var_008e                  ; $9A6C  E6 8E
  lda _var_008e                  ; $9A6E  A5 8E
  cmp #$0C                       ; $9A70  C9 0C
  bne _label_9a64                ; $9A72  D0 F0
  lda #$23                       ; $9A74  A9 23
  sta PPU_ADDR                   ; $9A76  8D 06 20
  lda #$C0                       ; $9A79  A9 C0
  sta PPU_ADDR                   ; $9A7B  8D 06 20
  tax                            ; $9A7E  AA
  lda #$00                       ; $9A7F  A9 00

_label_9a81:
  sta PPU_DATA                   ; $9A81  8D 07 20
  inx                            ; $9A84  E8
  bne _label_9a81                ; $9A85  D0 FA
  lda #$2B                       ; $9A87  A9 2B
  sta PPU_ADDR                   ; $9A89  8D 06 20
  lda #$C0                       ; $9A8C  A9 C0
  sta PPU_ADDR                   ; $9A8E  8D 06 20
  tax                            ; $9A91  AA
  lda #$00                       ; $9A92  A9 00

_label_9a94:
  sta PPU_DATA                   ; $9A94  8D 07 20
  inx                            ; $9A97  E8
  bne _label_9a94                ; $9A98  D0 FA

_label_9a9a:
  ldy #$00                       ; $9A9A  A0 00
  lda _var_004f                  ; $9A9C  A5 4F
  asl a                          ; $9A9E  0A
  tax                            ; $9A9F  AA
  lda a:_data_a9ef_indexed,X     ; $9AA0  BD EF A9
  sta _var_0061_indexed          ; $9AA3  85 61
  lda a:_data_a9f0_indexed,X     ; $9AA5  BD F0 A9
  sta $62                        ; $9AA8  85 62
  lda (_var_0061_indexed),Y      ; $9AAA  B1 61
  cmp #$FF                       ; $9AAC  C9 FF
  beq _label_9acb                ; $9AAE  F0 1B
  sta PPU_ADDR                   ; $9AB0  8D 06 20
  iny                            ; $9AB3  C8
  lda (_var_0061_indexed),Y      ; $9AB4  B1 61
  sta PPU_ADDR                   ; $9AB6  8D 06 20
  iny                            ; $9AB9  C8
  lda (_var_0061_indexed),Y      ; $9ABA  B1 61
  cmp #$FF                       ; $9ABC  C9 FF
  beq _label_9ac7                ; $9ABE  F0 07
  sta PPU_DATA                   ; $9AC0  8D 07 20
  iny                            ; $9AC3  C8
  jmp _label_baba                ; $9AC4  4C BA BA

_label_9ac7:
  iny                            ; $9AC7  C8
  jmp _label_baaa                ; $9AC8  4C AA BA

_label_9acb:
  inc _var_004f                  ; $9ACB  E6 4F
  lda _var_004f                  ; $9ACD  A5 4F
  and #$01                       ; $9ACF  29 01
  bne _label_9a9a                ; $9AD1  D0 C7
  dec _var_004f                  ; $9AD3  C6 4F
  dec _var_004f                  ; $9AD5  C6 4F
  jsr _func_c012                 ; $9AD7  20 12 C0
  lda _var_004f                  ; $9ADA  A5 4F
  cmp #$06                       ; $9ADC  C9 06
  bne _label_9ae3                ; $9ADE  D0 03
  jsr _func_c00f                 ; $9AE0  20 0F C0

_label_9ae3:
  lda #$01                       ; $9AE3  A9 01
  sta _var_008e                  ; $9AE5  85 8E
  lda #$00                       ; $9AE7  A9 00
  sta _var_0065                  ; $9AE9  85 65
  sta PPU_MASK                   ; $9AEB  8D 01 20
  lda _var_004f                  ; $9AEE  A5 4F
  bne _label_9afa                ; $9AF0  D0 08
  lda #$B0                       ; $9AF2  A9 B0
  sta _var_001d                  ; $9AF4  85 1D
  sta PPU_CTRL                   ; $9AF6  8D 00 20
  rts                            ; $9AF9  60

_label_9afa:
  lda #$B2                       ; $9AFA  A9 B2
  sta _var_001d                  ; $9AFC  85 1D
  sta PPU_CTRL                   ; $9AFE  8D 00 20
  lda #$00                       ; $9B01  A9 00
  sta _var_0050                  ; $9B03  85 50
  sta _var_0051                  ; $9B05  85 51
  sta _var_00eb                  ; $9B07  85 EB
  rts                            ; $9B09  60
  lda a:_var_014a                ; $9B0A  AD 4A 01
  cmp #$04                       ; $9B0D  C9 04
  bcc _label_9b31                ; $9B0F  90 20
  cmp #$05                       ; $9B11  C9 05
  bne _label_9b7b                ; $9B13  D0 66
  lda _var_004b                  ; $9B15  A5 4B
  and #$03                       ; $9B17  29 03
  beq _label_9b27                ; $9B19  F0 0C
  lda _var_0024                  ; $9B1B  A5 24
  bne _label_9b2b                ; $9B1D  D0 0C
  lda #$04                       ; $9B1F  A9 04
  sta a:_var_014a                ; $9B21  8D 4A 01
  inc _var_0024                  ; $9B24  E6 24
  rts                            ; $9B26  60

_label_9b27:
  lda #$00                       ; $9B27  A9 00
  sta _var_0024                  ; $9B29  85 24

_label_9b2b:
  lda #$01                       ; $9B2B  A9 01
  sta a:_var_011f                ; $9B2D  8D 1F 01
  rts                            ; $9B30  60

_label_9b31:
  lda a:_var_011f                ; $9B31  AD 1F 01
  beq _label_9b7b                ; $9B34  F0 45
  lda _var_004f                  ; $9B36  A5 4F
  cmp #$06                       ; $9B38  C9 06
  bcs _label_9b7b                ; $9B3A  B0 3F
  lda _var_001f_indexed          ; $9B3C  A5 1F
  tax                            ; $9B3E  AA
  and #$F0                       ; $9B3F  29 F0
  beq _label_9b7b                ; $9B41  F0 38
  lda _var_004b                  ; $9B43  A5 4B
  beq _label_9b7c                ; $9B45  F0 35
  lda _var_0024                  ; $9B47  A5 24
  bne _label_9b65                ; $9B49  D0 1A
  lda _var_004b                  ; $9B4B  A5 4B
  and #$03                       ; $9B4D  29 03
  beq _label_9b68                ; $9B4F  F0 17
  inc a:_var_014a                ; $9B51  EE 4A 01
  lda a:_var_014a                ; $9B54  AD 4A 01
  cmp #$04                       ; $9B57  C9 04
  beq _label_9b7f                ; $9B59  F0 24
  lda #$00                       ; $9B5B  A9 00
  sta a:_var_014b                ; $9B5D  8D 4B 01
  inc _var_0024                  ; $9B60  E6 24
  inc a:_var_0612                ; $9B62  EE 12 06

_label_9b65:
  jmp _label_bbb9                ; $9B65  4C B9 BB

_label_9b68:
  ldx a:_var_014b                ; $9B68  AE 4B 01
  lda _var_004b                  ; $9B6B  A5 4B
  and #$10                       ; $9B6D  29 10
  beq _label_9b82                ; $9B6F  F0 11
  inx                            ; $9B71  E8
  cpx #$04                       ; $9B72  E0 04
  bne _label_9b8f                ; $9B74  D0 19
  ldx #$00                       ; $9B76  A2 00
  jmp _label_bb8f                ; $9B78  4C 8F BB

_label_9b7b:
  rts                            ; $9B7B  60

_label_9b7c:
  jmp _label_bbf0                ; $9B7C  4C F0 BB

_label_9b7f:
  jmp _label_bbf7                ; $9B7F  4C F7 BB

_label_9b82:
  lda _var_004b                  ; $9B82  A5 4B
  and #$20                       ; $9B84  29 20
  beq _label_9bf0                ; $9B86  F0 68
  dex                            ; $9B88  CA
  cpx #$FF                       ; $9B89  E0 FF
  bne _label_9b8f                ; $9B8B  D0 02
  ldx #$03                       ; $9B8D  A2 03

_label_9b8f:
  inc a:_var_0612                ; $9B8F  EE 12 06
  txa                            ; $9B92  8A
  sta a:_var_014b                ; $9B93  8D 4B 01
  asl a                          ; $9B96  0A
  tax                            ; $9B97  AA
  lda a:_data_bc59_indexed+2,X   ; $9B98  BD 5B BC
  sta _var_002d_indexed          ; $9B9B  85 2D
  lda a:_data_bc5c_indexed,X     ; $9B9D  BD 5C BC
  sta _var_002e                  ; $9BA0  85 2E
  ldy a:_var_014a                ; $9BA2  AC 4A 01
  lda _var_002a                  ; $9BA5  A5 2A
  and a:_data_bc6e_indexed+1,Y   ; $9BA7  39 6F BC
  cpx #$00                       ; $9BAA  E0 00
  beq _label_9bb1                ; $9BAC  F0 03
  clc                            ; $9BAE  18
  adc (_var_002d_indexed),Y      ; $9BAF  71 2D

_label_9bb1:
  sta _var_002a                  ; $9BB1  85 2A
  lda #$00                       ; $9BB3  A9 00
  sta _var_002b                  ; $9BB5  85 2B
  inc _var_0024                  ; $9BB7  E6 24
  lda #$01                       ; $9BB9  A9 01
  sta a:_var_011f                ; $9BBB  8D 1F 01
  ldy a:_var_014a                ; $9BBE  AC 4A 01
  lda #$7F                       ; $9BC1  A9 7F
  sta a:_var_0207_indexed        ; $9BC3  8D 07 02
  lda a:_data_bc71_indexed+2,Y   ; $9BC6  B9 73 BC
  sta a:_var_020a_indexed        ; $9BC9  8D 0A 02
  lda #$00                       ; $9BCC  A9 00
  sta a:_var_0209_indexed        ; $9BCE  8D 09 02
  sta a:_var_020c_indexed        ; $9BD1  8D 0C 02
  lda _var_0050                  ; $9BD4  A5 50
  and #$08                       ; $9BD6  29 08
  bne _label_9be7                ; $9BD8  D0 0D
  lda #$9C                       ; $9BDA  A9 9C
  sta a:_var_0208_indexed        ; $9BDC  8D 08 02
  lda #$9E                       ; $9BDF  A9 9E
  sta a:_var_020b_indexed        ; $9BE1  8D 0B 02
  jmp _label_bbef                ; $9BE4  4C EF BB

_label_9be7:
  lda #$C8                       ; $9BE7  A9 C8
  sta a:_var_0208_indexed        ; $9BE9  8D 08 02
  sta a:_var_020b_indexed        ; $9BEC  8D 0B 02
  rts                            ; $9BEF  60

_label_9bf0:
  lda #$00                       ; $9BF0  A9 00
  sta _var_0024                  ; $9BF2  85 24
  jmp _label_bbb9                ; $9BF4  4C B9 BB
  lda _var_001f_indexed          ; $9BF7  A5 1F
  sec                            ; $9BF9  38
  sbc #$10                       ; $9BFA  E9 10
  tax                            ; $9BFC  AA
  lda _var_001e                  ; $9BFD  A5 1E
  beq _label_9c0e                ; $9BFF  F0 0D
  lda #$00                       ; $9C01  A9 00
  sec                            ; $9C03  38
  sbc a:_data_bc2a_indexed,X     ; $9C04  FD 2A BC
  cmp _var_002a                  ; $9C07  C5 2A
  beq _label_9c24                ; $9C09  F0 19
  jmp _label_bc15                ; $9C0B  4C 15 BC

_label_9c0e:
  lda _var_002a                  ; $9C0E  A5 2A
  cmp a:_data_bc2a_indexed,X     ; $9C10  DD 2A BC
  beq _label_9c24                ; $9C13  F0 0F
  lda #$00                       ; $9C15  A9 00
  sta _var_002a                  ; $9C17  85 2A
  sta _var_002b                  ; $9C19  85 2B
  sta a:_var_014a                ; $9C1B  8D 4A 01
  sta a:_var_014b                ; $9C1E  8D 4B 01
  inc _var_0024                  ; $9C21  E6 24
  rts                            ; $9C23  60

_label_9c24:
  lda #$EF                       ; $9C24  A9 EF
  sta a:_var_0207_indexed        ; $9C26  8D 07 02
  rts                            ; $9C29  60

.byte $2a, $24, $7c, $3b, $04, $0d, $73, $58, $0e, $a4, $55, $b0, $cb, $eb, $b6, $4a ; $9C2A
.byte $f3, $e6, $c9, $80, $a3, $72, $bd, $b4, $86, $a5, $46, $47, $75, $26, $fc, $6f ; $9C3A
.byte $e9, $82, $11, $aa, $12, $81, $cb, $89, $8d, $c2, $b9, $c9, $d9, $2f, $9f, $78 ; $9C4A
.byte $36, $63, $bc, $63, $bc, $67, $bc, $6b, $bc, $40, $10, $04, $01, $80, $20, $08 ; $9C5A
.byte $02, $c0, $30, $0c, $03, $3f, $cf, $f3, $fc, $88, $98, $a8, $b8 ; $9C6A

  lda _var_002a                  ; $9C77  A5 2A
  and #$C0                       ; $9C79  29 C0
  clc                            ; $9C7B  18
  rol a                          ; $9C7C  2A
  rol a                          ; $9C7D  2A
  rol a                          ; $9C7E  2A
  sta _var_002d_indexed          ; $9C7F  85 2D
  lda _var_002a                  ; $9C81  A5 2A
  and #$30                       ; $9C83  29 30
  lsr a                          ; $9C85  4A
  lsr a                          ; $9C86  4A
  lsr a                          ; $9C87  4A
  lsr a                          ; $9C88  4A
  sta _var_002e                  ; $9C89  85 2E
  lda _var_002a                  ; $9C8B  A5 2A
  and #$0C                       ; $9C8D  29 0C
  lsr a                          ; $9C8F  4A
  lsr a                          ; $9C90  4A
  sta _var_002f_indexed          ; $9C91  85 2F
  lda _var_002a                  ; $9C93  A5 2A
  and #$03                       ; $9C95  29 03
  sta _var_0030                  ; $9C97  85 30
  ldx #$00                       ; $9C99  A2 00

_label_9c9b:
  lda _var_002d_indexed,X        ; $9C9B  B5 2D
  asl a                          ; $9C9D  0A
  asl a                          ; $9C9E  0A
  tay                            ; $9C9F  A8
  lda #$2A                       ; $9CA0  A9 2A
  sta PPU_ADDR                   ; $9CA2  8D 06 20
  lda a:_data_bcd6_indexed,X     ; $9CA5  BD D6 BC
  sta PPU_ADDR                   ; $9CA8  8D 06 20
  lda a:_data_bcdd_indexed+1,Y   ; $9CAB  B9 DE BC
  sta PPU_DATA                   ; $9CAE  8D 07 20
  lda a:_data_bcdf_indexed,Y     ; $9CB1  B9 DF BC
  sta PPU_DATA                   ; $9CB4  8D 07 20
  lda #$2A                       ; $9CB7  A9 2A
  sta PPU_ADDR                   ; $9CB9  8D 06 20
  lda a:_data_bcd8_indexed+2,X   ; $9CBC  BD DA BC
  sta PPU_ADDR                   ; $9CBF  8D 06 20
  lda a:_data_bcdf_indexed+1,Y   ; $9CC2  B9 E0 BC
  sta PPU_DATA                   ; $9CC5  8D 07 20
  lda a:_data_bce1_indexed,Y     ; $9CC8  B9 E1 BC
  sta PPU_DATA                   ; $9CCB  8D 07 20
  inx                            ; $9CCE  E8
  cpx #$04                       ; $9CCF  E0 04
  bne _label_9c9b                ; $9CD1  D0 C8
  inc _var_002b                  ; $9CD3  E6 2B
  rts                            ; $9CD5  60

.byte $11, $13, $15, $17, $31, $33, $35, $37, $f0, $f1, $f2, $f3, $30, $f1, $35, $33 ; $9CD6
.byte $f4, $f5, $fa, $fb, $40, $41, $42, $43 ; $9CE6

  lda _var_0022                  ; $9CEE  A5 22
  bne _label_9cf3                ; $9CF0  D0 01

_label_9cf2:
  rts                            ; $9CF2  60

_label_9cf3:
  lda _var_002c                  ; $9CF3  A5 2C
  beq _label_9d06                ; $9CF5  F0 0F
  lda #$00                       ; $9CF7  A9 00
  sta _var_0023                  ; $9CF9  85 23
  sta _var_008e                  ; $9CFB  85 8E
  sta _var_002c                  ; $9CFD  85 2C
  lda #$02                       ; $9CFF  A9 02
  sta _var_004f                  ; $9D01  85 4F
  jmp _label_bdb6                ; $9D03  4C B6 BD

_label_9d06:
  lda _var_004b                  ; $9D06  A5 4B
  and #$10                       ; $9D08  29 10
  beq _label_9d0f                ; $9D0A  F0 03
  jmp _label_bd9a                ; $9D0C  4C 9A BD

_label_9d0f:
  lda _var_004b                  ; $9D0F  A5 4B
  and #$20                       ; $9D11  29 20
  bne _label_9d83                ; $9D13  D0 6E
  lda _var_004b                  ; $9D15  A5 4B
  and #$40                       ; $9D17  29 40
  bne _label_9d4b                ; $9D19  D0 30
  lda _var_004b                  ; $9D1B  A5 4B
  and #$80                       ; $9D1D  29 80
  bne _label_9d24                ; $9D1F  D0 03
  jmp _label_bdba                ; $9D21  4C BA BD

_label_9d24:
  lda _var_0024                  ; $9D24  A5 24
  bne _label_9cf2                ; $9D26  D0 CA
  lda _var_001f_indexed          ; $9D28  A5 1F
  cmp #$3C                       ; $9D2A  C9 3C
  bcs _label_9d46                ; $9D2C  B0 18
  sec                            ; $9D2E  38
  sbc #$0A                       ; $9D2F  E9 0A
  bcc _label_9d36                ; $9D31  90 03
  jmp _label_bd2e                ; $9D33  4C 2E BD

_label_9d36:
  clc                            ; $9D36  18
  adc #$0A                       ; $9D37  69 0A
  sta _var_002d_indexed          ; $9D39  85 2D
  lda _var_001f_indexed          ; $9D3B  A5 1F
  sec                            ; $9D3D  38
  sbc _var_002d_indexed          ; $9D3E  E5 2D
  clc                            ; $9D40  18
  adc #$0A                       ; $9D41  69 0A
  jmp _label_bdb2                ; $9D43  4C B2 BD

_label_9d46:
  lda #$0A                       ; $9D46  A9 0A
  jmp _label_bdb2                ; $9D48  4C B2 BD

_label_9d4b:
  lda _var_0024                  ; $9D4B  A5 24
  bne _label_9db9                ; $9D4D  D0 6A
  lda _var_001f_indexed          ; $9D4F  A5 1F
  cmp #$0B                       ; $9D51  C9 0B
  bcc _label_9d76                ; $9D53  90 21
  sec                            ; $9D55  38
  sbc #$0A                       ; $9D56  E9 0A
  bcc _label_9d5d                ; $9D58  90 03
  jmp _label_bd55                ; $9D5A  4C 55 BD

_label_9d5d:
  clc                            ; $9D5D  18
  adc #$0A                       ; $9D5E  69 0A
  sta _var_002d_indexed          ; $9D60  85 2D
  beq _label_9d7b                ; $9D62  F0 17
  lda #$0A                       ; $9D64  A9 0A
  sec                            ; $9D66  38
  sbc _var_002d_indexed          ; $9D67  E5 2D
  sta _var_002d_indexed          ; $9D69  85 2D
  lda _var_001f_indexed          ; $9D6B  A5 1F
  clc                            ; $9D6D  18
  adc _var_002d_indexed          ; $9D6E  65 2D
  sec                            ; $9D70  38
  sbc #$0A                       ; $9D71  E9 0A
  jmp _label_bdb2                ; $9D73  4C B2 BD

_label_9d76:
  lda #$3C                       ; $9D76  A9 3C
  jmp _label_bdb2                ; $9D78  4C B2 BD

_label_9d7b:
  lda _var_001f_indexed          ; $9D7B  A5 1F
  sec                            ; $9D7D  38
  sbc #$0A                       ; $9D7E  E9 0A
  jmp _label_bdb2                ; $9D80  4C B2 BD

_label_9d83:
  lda _var_0024                  ; $9D83  A5 24
  beq _label_9d91                ; $9D85  F0 0A
  dec a:_var_012f                ; $9D87  CE 2F 01
  bne _label_9db9                ; $9D8A  D0 2D
  lda #$06                       ; $9D8C  A9 06
  sta a:_var_012f                ; $9D8E  8D 2F 01

_label_9d91:
  dec _var_001f_indexed          ; $9D91  C6 1F
  bne _label_9db4                ; $9D93  D0 1F
  lda #$40                       ; $9D95  A9 40
  jmp _label_bdb2                ; $9D97  4C B2 BD
  lda _var_0024                  ; $9D9A  A5 24
  beq _label_9da8                ; $9D9C  F0 0A
  dec a:_var_012f                ; $9D9E  CE 2F 01
  bne _label_9db9                ; $9DA1  D0 16
  lda #$06                       ; $9DA3  A9 06
  sta a:_var_012f                ; $9DA5  8D 2F 01

_label_9da8:
  inc _var_001f_indexed          ; $9DA8  E6 1F
  lda _var_001f_indexed          ; $9DAA  A5 1F
  cmp #$41                       ; $9DAC  C9 41
  bne _label_9db4                ; $9DAE  D0 04
  lda #$01                       ; $9DB0  A9 01
  sta _var_001f_indexed          ; $9DB2  85 1F

_label_9db4:
  inc _var_0024                  ; $9DB4  E6 24
  jsr _func_c00f                 ; $9DB6  20 0F C0

_label_9db9:
  rts                            ; $9DB9  60
  lda _var_004b                  ; $9DBA  A5 4B
  and #$03                       ; $9DBC  29 03
  beq _label_9de3                ; $9DBE  F0 23
  lda _var_0024                  ; $9DC0  A5 24
  bne _label_9db9                ; $9DC2  D0 F5
  lda #$00                       ; $9DC4  A9 00
  sta _var_008e                  ; $9DC6  85 8E
  sta a:_var_0625                ; $9DC8  8D 25 06
  sta a:_var_0626                ; $9DCB  8D 26 06
  sta a:_var_0627                ; $9DCE  8D 27 06
  sta a:_var_0628                ; $9DD1  8D 28 06
  inc _var_0025                  ; $9DD4  E6 25
  inc a:_var_011f                ; $9DD6  EE 1F 01
  inc _var_0024                  ; $9DD9  E6 24
  lda #$04                       ; $9DDB  A9 04
  sta _var_004f                  ; $9DDD  85 4F
  inc a:_var_06bb                ; $9DDF  EE BB 06
  rts                            ; $9DE2  60

_label_9de3:
  lda #$00                       ; $9DE3  A9 00
  sta _var_0024                  ; $9DE5  85 24
  lda #$1E                       ; $9DE7  A9 1E
  sta a:_var_012f                ; $9DE9  8D 2F 01
  rts                            ; $9DEC  60
  lda a:_var_011f                ; $9DED  AD 1F 01
  bne _label_9df3                ; $9DF0  D0 01
  rts                            ; $9DF2  60

_label_9df3:
  lda _var_004f                  ; $9DF3  A5 4F
  cmp #$08                       ; $9DF5  C9 08
  beq _label_9e65                ; $9DF7  F0 6C
  cmp #$04                       ; $9DF9  C9 04
  bne _label_9e2c                ; $9DFB  D0 2F
  lda a:_var_011f                ; $9DFD  AD 1F 01
  cmp #$0A                       ; $9E00  C9 0A
  bne _label_9e0d                ; $9E02  D0 09
  inc a:_var_0622                ; $9E04  EE 22 06
  inc a:_var_0623                ; $9E07  EE 23 06
  inc a:_var_0624                ; $9E0A  EE 24 06

_label_9e0d:
  lda #$5F                       ; $9E0D  A9 5F
  sta a:_var_0200_indexed        ; $9E0F  8D 00 02
  lda #$60                       ; $9E12  A9 60
  sta a:_var_0203_indexed        ; $9E14  8D 03 02
  lda #$00                       ; $9E17  A9 00
  sta a:_var_0202_indexed        ; $9E19  8D 02 02
  sta a:_var_0205_indexed        ; $9E1C  8D 05 02
  lda #$14                       ; $9E1F  A9 14
  sta a:_var_0201_indexed        ; $9E21  8D 01 02
  lda #$16                       ; $9E24  A9 16
  sta a:_var_0204_indexed        ; $9E26  8D 04 02
  jsr _func_bec8                 ; $9E29  20 C8 BE

_label_9e2c:
  lda _var_004f                  ; $9E2C  A5 4F
  cmp #$06                       ; $9E2E  C9 06
  bne _label_9e5a                ; $9E30  D0 28
  lda a:_var_011f                ; $9E32  AD 1F 01
  cmp #$0A                       ; $9E35  C9 0A
  bne _label_9e45                ; $9E37  D0 0C
  inc a:_var_062b                ; $9E39  EE 2B 06
  inc a:_var_062c                ; $9E3C  EE 2C 06
  inc a:_var_062d                ; $9E3F  EE 2D 06
  inc a:_var_062e                ; $9E42  EE 2E 06

_label_9e45:
  lda _var_004b                  ; $9E45  A5 4B
  beq _label_9e5a                ; $9E47  F0 11
  lda #$00                       ; $9E49  A9 00
  sta a:_var_062b                ; $9E4B  8D 2B 06
  sta a:_var_062c                ; $9E4E  8D 2C 06
  sta a:_var_062d                ; $9E51  8D 2D 06
  sta a:_var_062e                ; $9E54  8D 2E 06
  jmp _label_be92                ; $9E57  4C 92 BE

_label_9e5a:
  inc a:_var_011f                ; $9E5A  EE 1F 01
  lda a:_var_011f                ; $9E5D  AD 1F 01
  cmp #$FF                       ; $9E60  C9 FF
  bcs _label_9e92                ; $9E62  B0 2E
  rts                            ; $9E64  60

_label_9e65:
  lda _var_0098                  ; $9E65  A5 98
  bne _label_9e81                ; $9E67  D0 18
  lda a:_var_011f                ; $9E69  AD 1F 01
  cmp #$05                       ; $9E6C  C9 05
  bne _label_9e81                ; $9E6E  D0 11
  inc a:_var_0613                ; $9E70  EE 13 06
  inc a:_var_0614                ; $9E73  EE 14 06
  inc a:_var_0615                ; $9E76  EE 15 06
  inc a:_var_0616                ; $9E79  EE 16 06
  lda #$32                       ; $9E7C  A9 32
  sta a:_var_011f                ; $9E7E  8D 1F 01

_label_9e81:
  inc a:_var_011f                ; $9E81  EE 1F 01
  bne _label_9e91                ; $9E84  D0 0B
  inc a:_var_011f                ; $9E86  EE 1F 01
  inc _var_0098                  ; $9E89  E6 98
  lda _var_0098                  ; $9E8B  A5 98
  cmp #$02                       ; $9E8D  C9 02
  bcs _label_9e92                ; $9E8F  B0 01

_label_9e91:
  rts                            ; $9E91  60

_label_9e92:
  lda _var_004f                  ; $9E92  A5 4F
  cmp #$06                       ; $9E94  C9 06
  bne _label_9ea0                ; $9E96  D0 08
  lda #$00                       ; $9E98  A9 00
  sta _var_00eb                  ; $9E9A  85 EB
  lda _var_0026                  ; $9E9C  A5 26
  bne _label_9ea4                ; $9E9E  D0 04

_label_9ea0:
  lda #$00                       ; $9EA0  A9 00
  sta _var_004f                  ; $9EA2  85 4F

_label_9ea4:
  lda #$00                       ; $9EA4  A9 00
  sta a:_var_011f                ; $9EA6  8D 1F 01
  sta _var_008e                  ; $9EA9  85 8E
  sta _var_0065                  ; $9EAB  85 65
  sta _var_0022                  ; $9EAD  85 22
  lda #$EF                       ; $9EAF  A9 EF
  sta a:_var_0200_indexed        ; $9EB1  8D 00 02
  sta a:_var_020e_indexed        ; $9EB4  8D 0E 02
  sta a:_var_0215                ; $9EB7  8D 15 02
  sta a:$021C                    ; $9EBA  8D 1C 02
  sta a:$0223                    ; $9EBD  8D 23 02
  lda _var_001d                  ; $9EC0  A5 1D
  sta PPU_CTRL                   ; $9EC2  8D 00 20
  inc _var_0024                  ; $9EC5  E6 24
  rts                            ; $9EC7  60
  lda a:_var_011f                ; $9EC8  AD 1F 01
  cmp #$14                       ; $9ECB  C9 14
  bcs _label_9eec                ; $9ECD  B0 1D
  lda #$BF                       ; $9ECF  A9 BF
  sta a:_var_0215                ; $9ED1  8D 15 02
  lda #$B8                       ; $9ED4  A9 B8
  sta a:_var_0218                ; $9ED6  8D 18 02
  lda #$02                       ; $9ED9  A9 02
  sta a:_var_0216                ; $9EDB  8D 16 02
  lda #$00                       ; $9EDE  A9 00
  sta a:_var_0219                ; $9EE0  8D 19 02
  sta a:$021A                    ; $9EE3  8D 1A 02
  lda #$40                       ; $9EE6  A9 40
  sta a:_var_0217                ; $9EE8  8D 17 02
  rts                            ; $9EEB  60

_label_9eec:
  lda a:_var_0218                ; $9EEC  AD 18 02
  cmp #$31                       ; $9EEF  C9 31
  bcc _label_9f35                ; $9EF1  90 42
  cmp #$60                       ; $9EF3  C9 60
  bne _label_9f05                ; $9EF5  D0 0E
  lda a:_var_011f                ; $9EF7  AD 1F 01
  cmp #$AF                       ; $9EFA  C9 AF
  bcs _label_9f05                ; $9EFC  B0 07
  lda #$16                       ; $9EFE  A9 16
  sta _var_002d_indexed          ; $9F00  85 2D
  jmp _label_bf17                ; $9F02  4C 17 BF

_label_9f05:
  dec a:_var_0218                ; $9F05  CE 18 02
  lda _var_0050                  ; $9F08  A5 50
  and #$04                       ; $9F0A  29 04
  bne _label_9f13                ; $9F0C  D0 05
  lda #$06                       ; $9F0E  A9 06
  jmp _label_bf15                ; $9F10  4C 15 BF

_label_9f13:
  lda #$02                       ; $9F13  A9 02
  sta _var_002d_indexed          ; $9F15  85 2D
  sec                            ; $9F17  38
  sbc #$02                       ; $9F18  E9 02
  sta _var_002e                  ; $9F1A  85 2E
  lda a:_var_0218                ; $9F1C  AD 18 02
  cmp #$40                       ; $9F1F  C9 40
  beq _label_9f36                ; $9F21  F0 13
  cmp #$39                       ; $9F23  C9 39
  bcs _label_9f2b                ; $9F25  B0 04
  lda #$C8                       ; $9F27  A9 C8
  sta _var_002d_indexed          ; $9F29  85 2D

_label_9f2b:
  lda _var_002d_indexed          ; $9F2B  A5 2D
  sta a:_var_0216                ; $9F2D  8D 16 02
  lda _var_002e                  ; $9F30  A5 2E
  sta a:_var_0219                ; $9F32  8D 19 02

_label_9f35:
  rts                            ; $9F35  60

_label_9f36:
  lda #$60                       ; $9F36  A9 60
  sta a:_var_0217                ; $9F38  8D 17 02
  bne _label_9f2b                ; $9F3B  D0 EE
  lda _var_004b                  ; $9F3D  A5 4B
  beq _label_9f9b                ; $9F3F  F0 5A
  lda _var_001e                  ; $9F41  A5 1E
  bne _label_9f9f                ; $9F43  D0 5A
  lda _var_0024                  ; $9F45  A5 24
  bne _label_9f9f                ; $9F47  D0 56
  lda a:_var_06a7                ; $9F49  AD A7 06
  cmp #$03                       ; $9F4C  C9 03
  bcs _label_9f5c                ; $9F4E  B0 0C
  lda _var_004b                  ; $9F50  A5 4B
  cmp #$10                       ; $9F52  C9 10
  bne _label_9f95                ; $9F54  D0 3F
  inc a:_var_06a7                ; $9F56  EE A7 06
  inc _var_0024                  ; $9F59  E6 24
  rts                            ; $9F5B  60

_label_9f5c:
  cmp #$08                       ; $9F5C  C9 08
  bcs _label_9f69                ; $9F5E  B0 09
  lda _var_004b                  ; $9F60  A5 4B
  cmp #$20                       ; $9F62  C9 20
  bne _label_9f95                ; $9F64  D0 2F
  jmp _label_bf56                ; $9F66  4C 56 BF

_label_9f69:
  cmp #$0A                       ; $9F69  C9 0A
  bcs _label_9f76                ; $9F6B  B0 09
  lda _var_004b                  ; $9F6D  A5 4B
  cmp #$80                       ; $9F6F  C9 80
  bne _label_9f95                ; $9F71  D0 22
  jmp _label_bf56                ; $9F73  4C 56 BF

_label_9f76:
  lda _var_004b                  ; $9F76  A5 4B
  cmp #$40                       ; $9F78  C9 40
  bne _label_9f95                ; $9F7A  D0 19
  lda #$01                       ; $9F7C  A9 01
  sta _var_001e                  ; $9F7E  85 1E
  lda #$00                       ; $9F80  A9 00
  sta _var_00eb                  ; $9F82  85 EB
  ldy #$00                       ; $9F84  A0 00

_label_9f86:
  lda #$00                       ; $9F86  A9 00
  sta a:_var_0010_indexed,Y      ; $9F88  99 10 00
  iny                            ; $9F8B  C8
  cpy #$0C                       ; $9F8C  C0 0C
  bne _label_9f86                ; $9F8E  D0 F6
  lda #$01                       ; $9F90  A9 01
  sta _var_0019                  ; $9F92  85 19
  rts                            ; $9F94  60

_label_9f95:
  lda #$00                       ; $9F95  A9 00
  sta a:_var_06a7                ; $9F97  8D A7 06
  rts                            ; $9F9A  60

_label_9f9b:
  lda #$00                       ; $9F9B  A9 00
  sta _var_0024                  ; $9F9D  85 24

_label_9f9f:
  rts                            ; $9F9F  60
  lda a:_var_02a8_indexed        ; $9FA0  AD A8 02
  cmp a:$02AF                    ; $9FA3  CD AF 02
  bne _label_9fcc                ; $9FA6  D0 24
  cmp a:$02B6                    ; $9FA8  CD B6 02
  bne _label_9fbc                ; $9FAB  D0 0F
  lda a:_var_02ab_indexed        ; $9FAD  AD AB 02
  clc                            ; $9FB0  18
  adc #$10                       ; $9FB1  69 10
  cmp a:_var_02b2                ; $9FB3  CD B2 02
  bne _label_9fcc                ; $9FB6  D0 14
  lda #$02                       ; $9FB8  A9 02
  bne _label_9fc9                ; $9FBA  D0 0D

_label_9fbc:
  lda a:_var_02ab_indexed        ; $9FBC  AD AB 02
  clc                            ; $9FBF  18
  adc #$10                       ; $9FC0  69 10
  cmp a:_var_02b2                ; $9FC2  CD B2 02
  bne _label_9fcc                ; $9FC5  D0 05
  lda #$01                       ; $9FC7  A9 01

_label_9fc9:
  sta a:_var_06b5                ; $9FC9  8D B5 06

_label_9fcc:
  rts                            ; $9FCC  60

.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $9FCD
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $9FDD
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $9FED
.byte $ff, $ff, $ff              ; $9FFD

_func_a000:
  ldx _var_00af                  ; $A000  A6 AF
.byte $b5                        ; $A002  B5  branch into instruction detected: lda _var_0039_indexed,X

_func_a003:
.byte $39                        ; $A003  39
  bne _label_a020                ; $A004  D0 1A

_func_a006:
  lda a:_var_013d_indexed,X      ; $A006  BD 3D 01

_func_a009:
  bne _label_a074                ; $A009  D0 69
.byte $a9                        ; $A00B  A9  lda #$00

_func_a00c:
  brk                            ; $A00C  00  branch into instruction detected
  sta _var_0032                  ; $A00D  85 32

_func_a00f:
  ldx _var_0032                  ; $A00F  A6 32
.byte $b5                        ; $A011  B5  branch into instruction detected: lda _var_00d0_indexed,X

_func_a012:
.byte $d0                        ; $A012  D0
  cmp #$02                       ; $A013  C9 02

_func_a015:
  beq _label_a023                ; $A015  F0 0C

_label_a017:
.byte $e6                        ; $A017  E6  branch into instruction detected: inc _var_0032

_func_a018:
.byte $32                        ; $A018  32
  lda _var_0032                  ; $A019  A5 32

_func_a01b:
  cmp a:_var_0137                ; $A01B  CD 37 01

_func_a01e:
  bne _label_a017                ; $A01E  D0 F7

_label_a020:
.byte $4c                        ; $A020  4C  jmp a:$A681

_func_a021:
  sta (_var_00a6_indexed,X)      ; $A021  81 A6  branch into instruction detected

_label_a023:
.byte $20                        ; $A023  20  branch into instruction detected: jsr a:$D487

_func_a024:
.byte $87, $d4                   ; $A024  87 D4
.byte $20                        ; $A026  20  jsr a:$D36D

_func_a027:
  adc a:_data_a8d1+2             ; $A027  6D D3 A8  branch into instruction detected

_data_a02a_indexed:
  lda a:_var_0213_indexed,X      ; $A02A  BD 13 02
  cmp a:_var_0298_indexed,Y      ; $A02D  D9 98 02
  bne _label_a017                ; $A030  D0 E5
  lda a:_var_020e_indexed,X      ; $A032  BD 0E 02
  sec                            ; $A035  38
  sbc a:_var_0293_indexed,Y      ; $A036  F9 93 02
  beq _label_a03d                ; $A039  F0 02
  bcs _label_a044                ; $A03B  B0 07

_label_a03d:
  sta _var_002d_indexed          ; $A03D  85 2D
  lda #$00                       ; $A03F  A9 00
  sec                            ; $A041  38
  sbc _var_002d_indexed          ; $A042  E5 2D

_label_a044:
  cmp #$11                       ; $A044  C9 11
  bcs _label_a017                ; $A046  B0 CF
  lda #$00                       ; $A048  A9 00
  sta _var_002e                  ; $A04A  85 2E
  lda a:_var_0211_indexed,X      ; $A04C  BD 11 02
  sec                            ; $A04F  38
  sbc a:_var_0296_indexed,Y      ; $A050  F9 96 02
  bcs _label_a05e                ; $A053  B0 09
  sta _var_002d_indexed          ; $A055  85 2D
  inc _var_002e                  ; $A057  E6 2E
  lda #$00                       ; $A059  A9 00
  sec                            ; $A05B  38
  sbc _var_002d_indexed          ; $A05C  E5 2D

_label_a05e:
  cmp #$11                       ; $A05E  C9 11
  bcs _label_a017                ; $A060  B0 B5
  ldx _var_00af                  ; $A062  A6 AF
  inc _var_0039_indexed,X        ; $A064  F6 39
  lda _var_002e                  ; $A066  A5 2E
  beq _label_a06f                ; $A068  F0 05
  lda #$00                       ; $A06A  A9 00
  jmp _label_a071                ; $A06C  4C 71 A0

_label_a06f:
  lda #$01                       ; $A06F  A9 01

_label_a071:
  sta a:_var_013b_indexed,X      ; $A071  9D 3B 01

_label_a074:
  jmp _label_a6a4                ; $A074  4C A4 A6

_func_a077:
  ldx #$05                       ; $A077  A2 05

_label_a079:
  lda a:_var_0101_indexed,X      ; $A079  BD 01 01
  bne _label_a08c                ; $A07C  D0 0E
  dex                            ; $A07E  CA
  bpl _label_a079                ; $A07F  10 F8
  lda a:_var_0203_indexed        ; $A081  AD 03 02
  sta _var_00a2                  ; $A084  85 A2

_label_a086:
  lda a:_var_0200_indexed        ; $A086  AD 00 02
  sta _var_00a1                  ; $A089  85 A1
  rts                            ; $A08B  60

_label_a08c:
  lda a:_var_0203_indexed        ; $A08C  AD 03 02
  and #$F8                       ; $A08F  29 F8
  clc                            ; $A091  18
  adc #$04                       ; $A092  69 04
  sta _var_00a2                  ; $A094  85 A2
  lda a:_var_0200_indexed        ; $A096  AD 00 02
  sta _var_00a1                  ; $A099  85 A1
  cpx #$03                       ; $A09B  E0 03
  bcs _label_a0a0                ; $A09D  B0 01
  rts                            ; $A09F  60

_label_a0a0:
  lda _var_0077                  ; $A0A0  A5 77
  bne _label_a086                ; $A0A2  D0 E2
  lda _var_0065                  ; $A0A4  A5 65
  and #$07                       ; $A0A6  29 07
  sta _var_002d_indexed          ; $A0A8  85 2D
  lda _var_0065                  ; $A0AA  A5 65
  clc                            ; $A0AC  18
  adc a:_var_0200_indexed        ; $A0AD  6D 00 02
  and #$07                       ; $A0B0  29 07
  cmp #$07                       ; $A0B2  C9 07
  beq _label_a086                ; $A0B4  F0 D0
  lda #$07                       ; $A0B6  A9 07
  sec                            ; $A0B8  38
  sbc _var_002d_indexed          ; $A0B9  E5 2D
  sta _var_002d_indexed          ; $A0BB  85 2D
  lda a:_var_0200_indexed        ; $A0BD  AD 00 02
  and #$F8                       ; $A0C0  29 F8
  clc                            ; $A0C2  18
  adc _var_002d_indexed          ; $A0C3  65 2D
  sta _var_00a1                  ; $A0C5  85 A1
  rts                            ; $A0C7  60

_func_a0c8:
  lda a:_var_02a4                ; $A0C8  AD A4 02
  and #$F8                       ; $A0CB  29 F8
  sta _var_00a2                  ; $A0CD  85 A2
  lda _var_0065                  ; $A0CF  A5 65
  and #$07                       ; $A0D1  29 07
  sta _var_002d_indexed          ; $A0D3  85 2D
  lda #$07                       ; $A0D5  A9 07
  sec                            ; $A0D7  38
  sbc _var_002d_indexed          ; $A0D8  E5 2D
  sta _var_002d_indexed          ; $A0DA  85 2D
  lda a:_var_02a1                ; $A0DC  AD A1 02
  and #$F8                       ; $A0DF  29 F8
  clc                            ; $A0E1  18
  adc _var_002d_indexed          ; $A0E2  65 2D
  sec                            ; $A0E4  38
  sbc #$08                       ; $A0E5  E9 08
  sta _var_00a1                  ; $A0E7  85 A1
  jsr _func_d063                 ; $A0E9  20 63 D0
  lda a:_var_02a6                ; $A0EC  AD A6 02
  sta _var_004d                  ; $A0EF  85 4D
  jsr _func_cca9                 ; $A0F1  20 A9 CC
  lda _var_0052                  ; $A0F4  A5 52
  cmp #$02                       ; $A0F6  C9 02
  bcs _label_a135                ; $A0F8  B0 3B
  lda _var_009f                  ; $A0FA  A5 9F
  bne _label_a101                ; $A0FC  D0 03
  jsr _func_d407                 ; $A0FE  20 07 D4

_label_a101:
  ldy _var_0056                  ; $A101  A4 56
  ldx _var_005b                  ; $A103  A6 5B
  lda _var_0052                  ; $A105  A5 52
  bne _label_a115                ; $A107  D0 0C
  lda _var_009e                  ; $A109  A5 9E
  beq _label_a115                ; $A10B  F0 08
  cpx #$00                       ; $A10D  E0 00
  bne _label_a114                ; $A10F  D0 03
  dey                            ; $A111  88
  ldx #$04                       ; $A112  A2 04

_label_a114:
  dex                            ; $A114  CA

_label_a115:
  lda a:_var_0480_indexed,Y      ; $A115  B9 80 04
  and a:_data_a213_indexed,X     ; $A118  3D 13 A2
  cmp a:_data_a213_indexed,X     ; $A11B  DD 13 A2
  bne _label_a123                ; $A11E  D0 03

_label_a120:
  jmp _label_a1d9                ; $A120  4C D9 A1

_label_a123:
  lda a:_var_0380_indexed,Y      ; $A123  B9 80 03
  and a:_data_a213_indexed,X     ; $A126  3D 13 A2
  cmp a:_data_a213_indexed,X     ; $A129  DD 13 A2
  beq _label_a120                ; $A12C  F0 F2
  lda _var_009f                  ; $A12E  A5 9F
  bne _label_a135                ; $A130  D0 03
  jsr _func_d41a                 ; $A132  20 1A D4

_label_a135:
  lda #$0F                       ; $A135  A9 0F
  sta _var_00af                  ; $A137  85 AF
  jsr _func_e151                 ; $A139  20 51 E1
  jsr _func_e580                 ; $A13C  20 80 E5
  lda (_var_002d_indexed),Y      ; $A13F  B1 2D
  and a:_data_a213_indexed,X     ; $A141  3D 13 A2
  bne _label_a162                ; $A144  D0 1C
  inc _var_00af                  ; $A146  E6 AF
  jsr _func_e151                 ; $A148  20 51 E1
  jsr _func_e580                 ; $A14B  20 80 E5
  lda (_var_002d_indexed),Y      ; $A14E  B1 2D
  and a:_data_a213_indexed,X     ; $A150  3D 13 A2
  bne _label_a1d2                ; $A153  D0 7D
  inc _var_00af                  ; $A155  E6 AF
  jsr _func_e151                 ; $A157  20 51 E1
  jsr _func_e580                 ; $A15A  20 80 E5
  lda (_var_002d_indexed),Y      ; $A15D  B1 2D
  and a:_data_a213_indexed,X     ; $A15F  3D 13 A2

_label_a162:
  bne _label_a1d2                ; $A162  D0 6E
  inc _var_00af                  ; $A164  E6 AF
  jsr _func_e151                 ; $A166  20 51 E1
  jsr _func_e580                 ; $A169  20 80 E5
  lda (_var_002d_indexed),Y      ; $A16C  B1 2D
  and a:_data_a213_indexed,X     ; $A16E  3D 13 A2
  beq _label_a178                ; $A171  F0 05
  cmp a:_data_a213_indexed,X     ; $A173  DD 13 A2
  bne _label_a1d2                ; $A176  D0 5A

_label_a178:
  inc _var_00af                  ; $A178  E6 AF
  jsr _func_e151                 ; $A17A  20 51 E1
  jsr _func_e580                 ; $A17D  20 80 E5
  lda (_var_002d_indexed),Y      ; $A180  B1 2D
  and a:_data_a213_indexed,X     ; $A182  3D 13 A2
  beq _label_a18c                ; $A185  F0 05
  cmp a:_data_a213_indexed,X     ; $A187  DD 13 A2
  bne _label_a1d9                ; $A18A  D0 4D

_label_a18c:
  inc _var_00af                  ; $A18C  E6 AF
  lda _var_009f                  ; $A18E  A5 9F
  bne _label_a1bd                ; $A190  D0 2B
  lda _var_009e                  ; $A192  A5 9E
  beq _label_a1ab                ; $A194  F0 15
  jsr _func_e151                 ; $A196  20 51 E1
  jsr _func_e580                 ; $A199  20 80 E5
  lda (_var_002d_indexed),Y      ; $A19C  B1 2D
  and a:_data_a213_indexed,X     ; $A19E  3D 13 A2
  cmp a:_data_a21b_indexed,X     ; $A1A1  DD 1B A2
  beq _label_a1d9                ; $A1A4  F0 33
  inc _var_00af                  ; $A1A6  E6 AF
  jmp _label_a1bd                ; $A1A8  4C BD A1

_label_a1ab:
  jsr _func_e151                 ; $A1AB  20 51 E1
  jsr _func_e580                 ; $A1AE  20 80 E5
  lda (_var_002d_indexed),Y      ; $A1B1  B1 2D
  and a:_data_a213_indexed,X     ; $A1B3  3D 13 A2
  cmp a:_data_a217_indexed,X     ; $A1B6  DD 17 A2
  beq _label_a1d9                ; $A1B9  F0 1E
  inc _var_00af                  ; $A1BB  E6 AF

_label_a1bd:
  jsr _func_e151                 ; $A1BD  20 51 E1
  jsr _func_e580                 ; $A1C0  20 80 E5
  lda (_var_002d_indexed),Y      ; $A1C3  B1 2D
  and a:_data_a213_indexed,X     ; $A1C5  3D 13 A2
  beq _label_a1cf                ; $A1C8  F0 05
  cmp a:_data_a213_indexed,X     ; $A1CA  DD 13 A2
  bne _label_a1d9                ; $A1CD  D0 0A

_label_a1cf:
  jmp _label_ad85                ; $A1CF  4C 85 AD

_label_a1d2:
  lda _var_009e                  ; $A1D2  A5 9E
  bne _label_a20e                ; $A1D4  D0 38
  jmp _label_a209                ; $A1D6  4C 09 A2

_label_a1d9:
  lda _var_009f                  ; $A1D9  A5 9F
  bne _label_a1f0                ; $A1DB  D0 13
  lda #$01                       ; $A1DD  A9 01
  sta _var_009f                  ; $A1DF  85 9F
  lda #$02                       ; $A1E1  A9 02
  sta _var_00a0                  ; $A1E3  85 A0
  lda #$00                       ; $A1E5  A9 00
  sta a:_var_0113                ; $A1E7  8D 13 01
  sta a:_var_0119                ; $A1EA  8D 19 01
  jmp _label_a1fe                ; $A1ED  4C FE A1

_label_a1f0:
  lda #$00                       ; $A1F0  A9 00
  sta _var_009f                  ; $A1F2  85 9F
  sta _var_00a0                  ; $A1F4  85 A0
  lda #$00                       ; $A1F6  A9 00
  sta a:_var_0113                ; $A1F8  8D 13 01
  sta a:_var_0119                ; $A1FB  8D 19 01

_label_a1fe:
  lda a:_var_02a4                ; $A1FE  AD A4 02
  cmp #$08                       ; $A201  C9 08
  bcc _label_a20e                ; $A203  90 09
  cmp #$E8                       ; $A205  C9 E8
  bcc _label_a212                ; $A207  90 09

_label_a209:
  lda #$01                       ; $A209  A9 01
  jmp _label_a210                ; $A20B  4C 10 A2

_label_a20e:
  lda #$00                       ; $A20E  A9 00

_label_a210:
  sta _var_009e                  ; $A210  85 9E

_label_a212:
  rts                            ; $A212  60

_data_a213_indexed:
.byte $c0, $30, $0c, $03         ; $A213

_data_a217_indexed:
.byte $40, $10, $04, $01         ; $A217

_data_a21b_indexed:
.byte $80, $20, $08, $02         ; $A21B

_func_a21f:
  lda _var_00ae                  ; $A21F  A5 AE
  bne _label_a224                ; $A221  D0 01
  rts                            ; $A223  60

_label_a224:
  lda a:_var_02a1                ; $A224  AD A1 02
  sta _var_009b                  ; $A227  85 9B
  sta _var_00a1                  ; $A229  85 A1
  jsr _func_e76e                 ; $A22B  20 6E E7
  lda _var_00a1                  ; $A22E  A5 A1
  sta a:_var_02a1                ; $A230  8D A1 02
  lda a:$0145                    ; $A233  AD 45 01
  beq _label_a239                ; $A236  F0 01
  rts                            ; $A238  60

_label_a239:
  lda _var_009f                  ; $A239  A5 9F
  bne _label_a26a                ; $A23B  D0 2D
  lda _var_0065                  ; $A23D  A5 65
  clc                            ; $A23F  18
  adc a:_var_02a1                ; $A240  6D A1 02
  clc                            ; $A243  18
  adc #$08                       ; $A244  69 08
  and #$07                       ; $A246  29 07
  cmp #$06                       ; $A248  C9 06
  beq _label_a258                ; $A24A  F0 0C
  lda a:_var_02a1                ; $A24C  AD A1 02
  clc                            ; $A24F  18
  adc _var_00a0                  ; $A250  65 A0
  sta a:_var_02a1                ; $A252  8D A1 02
  jmp _label_a25b                ; $A255  4C 5B A2

_label_a258:
  inc a:_var_02a1                ; $A258  EE A1 02

_label_a25b:
  lda _var_00a0                  ; $A25B  A5 A0
  cmp #$02                       ; $A25D  C9 02
  beq _label_a267                ; $A25F  F0 06
  clc                            ; $A261  18
  adc a:_var_0113                ; $A262  6D 13 01
  sta _var_00a0                  ; $A265  85 A0

_label_a267:
  jmp _label_a29b                ; $A267  4C 9B A2

_label_a26a:
  lda _var_0065                  ; $A26A  A5 65
  clc                            ; $A26C  18
  adc a:_var_02a1                ; $A26D  6D A1 02
  sec                            ; $A270  38
  sbc #$08                       ; $A271  E9 08
  and #$0F                       ; $A273  29 0F
  beq _label_a287                ; $A275  F0 10
  cmp #$08                       ; $A277  C9 08
  beq _label_a287                ; $A279  F0 0C
  lda a:_var_02a1                ; $A27B  AD A1 02
  sec                            ; $A27E  38
  sbc _var_00a0                  ; $A27F  E5 A0
  sta a:_var_02a1                ; $A281  8D A1 02
  jmp _label_a28a                ; $A284  4C 8A A2

_label_a287:
  dec a:_var_02a1                ; $A287  CE A1 02

_label_a28a:
  lda _var_00a0                  ; $A28A  A5 A0
  beq _label_a297                ; $A28C  F0 09
  sec                            ; $A28E  38
  sbc a:_var_0113                ; $A28F  ED 13 01
  sta _var_00a0                  ; $A292  85 A0
  jmp _label_a29b                ; $A294  4C 9B A2

_label_a297:
  lda #$00                       ; $A297  A9 00
  sta _var_009f                  ; $A299  85 9F

_label_a29b:
  lda _var_009e                  ; $A29B  A5 9E
  beq _label_a2ac                ; $A29D  F0 0D
  lda a:_var_02a4                ; $A29F  AD A4 02
  sec                            ; $A2A2  38
  sbc a:_var_0114                ; $A2A3  ED 14 01
  sta a:_var_02a4                ; $A2A6  8D A4 02
  jmp _label_a2b6                ; $A2A9  4C B6 A2

_label_a2ac:
  lda a:_var_02a4                ; $A2AC  AD A4 02
  clc                            ; $A2AF  18
  adc a:_var_0114                ; $A2B0  6D 14 01
  sta a:_var_02a4                ; $A2B3  8D A4 02

_label_a2b6:
  jsr _func_a0c8                 ; $A2B6  20 C8 A0
  lda a:_var_02a1                ; $A2B9  AD A1 02
  sta _var_00a1                  ; $A2BC  85 A1
  lda a:_var_02a6                ; $A2BE  AD A6 02
  sta _var_0031_indexed          ; $A2C1  85 31
  jsr _func_e714                 ; $A2C3  20 14 E7
  lda _var_0032                  ; $A2C6  A5 32
  sta a:_var_02a1                ; $A2C8  8D A1 02
  lda _var_0031_indexed          ; $A2CB  A5 31
  sta a:_var_02a6                ; $A2CD  8D A6 02
  ldx #$00                       ; $A2D0  A2 00
  lda _var_0050                  ; $A2D2  A5 50
  and #$08                       ; $A2D4  29 08
  beq _label_a2d9                ; $A2D6  F0 01
  inx                            ; $A2D8  E8

_label_a2d9:
  txa                            ; $A2D9  8A
  asl a                          ; $A2DA  0A
  tax                            ; $A2DB  AA
  lda a:_data_a2e9_indexed,X     ; $A2DC  BD E9 A2
  sta a:_var_02a2                ; $A2DF  8D A2 02
  lda a:_data_a2ea_indexed,X     ; $A2E2  BD EA A2
  sta a:_var_02a5                ; $A2E5  8D A5 02
  rts                            ; $A2E8  60

_data_a2e9_indexed:
.byte $a4                        ; $A2E9

_data_a2ea_indexed:
.byte $a6, $a8, $aa              ; $A2EA

_func_a2ed:
  lda #$00                       ; $A2ED  A9 00
  sta _var_00af                  ; $A2EF  85 AF
  tax                            ; $A2F1  AA
  lda _var_0077                  ; $A2F2  A5 77
  beq _label_a2f8                ; $A2F4  F0 02
  ldx #$07                       ; $A2F6  A2 07

_label_a2f8:
  lda _var_00af                  ; $A2F8  A5 AF
  cmp _var_00ab                  ; $A2FA  C5 AB
  beq _label_a30a                ; $A2FC  F0 0C
  ldy _var_00af                  ; $A2FE  A4 AF
  lda a:_var_0073_indexed,Y      ; $A300  B9 73 00
  bne _label_a30b                ; $A303  D0 06

_label_a305:
  inc _var_00af                  ; $A305  E6 AF
  jmp _label_a2f8                ; $A307  4C F8 A2

_label_a30a:
  rts                            ; $A30A  60

_label_a30b:
  jsr _func_d36d                 ; $A30B  20 6D D3
  tay                            ; $A30E  A8
  lda a:_var_02c2_indexed,Y      ; $A30F  B9 C2 02
  bne _label_a305                ; $A312  D0 F1
  lda a:_var_0200_indexed,X      ; $A314  BD 00 02
  sec                            ; $A317  38
  sbc a:_var_02bd_indexed,Y      ; $A318  F9 BD 02
  bcc _label_a305                ; $A31B  90 E8
  cmp #$05                       ; $A31D  C9 05
  bcs _label_a305                ; $A31F  B0 E4
  lda a:_var_0203_indexed,X      ; $A321  BD 03 02
  sec                            ; $A324  38
  sbc a:_var_02c0_indexed,Y      ; $A325  F9 C0 02
  bcs _label_a331                ; $A328  B0 07
  sta _var_002d_indexed          ; $A32A  85 2D
  lda #$00                       ; $A32C  A9 00
  sec                            ; $A32E  38
  sbc _var_002d_indexed          ; $A32F  E5 2D

_label_a331:
  cmp #$0B                       ; $A331  C9 0B
  bcs _label_a305                ; $A333  B0 D0
  ldy _var_00af                  ; $A335  A4 AF
  lda #$00                       ; $A337  A9 00
  sta a:_var_0073_indexed,Y      ; $A339  99 73 00
  jmp _label_a305                ; $A33C  4C 05 A3

_func_a33f:
  ldx #$00                       ; $A33F  A2 00

_label_a341:
  lda #$FF                       ; $A341  A9 FF
  sta _var_00af                  ; $A343  85 AF

_label_a345:
  inc _var_00af                  ; $A345  E6 AF
  lda #$00                       ; $A347  A9 00
  sta _var_002e                  ; $A349  85 2E
  lda _var_00af                  ; $A34B  A5 AF
  cmp _var_00ac                  ; $A34D  C5 AC
  bne _label_a35f                ; $A34F  D0 0E
  cpx #$07                       ; $A351  E0 07
  beq _label_a35e                ; $A353  F0 09
  lda _var_0077                  ; $A355  A5 77
  beq _label_a35e                ; $A357  F0 05
  ldx #$07                       ; $A359  A2 07
  jmp _label_a341                ; $A35B  4C 41 A3

_label_a35e:
  rts                            ; $A35E  60

_label_a35f:
  jsr _func_d36d                 ; $A35F  20 6D D3
  tay                            ; $A362  A8
  lda a:_var_02ad_indexed,Y      ; $A363  B9 AD 02
  bne _label_a345                ; $A366  D0 DD
  lda a:_var_02a8_indexed,Y      ; $A368  B9 A8 02
  sec                            ; $A36B  38
  sbc a:_var_0200_indexed,X      ; $A36C  FD 00 02
  bcc _label_a345                ; $A36F  90 D4
  cmp #$0F                       ; $A371  C9 0F
  bcs _label_a345                ; $A373  B0 D0
  lda a:_var_0203_indexed,X      ; $A375  BD 03 02
  sec                            ; $A378  38
  sbc a:_var_02ab_indexed,Y      ; $A379  F9 AB 02
  bcs _label_a387                ; $A37C  B0 09
  sta _var_002d_indexed          ; $A37E  85 2D
  inc _var_002e                  ; $A380  E6 2E
  lda #$00                       ; $A382  A9 00
  sec                            ; $A384  38
  sbc _var_002d_indexed          ; $A385  E5 2D

_label_a387:
  cmp #$0D                       ; $A387  C9 0D
  bcs _label_a345                ; $A389  B0 BA
  lda a:_var_02ab_indexed,Y      ; $A38B  B9 AB 02
  cmp #$09                       ; $A38E  C9 09
  bcc _label_a345                ; $A390  90 B3
  cmp #$E8                       ; $A392  C9 E8
  bcs _label_a345                ; $A394  B0 AF
  ldy _var_00af                  ; $A396  A4 AF
  lda a:_var_06b5                ; $A398  AD B5 06
  beq _label_a3e5                ; $A39B  F0 48
  cmp #$01                       ; $A39D  C9 01
  beq _label_a3c4                ; $A39F  F0 23
  lda a:_var_0070_indexed,Y      ; $A3A1  B9 70 00
  bne _label_a3b1                ; $A3A4  D0 0B
  tya                            ; $A3A6  98
  bne _label_a345                ; $A3A7  D0 9C
  lda _var_002e                  ; $A3A9  A5 2E
  beq _label_a345                ; $A3AB  F0 98
  lda #$01                       ; $A3AD  A9 01
  bne _label_a3bb                ; $A3AF  D0 0A

_label_a3b1:
  cpy #$03                       ; $A3B1  C0 03
  bne _label_a345                ; $A3B3  D0 90
  lda _var_002e                  ; $A3B5  A5 2E
  bne _label_a345                ; $A3B7  D0 8C
  lda #$00                       ; $A3B9  A9 00

_label_a3bb:
  sta _var_0070_indexed          ; $A3BB  85 70
  sta _var_0071                  ; $A3BD  85 71
  sta _var_0072                  ; $A3BF  85 72
  jmp _label_a345                ; $A3C1  4C 45 A3

_label_a3c4:
  lda a:_var_0070_indexed,Y      ; $A3C4  B9 70 00
  bne _label_a3d4                ; $A3C7  D0 0B
  tya                            ; $A3C9  98
  bne _label_a3e2                ; $A3CA  D0 16
  lda _var_002e                  ; $A3CC  A5 2E
  beq _label_a3e2                ; $A3CE  F0 12
  lda #$01                       ; $A3D0  A9 01
  bne _label_a3de                ; $A3D2  D0 0A

_label_a3d4:
  cpy #$01                       ; $A3D4  C0 01
  bne _label_a3e2                ; $A3D6  D0 0A
  lda _var_002e                  ; $A3D8  A5 2E
  bne _label_a3e2                ; $A3DA  D0 06
  lda #$00                       ; $A3DC  A9 00

_label_a3de:
  sta _var_0070_indexed          ; $A3DE  85 70
  sta _var_0071                  ; $A3E0  85 71

_label_a3e2:
  jmp _label_a345                ; $A3E2  4C 45 A3

_label_a3e5:
  lda _var_002e                  ; $A3E5  A5 2E
  bne _label_a3ee                ; $A3E7  D0 05
  lda #$00                       ; $A3E9  A9 00
  jmp _label_a3f0                ; $A3EB  4C F0 A3

_label_a3ee:
  lda #$01                       ; $A3EE  A9 01

_label_a3f0:
  sta a:_var_0070_indexed,Y      ; $A3F0  99 70 00
  jmp _label_a345                ; $A3F3  4C 45 A3

_label_a3f6:
  jsr _func_d36d                 ; $A3F6  20 6D D3
  tay                            ; $A3F9  A8
  lda a:_var_0298_indexed,Y      ; $A3FA  B9 98 02
  beq _label_a402                ; $A3FD  F0 03
  jmp _label_a4bb                ; $A3FF  4C BB A4

_label_a402:
  ldx _var_00af                  ; $A402  A6 AF
  ldy a:_var_013f                ; $A404  AC 3F 01
  cpy #$05                       ; $A407  C0 05
  bne _label_a40e                ; $A409  D0 03
  jmp _label_a490                ; $A40B  4C 90 A4

_label_a40e:
  lda a:_var_013d_indexed,X      ; $A40E  BD 3D 01
  cmp #$1E                       ; $A411  C9 1E
  bcs _label_a41e                ; $A413  B0 09
  ldy _var_00af                  ; $A415  A4 AF
  jsr _func_d36d                 ; $A417  20 6D D3
  tax                            ; $A41A  AA
  jmp _label_a540                ; $A41B  4C 40 A5

_label_a41e:
  cmp a:_data_a4e0_indexed,Y     ; $A41E  D9 E0 A4
  beq _label_a429                ; $A421  F0 06
  inc a:_var_013d_indexed,X      ; $A423  FE 3D 01
  jmp _label_a4db                ; $A426  4C DB A4

_label_a429:
  jsr _func_d36d                 ; $A429  20 6D D3
  tax                            ; $A42C  AA
  cpy #$00                       ; $A42D  C0 00
  bne _label_a45d                ; $A42F  D0 2C
  ldy _var_00af                  ; $A431  A4 AF
  lda a:_var_0293_indexed,X      ; $A433  BD 93 02
  sta a:_var_0254_indexed        ; $A436  8D 54 02
  lda a:_var_013b_indexed,Y      ; $A439  B9 3B 01
  bne _label_a44f                ; $A43C  D0 11
  lda a:_var_0296_indexed,X      ; $A43E  BD 96 02
  clc                            ; $A441  18
  adc #$10                       ; $A442  69 10
  sta a:_var_0257                ; $A444  8D 57 02
  lda #$43                       ; $A447  A9 43
  sta a:_var_0256                ; $A449  8D 56 02
  jmp _label_a45d                ; $A44C  4C 5D A4

_label_a44f:
  lda a:_var_0296_indexed,X      ; $A44F  BD 96 02
  sec                            ; $A452  38
  sbc #$10                       ; $A453  E9 10
  sta a:_var_0257                ; $A455  8D 57 02
  lda #$03                       ; $A458  A9 03
  sta a:_var_0256                ; $A45A  8D 56 02

_label_a45d:
  ldy _var_00af                  ; $A45D  A4 AF
  lda a:_var_013b_indexed,Y      ; $A45F  B9 3B 01
  bne _label_a476                ; $A462  D0 12
  ldy a:_var_013f                ; $A464  AC 3F 01
  lda a:_data_a4eb_indexed,Y     ; $A467  B9 EB A4
  sta a:_var_0255                ; $A46A  8D 55 02
  lda a:_data_a4e6_indexed,Y     ; $A46D  B9 E6 A4
  sta a:_var_0258                ; $A470  8D 58 02
  jmp _label_a485                ; $A473  4C 85 A4

_label_a476:
  ldy a:_var_013f                ; $A476  AC 3F 01
  lda a:_data_a4e6_indexed,Y     ; $A479  B9 E6 A4
  sta a:_var_0255                ; $A47C  8D 55 02
  lda a:_data_a4eb_indexed,Y     ; $A47F  B9 EB A4
  sta a:_var_0258                ; $A482  8D 58 02

_label_a485:
  ldx _var_00af                  ; $A485  A6 AF
  inc a:_var_013d_indexed,X      ; $A487  FE 3D 01
  inc a:_var_013f                ; $A48A  EE 3F 01
  jmp _label_a4db                ; $A48D  4C DB A4

_label_a490:
  jsr _func_cf34                 ; $A490  20 34 CF
  inc _var_00d0_indexed,X        ; $A493  F6 D0
  jsr _func_d487                 ; $A495  20 87 D4
  lda a:_var_0254_indexed        ; $A498  AD 54 02
  sta a:_var_020e_indexed,X      ; $A49B  9D 0E 02
  lda a:_var_0257                ; $A49E  AD 57 02
  sta a:_var_0211_indexed,X      ; $A4A1  9D 11 02
  lda a:_var_0255                ; $A4A4  AD 55 02
  sta a:_var_020f_indexed,X      ; $A4A7  9D 0F 02
  lda a:_var_0258                ; $A4AA  AD 58 02
  sta a:_var_0212_indexed,X      ; $A4AD  9D 12 02
  lda a:_var_0256                ; $A4B0  AD 56 02
  sta a:_var_0210_indexed,X      ; $A4B3  9D 10 02
  lda #$00                       ; $A4B6  A9 00
  sta a:_var_0213_indexed,X      ; $A4B8  9D 13 02

_label_a4bb:
  lda #$EF                       ; $A4BB  A9 EF
  sta a:_var_0254_indexed        ; $A4BD  8D 54 02
  sta a:_var_0255                ; $A4C0  8D 55 02
  ldx _var_00af                  ; $A4C3  A6 AF
  lda #$00                       ; $A4C5  A9 00
  sta a:_var_013d_indexed,X      ; $A4C7  9D 3D 01
  sta a:_var_013f                ; $A4CA  8D 3F 01
  lda a:_var_013b_indexed,X      ; $A4CD  BD 3B 01
  bne _label_a4d8                ; $A4D0  D0 06
  inc a:_var_013b_indexed,X      ; $A4D2  FE 3B 01
  jmp _label_a4db                ; $A4D5  4C DB A4

_label_a4d8:
  dec a:_var_013b_indexed,X      ; $A4D8  DE 3B 01

_label_a4db:
  inc _var_00af                  ; $A4DB  E6 AF
  jmp _label_a4f4                ; $A4DD  4C F4 A4

_data_a4e0_indexed:
.byte $1e, $28, $32, $3c, $46, $50 ; $A4E0

_data_a4e6_indexed:
.byte $90, $94, $98, $10, $10    ; $A4E6

_data_a4eb_indexed:
.byte $92, $96, $9a, $12, $12    ; $A4EB

_func_a4f0:
  lda #$00                       ; $A4F0  A9 00
  sta _var_00af                  ; $A4F2  85 AF

_label_a4f4:
  lda _var_00ad                  ; $A4F4  A5 AD
  cmp _var_00af                  ; $A4F6  C5 AF
  bne _label_a4fb                ; $A4F8  D0 01
  rts                            ; $A4FA  60

_label_a4fb:
  jsr _func_d36d                 ; $A4FB  20 6D D3
  tax                            ; $A4FE  AA
  ldy _var_00af                  ; $A4FF  A4 AF
  lda a:_var_0293_indexed,X      ; $A501  BD 93 02
  sta _var_0032                  ; $A504  85 32

_data_a506:
  lda a:_var_0298_indexed,X      ; $A506  BD 98 02
  sta _var_0031_indexed          ; $A509  85 31
  jsr _func_e70b                 ; $A50B  20 0B E7
  lda _var_0032                  ; $A50E  A5 32
  sta a:_var_0293_indexed,X      ; $A510  9D 93 02
  lda _var_0031_indexed          ; $A513  A5 31
  sta a:_var_0298_indexed,X      ; $A515  9D 98 02
  lda a:_var_0143_indexed,Y      ; $A518  B9 43 01
  beq _label_a522                ; $A51B  F0 05
  inc _var_00af                  ; $A51D  E6 AF
  jmp _label_a4f4                ; $A51F  4C F4 A4

_label_a522:
  lda a:_var_013d_indexed,Y      ; $A522  B9 3D 01
  beq _label_a540                ; $A525  F0 19
  lda a:_var_013f                ; $A527  AD 3F 01
  beq _label_a538                ; $A52A  F0 0C
  lda a:_var_0293_indexed,X      ; $A52C  BD 93 02
  sta a:_var_0254_indexed        ; $A52F  8D 54 02
  lda a:_var_0298_indexed,X      ; $A532  BD 98 02
  sta a:_var_0259                ; $A535  8D 59 02

_label_a538:
  lda a:_var_013d_indexed,Y      ; $A538  B9 3D 01
  beq _label_a540                ; $A53B  F0 03
  jmp _label_a3f6                ; $A53D  4C F6 A3

_label_a540:
  lda a:_var_0296_indexed,X      ; $A540  BD 96 02
  and #$07                       ; $A543  29 07
  beq _label_a54a                ; $A545  F0 03
  jmp _label_a67e                ; $A547  4C 7E A6

_label_a54a:
  lda #$00                       ; $A54A  A9 00
  sta _var_0032                  ; $A54C  85 32
  lda a:_var_0293_indexed,X      ; $A54E  BD 93 02
  sta _var_00a1                  ; $A551  85 A1
  cmp #$EF                       ; $A553  C9 EF
  bne _label_a55d                ; $A555  D0 06
  inc _var_0032                  ; $A557  E6 32
  lda #$FF                       ; $A559  A9 FF
  sta _var_00a1                  ; $A55B  85 A1

_label_a55d:
  lda a:_var_0296_indexed,X      ; $A55D  BD 96 02
  sta _var_00a2                  ; $A560  85 A2
  jsr _func_d063                 ; $A562  20 63 D0
  lda a:_var_0298_indexed,X      ; $A565  BD 98 02
  sta _var_004d                  ; $A568  85 4D
  cmp #$01                       ; $A56A  C9 01
  beq _label_a574                ; $A56C  F0 06
  lda _var_0032                  ; $A56E  A5 32
  beq _label_a574                ; $A570  F0 02
  inc _var_004d                  ; $A572  E6 4D

_label_a574:
  jsr _func_cca9                 ; $A574  20 A9 CC
  jsr _func_a6fb                 ; $A577  20 FB A6
  ldy _var_0056                  ; $A57A  A4 56
  ldx _var_005b                  ; $A57C  A6 5B
  lda _var_0052                  ; $A57E  A5 52
  bne _label_a588                ; $A580  D0 06
  lda a:_var_0400_indexed,Y      ; $A582  B9 00 04
  jmp _label_a58b                ; $A585  4C 8B A5

_label_a588:
  lda a:_var_0480_indexed,Y      ; $A588  B9 80 04

_label_a58b:
  and a:_data_a6ef_indexed,X     ; $A58B  3D EF A6
  bne _label_a5b9                ; $A58E  D0 29
  lda _var_0052                  ; $A590  A5 52
  bne _label_a59a                ; $A592  D0 06
  lda a:_var_0580_indexed,Y      ; $A594  B9 80 05
  jmp _label_a59d                ; $A597  4C 9D A5

_label_a59a:
  lda a:_var_0500_indexed,Y      ; $A59A  B9 00 05

_label_a59d:
  and a:_data_a6ef_indexed,X     ; $A59D  3D EF A6
  bne _label_a5b9                ; $A5A0  D0 17
  jsr _func_d41a                 ; $A5A2  20 1A D4
  ldy _var_0056                  ; $A5A5  A4 56
  lda _var_0052                  ; $A5A7  A5 52
  bne _label_a5b1                ; $A5A9  D0 06
  lda a:_var_0580_indexed,Y      ; $A5AB  B9 80 05
  jmp _label_a5b4                ; $A5AE  4C B4 A5

_label_a5b1:
  lda a:_var_0500_indexed,Y      ; $A5B1  B9 00 05

_label_a5b4:
  and a:_data_a6ef_indexed,X     ; $A5B4  3D EF A6
  beq _label_a5bc                ; $A5B7  F0 03

_label_a5b9:
  jmp _label_a659                ; $A5B9  4C 59 A6

_label_a5bc:
  lda _var_0052                  ; $A5BC  A5 52
  beq _label_a5de                ; $A5BE  F0 1E
  jsr _func_d407                 ; $A5C0  20 07 D4
  jsr _func_d407                 ; $A5C3  20 07 D4
  ldy _var_0056                  ; $A5C6  A4 56
  lda a:_var_0480_indexed,Y      ; $A5C8  B9 80 04
  and a:_data_a6ef_indexed,X     ; $A5CB  3D EF A6
  cmp a:_data_a6ef_indexed,X     ; $A5CE  DD EF A6
  beq _label_a5de                ; $A5D1  F0 0B
  lda a:_var_0380_indexed,Y      ; $A5D3  B9 80 03
  and a:_data_a6ef_indexed,X     ; $A5D6  3D EF A6
  cmp a:_data_a6ef_indexed,X     ; $A5D9  DD EF A6
  bne _label_a5e1                ; $A5DC  D0 03

_label_a5de:
  jmp _label_a67e                ; $A5DE  4C 7E A6

_label_a5e1:
  lda _var_0052                  ; $A5E1  A5 52
  beq _label_a62f                ; $A5E3  F0 4A
  jsr _func_d41a                 ; $A5E5  20 1A D4
  ldy _var_00af                  ; $A5E8  A4 AF
  lda a:_var_013b_indexed,Y      ; $A5EA  B9 3B 01
  bne _label_a5f2                ; $A5ED  D0 03
  jsr _func_a6fb                 ; $A5EF  20 FB A6

_label_a5f2:
  ldy _var_0056                  ; $A5F2  A4 56
  ldx _var_005b                  ; $A5F4  A6 5B
  lda a:_var_0400_indexed,Y      ; $A5F6  B9 00 04
  and a:_data_a6ef_indexed,X     ; $A5F9  3D EF A6
  bne _label_a659                ; $A5FC  D0 5B
  ldy _var_00af                  ; $A5FE  A4 AF
  lda a:_var_013b_indexed,Y      ; $A600  B9 3B 01
  bne _label_a615                ; $A603  D0 10
  ldy _var_0056                  ; $A605  A4 56
  lda a:_var_0580_indexed,Y      ; $A607  B9 80 05
  and a:_data_a6ef_indexed,X     ; $A60A  3D EF A6
  cmp a:_data_a6f3_indexed,X     ; $A60D  DD F3 A6
  beq _label_a659                ; $A610  F0 47
  jmp _label_a622                ; $A612  4C 22 A6

_label_a615:
  ldy _var_0056                  ; $A615  A4 56
  lda a:_var_0580_indexed,Y      ; $A617  B9 80 05
  and a:_data_a6ef_indexed,X     ; $A61A  3D EF A6
  cmp a:_data_a6f7_indexed,X     ; $A61D  DD F7 A6
  beq _label_a659                ; $A620  F0 37

_label_a622:
  jsr _func_d41a                 ; $A622  20 1A D4
  ldy _var_0056                  ; $A625  A4 56
  lda a:_var_0580_indexed,Y      ; $A627  B9 80 05
  and a:_data_a6ef_indexed,X     ; $A62A  3D EF A6
  bne _label_a659                ; $A62D  D0 2A

_label_a62f:
  jsr _func_d36d                 ; $A62F  20 6D D3
  tay                            ; $A632  A8
  lda a:_var_0296_indexed,Y      ; $A633  B9 96 02
  cmp #$E8                       ; $A636  C9 E8
  bcs _label_a659                ; $A638  B0 1F
  cmp #$09                       ; $A63A  C9 09
  bcc _label_a659                ; $A63C  90 1B
  ldx _var_00af                  ; $A63E  A6 AF
  lda a:_var_013d_indexed,X      ; $A640  BD 3D 01
  bne _label_a64f                ; $A643  D0 0A
  lda a:_var_013d_indexed        ; $A645  AD 3D 01
  bne _label_a659                ; $A648  D0 0F
  lda a:_var_013e                ; $A64A  AD 3E 01
  bne _label_a659                ; $A64D  D0 0A

_label_a64f:
  inc a:_var_013d_indexed,X      ; $A64F  FE 3D 01
  lda #$00                       ; $A652  A9 00
  sta _var_003b_indexed,X        ; $A654  95 3B
  jmp _label_a6a4                ; $A656  4C A4 A6

_label_a659:
  ldx _var_00af                  ; $A659  A6 AF
  lda #$00                       ; $A65B  A9 00
  sta _var_0039_indexed,X        ; $A65D  95 39
  sta a:_var_013d_indexed,X      ; $A65F  9D 3D 01
  inc _var_003b_indexed,X        ; $A662  F6 3B
  lda _var_003b_indexed,X        ; $A664  B5 3B
  cmp #$03                       ; $A666  C9 03
  bcs _label_a6e6                ; $A668  B0 7C
  ldy _var_00af                  ; $A66A  A4 AF
  lda a:_var_013b_indexed,Y      ; $A66C  B9 3B 01
  beq _label_a676                ; $A66F  F0 05
  lda #$00                       ; $A671  A9 00
  jmp _label_a678                ; $A673  4C 78 A6

_label_a676:
  lda #$01                       ; $A676  A9 01

_label_a678:
  sta a:_var_013b_indexed,Y      ; $A678  99 3B 01
  jmp _label_a6a4                ; $A67B  4C A4 A6

_label_a67e:
  jmp _func_a000                 ; $A67E  4C 00 A0

_label_a681:
  jsr _func_d36d                 ; $A681  20 6D D3
  tay                            ; $A684  A8
  ldx _var_00af                  ; $A685  A6 AF
  lda #$00                       ; $A687  A9 00
  sta _var_003b_indexed,X        ; $A689  95 3B
  lda a:_var_013b_indexed,X      ; $A68B  BD 3B 01
  bne _label_a69a                ; $A68E  D0 0A
  lda a:_var_0296_indexed,Y      ; $A690  B9 96 02
  clc                            ; $A693  18
  adc a:_var_0112                ; $A694  6D 12 01
  jmp _label_a6a1                ; $A697  4C A1 A6

_label_a69a:
  lda a:_var_0296_indexed,Y      ; $A69A  B9 96 02
  sec                            ; $A69D  38
  sbc a:_var_0112                ; $A69E  ED 12 01

_label_a6a1:
  sta a:_var_0296_indexed,Y      ; $A6A1  99 96 02

_label_a6a4:
  jsr _func_d36d                 ; $A6A4  20 6D D3
  tay                            ; $A6A7  A8
  ldx _var_00af                  ; $A6A8  A6 AF
  lda #$00                       ; $A6AA  A9 00
  sta _var_0032                  ; $A6AC  85 32
  lda _var_0050                  ; $A6AE  A5 50
  and #$08                       ; $A6B0  29 08
  beq _label_a6b6                ; $A6B2  F0 02
  inc _var_0032                  ; $A6B4  E6 32

_label_a6b6:
  lda _var_0032                  ; $A6B6  A5 32
  asl a                          ; $A6B8  0A
  sta _var_0032                  ; $A6B9  85 32
  lda a:_var_013b_indexed,X      ; $A6BB  BD 3B 01
  bne _label_a6d3                ; $A6BE  D0 13
  ldx _var_0032                  ; $A6C0  A6 32
  lda a:_data_a6eb_indexed,X     ; $A6C2  BD EB A6
  sta a:_var_0294_indexed,Y      ; $A6C5  99 94 02
  lda a:_data_a6ec_indexed,X     ; $A6C8  BD EC A6
  sta a:_var_0297_indexed,Y      ; $A6CB  99 97 02
  lda #$03                       ; $A6CE  A9 03
  jmp _label_a6e3                ; $A6D0  4C E3 A6

_label_a6d3:
  ldx _var_0032                  ; $A6D3  A6 32
  lda a:_data_a6eb_indexed,X     ; $A6D5  BD EB A6
  sta a:_var_0297_indexed,Y      ; $A6D8  99 97 02
  lda a:_data_a6ec_indexed,X     ; $A6DB  BD EC A6
  sta a:_var_0294_indexed,Y      ; $A6DE  99 94 02
  lda #$43                       ; $A6E1  A9 43

_label_a6e3:
  sta a:_var_0295_indexed,Y      ; $A6E3  99 95 02

_label_a6e6:
  inc _var_00af                  ; $A6E6  E6 AF
  jmp _label_a4f4                ; $A6E8  4C F4 A4

_data_a6eb_indexed:
.byte $88                        ; $A6EB

_data_a6ec_indexed:
.byte $8a, $8c, $8e              ; $A6EC

_data_a6ef_indexed:
.byte $c0, $30, $0c, $03         ; $A6EF

_data_a6f3_indexed:
.byte $40, $10, $04, $01         ; $A6F3

_data_a6f7_indexed:
.byte $80, $20, $08, $02         ; $A6F7

_func_a6fb:
  lda a:_var_013b_indexed,Y      ; $A6FB  B9 3B 01
  bne _label_a70f                ; $A6FE  D0 0F
  lda _var_005b                  ; $A700  A5 5B
  cmp #$03                       ; $A702  C9 03
  bne _label_a70c                ; $A704  D0 06
  lda #$FF                       ; $A706  A9 FF
  sta _var_005b                  ; $A708  85 5B
  inc _var_0056                  ; $A70A  E6 56

_label_a70c:
  inc _var_005b                  ; $A70C  E6 5B
  rts                            ; $A70E  60

_label_a70f:
  lda _var_005b                  ; $A70F  A5 5B
  bne _label_a719                ; $A711  D0 06
  lda #$04                       ; $A713  A9 04
  sta _var_005b                  ; $A715  85 5B
  dec _var_0056                  ; $A717  C6 56

_label_a719:
  dec _var_005b                  ; $A719  C6 5B
  rts                            ; $A71B  60

_func_a71c:
  lda #$00                       ; $A71C  A9 00
  sta _var_00af                  ; $A71E  85 AF
  sta a:_var_06a9                ; $A720  8D A9 06

_label_a723:
  lda _var_00af                  ; $A723  A5 AF
  cmp _var_00ac                  ; $A725  C5 AC
  bne _label_a74b                ; $A727  D0 22
  lda #$03                       ; $A729  A9 03
  sta _var_00af                  ; $A72B  85 AF

_label_a72d:
  lda _var_00af                  ; $A72D  A5 AF
  sec                            ; $A72F  38
  sbc #$03                       ; $A730  E9 03
  cmp _var_00ab                  ; $A732  C5 AB
  bne _label_a74b                ; $A734  D0 15
  ldx #$05                       ; $A736  A2 05

_label_a738:
  lda a:_var_0101_indexed,X      ; $A738  BD 01 01
  bne _label_a741                ; $A73B  D0 04
  dex                            ; $A73D  CA
  bpl _label_a738                ; $A73E  10 F8
  rts                            ; $A740  60

_label_a741:
  lda #$00                       ; $A741  A9 00
  sta _var_0043                  ; $A743  85 43
  sta _var_009c                  ; $A745  85 9C
  rts                            ; $A747  60

_label_a748:
  jmp _label_a7c9                ; $A748  4C C9 A7

_label_a74b:
  jsr _func_d36d                 ; $A74B  20 6D D3
  tay                            ; $A74E  A8
  ldx _var_00af                  ; $A74F  A6 AF
  lda a:_var_0101_indexed,X      ; $A751  BD 01 01
  sta a:_var_0107_indexed,X      ; $A754  9D 07 01
  lda #$00                       ; $A757  A9 00
  sta a:_var_0101_indexed,X      ; $A759  9D 01 01
  sta _var_0031_indexed          ; $A75C  85 31
  sta _var_0032                  ; $A75E  85 32
  lda a:_var_02ad_indexed,Y      ; $A760  B9 AD 02
  bne _label_a748                ; $A763  D0 E3
  lda a:_var_0200_indexed        ; $A765  AD 00 02
  clc                            ; $A768  18
  adc #$10                       ; $A769  69 10
  sec                            ; $A76B  38
  sbc a:_var_02a8_indexed,Y      ; $A76C  F9 A8 02
  bcc _label_a748                ; $A76F  90 D7
  sta _var_002e                  ; $A771  85 2E
  cmp #$03                       ; $A773  C9 03
  bcc _label_a77d                ; $A775  90 06
  cmp #$08                       ; $A777  C9 08
  bcs _label_a748                ; $A779  B0 CD
  inc _var_0031_indexed          ; $A77B  E6 31

_label_a77d:
  lda a:_var_0203_indexed        ; $A77D  AD 03 02
  sec                            ; $A780  38
  sbc a:_var_02ab_indexed,Y      ; $A781  F9 AB 02
  bcs _label_a78f                ; $A784  B0 09
  sta _var_002d_indexed          ; $A786  85 2D
  inc _var_0032                  ; $A788  E6 32
  lda #$00                       ; $A78A  A9 00
  sec                            ; $A78C  38
  sbc _var_002d_indexed          ; $A78D  E5 2D

_label_a78f:
  cmp #$09                       ; $A78F  C9 09
  bcs _label_a7c9                ; $A791  B0 36
  sta _var_002d_indexed          ; $A793  85 2D
  cmp #$05                       ; $A795  C9 05
  bcc _label_a79f                ; $A797  90 06
  lda _var_00af                  ; $A799  A5 AF
  cmp #$03                       ; $A79B  C9 03
  bcs _label_a7c9                ; $A79D  B0 2A

_label_a79f:
  lda _var_002d_indexed          ; $A79F  A5 2D
  cmp #$05                       ; $A7A1  C9 05
  bcc _label_a7a8                ; $A7A3  90 03
  inc a:_var_06a9                ; $A7A5  EE A9 06

_label_a7a8:
  lda _var_0031_indexed          ; $A7A8  A5 31
  bne _label_a7ba                ; $A7AA  D0 0E
  inc a:_var_0101_indexed,X      ; $A7AC  FE 01 01
  lda #$38                       ; $A7AF  A9 38
  sta a:_var_0371                ; $A7B1  8D 71 03
  sta a:_var_0372                ; $A7B4  8D 72 03
  sta a:_var_0373                ; $A7B7  8D 73 03

_label_a7ba:
  cpx #$03                       ; $A7BA  E0 03
  bcs _label_a7c5                ; $A7BC  B0 07
  lda _var_002e                  ; $A7BE  A5 2E
  sta _var_0032                  ; $A7C0  85 32
  jsr _func_c242                 ; $A7C2  20 42 C2

_label_a7c5:
  lda _var_0031_indexed          ; $A7C5  A5 31
  bne _label_a7eb                ; $A7C7  D0 22

_label_a7c9:
  lda a:_var_0101_indexed,X      ; $A7C9  BD 01 01
  bne _label_a803                ; $A7CC  D0 35
  cmp a:_var_0107_indexed,X      ; $A7CE  DD 07 01
  beq _label_a7f5                ; $A7D1  F0 22
  ldy #$04                       ; $A7D3  A0 04

_label_a7d5:
  ldx #$05                       ; $A7D5  A2 05
  lda a:_var_0368_indexed,Y      ; $A7D7  B9 68 03

_label_a7da:
  cmp a:_data_eac5_indexed,X     ; $A7DA  DD C5 EA
  beq _label_a7f5                ; $A7DD  F0 16
  dex                            ; $A7DF  CA
  bpl _label_a7da                ; $A7E0  10 F8
  cpy #$07                       ; $A7E2  C0 07
  beq _label_a7eb                ; $A7E4  F0 05
  ldy #$07                       ; $A7E6  A0 07
  jmp _label_a7d5                ; $A7E8  4C D5 A7

_label_a7eb:
  lda #$06                       ; $A7EB  A9 06
  sta _var_0043                  ; $A7ED  85 43
  lda #$00                       ; $A7EF  A9 00
  sta _var_0046                  ; $A7F1  85 46
  inc _var_009c                  ; $A7F3  E6 9C

_label_a7f5:
  inc _var_00af                  ; $A7F5  E6 AF
  lda _var_00af                  ; $A7F7  A5 AF
  cmp #$04                       ; $A7F9  C9 04
  bcs _label_a800                ; $A7FB  B0 03
  jmp _label_a723                ; $A7FD  4C 23 A7

_label_a800:
  jmp _label_a72d                ; $A800  4C 2D A7

_label_a803:
  lda _var_00af                  ; $A803  A5 AF
  cmp #$03                       ; $A805  C9 03
  bcc _label_a7f5                ; $A807  90 EC
  lda a:_var_0107_indexed,X      ; $A809  BD 07 01
  bne _label_a7f5                ; $A80C  D0 E7
  lda a:_var_06a9                ; $A80E  AD A9 06
  beq _label_a7f5                ; $A811  F0 E2
  lda _var_0032                  ; $A813  A5 32
  beq _label_a820                ; $A815  F0 09
  lda a:_var_02ab_indexed,Y      ; $A817  B9 AB 02
  sec                            ; $A81A  38
  sbc #$04                       ; $A81B  E9 04
  jmp _label_a826                ; $A81D  4C 26 A8

_label_a820:
  lda a:_var_02ab_indexed,Y      ; $A820  B9 AB 02
  clc                            ; $A823  18
  adc #$04                       ; $A824  69 04

_label_a826:
  sta a:_var_0203_indexed        ; $A826  8D 03 02
  jmp _label_a7f5                ; $A829  4C F5 A7

_func_a82c:
  lda #$00                       ; $A82C  A9 00
  sta _var_00af                  ; $A82E  85 AF

_label_a830:
  lda _var_00ac                  ; $A830  A5 AC
  cmp _var_00af                  ; $A832  C5 AF
  bne _label_a839                ; $A834  D0 03
  jmp _label_ae26                ; $A836  4C 26 AE

_label_a839:
  jsr _func_d36d                 ; $A839  20 6D D3
  tax                            ; $A83C  AA
  ldy _var_00af                  ; $A83D  A4 AF
  lda a:_var_02a8_indexed,X      ; $A83F  BD A8 02
  sta _var_0032                  ; $A842  85 32
  lda a:_var_02ad_indexed,X      ; $A844  BD AD 02
  sta _var_0031_indexed          ; $A847  85 31
  jsr _func_e70b                 ; $A849  20 0B E7
  lda _var_0032                  ; $A84C  A5 32
  sta a:_var_02a8_indexed,X      ; $A84E  9D A8 02
  lda _var_0031_indexed          ; $A851  A5 31
  sta a:_var_02ad_indexed,X      ; $A853  9D AD 02
  lda a:_var_02ab_indexed,X      ; $A856  BD AB 02
  and #$07                       ; $A859  29 07
  beq _label_a860                ; $A85B  F0 03
  jmp _label_a901                ; $A85D  4C 01 A9

_label_a860:
  lda a:_var_02a8_indexed,X      ; $A860  BD A8 02
  sta _var_00a1                  ; $A863  85 A1
  cmp #$EF                       ; $A865  C9 EF
  bne _label_a872                ; $A867  D0 09
  lda a:_var_02ad_indexed,X      ; $A869  BD AD 02
  cmp #$FF                       ; $A86C  C9 FF
  bne _label_a872                ; $A86E  D0 02
  sta _var_00a1                  ; $A870  85 A1

_label_a872:
  lda a:_var_02ab_indexed,X      ; $A872  BD AB 02
  sta _var_00a2                  ; $A875  85 A2
  jsr _func_d063                 ; $A877  20 63 D0
  lda a:_var_02ad_indexed,X      ; $A87A  BD AD 02
  sta _var_004d                  ; $A87D  85 4D
  cmp #$FF                       ; $A87F  C9 FF
  bne _label_a88a                ; $A881  D0 07
  lda a:_var_02a8_indexed,X      ; $A883  BD A8 02
  cmp #$EF                       ; $A886  C9 EF
  beq _label_a88d                ; $A888  F0 03

_label_a88a:
  jsr _func_cca9                 ; $A88A  20 A9 CC

_label_a88d:
  ldx _var_00af                  ; $A88D  A6 AF
  lda _var_0070_indexed,X        ; $A88F  B5 70
  asl a                          ; $A891  0A
  tax                            ; $A892  AA
  lda a:_data_a981_indexed,X     ; $A893  BD 81 A9
  sta _var_002d_indexed          ; $A896  85 2D
  lda a:_data_a982_indexed,X     ; $A898  BD 82 A9
  sta _var_002e                  ; $A89B  85 2E
  lda #$00                       ; $A89D  A9 00
  sta _var_0032                  ; $A89F  85 32
  jsr _func_a963                 ; $A8A1  20 63 A9
  jsr _func_a92d                 ; $A8A4  20 2D A9
  lda (_var_002f_indexed),Y      ; $A8A7  B1 2F
  and a:_data_acf9_indexed,X     ; $A8A9  3D F9 AC
  bne _label_a8e8                ; $A8AC  D0 3A
  inc _var_0032                  ; $A8AE  E6 32
  jsr _func_a963                 ; $A8B0  20 63 A9
  jsr _func_a92d                 ; $A8B3  20 2D A9
  lda (_var_002f_indexed),Y      ; $A8B6  B1 2F
  and a:_data_acf9_indexed,X     ; $A8B8  3D F9 AC
  beq _label_a8c3                ; $A8BB  F0 06
  ldy _var_0031_indexed          ; $A8BD  A4 31
  cmp (_var_002d_indexed),Y      ; $A8BF  D1 2D
  bne _label_a8e8                ; $A8C1  D0 25

_label_a8c3:
  lda _var_0052                  ; $A8C3  A5 52
  cmp #$01                       ; $A8C5  C9 01
  bne _label_a8d6                ; $A8C7  D0 0D
  lda a:_var_0380_indexed,Y      ; $A8C9  B9 80 03
  and a:_data_acf9_indexed,X     ; $A8CC  3D F9 AC
  beq _label_a8d6                ; $A8CF  F0 05

_data_a8d1:
  cmp a:_data_acf9_indexed,X     ; $A8D1  DD F9 AC
  beq _label_a8e8                ; $A8D4  F0 12

_label_a8d6:
  inc _var_0032                  ; $A8D6  E6 32
  jsr _func_d41a                 ; $A8D8  20 1A D4
  jsr _func_a963                 ; $A8DB  20 63 A9
  jsr _func_a92d                 ; $A8DE  20 2D A9
  lda (_var_002f_indexed),Y      ; $A8E1  B1 2F
  and a:_data_acf9_indexed,X     ; $A8E3  3D F9 AC
  beq _label_a901                ; $A8E6  F0 19

_label_a8e8:
  ldy _var_00af                  ; $A8E8  A4 AF
  lda a:_var_0070_indexed,Y      ; $A8EA  B9 70 00
  bne _label_a8f4                ; $A8ED  D0 05
  lda #$01                       ; $A8EF  A9 01
  jmp _label_a8f6                ; $A8F1  4C F6 A8

_label_a8f4:
  lda #$00                       ; $A8F4  A9 00

_label_a8f6:
  sta a:_var_0070_indexed,Y      ; $A8F6  99 70 00
  tya                            ; $A8F9  98
  sta _var_005d                  ; $A8FA  85 5D

_label_a8fc:
  inc _var_00af                  ; $A8FC  E6 AF
  jmp _label_a830                ; $A8FE  4C 30 A8

_label_a901:
  jsr _func_d36d                 ; $A901  20 6D D3
  tay                            ; $A904  A8
  ldx _var_00af                  ; $A905  A6 AF
  lda _var_0070_indexed,X        ; $A907  B5 70
  beq _label_a91c                ; $A909  F0 11
  lda a:_var_02ab_indexed,Y      ; $A90B  B9 AB 02
  clc                            ; $A90E  18
  adc a:_var_0114                ; $A90F  6D 14 01
  sta a:_var_02ab_indexed,Y      ; $A912  99 AB 02
  cmp #$E8                       ; $A915  C9 E8
  bcc _label_a8fc                ; $A917  90 E3
  jmp _label_a8e8                ; $A919  4C E8 A8

_label_a91c:
  lda a:_var_02ab_indexed,Y      ; $A91C  B9 AB 02
  sec                            ; $A91F  38
  sbc a:_var_0114                ; $A920  ED 14 01
  sta a:_var_02ab_indexed,Y      ; $A923  99 AB 02
  cmp #$09                       ; $A926  C9 09
  bcs _label_a8fc                ; $A928  B0 D2
  jmp _label_a8e8                ; $A92A  4C E8 A8

_func_a92d:
  ldx _var_00af                  ; $A92D  A6 AF
  ldy _var_0056                  ; $A92F  A4 56
  lda _var_0032                  ; $A931  A5 32
  bne _label_a944                ; $A933  D0 0F
  lda _var_0070_indexed,X        ; $A935  B5 70
  bne _label_a940                ; $A937  D0 07
  lda _var_0052                  ; $A939  A5 52
  beq _label_a955                ; $A93B  F0 18

_label_a93d:
  ldx _var_005b                  ; $A93D  A6 5B
  rts                            ; $A93F  60

_label_a940:
  lda _var_0052                  ; $A940  A5 52
  beq _label_a93d                ; $A942  F0 F9

_label_a944:
  lda _var_0070_indexed,X        ; $A944  B5 70
  beq _label_a955                ; $A946  F0 0D
  ldx _var_005b                  ; $A948  A6 5B
  cpx #$03                       ; $A94A  E0 03
  bne _label_a951                ; $A94C  D0 03
  ldx #$FF                       ; $A94E  A2 FF
  iny                            ; $A950  C8

_label_a951:
  inx                            ; $A951  E8
  jmp _label_a95f                ; $A952  4C 5F A9

_label_a955:
  ldx _var_005b                  ; $A955  A6 5B
  cpx #$00                       ; $A957  E0 00
  bne _label_a95e                ; $A959  D0 03
  ldx #$04                       ; $A95B  A2 04
  dey                            ; $A95D  88

_label_a95e:
  dex                            ; $A95E  CA

_label_a95f:
  txa                            ; $A95F  8A
  sta _var_0031_indexed          ; $A960  85 31
  rts                            ; $A962  60

_func_a963:
  lda _var_0032                  ; $A963  A5 32
  asl a                          ; $A965  0A
  tax                            ; $A966  AA
  lda _var_0052                  ; $A967  A5 52
  bne _label_a976                ; $A969  D0 0B
  lda a:_data_a985_indexed,X     ; $A96B  BD 85 A9
  sta _var_002f_indexed          ; $A96E  85 2F
  lda a:_data_a986_indexed,X     ; $A970  BD 86 A9
  sta _var_0030                  ; $A973  85 30
  rts                            ; $A975  60

_label_a976:
  lda a:_data_a98b_indexed,X     ; $A976  BD 8B A9
  sta _var_002f_indexed          ; $A979  85 2F
  lda a:_data_a98c_indexed,X     ; $A97B  BD 8C A9
  sta _var_0030                  ; $A97E  85 30
  rts                            ; $A980  60

_data_a981_indexed:
.byte $fd                        ; $A981

_data_a982_indexed:
.byte $ac, $01, $ad              ; $A982

_data_a985_indexed:
.byte $80                        ; $A985

_data_a986_indexed:
.byte $04, $00, $04, $80, $05    ; $A986

_data_a98b_indexed:
.byte $00                        ; $A98B

_data_a98c_indexed:
.byte $04, $80, $04, $00, $05    ; $A98C

_label_a991:
  lda _var_0077                  ; $A991  A5 77
  bne _label_a99e                ; $A993  D0 09
  lda a:_var_010f                ; $A995  AD 0F 01
  bne _label_a99e                ; $A998  D0 04
  lda _var_0081                  ; $A99A  A5 81
  bne _label_a9a5                ; $A99C  D0 07

_label_a99e:
  lda #$00                       ; $A99E  A9 00
  sta _var_0081                  ; $A9A0  85 81
  jmp _label_ef48                ; $A9A2  4C 48 EF

_label_a9a5:
  cmp #$02                       ; $A9A5  C9 02
  bcs _label_a9bf                ; $A9A7  B0 16
  lda #$02                       ; $A9A9  A9 02
  sta a:_var_024f                ; $A9AB  8D 4F 02
  lda #$00                       ; $A9AE  A9 00
  sta a:$0252                    ; $A9B0  8D 52 02
  lda #$FA                       ; $A9B3  A9 FA
  sta a:_var_024e                ; $A9B5  8D 4E 02
  lda #$CA                       ; $A9B8  A9 CA
  sta a:_var_0251                ; $A9BA  8D 51 02
  inc _var_0081                  ; $A9BD  E6 81

_label_a9bf:
  lda _var_004b                  ; $A9BF  A5 4B
  and #$03                       ; $A9C1  29 03
  beq _label_a9c8                ; $A9C3  F0 03
  jmp _label_aa49                ; $A9C5  4C 49 AA

_label_a9c8:
  lda _var_004b                  ; $A9C8  A5 4B
  and #$C0                       ; $A9CA  29 C0
  beq _label_a9f6                ; $A9CC  F0 28
  and #$80                       ; $A9CE  29 80
  beq _label_a9e4                ; $A9D0  F0 12
  lda #$00                       ; $A9D2  A9 00
  sta _var_0067                  ; $A9D4  85 67
  lda a:_var_0203_indexed        ; $A9D6  AD 03 02
  cmp #$EC                       ; $A9D9  C9 EC
  beq _label_a9f6                ; $A9DB  F0 19
  clc                            ; $A9DD  18
  adc a:_var_0114                ; $A9DE  6D 14 01
  jmp _label_a9f3                ; $A9E1  4C F3 A9

_label_a9e4:
  lda #$01                       ; $A9E4  A9 01
  sta _var_0067                  ; $A9E6  85 67
  lda a:_var_0203_indexed        ; $A9E8  AD 03 02
  cmp #$04                       ; $A9EB  C9 04
  beq _label_a9f6                ; $A9ED  F0 07

_data_a9ef_indexed:
  sec                            ; $A9EF  38

_data_a9f0_indexed:
  sbc a:_var_0114                ; $A9F0  ED 14 01

_label_a9f3:
  sta a:_var_0203_indexed        ; $A9F3  8D 03 02

_label_a9f6:
  lda a:_var_0114                ; $A9F6  AD 14 01
  sta _var_0032                  ; $A9F9  85 32
  jsr _func_c242                 ; $A9FB  20 42 C2
  lda a:_var_0200_indexed        ; $A9FE  AD 00 02
  sec                            ; $AA01  38
  sbc #$0E                       ; $AA02  E9 0E
  sta a:_var_024d_indexed        ; $AA04  8D 4D 02
  cmp #$07                       ; $AA07  C9 07
  bcc _label_aa49                ; $AA09  90 3E
  lda a:_var_0203_indexed        ; $AA0B  AD 03 02
  sta a:$0250                    ; $AA0E  8D 50 02
  lda _var_0050                  ; $AA11  A5 50
  and #$10                       ; $AA13  29 10
  beq _label_aa26                ; $AA15  F0 0F
  lda #$02                       ; $AA17  A9 02
  sta a:_var_024f                ; $AA19  8D 4F 02
  lda #$FA                       ; $AA1C  A9 FA
  sta a:_var_024e                ; $AA1E  8D 4E 02
  lda #$CA                       ; $AA21  A9 CA
  jmp _label_aa32                ; $AA23  4C 32 AA

_label_aa26:
  lda #$42                       ; $AA26  A9 42
  sta a:_var_024f                ; $AA28  8D 4F 02
  lda #$CA                       ; $AA2B  A9 CA
  sta a:_var_024e                ; $AA2D  8D 4E 02
  lda #$FA                       ; $AA30  A9 FA

_label_aa32:
  sta a:_var_0251                ; $AA32  8D 51 02
  lda _var_0050                  ; $AA35  A5 50
  and #$04                       ; $AA37  29 04
  bne _label_aa3f                ; $AA39  D0 04
  lda #$10                       ; $AA3B  A9 10
  bne _label_aa41                ; $AA3D  D0 02

_label_aa3f:
  lda #$11                       ; $AA3F  A9 11

_label_aa41:
  sta _var_0032                  ; $AA41  85 32
  jsr _func_c2d0                 ; $AA43  20 D0 C2
  jmp _label_ef4e                ; $AA46  4C 4E EF

_label_aa49:
  inc _var_0024                  ; $AA49  E6 24
  lda #$00                       ; $AA4B  A9 00
  sta _var_0046                  ; $AA4D  85 46
  sta _var_0081                  ; $AA4F  85 81
  lda #$06                       ; $AA51  A9 06
  sta _var_0043                  ; $AA53  85 43
  inc _var_009c                  ; $AA55  E6 9C
  lda #$EF                       ; $AA57  A9 EF
  sta a:_var_024d_indexed        ; $AA59  8D 4D 02
  sta a:_var_024e                ; $AA5C  8D 4E 02
  jmp _label_ef48                ; $AA5F  4C 48 EF

_func_aa62:
  ldx #$05                       ; $AA62  A2 05

_label_aa64:
  lda a:_var_0101_indexed,X      ; $AA64  BD 01 01
  bne _label_aa6d                ; $AA67  D0 04
  dex                            ; $AA69  CA
  bpl _label_aa64                ; $AA6A  10 F8
  rts                            ; $AA6C  60

_label_aa6d:
  cpx #$03                       ; $AA6D  E0 03
  bcs _label_aaba                ; $AA6F  B0 49
  stx _var_002d_indexed          ; $AA71  86 2D
  lda _var_0070_indexed,X        ; $AA73  B5 70
  bne _label_aa7c                ; $AA75  D0 05
  ldy #$03                       ; $AA77  A0 03
  jmp _label_aa7e                ; $AA79  4C 7E AA

_label_aa7c:
  ldy #$05                       ; $AA7C  A0 05

_label_aa7e:
  ldx #$00                       ; $AA7E  A2 00
  lda a:_var_0368_indexed,Y      ; $AA80  B9 68 03

_label_aa83:
  cmp a:_data_e939_indexed,X     ; $AA83  DD 39 E9
  beq _label_aaa0                ; $AA86  F0 18
  inx                            ; $AA88  E8
  cpx #$08                       ; $AA89  E0 08
  bne _label_aa83                ; $AA8B  D0 F6
  iny                            ; $AA8D  C8
  iny                            ; $AA8E  C8
  iny                            ; $AA8F  C8
  ldx #$00                       ; $AA90  A2 00
  lda a:_var_0368_indexed,Y      ; $AA92  B9 68 03

_label_aa95:
  cmp a:_data_e939_indexed,X     ; $AA95  DD 39 E9
  beq _label_aaa0                ; $AA98  F0 06
  inx                            ; $AA9A  E8
  cpx #$08                       ; $AA9B  E0 08
  bne _label_aa95                ; $AA9D  D0 F6
  rts                            ; $AA9F  60

_label_aaa0:
  ldx _var_002d_indexed          ; $AAA0  A6 2D
  lda _var_0070_indexed,X        ; $AAA2  B5 70
  beq _label_aab0                ; $AAA4  F0 0A
  dec a:_var_0203_indexed        ; $AAA6  CE 03 02
  lda _var_004b                  ; $AAA9  A5 4B
  and #$7F                       ; $AAAB  29 7F
  sta _var_004b                  ; $AAAD  85 4B
  rts                            ; $AAAF  60

_label_aab0:
  inc a:_var_0203_indexed        ; $AAB0  EE 03 02
  lda _var_004b                  ; $AAB3  A5 4B
  and #$BF                       ; $AAB5  29 BF
  sta _var_004b                  ; $AAB7  85 4B
  rts                            ; $AAB9  60

_label_aaba:
  dex                            ; $AABA  CA
  dex                            ; $AABB  CA
  dex                            ; $AABC  CA
  lda _var_0073_indexed,X        ; $AABD  B5 73
  bne _label_aad3                ; $AABF  D0 12
  ldx #$00                       ; $AAC1  A2 00
  lda a:_var_036c                ; $AAC3  AD 6C 03

_label_aac6:
  cmp a:_data_e945_indexed,X     ; $AAC6  DD 45 E9
  beq _label_aad1                ; $AAC9  F0 06
  inx                            ; $AACB  E8
  cpx #$07                       ; $AACC  E0 07
  bne _label_aac6                ; $AACE  D0 F6
  rts                            ; $AAD0  60

_label_aad1:
  inc _var_0085                  ; $AAD1  E6 85

_label_aad3:
  rts                            ; $AAD3  60

_func_aad4:
  lda #$00                       ; $AAD4  A9 00
  sta _var_00af                  ; $AAD6  85 AF

_label_aad8:
  lda _var_00ab                  ; $AAD8  A5 AB
  cmp _var_00af                  ; $AADA  C5 AF
  bne _label_aadf                ; $AADC  D0 01
  rts                            ; $AADE  60

_label_aadf:
  jsr _func_d36d                 ; $AADF  20 6D D3
  tax                            ; $AAE2  AA
  lda a:_var_02bd_indexed,X      ; $AAE3  BD BD 02
  sta _var_009b                  ; $AAE6  85 9B
  sta _var_00a1                  ; $AAE8  85 A1
  jsr _func_e76e                 ; $AAEA  20 6E E7
  lda _var_00a1                  ; $AAED  A5 A1
  sta a:_var_02bd_indexed,X      ; $AAEF  9D BD 02
  lda _var_0065                  ; $AAF2  A5 65
  sec                            ; $AAF4  38
  sbc _var_0064                  ; $AAF5  E5 64
  bcs _label_ab00                ; $AAF7  B0 07
  sta _var_002d_indexed          ; $AAF9  85 2D
  lda #$00                       ; $AAFB  A9 00
  sec                            ; $AAFD  38
  sbc _var_002d_indexed          ; $AAFE  E5 2D

_label_ab00:
  cmp #$EE                       ; $AB00  C9 EE
  bcc _label_ab09                ; $AB02  90 05
  lda #$01                       ; $AB04  A9 01
  sta a:_var_0114                ; $AB06  8D 14 01

_label_ab09:
  lda _var_0065                  ; $AB09  A5 65
  clc                            ; $AB0B  18
  adc a:_var_02bd_indexed,X      ; $AB0C  7D BD 02
  and #$07                       ; $AB0F  29 07
  cmp #$07                       ; $AB11  C9 07
  beq _label_ab18                ; $AB13  F0 03
  jmp _label_ac34                ; $AB15  4C 34 AC

_label_ab18:
  lda #$00                       ; $AB18  A9 00
  sta _var_0032                  ; $AB1A  85 32
  lda a:_var_02bd_indexed,X      ; $AB1C  BD BD 02
  cmp #$FF                       ; $AB1F  C9 FF
  beq _label_ab32                ; $AB21  F0 0F
  sta _var_00a1                  ; $AB23  85 A1
  cmp #$EF                       ; $AB25  C9 EF
  bne _label_ab38                ; $AB27  D0 0F
  inc _var_0032                  ; $AB29  E6 32
  lda #$FF                       ; $AB2B  A9 FF
  sta _var_00a1                  ; $AB2D  85 A1
  jmp _label_ab38                ; $AB2F  4C 38 AB

_label_ab32:
  lda #$EF                       ; $AB32  A9 EF
  sta _var_00a1                  ; $AB34  85 A1
  dec _var_0032                  ; $AB36  C6 32

_label_ab38:
  lda a:_var_02c0_indexed,X      ; $AB38  BD C0 02
  sta _var_00a2                  ; $AB3B  85 A2
  jsr _func_d063                 ; $AB3D  20 63 D0
  lda a:_var_02c2_indexed,X      ; $AB40  BD C2 02
  sta _var_004d                  ; $AB43  85 4D
  lda _var_0032                  ; $AB45  A5 32
  cmp #$FF                       ; $AB47  C9 FF
  beq _label_ab5a                ; $AB49  F0 0F
  lda _var_004d                  ; $AB4B  A5 4D
  cmp #$01                       ; $AB4D  C9 01
  beq _label_ab62                ; $AB4F  F0 11
  lda _var_0032                  ; $AB51  A5 32
  beq _label_ab62                ; $AB53  F0 0D
  inc _var_004d                  ; $AB55  E6 4D
  jmp _label_ab62                ; $AB57  4C 62 AB

_label_ab5a:
  lda _var_004d                  ; $AB5A  A5 4D
  cmp #$FF                       ; $AB5C  C9 FF
  beq _label_ab62                ; $AB5E  F0 02
  dec _var_004d                  ; $AB60  C6 4D

_label_ab62:
  jsr _func_cca9                 ; $AB62  20 A9 CC
  lda _var_0052                  ; $AB65  A5 52
  sec                            ; $AB67  38
  sbc #$01                       ; $AB68  E9 01
  asl a                          ; $AB6A  0A
  tax                            ; $AB6B  AA
  lda a:_data_ad75_indexed,X     ; $AB6C  BD 75 AD
  sta _var_002d_indexed          ; $AB6F  85 2D
  lda a:_data_ad76_indexed,X     ; $AB71  BD 76 AD
  sta _var_002e                  ; $AB74  85 2E
  lda _var_0052                  ; $AB76  A5 52
  cmp #$02                       ; $AB78  C9 02
  bne _label_aba5                ; $AB7A  D0 29
  ldx _var_00af                  ; $AB7C  A6 AF
  lda _var_0073_indexed,X        ; $AB7E  B5 73
  beq _label_ab85                ; $AB80  F0 03
  jsr _func_d407                 ; $AB82  20 07 D4

_label_ab85:
  ldx _var_005b                  ; $AB85  A6 5B
  ldy _var_0056                  ; $AB87  A4 56
  lda a:_var_0480_indexed,Y      ; $AB89  B9 80 04
  and a:_data_acf9_indexed,X     ; $AB8C  3D F9 AC
  bne _label_abd6                ; $AB8F  D0 45
  lda a:_var_0380_indexed,Y      ; $AB91  B9 80 03
  and a:_data_acf9_indexed,X     ; $AB94  3D F9 AC
  cmp a:_data_acf9_indexed,X     ; $AB97  DD F9 AC
  beq _label_abd6                ; $AB9A  F0 3A
  ldx _var_00af                  ; $AB9C  A6 AF
  lda _var_0073_indexed,X        ; $AB9E  B5 73
  beq _label_aba5                ; $ABA0  F0 03
  jsr _func_d41a                 ; $ABA2  20 1A D4

_label_aba5:
  lda #$00                       ; $ABA5  A9 00
  sta _var_0032                  ; $ABA7  85 32
  ldy _var_00af                  ; $ABA9  A4 AF
  lda a:_var_0073_indexed,Y      ; $ABAB  B9 73 00
  beq _label_abc6                ; $ABAE  F0 16
  jsr _func_ad09                 ; $ABB0  20 09 AD
  lda (_var_002d_indexed),Y      ; $ABB3  B1 2D
  and a:_data_acf9_indexed,X     ; $ABB5  3D F9 AC
  bne _label_ac31                ; $ABB8  D0 77
  inc _var_0032                  ; $ABBA  E6 32
  jsr _func_ad09                 ; $ABBC  20 09 AD
  lda (_var_002d_indexed),Y      ; $ABBF  B1 2D
  and a:_data_acf9_indexed,X     ; $ABC1  3D F9 AC
  bne _label_ac31                ; $ABC4  D0 6B

_label_abc6:
  lda #$02                       ; $ABC6  A9 02
  sta _var_0032                  ; $ABC8  85 32
  ldx _var_00af                  ; $ABCA  A6 AF
  lda _var_0073_indexed,X        ; $ABCC  B5 73
  bne _label_abd9                ; $ABCE  D0 09
  jsr _func_d41a                 ; $ABD0  20 1A D4
  jmp _label_abe2                ; $ABD3  4C E2 AB

_label_abd6:
  jmp _label_ac31                ; $ABD6  4C 31 AC

_label_abd9:
  lda _var_0052                  ; $ABD9  A5 52
  cmp #$01                       ; $ABDB  C9 01
  beq _label_abe2                ; $ABDD  F0 03
  jsr _func_d407                 ; $ABDF  20 07 D4

_label_abe2:
  jsr _func_ad09                 ; $ABE2  20 09 AD
  lda (_var_002d_indexed),Y      ; $ABE5  B1 2D
  and a:_data_acf9_indexed,X     ; $ABE7  3D F9 AC
  beq _label_abf2                ; $ABEA  F0 06
  ldy _var_0031_indexed          ; $ABEC  A4 31
  cmp (_var_002f_indexed),Y      ; $ABEE  D1 2F
  bne _label_ac31                ; $ABF0  D0 3F

_label_abf2:
  inc _var_0032                  ; $ABF2  E6 32
  jsr _func_ad09                 ; $ABF4  20 09 AD
  lda (_var_002d_indexed),Y      ; $ABF7  B1 2D
  and a:_data_acf9_indexed,X     ; $ABF9  3D F9 AC
  beq _label_ac04                ; $ABFC  F0 06
  ldy _var_0031_indexed          ; $ABFE  A4 31
  cmp (_var_002f_indexed),Y      ; $AC00  D1 2F
  bne _label_ac31                ; $AC02  D0 2D

_label_ac04:
  inc _var_0032                  ; $AC04  E6 32
  lda _var_0052                  ; $AC06  A5 52
  clc                            ; $AC08  18
  adc #$01                       ; $AC09  69 01
  tay                            ; $AC0B  A8
  ldx _var_00af                  ; $AC0C  A6 AF
  lda _var_0073_indexed,X        ; $AC0E  B5 73
  beq _label_ac14                ; $AC10  F0 02
  iny                            ; $AC12  C8
  iny                            ; $AC13  C8

_label_ac14:
  tya                            ; $AC14  98
  asl a                          ; $AC15  0A
  tax                            ; $AC16  AA
  lda a:_data_ad75_indexed,X     ; $AC17  BD 75 AD
  sta _var_002d_indexed          ; $AC1A  85 2D
  lda a:_data_ad76_indexed,X     ; $AC1C  BD 76 AD
  sta _var_002e                  ; $AC1F  85 2E
  jsr _func_ad09                 ; $AC21  20 09 AD
  lda (_var_002d_indexed),Y      ; $AC24  B1 2D
  and a:_data_acf9_indexed,X     ; $AC26  3D F9 AC
  beq _label_ac34                ; $AC29  F0 09
  ldy _var_0031_indexed          ; $AC2B  A4 31
  cmp (_var_002f_indexed),Y      ; $AC2D  D1 2F
  beq _label_ac34                ; $AC2F  F0 03

_label_ac31:
  jsr _func_ad5b                 ; $AC31  20 5B AD

_label_ac34:
  jsr _func_d36d                 ; $AC34  20 6D D3
  tay                            ; $AC37  A8
  ldx _var_00af                  ; $AC38  A6 AF
  lda _var_0073_indexed,X        ; $AC3A  B5 73
  beq _label_ac4b                ; $AC3C  F0 0D
  lda a:_var_02bd_indexed,Y      ; $AC3E  B9 BD 02
  clc                            ; $AC41  18
  adc a:_var_0114                ; $AC42  6D 14 01
  sta a:_var_02bd_indexed,Y      ; $AC45  99 BD 02
  jmp _label_ac55                ; $AC48  4C 55 AC

_label_ac4b:
  lda a:_var_02bd_indexed,Y      ; $AC4B  B9 BD 02
  sec                            ; $AC4E  38
  sbc a:_var_0114                ; $AC4F  ED 14 01
  sta a:_var_02bd_indexed,Y      ; $AC52  99 BD 02

_label_ac55:
  jsr _func_d36d                 ; $AC55  20 6D D3
  tay                            ; $AC58  A8
  lda a:_var_02bd_indexed,Y      ; $AC59  B9 BD 02
  sta _var_00a1                  ; $AC5C  85 A1
  lda a:_var_02c2_indexed,Y      ; $AC5E  B9 C2 02
  sta _var_0031_indexed          ; $AC61  85 31
  jsr _func_e714                 ; $AC63  20 14 E7
  lda _var_0032                  ; $AC66  A5 32
  sta a:_var_02bd_indexed,Y      ; $AC68  99 BD 02
  lda _var_0031_indexed          ; $AC6B  A5 31
  sta a:_var_02c2_indexed,Y      ; $AC6D  99 C2 02
  ldx _var_00af                  ; $AC70  A6 AF
  lda _var_0073_indexed,X        ; $AC72  B5 73
  beq _label_acb1                ; $AC74  F0 3B
  lda a:_var_02c2_indexed,Y      ; $AC76  B9 C2 02
  beq _label_ac82                ; $AC79  F0 07
  cmp #$01                       ; $AC7B  C9 01
  beq _label_ac96                ; $AC7D  F0 17
  jmp _label_acf4                ; $AC7F  4C F4 AC

_label_ac82:
  lda _var_0065                  ; $AC82  A5 65
  bne _label_aca3                ; $AC84  D0 1D
  lda _var_001d                  ; $AC86  A5 1D
  and #$02                       ; $AC88  29 02
  bne _label_acf4                ; $AC8A  D0 68
  lda a:_var_02bd_indexed,Y      ; $AC8C  B9 BD 02
  cmp #$DF                       ; $AC8F  C9 DF
  bcs _label_acf1                ; $AC91  B0 5E
  jmp _label_acf4                ; $AC93  4C F4 AC

_label_ac96:
  lda #$DF                       ; $AC96  A9 DF
  sec                            ; $AC98  38
  sbc _var_0065                  ; $AC99  E5 65
  cmp a:_var_02bd_indexed,Y      ; $AC9B  D9 BD 02
  bcc _label_acf1                ; $AC9E  90 51
  jmp _label_acf4                ; $ACA0  4C F4 AC

_label_aca3:
  cmp #$E7                       ; $ACA3  C9 E7
  bcc _label_acf4                ; $ACA5  90 4D
  lda a:_var_02bd_indexed,Y      ; $ACA7  B9 BD 02
  cmp #$E7                       ; $ACAA  C9 E7
  bcs _label_acf1                ; $ACAC  B0 43
  jmp _label_acf4                ; $ACAE  4C F4 AC

_label_acb1:
  lda a:_var_02c2_indexed,Y      ; $ACB1  B9 C2 02
  beq _label_ace0                ; $ACB4  F0 2A
  cmp #$FF                       ; $ACB6  C9 FF
.byte $f0                        ; $ACB8  F0  branch into instruction detected: beq $ACBD

_label_acb9:
.byte $03                        ; $ACB9  03
  jmp _label_acf4                ; $ACBA  4C F4 AC

_label_acbd:
  lda _var_0065                  ; $ACBD  A5 65
  beq _label_acea                ; $ACBF  F0 29
  cmp #$1F                       ; $ACC1  C9 1F
  bcc _label_acea                ; $ACC3  90 25
  lda #$10                       ; $ACC5  A9 10
  sec                            ; $ACC7  38
  sbc _var_0065                  ; $ACC8  E5 65
  clc                            ; $ACCA  18
  cmp a:_var_02bd_indexed,Y      ; $ACCB  D9 BD 02
  bcs _label_acf1                ; $ACCE  B0 21
  jmp _label_acf4                ; $ACD0  4C F4 AC

_label_acd3:
  clc                            ; $ACD3  18
  adc a:_var_02bd_indexed,Y      ; $ACD4  79 BD 02
  bcs _label_acf4                ; $ACD7  B0 1B
  cmp #$1F                       ; $ACD9  C9 1F
  bcc _label_acf1                ; $ACDB  90 14
  jmp _label_acf4                ; $ACDD  4C F4 AC

_label_ace0:
  lda _var_0065                  ; $ACE0  A5 65
  bne _label_acd3                ; $ACE2  D0 EF
  lda _var_001d                  ; $ACE4  A5 1D
  and #$02                       ; $ACE6  29 02
  beq _label_acf4                ; $ACE8  F0 0A

_label_acea:
  lda a:_var_02bd_indexed,Y      ; $ACEA  B9 BD 02
  cmp #$1F                       ; $ACED  C9 1F
  bcs _label_acf4                ; $ACEF  B0 03

_label_acf1:
  jsr _func_ad5b                 ; $ACF1  20 5B AD

_label_acf4:
  inc _var_00af                  ; $ACF4  E6 AF
  jmp _label_aad8                ; $ACF6  4C D8 AA

_data_acf9_indexed:
.byte $c0, $30, $0c, $03, $40, $10, $04, $01, $80, $20, $08, $02, $00, $00, $00, $00 ; $ACF9

_func_ad09:
  ldx _var_00af                  ; $AD09  A6 AF
  lda _var_0073_indexed,X        ; $AD0B  B5 73
  bne _label_ad14                ; $AD0D  D0 05
  ldx #$00                       ; $AD0F  A2 00
  jmp _label_ad18                ; $AD11  4C 18 AD

_label_ad14:
  lda _var_0032                  ; $AD14  A5 32
  asl a                          ; $AD16  0A
  tax                            ; $AD17  AA

_label_ad18:
  lda a:_data_ad6b_indexed,X     ; $AD18  BD 6B AD
  sta _var_002f_indexed          ; $AD1B  85 2F
  lda a:_data_ad6c_indexed,X     ; $AD1D  BD 6C AD
  sta _var_0030                  ; $AD20  85 30
  ldy _var_0056                  ; $AD22  A4 56
  lda _var_0032                  ; $AD24  A5 32
  and #$01                       ; $AD26  29 01
  beq _label_ad38                ; $AD28  F0 0E
  ldx _var_005b                  ; $AD2A  A6 5B
  cpx #$03                       ; $AD2C  E0 03
  bne _label_ad33                ; $AD2E  D0 03
  ldx #$FF                       ; $AD30  A2 FF
  iny                            ; $AD32  C8

_label_ad33:
  inx                            ; $AD33  E8
  txa                            ; $AD34  8A
  sta _var_0031_indexed          ; $AD35  85 31
  rts                            ; $AD37  60

_label_ad38:
  lda _var_0032                  ; $AD38  A5 32
  cmp #$02                       ; $AD3A  C9 02
  bne _label_ad55                ; $AD3C  D0 17
  ldx _var_00af                  ; $AD3E  A6 AF
  lda _var_0073_indexed,X        ; $AD40  B5 73
  beq _label_ad55                ; $AD42  F0 11
  lda _var_0052                  ; $AD44  A5 52
  sec                            ; $AD46  38
  sbc #$01                       ; $AD47  E9 01
  asl a                          ; $AD49  0A
  tax                            ; $AD4A  AA
  lda a:_data_ad81_indexed,X     ; $AD4B  BD 81 AD
  sta _var_002d_indexed          ; $AD4E  85 2D
  lda a:_data_ad82_indexed,X     ; $AD50  BD 82 AD
  sta _var_002e                  ; $AD53  85 2E

_label_ad55:
  lda _var_005b                  ; $AD55  A5 5B
  tax                            ; $AD57  AA
  sta _var_0031_indexed          ; $AD58  85 31
  rts                            ; $AD5A  60

_func_ad5b:
  ldx _var_00af                  ; $AD5B  A6 AF
  lda _var_0073_indexed,X        ; $AD5D  B5 73
  bne _label_ad66                ; $AD5F  D0 05
  lda #$01                       ; $AD61  A9 01
  jmp _label_ad68                ; $AD63  4C 68 AD

_label_ad66:
  lda #$00                       ; $AD66  A9 00

_label_ad68:
  sta _var_0073_indexed,X        ; $AD68  95 73
  rts                            ; $AD6A  60

_data_ad6b_indexed:
.byte $f9                        ; $AD6B

_data_ad6c_indexed:
.byte $ac, $f9, $ac, $fd, $ac, $01, $ad, $05, $ad ; $AD6C

_data_ad75_indexed:
.byte $00                        ; $AD75

_data_ad76_indexed:
.byte $04, $80, $05, $80, $04, $00, $05, $00, $05, $80, $04 ; $AD76

_data_ad81_indexed:
.byte $80                        ; $AD81

_data_ad82_indexed:
.byte $05, $00, $04              ; $AD82

_label_ad85:
  lda a:_var_0207_indexed        ; $AD85  AD 07 02
  sec                            ; $AD88  38
  sbc a:_var_02a1                ; $AD89  ED A1 02
  bcc _label_ada9                ; $AD8C  90 1B
  cmp #$0C                       ; $AD8E  C9 0C
  bcs _label_ada9                ; $AD90  B0 17
  lda a:_var_020a_indexed        ; $AD92  AD 0A 02
  sec                            ; $AD95  38
  sbc a:_var_02a4                ; $AD96  ED A4 02
  bcs _label_ada2                ; $AD99  B0 07
  sta _var_002d_indexed          ; $AD9B  85 2D
  lda #$00                       ; $AD9D  A9 00
  sec                            ; $AD9F  38
  sbc _var_002d_indexed          ; $ADA0  E5 2D

_label_ada2:
  cmp #$0C                       ; $ADA2  C9 0C
  bcs _label_ada9                ; $ADA4  B0 03
  jmp _label_a1d9                ; $ADA6  4C D9 A1

_label_ada9:
  jmp _label_a1fe                ; $ADA9  4C FE A1

_func_adac:
  lda #$00                       ; $ADAC  A9 00
  sta _var_002e                  ; $ADAE  85 2E
  sta _var_00af                  ; $ADB0  85 AF
  lda a:_var_013d_indexed        ; $ADB2  AD 3D 01
  bne _label_adbe                ; $ADB5  D0 07
  lda a:_var_013e                ; $ADB7  AD 3E 01
  beq _label_adcf                ; $ADBA  F0 13
  inc _var_002e                  ; $ADBC  E6 2E

_label_adbe:
  ldx _var_00af                  ; $ADBE  A6 AF
  lda _var_00d0_indexed,X        ; $ADC0  B5 D0
  cmp #$02                       ; $ADC2  C9 02
  beq _label_add0                ; $ADC4  F0 0A

_label_adc6:
  inc _var_00af                  ; $ADC6  E6 AF
  lda _var_00af                  ; $ADC8  A5 AF
  cmp a:_var_0137                ; $ADCA  CD 37 01
  bne _label_adbe                ; $ADCD  D0 EF

_label_adcf:
  rts                            ; $ADCF  60

_label_add0:
  jsr _func_d36d                 ; $ADD0  20 6D D3
  tay                            ; $ADD3  A8
  lda a:_var_0213_indexed,Y      ; $ADD4  B9 13 02
  cmp a:_var_0259                ; $ADD7  CD 59 02
  bne _label_adc6                ; $ADDA  D0 EA
  lda a:_var_020e_indexed,Y      ; $ADDC  B9 0E 02
  sec                            ; $ADDF  38
  sbc a:_var_0254_indexed        ; $ADE0  ED 54 02
  bcs _label_adec                ; $ADE3  B0 07
  sta _var_002d_indexed          ; $ADE5  85 2D
  lda #$00                       ; $ADE7  A9 00
  sec                            ; $ADE9  38
  sbc _var_002d_indexed          ; $ADEA  E5 2D

_label_adec:
  cmp #$0C                       ; $ADEC  C9 0C
  bcs _label_adc6                ; $ADEE  B0 D6
  lda a:_var_0211_indexed,X      ; $ADF0  BD 11 02
  sec                            ; $ADF3  38
  sbc a:_var_0257                ; $ADF4  ED 57 02
  bcs _label_ae00                ; $ADF7  B0 07
  sta _var_002d_indexed          ; $ADF9  85 2D
  lda #$00                       ; $ADFB  A9 00
  sec                            ; $ADFD  38
  sbc _var_002d_indexed          ; $ADFE  E5 2D

_label_ae00:
  cmp #$0C                       ; $AE00  C9 0C
  bcs _label_adc6                ; $AE02  B0 C2
  ldx _var_002e                  ; $AE04  A6 2E
  lda #$00                       ; $AE06  A9 00

_data_ae08_indexed:
  sta a:_var_013d_indexed,X      ; $AE08  9D 3D 01
  sta a:_var_013f                ; $AE0B  8D 3F 01
  lda a:_var_013b_indexed,X      ; $AE0E  BD 3B 01
  bne _label_ae18                ; $AE11  D0 05
  lda #$01                       ; $AE13  A9 01
  jmp _label_ae1a                ; $AE15  4C 1A AE

_label_ae18:
  lda #$00                       ; $AE18  A9 00

_label_ae1a:
  sta a:_var_013b_indexed,X      ; $AE1A  9D 3B 01
  lda #$EF                       ; $AE1D  A9 EF
  sta a:_var_0254_indexed        ; $AE1F  8D 54 02
  sta a:_var_0255                ; $AE22  8D 55 02
  rts                            ; $AE25  60

_label_ae26:
  lda _var_005d                  ; $AE26  A5 5D
  cmp #$FF                       ; $AE28  C9 FF
  beq _label_ae5a                ; $AE2A  F0 2E
  lda a:_var_06b5                ; $AE2C  AD B5 06
  beq _label_ae5a                ; $AE2F  F0 29
  cmp #$01                       ; $AE31  C9 01
  beq _label_ae4b                ; $AE33  F0 16
  lda _var_0070_indexed          ; $AE35  A5 70
  cmp _var_0071                  ; $AE37  C5 71
  beq _label_ae40                ; $AE39  F0 05
  sta _var_0071                  ; $AE3B  85 71
  sta _var_0072                  ; $AE3D  85 72
  rts                            ; $AE3F  60

_label_ae40:
  lda _var_0072                  ; $AE40  A5 72
  cmp _var_0071                  ; $AE42  C5 71
  beq _label_ae4a                ; $AE44  F0 04
  sta _var_0071                  ; $AE46  85 71
  sta _var_0070_indexed          ; $AE48  85 70

_label_ae4a:
  rts                            ; $AE4A  60

_label_ae4b:
  lda _var_0070_indexed          ; $AE4B  A5 70
  cmp _var_0071                  ; $AE4D  C5 71
  beq _label_ae5a                ; $AE4F  F0 09
  ldy _var_005d                  ; $AE51  A4 5D
  lda a:_var_0070_indexed,Y      ; $AE53  B9 70 00
  sta _var_0070_indexed          ; $AE56  85 70
  sta _var_0071                  ; $AE58  85 71

_label_ae5a:
  rts                            ; $AE5A  60

_func_ae5b:
  ldy a:_var_010f                ; $AE5B  AC 0F 01
  beq _label_aeb0                ; $AE5E  F0 50
  dey                            ; $AE60  88

_label_ae61:
  tya                            ; $AE61  98
  tax                            ; $AE62  AA
  jsr _func_d487                 ; $AE63  20 87 D4
  lda _var_007e                  ; $AE66  A5 7E
  bne _label_ae81                ; $AE68  D0 17
  lda a:_var_0246_indexed,X      ; $AE6A  BD 46 02
  sta _var_0032                  ; $AE6D  85 32
  lda a:_var_024b_indexed,X      ; $AE6F  BD 4B 02
  sta _var_0031_indexed          ; $AE72  85 31
  jsr _func_e70b                 ; $AE74  20 0B E7
  lda _var_0032                  ; $AE77  A5 32
  sta a:_var_0246_indexed,X      ; $AE79  9D 46 02
  lda _var_0031_indexed          ; $AE7C  A5 31
  sta a:_var_024b_indexed,X      ; $AE7E  9D 4B 02

_label_ae81:
  lda a:_var_06a4                ; $AE81  AD A4 06
  and #$04                       ; $AE84  29 04
  bne _label_ae8d                ; $AE86  D0 05
  lda #$01                       ; $AE88  A9 01
  jmp _label_ae8f                ; $AE8A  4C 8F AE

_label_ae8d:
  lda #$02                       ; $AE8D  A9 02

_label_ae8f:
.byte $9d, $48                   ; $AE8F  9D 48  branch into instruction detected: sta a:_var_0248_indexed,X

_label_ae91:
.byte $02                        ; $AE91  02
  dey                            ; $AE92  88
  bpl _label_ae61                ; $AE93  10 CC
  lda _var_007e                  ; $AE95  A5 7E
  bne _label_aeb0                ; $AE97  D0 17
  lda a:_var_025b                ; $AE99  AD 5B 02
  sta _var_0032                  ; $AE9C  85 32
  lda a:_var_0260                ; $AE9E  AD 60 02
  sta _var_0031_indexed          ; $AEA1  85 31
  jsr _func_e70b                 ; $AEA3  20 0B E7
  lda _var_0032                  ; $AEA6  A5 32
  sta a:_var_025b                ; $AEA8  8D 5B 02
  lda _var_0031_indexed          ; $AEAB  A5 31
  sta a:_var_0260                ; $AEAD  8D 60 02

_label_aeb0:
  rts                            ; $AEB0  60

_func_aeb1:
  ldy #$FF                       ; $AEB1  A0 FF

_label_aeb3:
  iny                            ; $AEB3  C8
  cpy a:_var_010f                ; $AEB4  CC 0F 01
  beq _label_af21                ; $AEB7  F0 68
  tya                            ; $AEB9  98
  tax                            ; $AEBA  AA
  jsr _func_d487                 ; $AEBB  20 87 D4
  lda a:_var_024b_indexed,X      ; $AEBE  BD 4B 02
  bne _label_aeb3                ; $AEC1  D0 F0
  lda a:_var_0200_indexed        ; $AEC3  AD 00 02
  sec                            ; $AEC6  38
  sbc a:_var_0246_indexed,X      ; $AEC7  FD 46 02
  bcs _label_aed3                ; $AECA  B0 07
  sta _var_002d_indexed          ; $AECC  85 2D
  lda #$00                       ; $AECE  A9 00
  sec                            ; $AED0  38
  sbc _var_002d_indexed          ; $AED1  E5 2D

_label_aed3:
  cmp #$08                       ; $AED3  C9 08
  bcs _label_aeb3                ; $AED5  B0 DC
  lda a:_var_0203_indexed        ; $AED7  AD 03 02
  sec                            ; $AEDA  38
  sbc a:_var_0249_indexed,X      ; $AEDB  FD 49 02
  bcs _label_aee7                ; $AEDE  B0 07
  sta _var_002d_indexed          ; $AEE0  85 2D
  lda #$00                       ; $AEE2  A9 00
  sec                            ; $AEE4  38
  sbc _var_002d_indexed          ; $AEE5  E5 2D

_label_aee7:
  cmp #$09                       ; $AEE7  C9 09
  bcs _label_aeb3                ; $AEE9  B0 C8
  inc a:_var_061b                ; $AEEB  EE 1B 06
  dec a:_var_010f                ; $AEEE  CE 0F 01
  beq _label_af34                ; $AEF1  F0 41
  cpy a:_var_010f                ; $AEF3  CC 0F 01
  beq _label_af2b                ; $AEF6  F0 33
  cpy #$00                       ; $AEF8  C0 00
  bne _label_af0e                ; $AEFA  D0 12
  ldx #$06                       ; $AEFC  A2 06

_label_aefe:
  lda a:_var_024d_indexed,X      ; $AEFE  BD 4D 02
  sta a:_var_0246_indexed,X      ; $AF01  9D 46 02
  dex                            ; $AF04  CA
  bpl _label_aefe                ; $AF05  10 F7
  lda a:_var_010f                ; $AF07  AD 0F 01
  cmp #$01                       ; $AF0A  C9 01
  beq _label_af22                ; $AF0C  F0 14

_label_af0e:
  ldx #$06                       ; $AF0E  A2 06

_label_af10:
  lda a:_var_0254_indexed,X      ; $AF10  BD 54 02
  sta a:_var_024d_indexed,X      ; $AF13  9D 4D 02
  dex                            ; $AF16  CA
  bpl _label_af10                ; $AF17  10 F7
  lda #$EF                       ; $AF19  A9 EF
  sta a:_var_0254_indexed        ; $AF1B  8D 54 02
  sta a:_var_0255                ; $AF1E  8D 55 02

_label_af21:
  rts                            ; $AF21  60

_label_af22:
  lda #$EF                       ; $AF22  A9 EF
  sta a:_var_024d_indexed        ; $AF24  8D 4D 02
  sta a:_var_024e                ; $AF27  8D 4E 02
  rts                            ; $AF2A  60

_label_af2b:
  lda #$EF                       ; $AF2B  A9 EF
  sta a:_var_0246_indexed,X      ; $AF2D  9D 46 02
  sta a:_var_0247_indexed,X      ; $AF30  9D 47 02
  rts                            ; $AF33  60

_label_af34:
  lda #$EF                       ; $AF34  A9 EF
  sta a:_var_025b                ; $AF36  8D 5B 02
  sta a:_var_025c                ; $AF39  8D 5C 02
  sta a:_var_0246_indexed,X      ; $AF3C  9D 46 02
  sta a:_var_0247_indexed,X      ; $AF3F  9D 47 02
  rts                            ; $AF42  60

_func_af43:
  lda #$FF                       ; $AF43  A9 FF
  sta _var_00af                  ; $AF45  85 AF

_label_af47:
  inc _var_00af                  ; $AF47  E6 AF
  lda _var_00af                  ; $AF49  A5 AF
  cmp #$06                       ; $AF4B  C9 06
  bne _label_af64                ; $AF4D  D0 15
  lda a:_var_06b1                ; $AF4F  AD B1 06
  beq _label_af63                ; $AF52  F0 0F
  lda #$00                       ; $AF54  A9 00
  sta a:_var_06b1                ; $AF56  8D B1 06
  lda #$02                       ; $AF59  A9 02
  sta a:_var_0133_indexed        ; $AF5B  8D 33 01
  lda #$06                       ; $AF5E  A9 06
  sta a:_var_0130_indexed        ; $AF60  8D 30 01

_label_af63:
  rts                            ; $AF63  60

_label_af64:
  ldx _var_00af                  ; $AF64  A6 AF
  lda a:_var_0140_indexed,X      ; $AF66  BD 40 01
  bne _label_af47                ; $AF69  D0 DC
  jsr _func_d36d                 ; $AF6B  20 6D D3
  tax                            ; $AF6E  AA
  lda a:_var_02ad_indexed,X      ; $AF6F  BD AD 02
  cmp a:_var_0283_indexed        ; $AF72  CD 83 02
  bne _label_af47                ; $AF75  D0 D0
  lda a:_var_02a8_indexed,X      ; $AF77  BD A8 02
  sec                            ; $AF7A  38
  sbc a:_var_027e_indexed        ; $AF7B  ED 7E 02
  bcc _label_af47                ; $AF7E  90 C7
  cmp #$11                       ; $AF80  C9 11
  bcs _label_af47                ; $AF82  B0 C3
  cmp #$0C                       ; $AF84  C9 0C
  bcc _label_af47                ; $AF86  90 BF
  lda a:_var_02ab_indexed,X      ; $AF88  BD AB 02
  sec                            ; $AF8B  38
  sbc a:_var_0281_indexed        ; $AF8C  ED 81 02
  bcs _label_af98                ; $AF8F  B0 07
  sta _var_002d_indexed          ; $AF91  85 2D
  lda #$00                       ; $AF93  A9 00
  sec                            ; $AF95  38
  sbc _var_002d_indexed          ; $AF96  E5 2D

_label_af98:
  cmp #$09                       ; $AF98  C9 09
  bcs _label_af47                ; $AF9A  B0 AB
  inc a:_var_06b1                ; $AF9C  EE B1 06
  lda #$38                       ; $AF9F  A9 38
  sta a:$06D5                    ; $AFA1  8D D5 06

_data_afa4_indexed:
  sta a:$06D6                    ; $AFA4  8D D6 06
  sta a:$06D7                    ; $AFA7  8D D7 06
  ldx _var_00af                  ; $AFAA  A6 AF
  cpx #$03                       ; $AFAC  E0 03
  bcc _label_afc9                ; $AFAE  90 19
  lda _var_0070_indexed,X        ; $AFB0  B5 70
  beq _label_afbe                ; $AFB2  F0 0A
  lda a:_var_027e_indexed        ; $AFB4  AD 7E 02
  clc                            ; $AFB7  18
  adc a:_var_0114                ; $AFB8  6D 14 01
  jmp _label_afc5                ; $AFBB  4C C5 AF

_label_afbe:
  lda a:_var_027e_indexed        ; $AFBE  AD 7E 02
  sec                            ; $AFC1  38
  sbc a:_var_0114                ; $AFC2  ED 14 01

_label_afc5:
  sta a:_var_027e_indexed        ; $AFC5  8D 7E 02
  rts                            ; $AFC8  60

_label_afc9:
  lda _var_0070_indexed,X        ; $AFC9  B5 70
  beq _label_afd7                ; $AFCB  F0 0A
  lda a:_var_0281_indexed        ; $AFCD  AD 81 02
  clc                            ; $AFD0  18
  adc a:_var_0114                ; $AFD1  6D 14 01
  jmp _label_afde                ; $AFD4  4C DE AF

_label_afd7:
  lda a:_var_0281_indexed        ; $AFD7  AD 81 02
  sec                            ; $AFDA  38
  sbc a:_var_0114                ; $AFDB  ED 14 01

_label_afde:
  sta a:_var_0281_indexed        ; $AFDE  8D 81 02
  rts                            ; $AFE1  60

_func_afe2:
  lda _var_006d                  ; $AFE2  A5 6D
  cmp #$05                       ; $AFE4  C9 05
  bcc _label_aff2                ; $AFE6  90 0A
  sec                            ; $AFE8  38
  sbc #$05                       ; $AFE9  E9 05
  tax                            ; $AFEB  AA
  lda a:_data_aff7_indexed,X     ; $AFEC  BD F7 AF
  sta _var_004b                  ; $AFEF  85 4B
  rts                            ; $AFF1  60

_label_aff2:
  lda #$00                       ; $AFF2  A9 00
  sta _var_004b                  ; $AFF4  85 4B
  rts                            ; $AFF6  60

_data_aff7_indexed:
.byte $80, $80, $80, $81, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00 ; $AFF7
.byte $00, $00, $10, $10, $10, $10, $40, $40, $40, $40, $40, $40, $40, $40, $10, $10 ; $B007
.byte $40, $40                   ; $B017

_label_b019:
  rti                            ; $B019  40

.byte $40, $01, $40, $40, $40, $10, $10, $10, $10, $10, $80, $80, $80, $80, $80, $80 ; $B01A
.byte $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $40, $40 ; $B02A
.byte $40, $40, $40, $40, $40, $40, $40, $40, $40, $80, $80, $80, $80 ; $B03A

_func_b047:
  ldx #$05                       ; $B047  A2 05

_label_b049:
  lda a:_var_0101_indexed,X      ; $B049  BD 01 01
  bne _label_b052                ; $B04C  D0 04

_data_b04e_indexed:
  dex                            ; $B04E  CA

_data_b04f_indexed:
  bpl _label_b049                ; $B04F  10 F8
  rts                            ; $B051  60

_label_b052:
  cpx #$03                       ; $B052  E0 03
  bcs _label_b070                ; $B054  B0 1A
  lda _var_0070_indexed,X        ; $B056  B5 70
  beq _label_b065                ; $B058  F0 0B
  lda a:_var_0203_indexed        ; $B05A  AD 03 02
  clc                            ; $B05D  18
  adc a:_var_0114                ; $B05E  6D 14 01
  sta a:_var_0203_indexed        ; $B061  8D 03 02
  rts                            ; $B064  60

_label_b065:
  lda a:_var_0203_indexed        ; $B065  AD 03 02
  sec                            ; $B068  38
  sbc a:_var_0114                ; $B069  ED 14 01
  sta a:_var_0203_indexed        ; $B06C  8D 03 02
  rts                            ; $B06F  60

_label_b070:
  lda _var_0070_indexed,X        ; $B070  B5 70
  beq _label_b07d                ; $B072  F0 09
  lda a:_var_0114                ; $B074  AD 14 01
  sta _var_0032                  ; $B077  85 32
  jsr _func_c1e2                 ; $B079  20 E2 C1
  rts                            ; $B07C  60

_label_b07d:
  lda a:_var_0114                ; $B07D  AD 14 01
  sta _var_0032                  ; $B080  85 32
  jsr _func_c242                 ; $B082  20 42 C2
  rts                            ; $B085  60

_func_b086:
  lda #$00                       ; $B086  A9 00
  sta a:_var_0123                ; $B088  8D 23 01
  sta _var_0030                  ; $B08B  85 30
  ldx _var_00af                  ; $B08D  A6 AF

_label_b08f:
  ldy _var_00af                  ; $B08F  A4 AF
  lda a:_data_b0f4_indexed,X     ; $B091  BD F4 B0
  tax                            ; $B094  AA
  lda a:_var_011c_indexed,Y      ; $B095  B9 1C 01
  cmp a:_var_011c_indexed,X      ; $B098  DD 1C 01
  bne _label_b0aa                ; $B09B  D0 0D
  jsr _func_d487                 ; $B09D  20 87 D4
  ldy _var_002f_indexed          ; $B0A0  A4 2F
  lda a:_var_027e_indexed,Y      ; $B0A2  B9 7E 02
  cmp a:_var_027e_indexed,X      ; $B0A5  DD 7E 02
  beq _label_b0b7                ; $B0A8  F0 0D

_label_b0aa:
  lda _var_0030                  ; $B0AA  A5 30
  beq _label_b0af                ; $B0AC  F0 01
  rts                            ; $B0AE  60

_label_b0af:
  ldx _var_00af                  ; $B0AF  A6 AF
  inx                            ; $B0B1  E8
  inc _var_0030                  ; $B0B2  E6 30
  jmp _label_b08f                ; $B0B4  4C 8F B0

_label_b0b7:
  lda a:_var_0281_indexed,Y      ; $B0B7  B9 81 02
  sec                            ; $B0BA  38
  sbc a:_var_0281_indexed,X      ; $B0BB  FD 81 02
  beq _label_b0d7                ; $B0BE  F0 17
  bcs _label_b0d8                ; $B0C0  B0 16
  sta _var_0031_indexed          ; $B0C2  85 31
  ldx _var_00af                  ; $B0C4  A6 AF
  lda a:_var_011c_indexed,X      ; $B0C6  BD 1C 01
  bne _label_b0d7                ; $B0C9  D0 0C
  lda #$00                       ; $B0CB  A9 00
  sec                            ; $B0CD  38

_label_b0ce:
  sbc _var_0031_indexed          ; $B0CE  E5 31

_label_b0d0:
  cmp #$0C                       ; $B0D0  C9 0C
  bcs _label_b0e8                ; $B0D2  B0 14
  inc a:_var_0123                ; $B0D4  EE 23 01

_label_b0d7:
  rts                            ; $B0D7  60

_label_b0d8:
  sta _var_0031_indexed          ; $B0D8  85 31
  ldx _var_00af                  ; $B0DA  A6 AF
  lda a:_var_011c_indexed,X      ; $B0DC  BD 1C 01
  cmp #$01                       ; $B0DF  C9 01
  bne _label_b0d7                ; $B0E1  D0 F4
  lda _var_0031_indexed          ; $B0E3  A5 31
  jmp _label_b0d0                ; $B0E5  4C D0 B0

_label_b0e8:
  lda _var_0030                  ; $B0E8  A5 30
  bne _label_b0d7                ; $B0EA  D0 EB
  ldx _var_00af                  ; $B0EC  A6 AF
  inx                            ; $B0EE  E8
  inc _var_0030                  ; $B0EF  E6 30
  jmp _label_b08f                ; $B0F1  4C 8F B0

_data_b0f4_indexed:
.byte $01, $02, $00, $01         ; $B0F4

_func_b0f8:
  lda #$00                       ; $B0F8  A9 00
  sta _var_00af                  ; $B0FA  85 AF

_label_b0fc:
  lda _var_00aa                  ; $B0FC  A5 AA
  cmp _var_00af                  ; $B0FE  C5 AF
  beq _label_b11e                ; $B100  F0 1C
  lda #$00                       ; $B102  A9 00
  sta _var_0032                  ; $B104  85 32
  ldy _var_00af                  ; $B106  A4 AF
  lda a:_var_0140_indexed,Y      ; $B108  B9 40 01
  bne _label_b115                ; $B10B  D0 08
  ldx _var_0032                  ; $B10D  A6 32
  lda _var_00d0_indexed,X        ; $B10F  B5 D0
  cmp #$02                       ; $B111  C9 02
  beq _label_b11f                ; $B113  F0 0A

_label_b115:
  inc _var_0032                  ; $B115  E6 32
  lda _var_0032                  ; $B117  A5 32
  cmp a:_var_0137                ; $B119  CD 37 01
  bne _label_b115                ; $B11C  D0 F7

_label_b11e:
  rts                            ; $B11E  60

_label_b11f:
  jsr _func_d487                 ; $B11F  20 87 D4
  jsr _func_d36d                 ; $B122  20 6D D3
  tay                            ; $B125  A8
  lda a:_var_0213_indexed,X      ; $B126  BD 13 02
  cmp a:_var_0283_indexed,Y      ; $B129  D9 83 02
  bne _label_b180                ; $B12C  D0 52
  lda a:_var_020e_indexed,X      ; $B12E  BD 0E 02
  sec                            ; $B131  38
  sbc a:_var_027e_indexed,Y      ; $B132  F9 7E 02
  bcs _label_b13e                ; $B135  B0 07
  sta _var_002d_indexed          ; $B137  85 2D
  lda #$00                       ; $B139  A9 00
  sec                            ; $B13B  38
  sbc _var_002d_indexed          ; $B13C  E5 2D

_label_b13e:
  cmp #$10                       ; $B13E  C9 10
  bcs _label_b180                ; $B140  B0 3E
  lda #$00                       ; $B142  A9 00

_data_b144_indexed:
  sta _var_002e                  ; $B144  85 2E

_data_b146_indexed:
  lda a:_var_0211_indexed,X      ; $B146  BD 11 02
  sec                            ; $B149  38
  sbc a:_var_0281_indexed,Y      ; $B14A  F9 81 02
  bcs _label_b158                ; $B14D  B0 09
  sta _var_002d_indexed          ; $B14F  85 2D
  inc _var_002e                  ; $B151  E6 2E
  lda #$00                       ; $B153  A9 00
  sec                            ; $B155  38
  sbc _var_002d_indexed          ; $B156  E5 2D

_label_b158:
  cmp #$10                       ; $B158  C9 10
  bcs _label_b180                ; $B15A  B0 24
  tya                            ; $B15C  98

_label_b15d:
  tax                            ; $B15D  AA
  dec a:_var_027e_indexed,X      ; $B15E  DE 7E 02
  ldx _var_00af                  ; $B161  A6 AF
  lda #$00                       ; $B163  A9 00
  sta a:_var_0130_indexed,X      ; $B165  9D 30 01
  lda _var_002e                  ; $B168  A5 2E
  beq _label_b171                ; $B16A  F0 05
  lda #$00                       ; $B16C  A9 00
  jmp _label_b173                ; $B16E  4C 73 B1

_label_b171:
  lda #$01                       ; $B171  A9 01

_label_b173:
  sta a:_var_011c_indexed,X      ; $B173  9D 1C 01
  lda #$02                       ; $B176  A9 02
  sta a:_var_0133_indexed,X      ; $B178  9D 33 01
  lda #$06                       ; $B17B  A9 06
  sta a:_var_0130_indexed,X      ; $B17D  9D 30 01

_label_b180:
  inc _var_00af                  ; $B180  E6 AF
  jmp _label_b0fc                ; $B182  4C FC B0

_func_b185:
  lda _var_00af                  ; $B185  A5 AF
  sta _var_0032                  ; $B187  85 32
  lda #$FF                       ; $B189  A9 FF
  sta _var_00af                  ; $B18B  85 AF

_label_b18d:
  inc _var_00af                  ; $B18D  E6 AF
  ldy _var_00af                  ; $B18F  A4 AF
  beq _label_b1a4                ; $B191  F0 11
  lda a:_var_00cf_indexed,Y      ; $B193  B9 CF 00
  bne _label_b1ab                ; $B196  D0 13

_label_b198:
  lda _var_00af                  ; $B198  A5 AF
  cmp a:_var_0137                ; $B19A  CD 37 01
  bne _label_b18d                ; $B19D  D0 EE
  lda _var_0032                  ; $B19F  A5 32
  sta _var_00af                  ; $B1A1  85 AF
  rts                            ; $B1A3  60

_label_b1a4:
  lda a:_var_0207_indexed        ; $B1A4  AD 07 02
  cmp #$EF                       ; $B1A7  C9 EF
  beq _label_b198                ; $B1A9  F0 ED

_label_b1ab:
  jsr _func_d36d                 ; $B1AB  20 6D D3
  tay                            ; $B1AE  A8
  ldx _var_0032                  ; $B1AF  A6 32
  jsr _func_d487                 ; $B1B1  20 87 D4
  lda a:_var_020c_indexed,Y      ; $B1B4  B9 0C 02
  cmp a:_var_0283_indexed,X      ; $B1B7  DD 83 02
  bne _label_b198                ; $B1BA  D0 DC
  lda a:_var_0207_indexed,Y      ; $B1BC  B9 07 02
  sec                            ; $B1BF  38
  sbc a:_var_027e_indexed,X      ; $B1C0  FD 7E 02
  bcc _label_b198                ; $B1C3  90 D3
  cmp #$0C                       ; $B1C5  C9 0C
  bcs _label_b198                ; $B1C7  B0 CF
  lda a:_var_020a_indexed,Y      ; $B1C9  B9 0A 02
  sec                            ; $B1CC  38
  sbc a:_var_0281_indexed,X      ; $B1CD  FD 81 02
  bcs _label_b1d9                ; $B1D0  B0 07
  sta _var_0030                  ; $B1D2  85 30
  lda #$00                       ; $B1D4  A9 00
  sec                            ; $B1D6  38
  sbc _var_0030                  ; $B1D7  E5 30

_label_b1d9:
  cmp #$0C                       ; $B1D9  C9 0C
  bcs _label_b198                ; $B1DB  B0 BB
  dec a:_var_027e_indexed,X      ; $B1DD  DE 7E 02
  lda _var_00af                  ; $B1E0  A5 AF
  bne _label_b1e6                ; $B1E2  D0 02
  inc _var_00ed                  ; $B1E4  E6 ED

_label_b1e6:
  ldx _var_0032                  ; $B1E6  A6 32
  lda #$02                       ; $B1E8  A9 02
  sta a:_var_0133_indexed,X      ; $B1EA  9D 33 01
  lda #$06                       ; $B1ED  A9 06
  sta a:_var_0130_indexed,X      ; $B1EF  9D 30 01
  lda _var_0032                  ; $B1F2  A5 32
  sta _var_00af                  ; $B1F4  85 AF
  rts                            ; $B1F6  60

_func_b1f7:
  lda #$00                       ; $B1F7  A9 00
  sta _var_00af                  ; $B1F9  85 AF

_label_b1fb:
  lda _var_00aa                  ; $B1FB  A5 AA
  cmp _var_00af                  ; $B1FD  C5 AF
  bne _label_b202                ; $B1FF  D0 01
  rts                            ; $B201  60

_label_b202:
  jsr _func_d36d                 ; $B202  20 6D D3
  tay                            ; $B205  A8
  sta _var_002f_indexed          ; $B206  85 2F
  ldx _var_00af                  ; $B208  A6 AF
  lda a:_var_0140_indexed,X      ; $B20A  BD 40 01
  cmp #$63                       ; $B20D  C9 63
  bcs _label_b26d                ; $B20F  B0 5C
  lda a:_var_027e_indexed,Y      ; $B211  B9 7E 02
  sta _var_009b                  ; $B214  85 9B
  sta _var_00a1                  ; $B216  85 A1
  jsr _func_e76e                 ; $B218  20 6E E7
  lda _var_00a1                  ; $B21B  A5 A1
  sta a:_var_027e_indexed,Y      ; $B21D  99 7E 02
  lda a:_var_0140_indexed,X      ; $B220  BD 40 01
  bne _label_b26d                ; $B223  D0 48
  lda a:_var_0120_indexed,X      ; $B225  BD 20 01
  beq _label_b22d                ; $B228  F0 03
  jmp _label_b2db                ; $B22A  4C DB B2

_label_b22d:
  lda _var_00af                  ; $B22D  A5 AF
  asl a                          ; $B22F  0A
  tax                            ; $B230  AA
  lda a:_data_b2fe_indexed,X     ; $B231  BD FE B2
  sta _var_002d_indexed          ; $B234  85 2D
  lda a:_data_b2ff_indexed,X     ; $B236  BD FF B2
  sta _var_002e                  ; $B239  85 2E
  ldy #$07                       ; $B23B  A0 07
  ldx #$07                       ; $B23D  A2 07
  lda (_var_002d_indexed),Y      ; $B23F  B1 2D

_label_b241:
  cmp a:_data_e939_indexed,X     ; $B241  DD 39 E9
  beq _label_b272                ; $B244  F0 2C
  dex                            ; $B246  CA
  bpl _label_b241                ; $B247  10 F8
  ldy #$04                       ; $B249  A0 04
  ldx #$03                       ; $B24B  A2 03
  lda (_var_002d_indexed),Y      ; $B24D  B1 2D

_label_b24f:
  cmp a:_data_b30b_indexed+1,X   ; $B24F  DD 0C B3
  beq _label_b25a                ; $B252  F0 06
  dex                            ; $B254  CA
  bpl _label_b24f                ; $B255  10 F8
  jmp _label_b279                ; $B257  4C 79 B2

_label_b25a:
  ldx _var_00af                  ; $B25A  A6 AF
  lda #$64                       ; $B25C  A9 64
  sta a:_var_0140_indexed,X      ; $B25E  9D 40 01
  jsr _func_d36d                 ; $B261  20 6D D3
  tay                            ; $B264  A8
  lda #$EF                       ; $B265  A9 EF
  sta a:_var_027e_indexed,Y      ; $B267  99 7E 02
  sta a:_var_027f_indexed,Y      ; $B26A  99 7F 02

_label_b26d:
  inc _var_00af                  ; $B26D  E6 AF
  jmp _label_b1fb                ; $B26F  4C FB B1

_label_b272:
  ldx _var_00af                  ; $B272  A6 AF
  inc a:_var_0140_indexed,X      ; $B274  FE 40 01
  bne _label_b26d                ; $B277  D0 F4

_label_b279:
  jsr _func_b086                 ; $B279  20 86 B0
  jsr _func_b185                 ; $B27C  20 85 B1
  ldx _var_00af                  ; $B27F  A6 AF
  lda a:_var_0130_indexed,X      ; $B281  BD 30 01

_label_b284:
  beq _label_b298                ; $B284  F0 12
  cmp #$06                       ; $B286  C9 06
  bcs _label_b2d4                ; $B288  B0 4A
  inc a:_var_0130_indexed,X      ; $B28A  FE 30 01
  jmp _label_b2db                ; $B28D  4C DB B2

_label_b290:
  lda #$00                       ; $B290  A9 00
  sta a:_var_0133_indexed,X      ; $B292  9D 33 01
  sta a:_var_0130_indexed,X      ; $B295  9D 30 01

_label_b298:
  jmp _label_b549                ; $B298  4C 49 B5

_label_b29b:
  ldy _var_002f_indexed          ; $B29B  A4 2F
  lda a:_var_027e_indexed,Y      ; $B29D  B9 7E 02
  clc                            ; $B2A0  18
  adc _var_0065                  ; $B2A1  65 65
  and #$07                       ; $B2A3  29 07
  cmp #$07                       ; $B2A5  C9 07
  bne _label_b2b5                ; $B2A7  D0 0C
  lda a:_var_0281_indexed,Y      ; $B2A9  B9 81 02
  and #$07                       ; $B2AC  29 07
  cmp #$04                       ; $B2AE  C9 04
  bne _label_b2b5                ; $B2B0  D0 03
  jsr _func_b393                 ; $B2B2  20 93 B3

_label_b2b5:
  ldx _var_00af                  ; $B2B5  A6 AF
  lda a:_var_011c_indexed,X      ; $B2B7  BD 1C 01
  beq _label_b2cb                ; $B2BA  F0 0F
  cmp #$01                       ; $B2BC  C9 01
  beq _label_b2ce                ; $B2BE  F0 0E
  cmp #$02                       ; $B2C0  C9 02
  beq _label_b2d1                ; $B2C2  F0 0D
  cmp #$04                       ; $B2C4  C9 04
  beq _label_b2db                ; $B2C6  F0 13
  jmp _label_b766                ; $B2C8  4C 66 B7

_label_b2cb:
  jmp _label_b5a8                ; $B2CB  4C A8 B5

_label_b2ce:
  jmp _label_b65f                ; $B2CE  4C 5F B6

_label_b2d1:
  jmp _label_b716                ; $B2D1  4C 16 B7

_label_b2d4:
  cmp #$08                       ; $B2D4  C9 08
  bcs _label_b290                ; $B2D6  B0 B8

_label_b2d8:
  jmp _label_b310                ; $B2D8  4C 10 B3

_label_b2db:
  jsr _data_b4c4_indexed         ; $B2DB  20 C4 B4
  jsr _func_d36d                 ; $B2DE  20 6D D3
  tay                            ; $B2E1  A8
  lda a:_var_027e_indexed,Y      ; $B2E2  B9 7E 02
  sta _var_00a1                  ; $B2E5  85 A1
  lda a:_var_0283_indexed,Y      ; $B2E7  B9 83 02
  sta _var_0031_indexed          ; $B2EA  85 31
  jsr _func_e714                 ; $B2EC  20 14 E7
  lda _var_0032                  ; $B2EF  A5 32
  sta a:_var_027e_indexed,Y      ; $B2F1  99 7E 02
  lda _var_0031_indexed          ; $B2F4  A5 31
  sta a:_var_0283_indexed,Y      ; $B2F6  99 83 02
  inc _var_00af                  ; $B2F9  E6 AF
.byte $4c, $fb                   ; $B2FB  4C FB  branch into instruction detected: jmp

_label_b2fd:
.byte $b1                        ; $B2FD  B1

_data_b2fe_indexed:
.byte $cc                        ; $B2FE

_data_b2ff_indexed:
.byte $06, $e0, $06, $f4, $06, $30, $31, $32, $33, $34, $35, $38 ; $B2FF

_data_b30b_indexed:
  inc _var_0036_indexed,X        ; $B30B  F6 36
  rla _var_003a_indexed,X        ; $B30D  37 3A
.byte $3b                        ; $B30F  3B  rla a:$AFA6,Y

_label_b310:
  ldx _var_00af                  ; $B310  A6 AF  branch into instruction detected
  lda a:_var_0133_indexed,X      ; $B312  BD 33 01
  cmp #$03                       ; $B315  C9 03
  beq _label_b381                ; $B317  F0 68
  lda a:_var_0130_indexed,X      ; $B319  BD 30 01
  cmp #$06                       ; $B31C  C9 06
  bne _label_b323                ; $B31E  D0 03
  jmp _label_b71d                ; $B320  4C 1D B7

_label_b323:
  lda #$00                       ; $B323  A9 00
  sta _var_0032                  ; $B325  85 32
.byte $bd                        ; $B327  BD  branch into instruction detected: lda a:_var_011c_indexed,X

_label_b328:
.byte $1c, $01                   ; $B328  1C 01
  beq _label_b331                ; $B32A  F0 05
  ldy #$03                       ; $B32C  A0 03
  jmp _label_b333                ; $B32E  4C 33 B3

_label_b331:
  ldy #$05                       ; $B331  A0 05

_label_b333:
  ldx #$07                       ; $B333  A2 07
  lda (_var_002d_indexed),Y      ; $B335  B1 2D

_label_b337:
  cmp a:_data_e939_indexed,X     ; $B337  DD 39 E9
  beq _label_b356                ; $B33A  F0 1A
  dex                            ; $B33C  CA
  bpl _label_b337                ; $B33D  10 F8
  cpy #$06                       ; $B33F  C0 06
  bcs _label_b349                ; $B341  B0 06

_label_b343:
  iny                            ; $B343  C8

_label_b344:
  iny                            ; $B344  C8
  iny                            ; $B345  C8
  jmp _label_b333                ; $B346  4C 33 B3

_label_b349:
  ldx _var_00af                  ; $B349  A6 AF
  lda a:_var_011c_indexed,X      ; $B34B  BD 1C 01
  beq _label_b353                ; $B34E  F0 03

_label_b350:
  jmp _label_b6d8                ; $B350  4C D8 B6

_label_b353:
  jmp _label_b621                ; $B353  4C 21 B6

_label_b356:
  inc _var_0032                  ; $B356  E6 32
  cpy #$06                       ; $B358  C0 06
  bcc _label_b343                ; $B35A  90 E7
  lda _var_0032                  ; $B35C  A5 32
  cmp #$02                       ; $B35E  C9 02
  beq _label_b374                ; $B360  F0 12
  ldx _var_00af                  ; $B362  A6 AF
  lda a:_var_011c_indexed,X      ; $B364  BD 1C 01
  beq _label_b36e                ; $B367  F0 05
  lda #$00                       ; $B369  A9 00
  jmp _label_b370                ; $B36B  4C 70 B3

_label_b36e:
  lda #$01                       ; $B36E  A9 01

_label_b370:
  sta a:_var_011c_indexed,X      ; $B370  9D 1C 01
  rts                            ; $B373  60

_label_b374:
  ldx _var_00af                  ; $B374  A6 AF
  lda #$00                       ; $B376  A9 00
  sta a:_var_0130_indexed,X      ; $B378  9D 30 01
  lda #$01                       ; $B37B  A9 01

_label_b37d:
  sta a:_var_0133_indexed,X      ; $B37D  9D 33 01
  rts                            ; $B380  60

_label_b381:
  lda a:_var_0130_indexed,X      ; $B381  BD 30 01
  cmp #$06                       ; $B384  C9 06
  bne _label_b390                ; $B386  D0 08
  lda a:_var_011c_indexed,X      ; $B388  BD 1C 01
  beq _label_b353                ; $B38B  F0 C6
  jmp _label_b350                ; $B38D  4C 50 B3

_label_b390:
  jmp _label_b76d                ; $B390  4C 6D B7

_func_b393:
  lda #$00                       ; $B393  A9 00
  sta _var_00e7                  ; $B395  85 E7
  ldy _var_002f_indexed          ; $B397  A4 2F
  lda a:_var_0283_indexed,Y      ; $B399  B9 83 02
  beq _label_b3a8                ; $B39C  F0 0A
  cmp #$01                       ; $B39E  C9 01
  beq _label_b3a5                ; $B3A0  F0 03
  jmp _label_b46b                ; $B3A2  4C 6B B4

_label_b3a5:
  jmp _label_b440                ; $B3A5  4C 40 B4

_label_b3a8:
  ldx _var_00af                  ; $B3A8  A6 AF
  lda a:_var_06c0_indexed,X      ; $B3AA  BD C0 06
  beq _label_b3b0                ; $B3AD  F0 01
  rts                            ; $B3AF  60

_label_b3b0:
  ldx #$09                       ; $B3B0  A2 09
  ldy #$03                       ; $B3B2  A0 03
  lda (_var_002d_indexed),Y      ; $B3B4  B1 2D

_label_b3b6:
  cmp a:_data_b4ba_indexed,X     ; $B3B6  DD BA B4
  beq _label_b3c1                ; $B3B9  F0 06
  dex                            ; $B3BB  CA
  bpl _label_b3b6                ; $B3BC  10 F8
  jmp _label_b3d4                ; $B3BE  4C D4 B3

_label_b3c1:
  ldx #$09                       ; $B3C1  A2 09
  ldy #$05                       ; $B3C3  A0 05
  lda (_var_002d_indexed),Y      ; $B3C5  B1 2D

_label_b3c7:
  cmp a:_data_b4ba_indexed,X     ; $B3C7  DD BA B4
  bne _label_b3d1                ; $B3CA  D0 05
  inc _var_00e7                  ; $B3CC  E6 E7
  jmp _label_b423                ; $B3CE  4C 23 B4

_label_b3d1:
  dex                            ; $B3D1  CA
  bpl _label_b3c7                ; $B3D2  10 F3

_label_b3d4:
  lda _var_00af                  ; $B3D4  A5 AF
  cmp #$02                       ; $B3D6  C9 02
  beq _label_b423                ; $B3D8  F0 49
  lda _var_0050                  ; $B3DA  A5 50
  and #$80                       ; $B3DC  29 80
  beq _label_b3e9                ; $B3DE  F0 09
  lda _var_00af                  ; $B3E0  A5 AF
  cmp #$01                       ; $B3E2  C9 01
  bne _label_b423                ; $B3E4  D0 3D
  jmp _label_b3ed                ; $B3E6  4C ED B3

_label_b3e9:
  lda _var_00af                  ; $B3E9  A5 AF
  bne _label_b423                ; $B3EB  D0 36

_label_b3ed:
  ldx #$05                       ; $B3ED  A2 05
  ldy #$07                       ; $B3EF  A0 07
  lda (_var_002d_indexed),Y      ; $B3F1  B1 2D

_label_b3f3:
  cmp a:_data_eac5_indexed,X     ; $B3F3  DD C5 EA

_data_b3f6_indexed:
  beq _label_b423                ; $B3F6  F0 2B
  dex                            ; $B3F8  CA
  bpl _label_b3f3                ; $B3F9  10 F8
  ldx #$05                       ; $B3FB  A2 05
  ldy #$04                       ; $B3FD  A0 04

_data_b3ff_indexed:
  lda (_var_002d_indexed),Y      ; $B3FF  B1 2D

_label_b401:
  cmp a:_data_eac5_indexed,X     ; $B401  DD C5 EA
.byte $f0                        ; $B404  F0  branch into instruction detected: beq $B423

_label_b405:
.byte $1d                        ; $B405  1D
  dex                            ; $B406  CA
  bpl _label_b401                ; $B407  10 F8
  ldy _var_002f_indexed          ; $B409  A4 2F
  lda a:_var_0203_indexed        ; $B40B  AD 03 02
  sec                            ; $B40E  38
  sbc a:_var_0281_indexed,Y      ; $B40F  F9 81 02
  bcc _label_b41d                ; $B412  90 09
  cmp #$08                       ; $B414  C9 08
  bcs _label_b420                ; $B416  B0 08

_label_b418:
  lda #$04                       ; $B418  A9 04
  jmp _label_b4a6                ; $B41A  4C A6 B4

_label_b41d:
  jmp _label_b495                ; $B41D  4C 95 B4

_label_b420:
  jmp _label_b49a                ; $B420  4C 9A B4

_label_b423:
  ldy _var_002f_indexed          ; $B423  A4 2F
  lda a:_var_0200_indexed        ; $B425  AD 00 02
  sec                            ; $B428  38
  sbc a:_var_027e_indexed,Y      ; $B429  F9 7E 02
  bcc _label_b435                ; $B42C  90 07
  cmp #$05                       ; $B42E  C9 05
  bcc _label_b487                ; $B430  90 55
  jmp _label_b46b                ; $B432  4C 6B B4

_label_b435:
  sta _var_0032                  ; $B435  85 32
  lda #$00                       ; $B437  A9 00
  sec                            ; $B439  38
  sbc _var_0032                  ; $B43A  E5 32
  cmp #$05                       ; $B43C  C9 05
  bcc _label_b487                ; $B43E  90 47

_label_b440:
  ldy #$04                       ; $B440  A0 04

_label_b442:
  ldx #$05                       ; $B442  A2 05
  lda (_var_002d_indexed),Y      ; $B444  B1 2D

_label_b446:
.byte $dd                        ; $B446  DD  branch into instruction detected: cmp a:_data_eac5_indexed,X

_label_b447:
.byte $c5, $ea                   ; $B447  C5 EA
  beq _label_b45a                ; $B449  F0 0F
  dex                            ; $B44B  CA
  bpl _label_b446                ; $B44C  10 F8
  tya                            ; $B44E  98
  clc                            ; $B44F  18
  adc #$03                       ; $B450  69 03
  tay                            ; $B452  A8
  cpy #$0A                       ; $B453  C0 0A
  bne _label_b442                ; $B455  D0 EB
  jmp _label_b479                ; $B457  4C 79 B4

_label_b45a:
  ldy #$01                       ; $B45A  A0 01
  ldx #$0D                       ; $B45C  A2 0D
  lda (_var_002d_indexed),Y      ; $B45E  B1 2D

_label_b460:
  cmp a:_data_b4ac_indexed,X     ; $B460  DD AC B4
  beq _label_b49f                ; $B463  F0 3A
  dex                            ; $B465  CA
  bpl _label_b460                ; $B466  10 F8
  jmp _label_b479                ; $B468  4C 79 B4

_label_b46b:
  ldx #$05                       ; $B46B  A2 05
  ldy #$0A                       ; $B46D  A0 0A
  lda (_var_002d_indexed),Y      ; $B46F  B1 2D

_label_b471:
  cmp a:_data_eac5_indexed,X     ; $B471  DD C5 EA
  beq _label_b4a4                ; $B474  F0 2E
  dex                            ; $B476  CA
  bpl _label_b471                ; $B477  10 F8

_label_b479:
  lda _var_00e7                  ; $B479  A5 E7
.byte $d0                        ; $B47B  D0  branch into instruction detected: bne

_label_b47c:
.byte $9b                        ; $B47C  9B
  ldx _var_00af                  ; $B47D  A6 AF
  lda a:_var_011c_indexed,X      ; $B47F  BD 1C 01
  beq _label_b49a                ; $B482  F0 16
  jmp _label_b495                ; $B484  4C 95 B4

_label_b487:
  lda _var_00e7                  ; $B487  A5 E7
  bne _label_b418                ; $B489  D0 8D
  ldy _var_002f_indexed          ; $B48B  A4 2F
  lda a:_var_0203_indexed        ; $B48D  AD 03 02
  cmp a:_var_0281_indexed,Y      ; $B490  D9 81 02
  bcs _label_b49a                ; $B493  B0 05

_label_b495:
  lda #$01                       ; $B495  A9 01
  jmp _label_b4a6                ; $B497  4C A6 B4

_label_b49a:
.byte $a9                        ; $B49A  A9  branch into instruction detected: lda #$00

_label_b49b:
.byte $00                        ; $B49B  00
  jmp _label_b4a6                ; $B49C  4C A6 B4

_label_b49f:
  lda #$02                       ; $B49F  A9 02
  jmp _label_b4a6                ; $B4A1  4C A6 B4

_label_b4a4:
  lda #$03                       ; $B4A4  A9 03

_label_b4a6:
  ldx _var_00af                  ; $B4A6  A6 AF
  sta a:_var_011c_indexed,X      ; $B4A8  9D 1C 01
  rts                            ; $B4AB  60

_data_b4ac_indexed:
.byte $f0, $f1, $f2, $f3, $f4, $f5, $f8, $f9, $fa, $fb, $40, $41, $42, $43 ; $B4AC

_data_b4ba_indexed:
.byte $30                        ; $B4BA

_data_b4bb_indexed:
.byte $31                        ; $B4BB

_data_b4bc_indexed:
.byte $32, $33, $34, $35, $38, $f6, $39, $fc ; $B4BC

_data_b4c4_indexed:
  ldx _var_00af                  ; $B4C4  A6 AF
  lda a:_var_0130_indexed,X      ; $B4C6  BD 30 01
  bne _data_b4d5_indexed         ; $B4C9  D0 0A

_data_b4cb_indexed:
  lda a:_var_0133_indexed,X      ; $B4CB  BD 33 01
  beq _label_b4e9                ; $B4CE  F0 19
  lda #$04                       ; $B4D0  A9 04
  jmp _label_b4e4                ; $B4D2  4C E4 B4

_data_b4d5_indexed:
  cmp #$07                       ; $B4D5  C9 07
  bcs _label_b4dd                ; $B4D7  B0 04
  cmp #$06                       ; $B4D9  C9 06
  bcs _label_b4e2                ; $B4DB  B0 05

_label_b4dd:
  lda #$05                       ; $B4DD  A9 05
  jmp _label_b4e4                ; $B4DF  4C E4 B4

_label_b4e2:
  lda #$06                       ; $B4E2  A9 06

_label_b4e4:
  sta _var_0031_indexed          ; $B4E4  85 31
  jmp _label_b505                ; $B4E6  4C 05 B5

_label_b4e9:
  lda a:_var_011c_indexed,X      ; $B4E9  BD 1C 01
  cmp #$04                       ; $B4EC  C9 04
  beq _label_b4f9                ; $B4EE  F0 09
  cmp #$02                       ; $B4F0  C9 02
  bcc _label_b4f9                ; $B4F2  90 05
  lda #$02                       ; $B4F4  A9 02
  jmp _label_b4fb                ; $B4F6  4C FB B4

_label_b4f9:
  lda #$00                       ; $B4F9  A9 00

_label_b4fb:
  sta _var_0031_indexed          ; $B4FB  85 31
  lda _var_0050                  ; $B4FD  A5 50
  and #$08                       ; $B4FF  29 08
  beq _label_b505                ; $B501  F0 02
  inc _var_0031_indexed          ; $B503  E6 31

_label_b505:
  lda a:_var_011c_indexed,X      ; $B505  BD 1C 01
  and #$01                       ; $B508  29 01
  bne _label_b523                ; $B50A  D0 17
  lda _var_0031_indexed          ; $B50C  A5 31
  asl a                          ; $B50E  0A
  tax                            ; $B50F  AA
  ldy _var_002f_indexed          ; $B510  A4 2F
  lda a:_data_b53b_indexed,X     ; $B512  BD 3B B5
  sta a:_var_027f_indexed,Y      ; $B515  99 7F 02
  lda a:_data_b53c_indexed,X     ; $B518  BD 3C B5
  sta a:_var_0282_indexed,Y      ; $B51B  99 82 02
  lda #$02                       ; $B51E  A9 02
  jmp _label_b537                ; $B520  4C 37 B5

_label_b523:
  lda _var_0031_indexed          ; $B523  A5 31
  asl a                          ; $B525  0A
  tax                            ; $B526  AA
  ldy _var_002f_indexed          ; $B527  A4 2F
  lda a:_data_b53b_indexed,X     ; $B529  BD 3B B5
  sta a:_var_0282_indexed,Y      ; $B52C  99 82 02
  lda a:_data_b53c_indexed,X     ; $B52F  BD 3C B5

_data_b532_indexed:
  sta a:_var_027f_indexed,Y      ; $B532  99 7F 02
  lda #$42                       ; $B535  A9 42

_label_b537:
  sta a:_var_0280_indexed,Y      ; $B537  99 80 02
  rts                            ; $B53A  60

_data_b53b_indexed:
.byte $48                        ; $B53B

_data_b53c_indexed:
.byte $4a, $4c, $4e, $50, $52, $b4, $b6, $54, $56, $58, $5a, $5c, $5e ; $B53C

_label_b549:
  ldx _var_00af                  ; $B549  A6 AF
  lda a:_var_06ae_indexed,X      ; $B54B  BD AE 06
  beq _label_b559                ; $B54E  F0 09
  jsr _func_d487                 ; $B550  20 87 D4
  dec a:_var_027e_indexed,X      ; $B553  DE 7E 02
  jmp _label_b2db                ; $B556  4C DB B2

_label_b559:
  ldx #$05                       ; $B559  A2 05
  ldy #$07                       ; $B55B  A0 07
  lda (_var_002d_indexed),Y      ; $B55D  B1 2D

_label_b55f:
  cmp a:_data_eac5_indexed,X     ; $B55F  DD C5 EA
  beq _label_b586                ; $B562  F0 22
  dex                            ; $B564  CA
  bpl _label_b55f                ; $B565  10 F8
  ldx #$05                       ; $B567  A2 05
  ldy #$04                       ; $B569  A0 04
  lda (_var_002d_indexed),Y      ; $B56B  B1 2D

_label_b56d:
  cmp a:_data_eac5_indexed,X     ; $B56D  DD C5 EA
  beq _label_b586                ; $B570  F0 14
  dex                            ; $B572  CA
  bpl _label_b56d                ; $B573  10 F8
  ldx #$0D                       ; $B575  A2 0D
  ldy #$0A                       ; $B577  A0 0A
  lda (_var_002d_indexed),Y      ; $B579  B1 2D

_label_b57b:
  cmp a:_data_b59a_indexed,X     ; $B57B  DD 9A B5
  beq _label_b586                ; $B57E  F0 06

_label_b580:
  dex                            ; $B580  CA
  bpl _label_b57b                ; $B581  10 F8
  jmp _label_b590                ; $B583  4C 90 B5

_label_b586:
  ldx _var_00af                  ; $B586  A6 AF
  lda #$00                       ; $B588  A9 00
  sta a:_var_0133_indexed,X      ; $B58A  9D 33 01
  jmp _label_b29b                ; $B58D  4C 9B B2

_label_b590:
  ldx _var_00af                  ; $B590  A6 AF
.byte $a9                        ; $B592  A9  branch into instruction detected: lda #$01

_label_b593:
.byte $01                        ; $B593  01
  sta a:_var_0133_indexed,X      ; $B594  9D 33 01
  jmp _label_b76d                ; $B597  4C 6D B7

_data_b59a_indexed:
.byte $30, $31, $32, $33, $34, $35, $38, $f4, $f5, $f6, $f8, $f9, $fa, $fb ; $B59A

_label_b5a8:
  ldx _var_00af                  ; $B5A8  A6 AF
  lda #$00                       ; $B5AA  A9 00
  sta a:_var_011c_indexed,X      ; $B5AC  9D 1C 01
  ldx #$07                       ; $B5AF  A2 07
  ldy #$05                       ; $B5B1  A0 05
  lda (_var_002d_indexed),Y      ; $B5B3  B1 2D

_label_b5b5:
  cmp a:_data_e939_indexed,X     ; $B5B5  DD 39 E9
  beq _label_b615                ; $B5B8  F0 5B
  dex                            ; $B5BA  CA
  bpl _label_b5b5                ; $B5BB  10 F8
  ldx #$07                       ; $B5BD  A2 07
  ldy #$08                       ; $B5BF  A0 08
  lda (_var_002d_indexed),Y      ; $B5C1  B1 2D

_label_b5c3:
  cmp a:_data_e94c_indexed,X     ; $B5C3  DD 4C E9
  beq _label_b5dc                ; $B5C6  F0 14
  dex                            ; $B5C8  CA
  bpl _label_b5c3                ; $B5C9  10 F8
  ldx #$07                       ; $B5CB  A2 07
  ldy #$0B                       ; $B5CD  A0 0B
  lda (_var_002d_indexed),Y      ; $B5CF  B1 2D

_label_b5d1:
  cmp a:_data_cec7_indexed,X     ; $B5D1  DD C7 CE
  beq _label_b5fa                ; $B5D4  F0 24
  dex                            ; $B5D6  CA
  bpl _label_b5d1                ; $B5D7  10 F8
  jmp _label_b607                ; $B5D9  4C 07 B6

_label_b5dc:
  ldx #$07                       ; $B5DC  A2 07
  ldy #$02                       ; $B5DE  A0 02
  lda (_var_002d_indexed),Y      ; $B5E0  B1 2D

_label_b5e2:
.byte $dd, $39                   ; $B5E2  DD 39  branch into instruction detected: cmp a:_data_e939_indexed,X

_label_b5e4:
.byte $e9                        ; $B5E4  E9
  beq _label_b615                ; $B5E5  F0 2E
  dex                            ; $B5E7  CA
  bpl _label_b5e2                ; $B5E8  10 F8
  ldx _var_002f_indexed          ; $B5EA  A6 2F
  lda a:_var_027e_indexed,X      ; $B5EC  BD 7E 02
  cmp #$10                       ; $B5EF  C9 10
  bcc _label_b615                ; $B5F1  90 22
  ldx _var_00af                  ; $B5F3  A6 AF
  lda #$02                       ; $B5F5  A9 02
  jmp _label_b5fe                ; $B5F7  4C FE B5

_label_b5fa:
  ldx _var_00af                  ; $B5FA  A6 AF
.byte $a9                        ; $B5FC  A9  branch into instruction detected: lda #$03

_label_b5fd:
.byte $03                        ; $B5FD  03

_label_b5fe:
  sta a:_var_0133_indexed,X      ; $B5FE  9D 33 01
  inc a:_var_0130_indexed,X      ; $B601  FE 30 01
  jmp _label_b2db                ; $B604  4C DB B2

_label_b607:
  lda a:_var_0123                ; $B607  AD 23 01
  bne _label_b61e                ; $B60A  D0 12
  ldy _var_002f_indexed          ; $B60C  A4 2F
  lda a:_var_0281_indexed,Y      ; $B60E  B9 81 02
  cmp #$EC                       ; $B611  C9 EC
  bcc _label_b621                ; $B613  90 0C

_label_b615:
.byte $a6                        ; $B615  A6  branch into instruction detected: ldx _var_00af

_label_b616:
.byte $af                        ; $B616  AF
  ldy _var_002f_indexed          ; $B617  A4 2F
  lda #$01                       ; $B619  A9 01
  sta a:_var_011c_indexed,X      ; $B61B  9D 1C 01

_label_b61e:
  jmp _label_b2db                ; $B61E  4C DB B2

_label_b621:
  ldy _var_002f_indexed          ; $B621  A4 2F
  ldx _var_00af                  ; $B623  A6 AF
  lda a:_var_0281_indexed,Y      ; $B625  B9 81 02
  and #$07                       ; $B628  29 07
  cmp #$04                       ; $B62A  C9 04
  bne _label_b633                ; $B62C  D0 05
  lda #$01                       ; $B62E  A9 01
  sta a:_var_0111                ; $B630  8D 11 01

_label_b633:
  lda a:_var_0281_indexed,Y      ; $B633  B9 81 02
  clc                            ; $B636  18
  adc a:_var_0111                ; $B637  6D 11 01
  sta a:_var_0281_indexed,Y      ; $B63A  99 81 02
  cmp #$EC                       ; $B63D  C9 EC
  bcc _label_b64e                ; $B63F  90 0D
  lda #$EC                       ; $B641  A9 EC
  sta a:_var_0281_indexed,Y      ; $B643  99 81 02
  lda #$00                       ; $B646  A9 00
  sta a:_var_0130_indexed,X      ; $B648  9D 30 01
  jmp _label_b615                ; $B64B  4C 15 B6

_label_b64e:
  and #$07                       ; $B64E  29 07
  cmp #$04                       ; $B650  C9 04
  bne _label_b65c                ; $B652  D0 08
  lda a:_var_0130_indexed,X      ; $B654  BD 30 01
  beq _label_b65c                ; $B657  F0 03
  inc a:_var_0130_indexed,X      ; $B659  FE 30 01

_label_b65c:
  jmp _label_b2db                ; $B65C  4C DB B2

_label_b65f:
  ldx _var_00af                  ; $B65F  A6 AF
  lda #$01                       ; $B661  A9 01
  sta a:_var_011c_indexed,X      ; $B663  9D 1C 01
  ldx #$07                       ; $B666  A2 07

_label_b668:
  ldy #$03                       ; $B668  A0 03
  lda (_var_002d_indexed),Y      ; $B66A  B1 2D

_label_b66c:
  cmp a:_data_e939_indexed,X     ; $B66C  DD 39 E9
  beq _label_b6cc                ; $B66F  F0 5B
  dex                            ; $B671  CA
  bpl _label_b66c                ; $B672  10 F8
  ldx #$07                       ; $B674  A2 07
  ldy #$06                       ; $B676  A0 06
  lda (_var_002d_indexed),Y      ; $B678  B1 2D

_label_b67a:
  cmp a:_data_e94c_indexed,X     ; $B67A  DD 4C E9
  beq _label_b693                ; $B67D  F0 14
  dex                            ; $B67F  CA
  bpl _label_b67a                ; $B680  10 F8
  ldx #$07                       ; $B682  A2 07
  ldy #$09                       ; $B684  A0 09
  lda (_var_002d_indexed),Y      ; $B686  B1 2D

_label_b688:
  cmp a:_data_cec7_indexed,X     ; $B688  DD C7 CE
  beq _label_b6b1                ; $B68B  F0 24
  dex                            ; $B68D  CA
  bpl _label_b688                ; $B68E  10 F8
  jmp _label_b6be                ; $B690  4C BE B6

_label_b693:
  ldx #$07                       ; $B693  A2 07
  ldy #$00                       ; $B695  A0 00
  lda (_var_002d_indexed),Y      ; $B697  B1 2D

_label_b699:
  cmp a:_data_e939_indexed,X     ; $B699  DD 39 E9
  beq _label_b6cc                ; $B69C  F0 2E
  dex                            ; $B69E  CA
  bpl _label_b699                ; $B69F  10 F8
  ldx _var_002f_indexed          ; $B6A1  A6 2F
  lda a:_var_027e_indexed,X      ; $B6A3  BD 7E 02
  cmp #$10                       ; $B6A6  C9 10
  bcc _label_b6cc                ; $B6A8  90 22
  ldx _var_00af                  ; $B6AA  A6 AF
  lda #$02                       ; $B6AC  A9 02
  jmp _label_b6b5                ; $B6AE  4C B5 B6

_label_b6b1:
  ldx _var_00af                  ; $B6B1  A6 AF
  lda #$03                       ; $B6B3  A9 03

_label_b6b5:
  sta a:_var_0133_indexed,X      ; $B6B5  9D 33 01
  inc a:_var_0130_indexed,X      ; $B6B8  FE 30 01
  jmp _label_b6d5                ; $B6BB  4C D5 B6

_label_b6be:
.byte $ad                        ; $B6BE  AD  branch into instruction detected: lda a:_var_0123

_label_b6bf:
.byte $23, $01                   ; $B6BF  23 01
  bne _label_b6d5                ; $B6C1  D0 12
  ldy _var_002f_indexed          ; $B6C3  A4 2F
  lda a:_var_0281_indexed,Y      ; $B6C5  B9 81 02
  cmp #$05                       ; $B6C8  C9 05
  bcs _label_b6d8                ; $B6CA  B0 0C

_label_b6cc:
  ldx _var_00af                  ; $B6CC  A6 AF
  ldy _var_002f_indexed          ; $B6CE  A4 2F
  lda #$00                       ; $B6D0  A9 00
  sta a:_var_011c_indexed,X      ; $B6D2  9D 1C 01

_label_b6d5:
  jmp _label_b2db                ; $B6D5  4C DB B2

_label_b6d8:
  ldy _var_002f_indexed          ; $B6D8  A4 2F
  ldx _var_00af                  ; $B6DA  A6 AF
  lda a:_var_0281_indexed,Y      ; $B6DC  B9 81 02
  and #$07                       ; $B6DF  29 07
  cmp #$04                       ; $B6E1  C9 04
  bne _label_b6ea                ; $B6E3  D0 05
  lda #$01                       ; $B6E5  A9 01
  sta a:_var_0111                ; $B6E7  8D 11 01

_label_b6ea:
  lda a:_var_0281_indexed,Y      ; $B6EA  B9 81 02
  sec                            ; $B6ED  38

_data_b6ee_indexed:
  sbc a:_var_0111                ; $B6EE  ED 11 01
  sta a:_var_0281_indexed,Y      ; $B6F1  99 81 02
  cmp #$04                       ; $B6F4  C9 04
  bcs _data_b705_indexed         ; $B6F6  B0 0D

_data_b6f8_indexed:
  lda #$04                       ; $B6F8  A9 04

_data_b6fa_indexed:
  sta a:_var_0281_indexed,Y      ; $B6FA  99 81 02
  lda #$00                       ; $B6FD  A9 00
  sta a:_var_0130_indexed,X      ; $B6FF  9D 30 01
  jmp _label_b6cc                ; $B702  4C CC B6

_data_b705_indexed:
  and #$07                       ; $B705  29 07

_data_b707_indexed:
  cmp #$04                       ; $B707  C9 04
  bne _label_b713                ; $B709  D0 08
  lda a:_var_0130_indexed,X      ; $B70B  BD 30 01
  beq _label_b713                ; $B70E  F0 03
.byte $fe                        ; $B710  FE  branch into instruction detected: inc a:_var_0130_indexed,X

_label_b711:
.byte $30, $01                   ; $B711  30 01

_label_b713:
  jmp _label_b2db                ; $B713  4C DB B2

_label_b716:
  ldx _var_00af                  ; $B716  A6 AF
  lda #$02                       ; $B718  A9 02
  sta a:_var_011c_indexed,X      ; $B71A  9D 1C 01

_label_b71d:
  ldx _var_00af                  ; $B71D  A6 AF
  ldy _var_002f_indexed          ; $B71F  A4 2F
  lda a:_var_027e_indexed,Y      ; $B721  B9 7E 02
  clc                            ; $B724  18
  adc _var_0065                  ; $B725  65 65
  and #$07                       ; $B727  29 07
  cmp #$07                       ; $B729  C9 07
  bne _label_b732                ; $B72B  D0 05
  lda #$01                       ; $B72D  A9 01
  sta a:_var_0111                ; $B72F  8D 11 01

_label_b732:
  lda a:_var_027e_indexed,Y      ; $B732  B9 7E 02
  sec                            ; $B735  38
  sbc a:_var_0111                ; $B736  ED 11 01
  sta a:_var_027e_indexed,Y      ; $B739  99 7E 02
  lda a:_var_0130_indexed,X      ; $B73C  BD 30 01
  beq _label_b750                ; $B73F  F0 0F
  lda a:_var_027e_indexed,Y      ; $B741  B9 7E 02
  clc                            ; $B744  18
  adc _var_0065                  ; $B745  65 65
  and #$07                       ; $B747  29 07
  cmp #$07                       ; $B749  C9 07
  bne _label_b750                ; $B74B  D0 03
  inc a:_var_0130_indexed,X      ; $B74D  FE 30 01

_label_b750:
  lda a:_var_0283_indexed,Y      ; $B750  B9 83 02
  cmp #$01                       ; $B753  C9 01
  beq _label_b763                ; $B755  F0 0C
  lda a:_var_027e_indexed,Y      ; $B757  B9 7E 02
  cmp #$0F                       ; $B75A  C9 0F
  bcs _label_b763                ; $B75C  B0 05
  lda #$03                       ; $B75E  A9 03
  sta a:_var_011c_indexed,X      ; $B760  9D 1C 01

_label_b763:
  jmp _label_b2db                ; $B763  4C DB B2

_label_b766:
  ldx _var_00af                  ; $B766  A6 AF
  lda #$03                       ; $B768  A9 03
  sta a:_var_011c_indexed,X      ; $B76A  9D 1C 01

_label_b76d:
  ldx _var_00af                  ; $B76D  A6 AF
  ldy _var_002f_indexed          ; $B76F  A4 2F
  lda a:_var_027e_indexed,Y      ; $B771  B9 7E 02
  clc                            ; $B774  18
  adc _var_0065                  ; $B775  65 65
  and #$07                       ; $B777  29 07
  cmp #$07                       ; $B779  C9 07
  bne _label_b782                ; $B77B  D0 05
  lda #$01                       ; $B77D  A9 01
  sta a:_var_0111                ; $B77F  8D 11 01

_label_b782:
  lda a:_var_027e_indexed,Y      ; $B782  B9 7E 02
  clc                            ; $B785  18
  adc a:_var_0111                ; $B786  6D 11 01
  sta a:_var_027e_indexed,Y      ; $B789  99 7E 02
  lda a:_var_0130_indexed,X      ; $B78C  BD 30 01
  beq _label_b7a0                ; $B78F  F0 0F
  lda a:_var_027e_indexed,Y      ; $B791  B9 7E 02
  clc                            ; $B794  18
  adc _var_0065                  ; $B795  65 65
  and #$07                       ; $B797  29 07
  cmp #$07                       ; $B799  C9 07
  bne _label_b7a0                ; $B79B  D0 03
  inc a:_var_0130_indexed,X      ; $B79D  FE 30 01

_label_b7a0:
  lda a:_var_0283_indexed,Y      ; $B7A0  B9 83 02
  cmp #$FF                       ; $B7A3  C9 FF
  beq _label_b7b3                ; $B7A5  F0 0C
  lda a:_var_027e_indexed,Y      ; $B7A7  B9 7E 02
  cmp #$E7                       ; $B7AA  C9 E7
  bcc _label_b7b3                ; $B7AC  90 05
  lda #$02                       ; $B7AE  A9 02
  sta a:_var_011c_indexed,X      ; $B7B0  9D 1C 01

_label_b7b3:
  jmp _label_b2db                ; $B7B3  4C DB B2

_func_b7b6:
  lda #$00                       ; $B7B6  A9 00
  sta _var_00af                  ; $B7B8  85 AF

_label_b7ba:
  lda _var_00af                  ; $B7BA  A5 AF
  cmp _var_00aa                  ; $B7BC  C5 AA
  bne _label_b7c1                ; $B7BE  D0 01
  rts                            ; $B7C0  60

_label_b7c1:
  ldx _var_00af                  ; $B7C1  A6 AF
  lda a:_var_0120_indexed,X      ; $B7C3  BD 20 01
  beq _label_b7cf                ; $B7C6  F0 07
  cmp #$02                       ; $B7C8  C9 02
  beq _label_b7cf                ; $B7CA  F0 03
  jmp _label_b90c                ; $B7CC  4C 0C B9

_label_b7cf:
  lda _var_00af                  ; $B7CF  A5 AF
  asl a                          ; $B7D1  0A
  tax                            ; $B7D2  AA
  lda a:_data_b91f_indexed,X     ; $B7D3  BD 1F B9
  sta _var_002d_indexed          ; $B7D6  85 2D
  lda a:_data_b920_indexed,X     ; $B7D8  BD 20 B9
  sta _var_002e                  ; $B7DB  85 2E
  lda a:_data_b924_indexed+1,X   ; $B7DD  BD 25 B9
  sta _var_002f_indexed          ; $B7E0  85 2F
  lda a:_data_b926_indexed,X     ; $B7E2  BD 26 B9
  sta _var_0030                  ; $B7E5  85 30
  jsr _func_d36d                 ; $B7E7  20 6D D3
  tax                            ; $B7EA  AA
  lda _var_0065                  ; $B7EB  A5 65
  clc                            ; $B7ED  18
  adc a:_var_027e_indexed,X      ; $B7EE  7D 7E 02
  and #$07                       ; $B7F1  29 07
  cmp #$07                       ; $B7F3  C9 07
  beq _label_b7fa                ; $B7F5  F0 03

_label_b7f7:
  jmp _label_b90c                ; $B7F7  4C 0C B9

_label_b7fa:
  lda a:_var_0281_indexed,X      ; $B7FA  BD 81 02
  and #$07                       ; $B7FD  29 07
.byte $c9                        ; $B7FF  C9  branch into instruction detected: cmp #$04

_label_b800:
.byte $04                        ; $B800  04
  bne _label_b7f7                ; $B801  D0 F4
  ldy #$01                       ; $B803  A0 01
  lda #$00                       ; $B805  A9 00
  sta (_var_002d_indexed),Y      ; $B807  91 2D
  lda a:_var_027e_indexed,X      ; $B809  BD 7E 02
  sta _var_00a1                  ; $B80C  85 A1
  lda a:_var_0281_indexed,X      ; $B80E  BD 81 02
  clc                            ; $B811  18
  adc #$FC                       ; $B812  69 FC
  lsr a                          ; $B814  4A
  lsr a                          ; $B815  4A
  lsr a                          ; $B816  4A
  sta (_var_002f_indexed),Y      ; $B817  91 2F
  lda _var_00a1                  ; $B819  A5 A1
  clc                            ; $B81B  18
  adc #$01                       ; $B81C  69 01
  clc                            ; $B81E  18
  adc _var_0065                  ; $B81F  65 65
  sta _var_006c                  ; $B821  85 6C
  bcs _label_b83a                ; $B823  B0 15
  cmp #$EF                       ; $B825  C9 EF
  bcs _label_b83a                ; $B827  B0 11
  lda _var_001d                  ; $B829  A5 1D
  and #$02                       ; $B82B  29 02
  beq _label_b83f                ; $B82D  F0 10
  lda (_var_002d_indexed),Y      ; $B82F  B1 2D
  clc                            ; $B831  18
  adc #$01                       ; $B832  69 01
  rol a                          ; $B834  2A
.byte $91                        ; $B835  91  branch into instruction detected: sta (_var_002d_indexed),Y

_label_b836:
.byte $2d                        ; $B836  2D
  jmp _label_b83f                ; $B837  4C 3F B8

_label_b83a:
  clc                            ; $B83A  18
  adc #$10                       ; $B83B  69 10
  sta _var_006c                  ; $B83D  85 6C

_label_b83f:
  lda _var_006c                  ; $B83F  A5 6C
  asl a                          ; $B841  0A
  sta _var_0031_indexed          ; $B842  85 31
  lda (_var_002d_indexed),Y      ; $B844  B1 2D
  rol a                          ; $B846  2A
  sta (_var_002d_indexed),Y      ; $B847  91 2D
  lda _var_0031_indexed          ; $B849  A5 31
  asl a                          ; $B84B  0A
  sta _var_0031_indexed          ; $B84C  85 31
  lda (_var_002d_indexed),Y      ; $B84E  B1 2D
  rol a                          ; $B850  2A
  sta (_var_002d_indexed),Y      ; $B851  91 2D
  lda _var_0031_indexed          ; $B853  A5 31
  clc                            ; $B855  18
  adc (_var_002f_indexed),Y      ; $B856  71 2F
  sta (_var_002f_indexed),Y      ; $B858  91 2F
  clc                            ; $B85A  18
  lda (_var_002d_indexed),Y      ; $B85B  B1 2D
  adc #$20                       ; $B85D  69 20
  sta (_var_002d_indexed),Y      ; $B85F  91 2D
  lda (_var_002d_indexed),Y      ; $B861  B1 2D
  ldy #$00                       ; $B863  A0 00

_label_b865:
  sta (_var_002d_indexed),Y      ; $B865  91 2D
  iny                            ; $B867  C8
  cpy #$03                       ; $B868  C0 03
  bne _label_b865                ; $B86A  D0 F9

_label_b86c:
  ldy #$01                       ; $B86C  A0 01
  lda (_var_002f_indexed),Y      ; $B86E  B1 2F
  sec                            ; $B870  38
  sbc #$20                       ; $B871  E9 20
  ldy #$00                       ; $B873  A0 00
  sta (_var_002f_indexed),Y      ; $B875  91 2F
  bcs _label_b880                ; $B877  B0 07
  lda (_var_002d_indexed),Y      ; $B879  B1 2D
  sec                            ; $B87B  38
  sbc #$01                       ; $B87C  E9 01
  sta (_var_002d_indexed),Y      ; $B87E  91 2D

_label_b880:
  iny                            ; $B880  C8
  lda (_var_002f_indexed),Y      ; $B881  B1 2F
  clc                            ; $B883  18
  adc #$20                       ; $B884  69 20
  iny                            ; $B886  C8
  sta (_var_002f_indexed),Y      ; $B887  91 2F
  bcc _label_b892                ; $B889  90 07
  lda (_var_002d_indexed),Y      ; $B88B  B1 2D
  clc                            ; $B88D  18
  adc #$01                       ; $B88E  69 01
  sta (_var_002d_indexed),Y      ; $B890  91 2D

_label_b892:
  lda (_var_002d_indexed),Y      ; $B892  B1 2D
  iny                            ; $B894  C8
  sta (_var_002d_indexed),Y      ; $B895  91 2D
  dey                            ; $B897  88
  lda (_var_002f_indexed),Y      ; $B898  B1 2F
  clc                            ; $B89A  18
  adc #$20                       ; $B89B  69 20
  iny                            ; $B89D  C8
  sta (_var_002f_indexed),Y      ; $B89E  91 2F
  bcc _label_b8a9                ; $B8A0  90 07
  lda (_var_002d_indexed),Y      ; $B8A2  B1 2D
  clc                            ; $B8A4  18
  adc #$01                       ; $B8A5  69 01
  sta (_var_002d_indexed),Y      ; $B8A7  91 2D

_label_b8a9:
  ldx _var_00af                  ; $B8A9  A6 AF
  lda #$01                       ; $B8AB  A9 01
  sta a:_var_0120_indexed,X      ; $B8AD  9D 20 01
  jsr _func_d487                 ; $B8B0  20 87 D4
  lda a:_var_0283_indexed,X      ; $B8B3  BD 83 02
  beq _label_b8ea                ; $B8B6  F0 32
  ldy #$00                       ; $B8B8  A0 00
  cmp #$01                       ; $B8BA  C9 01
  bne _label_b8cd                ; $B8BC  D0 0F

_label_b8be:
  lda (_var_002d_indexed),Y      ; $B8BE  B1 2D
  sec                            ; $B8C0  38
  sbc #$08                       ; $B8C1  E9 08
  sta (_var_002d_indexed),Y      ; $B8C3  91 2D
  iny                            ; $B8C5  C8
  cpy #$04                       ; $B8C6  C0 04
  bne _label_b8be                ; $B8C8  D0 F4
  jmp _label_b8ea                ; $B8CA  4C EA B8

_label_b8cd:
  lda _var_0065                  ; $B8CD  A5 65
  bne _label_b8de                ; $B8CF  D0 0D
  lda _var_001d                  ; $B8D1  A5 1D
  and #$02                       ; $B8D3  29 02
  bne _label_b8de                ; $B8D5  D0 07
  lda a:_var_027e_indexed,X      ; $B8D7  BD 7E 02
  cmp #$EF                       ; $B8DA  C9 EF
  beq _label_b8ea                ; $B8DC  F0 0C

_label_b8de:
  lda (_var_002d_indexed),Y      ; $B8DE  B1 2D
  clc                            ; $B8E0  18
  adc #$08                       ; $B8E1  69 08
  sta (_var_002d_indexed),Y      ; $B8E3  91 2D
  iny                            ; $B8E5  C8
  cpy #$04                       ; $B8E6  C0 04
  bne _label_b8cd                ; $B8E8  D0 E3

_label_b8ea:
  ldy #$00                       ; $B8EA  A0 00

_label_b8ec:
  lda (_var_002d_indexed),Y      ; $B8EC  B1 2D
  cmp #$20                       ; $B8EE  C9 20
  bcc _label_b911                ; $B8F0  90 1F
  cmp #$2B                       ; $B8F2  C9 2B
  bne _label_b907                ; $B8F4  D0 11
  lda (_var_002f_indexed),Y      ; $B8F6  B1 2F
  cmp #$C0                       ; $B8F8  C9 C0
  bcc _label_b907                ; $B8FA  90 0B
  sbc #$C0                       ; $B8FC  E9 C0
  sta (_var_002f_indexed),Y      ; $B8FE  91 2F
  lda (_var_002d_indexed),Y      ; $B900  B1 2D
  sec                            ; $B902  38
  sbc #$0B                       ; $B903  E9 0B
  sta (_var_002d_indexed),Y      ; $B905  91 2D

_label_b907:
  iny                            ; $B907  C8
  cpy #$04                       ; $B908  C0 04
  bne _label_b8ec                ; $B90A  D0 E0

_label_b90c:
  inc _var_00af                  ; $B90C  E6 AF
  jmp _label_b7ba                ; $B90E  4C BA B7

_label_b911:
  lda #$2B                       ; $B911  A9 2B
  sta (_var_002d_indexed),Y      ; $B913  91 2D
  lda (_var_002f_indexed),Y      ; $B915  B1 2F
  sec                            ; $B917  38
  sbc #$40                       ; $B918  E9 40
  sta (_var_002f_indexed),Y      ; $B91A  91 2F
  jmp _label_b907                ; $B91C  4C 07 B9

_data_b91f_indexed:
.byte $c8                        ; $B91F

_data_b920_indexed:
.byte $06, $dc, $06, $f0         ; $B920

_data_b924_indexed:
  asl _var_00c4                  ; $B924  06 C4

_data_b926_indexed:
  asl _var_00d8                  ; $B926  06 D8
.byte $06                        ; $B928  06  asl $EC

_label_b929:
.byte $ec, $06                   ; $B929  EC 06  branch into instruction detected

_func_b92b:
  lda _var_00aa                  ; $B92B  A5 AA  branch into instruction detected
  beq _label_b94a                ; $B92D  F0 1B
  lda #$00                       ; $B92F  A9 00
  sta _var_002e                  ; $B931  85 2E
  ldx a:_var_06bd                ; $B933  AE BD 06
  lda a:_var_0120_indexed,X      ; $B936  BD 20 01
  bne _label_b94b                ; $B939  D0 10

_label_b93b:
  inc a:_var_06bd                ; $B93B  EE BD 06
  lda a:_var_06bd                ; $B93E  AD BD 06
  cmp _var_00aa                  ; $B941  C5 AA
  bne _label_b94a                ; $B943  D0 05
  lda #$00                       ; $B945  A9 00
  sta a:_var_06bd                ; $B947  8D BD 06

_label_b94a:
  rts                            ; $B94A  60

_label_b94b:
  lda a:_var_0140_indexed,X      ; $B94B  BD 40 01
  bne _label_b93b                ; $B94E  D0 EB
  inc _var_002e                  ; $B950  E6 2E
  lda _var_002e                  ; $B952  A5 2E
  cmp #$03                       ; $B954  C9 03
  beq _label_b94a                ; $B956  F0 F2
  lda #$00                       ; $B958  A9 00
  sta _var_002d_indexed          ; $B95A  85 2D

_label_b95c:
  cpx #$00                       ; $B95C  E0 00
  beq _label_b967                ; $B95E  F0 07
  clc                            ; $B960  18
  adc #$14                       ; $B961  69 14
  dex                            ; $B963  CA
  jmp _label_b95c                ; $B964  4C 5C B9

_label_b967:
  tax                            ; $B967  AA
  tay                            ; $B968  A8

_label_b969:
  lda a:_var_06c8_indexed,X      ; $B969  BD C8 06
  sta PPU_ADDR                   ; $B96C  8D 06 20
  lda a:_var_06c4_indexed,X      ; $B96F  BD C4 06
  sta PPU_ADDR                   ; $B972  8D 06 20
  lda PPU_DATA                   ; $B975  AD 07 20
  lda PPU_DATA                   ; $B978  AD 07 20
  sta a:_var_06cc_indexed,Y      ; $B97B  99 CC 06
  lda PPU_DATA                   ; $B97E  AD 07 20
  sta a:_var_06cd_indexed,Y      ; $B981  99 CD 06
  lda PPU_DATA                   ; $B984  AD 07 20
  sta a:_var_06ce_indexed,Y      ; $B987  99 CE 06
  iny                            ; $B98A  C8
  iny                            ; $B98B  C8
  iny                            ; $B98C  C8
  inx                            ; $B98D  E8
  inc _var_002d_indexed          ; $B98E  E6 2D
  lda _var_002d_indexed          ; $B990  A5 2D
  cmp #$04                       ; $B992  C9 04
  bne _label_b969                ; $B994  D0 D3
  ldx a:_var_06bd                ; $B996  AE BD 06
  lda #$00                       ; $B999  A9 00
  sta a:_var_0120_indexed,X      ; $B99B  9D 20 01
  jmp _label_b93b                ; $B99E  4C 3B B9

_func_b9a1:
  lda _var_00e9                  ; $B9A1  A5 E9
  beq _label_b9e1                ; $B9A3  F0 3C
  lda _var_00e6                  ; $B9A5  A5 E6
  cmp #$04                       ; $B9A7  C9 04
  bcc _label_b9b9                ; $B9A9  90 0E
  lda _var_0050                  ; $B9AB  A5 50
  and #$04                       ; $B9AD  29 04
  bne _label_b9b9                ; $B9AF  D0 08
  lda a:_var_0202_indexed        ; $B9B1  AD 02 02
  and #$FC                       ; $B9B4  29 FC
  jmp _label_b9c1                ; $B9B6  4C C1 B9

_label_b9b9:
  lda a:_var_0202_indexed        ; $B9B9  AD 02 02
  and #$FC                       ; $B9BC  29 FC
  clc                            ; $B9BE  18
  adc #$01                       ; $B9BF  69 01

_label_b9c1:
  sta a:_var_0202_indexed        ; $B9C1  8D 02 02
  inc _var_00e9                  ; $B9C4  E6 E9
  bne _label_b9e1                ; $B9C6  D0 19
  inc _var_00e6                  ; $B9C8  E6 E6
  inc _var_00e9                  ; $B9CA  E6 E9
  lda _var_00e6                  ; $B9CC  A5 E6
  cmp #$05                       ; $B9CE  C9 05
  bne _label_b9e1                ; $B9D0  D0 0F
  lda #$00                       ; $B9D2  A9 00
  sta _var_00e6                  ; $B9D4  85 E6
  sta _var_00e9                  ; $B9D6  85 E9
  lda a:_var_0202_indexed        ; $B9D8  AD 02 02
  and #$FC                       ; $B9DB  29 FC
  sta a:_var_0202_indexed        ; $B9DD  8D 02 02
  rts                            ; $B9E0  60

_label_b9e1:
  lda #$00                       ; $B9E1  A9 00
  sta _var_00af                  ; $B9E3  85 AF

_label_b9e5:
  lda _var_00af                  ; $B9E5  A5 AF
  cmp #$06                       ; $B9E7  C9 06
  bne _label_b9ec                ; $B9E9  D0 01
  rts                            ; $B9EB  60

_label_b9ec:
  jsr _func_d36d                 ; $B9EC  20 6D D3
  tax                            ; $B9EF  AA
  lda a:_var_0283_indexed,X      ; $B9F0  BD 83 02
  bne _label_ba49                ; $B9F3  D0 54
  lda a:_var_0200_indexed        ; $B9F5  AD 00 02
  sec                            ; $B9F8  38
  sbc a:_var_027e_indexed,X      ; $B9F9  FD 7E 02
  bcs _label_ba05                ; $B9FC  B0 07
  sta _var_002d_indexed          ; $B9FE  85 2D
  lda #$00                       ; $BA00  A9 00
  sec                            ; $BA02  38
  sbc _var_002d_indexed          ; $BA03  E5 2D

_label_ba05:
  cmp #$09                       ; $BA05  C9 09
  bcs _label_ba49                ; $BA07  B0 40
  lda a:_var_0203_indexed        ; $BA09  AD 03 02
  sec                            ; $BA0C  38
  sbc a:_var_0281_indexed,X      ; $BA0D  FD 81 02
  bcs _label_ba19                ; $BA10  B0 07
  sta _var_002d_indexed          ; $BA12  85 2D
  lda #$00                       ; $BA14  A9 00
  sec                            ; $BA16  38
  sbc _var_002d_indexed          ; $BA17  E5 2D

_label_ba19:
  cmp #$08                       ; $BA19  C9 08
  bcs _label_ba49                ; $BA1B  B0 2C
  lda a:_var_027f_indexed,X      ; $BA1D  BD 7F 02
  cmp #$60                       ; $BA20  C9 60
  bcc _label_ba28                ; $BA22  90 04
  cmp #$74                       ; $BA24  C9 74
  bcc _label_ba49                ; $BA26  90 21

_label_ba28:
  lda _var_00e9                  ; $BA28  A5 E9
  beq _label_ba46                ; $BA2A  F0 1A
  lda #$70                       ; $BA2C  A9 70
  sta a:_var_027f_indexed,X      ; $BA2E  9D 7F 02
  lda #$72                       ; $BA31  A9 72
  sta a:_var_0282_indexed,X      ; $BA33  9D 82 02
  lda #$01                       ; $BA36  A9 01
  sta a:_var_0280_indexed,X      ; $BA38  9D 80 02
  ldx _var_00af                  ; $BA3B  A6 AF
  lda #$32                       ; $BA3D  A9 32
  sta a:_var_0140_indexed,X      ; $BA3F  9D 40 01

_label_ba42:
  jsr _func_e464                 ; $BA42  20 64 E4
  rts                            ; $BA45  60

_label_ba46:
  inc _var_0085                  ; $BA46  E6 85
  rts                            ; $BA48  60

_label_ba49:
  inc _var_00af                  ; $BA49  E6 AF
  jmp _label_b9e5                ; $BA4B  4C E5 B9

_func_ba4e:
  lda #$00                       ; $BA4E  A9 00
  sta _var_00af                  ; $BA50  85 AF
  sta _var_002f_indexed          ; $BA52  85 2F

_label_ba54:
  ldy _var_00af                  ; $BA54  A4 AF
  lda a:_var_00d0_indexed,Y      ; $BA56  B9 D0 00
  bne _label_ba65                ; $BA59  D0 0A

_label_ba5b:
  inc _var_00af                  ; $BA5B  E6 AF
  lda _var_00af                  ; $BA5D  A5 AF
  cmp a:_var_0137                ; $BA5F  CD 37 01
  bne _label_ba54                ; $BA62  D0 F0
  rts                            ; $BA64  60

_label_ba65:
  jsr _func_d36d                 ; $BA65  20 6D D3
  tay                            ; $BA68  A8

_label_ba69:
  ldx _var_002f_indexed          ; $BA69  A6 2F
  cpx #$03                       ; $BA6B  E0 03
  bcs _label_ba79                ; $BA6D  B0 0A
  cpx _var_00aa                  ; $BA6F  E4 AA
  bne _label_ba79                ; $BA71  D0 06
  lda #$03                       ; $BA73  A9 03
  sta _var_002f_indexed          ; $BA75  85 2F
  ldx _var_002f_indexed          ; $BA77  A6 2F

_label_ba79:
  lda a:_var_0140_indexed,X      ; $BA79  BD 40 01
  bne _label_ba87                ; $BA7C  D0 09
  jsr _func_d487                 ; $BA7E  20 87 D4
  lda a:_var_0283_indexed,X      ; $BA81  BD 83 02
  cmp a:_var_0213_indexed,Y      ; $BA84  D9 13 02

_label_ba87:
  bne _label_bb02                ; $BA87  D0 79
  lda a:_var_027e_indexed,X      ; $BA89  BD 7E 02
  sec                            ; $BA8C  38
  sbc a:_var_020e_indexed,Y      ; $BA8D  F9 0E 02
  bcc _label_bb02                ; $BA90  90 70
  cmp #$0C                       ; $BA92  C9 0C
  bcs _label_bb02                ; $BA94  B0 6C
  lda a:_var_0211_indexed,Y      ; $BA96  B9 11 02
  sec                            ; $BA99  38
  sbc a:_var_0281_indexed,X      ; $BA9A  FD 81 02
  bcs _label_baa6                ; $BA9D  B0 07
  sta _var_002d_indexed          ; $BA9F  85 2D
  lda #$00                       ; $BAA1  A9 00
  sec                            ; $BAA3  38
  sbc _var_002d_indexed          ; $BAA4  E5 2D

_label_baa6:
  cmp #$0C                       ; $BAA6  C9 0C
  bcc _label_bab8                ; $BAA8  90 0E

_label_baaa:
  sta _var_002d_indexed          ; $BAAA  85 2D
  lda _var_002f_indexed          ; $BAAC  A5 2F
  cmp #$03                       ; $BAAE  C9 03
  bcc _label_bb02                ; $BAB0  90 50
  lda _var_002d_indexed          ; $BAB2  A5 2D
  cmp #$0F                       ; $BAB4  C9 0F
  bcs _label_bb02                ; $BAB6  B0 4A

_label_bab8:
  ldy _var_002f_indexed          ; $BAB8  A4 2F

_label_baba:
  lda #$01                       ; $BABA  A9 01
  sta a:_var_0140_indexed,Y      ; $BABC  99 40 01
  cpy #$03                       ; $BABF  C0 03
  bcs _label_bac8                ; $BAC1  B0 05
  lda #$00                       ; $BAC3  A9 00
  sta a:_var_0130_indexed,Y      ; $BAC5  99 30 01

_label_bac8:
  cpy #$03                       ; $BAC8  C0 03
  beq _label_bad0                ; $BACA  F0 04
  cpy #$04                       ; $BACC  C0 04
  bne _label_bae8                ; $BACE  D0 18

_label_bad0:
  dey                            ; $BAD0  88
  dey                            ; $BAD1  88
  dey                            ; $BAD2  88
  lda a:_var_013d_indexed,Y      ; $BAD3  B9 3D 01
  beq _label_bae8                ; $BAD6  F0 10
  lda #$EF                       ; $BAD8  A9 EF
  sta a:_var_0254_indexed        ; $BADA  8D 54 02
  sta a:_var_0255                ; $BADD  8D 55 02
  lda #$00                       ; $BAE0  A9 00
  sta a:_var_013d_indexed,Y      ; $BAE2  99 3D 01
  iny                            ; $BAE5  C8
  iny                            ; $BAE6  C8
  iny                            ; $BAE7  C8

_label_bae8:
  inc a:_var_061e                ; $BAE8  EE 1E 06
  cpy #$03                       ; $BAEB  C0 03
  bcs _label_baf4                ; $BAED  B0 05
  inc _var_0095                  ; $BAEF  E6 95
  jsr _func_bcf4                 ; $BAF1  20 F4 BC

_label_baf4:
  ldx _var_00af                  ; $BAF4  A6 AF
  lda #$01                       ; $BAF6  A9 01
  sta _var_00d0_indexed,X        ; $BAF8  95 D0
  lda #$5A                       ; $BAFA  A9 5A
  sta a:_var_0124_indexed,X      ; $BAFC  9D 24 01
  jmp _label_bb0d                ; $BAFF  4C 0D BB

_label_bb02:
  inc _var_002f_indexed          ; $BB02  E6 2F
  lda _var_002f_indexed          ; $BB04  A5 2F
  cmp #$06                       ; $BB06  C9 06
  beq _label_bb0d                ; $BB08  F0 03

_label_bb0a:
  jmp _label_ba69                ; $BB0A  4C 69 BA

_label_bb0d:
  lda #$00                       ; $BB0D  A9 00
  sta _var_002f_indexed          ; $BB0F  85 2F
  jmp _label_ba5b                ; $BB11  4C 5B BA

_func_bb14:
  lda #$00                       ; $BB14  A9 00
  sta _var_00af                  ; $BB16  85 AF

_label_bb18:
  lda #$06                       ; $BB18  A9 06
  cmp _var_00af                  ; $BB1A  C5 AF
  bne _label_bb1f                ; $BB1C  D0 01
  rts                            ; $BB1E  60

_label_bb1f:
  ldy _var_00af                  ; $BB1F  A4 AF
  lda a:_var_0140_indexed,Y      ; $BB21  B9 40 01
  bne _label_bb2b                ; $BB24  D0 05

_label_bb26:
  inc _var_00af                  ; $BB26  E6 AF
  jmp _label_bb18                ; $BB28  4C 18 BB

_label_bb2b:
  jsr _func_d36d                 ; $BB2B  20 6D D3
  tax                            ; $BB2E  AA
  cpy #$03                       ; $BB2F  C0 03
  bcc _label_bb3a                ; $BB31  90 07
  lda a:_var_0140_indexed,Y      ; $BB33  B9 40 01
  cmp #$81                       ; $BB36  C9 81
  beq _label_bb4f                ; $BB38  F0 15

_label_bb3a:
  lda a:_var_0140_indexed,Y      ; $BB3A  B9 40 01
  clc                            ; $BB3D  18
  adc #$01                       ; $BB3E  69 01
  sta a:_var_0140_indexed,Y      ; $BB40  99 40 01
  cmp #$28                       ; $BB43  C9 28
  bcc _label_bb6a                ; $BB45  90 23
  cmp #$64                       ; $BB47  C9 64
  bcc _label_bba3                ; $BB49  90 58
  cmp #$FF                       ; $BB4B  C9 FF
  bcs _label_bb62                ; $BB4D  B0 13

_label_bb4f:
  lda #$EF                       ; $BB4F  A9 EF
  sta a:_var_027e_indexed,X      ; $BB51  9D 7E 02
  sta a:_var_027f_indexed,X      ; $BB54  9D 7F 02
  cpy #$05                       ; $BB57  C0 05
  bne _label_bb26                ; $BB59  D0 CB
  lda #$00                       ; $BB5B  A9 00
  sta _var_00ae                  ; $BB5D  85 AE
  jmp _label_bb26                ; $BB5F  4C 26 BB

_label_bb62:
  lda #$00                       ; $BB62  A9 00
  sta a:_var_0140_indexed,Y      ; $BB64  99 40 01
  jmp _label_bbc4                ; $BB67  4C C4 BB

_label_bb6a:
  cpy #$03                       ; $BB6A  C0 03
  bcc _label_bb96                ; $BB6C  90 28
  cpy #$05                       ; $BB6E  C0 05
  beq _label_bb84                ; $BB70  F0 12
  lda #$64                       ; $BB72  A9 64
  sta a:_var_027f_indexed,X      ; $BB74  9D 7F 02
  lda #$66                       ; $BB77  A9 66
  sta a:_var_0282_indexed,X      ; $BB79  9D 82 02
  lda #$03                       ; $BB7C  A9 03
  sta a:_var_0280_indexed,X      ; $BB7E  9D 80 02
  jmp _label_bb26                ; $BB81  4C 26 BB

_label_bb84:
  lda #$A8                       ; $BB84  A9 A8
  sta a:_var_027f_indexed,X      ; $BB86  9D 7F 02
  lda #$AA                       ; $BB89  A9 AA
  sta a:_var_0282_indexed,X      ; $BB8B  9D 82 02
.byte $a9                        ; $BB8E  A9  branch into instruction detected: lda #$01

_label_bb8f:
.byte $01                        ; $BB8F  01
  sta a:_var_0280_indexed,X      ; $BB90  9D 80 02
  jmp _label_bb26                ; $BB93  4C 26 BB

_label_bb96:
  lda #$60                       ; $BB96  A9 60
  sta a:_var_027f_indexed,X      ; $BB98  9D 7F 02
  lda #$62                       ; $BB9B  A9 62
  sta a:_var_0282_indexed,X      ; $BB9D  9D 82 02
  jmp _label_bc3a                ; $BBA0  4C 3A BC

_label_bba3:
  lda a:_var_027f_indexed,X      ; $BBA3  BD 7F 02
  cmp #$70                       ; $BBA6  C9 70
  beq _label_bbb7                ; $BBA8  F0 0D
  lda #$68                       ; $BBAA  A9 68
  sta a:_var_027f_indexed,X      ; $BBAC  9D 7F 02
  lda #$6A                       ; $BBAF  A9 6A
  sta a:_var_0282_indexed,X      ; $BBB1  9D 82 02
  jmp _label_bb26                ; $BBB4  4C 26 BB

_label_bbb7:
  lda a:_var_027e_indexed,X      ; $BBB7  BD 7E 02
  sec                            ; $BBBA  38
  sbc a:_var_0114                ; $BBBB  ED 14 01
  sta a:_var_027e_indexed,X      ; $BBBE  9D 7E 02
  jmp _label_bb26                ; $BBC1  4C 26 BB

_label_bbc4:
  lda #$FF                       ; $BBC4  A9 FF
  sta a:_var_0283_indexed,X      ; $BBC6  9D 83 02
  lda _var_0065                  ; $BBC9  A5 65
  beq _label_bbdd                ; $BBCB  F0 10
  lda #$F0                       ; $BBCD  A9 F0
  sec                            ; $BBCF  38
  sbc _var_0065                  ; $BBD0  E5 65
  and #$F8                       ; $BBD2  29 F8
  clc                            ; $BBD4  18
  adc #$07                       ; $BBD5  69 07
  sta a:_var_027e_indexed,X      ; $BBD7  9D 7E 02
  jmp _label_bbed                ; $BBDA  4C ED BB

_label_bbdd:
  lda _var_001d                  ; $BBDD  A5 1D
  and #$02                       ; $BBDF  29 02
  beq _label_bbe8                ; $BBE1  F0 05
  lda #$00                       ; $BBE3  A9 00
  sta a:_var_0283_indexed,X      ; $BBE5  9D 83 02

_label_bbe8:
  lda #$07                       ; $BBE8  A9 07
  sta a:_var_027e_indexed,X      ; $BBEA  9D 7E 02

_label_bbed:
.byte $bd, $81                   ; $BBED  BD 81  branch into instruction detected: lda a:_var_0281_indexed,X

_label_bbef:
.byte $02                        ; $BBEF  02

_label_bbf0:
  and #$F8                       ; $BBF0  29 F8
  clc                            ; $BBF2  18
  adc #$04                       ; $BBF3  69 04
.byte $9d, $81                   ; $BBF5  9D 81  branch into instruction detected: sta a:_var_0281_indexed,X

_label_bbf7:
.byte $02                        ; $BBF7  02
  lda #$48                       ; $BBF8  A9 48
  sta a:_var_027f_indexed,X      ; $BBFA  9D 7F 02
  lda #$4A                       ; $BBFD  A9 4A
  sta a:_var_0282_indexed,X      ; $BBFF  9D 82 02
  lda #$00                       ; $BC02  A9 00
  sta _var_002d_indexed          ; $BC04  85 2D
  sta _var_002f_indexed          ; $BC06  85 2F
  ldy _var_00af                  ; $BC08  A4 AF
  beq _label_bc12                ; $BC0A  F0 06

_label_bc0c:
  clc                            ; $BC0C  18
  adc #$14                       ; $BC0D  69 14
  dey                            ; $BC0F  88
  bne _label_bc0c                ; $BC10  D0 FA

_label_bc12:
  tay                            ; $BC12  A8
  sta _var_002e                  ; $BC13  85 2E

_label_bc15:
  lda #$F0                       ; $BC15  A9 F0

_label_bc17:
  sta a:_var_06cc_indexed,Y      ; $BC17  99 CC 06
  iny                            ; $BC1A  C8
  inc _var_002d_indexed          ; $BC1B  E6 2D
  lda _var_002d_indexed          ; $BC1D  A5 2D
  cmp #$0C                       ; $BC1F  C9 0C
  bne _label_bc17                ; $BC21  D0 F4
  ldy _var_002e                  ; $BC23  A4 2E
  lda #$00                       ; $BC25  A9 00

_label_bc27:
  sta a:_var_06c4_indexed,Y      ; $BC27  99 C4 06

_data_bc2a_indexed:
  iny                            ; $BC2A  C8
  inc _var_002f_indexed          ; $BC2B  E6 2F
  lda _var_002f_indexed          ; $BC2D  A5 2F
  cmp #$08                       ; $BC2F  C9 08
  bne _label_bc27                ; $BC31  D0 F4
  ldy _var_00af                  ; $BC33  A4 AF
  lda #$02                       ; $BC35  A9 02
  sta a:_var_0120_indexed,Y      ; $BC37  99 20 01

_label_bc3a:
  lda #$02                       ; $BC3A  A9 02
  sta a:_var_0280_indexed,X      ; $BC3C  9D 80 02
  jmp _label_bb26                ; $BC3F  4C 26 BB

_func_bc42:
  lda a:$0147                    ; $BC42  AD 47 01
  cmp #$14                       ; $BC45  C9 14
  bcs _label_bc82                ; $BC47  B0 39
  lda _var_0093                  ; $BC49  A5 93
  cmp #$02                       ; $BC4B  C9 02
  bcs _label_bc82                ; $BC4D  B0 33
  lda _var_0050                  ; $BC4F  A5 50
  beq _label_bc82                ; $BC51  F0 2F
  and #$07                       ; $BC53  29 07
  bne _label_bc82                ; $BC55  D0 2B
  lda #$A0                       ; $BC57  A9 A0

_data_bc59_indexed:
  sta a:_var_02d3                ; $BC59  8D D3 02

_data_bc5c_indexed:
  lda #$A2                       ; $BC5C  A9 A2
  sta a:_var_02d6                ; $BC5E  8D D6 02
  lda #$02                       ; $BC61  A9 02
  sta a:_var_02d4                ; $BC63  8D D4 02
  lda #$00                       ; $BC66  A9 00
  sta a:_var_02d7                ; $BC68  8D D7 02
  lda a:_var_0207_indexed        ; $BC6B  AD 07 02

_data_bc6e_indexed:
  sta a:_var_02d2                ; $BC6E  8D D2 02

_data_bc71_indexed:
  lda a:_var_020a_indexed        ; $BC71  AD 0A 02
  sta a:_var_02d5                ; $BC74  8D D5 02

_label_bc77:
  jmp _label_bc7a                ; $BC77  4C 7A BC

_label_bc7a:
  lda #$02                       ; $BC7A  A9 02
  sta _var_0093                  ; $BC7C  85 93
  lda #$00                       ; $BC7E  A9 00
  sta _var_0094                  ; $BC80  85 94

_label_bc82:
  rts                            ; $BC82  60

_func_bc83:
  lda a:_var_0146_indexed        ; $BC83  AD 46 01
  cmp #$28                       ; $BC86  C9 28
  bcs _label_bcec                ; $BC88  B0 62
  lda _var_0092                  ; $BC8A  A5 92
  and #$04                       ; $BC8C  29 04
  beq _label_bcec                ; $BC8E  F0 5C
  lda _var_0093                  ; $BC90  A5 93
  bne _label_bcec                ; $BC92  D0 58
  txa                            ; $BC94  8A
  sta _var_0056                  ; $BC95  85 56
  sta _var_0031_indexed          ; $BC97  85 31
  jsr _func_d41a                 ; $BC99  20 1A D4
  lda _var_0056                  ; $BC9C  A5 56
  sta _var_008b                  ; $BC9E  85 8B
  lda #$01                       ; $BCA0  A9 01
  sta _var_0032                  ; $BCA2  85 32
  jsr _func_d305                 ; $BCA4  20 05 D3
  lda _var_004d                  ; $BCA7  A5 4D
  bne _label_bcec                ; $BCA9  D0 41
  lda _var_008b                  ; $BCAB  A5 8B
  tax                            ; $BCAD  AA
  sta _var_0056                  ; $BCAE  85 56
  tya                            ; $BCB0  98
  sta _var_005b                  ; $BCB1  85 5B
  lda a:_var_0480_indexed,X      ; $BCB3  BD 80 04
  and a:_data_d2b7_indexed,Y     ; $BCB6  39 B7 D2
  bne _label_bced                ; $BCB9  D0 32
  lda #$01                       ; $BCBB  A9 01
  sta _var_0052                  ; $BCBD  85 52
  jsr _func_ced5                 ; $BCBF  20 D5 CE
  lda #$74                       ; $BCC2  A9 74
  sta a:_var_02d3                ; $BCC4  8D D3 02
  lda #$76                       ; $BCC7  A9 76
  sta a:_var_02d6                ; $BCC9  8D D6 02
  lda #$00                       ; $BCCC  A9 00
  sta a:_var_02d4                ; $BCCE  8D D4 02
  lda _var_00a1                  ; $BCD1  A5 A1
  sta a:_var_02d2                ; $BCD3  8D D2 02

_data_bcd6_indexed:
  lda _var_00a2                  ; $BCD6  A5 A2

_data_bcd8_indexed:
  sta a:_var_02d5                ; $BCD8  8D D5 02
  lda #$00                       ; $BCDB  A9 00

_data_bcdd_indexed:
  sta _var_0092                  ; $BCDD  85 92

_data_bcdf_indexed:
  sta _var_0094                  ; $BCDF  85 94

_data_bce1_indexed:
  sta a:_var_02d7                ; $BCE1  8D D7 02
  sta _var_0052                  ; $BCE4  85 52
  ldx _var_0031_indexed          ; $BCE6  A6 31
  lda #$01                       ; $BCE8  A9 01
  sta _var_0093                  ; $BCEA  85 93

_label_bcec:
  rts                            ; $BCEC  60

_label_bced:
.byte $a9                        ; $BCED  A9  branch into instruction detected: lda #$00

_label_bcee:
.byte $00                        ; $BCEE  00
  sta _var_0093                  ; $BCEF  85 93
  ldx _var_0031_indexed          ; $BCF1  A6 31
  rts                            ; $BCF3  60

_func_bcf4:
  lda a:_var_0148                ; $BCF4  AD 48 01
  cmp #$0A                       ; $BCF7  C9 0A
  bcs _label_bd4c                ; $BCF9  B0 51
  lda _var_0093                  ; $BCFB  A5 93
  cmp #$05                       ; $BCFD  C9 05
  bcs _label_bd4c                ; $BCFF  B0 4B
  lda _var_0095                  ; $BD01  A5 95
  cmp #$05                       ; $BD03  C9 05
  bcc _label_bd4c                ; $BD05  90 45
  lda _var_0091                  ; $BD07  A5 91
  cmp #$01                       ; $BD09  C9 01
  bne _label_bd23                ; $BD0B  D0 16
  lda a:_var_0148                ; $BD0D  AD 48 01
  cmp #$02                       ; $BD10  C9 02
  bne _label_bd23                ; $BD12  D0 0F
  lda #$9C                       ; $BD14  A9 9C
  sta a:_var_02d3                ; $BD16  8D D3 02
  lda #$9E                       ; $BD19  A9 9E
  sta a:_var_02d6                ; $BD1B  8D D6 02
  lda #$02                       ; $BD1E  A9 02
  jmp _label_bd2f                ; $BD20  4C 2F BD

_label_bd23:
  lda #$78                       ; $BD23  A9 78
  sta a:_var_02d3                ; $BD25  8D D3 02
  lda #$7A                       ; $BD28  A9 7A
  sta a:_var_02d6                ; $BD2A  8D D6 02
.byte $a9                        ; $BD2D  A9  lda #$01

_label_bd2e:
.byte $01                        ; $BD2E  01  branch into instruction detected: ora (_var_008d_indexed,X)

_label_bd2f:
.byte $8d                        ; $BD2F  8D
.byte $d4, $02                   ; $BD30  D4 02  disambiguous instruction: nop $02,X
  lda a:_var_027e_indexed,X      ; $BD32  BD 7E 02
  sta a:_var_02d2                ; $BD35  8D D2 02
  lda a:_var_0281_indexed,X      ; $BD38  BD 81 02
  sta a:_var_02d5                ; $BD3B  8D D5 02
  lda a:_var_0283_indexed,X      ; $BD3E  BD 83 02
  sta a:_var_02d7                ; $BD41  8D D7 02
  sta _var_0094                  ; $BD44  85 94
  sta _var_0095                  ; $BD46  85 95
  lda #$04                       ; $BD48  A9 04
  sta _var_0093                  ; $BD4A  85 93

_label_bd4c:
  rts                            ; $BD4C  60

_func_bd4d:
  lda a:$0149                    ; $BD4D  AD 49 01
  cmp #$05                       ; $BD50  C9 05
  bcs _label_bd9c                ; $BD52  B0 48
.byte $e6                        ; $BD54  E6  branch into instruction detected: inc _var_0096

_label_bd55:
.byte $96                        ; $BD55  96
  lda _var_0096                  ; $BD56  A5 96
  cmp #$01                       ; $BD58  C9 01
  beq _label_bd98                ; $BD5A  F0 3C
  cmp #$05                       ; $BD5C  C9 05
  bcc _label_bd9c                ; $BD5E  90 3C
  lda _var_0097                  ; $BD60  A5 97
  cmp #$06                       ; $BD62  C9 06
  bcs _label_bd94                ; $BD64  B0 2E
  lda _var_0093                  ; $BD66  A5 93
  cmp #$03                       ; $BD68  C9 03
  bcs _label_bd94                ; $BD6A  B0 28
  lda #$EC                       ; $BD6C  A9 EC
  sta a:_var_02d3                ; $BD6E  8D D3 02
  lda #$EE                       ; $BD71  A9 EE
  sta a:_var_02d6                ; $BD73  8D D6 02
  lda #$02                       ; $BD76  A9 02
  sta a:_var_02d4                ; $BD78  8D D4 02
  lda a:_var_06a0                ; $BD7B  AD A0 06
  sta a:_var_02d2                ; $BD7E  8D D2 02
  lda a:_var_06a1                ; $BD81  AD A1 06
  sta a:_var_02d5                ; $BD84  8D D5 02
  lda #$03                       ; $BD87  A9 03
  sta _var_0093                  ; $BD89  85 93
  lda _var_004d                  ; $BD8B  A5 4D
  sta a:_var_02d7                ; $BD8D  8D D7 02
  lda #$00                       ; $BD90  A9 00
  sta _var_0094                  ; $BD92  85 94

_label_bd94:
  lda #$00                       ; $BD94  A9 00
  sta _var_0096                  ; $BD96  85 96

_label_bd98:
  lda #$00                       ; $BD98  A9 00

_label_bd9a:
  sta _var_0097                  ; $BD9A  85 97

_label_bd9c:
  rts                            ; $BD9C  60

_func_bd9d:
  lda a:_var_02d7                ; $BD9D  AD D7 02
  beq _label_bda3                ; $BDA0  F0 01

_label_bda2:
  rts                            ; $BDA2  60

_label_bda3:
  lda a:_var_0200_indexed        ; $BDA3  AD 00 02
  sec                            ; $BDA6  38
  sbc a:_var_02d2                ; $BDA7  ED D2 02
  bcs _label_bdb3                ; $BDAA  B0 07
  sta _var_002d_indexed          ; $BDAC  85 2D
  lda #$00                       ; $BDAE  A9 00
  sec                            ; $BDB0  38
.byte $e5                        ; $BDB1  E5  branch into instruction detected: sbc _var_002d_indexed

_label_bdb2:
.byte $2d                        ; $BDB2  2D

_label_bdb3:
  cmp #$09                       ; $BDB3  C9 09
.byte $b0                        ; $BDB5  B0  branch into instruction detected: bcs

_label_bdb6:
.byte $eb                        ; $BDB6  EB
  lda a:_var_0203_indexed        ; $BDB7  AD 03 02

_label_bdba:
  sec                            ; $BDBA  38
  sbc a:_var_02d5                ; $BDBB  ED D5 02
  bcs _label_bdc7                ; $BDBE  B0 07
  sta _var_002d_indexed          ; $BDC0  85 2D
  lda #$00                       ; $BDC2  A9 00
  sec                            ; $BDC4  38
  sbc _var_002d_indexed          ; $BDC5  E5 2D

_label_bdc7:
  cmp #$06                       ; $BDC7  C9 06
  bcs _label_bda2                ; $BDC9  B0 D7
  inc a:_var_061b                ; $BDCB  EE 1B 06
  ldx #$00                       ; $BDCE  A2 00
  lda a:_var_02d3                ; $BDD0  AD D3 02
  cmp #$74                       ; $BDD3  C9 74
  beq _label_be2a                ; $BDD5  F0 53
  cmp #$A0                       ; $BDD7  C9 A0
  beq _label_be1f                ; $BDD9  F0 44
  cmp #$EC                       ; $BDDB  C9 EC
  beq _label_be11                ; $BDDD  F0 32
  cmp #$AC                       ; $BDDF  C9 AC
  beq _label_be00                ; $BDE1  F0 1D
  cmp #$9C                       ; $BDE3  C9 9C
  beq _label_bdfb                ; $BDE5  F0 14
  cmp #$21                       ; $BDE7  C9 21
  beq _label_bdf0                ; $BDE9  F0 05
  cmp #$78                       ; $BDEB  C9 78

_label_bded:
  beq _label_be1a                ; $BDED  F0 2B
  rts                            ; $BDEF  60

_label_bdf0:
  lda #$70                       ; $BDF0  A9 70
  sta a:_var_02d3                ; $BDF2  8D D3 02
  lda #$72                       ; $BDF5  A9 72
  sta a:_var_02d6                ; $BDF7  8D D6 02
  rts                            ; $BDFA  60

_label_bdfb:
  inc _var_0081                  ; $BDFB  E6 81
  jmp _label_be3d                ; $BDFD  4C 3D BE

_label_be00:
  lda #$00                       ; $BE00  A9 00
  sta _var_00ed                  ; $BE02  85 ED
  lda _var_001c                  ; $BE04  A5 1C
  clc                            ; $BE06  18
  adc #$08                       ; $BE07  69 08
  sta _var_001c                  ; $BE09  85 1C
  inc a:_var_06a2                ; $BE0B  EE A2 06
  jmp _label_be3d                ; $BE0E  4C 3D BE

_label_be11:
  lda #$01                       ; $BE11  A9 01
  sta _var_00e5                  ; $BE13  85 E5
  inx                            ; $BE15  E8
  inx                            ; $BE16  E8
  jmp _label_be1f                ; $BE17  4C 1F BE

_label_be1a:
  inx                            ; $BE1A  E8
  lda #$01                       ; $BE1B  A9 01
  sta _var_00e9                  ; $BE1D  85 E9

_label_be1f:
  inx                            ; $BE1F  E8
  lda _var_001c                  ; $BE20  A5 1C
  clc                            ; $BE22  18
  adc #$02                       ; $BE23  69 02
  sta _var_001c                  ; $BE25  85 1C
  jmp _label_be3a                ; $BE27  4C 3A BE

_label_be2a:
  lda _var_001e                  ; $BE2A  A5 1E
  bne _label_be3a                ; $BE2C  D0 0C
  inc _var_0091                  ; $BE2E  E6 91
  lda _var_0091                  ; $BE30  A5 91
  cmp #$63                       ; $BE32  C9 63
  bcc _label_be3a                ; $BE34  90 04
  lda #$63                       ; $BE36  A9 63
  sta _var_0091                  ; $BE38  85 91

_label_be3a:
  inc a:_var_0146_indexed,X      ; $BE3A  FE 46 01

_label_be3d:
  lda #$EF                       ; $BE3D  A9 EF
  sta a:_var_02d2                ; $BE3F  8D D2 02
  sta a:_var_02d3                ; $BE42  8D D3 02
  lda #$00                       ; $BE45  A9 00
  sta _var_0093                  ; $BE47  85 93
  lda _var_001c                  ; $BE49  A5 1C
  cmp #$30                       ; $BE4B  C9 30
  bcc _label_be53                ; $BE4D  90 04
  lda #$30                       ; $BE4F  A9 30
  sta _var_001c                  ; $BE51  85 1C

_label_be53:
  rts                            ; $BE53  60

_func_be54:
  lda _var_00ed                  ; $BE54  A5 ED
  cmp #$0A                       ; $BE56  C9 0A
  beq _label_be9f                ; $BE58  F0 45
  bcc _label_be9e                ; $BE5A  90 42

_label_be5c:
  lda a:_var_02d2                ; $BE5C  AD D2 02
  clc                            ; $BE5F  18
  adc a:_var_0114                ; $BE60  6D 14 01
  sta a:_var_02d2                ; $BE63  8D D2 02
  lda a:_var_02d5                ; $BE66  AD D5 02
  clc                            ; $BE69  18
  adc a:_var_0114                ; $BE6A  6D 14 01
  sta a:_var_02d5                ; $BE6D  8D D5 02
  lda _var_0050                  ; $BE70  A5 50
  and #$02                       ; $BE72  29 02
  beq _label_be7b                ; $BE74  F0 05
  lda #$01                       ; $BE76  A9 01
  jmp _label_be7d                ; $BE78  4C 7D BE

_label_be7b:
  lda #$03                       ; $BE7B  A9 03

_label_be7d:
  sta a:_var_02d4                ; $BE7D  8D D4 02
  lda a:_var_02d2                ; $BE80  AD D2 02
  cmp #$E7                       ; $BE83  C9 E7
  bcc _label_be9a                ; $BE85  90 13
  lda #$EF                       ; $BE87  A9 EF
  sta a:_var_02d2                ; $BE89  8D D2 02
  sta a:_var_02d3                ; $BE8C  8D D3 02
  lda #$00                       ; $BE8F  A9 00
.byte $85                        ; $BE91  85  sta $ED

_label_be92:
  sbc a:_data_9384+1             ; $BE92  ED 85 93  branch into instruction detected
  lda #$02                       ; $BE95  A9 02
  sta _var_0094                  ; $BE97  85 94
  rts                            ; $BE99  60

_label_be9a:
  lda #$00                       ; $BE9A  A9 00
  sta _var_0094                  ; $BE9C  85 94

_label_be9e:
  rts                            ; $BE9E  60

_label_be9f:
  lda a:_var_02d3                ; $BE9F  AD D3 02
  cmp #$AC                       ; $BEA2  C9 AC
  beq _label_be5c                ; $BEA4  F0 B6
  lda #$05                       ; $BEA6  A9 05
  sta _var_0093                  ; $BEA8  85 93
  lda #$AC                       ; $BEAA  A9 AC
  sta a:_var_02d3                ; $BEAC  8D D3 02
  lda #$AE                       ; $BEAF  A9 AE
  sta a:_var_02d6                ; $BEB1  8D D6 02
  lda #$00                       ; $BEB4  A9 00
  sta a:_var_02d7                ; $BEB6  8D D7 02
  sta _var_0094                  ; $BEB9  85 94
  lda #$01                       ; $BEBB  A9 01
  sta a:_var_02d4                ; $BEBD  8D D4 02
  lda #$0F                       ; $BEC0  A9 0F
  sta a:_var_02d2                ; $BEC2  8D D2 02
  lda #$10                       ; $BEC5  A9 10
.byte $8d                        ; $BEC7  8D  branch into instruction detected: sta a:_var_02d5

_func_bec8:
.byte $d5, $02                   ; $BEC8  D5 02
  rts                            ; $BECA  60

.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $BECB
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $BEDB
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $BEEB
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $BEFB
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $BF0B

_label_bf15:
.byte $ff, $ff                   ; $BF15  FF FF  isc a:$FFFF,X

_label_bf17:
  isc a:$FFFF,X                  ; $BF17  FF FF FF  branch into instruction detected
  isc a:$FFFF,X                  ; $BF1A  FF FF FF
  isc a:$FFFF,X                  ; $BF1D  FF FF FF
  isc a:$FFFF,X                  ; $BF20  FF FF FF
  isc a:$FFFF,X                  ; $BF23  FF FF FF
  isc a:$FFFF,X                  ; $BF26  FF FF FF
  isc a:$FFFF,X                  ; $BF29  FF FF FF
  isc a:$FFFF,X                  ; $BF2C  FF FF FF
  isc a:$FFFF,X                  ; $BF2F  FF FF FF
  isc a:$FFFF,X                  ; $BF32  FF FF FF
  isc a:$FFFF,X                  ; $BF35  FF FF FF
  isc a:$FFFF,X                  ; $BF38  FF FF FF
.byte $ff, $ff                   ; $BF3B  FF FF  branch into instruction detected: isc a:$FFFF,X

_func_bf3d:
.byte $ff                        ; $BF3D  FF
  isc a:$FFFF,X                  ; $BF3E  FF FF FF
  isc a:$FFFF,X                  ; $BF41  FF FF FF
  isc a:$FFFF,X                  ; $BF44  FF FF FF
  isc a:$FFFF,X                  ; $BF47  FF FF FF
  isc a:$FFFF,X                  ; $BF4A  FF FF FF
  isc a:$FFFF,X                  ; $BF4D  FF FF FF
  isc a:$FFFF,X                  ; $BF50  FF FF FF
  isc a:$FFFF,X                  ; $BF53  FF FF FF

_label_bf56:
  isc a:$FFFF,X                  ; $BF56  FF FF FF
  isc a:$FFFF,X                  ; $BF59  FF FF FF
  isc a:$FFFF,X                  ; $BF5C  FF FF FF
  isc a:$FFFF,X                  ; $BF5F  FF FF FF
  isc a:$FFFF,X                  ; $BF62  FF FF FF
  isc a:$FFFF,X                  ; $BF65  FF FF FF
  isc a:$FFFF,X                  ; $BF68  FF FF FF
  isc a:$FFFF,X                  ; $BF6B  FF FF FF
  isc a:$FFFF,X                  ; $BF6E  FF FF FF
  isc a:$FFFF,X                  ; $BF71  FF FF FF
  isc a:$FFFF,X                  ; $BF74  FF FF FF
  isc a:$FFFF,X                  ; $BF77  FF FF FF
  isc a:$FFFF,X                  ; $BF7A  FF FF FF
  isc a:$FFFF,X                  ; $BF7D  FF FF FF
  isc a:$FFFF,X                  ; $BF80  FF FF FF
  isc a:$FFFF,X                  ; $BF83  FF FF FF
  isc a:$FFFF,X                  ; $BF86  FF FF FF
  isc a:$FFFF,X                  ; $BF89  FF FF FF
  isc a:$FFFF,X                  ; $BF8C  FF FF FF
  isc a:$FFFF,X                  ; $BF8F  FF FF FF
  isc a:$FFFF,X                  ; $BF92  FF FF FF
  isc a:$FFFF,X                  ; $BF95  FF FF FF
  isc a:$FFFF,X                  ; $BF98  FF FF FF
  isc a:$FFFF,X                  ; $BF9B  FF FF FF
.byte $ff, $ff                   ; $BF9E  FF FF  branch into instruction detected: isc a:$FFFF,X

_func_bfa0:
.byte $ff                        ; $BFA0  FF
  isc a:$FFFF,X                  ; $BFA1  FF FF FF
  isc a:$FFFF,X                  ; $BFA4  FF FF FF
  isc a:$FFFF,X                  ; $BFA7  FF FF FF
  isc a:$FFFF,X                  ; $BFAA  FF FF FF
  isc a:$FFFF,X                  ; $BFAD  FF FF FF
  isc a:$FFFF,X                  ; $BFB0  FF FF FF
  isc a:$FFFF,X                  ; $BFB3  FF FF FF
  isc a:$FFFF,X                  ; $BFB6  FF FF FF
  isc a:$FFFF,X                  ; $BFB9  FF FF FF
  isc a:$FFFF,X                  ; $BFBC  FF FF FF
  isc a:$FFFF,X                  ; $BFBF  FF FF FF
  isc a:$FFFF,X                  ; $BFC2  FF FF FF
  isc a:$FFFF,X                  ; $BFC5  FF FF FF
  isc a:$FFFF,X                  ; $BFC8  FF FF FF
  isc a:$FFFF,X                  ; $BFCB  FF FF FF
  isc a:$FFFF,X                  ; $BFCE  FF FF FF
  isc a:$FFFF,X                  ; $BFD1  FF FF FF
  isc a:$FFFF,X                  ; $BFD4  FF FF FF
  isc a:$FFFF,X                  ; $BFD7  FF FF FF
  isc a:$FFFF,X                  ; $BFDA  FF FF FF
  isc a:$FFFF,X                  ; $BFDD  FF FF FF
  isc a:$FFFF,X                  ; $BFE0  FF FF FF
  isc a:$FFFF,X                  ; $BFE3  FF FF FF
  isc a:$FFFF,X                  ; $BFE6  FF FF FF
  isc a:$FFFF,X                  ; $BFE9  FF FF FF
  isc a:$FFFF,X                  ; $BFEC  FF FF FF
  isc a:$FFFF,X                  ; $BFEF  FF FF FF
  isc a:$FFFF,X                  ; $BFF2  FF FF FF
  isc a:$FFFF,X                  ; $BFF5  FF FF FF
  isc a:$FFFF,X                  ; $BFF8  FF FF FF
  isc a:$FFFF,X                  ; $BFFB  FF FF FF
  isc a:_var_4cff_indexed,X      ; $BFFE  FF FF 4C

.byte $42, $c2, $4c, $d0, $c2    ; $C001

_func_c006:
  jmp _func_c1cd                 ; $C006  4C CD C1

_func_c009:
  jmp _func_c19f                 ; $C009  4C 9F C1

_func_c00c:
  jmp _func_d487                 ; $C00C  4C 87 D4

_func_c00f:
  jmp _func_e792                 ; $C00F  4C 92 E7

_func_c012:
  jmp _label_f452                ; $C012  4C 52 F4

_func_c015:
  ldy #$00                       ; $C015  A0 00
  ldx _var_007d                  ; $C017  A6 7D

_label_c019:
  sty a:_data_8000               ; $C019  8C 00 80
  lda a:_data_ec67_indexed,X     ; $C01C  BD 67 EC
  sta a:_data_8000+1             ; $C01F  8D 01 80
  inx                            ; $C022  E8
  iny                            ; $C023  C8
  cpy #$08                       ; $C024  C0 08
  bne _label_c019                ; $C026  D0 F1
  rts                            ; $C028  60

_func_c029:
  lda _var_004f                  ; $C029  A5 4F
  cmp #$06                       ; $C02B  C9 06
  beq _label_c055                ; $C02D  F0 26
  cmp #$08                       ; $C02F  C9 08
  beq _label_c048                ; $C031  F0 15
  lda #$29                       ; $C033  A9 29
  sta PPU_ADDR                   ; $C035  8D 06 20
  lda _var_004f                  ; $C038  A5 4F
  cmp #$04                       ; $C03A  C9 04
  beq _label_c043                ; $C03C  F0 05
  lda #$D1                       ; $C03E  A9 D1
  jmp _label_c04f                ; $C040  4C 4F C0

_label_c043:
  lda #$51                       ; $C043  A9 51
  jmp _label_c04f                ; $C045  4C 4F C0

_label_c048:
  lda #$28                       ; $C048  A9 28
  sta PPU_ADDR                   ; $C04A  8D 06 20
  lda #$8C                       ; $C04D  A9 8C

_label_c04f:
  sta PPU_ADDR                   ; $C04F  8D 06 20
  jmp _label_c073                ; $C052  4C 73 C0

_label_c055:
  lda #$2A                       ; $C055  A9 2A
  sta PPU_ADDR                   ; $C057  8D 06 20
  lda #$57                       ; $C05A  A9 57
  sta PPU_ADDR                   ; $C05C  8D 06 20
  lda _var_001f_indexed          ; $C05F  A5 1F
  cmp #$81                       ; $C061  C9 81
  bne _label_c073                ; $C063  D0 0E
  ldx #$03                       ; $C065  A2 03

_label_c067:
  lda a:_data_c09a_indexed,X     ; $C067  BD 9A C0
  sta PPU_DATA                   ; $C06A  8D 07 20
  dex                            ; $C06D  CA
  bpl _label_c067                ; $C06E  10 F7
  jmp _label_c094                ; $C070  4C 94 C0

_label_c073:
  lda _var_0080                  ; $C073  A5 80
  bne _label_c079                ; $C075  D0 02
  lda #$FE                       ; $C077  A9 FE

_label_c079:
  sta PPU_DATA                   ; $C079  8D 07 20
  lda a:_var_06b9                ; $C07C  AD B9 06
  bne _label_c08b                ; $C07F  D0 0A
  lda _var_0080                  ; $C081  A5 80
  bne _label_c089                ; $C083  D0 04
  lda #$FE                       ; $C085  A9 FE
  bne _label_c08b                ; $C087  D0 02

_label_c089:
  lda #$00                       ; $C089  A9 00

_label_c08b:
  sta PPU_DATA                   ; $C08B  8D 07 20
  lda a:_var_06ba                ; $C08E  AD BA 06
  sta PPU_DATA                   ; $C091  8D 07 20

_label_c094:
  lda #$00                       ; $C094  A9 00
  sta a:_var_06bb                ; $C096  8D BB 06
  rts                            ; $C099  60

_data_c09a_indexed:
.byte $1c, $1c, $0a, $19         ; $C09A

_func_c09e:
  lda _var_008e                  ; $C09E  A5 8E
  cmp #$01                       ; $C0A0  C9 01
  beq _label_c0a5                ; $C0A2  F0 01
  rts                            ; $C0A4  60

_label_c0a5:
  lda #$06                       ; $C0A5  A9 06
  sta PPU_MASK                   ; $C0A7  8D 01 20
  lda #$30                       ; $C0AA  A9 30
  sta PPU_CTRL                   ; $C0AC  8D 00 20
  lda _var_004f                  ; $C0AF  A5 4F
  cmp #$04                       ; $C0B1  C9 04
  bne _label_c0d3                ; $C0B3  D0 1E
  lda a:_var_011f                ; $C0B5  AD 1F 01
  beq _label_c0d3                ; $C0B8  F0 19
  lda #$29                       ; $C0BA  A9 29
  sta PPU_ADDR                   ; $C0BC  8D 06 20
  lda #$AF                       ; $C0BF  A9 AF
  sta PPU_ADDR                   ; $C0C1  8D 06 20
  lda #$F7                       ; $C0C4  A9 F7
  sta PPU_DATA                   ; $C0C6  8D 07 20
  lda #$FE                       ; $C0C9  A9 FE
  sta PPU_DATA                   ; $C0CB  8D 07 20
  lda _var_0026                  ; $C0CE  A5 26
  sta PPU_DATA                   ; $C0D0  8D 07 20

_label_c0d3:
  lda _var_001f_indexed          ; $C0D3  A5 1F
  and #$F0                       ; $C0D5  29 F0
  beq _label_c12a                ; $C0D7  F0 51
  lda _var_004f                  ; $C0D9  A5 4F
  cmp #$06                       ; $C0DB  C9 06
  bcs _label_c12a                ; $C0DD  B0 4B
  lda #$2A                       ; $C0DF  A9 2A
  sta PPU_ADDR                   ; $C0E1  8D 06 20
  lda #$08                       ; $C0E4  A9 08
  sta PPU_ADDR                   ; $C0E6  8D 06 20
  ldx #$00                       ; $C0E9  A2 00

_label_c0eb:
  lda a:_data_c137_indexed,X     ; $C0EB  BD 37 C1
  sta PPU_DATA                   ; $C0EE  8D 07 20
  inx                            ; $C0F1  E8
  cpx #$08                       ; $C0F2  E0 08
  bne _label_c0eb                ; $C0F4  D0 F5
  lda _var_001f_indexed          ; $C0F6  A5 1F
  sec                            ; $C0F8  38
  sbc #$10                       ; $C0F9  E9 10
  tax                            ; $C0FB  AA
  lda _var_001e                  ; $C0FC  A5 1E
  beq _label_c10d                ; $C0FE  F0 0D
  lda #$00                       ; $C100  A9 00
  sec                            ; $C102  38
  sbc a:_data_d914_indexed,X     ; $C103  FD 14 D9
  cmp _var_002a                  ; $C106  C5 2A
  beq _label_c121                ; $C108  F0 17
  jmp _label_c10d                ; $C10A  4C 0D C1

_label_c10d:
  lda _var_002a                  ; $C10D  A5 2A
  cmp a:_data_d914_indexed,X     ; $C10F  DD 14 D9
  beq _label_c121                ; $C112  F0 0D
  lda #$00                       ; $C114  A9 00
  sta a:_var_014a                ; $C116  8D 4A 01
  sta a:_var_014b                ; $C119  8D 4B 01
  sta _var_002b                  ; $C11C  85 2B
  jmp _label_c12a                ; $C11E  4C 2A C1

_label_c121:
  lda #$00                       ; $C121  A9 00
  sta _var_002b                  ; $C123  85 2B
  lda #$05                       ; $C125  A9 05
  sta a:_var_014a                ; $C127  8D 4A 01

_label_c12a:
  lda #$00                       ; $C12A  A9 00
  sta PPU_MASK                   ; $C12C  8D 01 20
  inc _var_008e                  ; $C12F  E6 8E
  lda _var_001d                  ; $C131  A5 1D
  sta PPU_CTRL                   ; $C133  8D 00 20
  rts                            ; $C136  60

_data_c137_indexed:
.byte $19, $0a, $1c, $1c, $20, $18, $1b, $0d ; $C137

_func_c13f:
  lda _var_0052                  ; $C13F  A5 52
  cmp #$02                       ; $C141  C9 02
  bcc _label_c158                ; $C143  90 13
  lda _var_00af                  ; $C145  A5 AF
  cmp #$0D                       ; $C147  C9 0D
  bne _label_c151                ; $C149  D0 06
  jsr _func_d407                 ; $C14B  20 07 D4
  jmp _label_c158                ; $C14E  4C 58 C1

_label_c151:
  cmp #$0E                       ; $C151  C9 0E
  bne _label_c158                ; $C153  D0 03
  jsr _func_d41a                 ; $C155  20 1A D4

_label_c158:
  ldx _var_005b                  ; $C158  A6 5B
  ldy _var_0056                  ; $C15A  A4 56
  lda _var_00af                  ; $C15C  A5 AF
  cmp #$0B                       ; $C15E  C9 0B
  beq _label_c19e                ; $C160  F0 3C
  cmp #$0E                       ; $C162  C9 0E
  bne _label_c17c                ; $C164  D0 16
  lda _var_0031_indexed          ; $C166  A5 31
  bne _label_c173                ; $C168  D0 09

_label_c16a:
  cpx #$00                       ; $C16A  E0 00
  bne _label_c171                ; $C16C  D0 03
  dey                            ; $C16E  88
  ldx #$04                       ; $C16F  A2 04

_label_c171:
  dex                            ; $C171  CA
  rts                            ; $C172  60

_label_c173:
  cpx #$03                       ; $C173  E0 03
  bne _label_c17a                ; $C175  D0 03
  iny                            ; $C177  C8
  ldx #$FF                       ; $C178  A2 FF

_label_c17a:
  inx                            ; $C17A  E8
  rts                            ; $C17B  60

_label_c17c:
  cmp #$0D                       ; $C17C  C9 0D
  beq _label_c187                ; $C17E  F0 07
  lda _var_0031_indexed          ; $C180  A5 31
  bne _label_c194                ; $C182  D0 10
  jmp _label_c18b                ; $C184  4C 8B C1

_label_c187:
  lda _var_0031_indexed          ; $C187  A5 31
  beq _label_c194                ; $C189  F0 09

_label_c18b:
  lda _var_0052                  ; $C18B  A5 52
  beq _label_c16a                ; $C18D  F0 DB
  cmp #$03                       ; $C18F  C9 03
  beq _label_c16a                ; $C191  F0 D7
  rts                            ; $C193  60

_label_c194:
  lda _var_0052                  ; $C194  A5 52
  cmp #$01                       ; $C196  C9 01
  beq _label_c173                ; $C198  F0 D9
  cmp #$02                       ; $C19A  C9 02
  beq _label_c173                ; $C19C  F0 D5

_label_c19e:
  rts                            ; $C19E  60

_func_c19f:
  ldy #$2F                       ; $C19F  A0 2F
  lda #$02                       ; $C1A1  A9 02
  sta _var_002e                  ; $C1A3  85 2E
  lda #$00                       ; $C1A5  A9 00
  sta _var_002d_indexed          ; $C1A7  85 2D

_label_c1a9:
  lda #$00                       ; $C1A9  A9 00
  sta a:_var_0000_indexed,Y      ; $C1AB  99 00 00
  iny                            ; $C1AE  C8
  bne _label_c1a9                ; $C1AF  D0 F8

_label_c1b1:
  lda #$00                       ; $C1B1  A9 00
  sta a:_var_0100_indexed,Y      ; $C1B3  99 00 01
  iny                            ; $C1B6  C8
  cpy #$81                       ; $C1B7  C0 81
  bne _label_c1b1                ; $C1B9  D0 F6
  ldy #$00                       ; $C1BB  A0 00

_label_c1bd:
  lda #$00                       ; $C1BD  A9 00
  sta (_var_002d_indexed),Y      ; $C1BF  91 2D
  iny                            ; $C1C1  C8
  bne _label_c1bd                ; $C1C2  D0 F9
  inc _var_002e                  ; $C1C4  E6 2E
  ldx _var_002e                  ; $C1C6  A6 2E
  cpx #$08                       ; $C1C8  E0 08
  bne _label_c1bd                ; $C1CA  D0 F1
  rts                            ; $C1CC  60

_func_c1cd:
  ldx #$00                       ; $C1CD  A2 00
  lda #$EF                       ; $C1CF  A9 EF

_label_c1d1:
  sta a:_var_0200_indexed,X      ; $C1D1  9D 00 02
  inx                            ; $C1D4  E8
  cpx #$E0                       ; $C1D5  E0 E0
  bne _label_c1d1                ; $C1D7  D0 F8
  ldx #$00                       ; $C1D9  A2 00

_label_c1db:
  sta a:_var_0700_indexed,X      ; $C1DB  9D 00 07
  inx                            ; $C1DE  E8
  bne _label_c1db                ; $C1DF  D0 FA
  rts                            ; $C1E1  60

_func_c1e2:
  lda a:_var_0200_indexed        ; $C1E2  AD 00 02
  cmp #$77                       ; $C1E5  C9 77
  bcc _label_c21f                ; $C1E7  90 36
  lda _var_001d                  ; $C1E9  A5 1D
  and #$02                       ; $C1EB  29 02
  beq _label_c21f                ; $C1ED  F0 30
  lda _var_0065                  ; $C1EF  A5 65
  beq _label_c201                ; $C1F1  F0 0E
  cmp #$EE                       ; $C1F3  C9 EE
  beq _label_c201                ; $C1F5  F0 0A
  cmp #$EF                       ; $C1F7  C9 EF
  bcs _label_c216                ; $C1F9  B0 1B
  and #$07                       ; $C1FB  29 07
  cmp #$07                       ; $C1FD  C9 07
  bne _label_c20b                ; $C1FF  D0 0A

_label_c201:
  lda _var_0032                  ; $C201  A5 32
  cmp #$02                       ; $C203  C9 02
  bcc _label_c20b                ; $C205  90 04
  lda #$01                       ; $C207  A9 01
  sta _var_0032                  ; $C209  85 32

_label_c20b:
  lda _var_0065                  ; $C20B  A5 65
  clc                            ; $C20D  18
  adc _var_0032                  ; $C20E  65 32
  sta _var_0065                  ; $C210  85 65
  cmp #$F0                       ; $C212  C9 F0
  bcc _label_c21e                ; $C214  90 08

_label_c216:
  lda #$00                       ; $C216  A9 00
  sta _var_0065                  ; $C218  85 65
  lda #$B0                       ; $C21A  A9 B0
  sta _var_001d                  ; $C21C  85 1D

_label_c21e:
  rts                            ; $C21E  60

_label_c21f:
  lda a:_var_0200_indexed        ; $C21F  AD 00 02
  and #$07                       ; $C222  29 07
  cmp #$06                       ; $C224  C9 06
  bne _label_c232                ; $C226  D0 0A
  lda _var_0032                  ; $C228  A5 32
  cmp #$02                       ; $C22A  C9 02
  bcc _label_c232                ; $C22C  90 04
  lda #$01                       ; $C22E  A9 01
  sta _var_0032                  ; $C230  85 32

_label_c232:
  lda a:_var_0200_indexed        ; $C232  AD 00 02
  clc                            ; $C235  18
  adc _var_0032                  ; $C236  65 32
  sta a:_var_0200_indexed        ; $C238  8D 00 02
  cmp #$CF                       ; $C23B  C9 CF
  bcc _label_c241                ; $C23D  90 02
  inc _var_0085                  ; $C23F  E6 85

_label_c241:
  rts                            ; $C241  60

_func_c242:
  lda a:_var_0200_indexed        ; $C242  AD 00 02
  cmp #$78                       ; $C245  C9 78
  bcs _label_c27d                ; $C247  B0 34
  lda _var_0065                  ; $C249  A5 65
  bne _label_c25c                ; $C24B  D0 0F
  lda _var_001d                  ; $C24D  A5 1D
  and #$02                       ; $C24F  29 02
  bne _label_c276                ; $C251  D0 23
  lda #$B2                       ; $C253  A9 B2
  sta _var_001d                  ; $C255  85 1D
  lda #$EF                       ; $C257  A9 EF
  sta _var_0065                  ; $C259  85 65
  rts                            ; $C25B  60

_label_c25c:
  lda _var_0065                  ; $C25C  A5 65
  and #$07                       ; $C25E  29 07
  cmp #$01                       ; $C260  C9 01
  bne _label_c26e                ; $C262  D0 0A
  lda _var_0032                  ; $C264  A5 32
  cmp #$02                       ; $C266  C9 02
  bcc _label_c26e                ; $C268  90 04
  lda #$01                       ; $C26A  A9 01
  sta _var_0032                  ; $C26C  85 32

_label_c26e:
  lda _var_0065                  ; $C26E  A5 65
  sec                            ; $C270  38
  sbc _var_0032                  ; $C271  E5 32
  sta _var_0065                  ; $C273  85 65
  rts                            ; $C275  60

_label_c276:
  lda a:_var_0200_indexed        ; $C276  AD 00 02
  cmp #$0F                       ; $C279  C9 0F
  beq _label_c29b                ; $C27B  F0 1E

_label_c27d:
  lda a:_var_0200_indexed        ; $C27D  AD 00 02
  cmp #$78                       ; $C280  C9 78
  beq _label_c288                ; $C282  F0 04
  and #$07                       ; $C284  29 07
  bne _label_c292                ; $C286  D0 0A

_label_c288:
  lda _var_0032                  ; $C288  A5 32
  cmp #$02                       ; $C28A  C9 02
  bcc _label_c292                ; $C28C  90 04
  lda #$01                       ; $C28E  A9 01
  sta _var_0032                  ; $C290  85 32

_label_c292:
  lda a:_var_0200_indexed        ; $C292  AD 00 02
  sec                            ; $C295  38
  sbc _var_0032                  ; $C296  E5 32
  sta a:_var_0200_indexed        ; $C298  8D 00 02

_label_c29b:
  rts                            ; $C29B  60

_func_c29c:
  jsr _func_cf34                 ; $C29C  20 34 CF
  inc _var_00d0_indexed,X        ; $C29F  F6 D0
  jsr _func_d487                 ; $C2A1  20 87 D4
  lda a:_var_020a_indexed        ; $C2A4  AD 0A 02
  sta a:_var_0211_indexed,X      ; $C2A7  9D 11 02
  lda a:_var_0207_indexed        ; $C2AA  AD 07 02
  sta a:_var_020e_indexed,X      ; $C2AD  9D 0E 02
  lda a:_var_0208_indexed        ; $C2B0  AD 08 02
  sta a:_var_020f_indexed,X      ; $C2B3  9D 0F 02
  lda a:_var_020b_indexed        ; $C2B6  AD 0B 02
  sta a:_var_0212_indexed,X      ; $C2B9  9D 12 02
  lda a:_var_0209_indexed        ; $C2BC  AD 09 02
  sta a:_var_0210_indexed,X      ; $C2BF  9D 10 02
  lda #$00                       ; $C2C2  A9 00
  sta a:_var_0213_indexed,X      ; $C2C4  9D 13 02
  lda #$EF                       ; $C2C7  A9 EF
  sta a:_var_0207_indexed        ; $C2C9  8D 07 02
  sta a:_var_0208_indexed        ; $C2CC  8D 08 02
  rts                            ; $C2CF  60

_func_c2d0:
  lda _var_0032                  ; $C2D0  A5 32
  asl a                          ; $C2D2  0A
  tax                            ; $C2D3  AA
  lda _var_0067                  ; $C2D4  A5 67
  bne _label_c2ea                ; $C2D6  D0 12
  lda #$00                       ; $C2D8  A9 00
  sta a:_var_0202_indexed        ; $C2DA  8D 02 02
  lda a:_data_c2fc_indexed,X     ; $C2DD  BD FC C2
  sta a:_var_0201_indexed        ; $C2E0  8D 01 02
  lda a:_data_c2fd_indexed,X     ; $C2E3  BD FD C2
  sta a:_var_0204_indexed        ; $C2E6  8D 04 02
  rts                            ; $C2E9  60

_label_c2ea:
  lda #$40                       ; $C2EA  A9 40
  sta a:_var_0202_indexed        ; $C2EC  8D 02 02
  lda a:_data_c2fc_indexed,X     ; $C2EF  BD FC C2
  sta a:_var_0204_indexed        ; $C2F2  8D 04 02
  lda a:_data_c2fd_indexed,X     ; $C2F5  BD FD C2
  sta a:_var_0201_indexed        ; $C2F8  8D 01 02
  rts                            ; $C2FB  60

_data_c2fc_indexed:
.byte $18                        ; $C2FC

_data_c2fd_indexed:
.byte $1a, $1c, $1e, $20, $22, $24, $26, $00, $02, $04, $06, $24, $26, $38, $3a, $08 ; $C2FD
.byte $0a, $b0, $b2, $28, $2a, $24, $26, $2c, $2e, $34, $36, $30, $32, $20, $22, $0c ; $C30D
.byte $0e, $6c, $6e, $3c, $3e, $40, $42, $44, $46, $80, $82, $84, $86, $14, $16 ; $C31D

_func_c32c:
  lda _var_006f                  ; $C32C  A5 6F
  bne _label_c33d                ; $C32E  D0 0D
  lda a:_var_0203_indexed        ; $C330  AD 03 02
  sta _var_00a2                  ; $C333  85 A2
  lda a:_var_0200_indexed        ; $C335  AD 00 02
  sta _var_00a1                  ; $C338  85 A1
  jmp _label_c340                ; $C33A  4C 40 C3

_label_c33d:
  jsr _func_a077                 ; $C33D  20 77 A0

_label_c340:
  lda _var_0065                  ; $C340  A5 65
  clc                            ; $C342  18
  adc _var_00a1                  ; $C343  65 A1
  and #$07                       ; $C345  29 07
  cmp #$07                       ; $C347  C9 07
  bne _label_c3bb                ; $C349  D0 70
  lda _var_00a2                  ; $C34B  A5 A2
  and #$07                       ; $C34D  29 07
  cmp #$04                       ; $C34F  C9 04
  bne _label_c3bb                ; $C351  D0 68
  ldx #$00                       ; $C353  A2 00

_label_c355:
  lda #$00                       ; $C355  A9 00
  sta a:_var_0364_indexed,X      ; $C357  9D 64 03
  inx                            ; $C35A  E8
  cpx #$0E                       ; $C35B  E0 0E
  bne _label_c355                ; $C35D  D0 F6
  ldx #$00                       ; $C35F  A2 00

_label_c361:
  clc                            ; $C361  18
  lda _var_00a2                  ; $C362  A5 A2
  adc a:_data_c3bc_indexed,X     ; $C364  7D BC C3
  lsr a                          ; $C367  4A
  lsr a                          ; $C368  4A
  lsr a                          ; $C369  4A
  sta a:_var_0360_indexed,X      ; $C36A  9D 60 03
  lda _var_00a1                  ; $C36D  A5 A1
  clc                            ; $C36F  18
  adc a:_data_c3c0_indexed,X     ; $C370  7D C0 C3
  clc                            ; $C373  18
  adc _var_0065                  ; $C374  65 65
  sta _var_006c                  ; $C376  85 6C
  bcs _label_c38d                ; $C378  B0 13
  cmp #$EF                       ; $C37A  C9 EF
  bcs _label_c38d                ; $C37C  B0 0F
  lda _var_001d                  ; $C37E  A5 1D
  and #$02                       ; $C380  29 02
  beq _label_c392                ; $C382  F0 0E
  inc a:_var_0364_indexed,X      ; $C384  FE 64 03
  rol a:_var_0364_indexed,X      ; $C387  3E 64 03
  jmp _label_c392                ; $C38A  4C 92 C3

_label_c38d:
  clc                            ; $C38D  18
  adc #$10                       ; $C38E  69 10
  sta _var_006c                  ; $C390  85 6C

_label_c392:
  lda _var_006c                  ; $C392  A5 6C
  asl a                          ; $C394  0A
  rol a:_var_0364_indexed,X      ; $C395  3E 64 03
  asl a                          ; $C398  0A
  rol a:_var_0364_indexed,X      ; $C399  3E 64 03
  clc                            ; $C39C  18
  adc a:_var_0360_indexed,X      ; $C39D  7D 60 03
  sta a:_var_0360_indexed,X      ; $C3A0  9D 60 03
  clc                            ; $C3A3  18
  lda a:_var_0364_indexed,X      ; $C3A4  BD 64 03
  adc #$20                       ; $C3A7  69 20
  sta a:_var_0364_indexed,X      ; $C3A9  9D 64 03
  inx                            ; $C3AC  E8
  cpx #$04                       ; $C3AD  E0 04
  bne _label_c361                ; $C3AF  D0 B0
  inc _var_0042                  ; $C3B1  E6 42
  lda _var_00a1                  ; $C3B3  A5 A1
  sta _var_0090                  ; $C3B5  85 90
  lda _var_0065                  ; $C3B7  A5 65
  sta _var_00ea                  ; $C3B9  85 EA

_label_c3bb:
  rts                            ; $C3BB  60

_data_c3bc_indexed:
.byte $fc, $fc, $fc, $fc         ; $C3BC

_data_c3c0_indexed:
.byte $f9, $01, $09, $11         ; $C3C0

_func_c3c4:
  jsr _func_cda9                 ; $C3C4  20 A9 CD
  lda _var_009c                  ; $C3C7  A5 9C
  beq _label_c3cf                ; $C3C9  F0 04
  lda #$00                       ; $C3CB  A9 00
  sta _var_0068                  ; $C3CD  85 68

_label_c3cf:
  lda _var_0078                  ; $C3CF  A5 78
  bne _label_c3f2                ; $C3D1  D0 1F
  lda _var_007b                  ; $C3D3  A5 7B
  bne _label_c3f2                ; $C3D5  D0 1B
  lda _var_004e                  ; $C3D7  A5 4E
  beq _label_c3e3                ; $C3D9  F0 08
  cmp #$14                       ; $C3DB  C9 14
  bcc _label_c3f2                ; $C3DD  90 13
  lda #$00                       ; $C3DF  A9 00
  sta _var_004e                  ; $C3E1  85 4E

_label_c3e3:
  lda _var_0067                  ; $C3E3  A5 67
  sta _var_0069                  ; $C3E5  85 69
  lda _var_0068                  ; $C3E7  A5 68
  bne _label_c44b                ; $C3E9  D0 60
  lda _var_0043                  ; $C3EB  A5 43
  beq _label_c402                ; $C3ED  F0 13
  jmp _label_c4c4                ; $C3EF  4C C4 C4

_label_c3f2:
  inc _var_004e                  ; $C3F2  E6 4E
  lda _var_006f                  ; $C3F4  A5 6F
  beq _label_c3fb                ; $C3F6  F0 03
  jsr _func_b047                 ; $C3F8  20 47 B0

_label_c3fb:
  jsr _func_e605                 ; $C3FB  20 05 E6
  jsr _func_ce08                 ; $C3FE  20 08 CE
  rts                            ; $C401  60

_label_c402:
  jsr _func_e605                 ; $C402  20 05 E6
  lda _var_00ff                  ; $C405  A5 FF
  bne _label_c452                ; $C407  D0 49
  jsr _func_ce08                 ; $C409  20 08 CE
  lda _var_006f                  ; $C40C  A5 6F
  beq _label_c413                ; $C40E  F0 03
  jsr _func_b047                 ; $C410  20 47 B0

_label_c413:
  lda a:_var_06ab                ; $C413  AD AB 06
  beq _label_c427                ; $C416  F0 0F
  lda a:_var_0200_indexed        ; $C418  AD 00 02
  clc                            ; $C41B  18
  adc _var_0065                  ; $C41C  65 65
  and #$07                       ; $C41E  29 07
  cmp #$07                       ; $C420  C9 07
  beq _label_c427                ; $C422  F0 03
  jmp _label_ead3                ; $C424  4C D3 EA

_label_c427:
  ldy #$00                       ; $C427  A0 00

_label_c429:
  lda _var_004b                  ; $C429  A5 4B
  and a:_data_c453_indexed,Y     ; $C42B  39 53 C4
  cmp a:_data_c453_indexed,Y     ; $C42E  D9 53 C4
  beq _label_c43b                ; $C431  F0 08
  cpy #$03                       ; $C433  C0 03
  beq _label_c452                ; $C435  F0 1B
  iny                            ; $C437  C8
  jmp _label_c429                ; $C438  4C 29 C4

_label_c43b:
  tya                            ; $C43B  98
  asl a                          ; $C43C  0A
  tay                            ; $C43D  A8
  lda a:_data_c457_indexed,Y     ; $C43E  B9 57 C4
  sta _var_0048                  ; $C441  85 48
  lda a:_data_c458_indexed,Y     ; $C443  B9 58 C4
  sta _var_0049_indexed          ; $C446  85 49
  jmp (_var_0048)                ; $C448  6C 48 00  jump engine detected

_label_c44b:
  lda _var_006f                  ; $C44B  A5 6F
  beq _label_c452                ; $C44D  F0 03
  jsr _func_b047                 ; $C44F  20 47 B0

_label_c452:
  rts                            ; $C452  60

_data_c453_indexed:
.byte $80, $40, $20, $10         ; $C453

_data_c457_indexed:
.byte $5f                        ; $C457

_data_c458_indexed:
.byte $c4, $5f, $c4, $4b, $c5, $5b, $c5 ; $C458

  jsr _func_dace                 ; $C45F  20 CE DA
  lda _var_0043                  ; $C462  A5 43
  bne _label_c4c4                ; $C464  D0 5E
  ldx #$06                       ; $C466  A2 06

_label_c468:
  lda a:_var_0100_indexed,X      ; $C468  BD 00 01
  bne _label_c486                ; $C46B  D0 19
  dex                            ; $C46D  CA
  bpl _label_c468                ; $C46E  10 F8
  lda _var_0065                  ; $C470  A5 65
  clc                            ; $C472  18
  adc a:_var_0200_indexed        ; $C473  6D 00 02
  and #$07                       ; $C476  29 07
  cmp #$07                       ; $C478  C9 07
  beq _label_c486                ; $C47A  F0 0A
  lda _var_006a                  ; $C47C  A5 6A
  bne _label_c483                ; $C47E  D0 03
  jmp _label_eaaa                ; $C480  4C AA EA

_label_c483:
  jmp _label_eaff                ; $C483  4C FF EA

_label_c486:
  lda _var_004b                  ; $C486  A5 4B
  and #$80                       ; $C488  29 80
  beq _label_c49a                ; $C48A  F0 0E
  lda _var_0067                  ; $C48C  A5 67
  bne _label_c493                ; $C48E  D0 03
  jsr _func_e84a                 ; $C490  20 4A E8

_label_c493:
  lda #$00                       ; $C493  A9 00
  sta _var_0067                  ; $C495  85 67
  jmp _label_c4a5                ; $C497  4C A5 C4

_label_c49a:
  lda _var_0067                  ; $C49A  A5 67
  beq _label_c4a1                ; $C49C  F0 03
  jsr _func_e96c                 ; $C49E  20 6C E9

_label_c4a1:
  lda #$01                       ; $C4A1  A9 01
  sta _var_0067                  ; $C4A3  85 67

_label_c4a5:
  lda #$04                       ; $C4A5  A9 04
  sta _var_0032                  ; $C4A7  85 32
  lda _var_0077                  ; $C4A9  A5 77
  beq _label_c4b1                ; $C4AB  F0 04
  lda #$06                       ; $C4AD  A9 06
  sta _var_0032                  ; $C4AF  85 32

_label_c4b1:
  lda _var_0043                  ; $C4B1  A5 43
  bne _label_c4bd                ; $C4B3  D0 08
  lda _var_0050                  ; $C4B5  A5 50
  and #$04                       ; $C4B7  29 04
  beq _label_c4bd                ; $C4B9  F0 02
  inc _var_0032                  ; $C4BB  E6 32

_label_c4bd:
  jsr _func_c2d0                 ; $C4BD  20 D0 C2
  jsr _func_c614                 ; $C4C0  20 14 C6
  rts                            ; $C4C3  60

_label_c4c4:
  lda _var_0043                  ; $C4C4  A5 43
  cmp #$06                       ; $C4C6  C9 06
  bcs _label_c4e5                ; $C4C8  B0 1B
  lda _var_004b                  ; $C4CA  A5 4B
  and #$C0                       ; $C4CC  29 C0
  bne _label_c4d5                ; $C4CE  D0 05
  lda #$00                       ; $C4D0  A9 00
  sta _var_0043                  ; $C4D2  85 43
  rts                            ; $C4D4  60

_label_c4d5:
  lda #$0A                       ; $C4D5  A9 0A
  sta _var_0032                  ; $C4D7  85 32
  lda _var_0077                  ; $C4D9  A5 77
  beq _label_c4df                ; $C4DB  F0 02
  inc _var_0032                  ; $C4DD  E6 32

_label_c4df:
  jsr _func_c2d0                 ; $C4DF  20 D0 C2
  inc _var_0043                  ; $C4E2  E6 43
  rts                            ; $C4E4  60

_label_c4e5:
  cmp #$07                       ; $C4E5  C9 07
  bcs _label_c4f6                ; $C4E7  B0 0D
  lda a:_var_0621                ; $C4E9  AD 21 06
  bne _label_c4f1                ; $C4EC  D0 03
  inc a:_var_0621                ; $C4EE  EE 21 06

_label_c4f1:
  lda #$0C                       ; $C4F1  A9 0C
  jmp _label_c505                ; $C4F3  4C 05 C5

_label_c4f6:
  jsr _func_c5a2                 ; $C4F6  20 A2 C5
  lda _var_0043                  ; $C4F9  A5 43
  cmp #$06                       ; $C4FB  C9 06
  beq _label_c52f                ; $C4FD  F0 30
  cmp #$08                       ; $C4FF  C9 08
  bcs _label_c530                ; $C501  B0 2D
  lda #$0E                       ; $C503  A9 0E

_label_c505:
  sta _var_0032                  ; $C505  85 32
  lda _var_0077                  ; $C507  A5 77
  beq _label_c50d                ; $C509  F0 02
  inc _var_0032                  ; $C50B  E6 32

_label_c50d:
  jsr _func_c2d0                 ; $C50D  20 D0 C2
  jsr _func_c578                 ; $C510  20 78 C5
  lda _var_0077                  ; $C513  A5 77
  beq _label_c52f                ; $C515  F0 18
  lda _var_0043                  ; $C517  A5 43
  cmp #$07                       ; $C519  C9 07
  bne _label_c526                ; $C51B  D0 09
  lda a:_var_0200_indexed        ; $C51D  AD 00 02
  sec                            ; $C520  38
  sbc #$10                       ; $C521  E9 10
  jmp _label_c52c                ; $C523  4C 2C C5

_label_c526:
  lda a:_var_0200_indexed        ; $C526  AD 00 02
  sec                            ; $C529  38
  sbc #$0E                       ; $C52A  E9 0E

_label_c52c:
  sta a:_var_0207_indexed        ; $C52C  8D 07 02

_label_c52f:
  rts                            ; $C52F  60

_label_c530:
  lda #$00                       ; $C530  A9 00
  sta _var_0043                  ; $C532  85 43
  lda #$04                       ; $C534  A9 04
  sta _var_0032                  ; $C536  85 32
  lda _var_0077                  ; $C538  A5 77
  beq _label_c547                ; $C53A  F0 0B
  lda a:_var_0200_indexed        ; $C53C  AD 00 02
  sec                            ; $C53F  38
  sbc #$0C                       ; $C540  E9 0C
  sta a:_var_0207_indexed        ; $C542  8D 07 02
  dec _var_0032                  ; $C545  C6 32

_label_c547:
  jsr _func_c2d0                 ; $C547  20 D0 C2
  rts                            ; $C54A  60
  lda #$01                       ; $C54B  A9 01
  sta _var_006a                  ; $C54D  85 6A
  lda a:_var_0203_indexed        ; $C54F  AD 03 02
  and #$07                       ; $C552  29 07
  cmp #$04                       ; $C554  C9 04
  bne _label_c568                ; $C556  D0 10
  jmp _label_c56b                ; $C558  4C 6B C5
  lda #$00                       ; $C55B  A9 00
  sta _var_006a                  ; $C55D  85 6A
  lda a:_var_0203_indexed        ; $C55F  AD 03 02
  and #$07                       ; $C562  29 07
  cmp #$04                       ; $C564  C9 04
  beq _label_c56b                ; $C566  F0 03

_label_c568:
  jmp _label_dcf9                ; $C568  4C F9 DC

_label_c56b:
  jsr _func_c614                 ; $C56B  20 14 C6
  lda _var_006a                  ; $C56E  A5 6A
  beq _label_c575                ; $C570  F0 03
  jmp _label_ead3                ; $C572  4C D3 EA

_label_c575:
  jmp _label_ea5b                ; $C575  4C 5B EA

_func_c578:
  lda _var_0046                  ; $C578  A5 46
  bne _label_c58f                ; $C57A  D0 13
  lda _var_0043                  ; $C57C  A5 43
  cmp #$06                       ; $C57E  C9 06
  bne _label_c585                ; $C580  D0 03
  jmp _label_eaaa                ; $C582  4C AA EA

_label_c585:
  lda _var_0067                  ; $C585  A5 67
  beq _label_c58c                ; $C587  F0 03
  jmp _label_e9d6                ; $C589  4C D6 E9

_label_c58c:
  jmp _label_e8b4                ; $C58C  4C B4 E8

_label_c58f:
  lda _var_0043                  ; $C58F  A5 43
  cmp #$06                       ; $C591  C9 06
  bne _label_c59f                ; $C593  D0 0A
  lda _var_0067                  ; $C595  A5 67
  beq _label_c59c                ; $C597  F0 03
  jmp _label_e9d6                ; $C599  4C D6 E9

_label_c59c:
  jmp _label_e8b4                ; $C59C  4C B4 E8

_label_c59f:
  jmp _label_eaff                ; $C59F  4C FF EA

_func_c5a2:
  lda _var_009c                  ; $C5A2  A5 9C
  beq _label_c613                ; $C5A4  F0 6D
  lda _var_0067                  ; $C5A6  A5 67
  beq _label_c5af                ; $C5A8  F0 05
  ldy #$03                       ; $C5AA  A0 03
  jmp _label_c5b1                ; $C5AC  4C B1 C5

_label_c5af:
  ldy #$05                       ; $C5AF  A0 05

_label_c5b1:
  ldx #$05                       ; $C5B1  A2 05
  lda a:_var_0368_indexed,Y      ; $C5B3  B9 68 03

_label_c5b6:
  cmp a:_data_e939_indexed,X     ; $C5B6  DD 39 E9
  beq _label_c5dc                ; $C5B9  F0 21
  dex                            ; $C5BB  CA
  bpl _label_c5b6                ; $C5BC  10 F8
  cpy #$06                       ; $C5BE  C0 06
  bcs _label_c5c8                ; $C5C0  B0 06
  iny                            ; $C5C2  C8
  iny                            ; $C5C3  C8
  iny                            ; $C5C4  C8
  jmp _label_c5b1                ; $C5C5  4C B1 C5

_label_c5c8:
  lda _var_0067                  ; $C5C8  A5 67
  beq _label_c5d4                ; $C5CA  F0 08
  lda a:_var_0203_indexed        ; $C5CC  AD 03 02
  cmp #$04                       ; $C5CF  C9 04
  bcc _label_c5dc                ; $C5D1  90 09
  rts                            ; $C5D3  60

_label_c5d4:
  lda a:_var_0203_indexed        ; $C5D4  AD 03 02
  cmp #$EC                       ; $C5D7  C9 EC
  bcs _label_c5dc                ; $C5D9  B0 01
  rts                            ; $C5DB  60

_label_c5dc:
  ldx #$0B                       ; $C5DC  A2 0B
  lda a:_var_0372                ; $C5DE  AD 72 03

_label_c5e1:
  cmp a:_data_e939_indexed,X     ; $C5E1  DD 39 E9
  beq _label_c613                ; $C5E4  F0 2D
  dex                            ; $C5E6  CA
  bpl _label_c5e1                ; $C5E7  10 F8

_label_c5e9:
  ldx #$05                       ; $C5E9  A2 05

_label_c5eb:
  lda a:_var_0368_indexed,Y      ; $C5EB  B9 68 03
  cmp a:_data_eac5_indexed,X     ; $C5EE  DD C5 EA
  beq _label_c613                ; $C5F1  F0 20
  dex                            ; $C5F3  CA
  bpl _label_c5eb                ; $C5F4  10 F5
  cpy #$07                       ; $C5F6  C0 07
  beq _label_c5fe                ; $C5F8  F0 04
  ldy #$07                       ; $C5FA  A0 07
  bne _label_c5e9                ; $C5FC  D0 EB

_label_c5fe:
  lda #$00                       ; $C5FE  A9 00
  sta _var_0046                  ; $C600  85 46
  lda #$06                       ; $C602  A9 06
  sta _var_0043                  ; $C604  85 43
  lda _var_0067                  ; $C606  A5 67
  bne _label_c60f                ; $C608  D0 05
  lda #$01                       ; $C60A  A9 01
  sta _var_0067                  ; $C60C  85 67
  rts                            ; $C60E  60

_label_c60f:
  lda #$00                       ; $C60F  A9 00
  sta _var_0067                  ; $C611  85 67

_label_c613:
  rts                            ; $C613  60

_func_c614:
  ldx #$05                       ; $C614  A2 05

_label_c616:
  lda a:_var_0101_indexed,X      ; $C616  BD 01 01
  bne _label_c645                ; $C619  D0 2A
  dex                            ; $C61B  CA
  bpl _label_c616                ; $C61C  10 F8
  ldx #$05                       ; $C61E  A2 05
  lda a:_var_036c                ; $C620  AD 6C 03

_label_c623:
  cmp a:_data_eac5_indexed,X     ; $C623  DD C5 EA
  beq _label_c656                ; $C626  F0 2E
  dex                            ; $C628  CA
  bpl _label_c623                ; $C629  10 F8
  ldx #$05                       ; $C62B  A2 05
  lda a:_var_036f                ; $C62D  AD 6F 03

_label_c630:
  cmp a:_data_eac5_indexed,X     ; $C630  DD C5 EA
  beq _label_c656                ; $C633  F0 21
  dex                            ; $C635  CA
  bpl _label_c630                ; $C636  10 F8
  lda _var_0065                  ; $C638  A5 65
  clc                            ; $C63A  18
  adc a:_var_0200_indexed        ; $C63B  6D 00 02
  and #$07                       ; $C63E  29 07
  cmp #$07                       ; $C640  C9 07
  bne _label_c675                ; $C642  D0 31

_label_c644:
  rts                            ; $C644  60

_label_c645:
  lda _var_004b                  ; $C645  A5 4B
  and #$C0                       ; $C647  29 C0
  bne _label_c644                ; $C649  D0 F9
  lda _var_0077                  ; $C64B  A5 77
  bne _label_c675                ; $C64D  D0 26
  lda #$04                       ; $C64F  A9 04
  sta _var_0032                  ; $C651  85 32
  jmp _label_c693                ; $C653  4C 93 C6

_label_c656:
  ldx #$0B                       ; $C656  A2 0B
  lda a:_var_0372                ; $C658  AD 72 03

_label_c65b:
  cmp a:_data_e954_indexed,X     ; $C65B  DD 54 E9
  beq _label_c675                ; $C65E  F0 15
  dex                            ; $C660  CA
  bpl _label_c65b                ; $C661  10 F8
  lda _var_0065                  ; $C663  A5 65
  clc                            ; $C665  18
  adc a:_var_0200_indexed        ; $C666  6D 00 02
  and #$07                       ; $C669  29 07
  cmp #$07                       ; $C66B  C9 07
  bne _label_c670                ; $C66D  D0 01
  rts                            ; $C66F  60

_label_c670:
  lda #$F4                       ; $C670  A9 F4
  sta a:_var_0372                ; $C672  8D 72 03

_label_c675:
  lda _var_0077                  ; $C675  A5 77
  beq _label_c680                ; $C677  F0 07
  lda #$06                       ; $C679  A9 06
  sta _var_0032                  ; $C67B  85 32
  jmp _label_c693                ; $C67D  4C 93 C6

_label_c680:
  lda #$08                       ; $C680  A9 08
  sta _var_0032                  ; $C682  85 32
  lda _var_004b                  ; $C684  A5 4B
  bne _label_c68b                ; $C686  D0 03
  jmp _label_c693                ; $C688  4C 93 C6

_label_c68b:
  lda _var_0050                  ; $C68B  A5 50
  and #$04                       ; $C68D  29 04
  beq _label_c693                ; $C68F  F0 02
  inc _var_0032                  ; $C691  E6 32

_label_c693:
  jsr _func_c2d0                 ; $C693  20 D0 C2
  rts                            ; $C696  60

_func_c697:
  lda _var_004b                  ; $C697  A5 4B
  and #$30                       ; $C699  29 30
  bne _label_c6b1                ; $C69B  D0 14
  lda _var_0065                  ; $C69D  A5 65
  clc                            ; $C69F  18
  adc a:_var_0200_indexed        ; $C6A0  6D 00 02
  and #$07                       ; $C6A3  29 07
  cmp #$07                       ; $C6A5  C9 07
  bne _label_c6b1                ; $C6A7  D0 08
  lda _var_00ee                  ; $C6A9  A5 EE
  beq _label_c6b2                ; $C6AB  F0 05
  lda _var_0077                  ; $C6AD  A5 77
  bne _label_c6b2                ; $C6AF  D0 01

_label_c6b1:
  rts                            ; $C6B1  60

_label_c6b2:
  lda _var_0077                  ; $C6B2  A5 77
  beq _label_c6bc                ; $C6B4  F0 06
  lda _var_004b                  ; $C6B6  A5 4B
  and #$F0                       ; $C6B8  29 F0
  bne _label_c6d2                ; $C6BA  D0 16

_label_c6bc:
  lda _var_0043                  ; $C6BC  A5 43
  bne _label_c6d2                ; $C6BE  D0 12
  lda _var_0078                  ; $C6C0  A5 78
  bne _label_c6d2                ; $C6C2  D0 0E
  lda _var_004e                  ; $C6C4  A5 4E
  bne _label_c6d2                ; $C6C6  D0 0A
  lda _var_004b                  ; $C6C8  A5 4B
  and #$01                       ; $C6CA  29 01
  bne _label_c6d3                ; $C6CC  D0 05
  lda #$00                       ; $C6CE  A9 00
  sta _var_0024                  ; $C6D0  85 24

_label_c6d2:
  rts                            ; $C6D2  60

_label_c6d3:
  lda #$00                       ; $C6D3  A9 00
  sta _var_0032                  ; $C6D5  85 32
  tax                            ; $C6D7  AA

_label_c6d8:
  lda a:_var_0101_indexed,X      ; $C6D8  BD 01 01
  sta _var_0032                  ; $C6DB  85 32
  bne _label_c712                ; $C6DD  D0 33
  inx                            ; $C6DF  E8
  cpx #$03                       ; $C6E0  E0 03
  bne _label_c6d8                ; $C6E2  D0 F4

_label_c6e4:
  lda a:_var_0101_indexed,X      ; $C6E4  BD 01 01
  sta _var_0032                  ; $C6E7  85 32
  bne _label_c6f0                ; $C6E9  D0 05
  inx                            ; $C6EB  E8
  cpx #$06                       ; $C6EC  E0 06
  bne _label_c6e4                ; $C6EE  D0 F4

_label_c6f0:
  lda _var_0077                  ; $C6F0  A5 77
  beq _label_c710                ; $C6F2  F0 1C
  lda a:_var_0203_indexed        ; $C6F4  AD 03 02
  and #$0F                       ; $C6F7  29 0F
  cmp #$04                       ; $C6F9  C9 04
  beq _label_c761                ; $C6FB  F0 64
  bcc _label_c70c                ; $C6FD  90 0D
  cmp #$08                       ; $C6FF  C9 08
  bcc _label_c709                ; $C701  90 06
  cmp #$0C                       ; $C703  C9 0C
  beq _label_c761                ; $C705  F0 5A
  bcc _label_c70c                ; $C707  90 03

_label_c709:
  jmp _label_e9d6                ; $C709  4C D6 E9

_label_c70c:
  jmp _label_e8b4                ; $C70C  4C B4 E8

_label_c70f:
  rts                            ; $C70F  60

_label_c710:
  lda _var_0032                  ; $C710  A5 32

_label_c712:
  bne _label_c761                ; $C712  D0 4D
  ldx #$07                       ; $C714  A2 07
  lda a:_var_0372                ; $C716  AD 72 03

_label_c719:
  cmp a:_data_e6ad_indexed,X     ; $C719  DD AD E6
  beq _label_c73b                ; $C71C  F0 1D
  dex                            ; $C71E  CA
  bpl _label_c719                ; $C71F  10 F8
  ldx #$05                       ; $C721  A2 05
  lda a:_var_036c                ; $C723  AD 6C 03

_label_c726:
  cmp a:_data_eac5_indexed,X     ; $C726  DD C5 EA
  beq _label_c70f                ; $C729  F0 E4
  dex                            ; $C72B  CA
  bpl _label_c726                ; $C72C  10 F8
  ldx #$05                       ; $C72E  A2 05
  lda a:_var_036f                ; $C730  AD 6F 03

_label_c733:
  cmp a:_data_eac5_indexed,X     ; $C733  DD C5 EA
  beq _label_c70f                ; $C736  F0 D7
  dex                            ; $C738  CA
  bpl _label_c733                ; $C739  10 F8

_label_c73b:
  lda _var_004b                  ; $C73B  A5 4B
  and #$C0                       ; $C73D  29 C0
  bne _label_c761                ; $C73F  D0 20
  lda _var_0067                  ; $C741  A5 67
  beq _label_c753                ; $C743  F0 0E
  lda a:_var_0203_indexed        ; $C745  AD 03 02
  and #$07                       ; $C748  29 07
  cmp #$04                       ; $C74A  C9 04
  beq _label_c761                ; $C74C  F0 13
  cmp #$05                       ; $C74E  C9 05
  bcs _label_c709                ; $C750  B0 B7
  rts                            ; $C752  60

_label_c753:
  lda a:_var_0203_indexed        ; $C753  AD 03 02
  and #$07                       ; $C756  29 07
  beq _label_c7c6                ; $C758  F0 6C
  cmp #$04                       ; $C75A  C9 04
  beq _label_c761                ; $C75C  F0 03
  bcc _label_c70c                ; $C75E  90 AC
  rts                            ; $C760  60

_label_c761:
  lda _var_006f                  ; $C761  A5 6F
  bne _label_c772                ; $C763  D0 0D
  lda a:_var_0203_indexed        ; $C765  AD 03 02
  sta _var_00a2                  ; $C768  85 A2
  lda a:_var_0200_indexed        ; $C76A  AD 00 02
  sta _var_00a1                  ; $C76D  85 A1
  jmp _label_c775                ; $C76F  4C 75 C7

_label_c772:
  jsr _func_a077                 ; $C772  20 77 A0

_label_c775:
  lda _var_0065                  ; $C775  A5 65
  bne _label_c780                ; $C777  D0 07

_label_c779:
  lda _var_0090                  ; $C779  A5 90
  sta _var_00a1                  ; $C77B  85 A1
  jmp _label_c7a3                ; $C77D  4C A3 C7

_label_c780:
  lda _var_00ea                  ; $C780  A5 EA
  sec                            ; $C782  38
  sbc _var_0065                  ; $C783  E5 65
  beq _label_c779                ; $C785  F0 F2
  bcs _label_c79b                ; $C787  B0 12
  sta _var_002d_indexed          ; $C789  85 2D
  lda #$00                       ; $C78B  A9 00
  sec                            ; $C78D  38
  sbc _var_002d_indexed          ; $C78E  E5 2D
  sta _var_002d_indexed          ; $C790  85 2D
  lda a:_var_0200_indexed        ; $C792  AD 00 02
  clc                            ; $C795  18
  adc _var_002d_indexed          ; $C796  65 2D
  jmp _label_c7a1                ; $C798  4C A1 C7

_label_c79b:
  lda a:_var_0200_indexed        ; $C79B  AD 00 02
  sec                            ; $C79E  38
  sbc _var_002d_indexed          ; $C79F  E5 2D

_label_c7a1:
  sta _var_00a1                  ; $C7A1  85 A1

_label_c7a3:
  lda _var_0032                  ; $C7A3  A5 32
  bne _label_c7b4                ; $C7A5  D0 0D
  ldx #$07                       ; $C7A7  A2 07
  lda a:_var_0372                ; $C7A9  AD 72 03

_label_c7ac:
  cmp a:_data_c816_indexed,X     ; $C7AC  DD 16 C8
  beq _label_c7c6                ; $C7AF  F0 15
  dex                            ; $C7B1  CA
  bpl _label_c7ac                ; $C7B2  10 F8

_label_c7b4:
  lda _var_0024                  ; $C7B4  A5 24
  bne _label_c7c6                ; $C7B6  D0 0E
  lda _var_007a                  ; $C7B8  A5 7A
  beq _label_c7c7                ; $C7BA  F0 0B
  lda _var_004b                  ; $C7BC  A5 4B
  and #$02                       ; $C7BE  29 02
  bne _label_c7c6                ; $C7C0  D0 04
  lda #$02                       ; $C7C2  A9 02
  sta _var_007a                  ; $C7C4  85 7A

_label_c7c6:
  rts                            ; $C7C6  60

_label_c7c7:
  lda _var_0067                  ; $C7C7  A5 67
  beq _label_c7e9                ; $C7C9  F0 1E
  lda a:_var_036b                ; $C7CB  AD 6B 03
  cmp #$33                       ; $C7CE  C9 33
  beq _label_c809                ; $C7D0  F0 37
  cmp #$34                       ; $C7D2  C9 34
  beq _label_c807                ; $C7D4  F0 31
  lda a:_var_036e                ; $C7D6  AD 6E 03
  cmp #$33                       ; $C7D9  C9 33
  beq _label_c80e                ; $C7DB  F0 31
  cmp #$34                       ; $C7DD  C9 34
  beq _label_c80c                ; $C7DF  F0 2B
  lda a:_var_0371                ; $C7E1  AD 71 03
  cmp #$34                       ; $C7E4  C9 34
  beq _label_c811                ; $C7E6  F0 29
  rts                            ; $C7E8  60

_label_c7e9:
  lda a:_var_036d                ; $C7E9  AD 6D 03
  cmp #$31                       ; $C7EC  C9 31
  beq _label_c807                ; $C7EE  F0 17
  cmp #$35                       ; $C7F0  C9 35
  beq _label_c809                ; $C7F2  F0 15
  lda a:_var_0370                ; $C7F4  AD 70 03
  cmp #$31                       ; $C7F7  C9 31
  beq _label_c80c                ; $C7F9  F0 11
  cmp #$35                       ; $C7FB  C9 35
  beq _label_c80e                ; $C7FD  F0 0F
  lda a:_var_0373                ; $C7FF  AD 73 03
  cmp #$35                       ; $C802  C9 35
  beq _label_c813                ; $C804  F0 0D
  rts                            ; $C806  60

_label_c807:
  inc _var_0076                  ; $C807  E6 76

_label_c809:
  jmp _label_c81e                ; $C809  4C 1E C8

_label_c80c:
  inc _var_0076                  ; $C80C  E6 76

_label_c80e:
  jmp _label_c829                ; $C80E  4C 29 C8

_label_c811:
  inc _var_0076                  ; $C811  E6 76

_label_c813:
  jmp _label_c831                ; $C813  4C 31 C8

_data_c816_indexed:
.byte $f0, $f1, $f2, $f3, $40, $41, $42, $43 ; $C816

_label_c81e:
  lda _var_00a1                  ; $C81E  A5 A1
  sec                            ; $C820  38
  sbc #$08                       ; $C821  E9 08
  sta a:_var_0207_indexed        ; $C823  8D 07 02
  jmp _label_c83c                ; $C826  4C 3C C8

_label_c829:
  lda _var_00a1                  ; $C829  A5 A1
  sta a:_var_0207_indexed        ; $C82B  8D 07 02
  jmp _label_c83c                ; $C82E  4C 3C C8

_label_c831:
  lda _var_00a1                  ; $C831  A5 A1
  clc                            ; $C833  18
  adc #$08                       ; $C834  69 08
  sta a:_var_0207_indexed        ; $C836  8D 07 02
  jmp _label_c83c                ; $C839  4C 3C C8

_label_c83c:
  lda _var_0067                  ; $C83C  A5 67
  beq _label_c84b                ; $C83E  F0 0B
  lda _var_00a2                  ; $C840  A5 A2
  sec                            ; $C842  38
  sbc #$0C                       ; $C843  E9 0C
  sta a:_var_020a_indexed        ; $C845  8D 0A 02
  jmp _label_c853                ; $C848  4C 53 C8

_label_c84b:
  lda _var_00a2                  ; $C84B  A5 A2
  clc                            ; $C84D  18
  adc #$0C                       ; $C84E  69 0C
  sta a:_var_020a_indexed        ; $C850  8D 0A 02

_label_c853:
  lda _var_0076                  ; $C853  A5 76
  bne _label_c869                ; $C855  D0 12
  lda #$10                       ; $C857  A9 10
  sta a:_var_0208_indexed        ; $C859  8D 08 02
  lda #$12                       ; $C85C  A9 12
  sta a:_var_020b_indexed        ; $C85E  8D 0B 02
  lda #$03                       ; $C861  A9 03
  sta a:_var_0209_indexed        ; $C863  8D 09 02
  jmp _label_c878                ; $C866  4C 78 C8

_label_c869:
  lda #$12                       ; $C869  A9 12
  sta a:_var_0208_indexed        ; $C86B  8D 08 02
  lda #$10                       ; $C86E  A9 10
  sta a:_var_020b_indexed        ; $C870  8D 0B 02
  lda #$43                       ; $C873  A9 43
  sta a:_var_0209_indexed        ; $C875  8D 09 02

_label_c878:
  lda #$00                       ; $C878  A9 00
  sta a:_var_020c_indexed        ; $C87A  8D 0C 02
  lda a:_var_0207_indexed        ; $C87D  AD 07 02
  sta _var_00a1                  ; $C880  85 A1
  lda a:_var_020a_indexed        ; $C882  AD 0A 02
  sta _var_00a2                  ; $C885  85 A2
  jsr _func_d063                 ; $C887  20 63 D0
  lda _var_0056                  ; $C88A  A5 56
  sta _var_00b0_indexed          ; $C88C  85 B0
  lda _var_005b                  ; $C88E  A5 5B
  sta _var_00bb_indexed          ; $C890  85 BB
  jsr _func_d383                 ; $C892  20 83 D3
  lda _var_0047                  ; $C895  A5 47
  bne _label_c8c1                ; $C897  D0 28
  lda _var_00b0_indexed          ; $C899  A5 B0
  sta _var_0056                  ; $C89B  85 56
  lda _var_00bb_indexed          ; $C89D  A5 BB
  sta _var_005b                  ; $C89F  85 5B
  jsr _func_d0c7                 ; $C8A1  20 C7 D0
  lda _var_0052                  ; $C8A4  A5 52
  sta _var_00da_indexed          ; $C8A6  85 DA
  lda _var_00da_indexed          ; $C8A8  A5 DA
  clc                            ; $C8AA  18
  adc #$01                       ; $C8AB  69 01
  sta _var_00da_indexed          ; $C8AD  85 DA
  lda #$01                       ; $C8AF  A9 01
  sta _var_0024                  ; $C8B1  85 24
  sta _var_0078                  ; $C8B3  85 78
  sta _var_007a                  ; $C8B5  85 7A
  sta _var_0060                  ; $C8B7  85 60
  inc a:_var_010e                ; $C8B9  EE 0E 01
  lda #$00                       ; $C8BC  A9 00
  sta _var_0076                  ; $C8BE  85 76
  rts                            ; $C8C0  60

_label_c8c1:
  lda #$EF                       ; $C8C1  A9 EF
  sta a:_var_0207_indexed        ; $C8C3  8D 07 02
  sta a:_var_0208_indexed        ; $C8C6  8D 08 02
  lda #$00                       ; $C8C9  A9 00
  sta _var_0076                  ; $C8CB  85 76
  rts                            ; $C8CD  60

_func_c8ce:
  lda _var_0078                  ; $C8CE  A5 78
  bne _label_c8d3                ; $C8D0  D0 01
  rts                            ; $C8D2  60

_label_c8d3:
  lda _var_004b                  ; $C8D3  A5 4B
  and #$0C                       ; $C8D5  29 0C
  sta _var_004b                  ; $C8D7  85 4B
  lda #$00                       ; $C8D9  A9 00
  sta _var_0032                  ; $C8DB  85 32
  lda _var_0067                  ; $C8DD  A5 67
  sta _var_0079                  ; $C8DF  85 79
  lda _var_005c                  ; $C8E1  A5 5C
  bne _label_c8f9                ; $C8E3  D0 14
  lda _var_006f                  ; $C8E5  A5 6F
  beq _label_c8ec                ; $C8E7  F0 03
  jsr _func_bc42                 ; $C8E9  20 42 BC

_label_c8ec:
  lda #$00                       ; $C8EC  A9 00
  sta _var_004e                  ; $C8EE  85 4E
  inc a:_var_0620                ; $C8F0  EE 20 06
  jsr _func_c2d0                 ; $C8F3  20 D0 C2
  inc _var_005c                  ; $C8F6  E6 5C
  rts                            ; $C8F8  60

_label_c8f9:
  cmp #$01                       ; $C8F9  C9 01
  beq _label_c900                ; $C8FB  F0 03
  jmp _label_c994                ; $C8FD  4C 94 C9

_label_c900:
  inc _var_0032                  ; $C900  E6 32
  jsr _func_c2d0                 ; $C902  20 D0 C2
  lda a:_var_0200_indexed        ; $C905  AD 00 02
  sec                            ; $C908  38
  sbc a:_var_0207_indexed        ; $C909  ED 07 02
  cmp #$08                       ; $C90C  C9 08
  bcc _label_c91e                ; $C90E  90 0E
  cmp #$10                       ; $C910  C9 10
  beq _label_c91b                ; $C912  F0 07
  bcs _label_c948                ; $C914  B0 32
  inc _var_009d                  ; $C916  E6 9D
  jmp _label_c91e                ; $C918  4C 1E C9

_label_c91b:
  inc a:_var_06bf                ; $C91B  EE BF 06

_label_c91e:
  lda _var_0065                  ; $C91E  A5 65
  clc                            ; $C920  18
  adc a:_var_0207_indexed        ; $C921  6D 07 02
  and #$07                       ; $C924  29 07
  cmp #$07                       ; $C926  C9 07
  bne _label_c948                ; $C928  D0 1E
  lda a:_var_0207_indexed        ; $C92A  AD 07 02
  sta _var_00a1                  ; $C92D  85 A1
  lda a:_var_020a_indexed        ; $C92F  AD 0A 02
  sta _var_00a2                  ; $C932  85 A2
  jsr _func_d063                 ; $C934  20 63 D0
  jsr _func_d383                 ; $C937  20 83 D3
  lda #$00                       ; $C93A  A9 00
  sta _var_009d                  ; $C93C  85 9D
  lda _var_0047                  ; $C93E  A5 47
  beq _label_c948                ; $C940  F0 06

_label_c942:
  dec _var_0091                  ; $C942  C6 91
  jsr _func_dfc7                 ; $C944  20 C7 DF
  rts                            ; $C947  60

_label_c948:
  lda a:_var_0200_indexed        ; $C948  AD 00 02
  sec                            ; $C94B  38
  sbc a:_var_0207_indexed        ; $C94C  ED 07 02
  cmp #$10                       ; $C94F  C9 10
  bne _label_c960                ; $C951  D0 0D
  ldx #$07                       ; $C953  A2 07
  lda a:_var_0369_indexed        ; $C955  AD 69 03

_label_c958:
  cmp a:_data_e939_indexed,X     ; $C958  DD 39 E9
  beq _label_c942                ; $C95B  F0 E5
  dex                            ; $C95D  CA
  bpl _label_c958                ; $C95E  10 F8

_label_c960:
  lda a:_var_0207_indexed        ; $C960  AD 07 02
  clc                            ; $C963  18
  adc #$10                       ; $C964  69 10
  cmp a:_var_0200_indexed        ; $C966  CD 00 02
  beq _label_c974                ; $C969  F0 09
  bcc _label_c974                ; $C96B  90 07
  sec                            ; $C96D  38
  sbc #$11                       ; $C96E  E9 11
  sta a:_var_0207_indexed        ; $C970  8D 07 02
  rts                            ; $C973  60

_label_c974:
  lda #$02                       ; $C974  A9 02
  sta _var_0032                  ; $C976  85 32
  jsr _func_c2d0                 ; $C978  20 D0 C2
  lda _var_0067                  ; $C97B  A5 67
  beq _label_c988                ; $C97D  F0 09
  lda a:_var_020a_indexed        ; $C97F  AD 0A 02
  clc                            ; $C982  18
  adc #$08                       ; $C983  69 08
  jmp _label_c98e                ; $C985  4C 8E C9

_label_c988:
  lda a:_var_020a_indexed        ; $C988  AD 0A 02
  sec                            ; $C98B  38
  sbc #$08                       ; $C98C  E9 08

_label_c98e:
  sta a:_var_020a_indexed        ; $C98E  8D 0A 02
  inc _var_005c                  ; $C991  E6 5C
  rts                            ; $C993  60

_label_c994:
  lda _var_0067                  ; $C994  A5 67
  beq _label_c9a1                ; $C996  F0 09
  lda a:_var_020a_indexed        ; $C998  AD 0A 02
  clc                            ; $C99B  18
  adc #$04                       ; $C99C  69 04
  jmp _label_c9a7                ; $C99E  4C A7 C9

_label_c9a1:
  lda a:_var_020a_indexed        ; $C9A1  AD 0A 02
  sec                            ; $C9A4  38
  sbc #$04                       ; $C9A5  E9 04

_label_c9a7:
  sta a:_var_020a_indexed        ; $C9A7  8D 0A 02
  lda #$03                       ; $C9AA  A9 03
  sta _var_0032                  ; $C9AC  85 32
  jsr _func_c2d0                 ; $C9AE  20 D0 C2
  ldx #$03                       ; $C9B1  A2 03
  lda a:_var_0372                ; $C9B3  AD 72 03

_label_c9b6:
  cmp a:_data_c9d2_indexed,X     ; $C9B6  DD D2 C9
  beq _label_c9c7                ; $C9B9  F0 0C
  dex                            ; $C9BB  CA
  bpl _label_c9b6                ; $C9BC  10 F8
  lda a:_var_0207_indexed        ; $C9BE  AD 07 02
  clc                            ; $C9C1  18
  adc #$04                       ; $C9C2  69 04
  sta a:_var_0207_indexed        ; $C9C4  8D 07 02

_label_c9c7:
  lda #$00                       ; $C9C7  A9 00
  sta _var_0078                  ; $C9C9  85 78
  sta _var_005c                  ; $C9CB  85 5C
  inc _var_0077                  ; $C9CD  E6 77
  dec _var_0091                  ; $C9CF  C6 91
  rts                            ; $C9D1  60

_data_c9d2_indexed:
.byte $f4, $f5, $fa, $fb         ; $C9D2

_func_c9d6:
  lda _var_0077                  ; $C9D6  A5 77
  beq _label_ca10                ; $C9D8  F0 36
  lda a:_var_0200_indexed        ; $C9DA  AD 00 02
  sec                            ; $C9DD  38
  sbc #$0C                       ; $C9DE  E9 0C
  sta a:_var_0207_indexed        ; $C9E0  8D 07 02
  lda a:_var_0203_indexed        ; $C9E3  AD 03 02
  sta a:_var_020a_indexed        ; $C9E6  8D 0A 02
  lda _var_0067                  ; $C9E9  A5 67
  cmp _var_0079                  ; $C9EB  C5 79
  beq _label_ca10                ; $C9ED  F0 21
  lda _var_0067                  ; $C9EF  A5 67
  sta _var_0079                  ; $C9F1  85 79
  ldx #$00                       ; $C9F3  A2 00
  lda a:_var_0209_indexed        ; $C9F5  AD 09 02
  and #$40                       ; $C9F8  29 40
  bne _label_c9fe                ; $C9FA  D0 02
  ldx #$03                       ; $C9FC  A2 03

_label_c9fe:
  lda a:_data_ca11_indexed,X     ; $C9FE  BD 11 CA
  sta a:_var_0209_indexed        ; $CA01  8D 09 02
  lda a:_data_ca12_indexed,X     ; $CA04  BD 12 CA
  sta a:_var_0208_indexed        ; $CA07  8D 08 02
  lda a:_data_ca13_indexed,X     ; $CA0A  BD 13 CA
  sta a:_var_020b_indexed        ; $CA0D  8D 0B 02

_label_ca10:
  rts                            ; $CA10  60

_data_ca11_indexed:
.byte $03                        ; $CA11

_data_ca12_indexed:
.byte $10                        ; $CA12

_data_ca13_indexed:
.byte $12, $43, $12, $10         ; $CA13

_func_ca17:
  lda _var_007a                  ; $CA17  A5 7A
  cmp #$02                       ; $CA19  C9 02
  bne _label_ca3c                ; $CA1B  D0 1F
  lda _var_007b                  ; $CA1D  A5 7B
  bne _label_ca3d                ; $CA1F  D0 1C
  inc _var_004e                  ; $CA21  E6 4E
  inc a:_var_061f                ; $CA23  EE 1F 06
  lda #$02                       ; $CA26  A9 02
  sta _var_0032                  ; $CA28  85 32
  jsr _func_c2d0                 ; $CA2A  20 D0 C2
  lda #$00                       ; $CA2D  A9 00
  sta _var_0077                  ; $CA2F  85 77
  lda a:_var_0207_indexed        ; $CA31  AD 07 02
  sec                            ; $CA34  38
  sbc #$04                       ; $CA35  E9 04
  sta a:_var_0207_indexed        ; $CA37  8D 07 02
  inc _var_007b                  ; $CA3A  E6 7B

_label_ca3c:
  rts                            ; $CA3C  60

_label_ca3d:
  lda _var_007b                  ; $CA3D  A5 7B
  cmp #$02                       ; $CA3F  C9 02
  beq _label_ca6d                ; $CA41  F0 2A
  lda #$01                       ; $CA43  A9 01
  sta _var_0032                  ; $CA45  85 32
  jsr _func_c2d0                 ; $CA47  20 D0 C2
  lda a:_var_020a_indexed        ; $CA4A  AD 0A 02
  and #$07                       ; $CA4D  29 07
  sta _var_002d_indexed          ; $CA4F  85 2D
  lda _var_0067                  ; $CA51  A5 67
  beq _label_ca5e                ; $CA53  F0 09
  lda a:_var_020a_indexed        ; $CA55  AD 0A 02
  sec                            ; $CA58  38
  sbc _var_002d_indexed          ; $CA59  E5 2D
  jmp _label_ca64                ; $CA5B  4C 64 CA

_label_ca5e:
  lda a:_var_020a_indexed        ; $CA5E  AD 0A 02
  clc                            ; $CA61  18
  adc _var_002d_indexed          ; $CA62  65 2D

_label_ca64:
  sta a:_var_020a_indexed        ; $CA64  8D 0A 02
  jsr _func_caab                 ; $CA67  20 AB CA
  inc _var_007b                  ; $CA6A  E6 7B
  rts                            ; $CA6C  60

_label_ca6d:
  jsr _func_e303                 ; $CA6D  20 03 E3
  lda _var_007b                  ; $CA70  A5 7B
  beq _label_caa8                ; $CA72  F0 34
  lda #$00                       ; $CA74  A9 00
  sta _var_0032                  ; $CA76  85 32
  jsr _func_c2d0                 ; $CA78  20 D0 C2
  lda _var_0067                  ; $CA7B  A5 67
  beq _label_ca88                ; $CA7D  F0 09
  lda a:_var_020a_indexed        ; $CA7F  AD 0A 02
  sec                            ; $CA82  38
  sbc #$08                       ; $CA83  E9 08
  jmp _label_ca8e                ; $CA85  4C 8E CA

_label_ca88:
  lda a:_var_020a_indexed        ; $CA88  AD 0A 02
  clc                            ; $CA8B  18
  adc #$08                       ; $CA8C  69 08

_label_ca8e:
  sta a:_var_020a_indexed        ; $CA8E  8D 0A 02
  jsr _func_caab                 ; $CA91  20 AB CA
  lda a:_var_0207_indexed        ; $CA94  AD 07 02
  clc                            ; $CA97  18
  adc #$01                       ; $CA98  69 01
  sta a:_var_0207_indexed        ; $CA9A  8D 07 02
  jsr _func_c29c                 ; $CA9D  20 9C C2
  lda #$00                       ; $CAA0  A9 00
  sta _var_007a                  ; $CAA2  85 7A
  sta _var_007b                  ; $CAA4  85 7B
  sta _var_00a4                  ; $CAA6  85 A4

_label_caa8:
  inc _var_0024                  ; $CAA8  E6 24
  rts                            ; $CAAA  60

_func_caab:
  ldx #$05                       ; $CAAB  A2 05

_label_caad:
  lda a:_var_0101_indexed,X      ; $CAAD  BD 01 01
  bne _label_cab6                ; $CAB0  D0 04
  dex                            ; $CAB2  CA
  bpl _label_caad                ; $CAB3  10 F8

_label_cab5:
  rts                            ; $CAB5  60

_label_cab6:
  cpx #$03                       ; $CAB6  E0 03
  bcs _label_cab5                ; $CAB8  B0 FB
  lda _var_0070_indexed,X        ; $CABA  B5 70
  bne _label_cacc                ; $CABC  D0 0E
  lda _var_0067                  ; $CABE  A5 67
  beq _label_cab5                ; $CAC0  F0 F3
  lda a:_var_020a_indexed        ; $CAC2  AD 0A 02
  sec                            ; $CAC5  38
  sbc #$03                       ; $CAC6  E9 03
  sta a:_var_020a_indexed        ; $CAC8  8D 0A 02
  rts                            ; $CACB  60

_label_cacc:
  lda _var_0067                  ; $CACC  A5 67
  bne _label_cab5                ; $CACE  D0 E5
  lda a:_var_020a_indexed        ; $CAD0  AD 0A 02
  clc                            ; $CAD3  18
  adc #$03                       ; $CAD4  69 03
  sta a:_var_020a_indexed        ; $CAD6  8D 0A 02
  rts                            ; $CAD9  60

_func_cada:
  ldy #$09                       ; $CADA  A0 09

_label_cadc:
  lda a:_var_00c6_indexed,Y      ; $CADC  B9 C6 00
  bne _label_cae5                ; $CADF  D0 04

_label_cae1:
  dey                            ; $CAE1  88
  bpl _label_cadc                ; $CAE2  10 F8
  rts                            ; $CAE4  60

_label_cae5:
  tya                            ; $CAE5  98
  tax                            ; $CAE6  AA
  jsr _func_d487                 ; $CAE7  20 87 D4
  lda a:_var_0210_indexed,X      ; $CAEA  BD 10 02
  and #$40                       ; $CAED  29 40
  beq _label_cb04                ; $CAEF  F0 13
  lda #$FF                       ; $CAF1  A9 FF
  sta _var_0057                  ; $CAF3  85 57
  lda #$32                       ; $CAF5  A9 32
  sta _var_0058                  ; $CAF7  85 58
  lda #$31                       ; $CAF9  A9 31
  sta _var_0059                  ; $CAFB  85 59
  lda #$34                       ; $CAFD  A9 34
  sta _var_005a                  ; $CAFF  85 5A
  jmp _label_cb14                ; $CB01  4C 14 CB

_label_cb04:
  lda #$30                       ; $CB04  A9 30
  sta _var_0057                  ; $CB06  85 57
  lda #$FF                       ; $CB08  A9 FF
  sta _var_0058                  ; $CB0A  85 58
  lda #$35                       ; $CB0C  A9 35
  sta _var_0059                  ; $CB0E  85 59
  lda #$33                       ; $CB10  A9 33
  sta _var_005a                  ; $CB12  85 5A

_label_cb14:
  lda _var_0057                  ; $CB14  A5 57
  cmp #$FF                       ; $CB16  C9 FF
  bne _label_cb23                ; $CB18  D0 09
  lda a:_var_00bc_indexed,Y      ; $CB1A  B9 BC 00
  clc                            ; $CB1D  18
  adc #$01                       ; $CB1E  69 01
  sta a:_var_00bc_indexed,Y      ; $CB20  99 BC 00

_label_cb23:
  lda a:_var_00b1_indexed,Y      ; $CB23  B9 B1 00
  sta PPU_ADDR                   ; $CB26  8D 06 20
  lda a:_var_00bc_indexed,Y      ; $CB29  B9 BC 00
  sta PPU_ADDR                   ; $CB2C  8D 06 20
  lda _var_0057                  ; $CB2F  A5 57
  cmp #$FF                       ; $CB31  C9 FF
  beq _label_cb38                ; $CB33  F0 03
  sta PPU_DATA                   ; $CB35  8D 07 20

_label_cb38:
  lda _var_0058                  ; $CB38  A5 58
  cmp #$FF                       ; $CB3A  C9 FF
  beq _label_cb50                ; $CB3C  F0 12
  sta PPU_DATA                   ; $CB3E  8D 07 20
  lda _var_0057                  ; $CB41  A5 57
  cmp #$FF                       ; $CB43  C9 FF
  bne _label_cb50                ; $CB45  D0 09
  lda a:_var_00bc_indexed,Y      ; $CB47  B9 BC 00
  sec                            ; $CB4A  38
  sbc #$01                       ; $CB4B  E9 01
  sta a:_var_00bc_indexed,Y      ; $CB4D  99 BC 00

_label_cb50:
  lda a:_var_00bc_indexed,Y      ; $CB50  B9 BC 00
  clc                            ; $CB53  18
  adc #$20                       ; $CB54  69 20
  sta a:_var_00bc_indexed,Y      ; $CB56  99 BC 00
  bcc _label_cb64                ; $CB59  90 09
  lda a:_var_00b1_indexed,Y      ; $CB5B  B9 B1 00
  clc                            ; $CB5E  18
  adc #$01                       ; $CB5F  69 01
  sta a:_var_00b1_indexed,Y      ; $CB61  99 B1 00

_label_cb64:
  lda a:_var_00b1_indexed,Y      ; $CB64  B9 B1 00
  cmp #$2B                       ; $CB67  C9 2B
  bne _label_cb7c                ; $CB69  D0 11
  lda a:_var_00bc_indexed,Y      ; $CB6B  B9 BC 00
  cmp #$C0                       ; $CB6E  C9 C0
  bcc _label_cb7c                ; $CB70  90 0A
  and #$1F                       ; $CB72  29 1F
  sta a:_var_00bc_indexed,Y      ; $CB74  99 BC 00
  lda #$20                       ; $CB77  A9 20
  sta a:_var_00b1_indexed,Y      ; $CB79  99 B1 00

_label_cb7c:
  lda a:_var_00b1_indexed,Y      ; $CB7C  B9 B1 00
  sta PPU_ADDR                   ; $CB7F  8D 06 20
  lda a:_var_00bc_indexed,Y      ; $CB82  B9 BC 00
  sta PPU_ADDR                   ; $CB85  8D 06 20
  lda _var_0059                  ; $CB88  A5 59
  sta PPU_DATA                   ; $CB8A  8D 07 20
  lda _var_005a                  ; $CB8D  A5 5A
  sta PPU_DATA                   ; $CB8F  8D 07 20
  lda #$00                       ; $CB92  A9 00
  sta _var_0060                  ; $CB94  85 60
  lda #$00                       ; $CB96  A9 00
  sta a:_var_00c6_indexed,Y      ; $CB98  99 C6 00
  lda #$EF                       ; $CB9B  A9 EF
  sta a:_var_020e_indexed,X      ; $CB9D  9D 0E 02
  sta a:_var_020f_indexed,X      ; $CBA0  9D 0F 02
  jmp _label_cae1                ; $CBA3  4C E1 CA

_func_cba6:
  lda _var_0050                  ; $CBA6  A5 50
  and #$04                       ; $CBA8  29 04
  bne _label_cbb5                ; $CBAA  D0 09
  lda a:_var_0202_indexed        ; $CBAC  AD 02 02
  and #$FC                       ; $CBAF  29 FC
  sta a:_var_0202_indexed        ; $CBB1  8D 02 02
  rts                            ; $CBB4  60

_label_cbb5:
  lda a:_var_0202_indexed        ; $CBB5  AD 02 02
  and #$FC                       ; $CBB8  29 FC
  clc                            ; $CBBA  18
  adc #$02                       ; $CBBB  69 02
  sta a:_var_0202_indexed        ; $CBBD  8D 02 02
  rts                            ; $CBC0  60

_func_cbc1:
  lda _var_004b                  ; $CBC1  A5 4B
  and #$F0                       ; $CBC3  29 F0
  bne _label_cbff                ; $CBC5  D0 38
  inc a:_var_010d                ; $CBC7  EE 0D 01
  lda a:_var_010d                ; $CBCA  AD 0D 01
  cmp #$14                       ; $CBCD  C9 14
  bne _label_cc04                ; $CBCF  D0 33
  lda a:_var_0201_indexed        ; $CBD1  AD 01 02
  cmp #$08                       ; $CBD4  C9 08
  beq _label_cbff                ; $CBD6  F0 27
  cmp #$0A                       ; $CBD8  C9 0A
  beq _label_cbff                ; $CBDA  F0 23
  cmp #$14                       ; $CBDC  C9 14
  beq _label_cbff                ; $CBDE  F0 1F
  ldx #$00                       ; $CBE0  A2 00
  lda _var_0067                  ; $CBE2  A5 67
  beq _label_cbec                ; $CBE4  F0 06
  inx                            ; $CBE6  E8
  lda #$40                       ; $CBE7  A9 40
  sta a:_var_0202_indexed        ; $CBE9  8D 02 02

_label_cbec:
  lda _var_0077                  ; $CBEC  A5 77
  beq _label_cbf3                ; $CBEE  F0 03
  inx                            ; $CBF0  E8
  inx                            ; $CBF1  E8
  inx                            ; $CBF2  E8

_label_cbf3:
  lda a:_data_cc05_indexed,X     ; $CBF3  BD 05 CC
  sta a:_var_0201_indexed        ; $CBF6  8D 01 02
  lda a:_data_cc06_indexed,X     ; $CBF9  BD 06 CC
  sta a:_var_0204_indexed        ; $CBFC  8D 04 02

_label_cbff:
  lda #$00                       ; $CBFF  A9 00
  sta a:_var_010d                ; $CC01  8D 0D 01

_label_cc04:
  rts                            ; $CC04  60

_data_cc05_indexed:
.byte $00                        ; $CC05

_data_cc06_indexed:
.byte $02, $00, $24, $26, $24    ; $CC06

_func_cc0b:
  jsr _func_e4ca                 ; $CC0B  20 CA E4
  jsr _func_cada                 ; $CC0E  20 DA CA
  lda _var_0042                  ; $CC11  A5 42
  beq _label_cc18                ; $CC13  F0 03
  jsr _func_d02c                 ; $CC15  20 2C D0

_label_cc18:
  lda _var_006f                  ; $CC18  A5 6F
  beq _label_cc1f                ; $CC1A  F0 03
  jsr _func_b92b                 ; $CC1C  20 2B B9

_label_cc1f:
  lda _var_0098                  ; $CC1F  A5 98
  beq _label_cc26                ; $CC21  F0 03
  jsr _func_f3ef                 ; $CC23  20 EF F3

_label_cc26:
  lda _var_002b                  ; $CC26  A5 2B
  bne _label_cc2d                ; $CC28  D0 03
  jsr _func_a021                 ; $CC2A  20 21 A0

_label_cc2d:
  lda a:_var_06bb                ; $CC2D  AD BB 06
  beq _label_cc35                ; $CC30  F0 03
  jsr _func_c029                 ; $CC32  20 29 C0

_label_cc35:
  lda _var_007f                  ; $CC35  A5 7F
  beq _label_cc3c                ; $CC37  F0 03
  jsr _func_a003                 ; $CC39  20 03 A0

_label_cc3c:
  lda _var_001d                  ; $CC3C  A5 1D
  sta PPU_CTRL                   ; $CC3E  8D 00 20
  lda #$00                       ; $CC41  A9 00
  sta PPU_SCROLL                 ; $CC43  8D 05 20
  lda _var_0065                  ; $CC46  A5 65
  sta _var_0064                  ; $CC48  85 64
  sta PPU_SCROLL                 ; $CC4A  8D 05 20
  jsr _func_f4b6                 ; $CC4D  20 B6 F4
  ldx #$01                       ; $CC50  A2 01
  stx JOYPAD1                    ; $CC52  8E 16 40
  lda #$00                       ; $CC55  A9 00
  sta JOYPAD1                    ; $CC57  8D 16 40

_label_cc5a:
  ldy #$08                       ; $CC5A  A0 08

_label_cc5c:
  lda JOYPAD1,X                  ; $CC5C  BD 16 40
  and #$03                       ; $CC5F  29 03
  cmp #$01                       ; $CC61  C9 01
  ror _var_0033_indexed,X        ; $CC63  76 33
  dey                            ; $CC65  88
  bne _label_cc5c                ; $CC66  D0 F4
  ldy _var_0033_indexed,X        ; $CC68  B4 33
  lda _var_0035_indexed,X        ; $CC6A  B5 35
  eor #$FF                       ; $CC6C  49 FF
  pha                            ; $CC6E  48
  and _var_0049_indexed,X        ; $CC6F  35 49
  and _var_0033_indexed,X        ; $CC71  35 33
  and _var_0037_indexed,X        ; $CC73  35 37
  sta _var_0033_indexed,X        ; $CC75  95 33
  pla                            ; $CC77  68
  sta _var_0037_indexed,X        ; $CC78  95 37
  lda _var_0049_indexed,X        ; $CC7A  B5 49
  sta _var_0035_indexed,X        ; $CC7C  95 35
  tya                            ; $CC7E  98
  sta _var_0049_indexed,X        ; $CC7F  95 49
  dex                            ; $CC81  CA
  bpl _label_cc5a                ; $CC82  10 D6
  ldx _var_0049_indexed          ; $CC84  A6 49
  stx _var_004b                  ; $CC86  86 4B
  lda _var_007e                  ; $CC88  A5 7E
  bne _label_cc98                ; $CC8A  D0 0C
  inc _var_0050                  ; $CC8C  E6 50
  bne _label_cc98                ; $CC8E  D0 08
  inc _var_0051                  ; $CC90  E6 51
  inc _var_0092                  ; $CC92  E6 92
  inc _var_0094                  ; $CC94  E6 94
  inc _var_0097                  ; $CC96  E6 97

_label_cc98:
  inc a:_var_06a4                ; $CC98  EE A4 06
  lda _var_0041                  ; $CC9B  A5 41
  bne _label_cca4                ; $CC9D  D0 05
  lda #$80                       ; $CC9F  A9 80
  sta _var_0041                  ; $CCA1  85 41
  rts                            ; $CCA3  60

_label_cca4:
  lda #$00                       ; $CCA4  A9 00
  sta _var_0041                  ; $CCA6  85 41
  rts                            ; $CCA8  60

_func_cca9:
  lda _var_004d                  ; $CCA9  A5 4D
  beq _label_ccc0                ; $CCAB  F0 13
  cmp #$01                       ; $CCAD  C9 01
  beq _label_ccb9                ; $CCAF  F0 08
  lda _var_0056                  ; $CCB1  A5 56
  sec                            ; $CCB3  38
  sbc #$40                       ; $CCB4  E9 40
  sta _var_0056                  ; $CCB6  85 56
  rts                            ; $CCB8  60

_label_ccb9:
  lda _var_0056                  ; $CCB9  A5 56
  clc                            ; $CCBB  18
  adc #$40                       ; $CCBC  69 40
  sta _var_0056                  ; $CCBE  85 56

_label_ccc0:
  rts                            ; $CCC0  60

_func_ccc1:
  lda _var_001f_indexed          ; $CCC1  A5 1F
  cmp #$80                       ; $CCC3  C9 80
  bcs _label_cccf                ; $CCC5  B0 08
  lda _var_0091                  ; $CCC7  A5 91
  cmp #$FF                       ; $CCC9  C9 FF
  bne _label_ccd0                ; $CCCB  D0 03
  inc _var_0085                  ; $CCCD  E6 85

_label_cccf:
  rts                            ; $CCCF  60

_label_ccd0:
  ldx #$00                       ; $CCD0  A2 00
  ldy #$00                       ; $CCD2  A0 00

_label_ccd4:
  lda #$0F                       ; $CCD4  A9 0F
  sta a:_var_0262_indexed,X      ; $CCD6  9D 62 02
  lda #$01                       ; $CCD9  A9 01
  sta a:_var_0264_indexed,X      ; $CCDB  9D 64 02
  lda a:_data_cd37_indexed,Y     ; $CCDE  B9 37 CD
  sta a:_var_0265_indexed,X      ; $CCE1  9D 65 02
  lda #$00                       ; $CCE4  A9 00
  sta a:_var_0267_indexed,X      ; $CCE6  9D 67 02
  cpy #$03                       ; $CCE9  C0 03
  beq _label_cd02                ; $CCEB  F0 15
  lda a:_data_cd31_indexed,Y     ; $CCED  B9 31 CD
  sta a:_var_0263_indexed,X      ; $CCF0  9D 63 02
  lda a:_data_cd34_indexed,Y     ; $CCF3  B9 34 CD
  sta a:_var_0266_indexed,X      ; $CCF6  9D 66 02
  iny                            ; $CCF9  C8
  txa                            ; $CCFA  8A
  clc                            ; $CCFB  18
  adc #$07                       ; $CCFC  69 07
  tax                            ; $CCFE  AA
  jmp _label_ccd4                ; $CCFF  4C D4 CC

_label_cd02:
  ldx #$00                       ; $CD02  A2 00
  lda _var_0091                  ; $CD04  A5 91

_label_cd06:
  sec                            ; $CD06  38
  sbc #$0A                       ; $CD07  E9 0A
  bcc _label_cd0f                ; $CD09  90 04
  inx                            ; $CD0B  E8
  jmp _label_cd06                ; $CD0C  4C 06 CD

_label_cd0f:
  clc                            ; $CD0F  18
  adc #$0A                       ; $CD10  69 0A
  tay                            ; $CD12  A8
  cpx #$00                       ; $CD13  E0 00
  bne _label_cd19                ; $CD15  D0 02
  ldx #$0A                       ; $CD17  A2 0A

_label_cd19:
  lda a:_data_cd26_indexed,X     ; $CD19  BD 26 CD
  sta a:$0278                    ; $CD1C  8D 78 02
  lda a:_data_cd26_indexed,Y     ; $CD1F  B9 26 CD
  sta a:$027B                    ; $CD22  8D 7B 02
  rts                            ; $CD25  60

_data_cd26_indexed:
.byte $cc, $ce, $d0, $d2, $d4, $d6, $d8, $da, $dc, $de, $c8 ; $CD26

_data_cd31_indexed:
.byte $f0, $e6, $e8              ; $CD31

_data_cd34_indexed:
.byte $e4, $f8, $c8              ; $CD34

_data_cd37_indexed:
.byte $10, $20, $30, $40         ; $CD37

_func_cd3b:
  lda _var_0043                  ; $CD3B  A5 43
  beq _label_cd43                ; $CD3D  F0 04
  lda _var_0046                  ; $CD3F  A5 46
  beq _label_cd9c                ; $CD41  F0 59

_label_cd43:
  lda _var_009c                  ; $CD43  A5 9C
  beq _label_cd4f                ; $CD45  F0 08
  lda #$00                       ; $CD47  A9 00
  sta _var_009c                  ; $CD49  85 9C
  lda #$38                       ; $CD4B  A9 38
  sta _var_008f                  ; $CD4D  85 8F

_label_cd4f:
  lda _var_0077                  ; $CD4F  A5 77
  bne _label_cd6e                ; $CD51  D0 1B
  ldx #$03                       ; $CD53  A2 03
  lda a:_var_036c                ; $CD55  AD 6C 03

_label_cd58:
  cmp a:_data_cec3_indexed,X     ; $CD58  DD C3 CE
  beq _label_cd9c                ; $CD5B  F0 3F
  dex                            ; $CD5D  CA
  bpl _label_cd58                ; $CD5E  10 F8
  ldx #$07                       ; $CD60  A2 07
  lda a:_var_0372                ; $CD62  AD 72 03

_label_cd65:
  cmp a:_data_cec7_indexed,X     ; $CD65  DD C7 CE
  beq _label_cd7c                ; $CD68  F0 12
  dex                            ; $CD6A  CA
  bpl _label_cd65                ; $CD6B  10 F8
  rts                            ; $CD6D  60

_label_cd6e:
  ldx #$0B                       ; $CD6E  A2 0B
  lda a:_var_0372                ; $CD70  AD 72 03

_label_cd73:
  cmp a:_data_cd9d_indexed,X     ; $CD73  DD 9D CD
  beq _label_cd7c                ; $CD76  F0 04
  dex                            ; $CD78  CA
  bpl _label_cd73                ; $CD79  10 F8
  rts                            ; $CD7B  60

_label_cd7c:
  ldx #$07                       ; $CD7C  A2 07
  lda _var_008f                  ; $CD7E  A5 8F

_label_cd80:
  cmp a:_data_cec7_indexed,X     ; $CD80  DD C7 CE
  beq _label_cd9c                ; $CD83  F0 17
  dex                            ; $CD85  CA
  bpl _label_cd80                ; $CD86  10 F8
  ldx #$03                       ; $CD88  A2 03
  lda _var_008f                  ; $CD8A  A5 8F

_label_cd8c:
  cmp a:_data_cec3_indexed,X     ; $CD8C  DD C3 CE
  beq _label_cd9c                ; $CD8F  F0 0B
  dex                            ; $CD91  CA
  bpl _label_cd8c                ; $CD92  10 F8
  lda #$07                       ; $CD94  A9 07
  sta _var_0043                  ; $CD96  85 43
  lda #$01                       ; $CD98  A9 01
  sta _var_0046                  ; $CD9A  85 46

_label_cd9c:
  rts                            ; $CD9C  60

_data_cd9d_indexed:
.byte $f0, $f1, $f2, $f3, $40, $41, $42, $43, $f4, $f5, $fa, $fb ; $CD9D

_func_cda9:
  lda _var_0067                  ; $CDA9  A5 67
  cmp _var_0069                  ; $CDAB  C5 69
  beq _label_cdb2                ; $CDAD  F0 03
  inc _var_0068                  ; $CDAF  E6 68
  rts                            ; $CDB1  60

_label_cdb2:
  lda _var_0068                  ; $CDB2  A5 68
  beq _label_cdc6                ; $CDB4  F0 10
  inc _var_0068                  ; $CDB6  E6 68
  lda #$00                       ; $CDB8  A9 00
  sta _var_0043                  ; $CDBA  85 43
  lda _var_0068                  ; $CDBC  A5 68
  cmp #$08                       ; $CDBE  C9 08
  bcc _label_cdc6                ; $CDC0  90 04
  lda #$00                       ; $CDC2  A9 00
  sta _var_0068                  ; $CDC4  85 68

_label_cdc6:
  rts                            ; $CDC6  60

_func_cdc7:
  ldx _var_00a4                  ; $CDC7  A6 A4
  jsr _func_d487                 ; $CDC9  20 87 D4
  lda a:_var_0210_indexed,X      ; $CDCC  BD 10 02
  and #$40                       ; $CDCF  29 40
  beq _label_cdda                ; $CDD1  F0 07
  lda _var_005b                  ; $CDD3  A5 5B
  clc                            ; $CDD5  18
  adc #$04                       ; $CDD6  69 04
  sta _var_005b                  ; $CDD8  85 5B

_label_cdda:
  lda _var_0052                  ; $CDDA  A5 52
  asl a                          ; $CDDC  0A
  tax                            ; $CDDD  AA
  lda a:_data_d0e5_indexed,X     ; $CDDE  BD E5 D0
  sta _var_002d_indexed          ; $CDE1  85 2D
  lda a:_data_d0e6_indexed,X     ; $CDE3  BD E6 D0
  sta _var_002e                  ; $CDE6  85 2E
  ldx _var_005b                  ; $CDE8  A6 5B
  ldy _var_0056                  ; $CDEA  A4 56
  lda (_var_002d_indexed),Y      ; $CDEC  B1 2D
  and a:_data_cdf8_indexed,X     ; $CDEE  3D F8 CD
  clc                            ; $CDF1  18
  adc a:_data_ce00_indexed,X     ; $CDF2  7D 00 CE
  sta (_var_002d_indexed),Y      ; $CDF5  91 2D
  rts                            ; $CDF7  60

_data_cdf8_indexed:
.byte $3f, $cf, $f3, $fc, $3f, $cf, $f3, $fc ; $CDF8

_data_ce00_indexed:
.byte $40, $10, $04, $01, $80, $20, $08, $02 ; $CE00

_func_ce08:
  lda _var_00ff                  ; $CE08  A5 FF
  bne _label_ce4b                ; $CE0A  D0 3F
  lda _var_009c                  ; $CE0C  A5 9C
  bne _label_ce4b                ; $CE0E  D0 3B
  ldx #$06                       ; $CE10  A2 06

_label_ce12:
  lda a:_var_0100_indexed,X      ; $CE12  BD 00 01
  bne _label_ce3b                ; $CE15  D0 24
  dex                            ; $CE17  CA
  bpl _label_ce12                ; $CE18  10 F8
  lda _var_0077                  ; $CE1A  A5 77
  beq _label_ce2b                ; $CE1C  F0 0D
  ldx #$03                       ; $CE1E  A2 03
  lda a:_var_0372                ; $CE20  AD 72 03

_label_ce23:
  cmp a:_data_cec3_indexed,X     ; $CE23  DD C3 CE
  beq _label_ce4c                ; $CE26  F0 24
  dex                            ; $CE28  CA
  bpl _label_ce23                ; $CE29  10 F8

_label_ce2b:
  ldx #$07                       ; $CE2B  A2 07
  lda a:_var_0372                ; $CE2D  AD 72 03

_label_ce30:
  cmp a:_data_cec7_indexed,X     ; $CE30  DD C7 CE
  beq _label_ce4c                ; $CE33  F0 17
  dex                            ; $CE35  CA
  bpl _label_ce30                ; $CE36  10 F8
  jmp _label_ce46                ; $CE38  4C 46 CE

_label_ce3b:
  lda #$38                       ; $CE3B  A9 38
  sta a:_var_0371                ; $CE3D  8D 71 03
  sta a:_var_0372                ; $CE40  8D 72 03
  sta a:_var_0373                ; $CE43  8D 73 03

_label_ce46:
  lda #$00                       ; $CE46  A9 00
  sta a:_var_061d                ; $CE48  8D 1D 06

_label_ce4b:
  rts                            ; $CE4B  60

_label_ce4c:
  lda _var_0077                  ; $CE4C  A5 77
  beq _label_ce9b                ; $CE4E  F0 4B
  ldy #$00                       ; $CE50  A0 00
  lda _var_0067                  ; $CE52  A5 67
  bne _label_ce58                ; $CE54  D0 02
  iny                            ; $CE56  C8
  iny                            ; $CE57  C8

_label_ce58:
  ldx #$09                       ; $CE58  A2 09
  lda a:_var_0368_indexed,Y      ; $CE5A  B9 68 03

_label_ce5d:
  cmp a:_data_e939_indexed,X     ; $CE5D  DD 39 E9
  beq _label_ce7c                ; $CE60  F0 1A
  dex                            ; $CE62  CA
  bpl _label_ce5d                ; $CE63  10 F8
  cpy #$03                       ; $CE65  C0 03
  bcs _label_ce6f                ; $CE67  B0 06
  iny                            ; $CE69  C8
  iny                            ; $CE6A  C8
  iny                            ; $CE6B  C8
  jmp _label_ce58                ; $CE6C  4C 58 CE

_label_ce6f:
  lda _var_0067                  ; $CE6F  A5 67
  bne _label_ce80                ; $CE71  D0 0D

_label_ce73:
  lda a:_var_020a_indexed        ; $CE73  AD 0A 02
  clc                            ; $CE76  18
  adc #$04                       ; $CE77  69 04
  jmp _label_ce86                ; $CE79  4C 86 CE

_label_ce7c:
  lda _var_0067                  ; $CE7C  A5 67
  bne _label_ce73                ; $CE7E  D0 F3

_label_ce80:
  lda a:_var_020a_indexed        ; $CE80  AD 0A 02
  sec                            ; $CE83  38
  sbc #$04                       ; $CE84  E9 04

_label_ce86:
  sta a:_var_020a_indexed        ; $CE86  8D 0A 02
  inc a:_var_0207_indexed        ; $CE89  EE 07 02
  lda #$00                       ; $CE8C  A9 00
  sta _var_007a                  ; $CE8E  85 7A
  sta _var_0077                  ; $CE90  85 77
  lda _var_004b                  ; $CE92  A5 4B
  and #$0E                       ; $CE94  29 0E
  sta _var_004b                  ; $CE96  85 4B
  jsr _func_c29c                 ; $CE98  20 9C C2

_label_ce9b:
  ldx #$05                       ; $CE9B  A2 05
  lda a:_var_036c                ; $CE9D  AD 6C 03

_label_cea0:
  cmp a:_data_cecf_indexed,X     ; $CEA0  DD CF CE
  beq _label_ce46                ; $CEA3  F0 A1
  dex                            ; $CEA5  CA
  bpl _label_cea0                ; $CEA6  10 F8
  lda #$10                       ; $CEA8  A9 10
  sta _var_0032                  ; $CEAA  85 32
  lda _var_0050                  ; $CEAC  A5 50
  and #$04                       ; $CEAE  29 04
  beq _label_ceb4                ; $CEB0  F0 02
  inc _var_0032                  ; $CEB2  E6 32

_label_ceb4:
  jsr _func_c2d0                 ; $CEB4  20 D0 C2
  lda _var_004b                  ; $CEB7  A5 4B
  and #$0E                       ; $CEB9  29 0E
  sta _var_004b                  ; $CEBB  85 4B
  inc a:_var_061d                ; $CEBD  EE 1D 06
  jmp _label_eaff                ; $CEC0  4C FF EA

_data_cec3_indexed:
.byte $f4, $f5, $fa, $fb         ; $CEC3

_data_cec7_indexed:
.byte $f0, $f1, $f2, $f3, $40, $41, $42, $43 ; $CEC7

_data_cecf_indexed:
.byte $f4, $f5, $f8, $f9, $fa, $fb ; $CECF

_func_ced5:
  lda _var_0056                  ; $CED5  A5 56
  and #$03                       ; $CED7  29 03
  clc                            ; $CED9  18
  ror a                          ; $CEDA  6A
  ror a                          ; $CEDB  6A
  ror a                          ; $CEDC  6A
  sta _var_00a2                  ; $CEDD  85 A2
  ldx _var_005b                  ; $CEDF  A6 5B
  lda a:_data_cf30_indexed,X     ; $CEE1  BD 30 CF
  clc                            ; $CEE4  18
  adc _var_00a2                  ; $CEE5  65 A2
  sta _var_00a2                  ; $CEE7  85 A2
  lda _var_0056                  ; $CEE9  A5 56
  and #$3C                       ; $CEEB  29 3C
  asl a                          ; $CEED  0A
  asl a                          ; $CEEE  0A
  sta _var_00a1                  ; $CEEF  85 A1
  lda _var_0052                  ; $CEF1  A5 52
  beq _label_cf0d                ; $CEF3  F0 18
  cmp #$01                       ; $CEF5  C9 01
  beq _label_cf06                ; $CEF7  F0 0D
  lda _var_00a1                  ; $CEF9  A5 A1
  clc                            ; $CEFB  18
  adc #$08                       ; $CEFC  69 08
  sta _var_00a1                  ; $CEFE  85 A1
  lda _var_0052                  ; $CF00  A5 52
  cmp #$02                       ; $CF02  C9 02
  bne _label_cf0d                ; $CF04  D0 07

_label_cf06:
  lda _var_00a2                  ; $CF06  A5 A2
  clc                            ; $CF08  18
  adc #$08                       ; $CF09  69 08
  sta _var_00a2                  ; $CF0B  85 A2

_label_cf0d:
  lda _var_0065                  ; $CF0D  A5 65
  beq _label_cf2d                ; $CF0F  F0 1C
  lda _var_0056                  ; $CF11  A5 56
  and #$40                       ; $CF13  29 40
  beq _label_cf24                ; $CF15  F0 0D

_label_cf17:
  lda #$F0                       ; $CF17  A9 F0
  sec                            ; $CF19  38
  sbc _var_0065                  ; $CF1A  E5 65
  clc                            ; $CF1C  18
  adc _var_00a1                  ; $CF1D  65 A1
  sta _var_00a1                  ; $CF1F  85 A1
  jmp _label_cf2d                ; $CF21  4C 2D CF

_label_cf24:
  lda _var_00a1                  ; $CF24  A5 A1
  sec                            ; $CF26  38
  sbc _var_0065                  ; $CF27  E5 65
  bcc _label_cf17                ; $CF29  90 EC
  sta _var_00a1                  ; $CF2B  85 A1

_label_cf2d:
  dec _var_00a1                  ; $CF2D  C6 A1
  rts                            ; $CF2F  60

_data_cf30_indexed:
.byte $00, $10, $20, $30         ; $CF30

_func_cf34:
  ldx #$00                       ; $CF34  A2 00

_label_cf36:
  lda _var_00d0_indexed,X        ; $CF36  B5 D0
  beq _label_cf40                ; $CF38  F0 06
  inx                            ; $CF3A  E8
  cpx #$0A                       ; $CF3B  E0 0A
  bne _label_cf36                ; $CF3D  D0 F7
  rts                            ; $CF3F  60

_label_cf40:
  inc _var_00d0_indexed,X        ; $CF40  F6 D0
  cpx #$0A                       ; $CF42  E0 0A
  bne _label_cf51                ; $CF44  D0 0B
  lda #$00                       ; $CF46  A9 00
  sta a:_var_013d_indexed        ; $CF48  8D 3D 01
  sta a:_var_013e                ; $CF4B  8D 3E 01
  sta a:_var_013f                ; $CF4E  8D 3F 01

_label_cf51:
  rts                            ; $CF51  60

_label_cf52:
  lda _var_006b                  ; $CF52  A5 6B
  beq _label_cf59                ; $CF54  F0 03
  jmp _label_def2                ; $CF56  4C F2 DE

_label_cf59:
  lda _var_008d_indexed          ; $CF59  A5 8D
  beq _label_cf64                ; $CF5B  F0 07
  lda #$00                       ; $CF5D  A9 00
  sta _var_008d_indexed          ; $CF5F  85 8D
  jmp _label_d5b0                ; $CF61  4C B0 D5

_label_cf64:
  ldx _var_00a4                  ; $CF64  A6 A4
  jsr _func_d487                 ; $CF66  20 87 D4
  lda _var_0065                  ; $CF69  A5 65
  clc                            ; $CF6B  18
  adc a:_var_020e_indexed,X      ; $CF6C  7D 0E 02
  and #$07                       ; $CF6F  29 07
  cmp #$06                       ; $CF71  C9 06
  bne _label_cf7a                ; $CF73  D0 05
  lda #$01                       ; $CF75  A9 01
  sta a:_var_0115                ; $CF77  8D 15 01

_label_cf7a:
  lda a:_var_020e_indexed,X      ; $CF7A  BD 0E 02
  clc                            ; $CF7D  18
  adc a:_var_0115                ; $CF7E  6D 15 01
  sta a:_var_020e_indexed,X      ; $CF81  9D 0E 02
  lda _var_0065                  ; $CF84  A5 65
  clc                            ; $CF86  18
  adc a:_var_020e_indexed,X      ; $CF87  7D 0E 02
  and #$07                       ; $CF8A  29 07
  cmp #$07                       ; $CF8C  C9 07
  bne _label_cfaa                ; $CF8E  D0 1A
  lda a:_var_020e_indexed,X      ; $CF90  BD 0E 02
  sta _var_00a1                  ; $CF93  85 A1
  lda a:_var_0213_indexed,X      ; $CF95  BD 13 02
  sta _var_004d                  ; $CF98  85 4D
  lda #$08                       ; $CF9A  A9 08
  sta _var_00a2                  ; $CF9C  85 A2
  jsr _func_d063                 ; $CF9E  20 63 D0
  jsr _func_cca9                 ; $CFA1  20 A9 CC
  lda _var_0056                  ; $CFA4  A5 56
  cmp #$78                       ; $CFA6  C9 78
  bcs _label_cff8                ; $CFA8  B0 4E

_label_cfaa:
  lda a:_var_020e_indexed,X      ; $CFAA  BD 0E 02
  cmp #$FF                       ; $CFAD  C9 FF
  bcs _label_cfb5                ; $CFAF  B0 04
  cmp #$F0                       ; $CFB1  C9 F0
  bcs _label_cfc5                ; $CFB3  B0 10

_label_cfb5:
  lda _var_00a4                  ; $CFB5  A5 A4
  cmp #$0A                       ; $CFB7  C9 0A
  beq _label_cfc0                ; $CFB9  F0 05
  inc _var_00a4                  ; $CFBB  E6 A4
  jmp _func_d0ed                 ; $CFBD  4C ED D0

_label_cfc0:
  lda #$00                       ; $CFC0  A9 00
  sta _var_00a4                  ; $CFC2  85 A4
  rts                            ; $CFC4  60

_label_cfc5:
  lda a:_var_020e_indexed,X      ; $CFC5  BD 0E 02
  cmp #$FE                       ; $CFC8  C9 FE
  bcc _label_cfd8                ; $CFCA  90 0C
  lda a:_var_0213_indexed,X      ; $CFCC  BD 13 02
  beq _label_d01a                ; $CFCF  F0 49
  cmp #$01                       ; $CFD1  C9 01
  beq _label_d01f                ; $CFD3  F0 4A
  jmp _label_cfb5                ; $CFD5  4C B5 CF

_label_cfd8:
  lda a:_var_0213_indexed,X      ; $CFD8  BD 13 02
  beq _label_cfee                ; $CFDB  F0 11
  cmp #$01                       ; $CFDD  C9 01
  beq _label_cff8                ; $CFDF  F0 17
  lda #$00                       ; $CFE1  A9 00
  sta a:_var_020e_indexed,X      ; $CFE3  9D 0E 02
  lda #$00                       ; $CFE6  A9 00
  sta a:_var_0213_indexed,X      ; $CFE8  9D 13 02
  jmp _label_cfb5                ; $CFEB  4C B5 CF

_label_cfee:
  lda _var_0065                  ; $CFEE  A5 65
  bne _label_d00d                ; $CFF0  D0 1B
  lda _var_001d                  ; $CFF2  A5 1D
  and #$02                       ; $CFF4  29 02
  bne _label_d00d                ; $CFF6  D0 15

_label_cff8:
  lda #$00                       ; $CFF8  A9 00
  sta a:_var_0213_indexed,X      ; $CFFA  9D 13 02
  ldy _var_00a4                  ; $CFFD  A4 A4
  sta a:_var_00d0_indexed,Y      ; $CFFF  99 D0 00
  lda #$EF                       ; $D002  A9 EF
  sta a:_var_020e_indexed,X      ; $D004  9D 0E 02
  sta a:_var_020f_indexed,X      ; $D007  9D 0F 02
  jmp _label_cfb5                ; $D00A  4C B5 CF

_label_d00d:
  lda #$01                       ; $D00D  A9 01
  sta a:_var_0213_indexed,X      ; $D00F  9D 13 02
  lda #$00                       ; $D012  A9 00
  sta a:_var_020e_indexed,X      ; $D014  9D 0E 02
  jmp _label_cfb5                ; $D017  4C B5 CF

_label_d01a:
  lda #$FF                       ; $D01A  A9 FF
  jmp _label_d021                ; $D01C  4C 21 D0

_label_d01f:
  lda #$00                       ; $D01F  A9 00

_label_d021:
  sta a:_var_0213_indexed,X      ; $D021  9D 13 02
  lda #$EF                       ; $D024  A9 EF
  sta a:_var_020e_indexed,X      ; $D026  9D 0E 02
  jmp _label_cfb5                ; $D029  4C B5 CF

_func_d02c:
  lda a:_var_0372                ; $D02C  AD 72 03
  sta _var_008f                  ; $D02F  85 8F
  ldx #$00                       ; $D031  A2 00
  ldy #$00                       ; $D033  A0 00

_label_d035:
  lda a:_var_0364_indexed,X      ; $D035  BD 64 03
  sta PPU_ADDR                   ; $D038  8D 06 20
  lda a:_var_0360_indexed,X      ; $D03B  BD 60 03
  sta PPU_ADDR                   ; $D03E  8D 06 20
  lda PPU_DATA                   ; $D041  AD 07 20
  lda PPU_DATA                   ; $D044  AD 07 20
  sta a:_var_0368_indexed,Y      ; $D047  99 68 03
  lda PPU_DATA                   ; $D04A  AD 07 20
  sta a:_var_0369_indexed,Y      ; $D04D  99 69 03
  lda PPU_DATA                   ; $D050  AD 07 20
  sta a:_var_036a_indexed,Y      ; $D053  99 6A 03
  iny                            ; $D056  C8
  iny                            ; $D057  C8
  iny                            ; $D058  C8
  inx                            ; $D059  E8
  cpx #$04                       ; $D05A  E0 04
  bne _label_d035                ; $D05C  D0 D7
  lda #$00                       ; $D05E  A9 00
  sta _var_0042                  ; $D060  85 42
  rts                            ; $D062  60

_func_d063:
  lda #$00                       ; $D063  A9 00
  sta _var_002e                  ; $D065  85 2E
  jsr _func_db82                 ; $D067  20 82 DB
  lda _var_00a2                  ; $D06A  A5 A2
  and #$C0                       ; $D06C  29 C0
  clc                            ; $D06E  18
  rol a                          ; $D06F  2A
  rol a                          ; $D070  2A
  rol a                          ; $D071  2A
  sta _var_0056                  ; $D072  85 56
  lda _var_0065                  ; $D074  A5 65
  bne _label_d085                ; $D076  D0 0D
  lda _var_001d                  ; $D078  A5 1D
  and #$02                       ; $D07A  29 02
  bne _label_d085                ; $D07C  D0 07
  lda _var_0056                  ; $D07E  A5 56
  clc                            ; $D080  18
  adc #$40                       ; $D081  69 40
  sta _var_0056                  ; $D083  85 56

_label_d085:
  lda _var_00a1                  ; $D085  A5 A1
  clc                            ; $D087  18
  adc #$01                       ; $D088  69 01
  clc                            ; $D08A  18
  adc _var_0065                  ; $D08B  65 65
  bcc _label_d09a                ; $D08D  90 0B
  sta _var_002e                  ; $D08F  85 2E
  lda _var_0056                  ; $D091  A5 56
  clc                            ; $D093  18
  adc #$44                       ; $D094  69 44
  sta _var_0056                  ; $D096  85 56
  lda _var_002e                  ; $D098  A5 2E

_label_d09a:
  and #$F0                       ; $D09A  29 F0
  lsr a                          ; $D09C  4A
  lsr a                          ; $D09D  4A
  clc                            ; $D09E  18
  adc _var_0056                  ; $D09F  65 56
  sta _var_0056                  ; $D0A1  85 56
  lda _var_0056                  ; $D0A3  A5 56
  cmp #$3C                       ; $D0A5  C9 3C
  beq _label_d0b5                ; $D0A7  F0 0C
  cmp #$3D                       ; $D0A9  C9 3D
  beq _label_d0b5                ; $D0AB  F0 08
  cmp #$3E                       ; $D0AD  C9 3E
  beq _label_d0b5                ; $D0AF  F0 04
  cmp #$3F                       ; $D0B1  C9 3F
  bne _label_d0bc                ; $D0B3  D0 07

_label_d0b5:
  lda _var_0056                  ; $D0B5  A5 56
  clc                            ; $D0B7  18
  adc #$04                       ; $D0B8  69 04
  sta _var_0056                  ; $D0BA  85 56

_label_d0bc:
  lda _var_00a2                  ; $D0BC  A5 A2
  and #$30                       ; $D0BE  29 30
  lsr a                          ; $D0C0  4A
  lsr a                          ; $D0C1  4A
  lsr a                          ; $D0C2  4A
  lsr a                          ; $D0C3  4A
  sta _var_005b                  ; $D0C4  85 5B
  rts                            ; $D0C6  60

_func_d0c7:
  lda _var_0052                  ; $D0C7  A5 52
  asl a                          ; $D0C9  0A
  tax                            ; $D0CA  AA
  lda a:_data_d0e5_indexed,X     ; $D0CB  BD E5 D0
  sta _var_002d_indexed          ; $D0CE  85 2D
  lda a:_data_d0e6_indexed,X     ; $D0D0  BD E6 D0
  sta _var_002e                  ; $D0D3  85 2E
  ldy _var_0056                  ; $D0D5  A4 56
  ldx _var_005b                  ; $D0D7  A6 5B
  lda (_var_002d_indexed),Y      ; $D0D9  B1 2D
  and a:_data_d0e1_indexed,X     ; $D0DB  3D E1 D0
  sta (_var_002d_indexed),Y      ; $D0DE  91 2D
  rts                            ; $D0E0  60

_data_d0e1_indexed:
.byte $3f, $cf, $f3, $fc         ; $D0E1

_data_d0e5_indexed:
.byte $00                        ; $D0E5

_data_d0e6_indexed:
.byte $04, $80, $04, $00, $05, $80, $05 ; $D0E6

_func_d0ed:
  ldx _var_00a4                  ; $D0ED  A6 A4

_label_d0ef:
  lda _var_00d0_indexed,X        ; $D0EF  B5 D0
  cmp #$02                       ; $D0F1  C9 02
  beq _label_d0ff                ; $D0F3  F0 0A
  inx                            ; $D0F5  E8
  cpx #$0A                       ; $D0F6  E0 0A
  bne _label_d0ef                ; $D0F8  D0 F5
  lda #$00                       ; $D0FA  A9 00
  sta _var_00a4                  ; $D0FC  85 A4
  rts                            ; $D0FE  60

_label_d0ff:
  txa                            ; $D0FF  8A
  tay                            ; $D100  A8
  sta _var_00a4                  ; $D101  85 A4
  jsr _func_d487                 ; $D103  20 87 D4
  lda a:_var_020e_indexed,X      ; $D106  BD 0E 02
  sta _var_009b                  ; $D109  85 9B
  sta _var_00a1                  ; $D10B  85 A1
  jsr _func_e76e                 ; $D10D  20 6E E7
  lda _var_009b                  ; $D110  A5 9B
  cmp _var_00a1                  ; $D112  C5 A1
  bcs _label_d140                ; $D114  B0 2A
  clc                            ; $D116  18
  adc _var_0065                  ; $D117  65 65
  and #$07                       ; $D119  29 07
  cmp #$06                       ; $D11B  C9 06
  bcc _label_d140                ; $D11D  90 21
  lda _var_00a1                  ; $D11F  A5 A1
  clc                            ; $D121  18
  adc _var_0065                  ; $D122  65 65
  and #$07                       ; $D124  29 07
  cmp #$02                       ; $D126  C9 02
  bcs _label_d140                ; $D128  B0 16
  lda _var_0065                  ; $D12A  A5 65
  and #$07                       ; $D12C  29 07
  sta _var_002d_indexed          ; $D12E  85 2D
  lda #$07                       ; $D130  A9 07
  sec                            ; $D132  38
  sbc _var_002d_indexed          ; $D133  E5 2D
  sta _var_002d_indexed          ; $D135  85 2D
  lda _var_00a1                  ; $D137  A5 A1
  and #$F8                       ; $D139  29 F8
  clc                            ; $D13B  18
  adc _var_002d_indexed          ; $D13C  65 2D
  sta _var_00a1                  ; $D13E  85 A1

_label_d140:
  lda _var_00a1                  ; $D140  A5 A1
  sta a:_var_020e_indexed,X      ; $D142  9D 0E 02
  txa                            ; $D145  8A
  tay                            ; $D146  A8
  lda _var_0065                  ; $D147  A5 65
  clc                            ; $D149  18
  adc a:_var_020e_indexed,X      ; $D14A  7D 0E 02
  and #$07                       ; $D14D  29 07
  cmp #$07                       ; $D14F  C9 07
  beq _label_d156                ; $D151  F0 03
  jmp _label_cf52                ; $D153  4C 52 CF

_label_d156:
  lda #$00                       ; $D156  A9 00
  sta _var_0032                  ; $D158  85 32
  lda a:_var_020e_indexed,X      ; $D15A  BD 0E 02
  cmp #$EF                       ; $D15D  C9 EF
  bcc _label_d165                ; $D15F  90 04
  inc _var_0032                  ; $D161  E6 32
  lda #$FF                       ; $D163  A9 FF

_label_d165:
  sta _var_00a1                  ; $D165  85 A1
  lda a:_var_0211_indexed,X      ; $D167  BD 11 02
  sta _var_00a2                  ; $D16A  85 A2
  jsr _func_d063                 ; $D16C  20 63 D0
  lda a:_var_0213_indexed,X      ; $D16F  BD 13 02
  sta _var_004d                  ; $D172  85 4D
  cmp #$01                       ; $D174  C9 01
  beq _label_d17e                ; $D176  F0 06
  lda _var_0032                  ; $D178  A5 32
  beq _label_d17e                ; $D17A  F0 02
  inc _var_004d                  ; $D17C  E6 4D

_label_d17e:
  jsr _func_cca9                 ; $D17E  20 A9 CC
  lda a:_var_0210_indexed,X      ; $D181  BD 10 02
  sta _var_00a3                  ; $D184  85 A3

_label_d186:
  lda #$00                       ; $D186  A9 00
  sta _var_00a9                  ; $D188  85 A9
  lda _var_00a3                  ; $D18A  A5 A3
  and #$40                       ; $D18C  29 40
  beq _label_d192                ; $D18E  F0 02
  inc _var_00a9                  ; $D190  E6 A9

_label_d192:
  lda _var_0056                  ; $D192  A5 56
  sta a:_var_06bc                ; $D194  8D BC 06
  lda _var_005b                  ; $D197  A5 5B
  sta a:_var_06ad                ; $D199  8D AD 06
  jsr _func_d407                 ; $D19C  20 07 D4
  ldy _var_0056                  ; $D19F  A4 56
  ldx _var_005b                  ; $D1A1  A6 5B
  lda #$00                       ; $D1A3  A9 00
  sta _var_002d_indexed          ; $D1A5  85 2D
  lda _var_0052                  ; $D1A7  A5 52
  cmp #$02                       ; $D1A9  C9 02
  bcs _label_d1db                ; $D1AB  B0 2E

_label_d1ad:
  lda a:_var_0480_indexed,Y      ; $D1AD  B9 80 04
  and a:_data_d2b7_indexed,X     ; $D1B0  3D B7 D2
  cmp a:_data_d2b7_indexed,X     ; $D1B3  DD B7 D2
  beq _label_d1c3                ; $D1B6  F0 0B
  lda a:_var_0380_indexed,Y      ; $D1B8  B9 80 03
  and a:_data_d2b7_indexed,X     ; $D1BB  3D B7 D2
  cmp a:_data_d2b7_indexed,X     ; $D1BE  DD B7 D2
  bne _label_d1c6                ; $D1C1  D0 03

_label_d1c3:
  jmp _label_d257                ; $D1C3  4C 57 D2

_label_d1c6:
  lda _var_002d_indexed          ; $D1C6  A5 2D
  bne _label_d1db                ; $D1C8  D0 11
  lda _var_0052                  ; $D1CA  A5 52
  bne _label_d1db                ; $D1CC  D0 0D
  cpx #$00                       ; $D1CE  E0 00
  bne _label_d1d5                ; $D1D0  D0 03
  dey                            ; $D1D2  88
  ldx #$04                       ; $D1D3  A2 04

_label_d1d5:
  dex                            ; $D1D5  CA
  inc _var_002d_indexed          ; $D1D6  E6 2D
  jmp _label_d1ad                ; $D1D8  4C AD D1

_label_d1db:
  lda #$16                       ; $D1DB  A9 16
  sta _var_00af                  ; $D1DD  85 AF
  jsr _func_d41a                 ; $D1DF  20 1A D4
  jsr _func_e151                 ; $D1E2  20 51 E1
  jsr _func_e7c3                 ; $D1E5  20 C3 E7
  lda (_var_002d_indexed),Y      ; $D1E8  B1 2D
  and a:_data_d2b7_indexed,X     ; $D1EA  3D B7 D2
  bne _label_d257                ; $D1ED  D0 68
  inc _var_00af                  ; $D1EF  E6 AF
  jsr _func_e151                 ; $D1F1  20 51 E1
  jsr _func_e7c3                 ; $D1F4  20 C3 E7
  lda (_var_002d_indexed),Y      ; $D1F7  B1 2D
  and a:_data_d2b7_indexed,X     ; $D1F9  3D B7 D2
  bne _label_d257                ; $D1FC  D0 59
  inc _var_00af                  ; $D1FE  E6 AF
  jsr _func_e151                 ; $D200  20 51 E1
  jsr _func_e7c3                 ; $D203  20 C3 E7
  lda (_var_002d_indexed),Y      ; $D206  B1 2D
  and a:_data_d2b7_indexed,X     ; $D208  3D B7 D2
  bne _label_d257                ; $D20B  D0 4A
  inc _var_00af                  ; $D20D  E6 AF
  jsr _func_e151                 ; $D20F  20 51 E1
  jsr _func_e7c3                 ; $D212  20 C3 E7
  lda (_var_002d_indexed),Y      ; $D215  B1 2D
  and a:_data_d2b7_indexed,X     ; $D217  3D B7 D2
  cmp a:_data_d2bf_indexed,X     ; $D21A  DD BF D2
  beq _label_d257                ; $D21D  F0 38
  inc _var_00af                  ; $D21F  E6 AF
  jsr _func_e151                 ; $D221  20 51 E1
  jsr _func_e7c3                 ; $D224  20 C3 E7
  lda (_var_002d_indexed),Y      ; $D227  B1 2D
  and a:_data_d2b7_indexed,X     ; $D229  3D B7 D2
  cmp a:_data_d2bb_indexed,X     ; $D22C  DD BB D2
  beq _label_d257                ; $D22F  F0 26
  inc _var_00af                  ; $D231  E6 AF
  jsr _func_e151                 ; $D233  20 51 E1
  jsr _func_e7c3                 ; $D236  20 C3 E7
  lda _var_00a9                  ; $D239  A5 A9
  beq _label_d24a                ; $D23B  F0 0D
  lda (_var_002d_indexed),Y      ; $D23D  B1 2D
  and a:_data_d2b7_indexed,X     ; $D23F  3D B7 D2
  cmp a:_data_d2bf_indexed,X     ; $D242  DD BF D2
  beq _label_d257                ; $D245  F0 10
  jmp _label_cf52                ; $D247  4C 52 CF

_label_d24a:
  lda (_var_002d_indexed),Y      ; $D24A  B1 2D
  and a:_data_d2b7_indexed,X     ; $D24C  3D B7 D2
  cmp a:_data_d2bb_indexed,X     ; $D24F  DD BB D2
  beq _label_d257                ; $D252  F0 03
  jmp _label_cf52                ; $D254  4C 52 CF

_label_d257:
  lda _var_006b                  ; $D257  A5 6B
  beq _label_d25e                ; $D259  F0 03
  jmp _label_df60                ; $D25B  4C 60 DF

_label_d25e:
  lda _var_008d_indexed          ; $D25E  A5 8D
  beq _label_d282                ; $D260  F0 20
  ldx _var_008b                  ; $D262  A6 8B
  ldy _var_008c                  ; $D264  A4 8C
  lda #$00                       ; $D266  A9 00
  sta _var_008d_indexed          ; $D268  85 8D
  lda _var_0052                  ; $D26A  A5 52
  beq _label_d275                ; $D26C  F0 07
  cmp #$02                       ; $D26E  C9 02
  bcs _label_d278                ; $D270  B0 06
  jmp _label_d518                ; $D272  4C 18 D5

_label_d275:
  jmp _label_d52c                ; $D275  4C 2C D5

_label_d278:
  cmp #$03                       ; $D278  C9 03
  beq _label_d27f                ; $D27A  F0 03
  jmp _label_d4e7                ; $D27C  4C E7 D4

_label_d27f:
  jmp _label_d4fb                ; $D27F  4C FB D4

_label_d282:
  lda a:_var_06bc                ; $D282  AD BC 06
  sta _var_0056                  ; $D285  85 56
  lda a:_var_06ad                ; $D287  AD AD 06
  sta _var_005b                  ; $D28A  85 5B
  jsr _func_db17                 ; $D28C  20 17 DB
  ldy _var_00a4                  ; $D28F  A4 A4
  lda a:_var_02f2                ; $D291  AD F2 02
  sta a:_var_00b1_indexed,Y      ; $D294  99 B1 00
  lda a:_var_02f0                ; $D297  AD F0 02
  sta a:_var_00bc_indexed,Y      ; $D29A  99 BC 00
  lda #$01                       ; $D29D  A9 01
  sta a:_var_00c6_indexed,Y      ; $D29F  99 C6 00
  lda #$00                       ; $D2A2  A9 00
  sta a:_var_00d0_indexed,Y      ; $D2A4  99 D0 00
  lda a:_var_06bc                ; $D2A7  AD BC 06
  sta _var_0056                  ; $D2AA  85 56
  lda a:_var_06ad                ; $D2AC  AD AD 06
  sta _var_005b                  ; $D2AF  85 5B
  jsr _func_cdc7                 ; $D2B1  20 C7 CD
  jmp _func_d0ed                 ; $D2B4  4C ED D0

_data_d2b7_indexed:
.byte $c0, $30, $0c, $03         ; $D2B7

_data_d2bb_indexed:
.byte $40, $10, $04, $01         ; $D2BB

_data_d2bf_indexed:
.byte $80, $20, $08, $02         ; $D2BF

_func_d2c3:
  ldx _var_00a4                  ; $D2C3  A6 A4
  dec _var_00da_indexed,X        ; $D2C5  D6 DA
  lda _var_00da_indexed,X        ; $D2C7  B5 DA
  sta _var_0052                  ; $D2C9  85 52
  inc _var_00da_indexed,X        ; $D2CB  F6 DA
  lda _var_00b0_indexed,X        ; $D2CD  B5 B0
  sta _var_0056                  ; $D2CF  85 56
  lda _var_00bb_indexed,X        ; $D2D1  B5 BB
  sta _var_005b                  ; $D2D3  85 5B
  jsr _func_db17                 ; $D2D5  20 17 DB
  lda a:_var_02f2                ; $D2D8  AD F2 02
  sta a:_var_02f3                ; $D2DB  8D F3 02
  lda a:_var_02f0                ; $D2DE  AD F0 02
  clc                            ; $D2E1  18
  adc #$20                       ; $D2E2  69 20
  sta a:_var_02f1                ; $D2E4  8D F1 02
  bcc _label_d2ec                ; $D2E7  90 03
  inc a:_var_02f3                ; $D2E9  EE F3 02

_label_d2ec:
  lda a:_var_02f3                ; $D2EC  AD F3 02
  cmp #$2B                       ; $D2EF  C9 2B
  bne _label_d304                ; $D2F1  D0 11
  lda a:_var_02f1                ; $D2F3  AD F1 02
  cmp #$C0                       ; $D2F6  C9 C0
  bcc _label_d304                ; $D2F8  90 0A
  and #$1F                       ; $D2FA  29 1F
  sta a:_var_02f1                ; $D2FC  8D F1 02
  lda #$20                       ; $D2FF  A9 20
  sta a:_var_02f3                ; $D301  8D F3 02

_label_d304:
  rts                            ; $D304  60

_func_d305:
  lda _var_0065                  ; $D305  A5 65
  and #$07                       ; $D307  29 07
  sta _var_00e8                  ; $D309  85 E8
  lda #$DF                       ; $D30B  A9 DF
  sec                            ; $D30D  38
  sbc _var_00e8                  ; $D30E  E5 E8
  sta _var_00a1                  ; $D310  85 A1
  lda #$F0                       ; $D312  A9 F0
  sta _var_00a2                  ; $D314  85 A2
  jsr _func_d063                 ; $D316  20 63 D0
  lda _var_0052                  ; $D319  A5 52
  cmp #$02                       ; $D31B  C9 02
  bcs _label_d32c                ; $D31D  B0 0D
  lda _var_00e8                  ; $D31F  A5 E8
  beq _label_d339                ; $D321  F0 16
  lda _var_0032                  ; $D323  A5 32
  cmp #$02                       ; $D325  C9 02
  bcs _label_d339                ; $D327  B0 10
  jmp _label_d336                ; $D329  4C 36 D3

_label_d32c:
  lda _var_00e8                  ; $D32C  A5 E8
  bne _label_d336                ; $D32E  D0 06
  lda _var_0032                  ; $D330  A5 32
  cmp #$02                       ; $D332  C9 02
  bcs _label_d339                ; $D334  B0 03

_label_d336:
  jsr _func_d407                 ; $D336  20 07 D4

_label_d339:
  lda _var_008b                  ; $D339  A5 8B
  cmp _var_0056                  ; $D33B  C5 56
  beq _label_d341                ; $D33D  F0 02
  bcs _label_d363                ; $D33F  B0 22

_label_d341:
  lda _var_0056                  ; $D341  A5 56
  cmp #$3B                       ; $D343  C9 3B
  bne _label_d34f                ; $D345  D0 08

_label_d347:
  sec                            ; $D347  38
  sbc #$3B                       ; $D348  E9 3B
  sta _var_0056                  ; $D34A  85 56
  jmp _label_d358                ; $D34C  4C 58 D3

_label_d34f:
  cmp #$7B                       ; $D34F  C9 7B
  beq _label_d347                ; $D351  F0 F4
  sec                            ; $D353  38
  sbc #$3F                       ; $D354  E9 3F
  sta _var_0056                  ; $D356  85 56

_label_d358:
  lda _var_008b                  ; $D358  A5 8B
  cmp _var_0056                  ; $D35A  C5 56
  bcc _label_d368                ; $D35C  90 0A
  lda #$00                       ; $D35E  A9 00
  jmp _label_d36a                ; $D360  4C 6A D3

_label_d363:
  lda #$01                       ; $D363  A9 01
  jmp _label_d36a                ; $D365  4C 6A D3

_label_d368:
  lda #$FF                       ; $D368  A9 FF

_label_d36a:
  sta _var_004d                  ; $D36A  85 4D
  rts                            ; $D36C  60

_func_d36d:
  stx a:_var_06b4                ; $D36D  8E B4 06
  ldx _var_00af                  ; $D370  A6 AF
  lda #$00                       ; $D372  A9 00

_label_d374:
  cpx #$00                       ; $D374  E0 00
  beq _label_d37f                ; $D376  F0 07
  clc                            ; $D378  18
  adc #$07                       ; $D379  69 07
  dex                            ; $D37B  CA
  jmp _label_d374                ; $D37C  4C 74 D3

_label_d37f:
  ldx a:_var_06b4                ; $D37F  AE B4 06
  rts                            ; $D382  60

_func_d383:
  lda #$0B                       ; $D383  A9 0B
  sta _var_00af                  ; $D385  85 AF
  lda #$00                       ; $D387  A9 00
  sta _var_0031_indexed          ; $D389  85 31
  sta _var_0047                  ; $D38B  85 47
  lda a:_var_0209_indexed        ; $D38D  AD 09 02
  and #$40                       ; $D390  29 40
  beq _label_d396                ; $D392  F0 02
  inc _var_0031_indexed          ; $D394  E6 31

_label_d396:
  lda _var_009d                  ; $D396  A5 9D
  bne _label_d3c4                ; $D398  D0 2A
  ldy _var_0056                  ; $D39A  A4 56
  ldx _var_005b                  ; $D39C  A6 5B
  lda _var_0052                  ; $D39E  A5 52
  bne _label_d3c4                ; $D3A0  D0 22
  lda _var_0031_indexed          ; $D3A2  A5 31
  bne _label_d3a9                ; $D3A4  D0 03
  jmp _label_d3b1                ; $D3A6  4C B1 D3

_label_d3a9:
  cpx #$00                       ; $D3A9  E0 00
  bne _label_d3b0                ; $D3AB  D0 03
  dey                            ; $D3AD  88
  ldx #$04                       ; $D3AE  A2 04

_label_d3b0:
  dex                            ; $D3B0  CA

_label_d3b1:
  lda a:_var_0480_indexed,Y      ; $D3B1  B9 80 04
  and a:_data_d403_indexed,X     ; $D3B4  3D 03 D4
  bne _label_d3e7                ; $D3B7  D0 2E
  lda a:_var_0380_indexed,Y      ; $D3B9  B9 80 03
  and a:_data_d403_indexed,X     ; $D3BC  3D 03 D4
  cmp a:_data_d403_indexed,X     ; $D3BF  DD 03 D4
  beq _label_d3e7                ; $D3C2  F0 23

_label_d3c4:
  jsr _func_d41a                 ; $D3C4  20 1A D4
  lda a:_var_06bf                ; $D3C7  AD BF 06
  bne _label_d3fd                ; $D3CA  D0 31

_label_d3cc:
  jsr _func_e151                 ; $D3CC  20 51 E1
  jsr _func_c13f                 ; $D3CF  20 3F C1
  lda (_var_002d_indexed),Y      ; $D3D2  B1 2D
  and a:_data_d403_indexed,X     ; $D3D4  3D 03 D4
  beq _label_d3de                ; $D3D7  F0 05
  cmp a:_data_d403_indexed,X     ; $D3D9  DD 03 D4
  bne _label_d3e7                ; $D3DC  D0 09

_label_d3de:
  inc _var_00af                  ; $D3DE  E6 AF
  lda _var_00af                  ; $D3E0  A5 AF
  cmp #$0F                       ; $D3E2  C9 0F
  bne _label_d3cc                ; $D3E4  D0 E6
  rts                            ; $D3E6  60

_label_d3e7:
  lda _var_00af                  ; $D3E7  A5 AF
  cmp #$0E                       ; $D3E9  C9 0E
  bne _label_d3f5                ; $D3EB  D0 08
  lda _var_0031_indexed          ; $D3ED  A5 31
  bne _label_d3f8                ; $D3EF  D0 07
  lda _var_0067                  ; $D3F1  A5 67
  bne _label_d3fc                ; $D3F3  D0 07

_label_d3f5:
  inc _var_0047                  ; $D3F5  E6 47
  rts                            ; $D3F7  60

_label_d3f8:
  lda _var_0067                  ; $D3F8  A5 67
  bne _label_d3f5                ; $D3FA  D0 F9

_label_d3fc:
  rts                            ; $D3FC  60

_label_d3fd:
  lda #$00                       ; $D3FD  A9 00
  sta a:_var_06bf                ; $D3FF  8D BF 06
  rts                            ; $D402  60

_data_d403_indexed:
.byte $c0, $30, $0c, $03         ; $D403

_func_d407:
  lda _var_0056                  ; $D407  A5 56
  clc                            ; $D409  18
  adc #$04                       ; $D40A  69 04
  cmp #$3C                       ; $D40C  C9 3C
  bcc _label_d417                ; $D40E  90 07
  cmp #$40                       ; $D410  C9 40
  bcs _label_d417                ; $D412  B0 03
  clc                            ; $D414  18
  adc #$04                       ; $D415  69 04

_label_d417:
  sta _var_0056                  ; $D417  85 56
  rts                            ; $D419  60

_func_d41a:
  lda _var_0056                  ; $D41A  A5 56
  cmp #$04                       ; $D41C  C9 04
  bcc _label_d430                ; $D41E  90 10
  sec                            ; $D420  38
  sbc #$04                       ; $D421  E9 04
  cmp #$3C                       ; $D423  C9 3C
  bcc _label_d42e                ; $D425  90 07
  cmp #$40                       ; $D427  C9 40
  bcs _label_d42e                ; $D429  B0 03
  sec                            ; $D42B  38
  sbc #$04                       ; $D42C  E9 04

_label_d42e:
  sta _var_0056                  ; $D42E  85 56

_label_d430:
  rts                            ; $D430  60

_func_d431:
  lda #$00                       ; $D431  A9 00
  tax                            ; $D433  AA

_label_d434:
  sta a:_var_0110_indexed,X      ; $D434  9D 10 01
  inx                            ; $D437  E8
  cpx #$06                       ; $D438  E0 06
  bne _label_d434                ; $D43A  D0 F8
  tax                            ; $D43C  AA

_label_d43d:
  lda a:_var_0116_indexed,X      ; $D43D  BD 16 01
  clc                            ; $D440  18
  adc a:_data_d481_indexed,X     ; $D441  7D 81 D4
  sta a:_var_0116_indexed,X      ; $D444  9D 16 01
  txa                            ; $D447  8A
  bne _label_d45b                ; $D448  D0 11
  lda _var_001c                  ; $D44A  A5 1C
  cmp #$31                       ; $D44C  C9 31
  bcc _label_d454                ; $D44E  90 04
  lda #$30                       ; $D450  A9 30
  sta _var_001c                  ; $D452  85 1C

_label_d454:
  clc                            ; $D454  18
  adc a:_var_0116_indexed        ; $D455  6D 16 01
  sta a:_var_0116_indexed        ; $D458  8D 16 01

_label_d45b:
  lda a:_var_0116_indexed,X      ; $D45B  BD 16 01
  and #$C0                       ; $D45E  29 C0
  clc                            ; $D460  18
  rol a                          ; $D461  2A
  rol a                          ; $D462  2A
  rol a                          ; $D463  2A
  sta a:_var_0110_indexed,X      ; $D464  9D 10 01
  lda a:_var_0116_indexed,X      ; $D467  BD 16 01
  and #$3F                       ; $D46A  29 3F
  sta a:_var_0116_indexed,X      ; $D46C  9D 16 01
  inx                            ; $D46F  E8
  cpx #$06                       ; $D470  E0 06
  bne _label_d43d                ; $D472  D0 C9
  lda a:_var_0110_indexed        ; $D474  AD 10 01
  cmp #$02                       ; $D477  C9 02
  bcc _label_d480                ; $D479  90 05
  lda #$02                       ; $D47B  A9 02
  sta a:_var_0110_indexed        ; $D47D  8D 10 01

_label_d480:
  rts                            ; $D480  60

_data_d481_indexed:
.byte $50, $30, $10, $05, $20, $80 ; $D481

_func_d487:
  lda #$00                       ; $D487  A9 00

_label_d489:
  cpx #$00                       ; $D489  E0 00
  beq _label_d494                ; $D48B  F0 07
  clc                            ; $D48D  18
  adc #$07                       ; $D48E  69 07
  dex                            ; $D490  CA
  jmp _label_d489                ; $D491  4C 89 D4

_label_d494:
  tax                            ; $D494  AA
  rts                            ; $D495  60

_func_d496:
  lda _var_0086                  ; $D496  A5 86
  beq _label_d4c8                ; $D498  F0 2E
  inc _var_006e                  ; $D49A  E6 6E
  lda _var_006e                  ; $D49C  A5 6E
  cmp #$16                       ; $D49E  C9 16
  bne _label_d4a9                ; $D4A0  D0 07
  lda #$00                       ; $D4A2  A9 00
  sta _var_0086                  ; $D4A4  85 86
  sta _var_0054                  ; $D4A6  85 54
  rts                            ; $D4A8  60

_label_d4a9:
  cmp #$05                       ; $D4A9  C9 05
  bcs _label_d4ae                ; $D4AB  B0 01
  rts                            ; $D4AD  60

_label_d4ae:
  lda _var_0086                  ; $D4AE  A5 86
  cmp #$01                       ; $D4B0  C9 01
  bne _label_d4c4                ; $D4B2  D0 10
  lda _var_0054                  ; $D4B4  A5 54
  cmp _var_004c                  ; $D4B6  C5 4C
  beq _label_d4c4                ; $D4B8  F0 0A
  ldx _var_0054                  ; $D4BA  A6 54
  cpx #$00                       ; $D4BC  E0 00
  bne _label_d4ce                ; $D4BE  D0 0E
  lda #$73                       ; $D4C0  A9 73
  sta _var_0054                  ; $D4C2  85 54

_label_d4c4:
  rts                            ; $D4C4  60

_label_d4c5:
  jmp _label_d576                ; $D4C5  4C 76 D5

_label_d4c8:
  ldx _var_004c                  ; $D4C8  A6 4C
  cpx #$00                       ; $D4CA  E0 00
  beq _label_d547                ; $D4CC  F0 79

_label_d4ce:
  ldy #$03                       ; $D4CE  A0 03

_label_d4d0:
  lda #$00                       ; $D4D0  A9 00
  sta _var_0052                  ; $D4D2  85 52
  lda a:_var_0500_indexed,X      ; $D4D4  BD 00 05
  and a:_data_d63c_indexed,Y     ; $D4D7  39 3C D6
  cmp a:_data_d640_indexed,Y     ; $D4DA  D9 40 D6
  beq _label_d4c5                ; $D4DD  F0 E6
  cmp a:_data_d644_indexed,Y     ; $D4DF  D9 44 D6
  bne _label_d4e7                ; $D4E2  D0 03
  jmp _label_d569                ; $D4E4  4C 69 D5

_label_d4e7:
  lda #$00                       ; $D4E7  A9 00
  sta _var_0052                  ; $D4E9  85 52
  lda a:_var_0580_indexed,X      ; $D4EB  BD 80 05
  and a:_data_d63c_indexed,Y     ; $D4EE  39 3C D6
  cmp a:_data_d640_indexed,Y     ; $D4F1  D9 40 D6
  beq _label_d574                ; $D4F4  F0 7E
  cmp a:_data_d644_indexed,Y     ; $D4F6  D9 44 D6
  beq _label_d567                ; $D4F9  F0 6C

_label_d4fb:
  lda #$00                       ; $D4FB  A9 00
  sta _var_0052                  ; $D4FD  85 52
  lda a:_var_0480_indexed,X      ; $D4FF  BD 80 04
  and a:_data_d63c_indexed,Y     ; $D502  39 3C D6
  beq _label_d518                ; $D505  F0 11
  cmp a:_data_d640_indexed,Y     ; $D507  D9 40 D6
  beq _label_d578                ; $D50A  F0 6C
  cmp a:_data_d644_indexed,Y     ; $D50C  D9 44 D6
  beq _label_d56b                ; $D50F  F0 5A
  lda _var_006f                  ; $D511  A5 6F
  beq _label_d518                ; $D513  F0 03
  jsr _func_bc83                 ; $D515  20 83 BC

_label_d518:
  lda #$00                       ; $D518  A9 00
  sta _var_0052                  ; $D51A  85 52
  lda a:_var_0400_indexed,X      ; $D51C  BD 00 04
  and a:_data_d63c_indexed,Y     ; $D51F  39 3C D6
  cmp a:_data_d640_indexed,Y     ; $D522  D9 40 D6
  beq _label_d57a                ; $D525  F0 53
  cmp a:_data_d644_indexed,Y     ; $D527  D9 44 D6
  beq _label_d56d                ; $D52A  F0 41

_label_d52c:
  cpy #$00                       ; $D52C  C0 00
  beq _label_d534                ; $D52E  F0 04
  dey                            ; $D530  88
  jmp _label_d4d0                ; $D531  4C D0 D4

_label_d534:
  txa                            ; $D534  8A
  beq _label_d547                ; $D535  F0 10
  cpx #$40                       ; $D537  E0 40
  beq _label_d559                ; $D539  F0 1E
  cpx #$04                       ; $D53B  E0 04
  beq _label_d547                ; $D53D  F0 08
  and #$03                       ; $D53F  29 03
  beq _label_d54c                ; $D541  F0 09
  dex                            ; $D543  CA
  jmp _label_d4ce                ; $D544  4C CE D4

_label_d547:
  lda #$73                       ; $D547  A9 73
  sta _var_004c                  ; $D549  85 4C
  rts                            ; $D54B  60

_label_d54c:
  dex                            ; $D54C  CA
  lda _var_0086                  ; $D54D  A5 86
  bne _label_d555                ; $D54F  D0 04
  txa                            ; $D551  8A
  sta _var_004c                  ; $D552  85 4C
  rts                            ; $D554  60

_label_d555:
  txa                            ; $D555  8A
  sta _var_0054                  ; $D556  85 54
  rts                            ; $D558  60

_label_d559:
  lda _var_0086                  ; $D559  A5 86
  bne _label_d562                ; $D55B  D0 05
  lda #$3B                       ; $D55D  A9 3B
  sta _var_004c                  ; $D55F  85 4C
  rts                            ; $D561  60

_label_d562:
  lda #$3B                       ; $D562  A9 3B
  sta _var_0054                  ; $D564  85 54
  rts                            ; $D566  60

_label_d567:
  inc _var_0052                  ; $D567  E6 52

_label_d569:
  inc _var_0052                  ; $D569  E6 52

_label_d56b:
  inc _var_0052                  ; $D56B  E6 52

_label_d56d:
  lda #$43                       ; $D56D  A9 43
  sta _var_00a3                  ; $D56F  85 A3
  jmp _label_d57e                ; $D571  4C 7E D5

_label_d574:
  inc _var_0052                  ; $D574  E6 52

_label_d576:
  inc _var_0052                  ; $D576  E6 52

_label_d578:
  inc _var_0052                  ; $D578  E6 52

_label_d57a:
  lda #$03                       ; $D57A  A9 03
  sta _var_00a3                  ; $D57C  85 A3

_label_d57e:
  cpx a:_var_0138                ; $D57E  EC 38 01
  bne _label_d5a1                ; $D581  D0 1E
  cpy a:_var_0139                ; $D583  CC 39 01
  bne _label_d5a1                ; $D586  D0 19
  lda _var_0052                  ; $D588  A5 52
  cmp a:_var_013a                ; $D58A  CD 3A 01
  bne _label_d5a1                ; $D58D  D0 12
  lda _var_0052                  ; $D58F  A5 52
  beq _label_d52c                ; $D591  F0 99
  cmp #$01                       ; $D593  C9 01
  beq _label_d518                ; $D595  F0 81
  cmp #$03                       ; $D597  C9 03
  beq _label_d59e                ; $D599  F0 03
  jmp _label_d4e7                ; $D59B  4C E7 D4

_label_d59e:
  jmp _label_d4fb                ; $D59E  4C FB D4

_label_d5a1:
  txa                            ; $D5A1  8A
  sta _var_0056                  ; $D5A2  85 56
  sta _var_008b                  ; $D5A4  85 8B
  tya                            ; $D5A6  98
  sta _var_008c                  ; $D5A7  85 8C
  sta _var_005b                  ; $D5A9  85 5B
  inc _var_008d_indexed          ; $D5AB  E6 8D
  jmp _label_d186                ; $D5AD  4C 86 D1

_label_d5b0:
  lda _var_008b                  ; $D5B0  A5 8B
  sta _var_0056                  ; $D5B2  85 56
  lda _var_008c                  ; $D5B4  A5 8C
  sta _var_005b                  ; $D5B6  85 5B
  jsr _func_d0c7                 ; $D5B8  20 C7 D0
  jsr _func_ced5                 ; $D5BB  20 D5 CE
  jsr _func_cf34                 ; $D5BE  20 34 CF
  inc _var_00d0_indexed,X        ; $D5C1  F6 D0
  lda _var_008b                  ; $D5C3  A5 8B
  sta _var_00b1_indexed,X        ; $D5C5  95 B1
  lda _var_008c                  ; $D5C7  A5 8C
  sta _var_00bc_indexed,X        ; $D5C9  95 BC
  lda _var_0052                  ; $D5CB  A5 52
  clc                            ; $D5CD  18
  adc #$01                       ; $D5CE  69 01
  sta _var_00db_indexed,X        ; $D5D0  95 DB
  jsr _func_d487                 ; $D5D2  20 87 D4
  lda _var_00a1                  ; $D5D5  A5 A1
  sta a:_var_020e_indexed,X      ; $D5D7  9D 0E 02
  sta a:_var_06a0                ; $D5DA  8D A0 06
  lda _var_00a2                  ; $D5DD  A5 A2
  sta a:_var_0211_indexed,X      ; $D5DF  9D 11 02
  sta a:_var_06a1                ; $D5E2  8D A1 06
  lda _var_00a3                  ; $D5E5  A5 A3
  sta a:_var_0210_indexed,X      ; $D5E7  9D 10 02
  and #$40                       ; $D5EA  29 40
  bne _label_d5fb                ; $D5EC  D0 0D
  lda #$10                       ; $D5EE  A9 10
  sta a:_var_020f_indexed,X      ; $D5F0  9D 0F 02
  lda #$12                       ; $D5F3  A9 12
  sta a:_var_0212_indexed,X      ; $D5F5  9D 12 02
  jmp _label_d605                ; $D5F8  4C 05 D6

_label_d5fb:
  lda #$12                       ; $D5FB  A9 12
  sta a:_var_020f_indexed,X      ; $D5FD  9D 0F 02
  lda #$10                       ; $D600  A9 10
  sta a:_var_0212_indexed,X      ; $D602  9D 12 02

_label_d605:
  lda _var_0052                  ; $D605  A5 52
  sta _var_0032                  ; $D607  85 32
  jsr _func_d305                 ; $D609  20 05 D3
  lda a:_var_020e_indexed,X      ; $D60C  BD 0E 02
  cmp #$F0                       ; $D60F  C9 F0
  bcc _label_d622                ; $D611  90 0F
  lda _var_004d                  ; $D613  A5 4D
  cmp #$FF                       ; $D615  C9 FF
  beq _label_d622                ; $D617  F0 09
  dec _var_004d                  ; $D619  C6 4D
  lda #$EF                       ; $D61B  A9 EF
  sta a:_var_020e_indexed,X      ; $D61D  9D 0E 02
  bne _label_d622                ; $D620  D0 00

_label_d622:
  lda _var_004d                  ; $D622  A5 4D
  sta a:_var_0213_indexed,X      ; $D624  9D 13 02
  lda _var_006f                  ; $D627  A5 6F
  beq _label_d62e                ; $D629  F0 03
  jsr _func_bd4d                 ; $D62B  20 4D BD

_label_d62e:
  lda _var_0086                  ; $D62E  A5 86
  bne _label_d639                ; $D630  D0 07
  inc _var_0086                  ; $D632  E6 86
  lda #$00                       ; $D634  A9 00
  sta _var_006e                  ; $D636  85 6E
  rts                            ; $D638  60

_label_d639:
  inc _var_0086                  ; $D639  E6 86
  rts                            ; $D63B  60

_data_d63c_indexed:
.byte $c0, $30, $0c, $03         ; $D63C

_data_d640_indexed:
.byte $40, $10, $04, $01         ; $D640

_data_d644_indexed:
.byte $80, $20, $08, $02         ; $D644

_func_d648:
  lda _var_0052                  ; $D648  A5 52
  asl a                          ; $D64A  0A
  asl a                          ; $D64B  0A
  tax                            ; $D64C  AA
  lda a:_data_d662_indexed,X     ; $D64D  BD 62 D6
  sta _var_0087_indexed          ; $D650  85 87
  lda a:_data_d663_indexed,X     ; $D652  BD 63 D6
  sta _var_0088                  ; $D655  85 88
  lda a:_data_d664_indexed,X     ; $D657  BD 64 D6
  sta _var_0089                  ; $D65A  85 89
  lda a:_data_d665_indexed,X     ; $D65C  BD 65 D6
  sta _var_008a                  ; $D65F  85 8A
  rts                            ; $D661  60

_data_d662_indexed:
.byte $f1                        ; $D662

_data_d663_indexed:
.byte $f0                        ; $D663

_data_d664_indexed:
.byte $f3                        ; $D664

_data_d665_indexed:
.byte $f2, $f0, $f1, $f2, $f3, $f2, $f3, $f0, $f1, $f3, $f2, $f1, $f0 ; $D665

_func_d672:
  jsr _func_d648                 ; $D672  20 48 D6
  ldx _var_0056                  ; $D675  A6 56
  ldy _var_005b                  ; $D677  A4 5B
  lda _var_0052                  ; $D679  A5 52
  cmp #$02                       ; $D67B  C9 02
  bcc _label_d682                ; $D67D  90 03
  jmp _label_d718                ; $D67F  4C 18 D7

_label_d682:
  lda #$00                       ; $D682  A9 00
  sta _var_0032                  ; $D684  85 32

_label_d686:
  lda a:_var_0380_indexed,X      ; $D686  BD 80 03
  and a:_data_d6f4_indexed,Y     ; $D689  39 F4 D6
  beq _label_d69b                ; $D68C  F0 0D
  cmp a:_data_d6f8_indexed,Y     ; $D68E  D9 F8 D6
  beq _label_d6ba                ; $D691  F0 27
  cmp a:_data_d6fc_indexed,Y     ; $D693  D9 FC D6
  beq _label_d6b8                ; $D696  F0 20
  jmp _label_d6b6                ; $D698  4C B6 D6

_label_d69b:
  lda _var_0052                  ; $D69B  A5 52
  bne _label_d6d1                ; $D69D  D0 32
  lda _var_0032                  ; $D69F  A5 32
  cmp #$03                       ; $D6A1  C9 03
  bcs _label_d6d1                ; $D6A3  B0 2C
  ldx _var_0056                  ; $D6A5  A6 56
  cpy #$00                       ; $D6A7  C0 00
  bne _label_d6ae                ; $D6A9  D0 03
  dex                            ; $D6AB  CA
  ldy #$04                       ; $D6AC  A0 04

_label_d6ae:
  dey                            ; $D6AE  88
  lda #$03                       ; $D6AF  A9 03
  sta _var_0032                  ; $D6B1  85 32
  jmp _label_d686                ; $D6B3  4C 86 D6

_label_d6b6:
  inc _var_0032                  ; $D6B6  E6 32

_label_d6b8:
  inc _var_0032                  ; $D6B8  E6 32

_label_d6ba:
  lda _var_0052                  ; $D6BA  A5 52
  beq _label_d6d2                ; $D6BC  F0 14
  lda _var_0032                  ; $D6BE  A5 32
  asl a                          ; $D6C0  0A
  asl a                          ; $D6C1  0A
  tax                            ; $D6C2  AA
  ldy #$00                       ; $D6C3  A0 00

_label_d6c5:
  lda a:_data_d70c_indexed,X     ; $D6C5  BD 0C D7
  sta a:_var_0087_indexed,Y      ; $D6C8  99 87 00
  inx                            ; $D6CB  E8
  iny                            ; $D6CC  C8
  cpy #$04                       ; $D6CD  C0 04
  bne _label_d6c5                ; $D6CF  D0 F4

_label_d6d1:
  rts                            ; $D6D1  60

_label_d6d2:
  lda _var_0032                  ; $D6D2  A5 32
  cmp #$03                       ; $D6D4  C9 03
  bcs _label_d6e7                ; $D6D6  B0 0F
  asl a                          ; $D6D8  0A
  tax                            ; $D6D9  AA
  lda a:_data_d700_indexed,X     ; $D6DA  BD 00 D7
  sta _var_0088                  ; $D6DD  85 88
  lda a:_data_d701_indexed,X     ; $D6DF  BD 01 D7
  sta _var_008a                  ; $D6E2  85 8A
  jmp _label_d69b                ; $D6E4  4C 9B D6

_label_d6e7:
  asl a                          ; $D6E7  0A
  tax                            ; $D6E8  AA
  lda a:_data_d700_indexed,X     ; $D6E9  BD 00 D7
  sta _var_0087_indexed          ; $D6EC  85 87
  lda a:_data_d701_indexed,X     ; $D6EE  BD 01 D7
  sta _var_0089                  ; $D6F1  85 89
  rts                            ; $D6F3  60

_data_d6f4_indexed:
.byte $c0, $30, $0c, $03         ; $D6F4

_data_d6f8_indexed:
.byte $40, $10, $04, $01         ; $D6F8

_data_d6fc_indexed:
.byte $80, $20, $08, $02         ; $D6FC

_data_d700_indexed:
.byte $f4                        ; $D700

_data_d701_indexed:
.byte $fa, $40, $42, $f8, $fa, $f5, $fb, $41, $43, $f9, $fb ; $D701

_data_d70c_indexed:
.byte $f4, $f5, $fa, $fb, $40, $41, $42, $43, $f8, $f9, $fa, $fb ; $D70C

_label_d718:
  lda #$00                       ; $D718  A9 00
  sta _var_0032                  ; $D71A  85 32
  lda a:_var_0380_indexed,X      ; $D71C  BD 80 03
  and a:_data_d6f4_indexed,Y     ; $D71F  39 F4 D6
  beq _label_d731                ; $D722  F0 0D
  cmp a:_data_d6fc_indexed,Y     ; $D724  D9 FC D6
  beq _label_d750                ; $D727  F0 27
  cmp a:_data_d6f8_indexed,Y     ; $D729  D9 F8 D6
  beq _label_d74b                ; $D72C  F0 1D
  jmp _label_d794                ; $D72E  4C 94 D7

_label_d731:
  lda _var_0052                  ; $D731  A5 52
  cmp #$02                       ; $D733  C9 02
  bne _label_d75c                ; $D735  D0 25
  jsr _func_d407                 ; $D737  20 07 D4
  ldx _var_0056                  ; $D73A  A6 56

_label_d73c:
  lda #$03                       ; $D73C  A9 03
  sta _var_0032                  ; $D73E  85 32

_label_d740:
  lda a:_var_0380_indexed,X      ; $D740  BD 80 03
  and a:_data_d6f4_indexed,Y     ; $D743  39 F4 D6
  beq _label_d755                ; $D746  F0 0D
  cmp a:_data_d6f8_indexed,Y     ; $D748  D9 F8 D6

_label_d74b:
  beq _label_d798                ; $D74B  F0 4B
  cmp a:_data_d6fc_indexed,Y     ; $D74D  D9 FC D6

_label_d750:
  beq _label_d796                ; $D750  F0 44
  jmp _label_d794                ; $D752  4C 94 D7

_label_d755:
  lda _var_0052                  ; $D755  A5 52
  cmp #$02                       ; $D757  C9 02
  bne _label_d769                ; $D759  D0 0E
  rts                            ; $D75B  60

_label_d75c:
  ldx _var_0056                  ; $D75C  A6 56
  cpy #$00                       ; $D75E  C0 00
  bne _label_d765                ; $D760  D0 03
  dex                            ; $D762  CA
  ldy #$04                       ; $D763  A0 04

_label_d765:
  dey                            ; $D765  88
  jmp _label_d73c                ; $D766  4C 3C D7

_label_d769:
  lda _var_0032                  ; $D769  A5 32
  cmp #$06                       ; $D76B  C9 06
  bcs _label_d77d                ; $D76D  B0 0E
  jsr _func_d407                 ; $D76F  20 07 D4
  ldx _var_0056                  ; $D772  A6 56
  ldy _var_005b                  ; $D774  A4 5B
  lda #$06                       ; $D776  A9 06
  sta _var_0032                  ; $D778  85 32
  jmp _label_d740                ; $D77A  4C 40 D7

_label_d77d:
  lda _var_0032                  ; $D77D  A5 32
  cmp #$09                       ; $D77F  C9 09
  bcs _label_d7bf                ; $D781  B0 3C
  ldx _var_0056                  ; $D783  A6 56
  cpy #$00                       ; $D785  C0 00
  bne _label_d78c                ; $D787  D0 03
  dex                            ; $D789  CA
  ldy #$04                       ; $D78A  A0 04

_label_d78c:
  dey                            ; $D78C  88
  lda #$09                       ; $D78D  A9 09
  sta _var_0032                  ; $D78F  85 32
  jmp _label_d740                ; $D791  4C 40 D7

_label_d794:
  inc _var_0032                  ; $D794  E6 32

_label_d796:
  inc _var_0032                  ; $D796  E6 32

_label_d798:
  lda _var_0052                  ; $D798  A5 52
  cmp #$02                       ; $D79A  C9 02
  bne _label_d7c0                ; $D79C  D0 22
  lda _var_0032                  ; $D79E  A5 32
  cmp #$03                       ; $D7A0  C9 03
  bcs _label_d7b3                ; $D7A2  B0 0F
  asl a                          ; $D7A4  0A
  tax                            ; $D7A5  AA
  lda a:_data_d7ec_indexed,X     ; $D7A6  BD EC D7
  sta _var_0087_indexed          ; $D7A9  85 87
  lda a:_data_d7ed_indexed,X     ; $D7AB  BD ED D7
  sta _var_0088                  ; $D7AE  85 88
  jmp _label_d731                ; $D7B0  4C 31 D7

_label_d7b3:
  asl a                          ; $D7B3  0A
  tax                            ; $D7B4  AA
  lda a:_data_d7ec_indexed,X     ; $D7B5  BD EC D7
  sta _var_0089                  ; $D7B8  85 89
  lda a:_data_d7ed_indexed,X     ; $D7BA  BD ED D7
  sta _var_008a                  ; $D7BD  85 8A

_label_d7bf:
  rts                            ; $D7BF  60

_label_d7c0:
  ldx _var_0032                  ; $D7C0  A6 32
  cpx #$03                       ; $D7C2  E0 03
  bcs _label_d7ce                ; $D7C4  B0 08
  lda a:_data_d7f8_indexed,X     ; $D7C6  BD F8 D7
  sta _var_0088                  ; $D7C9  85 88
  jmp _label_d75c                ; $D7CB  4C 5C D7

_label_d7ce:
  cpx #$06                       ; $D7CE  E0 06
  bcs _label_d7da                ; $D7D0  B0 08
  lda a:_data_d7f8_indexed,X     ; $D7D2  BD F8 D7
  sta _var_0087_indexed          ; $D7D5  85 87
  jmp _label_d769                ; $D7D7  4C 69 D7

_label_d7da:
  cpx #$09                       ; $D7DA  E0 09
  bcs _label_d7e6                ; $D7DC  B0 08
  lda a:_data_d7f8_indexed,X     ; $D7DE  BD F8 D7
  sta _var_008a                  ; $D7E1  85 8A
  jmp _label_d77d                ; $D7E3  4C 7D D7

_label_d7e6:
  lda a:_data_d7f8_indexed,X     ; $D7E6  BD F8 D7
  sta _var_0089                  ; $D7E9  85 89
  rts                            ; $D7EB  60

_data_d7ec_indexed:
.byte $fa                        ; $D7EC

_data_d7ed_indexed:
.byte $fb, $42, $43, $fa, $fb, $f4, $f5, $40, $41, $f8, $f9 ; $D7ED

_data_d7f8_indexed:
.byte $fa, $42, $fa, $fb, $43, $fb, $f4, $40, $f8, $f5, $41, $f9 ; $D7F8

_func_d804:
  lda _var_00a5                  ; $D804  A5 A5
  beq _label_d80b                ; $D806  F0 03
  jmp _label_d886                ; $D808  4C 86 D8

_label_d80b:
  lda _var_0077                  ; $D80B  A5 77
  beq _label_d810                ; $D80D  F0 01

_label_d80f:
  rts                            ; $D80F  60

_label_d810:
  lda _var_004e                  ; $D810  A5 4E
  bne _label_d80f                ; $D812  D0 FB
  lda a:_var_010f                ; $D814  AD 0F 01
  bne _label_d80f                ; $D817  D0 F6
  ldx #$00                       ; $D819  A2 00

_label_d81b:
  lda a:_var_0100_indexed,X      ; $D81B  BD 00 01
  bne _label_d834                ; $D81E  D0 14
  inx                            ; $D820  E8
  cpx #$07                       ; $D821  E0 07
  bne _label_d81b                ; $D823  D0 F6
  ldx #$00                       ; $D825  A2 00
  lda a:_var_0372                ; $D827  AD 72 03

_label_d82a:
  cmp a:_data_cec7_indexed,X     ; $D82A  DD C7 CE
  beq _label_d89c                ; $D82D  F0 6D
  inx                            ; $D82F  E8
  cpx #$08                       ; $D830  E0 08
  bne _label_d82a                ; $D832  D0 F6

_label_d834:
  lda a:_var_036c                ; $D834  AD 6C 03
  cmp #$40                       ; $D837  C9 40
  bne _label_d850                ; $D839  D0 15
  lda a:_var_036d                ; $D83B  AD 6D 03
  cmp #$41                       ; $D83E  C9 41
  bne _label_d850                ; $D840  D0 0E
  lda a:_var_036f                ; $D842  AD 6F 03
  cmp #$42                       ; $D845  C9 42
  bne _label_d850                ; $D847  D0 07
  lda a:_var_0370                ; $D849  AD 70 03
  cmp #$43                       ; $D84C  C9 43
  beq _label_d86c                ; $D84E  F0 1C

_label_d850:
  lda a:_var_036b                ; $D850  AD 6B 03
  cmp #$40                       ; $D853  C9 40
  bne _label_d89c                ; $D855  D0 45
  lda a:_var_036c                ; $D857  AD 6C 03
  cmp #$41                       ; $D85A  C9 41
  bne _label_d89c                ; $D85C  D0 3E
  lda a:_var_036e                ; $D85E  AD 6E 03
  cmp #$42                       ; $D861  C9 42
  bne _label_d89c                ; $D863  D0 37
  lda a:_var_036f                ; $D865  AD 6F 03
  cmp #$43                       ; $D868  C9 43
  bne _label_d89c                ; $D86A  D0 30

_label_d86c:
  lda a:_var_0200_indexed        ; $D86C  AD 00 02
  sta _var_00a7                  ; $D86F  85 A7
  lda #$00                       ; $D871  A9 00
  sta a:_var_0202_indexed        ; $D873  8D 02 02
  sta a:_var_061d                ; $D876  8D 1D 06
  sta a:_var_061c                ; $D879  8D 1C 06
  lda #$14                       ; $D87C  A9 14
  sta a:_var_0201_indexed        ; $D87E  8D 01 02
  lda #$16                       ; $D881  A9 16
  sta a:_var_0204_indexed        ; $D883  8D 04 02

_label_d886:
  inc _var_00a5                  ; $D886  E6 A5
  lda _var_00a5                  ; $D888  A5 A5
  cmp #$78                       ; $D88A  C9 78
  beq _label_d89d                ; $D88C  F0 0F
  and #$08                       ; $D88E  29 08
  bne _label_d897                ; $D890  D0 05
  lda #$EF                       ; $D892  A9 EF
  jmp _label_d899                ; $D894  4C 99 D8

_label_d897:
  lda _var_00a7                  ; $D897  A5 A7

_label_d899:
  sta a:_var_0200_indexed        ; $D899  8D 00 02

_label_d89c:
  rts                            ; $D89C  60

_label_d89d:
  lda #$00                       ; $D89D  A9 00
  sta _var_00a5                  ; $D89F  85 A5
  sta _var_008e                  ; $D8A1  85 8E
  jsr _func_c1cd                 ; $D8A3  20 CD C1
  lda _var_001f_indexed          ; $D8A6  A5 1F
  cmp #$40                       ; $D8A8  C9 40
  bne _label_d8b0                ; $D8AA  D0 04
  lda #$80                       ; $D8AC  A9 80
  sta _var_001f_indexed          ; $D8AE  85 1F

_label_d8b0:
  lda _var_001f_indexed          ; $D8B0  A5 1F
  cmp #$80                       ; $D8B2  C9 80
  bne _label_d8bb                ; $D8B4  D0 05
  inc _var_001f_indexed          ; $D8B6  E6 1F
  jmp _label_d8c2                ; $D8B8  4C C2 D8

_label_d8bb:
  inc a:_var_011f                ; $D8BB  EE 1F 01
  lda #$08                       ; $D8BE  A9 08
  sta _var_004f                  ; $D8C0  85 4F

_label_d8c2:
  lda _var_0026                  ; $D8C2  A5 26
  cmp #$09                       ; $D8C4  C9 09
  beq _label_d8ca                ; $D8C6  F0 02
  inc _var_0026                  ; $D8C8  E6 26

_label_d8ca:
  lda #$00                       ; $D8CA  A9 00
  sta a:_var_0629                ; $D8CC  8D 29 06
  sta a:_var_062a                ; $D8CF  8D 2A 06
  sta a:_var_062f                ; $D8D2  8D 2F 06
  sta a:_var_0630                ; $D8D5  8D 30 06
  sta a:_var_0631                ; $D8D8  8D 31 06
  sta a:_var_0632                ; $D8DB  8D 32 06
  sta a:_var_0633                ; $D8DE  8D 33 06
  sta a:_var_0634                ; $D8E1  8D 34 06
  sta _var_006f                  ; $D8E4  85 6F
  lda #$18                       ; $D8E6  A9 18
  sta _var_007d                  ; $D8E8  85 7D
  jsr _func_c015                 ; $D8EA  20 15 C0
  lda #$F0                       ; $D8ED  A9 F0
  sta a:_var_036c                ; $D8EF  8D 6C 03
  sta a:_var_036f                ; $D8F2  8D 6F 03
  lda _var_001f_indexed          ; $D8F5  A5 1F
  cmp #$0F                       ; $D8F7  C9 0F
  bcc _label_d89c                ; $D8F9  90 A1
  lda _var_001f_indexed          ; $D8FB  A5 1F
  sec                            ; $D8FD  38
  sbc #$0F                       ; $D8FE  E9 0F
  tax                            ; $D900  AA
  lda _var_001e                  ; $D901  A5 1E
  beq _label_d90e                ; $D903  F0 09
  lda #$00                       ; $D905  A9 00
  sec                            ; $D907  38
  sbc a:_data_d914_indexed,X     ; $D908  FD 14 D9
  sta _var_002a                  ; $D90B  85 2A
  rts                            ; $D90D  60

_label_d90e:
  lda a:_data_d914_indexed,X     ; $D90E  BD 14 D9
  sta _var_002a                  ; $D911  85 2A
  rts                            ; $D913  60

_data_d914_indexed:
.byte $2a, $24, $7c, $3b, $04, $0d, $73, $58, $0e, $a4, $55, $b0, $cb, $eb, $b6, $4a ; $D914
.byte $f3, $e6, $c9, $80, $a3, $72, $bd, $b4, $86, $a5, $46, $47, $75, $26, $fc, $6f ; $D924
.byte $e9, $82, $11, $aa, $12, $81, $cb, $89, $8d, $c2, $b9, $c9, $d9, $2f, $9f, $78 ; $D934
.byte $36                        ; $D944

_func_d945:
  lda _var_0085                  ; $D945  A5 85
  bne _label_d96c                ; $D947  D0 23
  lda _var_0024                  ; $D949  A5 24
  bne _label_d981                ; $D94B  D0 34
  lda _var_0022                  ; $D94D  A5 22
  bne _label_d981                ; $D94F  D0 30
  lda _var_007e                  ; $D951  A5 7E
  bne _label_d981                ; $D953  D0 2C
  lda _var_00a5                  ; $D955  A5 A5
  bne _label_d981                ; $D957  D0 28
  lda a:_var_011f                ; $D959  AD 1F 01
  bne _label_d981                ; $D95C  D0 23
  lda _var_001f_indexed          ; $D95E  A5 1F
  cmp #$81                       ; $D960  C9 81
  bcs _label_d981                ; $D962  B0 1D
  lda _var_004b                  ; $D964  A5 4B
  and #$04                       ; $D966  29 04
  beq _label_d981                ; $D968  F0 17
  inc _var_0024                  ; $D96A  E6 24

_label_d96c:
  cmp #$0A                       ; $D96C  C9 0A
  bcc _label_d982                ; $D96E  90 12
  cmp #$30                       ; $D970  C9 30
  bcc _label_d9c7                ; $D972  90 53
  cmp #$A0                       ; $D974  C9 A0
  bcs _label_d9cc                ; $D976  B0 54
  lda #$14                       ; $D978  A9 14

_label_d97a:
  sta _var_0032                  ; $D97A  85 32
  jsr _func_c2d0                 ; $D97C  20 D0 C2
  inc _var_0085                  ; $D97F  E6 85

_label_d981:
  rts                            ; $D981  60

_label_d982:
  ldx #$07                       ; $D982  A2 07

_label_d984:
  lda #$EF                       ; $D984  A9 EF
  sta a:_var_0200_indexed,X      ; $D986  9D 00 02
  inx                            ; $D989  E8
  bne _label_d984                ; $D98A  D0 F8
  lda #$F0                       ; $D98C  A9 F0
  sta a:_var_036f                ; $D98E  8D 6F 03
  sta a:_var_036c                ; $D991  8D 6C 03
  lda #$00                       ; $D994  A9 00
  sta _var_001c                  ; $D996  85 1C
  sta a:_var_0629                ; $D998  8D 29 06
  sta a:_var_062a                ; $D99B  8D 2A 06
  sta a:_var_062f                ; $D99E  8D 2F 06
  sta a:_var_0630                ; $D9A1  8D 30 06
  sta a:_var_0631                ; $D9A4  8D 31 06
  sta a:_var_0632                ; $D9A7  8D 32 06
  sta a:_var_0633                ; $D9AA  8D 33 06
  sta a:_var_0634                ; $D9AD  8D 34 06
  sta a:_var_061d                ; $D9B0  8D 1D 06
  sta a:_var_061c                ; $D9B3  8D 1C 06
  inc a:_var_0617                ; $D9B6  EE 17 06
  inc a:_var_0618                ; $D9B9  EE 18 06
  inc a:_var_0619                ; $D9BC  EE 19 06
  inc a:_var_061a                ; $D9BF  EE 1A 06
  lda #$12                       ; $D9C2  A9 12
  jmp _label_d97a                ; $D9C4  4C 7A D9

_label_d9c7:
  lda #$13                       ; $D9C7  A9 13
  jmp _label_d97a                ; $D9C9  4C 7A D9

_label_d9cc:
  lda _var_0021                  ; $D9CC  A5 21
  beq _label_d9dd                ; $D9CE  F0 0D
  inc _var_0021                  ; $D9D0  E6 21
  lda #$00                       ; $D9D2  A9 00
  sta _var_0085                  ; $D9D4  85 85
  sta _var_0050                  ; $D9D6  85 50
  sta _var_0051                  ; $D9D8  85 51
  jmp _label_d9f4                ; $D9DA  4C F4 D9

_label_d9dd:
  lda #$00                       ; $D9DD  A9 00
  sta _var_008e                  ; $D9DF  85 8E
  sta _var_0085                  ; $D9E1  85 85
  inc a:_var_011f                ; $D9E3  EE 1F 01
  lda #$04                       ; $D9E6  A9 04
  sta _var_004f                  ; $D9E8  85 4F
  dec _var_0026                  ; $D9EA  C6 26
  lda _var_0026                  ; $D9EC  A5 26
  bne _label_d9f4                ; $D9EE  D0 04
  lda #$06                       ; $D9F0  A9 06
  sta _var_004f                  ; $D9F2  85 4F

_label_d9f4:
  lda #$EF                       ; $D9F4  A9 EF
  sta a:_var_0200_indexed        ; $D9F6  8D 00 02
  lda #$00                       ; $D9F9  A9 00
  sta _var_006f                  ; $D9FB  85 6F
  lda #$18                       ; $D9FD  A9 18
  sta _var_007d                  ; $D9FF  85 7D
  jsr _func_c015                 ; $DA01  20 15 C0
  rts                            ; $DA04  60

.byte $a9, $00, $85, $24, $60    ; $DA05

_func_da0a:
  ldx #$00                       ; $DA0A  A2 00

_label_da0c:
  lda #$EF                       ; $DA0C  A9 EF
  sta a:_var_0700_indexed,X      ; $DA0E  9D 00 07
  inx                            ; $DA11  E8
  bne _label_da0c                ; $DA12  D0 F8
  ldx _var_0041                  ; $DA14  A6 41
  ldy #$00                       ; $DA16  A0 00

_label_da18:
  lda a:_var_0205_indexed,Y      ; $DA18  B9 05 02
  bne _label_da23                ; $DA1B  D0 06
  lda a:_var_0200_indexed,Y      ; $DA1D  B9 00 02
  sta a:_var_0700_indexed,X      ; $DA20  9D 00 07

_label_da23:
  inx                            ; $DA23  E8
  lda a:_var_0201_indexed,Y      ; $DA24  B9 01 02
  sta a:_var_0700_indexed,X      ; $DA27  9D 00 07
  inx                            ; $DA2A  E8
  lda a:_var_0202_indexed,Y      ; $DA2B  B9 02 02
  sta a:_var_0700_indexed,X      ; $DA2E  9D 00 07
  inx                            ; $DA31  E8
  lda a:_var_0203_indexed,Y      ; $DA32  B9 03 02
  sta a:_var_0700_indexed,X      ; $DA35  9D 00 07
  inx                            ; $DA38  E8
  lda a:_var_0205_indexed,Y      ; $DA39  B9 05 02
  bne _label_da44                ; $DA3C  D0 06
  lda a:_var_0200_indexed,Y      ; $DA3E  B9 00 02
  sta a:_var_0700_indexed,X      ; $DA41  9D 00 07

_label_da44:
  inx                            ; $DA44  E8
  lda a:_var_0204_indexed,Y      ; $DA45  B9 04 02
  sta a:_var_0700_indexed,X      ; $DA48  9D 00 07
  inx                            ; $DA4B  E8
  lda a:_var_0202_indexed,Y      ; $DA4C  B9 02 02
  sta a:_var_0700_indexed,X      ; $DA4F  9D 00 07
  inx                            ; $DA52  E8
  lda a:_var_0203_indexed,Y      ; $DA53  B9 03 02
  clc                            ; $DA56  18
  adc #$08                       ; $DA57  69 08
  sta a:_var_0700_indexed,X      ; $DA59  9D 00 07
  lda _var_0041                  ; $DA5C  A5 41
  bne _label_da65                ; $DA5E  D0 05
  cpx #$FF                       ; $DA60  E0 FF
  bne _label_da69                ; $DA62  D0 05

_label_da64:
  rts                            ; $DA64  60

_label_da65:
  cpx #$7F                       ; $DA65  E0 7F
  beq _label_da64                ; $DA67  F0 FB

_label_da69:
  tya                            ; $DA69  98
  clc                            ; $DA6A  18
  adc #$07                       ; $DA6B  69 07
  tay                            ; $DA6D  A8
  inx                            ; $DA6E  E8
  jmp _label_da18                ; $DA6F  4C 18 DA

_func_da72:
  ldx a:_var_06aa                ; $DA72  AE AA 06
  beq _label_da8d                ; $DA75  F0 16
  lda _var_0050                  ; $DA77  A5 50
  cmp a:_data_dac5_indexed,X     ; $DA79  DD C5 DA
  bne _label_dac4                ; $DA7C  D0 46
  cpx #$04                       ; $DA7E  E0 04
  beq _label_dabd                ; $DA80  F0 3B
  lda a:_data_daca_indexed,X     ; $DA82  BD CA DA
  sta _var_0032                  ; $DA85  85 32
  jsr _func_c2d0                 ; $DA87  20 D0 C2
  jmp _label_dac1                ; $DA8A  4C C1 DA

_label_da8d:
  lda _var_0021                  ; $DA8D  A5 21
  bne _label_dabd                ; $DA8F  D0 2C
  lda _var_001f_indexed          ; $DA91  A5 1F
  cmp #$82                       ; $DA93  C9 82
  beq _label_daa8                ; $DA95  F0 11
  cmp #$81                       ; $DA97  C9 81
  beq _label_dab7                ; $DA99  F0 1C
  and #$07                       ; $DA9B  29 07
  beq _label_dab7                ; $DA9D  F0 18
  inc a:_var_0629                ; $DA9F  EE 29 06
  inc a:_var_062a                ; $DAA2  EE 2A 06
  jmp _label_dabd                ; $DAA5  4C BD DA

_label_daa8:
  inc a:_var_0631                ; $DAA8  EE 31 06
  inc a:_var_0632                ; $DAAB  EE 32 06
  inc a:_var_0633                ; $DAAE  EE 33 06
  inc a:_var_0634                ; $DAB1  EE 34 06
  jmp _label_dabd                ; $DAB4  4C BD DA

_label_dab7:
  inc a:_var_062f                ; $DAB7  EE 2F 06
  inc a:_var_0630                ; $DABA  EE 30 06

_label_dabd:
  lda #$00                       ; $DABD  A9 00
  sta _var_0050                  ; $DABF  85 50

_label_dac1:
  inc a:_var_06aa                ; $DAC1  EE AA 06

_label_dac4:
  rts                            ; $DAC4  60

_data_dac5_indexed:
.byte $05, $5a, $78, $96, $b4    ; $DAC5

_data_daca_indexed:
.byte $00, $15, $16, $17         ; $DACA

_func_dace:
  lda a:_var_0203_indexed        ; $DACE  AD 03 02
  and #$07                       ; $DAD1  29 07
  cmp #$04                       ; $DAD3  C9 04
  beq _label_db12                ; $DAD5  F0 3B
  lda #$00                       ; $DAD7  A9 00
  sta _var_002d_indexed          ; $DAD9  85 2D

_label_dadb:
  ldx _var_002d_indexed          ; $DADB  A6 2D
  lda a:_data_db13_indexed,X     ; $DADD  BD 13 DB
  tay                            ; $DAE0  A8
  ldx #$00                       ; $DAE1  A2 00
  lda a:_var_0368_indexed,Y      ; $DAE3  B9 68 03

_label_dae6:
  cmp a:_data_eac5_indexed,X     ; $DAE6  DD C5 EA
  beq _label_dafe                ; $DAE9  F0 13
  inx                            ; $DAEB  E8
  cpx #$06                       ; $DAEC  E0 06
  bne _label_dae6                ; $DAEE  D0 F6
  cpy #$09                       ; $DAF0  C0 09
  bcc _label_daf9                ; $DAF2  90 05
  lda #$38                       ; $DAF4  A9 38
  jmp _label_dafb                ; $DAF6  4C FB DA

_label_daf9:
  lda #$F0                       ; $DAF9  A9 F0

_label_dafb:
  sta a:_var_0368_indexed,Y      ; $DAFB  99 68 03

_label_dafe:
  inc _var_002d_indexed          ; $DAFE  E6 2D
  lda _var_002d_indexed          ; $DB00  A5 2D
  cmp #$04                       ; $DB02  C9 04
  bne _label_dadb                ; $DB04  D0 D5
  lda #$F0                       ; $DB06  A9 F0
  sta a:_var_036e                ; $DB08  8D 6E 03
  sta a:_var_0370                ; $DB0B  8D 70 03
  lda #$00                       ; $DB0E  A9 00
  sta _var_0043                  ; $DB10  85 43

_label_db12:
  rts                            ; $DB12  60

_data_db13_indexed:
.byte $03, $05, $09, $0b         ; $DB13

_func_db17:
  ldy _var_005b                  ; $DB17  A4 5B
  lda _var_0056                  ; $DB19  A5 56
  and #$40                       ; $DB1B  29 40
  beq _label_db27                ; $DB1D  F0 08
  lda #$20                       ; $DB1F  A9 20
  sta a:_var_02f2                ; $DB21  8D F2 02
  jmp _label_db2c                ; $DB24  4C 2C DB

_label_db27:
  lda #$28                       ; $DB27  A9 28
  sta a:_var_02f2                ; $DB29  8D F2 02

_label_db2c:
  lda _var_0056                  ; $DB2C  A5 56
  and #$30                       ; $DB2E  29 30
  lsr a                          ; $DB30  4A
  lsr a                          ; $DB31  4A
  lsr a                          ; $DB32  4A
  lsr a                          ; $DB33  4A
  clc                            ; $DB34  18
  adc a:_var_02f2                ; $DB35  6D F2 02
  sta a:_var_02f2                ; $DB38  8D F2 02
  lda _var_0056                  ; $DB3B  A5 56
  and #$0C                       ; $DB3D  29 0C
  asl a                          ; $DB3F  0A
  asl a                          ; $DB40  0A
  asl a                          ; $DB41  0A
  asl a                          ; $DB42  0A
  sta a:_var_02f0                ; $DB43  8D F0 02
  lda _var_0056                  ; $DB46  A5 56
  and #$03                       ; $DB48  29 03
  asl a                          ; $DB4A  0A
  asl a                          ; $DB4B  0A
  asl a                          ; $DB4C  0A
  clc                            ; $DB4D  18
  adc a:_var_02f0                ; $DB4E  6D F0 02
  clc                            ; $DB51  18
  adc a:_data_db7e_indexed,Y     ; $DB52  79 7E DB
  sta a:_var_02f0                ; $DB55  8D F0 02
  lda _var_0052                  ; $DB58  A5 52
  beq _label_db7d                ; $DB5A  F0 21
  cmp #$02                       ; $DB5C  C9 02
  bcs _label_db66                ; $DB5E  B0 06
  inc a:_var_02f0                ; $DB60  EE F0 02
  jmp _label_db7d                ; $DB63  4C 7D DB

_label_db66:
  lda _var_0052                  ; $DB66  A5 52
  cmp #$03                       ; $DB68  C9 03
  beq _label_db6f                ; $DB6A  F0 03
  inc a:_var_02f0                ; $DB6C  EE F0 02

_label_db6f:
  lda a:_var_02f0                ; $DB6F  AD F0 02
  clc                            ; $DB72  18
  adc #$20                       ; $DB73  69 20
  sta a:_var_02f0                ; $DB75  8D F0 02
  bcc _label_db7d                ; $DB78  90 03
  inc a:_var_02f2                ; $DB7A  EE F2 02

_label_db7d:
  rts                            ; $DB7D  60

_data_db7e_indexed:
.byte $00, $02, $04, $06         ; $DB7E

_func_db82:
  lda #$00                       ; $DB82  A9 00
  sta _var_0052                  ; $DB84  85 52
  lda _var_0065                  ; $DB86  A5 65
  clc                            ; $DB88  18
  adc _var_00a1                  ; $DB89  65 A1
  clc                            ; $DB8B  18
  adc #$01                       ; $DB8C  69 01
  sta _var_002d_indexed          ; $DB8E  85 2D
  and #$0F                       ; $DB90  29 0F
  bne _label_db9d                ; $DB92  D0 09
  lda _var_00a2                  ; $DB94  A5 A2
  and #$0F                       ; $DB96  29 0F
  beq _label_dba9                ; $DB98  F0 0F
  jmp _label_dba7                ; $DB9A  4C A7 DB

_label_db9d:
  lda _var_00a2                  ; $DB9D  A5 A2
  and #$0F                       ; $DB9F  29 0F
  bne _label_dba5                ; $DBA1  D0 02
  inc _var_0052                  ; $DBA3  E6 52

_label_dba5:
  inc _var_0052                  ; $DBA5  E6 52

_label_dba7:
  inc _var_0052                  ; $DBA7  E6 52

_label_dba9:
  rts                            ; $DBA9  60

_func_dbaa:
  lda _var_001f_indexed          ; $DBAA  A5 1F
  cmp #$41                       ; $DBAC  C9 41
  bcc _label_dbb1                ; $DBAE  90 01
  rts                            ; $DBB0  60

_label_dbb1:
  lda _var_00a6_indexed          ; $DBB1  A5 A6
  bne _label_dc33                ; $DBB3  D0 7E
  lda _var_0049_indexed          ; $DBB5  A5 49
  and #$08                       ; $DBB7  29 08
  bne _label_dbbe                ; $DBB9  D0 03
  jmp _label_dc8e                ; $DBBB  4C 8E DC

_label_dbbe:
  lda _var_0025                  ; $DBBE  A5 25
  bne _label_dc32                ; $DBC0  D0 70
  inc a:_var_0610_indexed        ; $DBC2  EE 10 06
  lda _var_007e                  ; $DBC5  A5 7E
  bne _label_dc33                ; $DBC7  D0 6A
  inc _var_00f0                  ; $DBC9  E6 F0
  ldx #$00                       ; $DBCB  A2 00

_label_dbcd:
  lda a:_var_0200_indexed,X      ; $DBCD  BD 00 02
  sta a:_var_0277_indexed,X      ; $DBD0  9D 77 02
  inx                            ; $DBD3  E8
  cpx #$06                       ; $DBD4  E0 06
  bne _label_dbcd                ; $DBD6  D0 F5
  lda _var_001d                  ; $DBD8  A5 1D
  sta _var_00a8                  ; $DBDA  85 A8
  lda _var_0065                  ; $DBDC  A5 65
  sta _var_00a7                  ; $DBDE  85 A7
  lda #$C8                       ; $DBE0  A9 C8
  sta a:_var_0201_indexed        ; $DBE2  8D 01 02
  sta a:_var_0204_indexed        ; $DBE5  8D 04 02
  lda #$77                       ; $DBE8  A9 77
  sta a:_var_0200_indexed        ; $DBEA  8D 00 02
  ldx #$00                       ; $DBED  A2 00

_label_dbef:
  lda a:_var_0207_indexed,X      ; $DBEF  BD 07 02
  sta a:_var_0262_indexed,X      ; $DBF2  9D 62 02
  inx                            ; $DBF5  E8
  cpx #$15                       ; $DBF6  E0 15
  bne _label_dbef                ; $DBF8  D0 F5

_label_dbfa:
  ldx #$00                       ; $DBFA  A2 00
  ldy #$00                       ; $DBFC  A0 00

_label_dbfe:
  lda #$68                       ; $DBFE  A9 68
  sta a:_var_0207_indexed,X      ; $DC00  9D 07 02
  lda #$01                       ; $DC03  A9 01
  sta a:_var_0209_indexed,X      ; $DC05  9D 09 02
  lda a:_data_dcf0_indexed,Y     ; $DC08  B9 F0 DC
  sta a:_var_0208_indexed,X      ; $DC0B  9D 08 02
  lda a:_data_dcf3_indexed,Y     ; $DC0E  B9 F3 DC
  sta a:_var_020b_indexed,X      ; $DC11  9D 0B 02
  lda a:_data_dcf6_indexed,Y     ; $DC14  B9 F6 DC
  sta a:_var_020a_indexed,X      ; $DC17  9D 0A 02
  lda #$00                       ; $DC1A  A9 00
  sta a:_var_020c_indexed,X      ; $DC1C  9D 0C 02
  iny                            ; $DC1F  C8
  cpy #$03                       ; $DC20  C0 03
  beq _label_dc2c                ; $DC22  F0 08
  txa                            ; $DC24  8A
  clc                            ; $DC25  18
  adc #$07                       ; $DC26  69 07
  tax                            ; $DC28  AA
  jmp _label_dbfe                ; $DC29  4C FE DB

_label_dc2c:
  lda #$01                       ; $DC2C  A9 01
  sta _var_007e                  ; $DC2E  85 7E
  sta _var_0025                  ; $DC30  85 25

_label_dc32:
  rts                            ; $DC32  60

_label_dc33:
  lda #$01                       ; $DC33  A9 01
  sta _var_00a6_indexed          ; $DC35  85 A6
  sta _var_0032                  ; $DC37  85 32
  lda _var_00a7                  ; $DC39  A5 A7
  bne _label_dc41                ; $DC3B  D0 04
  lda _var_0065                  ; $DC3D  A5 65
  bne _label_dc54                ; $DC3F  D0 13

_label_dc41:
  lda _var_0065                  ; $DC41  A5 65
  beq _label_dc4e                ; $DC43  F0 09

_label_dc45:
  cmp _var_00a7                  ; $DC45  C5 A7
  beq _label_dc63                ; $DC47  F0 1A
  bcc _label_dcb4                ; $DC49  90 69
  jmp _label_dcae                ; $DC4B  4C AE DC

_label_dc4e:
  lda _var_00a8                  ; $DC4E  A5 A8
  cmp _var_001d                  ; $DC50  C5 1D
  beq _label_dc5d                ; $DC52  F0 09

_label_dc54:
  lda _var_00a8                  ; $DC54  A5 A8
  and #$02                       ; $DC56  29 02
  beq _label_dcb4                ; $DC58  F0 5A
  jmp _label_dcae                ; $DC5A  4C AE DC

_label_dc5d:
  lda _var_0065                  ; $DC5D  A5 65
  cmp _var_00a7                  ; $DC5F  C5 A7
  bne _label_dc45                ; $DC61  D0 E2

_label_dc63:
  lda #$00                       ; $DC63  A9 00
  sta _var_00a6_indexed          ; $DC65  85 A6
  sta _var_00f0                  ; $DC67  85 F0
  tax                            ; $DC69  AA

_label_dc6a:
  lda a:_var_0277_indexed,X      ; $DC6A  BD 77 02
  sta a:_var_0200_indexed,X      ; $DC6D  9D 00 02
  inx                            ; $DC70  E8
  cpx #$06                       ; $DC71  E0 06
  bne _label_dc6a                ; $DC73  D0 F5
  ldx #$00                       ; $DC75  A2 00

_label_dc77:
  lda a:_var_0262_indexed,X      ; $DC77  BD 62 02
  sta a:_var_0207_indexed,X      ; $DC7A  9D 07 02
  inx                            ; $DC7D  E8
  cpx #$15                       ; $DC7E  E0 15
  bne _label_dc77                ; $DC80  D0 F5
  lda #$00                       ; $DC82  A9 00
  sta _var_007e                  ; $DC84  85 7E
  lda #$EF                       ; $DC86  A9 EF
  sta a:_var_0277_indexed        ; $DC88  8D 77 02
  inc _var_0025                  ; $DC8B  E6 25
  rts                            ; $DC8D  60

_label_dc8e:
  lda _var_007e                  ; $DC8E  A5 7E
  beq _label_dceb                ; $DC90  F0 59
  lda _var_001f_indexed          ; $DC92  A5 1F
  cmp #$41                       ; $DC94  C9 41
  bcs _label_dceb                ; $DC96  B0 53
  and #$07                       ; $DC98  29 07
  beq _label_dceb                ; $DC9A  F0 4F
  lda _var_004b                  ; $DC9C  A5 4B
  and #$30                       ; $DC9E  29 30
  beq _label_dceb                ; $DCA0  F0 49
  lda #$01                       ; $DCA2  A9 01
  sta _var_0032                  ; $DCA4  85 32
  sta _var_0025                  ; $DCA6  85 25
  lda _var_004b                  ; $DCA8  A5 4B
  and #$10                       ; $DCAA  29 10
  beq _label_dcb4                ; $DCAC  F0 06

_label_dcae:
  jsr _func_c242                 ; $DCAE  20 42 C2
  jmp _label_dcb7                ; $DCB1  4C B7 DC

_label_dcb4:
  jsr _func_c1e2                 ; $DCB4  20 E2 C1

_label_dcb7:
  lda #$77                       ; $DCB7  A9 77
  sta a:_var_0200_indexed        ; $DCB9  8D 00 02
  ldx #$00                       ; $DCBC  A2 00
  ldy #$00                       ; $DCBE  A0 00

_label_dcc0:
  jsr _func_d487                 ; $DCC0  20 87 D4
  lda a:_var_0208_indexed,X      ; $DCC3  BD 08 02
  cmp #$EF                       ; $DCC6  C9 EF
  beq _label_dce1                ; $DCC8  F0 17
  lda a:_var_0207_indexed,X      ; $DCCA  BD 07 02
  sta _var_0032                  ; $DCCD  85 32
  lda a:_var_020c_indexed,X      ; $DCCF  BD 0C 02
  sta _var_0031_indexed          ; $DCD2  85 31
  jsr _func_e70b                 ; $DCD4  20 0B E7
  lda _var_0032                  ; $DCD7  A5 32
  sta a:_var_0207_indexed,X      ; $DCD9  9D 07 02
  lda _var_0031_indexed          ; $DCDC  A5 31
  sta a:_var_020c_indexed,X      ; $DCDE  9D 0C 02

_label_dce1:
  iny                            ; $DCE1  C8
  tya                            ; $DCE2  98
  tax                            ; $DCE3  AA
  cpy #$20                       ; $DCE4  C0 20
  bne _label_dcc0                ; $DCE6  D0 D8
  jmp _label_dbfa                ; $DCE8  4C FA DB

_label_dceb:
  lda #$00                       ; $DCEB  A9 00
  sta _var_0025                  ; $DCED  85 25
  rts                            ; $DCEF  60

_data_dcf0_indexed:
.byte $f0, $f4, $f8              ; $DCF0

_data_dcf3_indexed:
.byte $f2, $f6, $c8              ; $DCF3

_data_dcf6_indexed:
.byte $68, $78, $88              ; $DCF6

_label_dcf9:
  lda a:_var_0200_indexed        ; $DCF9  AD 00 02
  and #$07                       ; $DCFC  29 07
  cmp #$07                       ; $DCFE  C9 07
  bne _label_dd3d                ; $DD00  D0 3B
  ldx #$00                       ; $DD02  A2 00
  lda _var_0067                  ; $DD04  A5 67
  beq _label_dd0a                ; $DD06  F0 02
  inx                            ; $DD08  E8
  inx                            ; $DD09  E8

_label_dd0a:
  lda _var_006a                  ; $DD0A  A5 6A
  beq _label_dd0f                ; $DD0C  F0 01
  inx                            ; $DD0E  E8

_label_dd0f:
  lda a:_data_dd47_indexed,X     ; $DD0F  BD 47 DD
  tay                            ; $DD12  A8

_label_dd13:
  ldx #$00                       ; $DD13  A2 00
  lda a:_var_0368_indexed,Y      ; $DD15  B9 68 03

_label_dd18:
  cmp a:_data_eac5_indexed,X     ; $DD18  DD C5 EA
  beq _label_dd3d                ; $DD1B  F0 20
  inx                            ; $DD1D  E8
  cpx #$06                       ; $DD1E  E0 06
  bne _label_dd18                ; $DD20  D0 F6
  lda _var_006a                  ; $DD22  A5 6A
  bne _label_dd33                ; $DD24  D0 0D
  cpy #$04                       ; $DD26  C0 04
  beq _label_dd3c                ; $DD28  F0 12
  cpy #$07                       ; $DD2A  C0 07
  beq _label_dd33                ; $DD2C  F0 05
  ldy #$07                       ; $DD2E  A0 07
  jmp _label_dd13                ; $DD30  4C 13 DD

_label_dd33:
  cpy #$04                       ; $DD33  C0 04
  beq _label_dd3c                ; $DD35  F0 05
  ldy #$04                       ; $DD37  A0 04
  jmp _label_dd13                ; $DD39  4C 13 DD

_label_dd3c:
  rts                            ; $DD3C  60

_label_dd3d:
  lda _var_0067                  ; $DD3D  A5 67
  bne _label_dd44                ; $DD3F  D0 03
  jmp _label_e8b4                ; $DD41  4C B4 E8

_label_dd44:
  jmp _label_e9d6                ; $DD44  4C D6 E9

_data_dd47_indexed:
.byte $05, $0b, $03, $09         ; $DD47

_func_dd4b:
  lda #$00                       ; $DD4B  A9 00
  sta _var_00af                  ; $DD4D  85 AF

_label_dd4f:
  ldy _var_00af                  ; $DD4F  A4 AF
  lda a:_var_0124_indexed,Y      ; $DD51  B9 24 01
  bne _label_dd5f                ; $DD54  D0 09

_label_dd56:
  inc _var_00af                  ; $DD56  E6 AF
  lda _var_00af                  ; $DD58  A5 AF
  cmp #$0A                       ; $DD5A  C9 0A
  bne _label_dd4f                ; $DD5C  D0 F1
  rts                            ; $DD5E  60

_label_dd5f:
  jsr _func_e476                 ; $DD5F  20 76 E4
  ldy _var_00af                  ; $DD62  A4 AF
  jsr _func_d36d                 ; $DD64  20 6D D3
  tax                            ; $DD67  AA
  lda a:_var_0124_indexed,Y      ; $DD68  B9 24 01
  clc                            ; $DD6B  18
  adc #$01                       ; $DD6C  69 01
  sta a:_var_0124_indexed,Y      ; $DD6E  99 24 01
  cmp #$78                       ; $DD71  C9 78
  bcs _label_dda4                ; $DD73  B0 2F
  lda a:_var_020e_indexed,X      ; $DD75  BD 0E 02
  sta _var_009b                  ; $DD78  85 9B
  lda a:_var_0124_indexed,Y      ; $DD7A  B9 24 01
  and #$02                       ; $DD7D  29 02
  beq _label_dd87                ; $DD7F  F0 06
  inc a:_var_020e_indexed,X      ; $DD81  FE 0E 02
  jmp _label_dd8a                ; $DD84  4C 8A DD

_label_dd87:
  dec a:_var_020e_indexed,X      ; $DD87  DE 0E 02

_label_dd8a:
  lda a:_var_020e_indexed,X      ; $DD8A  BD 0E 02
  sta _var_00a1                  ; $DD8D  85 A1
  lda a:_var_0213_indexed,X      ; $DD8F  BD 13 02
  sta _var_0031_indexed          ; $DD92  85 31
  jsr _func_e711                 ; $DD94  20 11 E7
  lda _var_0032                  ; $DD97  A5 32
  sta a:_var_020e_indexed,X      ; $DD99  9D 0E 02
  lda _var_0031_indexed          ; $DD9C  A5 31
  sta a:_var_0213_indexed,X      ; $DD9E  9D 13 02
  jmp _label_dd56                ; $DDA1  4C 56 DD

_label_dda4:
  cmp #$7B                       ; $DDA4  C9 7B
  bcs _label_ddc2                ; $DDA6  B0 1A
  dec a:_var_020e_indexed,X      ; $DDA8  DE 0E 02
  dec a:_var_020e_indexed,X      ; $DDAB  DE 0E 02
  lda #$02                       ; $DDAE  A9 02
  sta a:_var_00d0_indexed,Y      ; $DDB0  99 D0 00
  cpy _var_0066                  ; $DDB3  C4 66
  beq _label_ddbf                ; $DDB5  F0 08
  lda #$00                       ; $DDB7  A9 00
  sta a:_var_0124_indexed,Y      ; $DDB9  99 24 01
  jmp _label_dd56                ; $DDBC  4C 56 DD

_label_ddbf:
  jmp _label_dd56                ; $DDBF  4C 56 DD

_label_ddc2:
  cmp #$87                       ; $DDC2  C9 87
  bcc _label_dd56                ; $DDC4  90 90
  cpy _var_0066                  ; $DDC6  C4 66
  bne _label_ddee                ; $DDC8  D0 24
  lda a:_var_0138                ; $DDCA  AD 38 01
  sta _var_0056                  ; $DDCD  85 56
  lda a:_var_0139                ; $DDCF  AD 39 01
  sta _var_005b                  ; $DDD2  85 5B
  lda a:_var_013a                ; $DDD4  AD 3A 01
  sta _var_0052                  ; $DDD7  85 52
  jsr _func_d0c7                 ; $DDD9  20 C7 D0
  lda #$00                       ; $DDDC  A9 00
  sta a:_var_0138                ; $DDDE  8D 38 01
  sta a:_var_0139                ; $DDE1  8D 39 01
  sta a:_var_013a                ; $DDE4  8D 3A 01
  sta a:_var_010e                ; $DDE7  8D 0E 01
  lda #$FF                       ; $DDEA  A9 FF
  sta _var_0066                  ; $DDEC  85 66

_label_ddee:
  ldy _var_00af                  ; $DDEE  A4 AF
  lda #$00                       ; $DDF0  A9 00
  sta a:_var_0124_indexed,Y      ; $DDF2  99 24 01
  jmp _label_dd56                ; $DDF5  4C 56 DD

_func_ddf8:
  lda a:_var_010e                ; $DDF8  AD 0E 01
  bne _label_ddfe                ; $DDFB  D0 01
  rts                            ; $DDFD  60

_label_ddfe:
  cmp #$01                       ; $DDFE  C9 01
  beq _label_de47                ; $DE00  F0 45
  cmp #$02                       ; $DE02  C9 02
  beq _label_de2f                ; $DE04  F0 29
  lda a:_var_0138                ; $DE06  AD 38 01
  sta _var_0056                  ; $DE09  85 56
  lda a:_var_0139                ; $DE0B  AD 39 01
  sta _var_005b                  ; $DE0E  85 5B
  lda a:_var_013a                ; $DE10  AD 3A 01
  sta _var_0052                  ; $DE13  85 52
  jsr _func_d0c7                 ; $DE15  20 C7 D0
  lda #$01                       ; $DE18  A9 01
  sta a:_var_010e                ; $DE1A  8D 0E 01
  ldx _var_0066                  ; $DE1D  A6 66
  lda #$00                       ; $DE1F  A9 00
  sta a:_var_0124_indexed,X      ; $DE21  9D 24 01
  lda #$02                       ; $DE24  A9 02
  sta _var_00d0_indexed,X        ; $DE26  95 D0
  lda #$FF                       ; $DE28  A9 FF
  sta _var_0066                  ; $DE2A  85 66
  jmp _label_de47                ; $DE2C  4C 47 DE

_label_de2f:
  lda a:_var_0138                ; $DE2F  AD 38 01
  sta _var_0056                  ; $DE32  85 56
  lda a:_var_0139                ; $DE34  AD 39 01
  sta _var_005b                  ; $DE37  85 5B
  lda a:_var_013a                ; $DE39  AD 3A 01
  sta _var_0052                  ; $DE3C  85 52
  lda a:_var_06b8                ; $DE3E  AD B8 06
  sta a:_var_0136                ; $DE41  8D 36 01
  jmp _label_dee6                ; $DE44  4C E6 DE

_label_de47:
  lda a:_var_0207_indexed        ; $DE47  AD 07 02
  sec                            ; $DE4A  38
  sbc #$10                       ; $DE4B  E9 10
  sta _var_00a1                  ; $DE4D  85 A1
  lda _var_0067                  ; $DE4F  A5 67
  beq _label_de5c                ; $DE51  F0 09
  lda a:_var_020a_indexed        ; $DE53  AD 0A 02
  sec                            ; $DE56  38
  sbc #$10                       ; $DE57  E9 10
  jmp _label_de62                ; $DE59  4C 62 DE

_label_de5c:
  lda a:_var_020a_indexed        ; $DE5C  AD 0A 02
  clc                            ; $DE5F  18
  adc #$10                       ; $DE60  69 10

_label_de62:
  sta _var_00a2                  ; $DE62  85 A2
  lda a:_var_0209_indexed        ; $DE64  AD 09 02
  sta a:_var_0136                ; $DE67  8D 36 01
  sta a:_var_06b8                ; $DE6A  8D B8 06
  jsr _func_d063                 ; $DE6D  20 63 D0
  lda _var_0056                  ; $DE70  A5 56
  cmp a:_var_0138                ; $DE72  CD 38 01
  bne _label_de85                ; $DE75  D0 0E
  lda _var_005b                  ; $DE77  A5 5B
  cmp a:_var_0139                ; $DE79  CD 39 01
  bne _label_de85                ; $DE7C  D0 07
  lda _var_0052                  ; $DE7E  A5 52
  cmp a:_var_013a                ; $DE80  CD 3A 01
  beq _label_debf                ; $DE83  F0 3A

_label_de85:
  lda _var_0052                  ; $DE85  A5 52
  sta a:_var_013a                ; $DE87  8D 3A 01
  lda #$00                       ; $DE8A  A9 00
  sta _var_0030                  ; $DE8C  85 30
  lda a:_var_0136                ; $DE8E  AD 36 01
  and #$40                       ; $DE91  29 40
  beq _label_de97                ; $DE93  F0 02
  inc _var_0030                  ; $DE95  E6 30

_label_de97:
  lda _var_0030                  ; $DE97  A5 30
  asl a                          ; $DE99  0A
  tax                            ; $DE9A  AA
  lda a:_data_dfb7_indexed,X     ; $DE9B  BD B7 DF
  sta _var_002d_indexed          ; $DE9E  85 2D
  lda a:_data_dfb8_indexed,X     ; $DEA0  BD B8 DF
  sta _var_002e                  ; $DEA3  85 2E
  ldx _var_0056                  ; $DEA5  A6 56
  ldy _var_005b                  ; $DEA7  A4 5B
  lda _var_0052                  ; $DEA9  A5 52
  beq _label_dec2                ; $DEAB  F0 15
  cmp #$01                       ; $DEAD  C9 01
  beq _label_decf                ; $DEAF  F0 1E
  cmp #$02                       ; $DEB1  C9 02
  beq _label_dedc                ; $DEB3  F0 27
  lda a:_var_0580_indexed,X      ; $DEB5  BD 80 05
  and a:_data_dfbb_indexed,Y     ; $DEB8  39 BB DF
  cmp (_var_002d_indexed),Y      ; $DEBB  D1 2D
  beq _label_dee6                ; $DEBD  F0 27

_label_debf:
  jmp _label_df60                ; $DEBF  4C 60 DF

_label_dec2:
  lda a:_var_0400_indexed,X      ; $DEC2  BD 00 04
  and a:_data_dfbb_indexed,Y     ; $DEC5  39 BB DF
  cmp (_var_002d_indexed),Y      ; $DEC8  D1 2D
  beq _label_dee6                ; $DECA  F0 1A
  jmp _label_df60                ; $DECC  4C 60 DF

_label_decf:
  lda a:_var_0480_indexed,X      ; $DECF  BD 80 04
  and a:_data_dfbb_indexed,Y     ; $DED2  39 BB DF
  cmp (_var_002d_indexed),Y      ; $DED5  D1 2D
  beq _label_dee6                ; $DED7  F0 0D
  jmp _label_df60                ; $DED9  4C 60 DF

_label_dedc:
  lda a:_var_0500_indexed,X      ; $DEDC  BD 00 05
  and a:_data_dfbb_indexed,Y     ; $DEDF  39 BB DF
  cmp (_var_002d_indexed),Y      ; $DEE2  D1 2D
  bne _label_df60                ; $DEE4  D0 7A

_label_dee6:
  lda a:_var_0136                ; $DEE6  AD 36 01
  sta _var_00a3                  ; $DEE9  85 A3
  inc _var_006b                  ; $DEEB  E6 6B
  inc _var_008d_indexed          ; $DEED  E6 8D
  jmp _label_d186                ; $DEEF  4C 86 D1

_label_def2:
  lda a:_var_010e                ; $DEF2  AD 0E 01
  cmp #$02                       ; $DEF5  C9 02
  beq _label_df6c                ; $DEF7  F0 73
  lda _var_0066                  ; $DEF9  A5 66
  cmp #$FF                       ; $DEFB  C9 FF
  bne _label_df6c                ; $DEFD  D0 6D
  jsr _func_cf34                 ; $DEFF  20 34 CF
  txa                            ; $DF02  8A
  sta _var_0066                  ; $DF03  85 66
  tay                            ; $DF05  A8
  jsr _func_d487                 ; $DF06  20 87 D4
  lda _var_00a1                  ; $DF09  A5 A1
  sta a:_var_020e_indexed,X      ; $DF0B  9D 0E 02
  lda _var_00a2                  ; $DF0E  A5 A2
  sta a:_var_0211_indexed,X      ; $DF10  9D 11 02
  lda #$00                       ; $DF13  A9 00
  sta a:_var_0213_indexed,X      ; $DF15  9D 13 02
  lda a:_var_0136                ; $DF18  AD 36 01
  sta a:_var_0210_indexed,X      ; $DF1B  9D 10 02
  and #$40                       ; $DF1E  29 40
  bne _label_df2f                ; $DF20  D0 0D
  lda #$10                       ; $DF22  A9 10
  sta a:_var_020f_indexed,X      ; $DF24  9D 0F 02
  lda #$12                       ; $DF27  A9 12
  sta a:_var_0212_indexed,X      ; $DF29  9D 12 02
  jmp _label_df39                ; $DF2C  4C 39 DF

_label_df2f:
  lda #$12                       ; $DF2F  A9 12
  sta a:_var_020f_indexed,X      ; $DF31  9D 0F 02
  lda #$10                       ; $DF34  A9 10
  sta a:_var_0212_indexed,X      ; $DF36  9D 12 02

_label_df39:
  jsr _func_d41a                 ; $DF39  20 1A D4
  lda _var_0056                  ; $DF3C  A5 56
  sta a:_var_00b1_indexed,Y      ; $DF3E  99 B1 00
  sta a:_var_0138                ; $DF41  8D 38 01
  lda _var_005b                  ; $DF44  A5 5B
  sta a:_var_00bc_indexed,Y      ; $DF46  99 BC 00
  sta a:_var_0139                ; $DF49  8D 39 01
  lda a:_var_013a                ; $DF4C  AD 3A 01
  clc                            ; $DF4F  18
  adc #$01                       ; $DF50  69 01
  sta a:_var_00db_indexed,Y      ; $DF52  99 DB 00
  inc a:_var_010e                ; $DF55  EE 0E 01
  lda #$01                       ; $DF58  A9 01
  sta a:_var_0124_indexed,Y      ; $DF5A  99 24 01
  jmp _label_df6c                ; $DF5D  4C 6C DF

_label_df60:
  lda a:_var_010e                ; $DF60  AD 0E 01
  cmp #$02                       ; $DF63  C9 02
  beq _label_df73                ; $DF65  F0 0C
  lda #$00                       ; $DF67  A9 00
  sta a:_var_010e                ; $DF69  8D 0E 01

_label_df6c:
  lda #$00                       ; $DF6C  A9 00
  sta _var_006b                  ; $DF6E  85 6B
  sta _var_008d_indexed          ; $DF70  85 8D
  rts                            ; $DF72  60

_label_df73:
  ldx _var_0066                  ; $DF73  A6 66
  lda a:_var_0124_indexed,X      ; $DF75  BD 24 01
  cmp #$7A                       ; $DF78  C9 7A
  bcs _label_df6c                ; $DF7A  B0 F0
  ldx _var_0066                  ; $DF7C  A6 66
  lda #$00                       ; $DF7E  A9 00
  sta _var_006b                  ; $DF80  85 6B
  sta _var_008d_indexed          ; $DF82  85 8D
  sta _var_00d0_indexed,X        ; $DF84  95 D0
  sta a:_var_0138                ; $DF86  8D 38 01
  sta a:_var_0139                ; $DF89  8D 39 01
  sta a:_var_013a                ; $DF8C  8D 3A 01
  sta a:_var_010e                ; $DF8F  8D 0E 01
  sta a:_var_0124_indexed,X      ; $DF92  9D 24 01
  lda #$FF                       ; $DF95  A9 FF
  sta _var_0066                  ; $DF97  85 66
  jsr _func_d41a                 ; $DF99  20 1A D4
  jsr _func_db17                 ; $DF9C  20 17 DB
  lda a:_var_02f2                ; $DF9F  AD F2 02
  sta _var_00b1_indexed,X        ; $DFA2  95 B1
  lda a:_var_02f0                ; $DFA4  AD F0 02
  sta _var_00bc_indexed,X        ; $DFA7  95 BC
  inc _var_00c6_indexed,X        ; $DFA9  F6 C6
  jsr _func_d487                 ; $DFAB  20 87 D4
  lda #$EF                       ; $DFAE  A9 EF
  sta a:_var_020e_indexed,X      ; $DFB0  9D 0E 02
  sta a:_var_020f_indexed,X      ; $DFB3  9D 0F 02
  rts                            ; $DFB6  60

_data_dfb7_indexed:
.byte $bf                        ; $DFB7

_data_dfb8_indexed:
.byte $df, $c3, $df              ; $DFB8

_data_dfbb_indexed:
.byte $c0, $30, $0c, $03, $40, $10, $04, $01, $80, $20, $08, $02 ; $DFBB

_func_dfc7:
  lda #$00                       ; $DFC7  A9 00
  sta _var_0078                  ; $DFC9  85 78
  sta _var_007a                  ; $DFCB  85 7A
  sta _var_005c                  ; $DFCD  85 5C
  lda #$FC                       ; $DFCF  A9 FC
  sta a:_var_02da                ; $DFD1  8D DA 02
  lda #$FE                       ; $DFD4  A9 FE
  sta a:_var_02dd                ; $DFD6  8D DD 02
  lda #$01                       ; $DFD9  A9 01
  sta a:_var_02db                ; $DFDB  8D DB 02
  lda #$00                       ; $DFDE  A9 00
  sta a:_var_02de                ; $DFE0  8D DE 02
  lda a:_var_020a_indexed        ; $DFE3  AD 0A 02
  sta a:_var_02dc                ; $DFE6  8D DC 02
  lda a:_var_0207_indexed        ; $DFE9  AD 07 02
  sec                            ; $DFEC  38
  sbc #$04                       ; $DFED  E9 04
  sta a:_var_02d9                ; $DFEF  8D D9 02
  jsr _func_c29c                 ; $DFF2  20 9C C2
  inc _var_0024                  ; $DFF5  E6 24
  rts                            ; $DFF7  60

_func_dff8:
  lda _var_0077                  ; $DFF8  A5 77
  beq _label_e005                ; $DFFA  F0 09
  lda a:_var_020a_indexed        ; $DFFC  AD 0A 02
  and #$07                       ; $DFFF  29 07
  cmp #$04                       ; $E001  C9 04
  beq _label_e006                ; $E003  F0 01

_label_e005:
  rts                            ; $E005  60

_label_e006:
  lda #$00                       ; $E006  A9 00
  sta _var_0031_indexed          ; $E008  85 31
  lda #$07                       ; $E00A  A9 07
  sta _var_00af                  ; $E00C  85 AF
  lda a:_var_0209_indexed        ; $E00E  AD 09 02
  and #$40                       ; $E011  29 40
  beq _label_e017                ; $E013  F0 02
  inc _var_0031_indexed          ; $E015  E6 31

_label_e017:
  lda a:_var_0207_indexed        ; $E017  AD 07 02
  sec                            ; $E01A  38
  sbc #$04                       ; $E01B  E9 04
  sta _var_00a1                  ; $E01D  85 A1
  cmp #$FF                       ; $E01F  C9 FF
  bne _label_e024                ; $E021  D0 01
  rts                            ; $E023  60

_label_e024:
  lda _var_0067                  ; $E024  A5 67
  beq _label_e033                ; $E026  F0 0B
  lda a:_var_020a_indexed        ; $E028  AD 0A 02
  clc                            ; $E02B  18
  adc #$04                       ; $E02C  69 04
  sta _var_00a2                  ; $E02E  85 A2
  jmp _label_e03b                ; $E030  4C 3B E0

_label_e033:
  lda a:_var_020a_indexed        ; $E033  AD 0A 02
  sec                            ; $E036  38
  sbc #$04                       ; $E037  E9 04
  sta _var_00a2                  ; $E039  85 A2

_label_e03b:
  jsr _func_d063                 ; $E03B  20 63 D0
  ldy _var_0056                  ; $E03E  A4 56
  ldx _var_005b                  ; $E040  A6 5B
  lda _var_0052                  ; $E042  A5 52
  beq _label_e04d                ; $E044  F0 07
  cmp #$01                       ; $E046  C9 01
  beq _label_e059                ; $E048  F0 0F
  jmp _label_e087                ; $E04A  4C 87 E0

_label_e04d:
  lda _var_0067                  ; $E04D  A5 67
  beq _label_e059                ; $E04F  F0 08
  cpx #$00                       ; $E051  E0 00
  bne _label_e058                ; $E053  D0 03
  dey                            ; $E055  88
  ldx #$04                       ; $E056  A2 04

_label_e058:
  dex                            ; $E058  CA

_label_e059:
  lda a:_var_0480_indexed,Y      ; $E059  B9 80 04
  and a:_data_e109_indexed,X     ; $E05C  3D 09 E1
  cmp a:_data_e109_indexed,X     ; $E05F  DD 09 E1
  bne _label_e087                ; $E062  D0 23
  ldx #$00                       ; $E064  A2 00
  lda _var_0067                  ; $E066  A5 67
  beq _label_e07a                ; $E068  F0 10

_label_e06a:
  lda a:_var_036e                ; $E06A  AD 6E 03
  cmp a:_data_e94c_indexed,X     ; $E06D  DD 4C E9
  beq _label_e0ed                ; $E070  F0 7B
  inx                            ; $E072  E8
  cpx #$08                       ; $E073  E0 08
  bne _label_e06a                ; $E075  D0 F3
  jmp _label_e087                ; $E077  4C 87 E0

_label_e07a:
  lda a:_var_0370                ; $E07A  AD 70 03
  cmp a:_data_e94c_indexed,X     ; $E07D  DD 4C E9
  beq _label_e0ed                ; $E080  F0 6B
  inx                            ; $E082  E8
  cpx #$08                       ; $E083  E0 08
  bne _label_e07a                ; $E085  D0 F3

_label_e087:
  jsr _func_e827                 ; $E087  20 27 E8
  jsr _func_e151                 ; $E08A  20 51 E1
  jsr _func_e10e                 ; $E08D  20 0E E1
  lda (_var_002d_indexed),Y      ; $E090  B1 2D
  and a:_data_e109_indexed,X     ; $E092  3D 09 E1
  beq _label_e09c                ; $E095  F0 05
  cmp a:_data_e109_indexed,X     ; $E097  DD 09 E1
  bne _label_e0ed                ; $E09A  D0 51

_label_e09c:
  lda _var_0052                  ; $E09C  A5 52
  cmp #$02                       ; $E09E  C9 02
  bcc _label_e0a5                ; $E0A0  90 03
  jsr _func_d407                 ; $E0A2  20 07 D4

_label_e0a5:
  jsr _func_e151                 ; $E0A5  20 51 E1
  jsr _func_e10e                 ; $E0A8  20 0E E1
  lda (_var_002d_indexed),Y      ; $E0AB  B1 2D
  and a:_data_e109_indexed,X     ; $E0AD  3D 09 E1
  bne _label_e0ed                ; $E0B0  D0 3B
  lda _var_0052                  ; $E0B2  A5 52
  cmp #$02                       ; $E0B4  C9 02
  bcs _label_e0bd                ; $E0B6  B0 05
  jsr _func_d41a                 ; $E0B8  20 1A D4
  ldy _var_0056                  ; $E0BB  A4 56

_label_e0bd:
  lda _var_0031_indexed          ; $E0BD  A5 31
  bne _label_e0d4                ; $E0BF  D0 13
  jsr _func_e151                 ; $E0C1  20 51 E1
  jsr _func_e10e                 ; $E0C4  20 0E E1
  lda (_var_002d_indexed),Y      ; $E0C7  B1 2D
  and a:_data_e109_indexed,X     ; $E0C9  3D 09 E1
  beq _label_e0d3                ; $E0CC  F0 05
  cmp a:_data_e109_indexed,X     ; $E0CE  DD 09 E1
  bne _label_e0ed                ; $E0D1  D0 1A

_label_e0d3:
  rts                            ; $E0D3  60

_label_e0d4:
  inc _var_00af                  ; $E0D4  E6 AF
  jsr _func_e151                 ; $E0D6  20 51 E1
  jsr _func_e10e                 ; $E0D9  20 0E E1
  lda _var_002f_indexed          ; $E0DC  A5 2F
  beq _label_e0ec                ; $E0DE  F0 0C
  lda (_var_002d_indexed),Y      ; $E0E0  B1 2D
  and a:_data_e109_indexed,X     ; $E0E2  3D 09 E1
  beq _label_e0ec                ; $E0E5  F0 05
  cmp a:_data_e109_indexed,X     ; $E0E7  DD 09 E1
  bne _label_e0ed                ; $E0EA  D0 01

_label_e0ec:
  rts                            ; $E0EC  60

_label_e0ed:
  lda _var_004b                  ; $E0ED  A5 4B
  and #$C0                       ; $E0EF  29 C0
  beq _label_e0ec                ; $E0F1  F0 F9
  lda _var_0067                  ; $E0F3  A5 67
  beq _label_e100                ; $E0F5  F0 09
  lda _var_004b                  ; $E0F7  A5 4B
  and #$BF                       ; $E0F9  29 BF
  sta _var_004b                  ; $E0FB  85 4B
  jmp _label_c4a5                ; $E0FD  4C A5 C4

_label_e100:
  lda _var_004b                  ; $E100  A5 4B
  and #$7F                       ; $E102  29 7F
  sta _var_004b                  ; $E104  85 4B
  jmp _label_c4a5                ; $E106  4C A5 C4

_data_e109_indexed:
.byte $c0, $30, $0c, $03, $c0    ; $E109

_func_e10e:
  lda #$00                       ; $E10E  A9 00
  sta _var_002f_indexed          ; $E110  85 2F
  lda _var_0052                  ; $E112  A5 52
  beq _label_e11e                ; $E114  F0 08
  cmp #$01                       ; $E116  C9 01
  beq _label_e12a                ; $E118  F0 10
  cmp #$02                       ; $E11A  C9 02
  beq _label_e12a                ; $E11C  F0 0C

_label_e11e:
  lda _var_0067                  ; $E11E  A5 67
  beq _label_e136                ; $E120  F0 14

_label_e122:
  lda _var_0030                  ; $E122  A5 30
  bne _label_e14c                ; $E124  D0 26
  dex                            ; $E126  CA
  jmp _label_e14c                ; $E127  4C 4C E1

_label_e12a:
  lda _var_0067                  ; $E12A  A5 67
  bne _label_e13f                ; $E12C  D0 11

_label_e12e:
  lda _var_0030                  ; $E12E  A5 30
  bne _label_e14c                ; $E130  D0 1A
  inx                            ; $E132  E8
  jmp _label_e14c                ; $E133  4C 4C E1

_label_e136:
  lda _var_00af                  ; $E136  A5 AF
  cmp #$0A                       ; $E138  C9 0A
  beq _label_e148                ; $E13A  F0 0C
  jmp _label_e12e                ; $E13C  4C 2E E1

_label_e13f:
  lda _var_00af                  ; $E13F  A5 AF
  cmp #$0A                       ; $E141  C9 0A
  beq _label_e148                ; $E143  F0 03
  jmp _label_e122                ; $E145  4C 22 E1

_label_e148:
  lda _var_0030                  ; $E148  A5 30
  bne _label_e14e                ; $E14A  D0 02

_label_e14c:
  inc _var_002f_indexed          ; $E14C  E6 2F

_label_e14e:
  inc _var_00af                  ; $E14E  E6 AF
  rts                            ; $E150  60

_func_e151:
  lda _var_0052                  ; $E151  A5 52
  beq _label_e16e                ; $E153  F0 19
  cmp #$01                       ; $E155  C9 01
  beq _label_e17f                ; $E157  F0 26
  cmp #$02                       ; $E159  C9 02
  beq _label_e190                ; $E15B  F0 33
  lda _var_00af                  ; $E15D  A5 AF
  asl a                          ; $E15F  0A
  tax                            ; $E160  AA
  lda a:_data_e24b_indexed,X     ; $E161  BD 4B E2
  sta _var_002d_indexed          ; $E164  85 2D
  lda a:_data_e24c_indexed,X     ; $E166  BD 4C E2
  sta _var_002e                  ; $E169  85 2E
  jmp _label_e19e                ; $E16B  4C 9E E1

_label_e16e:
  lda _var_00af                  ; $E16E  A5 AF
  asl a                          ; $E170  0A
  tax                            ; $E171  AA
  lda a:_data_e1a3_indexed,X     ; $E172  BD A3 E1
  sta _var_002d_indexed          ; $E175  85 2D
  lda a:_data_e1a4_indexed,X     ; $E177  BD A4 E1
  sta _var_002e                  ; $E17A  85 2E
  jmp _label_e19e                ; $E17C  4C 9E E1

_label_e17f:
  lda _var_00af                  ; $E17F  A5 AF
  asl a                          ; $E181  0A
  tax                            ; $E182  AA
  lda a:_data_e1db_indexed,X     ; $E183  BD DB E1
  sta _var_002d_indexed          ; $E186  85 2D
  lda a:_data_e1dc_indexed,X     ; $E188  BD DC E1
  sta _var_002e                  ; $E18B  85 2E
  jmp _label_e19e                ; $E18D  4C 9E E1

_label_e190:
  lda _var_00af                  ; $E190  A5 AF
  asl a                          ; $E192  0A
  tax                            ; $E193  AA
  lda a:_data_e213_indexed,X     ; $E194  BD 13 E2
  sta _var_002d_indexed          ; $E197  85 2D
  lda a:_data_e214_indexed,X     ; $E199  BD 14 E2
  sta _var_002e                  ; $E19C  85 2E

_label_e19e:
  ldx _var_005b                  ; $E19E  A6 5B
  ldy _var_0056                  ; $E1A0  A4 56
  rts                            ; $E1A2  60

_data_e1a3_indexed:
.byte $00                        ; $E1A3

_data_e1a4_indexed:
.byte $04, $80, $05, $00, $05, $80, $05, $00, $05, $80, $04, $00, $04, $00, $04, $80 ; $E1A4
.byte $05, $80, $05, $00, $05, $00, $04, $80, $04, $00, $05, $00, $04, $00, $04, $80 ; $E1B4
.byte $05, $00, $05, $80, $05, $00, $04, $80, $04, $00, $05, $00, $05, $00, $05, $00 ; $E1C4
.byte $04, $80, $04, $80, $04, $00, $04 ; $E1D4

_data_e1db_indexed:
.byte $80                        ; $E1DB

_data_e1dc_indexed:
.byte $04, $00, $05, $80, $05, $00, $05, $80, $05, $00, $04, $80, $04, $80, $04, $00 ; $E1DC
.byte $05, $00, $05, $80, $05, $80, $04, $00, $04, $80, $05, $80, $04, $80, $04, $00 ; $E1EC
.byte $05, $80, $05, $00, $05, $80, $04, $00, $04, $80, $05, $80, $05, $80, $05, $80 ; $E1FC
.byte $04, $00, $04, $00, $04, $80, $04 ; $E20C

_data_e213_indexed:
.byte $00                        ; $E213

_data_e214_indexed:
.byte $05, $80, $04, $00, $04, $80, $04, $00, $04, $80, $05, $00, $05, $00, $05, $80 ; $E214
.byte $04, $80, $04, $00, $04, $00, $05, $80, $05, $00, $04, $00, $05, $00, $05, $80 ; $E224
.byte $04, $00, $04, $80, $04, $00, $05, $80, $05, $00, $04, $00, $04, $00, $04, $00 ; $E234
.byte $05, $80, $05, $80, $05, $00, $05 ; $E244

_data_e24b_indexed:
.byte $80                        ; $E24B

_data_e24c_indexed:
.byte $05, $00, $04, $80, $04, $00, $04, $80, $04, $00, $05, $80, $05, $80, $05, $00 ; $E24C
.byte $04, $00, $04, $80, $04, $80, $05, $00, $05, $80, $04, $80, $05, $80, $05, $00 ; $E25C
.byte $04, $80, $04, $00, $04, $80, $05, $00, $05, $80, $04, $80, $04, $80, $04, $80 ; $E26C
.byte $05, $00, $05, $00, $05, $80, $05 ; $E27C

_func_e283:
  lda _var_00af                  ; $E283  A5 AF
  beq _label_e2b5                ; $E285  F0 2E
  cmp #$01                       ; $E287  C9 01
  beq _label_e29d                ; $E289  F0 12
  cmp #$03                       ; $E28B  C9 03
  beq _label_e2b2                ; $E28D  F0 23
  cmp #$04                       ; $E28F  C9 04
  beq _label_e2b2                ; $E291  F0 1F
  cmp #$05                       ; $E293  C9 05
  bne _label_e2b5                ; $E295  D0 1E
  lda _var_0052                  ; $E297  A5 52
  cmp #$02                       ; $E299  C9 02
  bcc _label_e2a9                ; $E29B  90 0C

_label_e29d:
  lda _var_0052                  ; $E29D  A5 52
  cmp #$02                       ; $E29F  C9 02
  bcc _label_e2b5                ; $E2A1  90 12
  jsr _func_d407                 ; $E2A3  20 07 D4
  jmp _label_e2b5                ; $E2A6  4C B5 E2

_label_e2a9:
  jsr _func_d407                 ; $E2A9  20 07 D4
  jsr _func_d407                 ; $E2AC  20 07 D4
  jmp _label_e2b5                ; $E2AF  4C B5 E2

_label_e2b2:
  jsr _func_d41a                 ; $E2B2  20 1A D4

_label_e2b5:
  ldx _var_005b                  ; $E2B5  A6 5B
  ldy _var_0056                  ; $E2B7  A4 56
  lda _var_0067                  ; $E2B9  A5 67
  beq _label_e2e1                ; $E2BB  F0 24
  lda _var_0052                  ; $E2BD  A5 52
  cmp #$01                       ; $E2BF  C9 01
  beq _label_e2d0                ; $E2C1  F0 0D
  cmp #$02                       ; $E2C3  C9 02
  beq _label_e2d0                ; $E2C5  F0 09

_label_e2c7:
  cpx #$00                       ; $E2C7  E0 00
  bne _label_e2ce                ; $E2C9  D0 03
  dey                            ; $E2CB  88
  ldx #$04                       ; $E2CC  A2 04

_label_e2ce:
  dex                            ; $E2CE  CA
  rts                            ; $E2CF  60

_label_e2d0:
  lda _var_00af                  ; $E2D0  A5 AF
  beq _label_e2c7                ; $E2D2  F0 F3
  cmp #$01                       ; $E2D4  C9 01
  beq _label_e2c7                ; $E2D6  F0 EF
  cmp #$03                       ; $E2D8  C9 03
  beq _label_e2c7                ; $E2DA  F0 EB
  cmp #$06                       ; $E2DC  C9 06
  beq _label_e2c7                ; $E2DE  F0 E7
  rts                            ; $E2E0  60

_label_e2e1:
  lda _var_0052                  ; $E2E1  A5 52
  beq _label_e2f2                ; $E2E3  F0 0D
  cmp #$03                       ; $E2E5  C9 03
  beq _label_e2f2                ; $E2E7  F0 09

_label_e2e9:
  cpx #$03                       ; $E2E9  E0 03
  bne _label_e2f0                ; $E2EB  D0 03
  iny                            ; $E2ED  C8
  ldx #$FF                       ; $E2EE  A2 FF

_label_e2f0:
  inx                            ; $E2F0  E8
  rts                            ; $E2F1  60

_label_e2f2:
  lda _var_00af                  ; $E2F2  A5 AF
  beq _label_e2e9                ; $E2F4  F0 F3
  cmp #$01                       ; $E2F6  C9 01
  beq _label_e2e9                ; $E2F8  F0 EF
  cmp #$03                       ; $E2FA  C9 03
  beq _label_e2e9                ; $E2FC  F0 EB
  cmp #$06                       ; $E2FE  C9 06
  beq _label_e2e9                ; $E300  F0 E7
  rts                            ; $E302  60

_func_e303:
  lda #$00                       ; $E303  A9 00
  sta _var_0032                  ; $E305  85 32
  lda a:_var_0209_indexed        ; $E307  AD 09 02
  and #$40                       ; $E30A  29 40
  beq _label_e310                ; $E30C  F0 02
  inc _var_0032                  ; $E30E  E6 32

_label_e310:
  lda a:_var_0207_indexed        ; $E310  AD 07 02
  sta _var_00a1                  ; $E313  85 A1
  lda a:_var_020a_indexed        ; $E315  AD 0A 02
  sta _var_00a2                  ; $E318  85 A2
  cmp #$09                       ; $E31A  C9 09
  bcc _label_e328                ; $E31C  90 0A
  cmp #$E8                       ; $E31E  C9 E8
  bcs _label_e32f                ; $E320  B0 0D

_label_e322:
  jsr _func_d063                 ; $E322  20 63 D0
  jmp _label_e336                ; $E325  4C 36 E3

_label_e328:
  lda _var_0067                  ; $E328  A5 67
  beq _label_e322                ; $E32A  F0 F6
  jmp _label_e418                ; $E32C  4C 18 E4

_label_e32f:
  lda _var_0067                  ; $E32F  A5 67
  bne _label_e322                ; $E331  D0 EF

_label_e333:
  jmp _label_e418                ; $E333  4C 18 E4

_label_e336:
  lda _var_0052                  ; $E336  A5 52
  beq _label_e375                ; $E338  F0 3B
  cmp #$03                       ; $E33A  C9 03
  beq _label_e375                ; $E33C  F0 37
  jsr _func_d407                 ; $E33E  20 07 D4
  ldy _var_0056                  ; $E341  A4 56
  ldx _var_005b                  ; $E343  A6 5B
  lda _var_0067                  ; $E345  A5 67
  beq _label_e354                ; $E347  F0 0B
  cpx #$00                       ; $E349  E0 00
  bne _label_e350                ; $E34B  D0 03
  dey                            ; $E34D  88
  ldx #$04                       ; $E34E  A2 04

_label_e350:
  dex                            ; $E350  CA
  jmp _label_e35c                ; $E351  4C 5C E3

_label_e354:
  cpx #$03                       ; $E354  E0 03
  bne _label_e35b                ; $E356  D0 03
  iny                            ; $E358  C8
  ldx #$FF                       ; $E359  A2 FF

_label_e35b:
  inx                            ; $E35B  E8

_label_e35c:
  lda a:_var_0480_indexed,Y      ; $E35C  B9 80 04
  and a:_data_e458_indexed,X     ; $E35F  3D 58 E4
  cmp a:_data_e458_indexed,X     ; $E362  DD 58 E4
  beq _label_e333                ; $E365  F0 CC
  lda a:_var_0380_indexed,Y      ; $E367  B9 80 03
  and a:_data_e458_indexed,X     ; $E36A  3D 58 E4
  cmp a:_data_e458_indexed,X     ; $E36D  DD 58 E4
  beq _label_e333                ; $E370  F0 C1
  jsr _func_d41a                 ; $E372  20 1A D4

_label_e375:
  lda #$1A                       ; $E375  A9 1A
  sta _var_00af                  ; $E377  85 AF
  jsr _func_e151                 ; $E379  20 51 E1
  jsr _func_e283                 ; $E37C  20 83 E2
  lda (_var_002d_indexed),Y      ; $E37F  B1 2D
  and a:_data_e458_indexed,X     ; $E381  3D 58 E4
  beq _label_e38b                ; $E384  F0 05
  cmp a:_data_e458_indexed,X     ; $E386  DD 58 E4
  bne _label_e333                ; $E389  D0 A8

_label_e38b:
  lda #$00                       ; $E38B  A9 00
  sta _var_00af                  ; $E38D  85 AF
  jsr _func_e151                 ; $E38F  20 51 E1
  jsr _func_e283                 ; $E392  20 83 E2
  lda (_var_002d_indexed),Y      ; $E395  B1 2D
  and a:_data_e458_indexed,X     ; $E397  3D 58 E4
  beq _label_e3a1                ; $E39A  F0 05
  cmp a:_data_e458_indexed,X     ; $E39C  DD 58 E4
  bne _label_e418                ; $E39F  D0 77

_label_e3a1:
  inc _var_00af                  ; $E3A1  E6 AF
  jsr _func_e151                 ; $E3A3  20 51 E1
  jsr _func_e283                 ; $E3A6  20 83 E2
  lda (_var_002d_indexed),Y      ; $E3A9  B1 2D
  and a:_data_e458_indexed,X     ; $E3AB  3D 58 E4
  bne _label_e418                ; $E3AE  D0 68
  inc _var_00af                  ; $E3B0  E6 AF
  jsr _func_e151                 ; $E3B2  20 51 E1
  jsr _func_e283                 ; $E3B5  20 83 E2
  lda (_var_002d_indexed),Y      ; $E3B8  B1 2D
  and a:_data_e458_indexed,X     ; $E3BA  3D 58 E4
  bne _label_e418                ; $E3BD  D0 59
  inc _var_00af                  ; $E3BF  E6 AF
  lda _var_0032                  ; $E3C1  A5 32
  beq _label_e3c7                ; $E3C3  F0 02

_label_e3c5:
  inc _var_00af                  ; $E3C5  E6 AF

_label_e3c7:
  jsr _func_e151                 ; $E3C7  20 51 E1
  jsr _func_e283                 ; $E3CA  20 83 E2
  lda (_var_002d_indexed),Y      ; $E3CD  B1 2D
  and a:_data_e458_indexed,X     ; $E3CF  3D 58 E4
  beq _label_e3d9                ; $E3D2  F0 05
  cmp a:_data_e458_indexed,X     ; $E3D4  DD 58 E4
  bne _label_e418                ; $E3D7  D0 3F

_label_e3d9:
  lda _var_00af                  ; $E3D9  A5 AF
  cmp #$04                       ; $E3DB  C9 04
  beq _label_e3e5                ; $E3DD  F0 06
  jsr _func_d407                 ; $E3DF  20 07 D4
  jmp _label_e3c5                ; $E3E2  4C C5 E3

_label_e3e5:
  lda #$05                       ; $E3E5  A9 05
  sta _var_00af                  ; $E3E7  85 AF
  jsr _func_e151                 ; $E3E9  20 51 E1
  jsr _func_e283                 ; $E3EC  20 83 E2
  lda (_var_002d_indexed),Y      ; $E3EF  B1 2D
  and a:_data_e458_indexed,X     ; $E3F1  3D 58 E4
  bne _label_e418                ; $E3F4  D0 22
  inc _var_00af                  ; $E3F6  E6 AF
  jsr _func_e151                 ; $E3F8  20 51 E1
  jsr _func_e283                 ; $E3FB  20 83 E2
  lda _var_0067                  ; $E3FE  A5 67
  bne _label_e40d                ; $E400  D0 0B
  lda (_var_002d_indexed),Y      ; $E402  B1 2D
  and a:_data_e458_indexed,X     ; $E404  3D 58 E4
  cmp a:_data_e45c_indexed,X     ; $E407  DD 5C E4
  beq _label_e418                ; $E40A  F0 0C
  rts                            ; $E40C  60

_label_e40d:
  lda (_var_002d_indexed),Y      ; $E40D  B1 2D
  and a:_data_e458_indexed,X     ; $E40F  3D 58 E4
  cmp a:_data_e460_indexed,X     ; $E412  DD 60 E4
  beq _label_e418                ; $E415  F0 01
  rts                            ; $E417  60

_label_e418:
  lda #$00                       ; $E418  A9 00
  sta _var_007b                  ; $E41A  85 7B
  inc _var_0077                  ; $E41C  E6 77
  lda #$01                       ; $E41E  A9 01
  sta _var_007a                  ; $E420  85 7A
  lda a:_var_0207_indexed        ; $E422  AD 07 02
  clc                            ; $E425  18
  adc #$04                       ; $E426  69 04
  sta a:_var_02d9                ; $E428  8D D9 02
  lda #$01                       ; $E42B  A9 01
  sta a:_var_02db                ; $E42D  8D DB 02
  lda #$FC                       ; $E430  A9 FC
  sta a:_var_02da                ; $E432  8D DA 02
  lda #$FE                       ; $E435  A9 FE
  sta a:_var_02dd                ; $E437  8D DD 02
  lda _var_0067                  ; $E43A  A5 67
  beq _label_e447                ; $E43C  F0 09
  lda a:_var_020a_indexed        ; $E43E  AD 0A 02
  sec                            ; $E441  38
  sbc #$04                       ; $E442  E9 04
  jmp _label_e44d                ; $E444  4C 4D E4

_label_e447:
  lda a:_var_020a_indexed        ; $E447  AD 0A 02
  clc                            ; $E44A  18
  adc #$04                       ; $E44B  69 04

_label_e44d:
  sta a:_var_02dc                ; $E44D  8D DC 02
  lda #$00                       ; $E450  A9 00
  sta a:_var_02de                ; $E452  8D DE 02
  jmp _label_c994                ; $E455  4C 94 C9

_data_e458_indexed:
.byte $c0, $30, $0c, $03         ; $E458

_data_e45c_indexed:
.byte $40, $10, $04, $01         ; $E45C

_data_e460_indexed:
.byte $80, $20, $08, $02         ; $E460

_func_e464:
  ldx #$04                       ; $E464  A2 04

_label_e466:
  inc _var_0010_indexed,X        ; $E466  F6 10
  lda _var_0010_indexed,X        ; $E468  B5 10
  cmp #$0A                       ; $E46A  C9 0A
  bne _label_e475                ; $E46C  D0 07
  lda #$00                       ; $E46E  A9 00
  sta _var_0010_indexed,X        ; $E470  95 10
  dex                            ; $E472  CA
  bpl _label_e466                ; $E473  10 F1

_label_e475:
  rts                            ; $E475  60

_func_e476:
  lda #$00                       ; $E476  A9 00
  sta _var_0032                  ; $E478  85 32

_label_e47a:
  ldx _var_0032                  ; $E47A  A6 32
  lda _var_00d0_indexed,X        ; $E47C  B5 D0
  cmp #$02                       ; $E47E  C9 02
  beq _label_e48c                ; $E480  F0 0A

_label_e482:
  inc _var_0032                  ; $E482  E6 32
  lda _var_0032                  ; $E484  A5 32
  cmp a:_var_0137                ; $E486  CD 37 01
  bne _label_e47a                ; $E489  D0 EF
  rts                            ; $E48B  60

_label_e48c:
  lda _var_00af                  ; $E48C  A5 AF
  cmp _var_0032                  ; $E48E  C5 32
  beq _label_e482                ; $E490  F0 F0
  jsr _func_d487                 ; $E492  20 87 D4
  jsr _func_d36d                 ; $E495  20 6D D3
  tay                            ; $E498  A8
  lda a:_var_0213_indexed,X      ; $E499  BD 13 02
  cmp a:_var_0213_indexed,Y      ; $E49C  D9 13 02
  bne _label_e482                ; $E49F  D0 E1
  lda a:_var_020e_indexed,Y      ; $E4A1  B9 0E 02
  sec                            ; $E4A4  38
  sbc a:_var_020e_indexed,X      ; $E4A5  FD 0E 02
  bcc _label_e482                ; $E4A8  90 D8
  cmp #$16                       ; $E4AA  C9 16
  bcs _label_e482                ; $E4AC  B0 D4
  lda a:_var_0211_indexed,Y      ; $E4AE  B9 11 02
  sec                            ; $E4B1  38
  sbc a:_var_0211_indexed,X      ; $E4B2  FD 11 02
  bcs _label_e4be                ; $E4B5  B0 07
  sta _var_0031_indexed          ; $E4B7  85 31
  lda #$00                       ; $E4B9  A9 00
  sec                            ; $E4BB  38
  sbc _var_0031_indexed          ; $E4BC  E5 31

_label_e4be:
  cmp #$09                       ; $E4BE  C9 09
  bcs _label_e482                ; $E4C0  B0 C0
  ldx _var_00af                  ; $E4C2  A6 AF
  lda #$78                       ; $E4C4  A9 78
  sta a:_var_0124_indexed,X      ; $E4C6  9D 24 01
  rts                            ; $E4C9  60

_func_e4ca:
  ldy #$00                       ; $E4CA  A0 00

_label_e4cc:
  lda a:_var_00da_indexed,Y      ; $E4CC  B9 DA 00
  bne _label_e4d7                ; $E4CF  D0 06
  iny                            ; $E4D1  C8
  cpy #$0B                       ; $E4D2  C0 0B
  bne _label_e4cc                ; $E4D4  D0 F6
  rts                            ; $E4D6  60

_label_e4d7:
  lda a:_var_0300_indexed,Y      ; $E4D7  B9 00 03
  sta PPU_ADDR                   ; $E4DA  8D 06 20
  lda a:_var_0318_indexed,Y      ; $E4DD  B9 18 03
  sta PPU_ADDR                   ; $E4E0  8D 06 20
  tya                            ; $E4E3  98
  tax                            ; $E4E4  AA
  jsr _func_d487                 ; $E4E5  20 87 D4
  lda a:_var_0209_indexed,X      ; $E4E8  BD 09 02
  and #$40                       ; $E4EB  29 40
  bne _label_e4f8                ; $E4ED  D0 09
  lda a:_var_0330_indexed,Y      ; $E4EF  B9 30 03
  sta PPU_DATA                   ; $E4F2  8D 07 20
  jmp _label_e4fe                ; $E4F5  4C FE E4

_label_e4f8:
  lda a:_var_033c_indexed,Y      ; $E4F8  B9 3C 03
  sta PPU_DATA                   ; $E4FB  8D 07 20

_label_e4fe:
  lda a:_var_030c_indexed,Y      ; $E4FE  B9 0C 03
  sta PPU_ADDR                   ; $E501  8D 06 20
  lda a:_var_0324_indexed,Y      ; $E504  B9 24 03
  sta PPU_ADDR                   ; $E507  8D 06 20
  lda a:_var_0348_indexed,Y      ; $E50A  B9 48 03
  sta PPU_DATA                   ; $E50D  8D 07 20
  lda a:_var_0354_indexed,Y      ; $E510  B9 54 03
  sta PPU_DATA                   ; $E513  8D 07 20
  lda #$00                       ; $E516  A9 00
  sta a:_var_00da_indexed,Y      ; $E518  99 DA 00
  jmp _label_e4cc                ; $E51B  4C CC E4

_func_e51e:
  ldx #$00                       ; $E51E  A2 00

_label_e520:
  lda _var_00da_indexed,X        ; $E520  B5 DA
  bne _label_e52e                ; $E522  D0 0A
  inx                            ; $E524  E8
  cpx #$0B                       ; $E525  E0 0B
  bne _label_e520                ; $E527  D0 F7
  lda #$00                       ; $E529  A9 00
  sta _var_00a4                  ; $E52B  85 A4
  rts                            ; $E52D  60

_label_e52e:
  txa                            ; $E52E  8A
  sta _var_00a4                  ; $E52F  85 A4
  jsr _func_d2c3                 ; $E531  20 C3 D2
  lda a:_var_02f2                ; $E534  AD F2 02
  sta a:_var_0300_indexed,X      ; $E537  9D 00 03
  lda a:_var_02f3                ; $E53A  AD F3 02
  sta a:_var_030c_indexed,X      ; $E53D  9D 0C 03
  lda a:_var_02f0                ; $E540  AD F0 02
  sta a:_var_0318_indexed,X      ; $E543  9D 18 03
  lda a:_var_02f1                ; $E546  AD F1 02
  sta a:_var_0324_indexed,X      ; $E549  9D 24 03
  jsr _func_d672                 ; $E54C  20 72 D6
  ldx _var_00a4                  ; $E54F  A6 A4
  lda _var_0087_indexed          ; $E551  A5 87
  sta a:_var_0330_indexed,X      ; $E553  9D 30 03
  lda _var_0088                  ; $E556  A5 88
  sta a:_var_033c_indexed,X      ; $E558  9D 3C 03
  lda _var_0089                  ; $E55B  A5 89
  sta a:_var_0348_indexed,X      ; $E55D  9D 48 03
  lda _var_008a                  ; $E560  A5 8A
  sta a:_var_0354_indexed,X      ; $E562  9D 54 03
  ldy _var_00a4                  ; $E565  A4 A4
  jsr _func_d487                 ; $E567  20 87 D4
  lda a:_var_0209_indexed,X      ; $E56A  BD 09 02
  and #$40                       ; $E56D  29 40
  beq _label_e57a                ; $E56F  F0 09
  lda a:_var_0318_indexed,Y      ; $E571  B9 18 03
  clc                            ; $E574  18
  adc #$01                       ; $E575  69 01
  sta a:_var_0318_indexed,Y      ; $E577  99 18 03

_label_e57a:
  ldx _var_00a4                  ; $E57A  A6 A4
  inx                            ; $E57C  E8
  jmp _label_e520                ; $E57D  4C 20 E5

_func_e580:
  lda _var_00af                  ; $E580  A5 AF
  cmp #$10                       ; $E582  C9 10
  beq _label_e5a8                ; $E584  F0 22
  cmp #$12                       ; $E586  C9 12
  beq _label_e5a2                ; $E588  F0 18
  cmp #$13                       ; $E58A  C9 13
  beq _label_e595                ; $E58C  F0 07
  cmp #$15                       ; $E58E  C9 15
  beq _label_e5a2                ; $E590  F0 10
  jmp _label_e5b1                ; $E592  4C B1 E5

_label_e595:
  lda _var_009f                  ; $E595  A5 9F
  bne _label_e5b1                ; $E597  D0 18
  jsr _func_d407                 ; $E599  20 07 D4
  jsr _func_d407                 ; $E59C  20 07 D4
  jmp _label_e5b1                ; $E59F  4C B1 E5

_label_e5a2:
  jsr _func_d41a                 ; $E5A2  20 1A D4
  jmp _label_e5b1                ; $E5A5  4C B1 E5

_label_e5a8:
  lda _var_0052                  ; $E5A8  A5 52
  cmp #$02                       ; $E5AA  C9 02
  bcc _label_e5b1                ; $E5AC  90 03
  jsr _func_d407                 ; $E5AE  20 07 D4

_label_e5b1:
  ldx _var_005b                  ; $E5B1  A6 5B
  ldy _var_0056                  ; $E5B3  A4 56
  lda _var_00af                  ; $E5B5  A5 AF
  cmp #$13                       ; $E5B7  C9 13
  bcs _label_e5ed                ; $E5B9  B0 32
  cmp #$11                       ; $E5BB  C9 11
  bne _label_e5d7                ; $E5BD  D0 18
  lda _var_009e                  ; $E5BF  A5 9E
  beq _label_e5cc                ; $E5C1  F0 09
  lda _var_0052                  ; $E5C3  A5 52
  beq _label_e5db                ; $E5C5  F0 14
  cmp #$03                       ; $E5C7  C9 03
  beq _label_e5db                ; $E5C9  F0 10
  rts                            ; $E5CB  60

_label_e5cc:
  lda _var_0052                  ; $E5CC  A5 52
  cmp #$01                       ; $E5CE  C9 01
  beq _label_e5e4                ; $E5D0  F0 12
  cmp #$02                       ; $E5D2  C9 02
  beq _label_e5e4                ; $E5D4  F0 0E
  rts                            ; $E5D6  60

_label_e5d7:
  lda _var_009e                  ; $E5D7  A5 9E
  beq _label_e5e4                ; $E5D9  F0 09

_label_e5db:
  cpx #$00                       ; $E5DB  E0 00
  bne _label_e5e2                ; $E5DD  D0 03
  dey                            ; $E5DF  88
  ldx #$04                       ; $E5E0  A2 04

_label_e5e2:
  dex                            ; $E5E2  CA
  rts                            ; $E5E3  60

_label_e5e4:
  cpx #$03                       ; $E5E4  E0 03
  bne _label_e5eb                ; $E5E6  D0 03
  iny                            ; $E5E8  C8
  ldx #$FF                       ; $E5E9  A2 FF

_label_e5eb:
  inx                            ; $E5EB  E8
  rts                            ; $E5EC  60

_label_e5ed:
  lda _var_00af                  ; $E5ED  A5 AF
  cmp #$13                       ; $E5EF  C9 13
  beq _label_e604                ; $E5F1  F0 11
  lda _var_0052                  ; $E5F3  A5 52
  beq _label_e600                ; $E5F5  F0 09
  cmp #$03                       ; $E5F7  C9 03
  beq _label_e600                ; $E5F9  F0 05
  lda _var_009e                  ; $E5FB  A5 9E
  beq _label_e5e4                ; $E5FD  F0 E5
  rts                            ; $E5FF  60

_label_e600:
  lda _var_009e                  ; $E600  A5 9E
  bne _label_e5db                ; $E602  D0 D7

_label_e604:
  rts                            ; $E604  60

_func_e605:
  lda _var_00ff                  ; $E605  A5 FF
  bne _label_e622                ; $E607  D0 19
  lda a:_var_06ab                ; $E609  AD AB 06
  beq _label_e622                ; $E60C  F0 14
  lda a:_var_0200_indexed        ; $E60E  AD 00 02
  clc                            ; $E611  18
  adc _var_0065                  ; $E612  65 65
  and #$07                       ; $E614  29 07
  cmp #$07                       ; $E616  C9 07
  beq _label_e622                ; $E618  F0 08
  lda #$01                       ; $E61A  A9 01
  sta a:_var_06ab                ; $E61C  8D AB 06
  jmp _label_e627                ; $E61F  4C 27 E6

_label_e622:
  lda _var_00ff                  ; $E622  A5 FF
  sta a:_var_06ab                ; $E624  8D AB 06

_label_e627:
  lda #$00                       ; $E627  A9 00
  sta _var_00af                  ; $E629  85 AF
  sta _var_00ff                  ; $E62B  85 FF

_label_e62d:
  ldx _var_00af                  ; $E62D  A6 AF
  lda _var_00d0_indexed,X        ; $E62F  B5 D0
  cmp #$02                       ; $E631  C9 02
  beq _label_e63f                ; $E633  F0 0A

_label_e635:
  inc _var_00af                  ; $E635  E6 AF
  lda _var_00af                  ; $E637  A5 AF
  cmp a:_var_0137                ; $E639  CD 37 01
  bne _label_e62d                ; $E63C  D0 EF
  rts                            ; $E63E  60

_label_e63f:
  jsr _func_d36d                 ; $E63F  20 6D D3
  tax                            ; $E642  AA
  lda a:_var_0213_indexed,X      ; $E643  BD 13 02
  bne _label_e635                ; $E646  D0 ED
  lda a:_var_0200_indexed        ; $E648  AD 00 02
  sec                            ; $E64B  38
  sbc a:_var_020e_indexed,X      ; $E64C  FD 0E 02
  bcc _label_e635                ; $E64F  90 E4
  cmp #$10                       ; $E651  C9 10
  bcs _label_e635                ; $E653  B0 E0
  lda a:_var_0203_indexed        ; $E655  AD 03 02
  sec                            ; $E658  38
  sbc a:_var_0211_indexed,X      ; $E659  FD 11 02
  bcs _label_e665                ; $E65C  B0 07
  sta _var_002d_indexed          ; $E65E  85 2D
  lda #$00                       ; $E660  A9 00
  sec                            ; $E662  38
  sbc _var_002d_indexed          ; $E663  E5 2D

_label_e665:
  cmp #$09                       ; $E665  C9 09
  bcs _label_e635                ; $E667  B0 CC
  inc _var_00ff                  ; $E669  E6 FF
  lda _var_0043                  ; $E66B  A5 43
  cmp #$06                       ; $E66D  C9 06
  bcs _label_e6aa                ; $E66F  B0 39
  lda #$00                       ; $E671  A9 00
  sta _var_004e                  ; $E673  85 4E
  lda a:_var_0203_indexed        ; $E675  AD 03 02
  and #$F8                       ; $E678  29 F8
  clc                            ; $E67A  18
  adc #$04                       ; $E67B  69 04
  sta a:_var_0203_indexed        ; $E67D  8D 03 02
  ldy #$07                       ; $E680  A0 07
  lda a:_var_0372                ; $E682  AD 72 03

_label_e685:
  cmp a:_data_e6ad_indexed,Y     ; $E685  D9 AD E6
  beq _label_e6aa                ; $E688  F0 20
  dey                            ; $E68A  88
  bpl _label_e685                ; $E68B  10 F8
  lda #$02                       ; $E68D  A9 02
  sta a:_var_0110_indexed        ; $E68F  8D 10 01
  lda _var_004b                  ; $E692  A5 4B
  and #$0C                       ; $E694  29 0C
  sta _var_004b                  ; $E696  85 4B
  lda #$08                       ; $E698  A9 08
  sta _var_0032                  ; $E69A  85 32
  lda _var_0050                  ; $E69C  A5 50
  and #$04                       ; $E69E  29 04
  beq _label_e6a4                ; $E6A0  F0 02
  inc _var_0032                  ; $E6A2  E6 32

_label_e6a4:
  jsr _func_c2d0                 ; $E6A4  20 D0 C2
  jmp _label_eaff                ; $E6A7  4C FF EA

_label_e6aa:
  inc _var_0085                  ; $E6AA  E6 85
  rts                            ; $E6AC  60

_data_e6ad_indexed:
.byte $30, $31, $32, $33, $38, $f6, $f8, $f9 ; $E6AD

_func_e6b5:
  lda #$00                       ; $E6B5  A9 00
  sta _var_002e                  ; $E6B7  85 2E
  lda _var_0065                  ; $E6B9  A5 65
  sec                            ; $E6BB  38
  sbc _var_0064                  ; $E6BC  E5 64
  bcs _label_e6c7                ; $E6BE  B0 07
  sta _var_002d_indexed          ; $E6C0  85 2D
  lda #$00                       ; $E6C2  A9 00
  sec                            ; $E6C4  38
  sbc _var_002d_indexed          ; $E6C5  E5 2D

_label_e6c7:
  cmp #$EE                       ; $E6C7  C9 EE
  beq _label_e6dd                ; $E6C9  F0 12
  cmp #$EF                       ; $E6CB  C9 EF
  beq _label_e6d6                ; $E6CD  F0 07
  cmp #$F0                       ; $E6CF  C9 F0
  beq _label_e6e4                ; $E6D1  F0 11
  sta _var_002d_indexed          ; $E6D3  85 2D
  rts                            ; $E6D5  60

_label_e6d6:
  lda #$01                       ; $E6D6  A9 01
  sta _var_002d_indexed          ; $E6D8  85 2D
  inc _var_002e                  ; $E6DA  E6 2E
  rts                            ; $E6DC  60

_label_e6dd:
  lda #$02                       ; $E6DD  A9 02
  sta _var_002d_indexed          ; $E6DF  85 2D
  inc _var_002e                  ; $E6E1  E6 2E
  rts                            ; $E6E3  60

_label_e6e4:
  lda #$00                       ; $E6E4  A9 00
  sta _var_002d_indexed          ; $E6E6  85 2D
  rts                            ; $E6E8  60

_func_e6e9:
  lda _var_00a1                  ; $E6E9  A5 A1
  beq _label_e6ee                ; $E6EB  F0 01
  rts                            ; $E6ED  60

_label_e6ee:
  lda _var_009b                  ; $E6EE  A5 9B
  cmp #$EE                       ; $E6F0  C9 EE
  bcs _label_e702                ; $E6F2  B0 0E
  lda _var_004d                  ; $E6F4  A5 4D
  beq _label_e6fd                ; $E6F6  F0 05

_label_e6f8:
  lda #$00                       ; $E6F8  A9 00
  sta _var_004d                  ; $E6FA  85 4D
  rts                            ; $E6FC  60

_label_e6fd:
  lda #$FF                       ; $E6FD  A9 FF
  sta _var_004d                  ; $E6FF  85 4D
  rts                            ; $E701  60

_label_e702:
  lda _var_004d                  ; $E702  A5 4D
  bne _label_e6f8                ; $E704  D0 F2
  lda #$01                       ; $E706  A9 01
  sta _var_004d                  ; $E708  85 4D
  rts                            ; $E70A  60

_func_e70b:
  lda _var_0032                  ; $E70B  A5 32
  sta _var_009b                  ; $E70D  85 9B
  sta _var_00a1                  ; $E70F  85 A1

_func_e711:
  jsr _func_e76e                 ; $E711  20 6E E7

_func_e714:
  lda _var_00a1                  ; $E714  A5 A1
  beq _label_e748                ; $E716  F0 30
  cmp #$FF                       ; $E718  C9 FF
  beq _label_e743                ; $E71A  F0 27
  cmp #$FE                       ; $E71C  C9 FE
  beq _label_e73e                ; $E71E  F0 1E
  cmp #$FD                       ; $E720  C9 FD
  beq _label_e739                ; $E722  F0 15
  cmp #$FC                       ; $E724  C9 FC
  beq _label_e734                ; $E726  F0 0C
  sec                            ; $E728  38
  sbc #$F0                       ; $E729  E9 F0
  sta _var_002d_indexed          ; $E72B  85 2D
  bcc _label_e74f                ; $E72D  90 20

_label_e72f:
  lda #$00                       ; $E72F  A9 00
  jmp _label_e755                ; $E731  4C 55 E7

_label_e734:
  lda #$EC                       ; $E734  A9 EC
  jmp _label_e74a                ; $E736  4C 4A E7

_label_e739:
  lda #$ED                       ; $E739  A9 ED
  jmp _label_e74a                ; $E73B  4C 4A E7

_label_e73e:
  lda #$EE                       ; $E73E  A9 EE
  jmp _label_e74a                ; $E740  4C 4A E7

_label_e743:
  lda #$EF                       ; $E743  A9 EF
  jmp _label_e74a                ; $E745  4C 4A E7

_label_e748:
  lda #$F0                       ; $E748  A9 F0

_label_e74a:
  sta _var_002d_indexed          ; $E74A  85 2D
  jmp _label_e72f                ; $E74C  4C 2F E7

_label_e74f:
  lda #$00                       ; $E74F  A9 00
  sta _var_002d_indexed          ; $E751  85 2D
  lda _var_00a1                  ; $E753  A5 A1

_label_e755:
  sta _var_0032                  ; $E755  85 32
  lda _var_0032                  ; $E757  A5 32
  sta _var_00a1                  ; $E759  85 A1
  lda _var_0031_indexed          ; $E75B  A5 31
  sta _var_004d                  ; $E75D  85 4D
  jsr _func_e6e9                 ; $E75F  20 E9 E6
  lda _var_004d                  ; $E762  A5 4D
  sta _var_0031_indexed          ; $E764  85 31
  lda _var_0032                  ; $E766  A5 32
  clc                            ; $E768  18
  adc _var_002d_indexed          ; $E769  65 2D
  sta _var_0032                  ; $E76B  85 32
  rts                            ; $E76D  60

_func_e76e:
  jsr _func_e6b5                 ; $E76E  20 B5 E6
  lda _var_0065                  ; $E771  A5 65
  sec                            ; $E773  38
  sbc _var_0064                  ; $E774  E5 64
  beq _label_e785                ; $E776  F0 0D
  bcs _label_e786                ; $E778  B0 0C
  lda _var_002e                  ; $E77A  A5 2E
  bne _label_e78a                ; $E77C  D0 0C

_label_e77e:
  lda _var_00a1                  ; $E77E  A5 A1
  clc                            ; $E780  18
  adc _var_002d_indexed          ; $E781  65 2D
  sta _var_00a1                  ; $E783  85 A1

_label_e785:
  rts                            ; $E785  60

_label_e786:
  lda _var_002e                  ; $E786  A5 2E
  bne _label_e77e                ; $E788  D0 F4

_label_e78a:
  lda _var_00a1                  ; $E78A  A5 A1
  sec                            ; $E78C  38
  sbc _var_002d_indexed          ; $E78D  E5 2D
  sta _var_00a1                  ; $E78F  85 A1
  rts                            ; $E791  60

_func_e792:
  lda #$00                       ; $E792  A9 00
  sta a:_var_06b9                ; $E794  8D B9 06
  sta _var_0080                  ; $E797  85 80
  lda _var_001f_indexed          ; $E799  A5 1F

_label_e79b:
  sec                            ; $E79B  38
  sbc #$0A                       ; $E79C  E9 0A
  bcc _label_e7a6                ; $E79E  90 06
  inc a:_var_06b9                ; $E7A0  EE B9 06
  jmp _label_e79b                ; $E7A3  4C 9B E7

_label_e7a6:
  clc                            ; $E7A6  18
  adc #$0A                       ; $E7A7  69 0A
  sta a:_var_06ba                ; $E7A9  8D BA 06
  lda a:_var_06b9                ; $E7AC  AD B9 06

_label_e7af:
  sec                            ; $E7AF  38
  sbc #$0A                       ; $E7B0  E9 0A
  bcc _label_e7b9                ; $E7B2  90 05
  inc _var_0080                  ; $E7B4  E6 80
  jmp _label_e7af                ; $E7B6  4C AF E7

_label_e7b9:
  clc                            ; $E7B9  18
  adc #$0A                       ; $E7BA  69 0A
  sta a:_var_06b9                ; $E7BC  8D B9 06
  inc a:_var_06bb                ; $E7BF  EE BB 06
  rts                            ; $E7C2  60

_func_e7c3:
  lda _var_00af                  ; $E7C3  A5 AF
  cmp #$16                       ; $E7C5  C9 16
  bne _label_e7d7                ; $E7C7  D0 0E
  lda _var_0052                  ; $E7C9  A5 52
  cmp #$02                       ; $E7CB  C9 02
  bcc _label_e7d2                ; $E7CD  90 03

_label_e7cf:
  jsr _func_d407                 ; $E7CF  20 07 D4

_label_e7d2:
  ldy _var_0056                  ; $E7D2  A4 56
  ldx _var_005b                  ; $E7D4  A6 5B
  rts                            ; $E7D6  60

_label_e7d7:
  cmp #$18                       ; $E7D7  C9 18
  bne _label_e7e4                ; $E7D9  D0 09
  lda _var_0052                  ; $E7DB  A5 52
  cmp #$02                       ; $E7DD  C9 02
  bcc _label_e7cf                ; $E7DF  90 EE
  jmp _label_e7d2                ; $E7E1  4C D2 E7

_label_e7e4:
  cmp #$17                       ; $E7E4  C9 17
  bne _label_e7f3                ; $E7E6  D0 0B
  lda _var_0052                  ; $E7E8  A5 52
  beq _label_e81e                ; $E7EA  F0 32
  cmp #$03                       ; $E7EC  C9 03
  beq _label_e81e                ; $E7EE  F0 2E
  jmp _label_e815                ; $E7F0  4C 15 E8

_label_e7f3:
  cmp #$19                       ; $E7F3  C9 19
  bne _label_e802                ; $E7F5  D0 0B
  lda _var_0052                  ; $E7F7  A5 52
  beq _label_e81e                ; $E7F9  F0 23
  cmp #$03                       ; $E7FB  C9 03
  beq _label_e81e                ; $E7FD  F0 1F
  jmp _label_e7d2                ; $E7FF  4C D2 E7

_label_e802:
  cmp #$1A                       ; $E802  C9 1A
  bne _label_e811                ; $E804  D0 0B
  lda _var_0052                  ; $E806  A5 52
  beq _label_e7d2                ; $E808  F0 C8
  cmp #$03                       ; $E80A  C9 03
  beq _label_e7d2                ; $E80C  F0 C4
  jmp _label_e815                ; $E80E  4C 15 E8

_label_e811:
  lda _var_00a9                  ; $E811  A5 A9
  bne _label_e81e                ; $E813  D0 09

_label_e815:
  cpx #$03                       ; $E815  E0 03
  bne _label_e81c                ; $E817  D0 03
  iny                            ; $E819  C8
  ldx #$FF                       ; $E81A  A2 FF

_label_e81c:
  inx                            ; $E81C  E8
  rts                            ; $E81D  60

_label_e81e:
  cpx #$00                       ; $E81E  E0 00
  bne _label_e825                ; $E820  D0 03
  dey                            ; $E822  88
  ldx #$04                       ; $E823  A2 04

_label_e825:
  dex                            ; $E825  CA
  rts                            ; $E826  60

_func_e827:
  lda #$00                       ; $E827  A9 00
  sta _var_0030                  ; $E829  85 30
  ldx _var_005b                  ; $E82B  A6 5B
  lda _var_0067                  ; $E82D  A5 67
  beq _label_e83f                ; $E82F  F0 0E
  txa                            ; $E831  8A
  bne _label_e83e                ; $E832  D0 0A
  dec _var_0056                  ; $E834  C6 56
  inc _var_005b                  ; $E836  E6 5B
  inc _var_005b                  ; $E838  E6 5B
  inc _var_005b                  ; $E83A  E6 5B
  inc _var_0030                  ; $E83C  E6 30

_label_e83e:
  rts                            ; $E83E  60

_label_e83f:
  cpx #$03                       ; $E83F  E0 03
  bne _label_e83e                ; $E841  D0 FB
  inc _var_0056                  ; $E843  E6 56
  inc _var_005b                  ; $E845  E6 5B
  inc _var_0030                  ; $E847  E6 30
  rts                            ; $E849  60

_func_e84a:
  lda #$00                       ; $E84A  A9 00
  sta _var_0032                  ; $E84C  85 32
  lda _var_0077                  ; $E84E  A5 77
  bne _label_e85c                ; $E850  D0 0A
  lda _var_004b                  ; $E852  A5 4B
  and #$02                       ; $E854  29 02
  beq _label_e85c                ; $E856  F0 04
  lda _var_00e5                  ; $E858  A5 E5
  bne _label_e8a9                ; $E85A  D0 4D

_label_e85c:
  ldx #$07                       ; $E85C  A2 07
  lda a:_var_036d                ; $E85E  AD 6D 03

_label_e861:
  cmp a:_data_e939_indexed,X     ; $E861  DD 39 E9
  beq _label_e86d                ; $E864  F0 07
  dex                            ; $E866  CA
  bpl _label_e861                ; $E867  10 F8
  lda #$FF                       ; $E869  A9 FF
  sta _var_0032                  ; $E86B  85 32

_label_e86d:
  inc _var_0032                  ; $E86D  E6 32
  ldx #$03                       ; $E86F  A2 03
  lda a:_var_0372                ; $E871  AD 72 03

_label_e874:
  cmp a:_data_e960_indexed,X     ; $E874  DD 60 E9
  beq _label_e87f                ; $E877  F0 06
  dex                            ; $E879  CA
  bpl _label_e874                ; $E87A  10 F8
  jmp _label_e88f                ; $E87C  4C 8F E8

_label_e87f:
  ldx #$07                       ; $E87F  A2 07
  lda a:_var_0370                ; $E881  AD 70 03

_label_e884:
  cmp a:_data_e94c_indexed,X     ; $E884  DD 4C E9
  beq _label_e8d8                ; $E887  F0 4F
  dex                            ; $E889  CA
  bpl _label_e884                ; $E88A  10 F8
  jmp _label_e8a9                ; $E88C  4C A9 E8

_label_e88f:
  ldx #$07                       ; $E88F  A2 07
  lda a:_var_0370                ; $E891  AD 70 03

_label_e894:
  cmp a:_data_e94c_indexed,X     ; $E894  DD 4C E9
  beq _label_e906                ; $E897  F0 6D
  dex                            ; $E899  CA
  bpl _label_e894                ; $E89A  10 F8
  ldx #$0B                       ; $E89C  A2 0B
  lda a:_var_0373                ; $E89E  AD 73 03

_label_e8a1:
  cmp a:_data_e954_indexed,X     ; $E8A1  DD 54 E9
  beq _label_e8d9                ; $E8A4  F0 33
  dex                            ; $E8A6  CA
  bpl _label_e8a1                ; $E8A7  10 F8

_label_e8a9:
  lda _var_0032                  ; $E8A9  A5 32
  bne _label_e8d8                ; $E8AB  D0 2B
  lda a:_var_0203_indexed        ; $E8AD  AD 03 02
  cmp #$EC                       ; $E8B0  C9 EC
  bcs _label_e8d8                ; $E8B2  B0 24

_label_e8b4:
  lda a:_var_0203_indexed        ; $E8B4  AD 03 02
  and #$07                       ; $E8B7  29 07
  cmp #$03                       ; $E8B9  C9 03
  bne _label_e8c2                ; $E8BB  D0 05
  lda #$01                       ; $E8BD  A9 01
  sta a:_var_0110_indexed        ; $E8BF  8D 10 01

_label_e8c2:
  lda a:_var_0203_indexed        ; $E8C2  AD 03 02
  clc                            ; $E8C5  18
  adc a:_var_0110_indexed        ; $E8C6  6D 10 01
  sta a:_var_0203_indexed        ; $E8C9  8D 03 02
  and #$07                       ; $E8CC  29 07
  cmp #$04                       ; $E8CE  C9 04
  bne _label_e8d8                ; $E8D0  D0 06
  lda _var_0043                  ; $E8D2  A5 43
  beq _label_e8d8                ; $E8D4  F0 02
  inc _var_0043                  ; $E8D6  E6 43

_label_e8d8:
  rts                            ; $E8D8  60

_label_e8d9:
  lda a:_var_0203_indexed        ; $E8D9  AD 03 02
  and #$07                       ; $E8DC  29 07
  cmp #$04                       ; $E8DE  C9 04
  bne _label_e8a9                ; $E8E0  D0 C7
  ldx #$0B                       ; $E8E2  A2 0B
  lda a:_var_0370                ; $E8E4  AD 70 03

_label_e8e7:
  cmp a:_data_e954_indexed,X     ; $E8E7  DD 54 E9
  beq _label_e8f2                ; $E8EA  F0 06
  dex                            ; $E8EC  CA
  bpl _label_e8e7                ; $E8ED  10 F8
  jmp _label_e8a9                ; $E8EF  4C A9 E8

_label_e8f2:
  ldx #$07                       ; $E8F2  A2 07
  lda a:_var_0372                ; $E8F4  AD 72 03

_label_e8f7:
  cmp a:_data_e964_indexed,X     ; $E8F7  DD 64 E9
  beq _label_e8a9                ; $E8FA  F0 AD
  dex                            ; $E8FC  CA
  bpl _label_e8f7                ; $E8FD  10 F8
  lda #$01                       ; $E8FF  A9 01
  sta _var_0046                  ; $E901  85 46
  inc _var_0043                  ; $E903  E6 43
  rts                            ; $E905  60

_label_e906:
  lda a:_var_0203_indexed        ; $E906  AD 03 02
  and #$07                       ; $E909  29 07
  cmp #$04                       ; $E90B  C9 04
  bne _label_e8a9                ; $E90D  D0 9A
  lda _var_0032                  ; $E90F  A5 32
  bne _label_e938                ; $E911  D0 25
  ldx #$06                       ; $E913  A2 06
  lda a:_var_036a_indexed        ; $E915  AD 6A 03

_label_e918:
  cmp a:_data_e945_indexed,X     ; $E918  DD 45 E9
  beq _label_e938                ; $E91B  F0 1B
  dex                            ; $E91D  CA
  bpl _label_e918                ; $E91E  10 F8
  lda a:_var_0200_indexed        ; $E920  AD 00 02
  cmp #$10                       ; $E923  C9 10
  bcc _label_e938                ; $E925  90 11
  lda _var_0077                  ; $E927  A5 77
  beq _label_e932                ; $E929  F0 07
  lda a:_var_0200_indexed        ; $E92B  AD 00 02
  cmp #$18                       ; $E92E  C9 18
  bcc _label_e938                ; $E930  90 06

_label_e932:
  lda #$00                       ; $E932  A9 00
  sta _var_0046                  ; $E934  85 46
  inc _var_0043                  ; $E936  E6 43

_label_e938:
  rts                            ; $E938  60

_data_e939_indexed:
.byte $30, $31, $32, $33, $34, $35, $38, $f6, $39, $fc, $f8, $f9 ; $E939

_data_e945_indexed:
.byte $31, $33, $34, $35, $38, $f6, $fc ; $E945

_data_e94c_indexed:
.byte $30, $31, $32, $33, $38, $f6, $f8, $f9 ; $E94C

_data_e954_indexed:
.byte $f0, $f1, $f2, $f3, $40, $41, $42, $43, $f4, $f5, $fa, $fb ; $E954

_data_e960_indexed:
.byte $f0, $f1, $f2, $f3         ; $E960

_data_e964_indexed:
.byte $38, $f6, $f8, $f9, $f4, $f5, $fa, $fb ; $E964

_func_e96c:
  lda #$00                       ; $E96C  A9 00
  sta _var_0032                  ; $E96E  85 32
  lda _var_0077                  ; $E970  A5 77
  bne _label_e97e                ; $E972  D0 0A
  lda _var_004b                  ; $E974  A5 4B
  and #$02                       ; $E976  29 02
  beq _label_e97e                ; $E978  F0 04
  lda _var_00e5                  ; $E97A  A5 E5
  bne _label_e9cb                ; $E97C  D0 4D

_label_e97e:
  ldx #$07                       ; $E97E  A2 07
  lda a:_var_036b                ; $E980  AD 6B 03

_label_e983:
  cmp a:_data_e939_indexed,X     ; $E983  DD 39 E9
  beq _label_e98f                ; $E986  F0 07
  dex                            ; $E988  CA
  bpl _label_e983                ; $E989  10 F8
  lda #$FF                       ; $E98B  A9 FF
  sta _var_0032                  ; $E98D  85 32

_label_e98f:
  inc _var_0032                  ; $E98F  E6 32
  ldx #$03                       ; $E991  A2 03
  lda a:_var_0372                ; $E993  AD 72 03

_label_e996:
  cmp a:_data_e960_indexed,X     ; $E996  DD 60 E9
  beq _label_e9a1                ; $E999  F0 06
  dex                            ; $E99B  CA
  bpl _label_e996                ; $E99C  10 F8
  jmp _label_e9b1                ; $E99E  4C B1 E9

_label_e9a1:
  ldx #$07                       ; $E9A1  A2 07
  lda a:_var_036e                ; $E9A3  AD 6E 03

_label_e9a6:
  cmp a:_data_e94c_indexed,X     ; $E9A6  DD 4C E9
  beq _label_e9fa                ; $E9A9  F0 4F
  dex                            ; $E9AB  CA
  bpl _label_e9a6                ; $E9AC  10 F8
  jmp _label_e9cb                ; $E9AE  4C CB E9

_label_e9b1:
  ldx #$07                       ; $E9B1  A2 07
  lda a:_var_036e                ; $E9B3  AD 6E 03

_label_e9b6:
  cmp a:_data_e94c_indexed,X     ; $E9B6  DD 4C E9
  beq _label_ea28                ; $E9B9  F0 6D
  dex                            ; $E9BB  CA
  bpl _label_e9b6                ; $E9BC  10 F8
  ldx #$0B                       ; $E9BE  A2 0B
  lda a:_var_0371                ; $E9C0  AD 71 03

_label_e9c3:
  cmp a:_data_e954_indexed,X     ; $E9C3  DD 54 E9
  beq _label_e9fb                ; $E9C6  F0 33
  dex                            ; $E9C8  CA
  bpl _label_e9c3                ; $E9C9  10 F8

_label_e9cb:
  lda _var_0032                  ; $E9CB  A5 32
  bne _label_e9fa                ; $E9CD  D0 2B
  lda a:_var_0203_indexed        ; $E9CF  AD 03 02
  cmp #$05                       ; $E9D2  C9 05
  bcc _label_e9fa                ; $E9D4  90 24

_label_e9d6:
  lda a:_var_0203_indexed        ; $E9D6  AD 03 02
  and #$07                       ; $E9D9  29 07
  cmp #$05                       ; $E9DB  C9 05
  bne _label_e9e4                ; $E9DD  D0 05
  lda #$01                       ; $E9DF  A9 01
  sta a:_var_0110_indexed        ; $E9E1  8D 10 01

_label_e9e4:
  lda a:_var_0203_indexed        ; $E9E4  AD 03 02
  sec                            ; $E9E7  38
  sbc a:_var_0110_indexed        ; $E9E8  ED 10 01
  sta a:_var_0203_indexed        ; $E9EB  8D 03 02
  and #$07                       ; $E9EE  29 07
  cmp #$04                       ; $E9F0  C9 04
  bne _label_e9fa                ; $E9F2  D0 06
  lda _var_0043                  ; $E9F4  A5 43
  beq _label_e9fa                ; $E9F6  F0 02
  inc _var_0043                  ; $E9F8  E6 43

_label_e9fa:
  rts                            ; $E9FA  60

_label_e9fb:
  lda a:_var_0203_indexed        ; $E9FB  AD 03 02
  and #$07                       ; $E9FE  29 07
  cmp #$04                       ; $EA00  C9 04
  bne _label_e9cb                ; $EA02  D0 C7
  ldx #$0B                       ; $EA04  A2 0B
  lda a:_var_036e                ; $EA06  AD 6E 03

_label_ea09:
  cmp a:_data_e954_indexed,X     ; $EA09  DD 54 E9
  beq _label_ea14                ; $EA0C  F0 06
  dex                            ; $EA0E  CA
  bpl _label_ea09                ; $EA0F  10 F8
  jmp _label_e9cb                ; $EA11  4C CB E9

_label_ea14:
  ldx #$07                       ; $EA14  A2 07
  lda a:_var_0372                ; $EA16  AD 72 03

_label_ea19:
  cmp a:_data_e964_indexed,X     ; $EA19  DD 64 E9
  beq _label_e9cb                ; $EA1C  F0 AD
  dex                            ; $EA1E  CA
  bpl _label_ea19                ; $EA1F  10 F8
  lda #$01                       ; $EA21  A9 01
  sta _var_0046                  ; $EA23  85 46
  inc _var_0043                  ; $EA25  E6 43
  rts                            ; $EA27  60

_label_ea28:
  lda a:_var_0203_indexed        ; $EA28  AD 03 02
  and #$07                       ; $EA2B  29 07
  cmp #$04                       ; $EA2D  C9 04
  bne _label_e9cb                ; $EA2F  D0 9A
  lda _var_0032                  ; $EA31  A5 32
  bne _label_e9fa                ; $EA33  D0 C5
  ldx #$06                       ; $EA35  A2 06
  lda a:_var_0368_indexed        ; $EA37  AD 68 03

_label_ea3a:
  cmp a:_data_e945_indexed,X     ; $EA3A  DD 45 E9
  beq _label_ea5a                ; $EA3D  F0 1B
  dex                            ; $EA3F  CA
  bpl _label_ea3a                ; $EA40  10 F8
  lda a:_var_0200_indexed        ; $EA42  AD 00 02
  cmp #$10                       ; $EA45  C9 10
  bcc _label_ea5a                ; $EA47  90 11
  lda _var_0077                  ; $EA49  A5 77
  beq _label_ea54                ; $EA4B  F0 07
  lda a:_var_0200_indexed        ; $EA4D  AD 00 02
  cmp #$18                       ; $EA50  C9 18
  bcc _label_ea5a                ; $EA52  90 06

_label_ea54:
  lda #$00                       ; $EA54  A9 00
  sta _var_0046                  ; $EA56  85 46
  inc _var_0043                  ; $EA58  E6 43

_label_ea5a:
  rts                            ; $EA5A  60

_label_ea5b:
  lda _var_0077                  ; $EA5B  A5 77
  bne _label_eaa9                ; $EA5D  D0 4A
  ldx #$07                       ; $EA5F  A2 07
  lda a:_var_0369_indexed        ; $EA61  AD 69 03

_label_ea64:
  cmp a:_data_eacb_indexed,X     ; $EA64  DD CB EA
  beq _label_eaa9                ; $EA67  F0 40
  dex                            ; $EA69  CA
  bpl _label_ea64                ; $EA6A  10 F8
  ldx #$05                       ; $EA6C  A2 05
  lda a:_var_036c                ; $EA6E  AD 6C 03

_label_ea71:
  cmp a:_data_eac5_indexed,X     ; $EA71  DD C5 EA
  beq _label_eaaa                ; $EA74  F0 34
  dex                            ; $EA76  CA
  bpl _label_ea71                ; $EA77  10 F8
  ldx #$07                       ; $EA79  A2 07
  lda a:_var_036c                ; $EA7B  AD 6C 03

_label_ea7e:
  cmp a:_data_eacb_indexed,X     ; $EA7E  DD CB EA
  beq _label_eaa9                ; $EA81  F0 26
  dex                            ; $EA83  CA
  bpl _label_ea7e                ; $EA84  10 F8
  ldx #$05                       ; $EA86  A2 05
  lda a:_var_036f                ; $EA88  AD 6F 03

_label_ea8b:
  cmp a:_data_eac5_indexed,X     ; $EA8B  DD C5 EA
  beq _label_eaaa                ; $EA8E  F0 1A
  dex                            ; $EA90  CA
  bpl _label_ea8b                ; $EA91  10 F8
  ldx #$05                       ; $EA93  A2 05

_label_ea95:
  lda a:_var_0101_indexed,X      ; $EA95  BD 01 01
  bne _label_eaa9                ; $EA98  D0 0F
  dex                            ; $EA9A  CA
  bpl _label_ea95                ; $EA9B  10 F8
  lda _var_0065                  ; $EA9D  A5 65
  clc                            ; $EA9F  18
  adc a:_var_0200_indexed        ; $EAA0  6D 00 02
  and #$07                       ; $EAA3  29 07
  cmp #$07                       ; $EAA5  C9 07
  bne _label_eaaa                ; $EAA7  D0 01

_label_eaa9:
  rts                            ; $EAA9  60

_label_eaaa:
  lda a:_var_0110_indexed        ; $EAAA  AD 10 01
  sta _var_0032                  ; $EAAD  85 32
  jsr _func_c242                 ; $EAAF  20 42 C2
  lda _var_0043                  ; $EAB2  A5 43
  beq _label_eac4                ; $EAB4  F0 0E
  lda _var_0065                  ; $EAB6  A5 65
  clc                            ; $EAB8  18
  adc a:_var_0200_indexed        ; $EAB9  6D 00 02
  and #$07                       ; $EABC  29 07
  cmp #$07                       ; $EABE  C9 07
  bne _label_eac4                ; $EAC0  D0 02
  inc _var_0043                  ; $EAC2  E6 43

_label_eac4:
  rts                            ; $EAC4  60

_data_eac5_indexed:
.byte $f4, $f5, $f8, $f9, $fa, $fb ; $EAC5

_data_eacb_indexed:
.byte $30, $31, $32, $33, $34, $35, $38, $f6 ; $EACB

_label_ead3:
  lda _var_0077                  ; $EAD3  A5 77
  bne _label_eafe                ; $EAD5  D0 27
  ldx #$07                       ; $EAD7  A2 07
  lda a:_var_0372                ; $EAD9  AD 72 03

_label_eadc:
  cmp a:_data_eacb_indexed,X     ; $EADC  DD CB EA
  beq _label_eafe                ; $EADF  F0 1D
  dex                            ; $EAE1  CA
  bpl _label_eadc                ; $EAE2  10 F8
  ldx #$05                       ; $EAE4  A2 05
  lda a:_var_0372                ; $EAE6  AD 72 03

_label_eae9:
  cmp a:_data_eac5_indexed,X     ; $EAE9  DD C5 EA
  beq _label_eaff                ; $EAEC  F0 11
  dex                            ; $EAEE  CA
  bpl _label_eae9                ; $EAEF  10 F8
  ldx #$05                       ; $EAF1  A2 05
  lda a:_var_036c                ; $EAF3  AD 6C 03

_label_eaf6:
  cmp a:_data_eac5_indexed,X     ; $EAF6  DD C5 EA
  beq _label_eaff                ; $EAF9  F0 04
  dex                            ; $EAFB  CA
  bpl _label_eaf6                ; $EAFC  10 F8

_label_eafe:
  rts                            ; $EAFE  60

_label_eaff:
  lda a:_var_0110_indexed        ; $EAFF  AD 10 01
  sta _var_0032                  ; $EB02  85 32
  jsr _func_c1e2                 ; $EB04  20 E2 C1
  lda _var_0043                  ; $EB07  A5 43
  beq _label_eb1f                ; $EB09  F0 14
  lda _var_0065                  ; $EB0B  A5 65
  beq _label_eb14                ; $EB0D  F0 05
  and #$07                       ; $EB0F  29 07
  beq _label_eb1d                ; $EB11  F0 0A
  rts                            ; $EB13  60

_label_eb14:
  lda a:_var_0200_indexed        ; $EB14  AD 00 02
  and #$07                       ; $EB17  29 07
  cmp #$07                       ; $EB19  C9 07
  bne _label_eb1f                ; $EB1B  D0 02

_label_eb1d:
  inc _var_0043                  ; $EB1D  E6 43

_label_eb1f:
  rts                            ; $EB1F  60

_func_eb20:
  lda _var_0043                  ; $EB20  A5 43
  bne _label_eb4c                ; $EB22  D0 28
  lda _var_009c                  ; $EB24  A5 9C
  bne _label_eb4c                ; $EB26  D0 24
  lda _var_00e5                  ; $EB28  A5 E5
  beq _label_eb32                ; $EB2A  F0 06
  lda _var_004b                  ; $EB2C  A5 4B
  and #$02                       ; $EB2E  29 02
  bne _label_eb4c                ; $EB30  D0 1A

_label_eb32:
  ldy #$04                       ; $EB32  A0 04

_label_eb34:
  ldx #$07                       ; $EB34  A2 07
  lda a:_var_0368_indexed,Y      ; $EB36  B9 68 03

_label_eb39:
  cmp a:_data_e939_indexed,X     ; $EB39  DD 39 E9
  beq _label_eb4a                ; $EB3C  F0 0C
  dex                            ; $EB3E  CA
  bpl _label_eb39                ; $EB3F  10 F8
  cpy #$07                       ; $EB41  C0 07
  beq _label_eb4c                ; $EB43  F0 07
  ldy #$07                       ; $EB45  A0 07
  jmp _label_eb34                ; $EB47  4C 34 EB

_label_eb4a:
  inc _var_0085                  ; $EB4A  E6 85

_label_eb4c:
  rts                            ; $EB4C  60

_func_eb4d:
  lda _var_00eb                  ; $EB4D  A5 EB
  bne _label_ebb3                ; $EB4F  D0 62
  lda #$00                       ; $EB51  A9 00
  tay                            ; $EB53  A8
  tax                            ; $EB54  AA
  lda a:_var_011f                ; $EB55  AD 1F 01
  beq _label_eb5e                ; $EB58  F0 04
  ldy #$20                       ; $EB5A  A0 20
  bne _label_eb82                ; $EB5C  D0 24

_label_eb5e:
  lda _var_001f_indexed          ; $EB5E  A5 1F
  beq _label_eb7c                ; $EB60  F0 1A
  cmp #$81                       ; $EB62  C9 81
  beq _label_eb6e                ; $EB64  F0 08
  cmp #$82                       ; $EB66  C9 82
  beq _label_eb72                ; $EB68  F0 08
  and #$07                       ; $EB6A  29 07
  bne _label_eb82                ; $EB6C  D0 14

_label_eb6e:
  ldy #$30                       ; $EB6E  A0 30
  bne _label_eb82                ; $EB70  D0 10

_label_eb72:
  ldy #$50                       ; $EB72  A0 50
  lda _var_001e                  ; $EB74  A5 1E
  beq _label_eb82                ; $EB76  F0 0A
  ldy #$60                       ; $EB78  A0 60
  bne _label_eb82                ; $EB7A  D0 06

_label_eb7c:
  lda _var_001e                  ; $EB7C  A5 1E
  beq _label_eb82                ; $EB7E  F0 02
  ldy #$40                       ; $EB80  A0 40

_label_eb82:
  lda #$3F                       ; $EB82  A9 3F
  sta PPU_ADDR                   ; $EB84  8D 06 20
  lda #$00                       ; $EB87  A9 00
  sta PPU_ADDR                   ; $EB89  8D 06 20

_label_eb8c:
  lda a:_data_ebb4_indexed,Y     ; $EB8C  B9 B4 EB
  sta PPU_DATA                   ; $EB8F  8D 07 20
  iny                            ; $EB92  C8
  tya                            ; $EB93  98
  and #$0F                       ; $EB94  29 0F
  bne _label_eb8c                ; $EB96  D0 F4
  inx                            ; $EB98  E8
  cpx #$02                       ; $EB99  E0 02
  beq _label_eba1                ; $EB9B  F0 04
  ldy #$10                       ; $EB9D  A0 10
  bne _label_eb8c                ; $EB9F  D0 EB

_label_eba1:
  lda #$3F                       ; $EBA1  A9 3F
  sta PPU_ADDR                   ; $EBA3  8D 06 20
  lda #$00                       ; $EBA6  A9 00
  sta PPU_ADDR                   ; $EBA8  8D 06 20
  sta PPU_ADDR                   ; $EBAB  8D 06 20
  sta PPU_ADDR                   ; $EBAE  8D 06 20
  inc _var_00eb                  ; $EBB1  E6 EB

_label_ebb3:
  rts                            ; $EBB3  60

_data_ebb4_indexed:
.byte $0f, $23, $20, $16, $0f, $37, $16, $27, $0f, $16, $1b, $1c, $0f, $37, $0c, $17 ; $EBB4
.byte $0f, $23, $36, $21, $0f, $11, $20, $25, $0f, $16, $28, $2c, $0f, $37, $0a, $17 ; $EBC4
.byte $0f, $23, $20, $16, $0f, $37, $16, $17, $0f, $16, $1b, $1c, $0f, $37, $0c, $17 ; $EBD4
.byte $0f, $34, $20, $16, $0f, $36, $24, $21, $0f, $37, $1a, $26, $0f, $37, $08, $17 ; $EBE4
.byte $0f, $23, $20, $16, $0f, $37, $12, $17, $0f, $37, $16, $17, $0f, $37, $0c, $17 ; $EBF4
.byte $0f, $36, $24, $21, $0f, $37, $20, $34, $0f, $36, $29, $17, $0f, $37, $08, $35 ; $EC04
.byte $0f, $23, $12, $16, $0f, $37, $1a, $17, $0f, $37, $0f, $17, $0f, $37, $0c, $16 ; $EC14

NMI:
  pha                            ; $EC24  48
  txa                            ; $EC25  8A
  pha                            ; $EC26  48
  tya                            ; $EC27  98
  pha                            ; $EC28  48
  lda _var_0020                  ; $EC29  A5 20
  bne _label_ec33                ; $EC2B  D0 06
  jsr _func_f4b6                 ; $EC2D  20 B6 F4
  jmp _label_ec4a                ; $EC30  4C 4A EC

_label_ec33:
  lda #$00                       ; $EC33  A9 00
  sta _var_0020                  ; $EC35  85 20
  sta OAM_ADDR                   ; $EC37  8D 03 20
  lda #$07                       ; $EC3A  A9 07
  sta OAM_DMA                    ; $EC3C  8D 14 40
  lda PPU_STATUS                 ; $EC3F  AD 02 20
  jsr _func_eb4d                 ; $EC42  20 4D EB
  lda #$1E                       ; $EC45  A9 1E
  sta PPU_MASK                   ; $EC47  8D 01 20

_label_ec4a:
  lda _var_007c                  ; $EC4A  A5 7C
  bne _label_ec61                ; $EC4C  D0 13
  ldy #$00                       ; $EC4E  A0 00
  ldx _var_007d                  ; $EC50  A6 7D

_label_ec52:
  sty a:_data_8000               ; $EC52  8C 00 80
  lda a:_data_ec67_indexed,X     ; $EC55  BD 67 EC
  sta a:_data_8000+1             ; $EC58  8D 01 80
  inx                            ; $EC5B  E8
  iny                            ; $EC5C  C8
  cpy #$08                       ; $EC5D  C0 08
  bne _label_ec52                ; $EC5F  D0 F1

_label_ec61:
  pla                            ; $EC61  68
  tay                            ; $EC62  A8
  pla                            ; $EC63  68
  tax                            ; $EC64  AA
  pla                            ; $EC65  68
  rti                            ; $EC66  40

_data_ec67_indexed:
.byte $38, $3a, $3c, $3d, $3e, $3f, $0c, $0d, $38, $3a, $34, $35, $36, $37, $0d, $0c ; $EC67
.byte $38, $3a, $30, $31, $32, $33, $0d, $0c, $38, $3a, $3c, $3d, $3e, $3f, $0d, $0c ; $EC77
.byte $43, $4f, $50, $59, $52, $49, $47, $48, $54, $20, $31, $39, $38, $36, $20, $4e ; $EC87
.byte $41, $4d, $43, $4f, $20, $4c, $54, $44, $2e, $41, $4c, $4c, $20, $52, $49, $47 ; $EC97
.byte $48, $54, $53, $20, $52, $45, $53, $45, $52, $56, $45, $44 ; $ECA7

_data_ecb3_indexed:
.byte $4d, $52, $20, $54, $41, $4b, $41, $53, $49, $20, $46, $55, $4b, $41, $57, $41 ; $ECB3

_data_ecc3_indexed:
.byte $38, $3a, $3c, $3d, $3e, $3f, $0d, $0c ; $ECC3

_data_eccb_indexed:
.byte $0f, $23, $20, $16, $0f, $37, $0c, $27, $0f, $16, $1b, $1c, $0f, $37, $0c, $17 ; $ECCB
.byte $0f, $23, $36, $21, $0f, $11, $20, $25, $0f, $16, $28, $2c, $0f, $37, $0a, $17 ; $ECDB

Reset:
  lda #$30                       ; $ECEB  A9 30
  sta PPU_CTRL                   ; $ECED  8D 00 20
  sei                            ; $ECF0  78
  cld                            ; $ECF1  D8
  ldx #$FF                       ; $ECF2  A2 FF
  txs                            ; $ECF4  9A
  jsr _func_fdec                 ; $ECF5  20 EC FD
  ldx #$07                       ; $ECF8  A2 07

_label_ecfa:
  stx a:_data_8000               ; $ECFA  8E 00 80
  lda a:_data_ecc3_indexed,X     ; $ECFD  BD C3 EC
  sta a:_data_8000+1             ; $ED00  8D 01 80
  dex                            ; $ED03  CA
  bpl _label_ecfa                ; $ED04  10 F4
  ldx #$02                       ; $ED06  A2 02

_label_ed08:
  lda #$06                       ; $ED08  A9 06
  sta PPU_MASK                   ; $ED0A  8D 01 20
  lda PPU_STATUS                 ; $ED0D  AD 02 20

_label_ed10:
  lda PPU_STATUS                 ; $ED10  AD 02 20
  bpl _label_ed10                ; $ED13  10 FB
  lda #$00                       ; $ED15  A9 00
  sta PPU_SCROLL                 ; $ED17  8D 05 20
  sta PPU_SCROLL                 ; $ED1A  8D 05 20
  dex                            ; $ED1D  CA
  bne _label_ed08                ; $ED1E  D0 E8
  ldy #$00                       ; $ED20  A0 00
  lda #$3F                       ; $ED22  A9 3F
  sta PPU_ADDR                   ; $ED24  8D 06 20
  lda #$00                       ; $ED27  A9 00
  sta PPU_ADDR                   ; $ED29  8D 06 20

_label_ed2c:
  lda a:_data_eccb_indexed,Y     ; $ED2C  B9 CB EC
  sta PPU_DATA                   ; $ED2F  8D 07 20
  iny                            ; $ED32  C8
  cpy #$20                       ; $ED33  C0 20
  bne _label_ed2c                ; $ED35  D0 F5
  lda #$3F                       ; $ED37  A9 3F
  sta PPU_ADDR                   ; $ED39  8D 06 20
  lda #$00                       ; $ED3C  A9 00
  sta PPU_ADDR                   ; $ED3E  8D 06 20
  sta PPU_ADDR                   ; $ED41  8D 06 20
  sta PPU_ADDR                   ; $ED44  8D 06 20
  ldy #$00                       ; $ED47  A0 00

_label_ed49:
  lda a:_data_ecb3_indexed,Y     ; $ED49  B9 B3 EC
  cmp a:_var_0000_indexed,Y      ; $ED4C  D9 00 00
  beq _label_ed70                ; $ED4F  F0 1F
  ldy #$00                       ; $ED51  A0 00

_label_ed53:
  lda #$00                       ; $ED53  A9 00
  sta a:_var_0000_indexed,Y      ; $ED55  99 00 00
  iny                            ; $ED58  C8
  cpy #$2D                       ; $ED59  C0 2D
  bne _label_ed53                ; $ED5B  D0 F6
  ldy #$00                       ; $ED5D  A0 00

_label_ed5f:
  lda a:_data_ecb3_indexed,Y     ; $ED5F  B9 B3 EC
  sta a:_var_0000_indexed,Y      ; $ED62  99 00 00
  iny                            ; $ED65  C8
  cpy #$10                       ; $ED66  C0 10
  bne _label_ed5f                ; $ED68  D0 F5
  lda #$01                       ; $ED6A  A9 01
  sta _var_0019                  ; $ED6C  85 19
  bne _label_ed75                ; $ED6E  D0 05

_label_ed70:
  iny                            ; $ED70  C8
  cpy #$10                       ; $ED71  C0 10
  bne _label_ed49                ; $ED73  D0 D4

_label_ed75:
  ldx #$00                       ; $ED75  A2 00

_label_ed77:
  lda #$00                       ; $ED77  A9 00
  sta _var_001f_indexed,X        ; $ED79  95 1F
  inx                            ; $ED7B  E8
  cpx #$0E                       ; $ED7C  E0 0E
  bne _label_ed77                ; $ED7E  D0 F7
  ldx #$00                       ; $ED80  A2 00

_label_ed82:
  lda #$00                       ; $ED82  A9 00
  sta a:_var_0100_indexed,X      ; $ED84  9D 00 01
  inx                            ; $ED87  E8
  bne _label_ed82                ; $ED88  D0 F8
  lda #$00                       ; $ED8A  A9 00
  sta _var_001c                  ; $ED8C  85 1C
  jsr _func_c19f                 ; $ED8E  20 9F C1
  jsr _func_c1cd                 ; $ED91  20 CD C1
  lda #$18                       ; $ED94  A9 18
  sta _var_007d                  ; $ED96  85 7D
  inc _var_002b                  ; $ED98  E6 2B
  lda #$1F                       ; $ED9A  A9 1F
  sta APU_SND_CHN                ; $ED9C  8D 15 40
  lda #$C0                       ; $ED9F  A9 C0
  sta APU_FRAME                  ; $EDA1  8D 17 40
  jsr _func_f495                 ; $EDA4  20 95 F4
  inc a:_var_0625                ; $EDA7  EE 25 06
  inc a:_var_0626                ; $EDAA  EE 26 06
  inc a:_var_0627                ; $EDAD  EE 27 06
  inc a:_var_0628                ; $EDB0  EE 28 06
  inc a:_var_0137                ; $EDB3  EE 37 01

_label_edb6:
  lda #$B0                       ; $EDB6  A9 B0
  sta _var_001d                  ; $EDB8  85 1D
  sta PPU_CTRL                   ; $EDBA  8D 00 20

_label_edbd:
  lda #$01                       ; $EDBD  A9 01
  sta _var_0020                  ; $EDBF  85 20

_label_edc1:
  lda _var_0020                  ; $EDC1  A5 20
  bne _label_edc1                ; $EDC3  D0 FC
  jsr _func_cc0b                 ; $EDC5  20 0B CC
  jsr _func_c1cd                 ; $EDC8  20 CD C1
  lda _var_006f                  ; $EDCB  A5 6F
  bne _label_edd5                ; $EDCD  D0 06
  jsr _func_a01b                 ; $EDCF  20 1B A0
  jsr _func_a000                 ; $EDD2  20 00 A0

_label_edd5:
  lda _var_0021                  ; $EDD5  A5 21
  bne _label_eded                ; $EDD7  D0 14
  lda _var_0023                  ; $EDD9  A5 23
  beq _label_edbd                ; $EDDB  F0 E0
  ldx #$05                       ; $EDDD  A2 05

_label_eddf:
  lda #$00                       ; $EDDF  A9 00
  sta _var_0010_indexed,X        ; $EDE1  95 10
  dex                            ; $EDE3  CA
  bpl _label_eddf                ; $EDE4  10 F9
  lda #$02                       ; $EDE6  A9 02
  sta _var_0026                  ; $EDE8  85 26
  jmp _label_f028                ; $EDEA  4C 28 F0

_label_eded:
  lda #$01                       ; $EDED  A9 01
  sta _var_0020                  ; $EDEF  85 20

_label_edf1:
  lda _var_0020                  ; $EDF1  A5 20
  bne _label_edf1                ; $EDF3  D0 FC
  jsr _func_cc0b                 ; $EDF5  20 0B CC

_label_edf8:
  lda a:_var_06c3                ; $EDF8  AD C3 06
  beq _label_ee00                ; $EDFB  F0 03
  jmp _label_eeb5                ; $EDFD  4C B5 EE

_label_ee00:
  lda _var_0021                  ; $EE00  A5 21
  beq _label_ee38                ; $EE02  F0 34
  cmp #$02                       ; $EE04  C9 02
  bcs _label_ee16                ; $EE06  B0 0E
  lda _var_0050                  ; $EE08  A5 50
  and #$1F                       ; $EE0A  29 1F
  bne _label_ee10                ; $EE0C  D0 02
  inc _var_006d                  ; $EE0E  E6 6D

_label_ee10:
  lda _var_004b                  ; $EE10  A5 4B
  and #$0C                       ; $EE12  29 0C
  beq _label_ee35                ; $EE14  F0 1F

_label_ee16:
  lda #$00                       ; $EE16  A9 00
  sta _var_001f_indexed          ; $EE18  85 1F
  sta _var_00eb                  ; $EE1A  85 EB
  sta _var_0021                  ; $EE1C  85 21
  jsr _func_c19f                 ; $EE1E  20 9F C1
  jsr _func_c1cd                 ; $EE21  20 CD C1
  lda #$00                       ; $EE24  A9 00
  sta _var_006f                  ; $EE26  85 6F
  sta a:_var_06c3                ; $EE28  8D C3 06
  lda #$18                       ; $EE2B  A9 18
  sta _var_007d                  ; $EE2D  85 7D
  jsr _func_c015                 ; $EE2F  20 15 C0
  jmp _label_edbd                ; $EE32  4C BD ED

_label_ee35:
  jsr _func_afe2                 ; $EE35  20 E2 AF

_label_ee38:
  lda _var_006f                  ; $EE38  A5 6F
  bne _label_ee6c                ; $EE3A  D0 30
  jsr _func_a027                 ; $EE3C  20 27 A0
  jsr _func_a01e                 ; $EE3F  20 1E A0
  lda a:_var_011f                ; $EE42  AD 1F 01
  bne _label_eea5                ; $EE45  D0 5E
  lda _var_004f                  ; $EE47  A5 4F
  cmp #$06                       ; $EE49  C9 06
  beq _label_ee57                ; $EE4B  F0 0A
  lda _var_0098                  ; $EE4D  A5 98
  beq _label_ee61                ; $EE4F  F0 10
  lda #$00                       ; $EE51  A9 00
  sta _var_0098                  ; $EE53  85 98
  inc _var_001f_indexed          ; $EE55  E6 1F

_label_ee57:
  lda #$04                       ; $EE57  A9 04
  sta _var_004f                  ; $EE59  85 4F
  inc a:_var_011f                ; $EE5B  EE 1F 01
  jmp _label_ee95                ; $EE5E  4C 95 EE

_label_ee61:
  lda _var_0026                  ; $EE61  A5 26
  bne _label_ee6c                ; $EE63  D0 07
  lda #$00                       ; $EE65  A9 00
  sta _var_001f_indexed          ; $EE67  85 1F
  jmp _label_edb6                ; $EE69  4C B6 ED

_label_ee6c:
  jsr _func_d431                 ; $EE6C  20 31 D4
  jsr _func_d945                 ; $EE6F  20 45 D9
  lda _var_0085                  ; $EE72  A5 85
  beq _label_ee79                ; $EE74  F0 03

_label_ee76:
  jmp _label_f039                ; $EE76  4C 39 F0

_label_ee79:
  lda _var_0021                  ; $EE79  A5 21
  cmp #$02                       ; $EE7B  C9 02
  bne _label_ee82                ; $EE7D  D0 03
  jmp _label_edf8                ; $EE7F  4C F8 ED

_label_ee82:
  jsr _func_d804                 ; $EE82  20 04 D8
  lda _var_00a5                  ; $EE85  A5 A5
  bne _label_ee76                ; $EE87  D0 ED
  lda a:_var_011f                ; $EE89  AD 1F 01
  beq _label_eeb5                ; $EE8C  F0 27
  jsr _func_f1fb                 ; $EE8E  20 FB F1
  lda _var_0026                  ; $EE91  A5 26
  beq _label_eea8                ; $EE93  F0 13

_label_ee95:
  jsr _func_e792                 ; $EE95  20 92 E7
  lda _var_006f                  ; $EE98  A5 6F
  bne _label_eea5                ; $EE9A  D0 09
  jsr _func_a01b                 ; $EE9C  20 1B A0
  jsr _func_f245                 ; $EE9F  20 45 F2
  jsr _func_c09e                 ; $EEA2  20 9E C0

_label_eea5:
  jmp _label_f039                ; $EEA5  4C 39 F0

_label_eea8:
  lda _var_006f                  ; $EEA8  A5 6F
  bne _label_eeb2                ; $EEAA  D0 06
  jsr _func_a01b                 ; $EEAC  20 1B A0
  jsr _func_c09e                 ; $EEAF  20 9E C0

_label_eeb2:
  jmp _label_f039                ; $EEB2  4C 39 F0

_label_eeb5:
  lda _var_006f                  ; $EEB5  A5 6F
  bne _label_eeed                ; $EEB7  D0 34
  jsr _func_a00f                 ; $EEB9  20 0F A0
  jsr _func_a012                 ; $EEBC  20 12 A0
  jsr _func_a015                 ; $EEBF  20 15 A0
  jsr _func_a018                 ; $EEC2  20 18 A0
  lda _var_008e                  ; $EEC5  A5 8E
  bne _label_eeed                ; $EEC7  D0 24
  inc _var_008e                  ; $EEC9  E6 8E
  lda _var_001d                  ; $EECB  A5 1D
  sta PPU_CTRL                   ; $EECD  8D 00 20
  lda #$00                       ; $EED0  A9 00
  sta _var_00eb                  ; $EED2  85 EB
  sta _var_007c                  ; $EED4  85 7C
  sta a:_var_06c3                ; $EED6  8D C3 06
  jsr _func_c015                 ; $EED9  20 15 C0
  lda _var_001f_indexed          ; $EEDC  A5 1F
  cmp #$81                       ; $EEDE  C9 81
  bcs _label_eeea                ; $EEE0  B0 08
  and #$07                       ; $EEE2  29 07
  beq _label_eeea                ; $EEE4  F0 04
  lda #$01                       ; $EEE6  A9 01
  sta _var_006f                  ; $EEE8  85 6F

_label_eeea:
  jmp _label_f039                ; $EEEA  4C 39 F0

_label_eeed:
  lda _var_0022                  ; $EEED  A5 22
  beq _label_eef4                ; $EEEF  F0 03
  jmp _label_f028                ; $EEF1  4C 28 F0

_label_eef4:
  lda a:_var_06aa                ; $EEF4  AD AA 06
  cmp #$05                       ; $EEF7  C9 05
  beq _label_ef05                ; $EEF9  F0 0A
  jsr _func_da72                 ; $EEFB  20 72 DA
  lda a:_var_06aa                ; $EEFE  AD AA 06
  cmp #$05                       ; $EF01  C9 05
  bne _label_ef0c                ; $EF03  D0 07

_label_ef05:
  jsr _func_dbaa                 ; $EF05  20 AA DB
  lda _var_007e                  ; $EF08  A5 7E
  beq _label_ef0f                ; $EF0A  F0 03

_label_ef0c:
  jmp _label_f039                ; $EF0C  4C 39 F0

_label_ef0f:
  lda _var_001f_indexed          ; $EF0F  A5 1F
  cmp #$81                       ; $EF11  C9 81
  bcs _label_ef0c                ; $EF13  B0 F7
  lda #$EF                       ; $EF15  A9 EF
  sta a:_var_02d9                ; $EF17  8D D9 02
  sta a:_var_02da                ; $EF1A  8D DA 02
  jsr _func_cbc1                 ; $EF1D  20 C1 CB
  jsr _func_c614                 ; $EF20  20 14 C6
  jsr _func_c9d6                 ; $EF23  20 D6 C9
  jsr _func_c8ce                 ; $EF26  20 CE C8
  jsr _func_c697                 ; $EF29  20 97 C6
  jsr _func_ddf8                 ; $EF2C  20 F8 DD
  jsr _func_ca17                 ; $EF2F  20 17 CA
  jsr _func_dff8                 ; $EF32  20 F8 DF
  jsr _func_f0cb                 ; $EF35  20 CB F0
  jsr _func_cd3b                 ; $EF38  20 3B CD
  lda _var_006f                  ; $EF3B  A5 6F
  beq _label_ef48                ; $EF3D  F0 09
  jsr _func_a71c                 ; $EF3F  20 1C A7
  jsr _func_aa62                 ; $EF42  20 62 AA
  jmp _label_a991                ; $EF45  4C 91 A9

_label_ef48:
  jsr _func_c3c4                 ; $EF48  20 C4 C3
  jsr _func_eb20                 ; $EF4B  20 20 EB

_label_ef4e:
  lda _var_00ee                  ; $EF4E  A5 EE
  beq _label_ef56                ; $EF50  F0 04
  lda #$00                       ; $EF52  A9 00
  sta _var_0043                  ; $EF54  85 43

_label_ef56:
  lda _var_004b                  ; $EF56  A5 4B
  and #$F0                       ; $EF58  29 F0
  beq _label_ef7a                ; $EF5A  F0 1E
  lda a:_var_0201_indexed        ; $EF5C  AD 01 02
  cmp #$08                       ; $EF5F  C9 08
  beq _label_ef6f                ; $EF61  F0 0C
  cmp #$0A                       ; $EF63  C9 0A
  beq _label_ef6f                ; $EF65  F0 08
  cmp #$B2                       ; $EF67  C9 B2
  beq _label_ef6f                ; $EF69  F0 04
  cmp #$B0                       ; $EF6B  C9 B0
  bne _label_ef7a                ; $EF6D  D0 0B

_label_ef6f:
  lda a:_var_061c                ; $EF6F  AD 1C 06
  bne _label_ef7f                ; $EF72  D0 0B
  inc a:_var_061c                ; $EF74  EE 1C 06
  jmp _label_ef7f                ; $EF77  4C 7F EF

_label_ef7a:
  lda #$00                       ; $EF7A  A9 00
  sta a:_var_061c                ; $EF7C  8D 1C 06

_label_ef7f:
  lda _var_008e                  ; $EF7F  A5 8E
  beq _label_ef86                ; $EF81  F0 03
  jsr _func_d496                 ; $EF83  20 96 D4

_label_ef86:
  lda #$01                       ; $EF86  A9 01
  sta a:_var_0137                ; $EF88  8D 37 01
  ldx #$00                       ; $EF8B  A2 00

_label_ef8d:
  lda _var_00d0_indexed,X        ; $EF8D  B5 D0
  beq _label_ef98                ; $EF8F  F0 07
  txa                            ; $EF91  8A
  sta a:_var_0137                ; $EF92  8D 37 01
  inc a:_var_0137                ; $EF95  EE 37 01

_label_ef98:
  inx                            ; $EF98  E8
  cpx #$09                       ; $EF99  E0 09
  bne _label_ef8d                ; $EF9B  D0 F0
  lda _var_006f                  ; $EF9D  A5 6F
  beq _label_efa4                ; $EF9F  F0 03
  jsr _func_a4f0                 ; $EFA1  20 F0 A4

_label_efa4:
  jsr _func_dd4b                 ; $EFA4  20 4B DD
  jsr _func_e51e                 ; $EFA7  20 1E E5
  jsr _func_d0ed                 ; $EFAA  20 ED D0
  jsr _func_c32c                 ; $EFAD  20 2C C3
  lda _var_006f                  ; $EFB0  A5 6F
  beq _label_efe4                ; $EFB2  F0 30
  jsr _func_aad4                 ; $EFB4  20 D4 AA
  jsr _func_a2ed                 ; $EFB7  20 ED A2
  jsr _func_a82c                 ; $EFBA  20 2C A8
  jsr _func_a33f                 ; $EFBD  20 3F A3
  jsr _func_adac                 ; $EFC0  20 AC AD
  jsr _func_af43                 ; $EFC3  20 43 AF
  jsr _func_b1f7                 ; $EFC6  20 F7 B1
  jsr _func_b0f8                 ; $EFC9  20 F8 B0
  jsr _func_bb14                 ; $EFCC  20 14 BB
  jsr _func_b7b6                 ; $EFCF  20 B6 B7
  jsr _func_a21f                 ; $EFD2  20 1F A2
  jsr _func_ba4e                 ; $EFD5  20 4E BA
  jsr _func_b9a1                 ; $EFD8  20 A1 B9
  jsr _func_bd9d                 ; $EFDB  20 9D BD
  jsr _func_aeb1                 ; $EFDE  20 B1 AE
  jsr _func_be54                 ; $EFE1  20 54 BE

_label_efe4:
  jsr _func_f064                 ; $EFE4  20 64 F0
  jsr _func_ccc1                 ; $EFE7  20 C1 CC
  lda _var_006f                  ; $EFEA  A5 6F
  bne _label_eff1                ; $EFEC  D0 03
  jsr _func_a006                 ; $EFEE  20 06 A0

_label_eff1:
  lda _var_0091                  ; $EFF1  A5 91
  bne _label_eff8                ; $EFF3  D0 03
  jsr _func_cba6                 ; $EFF5  20 A6 CB

_label_eff8:
  lda _var_0093                  ; $EFF8  A5 93
  beq _label_f039                ; $EFFA  F0 3D
  lda a:_var_02d2                ; $EFFC  AD D2 02
  sta _var_0032                  ; $EFFF  85 32
  lda a:_var_02d7                ; $F001  AD D7 02
  sta _var_0031_indexed          ; $F004  85 31
  jsr _func_e70b                 ; $F006  20 0B E7
  lda _var_0032                  ; $F009  A5 32
  sta a:_var_02d2                ; $F00B  8D D2 02
  lda _var_0031_indexed          ; $F00E  A5 31
  sta a:_var_02d7                ; $F010  8D D7 02
  lda _var_0094                  ; $F013  A5 94
  cmp #$02                       ; $F015  C9 02
  bcc _label_f039                ; $F017  90 20
  lda #$EF                       ; $F019  A9 EF
  sta a:_var_02d2                ; $F01B  8D D2 02
  sta a:_var_02d3                ; $F01E  8D D3 02
  lda #$00                       ; $F021  A9 00
  sta _var_0093                  ; $F023  85 93
  jmp _label_f039                ; $F025  4C 39 F0

_label_f028:
  lda _var_006f                  ; $F028  A5 6F
  bne _label_f05b                ; $F02A  D0 2F
  jsr _func_a024                 ; $F02C  20 24 A0
  lda _var_0022                  ; $F02F  A5 22
  beq _label_f039                ; $F031  F0 06
  jsr _func_a01b                 ; $F033  20 1B A0
  jsr _func_c09e                 ; $F036  20 9E C0

_label_f039:
  lda _var_006f                  ; $F039  A5 6F
  bne _label_f05b                ; $F03B  D0 1E
  jsr _func_a00c                 ; $F03D  20 0C A0
  lda _var_001f_indexed          ; $F040  A5 1F
  cmp #$82                       ; $F042  C9 82
  bne _label_f057                ; $F044  D0 11
  jsr _func_a009                 ; $F046  20 09 A0
  lda a:$06A3                    ; $F049  AD A3 06
  cmp #$08                       ; $F04C  C9 08
  bcc _label_f057                ; $F04E  90 07
  lda _var_004b                  ; $F050  A5 4B
  beq _label_f057                ; $F052  F0 03
  jmp _label_ee16                ; $F054  4C 16 EE

_label_f057:
  lda _var_006f                  ; $F057  A5 6F
  beq _label_f05e                ; $F059  F0 03

_label_f05b:
  jsr _func_ae5b                 ; $F05B  20 5B AE

_label_f05e:
  jsr _func_da0a                 ; $F05E  20 0A DA
  jmp _label_eded                ; $F061  4C ED ED

_func_f064:
  lda _var_007b                  ; $F064  A5 7B
  beq _label_f07d                ; $F066  F0 15
  lda #$00                       ; $F068  A9 00
  sta _var_00af                  ; $F06A  85 AF

_label_f06c:
  ldx _var_00af                  ; $F06C  A6 AF
  lda _var_00d0_indexed,X        ; $F06E  B5 D0
  cmp #$02                       ; $F070  C9 02
  beq _label_f07e                ; $F072  F0 0A

_label_f074:
  inc _var_00af                  ; $F074  E6 AF
  lda _var_00af                  ; $F076  A5 AF
  cmp a:_var_0137                ; $F078  CD 37 01
  bne _label_f06c                ; $F07B  D0 EF

_label_f07d:
  rts                            ; $F07D  60

_label_f07e:
  jsr _func_d36d                 ; $F07E  20 6D D3
  tay                            ; $F081  A8
  lda a:_var_0213_indexed,Y      ; $F082  B9 13 02
  bne _label_f07d                ; $F085  D0 F6
  lda a:_var_0207_indexed        ; $F087  AD 07 02
  sec                            ; $F08A  38
  sbc a:_var_020e_indexed,Y      ; $F08B  F9 0E 02
  bcs _label_f097                ; $F08E  B0 07
  sta _var_002d_indexed          ; $F090  85 2D
  lda #$00                       ; $F092  A9 00
  sec                            ; $F094  38
  sbc _var_002d_indexed          ; $F095  E5 2D

_label_f097:
  cmp #$11                       ; $F097  C9 11
  bcs _label_f074                ; $F099  B0 D9
  lda a:_var_020a_indexed        ; $F09B  AD 0A 02
  sec                            ; $F09E  38
  sbc a:_var_0211_indexed,Y      ; $F09F  F9 11 02
  bcs _label_f0ab                ; $F0A2  B0 07
  sta _var_002d_indexed          ; $F0A4  85 2D
  lda #$00                       ; $F0A6  A9 00
  sec                            ; $F0A8  38
  sbc _var_002d_indexed          ; $F0A9  E5 2D

_label_f0ab:
  cmp #$11                       ; $F0AB  C9 11
  bcs _label_f074                ; $F0AD  B0 C5
  lda #$00                       ; $F0AF  A9 00
  sta _var_007b                  ; $F0B1  85 7B
  lda #$02                       ; $F0B3  A9 02
  sta _var_007a                  ; $F0B5  85 7A
  lda #$01                       ; $F0B7  A9 01
  sta _var_0077                  ; $F0B9  85 77
  lda a:_var_0200_indexed        ; $F0BB  AD 00 02
  sec                            ; $F0BE  38
  sbc #$0C                       ; $F0BF  E9 0C
  sta a:_var_0207_indexed        ; $F0C1  8D 07 02
  lda a:_var_0203_indexed        ; $F0C4  AD 03 02
  sta a:_var_020a_indexed        ; $F0C7  8D 0A 02
  rts                            ; $F0CA  60

_func_f0cb:
  lda #$00                       ; $F0CB  A9 00
  sta _var_00af                  ; $F0CD  85 AF
  sta _var_00ee                  ; $F0CF  85 EE

_label_f0d1:
  lda #$00                       ; $F0D1  A9 00
  sta _var_0030                  ; $F0D3  85 30
  sta _var_0031_indexed          ; $F0D5  85 31
  sta _var_002e                  ; $F0D7  85 2E
  ldx _var_00af                  ; $F0D9  A6 AF
  lda _var_00d0_indexed,X        ; $F0DB  B5 D0
  bne _label_f0ee                ; $F0DD  D0 0F

_label_f0df:
  inc _var_00af                  ; $F0DF  E6 AF
  lda a:_var_0137                ; $F0E1  AD 37 01
  cmp _var_00af                  ; $F0E4  C5 AF
  bne _label_f0d1                ; $F0E6  D0 E9
  rts                            ; $F0E8  60

_label_f0e9:
  inc _var_00ee                  ; $F0E9  E6 EE
  jmp _label_f0df                ; $F0EB  4C DF F0

_label_f0ee:
  jsr _func_d487                 ; $F0EE  20 87 D4
  lda a:_var_0213_indexed,X      ; $F0F1  BD 13 02
  bne _label_f0df                ; $F0F4  D0 E9
  lda a:_var_0200_indexed        ; $F0F6  AD 00 02
  sec                            ; $F0F9  38
  sbc a:_var_020e_indexed,X      ; $F0FA  FD 0E 02
  beq _label_f101                ; $F0FD  F0 02
  bcs _label_f117                ; $F0FF  B0 16

_label_f101:
  sta _var_002d_indexed          ; $F101  85 2D
  inc _var_0031_indexed          ; $F103  E6 31
  lda #$00                       ; $F105  A9 00
  sec                            ; $F107  38
  sbc _var_002d_indexed          ; $F108  E5 2D
  cmp #$0B                       ; $F10A  C9 0B
  bcc _label_f117                ; $F10C  90 09
  cmp #$11                       ; $F10E  C9 11
  bcs _label_f0df                ; $F110  B0 CD
  inc _var_002e                  ; $F112  E6 2E
  jmp _label_f11d                ; $F114  4C 1D F1

_label_f117:
  cmp #$11                       ; $F117  C9 11
  bcs _label_f0df                ; $F119  B0 C4
  sta _var_0032                  ; $F11B  85 32

_label_f11d:
  lda a:_var_0203_indexed        ; $F11D  AD 03 02
  sec                            ; $F120  38
  sbc a:_var_0211_indexed,X      ; $F121  FD 11 02
  bcs _label_f12f                ; $F124  B0 09
  sta _var_002d_indexed          ; $F126  85 2D
  inc _var_0030                  ; $F128  E6 30
  lda #$00                       ; $F12A  A9 00
  sec                            ; $F12C  38
  sbc _var_002d_indexed          ; $F12D  E5 2D

_label_f12f:
  cmp #$0C                       ; $F12F  C9 0C
  beq _label_f0e9                ; $F131  F0 B6
  bcs _label_f0df                ; $F133  B0 AA
  lda _var_002e                  ; $F135  A5 2E
  bne _label_f196                ; $F137  D0 5D
  lda _var_0032                  ; $F139  A5 32
  cmp #$0C                       ; $F13B  C9 0C
  bcs _label_f0df                ; $F13D  B0 A0
  lda _var_0043                  ; $F13F  A5 43
  cmp #$05                       ; $F141  C9 05
  bcc _label_f148                ; $F143  90 03
  inc _var_0085                  ; $F145  E6 85

_label_f147:
  rts                            ; $F147  60

_label_f148:
  lda #$00                       ; $F148  A9 00
  sta _var_0043                  ; $F14A  85 43
  lda #$0A                       ; $F14C  A9 0A
  sta _var_004e                  ; $F14E  85 4E
  lda _var_004b                  ; $F150  A5 4B
  and #$30                       ; $F152  29 30
  beq _label_f17d                ; $F154  F0 27
  lda _var_0031_indexed          ; $F156  A5 31
  beq _label_f161                ; $F158  F0 07
  lda _var_004b                  ; $F15A  A5 4B
  and #$DF                       ; $F15C  29 DF
  jmp _label_f165                ; $F15E  4C 65 F1

_label_f161:
  lda _var_004b                  ; $F161  A5 4B
  and #$EF                       ; $F163  29 EF

_label_f165:
  sta _var_004b                  ; $F165  85 4B
  lda _var_006a                  ; $F167  A5 6A
  bne _label_f174                ; $F169  D0 09
  lda _var_004b                  ; $F16B  A5 4B
  and #$EF                       ; $F16D  29 EF
  sta _var_004b                  ; $F16F  85 4B
  jmp _label_c4a5                ; $F171  4C A5 C4

_label_f174:
  lda _var_004b                  ; $F174  A5 4B
  and #$DF                       ; $F176  29 DF
  sta _var_004b                  ; $F178  85 4B
  jmp _label_c4a5                ; $F17A  4C A5 C4

_label_f17d:
  lda a:_var_0203_indexed        ; $F17D  AD 03 02
  and #$07                       ; $F180  29 07
  cmp #$04                       ; $F182  C9 04
  beq _label_f193                ; $F184  F0 0D
  lda _var_0030                  ; $F186  A5 30
  beq _label_f190                ; $F188  F0 06
  dec a:_var_0203_indexed        ; $F18A  CE 03 02
  jmp _label_e0ed                ; $F18D  4C ED E0

_label_f190:
  inc a:_var_0203_indexed        ; $F190  EE 03 02

_label_f193:
  jmp _label_e0ed                ; $F193  4C ED E0

_label_f196:
  ldx #$05                       ; $F196  A2 05

_label_f198:
  lda a:_var_0101_indexed,X      ; $F198  BD 01 01
  bne _label_f147                ; $F19B  D0 AA
  dex                            ; $F19D  CA
  bpl _label_f198                ; $F19E  10 F8
  lda #$06                       ; $F1A0  A9 06
  sta _var_0043                  ; $F1A2  85 43
  lda #$00                       ; $F1A4  A9 00
  sta _var_0046                  ; $F1A6  85 46
  inc _var_009c                  ; $F1A8  E6 9C
  lda _var_004b                  ; $F1AA  A5 4B
  and #$0C                       ; $F1AC  29 0C
  sta _var_004b                  ; $F1AE  85 4B
  lda #$01                       ; $F1B0  A9 01
  sta _var_0032                  ; $F1B2  85 32
  jmp _func_c242                 ; $F1B4  4C 42 C2

_func_f1b7:
  ldy #$00                       ; $F1B7  A0 00
  ldx #$00                       ; $F1B9  A2 00

_label_f1bb:
  lda _var_0016_indexed,X        ; $F1BB  B5 16
  cmp a:_var_0010_indexed,Y      ; $F1BD  D9 10 00
  beq _label_f1d2                ; $F1C0  F0 10
  bcc _label_f1e2                ; $F1C2  90 1E

_label_f1c4:
  ldx #$00                       ; $F1C4  A2 00
  ldy #$06                       ; $F1C6  A0 06

_label_f1c8:
  lda _var_0016_indexed,X        ; $F1C8  B5 16
  cmp a:_var_0010_indexed,Y      ; $F1CA  D9 10 00
  beq _label_f1db                ; $F1CD  F0 0C
  bcc _label_f1e7                ; $F1CF  90 16
  rts                            ; $F1D1  60

_label_f1d2:
  inx                            ; $F1D2  E8
  iny                            ; $F1D3  C8
  cpx #$06                       ; $F1D4  E0 06
  bne _label_f1bb                ; $F1D6  D0 E3
  jmp _label_f1c4                ; $F1D8  4C C4 F1

_label_f1db:
  inx                            ; $F1DB  E8
  iny                            ; $F1DC  C8
  cpx #$06                       ; $F1DD  E0 06
  bne _label_f1c8                ; $F1DF  D0 E7
  rts                            ; $F1E1  60

_label_f1e2:
  ldy #$00                       ; $F1E2  A0 00
  jmp _label_f1e9                ; $F1E4  4C E9 F1

_label_f1e7:
  ldy #$06                       ; $F1E7  A0 06

_label_f1e9:
  ldx #$00                       ; $F1E9  A2 00

_label_f1eb:
  lda a:_var_0010_indexed,Y      ; $F1EB  B9 10 00
  sta _var_0016_indexed,X        ; $F1EE  95 16
  inx                            ; $F1F0  E8
  iny                            ; $F1F1  C8
  cpx #$06                       ; $F1F2  E0 06
  bne _label_f1eb                ; $F1F4  D0 F5
  cpy #$06                       ; $F1F6  C0 06
  beq _label_f1c4                ; $F1F8  F0 CA
  rts                            ; $F1FA  60

_func_f1fb:
  lda a:_var_011f                ; $F1FB  AD 1F 01
  beq _label_f234                ; $F1FE  F0 34
  lda _var_004f                  ; $F200  A5 4F
  cmp #$08                       ; $F202  C9 08
  bne _label_f234                ; $F204  D0 2E
  ldy #$00                       ; $F206  A0 00

_label_f208:
  tya                            ; $F208  98
  tax                            ; $F209  AA
  jsr _func_d487                 ; $F20A  20 87 D4
  lda a:_data_f235_indexed,Y     ; $F20D  B9 35 F2
  sta a:_var_020e_indexed,X      ; $F210  9D 0E 02
  lda a:_data_f239_indexed,Y     ; $F213  B9 39 F2
  sta a:_var_020f_indexed,X      ; $F216  9D 0F 02
  lda a:_data_f23d_indexed,Y     ; $F219  B9 3D F2
  sta a:_var_0210_indexed,X      ; $F21C  9D 10 02
  lda #$68                       ; $F21F  A9 68
  sta a:_var_0211_indexed,X      ; $F221  9D 11 02
  lda a:_data_f241_indexed,Y     ; $F224  B9 41 F2
  sta a:_var_0212_indexed,X      ; $F227  9D 12 02
  lda #$00                       ; $F22A  A9 00
  sta a:_var_0213_indexed,X      ; $F22C  9D 13 02
  iny                            ; $F22F  C8
  cpy #$04                       ; $F230  C0 04
  bne _label_f208                ; $F232  D0 D4

_label_f234:
  rts                            ; $F234  60

_data_f235_indexed:
.byte $77, $87, $97, $a7         ; $F235

_data_f239_indexed:
.byte $74, $a0, $78, $ec         ; $F239

_data_f23d_indexed:
.byte $00, $02, $01, $02         ; $F23D

_data_f241_indexed:
.byte $76, $a2, $7a, $ee         ; $F241

_func_f245:
  lda _var_004f                  ; $F245  A5 4F
  cmp #$08                       ; $F247  C9 08
  beq _label_f24c                ; $F249  F0 01

_label_f24b:
  rts                            ; $F24B  60

_label_f24c:
  lda _var_008e                  ; $F24C  A5 8E
  cmp #$01                       ; $F24E  C9 01
  bne _label_f24b                ; $F250  D0 F9
  lda #$06                       ; $F252  A9 06
  sta PPU_MASK                   ; $F254  8D 01 20
  lda #$30                       ; $F257  A9 30
  sta PPU_CTRL                   ; $F259  8D 00 20
  lda #$29                       ; $F25C  A9 29
  sta PPU_ADDR                   ; $F25E  8D 06 20
  lda #$13                       ; $F261  A9 13
  sta PPU_ADDR                   ; $F263  8D 06 20
  ldx #$00                       ; $F266  A2 00
  jsr _func_f39c                 ; $F268  20 9C F3
  ldx #$00                       ; $F26B  A2 00
  lda _var_001f_indexed          ; $F26D  A5 1F

_label_f26f:
  sec                            ; $F26F  38
  sbc #$08                       ; $F270  E9 08
  bcc _label_f278                ; $F272  90 04
  inx                            ; $F274  E8
  jmp _label_f26f                ; $F275  4C 6F F2

_label_f278:
  inx                            ; $F278  E8
  txa                            ; $F279  8A
  sta _var_0028                  ; $F27A  85 28
  lda #$87                       ; $F27C  A9 87
  sta _var_002e                  ; $F27E  85 2E
  txa                            ; $F280  8A
  ldx #$00                       ; $F281  A2 00

_label_f283:
  sec                            ; $F283  38
  sbc #$0A                       ; $F284  E9 0A
  bcc _label_f28c                ; $F286  90 04
  inx                            ; $F288  E8
  jmp _label_f283                ; $F289  4C 83 F2

_label_f28c:
  clc                            ; $F28C  18
  adc #$0A                       ; $F28D  69 0A
  sta _var_002d_indexed          ; $F28F  85 2D
  txa                            ; $F291  8A
  bne _label_f296                ; $F292  D0 02
  lda #$87                       ; $F294  A9 87

_label_f296:
  sta _var_002e                  ; $F296  85 2E
  lda #$29                       ; $F298  A9 29
  sta PPU_ADDR                   ; $F29A  8D 06 20
  lda #$76                       ; $F29D  A9 76
  sta PPU_ADDR                   ; $F29F  8D 06 20
  lda _var_002e                  ; $F2A2  A5 2E
  sta PPU_DATA                   ; $F2A4  8D 07 20
  lda _var_002d_indexed          ; $F2A7  A5 2D
  sta PPU_DATA                   ; $F2A9  8D 07 20
  lda #$12                       ; $F2AC  A9 12
  sta _var_002e                  ; $F2AE  85 2E
  lda #$00                       ; $F2B0  A9 00
  sta _var_002f_indexed          ; $F2B2  85 2F
  jsr _func_f362                 ; $F2B4  20 62 F3
  inc _var_0032                  ; $F2B7  E6 32
  lda #$29                       ; $F2B9  A9 29
  sta PPU_ADDR                   ; $F2BB  8D 06 20
  lda #$B7                       ; $F2BE  A9 B7
  sta PPU_ADDR                   ; $F2C0  8D 06 20
  lda _var_0091                  ; $F2C3  A5 91
  sta _var_002d_indexed          ; $F2C5  85 2D
  jsr _func_f323                 ; $F2C7  20 23 F3
  ldy #$00                       ; $F2CA  A0 00

_label_f2cc:
  lda a:_data_f31f_indexed,Y     ; $F2CC  B9 1F F3
  sta _var_002d_indexed          ; $F2CF  85 2D
  ldx a:_var_0146_indexed,Y      ; $F2D1  BE 46 01
  lda #$00                       ; $F2D4  A9 00

_label_f2d6:
  cpx #$00                       ; $F2D6  E0 00
  beq _label_f2e1                ; $F2D8  F0 07
  dex                            ; $F2DA  CA
  clc                            ; $F2DB  18
  adc _var_002d_indexed          ; $F2DC  65 2D
  jmp _label_f2d6                ; $F2DE  4C D6 F2

_label_f2e1:
  sta a:_var_0146_indexed,Y      ; $F2E1  99 46 01
  iny                            ; $F2E4  C8
  cpy #$04                       ; $F2E5  C0 04
  bne _label_f2cc                ; $F2E7  D0 E3
  lda #$17                       ; $F2E9  A9 17
  sta _var_002e                  ; $F2EB  85 2E
  lda #$00                       ; $F2ED  A9 00
  sta _var_002f_indexed          ; $F2EF  85 2F
  jsr _func_f362                 ; $F2F1  20 62 F3
  lda _var_0029                  ; $F2F4  A5 29
  sta _var_002d_indexed          ; $F2F6  85 2D
  jsr _func_f386                 ; $F2F8  20 86 F3
  lda _var_002e                  ; $F2FB  A5 2E
  sta _var_0029                  ; $F2FD  85 29
  lda _var_0028                  ; $F2FF  A5 28
  clc                            ; $F301  18
  adc _var_002d_indexed          ; $F302  65 2D
  sta _var_002d_indexed          ; $F304  85 2D
  jsr _func_f386                 ; $F306  20 86 F3
  lda _var_002e                  ; $F309  A5 2E
  sta _var_0028                  ; $F30B  85 28
  lda _var_002d_indexed          ; $F30D  A5 2D
  sta _var_0027_indexed          ; $F30F  85 27
  jsr _func_f3c3                 ; $F311  20 C3 F3
  lda #$00                       ; $F314  A9 00
  sta PPU_MASK                   ; $F316  8D 01 20
  lda _var_001d                  ; $F319  A5 1D
  sta PPU_CTRL                   ; $F31B  8D 00 20
  rts                            ; $F31E  60

_data_f31f_indexed:
.byte $01, $02, $05, $0a         ; $F31F

_func_f323:
  ldx #$00                       ; $F323  A2 00

_label_f325:
  lda _var_002d_indexed          ; $F325  A5 2D
  sec                            ; $F327  38
  sbc #$0A                       ; $F328  E9 0A
  bcc _label_f338                ; $F32A  90 0C
  sta _var_002d_indexed          ; $F32C  85 2D
  inx                            ; $F32E  E8
  lda _var_0032                  ; $F32F  A5 32
  beq _label_f325                ; $F331  F0 F2
  inc _var_0028                  ; $F333  E6 28
  jmp _label_f325                ; $F335  4C 25 F3

_label_f338:
  clc                            ; $F338  18
  adc #$0A                       ; $F339  69 0A
  tay                            ; $F33B  A8
  lda _var_0032                  ; $F33C  A5 32
  beq _label_f346                ; $F33E  F0 06
  tya                            ; $F340  98
  clc                            ; $F341  18
  adc _var_0029                  ; $F342  65 29
  sta _var_0029                  ; $F344  85 29

_label_f346:
  txa                            ; $F346  8A
  bne _label_f34b                ; $F347  D0 02
  lda #$87                       ; $F349  A9 87

_label_f34b:
  sta PPU_DATA                   ; $F34B  8D 07 20
  tya                            ; $F34E  98
  bne _label_f35e                ; $F34F  D0 0D
  lda _var_0032                  ; $F351  A5 32
  beq _label_f35d                ; $F353  F0 08
  txa                            ; $F355  8A
  bne _label_f35d                ; $F356  D0 05
  lda #$87                       ; $F358  A9 87
  jmp _label_f35e                ; $F35A  4C 5E F3

_label_f35d:
  tya                            ; $F35D  98

_label_f35e:
  sta PPU_DATA                   ; $F35E  8D 07 20
  rts                            ; $F361  60

_func_f362:
  lda #$2A                       ; $F362  A9 2A
  sta PPU_ADDR                   ; $F364  8D 06 20
  lda _var_002e                  ; $F367  A5 2E
  sta PPU_ADDR                   ; $F369  8D 06 20
  ldx _var_002f_indexed          ; $F36C  A6 2F
  lda a:_var_0146_indexed,X      ; $F36E  BD 46 01
  sta _var_002d_indexed          ; $F371  85 2D
  jsr _func_f323                 ; $F373  20 23 F3
  lda _var_002e                  ; $F376  A5 2E
  clc                            ; $F378  18
  adc #$40                       ; $F379  69 40
  sta _var_002e                  ; $F37B  85 2E
  inc _var_002f_indexed          ; $F37D  E6 2F
  lda _var_002f_indexed          ; $F37F  A5 2F
  cmp #$04                       ; $F381  C9 04
  bne _func_f362                 ; $F383  D0 DD
  rts                            ; $F385  60

_func_f386:
  ldx #$00                       ; $F386  A2 00
  lda _var_002d_indexed          ; $F388  A5 2D

_label_f38a:
  sec                            ; $F38A  38
  sbc #$0A                       ; $F38B  E9 0A
  bcc _label_f393                ; $F38D  90 04
  inx                            ; $F38F  E8
  jmp _label_f38a                ; $F390  4C 8A F3

_label_f393:
  clc                            ; $F393  18
  adc #$0A                       ; $F394  69 0A
  sta _var_002e                  ; $F396  85 2E
  txa                            ; $F398  8A
  sta _var_002d_indexed          ; $F399  85 2D
  rts                            ; $F39B  60

_func_f39c:
  ldy #$00                       ; $F39C  A0 00
  lda #$00                       ; $F39E  A9 00
  sta _var_0032                  ; $F3A0  85 32
  lda #$87                       ; $F3A2  A9 87
  sta _var_002d_indexed          ; $F3A4  85 2D

_label_f3a6:
  lda _var_0010_indexed,X        ; $F3A6  B5 10
  bne _label_f3b7                ; $F3A8  D0 0D
  lda _var_002d_indexed          ; $F3AA  A5 2D
  cmp #$87                       ; $F3AC  C9 87
  bne _label_f3b5                ; $F3AE  D0 05
  lda #$87                       ; $F3B0  A9 87
  jmp _label_f3b7                ; $F3B2  4C B7 F3

_label_f3b5:
  lda _var_0010_indexed,X        ; $F3B5  B5 10

_label_f3b7:
  sta PPU_DATA                   ; $F3B7  8D 07 20
  sta _var_002d_indexed          ; $F3BA  85 2D
  inx                            ; $F3BC  E8
  iny                            ; $F3BD  C8
  cpy #$06                       ; $F3BE  C0 06
  bne _label_f3a6                ; $F3C0  D0 E4
  rts                            ; $F3C2  60

_func_f3c3:
  lda #$2B                       ; $F3C3  A9 2B
  sta PPU_ADDR                   ; $F3C5  8D 06 20
  lda #$36                       ; $F3C8  A9 36
  sta PPU_ADDR                   ; $F3CA  8D 06 20
  lda #$87                       ; $F3CD  A9 87
  sta _var_002d_indexed          ; $F3CF  85 2D
  ldx #$00                       ; $F3D1  A2 00

_label_f3d3:
  lda _var_0027_indexed,X        ; $F3D3  B5 27
  bne _label_f3e4                ; $F3D5  D0 0D
  lda _var_002d_indexed          ; $F3D7  A5 2D
  cmp #$87                       ; $F3D9  C9 87
  bne _label_f3e2                ; $F3DB  D0 05
  lda #$87                       ; $F3DD  A9 87
  jmp _label_f3e4                ; $F3DF  4C E4 F3

_label_f3e2:
  lda _var_0027_indexed,X        ; $F3E2  B5 27

_label_f3e4:
  sta PPU_DATA                   ; $F3E4  8D 07 20
  sta _var_002d_indexed          ; $F3E7  85 2D
  inx                            ; $F3E9  E8
  cpx #$03                       ; $F3EA  E0 03
  bne _label_f3d3                ; $F3EC  D0 E5
  rts                            ; $F3EE  60

_func_f3ef:
  lda a:_var_0611                ; $F3EF  AD 11 06
  bne _label_f3f7                ; $F3F2  D0 03
  inc a:_var_0611                ; $F3F4  EE 11 06

_label_f3f7:
  lda _var_0029                  ; $F3F7  A5 29
  beq _label_f403                ; $F3F9  F0 08
  dec _var_0029                  ; $F3FB  C6 29
  jsr _func_f436                 ; $F3FD  20 36 F4
  jmp _label_f41d                ; $F400  4C 1D F4

_label_f403:
  lda _var_0028                  ; $F403  A5 28
  beq _label_f410                ; $F405  F0 09
  dec _var_0028                  ; $F407  C6 28
  lda #$0A                       ; $F409  A9 0A
  sta _var_0029                  ; $F40B  85 29
  jmp _label_f3f7                ; $F40D  4C F7 F3

_label_f410:
  lda _var_0027_indexed          ; $F410  A5 27
  beq _label_f430                ; $F412  F0 1C
  dec _var_0027_indexed          ; $F414  C6 27
  lda #$0A                       ; $F416  A9 0A
  sta _var_0028                  ; $F418  85 28
  jmp _label_f3f7                ; $F41A  4C F7 F3

_label_f41d:
  jsr _func_f3c3                 ; $F41D  20 C3 F3
  lda #$29                       ; $F420  A9 29
  sta PPU_ADDR                   ; $F422  8D 06 20
  lda #$13                       ; $F425  A9 13
  sta PPU_ADDR                   ; $F427  8D 06 20
  ldx #$00                       ; $F42A  A2 00
  jsr _func_f39c                 ; $F42C  20 9C F3
  rts                            ; $F42F  60

_label_f430:
  lda #$00                       ; $F430  A9 00
  sta a:_var_0611                ; $F432  8D 11 06
  rts                            ; $F435  60

_func_f436:
  lda #$00                       ; $F436  A9 00
  sta _var_002f_indexed          ; $F438  85 2F
  ldx #$05                       ; $F43A  A2 05

_label_f43c:
  inc _var_0010_indexed,X        ; $F43C  F6 10
  lda _var_0010_indexed,X        ; $F43E  B5 10
  cmp #$0A                       ; $F440  C9 0A
  bne _label_f451                ; $F442  D0 0D
  lda #$00                       ; $F444  A9 00
  sta _var_0010_indexed,X        ; $F446  95 10
  dex                            ; $F448  CA
  cpx #$FF                       ; $F449  E0 FF
  beq _label_f451                ; $F44B  F0 04
  cmp #$05                       ; $F44D  C9 05
  bne _label_f43c                ; $F44F  D0 EB

_label_f451:
  rts                            ; $F451  60

_label_f452:
  lda _var_004f                  ; $F452  A5 4F
  cmp #$00                       ; $F454  C9 00
  beq _label_f459                ; $F456  F0 01
  rts                            ; $F458  60

_label_f459:
  jsr _func_f1b7                 ; $F459  20 B7 F1
  ldx #$00                       ; $F45C  A2 00
  lda #$28                       ; $F45E  A9 28
  sta PPU_ADDR                   ; $F460  8D 06 20
  lda #$85                       ; $F463  A9 85
  sta PPU_ADDR                   ; $F465  8D 06 20
  jsr _func_f39c                 ; $F468  20 9C F3
  lda #$28                       ; $F46B  A9 28
  sta PPU_ADDR                   ; $F46D  8D 06 20
  lda #$92                       ; $F470  A9 92
  sta PPU_ADDR                   ; $F472  8D 06 20
  jsr _func_f39c                 ; $F475  20 9C F3
  lda _var_001e                  ; $F478  A5 1E
  beq _label_f491                ; $F47A  F0 15
  lda #$28                       ; $F47C  A9 28
  sta PPU_ADDR                   ; $F47E  8D 06 20
  lda #$71                       ; $F481  A9 71
  sta PPU_ADDR                   ; $F483  8D 06 20
  ldx #$02                       ; $F486  A2 02

_label_f488:
  lda a:_data_f492_indexed,X     ; $F488  BD 92 F4
  sta PPU_DATA                   ; $F48B  8D 07 20
  dex                            ; $F48E  CA
  bpl _label_f488                ; $F48F  10 F7

_label_f491:
  rts                            ; $F491  60

_data_f492_indexed:
.byte $18, $1b, $19              ; $F492

_func_f495:
  lda #$C0                       ; $F495  A9 C0
  sta APU_FRAME                  ; $F497  8D 17 40
  lda #$00                       ; $F49A  A9 00
  sta APU_SND_CHN                ; $F49C  8D 15 40
  sta _var_00f3_indexed          ; $F49F  85 F3
  sta _var_00f2_indexed          ; $F4A1  85 F2
  ldx #$24                       ; $F4A3  A2 24

_label_f4a5:
  sta a:_var_0610_indexed,X      ; $F4A5  9D 10 06
  dex                            ; $F4A8  CA
  bpl _label_f4a5                ; $F4A9  10 FA
  lda #$80                       ; $F4AB  A9 80
  ldx #$0D                       ; $F4AD  A2 0D

_label_f4af:
  sta a:_var_0635_indexed,X      ; $F4AF  9D 35 06
  dex                            ; $F4B2  CA
  bpl _label_f4af                ; $F4B3  10 FA
  rts                            ; $F4B5  60

_func_f4b6:
  lda _var_00f3_indexed          ; $F4B6  A5 F3
  sta APU_DMC_RAW                ; $F4B8  8D 11 40
  lda _var_00f2_indexed          ; $F4BB  A5 F2
  sta APU_SND_CHN                ; $F4BD  8D 15 40
  ldx #$00                       ; $F4C0  A2 00

_label_f4c2:
  lsr _var_00f1_indexed          ; $F4C2  46 F1
  ldy #$04                       ; $F4C4  A0 04

_label_f4c6:
  lda a:_var_0600_indexed,X      ; $F4C6  BD 00 06
  bcc _label_f4ce                ; $F4C9  90 03
  sta APU_PL1_VOL,X              ; $F4CB  9D 00 40

_label_f4ce:
  inx                            ; $F4CE  E8
  dey                            ; $F4CF  88
  bne _label_f4c6                ; $F4D0  D0 F4
  cpx #$10                       ; $F4D2  E0 10
  bcc _label_f4c2                ; $F4D4  90 EC
  ldx #$0D                       ; $F4D6  A2 0D

_label_f4d8:
  ldy a:_var_0635_indexed,X      ; $F4D8  BC 35 06
  lda a:_var_0610_indexed,Y      ; $F4DB  B9 10 06
  bne _label_f4e5                ; $F4DE  D0 05
  lda #$80                       ; $F4E0  A9 80
  sta a:_var_0635_indexed,X      ; $F4E2  9D 35 06

_label_f4e5:
  dex                            ; $F4E5  CA
  bpl _label_f4d8                ; $F4E6  10 F0
  ldx #$25                       ; $F4E8  A2 25
  lda _var_00f0                  ; $F4EA  A5 F0
  beq _label_f4f0                ; $F4EC  F0 02
  ldx #$01                       ; $F4EE  A2 01

_label_f4f0:
  stx _var_00fa_indexed          ; $F4F0  86 FA
  ldx #$00                       ; $F4F2  A2 00
  stx _var_00f2_indexed          ; $F4F4  86 F2
  stx _var_00f5_indexed          ; $F4F6  86 F5
  stx _var_00fc                  ; $F4F8  86 FC

_label_f4fa:
  jsr _func_f51d                 ; $F4FA  20 1D F5
  inc _var_00fc                  ; $F4FD  E6 FC
  ldx _var_00fc                  ; $F4FF  A6 FC
  cpx _var_00fa_indexed          ; $F501  E4 FA
  bne _label_f4fa                ; $F503  D0 F5
  lda _var_00f2_indexed          ; $F505  A5 F2
  and #$0C                       ; $F507  29 0C
  bne _label_f516                ; $F509  D0 0B
  lda _var_00f3_indexed          ; $F50B  A5 F3
  sec                            ; $F50D  38
  sbc #$08                       ; $F50E  E9 08
  bcs _label_f514                ; $F510  B0 02
  lda #$00                       ; $F512  A9 00

_label_f514:
  sta _var_00f3_indexed          ; $F514  85 F3

_label_f516:
  lda _var_00f2_indexed          ; $F516  A5 F2
  eor _var_00f5_indexed          ; $F518  45 F5
  sta _var_00f2_indexed          ; $F51A  85 F2

_label_f51c:
  rts                            ; $F51C  60

_func_f51d:
  ldy a:_var_0610_indexed,X      ; $F51D  BC 10 06
  beq _label_f51c                ; $F520  F0 FA
  lda a:_data_f76b_indexed,X     ; $F522  BD 6B F7
  dey                            ; $F525  88
  beq _label_f530                ; $F526  F0 08
  tax                            ; $F528  AA
  dec a:_var_066d_indexed,X      ; $F529  DE 6D 06
  bne _label_f57c                ; $F52C  D0 4E
  beq _label_f55c                ; $F52E  F0 2C

_label_f530:
  inc a:_var_0610_indexed,X      ; $F530  FE 10 06
  tax                            ; $F533  AA
  lda a:_var_0635_indexed,X      ; $F534  BD 35 06
  bmi _label_f54d                ; $F537  30 14
  tay                            ; $F539  A8
  cmp _var_00fc                  ; $F53A  C5 FC
  beq _label_f54d                ; $F53C  F0 0F
  bcs _label_f548                ; $F53E  B0 08
  lda #$00                       ; $F540  A9 00
  ldx _var_00fc                  ; $F542  A6 FC
  sta a:_var_0610_indexed,X      ; $F544  9D 10 06
  rts                            ; $F547  60

_label_f548:
  lda #$00                       ; $F548  A9 00
  sta a:_var_0610_indexed,Y      ; $F54A  99 10 06

_label_f54d:
  lda _var_00fc                  ; $F54D  A5 FC
  sta a:_var_0635_indexed,X      ; $F54F  9D 35 06
  lda #$01                       ; $F552  A9 01
  sta a:_var_0643_indexed,X      ; $F554  9D 43 06
  lda #$00                       ; $F557  A9 00
  sta a:_var_067b_indexed,X      ; $F559  9D 7B 06

_label_f55c:
  jsr _func_f6fb                 ; $F55C  20 FB F6
  lda #$78                       ; $F55F  A9 78
  sta _var_00f4_indexed          ; $F561  85 F4

_label_f563:
  jsr _func_f718                 ; $F563  20 18 F7
  bmi _label_f5af                ; $F566  30 47
  cmp #$60                       ; $F568  C9 60
  beq _label_f589                ; $F56A  F0 1D
  bcs _label_f5d5                ; $F56C  B0 67
  pha                            ; $F56E  48
  jsr _func_f582                 ; $F56F  20 82 F5
  pla                            ; $F572  68
  bcs _label_f57b                ; $F573  B0 06
  jsr _func_f685                 ; $F575  20 85 F6
  jsr _func_f6ca                 ; $F578  20 CA F6

_label_f57b:
  rts                            ; $F57B  60

_label_f57c:
  jsr _func_f6fb                 ; $F57C  20 FB F6
  jmp _label_f596                ; $F57F  4C 96 F5

_func_f582:
  lda #$7F                       ; $F582  A9 7F
  and a:_var_065f_indexed,X      ; $F584  3D 5F 06
  bpl _label_f58e                ; $F587  10 05

_label_f589:
  lda #$80                       ; $F589  A9 80
  ora a:_var_065f_indexed,X      ; $F58B  1D 5F 06

_label_f58e:
  sta a:_var_065f_indexed,X      ; $F58E  9D 5F 06
  and #$7F                       ; $F591  29 7F
  sta a:_var_066d_indexed,X      ; $F593  9D 6D 06

_label_f596:
  lda _var_00fb_indexed          ; $F596  A5 FB
  bit _var_00f2_indexed          ; $F598  24 F2
  bne _label_f5ad                ; $F59A  D0 11
  ora _var_00f2_indexed          ; $F59C  05 F2
  sta _var_00f2_indexed          ; $F59E  85 F2
  ldy a:_var_065f_indexed,X      ; $F5A0  BC 5F 06
  bpl _label_f5ab                ; $F5A3  10 06
  lda _var_00fb_indexed          ; $F5A5  A5 FB
  ora _var_00f5_indexed          ; $F5A7  05 F5
  sta _var_00f5_indexed          ; $F5A9  85 F5

_label_f5ab:
  clc                            ; $F5AB  18
  rts                            ; $F5AC  60

_label_f5ad:
  sec                            ; $F5AD  38
  rts                            ; $F5AE  60

_label_f5af:
  and #$7F                       ; $F5AF  29 7F
  sta a:_var_065f_indexed,X      ; $F5B1  9D 5F 06
  jmp _label_f563                ; $F5B4  4C 63 F5

_label_f5b7:
  ldy _var_00fb_indexed          ; $F5B7  A4 FB
  cpy #$04                       ; $F5B9  C0 04
  bcs _label_f5cc                ; $F5BB  B0 0F
  sta _var_00fd                  ; $F5BD  85 FD
  lda a:_var_0651_indexed,X      ; $F5BF  BD 51 06
  and #$F0                       ; $F5C2  29 F0
  ora _var_00fd                  ; $F5C4  05 FD
  sta a:_var_0651_indexed,X      ; $F5C6  9D 51 06

_label_f5c9:
  jmp _label_f563                ; $F5C9  4C 63 F5

_label_f5cc:
  eor #$0F                       ; $F5CC  49 0F
  asl a                          ; $F5CE  0A
  asl a                          ; $F5CF  0A
  asl a                          ; $F5D0  0A
  sta _var_00f3_indexed          ; $F5D1  85 F3
  bpl _label_f5c9                ; $F5D3  10 F4

_label_f5d5:
  cmp #$70                       ; $F5D5  C9 70
  and #$0F                       ; $F5D7  29 0F
  bcs _label_f5b7                ; $F5D9  B0 DC
  jsr _jump_engine_f5e1          ; $F5DB  20 E1 F5
  jmp _label_f563                ; $F5DE  4C 63 F5

_jump_engine_f5e1:               ; jump engine detected
  asl a                          ; $F5E1  0A
  tay                            ; $F5E2  A8
  lda a:_data_f5ed_indexed+1,Y   ; $F5E3  B9 EE F5
  sta _var_00fd                  ; $F5E6  85 FD
  lda a:_data_f5ed_indexed+2,Y   ; $F5E8  B9 EF F5
  sta $FE                        ; $F5EB  85 FE

_data_f5ed_indexed:
  jmp (_var_00fd)                ; $F5ED  6C FD 00

.byte $04, $f6, $15, $f6, $1c, $f6, $22, $f6, $2c, $f6, $36, $f6, $3d, $f6, $46, $f6 ; $F5F0
.byte $66, $f6, $77, $f6         ; $F600

  lda #$00                       ; $F604  A9 00
  ldy _var_00fc                  ; $F606  A4 FC
  sta a:_var_0610_indexed,Y      ; $F608  99 10 06
  lda #$80                       ; $F60B  A9 80
  sta a:_var_0635_indexed,X      ; $F60D  9D 35 06
  pla                            ; $F610  68
  pla                            ; $F611  68
  jmp _label_f589                ; $F612  4C 89 F5
  jsr _func_f718                 ; $F615  20 18 F7
  sta a:_var_0651_indexed,X      ; $F618  9D 51 06
  rts                            ; $F61B  60
  jsr _func_f718                 ; $F61C  20 18 F7
  sta _var_00f4_indexed          ; $F61F  85 F4
  rts                            ; $F621  60

.byte $20, $18, $f7, $a8, $a9, $01, $99, $10, $06, $60 ; $F622

  jsr _func_f718                 ; $F62C  20 18 F7
  tay                            ; $F62F  A8
  lda #$00                       ; $F630  A9 00
  sta a:_var_0689_indexed,Y      ; $F632  99 89 06
  rts                            ; $F635  60
  jsr _func_f64d                 ; $F636  20 4D F6
  bne _label_f646                ; $F639  D0 0B
  beq _label_f642                ; $F63B  F0 05
  jsr _func_f64d                 ; $F63D  20 4D F6
  beq _label_f646                ; $F640  F0 04

_label_f642:
  inc a:_var_0643_indexed,X      ; $F642  FE 43 06
  rts                            ; $F645  60

_label_f646:
  jsr _func_f718                 ; $F646  20 18 F7
  sta a:_var_0643_indexed,X      ; $F649  9D 43 06
  rts                            ; $F64C  60

_func_f64d:
  jsr _func_f718                 ; $F64D  20 18 F7
  pha                            ; $F650  48
  and #$0F                       ; $F651  29 0F
  tay                            ; $F653  A8
  lda a:_var_0689_indexed,Y      ; $F654  B9 89 06
  clc                            ; $F657  18
  adc #$01                       ; $F658  69 01
  sta a:_var_0689_indexed,Y      ; $F65A  99 89 06
  pla                            ; $F65D  68
  lsr a                          ; $F65E  4A
  lsr a                          ; $F65F  4A
  lsr a                          ; $F660  4A
  lsr a                          ; $F661  4A
  cmp a:_var_0689_indexed,Y      ; $F662  D9 89 06
  rts                            ; $F665  60
  jsr _func_f718                 ; $F666  20 18 F7
  ora #$01                       ; $F669  09 01
  sta a:_var_067b_indexed,X      ; $F66B  9D 7B 06
  lda a:_var_0651_indexed,X      ; $F66E  BD 51 06
  and #$DF                       ; $F671  29 DF
  sta a:_var_0651_indexed,X      ; $F673  9D 51 06
  rts                            ; $F676  60

.byte $a9, $00, $9d, $7b, $06, $bd, $51, $06, $09, $20, $9d, $51, $06, $60 ; $F677

_func_f685:
  sta _var_00fd                  ; $F685  85 FD
  ldy _var_00fb_indexed          ; $F687  A4 FB
  cpy #$08                       ; $F689  C0 08
  beq _label_f6ab                ; $F68B  F0 1E
  and #$78                       ; $F68D  29 78
  lsr a                          ; $F68F  4A
  lsr a                          ; $F690  4A
  tay                            ; $F691  A8
  lda a:_data_f6b2_indexed,Y     ; $F692  B9 B2 F6
  sta _var_00f8_indexed          ; $F695  85 F8
  lda a:_data_f6b3_indexed,Y     ; $F697  B9 B3 F6
  sta _var_00f9_indexed          ; $F69A  85 F9
  lda _var_00fd                  ; $F69C  A5 FD
  and #$07                       ; $F69E  29 07
  tay                            ; $F6A0  A8
  bpl _label_f6a7                ; $F6A1  10 04

_label_f6a3:
  lsr _var_00f8_indexed          ; $F6A3  46 F8
  ror _var_00f9_indexed          ; $F6A5  66 F9

_label_f6a7:
  dey                            ; $F6A7  88
  bpl _label_f6a3                ; $F6A8  10 F9
  rts                            ; $F6AA  60

_label_f6ab:
  sta _var_00f9_indexed          ; $F6AB  85 F9
  lda #$00                       ; $F6AD  A9 00
  sta _var_00f8_indexed          ; $F6AF  85 F8
  rts                            ; $F6B1  60

_data_f6b2_indexed:
.byte $07                        ; $F6B2

_data_f6b3_indexed:
.byte $f2, $07, $80, $07, $14, $06, $ae, $06, $43, $05, $f4, $05, $9e, $05, $4e, $05 ; $F6B3
.byte $02, $04, $ba, $04, $76, $04, $36 ; $F6C3

_func_f6ca:
  ldy #$00                       ; $F6CA  A0 00
  lda (_var_00f6_indexed),Y      ; $F6CC  B1 F6
  and #$03                       ; $F6CE  29 03
  asl a                          ; $F6D0  0A
  asl a                          ; $F6D1  0A
  tay                            ; $F6D2  A8
  lda a:_var_0651_indexed,X      ; $F6D3  BD 51 06
  sta a:_var_0600_indexed,Y      ; $F6D6  99 00 06
  lda _var_00f4_indexed          ; $F6D9  A5 F4
  sta a:_var_0601_indexed,Y      ; $F6DB  99 01 06
  lda _var_00f9_indexed          ; $F6DE  A5 F9
  sta a:_var_0602_indexed,Y      ; $F6E0  99 02 06
  lda a:_var_067b_indexed,X      ; $F6E3  BD 7B 06
  bit a:_data_f714_indexed       ; $F6E6  2C 14 F7
  bne _label_f6ed                ; $F6E9  D0 02
  lda #$08                       ; $F6EB  A9 08

_label_f6ed:
  and #$F8                       ; $F6ED  29 F8
  ora _var_00f8_indexed          ; $F6EF  05 F8
  sta a:_var_0603_indexed,Y      ; $F6F1  99 03 06
  lda _var_00fb_indexed          ; $F6F4  A5 FB
  ora _var_00f1_indexed          ; $F6F6  05 F1
  sta _var_00f1_indexed          ; $F6F8  85 F1
  rts                            ; $F6FA  60

_func_f6fb:
  lda _var_00fc                  ; $F6FB  A5 FC
  asl a                          ; $F6FD  0A
  tay                            ; $F6FE  A8
  lda a:_data_f721_indexed,Y     ; $F6FF  B9 21 F7
  sta _var_00f6_indexed          ; $F702  85 F6
  lda a:_data_f722_indexed,Y     ; $F704  B9 22 F7
  sta _var_00f7_indexed          ; $F707  85 F7
  ldy #$00                       ; $F709  A0 00
  lda (_var_00f6_indexed),Y      ; $F70B  B1 F6
  tay                            ; $F70D  A8
  lda a:_data_f714_indexed,Y     ; $F70E  B9 14 F7
  sta _var_00fb_indexed          ; $F711  85 FB
  rts                            ; $F713  60

_data_f714_indexed:
.byte $01, $02, $04, $08         ; $F714

_func_f718:
  ldy a:_var_0643_indexed,X      ; $F718  BC 43 06
  inc a:_var_0643_indexed,X      ; $F71B  FE 43 06
  lda (_var_00f6_indexed),Y      ; $F71E  B1 F6
  rts                            ; $F720  60

_data_f721_indexed:
.byte $90                        ; $F721

_data_f722_indexed:
.byte $f7, $a6, $f7, $af, $f7, $bf, $f7, $da, $f7, $ed, $f7, $10, $f8, $24, $f8, $31 ; $F722
.byte $f8, $3e, $f8, $69, $f8, $83, $f8, $93, $f8, $9e, $f8, $e2, $f8, $f4, $f8, $fe ; $F732
.byte $f8, $08, $f9, $14, $f9, $27, $f9, $3a, $f9, $4d, $f9, $86, $f9, $bc, $f9, $f0 ; $F742
.byte $f9, $10, $fa, $b9, $fa, $38, $fb, $4f, $fb, $66, $fb, $7f, $fb, $90, $fb, $05 ; $F752
.byte $fc, $3a, $fc, $b7, $fc, $3f, $fd, $dc, $fd ; $F762

_data_f76b_indexed:
.byte $0a, $0a, $0b, $0a, $0b, $0c, $0d, $02, $03, $04, $05, $06, $07, $08, $09, $0a ; $F76B
.byte $0a, $0a, $0a, $0b, $0c, $0a, $0b, $0c, $0d, $00, $01, $0a, $0b, $0c, $0d, $00 ; $F77B
.byte $01, $0a, $0b, $0c, $0d, $02, $69, $08, $62, $05, $81, $42, $43, $44, $03, $04 ; $F78B
.byte $05, $23, $24, $25, $43, $44, $45, $04, $05, $06, $61, $03, $69, $38, $62, $00 ; $F79B
.byte $84, $05, $68, $05, $02, $69, $08, $62, $07, $81, $1d, $1e, $1c, $54, $55, $53 ; $F7AB
.byte $0d, $0e, $0c, $61, $00, $69, $08, $62, $03, $95, $1b, $87, $52, $52, $52, $95 ; $F7BB
.byte $1b, $53, $87, $43, $3b, $43, $53, $3b, $1b, $0c, $0c, $0c, $95, $1c, $61, $01 ; $F7CB
.byte $69, $08, $62, $43, $95, $3b, $3b, $3b, $3b, $1b, $1b, $87, $1b, $1b, $1b, $95 ; $F7DB
.byte $1b, $61, $02, $69, $08, $62, $1d, $8e, $1b, $87, $1c, $8e, $13, $87, $14, $8e ; $F7EB
.byte $03, $87, $04, $8e, $52, $87, $53, $95, $5a, $0b, $62, $13, $87, $52, $52, $42 ; $F7FB
.byte $62, $1d, $95, $3a, $61, $03, $69, $38, $62, $00, $65, $00, $87, $02, $04, $02 ; $F80B
.byte $66, $60, $07, $04, $04, $04, $95, $03, $61, $00, $69, $08, $62, $41, $8a, $60 ; $F81B
.byte $60, $60, $53, $53, $1c, $61, $01, $69, $08, $62, $41, $8a, $60, $60, $60, $3b ; $F82B
.byte $3b, $04, $61, $02, $69, $08, $62, $03, $81, $1a, $1c, $1e, $22, $24, $26, $2a ; $F83B
.byte $2c, $2e, $32, $34, $36, $3a, $3c, $3e, $42, $44, $46, $4a, $4c, $4e, $52, $54 ; $F84B
.byte $56, $5a, $5c, $5e, $03, $05, $07, $62, $18, $8a, $1c, $1c, $45, $61, $03, $69 ; $F85B
.byte $18, $62, $00, $82, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b ; $F86B
.byte $0c, $0d, $0e, $8a, $60, $60, $60, $61, $01, $69, $00, $62, $00, $82, $1c, $2c ; $F87B
.byte $3c, $4c, $5c, $62, $03, $87, $0d, $61, $03, $69, $28, $62, $00, $83, $00, $02 ; $F88B
.byte $01, $68, $05, $01, $69, $40, $62, $7f, $8f, $63, $d4, $07, $63, $d4, $56, $63 ; $F89B
.byte $d4, $2e, $63, $d4, $06, $63, $d4, $55, $63, $d4, $2d, $63, $d4, $05, $63, $d4 ; $F8AB
.byte $54, $63, $d4, $2c, $63, $d4, $04, $63, $d4, $53, $63, $d4, $2b, $63, $d4, $03 ; $F8BB
.byte $63, $d4, $52, $63, $d4, $2a, $63, $d4, $02, $63, $d4, $51, $63, $d4, $29, $63 ; $F8CB
.byte $d4, $01, $69, $50, $e4, $60, $61, $01, $69, $00, $62, $00, $81, $2a, $52, $32 ; $F8DB
.byte $5a, $3a, $03, $42, $0b, $52, $13, $5a, $61, $01, $69, $08, $62, $42, $8e, $63 ; $F8EB
.byte $c4, $2b, $61, $01, $69, $08, $62, $42, $8e, $63, $cc, $1b, $61, $01, $69, $28 ; $F8FB
.byte $62, $42, $8b, $1a, $69, $18, $83, $52, $61, $00, $69, $08, $62, $43, $8c, $1c ; $F90B
.byte $86, $1c, $1c, $24, $1c, $0c, $24, $62, $4f, $b0, $1c, $61, $01, $69, $08, $62 ; $F91B
.byte $43, $8c, $1b, $86, $1b, $1b, $23, $1b, $0b, $23, $62, $4f, $b0, $1b, $61, $02 ; $F92B
.byte $69, $08, $62, $13, $8c, $54, $86, $54, $54, $5c, $54, $44, $5c, $62, $7f, $b0 ; $F93B
.byte $54, $61, $00, $69, $08, $62, $43, $89, $5b, $0c, $53, $5b, $53, $43, $2b, $3b ; $F94B
.byte $43, $62, $4b, $92, $2b, $62, $40, $83, $53, $04, $14, $62, $43, $92, $1c, $89 ; $F95B
.byte $1c, $14, $04, $53, $92, $04, $89, $14, $92, $1c, $89, $2c, $89, $44, $04, $44 ; $F96B
.byte $54, $3c, $1c, $53, $1c, $14, $62, $7f, $9b, $1c, $61, $01, $69, $08, $62, $43 ; $F97B
.byte $89, $43, $53, $33, $43, $33, $2b, $13, $1b, $2b, $62, $4b, $9b, $13, $62, $43 ; $F98B
.byte $92, $3b, $89, $53, $92, $2b, $89, $53, $92, $1b, $89, $53, $92, $13, $89, $53 ; $F99B
.byte $92, $03, $89, $1b, $92, $52, $89, $1b, $92, $42, $89, $1b, $62, $48, $9b, $3a ; $F9AB
.byte $61, $02, $69, $08, $62, $26, $89, $1d, $1d, $1d, $1d, $1d, $1d, $54, $54, $54 ; $F9BB
.byte $9b, $54, $62, $1d, $92, $1b, $89, $1c, $92, $13, $89, $14, $92, $03, $89, $04 ; $F9CB
.byte $92, $52, $89, $53, $92, $42, $89, $43, $92, $3a, $89, $3b, $92, $2a, $89, $2b ; $F9DB
.byte $62, $71, $9b, $1a, $61, $03, $69, $38, $62, $00, $65, $00, $89, $02, $04, $02 ; $F9EB
.byte $66, $30, $07, $9b, $02, $65, $01, $92, $05, $89, $02, $66, $61, $12, $89, $02 ; $F9FB
.byte $02, $02, $9b, $03, $61, $00, $69, $08, $65, $00, $62, $47, $ad, $1b, $62, $40 ; $FA0B
.byte $83, $52, $03, $13, $66, $20, $05, $65, $01, $92, $1b, $83, $52, $03, $13, $66 ; $FA1B
.byte $21, $14, $62, $43, $9b, $1b, $62, $41, $89, $52, $03, $13, $65, $0b, $65, $02 ; $FA2B
.byte $92, $1b, $89, $1b, $13, $03, $52, $92, $03, $89, $13, $92, $1b, $89, $2b, $67 ; $FA3B
.byte $22, $4b, $92, $43, $89, $43, $3b, $2b, $1b, $3b, $43, $53, $9b, $2b, $68, $2b ; $FA4B
.byte $62, $41, $89, $43, $2b, $43, $53, $3b, $1b, $52, $1b, $13, $62, $43, $9b, $1b ; $FA5B
.byte $67, $3b, $90, $65, $07, $65, $08, $62, $43, $89, $2b, $0b, $0b, $92, $2b, $89 ; $FA6B
.byte $43, $67, $27, $79, $3b, $43, $53, $9b, $2b, $67, $28, $81, $68, $62, $92, $3b ; $FA7B
.byte $89, $1b, $9b, $53, $68, $62, $92, $0c, $89, $0c, $04, $53, $43, $43, $3b, $1b ; $FA8B
.byte $1b, $13, $52, $68, $29, $65, $0c, $62, $41, $89, $1b, $53, $1c, $53, $1c, $53 ; $FA9B
.byte $66, $3c, $92, $0c, $4b, $23, $33, $4b, $14, $62, $40, $68, $27, $61, $02, $69 ; $FAAB
.byte $08, $62, $39, $65, $0f, $ad, $1b, $62, $13, $83, $52, $03, $13, $62, $39, $66 ; $FABB
.byte $2f, $07, $9b, $1b, $52, $b6, $1a, $65, $0e, $65, $06, $62, $1d, $92, $1b, $89 ; $FACB
.byte $1c, $92, $13, $89, $14, $92, $03, $89, $04, $92, $52, $89, $53, $92, $42, $89 ; $FADB
.byte $43, $92, $3a, $89, $3b, $92, $2a, $89, $2b, $67, $26, $43, $52, $03, $13, $68 ; $FAEB
.byte $1d, $62, $71, $9b, $1a, $67, $3e, $73, $65, $0a, $62, $13, $89, $0a, $42, $0b ; $FAFB
.byte $2b, $3b, $0b, $1a, $52, $1b, $3b, $53, $1b, $66, $3a, $4c, $62, $1d, $92, $33 ; $FB0B
.byte $89, $33, $62, $71, $9b, $43, $62, $13, $89, $1a, $52, $1b, $52, $2b, $53, $68 ; $FB1B
.byte $1b, $62, $7f, $b6, $1b, $5a, $22, $9b, $4a, $13, $68, $19, $61, $00, $69, $08 ; $FB2B
.byte $62, $43, $89, $5b, $0c, $53, $5b, $53, $43, $2b, $3b, $43, $53, $04, $14, $62 ; $FB3B
.byte $4f, $a4, $1c, $61, $01, $69, $08, $62, $43, $89, $43, $53, $33, $43, $33, $2b ; $FB4B
.byte $13, $1b, $2b, $2b, $2b, $2b, $62, $4f, $a4, $3b, $61, $02, $69, $08, $62, $26 ; $FB5B
.byte $89, $1d, $1d, $1d, $1d, $1d, $1d, $54, $54, $54, $62, $13, $52, $03, $13, $62 ; $FB6B
.byte $7f, $9b, $1a, $61, $03, $69, $38, $62, $00, $65, $00, $89, $02, $04, $02, $66 ; $FB7B
.byte $40, $07, $9b, $02, $61, $00, $69, $08, $62, $40, $65, $03, $8c, $44, $1d, $5c ; $FB8B
.byte $0d, $4c, $5c, $66, $43, $07, $65, $04, $62, $43, $a4, $43, $62, $40, $8c, $5b ; $FB9B
.byte $0c, $1c, $62, $43, $a4, $34, $54, $62, $40, $8c, $44, $34, $2c, $34, $34, $0c ; $FBAB
.byte $62, $4d, $c8, $1c, $66, $24, $13, $65, $05, $62, $43, $a4, $0b, $62, $40, $8c ; $FBBB
.byte $1b, $23, $33, $62, $43, $a4, $43, $1c, $62, $40, $8c, $0c, $5b, $53, $43, $53 ; $FBCB
.byte $33, $62, $4d, $c8, $23, $66, $25, $34, $65, $06, $62, $40, $8c, $1c, $2c, $34 ; $FBDB
.byte $44, $54, $0d, $2d, $1d, $0d, $05, $0d, $44, $34, $2c, $1c, $2c, $34, $44, $34 ; $FBEB
.byte $2c, $1c, $2c, $04, $0c, $66, $26, $55, $68, $11, $02, $69, $08, $62, $0a, $65 ; $FBFB
.byte $00, $8c, $43, $1c, $5b, $0c, $4b, $5b, $66, $c0, $07, $65, $01, $5b, $44, $24 ; $FC0B
.byte $34, $14, $24, $66, $81, $13, $65, $02, $1b, $53, $33, $43, $23, $33, $66, $82 ; $FC1B
.byte $1e, $65, $07, $8c, $43, $1c, $5b, $0c, $4b, $5b, $66, $87, $29, $68, $11, $00 ; $FC2B
.byte $69, $08, $62, $49, $65, $02, $65, $00, $9b, $2c, $62, $42, $89, $53, $4b, $53 ; $FC3B
.byte $62, $49, $66, $20, $09, $92, $2c, $62, $42, $89, $2c, $62, $49, $ad, $54, $62 ; $FC4B
.byte $42, $89, $2c, $14, $04, $53, $62, $4f, $c8, $54, $62, $43, $89, $44, $92, $2c ; $FC5B
.byte $89, $1c, $62, $4f, $ec, $2c, $62, $49, $66, $22, $07, $9b, $2b, $62, $43, $89 ; $FC6B
.byte $1b, $2b, $1b, $62, $4f, $b6, $0b, $62, $49, $9b, $1b, $62, $43, $89, $0b, $1b ; $FC7B
.byte $0b, $62, $4f, $b6, $5a, $62, $43, $92, $1b, $89, $1b, $62, $4f, $a4, $43, $62 ; $FC8B
.byte $43, $89, $1b, $1b, $1b, $03, $1b, $62, $43, $92, $2b, $89, $2b, $62, $4f, $9b ; $FC9B
.byte $53, $62, $43, $89, $53, $04, $0c, $04, $0c, $1c, $68, $03, $01, $69, $08, $62 ; $FCAB
.byte $4b, $65, $03, $ad, $2b, $62, $43, $89, $2b, $62, $4b, $9b, $2b, $62, $44, $89 ; $FCBB
.byte $13, $03, $52, $62, $4b, $9b, $52, $62, $44, $89, $52, $1b, $2b, $62, $4b, $b6 ; $FCCB
.byte $53, $62, $43, $9b, $0b, $0b, $1b, $1b, $62, $40, $89, $13, $13, $13, $62, $43 ; $FCDB
.byte $9b, $12, $62, $40, $89, $13, $13, $13, $62, $43, $9b, $12, $62, $4b, $66, $23 ; $FCEB
.byte $07, $62, $48, $9b, $0b, $62, $42, $89, $0b, $0b, $0b, $62, $4b, $b6, $52, $62 ; $FCFB
.byte $48, $9b, $5a, $62, $42, $89, $5a, $5a, $5a, $62, $4b, $b6, $42, $62, $43, $92 ; $FD0B
.byte $42, $89, $42, $62, $4f, $a4, $1b, $62, $42, $89, $42, $42, $42, $42, $42, $62 ; $FD1B
.byte $43, $92, $52, $89, $52, $62, $4f, $9b, $2b, $62, $42, $89, $0b, $0b, $0b, $1b ; $FD2B
.byte $1b, $1b, $68, $03, $02, $69, $08, $62, $1d, $65, $04, $92, $52, $89, $52, $62 ; $FD3B
.byte $0a, $53, $2b, $53, $62, $1d, $92, $4a, $89, $4a, $62, $0a, $4b, $2b, $4b, $62 ; $FD4B
.byte $1d, $92, $42, $89, $42, $62, $0a, $43, $2b, $43, $62, $1d, $92, $3a, $89, $3a ; $FD5B
.byte $62, $0a, $3b, $2b, $3b, $62, $1d, $92, $32, $89, $32, $62, $0a, $32, $52, $0b ; $FD6B
.byte $62, $1d, $92, $5a, $89, $5a, $62, $0a, $5a, $1b, $33, $62, $39, $9b, $52, $62 ; $FD7B
.byte $0a, $89, $52, $2b, $1b, $53, $53, $53, $62, $4b, $9b, $52, $62, $1d, $66, $24 ; $FD8B
.byte $07, $62, $13, $89, $32, $0b, $33, $2a, $0b, $2b, $1a, $52, $1b, $0a, $42, $0b ; $FD9B
.byte $22, $5a, $23, $1a, $5a, $1b, $0a, $42, $0b, $59, $32, $5a, $62, $1d, $92, $03 ; $FDAB
.byte $89, $03, $62, $39, $a4, $03, $62, $13, $89, $03, $02, $03, $02, $03, $62, $1d ; $FDBB
.byte $92, $12, $89, $12, $9b, $13, $62, $13, $89, $32, $33, $32, $2a, $2b, $2a, $68 ; $FDCB
.byte $03, $03, $69, $48, $62, $00, $89, $01, $02, $01, $04, $0a, $04, $68, $03, $ff ; $FDDB
.byte $ff                        ; $FDEB

_func_fdec:
  tsx                            ; $FDEC  BA
  jsr _func_fe6e                 ; $FDED  20 6E FE
  bne _label_fe18                ; $FDF0  D0 26
  lda #$00                       ; $FDF2  A9 00
  sta PPU_CTRL                   ; $FDF4  8D 00 20
  jsr _func_ff52                 ; $FDF7  20 52 FF
  jsr _func_ff52                 ; $FDFA  20 52 FF
  tsx                            ; $FDFD  BA
  lda #$05                       ; $FDFE  A9 05
  jsr _func_ff5d                 ; $FE00  20 5D FF
  jsr _func_fe1c                 ; $FE03  20 1C FE
  jsr _func_feae                 ; $FE06  20 AE FE
  bne _label_fe19                ; $FE09  D0 0E
  lda #$2A                       ; $FE0B  A9 2A
  jsr _func_ff5d                 ; $FE0D  20 5D FF
  jsr _func_fe1c                 ; $FE10  20 1C FE
  jsr _func_ff0e                 ; $FE13  20 0E FF
  bne _label_fe19                ; $FE16  D0 01

_label_fe18:
  rts                            ; $FE18  60

_label_fe19:
  jmp ($FFFC)                    ; $FE19  6C FC FF  jump engine detected

_func_fe1c:
  lda #$00                       ; $FE1C  A9 00
  sta a:_var_00f7_indexed,X      ; $FE1E  9D F7 00
  sta a:_var_00f8_indexed,X      ; $FE21  9D F8 00
  sta a:_var_00f9_indexed,X      ; $FE24  9D F9 00
  sta a:_var_00f3_indexed,X      ; $FE27  9D F3 00
  sta a:_var_00f2_indexed,X      ; $FE2A  9D F2 00
  rts                            ; $FE2D  60

_func_fe2e:
  clc                            ; $FE2E  18
  adc a:_var_00f7_indexed,X      ; $FE2F  7D F7 00
  sta a:_var_00f7_indexed,X      ; $FE32  9D F7 00
  lda #$00                       ; $FE35  A9 00
  adc a:_var_00f8_indexed,X      ; $FE37  7D F8 00
  sta a:_var_00f8_indexed,X      ; $FE3A  9D F8 00
  lda #$00                       ; $FE3D  A9 00
  adc a:_var_00f9_indexed,X      ; $FE3F  7D F9 00
  sta a:_var_00f9_indexed,X      ; $FE42  9D F9 00
  rts                            ; $FE45  60

_func_fe46:
  sta a:_data_8000               ; $FE46  8D 00 80
  lda a:_var_00fa_indexed,X      ; $FE49  BD FA 00
  sta a:_data_8000+1             ; $FE4C  8D 01 80
  rts                            ; $FE4F  60

_func_fe50:
  inc a:_var_00fa_indexed,X      ; $FE50  FE FA 00
  cmp a:_var_00fa_indexed,X      ; $FE53  DD FA 00
  rts                            ; $FE56  60

_label_fe57:
  lda a:_data_fff4_indexed,Y     ; $FE57  B9 F4 FF
  eor a:_var_00f9_indexed,X      ; $FE5A  5D F9 00
  bne _label_fe6d                ; $FE5D  D0 0E
  lda a:_data_fff5_indexed,Y     ; $FE5F  B9 F5 FF
  eor a:_var_00f8_indexed,X      ; $FE62  5D F8 00
  bne _label_fe6d                ; $FE65  D0 06
  lda a:_data_fff6_indexed,Y     ; $FE67  B9 F6 FF
  eor a:_var_00f7_indexed,X      ; $FE6A  5D F7 00

_label_fe6d:
  rts                            ; $FE6D  60

_func_fe6e:
  lda #$00                       ; $FE6E  A9 00
  sta a:_var_00fa_indexed,X      ; $FE70  9D FA 00

_label_fe73:
  ldy a:_var_00fa_indexed,X      ; $FE73  BC FA 00
  lda a:_data_ff80_indexed,Y     ; $FE76  B9 80 FF
  sta a:_var_00fb_indexed,X      ; $FE79  9D FB 00
  ldy #$0C                       ; $FE7C  A0 0C

_label_fe7e:
  rol a:_var_00fb_indexed,X      ; $FE7E  3E FB 00
  rol a                          ; $FE81  2A
  and #$01                       ; $FE82  29 01
  sta a:_var_00f7_indexed,X      ; $FE84  9D F7 00
  lda JOYPAD2                    ; $FE87  AD 17 40
  and #$0E                       ; $FE8A  29 0E
  ora a:_var_00f7_indexed,X      ; $FE8C  1D F7 00
  sta JOYPAD1                    ; $FE8F  8D 16 40
  and #$08                       ; $FE92  29 08
  cmp #$01                       ; $FE94  C9 01
  dey                            ; $FE96  88
  bne _label_fe7e                ; $FE97  D0 E5
  ldy a:_var_00fa_indexed,X      ; $FE99  BC FA 00
  lda a:_data_ff80_indexed,Y     ; $FE9C  B9 80 FF
  eor #$FF                       ; $FE9F  49 FF
  cmp a:_var_00fb_indexed,X      ; $FEA1  DD FB 00
  bne _label_fead                ; $FEA4  D0 07
  inc a:_var_00fa_indexed,X      ; $FEA6  FE FA 00
  cpy #$1F                       ; $FEA9  C0 1F
  bne _label_fe73                ; $FEAB  D0 C6

_label_fead:
  rts                            ; $FEAD  60

_func_feae:
  lda #$AD                       ; $FEAE  A9 AD
  sta a:_var_00f1_indexed,X      ; $FEB0  9D F1 00
  lda #$4C                       ; $FEB3  A9 4C
  sta a:_var_00f4_indexed,X      ; $FEB5  9D F4 00
  lda a:_data_fee8               ; $FEB8  AD E8 FE
  sta a:_var_00f5_indexed,X      ; $FEBB  9D F5 00
  lda a:_data_fee9               ; $FEBE  AD E9 FE
  sta a:_var_00f6_indexed,X      ; $FEC1  9D F6 00
  lda #$0C                       ; $FEC4  A9 0C
  sta a:_var_00fa_indexed,X      ; $FEC6  9D FA 00

_label_fec9:
  lda #$07                       ; $FEC9  A9 07
  jsr _func_fe46                 ; $FECB  20 46 FE

_label_fece:
  lda a:_var_00fa_indexed,X      ; $FECE  BD FA 00
  cmp #$0F                       ; $FED1  C9 0F
  beq _label_feed                ; $FED3  F0 18
  lda a:_var_00f3_indexed,X      ; $FED5  BD F3 00
  and #$1F                       ; $FED8  29 1F
  ora #$A0                       ; $FEDA  09 A0
  sta a:_var_00f3_indexed,X      ; $FEDC  9D F3 00
  lda #$01                       ; $FEDF  A9 01
  pha                            ; $FEE1  48
  txa                            ; $FEE2  8A
  sec                            ; $FEE3  38
  sbc #$10                       ; $FEE4  E9 10
  pha                            ; $FEE6  48
  rts                            ; $FEE7  60

_data_fee8:
.byte $ea                        ; $FEE8

_data_fee9:
.byte $fe, $20, $2e, $fe         ; $FEE9

_label_feed:
  clc                            ; $FEED  18
  lda #$1F                       ; $FEEE  A9 1F
  adc a:_var_00f2_indexed,X      ; $FEF0  7D F2 00
  sta a:_var_00f2_indexed,X      ; $FEF3  9D F2 00
  bcc _label_fece                ; $FEF6  90 D6
  inc a:_var_00f3_indexed,X      ; $FEF8  FE F3 00
  lda a:_var_00f3_indexed,X      ; $FEFB  BD F3 00
  and #$1F                       ; $FEFE  29 1F
  bne _label_fece                ; $FF00  D0 CC
  lda #$0F                       ; $FF02  A9 0F
  jsr _func_fe50                 ; $FF04  20 50 FE
  bcs _label_fec9                ; $FF07  B0 C0
  ldy #$00                       ; $FF09  A0 00
  jmp _label_fe57                ; $FF0B  4C 57 FE

_func_ff0e:
  lda #$20                       ; $FF0E  A9 20
  sta a:_var_00fa_indexed,X      ; $FF10  9D FA 00

_label_ff13:
  lda #$02                       ; $FF13  A9 02
  jsr _func_fe46                 ; $FF15  20 46 FE

_label_ff18:
  lda a:_var_00f3_indexed,X      ; $FF18  BD F3 00
  and #$03                       ; $FF1B  29 03
  ora #$10                       ; $FF1D  09 10
  sta PPU_ADDR                   ; $FF1F  8D 06 20
  lda a:_var_00f2_indexed,X      ; $FF22  BD F2 00
  sta PPU_ADDR                   ; $FF25  8D 06 20
  lda PPU_DATA                   ; $FF28  AD 07 20
  lda PPU_DATA                   ; $FF2B  AD 07 20
  jsr _func_fe2e                 ; $FF2E  20 2E FE
  clc                            ; $FF31  18
  lda #$1F                       ; $FF32  A9 1F
  adc a:_var_00f2_indexed,X      ; $FF34  7D F2 00
  sta a:_var_00f2_indexed,X      ; $FF37  9D F2 00
  bcc _label_ff18                ; $FF3A  90 DC
  inc a:_var_00f3_indexed,X      ; $FF3C  FE F3 00
  lda a:_var_00f3_indexed,X      ; $FF3F  BD F3 00
  and #$03                       ; $FF42  29 03
  bne _label_ff18                ; $FF44  D0 D2
  lda #$3F                       ; $FF46  A9 3F
  jsr _func_fe50                 ; $FF48  20 50 FE
  bcs _label_ff13                ; $FF4B  B0 C6
  ldy #$03                       ; $FF4D  A0 03
  jmp _label_fe57                ; $FF4F  4C 57 FE

_func_ff52:
  lda #$00                       ; $FF52  A9 00
  sta PPU_MASK                   ; $FF54  8D 01 20

_label_ff57:
  lda PPU_STATUS                 ; $FF57  AD 02 20
  bpl _label_ff57                ; $FF5A  10 FB
  rts                            ; $FF5C  60

_func_ff5d:
  ldy #$3F                       ; $FF5D  A0 3F
  sty PPU_ADDR                   ; $FF5F  8C 06 20
  ldy #$00                       ; $FF62  A0 00
  sty PPU_ADDR                   ; $FF64  8C 06 20
  ldy #$20                       ; $FF67  A0 20

_label_ff69:
  sta PPU_DATA                   ; $FF69  8D 07 20
  dey                            ; $FF6C  88
  bne _label_ff69                ; $FF6D  D0 FA
  ldy #$3F                       ; $FF6F  A0 3F
  sty PPU_ADDR                   ; $FF71  8C 06 20
  ldy #$00                       ; $FF74  A0 00
  sty PPU_ADDR                   ; $FF76  8C 06 20
  sty PPU_ADDR                   ; $FF79  8C 06 20
  sty PPU_ADDR                   ; $FF7C  8C 06 20
  rts                            ; $FF7F  60

_data_ff80_indexed:
.byte $b7, $be, $ad, $aa, $b7, $b6, $ac, $be, $d1, $aa, $bb, $be, $b8, $be, $a8, $be ; $FF80
.byte $df, $d9, $df, $b4, $aa, $b2, $b6, $d1, $b7, $be, $b1, $be, $b0, $b4, $be, $df ; $FF90
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $FFA0
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $FFB0
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $FFC0
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $FFD0
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff ; $FFE0
.byte $ff, $ff, $ff, $ff         ; $FFF0

_data_fff4_indexed:
.byte $01                        ; $FFF4

_data_fff5_indexed:
.byte $68                        ; $FFF5

_data_fff6_indexed:
.byte $8a, $01, $94, $32         ; $FFF6

.org $FFFA

.dw NMI, Reset, Reset

.byte $61, $90, $ff, $ff, $6a, $0a, $6c, $ff, $6e, $ff, $6f, $fc, $71, $ff, $ff, $ff
.byte $ff, $5c, $01, $62, $20, $6c, $54, $ff, $ff, $54, $15, $5e, $bf, $61, $42, $65
.byte $18, $69, $04, $6b, $08, $6d, $01, $6f, $20, $70, $3f, $71, $ff, $73, $80, $76
.byte $ff, $77, $f0, $ff, $ff, $ff, $5c, $96, $61, $55, $ff, $ff, $5d, $60, $5e, $08
.byte $60, $0f, $61, $f3, $62, $ff, $69, $21, $6e, $40, $6f, $04, $70, $0f, $71, $f0
.byte $72, $ff, $73, $fc, $ff, $ff, $ff, $5c, $02, $ff, $ff, $64, $15, $68, $05, $6c
.byte $01, $6d, $12, $6e, $c0, $6f, $08, $70, $ff, $71, $ff, $72, $3f, $73, $fc, $ff
.byte $ff, $ff, $4e, $01, $5e, $55, $6e, $55, $44, $02, $ff, $ff, $49, $04, $4a, $a9
.byte $4d, $0f, $4e, $ff, $4f, $f0, $51, $01, $55, $03, $56, $ff, $57, $f0, $5d, $01
.byte $5e, $55, $72, $03, $73, $fc, $ff, $ff, $ff, $50, $d5, $58, $18, $59, $10, $5a
.byte $10, $60, $55, $6e, $01, $ff, $ff, $46, $11, $48, $02, $49, $ff, $4a, $f0, $4c
.byte $08, $4e, $50, $50, $3f, $51, $ff, $52, $c0, $59, $92, $5c, $3f, $5d, $ff, $6e
.byte $03, $6f, $f0, $70, $ff, $71, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $5a, $35
.byte $5e, $15, $60, $08, $ff, $ff, $4a, $82, $4d, $22, $51, $88, $55, $05, $56, $03
.byte $57, $f0, $5a, $50, $66, $3f, $67, $fc, $6c, $02, $70, $ff, $ff, $ff, $ff, $7c
.byte $80, $ff, $ff, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $57, $08
.byte $64, $d5, $6b, $d5, $ff, $ff, $55, $02, $56, $40, $59, $08, $5a, $10, $5d, $20
.byte $5e, $04, $61, $3f, $62, $fc, $70, $01, $74, $ff, $75, $ff, $76, $ff, $77, $fc
.byte $ff, $ff, $ff, $5e, $55, $61, $95, $6e, $50, $ff, $ff, $51, $ff, $52, $ff, $53
.byte $f0, $61, $10, $65, $04, $69, $01, $6e, $40, $70, $ff, $72, $10, $76, $ff, $77
.byte $fc, $ff, $ff, $ff, $40, $08, $4e, $02, $67, $d4, $ff, $ff, $54, $04, $58, $01
.byte $5b, $80, $5d, $40, $5e, $02, $61, $fc, $62, $ff, $6d, $bf, $6e, $fd, $70, $02
.byte $73, $40, $74, $ff, $77, $fc, $ff, $ff, $59, $10, $5a, $02, $ff, $34, $80, $ff
.byte $ff, $09, $4c, $0d, $10, $11, $04, $15, $01, $1a, $40, $1e, $10, $22, $3f, $35
.byte $c0, $ff, $ff, $ff, $01, $09, $0d, $09, $ff, $ff, $09, $10, $0a, $08, $0d, $3f
.byte $0e, $fc, $21, $ff, $22, $f0, $35, $3f, $36, $fc, $4d, $ff, $4e, $f0, $61, $3f
.byte $62, $fc, $72, $08, $75, $ff, $76, $fc, $ff, $ff, $ff, $00, $25, $1d, $55, $2d
.byte $54, $ff, $ff, $11, $ff, $12, $ff, $13, $c0, $14, $10, $18, $05, $1c, $01, $21
.byte $40, $25, $10, $29, $04, $2d, $ff, $2e, $ff, $2f, $fc, $ff, $ff, $ff, $30, $20
.byte $ff, $ff, $40, $c0, $38, $95, $4d, $55, $5e, $55, $6f, $40, $73, $10, $77, $3c
.byte $ff, $ff, $ff, $62, $02, $ff, $ff, $71, $10, $74, $ff, $75, $ff, $76, $ff, $77
.byte $fc, $ff, $ff, $ff, $10, $55, $11, $40, $18, $04, $16, $02, $20, $55, $26, $40
.byte $27, $10, $30, $54, $37, $04, $47, $d5, $57, $55, $60, $d5, $65, $41, $6e, $d5
.byte $7e, $40, $75, $40, $ff, $0c, $02, $0d, $90, $0e, $09, $0f, $40, $10, $08, $11
.byte $04, $12, $20, $13, $10, $14, $04, $15, $01, $16, $80, $17, $20, $18, $04, $1b
.byte $20, $1c, $04, $1f, $20, $20, $04, $23, $20, $28, $01, $2b, $80, $2d, $55, $2e
.byte $02, $32, $08, $36, $20, $24, $04, $27, $20, $ff, $10, $03, $12, $03, $19, $03
.byte $3a, $c0, $40, $ff, $41, $c0, $4a, $55, $4b, $3c, $58, $09, $5b, $50, $5c, $20
.byte $5d, $40, $60, $3f, $61, $cf, $62, $ff, $63, $f0, $66, $24, $6a, $81, $6d, $02
.byte $6f, $40, $6c, $3f, $6d, $cf, $6e, $c3, $6f, $c0, $ff, $ff, $ff, $4c, $20, $ff
.byte $ff, $44, $30, $4c, $0c, $4f, $f0, $50, $03, $51, $f0, $5d, $0c, $5f, $c0, $6a
.byte $90, $6d, $3f, $6e, $ff, $74, $0c, $77, $c0, $ff, $ff, $ff, $10, $01, $17, $01
.byte $1e, $01, $20, $55, $24, $80, $2e, $55, $30, $50, $34, $04, $3e, $5c, $44, $55
.byte $4e, $55, $54, $55, $5e, $55, $64, $54, $6e, $54, $ff, $ff, $12, $ff, $13, $fc
.byte $1c, $3f, $1d, $fc, $1e, $ff, $1f, $f0, $36, $40, $38, $ff, $3a, $ff, $3b, $f0
.byte $66, $24, $6a, $81, $6d, $ff, $6e, $ff, $6f, $fc, $6c, $ff, $ff, $ff, $ff, $0e
.byte $01, $1e, $55, $2e, $55, $30, $08, $3e, $54, $4e, $55, $5e, $55, $6e, $55, $7e
.byte $40, $ff, $ff, $08, $01, $0c, $03, $0d, $c0, $0f, $f0, $10, $10, $14, $04, $18
.byte $01, $1d, $40, $21, $f0, $23, $f0, $25, $40, $29, $10, $2d, $04, $31, $01, $35
.byte $03, $36, $c0, $37, $f0, $39, $01, $42, $40, $46, $10, $4a, $04, $4e, $0f, $4f
.byte $f0, $54, $c0, $5e, $01, $62, $03, $63, $f0, $71, $01, $73, $80, $75, $03, $76
.byte $ff, $77, $fc, $ff, $ff, $ff, $11, $05, $1d, $05, $21, $d5, $2d, $d5, $30, $14
.byte $31, $40, $37, $20, $3d, $40, $3e, $14, $40, $55, $47, $38, $4e, $55, $50, $55
.byte $54, $15, $57, $35, $5a, $15, $5e, $55, $61, $54, $62, $04, $6c, $04, $6d, $54
.byte $ff, $1c, $08, $1f, $10, $30, $05, $33, $20, $35, $02, $36, $40, $37, $80, $38
.byte $04, $39, $50, $3a, $02, $3b, $20, $42, $08, $59, $48, $5a, $12, $5d, $01, $5e
.byte $80, $69, $02, $6a, $40, $ff, $0d, $2f, $0e, $d0, $10, $02, $11, $f0, $12, $3d
.byte $14, $08, $17, $40, $18, $0c, $1b, $c0, $25, $a0, $26, $14, $28, $02, $29, $20
.byte $2a, $11, $2c, $03, $2d, $80, $2e, $07, $31, $c0, $32, $0c, $39, $03, $40, $04
.byte $43, $80, $44, $08, $45, $3c, $46, $f0, $47, $40, $48, $04, $49, $30, $4a, $30
.byte $4b, $80, $4c, $08, $4f, $40, $50, $05, $53, $80, $55, $3c, $56, $f2, $5d, $60
.byte $5e, $18, $61, $ff, $62, $fc, $6c, $03, $6d, $ff, $6e, $ff, $ff, $ff, $ff, $46
.byte $20, $51, $35, $ff, $ff, $41, $08, $45, $20, $49, $80, $4c, $02, $50, $08, $54
.byte $cd, $60, $3f, $61, $fd, $62, $55, $76, $0f, $77, $fc, $ff, $ff, $ff, $07, $01
.byte $0e, $03, $17, $75, $1e, $55, $25, $05, $26, $14, $27, $50, $2e, $55, $42, $15
.byte $43, $10, $47, $03, $4e, $0d, $50, $80, $52, $40, $57, $54, $5e, $55, $5a, $03
.byte $6a, $55, $6b, $55, $6e, $50, $ff, $ff, $08, $04, $0c, $01, $0e, $03, $0f, $f0
.byte $11, $40, $15, $fc, $16, $fc, $20, $3f, $21, $c0, $24, $54, $30, $0f, $31, $f0
.byte $33, $fc, $35, $02, $39, $0a, $41, $28, $45, $a0, $46, $10, $49, $50, $4a, $14
.byte $4b, $30, $4d, $fc, $4e, $f1, $52, $01, $56, $03, $57, $c0, $5d, $ff, $5e, $f0
.byte $64, $ff, $65, $54, $6b, $fc, $71, $ff, $72, $fc, $ff, $ff, $ff, $64, $08, $ff
.byte $ff, $6f, $80, $72, $02, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff
.byte $00, $05, $0e, $05, $10, $55, $16, $02, $1e, $55, $20, $55, $28, $08, $2e, $55
.byte $30, $54, $3e, $54, $40, $55, $4e, $55, $50, $55, $5e, $55, $60, $55, $66, $0d
.byte $68, $d0, $6d, $10, $6e, $55, $ff, $ff, $08, $3d, $0a, $0f, $0b, $f0, $11, $09
.byte $15, $20, $16, $40, $1a, $10, $1e, $06, $22, $01, $19, $80, $1c, $02, $20, $08
.byte $24, $20, $27, $40, $2b, $10, $28, $10, $2c, $06, $2f, $20, $30, $01, $33, $80
.byte $35, $55, $36, $02, $3a, $08, $42, $20, $46, $80, $49, $0a, $4a, $50, $4d, $08
.byte $4e, $15, $51, $20, $52, $04, $55, $94, $56, $01, $58, $02, $5b, $40, $5c, $08
.byte $5e, $20, $5f, $10, $60, $3f, $61, $ff, $62, $bf, $63, $f0, $68, $3f, $69, $f3
.byte $6a, $ff, $6b, $f0, $70, $ff, $71, $ff, $72, $ff, $73, $fc, $ff, $ff, $ff, $40
.byte $01, $45, $03, $49, $10, $4d, $05, $50, $54, $53, $03, $55, $50, $59, $5d, $5d
.byte $50, $5e, $0d, $62, $0d, $63, $40, $65, $0d, $69, $83, $6b, $34, $6c, $43, $6d
.byte $40, $72, $40, $75, $40, $79, $40, $7c, $40, $ff, $41, $02, $42, $40, $57, $90
.byte $65, $90, $71, $02, $72, $40, $ff, $45, $ff, $46, $c0, $47, $80, $48, $09, $4a
.byte $0f, $4b, $c0, $4c, $3f, $4d, $c0, $4e, $01, $52, $0f, $53, $c0, $55, $01, $58
.byte $10, $59, $0f, $5a, $c3, $5b, $f0, $5c, $fc, $62, $20, $66, $fc, $68, $03, $69
.byte $c0, $6a, $08, $6e, $0f, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $43
.byte $80, $45, $40, $4b, $40, $52, $40, $54, $04, $5e, $10, $66, $08, $ff, $20, $35
.byte $2e, $35, $30, $5c, $3e, $74, $40, $50, $4e, $40, $53, $95, $63, $40, $ff, $09
.byte $02, $0a, $40, $0d, $08, $11, $20, $15, $80, $18, $02, $1b, $40, $1c, $08, $20
.byte $20, $33, $24, $0e, $10, $12, $04, $16, $01, $1f, $10, $23, $04, $ff, $26, $20
.byte $2a, $80, $2d, $02, $31, $08, $35, $20, $37, $f0, $38, $3f, $39, $fc, $41, $02
.byte $45, $08, $47, $3c, $49, $20, $4c, $03, $4d, $f0, $65, $40, $69, $f4, $6d, $0f
.byte $ff, $26, $04, $2a, $01, $2f, $40, $ff, $ff, $0d, $25, $41, $d0, $ff, $ff, $13
.byte $80, $16, $02, $1a, $08, $1e, $20, $22, $80, $25, $02, $29, $08, $2d, $20, $31
.byte $80, $34, $02, $38, $08, $40, $cf, $48, $04, $4c, $01, $51, $40, $55, $10, $59
.byte $04, $5d, $01, $62, $40, $66, $10, $6a, $04, $6e, $01, $72, $03, $73, $f0, $44
.byte $10, $ff, $ff, $ff, $45, $08, $4e, $05, $50, $0d, $5a, $0d, $5e, $54, $62, $03
.byte $68, $03, $6a, $40, $6b, $10, $6e, $03, $72, $40, $75, $10, $76, $10, $78, $40
.byte $7b, $10, $7c, $10, $7e, $40, $ff, $56, $80, $63, $80, $72, $10, $ff, $45, $20
.byte $46, $60, $49, $80, $4a, $ff, $4b, $f0, $4c, $02, $50, $08, $54, $20, $56, $01
.byte $58, $3c, $59, $10, $5a, $f3, $5b, $40, $5d, $04, $5f, $70, $60, $3f, $61, $c8
.byte $65, $24, $66, $0c, $67, $40, $69, $81, $6b, $10, $6c, $03, $6d, $c3, $6f, $30
.byte $76, $3c, $77, $30, $74, $3f, $75, $c3, $ff, $ff, $ff, $10, $d5, $20, $55, $22
.byte $0d, $26, $c0, $28, $15, $2b, $0d, $2e, $50, $30, $54, $38, $50, $3b, $40, $3e
.byte $14, $40, $55, $4e, $55, $50, $55, $5e, $55, $60, $50, $63, $0d, $6e, $54, $73
.byte $40, $58, $80, $ff, $42, $18, $52, $02, $64, $04, $71, $10, $ff, $10, $3f, $11
.byte $40, $15, $fc, $1a, $40, $1d, $20, $1e, $10, $21, $30, $22, $3f, $23, $f0, $24
.byte $02, $25, $0f, $28, $03, $2a, $3c, $2b, $fc, $30, $03, $31, $f2, $35, $08, $37
.byte $f0, $39, $20, $40, $3f, $41, $f0, $46, $cf, $4d, $20, $51, $80, $54, $02, $56
.byte $3f, $58, $0f, $68, $3c, $69, $fc, $6a, $12, $6e, $3f, $6f, $f0, $71, $0b, $72
.byte $c0, $75, $fc, $ff, $60, $04, $6d, $10, $ff, $ff, $10, $55, $20, $54, $14, $76
.byte $1c, $05, $28, $55, $ff, $ff, $0c, $20, $10, $3f, $11, $05, $15, $3f, $1a, $ff
.byte $22, $3f, $23, $fc, $2c, $ff, $2d, $40, $31, $ff, $32, $ff, $33, $fc, $ff, $ff
.byte $ff, $60, $02, $70, $40, $ff, $ff, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff
.byte $ff, $ff, $07, $25, $16, $50, $17, $05, $18, $50, $30, $d4, $3e, $d4, $40, $55
.byte $4e, $55, $50, $55, $5e, $55, $60, $55, $6e, $55, $ff, $0c, $02, $0f, $40, $19
.byte $08, $1a, $10, $1d, $20, $21, $82, $22, $41, $24, $02, $25, $08, $27, $40, $28
.byte $08, $29, $20, $2c, $20, $2d, $80, $30, $02, $33, $40, $34, $08, $37, $14, $38
.byte $20, $40, $10, $43, $08, $47, $20, $4b, $80, $4c, $15, $4d, $54, $4e, $02, $4f
.byte $08, $52, $08, $53, $20, $56, $20, $57, $80, $59, $55, $5a, $82, $5b, $08, $5e
.byte $08, $5f, $20, $62, $20, $63, $80, $65, $01, $66, $82, $71, $60, $72, $06, $1e
.byte $04, $26, $10, $2a, $04, $2b, $10, $2e, $01, $2f, $04, $44, $04, $48, $01, $ff
.byte $10, $03, $11, $f0, $12, $3f, $5d, $03, $69, $c3, $6a, $0c, $75, $c0, $76, $0c
.byte $68, $0f, $ff, $55, $01, $61, $01, $44, $01, $46, $02, $ff, $ff, $03, $03, $07
.byte $08, $13, $54, $1b, $35, $1d, $35, $22, $35, $2d, $55, $3d, $50, $4b, $01, $4c
.byte $04, $4d, $d0, $50, $d4, $61, $03, $6e, $d0, $71, $40, $ff, $13, $20, $1d, $10
.byte $21, $40, $4c, $02, $4d, $20, $6b, $20, $ff, $09, $20, $0d, $fc, $0e, $10, $12
.byte $14, $15, $03, $0e, $c0, $16, $fc, $17, $cc, $20, $40, $24, $f3, $25, $05, $26
.byte $2f, $2a, $80, $2d, $03, $2e, $c0, $30, $54, $36, $40, $39, $34, $3a, $c1, $3b
.byte $08, $40, $0f, $41, $cf, $42, $03, $43, $cc, $46, $0c, $4c, $10, $50, $3f, $51
.byte $c3, $52, $fd, $58, $04, $59, $44, $5a, $44, $5c, $0c, $5d, $cc, $5e, $cc, $60
.byte $7b, $61, $33, $62, $33, $63, $f0, $69, $23, $6a, $23, $6c, $cc, $6d, $fc, $6e
.byte $fc, $6f, $f0, $74, $3f, $75, $ff, $76, $ff, $ff, $1d, $40, $ff, $ff, $13, $55
.byte $11, $80, $1e, $56, $17, $05, $1e, $54, $23, $54, $30, $34, $37, $14, $3c, $80
.byte $40, $55, $42, $05, $47, $50, $4a, $0d, $4c, $01, $50, $55, $52, $54, $5a, $50
.byte $5b, $05, $60, $55, $66, $d5, $6b, $50, $6e, $0d, $70, $40, $7e, $40, $ff, $ff
.byte $0a, $24, $0e, $81, $11, $ff, $12, $ff, $13, $f0, $19, $fc, $1a, $02, $1e, $0f
.byte $1f, $c0, $22, $80, $24, $3c, $25, $02, $29, $08, $2b, $80, $2d, $fc, $2e, $02
.byte $30, $10, $32, $08, $34, $3c, $36, $fc, $48, $03, $49, $ff, $4a, $f0, $50, $03
.byte $51, $55, $53, $fc, $5a, $08, $5c, $31, $5e, $20, $60, $03, $61, $f3, $62, $f0
.byte $6b, $f0, $6d, $20, $71, $81, $74, $3f, $75, $f3, $76, $ff, $77, $f0, $ff, $ff
.byte $ff, $0a, $08, $34, $d0, $6b, $d0, $ff, $57, $08, $5b, $28, $5f, $a0, $ff, $12
.byte $11, $14, $40, $15, $0f, $16, $ff, $18, $50, $1c, $f0, $21, $54, $22, $f0, $26
.byte $02, $28, $55, $29, $ff, $2a, $0a, $2e, $28, $31, $3f, $32, $3c, $36, $c0, $38
.byte $ff, $3b, $08, $41, $05, $42, $60, $43, $bc, $44, $40, $46, $02, $48, $50, $4a
.byte $0f, $4c, $ff, $4e, $fa, $54, $55, $59, $3f, $62, $fc, $65, $55, $75, $ff, $76
.byte $ff, $77, $f0, $ff, $ff, $ff, $07, $08, $11, $05, $1d, $05, $21, $54, $25, $01
.byte $26, $14, $27, $14, $28, $14, $29, $01, $2d, $54, $31, $14, $34, $40, $3a, $40
.byte $3d, $14, $41, $40, $4d, $40, $52, $03, $55, $01, $57, $d5, $59, $01, $5c, $03
.byte $61, $10, $62, $45, $67, $54, $6c, $45, $6d, $10, $ff, $58, $04, $5b, $20, $ff
.byte $0d, $08, $0e, $40, $11, $08, $12, $40, $15, $20, $16, $10, $18, $0e, $19, $80
.byte $1a, $05, $1b, $c0, $1c, $03, $1d, $c0, $1e, $0f, $25, $f0, $26, $3c, $28, $03
.byte $2a, $03, $2c, $3c, $2f, $f0, $34, $0f, $35, $c0, $36, $0f, $37, $c0, $39, $02
.byte $40, $04, $41, $0f, $42, $c0, $43, $80, $44, $34, $47, $b0, $48, $01, $4a, $02
.byte $4d, $40, $4e, $08, $51, $fc, $52, $fc, $5c, $03, $5d, $cc, $5e, $cf, $69, $30
.byte $6a, $30, $70, $0f, $71, $ff, $72, $ff, $73, $c0, $ff, $ff, $ff, $0e, $0d, $10
.byte $15, $1e, $54, $18, $03, $20, $55, $28, $54, $2d, $d5, $30, $54, $3e, $d4, $40
.byte $54, $41, $01, $45, $15, $49, $15, $4d, $01, $4e, $54, $50, $03, $51, $54, $53
.byte $01, $55, $54, $57, $94, $59, $54, $5b, $01, $5d, $54, $60, $54, $63, $54, $6b
.byte $54, $6e, $54, $ff, $10, $02, $11, $40, $1f, $08, $6c, $10, $6f, $08, $ff, $0a
.byte $02, $0b, $f0, $0e, $08, $12, $20, $14, $3c, $15, $ff, $16, $f0, $19, $08, $1d
.byte $20, $1e, $3d, $21, $80, $22, $03, $23, $c0, $24, $02, $25, $08, $28, $0f, $2a
.byte $10, $2c, $10, $2e, $80, $30, $04, $31, $02, $33, $30, $34, $01, $35, $08, $36
.byte $40, $39, $60, $3a, $10, $3b, $f0, $41, $80, $42, $04, $44, $02, $45, $0f, $46
.byte $c1, $48, $08, $4b, $40, $4c, $0f, $4d, $c0, $4e, $03, $4f, $c0, $5c, $3c, $5d
.byte $f4, $5e, $fc, $5f, $f0, $61, $01, $66, $40, $69, $2f, $6a, $10, $6d, $80, $6e
.byte $04, $70, $ff, $71, $c0, $72, $0f, $73, $fc, $ff, $ff, $ff, $18, $0d, $1e, $08
.byte $28, $54, $32, $54, $3d, $54, $42, $50, $46, $05, $4d, $50, $56, $54, $59, $01
.byte $69, $55, $ff, $1b, $40, $41, $40, $42, $01, $45, $10, $47, $40, $ff, $16, $01
.byte $18, $0f, $19, $ff, $1a, $34, $1e, $0f, $1f, $f0, $20, $10, $2c, $02, $2d, $40
.byte $2e, $05, $30, $03, $31, $c0, $32, $ff, $33, $c0, $38, $01, $48, $0f, $49, $f3
.byte $4a, $c0, $4b, $f0, $55, $f0, $58, $04, $5c, $0f, $5d, $0f, $5e, $c0, $65, $10
.byte $69, $3c, $6f, $08, $71, $ff, $72, $ff, $73, $fc, $10, $ff, $64, $ff, $ff, $17
.byte $40, $41, $10, $ff, $16, $01, $ff, $67, $09, $77, $40, $ff, $ff, $6c, $10, $6f
.byte $20, $70, $04, $73, $80, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff
.byte $11, $55, $22, $55, $29, $d0, $32, $54, $3a, $d0, $42, $55, $4d, $35, $52, $40
.byte $59, $34, $5d, $55, $65, $04, $66, $30, $6d, $55, $1e, $08, $ff, $72, $01, $ff
.byte $10, $3c, $1e, $40, $0d, $01, $10, $0f, $11, $ff, $1f, $3c, $27, $20, $2b, $80
.byte $2e, $02, $30, $f3, $31, $f0, $32, $33, $3a, $01, $43, $40, $45, $10, $47, $cc
.byte $49, $04, $4d, $01, $52, $40, $56, $cc, $58, $01, $5d, $40, $61, $10, $65, $33
.byte $68, $40, $6c, $10, $70, $04, $72, $80, $74, $0f, $75, $ff, $76, $c3, $77, $f0
.byte $22, $cf, $ff, $ff, $ff, $0b, $08, $22, $0d, $2c, $0d, $32, $54, $3c, $54, $42
.byte $54, $48, $03, $4c, $54, $58, $54, $ff, $20, $10, $24, $04, $25, $90, $71, $04
.byte $72, $90, $ff, $12, $0f, $13, $c0, $1c, $3f, $1d, $f0, $23, $08, $27, $20, $28
.byte $33, $29, $ff, $2a, $3f, $2b, $30, $4c, $0f, $4d, $ff, $4e, $3f, $4f, $c0, $60
.byte $40, $64, $10, $67, $20, $68, $04, $6b, $80, $6c, $3f, $6e, $03, $6f, $f0, $75
.byte $3f, $76, $fc, $18, $14, $ff, $6d, $05, $ff, $23, $20, $61, $40, $65, $10, $69
.byte $05, $ff, $40, $14, $4b, $06, $4c, $01, $4d, $80, $51, $21, $52, $01, $53, $01
.byte $54, $03, $57, $05, $58, $04, $59, $04, $5c, $01, $5d, $54, $60, $55, $64, $55
.byte $67, $40, $6e, $05, $70, $40, $7e, $40, $ff, $71, $90, $ff, $43, $40, $44, $3a
.byte $45, $40, $47, $f0, $48, $0f, $49, $fc, $5e, $08, $62, $02, $67, $80, $6a, $40
.byte $6b, $20, $6e, $ff, $6f, $f0, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff
.byte $5a, $08, $5e, $02, $63, $80, $67, $20, $ff, $24, $35, $27, $0c, $2e, $55, $35
.byte $80, $40, $d5, $45, $03, $47, $54, $4b, $d5, $50, $55, $55, $50, $57, $01, $5c
.byte $55, $64, $01, $67, $40, $6e, $d5, $ff, $1d, $02, $21, $08, $22, $40, $26, $10
.byte $ff, $11, $01, $16, $50, $1e, $3f, $1f, $40, $23, $f0, $24, $0f, $25, $3c, $29
.byte $0c, $2a, $30, $2d, $10, $31, $84, $33, $30, $34, $02, $35, $01, $38, $08, $3a
.byte $48, $40, $3f, $41, $0c, $42, $fc, $43, $c0, $49, $80, $4a, $04, $4d, $cf, $4e
.byte $fc, $52, $02, $56, $08, $59, $0c, $5a, $20, $5d, $0c, $5e, $f0, $60, $54, $61
.byte $fc, $63, $f0, $65, $41, $69, $15, $6a, $40, $6c, $ff, $6d, $04, $6e, $10, $72
.byte $3f, $73, $fc, $75, $0f, $ff, $ff, $36, $08, $ff, $11, $05, $14, $05, $17, $05
.byte $1a, $05, $1d, $05, $6b, $08, $ff, $ff, $04, $09, $06, $10, $07, $08, $08, $20
.byte $09, $42, $0a, $04, $0b, $20, $0c, $80, $0d, $18, $0e, $01, $0f, $80, $10, $54
.byte $11, $24, $12, $02, $13, $40, $15, $81, $16, $08, $17, $10, $18, $02, $1a, $60
.byte $1b, $04, $1c, $09, $1e, $10, $1f, $08, $20, $20, $21, $42, $22, $04, $23, $20
.byte $24, $80, $25, $18, $26, $01, $27, $80, $28, $40, $29, $24, $2a, $02, $2b, $40
.byte $2c, $10, $2d, $81, $2e, $88, $2f, $10, $30, $06, $32, $60, $33, $04, $34, $09
.byte $36, $90, $37, $08, $38, $20, $39, $42, $3a, $04, $3b, $20, $40, $80, $41, $18
.byte $42, $01, $43, $80, $44, $40, $45, $24, $46, $02, $47, $40, $48, $10, $49, $81
.byte $4a, $08, $4b, $10, $4c, $06, $4e, $61, $4f, $04, $50, $09, $52, $95, $53, $08
.byte $54, $20, $55, $42, $57, $20, $58, $80, $59, $18, $5b, $80, $5c, $40, $5d, $24
.byte $5e, $02, $5f, $40, $60, $10, $61, $81, $62, $08, $63, $10, $64, $06, $66, $60
.byte $67, $04, $68, $01, $6a, $90, $6b, $08, $6d, $42, $6e, $04, $6f, $20, $71, $18
.byte $72, $01, $73, $80, $75, $3c, $76, $03, $77, $c0, $ff, $ff, $35, $20, $ff, $0e
.byte $02, $13, $d5, $15, $01, $19, $d4, $1a, $04, $1b, $04, $1c, $04, $1d, $d4, $27
.byte $d5, $33, $d4, $39, $04, $3b, $d4, $47, $d5, $51, $d4, $52, $04, $53, $04, $54
.byte $04, $55, $d4, $58, $d5, $5c, $d5, $62, $d5, $6d, $d5, $ff, $0a, $01, $0d, $09
.byte $0e, $02, $0f, $40, $1d, $24, $2d, $09, $3a, $24, $49, $80, $4c, $02, $4d, $40
.byte $4e, $92, $4f, $40, $6d, $09, $ff, $0c, $40, $0f, $08, $10, $fc, $11, $ff, $12
.byte $cc, $13, $cc, $20, $3f, $21, $cc, $22, $ff, $23, $f0, $2c, $40, $2e, $02, $2f
.byte $08, $30, $fc, $31, $ff, $32, $fc, $33, $fc, $40, $3f, $41, $fc, $42, $cf, $43
.byte $f0, $4c, $40, $4f, $08, $50, $cc, $51, $cf, $52, $3c, $53, $3c, $60, $33, $61
.byte $ff, $62, $ff, $63, $c0, $6c, $40, $6e, $02, $6b, $90, $6f, $04, $70, $ff, $71
.byte $ff, $72, $ff, $73, $fc, $ff, $0a, $04, $49, $80, $ff, $08, $10, $0b, $08, $28
.byte $10, $2b, $08, $48, $10, $4b, $08, $68, $10, $ff, $07, $25, $17, $55, $27, $55
.byte $37, $54, $47, $55, $57, $55, $66, $14, $67, $55, $68, $50, $ff, $15, $04, $2a
.byte $10, $4e, $10, $ff, $0d, $05, $12, $50, $1a, $80, $1d, $08, $31, $05, $41, $05
.byte $42, $40, $4a, $40, $51, $01, $55, $01, $ff, $ff, $11, $01, $16, $40, $2e, $80
.byte $ff, $62, $02, $ff, $ff, $6c, $01, $71, $40, $74, $ff, $75, $ff, $76, $ff, $77
.byte $fc, $ff, $ff, $ff, $00, $05, $10, $55, $23, $55, $33, $54, $43, $55, $53, $55
.byte $56, $20, $63, $55, $6e, $05, $ff, $ff, $08, $3c, $0c, $01, $11, $40, $15, $10
.byte $19, $04, $1d, $01, $20, $fc, $22, $40, $26, $10, $2a, $04, $2e, $01, $33, $40
.byte $37, $fc, $61, $04, $62, $04, $65, $04, $66, $04, $67, $40, $69, $ff, $6a, $ff
.byte $6b, $f0, $6c, $08, $70, $3f, $71, $ff, $72, $ff, $73, $fc, $35, $ff, $36, $ff
.byte $ff, $ff, $5e, $01, $ff, $11, $55, $14, $55, $1a, $55, $1d, $55, $21, $55, $24
.byte $55, $2a, $55, $2d, $55, $31, $54, $34, $54, $3a, $54, $3d, $54, $41, $55, $44
.byte $55, $4a, $55, $4d, $55, $51, $55, $54, $55, $57, $58, $5a, $55, $5d, $55, $61
.byte $55, $64, $50, $6a, $50, $6d, $55, $ff, $ff, $09, $90, $0a, $24, $0c, $02, $0d
.byte $05, $0e, $81, $10, $0f, $11, $3f, $12, $f3, $13, $c0, $68, $02, $69, $3f, $6a
.byte $f1, $6c, $08, $6f, $40, $70, $3f, $71, $ff, $72, $ff, $73, $f0, $ff, $ff, $ff
.byte $44, $20, $ff, $ff, $49, $f0, $50, $40, $51, $10, $54, $10, $55, $ff, $56, $c0
.byte $57, $08, $58, $04, $5a, $04, $5b, $28, $5c, $01, $5e, $0f, $5f, $fc, $61, $4c
.byte $62, $40, $65, $10, $66, $10, $69, $fc, $6a, $04, $6e, $01, $73, $40, $76, $03
.byte $77, $fc, $ff, $ff, $ff, $10, $15, $1e, $15, $20, $55, $27, $80, $28, $08, $2e
.byte $55, $30, $54, $3e, $54, $40, $55, $4e, $55, $50, $55, $5e, $55, $60, $55, $65
.byte $0d, $67, $50, $6e, $d5, $70, $40, $73, $40, $75, $40, $79, $40, $7e, $40, $ff
.byte $0d, $02, $0e, $50, $11, $08, $ff, $14, $3f, $15, $f2, $16, $3f, $17, $f0, $19
.byte $08, $1a, $55, $1d, $20, $21, $80, $24, $02, $28, $18, $2b, $40, $2c, $06, $2f
.byte $a0, $30, $01, $33, $80, $35, $60, $36, $02, $39, $15, $3a, $08, $42, $20, $46
.byte $80, $49, $02, $4a, $40, $4d, $08, $4e, $15, $51, $28, $55, $a0, $58, $02, $5b
.byte $50, $5c, $08, $60, $3f, $61, $fc, $62, $ff, $63, $f0, $68, $3f, $69, $cf, $6a
.byte $ff, $6b, $f0, $70, $08, $72, $04, $73, $10, $74, $ff, $75, $ff, $76, $ff, $77
.byte $fc, $59, $01, $5e, $40, $ff, $ff, $32, $01, $ff, $02, $05, $03, $25, $11, $50
.byte $13, $54, $1a, $35, $24, $0d, $28, $d4, $3c, $d4, $42, $30, $43, $01, $4d, $54
.byte $4e, $01, $54, $54, $5e, $55, $68, $d5, $6e, $55, $ff, $1c, $04, $2c, $08, $ff
.byte $15, $ff, $16, $f0, $20, $04, $22, $0c, $24, $04, $25, $90, $28, $04, $29, $3d
.byte $2d, $2f, $2e, $c0, $30, $20, $31, $80, $32, $03, $33, $3c, $34, $10, $35, $c0
.byte $40, $40, $44, $f0, $4f, $20, $53, $80, $56, $02, $5a, $08, $5d, $90, $5e, $20
.byte $61, $ff, $62, $30, $72, $ff, $73, $fc, $ff, $48, $04, $50, $05, $ff, $34, $10
.byte $38, $10, $4c, $01, $54, $01, $55, $40, $59, $40, $ff, $47, $05, $50, $d5, $56
.byte $20, $57, $55, $60, $55, $67, $55, $ff, $ff, $45, $04, $46, $40, $49, $0c, $4a
.byte $ff, $4b, $f0, $50, $3f, $51, $fc, $52, $ff, $53, $e0, $5e, $55, $70, $ff, $71
.byte $ff, $72, $ff, $73, $fc, $ff, $ff, $ff, $10, $d5, $15, $50, $16, $05, $17, $50
.byte $1d, $57, $21, $55, $24, $e0, $26, $55, $2b, $01, $2c, $54, $32, $54, $35, $54
.byte $3b, $54, $42, $55, $48, $0d, $4b, $60, $50, $15, $52, $40, $58, $55, $60, $55
.byte $6b, $d5, $7b, $40, $19, $08, $ff, $0d, $80, $0f, $40, $1d, $08, $ff, $0c, $10
.byte $0e, $10, $10, $3f, $11, $c0, $12, $ff, $13, $c0, $1f, $0c, $21, $31, $24, $03
.byte $26, $c3, $2a, $7e, $2c, $c0, $32, $f8, $36, $20, $3a, $80, $40, $03, $41, $c2
.byte $45, $08, $49, $2f, $4d, $80, $50, $02, $54, $3f, $5f, $a8, $62, $fc, $63, $fc
.byte $6d, $c0, $6e, $40, $71, $c0, $72, $10, $74, $ff, $75, $ff, $76, $ff, $77, $fc
.byte $ff, $08, $02, $ff, $0a, $04, $ff, $61, $09, $71, $40, $ff, $ff, $71, $40, $74
.byte $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $07, $05, $10, $55, $11, $03
.byte $16, $40, $17, $55, $18, $40, $1d, $03, $1e, $55, $20, $15, $21, $40, $2d, $40
.byte $2e, $15, $30, $54, $3e, $54, $40, $55, $47, $d5, $4b, $08, $50, $55, $60, $55
.byte $ff, $0c, $02, $0d, $64, $0e, $26, $0f, $40, $11, $08, $12, $10, $15, $04, $16
.byte $20, $19, $08, $1a, $10, $1d, $04, $1e, $20, $21, $01, $22, $80, $28, $04, $29
.byte $02, $2a, $40, $2b, $20, $2c, $01, $2d, $98, $2e, $19, $2f, $80, $47, $40, $4b
.byte $10, $4d, $50, $ff, $0c, $20, $0f, $10, $10, $2c, $11, $c0, $12, $0c, $13, $d0
.byte $14, $10, $17, $20, $18, $20, $1b, $10, $24, $10, $25, $03, $27, $20, $30, $03
.byte $31, $30, $32, $33, $3a, $02, $41, $0c, $42, $ff, $43, $fc, $4f, $80, $53, $80
.byte $55, $ff, $57, $90, $5a, $40, $5b, $b0, $5c, $0f, $5d, $ff, $5e, $fc, $5f, $80
.byte $63, $80, $67, $80, $6b, $80, $6d, $10, $6e, $02, $70, $ff, $71, $ff, $72, $ff
.byte $ff, $25, $08, $26, $40, $29, $10, $2a, $20, $ff, $36, $02, $ff, $08, $15, $11
.byte $02, $18, $55, $20, $55, $27, $01, $2e, $d5, $30, $d4, $37, $54, $3e, $54, $43
.byte $05, $47, $50, $51, $05, $52, $50, $5e, $d5, $60, $55, $67, $d5, $6e, $55, $ff
.byte $2e, $55, $35, $02, $39, $08, $ff, $14, $04, $16, $90, $18, $01, $19, $02, $1a
.byte $04, $1d, $48, $1e, $01, $21, $ff, $22, $ff, $23, $f0, $30, $3f, $40, $ff, $41
.byte $fc, $42, $ff, $43, $fc, $51, $5a, $53, $f0, $55, $5a, $59, $5a, $5a, $5a, $5d
.byte $5a, $5e, $5a, $61, $fc, $62, $5a, $66, $5a, $68, $3f, $69, $fc, $6a, $ff, $74
.byte $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $12, $55, $1c, $55, $22, $55
.byte $27, $55, $32, $54, $3c, $54, $42, $6c, $47, $55, $5c, $15, $67, $55, $ff, $ff
.byte $10, $f3, $11, $f3, $12, $fe, $16, $08, $1a, $20, $1e, $80, $22, $4f, $26, $10
.byte $2a, $04, $2e, $01, $32, $f2, $36, $08, $3a, $20, $42, $82, $46, $4f, $4a, $10
.byte $4e, $04, $52, $41, $56, $f2, $5a, $08, $5e, $20, $62, $8f, $66, $40, $6a, $10
.byte $6e, $04, $72, $41, $75, $ff, $76, $ff, $77, $f0, $13, $3c, $0e, $50, $ff, $ff
.byte $ff, $06, $02, $31, $14, $42, $40, $43, $40, $44, $40, $45, $40, $46, $40, $47
.byte $40, $48, $40, $49, $40, $4a, $40, $4b, $10, $ff, $ff, $0f, $20, $13, $90, $16
.byte $02, $1a, $08, $1e, $22, $22, $88, $25, $02, $26, $20, $29, $08, $2a, $80, $2d
.byte $22, $31, $88, $34, $0f, $35, $e0, $3b, $20, $45, $40, $4b, $50, $4d, $90, $4e
.byte $84, $55, $04, $57, $20, $59, $80, $5d, $01, $65, $40, $66, $40, $74, $ff, $75
.byte $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $04, $08, $3a, $d0, $63, $d4, $ff, $54
.byte $10, $58, $04, $5c, $01, $ff, $10, $02, $11, $20, $14, $03, $15, $ff, $16, $c0
.byte $17, $08, $1b, $28, $1f, $3c, $21, $3c, $22, $a8, $24, $01, $28, $01, $29, $43
.byte $2a, $fc, $2b, $08, $2d, $50, $2f, $20, $31, $f3, $32, $f0, $33, $80, $35, $0c
.byte $36, $02, $38, $40, $3a, $03, $3b, $fc, $40, $f4, $42, $80, $44, $01, $45, $02
.byte $47, $08, $48, $03, $49, $d8, $4b, $28, $4c, $02, $4d, $8c, $4e, $03, $4f, $fc
.byte $53, $08, $57, $20, $59, $03, $5a, $f0, $5b, $80, $5e, $02, $61, $fc, $62, $08
.byte $6a, $20, $6e, $80, $71, $02, $74, $3f, $75, $ff, $76, $ff, $ff, $ff, $ff, $10
.byte $08, $1d, $55, $25, $d0, $2c, $55, $34, $d0, $3c, $d4, $41, $35, $4c, $55, $51
.byte $55, $55, $34, $5c, $40, $61, $55, $68, $30, $69, $04, $ff, $39, $04, $3a, $20
.byte $71, $80, $ff, $0d, $02, $0e, $40, $11, $03, $12, $ff, $13, $c0, $1c, $f0, $1d
.byte $08, $20, $03, $21, $cc, $24, $15, $30, $03, $31, $30, $32, $3f, $33, $3c, $38
.byte $02, $40, $08, $41, $0f, $42, $c0, $44, $cc, $46, $20, $4a, $80, $4d, $02, $51
.byte $08, $55, $cc, $58, $03, $5a, $02, $5e, $08, $62, $20, $65, $03, $66, $30, $6b
.byte $08, $6f, $20, $71, $04, $73, $80, $74, $3f, $75, $0f, $76, $ff, $77, $c0, $ff
.byte $ff, $ff, $00, $01, $03, $01, $09, $01, $0b, $01, $0e, $01, $10, $55, $12, $05
.byte $1c, $15, $1e, $55, $20, $51, $22, $40, $23, $10, $24, $05, $25, $08, $2c, $50
.byte $2e, $55, $30, $54, $33, $50, $34, $04, $3c, $58, $3e, $54, $40, $55, $48, $10
.byte $49, $40, $4e, $55, $51, $01, $48, $15, $52, $d6, $59, $05, $5e, $55, $59, $55
.byte $52, $d4, $68, $54, $60, $54, $63, $03, $68, $04, $6e, $55, $ff, $10, $05, $4a
.byte $08, $3b, $08, $ff, $0a, $80, $0c, $3c, $0d, $ff, $0e, $cc, $0f, $f0, $15, $01
.byte $16, $2f, $18, $03, $19, $f3, $1a, $f0, $1e, $0b, $21, $04, $22, $6c, $25, $3f
.byte $26, $f0, $2b, $f0, $2c, $3c, $31, $03, $32, $ff, $39, $04, $40, $02, $41, $3f
.byte $42, $cf, $43, $30, $44, $02, $48, $0f, $49, $f0, $4e, $30, $50, $fc, $5e, $0c
.byte $5f, $f0, $60, $03, $61, $d0, $55, $3f, $65, $3d, $69, $03, $6c, $f0, $6d, $f0
.byte $6e, $f0, $71, $09, $74, $3f, $75, $ff, $76, $ff, $77, $f0, $ff, $37, $20, $ff
.byte $35, $01, $ff, $70, $80, $ff, $6d, $02, $71, $08, $72, $40, $ff, $74, $ff, $75
.byte $f0, $76, $ff, $77, $fc, $ff, $ff, $ff, $11, $50, $1d, $50, $22, $01, $23, $04
.byte $24, $10, $25, $40, $26, $40, $27, $40, $28, $40, $29, $40, $2a, $10, $2b, $04
.byte $2c, $01, $32, $40, $33, $34, $3b, $34, $50, $d5, $54, $15, $5e, $d5, $60, $55
.byte $65, $55, $69, $55, $6e, $55, $07, $02, $3c, $40, $5a, $15, $ff, $0d, $02, $0e
.byte $40, $ff, $0d, $80, $0e, $04, $10, $0f, $11, $ff, $12, $ff, $13, $c0, $18, $30
.byte $1b, $30, $2d, $29, $2e, $60, $31, $6a, $32, $54, $35, $ff, $36, $fc, $42, $01
.byte $44, $02, $45, $c0, $46, $0d, $48, $08, $4b, $40, $4c, $20, $4f, $10, $50, $30
.byte $55, $3f, $56, $f0, $6c, $01, $6d, $40, $6e, $0a, $70, $f3, $71, $ff, $72, $ff
.byte $73, $3c, $53, $30, $ff, $ff, $ff, $10, $54, $17, $05, $1b, $55, $1d, $80, $2b
.byte $54, $37, $14, $3e, $34, $42, $15, $44, $0d, $47, $50, $4c, $05, $4e, $55, $53
.byte $05, $54, $50, $5c, $54, $5e, $55, $60, $0d, $63, $50, $68, $d5, $6e, $55, $70
.byte $40, $7e, $40, $ff, $ff, $09, $90, $0c, $02, $0d, $04, $10, $3f, $11, $ff, $12
.byte $fc, $1a, $fc, $1c, $01, $20, $0f, $21, $c4, $24, $15, $25, $01, $27, $f0, $2a
.byte $40, $2e, $fc, $31, $40, $34, $0f, $35, $f0, $33, $20, $37, $f0, $49, $3f, $4a
.byte $ff, $50, $fc, $52, $0b, $56, $20, $59, $40, $5a, $80, $5d, $12, $5e, $02, $5f
.byte $30, $61, $3f, $62, $3f, $68, $3c, $6d, $02, $71, $08, $72, $10, $74, $3f, $75
.byte $ff, $76, $ff, $77, $f0, $ff, $ff, $ff, $00, $0d, $08, $0d, $0e, $05, $10, $55
.byte $12, $21, $13, $50, $1e, $55, $20, $55, $21, $40, $22, $55, $25, $40, $28, $40
.byte $2c, $20, $2e, $55, $30, $54, $33, $40, $37, $40, $3b, $40, $40, $55, $47, $05
.byte $50, $74, $56, $03, $57, $54, $5b, $60, $5e, $15, $67, $55, $60, $80, $ff, $ff
.byte $08, $3f, $09, $ff, $0a, $3f, $0b, $f0, $11, $ff, $17, $20, $19, $10, $1b, $80
.byte $1d, $04, $1e, $02, $21, $cf, $22, $3f, $39, $fc, $3a, $fc, $3b, $f0, $49, $fc
.byte $54, $3f, $55, $fc, $56, $fc, $57, $f0, $59, $20, $5d, $20, $61, $20, $63, $60
.byte $64, $3f, $65, $f0, $66, $ff, $67, $f0, $6d, $08, $6e, $40, $71, $20, $72, $10
.byte $74, $3f, $75, $fc, $76, $ff, $77, $f0, $ff, $ff, $ff, $48, $25, $ff, $ff, $49
.byte $fc, $56, $3f, $75, $ff, $76, $ff, $ff, $ff, $ff, $10, $80, $16, $55, $21, $05
.byte $26, $40, $2c, $05, $2e, $d0, $31, $54, $3c, $54, $48, $55, $58, $54, $55, $01
.byte $65, $55, $ff, $10, $02, $35, $80, $36, $02, $38, $02, $3a, $08, $ff, $0c, $02
.byte $11, $b3, $12, $d0, $14, $3f, $15, $f0, $16, $04, $1a, $01, $1f, $40, $23, $f0
.byte $24, $02, $25, $80, $26, $09, $28, $0f, $29, $fc, $2a, $0f, $32, $02, $40, $3c
.byte $41, $0f, $42, $3f, $43, $c0, $4e, $3c, $5d, $0f, $5e, $c3, $5f, $c0, $66, $23
.byte $67, $fc, $6a, $f0, $6c, $40, $70, $ff, $71, $ff, $72, $fc, $ff, $0c, $08, $36
.byte $20, $ff, $0d, $80, $ff, $22, $05, $27, $15, $32, $54, $3c, $54, $42, $57, $4c
.byte $55, $52, $55, $5c, $55, $61, $55, $66, $80, $6c, $55, $71, $40, $ff, $ff, $0c
.byte $50, $0f, $28, $10, $54, $13, $28, $14, $fe, $17, $fc, $32, $cf, $35, $fc, $4c
.byte $33, $72, $0f, $73, $fc, $74, $ff, $66, $54, $59, $31, $65, $b0, $70, $02, $ff
.byte $ff, $ff, $00, $14, $01, $10, $06, $10, $07, $10, $08, $10, $09, $10, $0d, $10
.byte $0e, $14, $1d, $05, $1e, $03, $20, $d5, $2e, $55, $30, $54, $3e, $54, $4e, $40
.byte $66, $80, $ff, $09, $08, $0d, $20, $11, $82, $12, $55, $14, $02, $15, $08, $18
.byte $08, $19, $20, $1c, $20, $1d, $80, $20, $02, $23, $40, $24, $08, $28, $04, $2c
.byte $08, $2e, $04, $30, $05, $32, $04, $36, $08, $39, $50, $3a, $20, $40, $15, $42
.byte $80, $45, $06, $4d, $54, $55, $02, $5b, $08, $5f, $20, $60, $15, $63, $80, $66
.byte $02, $6a, $08, $6d, $50, $6e, $20, $72, $80, $ff, $0a, $05, $13, $54, $1d, $09
.byte $21, $20, $22, $40, $25, $80, $26, $10, $27, $40, $29, $40, $2a, $10, $2b, $40
.byte $2d, $40, $2f, $80, $31, $10, $33, $80, $35, $04, $37, $80, $39, $0c, $3b, $80
.byte $42, $02, $46, $08, $47, $08, $49, $0c, $4a, $20, $4b, $20, $4e, $80, $4f, $80
.byte $51, $02, $52, $02, $56, $08, $57, $08, $59, $0c, $5a, $20, $5c, $40, $5e, $80
.byte $61, $02, $65, $08, $69, $08, $6d, $0c, $75, $3f, $ff, $ff, $25, $01, $2a, $40
.byte $2e, $80, $31, $02, $25, $01, $2a, $40, $2e, $80, $31, $02, $ff, $7c, $80, $ff
.byte $ff, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $05, $0d, $0e, $03
.byte $10, $20, $1e, $40, $31, $34, $32, $30, $ff, $08, $04, $0e, $24, $21, $40, $31
.byte $10, $32, $40, $ff, $09, $ce, $0a, $03, $0b, $10, $0c, $0f, $0d, $03, $0f, $f0
.byte $12, $fc, $15, $8c, $16, $03, $17, $30, $19, $c0, $1b, $c0, $1e, $c0, $1f, $08
.byte $21, $08, $23, $20, $25, $ff, $27, $a0, $28, $f0, $2a, $03, $2b, $f0, $2e, $01
.byte $30, $51, $31, $08, $32, $01, $33, $40, $34, $c3, $35, $3c, $36, $f3, $37, $c0
.byte $39, $c3, $60, $3f, $61, $3c, $63, $04, $67, $24, $6b, $94, $6d, $0c, $6e, $02
.byte $6f, $54, $72, $09, $73, $98, $74, $ff, $75, $c0, $76, $ff, $77, $fc, $ff, $04
.byte $04, $0a, $80, $ff, $07, $08, $1d, $04, $ff, $14, $35, $24, $40, $6b, $08, $ff
.byte $11, $80, $12, $42, $13, $40, $6b, $10, $6f, $04, $ff, $0c, $c0, $11, $18, $13
.byte $04, $15, $3f, $16, $3f, $17, $0c, $25, $f0, $2e, $03, $6e, $01, $72, $09, $73
.byte $24, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $6b, $08, $ff, $6b, $80, $6f
.byte $10, $ff, $10, $05, $13, $31, $16, $01, $19, $01, $20, $5d, $22, $55, $25, $40
.byte $28, $40, $30, $50, $34, $d0, $37, $d0, $3c, $20, $43, $01, $53, $55, $59, $55
.byte $69, $40, $ff, $19, $40, $1d, $40, $1f, $80, $21, $10, $22, $0a, $2c, $01, $2e
.byte $02, $56, $90, $59, $02, $5a, $04, $5b, $08, $5e, $01, $60, $20, $ff, $10, $01
.byte $11, $55, $12, $40, $15, $fe, $16, $c0, $19, $02, $1b, $80, $1d, $02, $1f, $20
.byte $20, $01, $21, $08, $22, $40, $23, $60, $24, $01, $25, $55, $26, $4c, $27, $90
.byte $28, $33, $29, $ff, $2a, $c2, $2b, $30, $30, $03, $31, $3c, $32, $fc, $39, $20
.byte $41, $18, $45, $3c, $46, $03, $50, $0c, $51, $50, $54, $02, $58, $08, $5c, $20
.byte $5d, $3c, $5f, $0c, $60, $01, $61, $50, $62, $01, $64, $c0, $66, $01, $6a, $03
.byte $6b, $fc, $71, $3c, $ff, $53, $20, $57, $90, $5a, $02, $ff, $1b, $20, $1f, $10
.byte $22, $20, $23, $08, $35, $12, $39, $08, $ff, $55, $95, $78, $40, $ff, $ff, $45
.byte $10, $49, $04, $4d, $01, $52, $40, $56, $80, $5a, $40, $5e, $40, $62, $80, $66
.byte $80, $6a, $80, $6d, $02, $6f, $20, $70, $ff, $71, $ff, $72, $3f, $73, $fc, $ff
.byte $ff, $ff, $43, $83, $ff, $ff, $23, $30, $3b, $40, $43, $40, $47, $40, $4b, $40
.byte $4f, $40, $53, $40, $57, $40, $5b, $40, $5f, $40, $63, $40, $67, $40, $6b, $c0
.byte $6f, $30, $ff, $ff, $ff, $4e, $08, $ff, $ff, $0c, $04, $21, $10, $25, $f0, $10
.byte $3c, $31, $13, $32, $c4, $38, $20, $40, $3c, $46, $0f, $4f, $3c, $59, $f0, $62
.byte $14, $69, $03, $6a, $fc, $ff, $ff, $ff, $23, $d5, $2c, $15, $33, $40, $41, $35
.byte $56, $02, $5c, $55, $68, $55, $ff, $ff, $08, $01, $0d, $40, $10, $3f, $11, $10
.byte $15, $04, $19, $01, $1c, $10, $1e, $40, $20, $3c, $21, $f0, $22, $10, $26, $3f
.byte $31, $02, $32, $ff, $35, $08, $38, $02, $39, $ff, $3a, $f4, $40, $08, $41, $08
.byte $42, $01, $44, $0c, $45, $21, $46, $03, $47, $c0, $49, $80, $4a, $40, $4c, $02
.byte $4e, $10, $50, $3f, $52, $ff, $62, $3f, $60, $10, $64, $04, $68, $01, $6b, $3c
.byte $6d, $40, $71, $ff, $72, $fc, $73, $fc, $ff, $ff, $ff, $62, $02, $ff, $ff, $71
.byte $10, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $0c, $01, $14, $80
.byte $1e, $d5, $2a, $05, $2d, $40, $5e, $35, $65, $55, $6e, $55, $7e, $40, $ff, $ff
.byte $0c, $0f, $0e, $ff, $13, $30, $19, $10, $1a, $03, $1c, $40, $1d, $04, $20, $10
.byte $21, $0c, $24, $04, $27, $c0, $28, $01, $2a, $30, $2d, $40, $31, $10, $34, $ff
.byte $35, $ff, $3a, $02, $42, $08, $46, $3c, $4d, $04, $4e, $02, $4f, $40, $51, $01
.byte $52, $08, $53, $10, $56, $60, $57, $30, $5a, $80, $5d, $03, $5e, $c0, $61, $80
.byte $64, $02, $68, $08, $6c, $20, $70, $80, $71, $10, $74, $ff, $75, $ff, $76, $ff
.byte $77, $fc, $ff, $ff, $ff, $50, $90, $57, $05, $ff, $5c, $06, $ff, $58, $69, $5d
.byte $14, $62, $90, $66, $02, $67, $54, $6b, $64, $61, $64, $ff, $ff, $5d, $12, $62
.byte $49, $ff, $06, $02, $12, $55, $1c, $55, $22, $55, $29, $55, $2c, $55, $32, $54
.byte $39, $54, $3c, $54, $42, $55, $49, $57, $4c, $50, $58, $55, $ff, $ff, $05, $04
.byte $09, $01, $0e, $40, $10, $01, $12, $ff, $15, $40, $19, $10, $1d, $04, $21, $0c
.byte $49, $ff, $58, $fc, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $5a, $0f, $5b, $fc
.byte $ff, $ff, $ff, $1e, $d5, $20, $54, $23, $03, $26, $05, $28, $d0, $2c, $03, $2e
.byte $55, $30, $04, $33, $50, $36, $54, $3c, $40, $3e, $54, $40, $55, $4e, $75, $50
.byte $55, $56, $20, $5e, $55, $60, $54, $6e, $54, $6b, $03, $7b, $40, $ff, $45, $18
.byte $ff, $12, $0b, $13, $f0, $16, $fc, $19, $08, $1d, $20, $1e, $10, $20, $3f, $21
.byte $f0, $22, $30, $29, $03, $2a, $c0, $2c, $fc, $2d, $f0, $2e, $03, $35, $01, $36
.byte $3f, $38, $3c, $3a, $40, $42, $10, $46, $3f, $47, $f0, $48, $03, $49, $cc, $52
.byte $10, $56, $04, $58, $3f, $59, $f0, $5a, $01, $5e, $03, $5f, $c0, $6c, $11, $6d
.byte $02, $6e, $fc, $6f, $f0, $70, $cf, $71, $08, $75, $ff, $76, $ff, $ff, $ff, $ff
.byte $13, $35, $1b, $35, $21, $55, $22, $55, $2c, $55, $2d, $55, $30, $54, $3e, $54
.byte $40, $55, $45, $0d, $46, $10, $4e, $55, $50, $55, $55, $50, $5e, $55, $60, $55
.byte $67, $d5, $6e, $55, $27, $08, $ff, $25, $01, $29, $20, $2a, $82, $2d, $41, $2e
.byte $04, $31, $20, $35, $41, $36, $04, $ff, $15, $ff, $16, $fc, $26, $40, $28, $02
.byte $29, $08, $2a, $20, $2d, $10, $30, $02, $37, $80, $38, $02, $39, $0f, $3a, $22
.byte $40, $01, $42, $81, $45, $43, $46, $d0, $47, $40, $49, $c1, $4b, $f0, $59, $ff
.byte $62, $ff, $63, $f0, $64, $3f, $65, $fe, $6a, $50, $6d, $08, $74, $ff, $75, $ff
.byte $76, $ff, $77, $fc, $ff, $21, $01, $25, $82, $26, $08, $29, $41, $2a, $04, $2d
.byte $82, $2e, $08, $31, $41, $32, $04, $ff, $25, $08, $26, $20, $29, $04, $2a, $10
.byte $2b, $40, $2f, $80, $30, $01, $33, $40, $34, $02, $ff, $10, $55, $15, $c0, $1b
.byte $c0, $1e, $d5, $20, $55, $2e, $55, $30, $54, $3e, $54, $40, $55, $4e, $75, $49
.byte $08, $50, $55, $5e, $55, $60, $55, $6e, $55, $ff, $21, $24, $25, $40, $43, $08
.byte $45, $08, $49, $20, $4d, $80, $50, $02, $5d, $24, $5e, $24, $61, $02, $62, $40
.byte $ff, $0e, $28, $10, $3f, $11, $cf, $12, $fc, $13, $f0, $1d, $02, $21, $01, $22
.byte $20, $25, $0f, $26, $f0, $28, $06, $2c, $01, $31, $54, $41, $0c, $47, $30, $6d
.byte $90, $70, $ff, $71, $ff, $72, $ff, $73, $fc, $61, $30, $62, $30, $65, $03, $ff
.byte $1d, $08, $21, $40, $22, $05, $2b, $40, $33, $10, $37, $20, $3b, $20, $4b, $20
.byte $50, $04, $53, $80, $54, $01, $56, $02, $59, $40, $5a, $08, $5d, $08, $5e, $40
.byte $ff, $1e, $a0, $24, $02, $2f, $10, $4f, $20, $ff, $0a, $08, $13, $35, $15, $03
.byte $23, $55, $25, $55, $33, $54, $35, $54, $38, $d4, $3c, $34, $43, $55, $45, $54
.byte $4c, $55, $53, $55, $5e, $15, $62, $d5, $6e, $54, $ff, $22, $10, $46, $80, $49
.byte $82, $4d, $80, $51, $80, $55, $80, $59, $08, $5d, $04, $ff, $09, $10, $0c, $03
.byte $0d, $f0, $0e, $08, $0f, $fc, $12, $20, $15, $ff, $16, $f0, $1d, $0c, $26, $f0
.byte $32, $3f, $37, $30, $4d, $0c, $55, $03, $57, $20, $59, $40, $5a, $fc, $5b, $80
.byte $5d, $40, $5e, $02, $61, $fc, $62, $08, $66, $3f, $67, $f0, $6c, $40, $6d, $01
.byte $6e, $0d, $6f, $fc, $70, $ff, $71, $3f, $72, $ff, $ff, $16, $02, $1a, $08, $1e
.byte $20, $ff, $42, $15, $4f, $50, $ff, $64, $08, $ff, $ff, $6f, $80, $72, $02, $74
.byte $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $14, $35, $1a, $35, $24, $54
.byte $2a, $54, $41, $20, $4d, $20, $ff, $ff, $0c, $01, $0e, $02, $11, $40, $12, $08
.byte $15, $3f, $16, $f0, $2c, $03, $2d, $f0, $2e, $3f, $38, $01, $39, $20, $3a, $12
.byte $40, $0f, $41, $f0, $42, $3f, $43, $c0, $64, $04, $67, $80, $68, $01, $69, $20
.byte $6a, $12, $6c, $0f, $6d, $f0, $6e, $3f, $6f, $c0, $ff, $ff, $ff, $1d, $b0, $ff
.byte $ff, $08, $81, $0c, $ff, $0d, $f8, $0f, $3c, $2c, $04, $2f, $08, $30, $05, $31
.byte $20, $32, $04, $33, $60, $34, $ff, $35, $f0, $36, $0f, $37, $fc, $ff, $ff, $ff
.byte $1e, $02, $28, $d0, $35, $34, $3a, $34, $4a, $50, $65, $d5, $75, $c0, $76, $c0
.byte $77, $40, $78, $40, $79, $40, $50, $02, $ff, $6d, $08, $ff, $16, $02, $1a, $0a
.byte $1b, $c0, $1c, $43, $1e, $2a, $1f, $c0, $20, $c3, $21, $ff, $22, $3f, $23, $f0
.byte $2c, $03, $2d, $04, $30, $43, $31, $41, $34, $c3, $35, $c1, $36, $f3, $37, $cc
.byte $39, $01, $41, $01, $46, $40, $48, $43, $4a, $fc, $4b, $f0, $4c, $c3, $4e, $03
.byte $4f, $20, $51, $02, $55, $01, $59, $02, $5c, $43, $5d, $0a, $60, $c3, $61, $cc
.byte $66, $01, $71, $c0, $72, $0f, $73, $c0, $ff, $ff, $2c, $10, $2d, $10, $44, $10
.byte $58, $10, $ff, $15, $20, $19, $20, $20, $01, $30, $54, $37, $34, $3e, $54, $40
.byte $40, $47, $54, $4e, $40, $57, $03, $67, $55, $77, $40, $ff, $ff, $06, $20, $0a
.byte $10, $0d, $80, $0e, $04, $10, $02, $12, $01, $14, $08, $17, $40, $18, $20, $1b
.byte $10, $1c, $10, $1d, $3f, $1e, $c0, $1f, $20, $20, $04, $23, $80, $24, $01, $26
.byte $02, $29, $40, $2a, $08, $2d, $10, $2e, $20, $31, $04, $32, $80, $34, $3f, $35
.byte $fc, $36, $ff, $37, $f0, $44, $10, $47, $20, $48, $04, $4b, $80, $4c, $01, $4e
.byte $02, $51, $40, $52, $08, $55, $10, $56, $20, $59, $04, $5a, $80, $5c, $0f, $5d
.byte $fc, $5e, $ff, $5f, $c0, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff
.byte $01, $01, $02, $04, $03, $01, $11, $10, $12, $50, $13, $10, $2e, $02, $30, $0c
.byte $36, $0c, $52, $01, $54, $03, $5a, $41, $64, $50, $ff, $28, $10, $29, $80, $2c
.byte $02, $30, $08, $34, $20, $58, $08, $ff, $12, $10, $16, $10, $1a, $10, $1e, $10
.byte $22, $10, $26, $10, $29, $0c, $2a, $10, $2c, $30, $2d, $c0, $2e, $30, $30, $03
.byte $33, $0c, $34, $0c, $35, $02, $38, $3f, $39, $f3, $3a, $cc, $51, $04, $55, $05
.byte $58, $41, $59, $05, $5a, $41, $5c, $f3, $5d, $0f, $5e, $f3, $5f, $c0, $72, $21
.byte $74, $f0, $75, $3f, $76, $f3, $77, $c0, $0d, $ff, $ff, $0a, $08, $ff, $0e, $08
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $0e, $03, $1e, $50, $27, $d4, $2a, $01, $2d, $03, $30, $54, $39, $14, $3a, $40
.byte $40, $55, $41, $03, $42, $01, $47, $15, $49, $40, $4e, $01, $52, $50, $5e, $55
.byte $54, $02, $ff, $11, $10, $12, $08, $19, $04, $1a, $20, $1d, $01, $35, $20, $36
.byte $05, $39, $80, $3b, $54, $40, $02, $44, $08, $48, $20, $49, $08, $4a, $10, $51
.byte $20, $52, $04, $ff, $0d, $40, $0e, $fb, $0f, $f0, $15, $10, $16, $20, $18, $d5
.byte $1b, $20, $1e, $80, $1f, $80, $21, $0c, $22, $c2, $25, $40, $26, $08, $29, $10
.byte $2a, $20, $2d, $3f, $2e, $f0, $30, $3f, $32, $43, $33, $c0, $45, $08, $4d, $20
.byte $4e, $10, $4f, $30, $55, $80, $56, $04, $58, $03, $59, $c0, $5a, $0f, $61, $fc
.byte $62, $ff, $63, $fc, $69, $03, $ff, $ff, $ff, $03, $03, $09, $07, $13, $55, $1a
.byte $0d, $20, $03, $30, $54, $25, $d5, $2a, $55, $35, $54, $36, $04, $37, $58, $45
.byte $55, $50, $55, $58, $c0, $5e, $55, $61, $55, $52, $55, $5c, $55, $64, $03, $6a
.byte $03, $6d, $55, $72, $40, $73, $40, $74, $40, $7a, $40, $7b, $40, $7c, $40, $ff
.byte $5c, $08, $5f, $10, $60, $04, $63, $20, $64, $01, $67, $80, $69, $40, $6a, $02
.byte $ff, $0c, $3c, $0d, $f3, $0e, $cf, $0f, $f0, $15, $01, $19, $03, $1a, $f3, $1b
.byte $c0, $20, $03, $21, $c0, $32, $ff, $50, $07, $51, $ff, $52, $3f, $4e, $04, $53
.byte $80, $54, $04, $57, $80, $58, $04, $5b, $80, $6d, $0f, $6e, $c0, $28, $08, $2c
.byte $3c, $34, $03, $35, $c0, $38, $03, $40, $fc, $ff, $ff, $24, $04, $4a, $01, $ff
.byte $60, $02, $70, $40, $ff, $ff, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff
.byte $ff, $20, $0d, $2a, $20, $30, $54, $3e, $14, $40, $55, $4e, $d5, $50, $55, $60
.byte $55, $ff, $30, $08, $42, $20, $46, $80, $49, $02, $4d, $08, $ff, $29, $0f, $33
.byte $40, $34, $3c, $35, $0f, $37, $f0, $43, $30, $50, $3f, $51, $f8, $53, $fc, $55
.byte $20, $59, $80, $5c, $02, $60, $3f, $6c, $02, $70, $ff, $1a, $08, $1e, $20, $22
.byte $80, $25, $02, $ff, $ff, $ff, $00, $0d, $10, $55, $12, $35, $20, $55, $22, $55
.byte $30, $54, $32, $54, $3e, $34, $40, $55, $42, $55, $4e, $54, $50, $55, $52, $55
.byte $59, $20, $60, $5d, $ff, $64, $10, $65, $02, $66, $55, $69, $08, $6d, $20, $70
.byte $10, $71, $80, $ff, $08, $3f, $09, $ff, $0a, $ff, $0b, $fc, $11, $0d, $14, $03
.byte $15, $ff, $16, $ff, $21, $3f, $1e, $40, $22, $90, $26, $c5, $2f, $40, $31, $03
.byte $32, $f3, $33, $10, $37, $30, $45, $20, $49, $f0, $4a, $c8, $4f, $fc, $4e, $02
.byte $52, $ff, $60, $0c, $6d, $0c, $6e, $c0, $74, $ff, $76, $03, $77, $fc, $ff, $ff
.byte $2b, $20, $4a, $02, $ff, $47, $95, $57, $55, $67, $55, $77, $40, $ff, $46, $04
.byte $ff, $4a, $ff, $4d, $0c, $66, $c0, $74, $ff, $75, $fc, $76, $ff, $77, $fc, $56
.byte $c0, $5d, $0c, $6d, $0c, $ff, $ff, $ff, $03, $03, $13, $55, $23, $40, $6e, $03
.byte $73, $80, $7b, $40, $7c, $40, $7e, $40, $ff, $14, $10, $27, $08, $2b, $28, $ff
.byte $0b, $08, $0c, $0c, $0d, $c0, $0f, $3c, $11, $02, $12, $04, $15, $03, $16, $fc
.byte $18, $30, $23, $08, $24, $c2, $28, $08, $2f, $fc, $2c, $3c, $32, $08, $34, $20
.byte $35, $01, $36, $28, $38, $20, $39, $03, $3a, $fc, $40, $20, $44, $20, $45, $0f
.byte $48, $20, $4c, $3c, $4f, $40, $52, $08, $53, $40, $54, $20, $56, $29, $57, $80
.byte $58, $20, $59, $03, $5a, $fe, $5b, $bc, $5c, $20, $5e, $02, $60, $20, $62, $02
.byte $64, $20, $66, $02, $68, $3d, $69, $01, $6a, $08, $6b, $10, $6c, $04, $6d, $43
.byte $6e, $fc, $6f, $30, $70, $04, $71, $10, $74, $3f, $75, $3f, $76, $fc, $77, $3c
.byte $ff, $43, $08, $4e, $02, $ff, $47, $08, $4b, $20, $53, $40, $68, $01, $ff, $00
.byte $01, $03, $01, $05, $01, $0b, $01, $0e, $01, $10, $55, $12, $15, $1c, $05, $1e
.byte $55, $20, $55, $22, $50, $2a, $05, $2b, $10, $2c, $40, $2e, $51, $29, $08, $30
.byte $54, $32, $50, $3a, $04, $3b, $50, $3e, $54, $40, $55, $45, $41, $46, $14, $4e
.byte $55, $50, $55, $55, $54, $56, $01, $5c, $d4, $5d, $01, $60, $54, $64, $04, $66
.byte $50, $6b, $0c, $6e, $5c, $ff, $13, $20, $17, $80, $38, $10, $45, $10, $ff, $09
.byte $04, $0c, $3c, $0d, $cf, $0e, $fc, $0f, $f0, $14, $03, $15, $d2, $19, $3f, $1a
.byte $3f, $1c, $03, $1d, $58, $22, $80, $25, $3f, $26, $f0, $28, $3c, $2f, $f0, $30
.byte $03, $31, $ff, $40, $33, $41, $cf, $3a, $80, $42, $f1, $46, $01, $49, $30, $4a
.byte $3f, $4b, $c0, $52, $c0, $53, $3c, $58, $3c, $59, $c2, $5e, $2f, $62, $f0, $65
.byte $03, $69, $3c, $6a, $3c, $6b, $30, $6d, $02, $6e, $40, $70, $3f, $71, $ff, $72
.byte $ff, $73, $f0, $ff, $34, $10, $ff, $36, $80, $ff, $09, $01, $19, $40, $1a, $14
.byte $10, $03, $1e, $03, $20, $55, $2e, $55, $31, $54, $33, $04, $34, $34, $35, $50
.byte $37, $54, $39, $50, $3a, $34, $3b, $04, $3d, $54, $40, $01, $41, $14, $42, $40
.byte $47, $15, $4c, $40, $4d, $14, $4e, $01, $50, $55, $52, $35, $57, $48, $5c, $35
.byte $5e, $55, $60, $55, $63, $55, $67, $01, $6b, $55, $6e, $55, $ff, $09, $02, $0a
.byte $40, $11, $08, $12, $10, $19, $20, $1a, $04, $41, $02, $42, $55, $45, $08, $49
.byte $20, $4d, $80, $50, $02, $53, $40, $59, $42, $5a, $42, $ff, $0d, $08, $0e, $40
.byte $15, $20, $16, $10, $1c, $3f, $1d, $c0, $1e, $0f, $1f, $f0, $31, $80, $32, $04
.byte $50, $20, $53, $10, $54, $30, $57, $30, $5d, $03, $70, $fc, $71, $fc, $72, $fc
.byte $73, $fc, $ff, $34, $02, $36, $01, $40, $08, $43, $40, $48, $20, $4b, $10, $ff
.byte $20, $10, $23, $08, $24, $04, $27, $20, $28, $01, $2b, $80, $2d, $40, $2e, $02
.byte $38, $02, $3b, $40, $44, $08, $47, $10, $4c, $20, $4f, $04, $ff, $40, $55, $50
.byte $50, $54, $40, $58, $d5, $6a, $80, $ff, $71, $04, $ff, $40, $3f, $41, $ff, $42
.byte $ff, $4d, $08, $51, $3f, $52, $30, $5c, $40, $60, $50, $63, $08, $64, $fc, $67
.byte $28, $6b, $fc, $6e, $08, $72, $20, $75, $3f, $76, $f0, $ff, $60, $01, $65, $40
.byte $69, $10, $6d, $04, $ff, $ff, $67, $09, $77, $40, $ff, $ff, $6c, $10, $6f, $20
.byte $70, $04, $73, $80, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff, $ff, $05
.byte $10, $06, $10, $08, $10, $0e, $03, $19, $20, $1a, $01, $1e, $55, $2a, $50, $4e
.byte $35, $5e, $15, $62, $0d, $6e, $50, $72, $50, $ff, $16, $04, $1a, $80, $1c, $01
.byte $1d, $02, $21, $08, $25, $20, $32, $01, $37, $54, $ff, $09, $03, $0a, $3f, $0b
.byte $d0, $0f, $30, $18, $80, $1a, $30, $1c, $50, $1f, $54, $1e, $03, $20, $ff, $21
.byte $c0, $25, $03, $29, $c0, $2b, $0c, $2c, $80, $2e, $30, $30, $20, $34, $08, $38
.byte $02, $41, $80, $44, $20, $45, $20, $48, $34, $49, $08, $4a, $3c, $4c, $0c, $4d
.byte $02, $51, $03, $53, $10, $57, $30, $58, $09, $59, $02, $5a, $40, $5c, $20, $5d
.byte $48, $5e, $10, $60, $d0, $61, $b4, $62, $2f, $64, $06, $65, $01, $66, $80, $68
.byte $03, $69, $03, $6a, $c0, $63, $f0, $ff, $10, $10, $ff, $14, $04, $18, $08, $2c
.byte $20, $30, $08, $34, $02, $39, $80, $41, $20, $45, $08, $49, $02, $ff, $02, $03
.byte $12, $55, $16, $35, $19, $03, $20, $03, $22, $57, $26, $54, $29, $54, $2e, $03
.byte $30, $54, $34, $80, $3e, $54, $40, $55, $4e, $55, $50, $41, $51, $14, $55, $01
.byte $5e, $55, $60, $54, $61, $01, $65, $55, $6e, $54, $71, $40, $72, $40, $73, $40
.byte $74, $40, $75, $40, $ff, $1a, $02, $42, $90, $4d, $40, $4e, $02, $50, $04, $51
.byte $20, $52, $20, $53, $90, $54, $06, $56, $01, $57, $90, $ff, $0c, $03, $0d, $fe
.byte $15, $03, $16, $ff, $17, $c0, $1e, $0f, $1f, $d0, $2c, $30, $2f, $f0, $31, $0c
.byte $3a, $03, $45, $04, $46, $c0, $49, $0c, $4a, $02, $50, $02, $51, $09, $52, $08
.byte $55, $99, $56, $90, $58, $0c, $59, $bf, $5a, $d3, $5b, $c0, $5d, $80, $5e, $10
.byte $61, $80, $62, $10, $64, $02, $66, $30, $68, $08, $6c, $0c, $6d, $0f, $6e, $ff
.byte $6f, $f0, $ff, $45, $20, $49, $80, $4e, $02, $50, $08, $52, $01, $ff, $41, $02
.byte $42, $04, $46, $01, $4c, $02, $51, $80, $52, $80, $55, $40, $56, $08, $59, $40
.byte $5a, $08, $5d, $40, $5e, $08, $ff, $0e, $01, $10, $05, $12, $20, $18, $35, $1b
.byte $01, $1e, $55, $20, $50, $25, $54, $2b, $55, $2e, $55, $3a, $04, $3c, $d4, $3e
.byte $54, $40, $05, $4a, $54, $4c, $55, $4e, $55, $50, $55, $5c, $40, $5e, $55, $60
.byte $55, $70, $40, $77, $c0, $ff, $1b, $20, $1d, $21, $21, $a0, $24, $02, $27, $20
.byte $ff, $0d, $cf, $0e, $ff, $0f, $f0, $11, $30, $16, $3f, $18, $3c, $1f, $f0, $21
.byte $0f, $22, $c0, $25, $10, $28, $fc, $29, $04, $2b, $c0, $2d, $01, $32, $4f, $36
.byte $10, $3a, $30, $42, $c0, $45, $03, $48, $15, $49, $cc, $4d, $30, $4e, $3c, $55
.byte $40, $56, $3f, $57, $c0, $59, $f0, $62, $3f, $63, $fc, $64, $0f, $65, $f0, $66
.byte $c0, $69, $05, $6d, $0c, $72, $ff, $74, $ff, $75, $ff, $ff, $17, $40, $ff, $ff
.byte $07, $08, $17, $03, $27, $40, $28, $10, $29, $35, $32, $d4, $37, $c0, $42, $50
.byte $4e, $0d, $5e, $55, $6e, $54, $ff, $36, $02, $ff, $1c, $3f, $1d, $fc, $26, $0c
.byte $30, $03, $31, $d0, $32, $ff, $35, $3f, $37, $40, $3a, $01, $3b, $80, $43, $40
.byte $46, $40, $47, $90, $48, $0f, $49, $3c, $4a, $fc, $4b, $b0, $4d, $c3, $4f, $80
.byte $53, $90, $54, $10, $57, $a0, $58, $34, $5b, $80, $5c, $01, $5e, $0a, $60, $cc
.byte $61, $40, $62, $08, $64, $03, $65, $10, $66, $20, $69, $ff, $6a, $f0, $6e, $03
.byte $6f, $3c, $72, $0c, $77, $c0, $45, $10, $47, $10, $ff, $ff, $ff, $07, $04, $10
.byte $55, $16, $30, $17, $04, $18, $30, $1a, $40, $20, $55, $24, $b0, $30, $54, $40
.byte $55, $50, $55, $5b, $0d, $60, $55, $67, $01, $68, $01, $70, $50, $71, $10, $72
.byte $10, $73, $10, $74, $10, $75, $10, $76, $10, $ff, $0e, $08, $2b, $08, $2f, $20
.byte $33, $80, $4f, $08, $53, $20, $57, $80, $5a, $40, $5d, $20, $60, $10, $63, $08
.byte $67, $20, $6b, $80, $6e, $02, $ff, $0b, $08, $0c, $fc, $0e, $01, $0f, $28, $11
.byte $33, $12, $33, $13, $fc, $27, $08, $2a, $03, $2b, $c0, $2e, $0c, $35, $01, $36
.byte $0f, $3a, $40, $42, $10, $46, $04, $4a, $01, $4b, $08, $4e, $23, $4f, $c0, $52
.byte $80, $55, $02, $5c, $40, $5d, $02, $5f, $08, $61, $c3, $62, $03, $63, $c0, $64
.byte $30, $6d, $40, $71, $fc, $72, $3c, $ff, $ff, $0b, $20, $ff, $29, $20, $43, $55
.byte $47, $55, $4c, $55, $53, $55, $57, $55, $5c, $55, $63, $55, $67, $55, $6c, $55
.byte $13, $02, $ff, $3a, $a8, $ff, $37, $08, $38, $10, $39, $20, $3a, $01, $3b, $20
.byte $40, $fc, $41, $fc, $42, $ff, $43, $3c, $70, $ff, $71, $ff, $72, $ff, $73, $fc
.byte $55, $fc, $5e, $ff, $ff, $ff, $ff, $00, $15, $10, $d4, $11, $04, $12, $04, $13
.byte $04, $14, $04, $2e, $55, $52, $50, $51, $05, $61, $55, $67, $20, $ff, $08, $01
.byte $5e, $08, $62, $04, $60, $08, $64, $08, $ff, $08, $10, $0c, $15, $10, $3f, $12
.byte $55, $1c, $01, $21, $55, $22, $03, $23, $f0, $31, $03, $32, $c0, $33, $20, $37
.byte $80, $38, $3c, $3a, $02, $41, $03, $42, $c8, $46, $20, $49, $ff, $4a, $f0, $55
.byte $ff, $57, $c0, $5b, $3c, $5c, $03, $64, $01, $66, $0f, $68, $0f, $70, $3f, $71
.byte $f0, $72, $3f, $73, $c0, $ff, $56, $50, $5a, $10, $5e, $08, $ff, $09, $40, $61
.byte $40, $ff, $62, $02, $ff, $ff, $6c, $01, $71, $40, $74, $ff, $75, $ff, $76, $ff
.byte $77, $fc, $ff, $ff, $ff, $46, $01, $47, $01, $48, $01, $49, $01, $4a, $01, $4b
.byte $01, $4c, $01, $4d, $01, $51, $80, $5e, $50, $75, $10, $76, $10, $77, $10, $78
.byte $10, $79, $10, $ff, $41, $40, $45, $10, $49, $04, $4d, $04, $68, $10, $6c, $04
.byte $70, $01, $ff, $42, $08, $46, $20, $4a, $80, $4c, $03, $4d, $c2, $51, $28, $55
.byte $a0, $58, $02, $59, $10, $5a, $03, $5b, $f0, $5c, $08, $5d, $10, $60, $20, $61
.byte $04, $62, $20, $64, $80, $65, $01, $66, $80, $6a, $40, $6e, $10, $72, $04, $74
.byte $0f, $75, $c0, $76, $0f, $77, $fc, $ff, $ff, $ff, $17, $05, $41, $0d, $43, $0d
.byte $51, $20, $53, $55, $63, $50, $ff, $ff, $04, $10, $08, $10, $0c, $10, $10, $10
.byte $11, $80, $0f, $20, $13, $80, $14, $07, $15, $f0, $16, $02, $17, $0c, $18, $04
.byte $1a, $08, $1c, $04, $1e, $20, $1f, $f0, $20, $04, $21, $03, $22, $fc, $24, $04
.byte $28, $04, $2c, $05, $30, $0f, $31, $f0, $36, $40, $3a, $50, $42, $ff, $43, $fc
.byte $44, $04, $46, $40, $48, $0c, $49, $f0, $4a, $40, $4e, $40, $52, $40, $55, $03
.byte $56, $c0, $64, $10, $67, $08, $68, $3f, $6b, $28, $6f, $a8, $72, $02, $73, $a8
.byte $75, $03, $76, $ff, $77, $fc, $ff, $ff, $ff, $0d, $02, $11, $d5, $21, $50, $23
.byte $10, $2b, $0d, $32, $34, $3b, $40, $42, $54, $43, $04, $44, $04, $45, $04, $46
.byte $04, $4b, $0d, $53, $03, $56, $01, $57, $01, $58, $01, $59, $01, $5a, $01, $5b
.byte $04, $5c, $54, $63, $54, $ff, $0f, $a4, $52, $01, $ff, $08, $ff, $0b, $90, $0d
.byte $0c, $0e, $80, $10, $0c, $11, $f3, $12, $ff, $13, $fc, $1d, $01, $21, $01, $25
.byte $45, $27, $80, $28, $3c, $29, $17, $2a, $3c, $2b, $fc, $2c, $30, $2e, $c0, $30
.byte $30, $34, $33, $35, $03, $36, $cf, $3a, $30, $41, $c1, $47, $28, $49, $03, $4a
.byte $cc, $4b, $fc, $4d, $0e, $51, $08, $52, $c0, $55, $08, $56, $c7, $59, $20, $5a
.byte $c1, $5b, $3c, $5c, $0c, $5d, $f0, $5f, $20, $66, $3e, $67, $20, $6c, $cf, $6d
.byte $f0, $71, $03, $72, $3f, $73, $fc, $76, $c0, $ff, $0a, $02, $ff, $ff, $1a, $90
.byte $22, $d5, $28, $05, $32, $54, $38, $54, $40, $55, $46, $55, $56, $55, $58, $d0
.byte $66, $55, $ff, $4d, $20, $55, $a0, $65, $20, $ff, $18, $50, $1d, $08, $1f, $28
.byte $20, $33, $21, $fc, $23, $a8, $26, $02, $27, $a8, $2a, $3f, $40, $3d, $41, $10
.byte $49, $10, $4a, $02, $4e, $08, $51, $50, $52, $3f, $59, $50, $5a, $03, $5d, $50
.byte $61, $10, $63, $fc, $64, $fc, $69, $10, $6d, $10, $71, $ff, $72, $fc, $ff, $ff
.byte $41, $10, $45, $04, $ff, $15, $05, $19, $06, $35, $34, $45, $54, $4b, $d4, $56
.byte $d5, $5e, $0c, $ff, $15, $0a, $16, $40, $38, $05, $33, $08, $37, $20, $3b, $80
.byte $45, $54, $4f, $54, $ff, $19, $0f, $34, $3f, $32, $ff, $35, $cf, $2f, $08, $5c
.byte $08, $5b, $b0, $60, $fc, $62, $02, $65, $03, $66, $c8, $6a, $20, $6e, $80, $71
.byte $ff, $72, $fc, $42, $0c, $ff, $12, $80, $ff, $ff, $2b, $94, $28, $01, $38, $54
.byte $43, $0d, $4c, $0d, $53, $40, $5c, $75, $50, $03, $60, $55, $61, $01, $62, $01
.byte $6d, $03, $7a, $40, $7b, $40, $7c, $40, $7d, $40, $ff, $52, $04, $53, $80, $56
.byte $90, $6e, $20, $ff, $2e, $3f, $34, $0f, $39, $10, $40, $50, $41, $ff, $42, $ff
.byte $43, $08, $44, $54, $47, $28, $48, $fc, $4b, $3c, $51, $20, $55, $30, $59, $0f
.byte $5a, $c0, $5c, $10, $60, $30, $62, $04, $66, $01, $69, $02, $6b, $40, $6c, $03
.byte $6d, $08, $6f, $cc, $71, $0c, $72, $30, $ff, $52, $10, $62, $20, $66, $80, $6a
.byte $40, $ff, $35, $04, $4d, $20, $54, $02, $58, $08, $ff, $01, $08, $0b, $03, $1b
.byte $50, $1e, $05, $21, $05, $29, $d5, $2e, $57, $31, $54, $3b, $d4, $46, $55, $4b
.byte $55, $50, $05, $53, $0d, $57, $44, $58, $11, $5e, $05, $60, $54, $63, $40, $67
.byte $44, $68, $11, $6e, $55, $77, $40, $ff, $08, $24, $0a, $24, $10, $24, $11, $90
.byte $15, $04, $17, $90, $19, $01, $1e, $60, $39, $90, $43, $24, $54, $24, $57, $24
.byte $73, $98, $ff, $0c, $f0, $0e, $fc, $14, $f0, $15, $c0, $1a, $03, $1b, $f0, $22
.byte $cc, $28, $0f, $29, $40, $2d, $fc, $2f, $b0, $32, $0c, $33, $c0, $40, $0f, $41
.byte $f0, $44, $40, $46, $80, $47, $3c, $48, $10, $49, $03, $4a, $f0, $4c, $3c, $58
.byte $3c, $59, $f0, $5a, $03, $5b, $f0, $64, $03, $65, $fc, $70, $09, $74, $ff, $75
.byte $fc, $76, $3f, $77, $fc, $ff, $35, $10, $53, $80, $6f, $10, $1a, $40, $ff, $25
.byte $10, $2b, $80, $40, $10, $42, $80, $51, $80, $5d, $20, $6c, $08, $ff, $61, $09
.byte $71, $40, $ff, $ff, $71, $40, $74, $ff, $75, $ff, $76, $ff, $77, $fc, $ff, $ff
.byte $ff, $19, $09, $29, $50, $ff, $ff, $0d, $20, $11, $80, $14, $02, $18, $08, $1c
.byte $20, $20, $30, $2f, $08, $33, $20, $34, $10, $35, $08, $37, $80, $38, $10, $39
.byte $08, $3a, $02, $40, $3f, $41, $fc, $42, $03, $43, $fc, $57, $10, $59, $10, $5b
.byte $10, $5d, $10, $5f, $10, $61, $10, $62, $c0, $63, $10, $65, $10, $67, $10, $69
.byte $10, $6b, $10, $6d, $10, $6f, $10, $71, $10, $73, $10, $75, $3c, $77, $3c, $ff
.byte $ff, $ff, $01, $03, $02, $03, $03, $03, $04, $03, $06, $03, $0a, $03, $0e, $20
.byte $11, $55, $12, $30, $13, $30, $16, $55, $1a, $55, $20, $0d, $21, $40, $22, $03
.byte $23, $0c, $25, $0d, $27, $c3, $28, $cc, $29, $c0, $2a, $0d, $2e, $0d, $30, $54
.byte $31, $50, $32, $0c, $35, $54, $36, $50, $37, $0c, $3b, $c0, $3c, $34, $3d, $c0
.byte $40, $40, $43, $c0, $45, $40, $48, $c0, $4c, $40, $51, $01, $5c, $03, $6d, $40
.byte $6e, $14, $ff, $09, $04, $21, $04, $24, $20, $25, $98, $26, $20, $50, $04, $48
.byte $04, $4c, $04, $54, $04, $4e, $80, $51, $2a, $58, $04, $5b, $40, $ff, $0b, $08
.byte $0f, $20, $10, $20, $13, $80, $14, $20, $16, $02, $18, $20, $1a, $08, $1c, $20
.byte $1e, $20, $20, $20, $32, $08, $36, $20, $3a, $80, $44, $90, $48, $80, $4c, $80
.byte $50, $80, $54, $80, $55, $3c, $57, $08, $58, $80, $5b, $28, $5c, $cc, $5f, $3c
.byte $6a, $30, $69, $20, $6d, $80, $6f, $08, $70, $02, $73, $0c, $74, $ff, $ff, $1d
.byte $04, $21, $10, $4c, $08, $ff, $ff, $1c, $80, $2e, $d0, $40, $d5, $49, $05, $4c
.byte $55, $50, $55, $57, $03, $59, $54, $5d, $55, $63, $54, $67, $55, $6c, $d5, $ff
.byte $29, $08, $2b, $20, $2d, $01, $2f, $80, $32, $40, $36, $10, $39, $10, $41, $04
.byte $46, $04, $51, $40, $55, $14, $56, $05, $5f, $40, $ff, $14, $0f, $15, $c0, $17
.byte $c0, $1d, $3f, $1e, $50, $23, $30, $26, $3f, $2d, $20, $32, $0f, $31, $80, $34
.byte $02, $35, $c0, $38, $08, $3a, $3d, $40, $3c, $42, $03, $45, $20, $49, $80, $4a
.byte $0c, $5d, $0c, $5e, $c0, $63, $3c, $65, $0c, $67, $30, $6d, $fc, $72, $ff, $ff
.byte $4d, $40, $ff, $49, $40, $ff, $15, $20, $2c, $55, $3c, $50, $43, $15, $53, $40
.byte $5b, $05, $6b, $50, $ff, $ff, $09, $15, $16, $55, $24, $fd, $29, $40, $26, $02
.byte $2a, $08, $2d, $f0, $2e, $20, $32, $80, $35, $02, $39, $08, $3a, $0f, $3b, $fc
.byte $41, $20, $45, $80, $49, $40, $4d, $11, $51, $04, $52, $40, $54, $0b, $55, $fc
.byte $56, $10, $58, $20, $5a, $04, $5c, $80, $5e, $08, $60, $ff, $62, $20, $63, $fc
.byte $66, $80, $69, $02, $6a, $3f, $6d, $08, $71, $ff, $72, $fc, $ff, $ff, $ff, $01
.byte $04, $02, $04, $03, $04, $05, $04, $06, $03, $0c, $05, $11, $15, $14, $05, $1e
.byte $55, $24, $41, $25, $0c, $26, $0c, $27, $0c, $2a, $40, $2b, $40, $2c, $08, $2e
.byte $55, $33, $d4, $34, $04, $3c, $fc, $3e, $74, $47, $03, $4c, $50, $4e, $55, $57
.byte $55, $5a, $15, $5e, $55, $60, $15, $64, $10, $67, $40, $6b, $50, $6e, $55, $70
.byte $40, $74, $40, $78, $40, $7b, $c0, $7d, $40, $04, $04, $ff, $10, $02, $12, $20
.byte $16, $88, $2e, $80, $2f, $90, $31, $02, $35, $08, $36, $20, $38, $10, $45, $09
.byte $46, $10, $47, $10, $4a, $40, $4c, $01, $51, $40, $53, $20, $54, $04, $55, $19
.byte $60, $08, $65, $80, $68, $02, $ff, $0a, $2f, $0c, $3c, $0d, $03, $0e, $f0, $11
.byte $cf, $12, $01, $13, $f0, $14, $0c, $16, $02, $18, $0f, $19, $4f, $1a, $cf, $1d
.byte $1c, $20, $34, $21, $30, $22, $30, $24, $0d, $25, $2c, $28, $03, $29, $c0, $2a
.byte $f0, $32, $04, $36, $08, $39, $3f, $3a, $3f, $59, $fc, $5a, $e0, $5e, $30, $62
.byte $c0, $64, $30, $40, $c0, $48, $0f, $49, $f0, $4a, $3f, $4b, $c0, $51, $3c, $56
.byte $c3, $57, $f0, $58, $f3, $65, $3f, $68, $30, $69, $c0, $6c, $0f, $71, $3f, $73
.byte $c0, $ff, $3b, $20, $43, $10, $4f, $80, $ff, $21, $10, $37, $04, $ff, $09, $0d
.byte $0a, $0d, $0b, $0d, $0c, $0d, $0d, $0d, $19, $54, $1a, $54, $1b, $60, $1c, $54
.byte $1d, $54, $21, $0d, $27, $0d, $31, $54, $37, $54, $47, $40, $ff, $24, $08, $44
.byte $05, $4d, $55, $5e, $55, $6f, $40, $73, $18, $ff, $14, $55, $1f, $c0, $25, $40
.byte $28, $0f, $29, $c0, $38, $40, $3a, $90, $40, $f0, $41, $02, $42, $04, $44, $c0
.byte $45, $ff, $46, $0f, $47, $f0, $6c, $90, $70, $fc, $76, $3f, $77, $f0, $ff, $ff
.byte $59, $08, $5d, $20, $61, $80, $64, $02, $68, $08, $ff, $04, $03, $05, $03, $0c
.byte $03, $10, $20, $12, $03, $15, $41, $16, $54, $1c, $75, $22, $54, $2c, $50, $38
.byte $10, $3e, $04, $40, $01, $4e, $50, $50, $54, $51, $05, $61, $55, $64, $01, $65
.byte $01, $66, $01, $69, $01, $6a, $01, $6b, $01, $6d, $03, $72, $40, $73, $40, $77
.byte $40, $78, $40, $7b, $40, $7c, $40, $7d, $40, $ff, $31, $01, $4a, $20, $4e, $80
.byte $51, $02, $55, $08, $47, $40, $4b, $10, $4f, $20, $53, $80, $57, $80, $5a, $02
.byte $5e, $01, $62, $01, $67, $40, $ff, $08, $04, $09, $20, $0a, $11, $0b, $20, $0c
.byte $3f, $0d, $0f, $0e, $f3, $0f, $30, $11, $10, $13, $20, $15, $20, $16, $03, $17
.byte $30, $19, $80, $1c, $33, $1d, $c0, $20, $30, $22, $40, $24, $30, $25, $0f, $26
.byte $14, $2a, $14, $2c, $0f, $2d, $cf, $2e, $04, $30, $02, $32, $01, $34, $01, $35
.byte $0f, $37, $40, $38, $02, $39, $80, $3b, $f0, $40, $02, $31, $c0, $35, $cf, $44
.byte $02, $48, $08, $4c, $3c, $4d, $c0, $47, $c0, $59, $20, $5c, $c0, $18, $30, $5d
.byte $80, $61, $80, $5f, $04, $65, $80, $68, $02, $69, $01, $6a, $40, $6b, $40, $6c
.byte $0f, $6d, $03, $6e, $c0, $6f, $cc, $ff, $16, $40, $1a, $10, $1e, $04, $38, $80
.byte $40, $40, $44, $40, $48, $40, $39, $20, $41, $22, $5a, $02, $5e, $02, $45, $22
.byte $49, $22, $4d, $28, $51, $20, $ff, $22, $01, $4c, $10, $50, $04, $54, $01, $59
.byte $40, $ff, $70, $80, $ff, $6d, $02, $71, $08, $72, $40, $ff, $74, $ff, $75, $f0
.byte $76, $ff, $77, $fc, $ff, $ff, $ff, $ff, $ff, $77, $3c, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $10, $10, $10, $12, $12, $12, $02, $01, $11, $11, $11, $13, $13, $13, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $0e, $03, $03, $03, $03, $0e, $02
.byte $01, $0f, $03, $03, $03, $03, $0f, $02, $01, $0f, $03, $03, $03, $03, $0f, $02
.byte $01, $0f, $03, $03, $03, $03, $0f, $02, $01, $49, $03, $03, $03, $03, $49, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $03, $03, $03, $03, $03, $03, $02, $4e, $19, $03, $03, $03, $03, $03, $02
.byte $4f, $1f, $03, $03, $03, $03, $03, $02, $46, $25, $03, $03, $03, $03, $03, $02
.byte $47, $48, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $14, $15, $16, $17, $18, $19, $02, $01, $1a, $1b, $1c, $1d, $1e, $1f, $02
.byte $01, $20, $21, $22, $23, $24, $25, $02, $01, $26, $27, $28, $29, $2a, $2b, $02
.byte $01, $2c, $2d, $2e, $2f, $30, $31, $02, $01, $32, $33, $34, $35, $36, $37, $02
.byte $01, $38, $39, $3a, $3b, $3c, $3d, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $0c, $03, $03, $03, $03, $0d, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $0e, $03, $03, $03, $03, $03, $02
.byte $01, $0f, $03, $03, $03, $03, $03, $02, $01, $0f, $0c, $03, $03, $03, $03, $02
.byte $01, $49, $49, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $12, $12, $12, $02, $01, $03, $03, $03, $13, $13, $13, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $4a, $4a, $10, $12, $4c, $4c, $02, $01, $4b, $4b, $11, $13, $4d, $4d, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $0a, $09, $09, $09, $09, $09, $09, $0b
.byte $01, $50, $51, $52, $53, $03, $03, $02, $01, $03, $03, $54, $55, $57, $58, $02
.byte $01, $03, $56, $56, $56, $56, $03, $02, $01, $03, $9b, $9c, $9d, $9e, $03, $02
.byte $01, $03, $56, $56, $56, $56, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $5d, $5e, $5c, $5e, $09, $09, $09, $0b
.byte $ab, $ab, $ab, $ab, $ab, $ab, $ab, $ab, $b0, $3e, $b1, $b1, $3e, $b1, $b1, $3e
.byte $b4, $b5, $b6, $b7, $b8, $b6, $b7, $b9, $bb, $bc, $bd, $3e, $b1, $bd, $3e, $b1
.byte $be, $bf, $60, $61, $62, $63, $3e, $3e, $3e, $66, $6a, $68, $68, $6a, $66, $3e
.byte $88, $89, $8a, $8a, $8a, $8a, $89, $8b, $73, $73, $8f, $8f, $8c, $8d, $8c, $8d
.byte $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $59, $5a, $5b, $64, $65, $43, $44, $45
.byte $3e, $3e, $3e, $41, $42, $3e, $3e, $3e, $3e, $3e, $3e, $3f, $40, $3e, $3e, $3e
.byte $3e, $9f, $6b, $6c, $6d, $6e, $67, $3e, $3e, $a3, $a0, $a1, $a2, $a0, $69, $3e
.byte $a4, $a5, $a5, $a5, $a5, $a5, $a5, $a6, $a8, $a9, $a8, $a9, $a7, $a7, $a7, $a7
.byte $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $6f, $70, $71, $72, $75, $76, $3e
.byte $3e, $77, $71, $78, $79, $7a, $7b, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e
.byte $3e, $81, $82, $83, $84, $85, $86, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e
.byte $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $5f, $5f, $73, $73, $73, $73, $73, $73
.byte $3e, $3e, $60, $61, $62, $63, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e
.byte $93, $94, $95, $96, $97, $98, $99, $9a, $3e, $7e, $7c, $7d, $3e, $3e, $3e, $3e
.byte $3e, $3e, $aa, $ad, $aa, $af, $b3, $3e, $3e, $3e, $ac, $ae, $ac, $b2, $ba, $3e
.byte $3e, $3e, $3e, $3e, $3e, $3e, $3e, $3e, $8f, $8f, $8f, $8f, $8f, $8f, $5f, $5f
.byte $00, $07, $07, $07, $07, $07, $07, $08, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $04, $05, $05, $05, $05, $05, $05, $06
.byte $00, $90, $90, $90, $90, $90, $90, $08, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $01, $03, $03, $03, $03, $03, $03, $02
.byte $01, $03, $03, $03, $03, $03, $03, $02, $04, $05, $05, $05, $05, $05, $05, $06
.byte $39, $39, $39, $39, $fc, $fc, $fc, $fc, $39, $f0, $f1, $f0, $fc, $f2, $f3, $f2
.byte $39, $f0, $f1, $f0, $fc, $f2, $f3, $f2, $39, $f0, $f1, $f0, $fc, $f2, $f3, $f2
.byte $f1, $f0, $f1, $39, $f3, $f2, $f3, $fc, $f1, $f0, $f1, $39, $f3, $f2, $f3, $fc
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $39, $f0, $f1, $f0, $fc, $f2, $f3, $f2, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $f1, $f0, $f1, $39, $f3, $f2, $f3, $fc, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $38, $f6, $38, $f6, $38, $f6, $38, $f6, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $39, $39, $39, $39, $fc, $fc, $fc, $fc, $f1, $f0, $f1, $39, $f3, $f2, $f3, $fc
.byte $3a, $36, $3a, $36, $3b, $37, $3b, $37, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $fc, $36, $3a, $36, $fc, $37, $3b, $37, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $3a, $36, $3a, $fc, $3b, $37, $3b, $fc, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $c0, $c2, $c4, $c6, $c1, $c3, $c5, $c7, $e0, $e2, $e4, $e6, $e1, $e3, $e5, $e7
.byte $c8, $ca, $cc, $ce, $c9, $cb, $cd, $cf, $e8, $ea, $ec, $ee, $e9, $eb, $ed, $ef
.byte $58, $5a, $5c, $5e, $59, $5b, $5d, $5f, $78, $7a, $7c, $7e, $f3, $7b, $7d, $f2
.byte $f1, $7b, $7d, $f0, $f3, $7b, $7d, $f2, $f1, $7b, $7d, $f0, $f3, $7b, $7d, $f2
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $51, $53, $f3, $f2
.byte $70, $72, $f1, $f0, $71, $73, $f3, $f2, $90, $92, $f1, $f0, $91, $93, $f3, $f2
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $f3, $f2, $55, $57
.byte $f1, $f0, $74, $76, $f3, $f2, $75, $77, $f1, $f0, $94, $96, $f3, $f2, $95, $97
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $9a, $ca, $f3, $f2, $98, $ca
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $ca, $ca, $9b, $ca, $ca, $ca, $99, $ca
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $ca, $ca, $cc, $ce, $ca, $ca, $ca, $ca
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $cc, $ce, $f3, $f2
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $50, $50, $f3, $f2, $6d, $cd
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $50, $50, $f1, $f0, $cd, $4b, $f3, $f2
.byte $f1, $f0, $98, $ca, $f3, $f2, $9a, $ca, $f1, $f0, $f1, $9a, $f3, $f2, $f3, $9a
.byte $ca, $ca, $ca, $99, $ca, $ca, $ca, $ca, $ca, $ca, $9b, $ca, $ca, $ca, $ca, $99
.byte $ca, $ca, $ca, $ca, $99, $ca, $ca, $ca, $ca, $ca, $99, $ca, $ca, $ca, $ca, $99
.byte $29, $28, $4e, $f0, $ca, $29, $2a, $4e, $99, $ca, $28, $2a, $ca, $99, $29, $28
.byte $f1, $f0, $3c, $3e, $f3, $f2, $3d, $3f, $4a, $f0, $60, $62, $6a, $4d, $61, $63
.byte $44, $46, $f1, $f0, $45, $47, $f3, $f2, $64, $66, $f1, $f0, $65, $67, $f3, $f2
.byte $f1, $f0, $f1, $9a, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $ca, $ca, $ca, $ca, $9a, $ca, $ca, $ca, $f1, $f0, $f1, $f0, $4f, $ca, $24, $24
.byte $99, $ca, $ca, $ca, $ca, $99, $ca, $ca, $6b, $6e, $6e, $99, $24, $24, $24, $24
.byte $ca, $99, $ca, $29, $ca, $ca, $9b, $ca, $ca, $ca, $ca, $99, $99, $ca, $ca, $ca
.byte $28, $e1, $c0, $c2, $2a, $56, $c1, $c3, $29, $9f, $e0, $e2, $99, $29, $28, $e3
.byte $c4, $c6, $f1, $f0, $c5, $c7, $f3, $f2, $e4, $e6, $f1, $f0, $e5, $e7, $f3, $f2
.byte $f1, $f0, $f1, $4f, $f3, $f2, $f3, $68, $f1, $f0, $f1, $48, $f3, $f2, $f3, $48
.byte $6f, $25, $26, $cd, $4d, $24, $cd, $cd, $c8, $24, $cd, $cd, $c9, $24, $cd, $cd
.byte $24, $24, $2e, $cd, $24, $24, $2e, $cd, $ed, $2e, $2e, $ee, $cd, $2e, $2e, $2e
.byte $cd, $99, $ca, $ca, $cd, $cd, $9b, $ca, $cd, $cd, $cd, $9b, $ef, $cd, $cd, $9b
.byte $9b, $ca, $29, $2a, $ca, $99, $ca, $2b, $ca, $9b, $ca, $2b, $ca, $9b, $ca, $2b
.byte $2c, $48, $f1, $f0, $2d, $4b, $f3, $f2, $28, $4a, $f1, $f0, $2a, $6a, $f3, $f2
.byte $f1, $f0, $f1, $48, $f3, $f2, $f3, $48, $f1, $f0, $f1, $48, $f3, $f2, $4f, $4b
.byte $54, $24, $cd, $cd, $6d, $e8, $ea, $cd, $49, $e9, $eb, $cd, $6c, $cd, $27, $cd
.byte $cd, $ed, $2e, $2e, $cd, $cd, $ec, $2e, $cd, $cd, $cd, $ed, $cd, $cb, $6b, $6e
.byte $2e, $cd, $cd, $99, $2e, $2e, $2e, $2e, $2e, $2e, $2e, $2e, $6e, $6e, $6e, $6f
.byte $ca, $9b, $ca, $ca, $2e, $2e, $9b, $ca, $2f, $cd, $6d, $cd, $cd, $68, $4c, $cd
.byte $2b, $68, $f1, $f0, $9b, $48, $f3, $f2, $cd, $4b, $f1, $f0, $cd, $f2, $f3, $f2
.byte $f1, $f0, $54, $4f, $f3, $f2, $6f, $6d, $f1, $f0, $f1, $c9, $f3, $f2, $f3, $54
.byte $cd, $cd, $68, $cf, $cd, $52, $f3, $f2, $68, $f0, $f1, $f0, $4b, $f2, $f3, $f2
.byte $cd, $cb, $f1, $f0, $6d, $cb, $f3, $f2, $49, $cb, $f1, $f0, $4c, $cd, $4a, $f2
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $4d, $f1, $f0, $f1, $c8, $f3, $f2, $f3, $c9
.byte $cd, $69, $f1, $54, $cd, $4b, $f3, $6d, $68, $f0, $f1, $49, $48, $f2, $f3, $4c
.byte $cb, $f0, $f1, $f0, $cb, $f2, $f3, $f2, $cb, $f0, $f1, $f0, $cd, $4a, $f3, $f2
.byte $f1, $f0, $9a, $cd, $f3, $f2, $f3, $6d, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $4e, $f0, $f1, $f0, $cd, $4a, $f3, $f2, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $9a, $cd, $cd, $4e, $f3, $6d, $cd, $cd, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $f1, $f0, $9a, $cd, $4a, $f2, $f3, $6d, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $6a, $f0, $f1, $9a, $cd, $4e, $f3, $f2, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $cd, $6a, $f1, $f0, $6d, $cd, $4e, $f2, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $1b, $12, $10, $11, $87, $87, $87, $87, $15, $0e, $0f, $1d
.byte $87, $87, $87, $87, $1d, $24, $24, $02, $87, $87, $87, $87, $24, $24, $24, $01
.byte $87, $87, $87, $87, $1e, $19, $24, $24, $87, $87, $87, $87, $0d, $18, $20, $17
.byte $87, $87, $87, $87, $24, $24, $24, $03, $87, $87, $87, $87, $24, $24, $24, $05
.byte $0b, $0a, $0b, $0e, $87, $87, $87, $87, $87, $87, $87, $87, $87, $14, $0e, $22
.byte $15, $25, $19, $1b, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $18, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $38, $4d, $61, $63, $38, $e1, $c0, $c2, $38, $56, $c1, $c3, $38, $9f, $e0, $e2
.byte $38, $f6, $38, $e3, $38, $f6, $38, $f6, $38, $f6, $38, $f6, $38, $f6, $38, $f6
.byte $e5, $e7, $f1, $f0, $2c, $48, $f3, $f2, $2d, $4b, $f1, $f0, $38, $79, $f3, $f2
.byte $38, $f6, $38, $f6, $38, $f6, $38, $f6, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $51, $53, $51, $53
.byte $70, $72, $70, $72, $71, $73, $71, $73, $90, $92, $90, $92, $91, $93, $91, $93
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $55, $57, $55, $57
.byte $74, $76, $74, $76, $75, $77, $75, $77, $94, $96, $94, $96, $95, $97, $95, $97
.byte $39, $f0, $f1, $f0, $fc, $f2, $f3, $f2, $39, $f0, $50, $50, $fc, $f2, $6d, $cd
.byte $39, $f0, $3c, $3e, $fc, $f2, $3d, $3f, $39, $f0, $60, $62, $fc, $4d, $61, $63
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $10, $12, $14, $f2
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $11, $13, $16, $f2
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $1b, $18, $1e, $1e
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $f1, $f0, $f1, $f0, $15, $1a, $17, $19
.byte $f1, $f0, $f1, $f0, $f3, $f2, $1c, $1a, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $f1, $f0, $f1, $f0, $17, $f2, $1d, $18, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $50, $89, $89, $52, $4e, $79, $7f, $4f, $4e, $b8, $be, $4f, $54, $a1, $a1, $56
.byte $f1, $f0, $f1, $f0, $1e, $10, $f3, $1c, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $f1, $f0, $f1, $f0, $1d, $1a, $1a, $17, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $87, $87, $87, $19, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $15, $0e, $0a, $1c, $87, $87, $87, $87, $87, $87, $87, $87, $87, $12, $17, $19
.byte $0e, $87, $0c, $11, $87, $87, $87, $87, $87, $87, $87, $87, $1e, $1d, $87, $0d
.byte $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2, $ff, $00, $00, $00, $ff, $ff, $ff, $ff
.byte $39, $f0, $f1, $f0, $fc, $f2, $f3, $f2, $ff, $00, $00, $00, $ff, $ff, $ff, $ff
.byte $3a, $36, $3a, $36, $3b, $37, $3b, $37, $00, $00, $00, $ff, $ff, $ff, $ff, $ff
.byte $87, $87, $87, $87, $87, $87, $87, $87, $00, $00, $00, $00, $00, $00, $00, $00
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $0c, $18, $17
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $10, $1b, $0a, $1d
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $1e, $15, $0a, $1d
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $12, $18, $17, $1c
.byte $0a, $15, $15, $0e, $87, $87, $87, $87, $87, $87, $87, $87, $0a, $1d, $0a, $87
.byte $17, $10, $0e, $87, $87, $87, $87, $87, $87, $87, $87, $87, $20, $12, $1d, $11
.byte $87, $87, $87, $87, $87, $87, $87, $87, $61, $61, $61, $61, $63, $63, $63, $63
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $54, $56, $87, $87, $55, $57, $87
.byte $87, $87, $61, $87, $61, $61, $63, $61, $63, $63, $63, $63, $63, $63, $63, $63
.byte $87, $74, $76, $87, $87, $75, $77, $87, $87, $eb, $ed, $87, $eb, $ed, $eb, $ed
.byte $87, $87, $87, $87, $87, $61, $61, $87, $87, $63, $63, $87, $61, $63, $63, $61
.byte $87, $87, $87, $87, $87, $87, $87, $12, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $17, $87, $1d, $12, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $1d, $15, $0e, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $16, $18, $0d, $0e, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $1d, $11, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $0a, $17, $14, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $22, $18, $1e, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $1f, $0e, $1b, $22, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $55, $55, $55, $55, $55, $55, $55, $55
.byte $87, $87, $87, $87, $87, $87, $87, $87, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $16, $1e, $0c, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $11, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $1c, $0e, $0e, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $0a, $10, $0a, $12, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $17, $87, $17, $0e, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $21, $1d, $87, $10, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $0a, $16, $0e, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $1d, $18, $20, $0e
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $1b, $87, $18, $0f
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $1d, $11, $0e, $87
.byte $87, $87, $0f, $1e, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $14, $14, $22, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $19, $1b, $0e, $1c, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $0e, $17, $1d, $0e, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $0d, $87, $0b, $22, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $27, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $28, $29, $2a, $2b, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $2c, $2d, $2e, $2f, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $61, $87, $61, $61, $63, $61, $63, $63, $63, $63
.byte $87, $87, $87, $eb, $87, $ed, $eb, $ed, $87, $87, $87, $87, $87, $87, $87, $87
.byte $ed, $eb, $ed, $eb, $eb, $ed, $eb, $ed, $ed, $eb, $ed, $eb, $87, $87, $87, $87
.byte $ed, $eb, $ed, $eb, $eb, $ed, $eb, $ed, $ed, $eb, $ed, $eb, $eb, $ed, $eb, $ed
.byte $eb, $87, $87, $87, $ed, $ed, $eb, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $55, $55, $aa, $55, $ff, $ff, $ff, $ff
.byte $87, $87, $87, $87, $87, $87, $87, $87, $55, $aa, $55, $55, $ff, $ff, $ff, $ff
.byte $a8, $a9, $b8, $a8, $a5, $a6, $dc, $c8, $ad, $ae, $dc, $cc, $d9, $da, $cd, $ce
.byte $87, $87, $87, $87, $87, $87, $87, $87, $55, $55, $55, $55, $aa, $aa, $aa, $aa
.byte $39, $39, $39, $39, $fc, $fc, $fc, $fc, $f1, $f0, $f1, $f0, $f3, $f2, $f3, $f2
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $22, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $18, $1e, $87, $11, $87, $87, $87, $87, $87, $87, $87, $87, $0e, $1f, $0e, $1b
.byte $0a, $1f, $0e, $87, $87, $87, $87, $87, $87, $87, $87, $87, $22, $87, $1c, $12
.byte $0f, $12, $17, $0a, $87, $87, $87, $87, $87, $87, $87, $87, $17, $10, $15, $0e
.byte $15, $15, $22, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $0f, $15, $18
.byte $0c, $18, $17, $1a, $87, $87, $87, $87, $87, $87, $87, $87, $18, $1b, $87, $18
.byte $1e, $0e, $1b, $0e, $87, $87, $87, $87, $87, $87, $87, $87, $0f, $24, $24, $24
.byte $0d, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $1f, $48, $87, $87, $87, $1f, $87, $87, $87, $87
.byte $87, $87, $87, $98, $48, $48, $48, $99, $48, $48, $48, $9c, $87, $87, $87, $9d
.byte $9a, $87, $87, $87, $9b, $48, $48, $48, $9e, $48, $48, $48, $9f, $87, $87, $87
.byte $87, $87, $87, $87, $48, $f7, $87, $87, $f7, $87, $87, $87, $87, $87, $87, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $58, $5a, $87, $87, $59, $5b, $87
.byte $87, $87, $87, $87, $87, $87, $87, $87, $87, $5c, $5e, $87, $87, $5d, $5f, $87
.byte $44, $46, $48, $87, $45, $47, $49, $87, $64, $66, $68, $6a, $65, $67, $69, $6b
.byte $87, $87, $87, $87, $87, $87, $87, $87, $4a, $4a, $4a, $4a, $89, $89, $89, $89
.byte $87, $78, $7a, $87, $87, $79, $7b, $87, $87, $eb, $ed, $87, $eb, $ed, $eb, $ed
.byte $87, $87, $87, $87, $87, $87, $87, $86, $87, $87, $86, $fd, $86, $86, $fd, $fd
.byte $86, $88, $86, $88, $84, $84, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $84, $84
.byte $87, $87, $87, $87, $88, $87, $87, $87, $fd, $88, $87, $87, $fd, $84, $88, $88
.byte $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $aa, $aa, $aa, $aa, $55, $55, $55, $55
.byte $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $00, $00, $00, $00, $00, $ff, $00, $00
.byte $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $00, $00, $00, $00, $00, $00, $ff, $00
.byte $87, $87, $87, $87, $a0, $af, $af, $af, $a1, $a2, $a3, $a4, $a5, $d8, $a5, $a6
.byte $fd, $84, $84, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $fd, $85, $83, $85, $83
.byte $a5, $a7, $c5, $a9, $a5, $d8, $a5, $a6, $aa, $ac, $ad, $ae, $ab, $d9, $d9, $da
.byte $87, $87, $87, $87, $af, $b0, $b2, $d6, $dd, $b1, $b3, $db, $b4, $b6, $b5, $b7
.byte $b8, $a8, $a8, $ba, $dc, $c9, $a5, $b9, $bb, $b9, $a5, $bc, $df, $be, $bd, $da
.byte $87, $87, $87, $87, $c0, $c2, $af, $af, $de, $c1, $c3, $c3, $dc, $c9, $d9, $c6
.byte $7f, $87, $87, $87, $62, $7e, $87, $87, $80, $7f, $87, $87, $81, $62, $7e, $87
.byte $7d, $7f, $87, $87, $87, $7c, $7e, $87, $87, $7d, $7f, $87, $87, $87, $7c, $7e
.byte $b8, $a8, $c5, $c7, $dc, $c9, $d9, $d9, $dc, $cc, $cb, $c8, $cd, $ce, $c4, $d7
.byte $87, $87, $87, $87, $c0, $cf, $af, $af, $dc, $d0, $da, $af, $a5, $b9, $af, $af
.byte $82, $62, $7f, $87, $87, $80, $62, $7e, $87, $81, $62, $7f, $87, $82, $62, $62
.byte $87, $87, $87, $87, $87, $87, $87, $97, $87, $87, $87, $87, $7e, $87, $87, $87
.byte $96, $8a, $8c, $98, $99, $8b, $8d, $9a, $9e, $8e, $90, $9f, $9e, $8f, $91, $9f
.byte $87, $87, $7d, $7f, $9c, $87, $87, $7c, $87, $87, $87, $7d, $87, $87, $87, $87
.byte $87, $87, $87, $87, $7e, $87, $87, $97, $7f, $87, $87, $87, $7c, $7e, $87, $87
.byte $87, $87, $87, $87, $7e, $87, $87, $87, $7f, $87, $87, $87, $7c, $7e, $87, $87
.byte $a5, $b9, $af, $af, $a5, $d1, $ac, $ac, $dc, $d2, $ac, $ac, $df, $d9, $d9, $d9
.byte $87, $87, $80, $62, $87, $87, $81, $62, $87, $87, $82, $62, $87, $87, $87, $80
.byte $7f, $87, $87, $87, $62, $7e, $87, $87, $62, $7f, $87, $87, $62, $62, $7e, $87
.byte $9e, $92, $94, $9f, $9e, $93, $95, $9f, $9b, $9e, $9e, $9d, $4b, $9e, $9e, $60
.byte $87, $87, $87, $81, $87, $87, $87, $82, $87, $87, $87, $87, $87, $87, $87, $87
.byte $62, $62, $7f, $87, $62, $62, $62, $7e, $80, $62, $62, $7f, $87, $87, $87, $87
.byte $00, $00, $01, $01, $00, $00, $08, $2a, $01, $03, $02, $02, $1d, $3e, $76, $55
.byte $3e, $00, $00, $00, $00, $00, $00, $00, $7f, $01, $1f, $0e, $0e, $1f, $1f, $1f
.byte $00, $80, $e0, $f0, $f0, $c0, $00, $00, $80, $60, $10, $0c, $0f, $3f, $ff, $f7
.byte $10, $19, $01, $00, $00, $00, $00, $38, $cb, $83, $f3, $ff, $d7, $7c, $bf, $bf
.byte $00, $00, $03, $07, $07, $01, $00, $00, $00, $03, $04, $18, $f8, $fe, $ff, $f7
.byte $04, $cc, $c0, $00, $00, $00, $00, $0f, $e9, $e0, $e7, $ff, $75, $9f, $ff, $ff
.byte $00, $80, $c0, $c0, $c0, $80, $80, $00, $c0, $60, $20, $20, $20, $40, $40, $c0
.byte $00, $00, $00, $00, $00, $00, $00, $00, $80, $c0, $c0, $c0, $c0, $80, $00, $00
.byte $00, $00, $00, $00, $02, $02, $06, $07, $00, $00, $00, $01, $01, $01, $01, $03
.byte $03, $03, $01, $01, $00, $03, $01, $00, $05, $05, $07, $07, $03, $03, $01, $00
.byte $18, $39, $33, $77, $7f, $7f, $7f, $7f, $07, $4e, $de, $bd, $bf, $ff, $ff, $ff
.byte $ff, $f7, $f2, $fa, $78, $7c, $f6, $08, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $7f
.byte $70, $e1, $ef, $ff, $ff, $ff, $ff, $ff, $8c, $3e, $78, $ff, $ff, $ff, $ff, $ff
.byte $3f, $73, $47, $01, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $cf, $97, $b7
.byte $00, $80, $e0, $80, $00, $e0, $f8, $fc, $00, $00, $00, $70, $f8, $f8, $c4, $f0
.byte $e0, $f8, $7e, $7f, $39, $bc, $5e, $fe, $fe, $fe, $fe, $ff, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $0c, $0c, $0c, $0c, $0c, $0c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $7e, $63, $63, $7e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $7f, $63, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $0c, $0c, $0c, $0c, $0c, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $60, $60, $7e, $60, $60, $7f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $6b, $7f, $7f, $77, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1f, $30, $60, $67, $63, $33, $1f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $67, $7c, $6e, $67, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1c, $36, $63, $63, $7f, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7c, $66, $63, $63, $63, $66, $7c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $63, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $63, $7e, $60, $60, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $60, $60, $7e, $60, $60, $60, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $30, $30, $30, $30, $30, $30, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3c, $66, $60, $3e, $03, $63, $3e, $00
.byte $00, $7f, $ff, $ff, $55, $2a, $05, $00, $00, $00, $3f, $7f, $3f, $3f, $0f, $01
.byte $00, $00, $00, $00, $00, $00, $03, $05, $1f, $0f, $06, $00, $03, $07, $0c, $0b
.byte $07, $07, $03, $00, $00, $00, $01, $01, $0b, $0b, $0c, $07, $03, $07, $02, $00
.byte $3b, $07, $01, $02, $03, $01, $80, $c1, $bb, $7f, $fc, $f9, $38, $dc, $6e, $af
.byte $c3, $86, $0d, $0c, $0c, $0d, $56, $53, $af, $7f, $fe, $ff, $ff, $5e, $af, $af
.byte $ef, $f0, $80, $c0, $c0, $82, $09, $e5, $ef, $fd, $3d, $1d, $13, $2d, $66, $ea
.byte $f2, $00, $f5, $45, $e4, $28, $52, $e2, $f5, $f8, $0e, $be, $1f, $de, $bd, $f5
.byte $00, $00, $00, $00, $00, $00, $00, $00, $80, $e0, $f0, $f0, $f0, $f0, $e0, $a0
.byte $00, $e0, $b0, $f0, $e0, $00, $a0, $a0, $60, $10, $e8, $e8, $18, $b8, $50, $40
.byte $00, $03, $07, $0b, $35, $5a, $f4, $1b, $00, $00, $03, $03, $05, $1a, $74, $00
.byte $67, $1c, $29, $53, $b3, $04, $00, $00, $00, $00, $01, $03, $03, $07, $01, $00
.byte $1c, $c2, $f0, $98, $78, $ca, $06, $a6, $1f, $03, $10, $fb, $7b, $cb, $17, $57
.byte $8c, $1c, $fe, $ff, $cf, $1c, $79, $23, $6f, $1f, $ff, $ff, $ff, $ff, $ff, $3f
.byte $00, $00, $23, $99, $1f, $5f, $4f, $e7, $f7, $cf, $3f, $ff, $ff, $ff, $ff, $ff
.byte $ff, $79, $3c, $fc, $fd, $f1, $e0, $c0, $ff, $ff, $ff, $ff, $ff, $ff, $fc, $e0
.byte $f3, $f9, $f8, $fc, $fc, $9e, $c6, $e4, $ff, $ff, $ff, $fe, $fe, $fe, $fe, $fc
.byte $e0, $c0, $c0, $80, $80, $00, $00, $00, $f8, $f8, $f0, $e0, $c0, $00, $00, $00
.byte $ff, $ff, $d7, $eb, $d7, $eb, $d7, $eb, $00, $81, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ea, $d5, $ea, $d5, $ff, $ff, $00, $80, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $eb, $d7, $eb, $d7, $eb, $d7, $00, $81, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $57, $ab, $57, $ab, $ff, $ff, $00, $01, $ff, $ff, $ff, $ff, $ff, $ff
.byte $eb, $d7, $ab, $57, $ae, $5e, $fc, $f0, $ff, $7f, $ff, $ff, $fe, $fe, $fc, $f0
.byte $d7, $eb, $d5, $ea, $75, $7a, $3f, $0f, $ff, $fe, $ff, $ff, $7f, $7f, $3f, $0f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $e7, $ef, $ef, $00, $7c, $fe, $fe, $00, $18, $f7, $f7, $ff, $80, $7f, $7f, $fe
.byte $00, $fe, $aa, $d6, $aa, $d6, $fe, $00, $00, $fe, $ab, $d7, $ab, $d7, $ff, $7f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $01, $00, $00, $10, $00, $00, $00, $00, $00, $07, $0f, $0f
.byte $08, $45, $c2, $42, $02, $01, $01, $00, $37, $7a, $fd, $75, $28, $14, $0a, $06
.byte $01, $02, $08, $08, $08, $84, $84, $47, $01, $02, $07, $77, $f7, $7b, $7b, $b8
.byte $78, $88, $0c, $12, $11, $21, $21, $ff, $87, $77, $f3, $45, $aa, $54, $8a, $00
.byte $1f, $7f, $70, $e0, $c0, $c0, $c0, $c0, $1d, $5d, $60, $e0, $00, $c0, $c0, $00
.byte $f8, $fe, $0e, $07, $03, $03, $03, $03, $b8, $ba, $06, $07, $00, $03, $03, $00
.byte $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $00, $c0, $c0, $00, $c0, $c0
.byte $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $03, $03, $00, $03, $03
.byte $80, $40, $10, $10, $10, $21, $21, $e2, $80, $40, $e0, $ee, $ef, $de, $de, $1d
.byte $1e, $11, $30, $48, $88, $84, $84, $ff, $e1, $ee, $cf, $a2, $55, $2a, $51, $00
.byte $00, $00, $00, $00, $80, $00, $00, $08, $00, $00, $00, $00, $00, $e0, $f0, $f0
.byte $10, $e2, $43, $42, $80, $80, $80, $00, $ec, $1e, $bf, $ae, $54, $28, $50, $60
.byte $00, $ff, $ff, $ff, $ff, $bb, $55, $aa, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff
.byte $01, $29, $2d, $47, $cd, $2e, $27, $e1, $00, $39, $2c, $47, $5c, $2e, $27, $61
.byte $0f, $3f, $79, $70, $e0, $e0, $e0, $70, $00, $06, $18, $30, $20, $60, $60, $80
.byte $f1, $71, $fb, $7b, $fa, $be, $7c, $f5, $f1, $81, $fb, $83, $fa, $c6, $84, $39
.byte $c0, $e0, $e0, $80, $00, $00, $40, $c0, $00, $c0, $c0, $48, $70, $00, $c0, $c0
.byte $e0, $48, $38, $6e, $40, $9a, $be, $23, $e0, $58, $38, $6c, $40, $9e, $be, $23
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f
.byte $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $80, $40, $20, $1f, $1f, $1f, $1f, $1f
.byte $03, $1d, $17, $1e, $3d, $2a, $13, $2b, $03, $1f, $18, $00, $05, $1a, $39, $3a
.byte $ff, $fe, $fc, $f8, $f8, $f8, $f8, $f8, $00, $01, $03, $ff, $ff, $ff, $ff, $ff
.byte $c4, $ec, $ec, $0c, $c8, $4c, $e4, $a4, $c4, $0c, $0c, $0c, $c8, $4c, $e4, $a4
.byte $ff, $ff, $ff, $ff, $ff, $e0, $c0, $80, $1f, $1f, $1f, $1f, $1f, $1f, $3f, $7f
.byte $23, $37, $37, $30, $13, $32, $27, $25, $23, $30, $30, $30, $13, $32, $27, $25
.byte $f8, $f8, $f8, $f8, $f8, $04, $02, $01, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $c0, $b8, $e8, $78, $bc, $54, $c8, $d4, $c0, $f8, $18, $00, $a0, $58, $9c, $5c
.byte $1f, $f9, $7e, $4d, $df, $ff, $ff, $bb, $1c, $39, $7e, $4d, $df, $ff, $ff, $bb
.byte $66, $0f, $1f, $17, $3c, $35, $2a, $3f, $67, $0c, $10, $0b, $07, $05, $2a, $3f
.byte $00, $c0, $e0, $b0, $b0, $b0, $20, $60, $00, $00, $80, $c0, $c0, $c0, $c0, $80
.byte $a0, $f0, $aa, $55, $a8, $47, $3f, $ea, $40, $00, $7f, $ff, $f8, $c7, $3f, $ea
.byte $00, $03, $07, $0d, $0d, $0d, $04, $06, $00, $00, $01, $03, $03, $03, $03, $01
.byte $05, $0f, $55, $aa, $15, $e2, $fc, $57, $02, $00, $fe, $ff, $1f, $e3, $fc, $57
.byte $f8, $9f, $7e, $b2, $fb, $ff, $ff, $dd, $38, $9c, $7e, $b2, $fb, $ff, $ff, $dd
.byte $66, $f0, $f8, $e8, $3c, $ac, $54, $fc, $e6, $30, $08, $d0, $e0, $a0, $54, $fc
.byte $00, $10, $38, $7c, $3f, $00, $00, $01, $01, $00, $00, $00, $3f, $00, $00, $00
.byte $01, $01, $02, $05, $02, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
.byte $80, $40, $40, $21, $fc, $11, $10, $c8, $2a, $15, $0a, $03, $df, $03, $01, $00
.byte $c8, $c5, $8f, $ff, $8f, $cf, $c7, $c0, $00, $01, $0f, $0f, $0f, $0f, $07, $03
.byte $01, $02, $02, $44, $9f, $48, $88, $10, $54, $ac, $50, $e0, $fb, $e0, $c0, $80
.byte $90, $27, $e4, $fc, $ff, $ff, $e0, $00, $80, $00, $e1, $f0, $f0, $f0, $e0, $c0
.byte $00, $00, $00, $00, $fc, $00, $00, $00, $80, $00, $00, $00, $fc, $00, $00, $00
.byte $00, $00, $c0, $e0, $f0, $f8, $3c, $04, $00, $00, $00, $00, $40, $20, $10, $00
.byte $16, $1b, $31, $ee, $0a, $13, $67, $0f, $1e, $1b, $35, $6e, $0b, $17, $2f, $0f
.byte $1a, $1c, $1f, $1f, $0e, $07, $03, $00, $1a, $1f, $0a, $15, $0e, $07, $03, $00
.byte $df, $bf, $ff, $72, $a8, $e4, $ea, $94, $f1, $c8, $84, $42, $ed, $ee, $ee, $96
.byte $02, $00, $c0, $e0, $30, $00, $00, $c0, $03, $80, $a0, $50, $28, $00, $00, $c0
.byte $5d, $b4, $66, $02, $8f, $5e, $99, $31, $5d, $b4, $66, $8f, $df, $de, $d9, $b1
.byte $01, $01, $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00
.byte $c0, $00, $00, $80, $c0, $e0, $f0, $f8, $80, $00, $00, $c0, $e0, $b0, $58, $a8
.byte $f8, $bc, $de, $46, $34, $30, $10, $10, $54, $a8, $d4, $42, $34, $34, $10, $10
.byte $53, $2d, $1e, $3e, $3f, $3f, $3f, $1f, $71, $34, $0e, $0e, $1f, $1f, $3e, $1c
.byte $0f, $17, $09, $0f, $1f, $1f, $1f, $16, $0f, $17, $09, $0f, $1f, $1f, $1f, $16
.byte $c4, $c4, $c4, $ce, $5e, $1c, $e8, $f4, $04, $84, $44, $84, $5e, $1c, $1c, $f4
.byte $f4, $e4, $e4, $c4, $c4, $a4, $64, $e4, $f4, $e4, $e4, $c4, $c4, $a4, $64, $e4
.byte $23, $23, $23, $73, $7b, $3c, $13, $36, $20, $21, $22, $21, $78, $33, $2c, $29
.byte $36, $36, $2b, $2b, $37, $37, $36, $33, $09, $09, $24, $24, $08, $08, $29, $2c
.byte $ca, $b4, $b8, $7c, $fc, $1c, $e4, $f4, $8e, $2c, $b0, $70, $18, $e8, $18, $08
.byte $f6, $36, $e8, $e8, $b6, $b6, $34, $e4, $08, $c8, $10, $10, $48, $48, $c8, $18
.byte $3f, $3a, $1c, $1f, $07, $00, $03, $00, $3f, $32, $18, $1c, $07, $00, $03, $00
.byte $ff, $f8, $e0, $c3, $c7, $c7, $e3, $f1, $f8, $e0, $c7, $9c, $9b, $9b, $d9, $ef
.byte $55, $aa, $05, $c2, $e1, $03, $ff, $00, $55, $aa, $15, $3a, $9d, $03, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $5b, $5b, $5b, $5b, $5b, $5b, $5b, $5b
.byte $aa, $55, $a0, $43, $87, $c0, $ff, $00, $aa, $55, $a8, $5c, $b9, $c0, $ff, $ff
.byte $f5, $fb, $f5, $fb, $f5, $fb, $f5, $fb, $bf, $ff, $bf, $ff, $bf, $ff, $bf, $ff
.byte $fc, $5c, $38, $f8, $e0, $00, $c0, $00, $fc, $4c, $18, $38, $e0, $00, $c0, $00
.byte $ff, $1f, $07, $c3, $e3, $e3, $e3, $c7, $1f, $07, $fb, $3d, $cd, $cd, $cd, $9b
.byte $00, $03, $07, $07, $07, $07, $1f, $7f, $00, $00, $00, $00, $00, $00, $00, $00
.byte $4f, $03, $48, $7e, $7f, $7c, $7b, $37, $b0, $fc, $b6, $00, $00, $03, $04, $08
.byte $e8, $d5, $aa, $14, $a3, $8f, $38, $e7, $1c, $3f, $7f, $3e, $70, $03, $38, $60
.byte $ff, $df, $af, $40, $37, $3b, $98, $cc, $3f, $1f, $6f, $60, $07, $83, $40, $00
.byte $00, $42, $a8, $c0, $e0, $8e, $7f, $ff, $00, $e7, $fc, $00, $c0, $80, $0c, $5f
.byte $ff, $ff, $ff, $ff, $1f, $ef, $6f, $37, $eb, $b5, $de, $eb, $16, $ef, $67, $32
.byte $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $03, $03, $01, $00, $00, $00, $00, $00, $03, $03, $00, $00, $00, $00, $00
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $ff, $ff, $ff, $ff, $ff
.byte $01, $86, $f0, $9e, $43, $22, $11, $11, $00, $80, $f0, $7e, $3f, $1d, $0e, $0e
.byte $08, $08, $08, $11, $11, $12, $20, $20, $07, $07, $07, $0e, $0e, $0d, $1f, $1f
.byte $c0, $40, $c0, $c0, $c0, $78, $2f, $11, $40, $40, $c0, $c0, $c0, $f8, $df, $ef
.byte $91, $89, $88, $08, $10, $10, $21, $42, $6e, $76, $77, $f7, $ef, $ef, $de, $bd
.byte $00, $00, $00, $00, $00, $00, $00, $e0, $00, $00, $00, $00, $00, $00, $00, $e0
.byte $60, $20, $a0, $90, $91, $97, $17, $23, $e0, $c0, $40, $60, $60, $62, $e5, $c2
.byte $19, $1b, $17, $1b, $37, $2b, $37, $6f, $19, $1f, $1f, $1f, $3f, $3f, $3f, $7f
.byte $57, $6b, $56, $79, $60, $30, $38, $2e, $7f, $7f, $7f, $79, $60, $30, $38, $2e
.byte $e4, $e4, $e4, $c4, $c4, $c4, $c4, $c4, $e4, $e4, $e4, $c4, $c4, $c4, $c4, $c4
.byte $a4, $64, $a4, $64, $c4, $64, $70, $5c, $e4, $e4, $e4, $e4, $c4, $64, $70, $5c
.byte $2c, $27, $27, $23, $23, $23, $23, $23, $23, $20, $26, $23, $23, $23, $23, $23
.byte $25, $26, $25, $26, $23, $26, $0e, $3a, $27, $27, $27, $27, $23, $26, $0e, $3a
.byte $18, $f8, $e8, $d8, $ec, $d4, $ec, $f6, $e0, $08, $38, $f8, $fc, $fc, $fc, $fe
.byte $ea, $d6, $6a, $9e, $06, $0c, $1c, $74, $fe, $fe, $fe, $be, $1e, $0c, $1c, $74
.byte $07, $3e, $fe, $3f, $07, $03, $05, $0e, $07, $3f, $fe, $3f, $07, $03, $07, $0f
.byte $07, $9b, $9c, $97, $97, $9b, $cc, $cf, $0f, $9f, $bf, $bf, $bf, $bf, $df, $df
.byte $c0, $30, $b8, $6c, $f6, $ca, $a1, $71, $c0, $f0, $00, $70, $c8, $c4, $e2, $f0
.byte $e0, $d9, $39, $e9, $e9, $d9, $33, $f3, $f0, $f9, $fd, $fd, $fd, $fd, $fb, $fb
.byte $cf, $e6, $f1, $ad, $4b, $a2, $48, $8c, $df, $ef, $f7, $ee, $ec, $ec, $c4, $80
.byte $0c, $06, $21, $7d, $7d, $21, $01, $03, $00, $00, $00, $00, $7c, $20, $00, $00
.byte $f3, $67, $8f, $b2, $d5, $42, $11, $30, $fb, $f7, $ef, $77, $37, $37, $23, $01
.byte $30, $60, $84, $fe, $fe, $84, $80, $c0, $00, $00, $00, $00, $7e, $04, $00, $00
.byte $27, $07, $07, $17, $0b, $05, $02, $01, $18, $38, $18, $00, $00, $00, $00, $00
.byte $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $d6, $eb, $ed, $f4, $f0, $f8, $fc, $7e, $00, $00, $00, $00, $00, $00, $00, $00
.byte $bf, $5f, $23, $1c, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $17, $db, $cd, $e0, $70, $00, $00, $00, $15, $1b, $0d, $00, $00, $00, $00, $00
.byte $c0, $f0, $fb, $fc, $3f, $07, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $f8, $fc, $fc, $fe, $3e, $0f, $03, $00, $b0, $d8, $68, $b4, $3c, $0e, $02, $00
.byte $00, $00, $00, $80, $30, $fc, $7e, $07, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $60, $70, $f0, $d0, $d8, $dc, $5e, $00, $00, $00, $00, $01, $02, $00, $00
.byte $0e, $0f, $07, $07, $03, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $40, $40, $80, $80, $3f, $40, $ff, $3f, $38, $20, $40, $00, $3f, $7f, $ff, $ff
.byte $49, $12, $00, $c9, $ff, $ff, $7f, $0f, $bf, $ed, $36, $00, $00, $00, $00, $00
.byte $c0, $c0, $c0, $40, $f8, $07, $fc, $e1, $c3, $c0, $c0, $c0, $ff, $ff, $ff, $fe
.byte $28, $40, $03, $1f, $ff, $ff, $ff, $ff, $f7, $bc, $e0, $00, $00, $02, $20, $8b
.byte $23, $42, $42, $26, $06, $8e, $5e, $7e, $c1, $82, $00, $02, $12, $86, $c2, $c4
.byte $7e, $7e, $fe, $fc, $fc, $f8, $f0, $c0, $94, $04, $04, $28, $98, $30, $c0, $00
.byte $00, $00, $00, $00, $00, $00, $c0, $e0, $00, $00, $00, $00, $00, $00, $c0, $e0
.byte $e0, $7d, $7d, $fd, $fd, $fb, $76, $0e, $e0, $7c, $7c, $fc, $fc, $f8, $70, $00
.byte $00, $03, $0e, $1f, $3f, $4e, $32, $bd, $00, $00, $00, $00, $00, $00, $00, $00
.byte $be, $cf, $f1, $bf, $8f, $80, $c0, $c6, $00, $00, $00, $00, $00, $00, $00, $06
.byte $60, $5c, $ff, $3f, $3c, $33, $4f, $b3, $00, $00, $00, $00, $00, $00, $00, $00
.byte $cf, $bf, $cf, $fe, $f0, $01, $02, $e6, $00, $00, $00, $00, $00, $00, $00, $e0
.byte $00, $00, $80, $30, $e0, $c0, $a0, $f0, $00, $00, $00, $00, $00, $00, $00, $00
.byte $f0, $f0, $c0, $b0, $b8, $dc, $2e, $dc, $00, $00, $00, $00, $00, $00, $00, $c0
.byte $ff, $fe, $fc, $fc, $ff, $fc, $f8, $ff, $f2, $fc, $f9, $f9, $fc, $f8, $f3, $f0
.byte $00, $00, $00, $00, $01, $01, $03, $03, $00, $00, $00, $00, $01, $01, $03, $03
.byte $07, $07, $0f, $0f, $1f, $1f, $3f, $3f, $04, $04, $0e, $0e, $1f, $1f, $3f, $3f
.byte $7f, $7f, $f9, $f9, $f0, $f0, $e0, $e0, $7f, $7f, $f9, $f9, $f6, $f6, $ef, $ef
.byte $e0, $e0, $f0, $f0, $f8, $f8, $fc, $fc, $00, $00, $00, $00, $00, $00, $80, $80
.byte $fe, $fe, $ff, $ff, $ff, $ff, $7f, $7f, $c0, $c0, $e0, $e0, $f0, $f0, $78, $78
.byte $0f, $3f, $7f, $7f, $ff, $7f, $3f, $ff, $37, $cf, $bf, $bf, $7f, $3f, $df, $1f
.byte $00, $00, $00, $00, $80, $80, $c0, $c0, $00, $00, $00, $00, $00, $00, $00, $00
.byte $03, $78, $3e, $3f, $6f, $37, $38, $1f, $00, $08, $3e, $2f, $73, $38, $3f, $17
.byte $0f, $08, $07, $01, $01, $00, $00, $38, $08, $0f, $07, $01, $01, $00, $00, $00
.byte $c0, $f0, $3c, $8e, $f7, $f9, $7e, $be, $00, $c0, $38, $8c, $76, $79, $be, $ce
.byte $cf, $7f, $87, $fb, $3e, $c1, $3f, $03, $33, $87, $fb, $3c, $c1, $ff, $3f, $00
.byte $02, $05, $0f, $1f, $1f, $3f, $bf, $6a, $00, $00, $07, $0f, $0f, $1f, $9f, $3e
.byte $54, $6a, $bd, $ce, $f5, $7e, $bd, $ce, $7e, $7e, $bf, $cf, $77, $bf, $cf, $3f
.byte $00, $c0, $30, $f8, $f8, $c8, $00, $00, $00, $00, $30, $f8, $f8, $c8, $00, $00
.byte $01, $03, $03, $83, $86, $ce, $4e, $dc, $01, $03, $03, $83, $86, $ce, $ce, $dc
.byte $00, $03, $0c, $1f, $1f, $13, $00, $00, $00, $00, $0c, $1f, $1f, $13, $00, $00
.byte $80, $c0, $c0, $c1, $61, $73, $72, $3b, $80, $c0, $c0, $c1, $61, $73, $73, $3b
.byte $40, $a0, $f0, $f8, $f8, $fc, $fd, $56, $00, $00, $e0, $f0, $f0, $f8, $f9, $7c
.byte $2a, $56, $bd, $73, $af, $7e, $bd, $73, $7e, $7e, $fd, $f3, $ee, $fd, $f3, $fc
.byte $03, $0f, $3c, $71, $ef, $9f, $7e, $7d, $00, $03, $1c, $31, $6e, $9e, $7d, $73
.byte $f3, $fe, $e1, $df, $7c, $83, $fc, $c0, $cc, $e1, $df, $3c, $83, $ff, $fc, $00
.byte $c0, $1e, $7c, $fc, $f6, $ec, $1c, $f8, $00, $10, $7c, $f4, $ce, $1c, $fc, $e8
.byte $f0, $10, $e0, $80, $80, $00, $00, $1c, $10, $f0, $e0, $80, $80, $00, $00, $00
.byte $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $01, $02, $01, $02, $01, $00, $00, $00, $01, $03, $03, $03, $01, $00
.byte $6f, $38, $1f, $08, $06, $0c, $06, $2a, $0f, $00, $00, $00, $00, $00, $00, $3f
.byte $15, $0a, $45, $aa, $55, $aa, $51, $00, $3f, $1f, $ef, $fe, $fd, $fb, $fb, $01
.byte $ee, $1e, $fd, $c3, $37, $67, $33, $a9, $e0, $00, $01, $03, $07, $07, $03, $fd
.byte $54, $2a, $15, $8a, $55, $aa, $55, $a8, $7e, $7e, $3f, $df, $ff, $ff, $ff, $f8
.byte $f4, $f8, $fc, $fe, $f0, $e8, $f8, $e0, $f0, $f8, $fc, $fe, $f0, $e8, $f8, $e0
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $07, $07, $0f, $0f, $1f, $1f, $3e, $3e, $07, $07, $0f, $0f, $1f, $1f, $3e, $3e
.byte $7c, $7c, $f8, $f8, $70, $70, $20, $20, $7d, $7d, $fb, $fb, $77, $77, $2f, $2f
.byte $c0, $c0, $80, $80, $00, $00, $00, $00, $df, $df, $be, $be, $7c, $7c, $f8, $f8
.byte $07, $07, $0f, $0f, $00, $00, $00, $00, $f0, $f0, $e0, $e0, $ff, $ff, $ff, $ff
.byte $3f, $3f, $1f, $1f, $0f, $0f, $07, $07, $3c, $3c, $1e, $1e, $0f, $0f, $07, $07
.byte $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff
.byte $e0, $e0, $f0, $f0, $f8, $f8, $fc, $fc, $00, $00, $00, $00, $00, $00, $80, $80
.byte $fe, $fe, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $fe, $fe, $fc, $fc
.byte $7c, $4e, $06, $0c, $1b, $37, $3f, $6e, $04, $0e, $06, $0c, $18, $33, $37, $26
.byte $4f, $df, $9f, $df, $fd, $6a, $1d, $01, $47, $4f, $8f, $cf, $ff, $7e, $1d, $01
.byte $08, $1d, $3e, $ff, $ff, $ff, $1f, $ed, $03, $0d, $1e, $3f, $ff, $ff, $1f, $2f
.byte $f6, $f5, $f6, $75, $60, $df, $ff, $f1, $f7, $f7, $f7, $77, $60, $d0, $ff, $f1
.byte $3e, $e1, $07, $fb, $fd, $d5, $aa, $55, $e6, $99, $07, $fb, $fd, $fd, $fe, $fd
.byte $a0, $40, $80, $00, $00, $00, $c0, $e0, $f0, $c0, $80, $00, $00, $00, $00, $c0
.byte $ec, $ec, $ec, $ec, $68, $a0, $b0, $b0, $ec, $ec, $ec, $ec, $e8, $e0, $f0, $f0
.byte $b0, $d0, $70, $30, $38, $28, $14, $1e, $f0, $f0, $70, $30, $38, $38, $1c, $1e
.byte $37, $37, $37, $37, $16, $05, $0d, $0d, $37, $37, $37, $37, $17, $07, $0f, $0f
.byte $0d, $0b, $0e, $0c, $1c, $14, $28, $78, $0f, $0f, $0e, $0c, $1c, $1c, $38, $78
.byte $7c, $87, $e0, $df, $bf, $ab, $55, $aa, $67, $99, $e0, $df, $bf, $bf, $7f, $bf
.byte $05, $02, $00, $00, $00, $00, $03, $07, $0f, $07, $00, $00, $00, $00, $00, $03
.byte $10, $b8, $7c, $ff, $ff, $ff, $f8, $b7, $c0, $b0, $78, $fc, $ff, $ff, $f8, $f4
.byte $6f, $af, $6f, $2f, $06, $fb, $ff, $8f, $ef, $ef, $ef, $2f, $07, $0b, $ff, $8f
.byte $3e, $72, $60, $30, $d8, $ec, $fc, $76, $20, $70, $60, $30, $18, $cc, $ec, $64
.byte $f2, $fb, $f9, $fb, $bf, $56, $b8, $80, $e2, $f2, $f1, $f3, $ff, $fe, $f8, $80
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $03, $73, $fb, $7f, $39, $01, $01, $01, $03, $73, $9b, $6f, $39, $01, $01, $01
.byte $00, $00, $1c, $3e, $fc, $b8, $80, $80, $00, $00, $1c, $32, $ec, $b8, $80, $80
.byte $e6, $ef, $ef, $00, $7e, $fe, $fe, $00, $09, $f7, $f7, $f7, $81, $7f, $7f, $ff
.byte $00, $fc, $fe, $fe, $54, $a8, $40, $00, $00, $00, $f8, $fc, $f8, $f8, $e0, $00
.byte $be, $9e, $de, $de, $61, $31, $1d, $07, $fe, $ea, $fe, $74, $61, $31, $1d, $07
.byte $fc, $fa, $f6, $f6, $8c, $98, $f0, $80, $fc, $aa, $f6, $54, $8c, $98, $f0, $80
.byte $00, $00, $38, $7c, $3f, $1d, $01, $01, $00, $00, $38, $4c, $37, $1d, $01, $01
.byte $c0, $ce, $df, $fe, $9c, $80, $80, $80, $c0, $ce, $d9, $f6, $9c, $80, $80, $80
.byte $00, $ce, $ce, $00, $00, $fe, $fe, $00, $00, $ce, $ef, $67, $00, $fe, $ff, $7f
.byte $80, $c0, $c0, $e0, $e0, $f0, $f0, $f8, $00, $80, $80, $40, $c0, $60, $a0, $d0
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1c, $26, $63, $63, $63, $32, $1c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $0c, $1c, $0c, $0c, $0c, $0c, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $07, $1e, $3c, $70, $7f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $06, $0c, $1e, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $0e, $1e, $36, $66, $7f, $06, $06, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $60, $7e, $03, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1e, $30, $60, $7e, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $63, $06, $0c, $18, $18, $18, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3c, $62, $72, $3c, $4f, $43, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $3f, $03, $06, $3c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1c, $36, $63, $63, $7f, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $7e, $63, $63, $7e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1e, $33, $60, $60, $60, $33, $1e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7c, $66, $63, $63, $63, $66, $7c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $60, $60, $7e, $60, $60, $7f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $60, $60, $7e, $60, $60, $60, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1f, $30, $60, $67, $63, $33, $1f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $7f, $63, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $0c, $0c, $0c, $0c, $0c, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $03, $03, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $66, $6c, $78, $7c, $6e, $67, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $30, $30, $30, $30, $30, $30, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $77, $7f, $7f, $6b, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $73, $7b, $7f, $6f, $67, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $63, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $63, $7e, $60, $60, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $63, $6f, $66, $3d, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $67, $7c, $6e, $67, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3c, $66, $60, $3e, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $0c, $0c, $0c, $0c, $0c, $0c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $63, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $77, $3e, $1c, $08, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $6b, $7f, $7f, $77, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $77, $3e, $1c, $3e, $77, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $33, $33, $33, $1e, $0c, $0c, $0c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $07, $0e, $1c, $38, $70, $7f, $00
.byte $5a, $db, $42, $66, $96, $f6, $90, $99, $24, $24, $3c, $18, $09, $09, $6f, $66
.byte $03, $0f, $1a, $26, $56, $76, $90, $99, $00, $00, $04, $18, $09, $09, $6f, $66
.byte $58, $d1, $47, $4f, $9f, $bf, $3f, $7f, $24, $20, $20, $03, $07, $0f, $1f, $1f
.byte $5a, $3b, $a2, $96, $ce, $e6, $f1, $fc, $24, $04, $9c, $88, $c1, $e1, $f0, $fc
.byte $af, $b3, $bf, $cf, $f3, $ff, $ff, $ff, $df, $df, $ff, $ff, $ff, $ff, $ff, $ff
.byte $1f, $bf, $bf, $bf, $9f, $cf, $e3, $f8, $1f, $9f, $9f, $8f, $87, $c1, $e0, $f8
.byte $c7, $db, $dc, $ef, $f3, $ff, $ff, $ff, $ff, $ef, $ef, $ff, $ff, $ff, $ff, $ff
.byte $7f, $7f, $7f, $3f, $bf, $9f, $c7, $f1, $3f, $3f, $3f, $1f, $9f, $87, $c1, $f0
.byte $3f, $bb, $9d, $df, $cf, $ed, $e7, $f7, $0c, $0c, $0e, $06, $87, $87, $c3, $c2
.byte $f3, $fb, $f9, $f9, $fd, $fd, $fe, $fe, $e2, $e2, $f0, $f0, $f0, $f8, $f8, $fc
.byte $40, $20, $18, $81, $40, $20, $18, $00, $99, $c3, $66, $3c, $99, $c3, $66, $3c
.byte $43, $2f, $1f, $bf, $7f, $7f, $ff, $ff, $9b, $cf, $1f, $3f, $ff, $7f, $ff, $ff
.byte $ff, $ff, $d7, $eb, $d7, $eb, $d7, $eb, $00, $81, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ea, $d5, $ea, $d5, $ff, $ff, $00, $80, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $eb, $d7, $eb, $d7, $eb, $d7, $00, $81, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $57, $ab, $57, $ab, $ff, $ff, $00, $01, $ff, $ff, $ff, $ff, $ff, $ff
.byte $eb, $d7, $ab, $57, $ae, $5e, $fc, $f0, $ff, $7f, $ff, $ff, $fe, $fe, $fc, $f0
.byte $d7, $eb, $d5, $ea, $75, $7a, $3f, $0f, $ff, $fe, $ff, $ff, $7f, $7f, $3f, $0f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $e6, $ef, $ef, $00, $7e, $fe, $fe, $00, $09, $f7, $f7, $ff, $81, $7f, $7f, $ff
.byte $00, $fe, $aa, $d6, $aa, $d6, $fe, $00, $00, $fe, $ab, $d7, $ab, $d7, $ff, $7f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $0b, $05, $0b, $15, $1b, $17, $0b, $16, $0b, $05, $0b, $15, $1b, $17, $0b, $16
.byte $2a, $34, $2d, $35, $2d, $55, $6e, $56, $2a, $34, $2c, $34, $2c, $54, $6e, $56
.byte $da, $bd, $7a, $b5, $7a, $c0, $1f, $7e, $da, $bd, $7a, $b5, $7a, $c0, $00, $00
.byte $f9, $f7, $f7, $e0, $8f, $3f, $7c, $fb, $00, $30, $71, $e0, $80, $00, $0c, $38
.byte $1f, $7f, $70, $e0, $c0, $c0, $c0, $c0, $1d, $5d, $60, $e0, $00, $c0, $c0, $00
.byte $f8, $fe, $0e, $07, $03, $03, $03, $03, $b8, $ba, $06, $07, $00, $03, $03, $00
.byte $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $00, $c0, $c0, $00, $c0, $c0
.byte $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $03, $03, $00, $03, $03
.byte $ff, $ff, $ff, $7f, $80, $3f, $ff, $7f, $ff, $ff, $ff, $7f, $80, $00, $03, $1f
.byte $ff, $ff, $c0, $1f, $ff, $3f, $ff, $ff, $7f, $ff, $c0, $00, $01, $0f, $3f, $ff
.byte $86, $87, $cf, $df, $3f, $fe, $fe, $fc, $80, $80, $c3, $c7, $0f, $1e, $fe, $fc
.byte $fb, $f7, $0f, $ff, $fe, $fe, $fc, $f0, $f8, $f0, $03, $07, $fe, $fe, $fc, $f0
.byte $d0, $b0, $f0, $b0, $d0, $f0, $d0, $b0, $e0, $e0, $e0, $e0, $e0, $e0, $e0, $e0
.byte $0b, $0d, $0f, $0d, $0b, $0f, $0b, $0d, $07, $07, $07, $07, $07, $07, $07, $07
.byte $80, $80, $c0, $c0, $e0, $e0, $e0, $f0, $00, $00, $00, $80, $80, $c0, $c0, $c0
.byte $b0, $60, $e0, $e0, $40, $c0, $80, $80, $f0, $e0, $e0, $e0, $c0, $c0, $80, $80
.byte $0e, $05, $06, $07, $02, $03, $01, $01, $0f, $07, $07, $07, $03, $03, $01, $01
.byte $01, $01, $03, $03, $03, $07, $07, $07, $00, $00, $01, $01, $01, $01, $03, $03
.byte $80, $e0, $f8, $7c, $bc, $de, $be, $df, $00, $00, $c0, $f0, $f8, $f8, $fc, $fc
.byte $01, $07, $1f, $3e, $3d, $7e, $7d, $fb, $00, $00, $03, $0f, $1f, $1f, $3f, $3f
.byte $44, $ee, $ff, $55, $ee, $ff, $54, $00, $00, $00, $bb, $bb, $00, $bb, $fe, $54
.byte $03, $1d, $17, $1e, $3d, $2a, $13, $2b, $03, $1f, $18, $00, $05, $1a, $39, $3a
.byte $ff, $fc, $f0, $e0, $c0, $c0, $80, $80, $ff, $fc, $f0, $e0, $c0, $c0, $80, $80
.byte $c4, $ec, $ec, $0c, $c8, $4c, $e4, $a4, $c4, $0c, $0c, $0c, $c8, $4c, $e4, $a4
.byte $df, $ef, $df, $ef, $f7, $ef, $f7, $ff, $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f
.byte $23, $37, $37, $30, $13, $32, $27, $25, $23, $30, $30, $30, $13, $32, $27, $25
.byte $b1, $a8, $d2, $cd, $95, $aa, $b3, $6a, $1b, $98, $f0, $c0, $8c, $99, $99, $3a
.byte $c0, $b8, $e8, $78, $bc, $54, $c8, $d4, $c0, $f8, $18, $00, $a0, $58, $9c, $5c
.byte $1f, $f9, $7e, $4d, $df, $ff, $ff, $bb, $1c, $39, $7e, $4d, $df, $ff, $ff, $bb
.byte $66, $0f, $1f, $17, $3c, $35, $2a, $3f, $67, $0c, $10, $0b, $07, $05, $2a, $3f
.byte $00, $c0, $e0, $b0, $b0, $b0, $20, $60, $00, $00, $80, $c0, $c0, $c0, $c0, $80
.byte $a0, $f0, $aa, $55, $a8, $47, $3f, $ea, $40, $00, $7f, $ff, $f8, $c7, $3f, $ea
.byte $00, $03, $07, $0d, $0d, $0d, $04, $06, $00, $00, $01, $03, $03, $03, $03, $01
.byte $05, $0f, $55, $aa, $15, $e2, $fc, $57, $02, $00, $fe, $ff, $1f, $e3, $fc, $57
.byte $f8, $9f, $7e, $b2, $fb, $ff, $ff, $dd, $38, $9c, $7e, $b2, $fb, $ff, $ff, $dd
.byte $66, $f0, $f8, $e8, $3c, $ac, $54, $fc, $e6, $30, $08, $d0, $e0, $a0, $54, $fc
.byte $6d, $55, $ab, $5b, $c0, $9f, $ba, $55, $6c, $54, $a9, $59, $c0, $80, $8f, $7f
.byte $2a, $41, $9e, $3c, $55, $2a, $01, $73, $7f, $e1, $c0, $8d, $7d, $7b, $8b, $00
.byte $f7, $f4, $e1, $8b, $61, $ed, $96, $06, $71, $f0, $e1, $8e, $0b, $28, $9c, $a0
.byte $2a, $55, $fd, $33, $4d, $ff, $f3, $0b, $78, $79, $a0, $02, $cc, $f2, $02, $0f
.byte $e0, $0a, $56, $36, $89, $6f, $9f, $ff, $e0, $0c, $e4, $60, $29, $0f, $9f, $ff
.byte $7f, $7f, $7e, $7d, $7b, $3f, $be, $bf, $7f, $7f, $7e, $7d, $7b, $3f, $3e, $3f
.byte $00, $50, $d8, $38, $f8, $f0, $f0, $f0, $00, $80, $98, $38, $f8, $f0, $f0, $f0
.byte $f0, $d0, $a8, $58, $f8, $c8, $10, $90, $f0, $d0, $a8, $58, $f8, $c8, $10, $90
.byte $fe, $fe, $fe, $fc, $fc, $fc, $f8, $f8, $fe, $fe, $fe, $fc, $fc, $fc, $f8, $f8
.byte $f8, $f0, $f0, $f0, $e0, $e0, $e0, $c0, $f8, $f0, $f0, $f0, $e0, $e0, $e0, $c0
.byte $f0, $f0, $f8, $f8, $fc, $fc, $fc, $fe, $e0, $e0, $e0, $f0, $f0, $f8, $f8, $f8
.byte $f7, $3d, $0f, $01, $00, $00, $00, $00, $f7, $3d, $0f, $01, $00, $00, $00, $00
.byte $0f, $0f, $1f, $1f, $3f, $3f, $3f, $7f, $07, $07, $07, $0f, $0f, $1f, $1f, $1f
.byte $6f, $37, $3b, $37, $1b, $1d, $0b, $0d, $6f, $37, $3b, $37, $1b, $1d, $0b, $0d
.byte $df, $75, $ae, $ff, $00, $00, $00, $00, $df, $75, $ae, $ff, $00, $00, $00, $00
.byte $ef, $bc, $f0, $80, $00, $00, $00, $00, $ef, $bc, $f0, $80, $00, $00, $00, $00
.byte $53, $2d, $1e, $3e, $3f, $3f, $3f, $1f, $71, $34, $0e, $0e, $1f, $1f, $3e, $1c
.byte $0f, $17, $09, $0f, $1f, $1f, $1f, $16, $0f, $17, $09, $0f, $1f, $1f, $1f, $16
.byte $c4, $c4, $c4, $ce, $5e, $9c, $e8, $f4, $04, $84, $40, $84, $5e, $9c, $1c, $f4
.byte $f4, $e4, $e4, $d4, $d4, $b4, $74, $e4, $f4, $e4, $e4, $d4, $d4, $b4, $74, $e4
.byte $23, $23, $23, $73, $7b, $3c, $13, $36, $20, $21, $22, $21, $78, $33, $2c, $29
.byte $36, $36, $2b, $2b, $37, $37, $36, $33, $09, $09, $24, $24, $08, $08, $29, $2c
.byte $ca, $b4, $f8, $7c, $fc, $1c, $e4, $f4, $8e, $2c, $f0, $70, $18, $e8, $18, $08
.byte $f6, $36, $e8, $e8, $b6, $b6, $34, $e4, $08, $c8, $10, $10, $48, $48, $c8, $18
.byte $3f, $3a, $1c, $1f, $07, $00, $03, $00, $3f, $32, $18, $1c, $07, $00, $03, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $55, $aa, $05, $c2, $e1, $03, $ff, $00, $55, $aa, $15, $3a, $9d, $03, $ff, $ff
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $5b, $5b, $5b, $5b, $5b, $5b, $5b, $5b
.byte $aa, $55, $a0, $43, $87, $c0, $ff, $00, $aa, $55, $a8, $5c, $b9, $c0, $ff, $ff
.byte $f5, $fb, $f5, $fb, $f5, $fb, $f5, $fb, $bf, $ff, $bf, $ff, $bf, $ff, $bf, $ff
.byte $fc, $5c, $38, $f8, $e0, $00, $c0, $00, $fc, $4c, $18, $38, $e0, $00, $c0, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $03, $07, $07, $07, $07, $1f, $2f, $00, $00, $00, $00, $00, $00, $00, $50
.byte $43, $09, $5e, $7e, $7c, $7b, $7b, $37, $bc, $f6, $a0, $00, $03, $04, $04, $08
.byte $e8, $d5, $aa, $14, $a3, $8f, $38, $e7, $1c, $3f, $7f, $3e, $70, $03, $38, $60
.byte $ff, $df, $ef, $60, $30, $38, $d8, $cc, $3f, $1f, $0f, $00, $00, $80, $00, $00
.byte $00, $42, $a8, $c0, $e0, $8e, $7f, $ff, $00, $e7, $fc, $00, $c0, $80, $0c, $5f
.byte $ff, $ff, $ff, $ff, $1f, $0f, $0f, $07, $eb, $b5, $de, $eb, $16, $0f, $07, $02
.byte $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $03, $03, $01, $00, $00, $00, $00, $00, $03, $03, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $01, $86, $f0, $9e, $43, $22, $11, $11, $00, $80, $f0, $7e, $3f, $1d, $0e, $0e
.byte $08, $08, $08, $11, $11, $12, $20, $20, $07, $07, $07, $0e, $0e, $0d, $1f, $1f
.byte $c0, $40, $c0, $c0, $c0, $78, $2f, $11, $40, $40, $c0, $c0, $c0, $f8, $df, $ef
.byte $91, $89, $88, $08, $10, $10, $21, $42, $6e, $76, $77, $f7, $ef, $ef, $de, $bd
.byte $00, $00, $00, $00, $00, $00, $00, $e0, $00, $00, $00, $00, $00, $00, $00, $e0
.byte $60, $20, $a0, $90, $91, $97, $17, $23, $e0, $c0, $40, $60, $60, $62, $e5, $c2
.byte $19, $1b, $17, $1b, $37, $2b, $37, $6f, $19, $1f, $1f, $1f, $3f, $3f, $3f, $7f
.byte $57, $6b, $56, $79, $60, $30, $38, $2e, $7f, $7f, $7f, $79, $70, $30, $38, $2e
.byte $e4, $e4, $e4, $c4, $c4, $c4, $c4, $c4, $e4, $e4, $e4, $c4, $c4, $c4, $c4, $c4
.byte $a4, $64, $a4, $64, $c4, $64, $70, $5c, $e4, $e4, $e4, $e4, $c4, $64, $70, $5c
.byte $2c, $27, $27, $23, $23, $23, $23, $23, $23, $20, $26, $23, $23, $23, $23, $23
.byte $25, $26, $25, $26, $23, $26, $0e, $3a, $27, $27, $27, $27, $23, $26, $0e, $3a
.byte $18, $f8, $e8, $d8, $ec, $d4, $ec, $f6, $e0, $08, $38, $f8, $fc, $fc, $fc, $fe
.byte $ea, $d6, $6a, $9e, $06, $0c, $1c, $74, $fe, $fe, $fe, $be, $1e, $0c, $1c, $74
.byte $00, $1f, $3f, $7f, $7f, $7f, $3f, $1f, $00, $00, $0f, $1f, $3f, $3f, $1f, $1f
.byte $00, $3f, $7f, $7f, $7f, $3f, $9f, $c7, $00, $00, $1f, $3f, $3f, $1f, $9f, $c7
.byte $00, $01, $03, $07, $07, $07, $03, $01, $00, $00, $00, $01, $03, $03, $01, $01
.byte $00, $e7, $cf, $df, $df, $df, $cf, $e7, $00, $00, $c3, $c7, $cf, $cf, $cf, $e7
.byte $57, $6f, $37, $bb, $97, $db, $cd, $eb, $57, $6f, $37, $bb, $97, $db, $cd, $eb
.byte $6f, $37, $9b, $cb, $a5, $d3, $d9, $ec, $6f, $37, $9b, $cb, $a5, $d3, $d9, $ec
.byte $d7, $b3, $db, $e9, $dd, $ec, $f6, $ea, $d7, $b3, $db, $e9, $dd, $ec, $f6, $ea
.byte $54, $a9, $c1, $e4, $55, $66, $35, $12, $3c, $38, $49, $71, $71, $72, $33, $13
.byte $37, $07, $07, $17, $0b, $05, $02, $01, $08, $38, $18, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $e6, $eb, $ed, $f6, $f0, $f8, $fc, $7e, $00, $00, $00, $00, $00, $00, $00, $00
.byte $bf, $5f, $23, $1c, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $07, $83, $e1, $70, $00, $00, $00, $00, $05, $03, $01, $00, $00, $00, $00, $00
.byte $c0, $f0, $fb, $fc, $3f, $07, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $f8, $fc, $fc, $fe, $3e, $0f, $03, $00, $b0, $d8, $68, $b4, $3c, $0e, $02, $00
.byte $00, $00, $00, $80, $30, $fc, $7e, $07, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $60, $70, $f0, $d0, $d8, $dd, $5e, $00, $00, $00, $00, $01, $02, $01, $00
.byte $0e, $0f, $07, $07, $03, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $40, $40, $80, $bf, $7f, $80, $3f, $09, $38, $20, $40, $3f, $7f, $ff, $3f, $c9
.byte $40, $12, $00, $c9, $ff, $ff, $7f, $0f, $b6, $ed, $36, $00, $00, $00, $00, $00
.byte $c0, $c0, $c0, $7f, $f8, $04, $e0, $01, $c3, $c0, $c0, $ff, $ff, $fc, $e3, $1e
.byte $08, $40, $03, $1f, $ff, $ff, $ff, $ff, $d7, $bc, $e0, $00, $00, $02, $20, $8b
.byte $23, $42, $42, $26, $86, $4e, $3e, $3e, $c1, $82, $00, $02, $92, $46, $a2, $84
.byte $7e, $7e, $fe, $fc, $fc, $f8, $f0, $c0, $94, $04, $04, $28, $98, $30, $c0, $00
.byte $00, $00, $00, $00, $00, $00, $c0, $e0, $00, $00, $00, $00, $00, $00, $c0, $e0
.byte $e0, $7d, $7d, $fd, $fd, $fb, $76, $0e, $e0, $7c, $7c, $fc, $fc, $f8, $70, $00
.byte $00, $03, $0e, $1f, $3f, $4e, $32, $bd, $00, $00, $00, $00, $00, $00, $00, $00
.byte $be, $cf, $f1, $bf, $8f, $80, $c0, $c6, $00, $00, $00, $00, $00, $00, $00, $06
.byte $60, $5c, $ff, $3f, $3c, $33, $4f, $b3, $00, $00, $00, $00, $00, $00, $00, $00
.byte $cf, $bf, $cf, $fe, $f0, $01, $02, $e6, $00, $00, $00, $00, $00, $00, $00, $e0
.byte $00, $00, $88, $38, $e0, $c0, $a0, $f0, $00, $00, $00, $00, $00, $00, $00, $00
.byte $f0, $f0, $c0, $b0, $b8, $dc, $2e, $dc, $00, $00, $00, $00, $00, $00, $00, $c0
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $01, $01, $03, $03, $00, $00, $00, $00, $01, $01, $03, $03
.byte $07, $07, $0f, $0f, $1f, $1f, $3f, $3f, $04, $04, $0e, $0e, $1f, $1f, $3f, $3f
.byte $7f, $7f, $f9, $f9, $f0, $f0, $e0, $e0, $7f, $7f, $f9, $f9, $f6, $f6, $ef, $ef
.byte $e0, $e0, $f0, $f0, $f8, $f8, $fc, $fc, $00, $00, $00, $00, $00, $00, $80, $80
.byte $fe, $fe, $ff, $ff, $ff, $ff, $7f, $7f, $c0, $c0, $e0, $e0, $f0, $f0, $78, $78
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $80, $80, $c0, $c0, $00, $00, $00, $00, $00, $00, $00, $00
.byte $e4, $52, $a5, $0e, $63, $b9, $55, $aa, $34, $f7, $f7, $0b, $01, $e0, $f9, $fe
.byte $0f, $f1, $d8, $a6, $4d, $8a, $01, $38, $0f, $01, $70, $f0, $e6, $df, $83, $00
.byte $55, $ab, $57, $af, $df, $1f, $5f, $1f, $fd, $f9, $e3, $c9, $09, $0d, $4d, $0c
.byte $4f, $2f, $4f, $2f, $07, $a7, $13, $ab, $44, $26, $4c, $2d, $05, $a3, $91, $a9
.byte $9f, $cf, $ef, $e3, $f9, $fc, $ff, $ff, $1f, $0f, $2f, $a3, $a1, $b4, $92, $db
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $d9, $cd, $dd, $99, $bb, $b3, $37, $b3
.byte $f0, $f8, $f8, $f8, $fc, $3c, $dc, $c0, $f0, $f8, $f8, $f8, $fc, $3c, $1c, $80
.byte $e0, $e0, $e0, $c0, $c0, $80, $80, $80, $80, $c0, $80, $80, $00, $00, $00, $00
.byte $03, $07, $07, $07, $0f, $0f, $0f, $1f, $01, $01, $03, $03, $03, $07, $07, $07
.byte $1f, $1f, $3f, $3f, $3f, $7f, $7f, $7f, $0f, $0f, $0f, $1f, $1f, $1f, $3f, $3f
.byte $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff
.byte $fb, $f7, $fb, $f7, $ef, $f7, $ef, $ff, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe
.byte $00, $80, $f0, $fc, $bf, $d7, $ea, $fd, $00, $00, $80, $f0, $bc, $d7, $ea, $fd
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $80, $f0, $fc, $5f, $00, $00, $00, $00, $00, $80, $f0, $5c
.byte $ff, $3f, $0f, $07, $03, $03, $01, $01, $ff, $3f, $0f, $07, $03, $03, $01, $01
.byte $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $01, $02, $01, $02, $01, $00, $00, $00, $01, $03, $03, $03, $01, $00
.byte $6f, $38, $1f, $08, $06, $0c, $06, $2a, $0f, $00, $00, $00, $00, $00, $00, $3f
.byte $15, $0a, $45, $aa, $55, $aa, $51, $00, $3f, $1f, $ef, $fe, $fd, $fb, $fb, $01
.byte $ee, $1e, $fd, $c3, $37, $67, $33, $a9, $e0, $00, $01, $03, $07, $07, $03, $fd
.byte $54, $2a, $15, $8a, $55, $aa, $55, $a8, $7e, $7e, $3f, $df, $ff, $ff, $ff, $f8
.byte $f4, $f8, $fc, $fe, $f0, $e8, $f8, $e0, $f0, $f8, $fc, $fe, $f0, $e8, $f8, $e0
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $07, $07, $0f, $0f, $1f, $1f, $3e, $3e, $07, $07, $0f, $0f, $1f, $1f, $3e, $3e
.byte $7c, $7c, $f8, $f8, $70, $70, $20, $20, $7d, $7d, $fb, $fb, $77, $77, $2f, $2f
.byte $c0, $c0, $80, $80, $00, $00, $00, $00, $df, $df, $be, $be, $7c, $7c, $f8, $f8
.byte $07, $07, $0f, $0f, $00, $00, $00, $00, $f0, $f0, $e0, $e0, $ff, $ff, $ff, $ff
.byte $3f, $3f, $1f, $1f, $0f, $0f, $07, $07, $3c, $3c, $1e, $1e, $0f, $0f, $07, $07
.byte $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff
.byte $e0, $e0, $f0, $f0, $f8, $f8, $fc, $fc, $00, $00, $00, $00, $00, $00, $80, $80
.byte $fe, $fe, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $fe, $fe, $fc, $fc
.byte $d6, $a9, $57, $aa, $45, $ba, $50, $21, $38, $f8, $f1, $e7, $c7, $83, $3a, $75
.byte $00, $9b, $36, $65, $68, $46, $ed, $da, $00, $80, $03, $0f, $28, $20, $21, $43
.byte $53, $29, $15, $29, $55, $28, $14, $8a, $51, $29, $14, $28, $54, $28, $14, $0a
.byte $e4, $f2, $f9, $fc, $fc, $fe, $fe, $ff, $84, $c2, $e1, $f0, $f8, $f8, $fc, $fc
.byte $ff, $7f, $bf, $ff, $f7, $fb, $ff, $ff, $9b, $db, $db, $d9, $dd, $5d, $4d, $6b
.byte $6f, $7f, $7f, $77, $7b, $7f, $37, $3f, $5b, $5b, $59, $5d, $4d, $6d, $2d, $2d
.byte $80, $80, $80, $80, $80, $c0, $c0, $c0, $00, $00, $00, $00, $00, $00, $80, $80
.byte $c0, $c0, $c0, $e0, $60, $b0, $f0, $70, $80, $80, $80, $80, $c0, $c0, $e0, $e0
.byte $5a, $5b, $22, $a6, $96, $d6, $c8, $69, $24, $24, $1c, $98, $89, $c9, $c7, $e6
.byte $a6, $77, $b2, $da, $b9, $dd, $ec, $d6, $e0, $f0, $f0, $f8, $f8, $fc, $fc, $fe
.byte $7f, $7f, $3f, $3f, $9f, $df, $8f, $8f, $3f, $3f, $1f, $1f, $0f, $0f, $47, $67
.byte $47, $d7, $43, $63, $91, $f5, $90, $98, $23, $23, $31, $19, $08, $08, $6c, $66
.byte $00, $80, $e0, $f9, $f8, $fc, $fc, $fe, $19, $83, $e2, $f8, $f9, $fd, $fc, $fe
.byte $40, $20, $98, $81, $c0, $c0, $f0, $fc, $19, $03, $a6, $9c, $d9, $c3, $f0, $fc
.byte $7f, $3f, $3f, $9f, $5f, $07, $11, $00, $7f, $3f, $3f, $1f, $9f, $c7, $61, $3c
.byte $3f, $0f, $03, $83, $41, $21, $18, $00, $3f, $8f, $63, $3b, $99, $c1, $64, $3c
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $03, $73, $fb, $7f, $39, $01, $01, $01, $03, $73, $9b, $6f, $39, $01, $01, $01
.byte $00, $00, $1c, $3e, $fc, $b8, $80, $80, $00, $00, $1c, $32, $ec, $b8, $80, $80
.byte $e7, $ef, $ef, $00, $7c, $fe, $fe, $00, $18, $f7, $f7, $ff, $80, $7f, $7f, $fe
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $be, $9e, $de, $de, $61, $31, $1d, $07, $fe, $ea, $fe, $74, $61, $31, $1d, $07
.byte $fc, $fa, $f6, $f6, $8c, $98, $f0, $80, $fe, $ae, $fe, $5c, $8c, $98, $f0, $80
.byte $00, $00, $38, $7c, $3f, $1d, $01, $01, $00, $00, $38, $4c, $37, $1d, $01, $01
.byte $c0, $ce, $df, $fe, $9c, $80, $80, $80, $c0, $ce, $d9, $f6, $9c, $80, $80, $80
.byte $00, $ce, $ce, $00, $00, $fe, $fe, $00, $00, $ce, $ef, $67, $00, $fe, $ff, $7f
.byte $80, $c0, $c0, $e0, $e0, $f0, $f0, $f8, $00, $80, $80, $40, $c0, $60, $a0, $d0
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $67, $3f, $0f, $0f, $4f, $3c, $00, $00, $60, $38, $0c, $02, $00, $03, $07, $03
.byte $1f, $3c, $1e, $0e, $03, $07, $07, $07, $1c, $3b, $1b, $0d, $00, $00, $07, $07
.byte $80, $c0, $e0, $f8, $ee, $00, $00, $00, $00, $00, $00, $00, $00, $20, $f0, $c0
.byte $c0, $e0, $60, $40, $80, $80, $80, $c0, $00, $00, $80, $80, $00, $00, $80, $c0
.byte $67, $3f, $0f, $0f, $0f, $7c, $00, $00, $60, $38, $0c, $02, $00, $03, $07, $03
.byte $0f, $1f, $1f, $07, $1f, $3c, $38, $1c, $0f, $1c, $3c, $17, $00, $30, $38, $1c
.byte $80, $c0, $e0, $fe, $e0, $00, $00, $00, $00, $00, $00, $00, $00, $20, $f0, $cc
.byte $e0, $f0, $80, $c0, $c0, $f8, $78, $70, $1c, $00, $80, $00, $00, $18, $38, $70
.byte $00, $07, $1f, $1f, $3f, $3f, $1f, $0f, $00, $00, $00, $02, $02, $02, $01, $30
.byte $07, $0f, $07, $3d, $3f, $18, $00, $00, $1c, $03, $07, $35, $33, $10, $00, $00
.byte $00, $c0, $f0, $f0, $f8, $f8, $f8, $fc, $00, $00, $00, $00, $12, $16, $34, $d8
.byte $fe, $f6, $e0, $a0, $f0, $7c, $38, $30, $0e, $c6, $e0, $a0, $c0, $0c, $18, $30
.byte $07, $0f, $ef, $3f, $0e, $78, $00, $0f, $00, $00, $e0, $3c, $01, $07, $03, $0c
.byte $0f, $0f, $0f, $0b, $07, $07, $03, $03, $0a, $32, $34, $10, $01, $03, $03, $03
.byte $80, $cc, $f8, $00, $00, $00, $10, $f0, $00, $00, $00, $a0, $70, $e6, $ce, $4c
.byte $f0, $e0, $e0, $e8, $78, $b8, $b0, $00, $40, $20, $00, $08, $18, $98, $b0, $00
.byte $ff, $ff, $d7, $eb, $d7, $eb, $d7, $eb, $00, $81, $ff, $ff, $ff, $ff, $ff, $ff
.byte $d7, $eb, $d5, $ea, $75, $7a, $3f, $0f, $ff, $fe, $ff, $ff, $7f, $7f, $3f, $0f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $ff, $ff, $57, $ab, $57, $ab, $ff, $ff, $00, $01, $ff, $ff, $ff, $ff, $ff, $ff
.byte $03, $07, $07, $6f, $3f, $03, $10, $30, $00, $00, $00, $00, $40, $64, $65, $03
.byte $3f, $1f, $0f, $07, $0e, $0e, $0e, $1e, $02, $02, $04, $00, $00, $00, $0e, $1e
.byte $ce, $fc, $f0, $f7, $fc, $d8, $00, $38, $0e, $1c, $10, $20, $00, $20, $a0, $f8
.byte $f8, $f8, $fc, $e0, $e0, $e0, $e0, $f0, $48, $40, $20, $0c, $0c, $08, $e0, $f0
.byte $00, $38, $1d, $37, $0f, $03, $00, $1e, $00, $38, $1c, $06, $01, $00, $03, $1f
.byte $3f, $3f, $1f, $0f, $03, $07, $07, $07, $38, $30, $11, $0e, $00, $00, $07, $07
.byte $00, $c0, $f0, $f8, $f8, $f8, $0c, $06, $00, $00, $00, $00, $00, $00, $c0, $f0
.byte $c1, $e0, $f8, $f0, $c0, $80, $80, $c0, $10, $00, $00, $0e, $0c, $00, $80, $c0
.byte $03, $0f, $0f, $1f, $77, $3e, $60, $0f, $00, $00, $00, $1c, $70, $01, $03, $0f
.byte $1f, $1f, $07, $01, $03, $03, $01, $00, $1c, $1c, $07, $00, $03, $03, $01, $00
.byte $82, $c4, $f8, $f0, $00, $10, $38, $f8, $00, $00, $00, $00, $9b, $e7, $c6, $00
.byte $f0, $f0, $e0, $c0, $c0, $80, $c0, $e0, $20, $c0, $00, $00, $00, $00, $c0, $e0
.byte $00, $00, $03, $c3, $73, $1f, $7f, $0e, $00, $00, $38, $dc, $7c, $12, $00, $01
.byte $1f, $3f, $3f, $1f, $07, $07, $07, $07, $18, $39, $3a, $1c, $00, $00, $07, $07
.byte $00, $00, $c0, $e0, $e0, $f0, $fe, $00, $00, $00, $18, $10, $00, $00, $00, $98
.byte $00, $e0, $f0, $f0, $e0, $80, $80, $c0, $e0, $00, $00, $00, $00, $00, $80, $c0
.byte $00, $00, $00, $00, $03, $e3, $33, $4f, $00, $00, $00, $00, $38, $fc, $3c, $02
.byte $3f, $1e, $3f, $3f, $1f, $07, $07, $07, $00, $11, $31, $3a, $1c, $00, $07, $07
.byte $00, $00, $00, $00, $c0, $e0, $f0, $f0, $00, $00, $00, $00, $1c, $08, $00, $00
.byte $fe, $00, $00, $f0, $e0, $80, $80, $c0, $00, $98, $e0, $00, $00, $00, $80, $c0
.byte $03, $07, $cf, $7f, $1f, $0e, $78, $00, $00, $00, $c0, $70, $1c, $01, $03, $01
.byte $1f, $3f, $1e, $06, $03, $0f, $0f, $07, $1f, $3c, $19, $07, $00, $08, $0c, $07
.byte $00, $c3, $ec, $f8, $80, $00, $00, $00, $00, $00, $00, $00, $70, $9c, $f0, $e6
.byte $c0, $f8, $70, $3c, $38, $30, $00, $80, $0e, $84, $80, $dc, $f8, $30, $00, $80
.byte $00, $04, $23, $1d, $07, $01, $00, $3e, $00, $04, $03, $01, $01, $00, $01, $3d
.byte $7f, $7f, $3c, $0c, $1e, $1c, $1c, $0e, $72, $61, $3f, $03, $01, $10, $18, $0e
.byte $00, $20, $f8, $fc, $fc, $fc, $38, $0c, $00, $00, $00, $00, $80, $00, $c0, $c0
.byte $06, $e3, $f8, $50, $60, $c0, $00, $00, $f0, $50, $46, $8c, $a0, $c0, $00, $00
.byte $3c, $0f, $07, $6f, $3f, $07, $00, $00, $3c, $0c, $06, $02, $00, $00, $07, $03
.byte $1f, $3f, $1f, $0f, $03, $0f, $0f, $07, $1e, $38, $18, $0f, $00, $08, $0e, $07
.byte $00, $80, $e0, $f0, $f0, $f0, $18, $06, $00, $00, $00, $00, $00, $00, $80, $f0
.byte $01, $e0, $30, $80, $c0, $c0, $00, $80, $c0, $00, $c0, $f0, $30, $00, $00, $80
.byte $03, $03, $c3, $7f, $0f, $1e, $66, $1f, $38, $1c, $cc, $72, $00, $01, $01, $19
.byte $3f, $1f, $0f, $03, $07, $07, $03, $01, $38, $19, $0e, $00, $06, $07, $03, $01
.byte $c0, $e0, $e0, $f7, $f8, $00, $00, $00, $18, $10, $00, $00, $00, $98, $e0, $c0
.byte $e0, $f0, $e0, $c0, $c0, $80, $00, $80, $80, $00, $00, $00, $00, $00, $00, $80
.byte $00, $00, $00, $00, $03, $63, $33, $4f, $00, $00, $00, $00, $38, $7c, $3c, $02
.byte $3f, $1e, $3f, $3f, $1f, $3e, $3c, $1c, $00, $11, $31, $32, $1c, $30, $38, $1c
.byte $00, $00, $00, $00, $c0, $e0, $f0, $f2, $00, $00, $00, $00, $1c, $08, $00, $00
.byte $fc, $00, $00, $e0, $c0, $fc, $f8, $60, $00, $98, $e0, $00, $00, $0c, $38, $60
.byte $00, $8e, $9f, $ff, $7f, $3c, $30, $60, $00, $80, $80, $c0, $60, $30, $0b, $0f
.byte $81, $1f, $3c, $78, $79, $3b, $01, $01, $0e, $1c, $23, $67, $76, $38, $00, $01
.byte $00, $00, $70, $c0, $00, $00, $60, $e0, $00, $00, $00, $00, $00, $cc, $1c, $90
.byte $c0, $f0, $fb, $3f, $8e, $e4, $e0, $c0, $40, $00, $03, $07, $0e, $64, $e0, $c0
.byte $00, $00, $00, $06, $0f, $cf, $7f, $3e, $00, $00, $00, $00, $00, $c0, $60, $39
.byte $18, $30, $41, $0f, $3f, $3c, $18, $18, $07, $0f, $0e, $08, $34, $23, $07, $06
.byte $00, $00, $00, $00, $18, $30, $e0, $00, $00, $00, $00, $00, $00, $00, $00, $18
.byte $20, $e3, $cf, $ff, $f6, $f8, $78, $30, $d8, $9b, $43, $07, $16, $38, $78, $30
.byte $00, $00, $00, $03, $18, $20, $20, $18, $00, $00, $00, $03, $18, $20, $20, $18
.byte $03, $00, $00, $01, $76, $7c, $f3, $87, $03, $00, $00, $00, $00, $01, $ec, $38
.byte $00, $00, $00, $c0, $18, $04, $04, $18, $00, $00, $00, $c0, $18, $04, $04, $18
.byte $c0, $00, $00, $00, $00, $26, $7e, $fe, $c0, $00, $00, $00, $c0, $c6, $86, $0e
.byte $07, $07, $0e, $0c, $1c, $1c, $3c, $03, $07, $00, $01, $0f, $1f, $1f, $3d, $03
.byte $07, $07, $0c, $0c, $1c, $1f, $0f, $07, $07, $07, $0f, $0f, $1f, $1f, $08, $00
.byte $c0, $e0, $20, $00, $06, $04, $0c, $08, $e9, $06, $c6, $29, $f0, $c0, $80, $94
.byte $e8, $f8, $d0, $d0, $f0, $e0, $a0, $e0, $f4, $e0, $c0, $c0, $c0, $c0, $80, $00
.byte $07, $07, $0e, $0c, $1c, $1c, $3c, $03, $07, $00, $01, $0f, $1f, $1f, $3d, $03
.byte $07, $0d, $0c, $1c, $3e, $3b, $38, $1c, $07, $0f, $0f, $1f, $3f, $0b, $00, $00
.byte $c0, $e0, $20, $00, $06, $0c, $08, $18, $e9, $06, $c6, $29, $f0, $c0, $94, $84
.byte $f0, $f0, $e0, $60, $68, $f8, $f8, $b0, $e0, $c0, $c0, $80, $a0, $20, $40, $00
.byte $03, $07, $0f, $1f, $0f, $07, $03, $03, $03, $97, $67, $67, $93, $00, $02, $33
.byte $1f, $1f, $07, $3f, $3f, $1f, $03, $00, $3f, $1f, $07, $0f, $0f, $07, $03, $00
.byte $80, $c0, $e0, $e0, $f2, $ef, $dc, $fc, $80, $c0, $e0, $e8, $cc, $1c, $1c, $fc
.byte $f8, $e0, $f0, $f8, $f8, $f0, $f8, $dc, $f8, $e0, $f0, $f8, $f8, $e0, $c0, $c0
.byte $07, $07, $0f, $4e, $7e, $3c, $38, $06, $07, $00, $00, $4f, $7f, $3f, $3b, $07
.byte $0f, $07, $07, $1b, $13, $07, $07, $07, $3f, $3f, $1f, $1b, $13, $06, $04, $00
.byte $c0, $e0, $20, $00, $06, $06, $02, $ba, $e9, $06, $c6, $29, $f0, $c8, $8c, $bc
.byte $f2, $e2, $e3, $f1, $fd, $b9, $b1, $00, $f0, $e0, $e0, $f0, $e0, $80, $00, $00
.byte $00, $00, $07, $07, $0e, $0c, $1c, $1e, $00, $00, $07, $00, $01, $0f, $1f, $1f
.byte $3d, $03, $07, $0c, $0c, $1e, $1f, $37, $3d, $03, $07, $0f, $0f, $1f, $1c, $30
.byte $00, $00, $c0, $e0, $26, $04, $0c, $0c, $09, $06, $e6, $09, $c0, $20, $f2, $c2
.byte $18, $b8, $f8, $f8, $70, $70, $f0, $d0, $94, $b0, $e0, $e0, $e0, $e0, $e0, $00
.byte $0e, $0f, $0e, $1c, $1c, $3c, $7b, $07, $0f, $0c, $09, $12, $07, $3d, $7b, $07
.byte $07, $0c, $1c, $19, $3f, $3f, $67, $03, $07, $0f, $1f, $1f, $3f, $31, $60, $00
.byte $80, $80, $00, $00, $04, $0c, $28, $e8, $09, $46, $36, $69, $c0, $c0, $b4, $f4
.byte $f8, $d0, $d0, $b0, $a0, $20, $20, $80, $f0, $c0, $c0, $80, $80, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $03, $06, $0e, $1f, $0c, $1e, $3f, $77, $00, $01, $0f, $1f, $0f, $1f, $3b, $70
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $e0, $00, $00, $34, $fc, $3c, $f8, $f8, $03, $3b, $f0, $f3, $fa, $f8, $70, $10
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $3f, $7f, $09, $1f, $1f, $1f, $0f, $0c, $0c, $3b, $3f, $11, $0f, $1c, $0b, $0f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $f0, $0c, $40, $e6, $ff, $fe, $c0, $e0, $10, $14, $10, $e0, $c6, $7e, $80, $c0
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $18, $26, $00, $00, $60, $84, $08, $08
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $0c, $30, $40, $06, $09, $00, $38, $04
.byte $87, $ef, $3f, $9f, $6e, $18, $00, $0f, $80, $e0, $30, $1c, $01, $07, $03, $0c
.byte $1f, $1f, $1f, $03, $07, $07, $03, $03, $1a, $12, $04, $38, $31, $03, $03, $03
.byte $8c, $d8, $e0, $00, $00, $00, $00, $f0, $00, $00, $00, $a0, $70, $e0, $c0, $40
.byte $f0, $f0, $e0, $e8, $78, $b8, $b0, $00, $4e, $2c, $00, $08, $18, $98, $b0, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $22, $65, $25, $25, $25, $72, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $22, $55, $55, $55, $55, $22, $00
.byte $00, $03, $00, $00, $03, $00, $00, $09, $00, $1c, $0f, $07, $00, $03, $03, $0f
.byte $12, $23, $c2, $01, $00, $00, $00, $00, $3f, $7f, $ff, $ff, $ff, $6a, $1d, $07
.byte $00, $c0, $00, $30, $cc, $06, $06, $9c, $00, $38, $f0, $cc, $02, $c1, $c1, $f2
.byte $48, $c4, $43, $80, $00, $00, $00, $00, $fc, $fe, $ff, $fb, $d5, $aa, $58, $e0
.byte $00, $00, $00, $00, $00, $13, $0e, $05, $00, $03, $07, $0f, $1f, $3f, $3f, $3f
.byte $05, $07, $1b, $1d, $0e, $06, $02, $00, $3f, $3f, $3f, $1f, $0f, $07, $03, $00
.byte $00, $80, $c0, $e0, $70, $a8, $dc, $dc, $00, $c0, $e0, $f0, $f8, $f4, $e0, $e0
.byte $dc, $ec, $b4, $78, $f0, $e0, $c0, $00, $e0, $f0, $c8, $80, $00, $00, $00, $00
.byte $00, $44, $62, $70, $78, $72, $64, $4a, $7e, $f5, $fb, $fd, $ff, $ff, $fd, $fb
.byte $14, $4a, $64, $72, $78, $70, $62, $00, $f5, $fb, $fd, $ff, $ff, $fd, $fb, $7e
.byte $00, $22, $46, $0e, $1e, $4e, $26, $52, $7e, $af, $df, $bf, $ff, $ff, $bf, $df
.byte $28, $52, $26, $4e, $1e, $0e, $46, $00, $af, $df, $bf, $ff, $ff, $bf, $df, $7e
.byte $00, $11, $8b, $c3, $e3, $cb, $90, $28, $f8, $d4, $ec, $f4, $fc, $fc, $f6, $ed
.byte $53, $2b, $93, $cb, $e3, $c3, $8b, $07, $d6, $ee, $f4, $fc, $fc, $f4, $ef, $ff
.byte $00, $c4, $e8, $e1, $e3, $e9, $04, $0a, $0f, $15, $1b, $17, $1f, $1f, $d7, $fb
.byte $e5, $ea, $e4, $e9, $63, $61, $68, $70, $15, $1b, $17, $1f, $1f, $17, $7b, $7f
.byte $00, $83, $47, $07, $1f, $4f, $80, $40, $c0, $a0, $60, $a0, $e0, $e0, $a5, $63
.byte $97, $5f, $9f, $43, $07, $07, $4e, $1e, $a2, $62, $a4, $e0, $e0, $a0, $6e, $de
.byte $0c, $d9, $f2, $f0, $f8, $f2, $01, $02, $0f, $1d, $16, $35, $07, $07, $a5, $c6
.byte $e9, $fa, $f9, $e2, $70, $70, $72, $78, $45, $46, $25, $07, $07, $05, $76, $7b
.byte $3f, $7f, $7f, $09, $3f, $3f, $1f, $10, $0c, $3b, $3b, $3f, $31, $2f, $0f, $1f
.byte $1f, $1f, $1f, $10, $0f, $0f, $07, $07, $13, $0e, $0e, $1f, $0f, $0f, $05, $02
.byte $f0, $ec, $ec, $18, $50, $10, $e6, $8f, $10, $f4, $f4, $18, $10, $10, $e0, $86
.byte $fb, $f2, $ff, $fe, $e0, $c0, $80, $c0, $0f, $fe, $ff, $3e, $e0, $c0, $00, $80
.byte $3f, $7f, $7f, $09, $3f, $3f, $1f, $10, $0c, $3b, $3b, $3f, $31, $2f, $0f, $1f
.byte $1f, $1f, $1f, $10, $7f, $7c, $30, $1c, $13, $0e, $0e, $1f, $5f, $2c, $10, $08
.byte $f0, $ec, $ec, $18, $50, $16, $ef, $9b, $10, $f4, $f4, $18, $10, $10, $e6, $8f
.byte $f2, $ff, $fe, $e0, $e0, $7c, $3c, $38, $1e, $ff, $fe, $20, $e0, $78, $14, $28
.byte $00, $00, $00, $00, $00, $01, $12, $00, $00, $00, $00, $00, $00, $05, $12, $00
.byte $21, $83, $44, $0a, $21, $02, $09, $00, $21, $82, $64, $1a, $29, $13, $09, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $4f, $a7, $57, $2b, $47, $23, $3f, $f7, $00, $01, $77, $3f, $c7, $73, $3f, $f7
.byte $00, $00, $00, $08, $05, $12, $47, $0b, $00, $00, $00, $08, $05, $12, $47, $0b
.byte $45, $aa, $15, $6a, $05, $62, $2f, $07, $45, $ae, $3f, $6b, $2d, $77, $2f, $07
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $ff, $ff, $57, $ab, $57, $ab, $ff, $ff, $00, $01, $ff, $ff, $ff, $ff, $ff, $ff
.byte $00, $03, $40, $03, $13, $83, $57, $2b, $00, $01, $48, $03, $13, $87, $5f, $2f
.byte $d5, $eb, $55, $ca, $55, $6a, $3f, $0f, $fd, $fe, $7f, $df, $7f, $7f, $3f, $0f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $ff, $ff, $57, $ab, $57, $ab, $ff, $ff, $00, $01, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $80, $80, $80, $80, $80, $80, $80, $ff, $80, $80, $80, $80, $80, $80, $80
.byte $80, $80, $80, $80, $80, $80, $80, $ff, $80, $80, $80, $80, $80, $80, $80, $ff
.byte $ff, $01, $01, $01, $01, $01, $01, $01, $ff, $01, $01, $01, $01, $01, $01, $01
.byte $01, $01, $01, $01, $01, $01, $01, $ff, $01, $01, $01, $01, $01, $01, $01, $ff
.byte $00, $00, $01, $00, $03, $01, $0e, $1e, $00, $01, $03, $01, $3f, $63, $4f, $5f
.byte $1d, $0d, $18, $0f, $1e, $0f, $09, $00, $3f, $1f, $07, $10, $01, $18, $0f, $00
.byte $00, $00, $00, $00, $80, $00, $e0, $f0, $00, $00, $80, $00, $f8, $8c, $e4, $f4
.byte $70, $60, $30, $e0, $f0, $e0, $20, $00, $f8, $f0, $c0, $10, $00, $30, $e0, $00
.byte $00, $02, $04, $08, $1f, $78, $7c, $7f, $00, $02, $06, $26, $27, $02, $06, $83
.byte $7e, $ff, $77, $63, $21, $21, $00, $00, $82, $01, $00, $00, $00, $00, $00, $00
.byte $00, $40, $20, $10, $f8, $1e, $3e, $fe, $00, $40, $60, $64, $e4, $40, $60, $c1
.byte $7e, $ff, $ee, $c6, $84, $84, $00, $00, $41, $80, $00, $00, $00, $00, $00, $00
.byte $00, $00, $02, $04, $08, $0f, $08, $14, $00, $00, $02, $06, $0e, $0f, $02, $0a
.byte $17, $1d, $1d, $1f, $0d, $09, $08, $08, $09, $02, $02, $00, $00, $00, $00, $00
.byte $00, $00, $40, $20, $10, $f0, $10, $28, $00, $00, $40, $60, $70, $f0, $40, $50
.byte $e8, $b8, $b8, $f8, $b0, $90, $10, $10, $90, $40, $40, $00, $00, $00, $00, $00
.byte $1c, $07, $01, $00, $e0, $38, $0c, $02, $1c, $07, $01, $00, $e0, $38, $0c, $02
.byte $00, $07, $03, $c1, $30, $09, $05, $01, $00, $00, $00, $c0, $30, $08, $04, $00
.byte $00, $00, $80, $40, $00, $28, $24, $72, $00, $00, $80, $40, $00, $08, $04, $02
.byte $70, $ff, $fe, $fc, $f8, $dc, $8c, $04, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $03, $0f, $0f, $1f, $1f, $1f, $3f, $00, $00, $00, $00, $48, $68, $24, $03
.byte $1f, $0f, $0f, $0b, $0f, $3e, $1c, $0c, $08, $07, $0f, $0b, $07, $30, $18, $0c
.byte $00, $e0, $f8, $f8, $fc, $fc, $f8, $f0, $00, $00, $80, $40, $40, $60, $a4, $3c
.byte $fc, $f8, $e0, $7c, $fc, $18, $00, $00, $58, $80, $c0, $4c, $8c, $08, $00, $00
.byte $01, $03, $1b, $07, $0f, $37, $3b, $3f, $91, $63, $63, $9f, $33, $30, $38, $3f
.byte $1f, $07, $0f, $1f, $1f, $0f, $1f, $3b, $1f, $07, $0f, $1f, $1f, $07, $03, $03
.byte $c0, $e0, $f0, $f0, $e0, $e0, $d0, $cc, $c0, $e0, $e0, $c0, $80, $00, $46, $c2
.byte $f2, $fb, $e0, $fc, $fc, $f8, $c0, $00, $fc, $f8, $e0, $f0, $f0, $e0, $c0, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $20, $70, $21, $06, $05, $4d
.byte $00, $09, $1e, $3f, $1f, $03, $01, $00, $0f, $0e, $1f, $2f, $15, $02, $01, $00
.byte $00, $00, $00, $00, $00, $00, $00, $10, $80, $10, $02, $07, $c2, $70, $f0, $e9
.byte $30, $c8, $3c, $fe, $fc, $e0, $c0, $00, $c8, $38, $fc, $fa, $54, $a0, $40, $00
.byte $00, $31, $4a, $84, $02, $46, $3c, $00, $31, $7b, $ff, $ff, $fd, $b9, $42, $3c
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $8c, $52, $20, $02, $46, $3c, $00, $8c, $de, $ff, $ff, $fd, $b9, $42, $3c
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $1f, $1f, $3f, $3f, $3f, $21, $00, $00, $03, $1c, $3e, $27, $21, $0c
.byte $21, $3f, $3f, $3f, $1f, $1e, $0f, $03, $2c, $3e, $3d, $3c, $1f, $1e, $0f, $03
.byte $00, $00, $f8, $f8, $fc, $fc, $fc, $84, $00, $00, $c0, $38, $7c, $e4, $84, $00
.byte $cc, $fc, $fc, $fc, $f8, $78, $f0, $c0, $c4, $fc, $fc, $7c, $f8, $78, $f0, $c0
.byte $ff, $7f, $6d, $00, $00, $00, $00, $00, $6d, $12, $ff, $92, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $ff, $fe, $b6, $00, $00, $00, $00, $00, $b6, $48, $ff, $49, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $e0, $78, $fc, $fc, $fe, $ee, $fe, $fc, $00, $80, $00, $00, $00, $30, $30, $00
.byte $fc, $f8, $f0, $e0, $80, $80, $00, $00, $00, $00, $00, $00, $00, $80, $80, $80
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1c, $26, $63, $63, $63, $32, $1c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $0c, $1c, $0c, $0c, $0c, $0c, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $07, $1e, $3c, $70, $7f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $06, $0c, $1e, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $0e, $1e, $36, $66, $7f, $06, $06, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $60, $7e, $03, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1e, $30, $60, $7e, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $63, $06, $0c, $18, $18, $18, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3c, $62, $72, $3c, $4f, $43, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $3f, $03, $06, $3c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $73, $7b, $7f, $6f, $67, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $63, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $63, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $6b, $7f, $7f, $77, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $67, $7c, $6e, $67, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $18, $18, $ff, $7e, $3c, $7e, $e7, $81
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $22, $10, $80, $40, $00, $01
.byte $01, $00, $02, $01, $02, $00, $00, $00, $c0, $73, $3f, $1f, $07, $02, $01, $00
.byte $00, $00, $00, $00, $00, $40, $e0, $00, $00, $20, $24, $08, $01, $42, $e0, $f0
.byte $f0, $00, $a8, $10, $a8, $00, $00, $00, $06, $f9, $fd, $fd, $fe, $a8, $f0, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $63, $7e, $60, $60, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1c, $36, $63, $63, $7f, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $63, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3c, $66, $60, $3e, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $60, $60, $7e, $60, $60, $7f, $00
.byte $03, $0c, $19, $3f, $3f, $7d, $7f, $7f, $00, $03, $06, $00, $00, $06, $06, $00
.byte $3f, $3f, $1f, $0f, $03, $01, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $21, $1a, $1e, $08, $09, $16
.byte $00, $00, $00, $00, $00, $00, $00, $00, $62, $19, $09, $1e, $19, $20, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $98, $78, $90, $98, $46
.byte $00, $00, $00, $00, $00, $00, $00, $00, $68, $90, $10, $78, $48, $84, $80, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1c, $26, $63, $63, $63, $32, $1c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $0c, $1c, $0c, $0c, $0c, $0c, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $07, $1e, $3c, $70, $7f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $06, $0c, $1e, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $0e, $1e, $36, $66, $7f, $06, $06, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $60, $7e, $03, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1e, $30, $60, $7e, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $63, $06, $0c, $18, $18, $18, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3c, $62, $72, $3c, $4f, $43, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $3f, $03, $06, $3c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1c, $36, $63, $63, $7f, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $7e, $63, $63, $7e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1e, $33, $60, $60, $60, $33, $1e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7c, $66, $63, $63, $63, $66, $7c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $60, $60, $7e, $60, $60, $7f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $60, $60, $7e, $60, $60, $60, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1f, $30, $60, $67, $63, $33, $1f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $7f, $63, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $0c, $0c, $0c, $0c, $0c, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $03, $03, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $66, $6c, $78, $7c, $6e, $67, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $30, $30, $30, $30, $30, $30, $3f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $77, $7f, $7f, $6b, $63, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $73, $7b, $7f, $6f, $67, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $63, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $63, $7e, $60, $60, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $63, $63, $6f, $66, $3d, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7e, $63, $63, $67, $7c, $6e, $67, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3c, $66, $60, $3e, $03, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $0c, $0c, $0c, $0c, $0c, $0c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $63, $63, $63, $3e, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $63, $77, $3e, $1c, $08, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $63, $6b, $7f, $7f, $77, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $63, $77, $3e, $1c, $3e, $77, $63, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $33, $33, $33, $1e, $0c, $0c, $0c, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $07, $0e, $1c, $38, $70, $7f, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $30, $30, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7e, $7e, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3c, $42, $99, $a1, $a1, $99, $42, $3c
.byte $ff, $ff, $e1, $e1, $e1, $e1, $e1, $e1, $ff, $ff, $e1, $e1, $e1, $e1, $e1, $e1
.byte $87, $c7, $c0, $c7, $cf, $ce, $cf, $c7, $87, $c7, $c0, $c7, $cf, $ce, $cf, $c7
.byte $f8, $fc, $1c, $fc, $fc, $1c, $fc, $fc, $f8, $fc, $1c, $fc, $fc, $1c, $fc, $fc
.byte $ff, $ff, $e7, $e7, $e7, $e7, $e7, $e7, $ff, $ff, $e7, $e7, $e7, $e7, $e7, $e7
.byte $f0, $f9, $39, $39, $39, $39, $39, $38, $f0, $f9, $39, $39, $39, $39, $39, $38
.byte $ff, $ff, $c0, $c0, $c0, $c0, $ff, $ff, $ff, $ff, $c0, $c0, $c0, $c0, $ff, $ff
.byte $1f, $3f, $38, $38, $38, $38, $3f, $1f, $1f, $3f, $38, $38, $38, $38, $3f, $1f
.byte $e3, $f3, $70, $70, $70, $70, $f0, $e0, $e3, $f3, $70, $70, $70, $70, $f0, $e0
.byte $fe, $fe, $70, $70, $70, $70, $70, $70, $fe, $fe, $70, $70, $70, $70, $70, $70
.byte $ff, $ff, $d7, $eb, $d7, $eb, $d7, $eb, $00, $81, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $ea, $d5, $ea, $d5, $ff, $ff, $00, $80, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $eb, $d7, $eb, $d7, $eb, $d7, $00, $81, $ff, $ff, $ff, $ff, $ff, $ff
.byte $ff, $ff, $57, $ab, $57, $ab, $ff, $ff, $00, $01, $ff, $ff, $ff, $ff, $ff, $ff
.byte $eb, $d7, $ab, $57, $ae, $5e, $fc, $f0, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $ff
.byte $d7, $eb, $d5, $ea, $75, $7a, $3f, $0f, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff
.byte $10, $10, $10, $28, $28, $28, $54, $54, $2a, $47, $af, $57, $97, $57, $ab, $2b
.byte $54, $aa, $aa, $aa, $54, $54, $54, $00, $ab, $55, $55, $55, $ab, $2b, $2b, $00
.byte $fe, $fe, $fe, $fe, $00, $00, $00, $00, $fe, $aa, $fe, $54, $ff, $7f, $ff, $7f
.byte $00, $fe, $aa, $d6, $aa, $d6, $fe, $00, $00, $fe, $ab, $d7, $ab, $d7, $ff, $7f
.byte $10, $10, $10, $28, $28, $28, $54, $54, $a8, $c4, $ea, $d4, $d2, $d4, $aa, $a8
.byte $54, $aa, $aa, $aa, $54, $54, $54, $00, $aa, $54, $54, $54, $aa, $a8, $a8, $00
.byte $57, $6b, $56, $79, $60, $30, $38, $2e, $7f, $7f, $7f, $79, $60, $30, $38, $2e
.byte $25, $26, $25, $26, $23, $26, $0e, $3a, $b7, $b7, $b7, $b7, $b3, $b6, $8e, $ba
.byte $a4, $64, $a4, $64, $c4, $64, $70, $5c, $ed, $ed, $ed, $ed, $cd, $65, $71, $5d
.byte $ea, $d6, $6a, $9e, $06, $0c, $1c, $74, $fe, $fe, $fe, $9e, $06, $0c, $1c, $74
.byte $1f, $7f, $70, $e0, $c0, $c0, $c0, $c0, $1d, $5d, $60, $e0, $00, $c0, $c0, $00
.byte $f8, $fe, $0e, $07, $03, $03, $03, $03, $b8, $ba, $06, $07, $00, $03, $03, $00
.byte $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $c0, $00, $c0, $c0, $00, $c0, $c0
.byte $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $03, $03, $00, $03, $03
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $07, $07, $03, $00, $00, $00
.byte $00, $01, $07, $1f, $3c, $3e, $0f, $00, $00, $00, $00, $00, $00, $00, $00, $ff
.byte $00, $41, $5d, $be, $aa, $3e, $36, $1d, $1c, $ff, $e3, $c1, $c1, $c1, $49, $23
.byte $1f, $ff, $ff, $ff, $7f, $7f, $bf, $ff, $01, $23, $23, $73, $77, $7e, $3c, $38
.byte $00, $00, $00, $80, $80, $00, $00, $c0, $00, $c0, $f0, $f0, $e0, $80, $00, $00
.byte $e0, $e0, $f0, $f0, $f8, $fc, $fe, $fe, $00, $80, $80, $c0, $88, $1c, $3e, $fe
.byte $00, $aa, $55, $aa, $55, $00, $00, $00, $ff, $55, $aa, $55, $aa, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1f, $3f, $3f, $1f, $1f, $0f, $07, $03
.byte $03, $1d, $17, $1e, $3d, $2a, $13, $2b, $03, $1f, $18, $00, $05, $1a, $39, $3a
.byte $53, $2d, $1e, $3e, $3f, $3f, $3f, $1f, $71, $34, $0e, $0e, $1f, $1f, $3e, $1c
.byte $c4, $ec, $ec, $0c, $c8, $4c, $e4, $a4, $fd, $0d, $0d, $3d, $d9, $5d, $ed, $ad
.byte $c4, $c4, $c4, $ce, $5e, $1c, $e8, $f4, $1d, $9d, $59, $94, $5e, $1d, $1d, $fd
.byte $23, $37, $37, $30, $13, $32, $27, $25, $bf, $b8, $b8, $bc, $9b, $ba, $b7, $b5
.byte $23, $23, $23, $53, $5f, $7c, $3b, $36, $b0, $b9, $98, $08, $58, $73, $a4, $a9
.byte $c0, $b8, $e8, $78, $bc, $54, $c8, $d4, $c0, $f8, $18, $00, $a0, $58, $9c, $5c
.byte $ca, $b4, $78, $fc, $fc, $1c, $ec, $f4, $8e, $24, $70, $30, $08, $e0, $10, $08
.byte $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $31, $7b, $7f, $fd, $fe, $ee, $ee, $00, $01, $18, $3c, $7c, $7e, $7e, $7e
.byte $f8, $fc, $1e, $ae, $f7, $7b, $1b, $3e, $00, $00, $e0, $b0, $f8, $7c, $3c, $14
.byte $ff, $ff, $fb, $f7, $f7, $f7, $f7, $fe, $cf, $ff, $f7, $0f, $4f, $ff, $ff, $ee
.byte $1f, $3f, $78, $75, $ef, $de, $d8, $7c, $00, $00, $07, $0d, $1f, $3e, $3c, $28
.byte $ff, $ff, $df, $ef, $ef, $ef, $ef, $7f, $f3, $ff, $ef, $f0, $f2, $ff, $ff, $77
.byte $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $8c, $de, $fe, $bf, $7f, $77, $77, $00, $80, $18, $3c, $3e, $7e, $7e, $7e
.byte $03, $1f, $3f, $3f, $1d, $07, $07, $02, $03, $1f, $3b, $3a, $18, $00, $08, $19
.byte $01, $00, $01, $07, $0d, $00, $00, $0e, $2c, $06, $0e, $18, $12, $3f, $7b, $ce
.byte $c0, $f8, $fc, $fc, $b8, $e0, $e0, $40, $c0, $f8, $dc, $5c, $18, $00, $10, $98
.byte $80, $00, $80, $e0, $b0, $00, $00, $70, $34, $60, $70, $18, $48, $fc, $de, $73
.byte $00, $00, $00, $00, $00, $00, $00, $00, $f0, $f8, $f8, $f0, $f0, $e0, $c0, $80
.byte $00, $00, $00, $00, $30, $1c, $1c, $18, $06, $0f, $09, $dc, $de, $93, $13, $19
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00
.byte $18, $18, $38, $30, $38, $38, $38, $38, $18, $18, $38, $30, $38, $38, $38, $38
.byte $00, $18, $25, $24, $24, $18, $7e, $18, $7e, $ff, $7e, $ff, $7e, $ff, $ff, $ff
.byte $18, $18, $18, $00, $00, $00, $00, $00, $7e, $7e, $7e, $7e, $7e, $3c, $00, $00
.byte $ef, $de, $bd, $7d, $7c, $6d, $36, $1e, $01, $06, $0d, $0d, $1c, $0d, $16, $5e
.byte $1f, $1f, $1f, $3f, $37, $2e, $55, $29, $df, $df, $1f, $3f, $37, $2e, $55, $28
.byte $7f, $f7, $fb, $f2, $fd, $7c, $fe, $fe, $7f, $f7, $fb, $f2, $fc, $7d, $fe, $fe
.byte $7f, $7f, $bf, $bb, $d4, $f8, $f0, $80, $7f, $7f, $bf, $b8, $d4, $d8, $10, $00
.byte $00, $2a, $55, $aa, $55, $00, $00, $00, $7f, $55, $2a, $55, $aa, $ff, $ff, $ff
.byte $00, $80, $c0, $c0, $e0, $70, $70, $30, $7f, $bf, $c0, $00, $00, $00, $00, $00
.byte $0f, $17, $09, $0f, $1f, $1f, $1f, $16, $0f, $17, $09, $0f, $1f, $1f, $1f, $16
.byte $19, $1b, $17, $1b, $37, $2b, $37, $6f, $19, $1f, $1f, $1f, $3f, $3f, $3f, $7f
.byte $f4, $e4, $e4, $c4, $c4, $a4, $64, $e4, $f5, $e5, $ed, $cd, $cd, $ad, $6d, $ed
.byte $e4, $e4, $e4, $c4, $c4, $c4, $c4, $c4, $ed, $ed, $ed, $cd, $dd, $dd, $dd, $dd
.byte $36, $36, $2b, $2b, $37, $37, $36, $33, $89, $89, $a4, $a4, $88, $88, $a9, $ac
.byte $2c, $27, $27, $23, $23, $23, $23, $23, $a3, $b0, $b6, $bb, $bb, $bb, $bb, $bb
.byte $f6, $36, $e8, $e8, $b6, $b6, $34, $e4, $08, $c8, $10, $10, $48, $48, $c8, $18
.byte $18, $f8, $e8, $d8, $ec, $d4, $ec, $f6, $e0, $08, $38, $f8, $fc, $fc, $fc, $fe
.byte $7f, $7f, $ff, $ff, $ea, $f1, $78, $78, $60, $1f, $3f, $7f, $6f, $71, $7a, $7b
.byte $3c, $5e, $6f, $87, $03, $03, $03, $02, $3f, $1d, $00, $30, $38, $38, $38, $38
.byte $fe, $f6, $f6, $d6, $bb, $57, $07, $0b, $4e, $fe, $fe, $fe, $ff, $ff, $0f, $ff
.byte $01, $01, $00, $80, $40, $00, $00, $00, $ff, $ff, $fe, $7e, $3e, $7e, $7e, $fe
.byte $7f, $6f, $6f, $6b, $dd, $ea, $e0, $d0, $72, $7f, $7f, $7f, $ff, $ff, $f0, $ff
.byte $80, $80, $00, $01, $02, $00, $00, $00, $ff, $ff, $7f, $7e, $7c, $7e, $7e, $7f
.byte $fe, $fe, $ff, $ff, $57, $8f, $1e, $1e, $06, $f8, $fc, $fe, $f6, $8e, $5e, $de
.byte $3c, $7a, $f6, $e1, $c0, $c0, $c0, $40, $fc, $98, $00, $0c, $1c, $1c, $1c, $1c
.byte $ff, $ff, $7f, $7f, $3f, $3f, $1f, $1f, $00, $00, $00, $00, $00, $00, $00, $00
.byte $0f, $0f, $07, $07, $03, $03, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
.byte $80, $80, $c0, $c0, $e0, $e0, $f0, $f0, $00, $00, $00, $00, $00, $00, $00, $00
.byte $f8, $f8, $fc, $fc, $fe, $fe, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00
.byte $ff, $ff, $ff, $7f, $7f, $7f, $3f, $3f, $00, $00, $00, $00, $00, $00, $00, $00
.byte $3f, $1f, $1f, $1f, $0f, $0f, $0f, $07, $00, $00, $00, $00, $00, $00, $00, $00
.byte $07, $07, $03, $03, $03, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $60, $13, $0c, $20, $18, $00, $7f, $ff, $ff, $ff, $7f, $7f, $3f, $1c
.byte $00, $00, $01, $06, $00, $84, $78, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $02, $00, $84, $18, $72, $04, $00, $00, $ff, $fe, $ff, $ff, $fe, $de, $3c, $00
.byte $00, $18, $20, $0c, $13, $e0, $00, $00, $1c, $3f, $7f, $7f, $ff, $ff, $ff, $7f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $04, $72, $18, $84, $01, $02, $00, $3c, $de, $fe, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00
.byte $00, $00, $03, $07, $05, $07, $07, $e3, $07, $7f, $3c, $18, $18, $08, $09, $e4
.byte $40, $10, $78, $fe, $ff, $1f, $1f, $0f, $7b, $6f, $87, $01, $10, $f8, $ff, $fe
.byte $00, $00, $80, $c0, $40, $c0, $c0, $8e, $c0, $fc, $78, $30, $30, $20, $20, $4e
.byte $04, $10, $3c, $ff, $ff, $f0, $f0, $e0, $bc, $ec, $c3, $00, $10, $3f, $ff, $ff
.byte $0f, $1f, $37, $3f, $3f, $3f, $3f, $3f, $f0, $f8, $f7, $cf, $c3, $c3, $c1, $c1
.byte $3e, $3e, $3e, $1f, $1e, $1f, $1e, $1f, $c1, $c1, $c1, $e0, $e1, $e0, $e1, $e0
.byte $e0, $f0, $d8, $f8, $f8, $f8, $f8, $f8, $1f, $3f, $df, $e7, $87, $87, $07, $07
.byte $f8, $f8, $f8, $f0, $f0, $f0, $f0, $f0, $07, $07, $07, $0f, $0f, $0f, $0f, $0f
.byte $1f, $0f, $0f, $0f, $0f, $0f, $0f, $07, $e1, $f3, $f5, $f9, $f9, $f5, $f3, $f9
.byte $07, $0f, $0f, $0f, $0f, $0f, $07, $00, $fb, $f5, $e9, $e9, $e5, $e3, $f1, $f9
.byte $f0, $e0, $e0, $e0, $e0, $e0, $e0, $c0, $0f, $9f, $5f, $3f, $3f, $5f, $9f, $3f
.byte $c0, $e0, $e0, $e0, $e0, $e0, $c0, $00, $bf, $5f, $2f, $2f, $4f, $8f, $1f, $3f
.byte $00, $00, $02, $10, $00, $44, $10, $a0, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $07, $0d, $12, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $80, $10, $00, $44, $10, $0a, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $80, $00, $03, $3f, $ff, $c0, $00, $00, $00, $07, $3c, $00, $00, $3f, $7f
.byte $00, $04, $00, $80, $f8, $ff, $07, $00, $00, $00, $c0, $78, $00, $00, $f8, $fc
.byte $00, $00, $00, $00, $00, $00, $00, $00, $7f, $7f, $7f, $3f, $3f, $3f, $1f, $1f
.byte $00, $00, $00, $00, $00, $c0, $60, $90, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $fc, $fc, $fc, $f8, $f8, $f8, $f0, $f0
.byte $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe
.byte $00, $00, $00, $00, $00, $c0, $f0, $fc, $ff, $ff, $ff, $ff, $3f, $0f, $03, $60
.byte $ff, $ff, $ff, $ff, $7f, $3f, $00, $00, $f8, $fe, $ff, $ff, $7f, $bf, $c0, $ea
.byte $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $00, $aa
.byte $ff, $ff, $ff, $ff, $ff, $ff, $0f, $0f, $00, $00, $ff, $ff, $ff, $ff, $0f, $af
.byte $f0, $fc, $fe, $ff, $fb, $fb, $fb, $fb, $03, $01, $f8, $fe, $fe, $ff, $ff, $ff
.byte $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $e3, $c3, $e3, $c3, $e3, $c3, $e3, $c3
.byte $fd, $fd, $fd, $fd, $fb, $fb, $fb, $fb, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $03, $03, $01, $03, $03, $07, $07, $0f, $58, $38, $58, $38, $59, $31, $53, $23
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $f6, $ce, $fc, $e0, $e0, $f0, $fc, $e6, $fe, $fe, $fc, $e1, $ea, $f5, $fe, $ff
.byte $0f, $0f, $0f, $1f, $3f, $7f, $7f, $7f, $e3, $c3, $e3, $c7, $8f, $1f, $1f, $3f
.byte $3f, $1e, $0c, $00, $00, $00, $00, $00, $3f, $de, $ad, $d2, $ed, $f3, $ff, $ff
.byte $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $ff, $ff, $ff, $ff
.byte $0f, $0f, $ff, $ff, $ff, $ff, $ff, $ff, $ef, $0f, $0f, $07, $ff, $ff, $ff, $ff
.byte $fb, $fb, $f6, $ee, $1c, $f8, $e0, $00, $ff, $ff, $fe, $fe, $fc, $f9, $e2, $0b
.byte $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $01, $03, $07, $0f, $0f, $ff, $ff, $fe, $fc, $f8, $f1, $e3, $e7
.byte $1f, $1f, $3f, $3f, $7f, $7f, $ff, $ff, $c7, $cf, $8f, $9f, $1f, $3f, $3f, $7f
.byte $00, $00, $00, $80, $c0, $e0, $f0, $f0, $ff, $ff, $7f, $3f, $1f, $8f, $c7, $e7
.byte $f8, $f8, $fc, $fc, $fe, $fe, $ff, $ff, $f3, $f3, $f9, $f9, $fc, $fc, $fe, $fe
.byte $01, $01, $03, $03, $03, $07, $07, $07, $5c, $3c, $58, $39, $51, $31, $53, $33
.byte $7f, $3f, $3f, $1f, $1f, $0f, $0f, $0f, $7f, $bf, $3f, $5f, $9f, $af, $4f, $4f
.byte $fe, $fc, $fc, $f8, $f8, $f0, $f0, $f0, $fe, $fc, $fd, $f9, $fa, $f2, $f5, $f5
.byte $80, $80, $c0, $c0, $c8, $ec, $e4, $e6, $3f, $3f, $9f, $97, $83, $c1, $c1, $c0
.byte $3f, $7f, $7f, $7f, $7f, $7f, $7f, $3f, $03, $03, $1f, $3f, $3f, $3f, $3f, $1f
.byte $f0, $f0, $f0, $f0, $f0, $f0, $f0, $f0, $f3, $f5, $f3, $f5, $f3, $f5, $f3, $f5
.byte $fe, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $fc, $fc, $fe, $fe, $fe, $ff
.byte $0f, $0f, $07, $07, $03, $03, $01, $01, $23, $43, $21, $51, $d0, $68, $e8, $f4
.byte $f0, $f0, $e0, $e0, $c0, $c0, $80, $80, $f3, $f7, $eb, $ef, $d7, $df, $af, $bf
.byte $0f, $1e, $1c, $00, $00, $00, $00, $00, $83, $c6, $8c, $c1, $aa, $d5, $ff, $ff
.byte $f0, $78, $38, $00, $00, $00, $00, $00, $31, $1b, $19, $83, $55, $ab, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $03, $07, $0f, $1f, $1f, $4f, $ef, $f7
.byte $00, $00, $00, $00, $00, $01, $03, $0f, $ff, $ff, $ff, $ff, $fe, $fc, $f0, $e3
.byte $ff, $ff, $ff, $f0, $f0, $ff, $ff, $ff, $e0, $f0, $ff, $ff, $f0, $f0, $ff, $ff
.byte $00, $00, $00, $00, $00, $fc, $fc, $f8, $ff, $ff, $ff, $ff, $01, $01, $f1, $f0
.byte $ff, $ff, $ff, $00, $00, $ff, $ff, $ff, $00, $00, $ff, $ff, $00, $00, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $87, $7c, $f9, $fb, $e9, $e3, $e3, $81
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $80, $ff, $ff, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $60, $f0, $00, $55, $aa, $ff, $ff, $df, $8f, $07
.byte $f0, $f8, $f8, $f8, $fc, $fc, $fc, $fc, $07, $02, $e3, $f0, $f1, $f8, $f9, $f8
.byte $ff, $ff, $ff, $ff, $ff, $f0, $00, $00, $00, $00, $ff, $ff, $ff, $f0, $07, $78
.byte $f0, $f0, $f0, $f0, $f0, $f0, $f0, $f0, $f0, $f5, $f2, $f5, $f3, $f5, $f3, $f5
.byte $00, $00, $00, $00, $00, $00, $00, $00, $c0, $e0, $c0, $d8, $bc, $fe, $ff, $ff
.byte $ff, $ff, $ff, $ff, $00, $0f, $ff, $f0, $00, $00, $ff, $ff, $ff, $0f, $ff, $f0
.byte $ff, $ff, $ff, $ff, $f0, $f0, $ff, $ff, $f0, $f8, $ff, $ff, $ff, $f0, $f0, $ff
.byte $0f, $0f, $0f, $00, $00, $00, $00, $00, $e3, $c3, $e7, $c0, $ea, $d5, $ff, $ff
.byte $ff, $f0, $00, $00, $00, $00, $00, $00, $ff, $f0, $07, $78, $87, $7f, $ff, $ff
.byte $00, $00, $00, $00, $00, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $01, $00, $ff, $ff
.byte $ff, $ff, $ff, $f0, $f0, $f0, $f0, $f0, $ff, $ff, $ff, $f0, $f5, $f3, $f5, $f3
.byte $f0, $f0, $ff, $ff, $ff, $cf, $c7, $c3, $f5, $f0, $f0, $e0, $ff, $cf, $df, $df
.byte $c0, $c0, $c7, $cf, $df, $ff, $ff, $ff, $df, $dc, $d8, $d0, $c7, $ff, $ff, $ff
.byte $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $1f, $cf, $f7, $ef, $ef, $f3, $fd, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $fa, $dd, $9e, $bf, $9f, $df, $cf, $81
.byte $00, $00, $00, $00, $00, $00, $00, $00, $c1, $e7, $ef, $f7, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $07, $78, $87, $7f, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $3f, $5f, $3f, $5f, $3f, $5f, $3f, $5f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $55, $aa, $ff, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $57, $af, $5f, $bf, $7f, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $7f, $ff, $bf, $5f, $5f
.byte $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $23, $43, $23, $43, $23, $43, $23, $43
.byte $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $7e, $7f, $3d, $5a, $3a
.byte $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $e3, $e3, $e3, $63, $23, $43, $23, $43
.byte $00, $00, $00, $00, $00, $00, $00, $00, $e0, $ea, $d5, $ea, $ff, $ff, $ff, $ff
.byte $1c, $3c, $38, $33, $0f, $1f, $3f, $3d, $01, $5f, $db, $bf, $41, $8f, $5f, $df
.byte $03, $3f, $3f, $38, $07, $1f, $3f, $3f, $bc, $5b, $bb, $bb, $73, $87, $5f, $9f
.byte $e0, $f0, $33, $77, $ff, $ff, $ff, $01, $00, $f0, $b7, $7f, $01, $7f, $7f, $ff
.byte $ff, $ff, $ff, $0f, $f0, $f8, $e0, $00, $30, $f7, $f7, $f7, $1f, $78, $60, $c0
.byte $03, $03, $0c, $0f, $ff, $fe, $fe, $1e, $00, $07, $1f, $3f, $03, $7f, $7f, $ff
.byte $ff, $ef, $ef, $ff, $03, $00, $00, $00, $10, $f7, $f7, $f7, $ff, $3f, $07, $03
.byte $fc, $fe, $df, $e3, $7f, $ff, $ff, $1f, $60, $ec, $ef, $ff, $83, $7f, $7f, $ff
.byte $fc, $fc, $ee, $e3, $ff, $ff, $7f, $7e, $f0, $f6, $f6, $ff, $81, $7f, $ff, $ff
.byte $27, $3f, $3f, $3f, $1f, $3f, $3f, $1f, $f8, $fb, $fb, $f8, $e1, $df, $df, $ff
.byte $1b, $2f, $3f, $1c, $3f, $3f, $3f, $1f, $fc, $fb, $fb, $ff, $ff, $ff, $ff, $ff
.byte $c0, $80, $00, $00, $00, $00, $00, $00, $40, $80, $00, $00, $00, $00, $00, $00
.byte $e7, $ef, $ef, $00, $7c, $fe, $fe, $00, $18, $f7, $f7, $ff, $80, $7f, $7f, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $03, $01, $01, $00, $00, $00, $00, $00
.byte $e6, $ef, $ef, $00, $7e, $fe, $fe, $00, $09, $f7, $f7, $f7, $81, $7f, $7f, $7f
.byte $34, $3f, $1f, $10, $1e, $1f, $1f, $07, $f8, $77, $b7, $df, $a7, $cf, $af, $df
.byte $0f, $1f, $1f, $19, $1f, $1f, $1f, $0e, $b8, $db, $bb, $df, $bf, $df, $bf, $df
.byte $00, $00, $00, $00, $00, $00, $00, $00, $2a, $57, $bf, $7f, $bf, $7f, $ff, $7f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $a8, $d4, $fa, $fc, $fa, $fc, $fe, $fc
.byte $00, $00, $00, $00, $00, $00, $00, $00, $ff, $7f, $bf, $7f, $bf, $57, $2a, $00
.byte $00, $00, $00, $00, $00, $00, $00, $00, $fe, $fc, $fa, $fc, $fa, $d4, $a8, $00
.byte $03, $73, $fb, $7f, $39, $01, $01, $01, $2b, $77, $9f, $6f, $bf, $7f, $ff, $7f
.byte $00, $00, $1c, $3e, $fc, $b8, $80, $80, $a8, $d4, $fe, $f2, $ee, $fc, $fe, $fc
.byte $fe, $fe, $fe, $fe, $00, $00, $00, $00, $fe, $aa, $fe, $54, $fa, $fc, $fe, $fc
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $00, $00, $ff, $ff, $00
.byte $be, $9e, $de, $de, $61, $31, $1d, $07, $fe, $ea, $fe, $74, $ff, $7f, $ff, $7f
.byte $fc, $fa, $f6, $f6, $8c, $98, $f0, $80, $fe, $ae, $fe, $5c, $fe, $fc, $fe, $fc
.byte $00, $00, $38, $7c, $3f, $1d, $01, $01, $ff, $7f, $bf, $4f, $b7, $5f, $2b, $01
.byte $c0, $ce, $df, $fe, $9c, $80, $80, $80, $fe, $fe, $f9, $f6, $fe, $d4, $a8, $80
.byte $00, $ce, $ce, $00, $00, $fe, $fe, $00, $00, $ce, $ef, $67, $00, $fe, $ff, $7f
.byte $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff

.dsb 32
