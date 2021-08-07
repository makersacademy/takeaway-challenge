class CheckTotal

  def check_total(order) 
    "#{sum_string(order)}= #{total(extract(order))} TOTAL".to_sym
  end
  
  private

  def extract(source)
    source.map { |hash| hash.values }.flatten
  end

  def total(numbers)
    numbers.inject(:+)
  end

  def sum_string(order)
    order.map { |hash| hash.map { |dish, price| "#{dish}: #{price} + " } }.join.delete_suffix('+ ')
  end
end
