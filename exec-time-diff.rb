class Array # O(n^2)
  def my_min(&blk)
    blk ||= proc { |l, r| l <=> r }

    self.each do |el|
      return el if self.none? {|el2| blk.call(el2, el) == -1 }
    end
  end

  def smart_min(&blk)  # O(n)
    blk ||= proc { |l, r| l <=> r }

    min = self[0]
    each { |el| min = el if blk.call(el2, el) == -1 }

    min
  end

  def largest_subsum
    subsum_ary = [] # O(1)

    (length - 1).times do |i| # O(n^2)
      subsums = [self[i]] # O(1)
      ((i+1)..(length - 1)).each do |j| # => O(n)
        subsums << subsums[-1] + self[j] # O(1)
      end
      subsum_ary.concat(subsums) # => O(1)
    end
    subsum_ary.my_min { |l, r| r <=> l } # O(n^2)
  end

  def smart_largest_subsum
    max_sum, greedy_sum = 0, 0

    each_index do |i|
      greedy_sum += self[i]
      max_sum = greedy_sum if greedy_sum > max_sum
      greedy_sum = 0 if greedy_sum < 0
    end

    max_sum
  end

end

my_array = [*-100..100]
results_array = []
100.times {results_array << my_array.shuffle.smart_largest_subsum}
p results_array
p results_array.reduce(:+) / 100.0
p "prediction: #{100 * 99 / 8.0}"

#   def old_largest_subsum
#     subsum_ary = []
#
#     (length - 1).times do |i|
#       subsum_ary << self[i] + self[i + 1]
#     end
#
#     subsum_ary.my_min { |l, r| r <=> l }
#   end
