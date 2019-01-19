class Takeaway
  def initialize
    @order =[]
  end
  def order(item, quantity = 1)
    @order << { item => quantity }
  end
  def show_order
    @order
  end
end
