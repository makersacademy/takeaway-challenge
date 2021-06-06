class Order

  attr_reader :dishes, :menu
  
  
  def initialize(dishes, the_menu)
    @dishes = {}
    @menu = the_menu
  end
  
  def add(dish_to_check, quantity)

    raise 'Not on menu' if !menu.has_dish?(dish_to_check)
    dishes[dish_to_check] = quantity

  end

  def total
    dishes.map do |dish_to_check, quantity|
      menu.price(dish_to_check) * quantity
    end.sum

  end

end