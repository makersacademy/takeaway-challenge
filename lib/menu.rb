class Menu

attr_reader :menu

  def initialize
    @menu = { pizza: 8, burger: 5, kebab: 5, chips: 1, drink: 1}
  end

  def view_menu
    @menu.each { |option, price| puts "#{option}  £#{price}\n" }
  end

end
