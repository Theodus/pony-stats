use "collections"

primitive Median[A: (Real[A] val & Number)]
  fun apply(data: Seq[A] box): A ? =>
    """
    Return the median (middle value) of the data using the common “mean of
    middle two” method. Raise an error if data is empty.
    """
    if data.size() == 0 then error end
    let ns = Array[A](data.size()).append(data)
    Sort[Array[A], A](ns)
    let s = ns.size()
    if (s % 2) == 1 then
      ns(s / 2)
    else
      let i = s / 2
      (ns(i - 1) + ns(i)) / 2
    end

  fun low(data: Seq[A] box): A ? =>
    """
    Return the low median of the data. Raise an error if data is empty.
    """
    if data.size() == 0 then error end
    let ns = Array[A](data.size()).append(data)
    Sort[Array[A], A](ns)
    let s = ns.size()
    if (s % 2) == 1 then
      ns(s / 2)
    else
      ns((s / 2) - 1)
    end

  fun high(data: Seq[A] box): A ? =>
    """
    Return the high median of the data. Raise an error if data is empty.
    """
    if data.size() == 0 then error end
    let ns = Array[A](data.size()).append(data)
    Sort[Array[A], A](ns)
    let s = ns.size()
    ns(s / 2)
