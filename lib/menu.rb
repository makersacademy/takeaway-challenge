require 'csv'
require_relative 'order'

class Menu
  def initialize
    @dishes = {}
  end

  def read_menu(file)
    @dishes = CSV.read(file).to_h
  end

  def has_dish?(dish)
    raise "Sorry, we don\'t have #{dish} in our menu" if @dishes.has_key?(dish) == false
    @dishes.has_key?(dish)
  end

  def dish_price(dish)
    @dishes[dish].to_f.round(2)
  end

  def to_s
    result = ''
    @dishes.each do |dish, price|
      result += "#{dish} - #{price}\n"
    end
    result
  end
end
