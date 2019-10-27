require_relative 'restaurant'

class Display

  def menu(restaurant)
    @menu_array = []
    restaurant.dishes.each do |dish|
      @menu_array << "#{@menu_array.count + 1}. #{dish.name} (£#{dish.price}), #{dish.remaining_portions} portions remaining"
    end
    print @menu_array.join("\n")
  end

  def basket(order)
    @basket_array = []
    order.basket.each do |dish|
      dish.each do |name, price|
        @basket_array << "#{@basket_array.count + 1}. #{name} (£#{price})"
      end
    end
    print "Selected items:\n#{@basket_array.join("\n")}\nTotal price: £#{order.basket_total_price}"
  end
end
