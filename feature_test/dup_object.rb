class Dish
  # this won't be in the actual code as i want to protect changing the dishes details
  attr_accessor :name, :amount

  def initialize(name, amount)
    @name = name
    @amount = amount
  end

end

class Dishes
  def initialize
    @dishes = []
  end

  def dishes
    @dishes.dup
    # @dishes.clone
  end

  def add(dish)
    @dishes << dish
  end

  def remove(dish)
    @dishes.delete(dish)
  end

  def dishes_raw
    @dishes
  end

end

tasty1 = Dish.new("sausages", 2.0)
tasty2 = Dish.new("mash", 0.5)
tasty3 = Dish.new("gravy", 0.1)

gross1 = Dish.new("Mushrooms", 2)

dinner = Dishes.new
dinner.add(tasty1)
dinner.add(tasty2)
# dinner.add(tasty3)
puts ""
puts "START  ------------------------------------------------------------------------------------------"

puts "dishes: #{dinner.dishes}"
puts "dishes_raw: #{dinner.dishes_raw}"
puts ""

puts "First dish: #{dinner.dishes[0]}, #{dinner.dishes[0].name}, #{dinner.dishes[0].amount}"
dinner.dishes[0].amount = 100
puts "First dish changed?: #{dinner.dishes[0]}, #{dinner.dishes[0].name}, #{dinner.dishes[0].amount}"
puts ""

puts " Can i add a dish to dup??"
puts "current dishes: #{dinner.dishes}"
puts "adding mushrooms"
dinner.dishes << gross1
puts "current dishes updated?: #{dinner.dishes}"
puts ""

# puts " Can i add a dish to raw?"
# puts "current dishes: #{dinner.dishes_raw}"
# puts "adding mushrooms"
# dinner.dishes_raw << gross1
# puts "current dishes updated?: #{dinner.dishes}"
# puts ""

# can i delete using the dup ?? ?? ?? ??

get_rid_of_it = dinner.dishes[0]
puts "one to get rid of #{get_rid_of_it}"
puts "one to get rid of source #{dinner.dishes_raw[0]}"
puts "number of dishes #{dinner.dishes.count}"
# can i remove directly?
puts "attempt to remove directly"
dinner.dishes.delete(get_rid_of_it)
puts "number of dishes #{dinner.dishes.count}"
# can i remove 'properly'?
puts "attempt to remove through func"
dinner.remove(get_rid_of_it)
puts "number of dishes #{dinner.dishes.count}"
puts ""

# can i change an element

puts "current dishes: #{dinner.dishes_raw}"
dinner.dishes[0] = nil

puts "current dishes: #{dinner.dishes_raw}"
