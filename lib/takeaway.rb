require_relative 'menu'

class Takeaway
  attr_reader :menu, :basket, :basket_total, :price
  attr_reader :wrong_price

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def show_menu
    print menu.dishes
  end

  def add(like, count = 1)
    order_present?(like)
    add_to_basket(like, count)
    update_basket_total
    confirmation_message(like, count)
  end

  def complete_order
    check_total
  end

  private
  attr_writer :basket, :basket_total

  def order_present?(like)
    raise "Sorry, no #{like.downcase}." unless menu.dishes.has_key?(like)
  end

  def add_to_basket(like, count)
    count.times do basket << { like => menu.dishes[like] } end
  end

  def confirmation_message(like, count)
    print "#{count}x #{like}(s) added to your basket."
  end

  def update_basket_total
    self.basket_total = basket.map { |x| x.values[0] }.sum
  end

  def check_total
    raise "Sorry, incorrect total." if wrong_price?
  end

  def wrong_price?
    basket_total != basket.map { |x| x.values[0] }.sum
  end
end
