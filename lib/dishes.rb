require_relative 'menu.rb'

class Dishes
  attr_reader :current_selection

  def initialize
    @menu = Menu.new
    @current_selection = []
  end

  def add(name, quantity)
    @menu.selection.each do |dish|
      if dish[:name] == name
        @current_selection << { name: dish[:name], price: dish[:price], quantity: quantity }
      end
    end
  end

end
