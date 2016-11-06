require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :basket, :menu

  def initialize(filename)
    @menu = Menu.new(filename)
    @basket = Hash.new(0)
  end

  def add_item(item, quantity)
    fail "We're sorry, that isn't on the menu." unless @menu.dishes.key?(item)
    @basket[item] += quantity
    p @basket
    "#{quantity} x #{item} added to your basket"
  end

  def print_order
    "#{basket_contents}\nTotal: £#{total}"
  end

  private

  def send_text(number)
    message = Message.new
    message.send_text(number)
  end

  def basket_contents
    receipt = ""
    @basket.each {|k, v| receipt << "#{v} x #{k} = £#{'%0.2f' % (v * menu.dishes[k].to_f)}, "}
    receipt.slice!(-2..-1)
    receipt
  end

  def total
    total = 0
    @basket.each {|k, v| total += v * menu.dishes[k].to_f}
    '%0.2f' % total.to_s
  end

end
