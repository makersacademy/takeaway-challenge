# hash out requires for non testing
require_relative './order_item.rb'
require_relative './takeaway_app.rb'

class Order

  attr_accessor :contents
  attr_reader :total

# use second initialize method for running the app
  def initialize
    @contents = []
    @total = 0
  end

  # def initialize
  #   @order_item = OrderItem.new
  #   @contents = []
  #   @total = 0
  #   while @order_item.dish_number != nil
  #     @contents << @order_item
  #     @order_item = OrderItem.new
  #   end
  # end

  def receive(order_item)
    @contents << order_item
  end

  def calc_total
    @contents.each { |item| @total += item.cost }
    @total
  end

  def show
    calc_total
    @contents.each do |item|
      puts "#{item.dish_name} #{item.quantity} X £#{item.unit_cost} = £#{item.cost}"
    end
    puts "Total = £#{@total}"
  end

end
