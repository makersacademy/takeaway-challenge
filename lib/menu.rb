require 'order'

class Menu

attr_reader :menu
attr_accessor :order

  def initialize
    @menu = {
      "Fried rice" => 8,
      "Kung Po chicken" => 8.5,
      "Singapore fried noodles" => 9,
      "Chicken curry" => 7.5,
      "Coconut rice" => 3
    }
    @order = Order.new
  end

  def view_menu
    return @menu
  end
end
