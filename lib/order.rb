require_relative 'menu'

class Order

  attr_reader :current_order, :total

  def initialize
    @current_order = Hash.new(0)
    @total = 0
  end
end
