require 'CSV'

class Restaurant

  attr_reader :list, :menu

  def initialize
    @list = [:nandos]
    @menu = {}
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
    option = $stdin.gets.chomp.capitalize
    load_menu(option)
  end

  def load_menu(option)
    case option
    when "Nandos"
      CSV.foreach("./lib/Nandos.csv", converters: :numeric) { |option| menu[option[0]] = option[1] }
      print_menu
    end
  end

  def print_menu
    puts "Here are today's specials:"
    menu.each { |key, value| puts ("#{key}, #{value}").center(100)}
  end

end
