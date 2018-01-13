require_relative 'menu'

class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @total = 0
  end

  def menu
    @menu.list
  end

  def select(*meal)
    @selection = meal
  end

  def total
    @selection.each { |meal| @total += menu[meal] }
    puts "you ordered:\n#{@selection.join(",\n")}\nTotalling: £#{@total}"
    @total
  end

  def confirm(answer)
    raise "Order cancelled, please select items" if answer != true
   #else twillio text this message: "Thank you! Your order was placed and will be delivered before 18:52"
    @selection = nil
  end

end
