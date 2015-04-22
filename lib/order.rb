require_relative 'menu'
class Order
  attr_reader :new_order

  def initialize
    @new_order = {}
    @total = 0
  end

  def add
    @new_order = { burger: 10 }
  end

  def total_price
    new_order.each do |price|
      total_price = price + price[:sum]
    end
    total_price = [:sum] # Incomplete I know..help appriciated!
  end
  
  def Text_message
    SMS.new.send_text @customer_number, @customer_order
  end
end
