class Customer
  attr_reader :order
  
  def initialize(order_class = Order)
    @order = order_class.new
  end
  
  def see_menu(menu)
    menu.menu_items.each { |dish| puts "#{dish.name}, £#{dish.price}" }
  end

  def add_to_order(item)
    @order.items << item
  end
end