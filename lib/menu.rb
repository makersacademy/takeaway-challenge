class Menu

  attr_reader :menu

  def initialize
    @menu = [
             {name: "Milano", price: 19.99},
             {name: "Peperoni Passion", price: 18.99},
             {name: "Magarita", price: 14.99},
             {name: "Texas BBQ", price: 18.99},
             {name: "Vegi Supreme", price: 17.99},
             {name: "American Hot", price: 16.99},
             {name: "Mighty Meaty", price: 18.99},
             {name: "Roma", price: 19.99},
             {name: "Garlic Pizza Bread", price: 3.99},
             {name: "Potato Wedges", price: 3.99},
             {name: "Chicken Wings", price: 5.99}
           ]
  end

  def see_menu
    item_number = 0
    @menu.each {|item| item_number += 1; puts "#{item_number}. #{item[:name]} : £#{item[:price]}"}
  end
end
