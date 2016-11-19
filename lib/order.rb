class Order

  attr_accessor :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_to_basket(current_selection)
    self.basket << current_selection
  end

  def calculate_total
    self.basket.each { |item| self.total += (item[:price] * item[:qty]) }
    self.total
  end

  def place_order

  end

end
