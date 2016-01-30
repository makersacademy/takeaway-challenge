module Calculate_order

  def calculate(order_list, menu)
    food = order_list[0]
    quantities = order_list[1]
    sum = order_list[2][0]
    price_array = food.map{|x| menu[x]}
    sum == price_array.each_with_index.map{|x,i| x * quantities[i]}.inject(:+)
  end

end
