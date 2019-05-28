require 'time'
require 'message'

class Basket
  attr_reader :contents, :total_price
  ERROR_MESSAGE = "Please ensure the payment meets the order total"

  def initialize(message = Message.new)
    @contents = []
    @message = message
  end

  def add(item, quantity)
    quantity.times { @contents << item }
  end

  #Follow up with coach: how to best split out the reformatting of the hash from this method/
  #is it ok for it to just live there
  def view
    h = Hash.new 0
    @contents.each {|p| h[p] += 1}
    @contents = h.keys.map{|k| k[:count] = h[k]; k}
    @contents.each do |item|
      price = item[:price] * item[:count]
      puts "#{item[:pizza]} x#{item[:count]}, £#{price}"
    end
  end

  def total 
    sum = 0
    @contents.each do |item|  
      sum += item[:price]
    end
    @total_price = sum
    return sum 
  end

  def place_order(payment)
    raise ERROR_MESSAGE if payment < @total_price
    @message.send(success_message)
    "Order complete!"
  end

  def success_message
    "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600).strftime("%k:%M")}"
  end
end


puts Basket.new.success_message

# b = Basket.new
# b.add({:pizza => "n", :price => 12}, 3)
# b.add({:pizza => "m", :price => 2}, 15)
# b.total
# sum += item[:price]