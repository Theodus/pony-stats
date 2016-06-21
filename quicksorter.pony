use "random"

class QuickSorter[A: (Real[A] val & Number)]
  let _rand: Dice

  new create() =>
    _rand = Dice(MT)

  fun ref sort(seq: Seq[A] box): Seq[A] ? =>
    """
    Return a sorted version of the given Seq using a 3-way partition quick sort.
    """
    let data = Array[A](seq.size())
    data.append(seq)
    _quicksort(data, 0, data.size())
    data

  fun ref _quicksort(ns: Array[A], start: USize, stop: USize) ? =>
    if (stop - start) < 2 then return end
    let key = ns(start + _rand(0, (stop - start).u64()).usize())
    var e = start
    var u = start
    var g = stop
    while u < g do
      if ns(u) < key then
        _swap(ns, u, e)
        e = e + 1
        u = u + 1
      elseif ns(u) == key then
        u = u + 1
      else
        g = g - 1
        _swap(ns, u, g)
      end
    end
    _quicksort(ns, start, e)
    _quicksort(ns, g, stop)

  fun _swap(ns: Array[A], i: USize, j: USize) ? =>
    let tmp = ns(i)
    ns(i) = ns(j)
    ns(j) = tmp
