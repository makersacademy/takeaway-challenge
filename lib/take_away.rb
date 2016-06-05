require_relative 'menu'

#Knows about the menu and gets orders

class TakeAway

  def initialize(menu = Menu.build_default_menu)
    @menu = menu
    @order = nil
  end

  def show_menu
    @menu.print_menu
  end

  def take_order
    puts "Please type your desired order."
    puts " type the number of dishes followed by the name"
    puts " separate the orders with a comma, if you wish to order more than one kind of dish"
    puts " ex: 2 Pizza, 3 Pasta, 1 Wrap"
    @order = gets.chomp.split(',')
    @order.collect! { |x| x.strip  }
    parsed_order = []
    @order.each { |dish| parsed_order << (order = dish.split(' '))}
    p @order = parsed_order
  end

  def order_price
    @menu.price_total(@order)
  end




end
