class Takeaway
  def  initialize
    @menu = [{ dish: "Beef Burrito", price: 10.00 }, { dish: "Chicken Burrito", price: 9.00 }, { dish: "Veggie Burrito", price: 8.00}]
    @order = {}
  end

  def menu
    @menu.each_with_index do |item, index| 
      puts "#{index + 1}. #{item[:dish]} - £#{'%.2f' % item[:price]}"
    end
  end

  def order(dish_num, quantity)
    dish, price = @menu[dish_num - 1][:dish], @menu[dish_num - 1][:price]
    @order[dish][:quantity] += quantity if @order[dish]
    @order[dish] = { price: price, quantity: quantity} unless @order[dish]
  end  

  def basket
    @order.each do |dish, info| 
      puts "#{info[:quantity]} x  #{dish} - £#{'%.2f' % (info[:price] * info[:quantity])}"
    end
  end
end