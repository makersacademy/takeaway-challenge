class Checkout

  def sum_each(order, prices)
    summary_string = ""
    order.each do |key, value|
      cost = prices[key] * value
      summary_string << "#{value}x #{key} = £#{cost}, "
    end
    summary_string.chomp(", ")
  end

  def sum_total(order, prices)
    total = 0
    order.each { |key, value| total += prices[key] * value }
    total
  end

end
