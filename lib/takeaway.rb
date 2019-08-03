class Takeaway

  attr_reader :menu, :order

  def initialize(menu: ,order: nil)
    @menu = menu
    @order= order || Order.new
  end

  def show_menu
    menu.show
  end

  def order_dish(dishes)
    dishes.each do |dish,quantity|
      order.add(dish,quantity)
    end
    order.total
  end




end