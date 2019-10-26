require_relative 'menu'

class Order

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def select(dish, quantity = 1)
    if already_in_basket(dish)
      @basket.find { |item| item[:dish] == dish }[:quantity] += quantity
    else
      @basket << { dish: dish, quantity: quantity }
    end
    increase_total(dish, quantity)
  end

  private

  def already_in_basket(dish)
    basket.any? { |item| item[:dish] == dish }
  end

  def increase_total(dish, quantity)
    @total += quantity * item_price(dish)
  end

  def item_price(dish)
    Menu.new.items.find { |item| item[:item] == dish }[:price]
  end
end
