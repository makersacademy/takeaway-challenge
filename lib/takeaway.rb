require_relative 'menu'

class Takeaway

  attr_reader :menu, :basket, :subtotal

  def initialize
    @menu = Menu.new
    @basket = {}
    @subtotal = 0
  end

  def read_menu
    menu.list_dishes
  end

  def order(item, quantity=1)
    fail 'Item not available' if !menu.dishes.has_key?(item)
    add_item_to_basket(item, quantity)
    print_order(item, quantity)
  end

  def checkout(total)
    calculate_subtotal
    raise 'Conflict in total cost' if total != subtotal
    subtotal = 0
  end

  def see_basket
    print_basket
  end

  private

  attr_writer :subtotal

  def calculate_subtotal
    self. basket.each_pair { |food, cost_quant| self.subtotal += cost_quant.reduce(:*) }
  end

  def print_order(item, quantity)
    puts "#{quantity} x #{item} added to your basket."
  end

  def print_basket
    basket.each_pair do |food, cost_quant|
      puts "#{food} @ £#{cost_quant[0]} = £#{cost_quant.reduce(:*)}"
    end
  end

  def add_item_to_basket(item, quantity)
    quantity.times do
      basket[item] = [menu.dishes[item], quantity]
    end
  end

end
