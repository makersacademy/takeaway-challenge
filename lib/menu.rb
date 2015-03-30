class Menu
  def initialize
    @dishes = {}
  end

  def add(name, price)
    @dishes[name] = price
  end

  def show
    @dishes.each { |name, price| print "#{name} - #{price}" }
  end
end

menu = Menu.new
menu.add("Chicken", 7.8)
menu.add("Corn", 8.4)
menu.show