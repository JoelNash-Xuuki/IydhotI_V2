sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         2

			instr 	901
inotedur	=		p3
imaxamp		=		ampdb(p4)
icarrfreq	=		cpspch(p5)
imodfreq	=		p6
ilowndx		=		p7
indxdiff	=		p8-p7

; PARAMETERS DEFINING THE ADSR AMPLITUDE ENVELOPE
; TIMES ARE A PERCENTAGE OF p3
;   attack amp  = p9     attack length  = p14
;   decay amp   = p10    decay length   = p15
;   sustain amp = p11    sustain length = p16
;   release amp = p12    release length = p17
;   end amp     = p13

; PARAMETERS DEFINING THE ADSR FREQ DEVIATION ENVELOPE
; TIMES ARE A PERCENTAGE OF p3
;   attack amp  = p18    attack length  = p23
;   decay amp   = p19    decay length   = p24
;   sustain amp = p20    sustain length = p25
;   release amp = p21    release length = p26
;   end amp     = p22

kfr		linseg	1, p29*p3, p30, p31*p3, 1

aampenv		linseg	p9, p14*p3, p10, p15*p3, p11, p16*p3, p12, p17*p3, p13
adevenv		linseg	p18, p23*p3, p19, p24*p3, p20, p25*p3, p21, p26*p3, p22
amodosc		oscili	(ilowndx+indxdiff*adevenv)*imodfreq, imodfreq, 1
acarosc		oscili	(imaxamp*aampenv), (icarrfreq*kfr)+amodosc, 1
kpan 		line p27, p3, p28 

			outs	acarosc * kpan, acarosc *(1-kpan)
			endin

		instr	129
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq	
afilt	tone	anoise, kcut
kpan 	line p10, p3, p11 
       	outs  	(afilt*kenv) * kpan, (afilt*kenv) * (1-kpan)
       	out  	afilt*kenv
		dispfft	afilt, idur, 4096
		endin

	instr	130
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq	
afilt2	tone	anoise, kcut
afilt1	tone	afilt2, kcut
kpan 	line p10, p3, p11 
       	outs  	(afilt1*kenv) * kpan, (afilt1*kenv) * (1-kpan)
	dispfft	afilt1, idur, 4096
	endin
		
	instr	131
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq	
afilt3	tone	anoise, kcut
afilt2	tone	afilt3, kcut
afilt1	tone	afilt2, kcut
kpan 	line p10, p3, p11 
       	outs  	(afilt1*kenv) * kpan, (afilt1*kenv) * (1-kpan) 
	dispfft	afilt1, idur, 4096
	endin
		
	instr	132
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq	
afilt4	tone	anoise, kcut
afilt3	tone	afilt4, kcut
afilt2	tone	afilt3, kcut
afilt1	tone	afilt2, kcut
kpan 	line p10, p3, p11 
       	outs  	(afilt1*kenv) * kpan, (afilt1*kenv) * (1-kpan)
	dispfft	afilt1, idur, 4096
	endin
