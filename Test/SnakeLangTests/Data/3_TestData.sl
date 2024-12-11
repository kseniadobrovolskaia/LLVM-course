// SsCrOut

SsFun SsMain {
  fst = 0__
  snd = 1__
  n = 15__
  SsCrawl loop__
  loop:
    SsIf (n > 0) : loopEnd__
      iter:
        tmp = n__
        fst = snd__
        snd = fst + tmp__
        SsCrOut(snd)__
        n = n - 1__
        SsCrawl loop__
  loopEnd:
}

// CHECK: 16
// CHECK: 30
// CHECK: 43
// CHECK: 55
// CHECK: 66
// CHECK: 76
// CHECK: 85
// CHECK: 93
// CHECK: 100
// CHECK: 106
// CHECK: 111
// CHECK: 115
// CHECK: 118
// CHECK: 120
// CHECK: 121

