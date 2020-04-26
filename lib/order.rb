class Order
  attr_reader :order 
  
  ERROR_NOT_INTEGER = "Error: only numbers can be supplied"
  
  def initialize 
    @order = Array.new 
  end
  
  def add(number, menu)
    raise ERROR_NOT_INTEGER unless number.is_a?(Integer)

    menu.get(number)
    @order.push(number)
    @order.last
  end
  
  def total(menu)
    total = 0
    return total if @order.empty?
    
    @order.each do |item|
      total += menu.get(item).price
    end
    
    return total
  end
  
end
