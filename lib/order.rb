#takes selection of dishes
#looks up in menu to ensure dish is valid
require_relative 'takeaway'
require_relative 'menu'
require_relative 'words'

class Order

  attr_reader :items, :total, :menu

  def initialize(menu = Menu.new)
    @items = {}
    @total = 0
    @menu = menu
  end

  def take_order
    Words.order_prompt
    loop do
      Words.dish_selection_prompt
      dish = gets.chomp.downcase
      until menu.dishes.key?(dish) || dish == "done"
        Words.not_a_dish
        dish = gets.chomp.downcase
      end
      break if dish == "done"
      Words.quantity_selection_prompt
      quantity = gets.chomp.to_i
      add_to_order(dish, quantity)
      calculate(dish, quantity)
    end
  end

  private

  attr_writer :total

  def calculate(dish, quantity)
    self.total += menu.dishes[dish] * quantity
  end

  def add_to_order(dish, quantity)
    items[dish] = quantity
  end

end
