require_relative 'messenger'

class Order
  
  def initialize( messenger = Messenger.new )
    @trolley = []
    @cost = 0 
    @messenger = messenger
  end
  
  def take_order(an_order, quantity = 1)
    quantity.times {trolley << an_order}
    ammend_total_cost
  end
  
  def check_order
    trolley.dup
  end

  def total_cost
    total = cost.round(2)
  end

  def text_confirmation
    @messenger.send_text
  end
  
  private
  
  attr_reader :trolley, :cost
  
  def ammend_total_cost
    @cost = 0
    trolley.each { |order| order.each_value {|v| @cost += v.to_f} }
  end

end