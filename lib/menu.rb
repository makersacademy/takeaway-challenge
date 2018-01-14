# understands how to display a menu
# require_relative 'dish'
require_relative 'order'

class Menu
  attr_reader :menu, :dish, :price, :order, :total
  attr_accessor :running_total

  def initialize
    @menu = []
    @order = []
  end

  def add(dish, price)
    @menu << {dish => price}
  end

  def display
    menu.each_with_index do |dish, index|
     index += 1
     dish.map { |name, price| puts "#{index}.  #{name}, £#{price} "}
    end
  end

  def choose(selected, quantity)
    running_total = 0
    menu.each_with_index do |dish, index|
      index += 1
        if index == selected
          order << [dish, quantity]
            dish.map { |k,v| puts "Dish added to order: #{k}, #{v}"
            running_total = v * quantity
            print running_total
            # running_total
            puts "total so far #{running_total}"
            running_total
            }
            return running_total += running_total
          end
    end
    puts "TOTAL =  #{running_total}"
  end


  #   def add_to_order(dish, quantity)
  #     # @dish = dish
  #     # @quantity = quantity
  #     # calculate_total
  #   end


end # end of menu_class

#   attr_reader :dish, :dishes, :name, :price, :quantity, :order
#   attr_accessor :total
#
#   def initialize(order_class = Order)
#     @dishes = []
#     @order_class = order_class
#     @total = 0
#   end
#
#   def add_dish(dish)
#     @dish = dish
#     @dishes << dish
#   end
#
#   def display
#     @dishes.each_with_index do |dish, index|
#       index += 1
#       puts "#{index}: #{dish}"
#     end
#   end
#
#   def choose(selected, quantity)
#     total = 0
#     running_total = 0
#     @order = @order_class.new
#     @dishes.each_with_index do |dish, index|
#       index += 1
#       if index == selected
#         @dish = dish
#         @quantity = quantity
#         puts "Dish total = #{total = (dish.instance_variable_get(:@price) * quantity)}"
#         running_total +=total
#       end
#     end
#     puts "TOTAL =  #{running_total}"
#   end
#
#   def add_to_order(dish, quantity)
#     # @dish = dish
#     # @quantity = quantity
#     # calculate_total
#   end
#
#   def calculate_total
#     # puts "Dish total = #{total = (dish.instance_variable_get(:@price) * quantity)}"
#     # return total
#   end
#
# end
