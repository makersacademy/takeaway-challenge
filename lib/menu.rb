class Menu

  attr_reader :list

  def initialize
    @list = {
      "Curry" => 9,
      "Burger" => 8,
      "Pizza" => 10,
      "Noodles" => 5,
      "Chicken" => 5,
      "Kebab" => 6
    }
  end

  def print
    list.each do |dish,price|
      puts "#{dish} £#{price}"
    end
  end

  def does_not_contain?(dish)
    !list[dish]
  end

end
