require_relative 'menu'

class Takeaway
  attr_reader :menu, :basket, :basket_total
  def initialize
    @menu = Menu.new
    @basket = []
    # @basket_total
  end

  def show_menu
    print menu.dishes
  end

  def add(like, count = 1)
    raise "Sorry, no #{like.downcase}." unless menu.dishes.has_key?(like)

    count.times do basket << { like => menu.dishes[like] } end
    print "#{count}x #{like}(s) added to your basket."
    self.basket_total = basket.map { |x| x.values[0] }.sum
  end

  private
  attr_writer :basket, :basket_total
end
