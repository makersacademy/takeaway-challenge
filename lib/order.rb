class Order

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def complete?
    # fail if ((@items.length)-1)/2) != @items
  end

end
