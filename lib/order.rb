require_relative 'menu'
require 'pry'
class Order

  attr_reader :selections

  def initialize(menu_class = Menu)
    @selections = []
    @menu_class = menu_class
    @menu = menu_class.new
  end

  def choose(item, quantity)
    quantity.times { @selections << [item, @menu.pick(item)] }
    # binding.pry
  end

  def sum_total
    @sum = 0
    #binding.pry
    @selections.each { |item| @sum += item[1] }
    @sum
  end

  def complete_order(pay)
    pay == @sum ? "Thanks for your order" : raise("Payment error!")
  end

end
