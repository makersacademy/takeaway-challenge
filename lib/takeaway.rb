require_relative 'menu'

class Takeaway

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def view_menu
    @menu
  end

  def add_to_order(item, qty = 1)
    @menu.check_menu(item)
    @basket[item] += qty
  end

  def review_order
    subtotals
    calculate_total
  end

  private

  def subtotals
    @basket.each do | item, qty |
      subtotal = qty * @menu.price(item)
      puts "#{item} x #{qty}: £#{subtotal}"
    end
  end

  def calculate_total
    total = 0
    @basket.each do | item, qty |
      total += (qty * @menu.price(item))
    end
    puts "Total: £#{total}"
  end

end
