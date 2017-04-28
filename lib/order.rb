class Order

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_to_basket(food)
    basket << food
  end

  def return_foods
    total_cost
    basket.each do |x|
      puts "You have ordered #{x[:title]} at #{x[:price]}"
    end
    puts "costing a total of #{total}"
  end

  private

  attr_writer :total, :order

  def total_cost
    self.total = 0
    basket.each do |x|
      self.total += x[:price]
    end
  end

  def cancel_order
    self.basket = []
    self.total = 0
  end

end
