require_relative 'order'

class Takeaway

  # DISHES = [{number: 1, dish: "chips", price: 1.50}, {number: 2, dish: "wings", price: 3.50 }]   

  DISHES = {chips: 2.50, burgers: 3.50, wings: 5.00}

  def view_dishes
    puts "here are the dishes available"
    @view_dishes = DISHES
  end

# place order input should be dish and quantities. Should return total price.
  
  def place_order(*arg)
    @selected_dish = arg
    create_order
  end

  private 

  def create_order
    @order = Order.new(@selected_dish)
  end

  def order_confirmation

  end

end

