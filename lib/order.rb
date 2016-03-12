require_relative 'menu'

class Order
  attr_reader :order, :order_sum, :menu_hash

  def initialize(menu: Menu.new)
    @menu = menu
    @order = []
    @order_sum = []
  end

  def show_menu
    @menu.read
  end

  def add(item, qty=1)
    error = "That's not on this menu."
    raise error unless menu_hash.include?(item)
    qty.times{@order_sum << menu_hash[item]}
    @order << [qty, item, menu_hash[item]]
  end

  def display_order
    order_list = ''
    @order.each do |qty, item, price|
      order_list << "#{qty}x #{item}, £#{price} each. Total of £#{qty*price}\n"
    end
    puts order_list
  end

  def total
    "Your total for this order is £#{@order_sum.reduce(:+)}."
  end

  # private

    def menu_hash
      @menu.show
    end

end
