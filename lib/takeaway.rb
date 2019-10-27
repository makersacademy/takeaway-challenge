class Takeaway

  attr_accessor :dishes

  def initialize
    @selected_dishes = {}
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
      p "#{item}: £#{price.to_s}"
    end
  end


  def add(dish, quantity)
    @selected_dishes[dish] = quantity
  end

end
