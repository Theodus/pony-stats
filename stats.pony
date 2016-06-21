use "collections"

primitive Stats[A: (Real[A] val & Number)]
  """
  Provides common statistical functions on Seqs.
  """
  fun mean(ns: Seq[A] box): A ? =>
    """
    Return the arithmetic mean (average) of the data. Raise an error if ns is
    empty.
    """
    if ns.size() == 0 then error end
    var sum = A(0)
    for n in ns.values() do
      sum = sum + n
    end
    sum / A(0).from[USize](ns.size())

  fun median(ns: Seq[A] box): A ? =>
    """
    Return the median (middle value) of the data using the common “mean of
    middle two” method. Raise an error if ns is empty.
    """
    if ns.size() == 0 then error end
    let data = QuickSorter[A].sort(ns)
    let s = data.size()
    if (s % 2) == 1 then
      data(s / 2)
    else
      let i = s / 2
      (data(i - 1) + data(i)) / 2
    end

  fun median_low(ns: Seq[A] box): A ? =>
    """
    Return the low median of the data. Raise an error if ns is empty.
    """
    if ns.size() == 0 then error end
    let data = QuickSorter[A].sort(ns)
    let s = data.size()
    if (s % 2) == 1 then
      data(s / 2)
    else
      data((s / 2) - 1)
    end

  fun median_high(ns: Seq[A] box): A ? =>
    """
    Return the high median of the data. Raise an error if ns is empty.
    """
    if ns.size() == 0 then error end
    let data = QuickSorter[A].sort(ns)
    let s = data.size()
    data(s / 2)

  fun mode(ns: Seq[A] box): A ? =>
    """
    Return the mode (most frequent value) of the data. Raise an error if ns is
    empty.
    """
    match ns.size()
    | 0 => error
    | 1 => return ns(0)
    end
    let data = QuickSorter[A].sort(ns)
    var m = A(0)
    var mcount: USize = 0
    var v = A(0)
    var count: USize = 0
    for n in ns.values() do
      if n == v then
        count = count + 1
      else
        if count > mcount then
          (m, mcount) = (v, count)
        end
        (v, count) = (n, 1)
      end
    end
    m

  // TODO pstdev pvariance stdev variance
