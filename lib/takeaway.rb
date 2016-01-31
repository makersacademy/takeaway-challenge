require_relative 'menu'

class Takeaway
  def initialize(menu = Menu.new)
    @basket = Hash.new([0, 0])
    @menu = menu
  end

  def basket
    @basket.dup
  end

  def show_menu
    @menu.list
  end

  def order(item, quantity = 1)
    quantity += @basket[item].first
    @basket[item] = quantity, quantity * price(item)
  end

  def bill
    @basket.inject(0) { |sum, (_item, (_quantity, subtotal))| sum + subtotal }
  end

  def checkout(estimate)
    fail 'Incorrect estimated total!' unless estimate == bill
  end

  private

  def price(item)
    fail 'Item not in menu!' unless @menu.list.include?(item)
    @menu.list[item]
  end
end
