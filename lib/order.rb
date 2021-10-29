require_relative 'menu'

class Order
  attr_reader :ordered_dishes

  def initialize
    @ordered_dishes = nil
  end
end