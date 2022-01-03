require_relative 'menu'

class Order

  attr_reader :menu, :basket, :basket_total
  def initialize(menu = Menu.new)
    @basket = [] #array of hashes
    @menu = menu
    @basket_total = 0
  end

  def add(item, quantity = 1)
    price = @menu.dishes[item]
    @basket << {name: item, item_price: price, quantity: quantity, total_cost: quantity * price} 
    @basket_total += price * quantity
    "#{quantity}x #{item}, at £#{'%.2f' % price} each, added to your order"
  end
    
  def display
    receipt_array = ["Your order contains:"]
    @basket.each do |item|
      receipt_array << "#{item[:quantity]}x #{item[:name]} = £#{'%.2f' % item[:total_cost]}"
    end
    receipt_array << "Order total = £#{'%.2f' % @basket_total}"
    puts receipt_array.join("\n") #if you don't use puts here or in the Takeaway display method, it will display like  "Your order contains:\n3x dal = £19.5\n1x korma = £3.0\nOrder total = £22.5" 
  end

  def check_total? #not sure this method is really doing much of a 'check' because its using the same price variables as we added to the basket within the 'add' method??
    check = 0
    @basket.each { |item| check += item[:total_cost] }
    check == @basket_total
  end
end


