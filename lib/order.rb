class Order

  attr_reader :dishes, :menu
  
  #menu always required
  def initialize(dishes, the_menu)
    @dishes = {}
    @menu = the_menu
  end
  
  def add(dish_to_check, quantity)

    raise 'Not on menu' unless menu.has_dish?(dish_to_check)
    dishes[dish_to_check] = quantity

  end

  def total
    item_totals.sum
  end

  private

  def item_totals
    dishes.map do |dish_to_check, quantity|
      menu.price(dish_to_check) * quantity
    end

  end

end