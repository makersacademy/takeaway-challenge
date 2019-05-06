class TotalChecker

  def initialize(basket, total = 0)
    @basket = basket
    @total = total
  end

  def check
    raise "Please check total again." unless @total == calc
    true
  end

private
  def calc
    @basket.inject(0) { |sum, hash| sum + hash[:price] }
  end

end
