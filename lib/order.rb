class Order
  attr_reader :selection, :menu

  def initialize(menu = Menu.new)
    @selection = {}
    @menu = menu
  end

  def select_dish(item, quantity)
    @selection = { item => quantity }
  end
end