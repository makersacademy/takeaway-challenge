require 'csv'
require_relative 'menu'
require_relative 'basket'
require_relative 'order_log'

class User
  attr_reader :mobile

  def initialize(mobile, menu = Menu.new, basket = Basket.new, order_log = OrderLog.new)
    @mobile = mobile
    @menu = menu
    @basket = basket
    @order_log = order_log
  end

  def view_menu
    puts @menu.display_menu_in_category
  end

  def add_to_basket(id)
    @basket.add(@menu.get_item(id))
  end

  def delete_from_basket(id)
    raise "basket is empty" if @basket.empty?

    @basket.delete(@menu.get_item(id))
  end

  def view_basket
    puts @basket.view
  end

  def check_out
    raise "basket is empty" if @basket.empty?

    @order_log.add(self, @basket)
  end

  def menu_ids
    @menu.food_menu.map { |dish| dish["id"] }
  end

  def basket_item_ids
    # @items ? @items.map { |dish| dish["id"] } : []
    @basket.items.map { |dish| dish["item"]["id"] }
  end

end
