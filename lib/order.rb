require_relative 'menu'

class Order

  attr_reader :menu, :basket, :basket_total
  def initialize(menu = Menu.new)
    @basket = [] #array of hashes
    @menu = menu
    @basket_total = 0
  end

  def add(item, quantity = 1)
    raise "That dish is not on our menu, please choose a dish from our menu." unless @menu.dishes.has_key?(item) 
    price = @menu.dishes[item]
    p @basket << {name: item, item_price: price, quantity: quantity, total_cost: quantity * price} 
    p @basket_total += price * quantity
    "#{quantity}x #{item}, at £#{price} each, added to your order"
  end
    
  def display
    receipt_array = ["Your order contains:"]
    @basket.each do |item|
      receipt_array << "#{item[:quantity]}x #{item[:name]} = £#{item[:total_cost]}"
    end
    receipt_array << "Order total = £#{@basket_total}"
    puts receipt_array.join("\n")
  end

  def check_total? #not sure this method is really doing much of a 'check' because its using the same price variables as we added to the basket within the 'add' method
    check = 0
    @basket.each { |item| check += item[:total_cost] }
    check == @basket_total
  end

  def complete_order
    send_text
  end
end

p o = Order.new
o.add("dal", 2)
o.add("korma")
o.add("rice", 3)
p "here"
p o.check_total?
p "here" 
p o.basket
p "here"
o.display
