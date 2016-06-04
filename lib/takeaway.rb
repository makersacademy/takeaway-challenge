require_relative 'menu'

# Controller class
class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def menu
    @menu.menu.each { |x| p "#{x[:name]}, £#{sprintf('%.2f', x[:price])}" }
  end

  def place_order

  end

end
