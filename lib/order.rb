require_relative 'takeaway'

class Order

  attr_reader :current_order

  def initialize
    @current_order = []
    @bellas = Takeaway.new
  end



end
