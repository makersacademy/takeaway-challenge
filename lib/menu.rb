class Menu
attr_reader :dishes
  def initialize
    @dishes = { rice: 3, chicken: 2, beans: 3, yam: 2, fish: 4, noodles: 2 }
    # @dishes = [ 
    #   {dish: 'rice', price: 4}, 
    #   {dish: 'noodles', price: 3}, 
    #   {dish: 'chicken', price: 2} 
    # ]
  end

  def print_dishes
    @dishes.each { |key,value| puts "#{key} => £#{value}" }
    # @dishes.each { |dishes| puts "#{dishes[:dish]} => £#{dishes[:price]}" }
  end
end