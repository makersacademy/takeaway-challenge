require "menu"
class Order

  attr_reader :pizza

  def initialize
    @basket = {}
    Menu.new
  end

  def add(item, quantity)
    @basket = {item => quantity}
    price(item, quantity)
  end

  private

  def price(item, quantity)
    @pizza[item]**quantity
  end

end
