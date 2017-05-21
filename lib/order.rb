require_relative 'menu'
require_relative 'dish'

class Order

  attr_reader :items
  attr_accessor :total_cost

  def initialize
    @items = []
    @total_cost = 0
  end

end
