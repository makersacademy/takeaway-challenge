require_relative './menu'

class Order

  attr_reader :basket, :menu, :price_store

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @price_store = []
  end

  def add_dish(dish)
    @menu.menu_list.each do |item, price|
      @basket << { item => price } if dish == item
    end
    add_price(dish)
  end

  def show_basket
    p "Basket items: "
    @basket.each do |item|
      p "Item: #{item.keys.join} price: #{item.values.join}"
    end
    p "Total: #{basket_total}"
  end

  private

  def add_price(dish)
    @menu.menu_list.each do |item, price|
      @price_store << price if dish == item
    end
  end

  def basket_total
    @price_store.sum
  end

end
