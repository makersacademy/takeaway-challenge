require_relative 'methods'

class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def add(dish)
    @items << dish
  end

  def total
    total = []
    @items.each { |dish| total << dish.values.pop }
    total.inject(&:+)
  end

  def view
    puts "Order:"
    @items.each do |item|
      item.each do | name, price|
        puts "#{symbol_to_string(name).capitalize}: £#{price}"
      end
    end
  end

end
