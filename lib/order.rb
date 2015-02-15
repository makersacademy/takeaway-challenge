require './lib/dish'
require './lib/menu'
require './lib/twilio'

class Order

  attr_accessor :dishes, :phone_number, :menu

  include Twilio

  ORDER_MINIMUM = 10

  def initialize(phone_number, menu)
    @phone_number = phone_number
    @dishes = {}
    @menu = menu
  end

  def add_item(dish_name, quantity)
    raise 'item not on the menu' if find_item(dish_name) == nil
    dishes[find_item(dish_name)] = quantity
  end

  def find_item(dish_name)
     menu.dishes.select{|dish| dish.info[:name] == dish_name}[0] 
  end

  def total
    dishes.map {|dish, quantity| dish.info[:price]*quantity}.inject(:+)
  end

  def above_minimum?
    total > ORDER_MINIMUM
  end

  def display_summary
    dishes.each {|dish, quantity| (puts "#{dish.info[:name]}, quantity: #{quantity}, total:#{dish.info[:price]*quantity}".ljust(10).center(30))}
  end

  def submit
    raise 'order is below minimum' if above_minimum? == false
    send_sms("Thank you for your order, the total amount was £#{total}")
  end
end
