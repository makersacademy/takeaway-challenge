require_relative 'menu'

# Controller class
class Takeaway

  def initialize(menu = Menu.new) #, order = Order.new)
    @menu = menu
  end

  def menu
    @menu.data.each { |key, value| "#{key}, £#{sprintf('%.2f', value)}" }
  end




  def basket
    #lists order (1x Pilau Rice £2.40, 2x Egg Fried Rice £2.30)
    #shows total as calculated
  end


end
