module Luhn
  def self.is_valid? (number)
    num_array = number.to_s.each_char.map {|c| c.to_i}
    num_array = num_array.reverse
    num_array.each_with_index { |value, index|
      if index % 2 != 0
        value = value * 2
        if value >= 10
          value = value - 9
        end
      end
      num_array[index] = value
    }
    sum = num_array.inject(0){|sum,x| sum + x }
    if sum % 10 == 0
      return true
    end
    return false
  end
end