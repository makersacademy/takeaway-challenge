class Menu

  attr_reader :menu, :order, :order_total

  def initialize
    @menu = { "hamburger" => 2,
               "pizza" => 5 }
    @order = []
    @order_total = []
  end

  def check_menu
    menu
  end

  def select_dishes(*selection)
    selection.each do |i|
      if menu.has_key?(i)
        puts "#{i}".capitalize + " has been added to your order"
        order << i
        order_total << menu[i]
      else
       puts "#{i}".capitalize + " is not on our menu"
     end
  end
end

  def check_total
    return order_total.inject(:+)
  end


end