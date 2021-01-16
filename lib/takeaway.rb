require_relative 'order'


class Takeaway

  attr_reader :menu

  def initialize(menu:)
    @menu = menu
  end

  def view_menu
    menu.see_menu
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end


end
