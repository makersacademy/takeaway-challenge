require_relative 'menu'

class Order

  attr_reader :menu, :basket, :order_price

  def initialize(menu = MENU)
    @menu = menu
    @basket = []
    @order_price = []
  end

  def buy_item(item, how_many)
    price = item_price(item)
    how_many.times do
      @order_price << price
      @basket << item
    end
  end

  private

  def item_price(item)
    @menu[item.to_sym]
  end


end
