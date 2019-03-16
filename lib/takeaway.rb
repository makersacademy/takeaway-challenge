class Takeaway

  attr_reader :order_price
  attr_accessor :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
    @order_price = 0
  end

  def print_menu
    @menu.print
  end

  def place_order(item, quantity = 1)
    raise "Item not available" unless @menu.items.include?(item)

    @order << { item => quantity }
  end

  def total_price
    @order.each do |items|
      items.each do |item, quantity|
        @order_price += (@menu.items[item] * quantity)
      end
    end
    @order_price
  end

end
