class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
    'Spring rolls' => 2.99,
    'Prawn toast' => 4.00,
    'Special Chow Mein' => 6.50,
    'Egg Fried Rice' => 2.99,
    }
  end

  def show_menu
    @dishes.each { |item, price|
      puts "#{item}: £#{price}"
    }
  end
end
