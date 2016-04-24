class Order
  attr_reader :order
  def initialize(menu)
    @menu = menu
    @order = {}
  end

  def order_food(food, quantity)
    @order[food] = quantity
    @order
  end

  def order_summary
    summary = []
    @order.each do |food, quantity|
      price = @menu.display_menu[food] * quantity
      summary << "#{food} x #{quantity} = $#{price}"
    end
    summary.join ', '
  end

  def total
    total = 0
    @order.each{|food, quantity| total += @menu.display_menu[food] * quantity}
    total
  end

end
