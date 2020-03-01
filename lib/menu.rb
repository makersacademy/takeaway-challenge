require_relative "order"

class Menu


  attr_reader :menu

  def initialize
    @menu = [
      { :name => "Pizza", :price => 15 },
      { :name => "Burger", :price => 12 },
      { :name => "Salad", :price => 10 }
    ]
  end

  def print_menu
    @menu.each do |dish|
      puts "#{dish[:name]}: £#{dish[:price]}"
    end
  end

end
