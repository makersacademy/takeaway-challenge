require_relative 'menu'

class Order

  attr_reader :basket, :total, :list

  def initialize
    @basket = {}
    @total = 0
  end

  def add_to_order(item)
    @basket[item.to_sym] = Menu::MENU[item.to_sym]
    add_to_total(item)
  end

  def summary
    "Your order so far contains: #{list}, all coming to a total of £#{@total}."
  end

  private

  def list
    @basket.keys.join(", ")
  end

  def add_to_total(item)
    @total += Menu::MENU[item.to_sym]
  end

end
