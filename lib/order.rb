require_relative 'menu.rb'
require_relative 'takeaway.rb'

class Order

  attr_accessor :current_order
  attr_reader :total

  def initialize
  @current_order = Hash.new(0)
  @basket = Hash.new(0)
  @total = 0
  end

  def take_order(dish, number, menu)
   @menu = menu
   @basket[dish] += number
   order_taker(dish, number)
   "#{number} * #{dish} added to your order"
  end

  def basket
    basket_maker
  end

  private

  def basket_maker
    @s = "Your order summary is: \n"
      @current_order.select do |dish, number|
         @s << "#{dish} * #{@basket[dish]} for $#{number},\n"
      end
    @s << "Total = #{@total}"
    puts @s
  end

  def order_taker(dish, number)
    number.times do
        @menu.menu_list.select do |menu_dish, price|
        if menu_dish == dish
          @current_order[dish] += price
          @total += price
        end
      end
    end
  end



end