require_relative 'menu'
require_relative 'message'

class Order
  attr_reader :menu, :order, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
    @total = 0
  end

  def add(item, num)
    order << { item: item, num: num }
    @total += menu.items[item] * num
  end
  
  def check(number)
    fail "Your total does not match ours." if number != total
    puts "Our totals match."
  end
  
  def checkout(phone_number, message = Message.new)
    t = Time.now + 3600
    content = "\n\nRuby's Ramen!\n\nYour order total is £#{'%.2f' % @total}.\nYour order will be delivered by #{t.strftime("%H:%M")}"
    message.send(phone_number, content)
  end

  def show
    print "             Your Order\n------------------------------------\n"
    @order.each do |item|
      print "#{item[:num]} x #{item[:item]}#{" " * (32 - item[:num].to_s.length - item[:item].length - ('%.2f' % menu.items[(item[:item])]).to_s.length)}£#{'%.2f' % menu.items[(item[:item])]}\n"
    end
    print "------------------------------------\nTotal:#{" " * (29 - ('%.2f' % @total).to_s.length)}£#{'%.2f' % @total}\n\n"
  end
end
