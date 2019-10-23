////// DTMF (Dual-Toil Multi-Frequent) signalling
///
/////
//
//
////// 2013-2014 (looking forward for a better year...)
//
//// **** UPDATE:  mid 2014 (it is better! :D ) ****

(
SynthDef(\dt, {|freq1=220, freq2=440, amp=0.2, at=0.2, rt=1, out=0, res=1.5, ampF=8|
	var t1, t2, env, dualtone;
	env = EnvGen.kr(Env.perc(at, rt), doneAction:2);
	t1 = SinOsc.ar(freq1);
	t2 = Saw.ar(freq2-FSinOsc.kr(90).range(1, 500));
	dualtone = t1+t2;
	dualtone = (dualtone*0.7) + BPF.ar(dualtone, (freq1*res).lag(3), 0.1, ampF);
	Out.ar(out, Limiter.ar((dualtone*env), 0.9).dup * amp);
	}).store;

SynthDef(\clpulse, {|freq=880, rate=0.7, out=1, at=37, rt=7, amp=1, gate=1|
	var in, env;
	env = EnvGen.kr(Env.adsr(at, releaseTime: rt, curve: \sin), gate, doneAction:2);
	in = Pulse.ar(freq, 0.1, LFPulse.kr(rate)) * amp;
	Out.ar(out, (in*env));
}).store;

~tel1=0.1;
~hawaii = Buffer.read(s, "/Users/fina/Desktop/DTMF signalling/Fringe/electronics/SC/hawaii.wav");
~tv = Buffer.read(s,"/Users/fina/Desktop/DTMF signalling/Fringe/electronics/SC/tv.aif");
);


// I
(
Pdef(\songA).fadeTime_(8);
Pdef(\songA2).fadeTime_(8);
Pdef(\songA3).fadeTime_(8);
Pdef(\songB).fadeTime_(8);
);



/// I
Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "a4".namecps, \amp, 0.5, \out, 0)}).play(quant: Quant(1));

Pdef(\songA2, {Pbind(\instrument, \clpulse, \delta, 1/2, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "a4".namecps, \amp, 0.1, \out, 0)}).play(quant: Quant(1));

Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1/3, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "eb3".namecps, \amp, 0.3, \out, 1)}).play(quant: Quant(1));

Pdef(\songA2, {Pbind(\instrument, \clpulse, \delta, 1/3, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "a3".namecps, \amp, 0.5, \out, Pseq([0,1], inf))}).play(quant: Quant(1)); // ---> 1/3

Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1/4, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "a4".namecps, \amp, 0.5, \out, 1)}).play(quant: Quant(1)); // stays

// Pdef(\songA3, {Pbind(\instrument, \clpulse, \delta, Pseq([Pseq([1/14], 14), Pseq([4], 1)], inf), \at, 0.1, \rt, 0.1, \tempo, 42/60, \freq, Prand(["a1".namecps, "g1".namecps], inf), \amp, 0.2, \out, Pseq([1, 0], inf))}).play(quant: Quant(1)); // change one freq to g1 ---> 1/6

x = Synth(\dt, [\freq1, "c4".namecps, \freq2, "ab2".namecps, \rt, 10, \res, 3/4, \ampF, 0.5, \amp, 0.5]);

//// I.ii
/// (--- still while speech towards singing ---)

Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "a4".namecps, \amp, 0.1, \out, 1)}).play(quant: Quant(1));

Pdef(\songA2, {Pbind(\instrument, \clpulse, \delta, 1/3, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "eb4".namecps, \amp, 0.5, \out, 0)}).play(quant: Quant(1));

Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1/3, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "c#4".namecps, \amp, 0.5, \out, 1)}).play(quant: Quant(1));

x = Synth(\dt, [\freq1, "c4".namecps, \freq2, "ab2".namecps, \rt, 10, \res, 3/4, \ampF, 0.9, \amp, 0.9]);

Pdef(\songA3, {Pbind(\instrument, \clpulse, \delta, 2, \at, 0.1, \rt, 0.1, \tempo, 42/60, \freq, "ab5".namecps, \amp, 1, \out, 0)}).play(quant: Quant(1));

// --------> TO LIVE CODING SPACE! :]

/////////////////////////////////////////////
// END
~tel1=0.2;

Pdef(\songA3).stop;

