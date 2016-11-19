class Menu

  attr_accessor :menu_list, :order

  def initialize(klass)
    @order = klass.new
    @menu_list = {
      "spag_bol" => 6,
      "pizza" => 4
    }
  end

  def view_menu
    self.menu_list
  end

  def select_item(item, quantity)
    return "Not a valid item" if !in_menu?(item)
    @order.add_to_basket(item, self.menu_list[item], quantity)
  end

  def in_menu?(item)
    self.menu_list.has_key?(item)
  end



end
