#include "fgen_h.sco"

f 301 0 16384 7 1 8192 1 0 -1 8192 -1
$FGEN128(300'4096'301'1)

f 1 0 1024 10 1
f 2 0 1024 8 0 97 1 170 2.583 757 0

/* ---- TR-808 kick drum ---- */
f 25 0 16 -2	30000			/* amplitude scale	     */
		0.0215			/* delay		     */
		0.02			/* release time		     */
		0	1	0	/* X, Y, Z coordinates	     */
		23			/* base freq. (MIDI note)    */
		4			/* start freq. / base frq.   */
		0.007			/* frq. envelope half-time   */
		0.25			/* start phase (0..1)	     */
		100			/* lowpass filter frequency  */
		0.03			/* decay half-time	     */

/* ---- TR-808 hi-hat (closed) ---- */
i 1 0 0 102 600 1 0 4 6			; hihat

f 41 0 32 -2	
		2000			/* amplitude scale	     */
		0.01			/* delay		     */
		0.02			/* release time		     */
		-1.87	-1	0	/* X, Y, Z coordinates	     */
		73				/* base freq. (MIDI note)    */
		1.4471	1.6170		/* osc 2, 3 freq. / base frq */
		1.9265	2.5028	2.6637	/* osc 4, 5, 6 frq / base f. */
		0.25			/* distort start (see orc)   */
		1		 		/* distortion env. half-time */
		0.25			/* distort end		     */
		1000	    0.5		/* highpass freq, resonance  */
		0.02			/* attack time		     */
		0.025	0.25		/* decay time 1, level 1     */
		0.025			/* decay 2 half-time	     */

/* ---- TR-909 snare drum 3 ---- */

f 52 0 32 -2	17000			/* amplitude scale	     */
		0.02			/* delay		     */
		0.04			/* release time		     */
		0.75	1	0	/* X, Y, Z coordinates	     */
		52			/* base freq. (MIDI note)    */
		2.0			/* start freq. / base frq.   */
		0.005			/* frequency env. half-time  */
		0.2	0.01	0	/* FM depth start, envelope  */
					/*   half-time, end	     */
		1.4983			/* osc 2 frq. / osc 1 frq.   */
		1	0.04	0	/* osc 2 amp. start, env.    */
					/*   half-time, end	     */
		5000	7500		/* noise BP freq., bandwidth */
		0	0.005	1	/* noise amp. start, env.    */
					/*   half-time, end	     */
		0.02			/* decay envelope half-time  */

/* ---- rim shot ---- */

f 56 0 32 -2	10000	/* amplitude scale	     */
		0.0195			/* delay		     */
	0.03			/* release time		     */
		-1.5	0.5	0	/* X, Y, Z coordinates	     */
		56				/* base freq. (MIDI note)    */
		2				/* start freq. / base frq.   */
		0.0025			/* frequency env. half-time  */
		3	0.02	0	/* FM depth start, envelope  */
						/*   half-time, end	     */
		0.1	2000		/* noise amp., lowpass frq.  */
		4	0.006	0	/* amplitude (before	     */
						/*   distortion) start, env. */
						/*   half-time, end	     */
		-3	2000	0.0002	/* highpass filtered signal  */
						/*   (after distortion) amp, */
						/*   cutoff frequency, delay */
		2000	0.009	100	/* output lowpass start frq, */
						/*   env. half-time, end frq */

;sine

f 700 0 4096 10 1

t 0 52

#define Bars #64#
#define Harmony  #i102# 
#define Bass  #i102#
#define Kick #i21#
#define Rim #i52#
#define Tune #0.00#

{ $Bars. CNT

  $Bass.	[0 +  0.05 + (16 * $CNT.)]	0.5	44	[5.10+$Tune.]	1	1	1	1	2	0.5
  i .	    [4 +  0.05 + (16 * $CNT.)]	0.5	.	6.02	.	.	.	.	.	.
  i .	    [8 +  0.05 + (16 * $CNT.)]	.	.	6.02	.	.	.	.	.	.
  i .	    [12 + 0.05 + (16 * $CNT.)]	.	.	6.00	.	.	.	.	.	.

  $Kick.	[0 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[0.5 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[2.5 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[4 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[5.5 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[6.5 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[8 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[10.5 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[12 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[13.5 + (16 * $CNT.)]	3	25	120	35
  $Kick.	[15.5 + (16 * $CNT.)]	3	25	120	35

  ;;TOMS
  i .	[1.5 + (16 * $CNT.)]	1	28	80	55
  i .	[7.5 + (16 * $CNT.)]	1	25	80	55
  i .	[11.5 + (16 * $CNT.)]	1	25	80	55
  i .	[14.5 + (16 * $CNT.)]	1	25	80	55







  $Harmony. [0 + (16 * $CNT.)]	20	25	8.00 1 1 0 . . 0
  i .	    [0 + (16 * $CNT.)]	.	    .	8.05 . . . . . .
  i .	    [0 + (16 * $CNT.)]  .	    .	8.07 . . . . . .
  i .	    [0 + (16 * $CNT.)]	.	    .	8.09 . . . . . .
  i .	    [12 + (16 * $CNT.)]	4	    .	8.11 . . . . . .

  ;i .	    [8 + (16 * $CNT.)]	8	    30	8.00 . . . . . .
  ;i .	    [8 + (16 * $CNT.)]	.	    .	8.05 . . . . . .
  ;i .	    [8 + (16 * $CNT.)]	.	    .	8.07 . . . . . .
  ;i .	    [12 + (16 * $CNT.)]	8	    .	8.00 . . . . . .
  ;i .	    [12 + (16 * $CNT.)]	.	    .	8.05 . . . . . .
  ;i .	    [12 + (16 * $CNT.)]	.	    .	8.07 . . . . . .
  ;i 102	[2 + (16 * $CNT.)]	1	    35	8.00	1	0.1	1	1	2	1
  ;i .	[0 + (16 * $CNT.)]	4	.	    8.05	.	.	.	.	.	.
  ;i .	[0 + (16 * $CNT.)]	.	.	    8.09	.	.	.	.	.	.
  ;i .	[0 + (16 * $CNT.)]	.	.	    8.12	.	.	.	.	.	.

  { 32 SMBR
    $Rim.	[1 + (4 * $SMBR.) + (32 * $CNT.)]	0.01	56    60
    $Rim. 	[3 + (4 * $SMBR.) + (32 * $CNT.)]	0.01	56    25
  }

  {  4 SMBR 
	  i 40	[0   + (2 * $SMBR.) + (16 * $CNT.)] 0.3 41	 85
      i 40	[0.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[1   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[1.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[2   + (. * $SMBR.) + (16 * $CNT.)] . . .
 	  i 40	[2.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[3   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[3.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[4   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[4.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[5   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[5.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[6   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[6.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[7   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[7.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[8   + (. * $SMBR.) + (16 * $CNT.)] . . .
      i 40	[8.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[9   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[9.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[10   + (. * $SMBR.) + (16 * $CNT.)] . . .
 	  i 40	[10.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[11   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[11.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[12   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[12.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[13   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[13.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[13   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[14.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[15   + (. * $SMBR.) + (16 * $CNT.)] . . .
	  i 40	[15.5 + (. * $SMBR.) + (16 * $CNT.)] . . .
  }
}

i 99 0 120 0.3
