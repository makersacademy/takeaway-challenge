require_relative 'menu'

class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end
end
