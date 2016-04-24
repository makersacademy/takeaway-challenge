require_relative 'menu'

class Order
attr_reader :list_of_items, :total_price

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @list_of_items = []
    @total_price = 0
  end

  def add_item(item, quantity)
    fail "item isn't on the menu" unless @menu.on_menu?(item)
    @list_of_items << [item, quantity]
    update_total_price(item, quantity)
  end

  def submit_order(price)
    fail "price does not match" unless check_total_price(price)
    t = Time.now + (60 * 60)
    t = t.strftime "%H:%M"
    "Thank you! Your order was placed and will be delivered at #{t}"
  end

  private
  def update_total_price(item, quantity)
    price = @menu.items[item]
    @total_price += (price * quantity)
  end

  def check_total_price(price)
    @total_price == price
  end

end