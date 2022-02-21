( Printing stars. )

: margin   cr 30 spaces ;
: star     42 emit ;
: blip     margin star ;
: stars    0 do star loop ;
: bar      margin 5 stars ;

: F bar blip bar blip blip cr ;

( Forth arithmetic. )

: yards    36 * ;
: feet     12 * ;
: inches   ;
: yard     yards ;
: foot     feet ;
: inch     ;

: c 10 ;
: a 15 ;
: b 412 ;
: solution + * ;

c a b solution .

( a^2 + a b )

: a 12 ;
: b 513 ;
: solution over + * ;

a b solution .

: c 10 ;
: a 3 ;
: b 67 ;
: solution rot - * ;

c a b solution .

( Decisions. )

30 dup 0< swap 10 mod 0= + negate .

: vegetable?    dup 0< swap ;
: artichoke?    dup 10 mod 0= swap ;
: orange?       dup 20 mod 0= swap ;
: parse         vegetable? artichoke? orange? drop rot
		if ." NOT A VEGETABLE! " drop drop quit then
		if ." ORANGE " then
		if ." ARTICHOKE " then ;

20 parse
-20 parse

: box?          6 > rot 22 > rot 19 and and if ." BIG ENOUGH... " then ;

30 23 20 box?

( Return stack. )

: quadratic     >r swap rot I * + r> * + ;

2 7 9 3 quadratic .

( Looping. )

: test             10 0 do cr ." hello! " loop ;
: decade           10 0 do I . loop ;
: sample           -243 -250 do I . loop ;

: do-10            cr 11 1 ;
: multiplications  do-10 do dup i * . loop drop ;
: rectangle        256 0 do i 16 mod 0= if cr then ." *" loop ;
: poem             do-10 do i . ." LITTLE "
			    i 3 mod 0=
			    if ." INDIANS " cr then loop ." INDIAN BOYS " ;
: table            do-10 do i multiplications loop ;
: table            do-10 do 11 1 do i j * 5 u.r loop cr loop ;

: pentajumps       50 0 do i . 5 +loop ;
: falling          -10 0 do i . -1 +loop ;
: step-count       do i . dup +loop drop ;
: doubling         32767 1 do i . i +loop ;

( Indefinite looping. )

variable faucets
variable water-level

: open             1 swap ! ;
: close            0 swap ! ;
: operate          1 water-level +! ;

: level            ." water level ~~  " water-level @ dup . cr ;
: full?            water-level @ 64 >= dup if ." water level ~~ [FULL] !!! " cr then ;
: space-left?      full? invert ;

: till-full        begin space-left? while operate level repeat ;
: till-empty       begin -1 water-level +! water-level @ 0= until ;
: water-fill       faucets open till-full faucets close ;
: water-flush      faucets open till-empty faucets close ;

water-fill
water-flush
water-fill

( Problems. Chapter 6)

: star             42 emit ;
: stars            0 do star loop ;
: box              cr 0 do stars cr loop ;
: \stars           spacing do i spaces 10 stars cr loop ;
: /stars           spacing do dup i - spaces 10 stars cr loop ;

10 3 box
3 \stars
3 /stars

( Signed/unsigned numbers. )

: printables      127 32 do i emit space loop ;

decimal 173 hex .
0f decimal .
1000.0000 d.

: phone-number 372.8493 ;
: date 04.10.86 ;

: ud.    <# #s #> type space ;
: .ph#   <# # # # # 45 hold #s #> type space ;
: unit   # # 47 hold ;
: .date  <# unit unit  #s  #> type space ;

phone-number ud.
phone-number .ph#
date .date

: sextal 6 base ! ;
: :00    # sextal # decimal 58 hold ;
: sec    <# :00 :00 #s #> type space ;

4500. sec

