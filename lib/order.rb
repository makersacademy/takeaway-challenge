require_relative 'menu'

class Order

  attr_reader :menu, :customer_order

  def initialize(menu = Menu.new)
    @menu = menu
    @customer_order = Hash.new(0)
  end

  def add_dish(item)
    @menu.check_if_available(item)
    @customer_order[item] += @menu.dishes[item]
  end

  def view_order
    order_subtotals
    order_total
  end

  private 

  def order_subtotals
    @customer_order.each do |item, price|
      if price.positive?
        quantity = (@customer_order[item] / @menu.dishes[item]).round
        puts "#{quantity}x #{item} £#{price}"
      end
    end
  end
  
  def checkout_total
    @customer_order.select { |_, price| price.positive? }.values.reduce(:+)
  end

  def order_total
    puts "=========="
    puts "TOTAL: £#{checkout_total}"
  end
end
