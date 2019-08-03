require_relative '../lib/menu'

class Customer

  BASKET = []

  attr_reader :basket

  def initialize
    @basket = BASKET
  end



  def list_menu
    menu = Menu.new
    return menu.view

  end

  def order
    inital_order = true
    item = nil
    until item == "complete"
      if inital_order == true
        puts "What would you like to order ?"
        item = gets.chomp
        @basket << item
        inital_order = false
      else
        puts "Would you like to add anything else to your order ? "
        item = gets.chomp
        @basket << item
      end
    end
  end

  def show_basket
    @basket.delete("complete")
    @basket.each { |x| puts x}
  end

end

jamal = Customer.new
jamal.order
jamal.show_basket