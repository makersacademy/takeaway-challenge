require_relative 'take_away'
require_relative 'menu'

class Order

  DEFAULT_QUANTITY = 1

  attr_reader :basket, :menu

  def initialize
    @basket = Hash.new(0)
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    @menu = Menu.new
    item_on_menu?(item)
    @basket[item] += quantity
    puts "#{item} x #{quantity} added to basket"
  end

  def remove(item, quantity = DEFAULT_QUANTITY)
    @basket[item] -= quantity
  end

  def display
    sub_total
    puts "-----"
    total
  end

  private

  def sub_total
    @basket.each do |item, quantity|
      total = "%.2f" % (quantity * @menu.meals[item])
      puts "#{item} x #{quantity} = £#{total}"
    end
  end

  def total
    total = 0
    @basket.each do |item, quantity|
      total += (quantity * @menu.meals[item])
    end
    puts "Total = £#{"%.2f" % total}"
  end

  def item_on_menu?(item)
    fail "Item not on menu." unless @menu.meals.has_key?(item)
  end

end
