require './lib/takeaway'

class Order

  def initialize(my_order)
    @my_order = my_order
  end

  def confirm
    bucket
    total
  end

private

  def bucket
    @my_order.each do |dish, details|
      "#{details[:portions]} portions of #{dish} for #{details[:price]} pounds each"
    end
  end

  def total
    (@my_order.collect { |dish, details| details[:price] * details[:portions]}).reduce(:+)
  end




end
