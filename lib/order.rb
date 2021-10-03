require_relative 'menu'
require_relative 'total'


class Order
  attr_reader :menu, :total

  def initialize(menu = Menu.new, total = Total.new)
    @menu = menu
    @total = total
  end

  def add_to_order(dish, quantity)
    menu.each do |item|
      total.selection << item.merge({:quantity => quantity}) if item.value?(dish)
    end
  end

  def request_bill
    total.bill
  end
end  

