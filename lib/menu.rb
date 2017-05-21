require_relative 'dish'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def create_dish(name, description, price)
    @list << Dish.new(name, description, price).info
  end

  def list_dishes
    raise 'Menu is empty' if @list.empty?
    list_of_dishes = []
    @list.each do |dish|
      list_of_dishes << "#{dish[:name]} - #{dish[:description]} (£#{dish[:price]})"
    end
    list_of_dishes
  end

end
