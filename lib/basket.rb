require_relative 'dish.rb'

class Basket
  attr_reader :contents

  def initialize
    @contents = []
  end

  def add(dish)
    @contents << dish
    return @contents
  end

  def remove(dish)
    raise("dish not found!") if @contents.index(dish) == nil
    @contents.delete_at(@contents.index(dish))
    return @contents
  end

  def inventory_checker
    inventory = Hash.new(0)
    @contents.each { |dish| inventory[dish] += 1 }
    return inventory
  end
end
