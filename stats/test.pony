use "ponytest"
use "collections"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_TestMean)
    test(_TestMedian)
    test(_TestMode)
    test(_TestVariance)
    test(_TestDeviation)

class iso _TestMean is UnitTest
  fun name(): String => "Mean"

  fun apply(h: TestHelper) ? =>
    let a: Array[F64] = [1, 2.5, 3.25, 5.75]
    h.assert_eq[String]("3.125", Mean[F64](a).string())
    h.assert_eq[String]("2.6144", Mean[F64].geometric(a).string())
    h.assert_eq[String]("2.12584", Mean[F64].harmonic(a).string())

class iso _TestMedian is UnitTest
  fun name(): String => "Median"

  fun apply(h: TestHelper) ? =>
    let a: Array[F64] = [1, 3, 5]
    let b: Array[F64] = [1, 3, 5, 7]
    let median = Median[F64]
    h.assert_eq[F64](3, median(a))
    h.assert_eq[F64](4, median(b))
    h.assert_eq[F64](3, median.low(a))
    h.assert_eq[F64](3, median.low(b))
    h.assert_eq[F64](3, median.high(a))
    h.assert_eq[F64](5, median.high(b))

class iso _TestMode is UnitTest
  fun name(): String => "Mode"

  fun apply(h: TestHelper) ? =>
    let a: Array[F64] = [1, 1, 2, 3, 3, 3, 3, 4]
    h.assert_eq[F64](3, Mode[F64](a))

class iso _TestVariance is UnitTest
  fun name(): String => "Variance"

  fun apply(h: TestHelper) ? =>
    let a: Array[F64] = [27.5, 30.25, 30.25, 34.5, 41.75]
    h.assert_eq[String]("31.0188", Variance[F64](a).string())
    h.assert_eq[String]("24.815", Variance[F64].pop(a).string())

class iso _TestDeviation is UnitTest
  fun name(): String => "Deviation"

  fun apply(h: TestHelper) ? =>
    let a: Array[F64] = [1.5, 2.5, 2.5, 2.75, 3.25, 4.75]
    h.assert_eq[String]("1.08109", Deviation[F64](a).string())
    h.assert_eq[String]("0.986893", Deviation[F64].pop(a).string())
