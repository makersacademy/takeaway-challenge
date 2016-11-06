require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :basket, :menu

  def initialize(filename)
    @menu = Menu.new(filename)
    @basket = Hash.new(0)
  end

  def add_item(item, quantity=1)
    fail "We're sorry, that isn't on the menu." unless @menu.dishes.key?(item)
    @basket[item] += quantity
    "#{quantity} x #{item} added to your basket"
  end

  def print_order
    "#{basket_contents}\nTotal: £#{total}"
  end

  def confirm_order(number)
    send_text(number)
    "Thank you for placing your order."
  end

  def send_text(number)
    message = Message.new
    message.send_text(number)
  end

  private

  def basket_contents
    @receipt = ""
    @basket.each do |k, v|
    @receipt << "#{v} x #{k} = £#{v * menu.dishes[k]}, "
    end
    @receipt.slice!(-2..-1)
    @receipt
  end

  def total
    total = 0
    @basket.each {|k, v| total += v * menu.dishes[k]}
    total
  end

end
