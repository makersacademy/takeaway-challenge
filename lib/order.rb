class Order
  
  attr_reader :total
  attr_accessor :status
  
  def initialize
    @status = []
    @total = 0
  end
  
  def add(item)
    status << item
    calculate_partial
  end
  
  def check_order
    calculate_basket
    calculate_total
  end
  
  def clear_order
    self.status = []
    "Your basket is now empty."
  end
  
private
  
  def calculate_basket
    basket = status.group_by(&:keys)
    basket.each_pair {|item, number| puts "#{item.join} x #{number.size} = £#{(number[0].values.join.to_i) * (number.size/1.0)}"}
  end
  
  def calculate_partial
    self.status.each { |item| "added #{item.keys[0]} to your basket"}
  end
  
  def calculate_total
    @total = 0
    status.each { |item| @total += item.values[0] }
    "Total = £#{total}"
  end
  
end