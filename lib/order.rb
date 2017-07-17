require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :menu, :basket, :total, :message

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
    @total = 0
    @message = Message.new
  end

  def view
    menu.print
  end

  def select(item, quantity = 1)
    @basket[item] += quantity
  end

  def calculate(item, quantity)
    @total += menu.items[item] * quantity
  end

  def text
    message.send_message
  end
end
