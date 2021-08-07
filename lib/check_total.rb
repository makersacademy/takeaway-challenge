class CheckTotal

  def check_total(order) 
    "#{sum_string(order)}= #{extract_total(order)} TOTAL".to_sym
  end
  
  private

  def extract_total(source)
    source.map { |hash| hash.values }.flatten.inject(:+)
  end

  def sum_string(order)
    order.map { |hash| hash.map { |dish, price| "#{dish}: #{price} + " } }.join.delete_suffix('+ ')
  end
end
