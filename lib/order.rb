require_relative 'takeaway'
require_relative 'menu'
class Order

  attr_reader :details, :total

  def initialize
    @details = []
    @total = 0
  end

  def add(name, price, qty=1)
    @details << { name: name, price: price, qty: qty }
    @total += (price * qty)
  end

  def item_count
    item_count = Hash.new(0)
    @details.each { |item| item_count[item[:name]] += 1 }
    item_count.each { |k, v| puts "Item: #{k} | Qty: #{v}"}
  end

end
