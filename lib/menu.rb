class Menu
  attr_reader :dishes, :sum
  
  def initialize
    @dishes = {}
  end
  
  def add(name, price)
    @dishes[name] = price
  end
  
  def check_out(order)
    @sum = 0
    order.trolley.each do |dish, quantity|
      @sum += @dishes[dish] * quantity
    end
    @sum
  end
  
  def confirm
    time = Time.new
    hour = time.hour + 2
    min = time.min
    puts "Thank you! Your order (total £#{@sum}) was placed and will be delivered before #{hour} #{min}."
  end  
end
