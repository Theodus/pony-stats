
primitive Mean[A: (Real[A] val & Number)]
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
