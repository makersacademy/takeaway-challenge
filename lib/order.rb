
require_relative 'dishes'

class Order
attr_reader :ordered_items_name, :ordered_items_price, :sorted_by_name

  def initialize(dishes_class = Dishes)
    @dishes_class = dishes_class
    @dishes = dishes_class.new.dish_list
    @ordered_items_name = []
    @ordered_items_price = []
    @ordered_items
    @sorted_by_name = {}
    sorted

  end

  def has_dish(dish_name)
    if !@sorted_by_name[dish_name].nil?
      return true
    end
    return false
  end

def select_dish(dish_name, number)
  if has_dish(dish_name) == true
    number.times do
      @ordered_items_name << dish_name
      @ordered_items_price << @sorted_by_name[dish_name]
    end
  else
    raise "This item is not on the list"
end
   return @ordered_items_name, @ordered_items_price

end

def ordered_total
  @total_price = 0.0
  @ordered_items_price.each do |price|
    @total_price += price
  end
   @total_price
end

def check_sum
  @check_total = @ordered_items_price.reduce(0, :+)#{ |sum, indv| sum + indv }
  @check_total == @total_price ? true : false
end


def place_order
  raise "Incorrect total" if check_sum == false
    total_each_item
    p "Total cost: GBP #{@total_price}"
    p "Thank you for your order. You will shortly receive a text."
 end


end

private

def sorted
  @dishes.each do |dish_name|
    name_of_dish = dish_name[:name]
    price_of_dish = dish_name[:price]
    if @sorted_by_name[name_of_dish] == nil
      @sorted_by_name[name_of_dish] = price_of_dish
    else
      @sorted_by_name[name_of_dish].push(price_of_dish)
    end
    @sorted_by_name
  end

  def total_each_item
    @ordered_food_name = Hash.new(0)
    @ordered_items_name.each { |counts|  @ordered_food_name[counts] += 1 }
    @ordered_food_price = Hash.new(0)
    @ordered_items_price.each { |counts|  @ordered_food_price[counts] += 1 }
    p "You have ordered:"
    @ordered_food_name.each do |dish, counts|
       p "#{dish}: #{@sorted_by_name[dish]} x #{counts}"
    end
  end

end 


# order = Order.new
#
# p order.has_dish("NACHOS")
# p order.has_dish("PIZZA")
# order.select_dish("NACHOS", 2)
# order.select_dish("MAC AND CHEESE", 1)
# p order.ordered_total
# p order.check_sum
# order.place_order