Pdef(\songA, {Pbind(\instrument, \dt, \delta, 1, \tempo, 42/60, \freq1, "eb4".namecps, \freq2, "c3".namecps, \rt, Pseq([1, 1, 1, 3], inf), \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

Pdef(\songB, {Pbind(\instrument, \dt, \delta, 1, \tempo, 42/60, \freq1, "c4".namecps, \freq2, "d4".namecps, \rt, Pseq([1, 3, 1, 1], inf), \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

Pdef(\songA2, {Pbind(\instrument, \dt, \delta, 15, \freq1, "b3".namecps, \freq2, ["f3".namecps,"f3".namecps].choose, \rt, 10, \res, 3/2, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));//--> f#

x = Synth(\dt, [\freq1, "eb3".namecps, \freq2, "b2".namecps, \rt, 10, \res, 3/4, \ampF, 0.5, \amp, 0.5]);
// eb & e

// live coding...
Pdef(\songA, {Pbind(\instrument, \dt, \delta, 1, \tempo, 42/60, \freq1, "b4".namecps, \freq2, "a3".namecps, \rt, Pseq([1, 1, 1, 3], inf), \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

// RING!!!! to scene II
PdefAllGui(8);

/////// Hypothesis
~tel1 = 0.2;
Pdef(\songA, {Pbind(\instrument, \dt, \delta, 1, \tempo, 42/60, \freq1, "eb4".namecps, \freq2, "c3".namecps, \rt, Pseq([1, 1, 1, 3], inf), \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

Pdef(\songB, {Pbind(\instrument, \dt, \delta, 1, \tempo, 42/60, \freq1, "b4".namecps, \freq2, "d4".namecps, \rt, Pseq([1, 3, 1, 1], inf), \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

Pdef(\songA2, {Pbind(\instrument, \dt, \delta, 15, \freq1, "b3".namecps, \freq2, ["f3".namecps,"f3".namecps].choose, \rt, 10, \res, 3/2, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));//--> f#

//////

Pdef(\songA, {Pbind(\instrument, \dt, \delta, 8, \tempo, 42/60, \freq1, "eb4".namecps, \freq2, "c3".namecps, \rt, Pseq([1, 1, 1, 3], inf), \res, 3/4, \rt, 8, \amp, Pfunc({~tel1}))}).play(quant: Quant(1)).fadeTime_(0.1);

Pdef(\songB, {Pbind(\instrument, \dt, \delta, 7, \tempo, 42/60, \freq1, "c4".namecps, \freq2, "b4".namecps, \rt, Pseq([1, 3, 1, 1], inf), \rt, 5, \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

Pdef(\songA2, {Pbind(\instrument, \dt, \delta, 15, \freq1, "b3".namecps, \freq2, ["f3".namecps,"f3".namecps].choose, \rt, 10, \res, 3/2, \amp, Pfunc({~tel1}))}).play(quant: Quant(1)).fadeTime_(0.1);//--> f#


x = Synth(\dt, [\freq1, "f3".namecps, \freq2, "B2".namecps, \rt, 10, \res, 3/4, \ampF, 0.7, \amp, 0.7]); //B-a-ab-f-d

//--> f# is the ring /// chord: ab-f-Bb

~tel = 0.5

Pdef(\songB, {Pbind(\instrument, \dt, \delta, 0.2, \tempo, 42/60, \freq1, "f4".namecps, \freq2, "d3".namecps, \rt, Pseq([1, 1, 1, 3]/3, inf), \res, 3/4, \rt, 0.1, \amp, Pfunc({~tel1}))}).play(quant: Quant(1)).fadeTime_(0);

Pdef(\songA2, {Pbind(\instrument, \dt, \delta, 3, \freq1, "b3".namecps, \freq2, ["f3".namecps,"f3".namecps].choose, \rt, 10, \res, 3/2, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));//--> f#

/// THE B
Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "B2".namecps, \amp, 0.2, \out, Pseq([0, 1], inf))}).play(quant: Quant(1));



//************************ SANDRA transitions with 3 pitches <--->
x = Synth(\dt, [\freq1, "f3".namecps, \freq2, "b2".namecps, \rt, 10, \res, 3/4, \ampF, 0.5, \amp, 0.5]); //B-a-ab-f-d



/// *** susan out **** \\

Pdef(\songA).fadeTime_(2);
Pdef(\songB).fadeTime_(2);


// SOFA
Pdef(\songA2, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "f4".namecps, \amp, 0.2, \out, Pseq([0, 1]+0, inf))}).play(quant: Quant(1));

Pdef(\songB, {Pbind(\instrument, \clpulse, \delta, 1.3, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "b4".namecps, \amp, 0.2, \out, Pseq([0, 1]+0, inf))}).play(quant: Quant(1));

Pdef(\songB2, {Pbind(\instrument, \clpulse, \delta, 1.5, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "ab4".namecps, \amp, 0.2, \out, Pseq([0, 1]+0, inf))}).play(quant: Quant(1));

Pdef(\songC, {Pbind(\instrument, \clpulse, \delta, 1/8, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, Pseq(["b3".namecps, "ab3".namecps, "f3".namecps, "d3".namecps, "d4".namecps]*2, inf), \amp, 0.2, \out, Pseq([0, 1]+4, inf))}).play(quant: Quant(1));

Pdef(\songD, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.2, \rt, 0.7, \tempo, 42/60, \freq, Pseq(["f#4".namecps, "a4".namecps,   "a5".namecps]/1, inf), \rate, Pseq([Pslide([7,2,9,4,12], 4, 3, 1), Pwhite(1/2,4)]*1, inf), \amp, 0.1, \out, Prand([1,0]+0, inf))}).play(quant: Quant(1)).fadeTime_(10); /// ~> at(0.2) and rt(0.7) high int  | rate ~> 10 | amp -> Pwhite | freq /1~4 | repeat rate Pseq inf??

PdefAllGui(8);

// newspaper

// chord
Pdef(\songA2, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "f#4".namecps, \amp, 0.2, \out, Pseq([0, 1], inf))}).play(quant: Quant(1));

Pdef(\songB, {Pbind(\instrument, \clpulse, \delta, 1.3, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "B4".namecps, \amp, 0.2, \out, Pseq([0, 1], inf))}).play(quant: Quant(1));

Pdef(\songB2, {Pbind(\instrument, \clpulse, \delta, 1.5, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "g4".namecps, \amp, 0.2, \out, Pseq([0, 1], inf))}).play(quant: Quant(1));

Pdef(\songC, {Pbind(\instrument, \clpulse, \delta, 1/8, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, Pseq(["g3".namecps, "c3".namecps, "g3".namecps, "c4".namecps, "c2".namecps], inf), \amp, 0.2, \out, Pseq([0, 1], inf))}).play(quant: Quant(1));

///// BEACH naar YELLOW
PdefAllGui(9);
/// waves

Ndef(\haw, {PlayBuf.ar(2,~hawaii.bufnum, loop:1, doneAction:2)*EnvGen.kr(Env.adsr(8, 0, 1, 8))}).play(0, 2);

Ndef(\haw).stop(10);

// YELLOW
Pdef(\haw).fadeTime_(8);
Pdef(\haw, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.2, \rt, 0.7, \tempo, 42/60, \freq, "g2".namecps, \rate, 0.7, \amp, 0.3, \out, 1)}).play(quant: Quant(1)).fadeTime_(2); /// ~> at(0.2) and rt(0.7) high int  | rate ~> 10 | amp -> Pwhite | freq ~> *12  ////*harmony*\\\ modulate to b-d

// ~~~~~~> YELLOW

Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1/14, \at, 0.1, \rt, 4, \tempo, 42/60, \freq, "c3".namecps, \amp, 0.3, \out, 1)}).play(quant: Quant(1)); /// ----> d3

Pdef(\songA2, {Pbind(\instrument, \clpulse, \delta, 1/19, \at, 0.1, \rt, 3, \tempo, 42/60, \freq, "g1".namecps, \amp, 0.3, \out, 0)}).play(quant: Quant(1)); //g1 for good speakers  ----> b2


Ndef(\haw).fadeTime_(2);

Ndef(\haw, {Saw.ar("f3".namecps, 2) * LFPulse.kr(8).range(0, 1)}).play(1, 1);
Ndef(\haw).stop(10);

PdefAllGui(6);
/// harmony
Ndef(\yell).fadeTime_(6);

//yellow 1
Ndef(\yell, {Saw.ar(["c4".namecps, "g3".namecps]) * LFPulse.kr(1/4).range(0, 0.5)}).play(0, 2);

// yellow 2   | yeyeyeyeyyeyeyeyeyyeyeyeyey
Ndef(\yell, {Saw.ar(["d4".namecps, "a3".namecps]) * LFPulse.kr(1/4).range(0, 0.5)}).play(0, 2);

// yellow 3
Ndef(\yell, {Saw.ar(["c4".namecps, "g3".namecps]) * LFPulse.kr(2)}).play(0, 2);


//clo---
Ndef(\yell, {Saw.ar(["b2".namecps, "d3".namecps]) * LFPulse.kr(2)}).play(0, 2);
// ser
Ndef(\yell, {Saw.ar(["c4".namecps, "g3".namecps]) * LFPulse.kr(1/4).range(0, 0.5)}).play(0, 2);

/// up to 8
Ndef(\yell, {Saw.ar(["c3".namecps, "g3".namecps]) * LFPulse.kr(4)}).play(0, 2);

// closer 2
Ndef(\yell, {Saw.ar(["d2".namecps, "g4".namecps]) * LFPulse.kr(4)}).play(0, 2);

Ndef(\yell, {Saw.ar(["c3".namecps, "g3".namecps]/2) * LFPulse.kr(2)}).play(0, 2);


// end
Ndef(\yell, {Saw.ar(["a4".namecps, "d3".namecps]/2) * LFPulse.kr(1)}).play(0, 2);


Ndef(\yell).stop(10);

// TV ||||| CHANGE CABLE :o

Ndef(\haw, {PlayBuf.ar(2,~hawaii.bufnum, loop:1, doneAction:2)*EnvGen.kr(Env.adsr(8, 0, 1, 8))}).play(0, 2);
Ndef(\haw).stop(5);

Ndef(\tv, {PlayBuf.ar(2,~tv.bufnum, loop:0, doneAction:2)*8}).play(0, 2);

PdefAllGui(10);


// connect TV
// LAST RING:

// Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.1, \rt, 1, \tempo, 42/60, \freq, "a4".namecps, \amp, 0.5, \out, 0)}).play(quant: Quant(1));
