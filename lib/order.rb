require_relative 'menu'

class Order
  attr_reader :trolley

  def initialize
    @trolley = Hash.new(0)
  end

  def add_item(item, quantity)
    @trolley[item] += quantity
  end

  def trolley_summary(menu)
    @everything = menu.dishes.each do |k, v|
      trolley.each do |key, val|
        if k == key
          return "#{k}, £#{v*val}"
        end
      end
    end
  end

  def total_bill(menu)
    @total = menu.dishes.each do |k, v|
      trolley.each do |key, val|
        if k == key
          return "Total: £#{v*val}"
        end
      end
    end
    @total
  end
end
