require_relative 'menu'

class Order

  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def add_item(item)
    menu.menu[item]
    order << menu.menu[item]
  end

  def total
    count = 0
    order.each do |order_line|
      order_line.each do |item|
        count += item[1]
      end
    end
   return count
  end

  def view_order
    order_string = "Items: "
    order.each do |order_line|
      order_line.each do |dish,price|
        order_string << ("#{dish} = #{price}, ")
      end
    end
    order_string << "Total: #{total}"
    return order_string
  end

  def checkout(total)
    fail "Error - the total is incorrect" if total != self.total
    "Thank you your order has been placed"
  end

  private

  attr_reader :menu
end

