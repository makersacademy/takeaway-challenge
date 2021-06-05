require_relative 'menu'

class TakeAway
  attr_reader :customer_order

  def initialize(menu = Menu.new)
    @menu = menu
    @customer_order = []
  end

  def print_menu
    @menu.print
  end

  def select_dish(name)
    raise "We don't have that, sorry" unless on_the_menu?(name)
    
    @customer_order << name
  end

  def total
    @customer_order.map { |name| ask_menu_for_price(name) }.inject(:+)
  end

  def order
    puts "That will be £#{total} please."
    @customer_order = []
    puts 'Thanks for your order!'
  end

  private

  def ask_menu_for_price(name)
    @menu.find_price(name)
  end

  def on_the_menu?(name)
    @menu.available?(name)
  end

end
