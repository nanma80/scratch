class MaxSubarray
  def self.n_cubed(array)
    n = array.length
    max_so_far = 0
    n.times do |i|
      n.times do |j|
        sum = 0
        (i..j).each do |k|
          sum += array[k]
        end
        if sum > max_so_far
          max_so_far = sum
        end
      end
    end
    max_so_far
  end

  def self.n_squared(array)
    n = array.length
    max_so_far = 0
    n.times do |starting_index|
      sum = 0
      (starting_index..n-1).each do |ending_index|
        sum += array[ending_index]
        if sum > max_so_far
          max_so_far = sum
        end
      end
    end
    max_so_far
  end

  def self.dp(array)
    max_sum_ending_with_last = 0
    max_sum_not_ending_with_last = 0

    array.each do |element|
      max_sum_ending_with_last, 
      max_sum_not_ending_with_last = 
        [max_sum_ending_with_last + element, element].max, 
        [max_sum_ending_with_last, max_sum_not_ending_with_last].max
    end

    [max_sum_ending_with_last, max_sum_not_ending_with_last].max
  end
end
