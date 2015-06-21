class Till # could call it something like Summer, Calculator...?
  def initialize itemizable
    @items = itemizable.items
  end

  def total
    @items.values.inject(:+)
  end
end
