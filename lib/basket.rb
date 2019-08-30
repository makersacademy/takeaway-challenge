require_relative 'menu'

class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  # method needs fixing
  def view_basket
    counts = Hash.new(0)
    @basket.each { |menu_item| counts[menu_item] += 1 }
    counts.each { |k,v| puts "#{v}x #{k}"}
    puts "Subtotal: #{basket_totaller}"
  end

  # method needs fixing
  def basket_totaller 
    counts = Hash.new(0)
    @basket.each { |menu_item| counts[menu_item] += 1 }
    counts.each { |k,v| @total << (@menu.menu_hash[k] * v.to_f) }
    @total.sum
  end

end