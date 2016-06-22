
primitive Deviation[A: (Real[A] val & Number & Sqrtable[A])]
  fun apply(data: Seq[A] box): A ? =>
    """
    Return the sample standard deviation (the square root of the sample
    variance) of the data. Raise an error if data has fewer than two values.
    """
    let v = Variance[A](data)
    v.sqrt()

  fun pop(data: Seq[A] box): A ? =>
    """
    Return the population standard deviation (the square root of the population
    variance) of the data. Raise an error if data has fewer than two values.
    """
    let v = Variance[A].pop(data)
    v.sqrt()

interface Sqrtable[A]
  fun sqrt(): A
