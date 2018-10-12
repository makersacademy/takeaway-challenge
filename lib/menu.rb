class Menu 
  attr_reader :dishes, :order_dishes
  def initialize 
    @dishes = [
    	{ item: 'Bruschetta', price: 6 }, 
    	{ item: 'Garlic Bread', price: 2 }, 
      { item: 'Linguini', price: 6 },
      { item: 'Pizza', price: 4 },
      { item: 'Risotto', price: 5 }, 
      { item: 'Spaghetti', price: 5 }, 
      { item: 'Tiramisu', price: 7 }
      ] 
  end
    
  def list 
    @dishes.each_with_index { |value, index|
      puts "#{index + 1}. #{value[:item]} £#{value[:price]}"
    }
  end
  
  def order(dishes)
    @order_dishes = dishes
    'Thank you! Your order was placed.'
  end
end
