///  live coding:

( /// singing duo
Pdef(\sarah, {Pbind(\instrument, \clpulse, \freq, Pseq([Pseq(["c4".namecps], 6), Pseq(["c4".namecps, "eb4".namecps, "eb4".namecps, "d4".namecps, "eb4".namecps, "eb4".namecps, "d4".namecps, "d4".namecps], 1), Pseq(["c3".namecps], 10), Pseq(["eb4".namecps, "eb4".namecps, "d4".namecps], 2)]*8, 3), \delta, Pwhite(1/8, 1/4).round(0.1), \amp, 0.3, \out, 1, \at, 0.1)}).play(quant: 1);

Pdef(\mati, {Pbind(\instrument, \clpulse, \freq, Pseq([Pseq(["eb3".namecps], 6), Pseq(["c4".namecps], 6), Pseq(["a3".namecps], 8), Pseq(["ab3".namecps], 4), Pseq(["a3".namecps, "ab3".namecps], 3)]*8, 3), \delta, Pwhite(1/8, 1/3).round(0.1), \amp, 0.3, \at, 0.1, \out, 0)}).play(quant: 1);
);

PdefAllGui(10);



x = Synth(\dt, [\freq1, "c4".namecps, \freq2, "g4".namecps, \rt, 10, \res, 3/4, \ampF, 1, \amp, 0.5, \out, 0]); // first one 0.4

x = Synth(\dt, [\freq1, "c4".namecps, \freq2, "c3".namecps, \rt, 10, \res, 3/4, \ampF, 1, \amp, 0.5]);

x = Synth(\dt, [\freq1, "b3".namecps, \freq2, "ab2".namecps, \rt, 10, \res, 3/4, \ampF, 1, \amp, 0.5]);

x = Synth(\dt, [\freq1, "eb4".namecps, \freq2, "a3".namecps, \rt, 10, \res, 3/4, \ampF, 1, \amp, 0.5]);
