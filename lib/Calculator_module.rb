module Calculator

def calculate(array)
@total = []
    array.each do |item|
      if item.keys.join("") == "burger"
        @total << (item.values.join("").to_i * 5)
      elsif item.keys.join("") == "chips"
        @total << (item.values.join("").to_i * 2)
      elsif item.keys.join("") == "salad"
        @total << (item.values.join("").to_i * 3)
      end
    end
    return @total.reduce(:+)
  end

end
