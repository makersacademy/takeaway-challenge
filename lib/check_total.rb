class CheckTotal

  def check_total(order) 
    return :"Nothing ordered!" if order.size.zero?

    "#{items_string(order)}= #{total(order)} TOTAL".to_sym
  end
  
  private

  def total(source)
    source.map { |hash| hash.values }.flatten.inject(:+)
  end

  def items_string(order)
    join_string(order.map do |item| 
      item.map { |dish, cost| "#{dish}: #{cost} + " } 
    end)
  end

  def join_string(input)
    input.join.delete_suffix('+ ')
  end

end
