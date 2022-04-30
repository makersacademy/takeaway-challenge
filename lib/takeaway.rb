class Takeaway
  attr_reader :menu, :current_order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def display_menu
    menu.display_available_dishes
  end

  def add_to_order
    self.current_order = Order.new
  end

  private

  attr_writer :current_order
end