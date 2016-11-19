require './lib/order'

class Menu

  attr_accessor :menu_list, :order, :current_selection

  DEFAULT_QUANTITY = 1

  def initialize(klass)
    @order = klass.new(klass)
    @current_selection = {}
    @menu_list = {
      "Spag_Bol" => 6.5,
      "Pizza" => 4,
      "Chips" => 2.75
    }
  end

  def view_menu
    self.menu_list
  end

  def select_item(item, quantity = DEFAULT_QUANTITY)
    return "Not a valid item" if !in_menu?(item)
    @current_selection = {}
    self.current_selection[:item] = item
    self.current_selection[:price] = self.menu_list[item]
    self.current_selection[:qty] = quantity
    @order.add_to_basket(self.current_selection)
    "#{quantity}x #{item} added to your basket"
  end

  private

  def in_menu?(item)
    self.menu_list.has_key?(item)
  end

end
