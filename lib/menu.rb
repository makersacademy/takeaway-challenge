class Menu

  attr_reader :menu
  def initialize
    @menu = [
             {number: 1, name: "Milano", price: 19.99},
             {number: 2, name: "Peperoni Passion", price: 18.99},
             {number: 3, name: "Magarita", price: 14.99},
             {number: 4, name: "Texas BBQ", price: 18.99},
             {number: 5, name: "Vegi Supreme", price: 17.99},
             {number: 6, name: "American Hot", price: 16.99},
             {number: 7, name: "Mighty Meaty", price: 18.99},
             {number: 8, name: "Roma", price: 19.99},
             {number: 9, name: "Garlic Pizza Bread", price: 3.99},
             {number: 10, name: "Potato Wedges", price: 3.99},
             {number: 11, name: "Chicken Wings", price: 5.99}
           ]
  end

  def see_menu
    @menu.each do |item|
      puts "#{item[:number]}. #{item[:name]} : £#{item[:price]}"
    end
  end
end
