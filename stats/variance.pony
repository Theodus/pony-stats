
primitive Variance[A: (FloatingPoint[A] val & Float)]
  fun apply(data: Seq[A] box): A ? =>
    """
    Return the sample variance of the data. Raise an error if data has fewer
    than two values.
    """
    _variance(data, 1)

  fun pop(data: Seq[A] box): A ? =>
    """
    Return the population variance of the data. Raise an error if data has fewer
    than two values.
    """
    _variance(data, 0)

  fun _variance(data: Seq[A] box, s: A): A ? =>
    if data.size() < 2 then error end
    let m = Mean[A](data)
    var v = A(0)
    for n in data.values() do
      v = v + ((n - m) * (n - m))
    end
    v / (A(0).from[USize](data.size()) - (1 * s))
