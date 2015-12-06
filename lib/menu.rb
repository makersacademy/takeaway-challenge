class Menu
  attr_reader :list

  def initialize
    @list = [
      {"Chips" => 3},
      {"Salad" => 4},
      {"Chicken" => 7},
      {"Fish" => 9},
      {"Daily special" => 15}
    ]
  end

  def view
    list.each do |hash|
      hash.each do |food, price|
        puts food.ljust(20) + ("£"+price.to_s).rjust(20)
      end
    end
  end
end
