require_relative 'dish'

class Menu
  attr_reader :list

  def initialize
    @list = []
  end

  def add(dish)
    @list << dish
  end

  def pretty_print
    @list.each_with_index do |dish, index|
      puts "#{index + 1}) #{dish.name} - £#{dish.price}"
    end
  end

end
