require_relative 'menu'
require_relative 'confirmation'

class Order

  def initialize(menu = Menu.new, confirmation = Confirmation.new)
    @menu = menu
    @total = 0
    @confirmation = confirmation
  end

  def menu
    @menu.list
  end

  def select(*meal)
    @selection = meal
  end

  def total
    @selection.each { |meal| @total += menu[meal] }
    puts "you ordered:\n#{@selection.join("\n")}\nTotalling: £#{@total}"
    @total
  end

  def confirm(answer)
    raise "Order cancelled, please select items" if answer != true
    @confirmation.send
    @selection = nil
    "Confirmation message sent."
  end

end
