require_relative 'menu'
class Order

  attr_reader :items, :total

  def initialize
    @items = []
    @total = 0
    @menu = Menu.new
  end

  def input_items(order)
    @items = @menu.select(read_order(order))
  end

  def verify_total
    total = 0.0
    @items.each do |item|
      price = 0
      @menu.dishes.each { |i| price = i[:price] if i[:name] == item[:name] }
      total += price * item[:quantity]
    end
    @total == total
  end

  private

  def read_order(order)
    items = order.split(', ')
    @total = items.pop.to_f
    items.map { |item| [item.split[0..-2].join(' '), item.split[-1].to_i] }
  end
end
