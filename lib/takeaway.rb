require_relative 'menu'

class Takeaway
  attr_reader :menu
  def initialize
    @menu = Menu.new
  end

  def show_menu
    x = menu.dishes
    puts x
    return x
    end

  def confirm(like, count = 1)
    print "#{count}x #{like}(s) added to your basket."
  end
end
