require_relative 'menu'

class Takeaway 
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
    @sum = 0
    
  end

  def view_menu
    @menu.display
  end

  def select_dish(dish, quantity)
    @basket[dish] += quantity
  end

  def total
    @sum = @basket.reduce(0) do |sum, (dish, quantity)| 
    sum + (@menu.menu[dish] * quantity)
    end
    p "Total is £#{@sum}"
  end



end

