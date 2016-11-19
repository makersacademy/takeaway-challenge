require_relative "menu"

class Takeaway
  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = {}
    @menu = menu
  end

  def see_menu
    @menu.list.each do |item, price|
      puts "#{item}, £#{price}"
    end
  end

  def show_basket
    menu.basket
  end

end
