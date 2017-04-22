require_relative 'menu'
#understands printing menu
class MenuPrinter
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    @menu.the_menu.each do |key,value|
   puts "#{key} for #{value}"
  end
  nil
end

end
