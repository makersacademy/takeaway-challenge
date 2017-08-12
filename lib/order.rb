require_relative './order_item.rb'
require_relative './takeaway_app.rb'

class Order

  attr_accessor :contents, :total

  def initialize
    @contents = []
    @total = 0
  end

  def receive(order_item)
    @contents << order_item
  end

  def loop_receiving(order_item)
    while order_item.dish_number != ""
      receive(order_item)
      order_item = OrderItem.new
    end
  end

  def total
    @contents.each { |item| @total += item.cost }
    @total
  end

  def show
    @contents.each do |item|
      puts "#{item.dish_name} #{item.quantity} X £#{item.unit_cost} = £#{item.cost}"
    end
    puts "Total = £#{@total}"
  end

end
