require_relative 'dishes'

class Order
  include Dishes

  def choose_dishes(*order, total)
    arr = []
    order.each do |meal_and_price|
      raise "No such item on menu. Please re-order." if meal_and_price[0] > dish_list.size
      subtotal = dish_list[(meal_and_price[0])-1].values[0].to_f * meal_and_price[1]
      arr << subtotal
      total = arr.reduce(:+)
      puts "#{meal_and_price[1]} x #{dish_list[meal_and_price[0]-1].keys[0]} = #{subtotal}"
    end
    print "Total = #{total}\nIs this correct?"
  end
end
