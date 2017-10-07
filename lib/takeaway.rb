class Takeaway

  attr_accessor :menu

  def initialize
    @menu = [["Doner", 5], ["Burger", 10], ["Pizza", 20]]
    show_menu(menu)
  end

  def show_menu(menu) ##add to intialize?
    menu.each do |inner|
      puts inner.join(" ")
    end

  end

  def order_food(order)

  end

end
