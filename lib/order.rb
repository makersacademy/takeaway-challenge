require 'takeaway'

class Ordermeal
  attr_reader :dishes

  def initialize(dish, quantity)
    total = Menu.new.total
    @dishes = []
    puts "1"
    @dish = dish
    @dishes.push(dish)
    @dishes.push("quantity: #{quantity}")
    puts "2"
    @quantity = quantity
    v = Menu.new.menulist.select { |key, _value| dish.include? key }.values
    v = v.join.to_i
    @dishes.push("Value of each dish: #{v}")
    puts "3"
    t = (v * quantity)
    total = Menu.new.total + t
    return total

  end
end
