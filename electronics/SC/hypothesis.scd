/////// Hypothesis
~tel1 = 0.1;
Pdef(\songA, {Pbind(\instrument, \dt, \delta, 1, \tempo, 42/60, \freq1, "eb4".namecps, \freq2, "c3".namecps, \rt, Pseq([1, 1, 1, 3], inf), \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

Pdef(\songB, {Pbind(\instrument, \dt, \delta, 1, \tempo, 42/60, \freq1, "b4".namecps, \freq2, "d4".namecps, \rt, Pseq([1, 3, 1, 1], inf), \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

Pdef(\songA2, {Pbind(\instrument, \dt, \delta, 15, \freq1, "b3".namecps, \freq2, ["f3".namecps,"f3".namecps].choose, \rt, 10, \res, 3/2, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));//--> f#

//////

Pdef(\songA, {Pbind(\instrument, \dt, \delta, 8, \tempo, 42/60, \freq1, "eb4".namecps, \freq2, "c3".namecps, \rt, Pseq([1, 1, 1, 3], inf), \res, 3/4, \rt, 8, \amp, Pfunc({~tel1}))}).play(quant: Quant(1)).fadeTime_(0.1);

Pdef(\songB, {Pbind(\instrument, \dt, \delta, 7, \tempo, 42/60, \freq1, "c4".namecps, \freq2, "b4".namecps, \rt, Pseq([1, 3, 1, 1], inf), \rt, 5, \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1));

Pdef(\songA2, {Pbind(\instrument, \dt, \delta, 15, \freq1, "b3".namecps, \freq2, ["f3".namecps,"f3".namecps].choose, \rt, 10, \res, 3/2, \amp, Pfunc({~tel1}))}).play(quant: Quant(1)).fadeTime_(0.1);//--> f#


x = Synth(\dt, [\freq1, "a3".namecps, \freq2, "B2".namecps, \rt, 10, \res, 3/4, \ampF, 0.7, \amp, 0.7]); //B-a-ab-f-d

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


// chord
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


//
///    ----> need to fade into the wVES

Ndef(\wave, {LPF.ar(FreeVerb.ar(In.ar(4,2), 1, 1), LFtri.kr(1/6).range(300, 2400))}).play(0,2);

Ndef(\haw, {PlayBuf.ar(2,~hawaii.bufnum, loop:1, doneAction:2)*EnvGen.kr(Env.adsr(8, 0, 1, 8))}).play;

Ndef(\wave).stop(10);
Ndef(\haw).stop(10);


////////
/// build up to sofa
Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.2, \rt, 0.7, \tempo, 42/60, \freq, Pseq(["f#4".namecps, "a4".namecps,  "a5".namecps]/1, inf), \rate, Pseq([Pslide([7,2,9,4,12], 4, 3, 1), Pwhite(1/2,4)]*1, inf), \amp, 0.1, \out, Prand([1,0], inf))}).play(quant: Quant(1)).fadeTime_(10); /// ~> at(0.2) and rt(0.7) high int  | rate ~> 10 | amp -> Pwhite | freq /1~4 | repeat rate Pseq inf??


/// development AFTER SOFA
Pdef(\songA, {Pbind(\instrument, \dt, \delta, Pseq([1,1,1,3]/2, inf), \tempo, 42/60, \freq1, Pwalk(["a2".namecps, "a4".namecps,  "c3".namecps, "a2".namecps]++["c3".namecps, "a4".namecps,  "c2".namecps, "a4".namecps], 1, Pseq([1,-1],inf)), \freq2, "f#2".namecps, \rt, Pseq([1, 1, 1, Pseq([3,4,4,4,5], 1)]/3, inf), \res, 3/4, \amp, Pfunc({~tel1}))}).play(quant: Quant(1)).fadeTime_(1);//delta /3 & /6

Pdef(\songA).stop;
PdefAllGui(8);

/// development f#-a
Pdef(\songA, {Pbind(\instrument, \dt, \delta, Pseq([1,1,1,3]/3, inf), \tempo, 42/60, \freq1, Pwalk(["f#2".namecps, "a2".namecps,  "f#3".namecps, "f#2".namecps]++["f#3".namecps, "a3".namecps,  "f#2".namecps, "a2".namecps], 1, Pseq([1,-1],inf)), \freq2, "f#2".namecps, \rt, Pseq([1, 1, 1, Pseq([3,4,4,4,5], 1)]/8, inf), \res, 3/4, \amp, Pfunc({~tel1}), \out, Pseq([4,5], inf))}).play(quant: Quant(1)).fadeTime_(3);//delta /3 & /6


x = Synth(\dt, [\freq1, "a3".namecps, \freq2, "B2".namecps, \rt, 10, \res, 3/4, \ampF, 0.5, \amp, 0.5]);
// eb & e **** from Sandra ab - f - d ///// ab3-5; f3-5; e(b)3, d3;;;; freq2 => b ~ B


// TODO: ventilador (mixer), sea shore, gaviotas, 3 more phrases |||| TRY INTERFACE
/// hawaii
// Pdef(\songA2, {Pbind(\instrument, \clpulse, \delta, 1/8, \at, 0.2, \rt, 0.7, \tempo, 42/60, \freq, Pseq(["B4".namecps, "d4".namecps,  "B3".namecps]*8, inf), \rate, Pseq([Pslide([7,2,9,4,12], 2, 3, 1), Pseq([1,4], inf)]*1, inf), \amp, Pwhite(0, 0.3), \out, Prand([4,5], inf))}).play(quant: Quant(1)).fadeTime_(2); /// ~> at(0.2) and rt(0.7) high int  | rate ~> 10 | amp -> Pwhite | freq ~> *12  ////*harmony*\\\ modulate to b-d


// YELLOW
Pdef(\songA).fadeTime_(8);
Pdef(\songA, {Pbind(\instrument, \clpulse, \delta, 1, \at, 0.2, \rt, 0.7, \tempo, 42/60, \freq, "g4".namecps, \rate, 0.7, \amp, 0.3, \out, 1)}).play(quant: Quant(1)).fadeTime_(2); /// ~> at(0.2) and rt(0.7) high int  | rate ~> 10 | amp -> Pwhite | freq ~> *12  ////*harmony*\\\ modulate to b-d
