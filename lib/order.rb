class Order

  attr_reader :order, :price, :menu

  def initialize(menu = Menu.new, text = TextMessage.new)
    @menu, @text_message, @order, @price = menu, text, {}, 0
  end

  def add_item(name, quantity)
    @order[name] = quantity
  end

  def update_price
    @order.to_a.each { |dish, quant| @price += @menu.dishes[dish] * quant }
  end

  def pay(amount)
    raise "You must give the exact amount." unless amount == @price
    @text_message.send_confirmation
  end

end
