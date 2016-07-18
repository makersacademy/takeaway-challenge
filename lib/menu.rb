require_relative 'takeaway'
require_relative 'order'

class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {"Celery Cupcakes" => 2.95,
                "Lacto-Free Milk" => 1.95,
                "Fat-Free Butter" => 3.50}
  end

  def show_menu
    @menu_list.flatten.join(", ")
  end

  def make_an_order(confirm)
  #Would you like to order from this restaurant
    case confirm
    when 'yes'
      @order = Order.new
      @order
    when 'no'
      @takeaway = Takeaway.new
      @takeaway
    end
  end
end
