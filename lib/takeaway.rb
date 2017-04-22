require_relative 'menu'

class Takeaway

  attr_reader :menu, :basket, :subtotal

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def read_menu
    menu.list_dishes
  end

  def order(item, quantity=1)
    fail 'Item not available' if !menu.dishes.has_key?(item)
    quantity.times {basket << item }
  end

  def verify_order(total)
    calculate_subtotal
    raise 'Conflict in total cost' if total != subtotal
    subtotal
  end

  private
  attr_writer :subtotal

  def calculate_subtotal
    self.subtotal = basket.map { |item| menu.dishes[item] }.reduce(:+)
  end

end
