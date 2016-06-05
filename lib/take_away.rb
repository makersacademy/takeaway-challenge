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
    @order = gets.chomp.split(',')
    @order.collect! { |x| x.strip  }
    p @order
  end




end
