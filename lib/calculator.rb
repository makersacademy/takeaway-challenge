class Calculator

  def calculate_total(something_to_calculate)
    sum = 0
    something_to_calculate.each { |hash|
      sum += hash[:Price].to_i
    }
    return sum
  end

end
