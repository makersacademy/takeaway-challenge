# An object storing a list of meal dishes
# Initializes with set menu. New dishes can be added.
# All dishes can be viewed
# Allows selection of items for subsequent addition to basket
class Menu
  attr_reader :dishes, :selection
  def initialize
    @dishes = [Dish.new('Guacamole Deep', 269), 
               Dish.new('Not Yo Cheese', 399),
               Dish.new('Jalapeno Business', 450),
               Dish.new('Taco Shellebration', 699),
               Dish.new('In Queso Emergency', 599),
               Dish.new('Tequila Mockingbird',750)
              ]
    @selection = []
  end

  def add(dish)
    @dishes << dish
  end

  def view
    @dishes.each_with_index { |dish, index|
      puts "#{index + 1}. #{dish.name} - £#{'%.2f' % (dish.price / 100.00)}\n"
    }
  end

  def select(item_no, qty)
    current = @selection.find { |entry| entry[:item] == item_no }
    if current == nil
    hash = { item: item_no, name: @dishes[item_no - 1].name, qty: qty, unit_cost: @dishes[item_no - 1].price, price: qty * @dishes[item_no - 1].price}
    @selection << hash
    else
      current[:qty] += qty
      current[:price] = current[:qty] * current[:unit_cost]
    end
  end
end
