class Order
  attr_reader :order_items, :menu_items, :texter

  def initialize(texter)
    @texter = texter
  end

  def place_order(total)
    check(total)
    time = Time.now + (60 * 60)
    time_plus_1 = time.strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before #{time_plus_1}"
    texter.send(message)
  end

  def add_order_items(order_items)
    @order_items = order_items
  end

  def add_menu_items(menu_items)
    @menu_items = menu_items
  end

  def total
    reduce(@order_items)
  end

  def check(total)
    raise "Invalid total" if total != reduce(select_menu_items)
    true
  end

  private

  def reduce(items)
    items.values.reduce { |sum, item| sum + item }
  end

  def select_menu_items
    @menu_items.select { |k, _v| @order_items.include?(k) }
  end
end
