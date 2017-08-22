require_relative './order_item.rb'


class Order

  attr_accessor :contents
  attr_reader :total

  def initialize(user_input_array)
    @user_input_array = user_input_array
    @total = 0
    @contents = []
  end

  def generate_order_items
    @user_input_array.each do |order_item_string|
      @contents << OrderItem.new(order_item_string)
    end
  end

  def calc_total
    @contents.each { |item| @total += item.cost }
    @total
  end

  def show
    generate_order_items
    calc_total
    @contents.each do |item|
      puts "#{item.dish_name} #{item.quantity} X £#{item.unit_cost} = £#{item.cost}"
    end
    puts "Total = £#{@total}"
  end

end
