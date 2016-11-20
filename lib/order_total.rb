class OrderTotal
  attr_accessor :total

  def initialize
    @total
  end

  def calculate(items)
    sum = 0
    items.each {|item| sum += item_total(item)}
    self.total = sum
  end

  def item_total(item)
    item.price * item.amount
  end


end
