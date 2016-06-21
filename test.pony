use "ponytest"
use "collections"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_TestQuickSorter)
    test(_TestMean)
    test(_TestMedian)

class iso _TestQuickSorter is UnitTest
  fun name(): String => "QuickSorter"

  fun apply(h: TestHelper) ? =>
    let u: Array[USize] = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9]
    let e: Array[USize] = [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 9]
    let s = QuickSorter[USize].sort(u)
    for i in Range(0, s.size()) do
      h.assert_eq[USize](s(i), e(i))
    end

class iso _TestMean is UnitTest
  fun name(): String => "Stats.mean"

  fun apply(h: TestHelper) ? =>
    let a: Array[USize] = [1, 2, 3, 4, 4]
    h.assert_eq[USize](2, Stats[USize].mean(a))

    let b: Array[F64] = [-1.0, 2.5, 3.25, 5.75]
    h.assert_eq[F64](2.625, Stats[F64].mean(b))

class iso _TestMedian is UnitTest
  fun name(): String =>
    "Stats.median Stats.median_low Stats.median_high"

  fun apply(h: TestHelper) ? =>
    let a: Array[F64] = [1, 3, 5]
    let b: Array[F64] = [1, 3, 5, 7]
    let stats = Stats[F64]
    h.assert_eq[F64](3, stats.median(a))
    h.assert_eq[F64](4, stats.median(b))
    h.assert_eq[F64](3, stats.median_low(a))
    h.assert_eq[F64](3, stats.median_low(b))
    h.assert_eq[F64](3, stats.median_high(a))
    h.assert_eq[F64](5, stats.median_high(b))
