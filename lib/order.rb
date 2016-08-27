require_relative 'messenger'
require_relative 'menu'

class Order

attr_reader :order, :total

def initialize
  @order = Hash.new(0)
end

def add(dish, quantity)
  @order.has_key?(dish) ? @order[dish] += quantity : @order.merge!(dish => quantity)
end

def calculate_total
  @total = 0
  @order.each do |dish, quantity|
   dish_price = quantity.to_f * Menu::MENU[dish].to_f
  @total += dish_price
 end
   "£#{'%.02f' % @total}"
end
#total.reduce(:+)

def show_order
  p 'You currently have in your basket:'
  @order.each { |dish, quantity| p "#{quantity}x #{dish} @ £#{Menu::MENU[dish]} = £#{quantity.to_f * Menu::MENU[dish].to_f}" }
  "£#{'%.02f' % @total}"
end

def order_exists?
  !!@order
end

def delete_order
  @order = nil
  p 'You have deleted your order'
end

end
