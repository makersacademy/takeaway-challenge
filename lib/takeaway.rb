require_relative 'menu'

class Takeaway

  attr_reader :basket, :menu, :items, :total_cost

  def initialize
    @menu = Menu.new
    @items = []
    @total_cost = 0
  end

  def read_menu
    menu.display_menu
  end

  def order
    puts "Select your item. Please enter the correct name."
    items << menu.selection(STDIN.gets.chomp.to_s)
    return "item added to the basket."
  end

  def basket_summary
    items.each { |item| puts "#{item} #{menu.price(item)}" }
  end

  def total
    calculate_total
    return "Your meal total comes to £#{@total_cost.round(3)}"
  end

  def checkout
    return "Thanks for your order. Your food will arrive in roughly 1 hour."
  end

  private

  def calculate_total
    items.each { |item| @total_cost += menu.price(item) }
  end
end
