require_relative './send_sms'

class Order
  attr_accessor :dishes, :combined_order, :order_total, :order_confirmed

  def initialize(dishes)
    @dishes = dishes
    @combined_order = {}
    @order_total = 0
    @order_confirmed
  end

  def add_to_order
    (0...@dishes.length).each do | i |
      clean_order(i)
      @combined_order[:"dish_#{i + 1}"] = @dish_add
      @combined_order[:"price_#{i + 1}"] = @price_add.to_i
      @combined_order[:"quantity_#{i + 1}"] = @quantity.to_i
      calculate_order(@price_add.to_i, @quantity.to_i)
    end
  end

  def calculate_order(price, quantity)
    @order_total += price * quantity
  end

  def verify_order
    puts "The total of your order is £#{@order_total}"
    puts "Please press 1 to confirm or 2 to cancel"
    response = gets.chomp
    if response.to_i == 1
      @order_confirmed = true
      SendSMS.new
    elsif response.to_i == 2
      puts "Order cancelled"
      @order_confirmed = false
    end
  end

  private

  def clean_order(number)
    @dishes[number].slice!(0,3)
    @dish = @dishes[number].split(",")
    @dish_add = @dish[0]
    @price_add = @dish[1]
    @quantity = @dish[2]
  end
end