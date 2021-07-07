class Order
  attr_reader :order, :time
  
  ERROR_NOT_INTEGER = "Error: only numbers can be supplied"
  
  def initialize 
    @order = Array.new
    @time = Time.now
  end
  
  def add(number, menu)
    raise ERROR_NOT_INTEGER unless number.is_a?(Integer)

    menu.get(number)
    @order.push(number)
    @time = Time.now
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
