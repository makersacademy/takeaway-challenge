require_relative 'menu'

class Order

  attr_accessor :basket

  def initialize(menu)
    @menu = menu
    @basket = {}
  end

  def add(dish, quantity)
    fail NoItemError, "Not on the menu" if menu.does_not_contain?(dish)
    increase_basket(dish, quantity)
  end

  def total
    # total = 0
    #   basket.each do |dish,quantity|
    #     total += quantity * menu.dishes[dish]
    #   end
    # total
    item_totals.inject(:+)
  end

  private

  attr_reader :menu

  def increase_basket(dish, quantity)
    basket[dish] = (basket[dish] ? basket[dish] : 0) + quantity
  end

  def item_totals
    basket.map do |dish,quantity|
      quantity * menu.price(dish)
    end
  end

end

class NoItemError < StandardError; end
