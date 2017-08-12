class Menu
  attr_reader :menu

  def initialize
    @current_menu = { item1: "soup bowl", price1: 12,
       item2: "detox salad", price2: 15,
       item3: "tokyo bowl", price3: 12 }
  end

  def print_menu
    @current_menu.each { |k, v| puts "#{k}: #{v}" }
  end
end
