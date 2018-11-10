require_relative 'panini'
require_relative 'panini'
class Order

  def initialize(menu = Menu.new)
    @order_total = nil
    @order = []
    @menu = menu
  end

  def choose_items(item, quantity, menu = nil)
    menu = @menu.panini
    order = {}
    order[menu.values[item].keys[0]] = { quantity => menu.values[item].values[0] }
    @order << order
    p "#{quantity} #{menu.values[item].keys[0]} sandwich(es) for £#{quantity * menu.values[item].values[0]} added to your shopping cart!"
  end

  def order_so_far
    @order.each do |item|
      item.each do|k,v|
        v.each do |quantity, price|
          p "You ordered #{quantity} #{k}(s) for £#{quantity * price}"
        end
      end
    end
    "Order total is £#{check_total}"
  end

  def check_total
    @order_total = 0
    @order.each do |item|
      item.each do|k,v|
        v.each do |quantity, price|
          @order_total += quantity * price
        end
      end
    end
    @order_total
  end

def confirm
end

end
