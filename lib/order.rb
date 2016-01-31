require_relative 'menu.rb'
require_relative 'takeaway.rb'

class Order

  attr_accessor :current_order
  attr_accessor :basket

  def initialize
  @current_order = Hash.new(0)
  @basket = Hash.new(0)
  end

  def take_order(dish, number, menu)
   @menu = menu
   @basket[dish] += number
   number.times do
        @menu.menu_list.select do |menu_dish, price|
          if menu_dish == dish
          @current_order[dish] += price
          end
      end
    end
    "#{number} * #{dish} added to your order"
  end

  def basket
    @s = ""
    @current_order.select do |dish, number|
         @s << "#{dish} * #{@basket[dish]} for $#{number}, "
    end
    @s


  end



end