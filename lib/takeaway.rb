require_relative 'menu'

class Takeaway

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @basket_items = []
  end

  def menu
    @menu.show_menu
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  def order(item, number = 1)
    "#{number} #{item}(s) added to your order"
  end

  def basket
    @basket_items.dup
  end

end
