class Order

  attr_accessor :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @order_price = 0
    @customer_number = ENV['PHONE_NUMBER']
    @message = Message.new
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
    raise "No items in order" if @order.empty?

    @message.send(@customer_number)
  end

  private

  attr_reader :order_price

end
