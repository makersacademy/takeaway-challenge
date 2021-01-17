require_relative 'menu'

class Takeaway
  attr_reader :menu, :basket, :basket_total, :price

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
    raise "Sorry, incorrect total." if wrong_price?

    confirmation_message_2
  end

  private
  attr_writer :basket, :basket_total

  def order_present?(like)
    raise "Sorry, no #{like.downcase}." unless menu.dishes.has_key?(like)
  end

  def add_to_basket(like, count)
    basket << { like => menu.dishes[like], "count" => count }
  end

  def confirmation_message(like, count)
    print "#{count}x #{like.downcase}(s) added to your basket."
  end

  def update_basket_total
    self.basket_total = basket.map { |x| x.values[0] * x.values[1] }.sum
  end

  def wrong_price?
    basket_total != basket.map { |x| x.values[0] * x.values[1] }.sum
  end

  def confirmation_message_2
    puts "You have ordered:"
    basket.map { |x| puts x.values[1].to_s + " " + x.keys[0].downcase + "(s)"}
    puts "Total: £#{basket_total.to_i}"
  end
end
