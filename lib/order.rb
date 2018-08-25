require_relative 'menu'
require_relative 'dish'
# require 'sms'

class Order
attr_reader :basket, :menu 

  def initialize(menu) 
    @menu = menu
    @basket = []
  end

  def add(dish, amount = 1)
    fail "#{dish} is off the menu" unless on_menu?(dish)
    @basket.push({ dish: dish, amount: amount })      # (dish, amount)  
  end

  def remove(dish)
    fail "#{dish} is not in your basket" unless basket.map { |item| item[:dish] }.include?(dish)
    # add line that says basket.find(dish)
    basket.delete(dish) # why is this not working? 
  end

  # def find_dish(dish)
  #   basket.each { |item| break if item[name:] == (dish) } 
  # end

  def clear_basket 
    @basket.clear
  end 

  def list_basket 
    empty_basket_error 
    @basket.each do |item|
      puts "#{item[:amount]} x #{item[:dish].name}"
    end
  end

  def total 
    empty_basket_error
    @basket.map { |item| item[:amount] * item[:dish].price }.reduce(:+)
  end
 
  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

  def empty_basket?
    @basket.empty?
  end

  def empty_basket_error
    raise 'Basket is empty' if empty_basket?
  end

end
