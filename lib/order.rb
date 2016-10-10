require_relative 'menu'

class Order

attr_reader :basket, :menu, :summary
  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add(item, qty = 1)
    raise "Item not in menu" if !menu.dishes.has_key?(item)
    @basket[item] += qty
  end

  def summary
    basket.each do |item, qty|
      puts "#{item} x #{qty} = £#{qty * menu.dishes[item]}"
    end
  end

  def total

  end

end
