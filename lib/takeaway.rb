require_relative 'menu.rb'
require_relative 'order.rb'

class Takeaway

attr_accessor :final_order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new
    @final_order = Hash.new(0)
  end

  def show_menu
    @menu.menu_list
  end

  def order(dish, number=1)
    if @menu.menu_list.include? dish
        @order.take_order(dish, number, @menu)
    end
  end

  def basket
    @order.basket
  end


  private



  # def order_organiser(number, dish)
  #   @menu.menu_list.select do |key, price|
  #       if key == dish
  #         @current_order << "#{dish}: #{number}"
  #       end
  #     end
  #   @current_order
  # end



end