require_relative 'menu'

class Takeaway
  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    # @basket = []
    @menu = menu
  end

  def basket
    @basket.dup
  end

  def show_menu
    @menu.list.dup
  end

  def order(item, quantity = 1)
    fail 'Item not in menu!' unless @menu.list.include?(item)
    @basket[item] += quantity
    # quantity.times { @basket << item }
  end

  def bill
    @basket.inject(0) { |sum, (item, quantity)| sum + price(item) * quantity }
  end

  private

  def price(item)
    @menu.list[item]
  end
end
