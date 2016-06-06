require 'order'
class Takeaway

  def initialize(menu:, order: nil)
    @menu= menu
    @order= order || Order.new
  end

  def print_menu
      menu.printing
  end

  def select(dishes)
    dishes.each { |number_of, dish| 
      @order.add(number_of, dish)
    }
  end

  private
  attr_reader :menu, :select_menu
end