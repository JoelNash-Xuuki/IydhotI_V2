sr		=	44100		
kr		=	4410
ksmps	=	10
nchnls	=	2

	instr 1
	iphaseSet = 0
	iamp = ampdb(p4)
	ilen tableng 1 ; get length of sample
	p3 = ilen/ sr ; scale length to score event
	aphas phasor 1/p3
	aphas = (aphas + iphaseSet) * ilen
	asig tablekt aphas, 1
	asig = asig * iamp
	outs asig, asig

	endin
