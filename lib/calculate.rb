module Calculate_Order



  def calculate(order, menu)
    food = order[0]
    quantities = order[1]
    price_array = food.map{|x| menu[x]}
    price_array.each_with_index.map{|x,i| x * quantities[i]}.inject(:+)
  end

  def check_calculation(order_list, menu)
    sum = order_list[2][0]
    sum == calculate(order_list, menu)
  end


end
