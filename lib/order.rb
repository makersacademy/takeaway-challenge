class Order

  attr_reader :order, :takeaway

   def initialize(takeaway)
     @order = {}
     @takeaway = takeaway
   end

   def add_to_order(item, quantity)
     @order.key?(item) ? @order[item] += quantity : @order.store(item, quantity) if item.available == true
   end

   def get_price
     price = 0
     order.each { |item, quantity| quantity.times { price += item.price } }
     return "£#{'%.2f' % (price / 100.0)}"
   end

   def complete_order(number_of_items, phone=nil)
     fail("Number of items given does not match order") if order.values.sum != number_of_items
     m = "Thank you! Your order was place and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}"
     if phone.nil?
       puts m
     else
       phone.send_message(m)
     end
   end

   def view_order
     @order.each do |dish, quantity|
       puts "#{dish.name} (#{dish.get_formatted_price})         x #{quantity} "
     end
     puts "==================================="
     puts "Total cost:          #{get_price}"
     puts "==================================="
   end
end
