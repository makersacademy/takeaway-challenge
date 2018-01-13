class Menu
  attr_reader :items

  def initialize
    @items = {
      'Pizza' => 11.95,
      'Vegetarian Pizza' => 10.95,
      'Salad' => 5.25,
      'Drink' => 3.50
    }
  end

  def show
    items.each do |food, price|
      puts "#{food}: £%0.2f" % price
    end
  end
end
