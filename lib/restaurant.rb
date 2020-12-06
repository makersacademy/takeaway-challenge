class Restaurant
  attr_accessor :menu, :basket, :total_price
    
  def initialize
    @menu = { 'Margarita': 7, 'Bufala': 9, 'Neapolitan': 10, 'Rocket salad': 5 }
    @basket = {}
    @total_price = 0
  end
    
  def list_menu
    @menu.each do |dish, price|
      puts "#{dish} : #{price}"
    end 
  end

  def order(dish, quantity)
    @basket[dish] = quantity
    @total_price += @menu[dish.to_sym] * quantity
  end

  def total_basket
    puts "You have ordered:"
     @basket.each do |dish, quantity|
        puts "#{dish} : #{quantity}"
     end
  end

  def total_price
    puts "Total bill: £#{@total_price}" 
  end

end
