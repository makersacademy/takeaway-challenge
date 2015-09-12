class Menu
  # attr_reader :menu
  # def initialize
  #   @menu = Hash.new
  # end
  #
  # def add_item(dish, price)
  #   menu[dish] = price
  # end

  attr_reader :menu
  def initialize
    @menu = [{dish: 'BBQ',       price: 10},
             {dish: 'Hamburger', price: 8},
             {dish: 'Pizza',     price: 9},
             {dish: 'Pasta',     price: 7},
             {dish: 'Sushi',     price: 6}]
  end

  def show
    @menu.map.with_index do |item, index|
      puts "#{index + 1}. #{item[:dish]}: £#{item[:price]}"
    end
  end
end
