class Menu
  attr_reader :current_menu

  def initialize
    @current_menu = { "soup bowl" => 12,
       "detox salad" => 15,
       "tokyo bowl" => 12 }
  end

  def print_menu
    @current_menu.each { |k, v| puts "#{k}: #{v}" }
  end
end
