class Calculator
  def total(prices)
    prices.reduce(0) { |sum, item| sum + item }
  end
end
