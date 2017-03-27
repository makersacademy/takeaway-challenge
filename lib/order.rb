require_relative 'menu'
class Order

  attr_reader :items, :total
  attr_writer :total

  def initialize
    @items = []
    @total = 0
  end

end
