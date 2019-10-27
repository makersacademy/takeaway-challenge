require_relative 'menu'
require_relative 'confirminator'

class Takeaway
  attr_reader :basket

  def initialize(menu_items = {}, confirminator = Confirminator.new)
    @menu = Menu.new(menu_items)
    @basket = {}
    @confirminator = confirminator
  end

  def view_menu
    @menu.print
  end

  def add_to_basket(item, quantity)
    raise 'Item not on menu' unless @menu.on_menu? item

    @basket[item] = quantity
  end

  def place_order(customer_total)
    raise 'Incorrect total' unless customer_total == calculate_total

    delivery_time = Time.now + (60 * 60)
    delivery_string = delivery_time.strftime("%H:%M")
    @confirminator.confirm(delivery_string)
  end

  private

  def calculate_total
    @basket.inject(0) do |total, (item, quantity)|
      total + (@menu.price(item) * quantity)
    end
  end
end
