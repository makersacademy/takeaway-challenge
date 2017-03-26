# Allows the user to confirm their selections before submission

class Order

  def initialize
    @summary = []
    @total_price = 0
    @confirmed = false
  end

  attr_reader :summary, :total_price, :confirmed

  def total
    summary.each do |dish|
      self.total_price += (dish[:price] * dish[:quantity])
    end
    total_price
  end

  private

  attr_writer :total_price
end
