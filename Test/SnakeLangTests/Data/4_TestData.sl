// SsIf

SsFun SsMain {
  a = 10__
  SsIf (a > 0) : End__
    print:
      SsCrOut(a - 100)__
      SsCrawl End__
  End:
}

// CHECK: -90
