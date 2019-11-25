class Menu
  attr_reader :choices
  FOOD = [{ name: "Number 9", price: 3 }, { name: "Number 9 large", price: 4 },
  { name: "Number 45", price: 2 }, { name: "Number 6", price: 2 },
  { name: "Number 7", price: 3 }, { name: "Cheese", price: 1 },
  { name: "Extra dip", price: 1 }, { name: "Large soda", price: 2 }]

  def initialize(choices = FOOD)
    @choices = choices
  end

  def see
    @choices.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]}, £#{item[:price]}"
    end
  end

end
