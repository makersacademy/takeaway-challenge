class Dish
  def initialize
    @dishes = {
      pizza: 7,
      spaghetti: 8,
      lasagne: 9,
      chips: 2,
      tiramisu: 4
    }
    @selection = {}
  end

  def list_items
    @dishes
  end

  def select_dishes(dish_name, dish_quantity)
    @selection[dish_name] = dish_quantity
    @selection
  end

  def check_total
    puts "Your total amount due is £#{total}."
    puts "Please find a summary of your order below:"
    view_order
  end
  
  private

  def view_order
    @selection.each do |dish, quantity|
      puts "#{quantity} x #{dish} at £#{@dishes[dish]} each."
    end
  end

  def total
    total_price = 0
    @selection.each do |dish, quantity|
      price = @dishes[dish]
      total_price += (price * quantity)
    end
    total_price
  end
end

# dish_names = dish_name
#     # dish_price = @dishes[dish_name]
#     # @selection[dish_name] = dish_price
#     @dishes.each do |name, price|
#       if name == dish_names
#         @selection[name] = price
#         @selection
#       end
#     end