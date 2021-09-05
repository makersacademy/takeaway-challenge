class Dishes

  attr_reader :show_menu

  def initialize(show_menu)
    @show_menu = show_menu
  end

  def print_dishes
    show_menu.map do |name, price|
      '%s £%.2f' % [name.to_s, price]
    end.join ', ' 
  end
end
