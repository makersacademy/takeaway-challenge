class Order
  attr_reader :order_list

  def initialize
    @total = 0
    @menu = Menu.new.menu_list
    @order_list = []
  end

  def select_dish(dish)
    @order_list << dish
  end

  def check_order 
    raise "An item(s) in your order is not available" if not_on_menu?
  end 

  def not_on_menu?
    @menu.each do |item, _price|
      @order_list.each do |dish|
        item != dish
      end
    end
  end

  def total
    @menu.each do |item, price|
      @order_list.each do |dish|
        @total += price if dish == item
      end
    end
    return "Your order total is £#{@total}"
  end
end
