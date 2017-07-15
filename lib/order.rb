class Order
  def initialize(menu)
    @menu = menu
  end

  def read_menu
    @menu.to_s
  end
end
