require_relative 'menu'

class Takeaway

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
    @total = 0
  end

  def view_menu
    @menu
  end

  def add_to_order(item, qty = 1)
    @menu.check_menu(item)
    @basket[item] += qty
  end

  def calculate_total
    @basket.each do | item, qty |
      @total += (qty * @menu.price(item))
    end
    @total
  end

end
