require_relative 'menu'

class Order

  attr_reader :total, :selected_items, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @total = 0
    @selected_items = []
  end

  def see_menu
    @menu.print
  end

  def select(dish)
    @selected_items << dish
    #@total = @total + @menu[dish]
  end

  def view
    puts @selected_items
  end

  def place(phone)
    puts "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
