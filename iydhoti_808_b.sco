#include "fgen_h.sco"

f 301 0 16384 7 1 8192 1 0 -1 8192 -1

$FGEN128(300'4096'301'1)

f 1 0 16384 10 1
f 2 0 1024 8 0 97 1 170 0.583 757 0

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

f 41 0 32 -2	800			/* amplitude scale	     */
		0.02			/* delay		     */
		0.03			/* release time		     */
		-1.87	-1	0	/* X, Y, Z coordinates	     */
		73			/* base freq. (MIDI note)    */
		1.4471	1.6170		/* osc 2, 3 freq. / base frq */
		1.9265	2.5028	2.6637	/* osc 4, 5, 6 frq / base f. */
		0.25			/* distort start (see orc)   */
		1		 		/* distortion env. half-time */
		0.25			/* distort end		     */
		1000	    0.5		/* highpass freq, resonance  */
		0.0005			/* attack time		     */
		0.025	0.5		/* decay time 1, level 1     */
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
i 21	0	1	25	120	35
i 21	1	0.5	25	120	35
i 99 0 2 0.3
s

t 0 52
; ins	st	 		dur	amp	frq	car	mod	index	func	env	pan
;=========================================================================


{ 1 CNT

; BASS
i 102	[0 +  0.05 + (16 * $CNT.)]	0.5	44	5.102	1	1	1	1	2	0.5
i .	    [4 +  0.05 + (16 * $CNT.)]	0.5	.	6.022	.	.	.	.	.	.
i .	    [8 +  0.05 + (16 * $CNT.)]	.	.	6.022	.	.	.	.	.	.
i .	    [12 + 0.05 + (16 * $CNT.)]	.	.	6.002	.	.	.	.	.	.

;; 808 KICK
i 21	[0 + (16 * $CNT.)]	3	25	120	35
i 21	[2.5 + (16 * $CNT.)]	3	25	120	35
i 21	[6 + (16 * $CNT.)]	3	25	120	38
;i 21	[12 + (16 * $CNT.)]	3	25	120	38
;i 21	[15.5 + (16 * $CNT.)]	3	25	120	35
;
;; HARMONY
;i 102	[2 + (16 * $CNT.)]	1	35	8.00	1	0.1	1	1	2	1
;i .	[0 + (16 * $CNT.)]	4	.	8.05	.	.	.	.	.	.
;i .	[0 + (16 * $CNT.)]	.	.	8.09	.	.	.	.	.	.
;i .	[0 + (16 * $CNT.)]	.	.	8.12	.	.	.	.	.	.

i 102 [2 + (16 * $CNT.)]	2	30	8.00	1	1	0	.	.	0
i .	  [2 + (16 * $CNT.)]	.	20	8.05	.	.	.	.	.	.
i .	  [2 + (16 * $CNT.)]	.	.	8.09	.	.	.	.	.	.
i .	  [2 + (16 * $CNT.)]	.	.	8.12	.	.	.	.	.	.

i .	[6 + (16 * $CNT.)]	.	30	8.00	.	.	0	.	.	. 
i .	[6 + (16 * $CNT.)]	.	25	8.05	.	.	.	.	.	. 
i .	[6 + (16 * $CNT.)]	.	.	8.09	.	.	.	.	.	.
i .	[6 + (16 * $CNT.)]	.	.	8.07	.	.	.	.	.	.

i .	[10 + (16 * $CNT.)]	.	30	8.00	.	.	.	.	.	.
i .	[10 + (16 * $CNT.)]	.	25	8.05	.	.	.	.	.	.
i .	[10 + (16 * $CNT.)]	.	.	8.09	.	.	.	.	.	.
i .	[10 + (16 * $CNT.)]	.	.	8.07	.	.	.	.	.	.

i .	[14 + (16 * $CNT.)]	.	30	8.00	.	.	.	.	.	.
i .	[14 + (16 * $CNT.)]	.	25	8.05	.	.	.	.	.	.
i .	[14 + (16 * $CNT.)]	.	.	8.07	.	.	.	.	.	.
i .	[14 + (16 * $CNT.)]	.	.	8.11	.	.	. 	.	.	.


  { 4 SMBR
    ; RIM
    ; ins	st	  				dur 	amp	frq     atk	rel	cut1	cut2	pan
    ;;==================================================================================
    i 52	[1 + (4 * $SMBR.) + (16 * $CNT.)]	0.02	56	50
    i 52	[3 + (4 * $SMBR.) + (16 * $CNT.)]	0.02	56	50
  }
;
;
;  { 4 SMBR
;    ; SNARE
;    ; ins	st	 			dur 	amp	frq     atk	rel	cut1	cut2	pan
;    ;======================================================================================
;    ;i 50	[15.5 + (4 * $SMBR.) + (16 * $CNT.)]	.01	52	100
;  
;  }
;
;  { 4 SMBR
;      { 1 SMQV
;        ;HI-HATS
;        ;ins	st  dur  amp  frq  atk	rel		 cut1   cut2  pan
;        ;============================================================== =================
;        i 40	[0.03 + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $CNT.)]       0.001	41	  100
;        i 40	[+ + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $CNT.)]       0.001	41	  100
;        i 40	[. + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $CNT.)]       0.001	41	  100
;        i 40	[. + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $CNT.)]       0.001	41	  100
;        i 40	[. + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $CNT.)]       0.001	41	  100
;        i 40	[. + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $CNT.)]       0.001	41	  100
;        i 40	[. + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $CNT.)]       0.001	41	  100
;        i 40	[. + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $CNT.)]       0.001	41	  100
;      }
;  }
}

i 99 0 16 0.3
