
def first_anagram?(s1, s2)
  s1.chars.                         # => O(n)
  permutation.                      # => O(n!)
  include?(                         # => O(n!)
    s2.chars)                       # => O(n)
end

p first_anagram?("cato", 'lact')    # => O( n + n! + (n! * n) ) => O( n + (n!) * (n + 1) ) => O( n * n! )

# def second_anagram?(s1, s2)
#   s1chars = s1.chars
#   s2chars = s2.chars
#
#   until s1chars.empty?
#     l1 = s1.pop
#     s2chars.each_with_index do |l2, i|
#       s2chars.delete_at(i) if l2 == l1
#
#   end
#
#
#
#   end
#
#
# end

def third_anagram?(s1, s2)
  s1chars = s1.chars.sort
  s2chars = s2.chars.sort
  s1chars == s2chars
end

def fourth_anagram(s1, s2)
  s1_hash = Hash.new(0)
  s2_hash = Hash.new(0)
  s1.chars.each { |char| s1_hash[char] += 1 }
  s2.chars.each { |char| s2_hash[char] += 1 }
  s1_hash == s2_hash
end

def bonus_anagram(s1, s2)
  anagram_hash = Hash.new(0)
  s1.chars.each { |char| anagram_hash[char] += 1 }
  s2.chars.each { |char| anagram_hash[char] -= 1 }
  anagram_hash.all? do |_, v|
    v == 0
  end
end
