require_relative 'menu'
require_relative 'order'

class Order

attr_reader :myorder

  def initialize
        @myorder = {}
        @menu = Menu.new
  end

  def place_order(dish, quantity)
     raise "Sorry, that is not a dish on the menu" if !@menu.dishes.has_key?("#{dish}")
     myorder.store("#{dish}",quantity)
     puts "#{quantity} x #{dish} has been added to your order"
  end

    def total_bill
      total = []
      myorder.each{|item, quantity| total <<(@menu.dishes[item]*quantity)}
      (total.inject(:+))
    end

    def confirm_total(total)
      raise "Sorry that does not match the total" if total_bill != total
      "Your order is £#{total}"
    end

end
