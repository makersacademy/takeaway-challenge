require_relative 'menu'

class Order

  def initialize
    start_order
  end

  def start_order
    @menu = Menu.new
  end

  def acquire_details
  end

  def show_menu
  end

  def show_basket
  end

  def add_to_basket
  end

  def remove_from_basket
  end

  def checkout
  end

  def place_order
  end

  def confirm_order
  end

end
