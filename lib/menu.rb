class Menu
  attr_reader :current_menu

  def initialize
    @current_menu = { soup_bowl: 12,
       detox_salad: 15,
       tokyo_bowl: 12 }
  end

  def print_menu
    @current_menu.each { |k, v| puts "#{k}: #{v}" }
  end
end
