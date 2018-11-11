require_relative 'menu'
require_relative 'message'

class Order
  attr_reader :menu, :order, :total

  def initialize(menu=Menu.new)
    @menu = menu
    @order = []
    @total = 0
  end

  def add(item,num)
    order << {item: item, num: num}
    @total += menu.items[item] * num
  end
  
  def check(number)
    fail "Your total does not match ours." if number != total
    puts "Our totals match."
  end
  
  def checkout(message=Message.new)
    t = Time.now + 3600
    content = "Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}"
    message.send(content)
  end
end