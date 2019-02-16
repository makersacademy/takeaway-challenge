class TotalChecker

  def initialize(total = 0)
    @total = total
  end

  def calc(basket)
    basket.inject(0) {|sum, hash| sum + hash[:price]}
  end

  def check
    raise "Please check total again." if @total != 17.60
    true
  end

end
