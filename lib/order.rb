require_relative 'takeaway'

class Order
  
  attr_reader :order

  def initialize(takeaway = Takeaway.new)
    @takeaway = takeaway
    @order = []
  end

  def select(item_number)
    order << @takeaway.fetch_menu[item_number - 1]
  end
end