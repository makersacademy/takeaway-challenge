require_relative 'menu'

class Selection
  attr_reader :menu, :dishes, :quantity

  def initialize(order_menu)
    @menu = order_menu.list
    @dishes = menu.keys.map(&:to_s)
    @quantity = []
  end

  def select
    puts "Please enter quantity for the items below:"
    dishes.each do |dish|
      puts "#{dish}:"
      @quantity << gets.chomp.to_i
    end
  end

end
