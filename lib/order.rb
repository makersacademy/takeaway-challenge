require_relative 'menu'

class Order
attr_reader :menu, :order_list

  def initialize
    @menu = Menu.new
    @order_list = []
  end

  def take_order(item)
    @order_list << item
  end

  def calculate_bill
    bill = @menu.dishes.select{|item|
      item[:name] if @order_list.include?(item[:name])}.map{|item|
        item[:price].to_f}.inject(:+)
    "Your bill total is £#{bill}"
  end
end
