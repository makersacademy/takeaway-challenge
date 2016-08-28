require_relative 'menu'
require_relative 'order'
require_relative 'sms'

#handles the orders from the menu
class Takeaway

attr_reader :menu, :order, :eachtotal, :sms

  def initialize(menu: Menu.new)
    @menu = menu
    @order = nil
    @eachtotal = []
    @sms = sms
  end

  def read_menu
    menu.list_menu
  end

  def add_order(name, quantity = 1)
    fail name + ' is not in the menu' unless correct_name(name)
    @order = Order.new if @order.nil?
    @order.add_to_basket(name, quantity)
    @eachtotal << (quantity * @menu.dishes[name])
  end

  def basket_summary
    @order.nil? ? "Your basket is empty" : @order.basket
    # i = 0
    # until i = @eachtotal.length do
    #   puts @eachtotal.keys[i] + ' x' + @order.basket.values[i].to_s + ' = £' + @eachtotal.values[i].to_s
    #   i = i + 1
    # end
  end

  def total
    @eachtotal.inject(0, :+)
  end

  def complete_order(price)
    fail "Your calculation is not correct" if is_correct_amount?(price) == false
    @sms = Sms.new(price)
  end


  private

  def correct_name(name)
    @menu.dishes.include? (name)
  end

  def is_correct_amount?(price)
    total == price
  end

  def total_price
    @eachtotal.inject(:+)
  end

end
