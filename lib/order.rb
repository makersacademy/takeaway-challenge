require './lib/menu.rb'

class Order
  attr_reader :basket

  def initialize
    @basket = Hash.new
  end

  def select(items, quantity)
    @basket.store(:items, quantity)
  end
end
