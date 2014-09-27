Red/System []


#include %../common/common.reds
#include %../SDL/SDL.reds

;;;SDL related defines
#define SCREEN-HEIGHT  32
#define SCREEN-WIDTH   64
#define SCREEN-BPP      32
#define SCALE           10

;;;CPU related defines
#define low-byte (word)       [(as-byte word)]  ; and FFh
#define high-byte (word)      [(as-byte word >>> 8)]  ; and FFh
#define addr (word)            [(word and 0FFFh)]
#define x-4 (word)            [vx: (word and 0F00h) >> 16]
#define y-4 (word)            [(word and 00F0h) >> 8]
;;;;; nnn or addr - A 12-bit value, the lowest 12 bits of the instruction
;;;;; n or nibble - A 4-bit value, the lowest 4 bits of the instruction
;;;;; x - A 4-bit value, the lower 4 bits of the high byte of the instruction
;;;;; y - A 4-bit value, the upper 4 bits of the low byte of the instruction
;;;;; kk or byte - An 8-bit value, the lowest 8 bits of the instruction


chip8: context [
      ;   Memory Map:
      ;   +---------------+= 0xFFF (4095) End of Chip-8 RAM
      ;   |               |
      ;   |               |
      ;   |               |
      ;   |               |
      ;   |               |
      ;   | 0x200 to 0xFFF|
      ;   |     Chip-8    |
      ;   | Program / Data|
      ;   |     Space     |
      ;   |               |
      ;   |               |
      ;   |               |
      ;   +- - - - - - - -+= 0x600 (1536) Start of ETI 660 Chip-8 programs
      ;   |               |
      ;   |               |
      ;   |               |
      ;   +---------------+= 0x200 (512) Start of most Chip-8 programs
      ;   | 0x000 to 0x1FF|
      ;   | Reserved for  |
      ;   |  interpreter  |
      ;   +---------------+= 0x000 (0) Start of Chip-8 RAM
      
      memory: allocate 00000FFFh

      unless as-logic memory [
            print-line "Failed to allocate memory!"
            quit 10
      ]

      v: allocate 0000000Fh

      unless as-logic v [
            print-line "Failed to allocate registers!"
            quit 10
      ]

      stack: allocate 0000000Fh
      unless as-logic v [
            print-line "Failed to allocate stack!"
            quit 10
      ]

      ;;sp: declare pointer! [byte!]
      sp: 1

      ;pc: declare pointer! [byte!]
      ;Program counter starts at address 0x200
      pc: 0200h
      ;Index pointer
      i: 0200h

      ;Should be in #{0050} to #{00A0}

      fontset: "^(F0)^(90)^(90)^(90)^(F0)^(20)^(60)^(20)^(20)^(70)^(F0)^(10)^(F0)^(80)^(F0)^(F0)^(10)^(F0)^(10)^(F0)^(90)^(90)^(F0)^(10)^(10)^(F0)^(80)^(F0)^(10)^(F0)^(F0)^(80)^(F0)^(90)^(F0)^(F0)^(10)^(20)^(40)^(40)^(F0)^(90)^(F0)^(90)^(F0)^(F0)^(90)^(F0)^(10)^(F0)^(F0)^(90)^(F0)^(90)^(90)^(E0)^(90)^(E0)^(90)^(E0)^(F0)^(80)^(80)^(80)^(F0)^(E0)^(90)^(90)^(90)^(E0)^(F0)^(80)^(F0)^(80)^(F0)^(F0)^(80)^(F0)^(80)^(80)"

      i: 0050h
      j: i - 0050h
      while [i < 00A0h] [
            memory/i: fontset/j
            i: i + 1
            j: i - 0050h
      ]

      opcode: 0000h

      get-opcode: does [
            pc1: pc + 1
            opcode: (("^(00)" or (memory/pc1)) << 16)  or ("^(00)" or (memory/pc))
      ]

      get-opcode

      decode-opcode: does [
            op-1: (opcode and F000h)
            switch op-1 [
                  0000h [
                        switch low-byte opcode [
                        ;;;  00E0 - CLS
                              E0h [cls]
                        ;;;  00EE - RET
                              EEh [ret]
                        ;;;  0nnn - SYS addr
                              default [sys addr opcode]
                        ]
                  ]
                  1000h [      
                        ;;;  1nnn - JP addr
                        JP addr opcode
                  ]
                  2000h [
                        ;;;  2nnn - CALL addr
                        call addr opcode
                  ]
                  3000h [
                        ;;;  3xkk - SE Vx, byte
                        se3 (x-4 opcode) (low-byte opcode)
                  ]
                  4000h [
                        ;;;  4xkk - SNE Vx, byte
                        sne4 (x-4 opcode) (low-byte opcode)
                  ]
                  5000h [
                        ;;;  5xy0 - SE Vx, Vy
                        se (x-4 opcode) (y-4 opcode)
                  ]
                  6000h [
                        ;;;  6xkk - LD Vx, byte
                        ld (x-4 opcode) (low-byte opcode)
                  ]
                  7000h [
                        ;;;  7xkk - ADD Vx, byte
                        addv (x-4 opcode) (low-byte opcode)
                  ]
                  8000h [
                        switch (oppcode and 000Fh) [
                        ;;;  8xy0 - LD Vx, Vy
                              00h [ld (x-4 opcode) (y-4 opcode)]
                        ;;;  8xy1 - OR Vx, Vy
                              01h [orx (x-4 opcode) (y-4 opcode)]
                        ;;;  8xy2 - AND Vx, Vy
                              02h [andx (x-4 opcode) (y-4 opcode)]
                        ;;;  8xy3 - XOR Vx, Vy
                              03h [xorx (x-4 opcode) (y-4 opcode)]
                        ;;;  8xy4 - ADD Vx, Vy
                              04h [addx (x-4 opcode) (y-4 opcode)]
                        ;;;  8xy5 - SUB Vx, Vy
                              05h [sub (x-4 opcode) (y-4 opcode)]
                        ;;;  8xy6 - SHR Vx {, Vy}
                              06h [shr (x-4 opcode) (y-4 opcode)]
                        ;;;  8xy7 - SUBN Vx, Vy
                              07h [subn (x-4 opcode) (y-4 opcode)]
                        ;;;  8xyE - SHL Vx {, Vy}
                              08h [shl (x-4 opcode) (y-4 opcode)]
                        ]
                  ]
                  9000h [
                        ;;;  9xy0 - SNE Vx, Vy
                        sne (x-4 opcode) (y-4 opcode)
                  ]
                  A000h [
                        ;;;  Annn - LD I, addr
                        ld i (addr opcode)
                  ]
                  B000h [
                        ;;;  Bnnn - JP V0, addr
                        jp 0 (addr opcode)
                  ]
                  C000h [
                        ;;;  Cxkk - RND Vx, byte
                        rnd (x-4 opcode) 
                  ]
                  D000h [
                        ;;;  Dxyn - DRW Vx, Vy, nibble
                        DRW (x-4 opcode) (y-4 opcode)
                  ]
                  E000h [
                        ;;;  Ex9E - SKP Vx
                        ;;;  ExA1 - SKNP Vx
                  ]
                  F000h [
                        switch low-byte 
                        ;;;  Fx07 - LD Vx, DT
                        ;;;  Fx0A - LD Vx, K
                        ;;;  Fx15 - LD DT, Vx
                        ;;;  Fx18 - LD ST, Vx
                        ;;;  Fx1E - ADD I, Vx
                        ;;;  Fx29 - LD F, Vx
                        ;;;  Fx33 - LD B, Vx
                        ;;;  Fx55 - LD [I], Vx
                        ;;;  Fx65 - LD Vx, [I]
                  ]
            ]
      ]
]

