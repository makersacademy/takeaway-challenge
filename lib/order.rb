require_relative 'menu'

class Order
  attr_reader :order_list, :bill, :menu

  def initialize
    @order_list = []
    @bill = 0
    @menu = Menu.new.list
  end

def add(dish)
  amount = @menu[dish]
  total(amount)
  @order_list << dish
end

def check_order
  @order_list.each do |dish|
end


private
def total(amount)
  @bill += amount
end

end
