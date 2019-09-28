require_relative 'dish_list_printer'

class Order
  include DishListPrinter

  attr_reader :dishes, :mobile_number

  def initialize(mobile_number)
    @dishes = []
    @mobile_number = mobile_number
  end

  def add(dish)
    @dishes << dish
  end

  def remove(dish)
    raise "Error: can't remove, dish not in order" unless dishes.include?(dish)

    @dishes.delete(dish)
    dishes
  end

  def print_order
    @dishes.uniq.each do |dish|
      quantity = @dishes.count(dish)
      puts "#{quantity}  x  " + niceprint(dish)
    end
  end
end
