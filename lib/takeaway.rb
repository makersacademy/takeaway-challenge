require './lib/print'

class Takeaway
  MENU = { :pho => 5.99, :curry => 3.99, :noodles => 5.99, :wings => 4.99 }
  PRINT = Print.new

  def read_menu
    PRINT.print_menu(MENU)
  end

  def order(dish)
    raise "Unfortunatley #{dish} isn't available" unless dish_available?(dish)
    PRINT.add_to_basket(dish)
  end

  private

  def dish_available?(order)
    order = order.downcase.to_sym
    MENU.include?(order)
  end

end
