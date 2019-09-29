require_relative 'menu'

class TakeawayOrderer
  attr_reader :menu, :order

  def initialize(menu: menu)
    @menu = menu
    @order = []

  end

  def view_menu
    @menu.view_items
  end

  def make_order(items, total)
    save_order(items)
  end

  private
  #
  # def send_confirmation
  # end

  def save_order(items)
    items.split(',').each { |item| food, quantity = item.split
      @order << { quantity: quantity.to_i, item: food, cost: (@menu.items[food.to_sym] * quantity.to_i) }
    }
  end

end
