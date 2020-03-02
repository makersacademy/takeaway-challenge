require_relative './takeaway'
# inherits methods from the Takeaway class (Order has also been injected to Takeaway)
class Order < Takeaway

  attr_reader :order_items, :current_total

# creates a list of menu items, a list of items on the current order, the current total for all items
  def initialize(menu = Menu.new)
    @order_items = []
    @menu_items = menu.menu_items
    @current_total
  end

# adds a dish to the order items array
  def add(dish, amount)
    @order_items << {:item => dish, :amount => amount}
  end

# incomplete method for calculating total of order items using private method sum (not written yet)
  def check_total
    sum
  end

# fetches the price of a dish from the menu
  def fetch_price(dish)
    menu_items.each do | item |
      if item.has_value?(dish)
        return item[:price]
      end
    end
  end

  def sum
    order_items.each do | item |
      @price = fetch_price(item[:item])
      cost = dish[:amount] * @price
      end
      @current_total += cost
    end
    return @current_total
end
