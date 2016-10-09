class Interface
  attr_reader :order, :order_total

  def initialize
    @menu = Menu.new
    @send = SendMessage.new
    @order = {}
    @order_total = 0
  end

  def show_menu
    @menu.menu_list
  end

  def show_order
    @order
  end

  def add_to_order(food)
    @order[food] = @menu.menu_list[food]
  end

  def calculate_order
    @order.each {|k,v| @order_total += v}
    "So far you have ordered #{@order}. The total cost of this order is #{@order_total}"
  end

  def place_order
    @send.send_the_message
  end

end
