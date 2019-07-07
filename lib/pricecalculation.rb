require_relative 'order'
require_relative 'menu'

class PriceCalculation
  attr_reader :total_price

  def initialize(order, menu = Menu.new)
    @order = order
    @menu = menu
    @subtotal = []
    @total_price = 0
  end

  def total
    @order.current_order.each do |order|
      order.each do |item, quantity|
        menu_prices = menu_price(item)
        item_total = price_calc(quantity, menu_prices)
        @total_price += item_total
        @subtotal << ["#{item} X #{quantity} = £#{item_total}"]
      end
    end
    @subtotal.join(', ')
  end

  def price_calc(quantity, menu_prices)
    calc = quantity * menu_prices
    calc.round(2)
  end

  def menu_price(item, menu = Menu.new)
    menu.show.each do |menu_hash|
      menu_hash.each do |dish, price|
        if item == dish
          return price
        end
      end
    end
  end

end
