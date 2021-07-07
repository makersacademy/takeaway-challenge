class Menu

attr_reader :menu

  def initialise 
    @menu = [ 
            { dish_number: 1, dish_name: 'avocado_maki', price: 4 }, 
            { dish_number: 2, dish_name: 'miso_tofu', price: 5 },
            { dish_number: 3, dish_name: 'seaweed_salad', price: 4 },
            { dish_number: 4, dish_name: 'vegetable_gyoza', price: 4 }, 
            { dish_number: 5, dish_name: 'pickles', price: 2 },
            { dish_number: 6, dish_name: 'udon', price: 6 },
            { dish_number: 7, dish_name: 'yakitori_mushrooms', price: 5 }
    ]
  end         

  def show_menu 
    @menu = menu
    items = menu.select { |dish_name, price| price > 0 }
    p items
  end  
end