require_relative './dishes.rb'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def generate_list
    @list << Dish.new("Spanish Paella", 8)
    @list << Dish.new("Argentinian Asado", 12)
    # @list << Dish.new("Canadian Poutine", 8)
    # @list << Dish.new("Chinese Xiaolongbao", 8)
    # @list << Dish.new("English Roast Beef & Yorkshire Pudding", 10)
    # @list << Dish.new("Indian Tandoori Chicken", 10)
    # @list << Dish.new("Italian Pizza", 8)
    # @list << Dish.new("Japanese Katsudon", 10)
    # @list << Dish.new("Portuguese Francesinha", 8)
    @list << Dish.new("American Hamburger", 8)
  end

  def compose_message(list)
    message = "These are the dishes in our menu:\n"
    list.each do |dish|
      message << "We have #{dish.name} for #{dish.price}£\n"
    end
    message << "We hope you like it"
  end

  def display
    list = generate_list
    puts compose_message(list)
  end

end
