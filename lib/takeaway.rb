require_relative "menu"

class Takeaway

  attr_reader :menu, :basket

  def initialize (menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def print_menu
    full_menu.map do |items|
      items.map {|key,value| "#{key}: £#{value}"}
    end.join(",")
  end

  def add_to_basket(item, quantity)
    arr = full_menu.select do |items|
      items[item]
    end
    cost = (arr[0][item])*quantity
    "#{item} x #{quantity} costs £#{cost}"
    @basket << [item, quantity, cost]
  end

  private

  def full_menu
    menu.dishes
  end
end
