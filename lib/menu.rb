class Menu

  DISHES = {
    "Lemon Chicken" => 5,
    "Fried Rice" => 3,
    "Chilli Beef" => 6,
    "10 Hot Wings" => 4
  }

  def contain?(dish)
    DISHES.has_key?(dish)
  end

  def list
    DISHES.each do |key, value|
      puts "#{key}: £#{value}"
    end
  end

end
