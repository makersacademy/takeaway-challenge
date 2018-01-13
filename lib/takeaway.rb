require_relative 'menu'
# require_relative 'price_list'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes =
    @basket =
    @text_provider =
  end

  def dishes
    @menu.display
  end

  def order
    'order'
  end

end
