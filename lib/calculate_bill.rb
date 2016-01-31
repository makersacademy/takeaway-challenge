class CalculateBill

  def final_total(all_order)
    over_all_cost(all_order).inject(:+)
  end

  def itemised_bill(all_order)
    all_order.collect{|x| p itemised_cost(x)}
  end

  private

  def match_item_to_price(order)
   item = MENU.map{|k,v| v.to_f if order.keys.include? k}
   item.compact.join.to_f
  end
 
  def type_of_pizza(order)
    order.map{|k,v| k}.join
  end

  def quantity(order)
   order.map{|k,v| v}.join.to_f
  end

  def total_for_item(order)
   quantity(order)*match_item_to_price(order)
  end

  def total_cost(order)
   total_for_item(order)
  end

  def over_all_cost(all_order)
    all_order.collect{|x| total_cost(x)}
  end

  def itemised_cost(order)
   "#{quantity(order)} X #{type_of_pizza(order)}(#{match_item_to_price(order)}) = #{total_for_item(order)}"
  end

end