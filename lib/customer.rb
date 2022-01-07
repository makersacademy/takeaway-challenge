require 'resturant'
class Customer
  attr_reader :selected_dish

  def initialize(dishes = Resturant.new)
    @dishes = dishes
    @selected_dish = []
    @total = 0
  end

  def dish_list
    @dishes
  end
end 