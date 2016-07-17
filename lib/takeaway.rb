require_relative 'menu'

class Takeaway

  attr_reader :chosen_items, :menu_class

  def initialize(menu_class = Menu.new)
    @menu_class = menu_class
    @chosen_items = Hash.new(0)
  end

  def order_selection(item, quantity)
    fail 'item not on menu' unless @menu_class.view_menu.include?(item)
    chosen_items[item] = quantity
  end

  def order_summary
    order_calc
  end

  private

  def order_calc
    chosen_items.map do |item, quantity|
      "#{item} x #{quantity} = $#{menu_class.view_menu[item] * quantity}0"
    end.join(', ')
  end

end
