require_relative 'menu'
require_relative 'dish'
require_relative 'send_text'

class Order
  attr_reader :order_list

  def initialize
    @order_list = []
  end

  def add(name, amount)    
    dish = Menu::MENU.select { |dish| dish[:name] == name }.inject(:merge)
    amount.times { @order_list << Dish.new(name, dish.fetch(:price)) }
  end

  def print_order
    dishes = []
    @order_list.each { |dish| dishes << dish.name }
    dishes.uniq.map { |dish| "#{dish} x#{dishes.count(dish)}" }.inject(:merge)
  end

  def total
    @order_list.map { |dish| dish.price }.sum
  end

  def place_order(send_text = SendText.new)
    send_text.go_send
    #puts "Message sent"
  end
end
