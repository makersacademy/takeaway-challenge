class Menu
  
  def initialize
    @menu = [{dish: 'BBQ',       price: 10},
             {dish: 'Hamburger', price: 8},
             {dish: 'Pizza',     price: 9},
             {dish: 'Pasta',     price: 7},
             {dish: 'Sushi',     price: 6}]
  end

  def show
    @menu
  end
end
