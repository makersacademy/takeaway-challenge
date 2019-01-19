require_relative 'menu'
require_relative 'order'
class Takeaway

attr_reader :menu, :order_summary

def initialize(menu=Menu.new)
  @menu = menu
end

  def display_menu
    @dish_list = menu.dish.to_h
  end

  def order # order change to class, with number=1 as default
    @order_summary << Order.new.order_summary
    "#{number}x #{dish.to_s} added."
  end

end
