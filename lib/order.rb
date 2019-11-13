class Order
  attr_reader :dishes

  def initialize(menu, message_sender)
    @dishes = Hash.new(0)
    @menu = menu
    @message_sender = message_sender
  end

  def add(dish, quantity)
    raise "'#{dish}' is not on the menu" unless @menu.dish?(dish)

    @dishes[dish] += quantity
  end

  def total
    return 0 if @dishes.empty?

    subtotals = @dishes.map { |dish, quantity| @menu.price(dish) * quantity }
    subtotals.sum
  end

  def place
    raise "cannot place an empty order" if @dishes.empty?

    @message_sender.send_order_confirmation
  end
end
