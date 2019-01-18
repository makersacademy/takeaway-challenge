class Menu

  attr_reader :list

  def initialize
    @list = [ { name: "Garlic Bread", price: 3 },
              { name: "Olives", price: 1 },
              { name: "Hummus", price: 2 },
              { name: "Pizza", price: 10 }]
  end

  def display
    @list.each_with_index.map { |item, index| "#{index+1}. #{item[:name]} £#{item[:price]}" }
  end
end
