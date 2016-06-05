class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
                "chicken"=>4.99,
                "fish"=>3.99,
                "veg"=>2.99
              }
  end

  def print
    dishes.each do |item, price|
      "#{item.to_s.capitalize} is £#{sprintf('%.2f', price)}"
    end
  end
end
