class Orderlist

  def initialize
  @contents = []
  end

  def add(order)
    @contents << order
  end

  def show_contents
    @contents
  end

end
