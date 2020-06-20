require_relative 'menu'

class Order
  attr_reader :basket

  def initialize
    @basket= []
    @menu = Menu.new
  end

  def add_to_basket(dish)
    @basket << @menu.dishes[dish]
  end

  def make_selection

    selection = nil

    while selection != "exit\n" do
      puts
      @menu.display
      puts
      puts "Please enter the number of the dish to add."
      puts "Or type exit to escape: "
      selection = gets
      add_to_basket(selection.to_i - 1)
    end

  end

  def show_price
  end

end