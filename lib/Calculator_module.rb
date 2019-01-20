module Calculator

  def calculate(array)
    @total = []
    helper(array)
    return @total.reduce(:+)
  end

  def helper(array)
    array.each do |item|
      @total << (item.values.join("").to_i * 5) if item.keys.join("") == "burger"
      @total << (item.values.join("").to_i * 2) if item.keys.join("") == "chips"
      @total << (item.values.join("").to_i * 3) if item.keys.join("") == "salad"
    end
  end

end
