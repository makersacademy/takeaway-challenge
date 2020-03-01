require "./lib/order"

class TakeAway
  attr_reader :menu, :order
  def initialize
    @order = Order.new
    @menu = [
      {dish: "Fish & chips", price: 7.95},
      {dish: "Mac 'n' cheese and chips", price: 6.95},
      {dish: "Mushroom pie and chips", price: 7.95},
      {dish: "Beetroot and quinoa burger", price: 9.95},
      {dish: "Potatoes", price: 3.95},
    ]
  end

  def print_menu
    @menu
  end

end
