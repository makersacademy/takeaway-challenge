require_relative 'menu'
require_relative 'messaging'

class Order

  include Menu

  attr_reader :order_items
  attr_accessor :submitted

  def initialize
    @order_items = []
    @order_prices = []
    @submitted = false
  end

  def add_dish(dish, quantity = 1)
    # raise "Please select a valid item" unless 
    @order_items << { :dish => dish, :quantity => quantity }
  end

  def basket
    print "Your basket:\n"
    print @order_items.map { |b| "#{b[:quantity]} x #{b[:dish]}" }.join("\n")
    print "\nOrder total: £#{total}"
  end

  def total
    @order_items.select do |order_dish|
      @order_prices << item_price(order_dish[:dish]) * order_dish[:quantity]
    end
    @order_prices.reduce(:+)
  end

  def item_price(dish)
    @@dishes.each { |d| return d[dish] unless d[dish].nil? }
  end

  def submit
    submit_confirm = Messaging.new
    submit_confirm.send_message("WOOHOO!!!!")
    @submitted = true
  end

end
