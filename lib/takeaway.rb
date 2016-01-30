require_relative 'menu.rb'

class Takeaway

attr_accessor :current_order


  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = Hash.new(0)
  end

  def show_menu
    @menu.menu_list
  end

  def order(dish, number=1)
    if @menu.menu_list.include? dish
    @current_order[dish] += number
    "#{dish}: #{number}"
  end
  end

  def basket
    @s = ""
    @current_order.select do |dish, number|
         @s << "#{dish} * #{number}, "
    end
    @s
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