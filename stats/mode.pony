
primitive Mode[A: (Real[A] val & Number)]
  fun apply(data: Seq[A] box): A ? =>
    """
    Return the mode (most frequent value) of the data. Raise an error if data is
    empty.
    """
    match data.size()
    | 0 => error
    | 1 => return data(0)
    end
    let ns = QuickSorter[A].sort(data)
    var m = A(0)
    var mcount: USize = 0
    var v = A(0)
    var count: USize = 0
    for n in data.values() do
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
