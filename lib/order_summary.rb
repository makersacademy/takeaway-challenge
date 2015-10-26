class OrderSummary

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end


end
