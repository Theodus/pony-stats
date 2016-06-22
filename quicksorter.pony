use "random"

class QuickSorter[A: (Real[A] val & Number)]
  let _rand: Dice

  new create() =>
    _rand = Dice(MT)

  fun ref sort(data: Seq[A] box): Seq[A] ? =>
    """
    Return a sorted version of the given data using a 3-way partition quick sort.
    """
    let ns = Array[A](data.size())
    ns.append(data)
    _quicksort(ns, 0, ns.size())
    ns

  fun ref _quicksort(data: Array[A], start: USize, stop: USize) ? =>
    if (stop - start) < 2 then return end
    let key = data(start + _rand(0, (stop - start).u64()).usize())
    var e = start
    var u = start
    var g = stop
    while u < g do
      if data(u) < key then
        _swap(data, u, e)
        e = e + 1
        u = u + 1
      elseif data(u) == key then
        u = u + 1
      else
        g = g - 1
        _swap(data, u, g)
      end
    end
    _quicksort(data, start, e)
    _quicksort(data, g, stop)

  fun _swap(data: Array[A], i: USize, j: USize) ? =>
    let tmp = data(i)
    data(i) = data(j)
    data(j) = tmp
