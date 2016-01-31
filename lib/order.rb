class Order
  
  attr_reader :total
  attr_accessor :status
  
  def initialize
    @status = []
    @total = 0
  end
  
  def add(item)
    status << item
  end
  
  def check_total
    @total = 0
    status.each do |item|
       @total += item.values[0]
    end
    total
  end
  
end