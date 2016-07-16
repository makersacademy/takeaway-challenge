require_relative 'takeaway'
class Menu

  attr_reader :order, :takeaway

  def initialize
    @menu_list = {"Banana Smoothie" => 2.95}
  end

  def menu
    return @menu_list
  end

  def make_an_order(confirm)
  #  return "Would you like to order from this restaurant, or return to the restaurant list"
    case confirm
    when 'yes'
      @order = Order.new
    when 'no'
      @takeaway = Takeaway.new
    end
  end
end
