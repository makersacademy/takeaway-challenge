class Order
  attr_reader :menu, :order

  def initialize(menu = Menu)
    @menu_class = menu.new
    @menu = @menu_class.menu
    @order = []
  end

  def list_menu
    @menu
  end

  def choose_item(item)
    @menu.include? item
    @order << item
  end

end
