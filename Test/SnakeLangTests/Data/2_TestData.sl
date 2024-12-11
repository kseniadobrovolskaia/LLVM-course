// Factorial

SsFun SsMain {
  fact = 1__
  n = 5__
  SsCrawl loop__
  loop:
    SsIf (n > 1) : loopEnd__
      iter:
        fact = fact * n__
        SsCrOut(fact)__
        n = n - 1__
        SsCrawl loop__
  loopEnd:
}

// CHECK: 5
// CHECK: 20
// CHECK: 60
// CHECK: 120
