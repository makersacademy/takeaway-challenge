require './lib/takeaway.rb'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = [
      {name: "Pizza", price: 10},
      {name: "Parmo", price: 9},
      {name: "Calzone", price: 11}
    ]  
  end

  def dish(chosen_dish)
    @dishes.find {|item_by_name| item_by_name[:name] == chosen_dish}
  end

  def formatted_menu
     @dishes.each { |item| puts "#{item[:name]}, £#{item[:price]}"}
  end

end
