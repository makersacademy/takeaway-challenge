require_relative "menu"

class Takeaway
  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = menu.basket
    @menu = menu
  end

  def see_menu
    @menu.list.each do |item, price|
      puts "#{item}, £#{price}"
    end
  end

  def order(item, number = 1)
    menu.add_to_basket(item, number)
  end

  def show_basket
    menu.basket
  end
  def show_price
    "£#{menu.grand_total}"
  end

end
