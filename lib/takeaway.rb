class Takeaway

  def initialize
    @basket = {}
  end

  def basket
    @basket.dup
  end

end
