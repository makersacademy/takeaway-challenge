require_relative 'order'
require_relative 'menu'


class Takeaway

  def initialize
    @order = Order.new
    @menu = Menu.new
  end

  def show_menu
  end

  def add_dish
  end

  def show_order
  end

  def finish_order
  end

  def cancel_order
  end

  def confirm_order
  end

end
