class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def place_order(choice)
    @items << choice
  end
end
