require_relative 'menu'

class Basket

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = []
  end

  def view_basket
    menu_item_counts = Hash.new(0)
    @basket.each { |menu_item| menu_item_counts[menu_item] += 1 }
    menu_item_counts.each { |k,v| puts "#{v}x #{k}"}
    puts "Subtotal: £#{@total.inject(0, :+)}"
  end

end