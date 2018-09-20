class Order
  attr_reader :quantity, :name, :menu

  def initialize(menu = Menu.new)
    @order = []
    @bill = 0
    @quantity = 0
    @menu = menu
  end

  def pick(name, quantity)
    raise "This dish is unavailable" unless @menu.include_dish?(name)
    @quantity += quantity
    @order << {name => quantity}
  end

  def show
    @order
  end

end
