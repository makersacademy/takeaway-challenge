require_relative 'menu'
require_relative 'price_list'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu)
    @menu = menu
  end

  def dishes
    @menu.display
  end

  # def order
  #   'order'
  # end

end
