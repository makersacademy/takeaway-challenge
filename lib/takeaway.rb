class Takeaway

  attr_accessor :selected_dishes

  def initialize
    @selected_dishes = []
  end

  MENU_LIST = {
      Pepperoni: 8,
      Vegi: 7,
      Hawaiian: 7,
      Mighty_Meaty: 9,
      Margherita: 6
    }


  def print_menu
    MENU_LIST.map do |item, price|
      "#{item}: £#{price.to_s}"
    end
  end


  def add(dish, quantity)
    raise "#{dish.capitalize} is not on the menu!" unless MENU_LIST.include?(dish.to_sym)
    @selected_dishes << {dish: dish, quantity: quantity}
    @selected_dishes
  end

end
