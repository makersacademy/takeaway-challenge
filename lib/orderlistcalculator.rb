class OrderListCalculator

  def self.calculate(array)
    total = 0
      array.each do |dish|
        total += dish.price
      end
    [array.length, total]
  end

end
