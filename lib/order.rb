require_relative 'menu'

class Order

  attr_accessor :total

  def initialize
    @menu = Menu.new
  end

  def show_menu
    @menu.print_menu
  end

  def select_items(selection)
    @total = @menu.total(selection)
  end

  def check_total
    raise "Incorrect order total" if @total != @menu.order_total
    p "Your order total is #{@total}"
  end

  def checkout
    p "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
