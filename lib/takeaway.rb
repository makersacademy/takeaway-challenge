require_relative 'menu'

class Takeaway
  attr_reader :menu, :basket
  def initialize
    @menu = Menu.new
    @basket = []
  end

  def show_menu
    print menu.dishes
    end

  def add(like, count = 1)
    count.times do self.basket << {like => menu.dishes[like]} end
    #a = subject.basket.map { |x| x.values[0] }
    print "#{count}x #{like}(s) added to your basket."
  end

  private
  attr_writer :basket
end
