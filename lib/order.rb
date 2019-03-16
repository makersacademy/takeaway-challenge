class Order

  attr_accessor :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @order_price = 0
  end

  def print_menu
    @menu.print
  end

  def add(item, quantity = 1)
    raise "Item not available" unless @menu.items.include?(item)

    @order[item] = quantity
  end

  def total
    @order.each do |item, quantity|
      @order_price += (@menu.items[item] * quantity)
    end
    @order_price
  end

  private

  attr_reader :order_price

end
