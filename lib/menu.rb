require './lib/dish'

class Menu

  attr_accessor :name, :dishes, :categories

  def initialize(name)
    @name = name
    @dishes = []
  end

  def add(dish)
    dishes << dish
  end

  def remove(dish)
    dishes.delete(dish)
  end

  def display

    display_header
    build_categories
    counter = 1

    categories.each do |category|      
      puts puts "#{category}s".center(60)
      dishes.each {|dish| dish.info[:category] == category ? (puts "#{counter}.#{dish.info[:name]}".ljust(10).center(30)+"price: #{dish.info[:price]}".rjust(10).center(30); counter += 1) : nil}
      puts
    end
  
  end 

  def display_header
    puts "#{name} Menu".center(60)
    puts "-------------".center(60)
  end

  def build_categories
    #I make the assumption that categories are: Dessert, Main, Start (desserts are displayed last)
    @categories = @dishes.map{|dish| dish.info[:category]}.uniq.sort.reverse
  end



end
