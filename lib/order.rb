require_relative 'dish_list_printer'

class Order
  include DishListPrinter

  attr_reader :dishes, :mobile_number, :total

  def initialize(mobile_number)
    @dishes = []
    @total = 0
    @mobile_number = mobile_number
    @submitted = false
  end

  def add(dish)
    update_total(dish)
    @dishes << dish
  end

  def check_total
    return puts "Nothing in the order!" unless dishes.length > 0

    checked_total = 0
    dishes.each { |dish| checked_total += dish.cost }
    return puts "Order total confirmed correct" if total == checked_total

    puts "Order total incorrect! Please close the app and start again."
  end

  def print_order
    dishes.uniq.each do |dish|
      quantity = dishes.count(dish)
      puts "#{quantity}  x  " + niceprint(dish)
    end
    puts "Total:" + "💎".rjust(32) + total.to_s.rjust(3)
  end

  private 

  def update_total(dish)
    @total += dish.cost
  end
end
