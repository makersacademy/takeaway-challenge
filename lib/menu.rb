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
    @menu = [{bbq: 10},
            {hamburger: 8},
            {pizza: 9},
            {pasta: 8},
            {sushi: 10}]
  end

  def show
    @menu.map.with_index do |item, index|
      item.map do |dish, price|
        puts "#{index + 1}. #{dish}: £#{price}"
      end
    end
  end
end
