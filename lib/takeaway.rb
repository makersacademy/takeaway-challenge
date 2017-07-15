require_relative 'menu'

class Takeaway

  attr_reader :menu
  def initialize
    @menu = Menu.new
  end

  def read_menu
    puts "Today's menu:"
    menu.display_menu.each_pair { |key, value| puts "#{key.capitalize}: £#{value}" }
  end
end

takeaway = Takeaway.new
output = takeaway.read_menu
p output
