class Menu

  attr_reader :menu_list
  attr_reader :basket

  def initialize
  @menu_list = [
    {:dish => "kebab" , :price => 5 },
    {:dish => "curry" , :price => 6 },
    {:dish => "pizza" , :price => 4 },
    {:dish => "sushi" , :price => 8 },
    {:dish => "burrito" , :price => 6 }
  ]
  @basket = []
  end




end
