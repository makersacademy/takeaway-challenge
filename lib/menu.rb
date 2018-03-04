require_relative './dishes.rb'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def generate_menu
    @list << Dish.new("1 Argentinian Asado", 12)
    @list << Dish.new("2 Canadian Poutine", 8)
    @list << Dish.new("3 Chinese Xiaolongbao", 8)
    @list << Dish.new("4 English Roast Beef & Yorkshire Pudding", 10)
    @list << Dish.new("5 Indian Tandoori Chicken", 10)
    @list << Dish.new("6 Japanese Katsudon", 10)
    @list << Dish.new("7 Spanish Paella", 8)
  end

  def compose_menu(list)
    message = "WELCOME TO THE INTERNATIONAL RESTAURANT\nMENU:\n"
    list.each do |dish|
      message << "#{dish.name} for #{dish.price}£\n"
    end
    message << "We hope you like it"
  end

  def display
    list = generate_menu
    puts compose_menu(list)
  end

end
