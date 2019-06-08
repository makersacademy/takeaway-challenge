require_relative 'menu'

class Order
  attr_reader :current_order
  def initialize
    @current_order = []
  end
  # binding.pry
end
