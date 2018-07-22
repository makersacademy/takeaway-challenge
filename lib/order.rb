class Order
  attr_reader :whiskies

  def initialize
    @whiskies = {}
  end

  def add(item, quantity)
    whiskies[item] = quantity
  end
end
