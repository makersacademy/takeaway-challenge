require './lib/takeaway'

class Order

  def initialize(my_order)
    @my_order = my_order
  end

  def bucket
    @my_order.each do |dish, details|
      print "#{details[:portions]} portions of #{dish} for #{details[:price]} pounds each"
    end
  end

  def total
    amount = 0
    @my_order.each do |dish, details|
      amount += details[:price] * details[:portions]
    end
    amount
  end



end
