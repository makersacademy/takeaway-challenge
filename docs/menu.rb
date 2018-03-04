require_relative './dishes.rb'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def generate_menu
    @list << Dish.new("1 Argentinian Asado", 12)
    # @list << Dish.new("2 Canadian Poutine", 8)
    # @list << Dish.new("3 Chinese Xiaolongbao", 8)
    # @list << Dish.new("4 English Roast Beef & Yorkshire Pudding", 10)
    # @list << Dish.new("5 Indian Tandoori Chicken", 10)
    # @list << Dish.new("6 Italian Pizza", 8)
    # @list << Dish.new("7 Japanese Katsudon", 10)
    # @list << Dish.new("8 Portuguese Francesinha", 8)
    @list << Dish.new("9 Spanish Paella", 8)
  end

  def compose_menu(list)
    message = "These are the dishes in our menu:\n"
    list.each do |dish|
      message << "We have #{dish.name} for #{dish.price}£\n"
    end
    message << "We hope you like it"
  end

  def display
    list = generate_menu
    puts compose_menu(list)
  end

end
menu = Menu.new
menu.display
