require_relative 'menu'
require_relative 'messaging'

class Order

  include Menu

  attr_reader :order_items
  attr_accessor :submitted

  def initialize
    @order_items = []
    @submitted = false
  end

  def select_dish(dish, quantity = 1)
    # quantity.times { @order_items << dish }
    @order_items << { :dish => dish, :quantity => quantity }
  end

  def total
    order_prices = []
    @order_items.select do |order_dish|
       # p order_dish[:quantity]
      @@dishes.each {|d| order_prices << d[order_dish[:dish]] * order_dish[:quantity] if !d[order_dish[:dish]].nil?}
      # @@dishes.each {|d| order_prices << d[:price] * order_dish[:quantity] if d[:dish] == order_dish[:dish]}
    end
    # p order_prices
    order_prices.sum
  end

  def submit
    submit_confirm = Messaging.new
    submit_confirm.send_message("WOOHOO!!!!")
    @submitted = true
  end

end
