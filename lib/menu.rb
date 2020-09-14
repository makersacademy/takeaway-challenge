class Menu

  attr_reader :menu_list
  
  def initialize
    @menu_list = [
      { name: "Cheeeseburger", price: 7.5, category: "Burgers" },
      { name: "Bambi", price: 8.0, category: "Burgers" },
      { name: "Veggie Surprise", price: 7.5, category: "Burgers" },
      { name: "Halloumi & Rocket", price: 7.0, category: "Burgers" }, 
      { name: "Mac 'n' Cheeseburger", price: 6.5, category: "Burgers" }, 
      { name: "Chips", price: 2.5, category: "Sides" }, 
      { name: "Truffle Polenta Chips", price: 3.5, category: "Sides" }, 
      { name: "Mushy Peas", price: 2.0, category: "Sides" }, 
      { name: "Cauliflower Cheese", price: 6.5, category: "Sides" }, 
      { name: "Chardonnay", price: 5.5, category: "Drinks" }, 
      { name: "Corona", price: 4.5, category: "Drinks" }, 
      { name: "Gin & Tonic", price: 5.0, category: "Drinks" }
    ]
  end

  def print
    @menu_list.each_with_index do |dish, index|
      puts dish[:category] if dish[:category] != @menu_list[index - 1][:category]
      puts "  #{index + 1}. #{dish[:name]}  #{dish[:price]}"
    end
  end
end
