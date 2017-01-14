class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def check
    items.length
  end

end
