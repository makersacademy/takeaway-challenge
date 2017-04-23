require_relative 'take_away'

class Takeaway
  attr_accessor :menu, :order

  def initialize(order = [])
    @order = order
  end

  def menu
    @menu = {1 => "Plain noodle - £3",
             2 => "Egg fried rice £3",
             3 => "Special fried rice £5",
             4 => "Special chow mein £5",
             5 => "Sweet & sour chicken £5",
             6 => "Crispy beef £5"}
  end

  def order(*order)
    @order += order
  end
end
