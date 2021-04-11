class Calculator
  attr_reader :total
  def initialize(menu = Menu.new)
    @total = 0
    @menu = menu
  end

  def add_to_total(item)
    @total += item[:price] * item[:portions]
  end  
  
  def summary(basket)
    basket.each do |item|
      portions, dish_name, price = [item[:portions], item[:dish], item[:price]]
      puts "#{portions}x #{dish_name} #{portions * price} pounds"
    end
   puts "Total = #{total} pounds"
  end  

end  