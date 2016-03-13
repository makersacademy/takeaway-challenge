require_relative 'menu'
require 'pry'
class Order

  attr_reader :selections

  def initialize(menu_class = Menu)
    @selections = []
    @menu_class = menu_class
    @menu = menu_class.new
  end

  def choose(argument)
    @selections << @menu.place_order(argument)
    # binding.pry
  end

  def sum_total
    sum = 0
    #binding.pry
    @selections.each { |item| sum += item.price }
    sum
  end

end
