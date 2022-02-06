require_relative './order'

class Takeaway

  attr_reader :order, :dishes

  def initialize(dishes = [{ pizza: '£9' }, { pasta: '£7' }])
    @dishes = dishes
  end

  def menu
    @dishes
  end

  def new_order
    Order.new(@dishes)
  end

end
