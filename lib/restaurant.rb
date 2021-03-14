require_relative 'order'

class Restaurant

  attr_reader :name, :menu, :order

  def initialize(name)
    @name = name
    @menu = { "Cheese burger": 10,
              "Cheese and bacon burger": 12,
              "Pulled pork burger": 15,
              "Fries": 6,
              "Chilli fries": 8,
              "Onion rings": 7,
              "Coke 330ml": 2,
              "Fanta 330ml": 2,
              "Brew Dog Vegabond 4.5%": 5 }
    @order = Order.new
  end

# view menu prints the hash in a reabable list with numbers assinged to each dish for easy ordering
  def view_menu
    @print = ["#{@name}'s Menu:\n"]
    num = 1
    unless num >= @menu.length
      @menu.each do |dish, price|
        @print << "#{num}: #{dish}, £#{price}\n"
        num += 1
      end
    end
    @print.join(", ").chomp
  end

  # adds to the order instance's basket
  def add_to_order(dish)
    @order.add_to_basket(dish)
  end

  # using view_menu format user can choose a dish by number
  def choose_dish(dish_num)
    dish = @menu.to_a
    add_to_order(dish[dish_num - 1])
    "#{dish[dish_num - 1][0]} has been added to your basket"
  end
end
