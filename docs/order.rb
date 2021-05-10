class Order

  attr_reader :ticket, :total

  def initialize
    @ticket = []
    @total = 0
  end

  def pickdish
    @total += 2
  end

end