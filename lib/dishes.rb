class Dishes
  attr_reader :price_list
  
  def initialize
    @price_list = { fish: 5, chips: 2, curry_sauce: 1 }
  end
  
  def view
    price_list.each do |key, value|
      puts "#{key} - £#{value}"
    end
  end
end
