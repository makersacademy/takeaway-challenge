class Menu

  attr_reader :dishes

  def initialize
      @dishes = [
          {dish: 'Lasagne', price: 4.99},
          {dish: 'Chicken', price: 5.99},
          {dish: 'Steak', price: 8.99},
          {dish: 'Burger', price: 7.99},
          {dish: 'Borritto', price: 7.99},
          {dish: 'Omelette', price: 4.99}
      ]
  end

  def display
      @dishes.each_with_index do |dish, index|
          puts "#{index + 1}.    #{dish[:dish]}    £ #{dish[:price]}."
      end
  end
  
end
