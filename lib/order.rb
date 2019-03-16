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

  def place
    delivery_time = Time.now + 60 * 60
    raise "No items in order" if @order.empty?

    "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%k:%M")}"
  end

  private

  attr_reader :order_price

end
