class Performance
  def mid_number_between_slow(a, b, c)
    [a, b, c].sort[1]
  end

  def mid_number_between_fast(a, b, c)
    a < b ? b : (a < c ? c : a)
  end

  def test1
    1000.times.map{ 2 + 2}
  end

  def test2
    2000.times.map{ 2 + 2}
  end

  def times_slow
    200.times.map { 'test' }
  end

  def times_fast
    Array.new(200) { 'test' }
  end

  def pricing_long(items, prices)
    items.sum { |item| prices[item] }
  end

  def pricing_short(items, prices)
    items.sum(&prices)
  end
end
