require 'CSV'

class Restaurant

  attr_reader :list, :menu

  def initialize
    @list = [:nandos]
    print_list
  end

  private

  def print_list
    puts "The staff picks today are:"
    list.each { |restaurant| puts restaurant.to_s.capitalize}
    user_pick
  end

  def user_pick
    puts "What do you feel like eating today?"
    option = gets.chomp.capitalize
    load_menu(option)
  end

  def load_menu(option)
    case option
    when "Nandos"
      @menu = CSV.foreach("./lib/Nandos.csv").map { |option| ({option[0] => option[1]}) }
      print_menu
    end
  end

  def print_menu
    puts "Here are today's specials:"
    menu.each_with_index { |option, index| puts ("#{option.keys[0]}, #{option.values[0]}").center(100)}
  end

end
