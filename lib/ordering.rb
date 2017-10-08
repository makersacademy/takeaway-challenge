require_relative 'menu'

class Ordering

  attr_reader :selected_dishes, :menu_items

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = {}
  end

  def selection(food, quantity = 1)
    fail "Sorry that item isn't on the menu! Please choose from the menu." unless @menu.menu_items.to_s.include?(food)
    item = 1
    quantity.times do
      @selected_dishes["#{item}.#{food}"] = @menu.menu_items[food.to_sym]
      item += 1
    end
  end

  def view_dishes
    p selected_dishes
    p"You have ordered #{selected_dishes.count} dishes."
  end

  def calculate_cost
    cost = @selected_dishes.map { |food, price| price }.sum.round(2)
    p "Total: £#{cost}"
  end
end
