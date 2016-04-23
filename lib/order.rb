require 'pry'
require_relative 'dish'

class Order

  attr_accessor :selected_dishes

  def initialize(menu = Menu.new(dish))
    @menu = menu
    @selected_dishes = []
  end

  def total
    @selected_dishes.map do |dish| 
      dish.quantity * dish.args[:price]
    end.inject(:+)
  end

end