f 1 0 1024 10 1    
f 2 0 1024 8 0 97 1 170 0.583 757 0

t 0 60
; ins	st	 		dur	amp	frq	car	mod	index	func	env	pan
;===================================================================================================

{ 4 CNT

;; BASS
i 102	[0 + (16 * $CNT.)]	1.5	44	5.10	1	1	1	1	2	0.5
i .	[4 + (16 * $CNT.)]	.	.	6.02	.	.	.	.	.	.
i .	[8 + (16 * $CNT.)]	.	.	6.02	.	.	.	.	.	.
i .	[12 + (16 * $CNT.)]	.	.	6.00	.	.	.	.	.	.

;; HARMONY
i .	[2 + (16 * $CNT.)]	1	35	8.00	1	0.1	1	.	.	1
i .	[2 + (16 * $CNT.)]	.	.	8.05	.	.	.	.	.	.
i .	[2 + (16 * $CNT.)]	.	.	8.09	.	.	.	.	.	.
i .	[2 + (16 * $CNT.)]	.	.	8.12	.	.	.	.	.	.
i .	[2 + (16 * $CNT.)]	4	30	8.00	1	1	0	.	.	0
i .	[2 + (16 * $CNT.)]	.	.	8.05	.	.	.	.	.	.
i .	[2 + (16 * $CNT.)]	.	.	8.09	.	.	.	.	.	.
i .	[2 + (16 * $CNT.)]	.	.	8.12	.	.	.	.	.	.

i .	[6 + (16 * $CNT.)]	.	30	8.00	.	.	0	.	.	. 
i .	[6 + (16 * $CNT.)]	.	25	8.05	.	.	.	.	.	. 
i .	[6 + (16 * $CNT.)]	.	.	8.09	.	.	.	.	.	.
i .	[6 + (16 * $CNT.)]	.	.	8.07	.	.	.	.	.	.

i .	[10 + (16 * $CNT.)]	.	30	8.00	.	.	.	.	.	.
i .	[10 + (16 * $CNT.)]	.	25	8.05	.	.	.	.	.	.
i .	[10 + (16 * $CNT.)]	.	.	8.09	.	.	.	.	.	.
i .	[10 + (16 * $CNT.)]	.	.	8.07	.	.	.	.	.	.

i .	[14 + (16 * $CNT.)]	2	30	8.00	.	.	.	.	.	.
i .	[14 + (16 * $CNT.)]	2	25	8.05	.	.	.	.	.	.
i .	[14 + (16 * $CNT.)]	2	.	8.07	.	.	.	.	.	.
i .	[14 + (16 * $CNT.)]	2	.	8.11	.	.	. 	.	.	.

}

{ 4 LOOP_L
{ 8 TNOTES

;; WHITE NOISE
;; ins	st	  							dur			amp	frq     atk	rel	cut1	cut2	pan
;;====================================================================================================================================
i 129	[0 + (2 * $TNOTES.) + (16 * $LOOP_L.)]	[3 - ($TNOTES. % 2)]	0.2	20000	2.5	.5	1000	50	[$TNOTES. % 2]

}
}

{ 4 LOOP_L
{ 4 SMBR

;; RIM
;; ins	st	  				dur 	amp	frq     atk	rel	cut1	cut2	pan
;;==================================================================================================
i .	[0.23 + (4 * $SMBR.) + (16 * $LOOP_L.)]	0.02	1	15000	.001 	.01	8000	60	0.5

}
}

{ 4 LOOP_L
{ 4 SMBR

;; SNARE
;; ins	st	  						dur 	amp	frq     atk	rel	cut1	cut2	pan
;;=================================================================================================================
;;i .	[2.75 - 0.0075 + (4 * $SMBR.) + (16 * $LOOP_L.)]	.05	.5	20000	.01	.105 	10000	30000	.5
i .	[2.75 +          (4 * $SMBR.) + (16 * $LOOP_L.)]	.22	.8	10000	.005	.21 	10000	30000	.5
;;i .	[2.75 + 0.0025 + (4 * $SMBR.) + (16 * $LOOP_L.)]	.	.	.	.	. 	.	.	.
;;
;;i .	[3.25 - 0.0075 + (4 * $SMBR.) + (16 * $LOOP_L.)]	.	.	.	.	. 	.	.	.
i .	[3.25 +          (4 * $SMBR.) + (16 * $LOOP_L.)]	.	.	.	.	. 	.	.	.
;;i .	[3.25 + 0.0025 + (4 * $SMBR.) + (16 * $LOOP_L.)]	.	.	.	.	. 	.	.	.

;;i .	[3.75 - 0.0075 + (4 * $SMBR.) + (16 * $LOOP_L.)]	.	.	.	.	. 	.	.	.
;;i .	[3.75 +          (4 * $SMBR.) + (16 * $LOOP_L.)]	.	.	.	.	. 	.	.	.
;;i .	[3.75 + 0.0025 + (4 * $SMBR.) + (16 * $LOOP_L.)]	.	.	.	.	. 	.	.	.
}
}

{ 4 LOOP_L
{ 4 SMBR

{ 14 SMQV

;; HI-HATS
;; ins	st	  						dur 	amp	frq     atk	rel	cut1	cut2	pan
;;=================================================================================================================
i .	[0 + (0.25 * $SMQV.) + (4 * $SMBR.) + (16 * $LOOP_L.)]	0.01	0.2	40000	.001	.005	40000	30000	0.5

}

{ 4 TRIP_SQ

;; ins	st	  							dur 	amp	frq     atk	rel	cut1	cut2	pan
;;=================================================================================================================
i .	[3.5 + (0.16667 * $TRIP_SQ.) + (4 * $SMBR.) + (16 * $LOOP_L.)]	0.01	0.3	40000	.001	.005	40000	30000	0.5

}

}
}
