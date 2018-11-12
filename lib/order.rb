require './lib/send_message'


class Order
  attr_reader :total

  def initialize
    @total = 0
  end  

  def process(basket, send_message = nil)
    basket.items.each do |item|
      @total += item[:price] * item[:quantity]
      puts "#{item[:quantity]}X #{item[:name]} -- Price: #{item[:price]}"
    end
    puts "total is £#{@total}"
    puts "ORDER COMPLETE, TEXT MESSAGE OF DELIVERY SENT"
    # send_message.send if send_message
    Send_message.send
  end

#   def assure_totals(basket)
#     basket.each do |item|
#       if item.has_value?(select.capitalize)
#         item[:quantity] = val
#         basket.add(dish)
#       end
#     end
#   end

  def success?

  end

end
