class TakeAway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def start_order
    view_menu
  end

  def view_menu
    puts "Feast your eyes on our tasty rare delicacy menu :)"
    puts @menu

end
