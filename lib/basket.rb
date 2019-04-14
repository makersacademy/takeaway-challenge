require_relative 'menu'

class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(dish)
    @basket << dish
  end

  def total_price
    total = 0
    @basket.each do |item|
      total += item[:price]
    end
    return total
  end

  def print_basket
    total = 0
    @basket.each do |item|
      puts "* #{item[:dish]} - £#{'%.2f' % item[:price]}"
      total += item[:price]
    end
    puts "-----"
    puts "Total: £#{'%.2f' % total}"
  end

end
