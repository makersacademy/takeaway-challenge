require_relative 'send_text'
require_relative 'menu'

class Takeaway
  include SendText

  attr_reader :menu, :basket

  def initialize(menu_klass: Menu)
    @basket = Hash.new(0)
    @menu = menu_klass.new
  end

  def show_menu
    menu.show
  end

  def order(item, qty = 1)
    fail 'This item is not on the menu' unless available?(item)
    basket[item] += qty
    "#{item} x#{qty} added to your basket"
  end

  def basket_content
    fail 'Basket is empty' if basket.empty?
    basket.map { |item, qty| "#{item} x#{qty}: £#{qty * menu.dishes[item]}"}
          .join("\n")
  end

  def checkout(price = 0)
    fail 'Wrong total' if wrong_total?(price)
    send_text(basket_content, total)
    reset_order
  end

  def total
    "Total price: £" + calculate_price.to_s
  end

  def reset_order
    @basket = Hash.new(0)
  end

private
  def calculate_price
    basket.map { |item, qty| qty * menu.dishes[item] }.inject(:+)
  end

  def wrong_total?(price)
    calculate_price != price
  end

  def available?(item)
    menu.dishes.include? item
  end
end
