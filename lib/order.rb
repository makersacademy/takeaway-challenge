class Order

  attr_reader :order, :takeaway

   def initialize(takeaway)
     @order = []
     @takeaway = takeaway

   end

   def add_to_order(item)
     @order.push(item) if item.available == true
   end

   def get_price
     price = 0
     order.each { |item| price += item.price }
     puts "£#{'%.2f' % (price/100.0)}"
   end

   def complete_order(number_of_items)
     puts "Thank you! Your order was place and will be delivered before 20:00" if order.count == number_of_items

   end
end
