class Receipt
  def initialize(items, total)
    @items = items
    @total = total
  end

  def print
    @items.map { |x| ["#{x.name} - £#{x.price}" ] }.push("Total: £#{@total}")
  end
end
