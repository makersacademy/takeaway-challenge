class Takeaway

  MENU_LIST = {
      Pepperoni: 8,
      Vegi: 7,
      Hawaiian: 7,
      Mighty_Meaty: 9,
      Margherita: 6
    }

  attr_reader :selected_dishes

  def initialize
    @selected_dishes = []
  end

  def print_menu
    MENU_LIST.map do |item, price|
      "#{item}: £#{price.to_s}"
    end
  end

  def add(dish, quantity)
    raise "#{dish.capitalize} is not on the menu!" unless MENU_LIST.include?(dish.to_sym)
    @selected_dishes << {dish => quantity}
    @selected_dishes
  end

  def order_total
    raise "no dishes to check price on!" if @selected_dishes.length <= 0
    @selected_dishes.map do |dish, quantity|
      price(dish) * quantity
    end
  end

  def price(dish)
    MENU_LIST[dish.to_sym]
  end

end
