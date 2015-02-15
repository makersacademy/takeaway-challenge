class Takeaway

  attr_reader :menu

  def initialize
    @menu = Hash.new
    menu[:dish]
  end

  def menu_update(dish)
    menu[:dish] = dish.price
  end 
end