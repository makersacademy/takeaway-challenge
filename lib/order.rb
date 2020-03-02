require_relative './takeaway'
# inherits methods from the Takeaway class (Order has also been injected to Takeaway)
class Order < Takeaway

  attr_reader :order_items, :current_total

# creates a list of menu items, a list of items on the current order, the current total for all items
  def initialize(menu = Menu.new)
    @menu_items = menu.menu_items
    @order_items = []
    @current_total = 0
  end

# adds a dish to the order items array
  def add(dish, amount)
    @order_items << {:item => dish, :amount => amount}
  end

# incomplete method for calculating total of order items using private method sum (not written yet)
  def check_total
    sum
  end

# fetches the price of the dish (used in order object to calculate the order total)
    def fetch_price(dish)
      @menu_items.each do | item |
        if item.has_value?(dish)
          return item[:price]
        end
      end
    end

  def sum
    order_items.each do | item |
      @price = fetch_price(item[:item])
      @cost = item[:amount] * @price
      @current_total += @cost
    end
  end

end
