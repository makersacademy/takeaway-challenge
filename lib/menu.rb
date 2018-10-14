require_relative 'takeaway'
require_relative 'basket'

class Menu

  attr_reader :menu
  attr_accessor :basket

  def initialize
    @menu = {
      'margherita' => 8,
      'pepperoni'  => 9,
      'vegetarian' => 9
    }
    @basket = Basket.new.basket
  end

  def display
    @menu
  end

  def order(item)
    if @menu.has_key?(item)
      @basket << item
    end
  end
end
