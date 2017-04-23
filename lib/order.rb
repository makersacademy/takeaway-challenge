require "./lib/takeaway"

class Order < Takeaway

  attr_reader :items

  def initialize
    @items = []
    @total = total
  end

  def menu
    super
  end

  def add(item, quantity)
    fail "Item not on menu" unless menu.include?(item)
    cost = self.menu[item]
    @items << [item, cost, quantity]
  end

  def sub_total
    self.items.map {|x| x[1] * x[2]}
  end

  def total
    sub_total.reduce(:+)
  end




end
