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
: fill             faucets open till-full faucets close ;
: flush            faucets open till-empty faucets close ;

fill
flush
fill

( Problems. Chapter 6)
