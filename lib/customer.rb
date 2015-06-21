require_relative 'menu'

class Customer
  attr_reader :menu, :order
  def initialize (menu)
    @order = {}
    @menu = menu.show_menu
    @total_price = 0
  end

  def add_item (item, number=1)
    # running_total = @menu[item]*number
    order[item] = @menu[item]*number
    order
  end

end
