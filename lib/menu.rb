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
    @list.each do |dish|
      puts "#{dish[:name]} - #{dish[:description]} (£#{dish[:price]})"
    end
  end

end
