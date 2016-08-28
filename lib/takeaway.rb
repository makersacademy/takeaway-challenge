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

  def checkout(payment)
    fail 'Please enter correct payment amount' unless check(payment)
  end

  private

  def subtotals
    @basket.each do | item, qty |
      subtotal = qty * @menu.price(item)
      puts "#{item} x #{qty}: £#{subtotal}"
    end
  end

  def calculate_total
    @total = @basket.reduce(0) do |sum, (item, qty)|
      sum + (qty * @menu.price(item))
    end
    puts "Total: £#{@total}"
  end

  def check(payment)
    calculate_total
    @total == payment
  end

end
