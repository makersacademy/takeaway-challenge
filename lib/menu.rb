require 'yaml'

class Menu
  def initialize
    @menu = {dish: 'fries', price: 1.0}
  end

  def view
    "#{@menu[:dish]} ... £#{@menu[:price]}"
  end
end
