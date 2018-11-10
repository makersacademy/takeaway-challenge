require_relative 'menu'

class Order

  attr_reader :menu, :basket

  def initialize(menu = MENU)
    @menu = menu
    @basket = []
  end

  def buy_item(item, how_many)
    how_many.times do
      @basket << item
    end
  end


end
