def dumb_two_sum?(arr, target_sum) # O(n^2)
  arr.each_with_index do |el, i|
    arr.drop(i+1).each { |el2| return true if el + el2 == target_sum }
    # return true if arr.drop(i+1).any? { |el2| ek + el2 == target_sum }
  end
  false
end

def sort_two_sum?(arr, target_sum) # => O(2*n*log(n)) => n*log(n)
  arr = arr.sort  # => nlogn

  arr.each.with_index do |el, i| # => n*
    return true if arr.drop(i + 1).bsearch(target_sum - el) # => logn
  end
  false
end

def hash_map_two_sum?(arr, target_sum)
  sum_hash = {}

  arr.each do |el|
    return true if sum_hash[target_sum - el]
    sum_hash[el] = true
  end

  false
end

def four_sum?(arr, target_sum)
  two_ary = []

  arr.each.with_index do |el1, i|
    arr.drop(i + 1).each do |el2|
      two_ary << el1 + el2
    end
  end

  end

  hash_map_two_sum?(two_ary, target_sum)
end
