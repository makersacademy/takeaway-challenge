require_relative "menu"
class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def see_menu
      Menu.new.print_menu
  end

  def new_order
    puts "Enter the item you would like: "
    # item = gets.chomp.upcase
    # price = Menu.new.tapas.fetch(item)
    # @order << {item => price}
  end
end
