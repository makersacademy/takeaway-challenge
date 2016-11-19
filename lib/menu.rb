class Menu

  attr_reader :list

  def initialize
    @list = [
      {item_number: 1, dish: "Green Curry", price: 9 },
      {item_number: 2, dish: "Red Curry", price: 9 },
      {item_number: 3, dish: "Stir Fry", price: 7 },
      {item_number: 4, dish: "Pad Thai", price: 6 },
      {item_number: 5, dish: "Chicken Wings", price: 4 },
      {item_number: 6, dish: "Spring Rolls", price: 4 },
      {item_number: 7, dish: "Tom Yum Soup", price: 5 }]
  end

  def print
    list.each do |item|
      puts "#{item[:item_number]}. #{item[:dish]} £#{item[:price]}"
    end
  end

end
