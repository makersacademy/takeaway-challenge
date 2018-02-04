require_relative 'dish'
require_relative 'order'
require_relative 'message'


class Restaurant

  attr_reader :menu, :order

  def initialize
    @menu = []
  end

  def create_dish(name, price)
    dish = Dish.new(name, price)
    @menu << dish
  end

  def display_menu
    @menu.each { |object|
      puts "- #{object.details[:name]} | #{object.details[:price]} pounds  \n".ljust(10)
    }
  end

  # provide argument ([{name:, amount:}, {name:, amount: }], total_number)
  def create_order(dish_list, total_number)
    order = Order.new
    order.total_number = total_number
    dish_list.each {|hash|
      @menu.each{|object|
        if object.details[:name] == hash[:name] then
          name = hash[:name]
          price = object.details[:price]
          amount = hash[:amount]
          order.add_items(name, price, amount)
        end
      }
    }
    order
  end

end