with sdl [
      current: version
      print ["SDL version: "
            as-integer current/major  #"."
            as-integer current/minor  #"."
            as-integer current/patch  newline
      ]


      log-error: does [  ; Log current SDL error.
            print-wide ["Error:" form-error newline]
      ]
      
      draw-pixel: function [
            pos-x [integer!]
            pos-y [integer!]
            return: [integer!]
      ] [
            x: pos-x * SCALE
            y: pos-y * SCALE
            rect: declare rectangle!
            rect/x-y: ((y << 16) or x)
            rect/width-height: SCALE << 16 or SCALE
            offset: (x + y) * pitch-px
            ;print offset
            color: offset xor FFFFFFFFh
            _fill screen rect color
            color
      ]

      ;;toggle_pixel(int pos_x, int pos_y)

      screen:                 as surface! 0
      background:             as surface! 0
      message:                as surface! 0
      image:                  as surface! 0
      pitch-px:               0
      pixels:                 declare pointer! [byte!]
      either begin with-video [
            screen: set-video-mode SCREEN-WIDTH * SCALE  SCREEN-HEIGHT * SCALE  SCREEN-BPP  software-surface
            pixels: screen/pixels
            pitch-px: (8 * screen/pitch) / SCREEN-BPP
            set-window-caption "Chip8 Emulator" null
            _fill screen NULL 0
            draw-pixel 2 2
            draw-pixel 2 2
            flip screen
            ;wait 2000
       ] [log-error]
]

 