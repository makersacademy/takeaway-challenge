require_relative 'menu'

class Order
  attr_reader :order, :order_sum, :menu

  def initialize(menu: Menu.new)
    @menu = menu
    @order = []
    @order_sum = []
  end

  def read_menu
    menu_display = ''
    menu_hash.each do |key, value|
      menu_display << "#{key}, £#{value}\n"
    end
     puts menu_display
  end

  def add(item, qty=1)
    error = "That's not on this menu."
    raise error unless menu_hash.include?(item)
    qty.times{@order_sum << menu_hash[item]}
    @order << [qty, item, menu_hash[item]]
    "#{qty}x #{item}(s) added to your order."
  end

  def summary
    order_list = ''
    @order.each do |qty, item, price|
      string = "#{qty}x #{item}(s), £#{price} each. Total: £#{qty*price}.\n"
      order_list << string
    end
      order_list
  end

  def total
    @total = @order_sum.reduce(:+)
    "Your total for this order is £#{@total}."
  end

  def pay(amount)
    error = 'payment is incorrect'
    raise error unless amount == @total
    delivery = (Time.now + 3600).strftime("%H:%M")
    "Thank you! Your order should be with you by #{delivery}"
  end
  private

    def menu_hash
      @menu.show
    end

end
