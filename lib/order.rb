require "./lib/takeaway"

class Order < Takeaway

  attr_reader :items, :total

  def initialize
    @items = []
    @total = "total"
  end

  def menu
    super
  end

  def add(item, quantity)
    fail "Item not on menu" unless menu.include?(item)
    @items << [item, quantity]
  end



end
