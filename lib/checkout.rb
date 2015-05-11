module Checkout
  def total items
    items.map(&:values).flatten.inject { |sum, x| sum + x }
  end

  def order_price order_list
  	order_array = []
  	order_list.each do |n|
  	  n.each do |dish_key, dish_price|
      order_array << "#{dish_key} @ £#{dish_price}, #{dishes.map(&:keys).count(dish_key)}"
      end
    end
    items.map(&:values).flatten.inject { |sum, x| sum + x }
  end
end