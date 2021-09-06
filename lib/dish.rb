class Dish
  def initialize
    @dishes = {
      pizza: '£6.99',
      spaghetti: '£7.20',
      lasagne: '£7.80',
      chips: '£2.40',
      tiramisu: '£4.20'
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