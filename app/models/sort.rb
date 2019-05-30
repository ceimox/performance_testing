class Sort
  def mid_number_between(a, b, c)
    [a, b, c].sort[1]
  end

  def mid_number_between_faster(a, b, c)
    a < b ? b : (a < c ? c : a)
  end

  # Example:
  # => number_array_to_hash([1, 1, 1, 1, 2, 2, 2, 3, 3])
  # => {"1"=>4, "2"=>3, "3"=>2}
  #
  # Returns a Hash
  def number_array_to_hash(array)
    hash = {}
    array.each { |number| hash[number.to_s] = (hash[number.to_s] || 0) + 1 }
    hash
  end

  def number_array_to_hash_faster(array)
    hash = {}
    uniq_array = array.uniq
    uniq_array.each { |number| hash[number.to_s] = array.count(number) }
    hash
  end
end
