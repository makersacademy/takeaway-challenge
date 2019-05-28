class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "Tom Yum" => 9.90,
      "Pad Thai" => 10.00,
      "Green Curry" => 6.99,
      "Red Curry" => 6.00,
      "Aloe Drink" => 2.00,
      "Chocolate Ice Cream" => 4.00,
      "California Roll" => 12.00
    }
  end

  def show
    @dishes.each do |key, value|
      puts "#{key}: £%.2f" % value.to_s
    end
  end

end
