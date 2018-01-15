require_relative 'menu'

class Order
  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_to_order(item, quantity)
    quantity.times { place_in_basket(item) }
  end

  def summary
    "Your order so far contains: #{list}, all coming to a total of £#{@total}."
  end

  def check(customer_calc)
    @total == customer_calc
  end

  private

  def place_in_basket(item)
    @basket << item
    add_to_total(item)
  end

  def list
    (@basket.uniq.map { |item| item + " x#{@basket.count(item)}" }).join(", ")
  end

  def add_to_total(item)
    @total += Menu::MENU[item.to_sym]
  end

end
