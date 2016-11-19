require_relative 'menu.rb'

class Takeaway

  attr_reader :menu, :items, :total_estimate

  def initialize
    @menu = Menu.new
    @items = {}
  end

  def show_menu
    menu.show_menu
  end

  def add_item(item, quantity = 1)
    raise 'This item is not on the menu, please choose something else' if !Menu::MENU.has_key?(item)
    raise 'Quantity cannot be less than 1' if quantity < 1
    if @items.has_key?(item)
      @items[item] += quantity
    else
      @items[item] = quantity
    end
  end

  def expected_total(total_estimate)
    @total_estimate = total_estimate
  end

end
