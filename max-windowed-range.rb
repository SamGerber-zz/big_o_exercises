def windowed_max_range(arr, size)
  current_max_range = nil

  (0..arr.length - size).each do |start_index|  # => O(n)
    window = arr[start_index, size]             # => O(1)
    max, min = window[0], window[0]             # => O(1)

    window.each do |el|                         # => O(n)
      max = el if el > max                      #
      min = el if el < min
    end

    max_diff = max - min
    current_max_range = max_diff if current_max_range.nil? || max_diff > current_max_range
  end

  current_max_range
end

def queue_window


end
