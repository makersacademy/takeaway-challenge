require 'csv'

class Order

  attr_reader :order_items, :sum, :your_order, :yo_total

  def initialize(order_items, menu_filename = './resources/menu_list.csv')
    @menu_filename = menu_filename
    @order_items = order_items
    @sum = 0
    @your_order = []
    @yo_total = 0
    @your_order_print = []
  end

  def total
    order_items.split(" ").each do |item|
      CSV.foreach(@menu_filename) do |line|
        number, dish, price = line
        @sum += price.to_f if number == item
        @your_order << dish + price if number == item
        @your_order_print << dish if number == item
      end
    end
  end

  def check_total
    your_order_total
      raise "You have been wrongly charged!" if @sum != @yo_total
      "You have been charged correctly"
  end

  def confirm_order
    @your_order_print.join(",")
    puts "Your order is #{@your_order_print} and the total is £#{@sum}0"
    require './lib/send-sms.rb'
  end


private

def your_order_total
  your_order.each do |items|
    @yo_total += items[-3, 3].to_f
  end
end

end
