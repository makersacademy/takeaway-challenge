class Restaurant
attr_accessor :menu
attr_reader :order

  def initialize(menu = {Chicken: 3, Beef: 4})
    @menu = menu
  end

  def print_menu
    menu.each { |k,v| puts "#{k}: £#{v}" }
  end

  def place_order(*dishes)
    @order = []
    menu_check(*dishes)
    dishes.each { |dish| @order << dish }
    print_order
  end

  def order_total
    total = 0
    order.each { |item| total += @menu[item.to_sym] }
    return total
  end

  def menu_check(*dishes)
    dishes.each do |dish|
      raise "#{dish} is not on the menu" if !@menu.key?(dish.to_sym)
    end
  end

  private
  def print_order
    puts "Your order:"
    order.each { |item| puts "#{item}: £#{@menu[item.to_sym]}" }
    puts "TOTAL: £#{order_total}"
  end

end
