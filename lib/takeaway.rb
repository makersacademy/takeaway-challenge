require_relative 'order'
class Takeaway

  attr_reader :menu_list

  DEFAULT_MENU_LIST = {
    'Napolitana Pizza' => 16.32,
    'Proscuiutto Pizza' => 13.50,
    'Hawaiian Pizza' => 12.35,
    'Quattro Formaggi Pizza' => 10.50,
    'Fiorentina Pizza' => 13.45,
    'Ruspante Pizza' => 11.20,
    'Milano pizza' => 12.60,
    'Gamberoni Pizza' => 8.75,
    'Capricciosa Pizza' => 10.99
  }

  def initialize(menu_list = DEFAULT_MENU_LIST)
    @menu_list = menu_list
  end

  def read
    @menu_list.each { |item, price| "#{item} : #{price}" }
  end

  def create_order
    @order = Order.new
  end

  def view_order
    return "Basket is empty" if @order.basket.empty?
    summary = @order.basket.map do |item, qty|
      "#{qty} x #{item} = £#{menu_list[item] * qty}"
    end.join("\n")
    summary + "\nTotal : £#{@order.calc_total(@menu_list)}"
  end

  def add_to_order item, qty = 1
    raise "Qty cannot be negative" if qty < 0
    raise "#{item} not on the menu" unless @menu_list.include?(item)
    @order.add_to_basket(item, qty)
  end

end
