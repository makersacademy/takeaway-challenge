class Menu

  attr_reader :menu

  def initialize
    @menu = [
             {num: 1, name: "Milano", price: 19.99},
             {num: 2, name: "Peperoni Passion", price: 18.99},
             {num: 3, name: "Magarita", price: 14.99},
             {num: 4, name: "Texas BBQ", price: 18.99},
             {num: 5, name: "Vegi Supreme", price: 17.99},
             {num: 6, name: "American Hot", price: 16.99},
             {num: 7, name: "Mighty Meaty", price: 18.99},
             {num: 8, name: "Roma", price: 19.99},
             {num: 9, name: "Garlic Pizza Bread", price: 3.99},
             {num: 10, name: "Potato Wedges", price: 3.99},
             {num: 11, name: "Chicken Wings", price: 5.99}
           ]
  end

  def see_menu
    @menu.each {|item| puts "#{item[:num]}. #{item[:name]} : £#{item[:price]}"}
  end
end
