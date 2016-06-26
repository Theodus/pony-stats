
primitive Mean[A: (FloatingPoint[A] val & Float)]
  fun apply(data: Seq[A] box): A ? =>
    """
    Return the arithmetic mean (average) of the data. Raise an error if data is
    empty.
    """
    if data.size() == 0 then error end
    var sum = A(0)
    for n in data.values() do
      sum = sum + n
    end
    sum / A(0).from[USize](data.size())

  fun geometric(data: Seq[A] box): A ? =>
    """
    Return the geometric mean of the data. Raise an error if data is empty.
    """
    if data.size() == 0 then error end
    var p = A(0)
    for n in data.values() do
      if p == 0 then
        p = n
      else
        p = p * n
      end
    end
    p.pow(1 / A(0).from[USize](data.size()))

  fun harmonic(data: Seq[A] box): A ? =>
    """
    Return the harmonic mean of the data. Raise an error if data is empty or if
    any value in the data is negative or zero.
    """
    if data.size() == 0 then error end
    var p = A(0)
    for n in data.values() do
      if n <= 0 then error end
      p = p + (1 / n)
    end
    A(0).from[USize](data.size()) / p
